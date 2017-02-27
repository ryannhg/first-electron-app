const {app, BrowserWindow} = require('electron')
const path = require('path')
const url = require('url')
const isNotMac = process.platform !== 'darwin'

let win

function createWindow () {

	win = new BrowserWindow({ width: 800, height: 600 })

	win.loadURL(url.format({

		pathname: path.join(__dirname, 'index.html'),
		protocol: 'file:',
		slashes: true

	}))

	win.on('closed', () => {

		win = undefined

	})

}

app.on('ready', createWindow)

app.on('window-all-closed', () => {

	if (isNotMac) {
		app.quit()
	}

})

app.on('activate', () => {

	if (win === undefined) {
		createWindow()
	}

})