var http = require('http');
http.globalAgent.maxSockets = 5;
var regexReadme = /^Demande|Tu|Touj|Non/;
var getHref = /a href="(.*?)"/g;

var bonjour = (hostname, path) => {

	var options = { hostname, path};

	//var allPath = [];

	http.get(options, (res) => {
		let data = '';

		res.on('data', (chunk) => {
			data += chunk;
		})

		res.on('end', () => {
			let link = '';
			while ((link = getHref.exec(data)) != null)
			{
				if (link[1] !== '../' && link[1] !== 'README')
				{
					bonjour(hostname, `${path}${link[1]}`);
				}
				if (link[1] === 'README')
					getREADME(hostname, `${path}${link[1]}`);
			}

		})

		res.on('error', (err) => {
			console.log('err -->', err);
		})
	});
};

var getREADME = (hostname, path) => {

	var options = { hostname, path};

	http.get(options, (res) => {

		let data = '';

		res.on('data', (chunk) => {
			data += chunk;
		})
		res.on('end', () => {
			if (!regexReadme.test(data))
				console.log(data);
			//should append in file
		})
		res.on('error', (err) => {
			console.log('ERROR ---', err);
		})

	})
};

bonjour('10.11.200.246', '/.hidden/');
