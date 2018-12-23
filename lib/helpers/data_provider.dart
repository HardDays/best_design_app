import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'database.dart';

import '../helpers/main_api.dart';

import '../models/care_affirmation.dart';
import '../models/positive_affirmation.dart';
import '../models/calendar_item.dart';
import '../models/user.dart';
import '../models/positive_item.dart';
import '../models/bucket_idea.dart';
import '../models/bucket_item.dart';
import '../models/settings.dart';

class DataProvider {

  static List<String> monthAffirmations = [
    'I Love myself',
    'I Love, honor and appreciate my body',
    'I Accept perfect health now',
    'I Am confident',
    'I Only attract healthy relationships in my life',
    'I Am a magnet for money',
    'Abundance flows freely into my life',
    'I Move from forgiveness to love',
    'The Law of attraction brings only good into my life',
    'I Am grateful for all the love in my life',
    'I Allow positive changes to come into my life',
    'I Happily claim my on powers',
  ];

  static List<String> careTitles = [
    'January is Being Healthy Month',
    'February is Love & Relationship Month',
    'March is Spring Renewal Month',
    'April is Friendship Month',
    'May is Family Month',
    'June is Learn New Skills Month',
    'July is Book Month',
    'August is Pamper Yourself Month',
    'September is Travel of Mind/Body/Soul Month',
    'October is Satisfy Your Sweet Tooth Month',
    'November is Little Things to Make You Happy Month',
    'December is Goals (For Next Year) Month',
  ];

  static List<String> carePhrases = [
    'Because it is the greatest gift we can give to ourselves',
    'Self love is not selfish. You can’t truly love others until you know how to truly love yourself',
    'The best time for new beginnings is now\n ',
    'Because they are a great healing therapy and the family we choose',
    'At the end of the day that’s what it is all about where life begins and love never ends',
    'Because hunger for knowledge can lead to amazing discoveries',
    'Because you can say yes to new adventures',
    'Because self care is not selfish. Give yourself permission to pause',
    'Fall in love with taking care of yourself. Be unique, be beautiful, be you',
    'Life is beautiful so satisfy your sweet tooth\n ',
    'Because happiness looks beautiful on you\n ',
    'Write it down, make it happen, go after your dreams',
  ];

