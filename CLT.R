set.seed(1648) # para reprodutibilidade -> random number generator, que mantem os mesmos n�meros rand�micos, independente da profundidade
# Teorema do limite central - Central Limit Theorem (CLT)
#

#O Teorema do limite central � uma teoria estat�stica que afirma que, 
#dado um tamanho de amostra suficientemente grande de uma popula��o 
#com um n�vel finito de vari�ncia, a m�dia de todas as amostras da 
#mesma popula��o ser� aproximadamente igual � m�dia da popula��o.

clt <- NULL 
n <- 40 # tamanho da amostra
lambda <- 0.2 # lambda = 0.2 

# 40 amostras de distribui��o exponencial, repetida mil vezes
for (i in 1:1000) {
      clt <- c(clt, mean(rexp(n, lambda))) 
}

theoretical_mean <- 1/lambda 
theoretical_sd <- (1/lambda)/sqrt(n) 

hist(clt, xlab='Amostra', main="Histograma de m�dias da amostra de uma Distribui��o Exponencial (n=40)", col='beige')
abline(v=mean(clt), lwd=3, col='darkslategray4')
abline(v=theoretical_mean, lwd=3, col='firebrick')
legend(c("Amostra", "Teor�tico"),x='topright', lwd=c(3,3), col=c('darkslategray4', 'firebrick'))

