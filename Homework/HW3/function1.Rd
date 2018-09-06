xvals <- seq(from=0, to=10, by=.1)

crazyplot <- function(input){
	output <- input^2 + 10 - sqrt(input)
	return(output)
}

outs <- crazyplot(xvals)

plot(x=xvals, y=outs, type='l', ylab="g(x)", xlab="x", las=1, xaxt='n', yaxt='n', ylim=c(-8,140))
axis(side=2, at=0)
abline(h=0, lty=2)

plot(x=xvals, y=rep(-2, length=length(xvals)), type='l', las=1, xaxt='n', yaxt='n', ylab="g'(x)", xlab='x', ylim=c(-4,2))
axis(side=2, at=0)
abline(h=0, lty=2)

plot(x=xvals, y=rep(2, length=length(xvals)), type='l', las=1, xaxt='n', yaxt='n', ylab="g'(x)", xlab='x', ylim=c(-2,4))
axis(side=2, at=0)
abline(h=0, lty=2)

crazyplot.derivative <- function (input){
	output <- 2*input - (1/2)*sqrt(input)
}

outs.derive <- crazyplot.derivative(xvals)

plot(x=xvals, y=outs.derive, type='l', ylab="g'(x)", xlab="x", las=1, xaxt='n', yaxt='n', ylim=c(-8,20))
axis(side=2, at=0)
abline(h=0, lty=2)

plot(x=xvals, y=outs.derive-5, type='l', ylab="g'(x)", xlab="x", las=1, xaxt='n', yaxt='n', ylim=c(-8,20))
axis(side=2, at=0)
abline(h=0, lty=2)

#Example Graphs

pdf(file="examples.pdf", width=8, height=6)
par(mfrow=c(2,2), mar=c(4,4,4,1))

plot(x=xvals, y=rep(-2, length=length(xvals)), type='l', las=1, xaxt='n', yaxt='n', ylab="g'(x)", xlab='x', ylim=c(-4,2), main="A")
axis(side=2, at=0)
abline(h=0, lty=2)

plot(x=xvals, y=rep(2, length=length(xvals)), type='l', las=1, xaxt='n', yaxt='n', ylab="g'(x)", xlab='x', ylim=c(-2,4), main="B")
axis(side=2, at=0)
abline(h=0, lty=2)

plot(x=xvals, y=outs.derive, type='l', ylab="g'(x)", xlab="x", las=1, xaxt='n', yaxt='n', ylim=c(-8,20), main="C")
axis(side=2, at=0)
abline(h=0, lty=2)

plot(x=xvals, y=outs.derive-5, type='l', ylab="g'(x)", xlab="x", las=1, xaxt='n', yaxt='n', ylim=c(-8,20), main="D")
axis(side=2, at=0)
abline(h=0, lty=2)

dev.off()

#Function 2 graph
plot(x=xvals, y=2*xvals + 3, type='l', ylab="g(x)", xlab="x", las=1, xaxt='n', yaxt='n', ylim=c(-8, 30))
axis(side=2, at=0)
abline(h=0, lty=2)


