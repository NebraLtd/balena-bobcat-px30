deviceTypesCommon = require '@resin.io/device-types/common'
{ networkOptions, commonImg, instructions } = deviceTypesCommon

module.exports =
	version: 1
	slug: 'bobcat-px30'
	name: 'Bobcat PX30'
	arch: 'aarch64'
	state: 'released'
	community: true

	instructions: commonImg.instructions

	gettingStartedLink:
		windows: 'https://www.balena.io/docs/learn/getting-started/bobcat-px30/nodejs/'
		osx: 'https://www.balena.io/docs/learn/getting-started/bobcat-px30/nodejs/'
		linux: 'https://www.balena.io/docs/learn/getting-started/bobcat-px30/nodejs/'

	yocto:
		machine: 'bobcat-px30'
		image: 'balena-image'
		fstype: 'balenaos-img'
		version: 'yocto-thud'
		deployArtifact: 'balena-image-bobcat-px30.balenaos-img'
		compressed: true

	options: [ networkOptions.group ]

	configuration:
		config:
			partition:
				primary: 1
			path: '/config.json'

	initialization: commonImg.initialization
