shader = dxCreateShader("effect.fx")
textura = dxCreateTexture( "blood.png")

function removeBlood()
	engineApplyShaderToWorldTexture(shader, "sphere")
	engineApplyShaderToWorldTexture(shader, "bloodpool_64")
	dxSetShaderValue (shader, "gTexture", textura)
end

addEventHandler("onClientResourceStart",resourceRoot,removeBlood)