  static List<List<CareAffirmation>> careAffirmamtions = [
    [
  CareAffirmation(id: '1a11401a-2a65-4023-b3ea-6131b282fb0a', title: 'Go for a Walk', month: 1),
  CareAffirmation(id: '0c9d7f20-31d0-465d-b9f0-15efe7b2990f', title: 'Take a Bath', month: 1),
  CareAffirmation(id: 'a53e37f9-fd0c-44b3-b92b-b97081829b7e', title: 'Meditate', month: 1),
  CareAffirmation(id: 'd3140dbe-b389-4010-b362-cbf837feeeaf', title: 'Stretch', month: 1),
  CareAffirmation(id: '8d511ee0-75e2-4d59-a8fd-5f761db7f351', title: 'Take a Nap', month: 1),
  CareAffirmation(id: '78c721f9-4a52-43a8-aad4-713a0e4059c7', title: 'Eat Healthy Breakfast', month: 1),
  CareAffirmation(id: 'd6c46719-1954-46e0-a3e2-67c69b223b68', title: 'Drink Water', month: 1),
  CareAffirmation(id: '0f96e87a-dc3b-459e-af4e-26cc850cb9d3', title: 'Remove Toxic People', month: 1),
  CareAffirmation(id: '3f3b09d7-0a27-41e0-b414-557d6e895b08', title: 'Take a Mental Day', month: 1),
  CareAffirmation(id: 'd0d09ffc-c4ad-482d-9cd2-d4e83c8faefb', title: 'Get a Massage', month: 1),
  CareAffirmation(id: 'c60288f6-f9da-4b96-8cb3-eb10056e4928', title: 'Go to Bed Early', month: 1),
  CareAffirmation(id: '0a6049f6-1336-46a9-b7c1-608a187db3e2', title: 'Sleep in on Weekend', month: 1),
  CareAffirmation(id: '6dbb14b4-ee15-4a9a-bfd0-51b75ee640e7', title: 'Get a Mani/Pedi', month: 1),
  CareAffirmation(id: '89ca8d4a-56b8-42e4-9262-2fd538720b62', title: 'Start Journaling', month: 1),
  CareAffirmation(id: '689be37c-6287-4532-9630-a3888c199b3f', title: 'Try Acupuncture', month: 1),
  CareAffirmation(id: 'afdcf82c-a75d-4409-9cc9-ffba1e9f8526', title: 'Drink Herbal Tea', month: 1),
  CareAffirmation(id: 'c16014f1-68d0-4795-ad15-92acaf884e25', title: 'Smile More', month: 1),
  CareAffirmation(id: '35a7bfac-512e-464e-a03d-3099383b052e', title: 'Feel Happy', month: 1),
  CareAffirmation(id: '425bd9cd-be90-4196-9d31-5d409b72f00c', title: 'Be Selfish', month: 1),
  CareAffirmation(id: 'cb136016-a205-4f05-97f9-67ede6e98cce', title: 'Try Yoga', month: 1),
],
    [
     CareAffirmation(id: '3a178719-249b-4978-ac34-1705692ee484', title: 'Love Yourself', month: 2),
  CareAffirmation(id: '7416e9e6-90d9-40c3-b53b-9df55b1d3e7e', title: 'Love Your Body', month: 2),
  CareAffirmation(id: '79c8c8c9-784f-4217-b08d-3f802a5b0654', title: 'Buy a Lipstick', month: 2),
  CareAffirmation(id: '83d6b07e-6984-4294-badb-8fc9c29e4496', title: 'Buy Flowers', month: 2),
  CareAffirmation(id: '6236a486-7501-449d-81d0-8b6bf7c91eee', title: 'Compliment Yourself', month: 2),
  CareAffirmation(id: 'b0d24cdf-98be-4c96-a26c-2e6f30af0d94', title: 'Compliment Your Loved One', month: 2),
  CareAffirmation(id: '9f8653a0-673c-42d5-b2fe-04f7e7709e1b', title: 'Buy a Sexy Outfit', month: 2),
  CareAffirmation(id: '3e80545e-66e7-46de-a614-1f1f42acd972', title: 'Go on a Date', month: 2),
  CareAffirmation(id: 'eb1da799-433f-49fe-8941-ea842599b040', title: 'Watch a Romantic Movie', month: 2),
  CareAffirmation(id: 'f44aff00-9e8f-4b1e-bd95-920ef31a36f5', title: 'Eat Breakfast in Bed', month: 2),
  CareAffirmation(id: 'b0026499-972b-4f63-897f-3a689f161bf4', title: 'Try Weekend Getaway', month: 2),
  CareAffirmation(id: '70160aa3-3406-4028-a6b9-9f7a2dfbad08', title: 'Go Out To Dinner', month: 2),
  CareAffirmation(id: 'c38e421e-96a4-4d69-b6e0-79290ec33348', title: 'Send a Love Message ', month: 2),
  CareAffirmation(id: 'fca3316c-d617-41c7-b8c5-31384a569b23', title: 'Dance', month: 2),
  CareAffirmation(id: '3a53add3-74f9-4eab-905c-4d818827a24a', title: 'Renew Vows', month: 2),
  CareAffirmation(id: 'f8b67952-b191-42df-a7a2-60c2d140e280', title: 'Try Hot Air Balloon Ride', month: 2),
  CareAffirmation(id: '4b06311d-9606-428a-89c2-fb62b21dda26', title: 'Have a Photo Shoot', month: 2),
  CareAffirmation(id: '6653736b-4883-4473-9a2a-a1453b66604c', title: 'Try a Road Trip', month: 2),
  CareAffirmation(id: 'dddbb81b-615f-4878-a9fb-9a15cd552ca7', title: 'Hold Hands', month: 2),
  CareAffirmation(id: 'f45030f9-260a-4e38-accc-4ddb0be2b6ce', title: 'Exercise Together', month: 2),
  CareAffirmation(id: '18af153a-d3aa-4465-b775-5de2950609f8', title: 'Candlelight Dinner at Home', month: 2),
  CareAffirmation(id: '61d9325f-ddf3-4155-8cc1-26bfd66af763', title: 'Wine Tasting', month: 2),
  CareAffirmation(id: 'ac658093-d9be-499f-aecc-5c05d37a02e1', title: 'Buy a New Perfume', month: 2),
    ],
    [
       CareAffirmation(id: '421f5c8c-4e92-4fa0-a276-e01acc125ced', title: 'Declutter House', month: 3),
  CareAffirmation(id: 'f5bdd56a-aa3b-49c1-a6e9-2ebc74a6fa33', title: 'Spend Time Outdoors', month: 3),
  CareAffirmation(id: 'ac002fce-0486-440d-a876-6bf443cd468d', title: 'Plant a Garden', month: 3),
  CareAffirmation(id: '53b0bd00-7bcb-44b1-9241-845c22b5c1c2', title: 'Take a Trip', month: 3),
  CareAffirmation(id: '6d387896-4701-4f31-9d5e-95fd0063643e', title: 'Simplify Life', month: 3),
  CareAffirmation(id: 'df32d503-1a4b-4aef-8f60-9a2bdf62bd3d', title: 'New Hobby', month: 3),
  CareAffirmation(id: 'b643ad8b-5599-4c49-baaf-0531f426383d', title: 'Challenge Limiting Beliefs', month: 3),
  CareAffirmation(id: '14d4d854-1134-47f2-b3c8-4e30d9e36f6d', title: 'Clear Emotional Clutter', month: 3),
  CareAffirmation(id: '3da59e55-9af0-4445-8f41-e76eed1393ed', title: 'Practice Peace & Understanding', month: 3),
  CareAffirmation(id: '3df467ab-c8cd-4be0-bb02-c7437fcbd615', title: 'Try Detoxing', month: 3),
  CareAffirmation(id: '815f3589-0af1-4f6b-9d8d-000cd9539406', title: 'Get Grounded', month: 3),
  CareAffirmation(id: '80516ae8-68d6-47c8-babb-3082af72a6a4', title: 'Say no to Someone', month: 3),
  CareAffirmation(id: '9f8ad964-9310-4872-aee1-bd7af9e113d4', title: 'Set Intentions', month: 3),
  CareAffirmation(id: 'a7411c04-7e81-4606-be6e-c6df570f6304', title: 'Breath', month: 3),
  CareAffirmation(id: 'e939f719-2c11-48ab-8c4c-db465a8abf63', title: 'New Beginning', month: 3),
  CareAffirmation(id: 'c50d3cc0-5996-4c05-8d1c-8daf59d3c1f6', title: 'Stay Positive', month: 3),
  CareAffirmation(id: '6312b032-c695-49c4-9c00-585f0ef19e21', title: 'Make Time for Yourself', month: 3),
  CareAffirmation(id: '2510b0ae-b71c-4912-aadb-062de0e4f2c3', title: 'Practice Gratitude', month: 3),
  CareAffirmation(id: 'f14c3a88-07e8-490a-b389-0010a326670a', title: 'Read a Book', month: 3),
  CareAffirmation(id: '9395f5df-437e-443a-85e0-58b098b7fb75', title: 'Eat Chocolate', month: 3),
  CareAffirmation(id: '6b1e6f59-8d67-4e6b-aa91-d7d6487389a1', title: 'Get Your Hair Done', month: 3),
    ],
    [
      CareAffirmation(id: 'd8c0f917-057e-47bb-8d48-65617650a873', title: 'Go Out With Your BF', month: 4),
  CareAffirmation(id: 'b705432d-8bd7-4125-957a-5ef5c2e24a32', title: 'Write a Letter to a Friend', month: 4),
  CareAffirmation(id: '13cc1f14-fc12-415c-9a26-2416f49cc654', title: 'Lunch With Girls', month: 4),
  CareAffirmation(id: 'c5ed8d76-2f3f-4ff1-b283-35684194f8f1', title: 'Host Movie Marathon ', month: 4),
  CareAffirmation(id: '88b2acb3-786d-405d-8ced-dc18f0cff6ea', title: 'Visit a Spa', month: 4),
  CareAffirmation(id: 'b58a6394-49d9-4ec9-890c-02f9030c6a4a', title: 'Go Shopping', month: 4),
  CareAffirmation(id: '44eae27e-0dc3-4695-b5ec-e5a5824fd5ea', title: 'Plan a Dinner Party', month: 4),
  CareAffirmation(id: 'a1b6bc20-0b63-4ac6-b376-c6cfd715d231', title: 'Friendship Tribute on Social Media', month: 4),
  CareAffirmation(id: 'e4f404a7-fd2c-47e7-b845-65fbc27aa9d0', title: 'Give a Small Gift', month: 4),
  CareAffirmation(id: '49b48032-7138-4d97-81b3-0466203b4bbd', title: 'Go Dancing', month: 4),
  CareAffirmation(id: '10a0d6dd-899b-4740-ad65-53a23017e68e', title: 'Weekend Trip', month: 4),
  CareAffirmation(id: '5d5b24de-d70f-4808-8d5c-3af8cb909432', title: 'Ice Cream With BF', month: 4),
  CareAffirmation(id: '3012212a-04d2-4a54-9fd0-33dea41edeaf', title: 'Friendship Bracelets', month: 4),
  CareAffirmation(id: 'd3e0dfe1-e1c6-49e5-86fd-20dfc68e3ec7', title: 'Photo Booth Pics', month: 4),
  CareAffirmation(id: 'bb91731a-6a4f-4c26-bc38-8257b9ed29ce', title: 'Have a Sleep Over', month: 4),
  CareAffirmation(id: '097e3e11-1796-4813-95ac-8fa474ac4e63', title: 'Visit a Winery', month: 4),
  CareAffirmation(id: '6463a790-2e17-4295-86c7-e977b1ab8bd4', title: 'Recollect Memories', month: 4),
  CareAffirmation(id: 'f14c79fd-d66b-4e12-a89c-a4ebfd80bd87', title: 'Send Flowers', month: 4),
  CareAffirmation(id: '620ecacf-5586-4c7d-8862-892b646cfa8a', title: 'Call a Friend', month: 4),
  CareAffirmation(id: '0c1d8393-c0c7-4ebc-8c02-215e41e74b1f', title: 'Gift Personalize Coffee Mug', month: 4),
  CareAffirmation(id: '501e3011-a032-4666-a851-61d3b0caedd5', title: 'Eat a Sinful Dessert Together', month: 4),
    ],
    [
  CareAffirmation(id: 'b4d57d71-cf9f-46ff-bf67-d4b9dd991878', title: 'Special Family Dinner', month: 5),
  CareAffirmation(id: '882bded3-5fdf-4a33-8e79-1c2cc5124ee5', title: 'Photo Shoot', month: 5),
  CareAffirmation(id: '846f3ea0-dd6d-46c9-a293-2c4229b6185d', title: 'Story Time', month: 5),
  CareAffirmation(id: 'cf142cfb-2474-46f4-8d31-499c876e4b3f', title: 'Watch Family Videos', month: 5),
  CareAffirmation(id: '2de0f1f4-3fa2-4393-9d74-eb75ce20ce00', title: 'Go Bowling', month: 5),
  CareAffirmation(id: '7fd38970-0589-4953-bc6d-31adeb6e4a05', title: 'Have T Shirt Competition', month: 5),
  CareAffirmation(id: '5740c253-1211-417e-897d-fcd89e607627', title: 'Outdoor Movie Night', month: 5),
  CareAffirmation(id: 'f24d62e2-f012-4ac8-ad99-bc7d3e0642b1', title: 'Create a Family Tree', month: 5),
  CareAffirmation(id: '1de876f9-6379-4766-8403-af8cad33b887', title: 'Cocktail Party', month: 5),
  CareAffirmation(id: '15c5d82d-5bac-49da-8e73-3362775310be', title: 'Bake Cookies Together', month: 5),
  CareAffirmation(id: 'cc4cd612-c300-4c87-8dcd-ae926affd12b', title: 'Make a Family Movie', month: 5),
  CareAffirmation(id: '3e2178f5-cc64-4fb5-9aaf-1b3ed8957f95', title: 'Give Silly Awards', month: 5),
  CareAffirmation(id: '55305d2e-19cb-4875-8bd3-bbbae8c77f76', title: 'Do Crafts', month: 5),
  CareAffirmation(id: '95580ce7-8bcf-4245-900d-2c368402d6fd', title: 'Go to the Beach', month: 5),
  CareAffirmation(id: '6a12e8fc-3166-4d2e-baf1-9d9c8b0ba210', title: 'Play Ball', month: 5),
  CareAffirmation(id: 'd73611fd-eed4-4726-b6e0-1d25aee5b4d7', title: 'Family Trivia', month: 5),
  CareAffirmation(id: '8f5b237b-d0bf-42df-8fae-c046c8c5d81c', title: 'Visit Family Member', month: 5),
  CareAffirmation(id: 'bf4513a3-94cd-4016-8436-143b304ebedc', title: 'Go on a Picnic', month: 5),
    ],
    [
   CareAffirmation(id: '0319693f-7130-404f-82d4-3d63281b0655', title: 'Play Chess', month: 6),
  CareAffirmation(id: '19e13bc3-8485-41f2-9f1e-8903a3a50e4a', title: 'Cook', month: 6),
  CareAffirmation(id: 'b7bd9571-b8f3-41ab-8764-210cd1782488', title: 'Play Poker', month: 6),
  CareAffirmation(id: '1a4cb8a5-2091-48ca-af75-7bf2d5f938a3', title: 'Ride a Horse', month: 6),
  CareAffirmation(id: '69b1ebcd-4cf1-4a3b-b712-424dee1247fc', title: 'New Language', month: 6),
  CareAffirmation(id: 'c4504acd-83d1-4c1b-9f61-33ed18e62c62', title: 'Sew/Knit', month: 6),
  CareAffirmation(id: '62b5a61b-364c-4aa1-a32d-b63ac6837972', title: 'Play Instrument', month: 6),
  CareAffirmation(id: 'f89c0f2e-cd9d-4562-9b95-6c5406f2073a', title: 'Public Speaking', month: 6),
  CareAffirmation(id: '5b766d0f-a3e1-4782-8548-8bb5a73ca186', title: 'Meditate', month: 6),
  CareAffirmation(id: '5c323bc8-714e-466d-b30c-588327381a43', title: 'Paint/Draw', month: 6),
  CareAffirmation(id: '31ac2c5e-8c1d-45ef-91e7-2d69990c006f', title: 'Photography', month: 6),
  CareAffirmation(id: 'cdb86f1f-812f-4695-8ee3-0dd18021087d', title: 'Use Chopsticks', month: 6),
  CareAffirmation(id: 'c6517529-1a85-4bac-80e8-6f1b57e7332b', title: 'Juggle', month: 6),
  CareAffirmation(id: '76c9b16d-bb7d-49af-a86e-6c43b8eee012', title: 'Speed Read', month: 6),
  CareAffirmation(id: '766bba89-d64d-416d-a98a-13522cf5eef6', title: 'Dance', month: 6),
  CareAffirmation(id: '798537d9-3db0-4f17-acea-7b5d86435838', title: 'Practice Positive Affirmation', month: 6),
  CareAffirmation(id: '44c996f4-f728-4bca-82c0-643782909435', title: 'Home Brewing', month: 6),
  CareAffirmation(id: '1c3440fc-0d0a-4862-ad7c-af9f41c221b2', title: 'Self Defense', month: 6),
  CareAffirmation(id: '9ff6872f-1c83-46ee-bf28-463b062ea3dc', title: 'Perform CPR', month: 6),
  CareAffirmation(id: 'b9fb2038-3f2f-4577-b40f-6476b7e0bcc6', title: 'Mindful Living', month: 6),
  CareAffirmation(id: '5bc5946b-0811-4aee-930b-18ea79d4b3fb', title: 'Remove Bad Habits', month: 6),
  CareAffirmation(id: '2db7800b-ff15-4548-86bb-98d04a875556', title: 'Develop Confidence', month: 6),
  CareAffirmation(id: '3a1ae9a2-89b7-4c57-8ff9-5812368c3740', title: 'Think Positive', month: 6),
  CareAffirmation(id: '55b0df28-0550-4f98-8c18-03015cdfd1b9', title: 'Improve Memory', month: 6),
  CareAffirmation(id: '731b954a-dcae-4310-ae02-06d5102a5fa1', title: 'Create Personal Budget', month: 6),
  CareAffirmation(id: '7eff3863-cd75-4c4b-b3a6-7d027ed07e80', title: 'Stock Investing', month: 6),
    ],
    [
    CareAffirmation(id: '91337553-0936-4b18-ab68-13214d91771d', title: 'Read a Book', month: 7),
  CareAffirmation(id: '4c0280ef-8090-4226-94b9-e11138f7a6fc', title: 'See a Movie That Was a Book', month: 7),
  CareAffirmation(id: '665a1eb0-04af-47dc-94a7-faf8f4ece1ec', title: 'Write a Book', month: 7),
  CareAffirmation(id: '8ee20efa-f80d-43d8-838f-baff17a7025a', title: 'Give a Book as Gift', month: 7),
  CareAffirmation(id: 'ea7a187b-fc2f-4cdb-a5a8-f6ba96e6b264', title: 'Create a Book Club', month: 7),
  CareAffirmation(id: 'a48633dd-4078-47ac-b557-56c0086a50b7', title: 'Host a Book Party', month: 7),
  CareAffirmation(id: '85d27b3c-33e2-4695-b624-841ad870d1dd', title: 'Visit a Book Store', month: 7),
  CareAffirmation(id: '475bce29-f9b6-4b12-8a75-233564311272', title: 'Attend a Book Reading', month: 7),
  CareAffirmation(id: 'fcb41d73-a76d-4b10-bc9f-1c52f5e23d79', title: 'Read to a Kid', month: 7),
  CareAffirmation(id: '85facebc-f7e4-4b3a-84a5-13b1fa607c9d', title: 'Set Up a Book Exchange', month: 7),
  CareAffirmation(id: '6212ab66-4b26-44af-b97b-2bdb582b183d', title: 'Share the Love of Reading', month: 7),
  CareAffirmation(id: '87259231-a4fc-4f31-82a5-66117a97ba31', title: 'Try a New Genre', month: 7),
    ],
    [
      CareAffirmation(id: '88653f66-5262-48be-9d52-9fc95f15f33c', title: 'Get a Foot Treatment', month: 8),
  CareAffirmation(id: 'ad1b76fb-a1f7-4c6b-a43f-9b961b82ece6', title: 'Take a Relaxation Bath', month: 8),
  CareAffirmation(id: '65c7e113-6d7a-4371-91d6-9f207a7caf56', title: 'Set Up a Spa Day', month: 8),
  CareAffirmation(id: 'c161171b-61d1-4a18-b727-061bb58d146c', title: 'Take the Afternoon off', month: 8),
  CareAffirmation(id: '1ab0694c-3ba9-4bc1-9594-8b4b0b0db837', title: 'Get a Blowout', month: 8),
  CareAffirmation(id: '55def897-b09f-43c2-b5bb-13f634146c25', title: 'Throw a Me Party', month: 8),
  CareAffirmation(id: 'ba9830ad-ead4-4530-b1e0-f99349f1e70e', title: 'Eat a Cupcake', month: 8),
  CareAffirmation(id: '25493250-598d-4a6b-8b36-92fcf9f18db9', title: 'Hire Someone To Clean Your House', month: 8),
  CareAffirmation(id: '4dd93145-330b-4b2b-8091-e2d75b3a73e8', title: 'Buy Beautiful Flowers', month: 8),
  CareAffirmation(id: '1ce2a4a9-39d3-403f-8b72-304873767a3c', title: 'Light a Relaxation Candle', month: 8),
  CareAffirmation(id: 'be968779-1406-457e-ac27-e284b78bceb9', title: 'Open a Bottle of Wine', month: 8),
  CareAffirmation(id: 'da03d0cd-7adc-4a7a-a175-0019f0be9c06', title: 'Use Essential Oils', month: 8),
  CareAffirmation(id: '4dcb6ebd-93b7-454d-8ac1-dec844660c57', title: 'Go for a Swim', month: 8),
  CareAffirmation(id: '010c7aff-4095-49c7-bcf7-b482fc4ac2c7', title: 'Read in Bed', month: 8),
  CareAffirmation(id: '01c0d012-7636-4e00-bc41-bf34a7578f8b', title: 'Get a Makeover', month: 8),
  CareAffirmation(id: 'd33a4b64-c635-4450-90f4-138c780a087d', title: 'Buy a Piece of Jewelry', month: 8),
  CareAffirmation(id: '17ba3672-a069-470a-bf5f-1436b8f8993e', title: 'Stay in Your Pjs', month: 8),
    ],
    [
CareAffirmation(id: '9580407f-51be-42dc-9b39-fa0c54406d73', title: 'Go on a Yoga/Meditation Retreat', month: 9),
  CareAffirmation(id: '9ad02e43-80ed-4961-8344-bd4af672599d', title: 'Go to a Conference', month: 9),
  CareAffirmation(id: 'a52c750a-1167-4e88-a9a8-6bc1634e0bc1', title: 'Take a Class', month: 9),
  CareAffirmation(id: 'd0c88f05-243b-47f0-bd7c-918f0a766ca7', title: 'Choose a New Hobby', month: 9),
  CareAffirmation(id: '8853c226-8388-4e79-b0bc-38dd75985598', title: 'Watch a Documentary', month: 9),
  CareAffirmation(id: '6be85222-9eca-441e-ae6a-2414fc2f7ce3', title: 'Go to a Concert', month: 9),
  CareAffirmation(id: '75cef5d4-272d-4962-bcdf-4a9316c99ee3', title: 'Treat Yourself to Tea Time With Friends', month: 9),
  CareAffirmation(id: '72256348-5835-4aa0-9289-95e764c326ab', title: 'Take a Weekend Trip', month: 9),
  CareAffirmation(id: '7e477ed9-d7a7-4837-bf86-adef53355026', title: 'Travel to a New Destination', month: 9),
  CareAffirmation(id: 'f7c34c1e-3de0-4032-8e95-fefb8b29128f', title: 'Go Camping', month: 9),
  CareAffirmation(id: 'bd56c4f9-c728-4ab7-8017-9f91f313a91a', title: 'Detox Your Body', month: 9),
  CareAffirmation(id: '05b4fc9d-4f3b-4f6d-a7e7-ce1a27b4e4ef', title: 'Try a Sauna', month: 9),
  CareAffirmation(id: '7db1fa5b-d7c2-48b9-ba97-1edee933ff23', title: 'Try Fasting', month: 9),
  CareAffirmation(id: 'f5e9a0bb-cf8d-4538-93e7-b1db27954801', title: 'Visit a Resort', month: 9),
  CareAffirmation(id: '1ee9c688-3a98-44ec-b88c-446219694eab', title: 'Read a Naughty Book', month: 9),
  CareAffirmation(id: 'a96d0fd5-de4d-4831-acdf-2f9351544481', title: 'Watch a Foreign Film Without Subtitles', month: 9),
  CareAffirmation(id: '106304e5-fc36-4eb5-8ed2-345ae146e035', title: 'Change Your Wardrobe', month: 9),
  CareAffirmation(id: '5ac27f5c-10c3-4049-878a-830d15adf14f', title: 'Use Essential Oils To Relax', month: 9),
  CareAffirmation(id: 'f725c51d-9a38-471b-b59e-80b64b1b1e6d', title: 'Try Binge Watching', month: 9),
    ],
    [
     CareAffirmation(id: '308550d2-5ca7-4bdf-a5f4-03a94dcdfbae', title: 'Visit Favorite Bakery', month: 10),
  CareAffirmation(id: '0c3e33b5-a94d-46b7-b215-4dd621f45500', title: 'Bake Yummy Cookies', month: 10),
  CareAffirmation(id: 'fa9d99d9-e8b5-49b5-8535-275f35315baa', title: 'Buy Strawberry Covered Chocolate', month: 10),
  CareAffirmation(id: '2b6aeca0-a88d-43d2-9b8e-af7a590e46b4', title: 'Eat Yogurt Parfait', month: 10),
  CareAffirmation(id: '322ec34b-37c1-4e16-beb6-cc55c4cff7dc', title: 'Buy Dark/Milk Chocolate', month: 10),
  CareAffirmation(id: '6550bc2a-e8cd-4113-a8e4-e25967a2f528', title: 'Make a Smoothie', month: 10),
  CareAffirmation(id: '62f55825-57d2-4827-a981-b4f937ba2b3d', title: 'Have a Sorbet', month: 10),
  CareAffirmation(id: 'bf7bb3d1-a7c6-4ea8-8c64-70ef49eba050', title: 'Eat Frozen Greek Yogurt', month: 10),
  CareAffirmation(id: '4984c5f0-30ab-4040-97db-71f6dd0efbf0', title: 'Eat Fruit and Cottage Cheese', month: 10),
  CareAffirmation(id: 'fb830204-99e9-456a-aefd-cafcbeb85602', title: 'Make Trail Mix With Dark Chocolate', month: 10),
  CareAffirmation(id: '0c1ece32-a92b-4502-a830-4c7304dcf069', title: 'Buy Dairy Free Ice Cream', month: 10),
  CareAffirmation(id: '3ddbd57f-0cf0-4f15-bf42-78d596341f56', title: 'Snack on Rice Cake With Almond Butter', month: 10),
  CareAffirmation(id: 'ecdd6b03-0fa5-4d1b-b73d-58331c2c159c', title: 'Enjoy Chocolate Covered Bananas', month: 10),
  CareAffirmation(id: '55ea4c9b-b9e2-4e14-aa0a-db852f52adc4', title: 'Indulge in Strawberries With Whip Cream', month: 10),
  CareAffirmation(id: '637ef927-eb5e-4694-bf7b-2406d8fed7d5', title: 'Drink Hot Cocoa', month: 10),
    ],
    [
 CareAffirmation(id: '83753878-180f-450c-b47c-ad3e326726fd', title: 'Drink Hot Chocolate With Whip Cream', month: 11),
  CareAffirmation(id: 'b746638e-605b-460b-b387-a183d62f63c3', title: 'Splurge on a Bag', month: 11),
  CareAffirmation(id: 'bdd9e841-fc81-4ee1-a41d-dd70bb2290c3', title: 'Take Supplements', month: 11),
  CareAffirmation(id: 'e7f314be-113b-4269-9995-c25b608f8eed', title: 'Buy a Bag of Popcorn', month: 11),
  CareAffirmation(id: 'e8c73654-8b47-4e85-837e-c37a0393463a', title: 'Walk the Dog', month: 11),
  CareAffirmation(id: 'ca701918-6802-4e28-ace6-7759223747fa', title: 'Find Money in Pocket', month: 11),
  CareAffirmation(id: '68907268-75a4-4200-a0a0-6e12cfe10657', title: 'Walk in Beautiful Weather', month: 11),
  CareAffirmation(id: '76108ef5-1a85-4c58-8a99-06b08d8155d0', title: 'Enjoy Fresh Sheets', month: 11),
  CareAffirmation(id: '6c304030-54b2-4d86-a640-fdb87bcf6124', title: 'Spend an Extra Hour in Bed', month: 11),
  CareAffirmation(id: '5f6529cc-4842-46e0-ad63-1464a9d20905', title: 'Receive Compliment', month: 11),
  CareAffirmation(id: 'c5634ac7-a1d4-4185-b507-3e47a3a6f6c6', title: 'Favorite T Shirt Clean', month: 11),
  CareAffirmation(id: '47f8e5e4-695b-4257-90ea-1b1ae2fe3b0e', title: 'Have a Lazy Sunday', month: 11),
  CareAffirmation(id: '47ec5cec-bd9e-419b-bcc7-fcf3943f4f1f', title: 'Buy Fresh Flowers', month: 11),
  CareAffirmation(id: 'a95efd9d-acfb-4b2d-9125-52ed5c7c34c5', title: 'Sit in Front of Fireplace', month: 11),
  CareAffirmation(id: '92a84ea0-3d05-412f-9482-114a23a6bcb0', title: 'Love Job', month: 11),
  CareAffirmation(id: '7ed3b4cd-f16e-435a-91a0-70c6e6fd122d', title: 'Order Room Service', month: 11),
  CareAffirmation(id: '46fcb988-3d5b-4284-9a6d-75f603c11ebe', title: 'Warm Towels', month: 11),
  CareAffirmation(id: '4fc38111-1074-4f76-ac6b-be69c794f988', title: 'Get Fresh Air', month: 11),
  CareAffirmation(id: '797fcf2f-3512-47af-bbb2-94cacae417d0', title: 'Pay Day', month: 11),
  CareAffirmation(id: 'c37c2072-5969-455d-bf08-c4e5b8414ab4', title: 'Buy New Shoes', month: 11),
  CareAffirmation(id: '22b99574-7d3f-45f7-9d61-57a046097954', title: 'Wear Favorite Lipstick', month: 11),
  CareAffirmation(id: 'edb5a12b-5458-4e20-832f-7b3e431f8a2a', title: 'Let It Go', month: 11),
  CareAffirmation(id: '07c82f9b-7890-4217-825a-5e0848e3f3b8', title: 'Text a Friend', month: 11), 
    ],
    [
     CareAffirmation(id: '4defc20f-aea9-443a-a5de-ba0e2b5a47cc', title: 'Reflect on Current Year', month: 12),
  CareAffirmation(id: '21a4a186-e6f7-4768-9961-d06e1c512db2', title: 'Create a Vision Board', month: 12),
  CareAffirmation(id: '17a71b36-5d37-4fc7-b4f1-597113a431fb', title: 'Set Goals for Next Year', month: 12),
  CareAffirmation(id: 'f870018b-e382-4a61-b249-7458d6543095', title: 'Prioritize for Next Year', month: 12),
  CareAffirmation(id: 'cbc3cc00-698f-4ef5-ad8e-2319068e5801', title: 'End This Year With a Bang', month: 12),
  CareAffirmation(id: '8177033a-2362-45b3-af7e-46507c1355bf', title: 'Create Eat Better Journal', month: 12),
  CareAffirmation(id: '070c0ccb-dd62-48ae-8b60-8be7c58f998c', title: 'Go on More Dates', month: 12),
  CareAffirmation(id: '26c4beb6-7cb1-4441-8b48-10bac6d4aaf9', title: 'Spend More Time With Family', month: 12),
  CareAffirmation(id: '5e4fbe96-9020-4b34-9b57-7c2f4c268e3a', title: 'Spend More Time With Friends', month: 12),
  CareAffirmation(id: '2c96e091-cec5-4955-888d-3467afd1e224', title: 'Exercise More', month: 12),
  CareAffirmation(id: '1c720a7a-bab5-419e-8288-170b8bbd6911', title: 'Learn New Skills', month: 12),
  CareAffirmation(id: 'e7f203fa-896c-4449-b986-89a27def85d4', title: 'Make New Friends', month: 12),
  CareAffirmation(id: 'e58a85e7-5fee-4354-895b-0f11a51b0b16', title: 'Spend Less Money', month: 12),
  CareAffirmation(id: '2936d563-c231-482d-8519-abdcc005ae9f', title: 'Focus on Relationships', month: 12),
  CareAffirmation(id: '0c0fa73e-61c6-4988-95e0-9a2c134a45c8', title: 'Self item = Care', month: 12),
  CareAffirmation(id: 'c608d1d6-3e4c-4d90-8d65-21dc7cc1516f', title: 'More Time on Wellbeing', month: 12),
  CareAffirmation(id: '6c100250-0900-48e4-9252-0b04a988f5cd', title: 'Do More Exciting Things', month: 12),
  CareAffirmation(id: 'd7ad7c7a-ad16-4fb8-be10-4bd8ba3023a8', title: 'item = Career Advancement', month: 12),
  CareAffirmation(id: '6eb8a954-8dd7-437a-b14c-e1db1e95e04f', title: 'Work-Life Balance', month: 12),
  CareAffirmation(id: '53ef6af0-4d48-4fb1-8cd0-887c0d586c76', title: 'Make a Difference', month: 12),
  CareAffirmation(id: '202b6f3c-1b71-4ef2-86c5-02685453920e', title: 'Find Growth Opportunities', month: 12),
    ],
  ];

