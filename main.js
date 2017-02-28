const {app, BrowserWindow} = require('electron')
const path = require('path')
const url = require('url')

const isNotMac = process.platform !== 'darwin'
const SPLASH_TIME_MS = 2000

let splashWindow, mainWindow


function createSplashWindow () {

	splashWindow = new BrowserWindow({ width: 400, height: 300, frame: false })

	splashWindow.loadURL(url.format({

		pathname: path.join(__dirname, 'splash/index.html'),
		protocol: 'file:',
		slashes: true

	}))

	splashWindow.on('closed', () => {

		splashWindow = undefined

	})

	setTimeout(() => {

		if( splashWindow !== undefined) {

			splashWindow.close()

			createMainWindow()

		}

	}, SPLASH_TIME_MS)

}

function createMainWindow () {

	mainWindow = new BrowserWindow({ width: 800, height: 600 })

	mainWindow.loadURL(url.format({

		pathname: path.join(__dirname, 'main/index.html'),
		protocol: 'file:',
		slashes: true

	}))

	mainWindow.openDevTools()

	mainWindow.on('closed', () => {

		mainWindow = undefined

	})

}

app.on('ready', createSplashWindow)

app.on('window-all-closed', () => {

	if (isNotMac) {
		app.quit()
	}

})

app.on('activate', () => {

	if (splashWindow === undefined && mainWindow == undefined) {
		createSplashWindow()
	}

})