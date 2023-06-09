rm -r src/globalTheme.ts

echo "Adding tailwindcss, postcss and autoprefixer as a dependency"
npm install -D tailwindcss postcss autoprefixer

cat <<EOT > src/main.tsx
import * as React from 'react';
import * as ReactDOM from 'react-dom/client';
import App from './App';
import './index.css';

ReactDOM.createRoot(document.getElementById('root') as HTMLElement).render(
	<React.StrictMode>
		<App />
	</React.StrictMode>,
);

EOT

echo "Init tailwind config file"
cat <<EOT > tailwind.config.js
/** @type {import('tailwindcss').Config} */

export default {
	content: ['./index.html', './src/**/*.{js,ts,jsx,tsx}'],
	theme: {
		extend: {},
	},
	plugins: [],
};

EOT

cat <<EOT > tailwind.config.js
/** @type {import('tailwindcss').Config} */

export default {
	content: ['./index.html', './src/**/*.{js,ts,jsx,tsx}'],
	theme: {
		extend: {},
	},
	plugins: [],
};

EOT

cat <<EOT > postcss.config.js
export default {
	plugins: {
		tailwindcss: {},
		autoprefixer: {},
	},
};

EOT

cat <<EOT > .eslintrc.cjs
module.exports = {
	env: {
		browser: true,
		es2021: true,
	},
	extends: [
		'airbnb-base',
		'airbnb-typescript',
		'airbnb/hooks',
		'plugin:react/recommended',
		'plugin:@typescript-eslint/recommended',
		'prettier',
	],
	overrides: [],
	parser: '@typescript-eslint/parser',
	parserOptions: {
		ecmaFeatures: {
			tsx: true,
		},
		ecmaVersion: 'latest',
		sourceType: 'module',
		project: [
			'./tsconfig.json',
			'./tsconfig.node.json',
			'./postcss.config.js',
			'./tailwind.config.js',
		],
	},
	plugins: ['react', '@typescript-eslint'],
	settings: {
		react: { version: 'detect' },
		'import/resolver': {
			alias: {
				map: [
					['@components', './src/components'],
					['@hooks', './src/hooks'],
					['@images', './src/assets/images'],
					['@utils', './src/utils'],
					['@context', './src/context'],
					['@public', './public'],
				],
				extensions: ['.js', '.ts', '.jsx', '.tsx'],
			},
		},
	},
	rules: {
		'react/react-in-jsx-scope': 0,
		'import/no-extraneous-dependencies': 'off',
	},
};

EOT

cat <<EOT > tsconfig.json
{
	"compilerOptions": {
		"target": "ESNext",
		"useDefineForClassFields": true,
		"lib": ["DOM", "DOM.Iterable", "ESNext"],
		"allowJs": false,
		"skipLibCheck": true,
		"esModuleInterop": false,
		"allowSyntheticDefaultImports": true,
		"strict": true,
		"forceConsistentCasingInFileNames": true,
		"module": "ESNext",
		"moduleResolution": "Node",
		"resolveJsonModule": true,
		"isolatedModules": true,
		"noEmit": true,
		"jsx": "react-jsx",
		"paths": {
			"@components/*": ["./src/components/*"],
			"@hooks/*": ["./src/hooks/*"],
			"@images/*": ["./src/assets/images/*"],
			"@utils/*": ["./src/utils/*"],
			"@context/*": ["./src/context/*"]
		}
	},
	"include": [
    ".eslintrc.cjs",
    "./postcss.config.js",
    "./tailwind.config.js",
    "src"
  ],
	"references": [{ "path": "./tsconfig.node.json" }]
}

EOT

cat <<EOT > src/components/Hello.tsx
import sayHello from '@utils/index';

const Hello = () => <h1>{sayHello('Hello world')} !!!</h1>;

export default Hello;

EOT


EOT

echo "Add the Tailwind directives to your CSS"
cat <<EOT > src/index.css
/* global css */

@tailwind base;
@tailwind components;
@tailwind utilities;

EOT

echo "✅ ✅ TailwindCss ui is now ready to use ✅ ✅"
