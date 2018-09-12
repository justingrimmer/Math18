#Plot for HW 5 Answers

bo <- seq(from=0,to=1.5,length=1000)
b1 <- seq(from=0,to=.15, length=1000)
pdf(file="hw6answers.pdf", width=7.5, height=5,)
par(mar=c(4,5,4,1))
plot(x=bo,y=b1, type='n', main="Multiple Pairs of Parameter Estimates Minimize Squared Error", xlim=c(0,1.5), xlab=expression(beta[0]), ylab=expression(beta[1]), cex.lab=1.5)
lines(x=c(0,1), y=c(.1,0))
points(x=0,y=.1, pch=16)
points(x=1,y=0, pch=16)
dev.off()
