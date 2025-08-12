# E-commerce Sprints App

A Flutter-based e-commerce application with localization support (English & Arabic) featuring product listings, shopping cart functionality, user authentication, and promotional offers.

## Features

- **Multi-language Support**: English and Arabic localization
- **User Authentication**: Login and Signup screens with form validation
- **Product Display**: Grid view of fashion products with images, ratings, and prices
- **Image Slider**: Auto-scrolling banner with titles and descriptions
- **Promotional Offers**: Highlighted deals and discounts
- **Responsive Design**: Adapts to different screen sizes
- **Animations**: Smooth transitions between screens and interactive elements

## Screens

1. **Welcome Screen**: Language selection and entry point to login/signup
2. **Login Screen**: Email/password authentication with validation
3. **Signup Screen**: User registration form
4. **Home Screen**: Main product browsing interface with:
   - Image slider
   - Product grid
   - Special offers section

## Technical Details

- **State Management**: Basic setState for simple state management
- **Localization**: EasyLocalization package for multilingual support
- **Networking**: Image loading from network URLs with error handling
- **Animations**: Built-in Flutter animation controllers

## Assets

The project includes custom assets in the `assets` folder:

- **Fonts**: 
  - Suwannaphum (custom font family used throughout the app)
  
- **Images**:
  - Sample  images
 


## Folder Structure

```
lib/
  screens/
    home_screen.dart       # Main product screen
    homeScreen_detils.dart # Product card component
    login.dart             # Login screen
    sign_up.dart           # Signup screen
    welcome_screen.dart    # Welcome/language selection screen
  main.dart                # App entry point
assets/
  images/                  # Local image assets
  fonts/                   # Custom font files
lang/
  en-US.json               # English translations
  ar-EG.json               # Arabic translations
```

## Localization

The app supports two languages:
- English (en-US)
- Arabic (ar-EG)

Translations are managed in JSON files in the `lang` directory.

## Future Improvements

- Add proper state management solution (Provider, Riverpod, Bloc)
- Implement persistent cart functionality
- Add product detail screens
- Integrate with a real backend API
- Add more languages
- Implement dark mode
<img width="1440" height="3120" alt="Screenshot_1755006317" src="https://github.com/user-attachments/assets/cc127484-27bc-4c30-aa32-cebb603d3850" />
<img width="1440" height="3120" alt="Screenshot_1755006189" src="https://github.com/user-attachments/assets/76f4fe14-6d9e-42de-aaab-7b01b80a4c8a" />
<img width="1440" height="3120" alt="Screenshot_1755006419" src="https://github.com/user-attachments/assets/0b24be98-41fb-444f-b696-3c8fdee4faae" />
<img width="1440" height="3120" alt="Screenshot_1755006399" src="https://github.com/user-attachments/assets/670cd5bb-9699-441e-b817-3a77d7657d3f" />
<img width="1440" height="3120" alt="Screenshot_1755006388" src="https://github.com/user-attachments/assets/001f6630-84dd-41a4-9d9e-91b16fc9094e" />
<img width="1440" height="3120" alt="Screenshot_1755006355" src="https://github.com/user-attachments/assets/5471a66e-4b12-4200-9684-d9e3b7ccfa67" />
<img width="1440" height="3120" alt="Screenshot_1755006343" src="https://github.com/user-attachments/assets/89a81d23-0a15-4291-b0fd-e8660a713c56" />
<img width="1440" height="3120" alt="Screenshot_1755006331" src="https://github.com/user-attachments/assets/0e5cdcfa-2b3b-4abd-a61f-13b167e10a84" />

## Screenshots

