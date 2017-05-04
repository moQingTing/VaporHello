import Vapor
import VaporMySQL

let drop = Droplet()

//数据库
let mysqlPro = try VaporMySQL.Provider(host: "localhost", user: "root", password: "123456", database: "mysqlDemo")

drop.addProvider(mysqlPro)

drop.get { req in
    return try drop.view.make("welcome", [
    	"message": drop.localization[req.lang, "welcome", "title"]
    ])
}




//路由HTTP Requests
drop.get("/name",":name") { req in
    if let name = req.parameters["name"]?.string{
        
        let result = try mysqlPro.driver.mysql("select * from where username='" + name.string! + "';")
        let userinfo = result[0]
        return try JSON(node: userinfo)
    }else{
        return try JSON(node: ["error" : "error: user name is nil"])
    }
}



drop.get("/view"){req in
    return try drop.view.make("VaporDocumentation.html")
}


//drop.resource("posts", PostController())

drop.run()
