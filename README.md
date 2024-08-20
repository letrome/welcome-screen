# Welcome Screen Script

This script is designed to customize your terminal's welcome screen, displaying essential system information such as the hostname, IP address, uptime, and the number of users connected. The information is formatted and centered for easy readability, with customizable colors and additional services information.

## Features

* **Customizable Prompt (`PS1`)**: Modify your terminal prompt's color based on your preference.
* **Centered Text Display**: Displays the hostname, services, and system information in a centered format.
* **Uptime Information**: Shows how long the system has been up, along with the number of users currently connected.
* **IP Address Display**: Displays the primary IP address of the machine.
* **Custom Color Selection**: Allows you to choose a color for the text display.

## Requirements

* **Bash**: The script is designed to run in a Bash shell.
* **figlet**: Used for generating large ASCII text for the hostname and services. Install it using:
```bash
sudo apt-get install figlet
```
* **tput**: Used to dynamically determine the terminal width for centering text.

## Usage

### 1. Script Configuration

The script uses three primary variables:

* **color** (mandatory): This variable sets the color of the terminal prompt and the welcome screen text. Possible values include `black`, `red`, `green`, `yellow`, `blue`, `magenta`, `cyan`, and `light gray`.
* **services_line_1** (optional): This variable allows you to specify services or information to be displayed on the welcome screen. It can be a comma-separated list of services.
* **services_line_2** (optional): This variable allows you to specify additional services or information to be displayed on the welcome screen. It can be a comma-separated list of services.

### 2. Script Execution

To run the script, simply execute it in your terminal:

```bash
./welcome_screen.sh
```

Ensure that the script has execution permissions. If not, you can set them using:

```bash
chmod +x welcome_screen.sh
```

Alternatively, add this line in your `~/.bashrc`:

```bash
source welcome_screen.sh
```

We suppose here that the script is located in the user home folder, in the same folder than the .bashrc. Adjust the path to the script if this is not the case.

### 3. Customizing the Welcome Screen

* **Changing the Color**: Modify the `color` variable at the top of the script to your preferred color.
* **Adding Services**: Modify the `services_line_1` and `services_line_2` variables to include a list of services you want to display. These will be centered on the welcome screen.

### 4. Functions

* **get_color**: Converts the color name into a corresponding terminal color code. 
* **build_ps1**: Constructs a custom prompt (`PS1`) using the selected color.
* **center_text**: Centers the provided text on the terminal screen.
* **trim**: Trims leading and trailing whitespace from strings.
* **build_welcome_screen**: Main function that constructs and displays the welcome screen, including the hostname, services, uptime, and IP address.

## Example

Here's an example of what the welcome screen might look like:
* with **host**= `"Examplehost"`
* with **services_line_1**= `"service1, service2"`
* with **services_line_2**= `"service3, service4"`
* with **color**= `"green"`
* with **uptime**= `"22:02:42 up 4 days,  3:59,  1 user,  load average: 0,95, 0,73, 0,79"`
* with **ip address**= `"192.168.1.37"`

```bash
          ____     ______                           _      _               _       ____
          \ \ \   |  ____|                         | |    | |             | |     / / /
           \ \ \  | |__  __  ____ _ _ __ ___  _ __ | | ___| |__   ___  ___| |_   / / / 
            > > > |  __| \ \/ / _` | '_ ` _ \| '_ \| |/ _ \ '_ \ / _ \/ __| __| < < <  
           / / /  | |____ >  < (_| | | | | | | |_) | |  __/ | | | (_) \__ \ |_   \ \ \ 
          /_/_/   |______/_/\_\__,_|_| |_| |_| .__/|_|\___|_| |_|\___/|___/\__|   \_\_\
                                             | |                                       
                                             |_|                                       
             __                    _        _                     _        ___    __
             \ \   ___ ___ _ ___ _(_)__ ___/ |    ___ ___ _ ___ _(_)__ ___|_  )  / /
              > > (_-</ -_) '_\ V / / _/ -_) |_  (_-</ -_) '_\ V / / _/ -_)/ /  < < 
             /_/  /__/\___|_|  \_/|_\__\___|_( ) /__/\___|_|  \_/|_\__\___/___|  \_\
                                             |/                                     
             __                    _        ____                    _        _ _     __
             \ \   ___ ___ _ ___ _(_)__ ___|__ /    ___ ___ _ ___ _(_)__ ___| | |   / /
              > > (_-</ -_) '_\ V / / _/ -_)|_ \_  (_-</ -_) '_\ V / / _/ -_)_  _| < < 
             /_/  /__/\___|_|  \_/|_\__\___|___( ) /__/\___|_|  \_/|_\__\___| |_|   \_\
                                                                                                               |/                                      
                    =========================================================
                    1 user connected ▬▬▬ up since 4 days, 3 hours, 59 minutes
                                         ip: 192.168.1.37
                    =========================================================
```

## License

This script is provided "as-is," without warranty of any kind. Feel free to modify and distribute it according to your needs.
