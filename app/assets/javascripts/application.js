// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

var secret_sharing_k = 3;
var secret_sharing_n = 5;

function RSA_Sign(post_key, email)
{
	var message = bigInt(post_key,16);	
	var r = SHA256(bigInt.randBetween("-1e100", "1e100").toString(10));
	var g = bigInt(SHA256(r),16); 
	var x = g.xor(message).toString(16);
	var h = bigInt(SHA256(x),16);
	var y = bigInt(r,16).xor(h);
	message = new bigInt(x +""+ y.toString(16), 16).toString(16);
	var encrypted = bigInt(message,16).modPow(bigInt(sessionStorage.getItem(email+"d")),bigInt(sessionStorage.getItem(email+"n"))).toString(10);	
	return encrypted;
}

function RSA_Verify(post_key, public_key, signature)
{
	var x1 = bigInt(signature).modPow(bigInt("3"),bigInt(public_key));	
	var message = x1.toString(16);
	var y = message.substring(64);
	var	x = message.substring(0,64);
	var r = bigInt(SHA256(x),16).xor(bigInt(y,16)).toString(16);
	var message = bigInt(x,16).xor(bigInt(SHA256(r),16)); 	
	return (message.toString(16) == post_key);
}

function generate_random_number(max_int)
	{
		return Math.floor(Math.random() * (max_int + 1));
	}

var prime_secret_sharing = (bigInt("2").pow(bigInt("256"))).subtract(bigInt("189"));		
function give_polynomial(k, n, secret)
{	
	if (k <= 2)
		return ["Not Possible"];
	
	coefficients = [];
	
	for (i = 0; i < (k - 1); i ++)
	{
		coefficients.push(bigInt.randBetween(0, prime_secret_sharing.toString(10)).toString(10));
	}
	coefficients.push(secret);
	coordinates = [];
	
	for(i = 1; i < n + 1; i++)
	{
		result = bigInt("0");
		var x = bigInt(i + "");
		for (j = 0; j < k; j ++)
		{
			result = result.multiply(x);
			result = result.add(bigInt(coefficients[j],10));
			result = result.mod(prime_secret_sharing);
		}
		
		coordinates.push([i, result.toString(10)]);
	} 
	
	return coordinates;
	
}	


function retrieve_secret(k_coordinates)
{
	
	result = bigInt("0");
	for (i = 0; i < k_coordinates.length; i ++)
	{
		numerator = bigInt("1");
		denominator = bigInt("1");
		
		term = bigInt(k_coordinates[i][1]);
		
		for (j = 0; j < k_coordinates.length; j++)
		{
			if (i == j)
			continue;
			
			numerator = numerator.multiply(k_coordinates[j][0] + "");
			denominator = denominator.multiply((k_coordinates[j][0] - k_coordinates[i][0]) + "");
			
		}
		
		denominator = denominator.modInv(prime_secret_sharing.toString(10));
		term = term.multiply(numerator).mod(prime_secret_sharing.toString(10));
		term = term.multiply(denominator).mod(prime_secret_sharing.toString(10));
		result = result.add(term.toString(10));		
	}
	return result.mod(prime_secret_sharing.toString(10)).toString(16);
	
}

function reveal(a, type_id)
{
	var data_returned;
	var data_to_sent = {post_id: a, type: type_id};
		$.ajax({
            	url: '/give_numbers',
            	type: 'POST',
            	datatype: 'text',
				data: data_to_sent,
				async: false,
				success: function (data_returned_by_server) {
				
				data_returned = data_returned_by_server;
            	
        		},
        		error: function (result) {
            		console.log('error');
        		}
			
            });
            
            key = retrieve_secret(data_returned.slice(1, secret_sharing_k + 1));
            
            return cryptico.decryptAESCBC(data_returned[0], key);            
				
	
}




	
