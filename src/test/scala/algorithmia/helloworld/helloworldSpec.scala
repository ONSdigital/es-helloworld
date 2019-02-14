package algorithmia.helloworld

import org.scalatest._

class helloworldSpec extends FlatSpec with Matchers {
  "Initial helloworld algorithm" should "return Hello plus input" in {
    val algorithm = new helloworld()
    "Hello Bob" shouldEqual algorithm.apply("Bob")
  }
}