  static Map<String, List<PositiveAffirmation>> positiveAffirmations = {
    'love': [
         PositiveAffirmation(id: '5582288e-b6fa-4033-8760-56d8fbf2f656', title: 'I love myself unconditionally', category: 'love'),
  PositiveAffirmation(id: '94481695-4956-482b-b89e-e7f9e4876f65', title: 'I love and accept myself exactly as I am', category: 'love'),
  PositiveAffirmation(id: 'e251c074-55ba-4f2d-a047-5a14c8e05700', title: 'I no longer wait to be perfect in order to love myself', category: 'love'),
  PositiveAffirmation(id: 'db32ba99-0f16-49f8-9973-c9d7fa2bb10f', title: 'I love and approve of myself', category: 'love'),
  PositiveAffirmation(id: '6c852611-d098-4f45-b960-49a650277c17', title: 'Each day I focus on my inner strength', category: 'love'),
  PositiveAffirmation(id: '0aa71b9b-6e3e-4882-ae3f-55b4bf7a5f17', title: 'I fill my mind with positive thoughts', category: 'love'),
  PositiveAffirmation(id: 'ec279545-acb4-425e-be05-91939b2226df', title: 'My inner strength grows stronger everyday because I practice love', category: 'love'),
  PositiveAffirmation(id: '27eddb85-6744-4140-a822-487c9d303d78', title: 'I deserve to enjoy life', category: 'love'),
  PositiveAffirmation(id: '5bddbfde-4ef7-41ec-8f35-689e7e61c637', title: 'I forgive myself', category: 'love'),
  PositiveAffirmation(id: 'b61e209f-faec-4409-95f1-f47348c1a996', title: 'I forgive others', category: 'love'),
  PositiveAffirmation(id: '8bd28c4d-9927-43c9-a299-084b9527f36e', title: 'I enjoy life to the fullest', category: 'love'),
  PositiveAffirmation(id: '0a8e355b-7d17-47f1-8187-8a5b60d45284', title: 'I now release all resistance to love', category: 'love'),
  PositiveAffirmation(id: 'c255fa13-443a-4a14-92a4-c7eeefced84c', title: 'I am surrounded by love', category: 'love'),
  PositiveAffirmation(id: 'c422dfc8-91a6-4950-8f1a-a0e9cc6c2f17', title: 'I radiate love and love fills my life', category: 'love'),
  PositiveAffirmation(id: 'f7ad86e2-7cb7-4b6a-9b92-7743453dd15a', title: 'I am thankful for all the love in my life, I find it everywhere', category: 'love'),
  PositiveAffirmation(id: 'c33ad012-0d23-46c4-a7c5-236d90fb3864', title: 'I respect my boundaries and insist others respect them too', category: 'love'),
  PositiveAffirmation(id: '31cf746b-4a27-4e11-bf5d-a3d9722a9d40', title: 'I love the person I see in the mirror', category: 'love'),
  PositiveAffirmation(id: 'f57970a5-271b-4570-a338-fc3bf9f6ba36', title: 'I am constantly surrounded by love', category: 'love'),
  PositiveAffirmation(id: '6fe1fa22-22f4-4ab8-abe2-4176d7f6297b', title: 'My inner beauty naturally radiates outward', category: 'love'),
  PositiveAffirmation(id: 'b2e924d3-b514-41d8-8823-4a3abea59414', title: 'I am always open to receiving money', category: 'love'),
  PositiveAffirmation(id: '363a94dc-d0d0-4276-bd77-ad99e7677368', title: 'I draw true love and romance into my life now', category: 'love'),
  PositiveAffirmation(id: 'a191f76b-581e-47ee-a0dc-786a4ef99f26', title: 'I am in a joyous, intimate relationship with a man who truly loves me', category: 'love'),
  PositiveAffirmation(id: '69604c33-c2aa-4811-b14b-bd84df0df24f', title: 'I attract only healthy relationships', category: 'love'),
  PositiveAffirmation(id: '3c22472d-b52e-46e5-ae6a-4916502856b1', title: 'I am attracting my soul mate into my life', category: 'love'),
  PositiveAffirmation(id: 'f94f5d7b-0006-46a5-a68a-75379fe4748b', title: 'I welcome love with open arms', category: 'love'),
  PositiveAffirmation(id: '827b5d9f-f540-4a64-b11c-4484ffd45bcb', title: 'Love is attracted to me and I am attracted to love', category: 'love'),
  PositiveAffirmation(id: '7526d6e1-697d-4906-94a4-eb49e445e088', title: 'My relationships are always safe and fulfilling', category: 'love'),
  PositiveAffirmation(id: 'c94ede92-d249-489a-913c-45afe929b416', title: 'I love the feeling of being in love ', category: 'love'),
  PositiveAffirmation(id: 'cf29646b-07b5-40ad-bb71-b44044b79d9e', title: 'I radiate unconditional love', category: 'love'),
  PositiveAffirmation(id: '5152a45d-fecf-4a3b-8d45-94b476dd8e91', title: 'I am filled with the vibration of love', category: 'love'),
  PositiveAffirmation(id: 'a378d4e2-2d23-492a-a5fb-b30050a0ea1e', title: 'I am beautiful and worthy of love', category: 'love'),
  PositiveAffirmation(id: '5d02587c-0e10-4743-90d0-1060c952d432', title: 'I spread love and receive it back many times over', category: 'love'),
  PositiveAffirmation(id: 'ea79c756-2c9a-49b9-8f15-69cb86e0695a', title: 'I am grateful for the abundance of love in my life', category: 'love'),
  PositiveAffirmation(id: 'acdc445e-8d74-4f28-b559-7beaf3858a88', title: 'Love is my birthright', category: 'love'),
  PositiveAffirmation(id: '4192722b-714d-4734-948b-9fe57f4b4a67', title: 'The more I love myself the more love I receive from others', category: 'love'),
  PositiveAffirmation(id: '2ff89b5b-5fd2-448f-b351-55a1b103ee9c', title: 'I am open and ready for love', category: 'love'),
  PositiveAffirmation(id: '11a00669-921f-4e07-9e7b-7fccfcfb2eaa', title: 'My soul mate is entering my life', category: 'love'),
  PositiveAffirmation(id: '9f7fbc68-d52b-4ac0-8f5e-daac395752e1', title: 'I see love, I feel love, I am love', category: 'love'),
  PositiveAffirmation(id: '45656602-5048-4d46-aa2c-b5649728232a', title: 'I love deeply and with passion', category: 'love'),
  PositiveAffirmation(id: '8e52e8b1-78fb-47a5-9535-aa59f4d3bca7', title: 'It is safe for me to be in a loving relationship', category: 'love'),
  PositiveAffirmation(id: 'a6e811bf-1df5-45c3-8311-e5034209a766', title: 'Everyday I am become more loving', category: 'love'),
  PositiveAffirmation(id: 'da66606f-f605-4427-947f-ce5ff6a0465a', title: 'I am loved for who I am', category: 'love'),
  PositiveAffirmation(id: 'cf9b21a9-675a-4448-ba18-18de30f44adc', title: 'Love fills my soul with warmth', category: 'love'),
  PositiveAffirmation(id: 'a21c7de1-c9ed-4934-8bf9-1dab8bb2320a', title: 'Yes I can', category: 'love'),
      ],
      'abundance': [
        PositiveAffirmation(id: 'ea122abb-c056-4ff0-897c-a04b05ff5a09', title: 'Abundance flows into my life easily', category: 'abundance'),
  PositiveAffirmation(id: '7380f9b6-5c4f-4908-b008-134e40a2429a', title: 'I am a magnet for money', category: 'abundance'),
  PositiveAffirmation(id: '8bda9740-9dec-48b0-86f1-4a5baf01491b', title: 'I am open and receptive to all the good and abundance in the universe', category: 'abundance'),
  PositiveAffirmation(id: '21d677a3-7273-4a15-9977-8d52ff279e24', title: 'My income keeps increasing', category: 'abundance'),
  PositiveAffirmation(id: 'bc7333cc-a574-4c14-9809-d52a10de176c', title: 'Money comes to me easily and frequently', category: 'abundance'),
  PositiveAffirmation(id: 'c570f2d1-e4e2-48ca-a5d5-8c9e84bc9164', title: 'Money is constantly coming to me', category: 'abundance'),
  PositiveAffirmation(id: '82ed285a-5322-427f-a64a-b06c49de5201', title: 'Money comes to me easily and effortlessly', category: 'abundance'),
  PositiveAffirmation(id: '5307d7d2-8e0c-4d4c-8dfa-18a8ccd9225d', title: 'I now attract opportunities to receive money', category: 'abundance'),
  PositiveAffirmation(id: '08b2dcd3-5202-4dda-8f6f-8f76a1a92fee', title: 'Prosperity of every kind is drawn to me', category: 'abundance'),
  PositiveAffirmation(id: '19d0a142-f3d8-44cd-b7f9-f2bb32d777ad', title: 'I prosper wherever I turn', category: 'abundance'),
  PositiveAffirmation(id: '2dd694ba-e3fd-472c-b649-acff8be82acd', title: 'Money flows into my life in an abundant way', category: 'abundance'),
  PositiveAffirmation(id: 'd5951f26-251b-4781-b30b-e76173388ab0', title: 'I am open to the unlimited prosperity that exists everywhere', category: 'abundance'),
  PositiveAffirmation(id: '35784bd8-13fb-4060-a229-44f648575fdb', title: 'I express gratitude for all the good in my life', category: 'abundance'),
  PositiveAffirmation(id: '1d3daa02-05f7-437c-80c9-f6eb1a523758', title: 'The laws of attraction brings only good into my life', category: 'abundance'),
  PositiveAffirmation(id: 'd975c344-0399-4902-bf07-f5d5158d24c5', title: 'I attract wonderful things in my life', category: 'abundance'),
  PositiveAffirmation(id: '3ebfc551-830b-4423-8147-edae42323629', title: 'I am successful', category: 'abundance'),
  PositiveAffirmation(id: '41f8635e-a036-408e-9636-124077b19777', title: 'All the money I need is flowing to me now', category: 'abundance'),
  PositiveAffirmation(id: '7699cbfc-4a11-4714-bf24-ec30fa9ce8da', title: 'Money is a wonderful friend of mine', category: 'abundance'),
  PositiveAffirmation(id: '5b550edc-ec35-4af1-823a-24a0721cd811', title: 'I am rich, I am prosperous', category: 'abundance'),
  PositiveAffirmation(id: 'fdffffe7-e49f-4e22-ad44-a91076fa566e', title: 'I always have a surplus of prosperity in my life', category: 'abundance'),
  PositiveAffirmation(id: '179d139f-fd69-47b6-b88e-b36080bc1091', title: 'I am open and receptive to new avenues of income', category: 'abundance'),
  PositiveAffirmation(id: '0a3cc064-d18c-4ce6-aa41-6248cd923ace', title: 'I am an unlimited being, accepting from an unlimited world in an unlimited way ', category: 'abundance'),
  PositiveAffirmation(id: '8309ec10-30ee-418d-8644-98c9cf9af831', title: 'I am a magnet for success and happiness', category: 'abundance'),
  PositiveAffirmation(id: 'd121a7ea-df24-4f42-8692-8116e82410fb', title: 'I choose to feel worthy and deserving of enormous wealth and power', category: 'abundance'),
  PositiveAffirmation(id: '9cf78225-f254-447e-87ae-8c869be662e5', title: 'I now release all resistance to money', category: 'abundance'),
  PositiveAffirmation(id: 'fc56e311-4c67-401e-9808-814c4a583866', title: 'I trust myself', category: 'abundance'),
  PositiveAffirmation(id: '4289c113-4def-49be-83d1-c486caebc369', title: 'The energy of money is always drawn to me', category: 'abundance'),
  PositiveAffirmation(id: '7d450653-79b8-4184-95ab-a658f3c37b87', title: 'I deserve an abundance of prosperity', category: 'abundance'),
  PositiveAffirmation(id: '13f63c03-6ca5-4f04-bf91-b50ebeede008', title: 'I give and receive joyously', category: 'abundance'),
  PositiveAffirmation(id: '08da4ab0-ee95-4dbf-b2ea-ae87a1791cdd', title: 'Everyday I am attracting and saving more money', category: 'abundance'),
  PositiveAffirmation(id: '897329fa-4fb3-487c-a00a-557db322c396', title: 'I am connected to the wisdom of the universe', category: 'abundance'),
  PositiveAffirmation(id: '4cf146e7-acbc-4b3a-9e99-7b772aa0dfb4', title: 'My vibration is always attuned to wealth', category: 'abundance'),
  PositiveAffirmation(id: 'd8728f85-06f6-4a7e-a7a5-057322a29c61', title: 'I am always connected to the energy of money', category: 'abundance'),
  PositiveAffirmation(id: '4c2dc177-c563-4a18-a24f-3dff5726f6d3', title: 'I manage money wisely', category: 'abundance'),
  PositiveAffirmation(id: '77997e50-0b83-4637-8343-0f9aaf8e0a2c', title: 'Yes I can', category: 'abundance'),
      ],
      'health_and_beauty': [
    PositiveAffirmation(id: '8bd833a3-094f-42b7-88a2-a78ceb7d85ee', title: 'Positive affirmations are becoming a habit for me. The more I do them, the better I feel and the better my life gets', category: 'health_and_beauty'),
  PositiveAffirmation(id: '3b0f9da5-d867-4401-a45d-e418164acb59', title: 'My healing is already in process', category: 'health_and_beauty'),
  PositiveAffirmation(id: '5e3c72e8-b42d-4d27-9bf8-e2069356c882', title: 'I feed my body nourishing foods', category: 'health_and_beauty'),
  PositiveAffirmation(id: '0ecfcebb-be13-4f1f-8aaa-a8d4e836dc60', title: 'My willingness to forgive begins my healing', category: 'health_and_beauty'),
  PositiveAffirmation(id: '7709ef11-e081-46f0-9265-8908a010b26f', title: 'I trust my inner wisdom', category: 'health_and_beauty'),
  PositiveAffirmation(id: '0e8976db-edc2-467f-9e62-0588bedcc996', title: 'I am willing to forgive myself and others', category: 'health_and_beauty'),
  PositiveAffirmation(id: '300ae010-239b-4254-8cee-f86a055ca895', title: 'Forgiveness is a gift for myself', category: 'health_and_beauty'),
  PositiveAffirmation(id: '5877d877-f4aa-4468-9bfc-196c15639b8b', title: 'I forgive and set myself free', category: 'health_and_beauty'),
  PositiveAffirmation(id: '4c6d0af4-dc47-4973-8671-0c22e1aefe8c', title: 'I am at peace in my world', category: 'health_and_beauty'),
  PositiveAffirmation(id: '5ed75b22-981e-40de-b89b-1593bdbd1673', title: 'I find relaxation, enjoyment, and healing in my life', category: 'health_and_beauty'),
  PositiveAffirmation(id: '269eebba-d457-4cc5-bf4c-1a54ef9701c5', title: 'I am healthy and happy', category: 'health_and_beauty'),
  PositiveAffirmation(id: '421e6827-4e6b-4800-933c-48f99c6b123e', title: 'I choose to get well', category: 'health_and_beauty'),
  PositiveAffirmation(id: '1bb39900-4d3b-4b13-9215-67872bf68a73', title: 'I am perfect health', category: 'health_and_beauty'),
  PositiveAffirmation(id: '6329978c-e190-425e-b472-e7bd056dde2c', title: 'I lovingly take care of myself', category: 'health_and_beauty'),
  PositiveAffirmation(id: '44a1595b-dd58-42e0-8bc7-5158a57630db', title: 'I am healthy and happy', category: 'health_and_beauty'),
  PositiveAffirmation(id: 'c927fde6-b161-4030-8fb8-fa2642a14f63', title: 'I have boundless energy to get things done easily and quickly', category: 'health_and_beauty'),
  PositiveAffirmation(id: '8b0a9378-ef4b-40a3-a0a4-76b1c43b0b30', title: 'I am beautiful just the way I am', category: 'health_and_beauty'),
  PositiveAffirmation(id: '6e7f5ae3-3585-477b-8972-a0ecba9614b4', title: 'I am worthy of seeing myself as beautiful', category: 'health_and_beauty'),
  PositiveAffirmation(id: '358acc74-bab1-4e3e-beb6-4e130219e33b', title: 'I am beauty and brains combined', category: 'health_and_beauty'),
  PositiveAffirmation(id: '9a35e26f-bbb4-4075-89ae-74568b716576', title: 'My mind and body are in perfect balance', category: 'health_and_beauty'),
  PositiveAffirmation(id: 'b3730e10-6965-4692-86b5-999daf10a005', title: 'I create my own sunshine', category: 'health_and_beauty'),
  PositiveAffirmation(id: 'de00f95a-7684-4029-a85d-e532a4f99923', title: 'I love and appreciate my body', category: 'health_and_beauty'),
  PositiveAffirmation(id: 'c1b061b9-f22b-417a-81c6-c312eebe17cf', title: 'I trust myself', category: 'health_and_beauty'),
  PositiveAffirmation(id: 'effc9a36-de39-4b70-b5d3-2c60f14b5dba', title: 'I respect who I am', category: 'health_and_beauty'),
  PositiveAffirmation(id: '99e267c8-5092-46de-bba8-6413ba0449c4', title: 'I see all the beauty around me', category: 'health_and_beauty'),
  PositiveAffirmation(id: 'd2530a5f-a5db-4bba-bf5b-9e219c1ccb3e', title: 'I am confident', category: 'health_and_beauty'),
  PositiveAffirmation(id: 'e0fb948c-07a6-4079-8a88-1026f584ade4', title: 'I see my true beauty', category: 'health_and_beauty'),
  PositiveAffirmation(id: '6fedfae5-8432-478f-9a53-42e789d34405', title: 'I find it easy to think positively', category: 'health_and_beauty'),
  PositiveAffirmation(id: '43efbea2-4239-4d9c-94fe-e8b93ffdd52f', title: 'I am loveable', category: 'health_and_beauty'),
  PositiveAffirmation(id: '43cd9386-780e-4148-8024-7dbb90a6e83a', title: 'I am well spoken', category: 'health_and_beauty'),
  PositiveAffirmation(id: 'f28b3ccf-a066-4b56-8f61-900994bc4624', title: 'I admire my mind', category: 'health_and_beauty'),
  PositiveAffirmation(id: '81d6b82a-30bf-4725-b22d-eb262d7dce6a', title: 'I am secure with myself', category: 'health_and_beauty'),
  PositiveAffirmation(id: '1a0a4613-1d2f-41c1-b38f-90d2994eb17f', title: 'I am comfortable in my own skin', category: 'health_and_beauty'),
  PositiveAffirmation(id: 'ad4449c5-1854-4ef0-b102-c60ff1e1e914', title: 'I am free from negativity', category: 'health_and_beauty'),
  PositiveAffirmation(id: '4d21d87c-b8fb-48e4-85fc-c7263a0a7fc6', title: 'I like the person I am becoming', category: 'health_and_beauty'),
  PositiveAffirmation(id: '8d847df1-2d68-49a6-96ca-6555b1beddfb', title: 'I see beauty within me', category: 'health_and_beauty'),
  PositiveAffirmation(id: 'a6902350-c8ac-4205-a2d4-fec964fb2373', title: 'I think positive thoughts about myself and others', category: 'health_and_beauty'),
  PositiveAffirmation(id: 'dcbc5894-828d-4a27-9701-b836ddc9e073', title: 'I have an attractive mind, body and spirit', category: 'health_and_beauty'),
  PositiveAffirmation(id: 'ee1cde7c-e32a-4bb8-a777-72127c40f400', title: 'I release the need to be scared', category: 'health_and_beauty'),
  PositiveAffirmation(id: '011aafeb-bdad-4a88-919c-1c95a5350437', title: 'I feel good about myself', category: 'health_and_beauty'),
  PositiveAffirmation(id: '0c34eea2-9c6e-49eb-b5c0-51d1be1d77ad', title: 'I believe in who I am', category: 'health_and_beauty'),
  PositiveAffirmation(id: 'f5306a7f-e2c5-45fc-9b5e-78cebe38a20c', title: 'I am in control of my life', category: 'health_and_beauty'),
  PositiveAffirmation(id: '20b3ee4e-3709-4aa8-98ba-e205b3210b09', title: 'I listen to the wisdom of my body', category: 'health_and_beauty'),
  PositiveAffirmation(id: '4463d363-8262-4ea3-ace0-7b7ae21b0122', title: 'I am powerful enough to overcome all negativity', category: 'health_and_beauty'),
  PositiveAffirmation(id: '9e1571ea-be9c-4a7b-a36d-ffdf2cc742b6', title: 'I attract beauty in my life', category: 'health_and_beauty'),
  PositiveAffirmation(id: 'fe2ce3b5-6920-4360-9264-604b91263da8', title: 'I choose joy', category: 'health_and_beauty'),
  PositiveAffirmation(id: '25b5cf34-09af-48a3-aa70-b873dd8e9422', title: 'I am willing to see all the beauty in my life', category: 'health_and_beauty'),
  PositiveAffirmation(id: '7b866d1b-1fb7-4946-8cdb-6b48c5605794', title: 'I am powerful', category: 'health_and_beauty'),
  PositiveAffirmation(id: 'a62ddb64-2325-4f21-9041-d434dc1f2e49', title: 'I am safe being me', category: 'health_and_beauty'),
  PositiveAffirmation(id: '745a6ed7-e231-4517-aea0-4f09c136a21e', title: 'I move from forgiveness to love', category: 'health_and_beauty'),
  PositiveAffirmation(id: '554b89a9-f111-4942-ad62-d3d16a3e7a46', title: 'As I change my thoughts my world changes', category: 'health_and_beauty'),
  PositiveAffirmation(id: '27ff9364-1b24-4f7b-bf7b-968f09de6bce', title: 'Each day I focus on my inner strength', category: 'health_and_beauty'),
  PositiveAffirmation(id: 'ef3cf959-fef7-4f00-bd3e-38e724133940', title: 'Life presents to me joyous circumstances', category: 'health_and_beauty'),
  PositiveAffirmation(id: '9c2b6e99-eabb-46e9-82ab-41b8903750c1', title: 'I am in charge of my thoughts and life', category: 'health_and_beauty'),
  PositiveAffirmation(id: '6e2f36e2-be81-421e-9e3a-ce12c102fa93', title: 'My heart is free from past hurt', category: 'health_and_beauty'),
  PositiveAffirmation(id: '6e21a61d-a7f1-426d-a625-0f69a7ff8e9a', title: 'I maintain my perfect weight', category: 'health_and_beauty'),
  PositiveAffirmation(id: 'ad6c7543-7d41-4117-adf2-51f94a53436f', title: 'Yes I can', category: 'health_and_beauty'),
      ],
  };

