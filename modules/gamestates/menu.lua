local suit = require('modules.suit')


local menu = {}

menu = Gamestate.new() -- Menu principal

function menu:draw()
	suit.draw() -- Desenhando os botões
end

function menu:update()

	local buttons = menu:createButtons()
	
	menu:ifButtonsAreHited()
	
end

function menu:createButtons()
	Buttons:createLayout{{ axisx = (halfwidth-60), axisy = (halfheight/2)}, { axisxPadding = 0, axisyPadding = 20}, suit}
	
	local	buttons =  {
		play = Button:createButtonInLayoutRow{"Play Game", suit, {width = 100, height = 90}},
		options = Button:createButtonInLayoutRow{"Options", suit, {width = 100, height = 90}},
		closeGame = Button:createButtonInLayoutRow{"Quit", suit, {width = 100, height = 90}}
	}
	
	return buttons
end

function menu:ifButtonsAreHited()
	
	if buttons.play.hit then
		Timer.after(1, function () Gamestate.switch(static) end) -- Trocando de estado para o static depois de um delay de 1 sec
		
	elseif buttons.options.hit then
		Gamestate.switch(options) -- Trocando para o menu de opções
		
	elseif buttons.closeGame.hit then
		quit = true -- tirando o jogo
		
	else
		text = "Ninguem vai ficar sabendo disso mas você erro os botões, nao acertou nenhum..."
		
	end
	
end


return  menu


