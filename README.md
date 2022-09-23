

# Enviro Bank App

Enviro bank App is a Loan Application developed to provide loans to customers with valid information. This application was developed for Enviro bank Limited.


## Features

- Loan Request
- Loan History
- Remitted Loan History
- Paystack payment
- User Authentication


## Deployment

To deploy this project follow the steps below:

### Step 1: Clone or download repository with the link provided below

```bash
  https://github.com/fatimaujunwa/enviroBankLimited
```

### Step 2: Install all dependencies; run the following code on terminal

```bash
  flutter pub get
```

### Step 1: Run  application from terminal

```bash
  flutter run
```
## Flutter Plugins Used

- get:
- shared_preferences:
- flutter_screenutil:
- google_fonts:
- smooth_page_indicator:
- dropdown_button2:
- flutter_paystack:
# Screenshots

<p float="left">
  <img src="https://user-images.githubusercontent.com/113392997/191732449-e1a8bbdc-103e-40c7-8dfa-663a372afa25.png" width="200" /> 
    <img src="https://user-images.githubusercontent.com/113392997/191743974-4b9d2914-1af9-47d0-a6d1-7dc72d28dd60.png" width="200" />
  
  <img src="https://user-images.githubusercontent.com/113392997/191742553-71900b98-5ba8-4f20-bf82-90402c0be740.png" width="200" />
    <img src="https://user-images.githubusercontent.com/113392997/191742325-297abe9e-c8e9-49b0-afaa-a3917b1b86dd.png" width="200" />
  <img src="https://user-images.githubusercontent.com/113392997/191744083-70b9ef41-ea36-439f-b01a-6c684a10865f.png" width="200" />

  <img src="https://user-images.githubusercontent.com/113392997/191740345-84550320-4202-41dd-b175-33cbc46ce72f.png" width="200" />
<img src="https://user-images.githubusercontent.com/113392997/191740334-e29c24b7-6d82-4edb-9831-34c2e692df65.png" width="200" />

</p>

# Folder Structure

```bash
  lib
   |-- controllers
   |   |-- loan_controller.dart
   |   |-- user_controller.dart
   |-- data
   |   |-- api
   |   |   |-- api_client.dart
   |   |-- repository
   |   |   |-- loan_repo.dart
   |   |   |-- user_repo.dart
   |-- helper
   |   |-- dependencies
   |   |   |-- dependencies.dart
   |   |-- logic
   |   |   |-- payment.dart
   |   |   |-- validation.dart
   |   |-- routing
   |   |   |-- route_helper.dart
   |-- main.dart
   |-- models
   |   |-- bank_account.dart
   |   |-- loan_application_model.dart
   |   |-- loan_application_response.dart
   |   |-- loan_model.dart
   |   |-- token_model.dart
   |   |-- user_model.dart
   |   |-- validation_response_model.dart
   |-- pages
   |   |-- authentication
   |   |   |-- sign_in_screen.dart
   |   |   |-- sign_up_screen.dart
   |   |-- home
   |   |   |-- home_screen.dart
   |   |   |-- loan_container_widget.dart
   |   |   |-- tab_bar_widget.dart
   |   |-- loan 
   |   |   |-- loan_form_screen.dart
   |   |-- onboarding
   |   |   |-- first_onboarding_screen.dart
   |   |   |-- second_onboarding_screen.dart
   |   |-- splash page
   |   |   |-- splash_screen.dart
   |-- utils
   |   |-- app_colors.dart
   |   |-- app_constants.dart
   |   |-- text_dimensions.dart
   |-- widgets
   |   |-- blue_container.dart
   |   |-- custom_dialogue_box.dart
   |   |-- custom_drop_down_menu.dart
   |   |-- custom_snackbar.dart
   |   |-- custom_text_field.dart
   |   |-- custome_dialogue_box_two.dart
   |   |-- dot_indicator_widget.dart
   |   |-- google_container.dart
   |   |-- logo_container.dart
   |   |-- onboarding_screen_template.dart
   |   |-- remit_widget.dart
   |   |-- remitted_widget.dart
   |   |-- sign_in_sign_out_screen_template.dart
pubspec.lock
pubspec.yaml
test
   |-- widget_test.dart

```


