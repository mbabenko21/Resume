define([],
() ->
    skills = [
      {
        name: "me",
        src: "look-me",
        link: "about-me",
        page_title: "Обо мне",
        thumbnail: "/images/man.png",
        background: "",
        w: 128,
        h: 128,
        quality: [
          {title: "Усидчивость"},
          {title: "Трудолюбие"},
          {title: "Обучаемость"},
          {title: "Коммуникабельность"}
        ]
      },
      {
        name: "php",
        src: "look-php",
        link: "php",
        page_title: "Мои PHP-навыки",
        thumbnail: "/images/php.png",
        background: "",
        w: 128,
        h: 100,
        quality: [
          {title: "Symfony 2"},
          {title: "Doctrine"},
          {title: "Composer"},
          {title: "ООП"},
          {title: "Smarty"},
          {title: "MVC"}
        ]
      },
      {
        name: "node",
        src: "look-node",
        link: "node.js",
        page_title: "Изучение Node.JS",
        thumbnail: "/images/node.png",
        background: "",
        w: 128, h: 128,
        quality: [
          {title: "ExpressJS"},
          {title: "Socket.IO"},
          {title: "Mongoose"},
          {title: "Jade"}
        ]
      }
      {
        name: "database",
        src: "look-database",
        link: "database",
        page_title: "Знания баз данных",
        thumbnail: "/images/database.png",
        background: "",
        w: 128, h: 128,
        quality: [
          {title: "Mysql"},
          {title: "MongoDB"}
        ]
      },
      {
        name: "javascript",
        src: "look-js",
        link: "javascript",
        page_title: "Javascript. Светлое будующее",
        thumbnail: "/images/javascript.png",
        background: "",
        w: 128, h: 128,
        quality: [
          {title: "JQuery"},
          {title: "BackboneJS"},
          {title: "RequireJS"},
          {title: "CoffeeScript"}
        ]
      },
      {
        name: "linux",
        src: "look-linux",
        link: "unix",
        page_title: "Использование Linux",
        thumbnail: "/images/ubuntu.png",
        background: "",
        w: 128, h: 128,
        quality: [
          {title: "unix-console"}
        ]
      },
      {
        name: "git",
        src: "look-git",
        link: "git",
        page_title: "Использование системы контролля версий",
        thumbnail: "/images/git.png",
        background: "",
        w: 128, h: 128,
        quality: [
          {title: "Github"},
          {title: "Bitbucket"}
        ]
      }
        #{name: "html", src: "html",  thumbnail: "/images/page_html.png", w: 128, h:128},
        #{name: "css", src: "css",  thumbnail: "/images/page_css.png", w: 128, h: 128}
    ]
    _.templateSettings = {
      interpolate: /\{\{(.+?)\}\}/g
    }
    return skills
)


