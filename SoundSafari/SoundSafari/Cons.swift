//
//  Cons.swift
//  SoundSafari
//
//  Created by jin fu on 2024/11/22.
//
import UIKit

var animalArry: [SoundAnimalStruct] = [
    SoundAnimalStruct(animalName: "Lion", animalImg: "b1", oneLine: "The king of the jungle."),
    SoundAnimalStruct(animalName: "Tiger", animalImg: "b2", oneLine: "A powerful and majestic big cat."),
    SoundAnimalStruct(animalName: "Elephant", animalImg: "b3", oneLine: "The largest land animal."),
    SoundAnimalStruct(animalName: "Giraffe", animalImg: "b4", oneLine: "The tallest animal in the world."),
    SoundAnimalStruct(animalName: "Zebra", animalImg: "b5", oneLine: "Known for its black-and-white stripes."),
    SoundAnimalStruct(animalName: "Kangaroo", animalImg: "b6", oneLine: "An iconic marsupial from Australia."),
    SoundAnimalStruct(animalName: "Panda", animalImg: "b7", oneLine: "A gentle bear that loves bamboo."),
    SoundAnimalStruct(animalName: "Monkey", animalImg: "b8", oneLine: "Playful and intelligent primates."),
    SoundAnimalStruct(animalName: "Cheetah", animalImg: "b9", oneLine: "The fastest land animal."),
    SoundAnimalStruct(animalName: "Bear", animalImg: "b10", oneLine: "A strong and versatile mammal."),
    SoundAnimalStruct(animalName: "Wolf", animalImg: "b11", oneLine: "A skilled and social predator."),
    SoundAnimalStruct(animalName: "Fox", animalImg: "b12", oneLine: "A clever and adaptive animal."),
    SoundAnimalStruct(animalName: "Deer", animalImg: "b13", oneLine: "Graceful animals with antlers."),
    SoundAnimalStruct(animalName: "Leopard", animalImg: "b14", oneLine: "A stealthy and agile big cat."),
    SoundAnimalStruct(animalName: "Crocodile", animalImg: "b15", oneLine: "A powerful reptilian predator."),
    SoundAnimalStruct(animalName: "Hippopotamus", animalImg: "b16", oneLine: "A massive animal that loves water."),
    SoundAnimalStruct(animalName: "Rhinoceros", animalImg: "b17", oneLine: "Known for its distinctive horn."),
    SoundAnimalStruct(animalName: "Snake", animalImg: "b18", oneLine: "A slithering and diverse reptile."),
    SoundAnimalStruct(animalName: "Eagle", animalImg: "b19", oneLine: "A symbol of strength and vision."),
    SoundAnimalStruct(animalName: "Penguin", animalImg: "b20", oneLine: "A flightless bird that swims."),
    SoundAnimalStruct(animalName: "Dolphin", animalImg: "b21", oneLine: "An intelligent and friendly marine mammal."),
    SoundAnimalStruct(animalName: "Shark", animalImg: "b22", oneLine: "A fearsome predator of the sea."),
    SoundAnimalStruct(animalName: "Whale", animalImg: "b23", oneLine: "The largest mammal in the ocean."),
    SoundAnimalStruct(animalName: "Parrot", animalImg: "b24", oneLine: "A colorful bird known for mimicry."),
    SoundAnimalStruct(animalName: "Peacock", animalImg: "b25", oneLine: "Famous for its dazzling tail feathers."),
    SoundAnimalStruct(animalName: "Frog", animalImg: "b26", oneLine: "A small amphibian that loves water."),
    SoundAnimalStruct(animalName: "Rabbit", animalImg: "b27", oneLine: "A quick and fluffy animal."),
    SoundAnimalStruct(animalName: "Horse", animalImg: "b28", oneLine: "A loyal companion and fast runner."),
    SoundAnimalStruct(animalName: "Turtle", animalImg: "b29", oneLine: "A slow-moving reptile with a shell."),
    SoundAnimalStruct(animalName: "Owl", animalImg: "b30", oneLine: "A nocturnal bird with great vision.")
]

let animalQuiz: [SoundAnimalQuizStruct] = [
    SoundAnimalQuizStruct(AnimalImage: "Lion", op1: "Lion", op2: "Tiger", op3: "Elephant", op4: "Bear", correctAns: "Lion"),
    SoundAnimalQuizStruct(AnimalImage: "Tiger", op1: "Leopard", op2: "Kangaroo", op3: "Tiger", op4: "Monkey", correctAns: "Tiger"),
    SoundAnimalQuizStruct(AnimalImage: "Elephant", op1: "Deer", op2: "Elephant", op3: "Zebra", op4: "Fox", correctAns: "Elephant"),
    SoundAnimalQuizStruct(AnimalImage: "Giraffe", op1: "Giraffe", op2: "Panda", op3: "Wolf", op4: "Cheetah", correctAns: "Giraffe"),
    SoundAnimalQuizStruct(AnimalImage: "Zebra", op1: "Kangaroo", op2: "Zebra", op3: "Crocodile", op4: "Parrot", correctAns: "Zebra"),
    SoundAnimalQuizStruct(AnimalImage: "Kangaroo", op1: "Kangaroo", op2: "Panda", op3: "Fox", op4: "Bear", correctAns: "Kangaroo"),
    SoundAnimalQuizStruct(AnimalImage: "Panda", op1: "Panda", op2: "Wolf", op3: "Elephant", op4: "Cheetah", correctAns: "Panda"),
    SoundAnimalQuizStruct(AnimalImage: "Monkey", op1: "Monkey", op2: "Deer", op3: "Tiger", op4: "Lion", correctAns: "Monkey"),
    SoundAnimalQuizStruct(AnimalImage: "Cheetah", op1: "Leopard", op2: "Cheetah", op3: "Bear", op4: "Zebra", correctAns: "Cheetah"),
    SoundAnimalQuizStruct(AnimalImage: "Bear", op1: "Bear", op2: "Elephant", op3: "Wolf", op4: "Fox", correctAns: "Bear"),
    SoundAnimalQuizStruct(AnimalImage: "Wolf", op1: "Wolf", op2: "Giraffe", op3: "Crocodile", op4: "Monkey", correctAns: "Wolf"),
    SoundAnimalQuizStruct(AnimalImage: "Fox", op1: "Fox", op2: "Tiger", op3: "Deer", op4: "Lion", correctAns: "Fox"),
    SoundAnimalQuizStruct(AnimalImage: "Deer", op1: "Deer", op2: "Bear", op3: "Leopard", op4: "Kangaroo", correctAns: "Deer"),
    SoundAnimalQuizStruct(AnimalImage: "Leopard", op1: "Leopard", op2: "Cheetah", op3: "Panda", op4: "Monkey", correctAns: "Leopard"),
    SoundAnimalQuizStruct(AnimalImage: "Crocodile", op1: "Crocodile", op2: "Zebra", op3: "Elephant", op4: "Giraffe", correctAns: "Crocodile")
]

func showAlert(title: String, message: String, in viewController: UIViewController) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alert.addAction(okAction)
    viewController.present(alert, animated: true, completion: nil)
}
