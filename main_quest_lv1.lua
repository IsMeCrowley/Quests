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
            say("Você começou o jogo escolhendo um dos Três Reinos.")
            say("Você ainda é um guerreiro iniciante. Encontre o Instrutor de Recrutas.")
            say("Ele vai te passar algumas informações.")
            say("Agora, por favor, vá encontrá-lo. Ele está esperando por você.")
            say("É de suma importância que você faça as missões.")
            say("Elas lhe darão itens importantes para sua evolução.")
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
            say_reward("Para encontrá-lo, vá até o ponto vermelho marcado")
            say_reward("no mapa e clique sobre ele.")
            say("")
        end

        when __TARGET__.target.click begin
            target.delete("__TARGET__")
            say_title("Instrutor de Recrutas:")
            say("")
            say("Bem-vindo à sua nova vila!")
            say("Todos os dias, dezenas de pessoas passam por aqui.")
            say("Você tem algum treinamento?")
            say("Parece que não!")
            say("Você sabe como usar uma arma?")
            say("Ouça!")
            say("Para sobreviver a esta guerra, você deve")
            say("estar sempre alerta.")
            say("No futuro, vou te passar mais informações.")
            say("Vá e ganhe experiência. Quando atingir o nível 10,")
            say("eu te chamarei novamente!")
            say("")
            wait()
            say_title("Instrutor de Recrutas:")
            say("")
            say("Agora vá e cace.")
            say("Ficar parado aqui não vai te dar experiência!")

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
