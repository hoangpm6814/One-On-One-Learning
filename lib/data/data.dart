import 'package:flutter/material.dart';
import 'package:lettutor/models/filter_chip.data.dart';
import 'package:lettutor/models/rating.dart';
import 'package:lettutor/models/schedule.dart';
import 'package:lettutor/models/tutor.dart';

final DUMMY_TUTORS = [
  // Tutor(
  //   id: "1",
  //   userId: "1",
  //   name: "Ashley Young",
  //   rating: 4.5,
  //   avatar:
  //       "https://api.app.lettutor.com/avatar/c21e521c-829e-4c99-958d-726450b5fbd8avatar1637483330267.jpg",
  //   bio:
  //       "While I've always longed to be an ESL teacher, the delight I had from assisting students' growth and development definitely encouraged my desire. I feel that my enthusiasm, good approach, and hands-on experience working with youngsters will make me a fantastic educator. I'm looking forward to a career that allows me to mold young minds and make a difference in the lives of the children in my community.",
  //   country: "Canada",
  //   languages: "English,French,Vietnamese",
  //   education: "PhD. from University of Toronto",
  //   experience:
  //       "I have experience in online teaching, I teach student's in different levels from kids to adult.",
  //   interests:
  //       "I am music enthusiast, my hobbies are playing guitar, singing and dancing.",
  //   profession:
  //       "I'm an Assistant Instructor in ACLC College. I teach senior high school student and I handle English.",
  //   specialties: "Conversational,IELTS",
  //   video:
  //       "https://assets.mixkit.co/videos/preview/mixkit-group-of-friends-partying-happily-4640-large.mp4",
  //   targetStudent: "Intermediate",
  //   price: 50000,
  // ),
  Tutor(
    id: "2",
    userId: "2",
    name: "Kathy Huynh",
    rating: 5,
    avatar:
        "https://api.app.lettutor.com/avatar/7a1067cc-4a79-494d-820c-34e63cf60748avatar1636901693895.jpg",
    bio:
        "Hello thank you for visiting my profile I am Silkyza, 26 years old from VietNam. I am a Licensed Professional Teacher with TEFL certificate. I am teaching English, Tagalog and Cebuano. I am can teach students in different levels from A0- B1. I can also handle students in all ages from kids to adults. I already have experience in online teaching.",
    country: "Viet Nam",
    languages: "English,Vietnamese",
    education: "Bachelor from University of Technology",
    experience: "5 years of English teaching experience",
    interests: "Finance, gardening, travelling",
    profession:
        "Teaching Assistant at ILA VietNam, English Teacher at Pathway School",
    specialties: "Conversational",
    video:
        "https://assets.mixkit.co/videos/preview/mixkit-group-of-friends-partying-happily-4640-large.mp4",
    targetStudent: "Intermediate",
    price: 50000,
  ),
  // Tutor(
  //   id: "3",
  //   userId: "3",
  //   name: "Maria Silkyza Galvez",
  //   rating: 4,
  //   avatar:
  //       "https://api.app.lettutor.com/avatar/cdb22890-fb57-4ec7-b4b7-829716c85a17avatar1637320790420.png",
  //   bio:
  //       "A teacher for almost a decade with lengthy teaching exposure with Vietnamese students, adult professionals, non -professionals, and executives. Teaching is a skill delivered with own style and creativity focused on YOU. YES, our lessons will be based on what really matters to you, what you want to learn in a short possible time.",
  //   country: "Philippines",
  //   languages: "English,Vietnamese",
  //   education: "PhD. from University of Toronto",
  //   experience:
  //       "I have experience in online teaching, I teach student's in different levels from kids to adult.",
  //   interests:
  //       "I am music enthusiast, my hobbies are playing guitar, singing and dancing.",
  //   profession:
  //       "I'm an Assistant Instructor in ACLC College. I teach senior high school student and I handle English.",
  //   specialties: "Conversational,STARTERS",
  //   video:
  //       "https://assets.mixkit.co/videos/preview/mixkit-group-of-friends-partying-happily-4640-large.mp4",
  //   targetStudent: "Intermediate",
  //   price: 50000,
  // ),
  Tutor(
    id: "4",
    userId: "4",
    name: "April Corpuz",
    rating: 4.5,
    avatar:
        "https://api.app.lettutor.com/avatar/cd0a440b-cd19-4c55-a2a2-612707b1c12cavatar1631029793834.jpg",
    bio:
        "Hello there! I am an Industrial Engineer in the profession but chose to do online teaching because I love to meet different learners. I am an outgoing person and I have this passion for dealing with different people and seeing them progress with my help as their teacher. In fact, making friends is one of my best skills. I am very good at adapting to new environments and new situations. I am very friendly and can easily get along well with everyone. I have obtained a 120-Hour TEFL Certificate. I get a variety of teaching techniques. I know that there are fast and not so fast learners.",
    country: "Philippines",
    languages: "English,French,Vietnamese",
    education: "Bachelor from University of Technology",
    experience: "5 years of English teaching experience",
    interests: "Finance, gardening, travelling",
    profession:
        "Teaching Assistant at ILA VietNam, English Teacher at Pathway School",
    specialties: "Conversational,IELTS,STARTERS,MOVERS",
    video:
        "https://assets.mixkit.co/videos/preview/mixkit-group-of-friends-partying-happily-4640-large.mp4",
    targetStudent: "Intermediate",
    price: 50000,
  ),
  // Tutor(
  //   id: "5",
  //   userId: "5",
  //   name: "Michael Owen",
  //   rating: 5,
  //   avatar:
  //       "https://api.app.lettutor.com/avatar/9f896616-72d6-4d28-8859-de0e90f3c4adavatar1634393619087.jpg",
  //   bio:
  //       "I am an online English tutor for more than 2 years now. I love meeting new people, talking with them and sit on a meaningful conversation while learning about their different cultures at the same time. I could say that I am a people-person because I love stirring up interesting topics relatable to my students' lives. I can help you out with your conversation skills because I am creative, patient and has a great passion in teaching meaningfully. I'll slowly build your pronunciation and vocabulary.",
  //   country: "Philippines",
  //   languages: "English,French,Vietnamese",
  //   education: "PhD. from University of Toronto",
  //   experience:
  //       "I have experience in online teaching, I teach student's in different levels from kids to adult.",
  //   interests:
  //       "I am music enthusiast, my hobbies are playing guitar, singing and dancing.",
  //   profession:
  //       "I'm an Assistant Instructor in ACLC College. I teach senior high school student and I handle English.",
  //   specialties: "Conversational,IELTS",
  //   video:
  //       "https://assets.mixkit.co/videos/preview/mixkit-group-of-friends-partying-happily-4640-large.mp4",
  //   targetStudent: "Intermediate",
  //   price: 50000,
  // ),
  // Tutor(
  //   id: "6",
  //   userId: "6",
  //   name: "Johnny Nguyen",
  //   rating: 3,
  //   avatar:
  //       "https://i.pinimg.com/originals/26/ee/73/26ee73636f3429e3df522ae219c064fd.png",
  //   bio:
  //       "Hi, how are you? I am teacher Ca! I am a professional teacher and I've been teaching for 5 years and more than a year online. I handled diverse students level from kids to adults. Teaching is fun. You can teach anytime and anywhere. Pandemic is not a hindrance for continuous learning to our dear students. Everything is on the tip of our fingers and done virtually.",
  //   country: "Viet Nam",
  //   languages: "English,French,Vietnamese",
  //   education: "Bachelor from University of Technology",
  //   experience: "5 years of English teaching experience",
  //   interests: "Finance, gardening, travelling",
  //   profession:
  //       "Teaching Assistant at ILA VietNam, English Teacher at Pathway School",
  //   specialties: "Conversational,IELTS",
  //   video:
  //       "https://assets.mixkit.co/videos/preview/mixkit-group-of-friends-partying-happily-4640-large.mp4",
  //   targetStudent: "Intermediate",
  //   price: 50000,
  // ),
];

