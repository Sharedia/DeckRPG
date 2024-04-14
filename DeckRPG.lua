function printChatMessage(msg)
    if IsInRaid() then
        SendChatMessage(msg,"RAID")
    elseif IsInGroup() then
        SendChatMessage(msg, "PARTY")
    else
        SendChatMessage(msg)
    end
end

SLASH_SHADICE1 = '/carta';
SlashCmdList["SHADICE"] = function(msg, editbox)
    local situacion=math.random(1,6)
    local estadistica=math.random(1,7)
    local resolucion=math.random(1,6)
    local numero="patata"
    local bonus= "potato"
    local combate = false
    
    local array2 = {} --situación
    local array3 = {} --Exito
    local array4 = {} --resolución
    

    array2[1]="Una prueba de "
    array2[2]="Una situación en la que que premia el uso de "
    array2[3]="Una situación ciertamente ventajosa en "
    array2[4]="Una situación con cierta desventaja en "
    array2[5]="Una situación inesperada, puede que relacionada con "
    array2[6]="Combate"
    


    array3[1]="carisma"
    array3[2]="sigilo"
    array3[3]="inteligencia"
    array3[4]="fuerza"
    array3[5]="destreza"
    array3[6]="percepción"
    array3[7]="resistencia"
    array3[8]=""

    array4[1]=", con posibilidad de combate"
    array4[2]=", con posibilidad de obtener algo importante para la historia"
    array4[3]=", que puede acabar mal o en un giro de guión"
    array4[4]=", que puede empeorar la situación general de la historia o los personajes"
    array4[5]=", que puede mejorar la situación general de la historia o los personajes"
    array4[6]=", con posibilidad de conseguir un aliado o enemigo"
    array4[7]=""
    
    if situacion == 6 then
        --combate
        combate=true
    end

   
    if combate == true then
        
        estadistica=8
        resolucion=7
        combate=false
    end
   
    printChatMessage(array2[situacion]..array3[estadistica]..array4[resolucion])
end

SLASH_DADO1 = '/dado';
SlashCmdList["DADO"] = function(msg, editbox)
    local positivo=math.random(0,6)
    local negativo = math.random(0,6)
    local resultado = positivo-negativo
    local array5 = {}
    local modificador=math.random(1,6)
    local array6 = {}
    local conjuncion = ",pero, "

    array5[-6]="Todo se te sale de control y la situación empeora"
    array5[-5]="No solo te sale mal, sino que afectas a tus compañeros negativamente"
    array5[-4]="Fallas, pero por suerte las cosas no empeoran más"
    array5[-3]="Fallas"
    array5[-2]="Fallas"
    array5[-1]="Fallas"
    array5[0]="Null"
    array5[1]="Éxito"
    array5[2]="Éxito"
    array5[3]="Éxito"
    array5[4]="Logras tu cometido, pero, sin ningún añadido"
    array5[5]="No solo lo consigues, sino que tus compañeros salen beneficiados"
    array5[6]="Todo sale a pedir de Milhouse, puede que mejorando la situación"

    if resultado==0 then
        printChatMessage("0")
        local destino=math.random(1,2)
        if destino ==1 then
            resultado=-1
        else 
            resultado=1
        end

    end

    if resultado >=4 or resultado <=-4 then
        modificador=7
    end
    if resultado <=3 and resultado >=1 and modificador <=3 then
        conjuncion=" y "
    elseif resultado >=-3 and resultado <=-1 and modificador >=4 then
        conjuncion=" y "
    end
  

    array6[1]="te ves beneficiado"
    array6[2]="beneficias a uno o varios compañeros"
    array6[3]="la situación se pone de vuestro lado"
    array6[4]="te ves perjudicado"
    array6[5]="perjudicas a uno o varios compañeros"
    array6[6]="la situación se tuerce y empeora"
    array6[7]=""
    printChatMessage(array5[resultado]..conjuncion..array6[modificador])

end



SLASH_FALLAR1 = '/fallar';
SlashCmdList["FALLAR"] = function(msg, editbox)
    local negro=math.random(1,6)
    local array6 = {}
    printChatMessage("Pifia")

    array6[1]="(+1 negro) Todo sale según lo planeado, puede que incluso mejor"
    array6[2]="(+2 negro) No solo sale bien, sino que afectas a tus compañeros (si les salió mal seguirá pasando, pero, al menos contribuirás a que no sea tan malo)"
    array6[3]="(+3 negro) Todo sale a pedro de Milhouse, puede que mejorando la situación"
    array6[4]="(+4 negro) Logras tu cometido, pero, muy por los pelos"
    array6[5]="(+5 negro) Las cosas no salieron como pensaste, pero, logras tu objetivo de alguna manera"
    array6[6]="(+6 negro) Has tenido mala suerte y tu acción falla"
    printChatMessage(array6[negro])
end


local f = CreateFrame("Frame", nil, UIParent, "BackdropTemplate")
f:SetPoint("CENTER",600,400)
f:SetSize(210, 60)
f:SetBackdrop(BACKDROP_TUTORIAL_16_16)

f:SetMovable(true)
f:EnableMouse(true)
f:RegisterForDrag("LeftButton")
f:SetScript("OnDragStart", function(self, button)
	self:StartMoving()
	print("OnDragStart", button)
end)
f:SetScript("OnDragStop", function(self)
	self:StopMovingOrSizing()
	print("OnDragStop")
end)







--BOTON
local btn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
btn:SetPoint("CENTER",-50,0)
btn:SetSize(100, 40)
btn:SetText("Situación")
btn:SetScript("PostClick", function(self, button, down)
    local editbox=ChatEdit_ChooseBoxForSend(DEFAULT_CHAT_FRAME);--  Get an editbox
    ChatEdit_ActivateChat(editbox);--   Show the editbox
    editbox:SetText("/carta");-- Command goes here
    ChatEdit_OnEnterPressed(editbox);-- Process command and hide (runs ChatEdit_SendText() and ChatEdit_DeactivateChat() respectively)


end)
btn:RegisterForClicks("AnyDown")
-------------------------------------------------------------------------------------------------------------------------------
local btn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
btn:SetPoint("CENTER",50,0)
--btn:SetMovable(true)
--btn:RegisterForDrag("LeftButton")
--btn:SetScript("OnDragStart", btn.StartMoving)
--btn:SetScript("OnDragStop", btn.StopMovingOrSizing)
btn:SetSize(100, 40)
btn:SetText("Resolución")
btn:SetScript("PostClick", function(self, button, down)
    local editbox=ChatEdit_ChooseBoxForSend(DEFAULT_CHAT_FRAME);--  Get an editbox
    ChatEdit_ActivateChat(editbox);--   Show the editbox
    editbox:SetText("/dado");-- Command goes here
    ChatEdit_OnEnterPressed(editbox);-- Process command and hide (runs ChatEdit_SendText() and ChatEdit_DeactivateChat() respectively)


end)
btn:RegisterForClicks("AnyDown")

