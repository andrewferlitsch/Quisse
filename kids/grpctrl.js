
technical.controller( 'grpCtrl', function( $scope, $http, $location, $anchorScroll ) {
	$scope.subject 	= "Groups";
	$scope.name     = "group";
	
	$scope.questions = [{ question: "placeholder 1",
						  answer: "",
						  rank: 1,
						  id: 1
						}
					  ];
	$scope.groups = [ { category: "Animal", sub: "Pet", desc: "Household Pets", list: [ "cat", "dog", "bird" ]
					  },
					  { category: "Animal", sub: "Pet", desc: "Rodent Pets", list: [ "gerbil", "hamster", "guinea pig" ]
					  },
					  { category: "Animal", sub: "Pet", desc: "Bird Pets", list: [ "canary", "parakeet", "parrot" ]
					  },
					  { category: "Animal", sub: "Pet", desc: "Reptile Pets", list: [ "snake", "turtle", "lizard" ]
					  },
					  { category: "Animal", sub: "Farm", desc: "Farm Animals", list: [ "pig", "cow", "chicken" ]
					  },
					  { category: "Animal", sub: "Farm", desc: "Packing Animals", list: [ "horse", "mule", "donkey" ]
					  },
					  { category: "Animal", sub: "Farm", desc: "Herd Animals", list: [ "cattle", "sheep", "llamas" ]
					  },
					  { category: "Animal", sub: "Wild", desc: "Africa Predator Animals", list: [ "lion", "tiger", "leopard" ]
					  },
					  { category: "Animal", sub: "Wild", desc: "Africa Large Animals", list: [ "elephant", "giraffe", "rhinoceros" ]
					  },
					  { category: "Animal", sub: "Wild", desc: "America Predator Animals", list: [ "bear", "wolf", "coyote" ]
					  },
					  { category: "Animal", sub: "Wild", desc: "America Grazing Animals", list: [ "moose", "deer", "antelope" ]
					  },
					  { category: "Fish", sub: "River", desc: "Common River Fish", list: [ "pike", "trout", "catfish"]
					  },
					  { category: "Fish", sub: "River", desc: "Common River/Ocean Fish", list: "salmon", "bass", "sturgeon"]
					  },
					  { category: "Fish", sub: "Ocean", desc: "Common Ocean Fish", list: "tuna", "bluefish", "cod"]
					  },
					  { category: "Fish", sub: "Ocean", desc: "Sea Mammals", list: [ "dolphin", "whale", "sea lion"]
					  },
					  { category: "Fish", sub: "Ocean", desc: "Crustaceans", list: [ "crab", "shrimp", "krill"]
					  },
					  { category: "Fish", sub: "Ocean", desc: "Ocean Predators", list: [ "shark", "orca", "sea snake"]
					  },
					  { category: "Bird", sub: "Wild", desc: "Common Birds", list: "pigeon", "woodpecker", "owl" ]
					  },
					  { category: "Bird", sub: "Wild", desc: "Flightless", list: "ostrich", "emu", "penguin" ]
					  },
					  { category: "Bird", sub: "Wild", desc: "Birds of Prey", list: "hawk", "eagle", "falcon" ]
					  },
					  { category: "Bird", sub: "Wild", desc: "Migrating Birds", list: "geese", "harrier", "duck" ]
					  },
					  { category: "Transportation", sub: "Land", desc: "Public Transport", list: "bus", "train", "street car" ]
					  },
					  { category: "Transportation", sub: "Land", desc: "Personal Transportation", list: "car", "motorcycle", "bike" ]
					  },
					  { category: "Transportation", sub: "Water", desc: "Public Ocean Transport", list: "ferry", "ocean liner", "cruise ship" ]
					  },
					  { category: "Transportation", sub: "Water", desc: "Sailing Ships", list: "sail boat", "yacht", "cutter" ]
					  }
					];
					
	$scope.Size = $scope.groups.length;
	
	$scope.Group = function( level ) {
		var select = Math.random() * $scope.Size;
	}

});