  static List<BucketIdea> bucketIdeas = [
   BucketIdea(id: '39a4aae8-97a2-418c-92f7-a431637daf97', title: 'Backpack through Europe'),
  BucketIdea(id: '2f1157c0-a205-43ee-b60c-fa32ddb53a37', title: 'Walk along the Great Wall of China'),
  BucketIdea(id: '9b6edd38-41c2-4417-ab06-328a8b2f59f4', title: 'Bathe in the Blue Lagoon Geothermal Spa, Iceland'),
  BucketIdea(id: '6bdca215-a0d5-4e8b-9685-c5d3096f1b15', title: 'See the Dead Sea'),
  BucketIdea(id: 'ffebc7a2-03d4-4673-b30e-64d02e90d772', title: 'Go on an African safari'),
  BucketIdea(id: '58ff423b-98ad-43fd-bbd0-ec481938e694', title: 'See the pyramids of Giza in Egypt'),
  BucketIdea(id: '7ce2f4d1-972b-4c69-b8c8-5aa809f92ef9', title: 'Ride a Venetian Gondola'),
  BucketIdea(id: '9e298a53-72eb-4dd6-b634-1749a7061cfc', title: 'View Paris from atop the Eiffel Tower'),
  BucketIdea(id: 'b6fbab0a-160e-486a-a0dd-ac2cfae15867', title: 'Take an Alaskan cruise'),
  BucketIdea(id: 'ede63eeb-7dfd-4e99-be1a-487eb36718b9', title: 'Visit Stonehenge'),
  BucketIdea(id: '3682e44b-57f9-4e48-b4bd-18d0630226d6', title: 'Climb Mt Kilimanjaro'),
  BucketIdea(id: '2fb25349-70f2-4790-9812-8e21caecade8', title: 'Go volcano boarding in Nicaragua'),
  BucketIdea(id: '4ebb9a71-672f-4cd2-8183-704cbae68690', title: 'See the Coliseum in Rome'),
  BucketIdea(id: '285b74e4-5dca-4bb9-b09e-8716a7e58f96', title: 'See the Grand Canyon and walk the Skywalk'),
  BucketIdea(id: '8f2fe2bf-0520-484b-9995-f98a33cb543c', title: 'See the spring tulips in Woodburn’s Tulip Festival, Oregon'),
  BucketIdea(id: '22b8662f-70e7-4a1a-9a9b-a10591ef8834', title: 'See the Tower of London'),
  BucketIdea(id: '75dd0b0c-1777-49f5-b189-7553de7841f8', title: 'Swim in the Mediterranean sea'),
  BucketIdea(id: '08cab255-040f-4e67-b9aa-87f0d7b789db', title: 'Swim in the world’s largest pool in San Alfonso del Mar resort in'),
  BucketIdea(id: '65358517-24a5-44ea-ac8a-644d064b1ef2', title: 'Algarrobo, Chile'),
  BucketIdea(id: 'a02121c0-8a98-4268-900e-5da1318c982b', title: 'Visit all Disneyland resorts'),
  BucketIdea(id: '70d58bb1-e27a-41b3-847f-846d8c4225bf', title: 'Visit Canada’s Niagra Falls'),
  BucketIdea(id: 'd1a1754c-b19a-4aed-9a2e-72e40071293a', title: 'Visit Old Havana and other places in Cuba'),
  BucketIdea(id: '58454d8c-3ce2-4aad-9bb4-c2049a8a9731', title: 'Visit St Mark’s Basilica'),
  BucketIdea(id: '27f0d039-5e8b-42ac-a37c-5a392c8ec433', title: 'Visit the Palace of Versailles in France'),
  BucketIdea(id: 'd40e7a77-0bad-43ff-b342-3658bf2a78e5', title: 'Stick my toes in every great lake'),
  BucketIdea(id: 'd3607dab-23eb-4ec2-9326-be2fda0f94e7', title: 'Visit a winery in France'),
  BucketIdea(id: '635c517e-6b68-4bc2-99c2-85bbe7631b7b', title: 'Visit Romania and see Dracula’s Castle'),
  BucketIdea(id: 'ae04926e-7598-4d8f-abf0-8b3d1f5b8c37', title: 'Learn how to snowboard'),
  BucketIdea(id: '4dd3691e-3d1d-4e25-a384-5e6fa8d390f7', title: 'Learn how to ice-skate'),
  BucketIdea(id: '4a9e71be-b34b-4fbf-9130-7b62b939fea5', title: 'Learn how to ski'),
  BucketIdea(id: '3866b753-876c-415e-8687-93b711e95c10', title: 'Learn how to surf'),
  BucketIdea(id: '5082a0bd-3b93-47da-8604-a6f59fa856a5', title: 'Learn how to speak another language'),
  BucketIdea(id: '79cb0af8-0433-449c-8f33-b299b39f0eec', title: 'Learn to sign'),
  BucketIdea(id: '0358336f-ed9a-44ee-adab-6abde06b7035', title: 'Learn to juggle'),
  BucketIdea(id: 'd1f11ea2-bcac-4dea-86e2-df3cf23f83c3', title: 'Learn at least five magic tricks'),
  BucketIdea(id: '9b2a3de7-54f6-4e43-b641-cdb8d8609d2e', title: 'Get a master’s degree'),
  BucketIdea(id: 'fbda6964-c997-45de-ae0f-e39d1b0ee5d1', title: 'Get a phD'),
  BucketIdea(id: 'e4327d05-4637-4e71-9e8a-dc35b54b93e0', title: 'Buy first home'),
  BucketIdea(id: '9bab8eff-d7b9-4f6e-a2dc-ee97cddbf320', title: 'Buy an investment property'),
  BucketIdea(id: '09d3f835-6f13-4d84-a46e-df340afc631d', title: 'Start a business'),
  BucketIdea(id: '750fb3a6-350c-4600-9679-3e5b4549597b', title: 'Buy a brand new fast car'),
  BucketIdea(id: '4f6cb2c7-1406-429a-8a83-e3f9ad623c54', title: 'Go on a vacation twice a year'),
  BucketIdea(id: 'ac724251-397e-42b9-9134-8f0475a3eb47', title: 'Be in two places at once'),
  BucketIdea(id: 'e084acf5-0542-487e-9dfb-d1d64d5b0064', title: 'Go bungee jumping'),
  BucketIdea(id: '9e3d18f0-86bb-48f2-b01e-a2970c26be13', title: 'Go cliff jumping'),
  BucketIdea(id: '5dae737f-638c-445f-9c0b-39f082d2c291', title: 'Do a retreat in a Buddhist monastery'),
  BucketIdea(id: '3c41ca91-861e-4110-a16f-60d71286717a', title: 'Complete a Triathlon'),
  BucketIdea(id: 'c708e5b8-5772-4e34-a9aa-f1f311866a16', title: 'Adopt an elephant orphan'),
  BucketIdea(id: 'c8b76cad-445a-4b2a-8e70-1f85ed07a80f', title: 'Help build a home'),
  BucketIdea(id: '38e05ee2-8d8b-4e6a-8445-88449decdccd', title: 'Host a charity event'),
  BucketIdea(id: '23c83b2d-e821-4c55-a7b4-2614b3691732', title: 'Host a foreign exchange student'),
  BucketIdea(id: '3d96a8e4-db27-45f0-8a0e-367a4036a60b', title: 'Attend a Kentucky Derby'),
  BucketIdea(id: '625f1e08-0236-4eee-9871-b1883a4381ca', title: 'Volunteer abroad'),
  BucketIdea(id: 'c79f3ea4-98f6-4228-8271-8a27271bb408', title: 'Attend the summer Olympics'),
  BucketIdea(id: '6b4c7f15-7b37-45be-961e-b26d994bb73b', title: 'Go to the Super Bowl'),
  BucketIdea(id: '1764f3d1-59ee-4de2-8134-ddc5cbd14489', title: 'See the Broadway musical'),
  BucketIdea(id: '8266c8c3-ce42-491f-8a39-420108ff0972', title: 'See one game at every (sport) stadium'),
  BucketIdea(id: '92a08210-5138-485b-becb-e8ae94c75ec7', title: 'Watch an opera'),
  BucketIdea(id: '5834ec89-03c1-4a87-a4d1-f69c7be60a69', title: 'Make my own homebrew beer'),
  BucketIdea(id: '050868f6-82f2-433d-9d30-ec59e51e76e7', title: 'Chop my hair off'),
  BucketIdea(id: '36167528-67cb-4be9-862f-5652f2fa2fdc', title: 'Try a strange color hair (blue, pink, etc)'),
  BucketIdea(id: '7e68631e-ea3a-49b1-996a-0fb2c539a9ed', title: 'Create a family tradition'),
  BucketIdea(id: '3f2bc1bd-a30b-4edb-b777-0d5fcb3e2b21', title: 'Stay up two days straight'),
  BucketIdea(id: 'e4097121-2416-4e71-bda2-503a4c308b18', title: 'Kiss under the mistletoe'),
  BucketIdea(id: '0baffc9a-bf3e-4ca0-a356-010010a41f12', title: 'Meditate every morning'),
  BucketIdea(id: '02c06072-8c3f-447e-86f6-b67119c5542f', title: 'Read a book a week for a year'),
  BucketIdea(id: 'afc46143-b499-4817-87a2-668ce3ffa587', title: 'Write my future self a love letter'),
  BucketIdea(id: 'd05212c6-80db-4494-b7df-3cfa9f5bc760', title: 'Have your 15 minutes of fame'),
  BucketIdea(id: '566bfb9e-7448-48e1-96a7-4b0dba7592e7', title: 'Read your 500th, 1000th, or 10,000th book'),
  BucketIdea(id: '08523529-ca3e-432f-81b2-05a0a18f4709', title: 'Try some smorrebrod in Denmark'),
  BucketIdea(id: 'a57a70dd-9b7e-4f7c-b69d-c2fde902344f', title: 'Eat a Beignet at Café Du Monde'),
  BucketIdea(id: '16be96e8-4321-4c08-9275-45085945f25c', title: 'Try Cassoulet in France'),
  BucketIdea(id: '8f6337ff-f8d9-4f83-b09e-ab37dfe9f643', title: 'Eat gelato in Italy'),
  BucketIdea(id: '7b573b89-5bff-47e8-abf1-97f02487b6ad', title: 'Eat at the Djemaa el Fna in Marrakesh, Morocco'),
  ];

