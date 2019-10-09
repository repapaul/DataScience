set.seed(1648) # para reprodutibilidade -> random number generator, que mantem os mesmos números randômicos, independente da profundidade
# Teorema do limite central - Central Limit Theorem (CLT)
#

#O Teorema do limite central é uma teoria estatística que afirma que, 
#dado um tamanho de amostra suficientemente grande de uma população 
#com um nível finito de variância, a média de todas as amostras da 
#mesma população será aproximadamente igual à média da população.

clt <- NULL 
n <- 40 # tamanho da amostra
lambda <- 0.2 # lambda = 0.2 

# 40 amostras de distribuição exponencial, repetida mil vezes
for (i in 1:1000) {
      clt <- c(clt, mean(rexp(n, lambda))) 
}

theoretical_mean <- 1/lambda 
theoretical_sd <- (1/lambda)/sqrt(n) 

hist(clt, xlab='Amostra', main="Histograma de médias da amostra de uma Distribuição Exponencial (n=40)", col='beige')
abline(v=mean(clt), lwd=3, col='darkslategray4')
abline(v=theoretical_mean, lwd=3, col='firebrick')
legend(c("Amostra", "Teorético"),x='topright', lwd=c(3,3), col=c('darkslategray4', 'firebrick'))

