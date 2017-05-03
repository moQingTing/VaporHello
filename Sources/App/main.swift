import Vapor

let drop = Droplet()

//drop.get { req in
//    return try drop.view.make("welcome", [
//    	"message": drop.localization[req.lang, "welcome", "title"]
//    ])
//}

//路由HTTP Requests
//drop.get("/name",":name") { req in
//    if let name = req.parameters["name"]?.string{
//        return "Hello \(name)!"
//    }
//    
//    return "Error retrieving parameters."
//}

drop.get("/view"){req in
    return try drop.view.make("VaporDocumentation.html")
}


//drop.resource("posts", PostController())

drop.run()