  static User currentUser;

  static List<PositiveItem> personalInformations = [];
  static Map<String, PositiveItem> idPersonalAffirmations = {};

  static List<CalendarItem> calendar = [];
  static Map<String, CalendarItem> idCalendar = {};
  static Map<DateTime, List<CalendarItem>> dateCalendar = {};

  static List<BucketItem> bucketItems = [];
  static Map<String, BucketItem> idBucketItems = {};

  static FlutterLocalNotificationsPlugin notifications;

  static Future init() async {
    await Database.init();
    
    currentUser = Database.getCurrentUser();
    if (currentUser != null){
      MainAPI.setToken(currentUser.token);
    }

    var initializationSettingsAndroid = AndroidInitializationSettings('logo');
    var initializationSettingsIOS = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(initializationSettingsAndroid, initializationSettingsIOS);
    notifications = FlutterLocalNotificationsPlugin();
    notifications.initialize(initializationSettings);

    MainAPI.getCalendarItems().then(
      (items) {
        if (items != null) {
          for (var item in items){
            createOrUpdateCalendar(item);
          }
        } else {
          var items = Database.getCalendarItems();
          for (var item in items){
            createOrUpdateCalendar(item);
          }    
        }     
      }
    ).timeout(Duration(seconds: 10), 
      onTimeout: () {
        var items = Database.getCalendarItems();
        for (var item in items){
          createOrUpdateCalendar(item);
        }      
      }
    );  

    MainAPI.getPositiveItems().then(
      (items) {
        if (items != null) {
          for (var item in items){
            idPersonalAffirmations[item.positiveAffirmation.id] = item;
          }
        } else {
          var items = Database.getPositiveItems();
          for (var item in items){
            idPersonalAffirmations[item.positiveAffirmation.id] = item;
          }    
        }     
      }
    ).timeout(Duration(seconds: 10), 
      onTimeout: () {
        var items = Database.getPositiveItems();
        for (var item in items){
          idPersonalAffirmations[item.positiveAffirmation.id] = item;
        }     
      }
    ); 

    MainAPI.getBucketItems().then(
      (items) {
        if (items != null) {
          for (var item in items){
            if (item.bucketIdea != null) {
              idBucketItems[item.bucketIdea.id] = item;
            }
          }
          bucketItems = items;
        } else {
          var items = Database.getBucketItems();
          for (var item in items){
            if (item.bucketIdea != null) {
              idBucketItems[item.bucketIdea.id] = item;
            }
          }    
          bucketItems = items;
        }     
      }
    ).timeout(Duration(seconds: 10), 
      onTimeout: () {
        var items = Database.getBucketItems();
        for (var item in items){
          if (item.bucketIdea != null) {
            idBucketItems[item.bucketIdea.id] = item;
          }
        }    
        bucketItems = items; 
      }
    ); 
  }