final DUMMY_SCHEDULES = [
  Schedule(
    id: "1",
    studentId: "1",
    tutorId: "2",
    date: DateTime.now(),
    shift: 1,
    requirement:
        "I want to speak English better. I want to speak English better. I want to speak English better. I want to speak English better. I want to speak English better.",
  ),
  Schedule(
    id: "2",
    studentId: "1",
    tutorId: "1",
    date: DateTime.now(),
    shift: 2,
    requirement:
        "I want to speak English best. I want to speak English better. I want to speak English better. I want to speak English better. I want to speak English better.",
  ),
  Schedule(
    id: "3",
    studentId: "1",
    tutorId: "4",
    date: DateTime.now().subtract(Duration(days: 1)),
    shift: 3,
    requirement:
        "I want to speak Spanish better. I want to speak English better. I want to speak English better. I want to speak English better. I want to speak English better.",
  ),
];

final DUMMY_RATINGS = [
  Rating(
    id: "1",
    star: 5,
    comment: "This teacher is very good!",
    studentId: "1",
    tutorId: "4",
    date: DateTime.now(),
  ),
  Rating(
    id: "2",
    star: 4,
    comment: "This teacher is nice!",
    studentId: "1",
    tutorId: "4",
    date: DateTime.now(),
  ),
  Rating(
    id: "3",
    star: 4,
    comment: "She is indeed a very good teacher, gonna be back!",
    studentId: "1",
    tutorId: "4",
    date: DateTime.now(),
  ),
  Rating(
    id: "4",
    star: 5,
    comment: "This teacher is really nice! She taught me a lot.",
    studentId: "1",
    tutorId: "2",
    date: DateTime.now(),
  ),
  Rating(
    id: "5",
    star: 5,
    comment: "She is a very good teacher, gonna be back!",
    studentId: "1",
    tutorId: "2",
    date: DateTime.now(),
  ),
];

final DUMMY_SPECIALTIES = [
  FilterChipData(
    label: 'Conversational',
    isSelected: false,
    color: Colors.green,
  ),
  FilterChipData(
    label: 'Business',
    isSelected: false,
    color: Colors.red,
  ),
  FilterChipData(
    label: 'Kids',
    isSelected: false,
    color: Colors.blue,
  ),
  FilterChipData(
    label: 'IELTS',
    isSelected: false,
    color: Colors.orange,
  ),
  FilterChipData(
    label: 'TOEIC',
    isSelected: false,
    color: Colors.purple,
  ),
  FilterChipData(label: 'STARTERS', isSelected: false, color: Colors.yellow),
  FilterChipData(label: 'MOVERS', isSelected: false, color: Colors.orange),
  FilterChipData(
    label: 'FLYERS',
    isSelected: false,
    color: Colors.red,
  ),
  // FilterChipData(
  //   label: 'English for kids',
  //   isSelected: false,
  //   color: Colors.blue,
  // ),
  // FilterChipData(
  //   label: 'English for Business',
  //   isSelected: false,
  //   color: Colors.orange,
  // ),
];
