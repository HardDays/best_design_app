import 'database.dart';

import '../models/care_affirmation.dart';
import '../models/positive_affirmation.dart';
import '../models/calendar_item.dart';

class DataProvider {

  static List<String> monthAffirmations = [
    'I Love myself',
    'I Love, honor and appreciate my body',
    'I Accept perfect health now',
    'I Am confident',
    'I Only attract healthy relationships in my life',
    'I Am a magner for money',
    'Abundance flows freely into my life',
    'I Move from forgiveness to love',
    'The Law of attraction brings only good into my life',
    'I Am grateful for all the love in my life',
    'I Allow positive changes to come into my life',
    'I Happily claim my on powers',
  ];

  static List<String> careTitles = [
    'January is Being Healthy',
    'February is Love and Relationship',
    'March is Spring Renewal',
    'April is Friendship',
    'May is Family',
    'June is New Skills',
    'July is Little Thing to Make Us Happy',
    'August is Pampering',
    'September is Fun Drinks/Smoothies',
    'October is Satisfy Sweet Tooth',
    'November is DIY and Give Back',
    'December is Goals',
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
      CareAffirmation(id: '1', title: 'Go for a Walk', month: 1),
      CareAffirmation(id: '2', title: 'Take a Bath', month: 1),
      CareAffirmation(id: '3', title: 'Meditate', month: 1),
      CareAffirmation(id: '4', title: 'Stretch', month: 1),
      CareAffirmation(id: '5', title: 'Take a Nap', month: 1),
      CareAffirmation(id: '6', title: 'Eat Healthy Breakfast', month: 1),
      CareAffirmation(id: '7', title: 'Drink Water', month: 1),
      CareAffirmation(id: '8', title: 'Remove Toxic People', month: 1),
      CareAffirmation(id: '9', title: 'Take a Mental Day', month: 1),
      CareAffirmation(id: '10', title: 'Get a Massage', month: 1),
      CareAffirmation(id: '11', title: 'Go to Bed Early', month: 1),
      CareAffirmation(id: '12', title: 'Sleep in on Weekend', month: 1),
      CareAffirmation(id: '13', title: 'Get a Mani/Pedi', month: 1),
      CareAffirmation(id: '14', title: 'Start Journaling', month: 1),
      CareAffirmation(id: '15', title: 'Try Acupuncture', month: 1),
      CareAffirmation(id: '16', title: 'Drink Herbal Tea', month: 1),
      CareAffirmation(id: '17', title: 'Smile More', month: 1),
      CareAffirmation(id: '18', title: 'Feel Happy', month: 1),
      CareAffirmation(id: '19', title: 'Be Selfish', month: 1),
      CareAffirmation(id: '20', title: 'Try Yoga', month: 1),
    ],
    [
      CareAffirmation(id: '21', title: 'Love Yourself', month: 2),
      CareAffirmation(id: '22', title: 'Love Your Body', month: 2),
      CareAffirmation(id: '23', title: 'Buy a Lipstick', month: 2),
      CareAffirmation(id: '24', title: 'Buy Flowers', month: 2),
      CareAffirmation(id: '25', title: 'Compliment Yourself', month: 2),
      CareAffirmation(id: '26', title: 'Compliment Your Loved One', month: 2),
      CareAffirmation(id: '27', title: 'Buy a Sexy Outfit', month: 2),
      CareAffirmation(id: '28', title: 'Go on a Date', month: 2),
      CareAffirmation(id: '29', title: 'Watch a Romantic Movie', month: 2),
      CareAffirmation(id: '30', title: 'Eat Breakfast in Bed', month: 2),
      CareAffirmation(id: '31', title: 'Try Weekend Getaway', month: 2),
      CareAffirmation(id: '32', title: 'Go Out To Dinner', month: 2),
      CareAffirmation(id: '33', title: 'Send a Love Message ', month: 2),
      CareAffirmation(id: '34', title: 'Dance', month: 2),
      CareAffirmation(id: '35', title: 'Renew Vows', month: 2),
      CareAffirmation(id: '36', title: 'Try Hot Air Balloon Ride', month: 2),
      CareAffirmation(id: '37', title: 'Have a Photo Shoot', month: 2),
      CareAffirmation(id: '38', title: 'Try a Road Trip', month: 2),
      CareAffirmation(id: '39', title: 'Hold Hands', month: 2),
      CareAffirmation(id: '40', title: 'Exercise Together', month: 2),
      CareAffirmation(id: '41', title: 'Candlelight Dinner at Home', month: 2),
      CareAffirmation(id: '42', title: 'Wine Tasting', month: 2),
      CareAffirmation(id: '43', title: 'Buy a New Perfume', month: 2),
    ],
    [
      CareAffirmation(id: '44', title: 'Declutter House', month: 3),
      CareAffirmation(id: '45', title: 'Spend Time Outdoors', month: 3),
      CareAffirmation(id: '46', title: 'Plant a Garden', month: 3),
      CareAffirmation(id: '47', title: 'Take a Trip', month: 3),
      CareAffirmation(id: '48', title: 'Simplify Life', month: 3),
      CareAffirmation(id: '49', title: 'New Hobby', month: 3),
      CareAffirmation(id: '50', title: 'Challenge Limiting Beliefs', month: 3),
      CareAffirmation(id: '51', title: 'Clear Emotional Clutter', month: 3),
      CareAffirmation(id: '52', title: 'Practice Peace & Understanding', month: 3),
      CareAffirmation(id: '53', title: 'Try Detoxing', month: 3),
      CareAffirmation(id: '54', title: 'Get Grounded', month: 3),
      CareAffirmation(id: '55', title: 'Say no to Someone', month: 3),
      CareAffirmation(id: '56', title: 'Set Intentions', month: 3),
      CareAffirmation(id: '57', title: 'Breath', month: 3),
      CareAffirmation(id: '58', title: 'New Beginning', month: 3),
      CareAffirmation(id: '59', title: 'Stay Positive', month: 3),
      CareAffirmation(id: '60', title: 'Make Time for Yourself', month: 3),
      CareAffirmation(id: '61', title: 'Practice Gratitude', month: 3),
      CareAffirmation(id: '62', title: 'Read a Book', month: 3),
      CareAffirmation(id: '63', title: 'Eat Chocolate', month: 3),
      CareAffirmation(id: '64', title: 'Get Your Hair Done', month: 3),
    ],
    [
      CareAffirmation(id: '65', title: 'Go Out With Your BF', month: 4),
      CareAffirmation(id: '66', title: 'Write a Letter to a Friend', month: 4),
      CareAffirmation(id: '67', title: 'Lunch With Girls', month: 4),
      CareAffirmation(id: '68', title: 'Host Movie Marathon ', month: 4),
      CareAffirmation(id: '69', title: 'Visit a Spa', month: 4),
      CareAffirmation(id: '70', title: 'Go Shopping', month: 4),
      CareAffirmation(id: '71', title: 'Plan a Dinner Party', month: 4),
      CareAffirmation(id: '72', title: 'Friendship Tribute on Social Media', month: 4),
      CareAffirmation(id: '73', title: 'Give a Small Gift', month: 4),
      CareAffirmation(id: '74', title: 'Go Dancing', month: 4),
      CareAffirmation(id: '75', title: 'Weekend Trip', month: 4),
      CareAffirmation(id: '76', title: 'Ice Cream With BF', month: 4),
      CareAffirmation(id: '77', title: 'Friendship Bracelets', month: 4),
      CareAffirmation(id: '78', title: 'Photo Booth Pics', month: 4),
      CareAffirmation(id: '79', title: 'Have a Sleep Over', month: 4),
      CareAffirmation(id: '80', title: 'Visit a Winery', month: 4),
      CareAffirmation(id: '81', title: 'Recollect Memories', month: 4),
      CareAffirmation(id: '82', title: 'Send Flowers', month: 4),
      CareAffirmation(id: '83', title: 'Call a Friend', month: 4),
      CareAffirmation(id: '84', title: 'Gift Personalize Coffee Mug', month: 4),
      CareAffirmation(id: '85', title: 'Eat a Sinful Dessert Together', month: 4),
    ],
    [
      CareAffirmation(id: '83', title: 'Special Family Dinner', month: 5),
      CareAffirmation(id: '84', title: 'Photo Shoot', month: 5),
      CareAffirmation(id: '85', title: 'Story Time', month: 5),
      CareAffirmation(id: '86', title: 'Watch Family Videos', month: 5),
      CareAffirmation(id: '87', title: 'Go Bowling', month: 5),
      CareAffirmation(id: '88', title: 'Have T Shirt Competition', month: 5),
      CareAffirmation(id: '89', title: 'Outdoor Movie Night', month: 5),
      CareAffirmation(id: '90', title: 'Create a Family Tree', month: 5),
      CareAffirmation(id: '91', title: 'Cocktail Party', month: 5),
      CareAffirmation(id: '92', title: 'Bake Cookies Together', month: 5),
      CareAffirmation(id: '93', title: 'Make a Family Movie', month: 5),
      CareAffirmation(id: '94', title: 'Give Silly Awards', month: 5),
      CareAffirmation(id: '95', title: 'Do Crafts', month: 5),
      CareAffirmation(id: '96', title: 'Go to the Beach', month: 5),
      CareAffirmation(id: '97', title: 'Play Ball', month: 5),
      CareAffirmation(id: '98', title: 'Family Trivia', month: 5),
      CareAffirmation(id: '99', title: 'Visit Family Member', month: 5),
      CareAffirmation(id: '100', title: 'Go on a Picnic', month: 5),
    ],
    [
      CareAffirmation(id: '101', title: 'Play Chess', month: 6),
      CareAffirmation(id: '102', title: 'Cook', month: 6),
      CareAffirmation(id: '103', title: 'Play Poker', month: 6),
      CareAffirmation(id: '104', title: 'Ride a Horse', month: 6),
      CareAffirmation(id: '105', title: 'New Language', month: 6),
      CareAffirmation(id: '106', title: 'Sew/Knit', month: 6),
      CareAffirmation(id: '107', title: 'Play Instrument', month: 6),
      CareAffirmation(id: '108', title: 'Public Speaking', month: 6),
      CareAffirmation(id: '109', title: 'Meditate', month: 6),
      CareAffirmation(id: '110', title: 'Paint/Draw', month: 6),
      CareAffirmation(id: '111', title: 'Photography', month: 6),
      CareAffirmation(id: '112', title: 'Use Chopsticks', month: 6),
      CareAffirmation(id: '113', title: 'Juggle', month: 6),
      CareAffirmation(id: '114', title: 'Speed Read', month: 6),
      CareAffirmation(id: '115', title: 'Dance', month: 6),
      CareAffirmation(id: '116', title: 'Practice Positive Affirmation', month: 6),
      CareAffirmation(id: '117', title: 'Home Brewing', month: 6),
      CareAffirmation(id: '118', title: 'Self Defense', month: 6),
      CareAffirmation(id: '119', title: 'Perform CPR', month: 6),
      CareAffirmation(id: '120', title: 'Mindful Living', month: 6),
      CareAffirmation(id: '121', title: 'Remove Bad Habits', month: 6),
      CareAffirmation(id: '122', title: 'Develop Confidence', month: 6),
      CareAffirmation(id: '123', title: 'Think Positive', month: 6),
      CareAffirmation(id: '124', title: 'Improve Memory', month: 6),
      CareAffirmation(id: '125', title: 'Create Personal Budget', month: 6),
      CareAffirmation(id: '126', title: 'Stock Investing', month: 6),
    ],
    [
      CareAffirmation(id: '127', title: 'Read a Book', month: 7),
      CareAffirmation(id: '128', title: 'See a Movie That Was a Book', month: 7),
      CareAffirmation(id: '129', title: 'Write a Book', month: 7),
      CareAffirmation(id: '130', title: 'Give a Book as Gift', month: 7),
      CareAffirmation(id: '131', title: 'Create a Book Club', month: 7),
      CareAffirmation(id: '132', title: 'Host a Book Party', month: 7),
      CareAffirmation(id: '133', title: 'Visit a Book Store', month: 7),
      CareAffirmation(id: '134', title: 'Attend a Book Reading', month: 7),
      CareAffirmation(id: '135', title: 'Read to a Kid', month: 7),
      CareAffirmation(id: '136', title: 'Set Up a Book Exchange', month: 7),
      CareAffirmation(id: '137', title: 'Share the Love of Reading', month: 7),
      CareAffirmation(id: '138', title: 'Try a New Genre', month: 7),
    ],
    [
      CareAffirmation(id: '139', title: 'Get a Foot Treatment', month: 8),
      CareAffirmation(id: '140', title: 'Take a Relaxation Bath', month: 8),
      CareAffirmation(id: '141', title: 'Set Up a Spa Day', month: 8),
      CareAffirmation(id: '142', title: 'Take the Afternoon off', month: 8),
      CareAffirmation(id: '143', title: 'Get a Blowout', month: 8),
      CareAffirmation(id: '144', title: 'Throw a Me Party', month: 8),
      CareAffirmation(id: '145', title: 'Eat a Cupcake', month: 8),
      CareAffirmation(id: '146', title: 'Hire Someone To Clean Your House', month: 8),
      CareAffirmation(id: '147', title: 'Buy Beautiful Flowers', month: 8),
      CareAffirmation(id: '148', title: 'Light a Relaxation Candle', month: 8),
      CareAffirmation(id: '149', title: 'Open a Bottle of Wine', month: 8),
      CareAffirmation(id: '150', title: 'Use Essential Oils', month: 8),
      CareAffirmation(id: '151', title: 'Go for a Swim', month: 8),
      CareAffirmation(id: '152', title: 'Read in Bed', month: 8),
      CareAffirmation(id: '153', title: 'Get a Makeover', month: 8),
      CareAffirmation(id: '154', title: 'Buy a Piece of Jewelry', month: 8),
      CareAffirmation(id: '155', title: 'Stay in Your Pjs', month: 8),
    ],
    [
      CareAffirmation(id: '156', title: 'Go on a Yoga/Meditation Retreat', month: 9),
      CareAffirmation(id: '157', title: 'Go to a Conference', month: 9),
      CareAffirmation(id: '158', title: 'Take a Class', month: 9),
      CareAffirmation(id: '159', title: 'Choose a New Hobby', month: 9),
      CareAffirmation(id: '160', title: 'Watch a Documentary', month: 9),
      CareAffirmation(id: '161', title: 'Go to a Concert', month: 9),
      CareAffirmation(id: '162', title: 'Treat Yourself to Tea Time With Friends', month: 9),
      CareAffirmation(id: '163', title: 'Take a Weekend Trip', month: 9),
      CareAffirmation(id: '164', title: 'Travel to a New Destination', month: 9),
      CareAffirmation(id: '165', title: 'Go Camping', month: 9),
      CareAffirmation(id: '166', title: 'Detox Your Body', month: 9),
      CareAffirmation(id: '167', title: 'Try a Sauna', month: 9),
      CareAffirmation(id: '168', title: 'Try Fasting', month: 9),
      CareAffirmation(id: '169', title: 'Visit a Resort', month: 9),
      CareAffirmation(id: '170', title: 'Read a Naughty Book', month: 9),
      CareAffirmation(id: '171', title: 'Watch a Foreign Film Without Subtitles', month: 9),
      CareAffirmation(id: '172', title: 'Change Your Wardrobe', month: 9),
      CareAffirmation(id: '173', title: 'Use Essential Oils To Relax', month: 9),
      CareAffirmation(id: '174', title: 'Try Binge Watching', month: 9),
    ], 
    [
      CareAffirmation(id: '175', title: 'Visit Favorite Bakery', month: 10),
      CareAffirmation(id: '176', title: 'Bake Yummy Cookies', month: 10),
      CareAffirmation(id: '177', title: 'Buy Strawberry Covered Chocolate', month: 10),
      CareAffirmation(id: '178', title: 'Eat Yogurt Parfait', month: 10),
      CareAffirmation(id: '179', title: 'Buy Dark/Milk Chocolate', month: 10),
      CareAffirmation(id: '180', title: 'Make a Smoothie', month: 10),
      CareAffirmation(id: '181', title: 'Have a Sorbet', month: 10),
      CareAffirmation(id: '182', title: 'Eat Frozen Greek Yogurt', month: 10),
      CareAffirmation(id: '183', title: 'Eat Fruit and Cottage Cheese', month: 10),
      CareAffirmation(id: '184', title: 'Make Trail Mix With Dark Chocolate', month: 10),
      CareAffirmation(id: '185', title: 'Buy Dairy Free Ice Cream', month: 10),
      CareAffirmation(id: '186', title: 'Snack on Rice Cake With Almond Butter', month: 10),
      CareAffirmation(id: '187', title: 'Enjoy Chocolate Covered Bananas', month: 10),
      CareAffirmation(id: '188', title: 'Indulge in Strawberries With Whip Cream', month: 10),
      CareAffirmation(id: '189', title: 'Drink Hot Cocoa', month: 10),
    ],
    [
      CareAffirmation(id: '190', title: 'Drink Hot Chocolate With Whip Cream', month: 11),
      CareAffirmation(id: '191', title: 'Splurge on a Bag', month: 11),
      CareAffirmation(id: '192', title: 'Take Supplements', month: 11),
      CareAffirmation(id: '193', title: 'Buy a Bag of Popcorn', month: 11),
      CareAffirmation(id: '194', title: 'Walk the Dog', month: 11),
      CareAffirmation(id: '195', title: 'Find Money in Pocket', month: 11),
      CareAffirmation(id: '196', title: 'Walk in Beautiful Weather', month: 11),
      CareAffirmation(id: '197', title: 'Enjoy Fresh Sheets', month: 11),
      CareAffirmation(id: '198', title: 'Spend an Extra Hour in Bed', month: 11),
      CareAffirmation(id: '199', title: 'Receive Compliment', month: 11),
      CareAffirmation(id: '200', title: 'Favorite T Shirt Clean', month: 11),
      CareAffirmation(id: '201', title: 'Have a Lazy Sunday', month: 11),
      CareAffirmation(id: '202', title: 'Buy Fresh Flowers', month: 11),
      CareAffirmation(id: '203', title: 'Sit in Front of Fireplace', month: 11),
      CareAffirmation(id: '204', title: 'Love Job', month: 11),
      CareAffirmation(id: '205', title: 'Order Room Service', month: 11),
      CareAffirmation(id: '206', title: 'Warm Towels', month: 11),
      CareAffirmation(id: '207', title: 'Get Fresh Air', month: 11),
      CareAffirmation(id: '208', title: 'Pay Day', month: 11),
      CareAffirmation(id: '209', title: 'Buy New Shoes', month: 11),
      CareAffirmation(id: '210', title: 'Wear Favorite Lipstick', month: 11),
      CareAffirmation(id: '211', title: 'Let It Go', month: 11),
      CareAffirmation(id: '212', title: 'Text a Friend', month: 11),
    ],
    [
      CareAffirmation(id: '213', title: 'Reflect on Current Year', month: 12),
      CareAffirmation(id: '214', title: 'Create a Vision Board', month: 12),
      CareAffirmation(id: '215', title: 'Set Goals for Next Year', month: 12),
      CareAffirmation(id: '216', title: 'Prioritize for Next Year', month: 12),
      CareAffirmation(id: '217', title: 'End This Year With a Bang', month: 12),
      CareAffirmation(id: '218', title: 'Create Eat Better Journal', month: 12),
      CareAffirmation(id: '219', title: 'Go on More Dates', month: 12),
      CareAffirmation(id: '220', title: 'Spend More Time With Family', month: 12),
      CareAffirmation(id: '221', title: 'Spend More Time With Friends', month: 12),
      CareAffirmation(id: '222', title: 'Exercise More', month: 12),
      CareAffirmation(id: '223', title: 'Learn New Skills', month: 12),
      CareAffirmation(id: '224', title: 'Make New Friends', month: 12),
      CareAffirmation(id: '225', title: 'Spend Less Money', month: 12),
      CareAffirmation(id: '226', title: 'Focus on Relationships', month: 12),
      CareAffirmation(id: '227', title: 'Self Care', month: 12),
      CareAffirmation(id: '228', title: 'More Time on Wellbeing', month: 12),
      CareAffirmation(id: '229', title: 'Do More Exciting Things', month: 12),
      CareAffirmation(id: '230', title: 'Career Advancement', month: 12),
      CareAffirmation(id: '231', title: 'Work-Life Balance', month: 12),
      CareAffirmation(id: '232', title: 'Make a Difference', month: 12),
      CareAffirmation(id: '233', title: 'Find Growth Opportunities', month: 12),  
    ]
  ];

  static Map<String, List<PositiveAffirmation>> positiveAffirmations = {
    PositiveCategory.healthAndBeauty : [
      PositiveAffirmation(id: '1', title: 'Positive affirmations are becoming a habit for me. The more I do them, the better I feel and the better my life gets', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '3', title: 'My healing is already in process', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '4', title: 'I feed my body nourishing foods', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '5', title: 'My willingness to forgive begins my healing', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '6', title: 'I trust my inner wisdom', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '7', title: 'I am willing to forgive myself and others', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '8', title: 'Forgiveness is a gift for myself', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '9', title: 'I forgive and set myself free', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '10', title: 'I am at peace in my world', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '11', title: 'I find relaxation, enjoyment, and healing in my life', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '12', title: 'I am healthy and happy', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '13', title: 'I choose to get well', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '14', title: 'I am perfect health', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '15', title: 'I lovingly take care of myself', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '16', title: 'I am healthy and happy', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '17', title: 'I have boundless energy to get things done easily and quickly', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '18', title: 'I am beautiful just the way I am', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '19', title: 'I am worthy of seeing myself as beautiful', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '20', title: 'I am beauty and brains combined', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '21', title: 'My mind and body are in perfect balance', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '22', title: 'I create my own sunshine', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '23', title: 'I love and appreciate my body', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '24', title: 'I trust myself', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '25', title: 'I respect who I am', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '26', title: 'I see all the beauty around me', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '27', title: 'I am confident', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '28', title: 'I see my true beauty', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '29', title: 'I find it easy to think positively', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '30', title: 'I am loveable', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '31', title: 'I am well spoken', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '32', title: 'I admire my mind', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '33', title: 'I am secure with myself', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '34', title: 'I am comfortable in my own skin', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '35', title: 'I am free from negativity', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '36', title: 'I like the person I am becoming', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '37', title: 'I see beauty within me', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '38', title: 'I think positive thoughts about myself and others', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '39', title: 'I have an attractive mind, body and spirit', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '40', title: 'I release the need to be scared', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '41', title: 'I feel good about myself', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '42', title: 'I believe in who I am', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '43', title: 'I am in control of my life', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '44', title: 'I listen to the wisdom of my body', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '45', title: 'I am powerful enough to overcome all negativity', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '46', title: 'I attract beauty in my life', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '47', title: 'I choose joy', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '48', title: 'I am willing to see all the beauty in my life', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '49', title: 'I am powerful', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '50', title: 'I am safe being me', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '51', title: 'I move from forgiveness to love', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '52', title: 'As I change my thoughts my world changes', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '53', title: 'Each day I focus on my inner strength', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '54', title: 'Life presents to me joyous circumstances', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '55', title: 'I am in charge of my thoughts and life', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '56', title: 'My heart is free from past hurt', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '57', title: 'I maintain my perfect weight', category: PositiveCategory.healthAndBeauty),
      PositiveAffirmation(id: '58', title: 'Yes I can', category: PositiveCategory.healthAndBeauty),
    ],
    PositiveCategory.abundance: [
      PositiveAffirmation(id: '59', title: 'Abundance flows into my life easily', category: PositiveCategory.abundance),
      PositiveAffirmation(id: '60', title: 'I am a magnet for money', category: PositiveCategory.abundance),
      PositiveAffirmation(id: '61', title: 'I am open and receptive to all the good and abundance in the universe', category: PositiveCategory.abundance),
      PositiveAffirmation(id: '62', title: 'My income keeps increasing', category: PositiveCategory.abundance),
      PositiveAffirmation(id: '63', title: 'Money comes to me easily and frequently', category: PositiveCategory.abundance),
      PositiveAffirmation(id: '64', title: 'Money is constantly coming to me', category: PositiveCategory.abundance),
      PositiveAffirmation(id: '65', title: 'Money comes to me easily and effortlessly', category: PositiveCategory.abundance),
      PositiveAffirmation(id: '66', title: 'I now attract opportunities to receive money', category: PositiveCategory.abundance),
      PositiveAffirmation(id: '67', title: 'Prosperity of every kind is drawn to me', category: PositiveCategory.abundance),
      PositiveAffirmation(id: '68', title: 'I prosper wherever I turn', category: PositiveCategory.abundance),
      PositiveAffirmation(id: '69', title: 'Money flows into my life in an abundant way', category: PositiveCategory.abundance),
      PositiveAffirmation(id: '70', title: 'I am open to the unlimited prosperity that exists everywhere', category: PositiveCategory.abundance),
      PositiveAffirmation(id: '71', title: 'I express gratitude for all the good in my life', category: PositiveCategory.abundance),
      PositiveAffirmation(id: '72', title: 'The laws of attraction brings only good into my life', category: PositiveCategory.abundance),
      PositiveAffirmation(id: '73', title: 'I attract wonderful things in my life', category: PositiveCategory.abundance),
      PositiveAffirmation(id: '74', title: 'I am successful', category: PositiveCategory.abundance),
      PositiveAffirmation(id: '75', title: 'All the money I need is flowing to me now', category: PositiveCategory.abundance),
      PositiveAffirmation(id: '76', title: 'Money is a wonderful friend of mine', category: PositiveCategory.abundance),
      PositiveAffirmation(id: '77', title: 'I am rich, I am prosperous', category: PositiveCategory.abundance),
      PositiveAffirmation(id: '78', title: 'I always have a surplus of prosperity in my life', category: PositiveCategory.abundance),
      PositiveAffirmation(id: '79', title: 'I am open and receptive to new avenues of income', category: PositiveCategory.abundance),
      PositiveAffirmation(id: '80', title: 'I am an unlimited being, accepting from an unlimited world in an unlimited way ', category: PositiveCategory.abundance),
      PositiveAffirmation(id: '81', title: 'I am a magnet for success and happiness', category: PositiveCategory.abundance),
      PositiveAffirmation(id: '82', title: 'I choose to feel worthy and deserving of enormous wealth and power', category: PositiveCategory.abundance),
      PositiveAffirmation(id: '83', title: 'I now release all resistance to money', category: PositiveCategory.abundance),
      PositiveAffirmation(id: '84', title: 'I trust myself', category: PositiveCategory.abundance),
      PositiveAffirmation(id: '85', title: 'The energy of money is always drawn to me', category: PositiveCategory.abundance),
      PositiveAffirmation(id: '86', title: 'I deserve an abundance of prosperity', category: PositiveCategory.abundance),
      PositiveAffirmation(id: '87', title: 'I give and receive joyously', category: PositiveCategory.abundance),
      PositiveAffirmation(id: '88', title: 'Everyday I am attracting and saving more money', category: PositiveCategory.abundance),
      PositiveAffirmation(id: '89', title: 'I am connected to the wisdom of the universe', category: PositiveCategory.abundance),
      PositiveAffirmation(id: '90', title: 'My vibration is always attuned to wealth', category: PositiveCategory.abundance),
      PositiveAffirmation(id: '91', title: 'I am always connected to the energy of money', category: PositiveCategory.abundance),
      PositiveAffirmation(id: '92', title: 'I manage money wisely', category: PositiveCategory.abundance),
      PositiveAffirmation(id: '93', title: 'Yes I can', category: PositiveCategory.abundance),
    ],
    PositiveCategory.love: [
      PositiveAffirmation(id: '94', title: 'I love myself unconditionally', category: PositiveCategory.love),
      PositiveAffirmation(id: '95', title: 'I love and accept myself exactly as I am', category: PositiveCategory.love),
      PositiveAffirmation(id: '96', title: 'I no longer wait to be perfect in order to love myself', category: PositiveCategory.love),
      PositiveAffirmation(id: '97', title: 'I love and approve of myself', category: PositiveCategory.love),
      PositiveAffirmation(id: '98', title: 'Each day I focus on my inner strength', category: PositiveCategory.love),
      PositiveAffirmation(id: '99', title: 'I fill my mind with positive thoughts', category: PositiveCategory.love),
      PositiveAffirmation(id: '100', title: 'My inner strength grows stronger everyday because I practice love', category: PositiveCategory.love),
      PositiveAffirmation(id: '101', title: 'I deserve to enjoy life', category: PositiveCategory.love),
      PositiveAffirmation(id: '102', title: 'I forgive myself', category: PositiveCategory.love),
      PositiveAffirmation(id: '103', title: 'I forgive others', category: PositiveCategory.love),
      PositiveAffirmation(id: '104', title: 'I enjoy life to the fullest', category: PositiveCategory.love),
      PositiveAffirmation(id: '105', title: 'I now release all resistance to love', category: PositiveCategory.love),
      PositiveAffirmation(id: '106', title: 'I am surrounded by love', category: PositiveCategory.love),
      PositiveAffirmation(id: '107', title: 'I radiate love and love fills my life', category: PositiveCategory.love),
      PositiveAffirmation(id: '108', title: 'I am thankful for all the love in my life, I find it everywhere', category: PositiveCategory.love),
      PositiveAffirmation(id: '109', title: 'I respect my boundaries and insist others respect them too', category: PositiveCategory.love),
      PositiveAffirmation(id: '110', title: 'I love the person I see in the mirror', category: PositiveCategory.love),
      PositiveAffirmation(id: '111', title: 'I am constantly surrounded by love', category: PositiveCategory.love),
      PositiveAffirmation(id: '112', title: 'My inner beauty naturally radiates outward', category: PositiveCategory.love),
      PositiveAffirmation(id: '113', title: 'I am always open to receiving money', category: PositiveCategory.love),
      PositiveAffirmation(id: '114', title: 'I draw true love and romance into my life now', category: PositiveCategory.love),
      PositiveAffirmation(id: '115', title: 'I am in a joyous, intimate relationship with a man who truly loves me', category: PositiveCategory.love),
      PositiveAffirmation(id: '116', title: 'I attract only healthy relationships', category: PositiveCategory.love),
      PositiveAffirmation(id: '117', title: 'I am attracting my soul mate into my life', category: PositiveCategory.love),
      PositiveAffirmation(id: '118', title: 'I welcome love with open arms', category: PositiveCategory.love),
      PositiveAffirmation(id: '119', title: 'Love is attracted to me and I am attracted to love', category: PositiveCategory.love),
      PositiveAffirmation(id: '120', title: 'My relationships are always safe and fulfilling', category: PositiveCategory.love),
      PositiveAffirmation(id: '121', title: 'I love the feeling of being in love ', category: PositiveCategory.love),
      PositiveAffirmation(id: '122', title: 'I radiate unconditional love', category: PositiveCategory.love),
      PositiveAffirmation(id: '123', title: 'I am filled with the vibration of love', category: PositiveCategory.love),
      PositiveAffirmation(id: '124', title: 'I am beautiful and worthy of love', category: PositiveCategory.love),
      PositiveAffirmation(id: '125', title: 'I spread love and receive it back many times over', category: PositiveCategory.love),
      PositiveAffirmation(id: '126', title: 'I am grateful for the abundance of love in my life', category: PositiveCategory.love),
      PositiveAffirmation(id: '127', title: 'Love is my birthright', category: PositiveCategory.love),
      PositiveAffirmation(id: '128', title: 'The more I love myself the more love I receive from others', category: PositiveCategory.love),
      PositiveAffirmation(id: '129', title: 'I am open and ready for love', category: PositiveCategory.love),
      PositiveAffirmation(id: '130', title: 'My soul mate is entering my life', category: PositiveCategory.love),
      PositiveAffirmation(id: '131', title: 'I see love, I feel love, I am love', category: PositiveCategory.love),
      PositiveAffirmation(id: '132', title: 'I love deeply and with passion', category: PositiveCategory.love),
      PositiveAffirmation(id: '133', title: 'It is safe for me to be in a loving relationship', category: PositiveCategory.love),
      PositiveAffirmation(id: '134', title: 'Everyday I am become more loving', category: PositiveCategory.love),
      PositiveAffirmation(id: '135', title: 'I am loved for who I am', category: PositiveCategory.love),
      PositiveAffirmation(id: '136', title: 'Love fills my soul with warmth', category: PositiveCategory.love),
      PositiveAffirmation(id: '137', title: 'Yes I can', category: PositiveCategory.love),
    ]
  };

  static Map<String, PositiveAffirmation> personalAffirmations = {};

  static List<CalendarItem> calendar = [];
  static Map<String, CalendarItem> idCalendar = {};
  static Map<DateTime, List<CalendarItem>> dateCalendar = {};

  static void init(){
    Database.init().then(
      (res) {
        var items = Database.getCalendarItems();
        for (var item in items){
          calendar.add(item);
          idCalendar[item.careAffirmation.id] = item;
          calculateDates();
        }
      }
    );
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

  static void addCalendarItem(CalendarItem item){
    calendar.add(item);
    idCalendar[item.careAffirmation.id] = item;
    calculateDates();
    Database.setCalendarItems(calendar);
  }

  static void removeCalendarItem(String affirmationId){
    List<CalendarItem> remove = [];
    for (var item in calendar){
      if (item.careAffirmation.id == affirmationId){
        remove.add(item);
      }
    }
    for (var item in remove){
      calendar.remove(item);
    }
    idCalendar.remove(affirmationId);
    calculateDates();
    Database.setCalendarItems(calendar);
  }

  static void calculateDates(){
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
  }

  static Map<String, CalendarItem> getIdCalendarItems(){
    return idCalendar;
  }

  static Map<DateTime, List<CalendarItem>> getDateCalendarItems(){
    return dateCalendar;
  }

  static void addPersonalAffirmation(PositiveAffirmation affirmation){
    personalAffirmations[affirmation.id] = affirmation;
  }

  static void removePersonalAffirmation(String id){
    personalAffirmations.remove(id);
  }

  static Map<String, PositiveAffirmation> getPersonalAffirmations(){
    return personalAffirmations;
  }

}