  static Future<bool> login(String email, String password) async {
    var res = await MainAPI.authorize(email, password);
    if (res != null){
      currentUser = res;
      //Database.flush();
      Database.setCurrentUser(currentUser);
      MainAPI.token = currentUser.token;
      init();
    }
    return res != null;
  }

  static Future<bool> createUser(User user) async {
    var res = await MainAPI.createUser(user);
    if (res != null){
      currentUser = res;
      //Database.flush();
      Database.setCurrentUser(currentUser);
      MainAPI.token = currentUser.token;
      init();
    }
    return res != null;
  }

  
  static void logout(){
    currentUser = null;
    MainAPI.setToken(null);
    Database.deleteCurrentUser();
    Database.flush();

    calendar = [];
    idCalendar = {};
    dateCalendar = {};

    personalInformations = [];
    idPersonalAffirmations = {};
    
    bucketItems = [];
    idBucketItems = {};

    calculateDates();
    Database.setCalendarItems(calendar);
  }

  static Settings getSettings(){
    return Database.getSettings();
  }

  static void setSettings(Settings settings){
    Database.setSettings(settings);
  }

  static bool isAuthorized(){
    return currentUser != null;
  }

  static List<List<CareAffirmation>> getCareAffirmations(){
    return careAffirmamtions;
  }

