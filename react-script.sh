#!/bin/bash

# Check if a folder name is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <project_name>"
    exit 1
fi

PROJECT=$1

# Create project directory
mkdir $PROJECT && cd $PROJECT

# Create directories
mkdir src
mkdir public

# Initialize npm and install dependencies
npm init -y
npm install react react-dom
npm install --save-dev webpack webpack-cli webpack-dev-server html-webpack-plugin babel-loader @babel/core @babel/preset-env @babel/preset-react css-loader style-loader

# Create files
touch webpack.config.js
touch src/index.jsx
touch src/App.jsx
touch src/App.css
touch public/index.html
touch .gitignore
# Setup webpack.config.js
cat <<EOL >webpack.config.js
const path = require('path');
const HtmlWebpackPlugin = require('html-webpack-plugin');

module.exports = {
  mode: 'development',
  entry: './src/index.jsx',
  output: {
    path: path.join(__dirname, '/dist'),
    filename: 'bundle.js'
  },
  module: {
    rules: [
      {
        test: /\.(js|jsx)$/,
        exclude: /node_modules/,
        use: {
          loader: 'babel-loader'
        }
      },
      {
        test: /\.css$/,
        use: ['style-loader', 'css-loader']
      }
    ]
  },
  resolve: {
    extensions: ['.js', '.jsx']
  },
  plugins: [
    new HtmlWebpackPlugin({
      template: './public/index.html'
    })
  ]
};
EOL

# Setup .babelrc
echo '{
  "presets": ["@babel/preset-env", "@babel/preset-react"]
}' > .babelrc

# Setup src/index.jsx
cat <<EOL >src/index.jsx
import React from 'react';
import ReactDOM from 'react-dom';
import App from './App';

ReactDOM.render(<App />, document.getElementById('root'));
EOL

# Setup src/App.jsx
cat <<EOL >src/App.jsx
import React from 'react';
import './App.css';

function App() {
  return (
    <div>
      <h1>Hello, React!</h1>
    </div>
  );
}

export default App;
EOL

# Setup src/App.css
cat <<EOL >src/App.css
body {
  font-family: Arial, sans-serif;
  background-color: #f8f8f8;
  margin: 0;
  padding: 0;
}

h1 {
  color: #333;
}
EOL

# Setup public/index.html
cat <<EOL >public/index.html
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Basic ReactJS Webpage">
  <title>Joshpman Webpage</title>
</head>
<body>
  <div id="root"></div>
</body>
</html>
EOL

#Adding Node Modules into gitignore
cat <<EOL >.gitignore
node_modules
EOL

cd $PROJECT
# Script End
echo "Setup complete! Run your dev server using 'npx webpack serve --open'."
