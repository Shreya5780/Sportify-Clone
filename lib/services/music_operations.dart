import 'package:sportify/models/music.dart';
class MusicOperations{
  MusicOperations._(){}
  static List<Music> getMusic(){
    return <Music>[
      Music(
          'I used to know ',
          'Gotye',
          'https://www.tubefilter.com/wp-content/uploads/2015/06/sense8-cast.jpg',
          'cool',
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/f9/9c/55/f99c553e-7be1-91dc-b55e-3da1aad29bba/mzaf_5038171343466446420.plus.aac.p.m4a'

      ),

      Music('Midnight Rain',
          'Taylor Swift',
          'https://imgs.capitalfm.com/images/335133?crop=16_9&width=660&relax=1&format=webp&signature=LFwJVE0NYUF6EKvEVqrdMUyY3ZQ=',
          'amazing song',
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview112/v4/c3/f1/ec/c3f1ecd6-4e37-659d-24d3-32c4a009ef05/mzaf_16624501708600479730.plus.aac.p.m4a',
      ),
      Music('Lavender',
          'Azooz',
          'https://t2.genius.com/unsafe/504x504/https%3A%2F%2Fimages.genius.com%2F838754a722b6f3c2a896731e60de86a5.1000x1000x1.png',
          'an amazing song \n based out of sense8',
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview122/v4/9b/4b/48/9b4b48d4-191a-8c83-3e25-e142882c4d4b/mzaf_17305001220267548317.plus.aac.p.m4a',

      ),
      Music('Sometimes',
          'Gerry Cinnamon',
          'https://i2-prod.walesonline.co.uk/incoming/article17335344.ece/ALTERNATES/s810/2_JS94483035.jpg',
          'an amazing song \n /based out of sense8',
          'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview115/v4/7c/59/f6/7c59f6ea-e91f-3d41-451d-5c0ac99e9ce0/mzaf_16776814410963062900.plus.aac.p.m4a'
      ),





    ];
  }
}
