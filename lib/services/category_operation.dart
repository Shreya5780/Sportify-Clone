import 'package:sportify/models/category.dart';

class CategoryOperations{
  CategoryOperations._(){}//._ makes the constructor private.
  static List<Category>getCategories(){//baar baar memory allocate karne ki zarorat nahi hai hence static(no need for object)
    return <Category>[
      Category('Shawn M. hits', 'https://play-lh.googleusercontent.com/KrAa0aQ31xqqh7zFIXO1LGiiAt6ty5dpeSjEJLfqLyrbxOKwsSzYFMVd8o0V2uwiB8Q=s256-rw', 'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/f9/9c/55/f99c553e-7be1-91dc-b55e-3da1aad29bba/mzaf_5038171343466446420.plus.aac.p.m4a'),
      Category('Top Songs', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwumAPMBpOaLLjxS6L2ZJAdFLP9Fsm4kHZCA&usqp=CAU', 'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/f9/9c/55/f99c553e-7be1-91dc-b55e-3da1aad29bba/mzaf_5038171343466446420.plus.aac.p.m4a'),
      Category('Top Songs', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwumAPMBpOaLLjxS6L2ZJAdFLP9Fsm4kHZCA&usqp=CAU', 'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/f9/9c/55/f99c553e-7be1-91dc-b55e-3da1aad29bba/mzaf_5038171343466446420.plus.aac.p.m4a'),
      Category('Shawn M. hits', 'https://play-lh.googleusercontent.com/KrAa0aQ31xqqh7zFIXO1LGiiAt6ty5dpeSjEJLfqLyrbxOKwsSzYFMVd8o0V2uwiB8Q=s256-rw', 'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/f9/9c/55/f99c553e-7be1-91dc-b55e-3da1aad29bba/mzaf_5038171343466446420.plus.aac.p.m4a'),
      Category('Shawn M. hits', 'https://play-lh.googleusercontent.com/KrAa0aQ31xqqh7zFIXO1LGiiAt6ty5dpeSjEJLfqLyrbxOKwsSzYFMVd8o0V2uwiB8Q=s256-rw', 'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/f9/9c/55/f99c553e-7be1-91dc-b55e-3da1aad29bba/mzaf_5038171343466446420.plus.aac.p.m4a'),
      Category('Top Songs', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwumAPMBpOaLLjxS6L2ZJAdFLP9Fsm4kHZCA&usqp=CAU', 'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/f9/9c/55/f99c553e-7be1-91dc-b55e-3da1aad29bba/mzaf_5038171343466446420.plus.aac.p.m4a'),


    ];//returns list
  }
}
