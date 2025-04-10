quest main_quest_lv1 begin
    state start begin
        when login or levelup with pc.get_level() >= 1 begin
            set_state(gotoinfomation)
        end
    end

    state gotoinfomation begin
        when letter begin
            send_letter("Bem-vindo ao HardM2!")
        end

        when button or info begin
            say_title("Bem-vindo ao HardM2!")
            say("")
            say("Voc� come�ou o jogo escolhendo um dos Tr�s Reinos.")
            say("Voc� ainda � um guerreiro iniciante. Encontre o Instrutor de Recrutas.")
            say("Ele vai te passar algumas informa��es.")
            say("Agora, por favor, v� encontr�-lo. Ele est� esperando por voc�.")
            say("� de suma import�ncia que voc� fa�a as miss�es.")
            say("Elas lhe dar�o itens importantes para sua evolu��o.")
			say("")
            set_state(gototeacher)
        end
    end

    state gototeacher begin
        when letter begin
            local v = find_npc_by_vnum(20354)
            if 0 == v then
            else
                target.vid("__TARGET__", v, "Encontre o Instrutor de Recrutas.")
            end
        end

        when button or info begin
            say_title("Encontre o Instrutor de Recrutas")
            say("")
            say_reward("Converse com o Instrutor de Recrutas.")
            say_reward("Para encontr�-lo, v� at� o ponto vermelho marcado")
            say_reward("no mapa e clique sobre ele.")
            say("")
        end

        when __TARGET__.target.click begin
            target.delete("__TARGET__")
            say_title("Instrutor de Recrutas:")
            say("")
            say("Bem-vindo � sua nova vila!")
            say("Todos os dias, dezenas de pessoas passam por aqui.")
            say("Voc� tem algum treinamento?")
            say("Parece que n�o!")
            say("Voc� sabe como usar uma arma?")
            say("Ou�a!")
            say("Para sobreviver a esta guerra, voc� deve")
            say("estar sempre alerta.")
            say("No futuro, vou te passar mais informa��es.")
            say("V� e ganhe experi�ncia. Quando atingir o n�vel 10,")
            say("eu te chamarei novamente!")
            say("")
            wait()
            say_title("Instrutor de Recrutas:")
            say("")
            say("Agora v� e cace.")
            say("Ficar parado aqui n�o vai te dar experi�ncia!")

            clear_letter()
            set_state(__COMPLETE__)
            set_quest_state("find_squareguard", "find")
            set_quest_state("main_quest_lv2", "run")
        end
    end

    state __GIVEUP__ begin
    end

    state __COMPLETE__ begin
        when enter begin
            q.done()
        end
    end
end
