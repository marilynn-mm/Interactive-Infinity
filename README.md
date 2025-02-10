# Interactive-Infinity
Interactive Infinity is an AI-driven narrative game featuring procedurally generated infinite rooms, AI-powered NPCs with evolving personalities, and real-time player interactions. The game is built using GameMaker Studio and leverages HTTP requests to dynamically generate dialogue responses. It explores the potential of AI in storytelling, creating a unique, immersive player experience.

## Core Systems 
### AI-driven NPC & Player interactions 
NPCs generate real-time responses via a ChatGPT-4o API using the function sendgpt(global.system, message), with responses stored in global.return_message. NPC personalities evolve dynamically based on past interactions, ensuring contextual and engaging dialogue through memory management.

Players interact with NPCs through a chatbox, where input is processed and integrated into the NPC's evolving personality and dialogue. The same API-driven process ensures contextualized responses, optimizing real-time interactions through efficient API calls and response handling.

Networking and API calls facilitate seamless real-time dialogue generation. HTTP requests manage interactions with the external API, while responses are parsed and mapped to game variables. Server latency and rate limits are handled to maintain smooth, uninterrupted communication between players and NPCs.

### Procedural Room
Infinite rooms are dynamically generated, each featuring unique randomized items to ensure unpredictable player experiences. This system leverages object-oriented design, dictionary-based item storage, grid-based generation, and dynamic instance management to create a seamless procedural generation system.

Each room is constructed using a grid-based structure, where the room dimensions are divided into a grid (ds_grid_create(width_, height_)). The grid tracks floor, walls, and object placement. A for-loop iterates through this grid, randomly assigning room elements while ensuring logical layouts by avoiding blocked paths or overlapping structures.

This system utilizes prewritten dictionaries (maps) to define possible room structures, environmental elements, and item pools. A for-loop iterates through predefined templates, selecting and placing elements randomly from the dictionaries to ensure variety while maintaining logical room layouts.

### Item Generation & Management
Items objects are stored in a dictionary (global.items), where keys represent item IDs and values hold item descriptions (e.g., "O_item_1": "Handle - Color: Purple"). To ensure efficient access and mapping, an additional dictionary (global.item_object_map) links item keys to their corresponding object references (e.g., ds_map_add(global.item_object_map, "O_item_1", o_item1)).

When an item is needed, three random selections are made and stored in global.item1, global.item2, and global.item3. Their attributes (names, descriptions, object references) are accessed dynamically via dictionary lookups (global.item#.key). Descriptions are stored in global.Object1_Description, global.Object2_Description, and global.Object3_Description, ensuring that item details are generated and retrieved through HTTP request in real-time.

Items follow a parent-child inheritance structure, where all items inherit from o_itemParent to reduce redundant code.

Dynamic objects are instantiated using instance_create_layer(), which spawns interactive elements in real-time based on player encounters. Collision detection via place_meeting() ensures that interactions trigger only when the player is within range. To optimize resource usage, objects are removed when no longer needed using instance_destroy();.

## Future Improvement 

- Expansion of NPC Memory: Implement long-term interaction tracking to enhance NPC personality evolution. Store key player decisions to influence future dialogues and behaviors.

- Game Puzzle: Introduce puzzle-solving mechanics to enrich gameplay. Design interconnected rooms where players must uncover clues to progress. Incorporate AI-driven hints that adapt based on player actions.

Enhanced Procedural Generation: Increase room variety by integrating more dynamic environmental elements. Implement multi-layered procedural storytelling where each room contributes to an overarching narrative.

- Improved AI Dialogue System:Introduce tone and personality sliders to customize NPC responses. Enhance contextual memory so NPCs recall past conversations across multiple sessions.