  static List<String> getMonthAffirmations(){
    return monthAffirmations;
  }

  static Map<String, List<PositiveAffirmation>> getPositiveAffirmations(){
    return positiveAffirmations;
  }

  static List<String> getCareTitles(){
    return careTitles;
  }

  static List<String> getCarePhrases(){
    return carePhrases;
  }

  static List<BucketIdea> getBucketIdeas(){
    return bucketIdeas;
  }

  static void createOrUpdateCalendar(CalendarItem item){
    if (!idCalendar.containsKey(item.careAffirmation.id)) {
      calendar.add(item);
    } else {
      for (int i = 0; i < calendar.length; i++){
        if (calendar[i].careAffirmation.id == item.careAffirmation.id){
          calendar[i] = item;
        }
      }
    }

    // var time = Time(item.alertTime.hour, item.alertTime.minute, 0);
    // var androidPlatformChannelSpecifics = AndroidNotificationDetails('uplifting_notify', 'uplifting_notify', 'uplifting_notify');
    // var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    // var details = NotificationDetails(androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    // notifications.showDailyAtTime(
    //   0,
    //   'Uplifting',
    //   item.careAffirmation.title,
    //   Time(19, 26, 00),
    //   details);
    //  notifications.show(1, 'title', 'body', details);

    // if (item.repeatMode == RepeatMode.noRepeat) {
    //   notifications.schedule(
    //     0,
    //     'Uplifting',
    //     item.careAffirmation.title,
    //     DateTime(item.beginDate.year, item.beginDate.month, item.beginDate.day, item.alertTime.hour, item.alertTime.minute),
    //     details);
    // } else if (item.repeatMode == RepeatMode.daily) {
    //   notifications.showWeeklyAtDayAndTime(
    //     1, 
    //     'Uplifting',
    //     item.careAffirmation.title,
    //     Day(1),
    //     time,
    //     details);
    // }

    idCalendar[item.careAffirmation.id] = item;
    calculateDates();
  }

