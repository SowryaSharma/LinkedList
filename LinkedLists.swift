//
//  LinkedLists.swift
//  SwiftUITests
//
//  Created by admin on 12/28/23.
//

import Foundation


class LinkedLists<T:Equatable>{
    var head:Node<T>?
    
    func insert(value:T){
        let newNode = Node(value: value)
        if head == nil {
            head = newNode
        } else {
            var current = head
            while current?.next != nil {
                current = current?.next
            }
            current?.next = newNode
        }
    }
    
    func remove(value: T) {
        if head?.value == value {
            head = head?.next
        } else {
            var current = head
            var previous: Node<T>?

            while current != nil && current?.value != value {
                previous = current
                current = current?.next
            }

            previous?.next = current?.next
        }
    }
    
    func printList(){
        var current = head
        if let value = current?.value{
            print(value)
        }
        while current?.next != nil{
            current = current?.next
            if let value = current?.value{
                print(value)
            }
        }
    }
    func reverseLinkedList() {
        var current = head
        var next: Node<T>? = nil
        var previous: Node<T>? = nil

        while current != nil {
            next = current?.next
            current?.next = previous
            previous = current
            current = next
        }

        head = previous
    }
    
    func removeHead() -> T?{
        if let currentHead = self.head{
            self.head = currentHead.next
            return currentHead.value
        }
        return nil
    }
    
    func getLast() -> T?{
        var current = head
        while current?.next != nil{
            current = current?.next
        }
        return current?.value
    }
    
    func addNewHead(value: T){
        let currentHead = head
        self.head = Node(value: value)
        self.head?.next = currentHead
    }
    
    func deleteLast() -> T?{
        var current = head
        var previous: Node<T>? = nil
        while current?.next != nil{
            previous = current
            current = current?.next
        }
        previous?.next = nil
        return current?.value
    }
    
    func printMiddle() -> T?{
        var count = 0
        var dic = [Int:T]()
        var current = head
        while current != nil{
            dic[count] = current?.value
            count += 1
            current = current?.next
        }
        return dic[Int(count / 2)]
    }

}



class Node<T>{
    
    var value:T
    var next:Node?
    
    init(value: T) {
        self.value = value
    }
}
