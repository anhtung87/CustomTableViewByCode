//
//  ViewController.swift
//  CustomCellTableView
//
//  Created by Hoang Tung on 12/31/19.
//  Copyright © 2019 Hoang Tung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var languages: [ProgrammingLanguage]?
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let idCell1: String = "Cell1"
    let idCell2: String = "Cell2"

    override func viewDidLoad() {
        super.viewDidLoad()

        setupLayout()
        setData()
        configTable()
    }

    func configTable() {
        tableView.delegate = self
        tableView.dataSource = self
        
        // đăng ký cell
        // đăng ký cell có giao diện (file xib)
        tableView.register(UINib(nibName: "CustomCell1", bundle: nil), forCellReuseIdentifier: idCell1)
        // đăng ký cell không có giao diện
        tableView.register(CustomCell2.self, forCellReuseIdentifier: idCell2)
//        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
    }
    
    func setupLayout() {
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    func setData() {
        languages = [
            ProgrammingLanguage(name: "Python", imageName: "python", detail: "Python is an interpreted, high-level, general-purpose programming language. Created by Guido van Rossum and first released in 1991, Python's design philosophy emphasizes code readability with its notable use of significant whitespace. Its language constructs and object-oriented approach aim to help programmers write clear, logical code for small and large-scale projects."),
            ProgrammingLanguage(name: "Java", imageName: "java", detail: "Java is a general-purpose programming language that is class-based, object-oriented, and designed to have as few implementation dependencies as possible. It is intended to let application developers write once, run anywhere (WORA), meaning that compiled Java code can run on all platforms that support Java without the need for recompilation. Java applications are typically compiled to bytecode that can run on any Java virtual machine (JVM) regardless of the underlying computer architecture. The syntax of Java is similar to C and C++, but it has fewer low-level facilities than either of them. As of 2019, Java was one of the most popular programming languages in use according to GitHub, particularly for client-server web applications, with a reported 9 million developers."),
            ProgrammingLanguage(name: "Javascript", imageName: "javascript", detail: "JavaScript (/ˈdʒɑːvəˌskrɪpt/), often abbreviated as JS, is a high-level, just-in-time compiled, object-oriented programming language that conforms to the ECMAScript specification. JavaScript has curly-bracket syntax, dynamic typing, prototype-based object-orientation, and first-class functions."),
            ProgrammingLanguage(name: "Swift", imageName: "swift", detail: "Swift is a general-purpose, multi-paradigm, compiled programming language developed by Apple Inc. for iOS, iPadOS, macOS, watchOS, tvOS, Linux, and z/OS. Swift is designed to work with Apple's Cocoa and Cocoa Touch frameworks and the large body of existing Objective-C code written for Apple products. It is built with the open source LLVM compiler framework and has been included in Xcode since version 6, released in 2014. On Apple platforms, it uses the Objective-C runtime library which allows C, Objective-C, C++ and Swift code to run within one program."),
            ProgrammingLanguage(name: "Rust", imageName: "rust", detail:
                """
Rust is a multi-paradigm system programming language focused on safety, especially safe concurrency. Rust is syntactically similar to C++, but is designed to provide better memory safety while maintaining high performance.
Rust was originally designed by Graydon Hoare at Mozilla Research, with contributions from Dave Herman, Brendan Eich, and others. The designers refined the language while writing the Servo layout or browser engine, and the Rust compiler. The compiler is free and open-source software dual-licensed under the MIT License and Apache License 2.0.
Rust has been the "most loved programming language" in the Stack Overflow Developer Survey every year since 2016.
"""),
            ProgrammingLanguage(name: "Elixir", imageName: "elixir", detail: "Elixir is a functional, concurrent, general-purpose programming language that runs on the Erlang virtual machine (BEAM). Elixir builds on top of Erlang and shares the same abstractions for building distributed, fault-tolerant applications. Elixir also provides productive tooling and an extensible design. The latter is supported by compile-time metaprogramming with macros and polymorphism via protocols."),
        ]
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.section == 0 {
//            return 80
//        } else {
//            return 100
//        }
        return UITableView.automaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return languages!.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: idCell1, for: indexPath) as! CustomCell1
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: idCell2, for: indexPath) as! CustomCell2
            cell.nameLabel.text = languages![indexPath.row].name
            cell.languageImageView.image = UIImage(named: languages![indexPath.row].imageName)
            cell.detailLabel.text = languages![indexPath.row].detail
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Tiểu sử"
        } else {
            return "Programming Languages"
        }
    }
}