  static void calculateDates() async {
    var cDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
    dateCalendar = {};
    
    for (var item in calendar){
      var endDate = DateTime(cDate.year + 3, cDate.month, cDate.day);
      if (item.endMode == EndMode.onDate && item.endDate != null){
        endDate = item.endDate;
      }
        
      if (item.repeatMode == RepeatMode.noRepeat){
        if (!dateCalendar.containsKey(item.beginDate)){
          dateCalendar[item.beginDate] = [];          
        }
        dateCalendar[item.beginDate].add(item);
      } else {
        var curDate = item.beginDate;
        var dt = Duration(days: 1);
        if (item.repeatMode == RepeatMode.daily){
          dt = Duration(days: item.repeatNumber);
        } else if (item.repeatMode == RepeatMode.weekly){
          dt = Duration(days: 7 * item.repeatNumber);
        } else if (item.repeatMode == RepeatMode.monthly){
          dt = Duration(days: 31);
        }
        while (curDate.compareTo(endDate) < 1){
          if (!dateCalendar.containsKey(curDate)){
            dateCalendar[curDate] = [];          
          }
          dateCalendar[curDate].add(item);
          curDate = curDate.add(dt);
         }
      }
    }
    updateNotifications();
  }

  static Future updateNotifications() async {
    notifications.cancelAll();

    var settings = DataProvider.getSettings();
    
    var androidPlatformChannelSpecifics = AndroidNotificationDetails('Uplifting women', 'Uplifting women', 'Uplifting women', 
      playSound: settings.playSound,
    );
    var iOSPlatformChannelSpecifics = IOSNotificationDetails(presentSound: settings.playSound);
    var details = NotificationDetails(androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    
    int id = 0;
    //o4enb ne optimalno
    for (var date in dateCalendar.keys){
      for (var item in dateCalendar[date]){
        var dt = DateTime(date.year, date.month, date.day, item.alertTime.hour, item.alertTime.minute);
        //oh i ebu4ie tut kostili chtob ne tormozilo
        if (dt.difference(DateTime.now()).inMinutes > 1 && dt.difference(DateTime.now()).inDays < 7){
          notifications.schedule(
            id,
            'Uplifting women',
            item.careAffirmation.title,
            dt,
            details
          );
        }
        id++;
      }
    }
  }

  static void createCalendarItem(CalendarItem item){
    createOrUpdateCalendar(item);
    Database.setCalendarItems(calendar);
    MainAPI.createCalendarItem(item);
  }

  static void updateCalendarItem(CalendarItem item){
    createOrUpdateCalendar(item);
    MainAPI.updateCalendarItem(item);
    Database.setCalendarItems(calendar);
  }

  static void removeCalendarItem(CalendarItem item){
    List<CalendarItem> remove = [];
    for (var item in calendar){
      if (item.careAffirmation.id == item.careAffirmation.id){
        remove.add(item);
      }
    }
    for (var item in remove){
      calendar.remove(item);
    }
    idCalendar.remove(item.careAffirmation.id);
    calculateDates();
    MainAPI.removeCalendarItem(item);
    Database.setCalendarItems(calendar);
  }

  static Map<String, CalendarItem> getIdCalendarItems(){
    return idCalendar;
  }

  static Map<DateTime, List<CalendarItem>> getDateCalendarItems(){
    return dateCalendar;
  }

  static void createPersonalAffirmation(PositiveItem item){
    idPersonalAffirmations[item.positiveAffirmation.id] = item;
    MainAPI.createPositiveItem(item);
    Database.setPositiveItems(idPersonalAffirmations.values.toList());
  }

  static void removePersonalAffirmation(PositiveItem item){
    idPersonalAffirmations.remove(item.positiveAffirmation.id);
    MainAPI.removePositiveItem(item);
    Database.setPositiveItems(idPersonalAffirmations.values.toList());
  }

  static Map<String, PositiveItem> getIdPersonalAffirmations(){
    return idPersonalAffirmations;
  }

  static void createBucketItems(List<BucketItem> items){
    idBucketItems = {};
    bucketItems = [];
    for (var item in items){
      bucketItems.add(item);
      if (item.bucketIdea != null){
        idBucketItems[item.bucketIdea.id] = item;
      } 
    }
    MainAPI.createBucketItems(bucketItems);
    Database.setBucketItems(bucketItems);
  }

  static void removeBucketItem(BucketItem item){
    List<BucketItem> remove = [];
    for (var bk in bucketItems){
      if (bk.id == item.id){
        remove.add(bk);
      }
    }
    for (var bk in remove){
      bucketItems.remove(bk);
    }

    if (item.bucketIdea != null){
      idBucketItems.remove(item.bucketIdea.id);
    }
    //MainAPI.removePositiveItem(item);
    Database.setBucketItems(bucketItems);
  }

  static Map<String, BucketItem> getIdBucketItems(){
    return idBucketItems;
  }

  static List<BucketItem> getBucketItems(){
    return bucketItems;
  }

  static String getImage(String id){
    return MainAPI.getImage(id);
  }
}