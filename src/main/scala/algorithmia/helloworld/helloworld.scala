package algorithmia.helloworld

import com.algorithmia._
import com.algorithmia.algo._
import com.algorithmia.data._
import com.google.gson._

class helloworld {
  def apply(input: String): String = {
    "Hello " + input
  }
}
