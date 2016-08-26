#Hooks= Un bloque de codigo que se ejecuta despues o antes de que algo sucede(parecido a callbacks)


#Se ejecita despues de que se guarda o define el usuario
Warden::Manager.after_set_user do |user,auth,opts|
	
	auth.cookies.signed["user.id"] = user.id
	auth.cookies.signed["user.expired_at"] = 30.minutes.from_now
end


#Se ejecuta antes que se destruya la sesión del usuario
Warden::Manager.before_set_user do |user,auth,opts|
	auth.cookies.signed["user.id"] = nil
	auth.cookies.signed["user.expired_at"] = nil
end