`Pre requirey - install NodeJS and NVM for the localhost `

# How to add NodeJs to the Jenkins#
1. => Plugins search for the NodeJS
2. => Tools => NodeJs add installer
    2.1 write down name of the install as `NodeJS-20.10`
    2.2 pick NodeJs 20.10.0 from the dropdown
    2.3 save

# Manually run pacman on the localhost

1. Pacman Git repository - `https://github.com/masonicGIT/pacman`
2. `git clone https://github.com/masonicGIT/pacman`
3. `npm install next`
4. `nmp install`
5. `npm run build`
6. `npm run dev`

# Run pacman on the Jenkins
1. create and empty pipeline
2. use pipeline from the Lesson_14 copy-paste in to the jenkins
3. run pipeline

# Enjoy pacman on the ${Jenkins_Public_Ip}:3000 #