import retinasdk
import os
from dotenv import load_dotenv

load_dotenv()

liteClient = retinasdk.LiteClient(os.getenv("CORTICAL_API_KEY"))

print(liteClient.getKeywords("The second part of J.R.R. Tolkiens epic adventure The Lord of the Rings, illustrated "
                             "in colour by Alan LeeThe Company of the Ring is sundered. Frodo and Sam continue their "
                             "journey alone down the great River Anduin  alone that is, save for a mysterious "
                             "creeping figure that follows wherever they go."))
