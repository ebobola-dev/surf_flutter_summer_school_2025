import 'package:surf_flutter_summer_school_2025/assets/resources.dart';

class OnboardingData {
  final String imagePath;
  final String description1;
  final String description2;

  const OnboardingData({
    required this.imagePath,
    required this.description1,
    required this.description2,
  });
}

const onboardingData = [
  OnboardingData(
    imagePath: Images.onboarding1,
    description1: 'Добро пожаловать\nв Путеводитель',
    description2: 'Ищи новые локации и сохраняй\nсамые любимые.',
  ),
  OnboardingData(
    imagePath: Images.onboarding2,
    description1: 'Построй маршрут\nи отправляйся в путь',
    description2: 'Достигай цели максимально\nбыстро и комфортно.',
  ),
  OnboardingData(
    imagePath: Images.onboarding3,
    description1: 'Добавляй места,\nкоторые нашёл сам',
    description2: 'Делись самыми интересными\nи помоги нам стать лучше!',
  ),
];
