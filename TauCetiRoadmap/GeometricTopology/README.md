# Roadmap: geometric topology

**Summary.** This roadmap builds the geometric topology of manifolds that Mathlib does not yet
have, from the smooth-manifold and tangent-bundle level upwards: manifolds with boundary and
their collars, gluing along boundary faces, handle attachment, connected sums and tubular
neighbourhoods (Layer 1); locally flat embeddings and the annulus theorem (Layer 2);
diffeomorphism groups with the weak Whitney topology, isotopy extension and the Smale
conjecture (Layer 3); knots and links in a general manifold with their presentations,
invariants and minima (Layer 4); Dehn surgery (Layer 5); knot concordance (Layer 6);
hyperbolic structures, volume and Mostow rigidity (Layer 7); the prime and JSJ
decompositions and the statement of geometrization (Layer 8); Heegaard splittings
(Layer 9); taut foliations, the Euler class of an oriented plane bundle and the Thurston norm
(Layer 10); and triangulations, PL structures and collapse
(Layer 11). Each layer is a reusable library in its own right. The end theorems are the
resolved problems of Kirby's list that these primitives make statable: the Smale conjecture
and its four-dimensional failure, the annulus theorem, Freedman's topological slice theorem,
Levine's theorem that a knot in a homology sphere bounding a contractible manifold need not be
homology concordant to a knot in `S³`, Mostow rigidity, Agol's virtual fibering and virtual
Haken theorems, the JSJ theorem, geometrization and the Poincaré conjecture, Li's rank-versus-genus examples, the minimality
of the Weeks manifold, Property P and Manolescu's non-triangulable manifolds, together with
Alexander's sphere theorem, the knot-group theorem and the Gordon–Luecke theorem.
`Suggested.lean` states all of these against the pinned libraries, together with Property R, the
cyclic surgery theorem and the Kneser–Milnor prime decomposition, and four classical theorems of
low-dimensional topology that the layers prove and the pins make statable: Radó's and Moise's
triangulation theorems, the sphere theorem and Waldhausen's theorem.
It also states Markov's theorem on braid words and oriented PD-codes, Mathieu's chirally cosmetic
theorem, the Gordon–Luecke theorem in its filling form (no filling of the exterior of a nontrivial
knot in `S³` along a slope other than the meridian is homeomorphic to `S³`), Agol's virtual Haken
theorem for closed aspherical `3`-manifolds, Manolescu's theorem for closed connected manifolds, Thurston's Euler
class inequality on closed irreducible `3`-manifolds with its closed hyperbolic form, and Yazdi's
theorem that infinitely many closed hyperbolic `3`-manifolds violate Thurston's Euler class one
conjecture.

## Scope and ownership

This roadmap owns the following, by layer.

- **Layer 1.** Smooth collars of boundaries as data, complements of embedded balls, gluing
  along codimension-zero boundary faces, handle attachment, the cut-and-glue description of the
  pinned connected sum with its associativity, fundamental group and Euler characteristic, the
  uniqueness of tubular neighbourhoods up to isotopy and the retraction of a tube onto its core,
  the relative triangulation and smoothing comparison
  of compact surfaces, the smooth classification of compact surfaces (Layer 1.7), and their
  mapping class groups with Dehn twists and Lickorish's twist theorem (Layer 1.7.2); the
  comparison of the topological, PL and smooth categories in dimension two is Layer 11.2.1's.
  It also owns `C^k` collars of compact boundaries (Layer 1.1), the tubular-neighbourhood data
  `TauCeti.IsTubularNeighborhood` of a `C^k` embedding in a manifold with the complement of a
  tube (Layer 1.5), and PL manifolds through charts (Layer 1.6), with the compatibility of the
  pinned forgetful map from PL to topological manifolds with the smooth-to-PL passage of Layer
  11.3, and, with Layer 11.3, the comparison of the pinned PL groupoid with the PL structures of
  combinatorial manifolds.
- **Layer 2.** The structural theory of locally flat embeddings beyond what Tau Ceti has at
  the pins (composition and codimension-one collaring), Brown's generalized Schoenflies
  theorem, and the statement of the annulus theorem in every dimension.
  It also owns the three boundary variants of local flatness, the link-pair criterion for local
  flatness of PL embeddings, Brown's separating-hypersurface theorem, the topological collar
  theorem and the comparison of the pinned collaring theorems with Brown's global theorem for
  compact boundaries (Layer 2.1), and it names
  the topological normal bundles of locally flat submanifolds (Kirby–Siebenmann, *Foundational
  Essays*, Essay IV) as the input of the high-dimensional proof of the annulus theorem, which
  GeometricTopology, Part II builds.
- **Layer 3.** The comparison of the weak topology on `Diff(M)` with the Whitney and
  compact-open topologies, the restriction fibration, isotopy extension for continuous families
  and relative to an open set, the disc theorem for balls with different centres, the classical
  cases `Diff(S¹) ≃ O(2)` and `Diff(S²) ≃ O(3)`, `Γ₄ = 0` from Cerf's theorem, and the statement of
  the Smale conjecture.
  It also owns the relative groups `Diff(M, ∂M)` with their topology, the orientation-preserving
  subgroup and the degree (Layers 3.1 and 3.2), the comparison of the pinned orientation-free form
  of Cerf's theorem with `π₀(Diff⁺(S³)) = 0` (Layer 3.4), and the statements of Cerf's theorem and
  Watanabe's theorem on their pinned carriers.
- **Layer 4.** Knot and link theory in a general manifold and in `S³`: the geometric
  presentation and its combinatorial presentations (diagrams, braid closures, polygons), the
  equivalence relations of each and the Reidemeister, Alexander and Markov theorems comparing
  them; the smooth geometric braid carrier, the reading of a braid word off a generic
  projection, the based Artin action and the faithfulness of braids among relative tangles
  (Layer 4.2.8; the identification of strand systems with the presented braid group is
  ReductiveGroups §11A's); Seifert surfaces, the Alexander module and polynomial, the Conway,
  Jones, HOMFLY and Kauffman polynomials, Fox colourings and the determinant, the knot and
  proper-link Arf invariant, fourth-root evaluations and the integral W quotient; the finite
  nonsingular `F₂` quadratic Arf algebra and its Seifert-form dictionary (Layer 4.3.1; consumed
  by TangentialBordism and FourManifolds); the finite algebraic even-Clifford model of the
  Temperley–Lieb algebra at `δ = √2` (the even Clifford algebra `Cl_m⁰` with its ordered-monomial
  basis, the scalar trace `s_m`, the surjection `F_m` from `TL_m` with kernel the trace radical
  and the induced radical quotient, the coordinate inclusions and the braid phases) and the
  Jones–Arf comparison built on it (Layer 4.5.3); TemperleyLiebOperatorAlgebras §1.7 consumes
  this finite model and adds the analytic adjoint, the identification with Subfactors §3.3's
  positive Jones quotient `Q_n`, the matrix blocks, the tower and the order of the braid image;
  positive-trace kernel and
  braid-index criteria (Layer 4.5.6, which consumes Jones's positivity theorem, the trace
  radical and the positive Jones quotients from Subfactors §§3.1–3.3 and adds only the
  faithfulness of the trace on all of `TL_n` at `δ = 2cos(π/k)` for `k ≥ n + 2`), and the
  nonexchange families with the five-strand cubic/Burau comparison (Layer 4.5.7); the genus,
  crossing, unknotting, bridge
  and braid-index minima, prime decomposition of knots and of non-split links, rational tangles
  and two-bridge knots, torus knots and satellites, the Garside structure of braid groups, the
  Morton–Franks–Williams bound, Kondo's realization theorem and exponential bounds on the
  number of knot types.
  It also owns the comparison of the pinned Gauss-code and PD-code presentations (Layer 4.2), the
  Seifert matrix of a diagram (Layer 4.4) and the agreement of the pinned Alexander, Jones and
  HOMFLY routes (Layers 4.4–4.6).
- **Layer 5.** The smooth structure and isotopy invariance of the pinned link exterior, the
  uniqueness, smoothness and homology of Dehn fillings, surgery on framed links, the
  Lickorish–Wallace theorem, Moser's classification of the lens-space surgeries on torus knots,
  Mathieu's chirally cosmetic family (its first member being the pinned proposition), the Montesinos
  trick, Scharlemann's theorem that unknotting-number-one knots are prime, the statements of
  Property P, Property R and the cyclic surgery theorem, and the Kanenobu–Murakami criterion
  derived from the cyclic surgery theorem as stated.
  It also owns knot and link exteriors as compact manifolds with boundary (Layer 5.1); the
  identification of the pinned preferred longitude with the boundary of a Seifert surface, the
  completion of the pinned well-definedness of Dehn filling through the isotopy classification of
  torus homeomorphisms of Layer 1.7.2, the smooth structure and diffeomorphism type of a filling
  and the `1/n` identities on the unknot (Layer 5.2); the statement of the Gordon–Luecke theorem
  in its filling form (Layer 5.3); and the statement of the classification of the pinned lens
  spaces with the proof of its sufficiency (Layer 5.4.2).
- **Layer 6.** Smooth and topological concordance of knots, the concordance group, the
  Levine–Tristram signatures and their concordance invariance, the vanishing of Layer 4.3.1's
  knot Arf invariant on smoothly and topologically slice knots and its concordance invariance
  (Layer 6.2.1), torus-knot signatures and
  chirality, the signature bound on the unknotting number, Conway mutation and the statement
  that it does not preserve smooth concordance, the statement of Levine's theorem on
  winding-number-one satellite operators with the proof of its reduction to knots in homology
  spheres bounding no disc with conical singularities, hence to the pinned
  `TauCeti.LevineHomologyConcordanceTheorem`, and, assuming the PL smoothing input stated there,
  bounding no PL disc (Layer 6.4), and the statement of Freedman's theorem.
  It also owns the bounds `g_s^{top} ≤ g_s ≤ g` between the slice genera and the Seifert genus
  (Layer 6.1), and link cobordisms with the slice genus inequalities, among them
  `|σ(K₀, ω) − σ(K₁, ω)| ≤ 2g` for a cobordism of genus `g` between knots (Layer 6.5).
- **Layer 7.** Hyperbolic manifolds, Mostow rigidity and the finite-volume Mostow–Prasad
  theorem in dimension three with their volume and isometry-group consequences, Thurston's
  smooth measure homology with Löh's isometric comparison to singular homology, through the
  bounded cohomology of spaces and its duality principles, and the
  proportionality of simplicial volume and hyperbolic volume (Layer 7.2), the
  Margulis and cusp theory, the hyperbolicity of the pinned Weeks manifold and the statement of
  its minimality, and the statements of the virtual fibering and virtual Haken theorems.
  It also owns the total Riemannian volume with its invariance, its scaling and the volumes of the
  standard models (Layer 7.1), and the uniqueness and first homology of the pinned Weeks manifold,
  the isometric form of its minimality through Mostow rigidity and the elementary relations
  between fibering over the circle, Haken manifolds and finite covers (Layer 7.4).
- **Layer 8.** The sphere theorem, Dehn's lemma and the loop theorem, the proofs of the pinned
  Kneser and Milnor prime-decomposition propositions, Kneser's finiteness, incompressible and normal surfaces, the Haken hierarchy,
  Waldhausen's theorem on homotopy equivalences of closed Haken manifolds, the Seifert
  fibration API, and the statements of the Gordon–Luecke theorem, the JSJ theorem,
  geometrization and the Poincaré conjecture, the statement of the relative JSJ theorem
  for compact manifolds with torus boundary (Layer 8.5.1), and the reduction of the rigidity of
  prime-knot groups to that relative JSJ theorem and the cyclic surgery theorem of Layer 5.4
  (Layer 8.5.2).
  It also owns irreducibility against primeness (`S¹ × S²` is the only closed orientable prime
  `3`-manifold that is not irreducible) and the free-product decomposition of `π₁` along a prime
  decomposition (Layer 8.2), and the comparison of the pinned geometric torus decomposition with
  Thurston's formulation through the eight model geometries (Layer 8.6).
- **Layer 9.** The existence, gluing-map description and stabilization of the pinned Heegaard
  splittings, the Reidemeister–Singer theorem, Waldhausen's theorem on splittings of `S³`, the
  genus-zero and genus-one classifications and the additivity of the Heegaard genus under
  connected sum, and the statement of Li's theorem.
  It also owns the boundary surface and the handle description of the pinned handlebody, and the
  non-orientable handlebodies with the Heegaard splittings and Heegaard genus of non-orientable
  closed `3`-manifolds (Layers 9.1 and 9.2).
- **Layer 10.** Codimension-one transversely oriented foliations of 3-manifolds, Reeb
  components, Reeb stability, the Novikov–Rosenberg theorem and the existence of foliations
  on closed orientable 3-manifolds.
  It also owns the smooth closed transversals of taut foliations (Layer 10.1); the rank-two Thom
  class and the Euler class of an oriented plane bundle with the obstruction-theoretic description
  of the pinned Euler class, and the Euler class of a transversely oriented foliation with its
  pairing on embedded surfaces (Layer 10.3); the Thurston norm of a closed oriented `3`-manifold,
  its dual norm and the comparison of the pinned Euler class inequality with the dual norm (Layer
  10.4); and the parity of the Euler classes of plane fields and the deduction of the pinned
  closed hyperbolic forms from the general ones, with the statements of the general (irreducible)
  form of Thurston's inequality, Gabai's realization theorem, the Euler class one conjecture and
  Yazdi's infinite family (Layer 10.5).
- **Layer 11.** Geometric realization of simplicial complexes beyond the pinned API (stellar
  subdivision of infinite complexes and the geometric join laws of faces), the triangulation
  theorem and Hauptvermutung in dimension three; in dimension two, the existence and uniqueness up
  to isotopy of smooth
  structures on topological surfaces, Radó's theorem, the two-dimensional Hauptvermutung
  and the comparison of smooth and topological isotopy of surface diffeomorphisms
  (Layer 11.2.1); the converse of the pinned theorem that combinatorial manifolds are PL
  manifolds, hence their equivalence, the existence of smooth triangulations in every
  dimension and uniqueness of smoothings in dimension at most three, the statement of Manolescu's
  theorem and the statement of Zeeman's conjecture.
  It also owns compact subsets of realizations and the cellular chain complex of a polyhedron
  (Layer 11.1), Moise's theorem in PL form in dimensions at most three (Layer 11.2), the
  uniqueness of the PL structure
  induced by a smooth triangulation (Layer 11.3), and the statement of the connected form of
  Manolescu's theorem (Layer 11.4).

This roadmap leaves the following to other roadmaps.

- **Mathlib and Tau Ceti** already have, at the pins, the carriers listed under *Exact supplier
  contracts*: the model geometries and geometric structures, hyperbolic metrics and their
  volumes, locally flat embeddings and Brown's bicollaring theorem, the diffeomorphism group
  with its weak Whitney topology, smooth embeddings and their intrinsic normal bundles, the
  tubular neighbourhood theorem, isotopy extension on compact sets, the homogeneity lemma and
  the disc theorem, connected sums with their independence of the balls, prime manifolds,
  knot and link exteriors, Dehn fillings and surgery on framed spheres, the cosmetic-surgery
  predicates, the Weeks manifold, handlebodies, Heegaard splittings and the Heegaard genus with
  the rank bound, the topological slice genus, homology cobordisms and the homology concordance
  of knots in homology spheres, the Euler class of a foliation, Sard's theorem in its flat and its
  boundaryless-manifold forms, the Jordan curve theorem and the Schoenflies theorem in the
  plane and on the `2`-sphere, slopes and framed boundary tori, the CW structure of a
  simplicial realization and its transport along homeomorphisms, the PL structure of a
  combinatorial manifold, the smooth-triangulation predicate, products of PL manifolds and the
  compact PL comparison on coordinate spaces,
  Seifert fibrations, the sphere-bounds-a-ball condition, JSJ and geometric torus
  decompositions, Haken and virtually Haken manifolds, mapping tori, the PL groupoid,
  simplicial realization, combinatorial manifolds, collapse, triangulability, and the
  propositions naming the Smale conjecture, Cerf's theorem, Watanabe's theorem, the annulus
  conjecture, Freedman's theorem, Levine's homology-concordance theorem, Mostow rigidity, the
  virtual fibering and virtual Haken conjectures, the JSJ theorem, geometrization, Kneser's and Milnor's prime decomposition
  theorems, Mathieu's first chirally cosmetic pair, the theorem of Gabai, Meyerhoff and Milley,
  Li's theorem, the triangulation conjecture and Zeeman's conjecture. None
  of these is planned again here; each is cited by name where it is used.
  The same holds for the Riemannian volume measure and the curvature tensors (Layer 7 consumes
  `TauCeti.riemannianVolume` with `TauCeti.HyperbolicMetric` and `TauCeti.hypVolume`); the
  lens spaces `L(p, q) = TauCeti.LensSpace p ![1, q]` with their analytic manifold structure,
  their fundamental group `ℤ/p`, the invariance of `p` under homeomorphism, their spherical
  geometric structure and the `p/q`-surgery on the unknot inside them (Layer 5.2 proves on that
  carrier the unoriented surgery description `S³_U(p/q) ≃ₜ L(p, q)`, and Layer 8.6 consumes the
  spherical structure); the oriented connected sum with its commutativity, its independence of the
  balls and `M # Sⁿ ≃ M` (Layers 1.4 and 8.2); Cerf's theorem in its two-component form and its
  derivation from the Smale conjecture (Layer 3.4); the framing number, the preferred framing, the
  surgery coefficients of a link, the Ni–Wu and Hanselman cosmetic surgery theorems, the
  Akbulut–Kirby conjecture and Yasui's theorem (Layer 5); the Whitehead link with the Weeks
  manifold as its `5, 5/2` filling (Layer 7.4); the standard handlebodies, the rank inequality and
  Waldhausen's rank-versus-genus conjecture (Layer 9); and tautness through `C¹` closed
  transversals, the leaves of a foliation, the Thom pair, Thom classes and Euler class of a vector
  bundle and of the tangent field of a foliation, the Euler class inequality on embedded surfaces,
  and the propositions naming Thurston's inequality, the Euler class one conjecture and Yazdi's
  theorem in their closed hyperbolic forms (Layer 10).
- **DifferentialGeometry** owns faces of manifolds with corners, flows, involutive
  distributions and the Frobenius theorem, integration of forms, smooth singular chains with the
  smoothing theorem comparing them with singular chains, Stokes' formula for smooth simplices
  and chains, Riemannian metrics and the existence of a smooth metric. Layer 7.2 keeps only the
  `ℓ¹` norm estimates for that smoothing which Löh's isometric comparison needs. **HopfRinow**
  owns the Levi-Civita connection, geodesics, the exponential map, normal neighbourhoods and the
  Hopf–Rinow theorem.
- **CharacteristicClasses** C2 owns the Thom isomorphism and the Euler classes of oriented bundles
  of every rank beyond the pinned `TauCeti.eulerClass`. Layer 10.3 consumes the pinned Euler class
  in rank two and owns the rank-two Thom class of an oriented plane bundle and the
  obstruction-theoretic description of its Euler class; C2 compares its rank-two restriction with
  that plane construction, so Layer 10.3 consumes nothing of C2.
- The handle calculus of compact cobordisms (the ordered handle decomposition of a Morse
  function as a structure, reordering, creation and cancellation of handle pairs, handle
  slides and the same-index basis change, the local Whitney move, and Whitney discs in
  codimension at least three and on the five-dimensional level) is not a target of this
  roadmap, and no layer uses it: Layer 1.7 iterates only Layer 1.3.1's elementary handle
  step over the critical points of a Morse function on a surface. **MorseTheory** owns the Morse theory of
  functions on boundaryless manifolds and of their compact bands, and **HeegaardFloer** the
  generic Morse functions of Morse homology; both consume this roadmap, and Layer 1.3.1 takes
  the boundaryless results from Tau Ceti directly.
- Layer 1.7.2 is the single owner of the mapping class groups of compact surfaces, their Dehn
  twists with the sign convention pinned there, and Lickorish's theorem:
  **MordellLawrenceVenkatesh** (LV.5, §§5.9–5.12, whose punctured surfaces and marked points are
  its own) and **TeichmullerGeometry** (Layer 3.1) take them from Layer 1.7.2 and compare
  homeomorphism with diffeomorphism classes through Layer 11.2.1. MordellLawrenceVenkatesh's
  positive twist turns left, which is `T_c⁻¹` in Layer 1.7.2's convention (a Check there).
  **TypeAHeckeAlgebras** owns the Hecke algebras and the Ocneanu trace. **TemperleyLieb** owns the
  Temperley–Lieb diagram category and linear category, the Temperley–Lieb algebras over a
  commutative ring, their diagram basis, the uniqueness of the Markov trace, the cellular
  semisimplicity theory and the Jones–Wenzl projections with their recursion and traces;
  **Subfactors** owns the analytic adjoint of `TL_n(ℂ, δ)`, Jones's positivity theorem, the trace
  radical and the positive Jones quotients with their C*-tower (§§3.1–3.3). **SuccessiveMinima**
  owns the successive minima of a discrete full lattice for a convex body and their attainment by a
  real basis of lattice vectors; Layer 7.3.1 uses the first two minima of a cusp lattice for the
  closed unit disc of `ℂ` and adds only the two-dimensional facts that the two witnesses form a
  `ℤ`-basis and the treatment of ties.
- **Proofs of the end theorems owned elsewhere.** The proof of geometrization, hence of the
  Poincaré conjecture, is Ricci-flow analysis (RicciFlow); Poincare3D, which consumes this
  roadmap, owns the Ricci-surgery proof of the Poincaré theorem and states its smooth forms,
  including Mathlib's `ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere M 3` (Layer 8.6). The proof of Freedman's theorem is
  the disc embedding theorem in dimension four (FourManifolds), which also owns the
  dimension-four case of the annulus theorem and the existence of normal bundles for
  locally flat surfaces in topological four-manifolds stated in Layer 2.1. Manolescu's theorem is proved by
  Pin(2)-equivariant Seiberg–Witten Floer homology, Watanabe's theorem by configuration-space
  integrals, and Agol's theorems by the theory of special cube complexes; their proofs are the
  work of later roadmaps. This roadmap states these theorems against its carriers and owns
  every topological reduction named in the layers below.
  The `E₈` manifold (Freedman's closed simply connected topological `4`-manifold with
  intersection form `E₈`) and Casson's theorem that it is not triangulable belong to the topology
  of four-manifolds; this roadmap states nothing on that manifold, and Layer 11.2 cites it from the
  literature, as a Check, for why its theorems carry a dimension bound.
- **GeometricTopology, Part II** starts where this roadmap stops, at the statements and
  carriers of the end theorems, and owns their proofs that this roadmap does not: Cerf's
  theorem and Hatcher's proof of the Smale conjecture (from Layers 3.1–3.3), the cyclic
  surgery theorem (from Layers 5.2 and 8, through the Culler–Shalen theory of essential
  surfaces at ideal points of the character variety), Thurston's hyperbolic Dehn surgery theorem
  stated in Layer 7.3 (from Layers 5.2 and 7.1–7.3, through the deformation space of the holonomy
  of the compact core near the complete structure, Thurston, Theorem 5.6 and Lemma 5.8.1, and
  Mostow–Prasad rigidity), the Gordon–Luecke theorem with its
  corollary on `S³` fillings (from Layers 5 and 8.1), and the JSJ theorem, including its
  compact torus-boundary relative extension stated in Layer 8.5.1 (from Layers 8.1–8.4 and
  11.2). It also owns the developments that consume roadmaps downstream of this one: the torus
  trick and the high-dimensional proof of the annulus theorem (surgery on homotopy tori and
  the Kirby–Siebenmann obstruction), topological microbundles, the TOP/PL
  comparison and the smoothing theory beyond dimension three, including the smoothing of
  collared PL discs in smooth `4`-manifolds to discs with conical singularities stated in
  Layer 6.4; the Lee deformation of Khovanov
  homology and Rasmussen's invariant with the Conway-knot and zero-shake-genus applications
  (Piccirillo, *The Conway knot is not slice*, Proposition 1.4 and Theorem 1.5; Kirby's Problem
  1.41 for the shake genus);
  the connected-sum and descent comparison for the grid invariant of CombinatorialHeegaardFloer;
  the proof of Levine's theorem on satellite operators stated in Layer 6.4, through Hom's `ε`
  and the `τ` and `ε` formulas for Mazur satellites on the knot Floer complexes of
  HeegaardFloer and CombinatorialHeegaardFloer (`τ` and the bound `|τ(K)| ≤ g_s(K)` are
  CombinatorialHeegaardFloer Lane G, items 7 and 10); the Thurston seminorm beyond the integral
  surface minimum of Layer 5.4.1 and beyond the Thurston norm of a closed oriented `3`-manifold
  and its dual norm, which are Layer 10.4's, and the proofs of
  Thurston's Euler class inequality and of Yazdi's Euler-class-one counterexamples, whose
  closed hyperbolic statements and the Euler class of a foliation are Tau Ceti's and whose general
  statements are Layer 10.5's, with the proofs of the polyhedrality of the Thurston unit ball, of
  the singular-surface form of the norm (Gabai) and of Gabai's realization theorem, which Layers
  10.4 and 10.5 state;
  the constructive hyperbolization of closed Haken manifolds; disc bundles, clutching, plumbing and
  intersection forms; and sphere-target transversality with the Pontryagin–Thom
  construction. It also owns the proofs of two theorems that Layers 4.8.3 and 5.4.2 state and
  consume as stated: the necessity half of the classification of lens spaces (by the
  Reidemeister–Franz torsion of 5.4.2's cellular complex of the cyclic cover, on MorseNovikov's
  based cellular torsion, or by the uniqueness up to isotopy of the torus splitting a lens space
  into two solid tori) and Kawamura's theorem `u(10₁₃₉) = 4` (through the Seiberg–Witten
  adjunction inequality). Those developments need AlgebraicTopology,
  CharacteristicClasses, GeneralizedCohomology, TopologicalKTheory, MorseTheory, MorseNovikov,
  RiemannianGeometry, KhovanovHomology, CombinatorialHeegaardFloer, HeegaardFloer,
  TeichmullerGeometry, TangentialBordism or FourManifolds, every one of which consumes this
  roadmap.
- **The Milnor conjecture** `u(T(p, q)) = g₄(T(p, q)) = (p − 1)(q − 1)/2` for coprime
  `p, q ≥ 1`, which 4.8.3 consumes as stated, is CombinatorialHeegaardFloer's: its end goal v1,
  through Lane G, items 7 (`|τ(K)| ≤ u(K)` and `τ(T(p, q))`) and 10 (`|τ(K)| ≤ g_s(K)`), carried
  to Layer 4's knots by its Lane K. That roadmap consumes this one, so it is not a supplier here.
- **The Kirby–Siebenmann theorem** belongs to the TOP/PL comparison of GeometricTopology, Part II:
  a closed topological manifold `M` of dimension at least five has a PL structure exactly when its
  class `ks(M) ∈ H⁴(M; ℤ/2)` vanishes, the PL structures up to concordance then forming a torsor
  under `H³(M; ℤ/2)` (Kirby–Siebenmann, *Foundational Essays*, Essays IV and V). Its statement
  needs the stable tangent microbundle of a topological manifold, the classifying spaces `BTOP`
  and `BPL` and the obstruction to lifting the classifying map, which exist neither at the pins
  nor in any roadmap this one cites. This roadmap states the comparison of structures that needs
  no obstruction class (Layers 1.6, 11.2 and 11.3: dimension at most three, through Moise's
  theorem); Part II, which consumes those layers, builds the
  stable tangent microbundle, `BTOP` and `BPL` and owns the Kirby–Siebenmann theorem, and that is
  where FourManifolds' contract `gap:tangent-microbundle-stable-classifier` is addressed.
- **Knot tables and computation.** Tabulated volumes, knot tables and finite enumerations are
  not targets. Small computed values appear only as Checks on the definitions they test.
- **Recorded at the pin, not targets.** Yasui's theorem `TauCeti.YasuiTheorem`, the negation of
  the Akbulut–Kirby conjecture `TauCeti.AkbulutKirbyConjecture` (Kirby's Problem 1.19), and the
  Ni–Wu and Hanselman cosmetic surgery theorems `TauCeti.NiWuCosmeticSurgeryTheorem` and
  `TauCeti.HanselmanCosmeticSurgeryTheorem` are named in Layer 5.3, which claims nothing about
  them: their proofs rest on Heegaard Floer invariants of the kind GeometricTopology, Part II
  takes from HeegaardFloer and CombinatorialHeegaardFloer. Waldhausen's rank-versus-genus
  conjecture `TauCeti.RankGenusConjecture` is recorded at the pin and refuted by Li's theorem
  (Layer 9.2). Kirby's Problem 4.82 (a smooth structure on `(⋆ℝP⁴) # (⋆ℂP²)`), which Kirby's
  remarks record as unresolved, is not a target.

## Conventions

- **A manifold is a type with instances.** A manifold is a type `M` with `TopologicalSpace M`,
  `ChartedSpace H M` and `IsManifold I n M`; constructions produce such a type with its
  instances and are compared by `Diffeomorph` or `Homeomorph` in theorem statements, never
  through a quotient type of manifolds. A *closed* manifold is compact without boundary; a
  theorem about closed manifolds carries `CompactSpace`, `T2Space` (or `MetricSpace`) and
  `SecondCountableTopology` (or `T3Space` with Mathlib's charted-space second countability)
  explicitly, since `IsManifold` alone supplies none of them. Connectedness and
  nonemptiness are explicit hypotheses wherever a theorem needs them.
- **Named conditions are predicates.** Closed, orientable, irreducible, hyperbolic, prime,
  Haken are predicates or typeclasses on a manifold, never bundled into a new carrier.
  Orientations, framings and base points are data passed as arguments.
  The pinned predicates include `TauCeti.IsClosedConnectedManifold n M`,
  `TauCeti.IsCompactConnectedThreeManifold M`, `TauCeti.Orientable I M`, `TauCeti.IsHyperbolic`
  and `TauCeti.IsSphereBoundsBall M`.
- **Dimensions.** `𝓡 n` is the boundaryless model `EuclideanSpace ℝ (Fin n)` and `𝓡∂ n` the
  half-space model; `Sⁿ` is `Metric.sphere (0 : EuclideanSpace ℝ (Fin (n+1))) 1`, `Dⁿ` the
  closed unit ball of `EuclideanSpace ℝ (Fin n)`. The circle is Mathlib's `Circle`, the unit
  circle in `ℂ`, with the orientation of increasing argument.
  In Mathlib's notation `𝓡∂ n = modelWithCornersEuclideanHalfSpace n`, and manifolds with corners
  use `modelWithCornersEuclideanQuadrant`; `Sⁿ` carries its analytic manifold structure, and
  `Dⁿ = Metric.closedBall (0 : EuclideanSpace ℝ (Fin n)) 1` carries Tau Ceti's half-space charts.
- **Knots have no privileged type.** A knot in `M` is a smooth circle embedding,
  `TauCeti.SmoothCircleEmbedding I M`; an `n`-component link is `TauCeti.SmoothLinkEmbedding I M n`.
  The parametrization orients each component; the unoriented object is the range. A framing
  is separate normal data. Combinatorial presentations (diagrams, braid closures, polygons)
  are types of their own, related to the geometric presentation by realization maps and
  comparison theorems; no umbrella `Knot` type is introduced.
  The unoriented presentation of a knot as a type is the quotient
  `TauCeti.UnorientedSmoothCircleEmbedding I M` by reversal.
- **Isotopy is defined once.** Isotopy and ambient isotopy of continuous maps are Tau Ceti's
  `TauCeti.Isotopic`, `TauCeti.AmbientIsotopic` and `TauCeti.AmbientIsotopy`; their smooth
  forms are `TauCeti.Diffeotopy` and `TauCeti.SmoothAmbientIsotopic`. Knot equivalence,
  diffeotopy of diffeomorphisms and the uniqueness statements of Layers 2, 5 and 8 all
  specialize these.
  Knot and link equivalence is the ambient specialization
  `TauCeti.SmoothLinkEmbedding.SmoothAmbientIsotopic`; the non-ambient `TauCeti.Isotopic` is never
  used for it.
- **Local flatness.** A locally flat embedding is `TauCeti.IsLocallyFlat F F' f`: ambient charts
  valued in `F × F'` carry the image onto `F × {0}`, and the codimension is the choice of `F'`.
  For a knot in `S³` the model is `EuclideanSpace ℝ (Fin 1) × EuclideanSpace ℝ (Fin 2)`.
- **Orientations and signs.** `ℝ³`, `S³` and `D⁴` carry their standard orientations and `S³`
  is the oriented boundary of `D⁴` with the outward normal first. A right-handed crossing
  counts `+1`. The mirror image of a link is its image under the reflection
  `(x₀, x₁, x₂, x₃) ↦ (x₀, x₁, x₂, −x₃)` of `S³`; reversing the parametrization of a
  component is a separate operation. The linking number of two disjoint oriented knots is
  half the signed count of mixed crossings; the positive Hopf link has linking number `+1`.
  The writhe of a diagram is the sum of its crossing signs; the mirror of a diagram negates every
  crossing and reversal flips the orientation. The Seifert framing of a knot is the longitude with
  linking number `0` with it, and the blackboard framing of a diagram equals its writhe. In a
  braid word the letter `(i, +1)` is `σ_i`, and in the closure `TauCeti.BraidWord.closure` the
  strand entering on position `i` is the over-strand of a positive crossing.
- **Seifert matrices.** For an oriented surface `F ⊂ S³` with positive normal `ν` (oriented
  tangent frame followed by `ν` is the ambient orientation) and classes `x, y ∈ H₁(F; ℤ)`, the
  Seifert form is `θ(x, y) = lk(x, y⁺)`, `y⁺` the push-off of `y` along `ν`. Then
  `θ(y, x) − θ(x, y) = x · y` is the ordered-tangent intersection form of `F`.
  The right-handed trefoil has
  Seifert matrix `[[−1, 1], [0, −1]]`, which is `TauCeti.KnotTheory.trefoilSeifertMatrix`.
- **Polynomial normalizations.** The Alexander polynomial of a knot is Conway-normalized:
  `Δ_K(t) = Δ_K(t⁻¹)` and `Δ_K(1) = 1`; the right-handed trefoil has `t − 1 + t⁻¹` and the
  figure-eight `−t + 3 − t⁻¹`. The Jones polynomial is defined through the Kauffman bracket
  with `t = A⁻⁴` and `V(unknot) = 1`, so the right-handed trefoil has `t + t³ − t⁴`. The
  HOMFLY polynomial lives in the degree-zero part of `ℤ[x^±, y^±, z^±]` with skein relation
  `x P(L₊) + y P(L₋) + z P(L₀) = 0` and `P(unknot) = 1`. The Levine–Tristram signature at
  `ω ∈ S¹` is the signature of the Hermitian matrix `(1 − ω) V + (1 − ω̄) Vᵀ`, which is
  `TauCeti.KnotTheory.tristramLevineForm`; the right-handed trefoil has signature `−2` at
  `ω = −1`.
  The pinned Alexander polynomial is `TauCeti.KnotTheory.alexander`, pinned on the two knots by
  `alexander_trefoilSeifertMatrix` and `alexander_figureEightSeifertMatrix`; the Kauffman-bracket
  substitution is `t^{1/2} = A⁻²`, the Jones polynomial is the writhe-normalized bracket
  `TauCeti.OrientedPDCode.jonesPolynomial`, pinned on the trefoil by
  `jonesPolynomial_rightHandedTrefoilPDCode`, and mirroring substitutes `t⁻¹` for `t`. The
  classical signature `σ(K) = signature(V + Vᵀ)` (`Matrix.signature`) is `σ(K, −1)`: `σ = −2` for
  the right-handed trefoil (`signature_trefoilSeifertMatrix`) and `σ = 0` for the figure-eight. At
  `ω = 1` the form vanishes, so `σ(K, 1) = 0`; at a root `ω ≠ 1` of the Alexander polynomial the
  mean of the two one-sided limits is the averaged signature `σ̄(K, ω)` of Layer 6.2, which need
  not equal `σ(K, ω)` there.
- **Slopes.** A slope on a boundary torus is a primitive class in `H₁(T; ℤ)` up to sign,
  `TauCeti.Slope`; with the framed basis `(μ, λ)` of meridian and Seifert longitude, `p/q`
  denotes `p·μ + q·λ`, so the meridian is `∞ = 1/0` and the longitude is `0`. Dehn filling
  along `p/q` glues a solid torus whose meridian goes to `p·μ + q·λ`.
  A framing `(μ, λ)` thus identifies the slopes with `ℚ ∪ {∞}` by `p/q ↦ p·μ + q·λ`, which is
  `TauCeti.FramedBoundaryTorus.value`.
- **Hyperbolic metrics.** A hyperbolic metric is a complete smooth Riemannian metric of
  constant sectional curvature `−1`, `TauCeti.HyperbolicMetric`. Volume is the total mass of
  `TauCeti.riemannianVolume`; `hypVolume` is defined from an arbitrary hyperbolic metric and
  its independence of the metric is Mostow rigidity, a theorem, not a definition.
  Curvature is in Lee's convention `R(w, u)v = κ(⟪u, v⟫w − ⟪w, v⟫u)`; the volume of a given
  hyperbolic metric is `TauCeti.hypVolumeOfMetric`, and on closed connected manifolds of dimension
  at least three `TauCeti.hypVolume` (the Weeks manifold has volume `0.9427…`).
- **Cohomology.** Cohomology is singular cohomology with integer coefficients unless stated;
  `⟨c, [S]⟩` is the evaluation of a degree-two class on the fundamental class of a closed oriented
  surface. The Thurston norm uses `χ₋(S) = Σ max(0, −χ(S_i))` over the components `S_i` of `S`.
- **Simplicial complexes.** Simplicial complexes are Mathlib's `AbstractSimplicialComplex ι` and
  `PreAbstractSimplicialComplex ι`, which need not contain every singleton; the polyhedron `|K|`
  is `AbstractSimplicialComplex.Realization K` with the weak topology. Collapse removes free
  faces; a combinatorial `n`-sphere is a complex stellar equivalent to `∂Δⁿ⁺¹`, a combinatorial
  `n`-ball one stellar equivalent to `Δⁿ`.
- **Combinatorial manifolds.** Dimension `0` is the case of a discrete complex with empty
  vertex links; for `n + 1` every vertex link is a combinatorial `n`-sphere or `n`-ball. This
  is Tau Ceti's `PreAbstractSimplicialComplex.IsCombinatorialManifold`, by pattern matching on the
  dimension.
- **Named hypotheses.** A *Hypothesis k.n* records a finite identification or computation about
  a specific diagram, surface, braid word or presentation (that a marked diagram is a given
  tabulated knot, that a given surface has a given Seifert matrix), or a value of a specific
  knot invariant computed outside this roadmap's theory, cited where it is stated. It is
  neither a target nor a Check and is never asserted: every statement that uses it says
  "assuming Hypothesis k.n" and carries it as an explicit premise, and no hypothesis contains
  the conclusion of a statement that assumes it. Tabulated identifications are out of scope
  (*Scope and ownership*, knot tables), which is why they enter as premises.
- **Kirby problems.** A problem of Kirby's list is cited as "Kirby's Problem a.b", with the
  numbering of the published list (*References*): Property P is 1.15, Property R 1.16, the
  Akbulut–Kirby conjecture 1.19, Levine's problem 1.31, Alexander polynomial one 1.36, the shake
  genus 1.41, winding-number-one satellite operators 1.45, mutation 1.53, cosmetic surgery 1.81,
  geometrization 3.45, virtual fibering 3.51, minimal volume 3.60, `Diff(S⁴)` 4.34 (which asks
  about `S⁴`; Hatcher's `S³` theorem is the Smale conjecture proper), `Diff(D⁴, ∂)` 4.126, Zeeman
  5.2.

## Exact supplier contracts

### From Mathlib

- Manifolds: `ModelWithCorners`, `IsManifold`, `ChartedSpace`, the boundary and interior of a
  manifold (`ModelWithCorners.boundary`, `ModelWithCorners.interior`,
  `ModelWithCorners.IsInteriorPoint`), the half-space model `modelWithCornersEuclideanHalfSpace`
  and the quadrant model (`Mathlib/Geometry/Manifold/IsManifold/`,
  `Mathlib/Geometry/Manifold/Instances/Real.lean`); `TangentSpace`, `TangentBundle`, `mfderiv`,
  `ContMDiff`, `ContMDiffMap`; `Diffeomorph` with notation `M ≃ₘ^n⟮I, I'⟯ M'`;
  `Manifold.IsSmoothEmbedding` and `Manifold.IsImmersion`; structure groupoids
  (`StructureGroupoid`, `Pregroupoid`, `contDiffGroupoid`, `continuousGroupoid`, `HasGroupoid`);
  the sphere `Metric.sphere` as an analytic manifold and `Circle` as a Lie group
  (`Mathlib/Geometry/Manifold/Instances/Sphere.lean`);
  `SmoothPartitionOfUnity.exists_isSubordinate`
  (`Mathlib/Geometry/Manifold/PartitionOfUnity.lean`), subordinate smooth partitions on
  Hausdorff sigma-compact finite-dimensional smooth manifolds.
  Also `Pregroupoid.groupoid`, `ModelWithCorners.IsBoundaryPoint`, the quadrant model
  `modelWithCornersEuclideanQuadrant`, `Manifold.IsSmoothEmbedding I J n f` with
  `Manifold.IsImmersion` in its chart normal form, `Matrix.orthogonalGroup (Fin n) ℝ` and
  `LieGroup`; Mathlib's `analyticGroupoid` is not at the pin and is not used.
- Riemannian geometry: `RiemannianBundle`, `IsRiemannianManifold`, `riemannianEDist`,
  `EMetricSpace.ofRiemannianMetric`, `MetricSpace.ofRiemannianMetric`, path length
  (`Mathlib/Geometry/Manifold/Riemannian/`).
  Also the smooth metrics `Bundle.ContMDiffRiemannianMetric`.
- Topology: `Homeomorph`, `IsEmbedding`, `IsOpenEmbedding`, `IsClosedEmbedding`,
  `ContinuousMap.HomotopyEquiv`, `ContinuousMap.Homotopic`, `Path`, `Joined`,
  `IsCoveringMap`, `FundamentalGroup`, `SimplyConnectedSpace`, `HomotopyGroup` (notation
  `π_ n X x`), `ContractibleSpace`, the compact-open topology on `C(X, Y)`; singular homology
  `Mathlib/AlgebraicTopology/SingularHomology/`; `AbstractSimplicialComplex` and
  `PreAbstractSimplicialComplex` (`Mathlib/AlgebraicTopology/SimplicialComplex/Basic.lean`).
  The statement of the smooth Poincaré conjecture,
  `ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere M n`
  (`Mathlib/Geometry/Manifold/PoincareConjecture.lean`): for a Hausdorff space `M`, every smooth
  `n`-manifold structure on `M` (a `ChartedSpace` on `ℝⁿ` with `IsManifold (𝓡 n) ∞`) for which `M`
  is homotopy equivalent to `Sⁿ` makes `M` diffeomorphic to the round `Sⁿ ⊆ ℝⁿ⁺¹`; it asks for no
  compactness or second countability. Its case `n = 3` is Poincare3D's target 15.2, stated and
  proved there with the smooth Poincaré theorem (Layer 8.6), and is not restated here.
  Also `Topology.IsEmbedding` (`Mathlib/Topology/Defs/Induced.lean`), `OpenPartialHomeomorph`, the
  one-point compactification `OnePoint ℚ`, `ContinuousMap.Homotopy`, `unitInterval`; the singular
  homology functor `singularHomologyFunctor`, the classical CW complexes `Topology.CWComplex` and
  `Topology.RelCWComplex`, the geometric `Geometry.SimplicialComplex`, and the simplicial-set
  realization with `SimplexCategory.toTopHomeo`, the realization of a standard simplex as the
  topological simplex.
- Algebra: `Matrix.orthogonalGroup`, `Matrix.specialOrthogonalGroup`, `LaurentPolynomial`
  (notation `R[T;T⁻¹]`) and `LaurentPolynomial.eval₂`, `LaurentPolynomial.eval₂_T`,
  `LaurentPolynomial.eval₂_C` (`Mathlib/Algebra/Polynomial/Laurent.lean`): evaluation at a
  specified unit along a coefficient ring homomorphism; `RatFunc`, `Quandle` and `Quandle.Dihedral`
  (`Mathlib/Algebra/Quandle.lean`), `PresentedGroup`, `Group.rank` for finitely generated groups
  (`Mathlib/GroupTheory/Rank.lean`), `Group.IsPerfect`, `commutator`, `ZMod`.
  `Group.rank` needs `[Group.FG G]`; also `Matrix.det` and `PresentedMonoid`.

### From Tau Ceti (commit 2fd255d9)

The following pinned declarations supply the carriers and results used below. Layer 1.6
transfers the pinned compact PL comparison from coordinate spaces to finite-dimensional normed
spaces, Layer 4.6 constructs the HOMFLY coefficient substitution, and
Layer 5.1 adds the smooth structure of the pinned link exterior.

- **Boundaries and collars** (`Geometry/Manifold/Boundary/`): `TauCeti.isManifold_boundary`
  (the boundary of a `C^k` manifold over `𝓡∂ (n+1)` is a `C^k` manifold over `𝓡 n`) and
  `TauCeti.isSmoothEmbedding_subtypeVal_boundary`; the topological collar predicates
  `TauCeti.IsCollar`, `TauCeti.IsCollared`, `TauCeti.IsLocallyCollared` (`Collar/Global.lean`);
  the Euclidean half-space collar `TauCeti.EuclideanHalfSpace.boundaryCollar` and the product
  collar charts of `Collar/Local.lean`.
  The boundary results are in `Geometry/Manifold/Boundary/Charts.lean`, the inclusion of the
  boundary being a closed smooth embedding; the smooth local collars are
  `TauCeti.IsProductCollarChart`, `TauCeti.exists_isProductCollarChart_of_mem_boundary` and
  `TauCeti.IsProductCollarChart.diffeomorphProd` (`Boundary/Collar/Local.lean`,
  `Boundary/Collar/Diffeomorph.lean`); the collar predicates are in `Boundary/Collar/Global.lean`,
  and Brown's collaring theorem `TauCeti.IsLocallyCollared.isCollared` for a compact domain is in
  `Boundary/Collar/Brown.lean`.
- **Gluing of atlases** (`Geometry/Manifold/Gluing.lean`): `TauCeti.chartedSpaceOfIsOpenEmbedding`
  builds a charted space and `IsManifold` instance from an open cover by manifolds with smooth
  transition maps.
- **Smooth embeddings and normal spaces** (`Geometry/Manifold/SmoothEmbedding/`): the bundled
  `TauCeti.SmoothEmbedding I J n M N`, its quotient normal space
  `TauCeti.SmoothEmbedding.NormalSpace` with `normalClass` and `normalClassL`;
  `TauCeti.SmoothEmbedding.Concordant` and the collared `TauCeti.SmoothEmbedding.Concordance`
  between two smooth embeddings (`Concordance.lean`), with reflexivity, symmetry, transitivity
  and invariance under diffeomorphisms of either side.
  In `SmoothEmbedding/Concordance.lean` these are `refl`, `symm`, `trans`, `ofDiffeotopy` and
  `Concordant.equivalence`; `TauCeti.SmoothEmbedding` is in `SmoothEmbedding/Basic.lean`, and the
  normal spaces in `NormalSpace/Basic.lean` and its siblings.
- **Euclidean tubular neighbourhoods** (`Geometry/Manifold/TubularNeighborhood/Euclidean.lean`):
  `TauCeti.IsTubularNeighborhood`, `TauCeti.normalSubspace`, `TauCeti.normalTube`, and
  `TauCeti.exists_isOpenEmbedding_normalTube` for a compact boundaryless `C²` source,
  a `C²` injective map into a finite-dimensional real inner product space, and injective
  differential at every point. The instance
  `TauCeti.instTopologicalSpaceTotalSpaceNormalSubspace` gives the normal total space its
  subspace topology, the one used by the bundle structures of `VectorBundle.lean` below.
  `TauCeti.IsTubularNeighborhood` is defined in `TubularNeighborhood/Basic.lean`, and
  `TauCeti.exists_isTubularNeighborhood_normalBundle` restates the theorem as a tubular
  neighbourhood formed by the normal vectors of norm less than some `ε > 0`.
- **Intrinsic normal bundles and tubular neighbourhoods**
  (`Geometry/Manifold/SmoothEmbedding/NormalSpace/VectorBundle/`,
  `Geometry/Manifold/TubularNeighborhood/`): the normal spaces of a positive-regularity embedding
  form a vector bundle, smooth for a smooth embedding, with smooth orthogonal representatives for
  an ambient Riemannian metric; the smooth tubular neighbourhood theorem
  `TauCeti.SmoothEmbedding.exists_diffeomorph_normalBundle_subset` (`Existence.lean`): for a smooth
  embedding between finite-dimensional boundaryless manifolds with Hausdorff second-countable
  target, the whole normal bundle is diffeomorphic to an open neighbourhood of the image inside
  any prescribed open set, zero section to the embedding, with no compactness or closed-image
  hypothesis; its Riemannian form
  `TauCeti.SmoothEmbedding.exists_diffeomorph_normalBundle_riemannian_subset`
  (`Riemannian/Coordinates.lean`); closed normal disc and sphere bundles of a compact submanifold,
  `TauCeti.SmoothEmbedding.exists_isClosedEmbedding_normalExp_disc` (`Riemannian/DiscSphere.lean`);
  the Euclidean normal bundle of an immersion (`VectorBundle.lean`).
- **Isotopy extension, homogeneity and the disc theorem**: the compactly supported smooth isotopy
  extension on a compact subset of the source,
  `TauCeti.SmoothIsotopy.exists_diffeotopy_apply_eq`, and
  `TauCeti.smoothAmbientIsotopic_iff_smoothIsotopic` for a compact source
  (`Geometry/Manifold/SmoothIsotopy/Extension.lean`); the homogeneity lemma for connected
  finite-dimensional manifolds (`Geometry/Diffeomorphism/Diffeotopy/Homogeneity.lean`); the disc
  theorem for smooth embeddings of `E` into a boundaryless manifold modelled on `E` with a common
  centre and derivatives of the same orientation,
  `TauCeti.SmoothEmbedding.exists_smoothIsotopy_of_det_chartAt_mul_pos` and, for a Hausdorff
  σ-compact target, the ambient form
  `TauCeti.SmoothEmbedding.exists_diffeotopy_eqOn_of_det_chartAt_mul_pos`
  (`Geometry/Manifold/SmoothIsotopy/DiscTheorem.lean`).
- **Connected sums and prime manifolds** (`Geometry/Manifold/ConnectedSum/`,
  `LowDimTopology/PrimeDecomposition.lean`): `TauCeti.ConnectedSum e₁ e₂` along coordinate balls
  (`Basic.lean`), a smooth manifold (`TauCeti.ConnectedSum.isManifold`, `Smooth.lean`), Hausdorff,
  compact, and connected in dimension at least two (`Topology.lean`), commutative
  (`TauCeti.ConnectedSum.commDiffeomorph`, `Congr.lean`), oriented when the balls induce opposite
  orientations (`TauCeti.ConnectedSum.orientable`, `Orientation.lean`), independent of the balls
  (`TauCeti.ConnectedSum.nonempty_diffeomorph_of_isOrientationPreservingAt` and
  `TauCeti.ConnectedSum.nonempty_diffeomorph_of_isOrientationReversingAt`, `Independence.lean`);
  the oriented sum `TauCeti.OrientedConnectedSum` with
  `TauCeti.OrientedConnectedSum.nonempty_diffeomorph_comm` and
  `TauCeti.OrientedConnectedSum.nonempty_diffeomorph_sphere` (`Oriented.lean`); the predicates
  `TauCeti.IsConnectedSumOf`, `TauCeti.IsPrimeManifold` and `TauCeti.IsIteratedConnectedSum`
  (`Prime.lean`); the propositions `TauCeti.KneserPrimeDecompositionTheorem` and
  `TauCeti.MilnorPrimeDecompositionTheorem`, with `TauCeti.MilnorPrimeDecompositionTheorem.card_eq`.
  In detail: `TauCeti.ConnectedSum e₁ e₂` is the sum of two spaces along open embeddings
  `e₁ : E → M`, `e₂ : E → N` of a real inner product space `E`, the centres removed and the
  punctured balls glued by the inversion `v ↦ v/‖v‖²`, with `ConnectedSum.inl`, `inr`, `mk`,
  `isOpenEmbedding_inl`, `isLocalHomeomorph_mk` and `ConnectedSum.t2Space`
  (`Geometry/Manifold/ConnectedSum/Basic.lean`); its charts `ConnectedSum.chartedSpace` with
  `ConnectedSum.isManifold` and `isLocalDiffeomorph_mk` (`ConnectedSum/Smooth.lean`);
  `ConnectedSum.compactSpace` and `ConnectedSum.connectedSpace` for `dim E ≥ 2`
  (`ConnectedSum/Topology.lean`); `ConnectedSum.orientation` and `ConnectedSum.orientable`
  (`ConnectedSum/Orientation.lean`) on the pinned orientations
  `TauCeti.Manifold.Orientation I M ι` (`Orientation/Basic.lean`); the independence theorems in
  `ConnectedSum/Independence.lean`; `TauCeti.OrientedConnectedSum oM oN` with
  `nonempty_diffeomorph_connectedSum`, `nonempty_diffeomorph_comm`, `nonempty_diffeomorph_neg` and
  `nonempty_diffeomorph_sphere` (`ConnectedSum/Oriented.lean`); `TauCeti.IsComplementaryBall` and
  `TauCeti.connectedSumSphereDiffeomorph` (`ConnectedSum/Sphere.lean`); and, for primeness,
  `TauCeti.IsConnectedSumOf I k M N₁ N₂`, `TauCeti.IsPrimeManifold n M`,
  `TauCeti.IsIteratedConnectedSum n P M`, `TauCeti.not_isPrimeManifold_sphere`,
  `TauCeti.IsConnectedSumOf.not_isPrimeManifold`, `TauCeti.isIteratedConnectedSum_zero_iff` and
  `Diffeomorph.isPrimeManifold_iff` (`Geometry/Manifold/ConnectedSum/Prime.lean`).
- **Immersions** (`Geometry/Manifold/Immersion/Basic.lean`): `TauCeti.isImmersion_iff_forall_isImmersionAt`.
- **Morse functions** (`Geometry/Manifold/Morse/`, `Analysis/Calculus/Morse/`):
  `TauCeti.IsMorseOn` and `TauCeti.IsMorse` (`Basic.lean`), `TauCeti.manifoldMorseIndex`
  (`Index.lean`); on a boundaryless finite-dimensional Hausdorff manifold, the existence
  `TauCeti.exists_isMorse` on a compact one and the relative compact approximation
  `ContMDiffMap.exists_isMorseOn_hasCompactSupport_sub_compl` (`Generic/`), the unit-speed
  descending flow `TauCeti.exists_flow_apply_eq_sub` and the sublevel diffeomorphism
  `TauCeti.exists_diffeomorph_sublevel` across a compact band without critical points
  (`Deformation.lean`); the Morse lemma in a vector space,
  `TauCeti.IsNondegenerateCriticalPoint.exists_morse_chart` (`NormalForm.lean`). Manifolds
  with boundary are Layer 1.3.1's.
- **Sard's theorem** (`Analysis/Calculus/Sard/OutermostStratum.lean`,
  `Geometry/Manifold/Sard/Meagre.lean`): the flat Morse–Sard theorem
  `ContDiff.addHaar_image_criticalPoints_eq_zero`, for a `C^n` map between finite-dimensional
  real normed spaces with `(dim E)² + 1 ≤ n`, so for every smooth map, with no relation between
  the two dimensions: its critical values are null for every additive Haar measure; its
  measure-free form `ContDiff.dense_compl_image_criticalPoints`, the regular values are dense;
  and on manifolds `ContMDiff.isMeagre_image_criticalPoints`, the critical values of a smooth
  map from a Lindelöf finite-dimensional boundaryless manifold to a finite-dimensional
  boundaryless manifold, of any dimensions, form a meagre set. Sources with boundary are
  Layer 1.7.1's.
  The `TauCeti`-namespace form `TauCeti.addHaar_image_criticalPoints_eq_zero` and the density of
  regular values are consumed in charts by Layers 4.2 and 10.4.
- **The PL groupoid** (`Geometry/Manifold/PLGroupoid/Basic.lean`, `Topology/PL/`):
  `TauCeti.IsPiecewiseAffineOn`, `TauCeti.IsPLOn`, `TauCeti.PLPregroupoid`,
  `TauCeti.PLGroupoid I`, `TauCeti.PLGroupoid_le_continuousGroupoid`, closure under restriction
  (`TauCeti.ofSet_mem_PLGroupoid`),
  and the witness `TauCeti.doubleRight_mem_PLGroupoid` of a PL map that is not affine; PL maps
  between PL manifolds `TauCeti.IsPLMap` with `TauCeti.IsPLMap.comp` (`PLGroupoid/Map.lean`),
  products `TauCeti.hasGroupoid_PLGroupoid_prod` (`PLGroupoid/Product.lean`), the compact
  comparison `TauCeti.IsPLOn.isPiecewiseAffineOn_of_isCompact` on `ι → ℝ`
  (`Topology/PL/Compact.lean`)
  and the inverse criterion `TauCeti.isPiecewiseAffineOn_inverse_of_finite_simplex_cover`
  (`Topology/PL/Inverse.lean`).
- **Locally flat embeddings** (`Geometry/Manifold/LocallyFlat/`): `TauCeti.IsSliceChart`,
  `TauCeti.IsSliceEmbedding`, `TauCeti.IsLocallyFlat F F' f` (slice charts with model `F × F'`)
  with restriction, composition with open embeddings and homeomorphisms on either side, and
  products (`Basic.lean`); smooth embeddings between boundaryless manifolds are locally flat
  (`TauCeti.SmoothEmbedding.isLocallyFlat`, `Smooth.lean`) and the neat boundary variant
  (`Neat.lean`); `TauCeti.IsBicollar`, `TauCeti.IsBicollared`, `TauCeti.IsLocallyBicollared`
  (`Bicollar.lean`); Brown's bicollaring theorem `TauCeti.BrownBicollaring n` and its proof
  `TauCeti.brownBicollaring` (`Sphere.lean`, `Brown.lean`); the annulus conjecture
  `TauCeti.CoboundAnnulus` and `TauCeti.AnnulusConjecture n` with the round case
  `TauCeti.coboundAnnulus_smul_coe_sphere` (`Annulus.lean`); topological concordance
  `TauCeti.TopologicallyConcordant` (`Concordance/Basic.lean`) and the passage from smooth
  concordance (`Concordance/Smooth.lean`).
  The closure API of `TauCeti.IsLocallyFlat` in `Geometry/Manifold/LocallyFlat/Basic.lean`
  comprises `restrict`, `of_forall_exists_isOpen`, `homeomorph_comp`, `comp_homeomorph`,
  `isOpenEmbedding_comp`, `codRestrict`, `transHomeomorph`, `prodMap`, `comp` under its
  chart-compatibility hypothesis, `isLocallyFlat_iff_isOpenEmbedding` in codimension zero,
  `isLocallyClosed_range` and `exists_isOpenEmbedding_prod`; further
  `TauCeti.IsLocallyFlat.of_isSmoothEmbedding` (`LocallyFlat/Smooth.lean`),
  `TauCeti.IsLocallyFlat.of_isSmoothEmbedding_of_preimage_boundary` for neat embeddings
  (`LocallyFlat/Neat.lean`), `TauCeti.SimplePolygon.isLocallyFlat_realize` for simple polygons
  (`LocallyFlat/Polygon.lean`), `TauCeti.isLocallyFlat_iff_isEmbedding_and_isLocallyBicollared`
  (`LocallyFlat/Bicollar.lean`), `TauCeti.IsLocallyBicollaredWithSides.exists_isBicollar`
  (`LocallyFlat/TwoSided.lean`) and
  `TauCeti.IsLocallyBicollared.isBicollared_of_not_isPreconnected_compl_range`
  (`LocallyFlat/Separation.lean`); the files of Brown's theorem and of the annulus conjecture are
  `LocallyFlat/Sphere.lean`, `LocallyFlat/Brown.lean` and `LocallyFlat/Annulus.lean`; the
  topological concordance carrier `TauCeti.TopologicalConcordance`
  (`LocallyFlat/Concordance/Basic.lean`) and the passage
  `TauCeti.SmoothEmbedding.Concordant.exists_topologicallyConcordant`
  (`LocallyFlat/Concordance/`).
- **Isotopy** (`Topology/Homotopy/`): `TauCeti.Isotopy`, `TauCeti.Isotopic`,
  `TauCeti.AmbientIsotopy` with `final` and `finalHomeomorph`, `TauCeti.AmbientIsotopic`;
  `TauCeti.Diffeotopy J n M` with `timeSlice`, `final`, `trans`, `symm`, `toAmbientIsotopy`
  (`Geometry/Diffeomorphism/Diffeotopy/`).
  The files are `Topology/Homotopy/Isotopy/Basic.lean`, `AmbientIsotopic/Basic.lean` and
  `Diffeomorphism/Diffeotopy/Basic.lean`.
- **Diffeomorphism groups** (`Geometry/Diffeomorphism/`): the `Group` instance on
  `M ≃ₘ^n⟮I, I⟯ M` and the abbreviation `TauCeti.Diff I M n` (`Group.lean`); the weak Whitney
  topology `Diffeomorph.weakWhitneyTopology` as the scoped instance of
  `TauCeti.DiffeomorphWeakWhitney`, with `Diffeomorph.ofSmoothFamily` turning a smooth family
  of diffeomorphisms into a continuous map (`Topology.lean`); `Diffeomorph.fixingSubgroup`,
  `TauCeti.RelativeDiff` and `TauCeti.DiscDiff n` for `Diff(Dⁿ, ∂)` (`FixingSubgroup/`,
  `Disc.lean`); the reference inclusion `TauCeti.orthogonalToDiffSphere n m` and its continuous
  form `TauCeti.continuousOrthogonalToDiffSphere` (`Sphere.lean`); the propositions
  `TauCeti.SmaleConjecture` (`Smale.lean`) and `TauCeti.WatanabeTheorem` (`Disc.lean`); Cerf's
  theorem in orientation-free form `TauCeti.CerfTheorem`, derived from the Smale conjecture by
  `TauCeti.SmaleConjecture.cerfTheorem` and equivalent to `Diff(S³)` having two path components
  (`TauCeti.cerfTheorem_iff_natCard_zerothHomotopy_eq_two`, `Cerf.lean`).
  In detail: the group is in `Geometry/Diffeomorphism/Group.lean`; the weak Whitney topology, for
  compact `M`, comes with `Diffeomorph.continuous_eval_const` and
  `Diffeomorph.t2Space_weakWhitney` (`Diffeomorphism/Topology.lean`) and is selected by
  `open scoped TauCeti.DiffeomorphWeakWhitney`; continuity of multiplication is in
  `Diffeomorphism/Composition.lean`, and continuity of inversion with the topological-group
  instance `Diffeomorph.isTopologicalGroup` in `Diffeomorphism/Inversion.lean`; the fixing
  subgroups and the closedness of `TauCeti.RelativeDiff` are in `Diffeomorphism/FixingSubgroup/`;
  the remaining files are `Diffeomorphism/Disc.lean`, `Diffeomorphism/Sphere.lean`,
  `Diffeomorphism/Smale.lean` and `Diffeomorphism/Cerf.lean`; and
  `TauCeti.joined_orthogonalToDiffSphere_iff` and `TauCeti.not_pathConnectedSpace_diff_sphere` are
  in `Diffeomorphism/Sphere/Isotopy.lean`.
- **Knots and links** (`KnotTheory/`): `TauCeti.SmoothCircleEmbedding I M` with `rotate`,
  `reverse`, `TauCeti.SmoothCircleEmbedding.greatCircle` and `TauCeti.unknot`
  (`SmoothCircle.lean`); `TauCeti.SmoothLinkEmbedding I M n` with `empty`, `singleton`,
  `relabel`, `reverse` (`SmoothLink/Basic.lean`), `TauCeti.SmoothLinkEmbedding.SmoothAmbientIsotopic`
  and `TauCeti.SmoothLinkEmbedding.ContinuousAmbientIsotopic` with their equivalence laws and
  complement homeomorphisms (`SmoothLink/`); the knot group
  `TauCeti.SmoothCircleEmbedding.KnotGroup` and `HasPerfectCommutatorSubgroup`
  (`KnotGroup.lean`); sliceness `TauCeti.IsSmoothlySlice`, `TauCeti.IsTopologicallySlice`,
  `TauCeti.SmoothSliceSurface`, `TauCeti.sliceGenus`, the topological slice genus
  `TauCeti.topologicalSliceGenus` with `TauCeti.topologicalSliceGenus_le_sliceGenus`, the
  topological sliceness of a knot concordant to the unknot
  (`TauCeti.isTopologicallySlice_of_topologicallyConcordant_unknot`) and of a knot plus its
  reverse mirror image
  (`TauCeti.SmoothCircleEmbedding.isTopologicallySlice_connectedSum_reverseMirror`) (`Slice/`),
  and the proposition
  `TauCeti.FreedmanSliceTheorem` (`Slice/Freedman.lean`); integral homology cobordisms
  `TauCeti.IsHomologyCobordism` (`Geometry/Manifold/HomologyCobordism.lean`), homology
  concordance of smooth embeddings `TauCeti.SmoothEmbedding.HomologyConcordant`
  (`Geometry/Manifold/SmoothEmbedding/HomologyConcordance.lean`) and the proposition
  `TauCeti.LevineHomologyConcordanceTheorem`, that some knot in the boundary of a smooth compact
  contractible `4`-manifold is homology concordant to no knot in `S³`
  (`KnotTheory/HomologyConcordance.lean`); solid-torus neighbourhoods
  `TauCeti.IsSolidTorusNeighborhood` and its
  `TauCeti.IsSolidTorusNeighborhood.exteriorFrontierHomeomorph`, identifying the frontier
  of the complement of the open solid torus with its boundary torus in a Hausdorff ambient
  space (`LowDimTopology/SolidTorusNeighborhood/Basic.lean`).
  In detail: the circle embeddings are in `KnotTheory/SmoothCircle.lean`; the unoriented quotient
  `TauCeti.UnorientedSmoothCircleEmbedding` is in `UnorientedSmoothCircle.lean`; the link
  embeddings have `transDiffeomorph` and `singletonEquiv`, with their isotopies in
  `SmoothLink/Isotopy.lean` and `SmoothLink/AmbientIsotopy.lean`; sliceness has
  `TauCeti.IsSmoothSliceDisc`, `TauCeti.IsTopologicalSliceDisc`,
  `TauCeti.IsSmoothlySlice.isTopologicallySlice` and `TauCeti.isSmoothlySlice_unknot`
  (`Slice/Basic.lean`), and the slice genus `TauCeti.sliceGenus : ℕ∞` (`⊤` when there is no slice
  surface) has `TauCeti.IsSmoothlySlice.sliceGenus_eq_zero` (`Slice/Genus.lean`); the right-handed
  trefoil `TauCeti.rightHandedTrefoil` is in `KnotTheory/TorusKnot.lean`; and the Whitehead link
  `TauCeti.whiteheadLink`, whose component `1` is the Whitehead curve `TauCeti.whiteheadCurve`, is
  in `KnotTheory/SmoothLink/Whitehead.lean`.
- **Combinatorial knot theory** (`KnotTheory/`): `TauCeti.PDCode n`, `TauCeti.OrientedPDCode n`,
  `TauCeti.PDCode.IsPlanar`, the face permutation and face count (`PDCode/Planar.lean`), the
  state sum `TauCeti.PDCode.kauffmanBracket`, `normalizedKauffmanBracket`,
  `TauCeti.PDCode.stateLoopCount` (`PDCode/Kauffman.lean`), `TauCeti.OrientedPDCode.jonesPolynomial`
  with its Reidemeister, mirror and reversal laws (`PDCode/Jones/`);
  `TauCeti.BasedOrientedGaussCode` and `TauCeti.BasedOrientedGaussCode.toOrientedPDCode`
  (`GaussCode/`); `TauCeti.BraidGroup n`, `TauCeti.BraidWord n`, `TauCeti.BraidWord.closure`
  (`GroupTheory/SpecificGroups/Braid/`, `BraidWord/PDCode.lean`); `TauCeti.MarkovBraid`,
  `TauCeti.MarkovEquiv`, `TauCeti.MarkovBraid.componentCount` (`Markov/Basic.lean`); the matrix
  Alexander polynomial `TauCeti.KnotTheory.alexanderMatrix`, `TauCeti.KnotTheory.alexander`,
  `TauCeti.KnotTheory.trefoilSeifertMatrix`, `TauCeti.KnotTheory.figureEightSeifertMatrix`
  (`Alexander.lean`); S-equivalence `TauCeti.KnotTheory.IntegralSquareMatrix.SEquivalent`
  (`SeifertMatrix/SEquivalence.lean`); the Burau representation and
  `TauCeti.MarkovBraid.burauAlexander` (`Burau/`); `TauCeti.KnotTheory.tristramLevineForm`,
  `TauCeti.KnotTheory.tristramLevineSignature` with the Hermitian signature
  `Matrix.IsHermitian.signature` (`TristramLevine/`, `Analysis/Matrix/HermitianSignature/Basic.lean`);
  `TauCeti.KnotTheory.jimboWeightedTrace` (a weighted trace, before writhe normalization),
  the Markov trace on the Temperley–Lieb algebra (`Jimbo/` and the
  `MarkovTrace` module of the `Algebra` folder).
  In detail: `TauCeti.BraidWord.toBraid`, the closure
  `TauCeti.BraidWord.closure : OrientedPDCode w.length` (`KnotTheory/BraidWord/PDCode.lean`) and
  `TauCeti.BraidWord.ArtinEquiv`, whose classes have Reidemeister-equivalent closures
  (`BraidWord/ArtinEquivalence.lean`); `TauCeti.IsMarkovMove` (`KnotTheory/Markov/Basic.lean`)
  and `TauCeti.MarkovEquiv.reidemeisterEquiv_closure`, the forward direction of the
  combinatorial Markov theorem (`Markov/Closure.lean`); `TauCeti.BraidWord.jonesTrace_toBraid`
  and `TauCeti.BraidWord.jonesTrace_toBraid_eq_eval₂_jonesPolynomial`, the agreement of the
  Jones trace of a braid with the Jones polynomial of its closure (`BraidWord/Jones.lean`);
  the PD-codes with `writhe`, `mirror`, `reverse` and `relabel` (`PDCode/Basic.lean`),
  `TauCeti.OrientedPDCode.IsReidemeisterMove` and `ReidemeisterEquiv`
  (`PDCode/Oriented/Reidemeister/Equivalence.lean`); the Gauss codes
  `FramedBasedOrientedGaussCode` and `BasedUnorientedGaussCode`;
  `TauCeti.OrientedPDCode.normalizedKauffmanBracket`; the invariance
  `TauCeti.OrientedPDCode.ReidemeisterEquiv.jonesPolynomial_eq`, `jonesPolynomial_mirror`,
  `jonesPolynomial_reverse`, `jonesPolynomial_unknot` and
  `TauCeti.jonesPolynomial_rightHandedTrefoilPDCode` (`PDCode/Jones/Basic.lean`); the Alexander
  lemmas `enlargeColumn`, `enlargeRow`, `invert_alexander`, `eval₂_one_alexander`,
  `alexander_congruence_of_det_sq_eq_one`, `alexander_trefoilSeifertMatrix` and
  `alexander_figureEightSeifertMatrix` (`KnotTheory/Alexander.lean`); the module
  `TauCeti.OrientedPDCode.AlexanderModule` and its `elementaryIdeal`, with their Reidemeister
  invariance (`PDCode/Alexander/`); `TauCeti.KnotTheory.burau`,
  `TauCeti.MarkovEquiv.associated_burauAlexander` and
  `TauCeti.KnotTheory.associated_burauAlexander_alexander_trefoilSeifertMatrix`;
  `TauCeti.KnotTheory.jimbo`, the loop value `jonesDelta a = −(a² + a⁻²)`, the writhe-normalized
  Jones trace `TauCeti.MarkovBraid.jonesTrace` with its Markov invariance, `jonesTrace_one_strand`
  and `jonesTrace_sigma_pow_three` (`Jimbo/`, `TemperleyLieb.lean`), and
  `TauCeti.normalizedKauffmanBracket_rightHandedTrefoilPDCode` (`PDCode/Trefoil.lean`); and the
  HOMFLY substitutions `TauCeti.KnotTheory.homflySpecialization N` (`a = q^N`, `z = q − q⁻¹`, into
  `RatFunc K`) with their joint injectivity
  `TauCeti.KnotTheory.homflySpecialization_jointly_injective` (`Homfly/Specialization.lean`), a
  uniqueness statement asserting no existence.
- **Signatures** (`LinearAlgebra/Matrix/Signature.lean`, `KnotTheory/Signature.lean`,
  `TristramLevine/`): `Matrix.signature` with `signature_trefoilSeifertMatrix`,
  `signature_figureEightSeifertMatrix`, `signature_enlargeColumn` and `signature_enlargeRow`;
  `tristramLevineSignature_neg_one`, `tristramLevineSignature_one`,
  `tristramLevineSignature_congr`, `tristramLevineSignature_neg_transpose`,
  `tristramLevineSignature_fromBlocks_zero` and the invariance under enlargement.
- **Grid diagrams** (`KnotTheory/Grid/`): `TauCeti.GridDiagram`, `GridLink` and
  `GridDiagram.MovesTo` (`Grid/Move/Basic.lean`).
- **Plane topology** (`Topology/JordanCurve/Basic.lean`, `Topology/FilledHull.lean`,
  `Analysis/Complex/PlaneSeparation/`, `Analysis/Complex/Conformal/Jordan/Schoenflies.lean`):
  the Jordan-curve predicate `TauCeti.IsJordanCurve` (a set homeomorphic to the circle) and
  the filled hull `TauCeti.filledHull` (the set together with the bounded components of
  its complement); the Jordan curve theorem in `ℂ`: the complement of a Jordan curve `C` is not
  connected (`TauCeti.IsJordanCurve.not_isPreconnected_compl`), its inside
  `filledHull C \ C` is nonempty and is a single complementary component
  (`TauCeti.IsJordanCurve.nonempty_filledHull_sdiff`,
  `TauCeti.IsJordanCurve.filledHull_sdiff_eq_connectedComponentIn`), and every
  complementary component has frontier `C` (`TauCeti.IsJordanCurve.frontier_connectedComponentIn`);
  the Schoenflies theorem: a homeomorphism of `ℂ` carries the unit circle, the open unit
  disc and the closed unit disc onto `C`, its inside and `filledHull C`
  (`TauCeti.IsJordanCurve.exists_homeomorph_image_sphere`, with a prescribed image of `0`
  in `TauCeti.IsJordanCurve.exists_homeomorph_image_sphere_of_mem`), and on the unit sphere
  of a three-dimensional real inner product space a homeomorphism fixing a point `v ∉ C`
  carries the great circle orthogonal to `v` onto `C`
  (`TauCeti.IsJordanCurve.exists_homeomorph_image_inner_eq_zero`).
- **Slopes** (`LowDimTopology/DehnSurgery/Slope.lean`): `TauCeti.Slope M` (primitive classes
  up to sign), `TauCeti.BoundaryTorus`, `TauCeti.FramedBoundaryTorus` with `meridian`,
  `longitude`, `value` and `TauCeti.FramedBoundaryTorus.slopeEquiv : Slope T.H ≃ OnePoint ℚ`.
  Also `TauCeti.IsPrimitive` and `TauCeti.slopeEquivStd`.
- **Knot exteriors, Dehn filling and surgery** (`LowDimTopology/SolidTorusNeighborhood/`,
  `LowDimTopology/DehnSurgery/`, `Topology/Surgery/Basic.lean`): solid-torus neighbourhoods of
  `C²` knots in `ℝ³` and in `S³` and disjoint ones for links
  (`TauCeti.exists_isSolidTorusNeighborhood`,
  `TauCeti.exists_isSolidTorusLinkNeighborhood_of_forall_nhdsSet`); the exteriors
  `TauCeti.knotExterior` and `TauCeti.linkExterior`, the exterior of the half-radius tori as a
  topological `3`-manifold with torus boundary
  (`TauCeti.IsSolidTorusLinkNeighborhood.exteriorChartedSpace`); the meridian generating
  `H₁` of the complement (`TauCeti.IsSolidTorusNeighborhood.complementHomologyEquiv`), the
  preferred longitude (`TauCeti.IsSolidTorusNeighborhood.ker_boundaryHomologyMap`) and framing
  `TauCeti.IsSolidTorusNeighborhood.preferredFramedBoundaryTorus`; the exterior of the unknot as a
  solid torus, `TauCeti.unknotExteriorHomeomorph`; Dehn fillings `TauCeti.DehnFilling h s Y` and
  `TauCeti.LinkDehnFilling`, recorded inside the filled space, with existence along every slope
  (`TauCeti.IsSolidTorusNeighborhood.exists_dehnFilling`,
  `TauCeti.IsSolidTorusLinkNeighborhood.exists_linkDehnFilling`), uniqueness for gluings isotopic to
  matrix gluings (`TauCeti.DehnFilling.exists_homeomorph_of_isotopic_torusHomeomorph`), the
  `∞`-filling (`TauCeti.DehnFilling.nonempty_homeomorph_of_fillingSlope_meridian`), the unknot's
  lens-space and `S¹ × S²` fillings
  (`TauCeti.DehnFilling.nonempty_homeomorph_lensSpace_of_unknot_slopeValue`,
  `TauCeti.DehnFilling.nonempty_homeomorph_circle_prod_sphere_of_unknot_longitude`) and compatible
  orientations `TauCeti.DehnFilling.IsOrientationCompatible`; surgery on a framed sphere in every
  dimension, `TauCeti.SphereSurgery`, with `TauCeti.SphereSurgery.toDehnFilling` for integral
  surgery on a framed knot; the cosmetic predicates
  `TauCeti.IsSolidTorusNeighborhood.IsPurelyCosmetic` and
  `TauCeti.IsSolidTorusNeighborhood.IsChirallyCosmetic`, the propositions
  `TauCeti.CosmeticSurgeryConjecture` and `TauCeti.MathieuChirallyCosmeticTheorem` (the case
  `k = 0` of Mathieu's family, `Cosmetic.lean`); the Weeks manifold `TauCeti.IsWeeksManifold` with
  `TauCeti.exists_isWeeksManifold` (`Link/Weeks.lean`).
  In detail: `IsSolidTorusNeighborhood.frontier_image`
  (`LowDimTopology/SolidTorusNeighborhood/Basic.lean`); `TauCeti.knotExterior`
  (`SolidTorusNeighborhood/Exterior.lean`); `TauCeti.unknotSolidTorus` and
  `TauCeti.unknotExteriorHomeomorph` (`SolidTorusNeighborhood/Unknot.lean`);
  `TauCeti.exists_isSolidTorusNeighborhood_sphere` (`SolidTorusNeighborhood/Sphere.lean`);
  `TauCeti.IsSolidTorusLinkNeighborhood` (`SolidTorusNeighborhood/Link/Basic.lean`);
  `TauCeti.IsOrientationPreservingAtCore` (`SolidTorusNeighborhood/Orientation.lean`);
  `FramedBoundaryTorus.ofHomeomorph`, `FramedBoundaryTorus.torusCurveClass`,
  `FramedBoundaryTorus.value_mk_torusCurveClass` and
  `IsSolidTorusNeighborhood.framedBoundaryTorus` (`DehnSurgery/Framing.lean`);
  `IsSolidTorusNeighborhood.framingNumber`, `preferredFramedBoundaryTorus`,
  `complementHomologyEquiv`, `complementHomologyEquiv_boundaryHomologyMap_preferred` and
  `ker_boundaryHomologyMap`, under the vanishing of the reduced integral homology of the ambient
  space in degrees `1` and `2`, which for `S³` is
  `TauCeti.isZero_reducedSingularHomologyFunctor_one_sphere_euclideanSpace_fin_four` and its
  degree-two sibling (`DehnSurgery/SeifertFraming.lean`); `IsSolidTorusNeighborhood.fillingSlope`
  with `fillingSlope_refl` and `fillingSlope_prodComm`, `DehnFilling.desc`,
  `DehnFilling.transHomeomorph`, `DehnFilling.openExteriorEmbedding` and
  `IsSolidTorusNeighborhood.meridianDehnFilling` (`DehnSurgery/Filling.lean`);
  `IsSolidTorusNeighborhood.dehnFillingSpace` with the existence theorems
  (`DehnSurgery/Existence.lean`);
  `IsSolidTorusNeighborhood.exists_fillingSlope_torusHomeomorph_eq` and
  `DehnFilling.exists_homeomorph_of_isotopic` with the uniqueness theorems
  (`DehnSurgery/Uniqueness.lean`); `TauCeti.framingNumber_unknotSolidTorus`,
  `TauCeti.preferredFramedBoundaryTorus_unknotSolidTorus` and `TauCeti.unknotZeroDehnFilling` with
  `unknotZeroDehnFilling_gluing` (`DehnSurgery/Unknot.lean`); `TauCeti.unknotLensSpaceDehnFilling`
  (`DehnSurgery/LensSpace.lean`); `TauCeti.LinkDehnFilling` (`DehnSurgery/Link/Filling.lean`) and
  `IsSolidTorusLinkNeighborhood.surgerySlope` with `value_surgerySlope_framedBoundaryTorus`
  (`DehnSurgery/Link/Surgery.lean`); `DehnFilling.IsOrientationCompatible`
  (`DehnSurgery/Orientation.lean`) on `TauCeti.HomologicalOrientation`
  (`AlgebraicTopology/Singular/LocalHomology/Orientation/Homological.lean`); the propositions
  `TauCeti.NiWuCosmeticSurgeryTheorem` and `TauCeti.HanselmanCosmeticSurgeryTheorem` with the
  cosmetic predicates (`DehnSurgery/Cosmetic.lean`); `TauCeti.AkbulutKirbyConjecture` and its
  negation `TauCeti.YasuiTheorem` (`DehnSurgery/AkbulutKirby.lean`); `TauCeti.sphereExterior`
  (`Topology/Surgery/Basic.lean`), `TauCeti.solidTorusFramedSphere` and
  `SphereSurgery.toDehnFilling` (`DehnSurgery/SphereSurgery.lean`); and
  `TauCeti.isWeeksManifold_congr` (`LowDimTopology/DehnSurgery/Link/Weeks.lean`).
- **Handlebodies and Heegaard splittings** (`LowDimTopology/Handlebody/`,
  `LowDimTopology/Heegaard/`): `TauCeti.handlebody g` with its free fundamental group
  (`TauCeti.nonempty_fundamentalGroup_handlebody_mulEquiv_freeGroup`);
  `TauCeti.HeegaardSplitting M` (`Splitting.lean`), the genus `TauCeti.heegaardGenus` with
  `TauCeti.heegaardGenus_congr` and `TauCeti.heegaardGenus_sphere`; the rank bound
  `TauCeti.rank_fundamentalGroup_le_heegaardGenus` (`FundamentalGroup.lean`); the propositions
  `TauCeti.RankGenusConjecture` and `TauCeti.LiRankGenusTheorem` (`RankGenus.lean`).
  In detail: `TauCeti.planarSurface g`, `TauCeti.handlebody_zero` and
  `TauCeti.nonempty_homeomorph_handlebody_one` (`LowDimTopology/Handlebody/Basic.lean`);
  `TauCeti.rank_fundamentalGroup_handlebody_le`, `TauCeti.isPathConnected_frontier_handlebody` and
  `TauCeti.fundamentalGroup_map_frontier_handlebody_surjective`
  (`Handlebody/FundamentalGroup.lean`); the splittings with `symm`, `transHomeomorph` and
  `ofIsClosed`, the genus `TauCeti.heegaardGenus M` under `[Nonempty (HeegaardSplitting M)]` with
  `heegaardGenus_le`, `exists_genus_eq_heegaardGenus` and `heegaardGenus_eq_zero_iff`, and
  `TauCeti.hemisphereHeegaardSplitting` (`LowDimTopology/Heegaard/Splitting.lean`);
  `TauCeti.cliffordHeegaardSplitting` and `TauCeti.exists_heegaardSplitting_genus_eq_one`
  (`Heegaard/Clifford.lean`); `HeegaardSplitting.fundamentalGroup_map_left_surjective`,
  `HeegaardSplitting.fg_fundamentalGroup` and `HeegaardSplitting.rank_fundamentalGroup_le_genus`
  (`Heegaard/FundamentalGroup.lean`); `LiRankGenusTheorem.not_rankGenusConjecture` and
  `TauCeti.exists_heegaardGenus_sphere_eq_rank` (`Heegaard/RankGenus.lean`);
  `LensSpace.heegaardSplitting` and `LensSpace.heegaardGenus_eq_one`
  (`Heegaard/LensSpace/Splitting.lean`); `DehnFilling.heegaardSplitting`,
  `DehnFilling.heegaardGenus_le_one` and `TauCeti.heegaardGenus_circle_prod_sphere`
  (`Heegaard/DehnFilling.lean`).
- **Lens spaces** (`Geometry/Manifold/Instances/LensSpace.lean`,
  `AlgebraicTopology/UniversalCover/LensSpace/`): `TauCeti.lensGroup m ℓ`, the quotient
  `TauCeti.LensSpace m ℓ` of the unit sphere with its analytic manifold structure, and its fundamental
  group `Multiplicative (ZMod m)`.
  Here `m ≥ 1` and `ℓ : Fin (k + 1) → (ZMod m)ˣ`, the orbit space of the unit sphere of `ℂ^{k+1}`
  under `ℤ/m` rotating the `i`-th coordinate by `2πℓᵢ/m`
  (`AlgebraicTopology/UniversalCover/LensSpace/Basic.lean`), of dimension `2k + 1`;
  `LensSpace.fundamentalGroupMulEquiv` (`π₁ ≅ ℤ/m` for `k ≥ 1`), `LensSpace.card_fundamentalGroup`
  and the invariance of `m` under homeomorphism `LensSpace.eq_of_homeomorph`
  (`LensSpace/FundamentalGroup.lean`). The three-dimensional `L(p, q)` is
  `TauCeti.LensSpace p ![1, q]`; its spherical structure is
  `TauCeti.LensSpace.hasGeometricStructure_spherical`, and its genus-one splittings
  `LensSpace.heegaardSplitting` and `LensSpace.heegaardGenus_eq_one` are listed under
  *Handlebodies and Heegaard splittings*.
- **Seifert fibrations** (`LowDimTopology/SeifertFibration.lean`): `TauCeti.SolidTorus`,
  `TauCeti.SolidTorus.fiberSetoid p q`, `TauCeti.IsSeifertFibration`, `TauCeti.IsSeifertFibered`,
  invariance under homeomorphism, and the products `F × Circle`.
- **Fundamental groups and van Kampen** (`FundamentalGroup/VanKampen/Basic.lean`,
  `FundamentalGroup/VanKampen/Presentation/`, `Topology/Homotopy/`):
  `TauCeti.isPushout_fundamentalGroup` (the pushout square of fundamental groups for an
  open cover by two sets with path-connected intersection, used for punctured discs),
  `TauCeti.vanKampen_hom_ext`, `FundamentalGroup.homeomorphMulEquivOfEq` and
  `HomotopyGroup.homeomorphMulEquivOfEq` (the isomorphisms of fundamental and higher homotopy
  groups induced by a homeomorphism carrying one base point to the other;
  `AlgebraicTopology/FundamentalGroup/Homeomorph.lean`,
  `Topology/Homotopy/HomotopyGroup/Homeomorph.lean`).
- **Irreducibility, incompressibility, Haken manifolds** (`Geometry/Manifold/`,
  `AlgebraicTopology/FundamentalGroup/Incompressible.lean`): `TauCeti.IsSphereBoundsBall`,
  `TauCeti.IsIncompressible` (embedding and injective on `π₁` at every base point),
  `TauCeti.IsClosedIncompressibleSurfaceEmbedding`, `TauCeti.IsHakenSurfaceEmbedding`,
  `TauCeti.IsPossiblyNonorientableHakenThreeManifold` and its closed variant,
  `TauCeti.IsVirtuallyHaken`; `TauCeti.IsAspherical X x`
  (`AlgebraicTopology/EilenbergMacLane/Basic.lean`): `X` is path-connected and `π_(n+2)(X, x)` is
  trivial for every `n`, with `TauCeti.IsAspherical.of_basepoint` moving the base point and
  `TauCeti.IsAspherical.of_homotopyEquiv` (`EilenbergMacLane/HomotopyEquiv.lean`) transporting it
  along homotopy equivalences; `TauCeti.Orientable I M` (`Geometry/Manifold/Orientation/Basic.lean`),
  the existence of a manifold orientation, an orientation of the tangent spaces compatible
  with the chart Jacobians, for a model over a finite-dimensional space; it takes no
  smoothness index and needs no `IsManifold` instance. `TauCeti.IsOrientedAtlas I n A`
  (`Geometry/Manifold/Orientation/OrientedAtlas.lean`), for `n ≠ 0`: `A` is a set of charts of
  the maximal `C^n` atlas covering `M` whose coordinate changes lie in
  `TauCeti.orientationPreservingGroupoid I`, that is, have derivatives of positive determinant
  read through `I`; `TauCeti.IsOrientedAtlas.orientable`
  (`Geometry/Manifold/Orientation/Atlas.lean`) makes a `C¹` manifold `M` (`IsManifold I 1 M`)
  orientable from such an atlas. Over a boundaryless model `ℝⁿ`, `n ≥ 1`, every orientable
  manifold has one (restrict charts to the components of their domains and reflect where they
  reverse orientation); with boundary this fails (the Check under 8.1). `sphere_theorem` and
  `waldhausen_theorem` state orientability as the existence of an oriented smooth atlas.
  `TauCeti.IsSphereBoundsBall` is in `Geometry/Manifold/Irreducible.lean` and
  `TauCeti.IsClosedIncompressibleSurfaceEmbedding` in `Geometry/Manifold/Incompressible.lean`; the
  Haken predicates `TauCeti.IsClosedHakenSurfaceEmbedding` and
  `TauCeti.IsPossiblyNonorientableClosedHakenThreeManifold` are in `Geometry/Manifold/Haken.lean`,
  and `TauCeti.IsVirtuallyHaken` with `TauCeti.VirtualHakenConjecture` in
  `Geometry/Manifold/VirtuallyHaken.lean` and `Riemannian/Hyperbolic/VirtualHaken.lean`.
- **Manifold predicates** (`Geometry/Manifold/Basic.lean`):
  `TauCeti.IsClosedConnectedManifold n M` (compact, connected, Hausdorff, second-countable and
  boundaryless) and `TauCeti.IsCompactConnectedThreeManifold` (compact and connected, possibly
  with boundary).
- **Torus decompositions** (`LowDimTopology/JSJDecomposition.lean`,
  `LowDimTopology/Geometrization.lean`): `TauCeti.IsPeripheralTorus`, `TauCeti.IsAtoroidal`,
  `TauCeti.IsTorusDecomposition`, `TauCeti.IsJSJDecomposition` (minimality under inclusion),
  `TauCeti.JSJTheorem`, `TauCeti.IsGeometricTorusDecomposition`, `TauCeti.GeometrizationConjecture`.
- **Geometric structures and hyperbolic metrics** (`Geometry/Manifold/Riemannian/`):
  `TauCeti.ModelGeometry` (the eight Thurston geometries as a finite type) with `Space`,
  `model`, `TauCeti.HasGeometricStructure M G` and its quotient characterization
  (`GeometricStructure/Basic.lean`); `TauCeti.HyperbolicMetric` (complete, constant curvature
  `−1`), `TauCeti.IsHyperbolic` (`Hyperbolic.lean`); `TauCeti.HyperbolicMetric.Isometry`,
  `TauCeti.RiemannianIsometry`, the isometry group `TauCeti.Isom I M` with `toDiff`
  (`Isometry/`); `TauCeti.hypVolumeOfMetric`, `TauCeti.hypVolume`,
  `TauCeti.hypVolumeOfMetric_eq_of_mostow` (`Hyperbolic/Volume.lean`);
  `TauCeti.HyperbolicMetric.HasFiniteVolume`, `TauCeti.IsFiniteVolumeHyperbolic`
  (`Hyperbolic/FiniteVolume.lean`); `TauCeti.IsMostowRigid`, `TauCeti.MostowRigidity`
  (`Hyperbolic/Mostow.lean`); the simplicial volume of a closed oriented manifold
  `TauCeti.HomologicalOrientation.simplicialVolume`, the `ℓ¹`-seminorm `SSet.homologyL1Seminorm`
  of its real fundamental class, with its homotopy invariance
  `TauCeti.HomologicalOrientation.simplicialVolume_eq_of_homotopyEquiv` and its vanishing
  `TauCeti.HomologicalOrientation.simplicialVolume_eq_zero_of_one_lt_abs` under a self-map of
  degree of absolute value at least two (`AlgebraicTopology/Singular/LocalHomology/SimplicialVolume.lean`,
  `AlgebraicTopology/SimplicialSet/Homology/L1Norm.lean`), the proportionality with hyperbolic
  volume not being proved there; the smooth singular simplices `TauCeti.SmoothSimplex I M k`,
  smooth near each point of the full-dimensional simplex `Δᵏ ⊆ ℝᵏ`, forming the subcomplex
  `TauCeti.smoothSingularSubcomplex` of the singular simplicial set
  (`Geometry/Manifold/SmoothSingular/Basic.lean`), with derivatives within `Δᵏ` unique by
  `TauCeti.uniqueDiffOn_fullSimplex` (`Geometry/Convex/FullSimplex.lean`), and the integral of a
  `k`-form over a smooth `k`-simplex `TauCeti.SmoothSimplex.integral`, linear and natural under
  smooth maps (`Geometry/Manifold/SmoothSingular/Integral.lean`), with no topology on the
  simplices, no comparison with singular homology and no Stokes formula there (the last two are
  DifferentialGeometry Layers 8.3 and 8.4); the upper half
  space `TauCeti.UpperHalfSpace E`
  (`Hyperbolic/UpperHalfSpace/Basic.lean`) with its complete metric of curvature `−1`,
  `TauCeti.UpperHalfSpace.hyperbolicMetric` and `TauCeti.UpperHalfSpace.isHyperbolic`
  (`UpperHalfSpace/Metric.lean`); `TauCeti.riemannianVolume` and
  `TauCeti.riemannianTotalVolume` (`VolumeDensity/`); the theorem of Gabai, Meyerhoff and Milley
  as the proposition `TauCeti.GabaiMeyerhoffMilleyTheorem` (`Hyperbolic/Weeks.lean`).
  The model geometries with their eight constructors and `ModelGeometry.Space` are in
  `Riemannian/ModelGeometry/Basic.lean`, the geometric structures in
  `Riemannian/GeometricStructure/Basic.lean`, `TauCeti.HyperbolicMetric` and
  `TauCeti.IsHyperbolic` in `Riemannian/Hyperbolic.lean`, `TauCeti.riemannianVolume` in
  `Riemannian/VolumeDensity/Volume.lean`, and the theorem of Gabai, Meyerhoff and Milley in
  `Riemannian/Hyperbolic/Weeks.lean`.
- **Mapping tori and virtual properties** (`Topology/`): `TauCeti.MappingTorus φ`,
  `TauCeti.FibersOverCircle`, `TauCeti.IsFiniteCover`, `TauCeti.IsVirtuallyFibered`,
  `TauCeti.VirtualFiberingConjecture`, `TauCeti.VirtualHakenConjecture`.
  Also `TauCeti.MappingTorusPresentation` (`Topology/MappingTorus/Basic.lean`), with
  `TauCeti.IsFiniteCover` in `Topology/Covering/IsFiniteCover.lean` and
  `TauCeti.IsVirtuallyFibered` in `Topology/VirtuallyFibered.lean`.
- **Foliations** (`Geometry/Manifold/Foliation/`): `TauCeti.Foliation I n M k`, the leaf
  relation `TauCeti.Foliation.SameLeaf` and `TauCeti.Foliation.leaf`,
  `TauCeti.Foliation.IsClosedTransversal`, `TauCeti.Foliation.Taut`, the linear
  foliations `TauCeti.Foliation.ofSubmodule`, and the Euler class of the tangent field
  `TauCeti.Foliation.eulerClass` with the propositions `TauCeti.ThurstonEulerClassInequality`,
  `TauCeti.EulerClassOneConjecture` and `TauCeti.YazdiEulerClassOneTheorem` (`EulerClass.lean`).
  In detail: `TauCeti.Foliation` and `Foliation.ofSubmodule` are in `Foliation/Basic.lean`, on the
  distribution interfaces `TauCeti.IsContMDiffDistribution` and `TauCeti.IsInvolutiveDistribution`
  (`Geometry/Manifold/Distribution.lean`); the leaves are in `Foliation/Leaf.lean`; tautness, with
  `TauCeti.Foliation.not_taut_ofSubmodule_ker` (the foliation of a normed space by the cosets of
  the kernel of a functional is not taut), is in `Foliation/Taut.lean`; and
  `Foliation/EulerClass.lean` has `Foliation.thomPair`, `Foliation.IsThomClass`,
  `Foliation.IsEulerClass` (a class is an Euler class of `F` when it is the Euler class of some
  Thom class of the tangent field), `IsEulerClass.neg`,
  `Foliation.eulerClass_eq_zero_of_forall_ne_zero`, the inequality predicates
  `TauCeti.EulerClassBounded` with `eulerClassBounded_neg_iff` and `TauCeti.EulerClassNormOne`
  with `not_eulerClassNormOne_zero`, and the refutation
  `YazdiEulerClassOneTheorem.not_eulerClassOneConjecture`.
- **Euler classes of vector bundles and fundamental classes**
  (`Topology/VectorBundle/EulerClass.lean`, `AlgebraicTopology/`): the Thom pair
  `TauCeti.thomPair` of a real vector bundle, the Thom classes `TauCeti.IsThomClass` with
  `IsThomClass.singularCohomologyMap`, and the Euler class `TauCeti.eulerClass` with
  `eulerClass_naturality`, `eulerClass_pullback`, `eulerClass_eq_zero_of_forall_ne_zero` and
  `eulerClass_trivial_eq_zero`; `TauCeti.HomologicalOrientation.evalFundamentalClass`
  (`AlgebraicTopology/Cohomology/FundamentalClass.lean`); `TauCeti.FiniteCWType`
  (`Topology/CWComplex/Classical/FiniteCWType.lean`) and the Euler characteristic
  `TauCeti.eulerChar` (`AlgebraicTopology/Cellular/EulerCharacteristic/FiniteCWType.lean`).
- **Simplicial complexes** (`AlgebraicTopology/SimplicialComplex/`, `Topology/`):
  `AbstractSimplicialComplex.Realization K` with face inclusions and barycentric coordinates,
  the realization of maps, subcomplexes and locally finite complexes;
  `AbstractSimplicialComplex.instT2SpaceRealization`,
  `AbstractSimplicialComplex.exists_finset_support_subset_of_isCompact`,
  `PreAbstractSimplicialComplex.SimplicialMap.realizationMap` with `realizationMap_id` and
  `realizationMap_comp` (`Realization/`); the CW structure
  `AbstractSimplicialComplex.realizationCWComplex` (`Realization/CWComplex/Basic.lean`) and its
  transport `Topology.IsClosedEmbedding.relCWComplex` (`Topology/CWComplex/Classical/Image.lean`);
  the finite stellar homeomorphism
  `PreAbstractSimplicialComplex.exists_homeomorph_stellarSubdivision`
  (`Subdivision/Stellar/Homeomorph.lean`) and the point-set bijection of arbitrary stellar moves
  (`Subdivision/Stellar/Realization.lean`, `Geometry.lean`); joins with the closed-star laws
  `PreAbstractSimplicialComplex.map_closedStar_eq_join` and
  `PreAbstractSimplicialComplex.map_closedStar_inf_deletion_eq_join` (`Join/`);
  `PreAbstractSimplicialComplex.IsCombinatorialManifold.exists_chartedSpace_hasGroupoid_PLGroupoid`
  (`CombinatorialManifold/PL.lean`); the smooth-triangulation predicate
  `TauCeti.IsSmoothTriangulation` with secant approximation on edgewise subdivisions
  (`Geometry/Manifold/SmoothTriangulation/`); `PreAbstractSimplicialComplex.closedStar`,
  `link`, `deletion` (`LinkStar.lean`); stellar subdivision (`Subdivision/`); the ordered
  cylinder `AbstractSimplicialComplex.orderedCylinder` (`Product.lean`);
  `PreAbstractSimplicialComplex.IsCombinatorialBall`, `IsCombinatorialSphere`,
  `IsCombinatorialManifold` by pattern matching on the dimension (`CombinatorialManifold/`);
  `PreAbstractSimplicialComplex.IsFreePair`, `ElementaryCollapsesTo`, `CollapsesTo`,
  `Collapsible` (`ElementaryCollapse.lean`, `Collapse/`); `TauCeti.IsTriangulable`,
  `TauCeti.IsCombinatoriallyTriangulable`, `TauCeti.TriangulationConjecture n`,
  `AbstractSimplicialComplex.Contractible2Complex`, `TauCeti.ZeemanConjecture`.
  In detail: the realization with `faceInclusion`, `carrier`, `vertex` and `realizationMap` for
  inclusions (`SimplicialComplex/Realization/Basic.lean`);
  `PreAbstractSimplicialComplex.SimplicialMap` (`SimplicialComplex/Maps.lean`) with
  `SimplicialMap.realizationMap` and `realizationHomeomorph` (`Realization/Map.lean`); the
  compactness of finite realizations and the closed coordinate embedding
  (`Realization/Finite.lean`), local compactness for finite vertex stars
  (`Realization/LocallyFinite.lean`), subcomplexes as closed embeddings
  (`Realization/Subcomplex.lean`) and glued homotopies (`Realization/Homotopy.lean`);
  `PreAbstractSimplicialComplex.link` (`SimplicialComplex/LinkStar.lean`);
  `AbstractSimplicialComplex.orderedProd` and `orderedCylinder`
  (`SimplicialComplex/Product.lean`); `PreAbstractSimplicialComplex.ElementaryCollapsesTo`,
  `CollapsesTo` and `Collapsible` (`SimplicialComplex/ElementaryCollapse.lean`,
  `Collapse/Basic.lean`) with the collapse of cones and of cylinders of cones
  (`Collapse/Cone.lean`, `Collapse/Cylinder/Basic.lean`); the combinatorial balls, spheres and
  manifolds with the dimension-zero case (`CombinatorialManifold/Basic.lean`);
  `AbstractSimplicialComplex.realizationStandardSuccSimplexBoundaryHomeomorphSphere n : |∂Δⁿ⁺¹| ≃ₜ Sⁿ`
  (`Simplex/BoundarySphere.lean`); the Zeeman declarations in `SimplicialComplex/Zeeman.lean`;
  `TauCeti.IsTriangulable` in `Topology/Triangulable/Basic.lean`; and `TauCeti.FiniteCWType`.

### From TauCetiRoadmap.DifferentialGeometry

Faces of manifolds with corners and the abstract boundary (the *Boundary and corners*
section); the fundamental theorem of flows on finite-dimensional manifolds and the two-time
flow of a time-dependent vector field (Layer 3); involutive distributions, the Frobenius
theorem and leaves (Layer 4); integration of densities and forms (Layer 5); existence of a
smooth Riemannian metric on a paracompact manifold and the comparison of densities with
`TauCeti.riemannianVolume` (Layer 12).

Layer 8.3: the smooth singular chains, whose simplices are the pinned `TauCeti.SmoothSimplex`,
and the smoothing theorem: for a Hausdorff σ-compact smooth manifold modelled on a
finite-dimensional space, the inclusion of the smooth singular chains into the real singular
chains is a chain homotopy equivalence, with a chosen homotopy inverse and both chain homotopies;
for a manifold without boundary it is built by relative Whitney approximation inductively over
faces, a singular simplex whose faces are smooth being homotopic relative to its boundary to a
smooth simplex with the same faces. Layer 8.4: Stokes' formula for a smooth simplex, the integral
of `dω` over a smooth `(p + 1)`-simplex being the alternating sum `Σᵢ (−1)ⁱ` of the integrals of
the `C¹` form `ω` over its faces, and for smooth chains by linearity. Layer 7.2 consumes Layer 8.3
for Löh's Propositions 5.3 and 5.5 and Layer 8.4 for Stokes' formula on measure chains; nothing
is assumed of them beyond these statements and, without boundary, the face-by-face construction.

The consumers of the other items: Layer 1.3 glues along the faces of a manifold with corners and
the abstract boundary of DifferentialGeometry 5.5; Layer 10.1 takes distributions, involutivity,
the flat charts, the Frobenius theorem and the leaves of a foliation from DifferentialGeometry
Layer 4, on the pinned `TauCeti.Foliation`; and Layer 7.1 consumes DifferentialGeometry 12.4, the
comparison of `TauCeti.riemannianVolume` with densities and form integration, for the statement
that the hyperbolic volume form integrates to the volume.

### From TauCetiRoadmap.HopfRinow

The Levi-Civita connection and its regularity, the geodesic flow, the exponential map and its
domain (Layer 1); normal neighbourhoods and the Gauss lemma (Layer 2); the Hopf–Rinow theorem
(Layer 3).

Layer 4: smooth Riemannian isometries and the transport of the Levi-Civita connection, geodesics
and exponential maps along them, consumed by Layer 7.2.

### From TauCetiRoadmap.AlgebraicTopology

Stage 1: van Kampen through the fundamental groupoid, with the two-open-set pushout and its
group-presentation corollaries, consumed by Layer 1.4 (the fundamental group of a connected sum),
Layer 2.1 (the trefoil group in the Check on the cone on a polygonal trefoil), Layer 5.2 (the
fundamental groups of fillings), Layers 8.2 and 8.6 (the free-product decomposition of `π₁` along
a prime decomposition, Kneser's finiteness and the simple connectivity of the summands of a simply
connected sum) and Layers 9.1 and 9.2 (the fundamental groups of the non-orientable handlebodies
and of splittings). Stages 2 and 3: singular homology and the Mayer–Vietoris sequence, consumed by
Layers 4.1, 5.1, 5.2 and 7.4 (the first homology of exteriors, of fillings and of the Weeks
manifold). Stage 4: CW pairs, the cellular chain complex and its comparison with singular
homology, consumed by Layer 11.1 (the cellular chain complex of a polyhedron and its boundary
formula) and Layer 10.3 (cellular cochains, for the obstruction-theoretic Euler class). Stage 5:
covering spaces, consumed by Layer 6.4 for the infinite cyclic cover. Stage 6: singular cohomology
of CW complexes, cup products, fundamental classes and Poincaré duality, consumed by Layers 10.3
and 10.4 (the Euler class and its pairing, and `H₂(M; ℤ)` for the Thurston norm); and its item
6.5, the homological characterization of the degree of a map of closed oriented connected
manifolds (`f_*[M] = deg f · [N]` on the fundamental classes), consumed by Layers 3.1 and 3.2 and
by Layer 10.3 (the degree on the boundary circle of a `2`-cell of a section over the
`1`-skeleton). Stage 7: the Euler characteristic of a finite decomposition, consumed by Layer 1.4.
Stage 8: ordinary representability, consumed by Layer 10.4 for the representation of a class of
`H¹` by a map to the circle. Nothing is assumed of them beyond their statements.

### From TauCetiRoadmap.TypeAHeckeAlgebras

H1 supplies the finite type-A Hecke algebras and H2 the Ocneanu trace and its braid-closure
invariance. Layer 4 consumes them for the HOMFLY trace theorem and the low-strand
Jones/Burau block comparisons; it owns the geometric closure and native-matrix comparisons.

### From TauCetiRoadmap.TemperleyLieb

Layer 2: the Temperley–Lieb diagram category, composition gluing along the middle boundary and
counting the closed circles formed; Layer 3: the linear category `TL(R, δ)` over a commutative
ring, a circle evaluating to `δ`, with the diagram bases of its hom-modules; Layer 4: the
comparison of the native `TauCeti.TemperleyLieb R δ n` with the diagram algebra, its
diagram basis `exists_basis_planarMatching` (free of rank `catalan n` over every commutative ring),
the strand inclusions, the closure trace and `existsUnique_isMarkovTrace` (exactly one Markov
family at every `δ`, equal to the native `markovTrace q hδ` when `δ = −(q + q⁻¹)`); Layer 5: cell
modules, Gram determinants and the semisimplicity criteria `isSemisimpleRing_of_qInt_ne_zero` and
`isSemisimpleRing_iff_of_charZero`; Layer 6: the Jones–Wenzl projections, with
`existsUnique_jonesWenzl` (when the quantum integers `[1], …, [n]` are units there is exactly one
idempotent `f_n` of augmentation `1` killed on both sides by every `e_i`), the Wenzl recursion
`f_(n+1) = f_n − ([n]/[n+1]) f_n e_n f_n`, the partial trace of `f_(n+1)` equal to
`([n+2]/[n+1]) f_n`, and `IsMarkovTrace.apply_jonesWenzl` (every Markov trace takes the value
`[n+1]` on `f_n`). Layers 4.5.1, 4.5.3 and 4.5.6 consume Layers 4–5 for the diagram basis, base
change, algebraic Markov uniqueness and generic blocks; Layer 4.8.1 consumes Layers 2–4 and 6
for the colored cabling, over `ℚ(A)` at `δ = −A² − A⁻²`, where every `[k]` with `k ≥ 1` is
nonzero. Nothing is assumed of them beyond their statements.

### From TauCetiRoadmap.Subfactors

§3.1: the conjugate-linear adjoint `†` on `TL_n(ℂ, δ)` for real `δ`, fixing every generator and
compatible with strand inclusions. §3.2: Jones's positivity theorem `markovTrace_nonneg_iff` (for
`δ > 0` and `δ = −(q + q⁻¹)`, `T_n(x† x) ≥ 0` for every `n` and `x` exactly when `δ` lies in
`jonesLoopParameters = {2cos(π/m) : m ≥ 3} ∪ [2, ∞)`), the trace radical `R_n`, a two-sided
`†`-stable ideal, and Cauchy–Schwarz, by which `R_n` is the null space of `x ↦ T_n(x† x)`. §3.3:
the positive path representations `π_n` on the half-line for `δ ≥ 2` and on `A_(m−1)` for
`δ = 2cos(π/m)`, with `ker π_n = R_n`, the quotient `Q_n = TL_n / R_n` a finite direct sum of
matrix algebras with faithful positive trace, and `R_n = 0` for `δ ≥ 2`. Layer 4.5.6 consumes
these at the parameters `δ = u + u⁻¹` it uses, with `q = −u`.

### From TauCetiRoadmap.ReductiveGroups

§11A (*Plane configurations, geometric braids and their basepoints*) supplies the ordered and
unordered configuration spaces of `n` points of the plane, the homeomorphism between the
plane and the open unit disc, the identification of relative homotopy classes of
collision-free strand systems in `ℂ×[0,1]` with `TauCeti.BraidGroup n` with stacking matched
to the fundamental-group product, the endpoint permutation as `permHom`, the pure part as
`pureSubgroup n`, the exact sequence `1 → P_n → B_n → S_n → 1` and the convention of its
positive half-twist. Layer 4.2.8 consumes it for smooth geometric braids, owning the smooth
carrier, the smooth comparison, the calibration of that half-twist against the pinned closure
and the reading of a braid word off a generic projection.

### From TauCetiRoadmap.SuccessiveMinima

Layer 1: the successive minima `λ_i(L, K)` of a discrete full lattice `L` in a finite-dimensional
real normed space for a convex body `K` with `0` in its interior, their positivity, the threshold
characterization by independent lattice vectors, and target 1.5 `exists_successiveMin_witnesses`
(a real basis of lattice vectors `b_i` with gauge `λ_i`, every lattice vector of gauge `< λ_i`
lying in the span of the earlier `b_j`). Layer 7.3.1 consumes them for `E = ℂ` and `K` the closed
unit disc, where the gauge is the norm.

## How to read the build

The layers group the targets by subject; the build order is the order of the `*Needs:*` lines,
target by target, and it is not the numerical order of the layers. Layer 1 is the spine:
everything later that cuts a manifold open and reglues it is an instance of its constructions. Six
groups of targets are built before the layer numbering suggests. The disc theorem for arbitrary
centres of Layer 3.3, which needs only the tubes of Layer 1.5 and the pinned disc theorem,
precedes the cut-and-glue description of the pinned connected sum in Layer 1.4. Layers 3.1, 3.3
and 3.4, which need among the other layers only the tubes of Layer 1.5, precede the
two-dimensional comparison of Layer 11.2.1 and the mapping class groups of Layer 1.7.2. The
handlebodies and Heegaard splittings of Layer 9.1, which need Layers 1.3, 1.7, 1.7.2 and 11.2,
precede the Lickorish–Wallace theorem of Layer 5.2. The realizations and smooth triangulations of
Layers 11.1 and 11.3, which need only Layer 1.6, then the surface theorems of Layer 11.2.1, which
need in addition Layers 1.1, 3.3 and 3.4, then Moise's theorems of Layer 11.2, which need Layer
11.2.1, precede Layer 1.7, the three-dimensional case of the annulus theorem in Layer 2.3, Löh's
comparison in Layer 7.2, and Layers 8 and 9. The smooth structure of the pinned exterior in
Layer 5.1, built from Layers 1.5,
3.3 and 4.1, precedes the Alexander module of Layer 4.4. The decomposition theorems of Layers 8.1–8.4, which need Layers 1,
4.4, 5.1 and 11.2, precede the cyclic surgery theorem of Layer 5.4 and the finite-volume theory of
Layer 7.3. With these edges the graph of targets is acyclic. Otherwise Layers 2 and 3 are
independent of each other and of Layer 4; Layer 6 (concordance) needs Layers 1, 2 and 4, and
the reduction of Levine's theorem in Layer 6.4 also Layer 5.2, and its PL form Layer 11.3; Layer 7
needs Layer 1 and the Riemannian suppliers, for Löh's comparison the smooth triangulations of
Layer 11.3, and for its finite-volume part the Dehn filling of
Layer 5.2 and the irreducibility of Layer 8.2; Layer 9 (Heegaard splittings) needs Layers 1, 7, 8
and 11; and Layer 10 (foliations) needs Layers 1, 2, 5, 7, 8 and 9. Each layer ends with its
examples and its dependencies on the others.
The following edges keep the graph acyclic. Moise's theorem of Layer 11.2 also precedes the smooth
structure of a filling in Layer 5.2, and the concordance relation of Layer 6.1 precedes the
Akbulut–Kirby statement of Layer 5.3. Layer 9 also needs the bicollars of Layer 2. Layers
10.3–10.5 need in addition the pinned Thom classes, Euler classes and Euler class inequalities,
AlgebraicTopology's cohomology and fundamental classes, the locally flat surfaces of Layer 2.1,
the hyperbolic manifolds of Layer 7.2, the irreducibility of Layer 8.2 and the incompressible
surfaces of Layer 8.3.

Section anchors that other roadmaps link to resolve as follows:

- `#layer-1-manifold-library-buildout-general-dimension-general-structure-group` → Layer 1;
- `#layer-4-knot-theory-done-properly-owned-here` → Layer 4;
- `#the-smoothing-and-triangulation-comparison-far-horizon` and
  `#the-smoothing-and-triangulation-comparison`, the section *The smoothing-and-triangulation
  comparison*: its item 1 (smooth triangulations, smooth implies PL) → Layer 11.3; its
  item 2 (PL implies Top) → Layer 1.6, through `TauCeti.PLGroupoid_le_continuousGroupoid`;
  its item 3 (the Kirby–Siebenmann obstruction and the TOP/PL comparison) → GeometricTopology,
  Part II.

## Layer 1: manifolds with boundary, gluing, tubular neighbourhoods and handles

Throughout this layer manifolds are real, finite-dimensional, Hausdorff and second countable,
smooth unless said otherwise, with the half-space model `𝓡∂ n` when they have boundary.

### 1.1 Smooth collars

Define a smooth collar of a manifold with boundary `M` as a smooth embedding
`c : ∂M × [0, 1) → M` with open image whose restriction to `∂M × {0}` is the inclusion of the
boundary; `∂M` carries the manifold structure of `TauCeti.isManifold_boundary` and
`∂M × [0, 1)` the product structure with the half-space model in the second factor. A collar
is data: every gluing in this layer takes its collars as arguments, and a smooth collar
forgets to the topological predicate `TauCeti.IsCollar`.

- Every second-countable, in particular every compact, smooth manifold with boundary has a
  smooth collar (Hirsch, *Differential Topology*, Chapter 4, Theorem 6.1; Lee, *Introduction
  to Smooth Manifolds*, Theorem 9.25): flow the boundary along an inward-pointing vector field
  for a small time depending smoothly on the point; in a boundary chart the collar is
  `TauCeti.EuclideanHalfSpace.boundaryCollar` up to the chart's diffeomorphism. *Needs:*
  Mathlib `IsManifold`, `ModelWithCorners.boundary`; Tau Ceti `TauCeti.isManifold_boundary`,
  `TauCeti.IsLocallyCollared`; DifferentialGeometry Layer 3 (flows).
- **Local collars and the topological collar.** The inward-pointing vector field of the
  existence route is patched, by a smooth partition of unity along `∂M`, from the pinned smooth
  local collars: every boundary point of a `C^k` manifold `M` over `𝓡∂ (n + 1)`, `k ≠ 0`, has a
  product collar chart (`TauCeti.exists_isProductCollarChart_of_mem_boundary`) whose source is
  `C^k` diffeomorphic to `V × [0, ε)` for an open `V ⊆ ∂M`, with the boundary as the zero slice
  (`TauCeti.IsProductCollarChart.diffeomorphProd`). The cover of `∂M` by these charts is finite
  when `∂M` is compact and locally finite in general. For compact `∂M` the topological collar is
  already Tau Ceti's, Brown's collaring theorem `TauCeti.IsLocallyCollared.isCollared`; what is
  proved here is that the collar so built is smooth, and that a smooth collar is a topological
  collar (`TauCeti.IsCollar`). *Needs:* Mathlib `modelWithCornersEuclideanHalfSpace`,
  `Diffeomorph`, `SmoothPartitionOfUnity`; Tau Ceti `TauCeti.IsProductCollarChart`,
  `TauCeti.exists_isProductCollarChart_of_mem_boundary`,
  `TauCeti.IsProductCollarChart.diffeomorphProd`, `TauCeti.IsCollar`,
  `TauCeti.IsLocallyCollared.isCollared`.
- **`C^k` collars.** For `k ≠ 0`, a `C^k` manifold `M` over `𝓡∂ (n + 1)` with compact boundary
  has an open embedding `c : ∂M × [0, 1) → M`, `C^k` in the sense of manifolds with boundary,
  with `c(x, 0) = x` (Hirsch, Chapter 4, Theorem 6.1; Lee, *Introduction to Smooth Manifolds*,
  2nd ed., Theorem 9.25), and so has one with paracompact boundary, through the locally finite
  cover by local product collars; the interior of a `C^k` manifold with boundary is a
  boundaryless `C^k` manifold.
- For every `0 < ε ≤ 1`, the restriction of a collar to `∂M × [0, ε)` composed with
  `(x, t) ↦ (x, εt)` is a collar, and so is the precomposition of a collar with `id × ψ` for
  any diffeomorphism `ψ` of `[0, 1)` fixing `0`.
- Any two smooth collars of `M` agree after shrinking up to a diffeomorphism of `M` isotopic
  to the identity through diffeomorphisms fixing `∂M` pointwise (Hirsch, Chapter 4 §6).
- **Uniqueness as a diffeotopy.** For smooth collars `c, c'` of `M` there is a diffeotopy `Φ` of
  `M` (`TauCeti.Diffeotopy`) relative to `∂M`, the identity outside a neighbourhood of `∂M`, with
  `Φ.final ∘ c = c'` on `∂M × [0, 1/2)` (Hirsch, Chapter 4, Section 6).
- The interior `M ∖ ∂M` is a smooth boundaryless manifold, and its inclusion is a homotopy
  equivalence (Lee, Theorem 9.26).
- Collars of a disjoint union are the disjoint unions of collars; a collar of `M` restricts to
  a collar of each boundary component.

**Checks.**
- *Interval collar.* `(0, t) ↦ t/2`, `(1, t) ↦ 1 − t/2` is a collar of `[0, 1]` with open image
  `[0, 1/2) ∪ (1/2, 1]`; without the factor `1/2` it is not injective (by evaluation).
- *Polar collar.* The closed unit disc has the collar `(θ, t) ↦ (1 − t) e^{iθ}`, `t ∈ [0, 1)`,
  whose image `0 < |z| ≤ 1` is open in the disc.
- *Empty boundary.* The circle has empty boundary; its unique collar is the empty embedding,
  and the existence theorem is vacuous rather than false.
- *Inward direction.* `(x, t) ↦ x + t` on `{0, 1} × [0, 1)` is not a collar of `[0, 1]`, since
  it leaves `[0, 1]` at `x = 1`; `(0, t) ↦ t`, `(1, t) ↦ 1 − t` on `{0, 1} × [0, 1/2)` is the
  interval collar above with `[0, 1)` rescaled to `[0, 1/2)`.
- *Topological, not smooth.* `(θ, t) ↦ (1 − t²) e^{iθ}` is a topological collar of the closed
  disc (`TauCeti.IsCollar`) and not a smooth one: its normal derivative vanishes at `t = 0`, so
  it is not a smooth embedding, which the definition asks for; the radial collar
  `(θ, t) ↦ (1 − t/2) e^{iθ}` is smooth.
- *Half-line.* `[0, ∞)` is its own collar `(0, t) ↦ t`; the open interval `(0, 1)`, like the
  circle, has empty boundary and the empty collar.
- *Non-compact boundary.* `[0, ∞) × ℝ` has non-compact boundary `{0} × ℝ` and the collar
  `((0, y), t) ↦ (t, y)`; compactness of `∂M` serves only to make the cover by local collars
  finite.

### 1.2 Complements of embedded balls

For `n ≥ 1`, a boundaryless `n`-manifold `M` and a smooth embedding `e` into `M` of an open
ball of radius `1 + δ` in `EuclideanSpace ℝ (Fin n)`, define the complement of the embedded
closed unit ball as the subtype `M ∖ e(B°)`, `B°` the open unit ball, with the smooth structure
with boundary `e(Sⁿ⁻¹)` in which interior points keep the charts of `M` and the chart near
`e(Sⁿ⁻¹)` is `e` composed with radial coordinates `(1 ≤ r < 1 + δ, θ ∈ Sⁿ⁻¹)`: the collar of
the collaring theorem (Hirsch, Chapter 4, Theorem 6.1) written explicitly through `e`.

- The complement is compact when `M` is, connected when `M` is connected and `n ≥ 2`, and its
  boundary is diffeomorphic to `Sⁿ⁻¹` through `e`.
- The radial chart gives the complement a canonical smooth collar; two embeddings that agree
  on a neighbourhood of the closed ball give the same complement with the same collar.
- The inclusion of the complement into `M` is a smooth embedding of a manifold with boundary
  into a boundaryless manifold (the neat-boundary case of `TauCeti.IsLocallyFlat` applies).
- For `M` with nonempty boundary and `e` landing in the interior, the boundary of the
  complement is the disjoint union `∂M ⊔ e(Sⁿ⁻¹)`.

**Checks.**
- *Dimension one.* For `n = 1` and `M = ℝ` the complement of `(−1, 1)` has two components, so
  the connectedness law needs `n ≥ 2` (by evaluation).
- *Euclidean complement.* The complement of the open unit ball in `EuclideanSpace ℝ (Fin n)` is
  diffeomorphic to `Sⁿ⁻¹ × [1, ∞)` by `x ↦ (x/|x|, |x|)`.
- *Two balls.* Removing two disjoint open balls from `Sⁿ` gives `Sⁿ⁻¹ × [0, 1]`; removing one
  from `S¹` gives a closed interval, whose boundary `S⁰` has two points.

*Needs:* Mathlib `IsManifold`, `Manifold.IsSmoothEmbedding`; Tau Ceti `TauCeti.SmoothEmbedding`,
`TauCeti.chartedSpaceOfIsOpenEmbedding`; Layer 1.1.

### 1.3 Gluing along the boundary and handle attachment

Given smooth manifolds with boundary `M`, `N`, smooth collars `c_M`, `c_N` and a diffeomorphism
`f : ∂M ≃ ∂N`, define `M ∪_f N` as the quotient of `M ⊔ N` by `x ∼ f(x)` with the smooth
boundaryless structure in which the two interiors embed openly and the union of the two
collars is identified with `∂M × (−1, 1)` through `c_M` on `[0, 1)` and `c_N ∘ (f × id)` on
`(−1, 0]`: the atlas is `TauCeti.chartedSpaceOfIsOpenEmbedding` for this open cover by three
manifolds, whose transition maps are smooth because the collars are smooth embeddings. Gluing
a proper codimension-zero face `A ⊆ ∂M` to a face `B ⊆ ∂N` is the same construction with face
collars and produces corners along `∂A` (the face and corner structure is
DifferentialGeometry's). Handle attachment glues a handle `Dᵏ × Dⁿ⁻ᵏ` to `M` along an
embedding `Sᵏ⁻¹ × Dⁿ⁻ᵏ → ∂M` and straightens the corner along `Sᵏ⁻¹ × Sⁿ⁻ᵏ⁻¹`.

In the face gluing, `A ⊆ ∂M` and `B ⊆ ∂N` are codimension-zero submanifolds with corners that are
unions of faces in the sense of DifferentialGeometry 5.5, `f : A ≃ₘ B` is a diffeomorphism, and
the charts near the seam are built from the collars of Layer 1.1 on each side (Hirsch, Chapter 4,
Theorem 6.1 and the discussion of gluing in Chapter 8, Section 2); full-boundary gluing is the
case `A = ∂M`, `B = ∂N`. The face gluing is well defined up to diffeomorphism in the same way as
the full gluing below: changing `f` by a diffeotopy of `B`, or changing the collars, gives
diffeomorphic results (Hirsch, Chapter 8, Section 2, the smoothing of a glued manifold). Handle
attachment along `φ : Sᵏ⁻¹ × Dⁿ⁻ᵏ → ∂M` is `M ∪_φ (Dᵏ × Dⁿ⁻ᵏ)` with the corner rounded by the
collar (Milnor, *Lectures on the h-cobordism Theorem*, Section 3; Gompf–Stipsicz, *4-Manifolds
and Kirby Calculus*, Section 4.1). *Needs:* Mathlib
`modelWithCornersEuclideanQuadrant`, `Diffeomorph`, the quotient topology; DifferentialGeometry
5.5 (faces of a manifold with corners and the abstract boundary); Tau Ceti `TauCeti.Diffeotopy`
and `TauCeti.SmoothEmbedding` for the isotopy statements.

- The inclusions `M → M ∪_f N` and `N → M ∪_f N` are smooth embeddings with closed images
  meeting in the image of `∂M`; the glued manifold is compact when both pieces are, and
  connected when both pieces are connected and `∂M` is nonempty.
- Changing the collars gives a diffeomorphic manifold by a diffeomorphism that is the identity
  away from the seam region; changing `f` by a diffeomorphism isotopic to the identity gives a
  diffeomorphic manifold (Hirsch, Chapter 8 §2).
- The double `M ∪_id M` is a boundaryless manifold containing `M` as a codimension-zero
  submanifold with boundary, and it is closed exactly when `M` is compact.
- Handle attachment along isotopic attaching embeddings gives diffeomorphic results, and
  attaching along an embedding that extends over `Dᵏ × Dⁿ⁻ᵏ` into `M` gives `M` with a boundary
  connected sum of `Sᵏ × Dⁿ⁻ᵏ`.
- In the face gluing, `M ∪_f N` is a manifold with corners containing `M` and `N` as closed
  submanifolds with corners whose intersection is the seam `A ≅ B`, and the seam has a bicollar
  `A × (−1, 1) → M ∪_f N` restricting to the collars of `M` and `N`.
- Gluing is associative and commutative up to diffeomorphism, and a diffeomorphism of pairs
  `(M, A) → (M', A')` compatible with `f` and `f'` induces a diffeomorphism of the gluings.
- Attaching handles along disjoint attaching regions commutes up to diffeomorphism; a `0`-handle
  is a disjoint ball and an `n`-handle caps a boundary sphere.
- **Exterior collars.** For `M` with compact boundary, gluing `∂M × [0, 1]` to `M` along
  `∂M ≅ ∂M × {0}` gives a manifold diffeomorphic to `M`, by a diffeomorphism that is the
  identity outside a collar of `∂M`. *Needs:* Layer 1.1 (existence and uniqueness of collars).

**Checks.**
- *Double of a half-line.* The double of `[0, ∞)` is `ℝ`, boundaryless but not compact, so not
  every double is closed (by evaluation).
- *Gluing map is data.* Two solid tori glued by the identity of `T²` give `S¹ × S²` and by the
  factor swap give `S³`, with fundamental groups `ℤ` and `1`.
- *Handle orientation.* Attaching a `1`-handle to `D²` along two disjoint arcs of its boundary
  gives an annulus if the attaching map preserves the boundary orientation on one arc and
  reverses it on the other, and a Möbius band otherwise; orientability distinguishes them.
- *Discs.* Two closed discs glued along the identity of their boundary circles give `S²`, and
  glued along a reflection they give `S²` as well; two closed discs glued along a proper arc of
  their boundary circles give a disc with corners at the two ends of the arc.
- *Handles on the `3`-ball.* Attaching a `1`-handle to `D³` along two disjoint discs in `S²`
  gives the solid torus, the genus-one handlebody of Layer 9.1, when the attaching map, read on
  each disc through a fixed orientation of `D²`, preserves the orientation of `S²` on one disc
  and reverses it on the other, and otherwise the solid Klein bottle, the non-orientable
  genus-one handlebody that Layer 9.1 names.
- *Framing is data.* Attaching a `2`-handle to `D⁴` along the unknot with framing `0` gives
  `S² × D²`, with boundary `S² × S¹`; with framing `±1` it gives the disc bundle over `S²` of
  Euler number `±1`, with boundary `S³`. The framing is part of the attaching map
  `S¹ × D² → S³`.

*Needs:* Tau Ceti `TauCeti.chartedSpaceOfIsOpenEmbedding`, `TauCeti.SmoothEmbedding`; Layer 1.1,
Layer 1.2; DifferentialGeometry *Boundary and corners*.

### 1.3.1 Morse functions on compact manifolds with boundary

Let `W` be a compact smooth `n`-manifold with boundary and `∂W = V₀ ⊔ V₁` a partition of its
boundary components into two unions, either of which may be empty. A Morse function on the
triad `(W; V₀, V₁)` is a smooth `f : W → [0, 1]` with `f⁻¹(0) = V₀` and `f⁻¹(1) = V₁`, without
critical points on a neighbourhood of `∂W`, such that `TauCeti.IsMorseOn (𝓡∂ n) f` holds on the
interior `(𝓡∂ n).interior W`; the index of a critical point is `TauCeti.manifoldMorseIndex`.
The pinned existence, density and deformation results are boundaryless; this section carries
them to compact manifolds with boundary.

- **Existence.** Every triad `(W; V₀, V₁)` carries a Morse function whose critical points are
  finitely many and take pairwise distinct values. Route: on collars of Layer 1.1 take `t`
  near `V₀` and `1 − t` near `V₁`, cut off to the constant `1/2` in `t < 1/2`; make it Morse on
  the interior by `ContMDiffMap.exists_isMorseOn_hasCompactSupport_sub_compl`, unchanged on a
  closed collar region and moved by less than the distance of its values to `{0, 1}`; separate
  the critical values by bump perturbations too small to create critical points (Hirsch,
  Chapter 6, §1). For `∂W = ∅` this is `TauCeti.exists_isMorse` rescaled into `(0, 1)`.
- **Regular bands.** If `[a, b] ⊆ [0, 1]` contains no critical value, then `f⁻¹[a, b]` is
  diffeomorphic to `f⁻¹(a) × [a, b]` by a diffeomorphism that is the identity on `f⁻¹(a)` and
  carries `f` to the second coordinate; so each regular level is a closed `(n − 1)`-manifold
  and `f⁻¹[0, ε]` is a collar of `V₀` for small `ε > 0`. Route: an inward field with
  `df(X) = ±1` near `V₀`, `V₁` gives collars on which `f` is `t`, respectively `1 − t`; glue
  `V₀ × (−1, 0]` and `V₁ × [1, 2)` to `W` (Layer 1.3), extend `f` by these coordinates, and apply
  `TauCeti.exists_flow_apply_eq_sub` and `TauCeti.exists_diffeomorph_sublevel` there.
- **The elementary handle step.** If `0 < a < b < 1` are regular values and `f⁻¹[a, b]`
  contains exactly one critical point `p`, of index `λ`, then `f⁻¹[0, b]` is diffeomorphic, by
  a diffeomorphism that is the identity near `V₀`, to `f⁻¹[0, a]` with one handle
  `D^λ × D^(n−λ)` attached (Layer 1.3) along an embedding `S^(λ−1) × D^(n−λ) → f⁻¹(a)` (for
  `λ = 0` a disjoint `n`-disc, for `λ = n` a cap on a boundary sphere). Route: in a Morse chart
  (`TauCeti.IsNondegenerateCriticalPoint.exists_morse_chart`, in a chart of the interior)
  `f = f(p) − |u|² + |v|²`; the attaching sphere is the descending sphere `{|u|² = δ, v = 0}`
  carried down to `f⁻¹(a)` by the regular-band flow. Iterating over the critical points in
  increasing order builds `W` from a collar of `V₀` with one handle per critical point.

**Checks.**
- *Disc.* On `Dⁿ` with `(V₀, V₁) = (∅, Sⁿ⁻¹)`, `(1 + |x|²)/2` is Morse on the triad with one
  critical point, of index `0`; `|x|²` is not, as it vanishes at the centre (by evaluation).
- *Upright torus.* The height function of the upright torus in `ℝ³` has four critical points,
  of indices `0, 1, 1, 2`, each index-`λ` handle changing `χ` by `(−1)^λ` (by evaluation).
- *Boundary partition.* On the annulus `1 ≤ |x| ≤ 2` with `V₀` the inner and `V₁` the outer
  circle, `f(x) = |x| − 1` has no critical point. With both circles in `V₁`, every Morse function
  on the triad is positive, equal to `1` on `∂W` and smaller inside, so it has an interior
  minimum of index `0`: the partition of the boundary is part of the data.

*Needs:* Layer 1.1 (collars, the boundaryless interior), Layer 1.3 (gluing and handle
attachment); Tau Ceti `TauCeti.IsMorseOn`, `TauCeti.manifoldMorseIndex`,
`TauCeti.exists_isMorse`, `ContMDiffMap.exists_isMorseOn_hasCompactSupport_sub_compl`,
`TauCeti.exists_flow_apply_eq_sub`, `TauCeti.exists_diffeomorph_sublevel`,
`TauCeti.IsNondegenerateCriticalPoint.exists_morse_chart`; DifferentialGeometry Layer 3
(flows); Mathlib `SmoothBumpFunction`, `ModelWithCorners.interior`.

### 1.4 Connected sum

The connected sum is Tau Ceti's `TauCeti.ConnectedSum e₁ e₂` (*From Tau Ceti*): for coordinate
balls `e₁ : E → M` and `e₂ : E → N`, open embeddings and smooth local diffeomorphisms, the centres
are removed and the punctured balls are glued by the inversion in the unit sphere. At the pin it
is a smooth manifold, Hausdorff, compact when both summands are, connected for `dim E ≥ 2`,
orientable when the balls induce opposite orientations of `E`, commutative, independent of the
balls up to diffeomorphism for connected, Hausdorff, σ-compact oriented summands
(`TauCeti.ConnectedSum.nonempty_diffeomorph_of_isOrientationReversingAt`), and
`M # Sⁿ ≃ M` (`TauCeti.OrientedConnectedSum.nonempty_diffeomorph_sphere`). None of this is
planned again here. This section adds what the pin lacks.

- **Cut-and-glue description.** For orientation-preserving smooth embeddings `e_M`, `e_N` of a
  closed ball, the pinned sum along the corresponding coordinate balls is
  orientation-preservingly diffeomorphic to the gluing (Layer 1.3) of the complements of the
  open balls (Layer 1.2) along `e_N ∘ r ∘ e_M⁻¹` on the boundary spheres, `r` a fixed reflection
  of `Sⁿ⁻¹`; Layers 8.2 and 9.2 cut along the summing sphere through this description.
- **Associativity** up to orientation-preserving diffeomorphism. For `n = 1`, `ℝ # ℝ` is two
  lines, `ℝ # S¹` one line and `S¹ # S¹` one circle.
- **Invariants.** For `n ≥ 3`, `π₁(M # N) ≅ π₁(M) ∗ π₁(N)`; for compact `M` and `N` and every
  `n ≥ 1`, `χ(M # N) = χ(M) + χ(N) − χ(Sⁿ)`, the Euler characteristic being that of the finitely
  generated rational singular homology.
- Reversing the orientation of one summand can change the diffeomorphism type.
- **Unoriented cut-and-glue.** For closed `M`, `N` and balls `e₁ : E → M`, `e₂ : E → N` that are
  diffeomorphisms onto their images, the native sum is diffeomorphic to the gluing (Layer 1.3)
  of `M ∖ e₁(B°)` and `N ∖ e₂(B°)` (Layer 1.2) along the boundary spheres by `e₂ ∘ e₁⁻¹`: the
  inversion fixes the unit sphere and carries the sphere of radius `r` to the sphere of radius
  `1/r`, so the two models differ by collars of the seam. The `π₁` formula is van Kampen on the
  two punctured summands, whose intersection, the punctured ball, is simply connected for
  `n ≥ 3`.

The pin consumed above, in detail (Kosinski, *Differential Manifolds*, Chapter VI, Section 1,
with the radial coordinate rescaled): `TauCeti.ConnectedSum e₁ e₂` is defined for two spaces
`M`, `N` and open embeddings `e₁ : E → M`, `e₂ : E → N` of a real inner product space `E`,
identifying `e₁ v` with `e₂ (v/‖v‖²)` for `v ≠ 0`; it is Hausdorff when `M` and `N` are and `E`
is finite-dimensional (`TauCeti.ConnectedSum.t2Space`), a `Cⁿ` manifold with the charts pushed
forward from the punctured summands when the balls are `Cⁿ` local diffeomorphisms
(`TauCeti.ConnectedSum.chartedSpace`, `TauCeti.ConnectedSum.isManifold`), compact when `M` and
`N` are, and connected when they are and `dim E ≥ 2` (`TauCeti.ConnectedSum.compactSpace`,
`TauCeti.ConnectedSum.connectedSpace`). For connected summands, balls with the same orientation
behaviour at their centres give diffeomorphic sums
(`TauCeti.ConnectedSum.nonempty_diffeomorph_of_isOrientationPreservingAt`, by the ambient disc
theorem; Palais, *Extending diffeomorphisms*, Proc. AMS 11 (1960), Theorem B; Hirsch, Chapter 8,
Theorem 3.1). The oriented sum `TauCeti.OrientedConnectedSum oM oN` of connected oriented
manifolds, for orientations `TauCeti.Manifold.Orientation`, is taken along a ball preserving the
orientation of `M` and a ball reversing that of `N` at their centres, with its orientation
(`TauCeti.ConnectedSum.orientation`, `TauCeti.ConnectedSum.orientable`), its independence of the
balls (`TauCeti.OrientedConnectedSum.nonempty_diffeomorph_connectedSum`) and the identities
`M # N ≃ N # M` (`TauCeti.OrientedConnectedSum.nonempty_diffeomorph_comm`),
`M # N ≃ (−M) # (−N)` (`TauCeti.OrientedConnectedSum.nonempty_diffeomorph_neg`) and
`M # Sⁿ ≃ M` (`TauCeti.connectedSumSphereDiffeomorph`). *Needs:* Tau Ceti
`TauCeti.SmoothEmbedding`, `TauCeti.Diffeotopy`; AlgebraicTopology Stage 1 (van Kampen) and
Stage 7 (the Euler characteristic of a finite decomposition).

**Checks.**
- *Orientations matter.* The cup-product forms on `H²` of `ℂP² # ℂP²` and `ℂP² # (−ℂP²)` are
  `diag(1, 1)` and `diag(1, −1)`, of signatures `2` and `0` (by evaluation).
- *Surfaces.* `S² # S²` is diffeomorphic to `S²`, and `T² # T²` is the closed orientable
  surface of genus `2`, of Euler characteristic `0 + 0 − 2 = −2` (by evaluation).
- *Dimension one.* `S¹ # S¹` is a circle while `ℝ # ℝ` has two components, so connectedness
  needs `n ≥ 2`, as the pinned `TauCeti.ConnectedSum.connectedSpace` assumes.
- *No orientation needed.* `ℝP² # ℝP²` is the Klein bottle: the native `TauCeti.ConnectedSum`
  needs no orientation; only the oriented sum and the independence of the balls do.
- *The second ball.* The inversion `v ↦ v/‖v‖²` reverses every orientation of `E`, so a ball
  preserving the orientation of `M` and a ball reversing that of `N` give a gluing map that
  preserves orientation from `M` to `N` (`TauCeti.ConnectedSum.orientation`). In the gluing model
  for `n = 1`, `M = N = S¹`, the arc `M ∖ e₁(int D¹)` runs from `e₁(1)` to `e₁(−1)` and the arc
  `N ∖ e₂(int D¹)` from `e₂(−1)` to `e₂(1)`, and identifying `e₁(±1)` with `e₂(±1)` gives a
  consistently oriented circle, while with `e₂` orientation-preserving the second arc runs the
  other way. For `M = N = ℂP²` the oriented sum has intersection form `⟨1⟩ ⊕ ⟨1⟩` and signature
  `2`; two orientation-preserving balls give the oriented sum of `ℂP²` with `ℂP²‾`, with form
  `⟨1⟩ ⊕ ⟨−1⟩` and signature `0`, which `TauCeti.OrientedConnectedSum.nonempty_diffeomorph_neg`
  identifies only with `ℂP²‾ # ℂP²`, so the condition on the second ball is not cosmetic.
- *Two prime factors.* `π₁(L(2, 1) # L(3, 1)) ≅ C₂ * C₃`, a sum with two prime factors; the
  uniqueness of the factorization is Layer 8.2's, not a consequence of this section.
- *Dimension two.* The `π₁` formula needs `n ≥ 3`: for `n = 2`, van Kampen on the two punctured
  tori (each with free fundamental group of rank two) over the punctured ball (an annulus, with
  `π₁ = ℤ`) gives for `T² # T²` the surface group of genus two, `⟨a, b, c, d | [a, b][c, d]⟩`,
  which surjects onto `ℤ² * ℤ²` by killing `[a, b]` but is not isomorphic to it, its abelian
  subgroups being cyclic.
- *Self-sum.* `M # M` along `e₁, e₂ : E → M` is the native sum of two copies of `M`, since the
  construction takes two spaces: the images of `e₁` and `e₂` may meet, and the gluing model of
  the comparison, which removes one ball from each copy, needs no disjointness either.

*Needs:* Tau Ceti `TauCeti.ConnectedSum`, `TauCeti.OrientedConnectedSum`, `TauCeti.Orientable`;
Layer 1.2, Layer 1.3 (cut-and-glue description); Mathlib `FundamentalGroup`, singular homology.

### 1.5 Tubular neighbourhoods

The intrinsic normal bundle of a smooth embedding and the tubular neighbourhood theorem are Tau
Ceti's (*From Tau Ceti*). For a smooth embedding `f : S → M` between finite-dimensional
boundaryless manifolds, `M` Hausdorff and second countable, the normal spaces
`TauCeti.SmoothEmbedding.NormalSpace f x` form a smooth vector bundle, and the whole bundle is
diffeomorphic to an open neighbourhood of `f(S)` inside any prescribed open neighbourhood, the
zero section going to `f` (`TauCeti.SmoothEmbedding.exists_diffeomorph_normalBundle_subset`), with
no compactness or closed-image hypothesis. The Riemannian form through the normal exponential
(`TauCeti.SmoothEmbedding.exists_diffeomorph_normalBundle_riemannian_subset`), the closed normal
disc and sphere bundles of a compact submanifold
(`TauCeti.SmoothEmbedding.exists_isClosedEmbedding_normalExp_disc`) and the Euclidean normal
bundle with its tube `TauCeti.normalTube f ε` are pinned as well. None of this is planned again
here. This section adds:

- **Uniqueness.** Any two tubular neighbourhoods of `f` are isotopic through tubular
  neighbourhoods (Hirsch, Chapter 4, Theorem 5.3); in particular the diffeomorphism type of the
  pair (`M`, tube) does not depend on the metric or the radius.
- **Retraction.** The image of the tube deformation retracts onto `f(S)` by the straight-line
  homotopy in the fibres, and for compact `S` the pinned closed disc bundle and its boundary
  sphere bundle are smooth submanifolds, the form that Dehn surgery (Layer 5) uses.
- **The tubular-neighbourhood interface.** Consume the native Euclidean theorem
  `TauCeti.exists_isTubularNeighborhood_normalBundle`: a compact `C²` embedded submanifold of a
  Euclidean space has an open neighbourhood identified with a neighbourhood of the zero section
  of its normal bundle, as `TauCeti.IsTubularNeighborhood` data (Hirsch, Chapter 4, Theorem 6.3;
  Lee, *Introduction to Smooth Manifolds*, 2nd ed., Theorem 6.24). Prove the form in a manifold:
  for a `C^k` embedding `f : S → M`, `k ≥ 2`, of a compact manifold into a boundaryless smooth
  manifold with a smooth Riemannian metric, the normal exponential map is a `C^(k−1)`
  diffeomorphism from the normal vectors of length less than some `ε > 0` onto an open
  neighbourhood of `f(S)`, and these data satisfy `TauCeti.IsTubularNeighborhood`: the tube is
  open, fibrewise star-shaped about the zero section, and the zero section goes to `f`. *Needs:*
  Mathlib `TangentBundle`, `Bundle.ContMDiffRiemannianMetric`, `Manifold.IsSmoothEmbedding`;
  HopfRinow Layer 1 (the exponential map).
- **Uniqueness by a diffeotopy.** The isotopy of two tubular neighbourhoods of `f` is realized by
  a diffeotopy of `M` fixing `f(S)` (Hirsch, Chapter 4, Theorem 6.5).
- **Sphere and disc bundles.** For compact `S`, the closed `ε`-tube is a compact manifold with
  boundary the sphere bundle (Layer 1.1), and when `M` is compact the complement of the open
  `ε`-tube in `M` is a compact manifold with boundary that sphere bundle. This is the surgery
  interface of Layer 5 and the normal-bundle interface that GeneralizedCohomology G5,
  TopologicalKTheory T5 and PositiveScalarCurvature Layer 3 consume.

**Checks.**
- *Unit circle.* For the unit circle in `ℝ²` the tube map is injective on `‖v‖ < ε` exactly when
  `ε ≤ 1`, with image `1 − ε < |z| < 1 + ε` (by evaluation).
- *Shrinking circles.* For the circles of radius `1/n` centred at `(3n, 0)`, `n ≥ 1`, no constant
  radius works, while radius `1/(2n)` on the `n`-th circle does (by evaluation).
- *Embedding needed.* The figure-eight curve `t ↦ (sin t, sin 2t)` is an immersion, with
  velocity `(cos t, 2 cos 2t) ≠ 0`, but `t = 0` and `t = π` both go to the origin, and the tube
  map is not injective near that double point.
- *The identification is data.* `(θ, r) ↦ (1 + r)e^{iθ}` on `|r| < 1/2` is a tube of the unit
  circle with image `{1/2 < |z| < 3/2}`; `(θ, r) ↦ (1 + r)e^{i(θ + r)}` is a diffeomorphism onto
  the same annulus which is not a tubular neighbourhood for the metric normal bundle, since its
  fibres are not normal segments; it is one for a different bundle identification, which is why
  `TauCeti.IsTubularNeighborhood` carries the identification as data.
- *Knotted circles.* A circle in `ℝ³` has a solid-torus tube
  (`TauCeti.exists_isSolidTorusNeighborhood`, Layer 5.1); the radius `ε` must shrink along a thin
  knotted circle, so it depends on the embedding and not only on its domain.
- *Point and codimension zero.* For `S` a point the tube is a coordinate ball; for `f` the
  inclusion of a codimension-zero submanifold the normal bundle is zero and the tube is `f(S)`
  itself.
- *Non-compact core.* The images of the embeddings `ℝ → ℝ²`, `t ↦ (t, 0)` and
  `t ↦ (t, e^{−t²})`, form a closed embedded submanifold with no tube of constant width, the two
  curves coming within `e^{−t²}` of each other; for a non-compact core the width is a positive
  continuous function.

*Needs:* Tau Ceti `TauCeti.SmoothEmbedding.exists_diffeomorph_normalBundle_subset`,
`TauCeti.SmoothEmbedding.NormalSpace`, `TauCeti.SmoothIsotopy.exists_diffeotopy_apply_eq`
(isotopy extension, for uniqueness); Hirsch, Chapter 4, Theorem 5.3.

### 1.6 PL manifolds through charts

A PL manifold is a charted space `M` with `HasGroupoid M (TauCeti.PLGroupoid I)` for the
Euclidean or half-space model; a PL map is the pinned `TauCeti.IsPLMap`, piecewise affine in
charts of the maximal PL atlases. The pin has the compact comparison on coordinate spaces
(`TauCeti.IsPLOn.isPiecewiseAffineOn_of_isCompact`: a map PL on a compact subset of `ι → ℝ` is
piecewise affine there with finitely many cells), products of PL manifolds
(`TauCeti.hasGroupoid_PLGroupoid_prod`), open subsets (Mathlib's
`TopologicalSpace.Opens.instHasGroupoid` with the pinned closure of `TauCeti.PLGroupoid I` under
restriction), composition of PL maps (`TauCeti.IsPLMap.comp`) and the inverse criterion for maps
affine on the simplices of a finite cover
(`TauCeti.isPiecewiseAffineOn_inverse_of_finite_simplex_cover`). Prove what it lacks: the compact
comparison for finite-dimensional real normed spaces `E, F`, a map `f : E → F` and a compact
`K ⊆ E`, that `TauCeti.IsPLOn f K` implies `TauCeti.IsPiecewiseAffineOn f K`, by transport along
continuous linear equivalences with coordinate spaces, which carry convex polyhedra to convex
polyhedra and affine maps to affine maps (Rourke–Sanderson, Chapter 2, local and finite
polyhedral descriptions); that boundaries of PL manifolds are PL; that a PL homeomorphism between
PL manifolds has a PL inverse (finite polyhedral neighbourhoods in charts, inversion on their
image cells by the pinned criterion); and that gluing along a PL homeomorphism of boundaries with
PL collars produces a PL manifold, parallel to Layer 1.3.

- The forgetful map from PL to topological manifolds is
  `TauCeti.PLGroupoid_le_continuousGroupoid`.
- There is no inclusion of `contDiffGroupoid` into `TauCeti.PLGroupoid`: the smooth transition
  `x ↦ x + x³` is not PL on any open set. Smooth and PL structures are compared in Layer 11.3.
- **The pregroupoid.** `TauCeti.PLGroupoid I` is the groupoid of `TauCeti.PLPregroupoid I`, the
  maps of the model `H` that are piecewise linear read through `I`, on every model with corners.
  The predicate is local and locally finite, which gives closure under restriction to opens and
  under composition (Rourke–Sanderson, *Introduction to Piecewise-Linear Topology*, Chapters
  1–2). *Needs:* Mathlib `StructureGroupoid`, `Pregroupoid.groupoid`, `continuousGroupoid`; Tau
  Ceti `TauCeti.PLPregroupoid`, `TauCeti.ofSet_mem_PLGroupoid`.
- **PL implies topological.** `PLGroupoid I ≤ continuousGroupoid H`, so every PL manifold is a
  topological manifold with the same charts, and a PL homeomorphism is a homeomorphism. Prove
  the compatibility with smoothing: for a smooth manifold `M` and any PL structure on the same
  topological space, in particular the one Layer 11.3 builds from a smooth triangulation, the
  two underlying topological manifolds agree, since every atlas of `M` is compatible for
  `continuousGroupoid` (Mathlib's `hasGroupoid_continuousGroupoid`); so the composite smooth →
  PL → topological is the forgetful map from smooth to topological manifolds.
- **Simplicial isomorphisms are PL.** Prove that the realization of a simplicial isomorphism of
  complexes with finitely many faces on finite vertex types
  (`PreAbstractSimplicialComplex.SimplicialMap.realizationHomeomorph`), read in the coordinates
  of the vertex types, is piecewise affine with piecewise affine inverse
  (`TauCeti.IsPiecewiseAffineOn`, by the pinned inverse criterion), affine on each simplex; the
  polyhedra of Layer 11.1 use it.

**Checks.**
- *A non-affine PL map.* `TauCeti.doubleRight` is a PL homeomorphism of `ℝ` that is not affine,
  so the PL groupoid is strictly larger than the affine one (by evaluation).
- *Compactness is needed.* The linear interpolation of `n ↦ n²` on `ℝ` is locally PL with
  infinitely many slopes `2n + 1`, so no finite affine cover represents it (by evaluation).
- *Simplex boundary.* The boundary of the standard `n`-simplex, as the union of its facets with
  the affine charts, is a PL `(n−1)`-manifold, PL homeomorphic to `Sⁿ⁻¹` with the
  radial-projection charts.
- *Groupoid membership.* `x ↦ 2x` on `ℝ` is affine, hence PL; `x ↦ |x|` is PL on `ℝ` but not a
  homeomorphism, so not in the groupoid; `x ↦ x³` is a homeomorphism that is not PL, since no
  neighbourhood of `0` is covered by finitely many pieces on which it is affine.
- *Locally finite is the right finiteness.* The identity of an open set is PL
  (`TauCeti.ofSet_mem_PLGroupoid`). The homeomorphism of `ℝ` fixing `0`, with slope `1` on
  `(−∞, 0]` and on `[1, ∞)` and, on `[1/(n + 1), 1/n]` for `n ≥ 1`, slope `1` for odd `n` and
  `2` for even `n`, has breakpoints at the points `1/n`, `n ≥ 2`: it is PL on `(0, ∞)` and on
  `(−∞, 0)` but on no neighbourhood of `0`.
- *Half-space model.* The map of `[0, ∞)` that is the identity on `[0, 1]` and `x ↦ 2x − 1` on
  `[1, ∞)` is in `PLGroupoid (𝓡∂ 1)`, so PL manifolds with boundary come from the same
  definition.
- *PL, not smooth.* `TauCeti.doubleRight` is a PL homeomorphism of `ℝ`, hence a homeomorphism; it
  is not smooth at `0`, its derivative jumping from `1` to `2`, so the forgetful map from PL to
  topological manifolds does not factor through the smooth structures of Layer 11.3.
- *Exotic PL tori.* The five-torus `T⁵` carries PL structures that are not PL homeomorphic
  (Kirby–Siebenmann, *Foundational Essays*, Essay V): one topological manifold with two PL
  structures, so the forgetful map from PL-homeomorphism classes to homeomorphism classes is not
  injective in dimension five. That obstruction theory is GeometricTopology, Part II's, and no
  item of this roadmap rests on it.

*Needs:* Tau Ceti `TauCeti.PLGroupoid`, `TauCeti.IsPLOn`, `TauCeti.IsPiecewiseAffineOn`,
`TauCeti.IsPLMap`, `TauCeti.IsPLOn.isPiecewiseAffineOn_of_isCompact`,
`TauCeti.isPiecewiseAffineOn_inverse_of_finite_simplex_cover`; Mathlib `HasGroupoid`,
`ContinuousLinearEquiv`, finite-dimensional compactness.

### 1.7 Compact smooth surfaces

Consume Layer 11.2.1 for the uniqueness up to isotopy of smooth structures on surfaces, the
isotopy of homeomorphisms to diffeomorphisms and the two-dimensional Hauptvermutung. Build the
two-dimensional triangulation/smoothing comparison, the surface prefix of 11.3: finite
arc/triangle subdivisions in coordinate discs and half-discs, the smoothing of their edges and
vertices with overlap and nondegeneracy control, and the extension of prescribed compatible
boundary data fixing a smaller collar, compatible with the given smooth atlas and with the
relative uniqueness comparison. It uses Layer 11.2.1 and not the later surface-embedding or
knot classifications.

Prove the smooth classification: every compact connected smooth surface, with or without
boundary, is diffeomorphic to exactly one standard model, the orientable surface of genus `g`
with `b` boundary components (built from `S²` by `g` connected sums with `T²` and `b` ball
removals, Layers 1.2 and 1.4) or the non-orientable surface with `k ≥ 1` crosscaps and `b`
boundary components; two compact connected surfaces are diffeomorphic iff they have the same
Euler characteristic, number of boundary components and orientability (Hirsch, *Differential
Topology*, Chapter 9, Theorems 3.5, 3.7, 3.10 and 3.11), by induction on the critical points of
a Morse function on the triad `(F; ∅, ∂F)` of Layer 1.3.1, each elementary handle step
attaching a disc, a band or a cap. Define the genus of a compact connected orientable surface
`F` as `(2 − χ(F) − b)/2`, `b` the number of boundary components, prove it equals the number of
torus summands, and prove `rank H₁(F; ℚ) = 2g` when `F` is closed and `2g + b − 1` when `b ≥ 1`.

- Two diffeomorphisms of a compact surface that are isotopic as homeomorphisms are smoothly
  isotopic, and every homeomorphism is isotopic to a diffeomorphism (Layer 11.2.1, items 2
  and 5); mapping class groups are Layer 1.7.2's.
- A compact connected orientable surface of genus `g` contains `g` disjoint embedded circles
  with connected complement, and any `g + 1` disjoint embedded circles disconnect it (Hirsch,
  Chapter 9, Theorem 3.6 for closed surfaces; cap the boundary circles otherwise); a compact
  connected non-orientable surface contains a Möbius band, and its crosscap number `k` is the
  largest number of disjoint Möbius bands in it (Hirsch, Chapter 9, Lemmas 3.8 and 3.9 and
  Theorem 3.10 for closed surfaces, capping otherwise).
- A compact connected orientable surface with nonempty boundary is a disc with `2g + b − 1`
  bands attached, and its first homology is free of rank `2g + b − 1`. Its intersection form is
  the pullback of the standard form on the capped surface; its radical, of rank `b − 1`, is
  generated by the boundary classes with their single sum-zero relation, and capping gives the
  nondegenerate rank-`2g` quotient form.

**Checks.**
- *Genus is not read off `H₁`.* The torus and the once-holed torus have genus `1`, with
  `rank H₁ = 2`; the formula `(rank H₁ − b + 1)/2` would give `3/2` for the torus (by evaluation).
- *Euler characteristics.* `χ(S²) = 2`, `χ(T²) = 0`, `χ(ℝP²) = 1` and `χ(annulus) = 0`; the
  annulus is the orientable surface with `g = 0`, `b = 2`, not the Möbius band, which has
  `k = 1`, `b = 1` (by evaluation).
- *Compactness.* The plane and the open annulus are non-compact of genus zero and not
  diffeomorphic, so the classification needs compactness.

*Needs:* Layer 11.2.1 (smoothing, isotopy comparison and Hauptvermutung in dimension two);
Layer 1.2, Layer 1.3 (handle attachment), Layer 1.3.1 (Morse functions on the triad, regular
bands and the elementary handle step), Layer 1.4, Layer 1.5 (tubes of circles); Layer 11.3
(smooth triangulations); Mathlib singular homology.

### 1.7.1 Polyhedral surfaces and explicit Euclidean embedding models

This section makes the elementary claims about surfaces spanning knots precise in the compact
smooth/PL category, using 1.7's classification and its finite triangulation comparison. The
ambient embedding is part of the conclusions; abstract classification does not supply it.

1. **Local recognition and orientation.** A finite polyhedral surface is a finite pure
   two-dimensional abstract simplicial complex, with geometric realizations by nondegenerate
   triangles in some Euclidean space meeting in common faces, whose every vertex link is a
   circle or a closed interval. Prove that these are the compact PL 2-manifolds with boundary,
   identify the boundary edges and vertices and the disjoint polygonal boundary circles, and
   transport these through subdivision and the smooth comparison. Prove that coherent triangle
   orientations (inducing opposite directions on each shared interior edge) exist iff the
   surface is orientable, including the disconnected and empty cases. Edge incidence in one or
   two triangles does not imply the vertex-link condition (Check below).

2. **Classification parameters and boundary gluing.** State the connected classification as a
   PL homeomorphism and a diffeomorphism to the standard models of 1.7. A mixed presentation
   with `p` handles, `q` crosscaps and `r` boundary circles has `χ = 2 − 2p − q − r`; for `q = 0`
   its orientable genus is `p`, and for `q > 0` its nonorientable genus is `k = q + 2p`, by the
   relative handle-to-two-crosscaps move in the presence of a crosscap, preserving boundary
   labels and collars; the genus formulas are proved nonnegative and integral before they are
   read as natural numbers. A disconnected surface is a finite disjoint union of connected
   models. Construct the polygon/CW model with attaching word
   `c₁c₁⋯c_qc_q [a₁,b₁]⋯[a_p,b_p] d₁e₁d₁⁻¹⋯d_re_rd_r⁻¹`, the e_j the unpaired boundary edges,
   prove its counts `F = 1`, `E = q + 2p + 2r`, `V = r + 1`, `b = r` (the sphere separately), and
   compare its realization and triangulation with the standard surface. For two connected
   surfaces glued along a proper boundary interval, by a collar-compatible gluing with corner
   smoothing, prove `χ(F∪_I G) = χ(F) + χ(G) − 1` and `b(F∪_I G) = b(F) + b(G) − 1`, and in the
   orientable boundary-compatible case `g(F∪_I G) = g(F) + g(G)`; gluing along an interval is a
   different operation from identifying two whole boundary circles. The general disc-band
   Euler/count theorem is 4.3.2's and consumes this prefix, which consumes no knot-specific
   Seifert-surface construction.

3. **Which models embed in three-space.** Construct smooth embeddings in `ℝ³` of every compact
   orientable model (boundaries of standard embedded handlebodies minus disjoint discs) and of
   every nonorientable model with nonempty boundary (boundary connected sums of embedded Möbius
   bands in disjoint 3-balls, joined through disjoint collars, minus further discs), with the
   model types, boundaries and collars identified. Prove that a compact connected closed
   locally flat surface `S ⊂ ℝ³` separates and has a two-sided normal neighbourhood, without
   assuming orientability; hence a closed connected surface embeds in `ℝ³` exactly when it is
   orientable. Route: a closed curve meets `S` an even number of times: fill it by a map
   `H : D² → ℝ³` (it may be knotted; no embedded disc is assumed) made transverse to `S`
   relative to its boundary, so that the compact preimage `H⁻¹(S)` is a one-manifold whose
   boundary counts the intersections. Relative transversality: with `ρ` a bump function on `D²`
   that is `0` on a collar of `∂D²` where `H` is already transverse to `S` and positive off it,
   `(x, v) ↦ H(x) + ρ(x)v` on `int D² × ℝ³` is transverse to `S`, its preimage of `S` is a
   boundaryless second-countable 4-manifold `W`, and by Sard
   (`ContMDiff.isMeagre_image_criticalPoints`, or chart by chart
   `ContDiff.addHaar_image_criticalPoints_eq_zero`) the regular values `v` of the projection
   `W → ℝ³`, for which `H + ρv` is transverse to `S`, come arbitrarily close to `0`; the PL
   normal-position argument is analogous. A path joining opposite local sides in the
   complement would close to a curve meeting `S` once, so local sides propagate along `S` to
   trivialize its normal line bundle, giving the two complementary regions and an orientation
   induced from `ℝ³`; no orientation of `S` is used before the parity argument. In the locally
   flat case, triangulate the normal interval-bundle neighbourhood (one-sided bundles included)
   from the surface triangulation and build the collared ambient-pair comparison from 11.2's
   relative Moise/PL-smoothing theorem. Both the PL and the smooth versions are targets.

4. **An explicit projective-plane embedding in four-space.** Give the native
   `Projectivization ℝ (EuclideanSpace ℝ (Fin 3))` its quotient topology, compactness, the
   comparison with `S²/(v∼−v)` and the smooth structure of the three standard charts `v_i≠0`
   with ratios `v_j/v_i`. Let V be the five-dimensional space of symmetric trace-zero real 3×3
   matrices with the Frobenius inner product (native matrices, or the isometric coordinate
   carrier `EuclideanSpace ℝ (Fin 3×Fin 3)`), and define `Q([v])=sqrt(3/2)·(vvᵀ−I/3)` on unit
   representatives, descending through `vvᵀ/(vᵀv)−I/3` on any nonzero one. Prove that `Q`
   is a smooth embedding of `ℝP²` in the unit S⁴ of V: its values are symmetric, trace-zero of
   Frobenius norm 1, its fibres on S² are exactly the antipodal pairs, it is smooth in the
   quotient charts (no global section of the antipodal cover is chosen), and on `w⊥v`,
   `dQ_v(w)=sqrt(3/2)·(vwᵀ+wvᵀ)` with `‖dQ_v(w)‖²=3‖w‖²`, so it is an injective immersion of a
   compact manifold. The pole `P=diag(1,0,−1)/sqrt(2)` is a unit vector of V outside the image
   (three distinct eigenvalues, whereas `Q` has a repeated one); compose with the native
   `stereographic` projection from P inside V, with convention
   `X↦[2/(1−⟪P,X⟫)]·proj_(P⊥)(X)`, and the linear isometry from `(ℝ·P)⊥` to
   `EuclideanSpace ℝ (Fin 4)` given by the orthonormal frame `diag(1,−2,1)/sqrt(6)`,
   `(E₀₁+E₁₀)/sqrt(2)`, `(E₀₂+E₂₀)/sqrt(2)`, `(E₁₂+E₂₁)/sqrt(2)`. The composite is the smooth
   embedding of `ℝP²` in `ℝ⁴`.

5. **All compact surfaces in four-space.** Every compact smooth surface embeds in `ℝ⁴`, and it
   embeds in `ℝ³` precisely when each closed component is orientable, with compatible
   triangulated models and PL/smooth transports. Route: form connected sums of the embeddings
   of item 4 in disjoint 4-balls by removing small standard discs and joining their boundary
   circles by embedded annular necks in thin tubes around disjoint joining arcs (complement
   avoidance, local embeddedness, smooth collar matching and the identification with the
   abstract connected sum, using only local normal-disc choices); puncture for boundary
   components; take the orientable models in `ℝ³⊂ℝ⁴` from item 3; place the finitely many
   components, including the empty surface, in disjoint balls.

Explicit Veronese and crosscap constructions are in
[Banchoff's Veronese examples](https://www.math.union.edu/~dpvc/TFB/ICMS-poster/veronese/)
and [Levine's standard embedded crosscaps](https://services.math.duke.edu/~alevine/slides/UVa.pdf);
the constructions and proofs above are targets here.

**Checks.**
- *Two tetrahedra at a vertex.* Two tetrahedron boundaries sharing one vertex have every edge in
  two triangles, but `χ = 3` and a vertex link of two disjoint circles: not a surface (by
  evaluation).
- *Crosscap count.* A handle with a crosscap (`p = 1, q = 1`, `r = 0`) has `χ = −1` and `k = 3`;
  reading `q` for `k` in `χ = 2 − k − r` would give `1` (by evaluation).
- *Veronese normalization.* For unit `v`, `vvᵀ − I/3` has Frobenius norm `sqrt(2/3)` and
  eigenvalues `2/3, −1/3, −1/3`, while `P` has three distinct eigenvalues (by evaluation).

*Needs:* 1.1–1.7, the two-dimensional triangulation/smoothing prefix of 11.3 and the relative
collared-pair comparison from 11.2; Layer 11.2.1's surface comparisons; Tau Ceti's Jordan curve and
Schoenflies theorems (`TauCeti.IsJordanCurve.exists_homeomorph_image_sphere`); finite
simplicial complexes; Tau Ceti's Sard theorem (`ContMDiff.isMeagre_image_criticalPoints`,
`ContDiff.addHaar_image_criticalPoints_eq_zero`, `ContDiff.dense_compl_image_criticalPoints`)
for item 3; native projectivization, Euclidean spaces, matrices and stereographic projection.
The model and separation results serve later knot and JSJ applications without consuming their
classifications.

### 1.7.2 Mapping class groups of compact surfaces and Dehn twists

Let `F` be a compact connected smooth surface, with or without boundary. The mapping class
group `Mod(F)` is the group of isotopy classes of diffeomorphisms of `F` fixing `∂F`
pointwise, the isotopies fixing `∂F` pointwise throughout and taken in the topology of
Layer 3.1; for oriented `F`, `Mod⁺(F)` is the subgroup of orientation-preserving classes. When
`∂F` is nonempty the two coincide: the differential of a diffeomorphism fixing a boundary
circle pointwise fixes the boundary tangent line and sends inward vectors to inward vectors. A
smooth embedded circle `c` in the interior of `F` is two-sided when its tube (Layer 1.5) is an
annulus rather than a Möbius band; on an orientable `F` every embedded circle is two-sided. The
Dehn twist `T_c` about a two-sided `c` is the identity outside a closed tube `(ℝ/ℤ) × [0, 1]`
of `c`, with coordinates `([θ], t)` and `c = {t = 1/2}`, and is `([θ], t) ↦ ([θ + φ(t)], t)` on
the tube for a smooth `φ : [0, 1] → [0, 1]` equal to `0` near `0` and to `1` near `1`; when `F`
is oriented, the tube is oriented so that `dθ ∧ dt` agrees with the orientation of `F`, which
fixes the direction of the twist.

- For `F` oriented, the class of `T_c` in `Mod(F)` does not depend on the tube, on `φ` or on
  the orientation of `c`, and depends on `c` only through its isotopy class. A diffeomorphism
  `f` fixing `∂F` satisfies `f T_c f⁻¹ = T_{f(c)}` when it preserves the orientation of `F` and
  `f T_c f⁻¹ = T_{f(c)}⁻¹` when it reverses it, which can happen only when `∂F` is empty;
  reversing the orientation of `F` replaces `T_c` by its inverse. Without an orientation of
  `F` the twist depends on a chosen orientation of the tube, the two choices giving mutually
  inverse classes, and `f T_c f⁻¹` is the twist about `f(c)` with the pushed-forward tube
  orientation. A twist about a circle bounding a disc in `F` is the identity class.
- `Mod(D²)` is trivial: for homeomorphisms by Alexander's trick (Farb–Margalit, *A Primer on
  Mapping Class Groups*, Lemma 2.1), which is not smooth at the origin; for diffeomorphisms by
  Smale's theorem on the square, through a family smooth in the parameter (Layer 3.4), after
  making the diffeomorphism the identity near `∂D²` by the uniqueness of collars (Layer 1.1).
  `Mod⁺(S²)` is trivial, from `Diff(S²) ≃ O(3)` (Layer 3.4).
- `Mod(annulus)` is infinite cyclic, generated by the twist about the core circle
  (Farb–Margalit, Proposition 2.4): the endpoint of the lift to `ℝ × [0, 1]` of the image of the
  radial arc is an invariant of the class relative to the boundary, equal to `n` for `Tⁿ`.
- For an oriented `T²` the action on `H₁(T²; ℤ) ≅ ℤ²` gives `Mod⁺(T²) ≅ SL₂(ℤ)` and
  `Mod(T²) ≅ GL₂(ℤ)` (Farb–Margalit, Theorem 2.5). For a two-sided `c` oriented in an oriented
  `F`, `T_c` acts on `H₁(F; ℤ)` by `[x] ↦ [x] + (c · x)[c]`, with `c · x` the intersection
  pairing of Layer 1.7 and the tube orientation above.
- Cutting: for a two-sided circle `c` in the interior of `F`, the complement `F_c` of an open
  tube of `c` is a compact surface with `χ(F_c) = χ(F)` and two more boundary circles. For a
  proper arc `a` (meeting `∂F` exactly in its endpoints, transversally) the complement of an
  open tube has `χ = χ(F) + 1` and one boundary circle fewer when the endpoints lie on distinct
  boundary circles; when they lie on one circle `C` it has one more if a regular neighbourhood
  of `C ∪ a` is a pair of pants, as always when `F` is orientable, and the same number if it is
  a once-punctured Möbius band. A diffeomorphism fixing `∂F` and the identity on a closed tube
  of `c` (or `a`) restricts to the cut surface; one fixing `∂F` that fixes `c` (or `a`) pointwise
  and preserves its sides is isotopic relative to `∂F` to such a one (uniqueness of tubes,
  Layer 1.5; isotopy extension, Layer 3.3). Twists of the cut surface are twists of `F`.
- Lickorish's twist theorem: for `F` compact connected orientable, `Mod⁺(F)` is generated by
  Dehn twists (Lickorish, *A representation of orientable combinatorial 3-manifolds*, Ann. of
  Math. 76 (1962), 531–540, the twist theorem; Farb–Margalit, Theorem 4.1 for the closed case),
  by induction on the genus and then on the number of boundary circles through the cutting
  above, the disc and the annulus being the base cases; for closed `F` of genus `g ≥ 1` the
  twists about Lickorish's `3g − 1` standard circles suffice (Lickorish, *A finite set of
  generators for the homeotopy group of a 2-manifold*, Proc. Cambridge Philos. Soc. 60 (1964),
  769–778, its main theorem, with the corrigendum in 62 (1966)). Layer 5.2's Lickorish–Wallace
  theorem and Layer 9.1's dependence of a Heegaard splitting on the mapping class of its gluing
  consume this.

**Checks.**
- *Twist matrices.* On oriented `T²` with basis `([a], [b])`, `a · b = +1`, `T_a` and `T_b` act on
  `H₁` by `[[1, 1], [0, 1]]` and `[[1, 0], [−1, 1]]`, columns the images (by evaluation).
- *Left-turning twist.* `([θ], t) ↦ ([θ + t], t)` on a tube oriented by `dt ∧ dθ` is `T_c⁻¹`; on
  the torus it acts by `[[1, −1], [0, 1]]` and `[[1, 0], [1, 1]]` (by evaluation).
- *Orientation-reversing conjugation.* For the factor swap `S` of `T²`,
  `S T_a S⁻¹ = [[1, 0], [1, 1]] = T_b⁻¹`, not `T_b` (by evaluation).
- *Cutting a Möbius band.* Cutting `[0, 1]²/(0, y) ∼ (1, 1 − y)` along the arc `{1/2} × [0, 1]`
  gives a disc: `χ = 1`, one boundary circle, as many as before (by evaluation).

*Needs:* Layer 1.5 (tubes of circles), Layer 1.7 (the classification, Euler characteristic
and intersection pairing), Layer 3.1 (the topology on diffeomorphism groups), Layer 3.3
(isotopy extension), Layer 3.4 (`Diff(S²) ≃ O(3)` and Smale's theorem on the disc),
Layer 1.1 (uniqueness of collars); Mathlib `Matrix.SpecialLinearGroup`,
`Matrix.GeneralLinearGroup`, singular homology.

### Examples

The sphere `Sⁿ` as the double of `Dⁿ`; `S³` as two solid tori glued by the factor swap;
`S¹ × S²` as two solid tori glued by the identity; the connected sum `T² # T²` of genus two;
the tube of the unit circle in `ℝ²`; the annulus and the Möbius band as `D²` with one
`1`-handle attached; the PL circle as the boundary of a triangle; the Dehn twist about the
core of the annulus and the two twists generating `SL₂(ℤ)` on the torus.
Also `Sⁿ # Sⁿ ≅ Sⁿ` (Layer 1.4); the radial collar of the closed disc (Layer 1.1); the
solid-torus tube of a circle in `ℝ³` (Layer 1.5); `TauCeti.doubleRight` as a PL chart change
that is not affine (Layer 1.6).

### Dependencies

Mathlib's manifold library; Tau Ceti's boundary manifold, collars, gluing of atlases, smooth
embeddings, intrinsic normal bundles and the tubular neighbourhood theorem, Euclidean tubes,
connected sums, Morse functions on boundaryless manifolds
(Layer 1.3.1) and Sard's theorem (Layer 1.7.1); DifferentialGeometry (corners, flows, metrics);
HopfRinow (exponential map, normal neighbourhoods); Tau Ceti's Jordan curve and Schoenflies
theorems and Layer 11.2.1 (surfaces); Layer 3.3 for the ambient isotopy of ball embeddings used
in Layer 1.4, Layer 11.3 for the smooth triangulations used in Layer 1.7, and Layers 3.1, 3.3
and 3.4 for the diffeomorphism groups, isotopy extension and `Diff(S²) ≃ O(3)` used in
Layer 1.7.2.
Also Mathlib's manifolds with corners and `Diffeomorph`; Tau Ceti's local product collars,
Brown's collaring theorem, Euclidean tubular neighbourhoods and PL groupoid of the supplier
contracts; DifferentialGeometry 5.5 for the faces of a manifold with corners in the face gluing
of Layer 1.3.

## Layer 2: locally flat embeddings

Topological embeddings of manifolds can be wild (the Alexander horned sphere, Fox–Artin arcs),
so the theorems of this corner of topology quantify over locally flat embeddings, the pinned
`TauCeti.IsLocallyFlat F F' f`. This layer adds the structural theorems and states the
annulus theorem.

### 2.1 Closure properties beyond the pinned API

Beyond the pinned restriction to open subsets, invariance under homeomorphisms of either side,
composition with open embeddings and products, prove:

- **Composition.** If `f : N → M` is locally flat with model `F × F'` and `g : M → P` is
  locally flat with model `(F × F') × G'`, then `g ∘ f` is locally flat with model
  `F × (F' × G')`, with no further hypothesis on `N`, `M` or `P`. Route: a slice chart `ψ` of
  `P` for `g` at `g(f(x))`, shrunk so that its target is `V × B` with `0 ∈ B`, restricts along
  `V × {0}` to a chart `θ` of `M` with source `g⁻¹(ψ⁻¹(V × B))`; for any slice chart `φ` of `M`
  for `f` at `f(x)`, `((φ ∘ θ⁻¹) × id_B) ∘ ψ`, on the points whose first coordinate lies in
  `θ(θ.source ∩ φ.source)`, is a slice chart of `P` for `g ∘ f`; so the chart-compatibility
  hypothesis of the pinned `TauCeti.IsLocallyFlat.comp` is derivable.
- **Codimension-one collaring.** A locally flat embedding of an `(n−1)`-manifold into an
  `n`-manifold is locally bicollared (`TauCeti.IsLocallyBicollared`), and a two-sided locally
  flat closed hypersurface is globally bicollared (Brown, *Locally flat imbeddings of
  topological manifolds*, Ann. of Math. 75 (1962); for spheres in `Sⁿ` this is the pinned
  `TauCeti.brownBicollaring`). *Needs:* Tau Ceti `TauCeti.IsLocallyFlat`, `TauCeti.IsBicollar`,
  `TauCeti.BrownBicollaring`.
- **PL embeddings.** Smooth embeddings are locally flat by the pinned
  `TauCeti.SmoothEmbedding.isLocallyFlat` (boundaryless) and `LocallyFlat/Neat.lean` (neat
  embeddings, half-space model). State the PL analogue for PL embeddings that are locally
  unknotted (every point has a chart in which the pair is the standard affine pair), and prove
  that a PL embedding of codimension at most two need not be locally flat: the cone on a
  polygonal trefoil is a PL disc in the PL `4`-ball whose complement near the cone point has
  the trefoil group, not `ℤ`.
- **Normal bundles in dimension four.** State that a locally flat embedded surface in a
  topological `4`-manifold has a normal bundle, unique up to isotopy: an open neighbourhood
  that is a two-dimensional vector bundle over the surface with the surface as its zero
  section (Freedman–Quinn, *Topology of 4-Manifolds*, §9.3: existence is Theorem 9.3A, and
  uniqueness up to isotopy is proved in the same section). Layer 6.2.1 consumes it as stated,
  for the exterior of a locally flat slice disc or surface; smooth surfaces have the normal
  bundle of Layer 1.5, so the statement serves locally flat ones such as the slice discs of
  Freedman's theorem (Layer 6.4).
- **Boundary variants.** The pinned predicate carries the image onto the full slice `F × {0}`;
  with a Euclidean tangential model `F = ℝⁿ` it is boundaryless. Consume its API by name:
  restriction (`restrict`),
  locality, invariance under homeomorphisms and open embeddings on either side
  (`homeomorph_comp`, `comp_homeomorph`), change of complementary model (`transHomeomorph`),
  corestriction (`TauCeti.IsLocallyFlat.codRestrict`) and local product neighbourhoods
  (`TauCeti.IsLocallyFlat.exists_isOpenEmbedding_prod`). Define the three variants used with
  boundaries: **boundaryless** local flatness, the pinned predicate with `M` and `N`
  boundaryless; **boundary-disjoint** local flatness, the pinned predicate for an embedding of a
  boundaryless `N` whose image lies in the interior of `M`, through
  `TauCeti.IsLocallyFlat.codRestrict` into the open interior; and **neat** local flatness,
  `TauCeti.IsLocallyFlat (EuclideanHalfSpace k) F' f` for `f : N → M` with `f⁻¹(∂M) = ∂N`, the
  tangential model being the half-space, as in the pinned `LocallyFlat/Neat.lean`. Prove that the
  three agree on their common domain (a neat embedding of a boundaryless `N` is boundary-disjoint,
  and the two predicates coincide); that each is invariant under the maps of the pinned API and
  is a local property of the domain; that a neat locally flat embedding meets `∂M` transversally
  in `∂N`, with a half-space slice chart at every boundary point; and that with a Euclidean
  tangential model the predicate holds for no embedding of a manifold with nonempty boundary, by
  invariance of domain (in dimension one, the punctured image germ of a boundary point has one
  component while a punctured slice `ℝ × {0}` has two). *Needs:* Mathlib
  `ModelWithCorners.boundary`, `IsBoundaryPoint`,
  `Topology.IsEmbedding`; Layer 1.1 (the boundary manifold `∂M`).
- **Smooth, neat and polygonal embeddings.** Consume `TauCeti.IsLocallyFlat.of_isSmoothEmbedding`
  (a `C^n` embedding into a boundaryless manifold, `n ≠ 0`, is locally flat with complementary
  model the complement of the immersion), its neat form
  `TauCeti.IsLocallyFlat.of_isSmoothEmbedding_of_preimage_boundary` (a neat `C^n` embedding of
  half-space manifolds is locally flat with half-space tangential model) and
  `TauCeti.SimplePolygon.isLocallyFlat_realize` (a simple closed polygon in `ℝ^{m+1}` is locally
  flat with complementary model `ℝ^m`). So smooth embeddings between boundaryless manifolds are
  locally flat, neat smooth embeddings are neatly locally flat, and polygonal knots in `ℝ³` are
  locally flat with model `ℝ × ℝ²`. *Needs:* Mathlib `Manifold.IsSmoothEmbedding`.
- **The PL criterion by codimension.** The PL analogue above in terms of links: a PL embedding
  `f : N → M` of an `n`-manifold into an `m`-manifold is locally flat when the link pair of every
  point of `f(N)` in `M` is the standard sphere pair `(S^{m−1}, S^{n−1})`, whose cone is the
  standard affine pair; the converse is not a target. Prove that the link pair is standard for
  every PL embedding in codimension zero (an open embedding, by invariance of domain;
  `TauCeti.isLocallyFlat_iff_isOpenEmbedding`), in codimension at least three (Zeeman's
  unknotting theorem, Rourke–Sanderson, Chapter 7) and of a `1`-manifold (two points in a PL
  sphere), so that the failure of local flatness starts with surfaces in codimension two, as the
  cone on a polygonal right-handed trefoil in `S³ = ∂D⁴` shows (Rourke–Sanderson, Chapter 3, the
  discussion of links of points of polyhedra; Burde–Zieschang, *Knots*, Chapter 1, Definition 1.3
  for tame knots). In codimension one the link pair is a PL `(m−2)`-sphere in `S^{m−1}`, standard
  exactly when it bounds PL balls on both sides: this is the PL Schoenflies theorem in dimension
  `m − 1`, which holds for `m − 1 ≤ 3` (Alexander's theorem for PL `2`-spheres in `S³`), so every
  PL embedding of codimension one into a manifold of dimension at most four is locally flat. In
  ambient dimension at least five, standardness of the codimension-one link pair reduces through
  iterated links to the four-dimensional PL Schoenflies problem, which is open and is not a
  target; that problem concerns the PL standardness of the link pair, not topological local
  flatness. *Needs:* Tau Ceti `PreAbstractSimplicialComplex.link`; Layer 1.6 (PL maps).
- **Separating hypersurfaces and the topological collar.** Consume the pinned codimension-one
  theory: a locally flat embedding with one-dimensional complementary model is locally
  bicollared, and a locally bicollared embedding of a space charted on `F` is locally flat
  (`TauCeti.isLocallyFlat_iff_isEmbedding_and_isLocallyBicollared`); Brown's bicollaring theorem
  for two-sided embeddings of compact spaces into Hausdorff spaces
  (`TauCeti.IsLocallyBicollaredWithSides.exists_isBicollar`) and its separating form
  (`TauCeti.IsLocallyBicollared.isBicollared_of_not_isPreconnected_compl_range`); the sphere case
  `TauCeti.BrownBicollaring n`, proved as `TauCeti.brownBicollaring` for every `n` through
  Jordan–Brouwer separation, so that a locally flat `n`-sphere in `Sⁿ⁺¹` is bicollared in every
  dimension, `n = 0` included; and the collar theorem for compact boundaries
  `TauCeti.IsLocallyCollared.isCollared`. Prove the remaining general statements of Brown,
  *Locally flat imbeddings of topological manifolds*, Ann. of Math. 75 (1962), Theorems 1 and 2:
  a locally flat embedding of a closed connected `(n−1)`-manifold `N` into a connected
  `n`-manifold `M` whose image separates `M` is bicollared, with the two sides of the bicollar in
  the two complementary components; and the boundary of every topological manifold with compact
  boundary has a collar `∂M × [0, 1) → M` (the topological collar theorem). *Needs:* Mathlib
  `Topology.IsEmbedding`, `IsPreconnected`.

**Checks.**
- *Composite of axes.* For the `90°` rotation of the axis `ℝ × {0} ⊂ ℝ²` and `ℝ² × {0} ⊂ ℝ³`, the
  construction gives rotation × identity as slice chart, needing no chart compatibility (by
  evaluation).
- *Half-line.* The inclusion `[0, ∞) → ℝ` is locally flat for no tangential model `F` and
  complementary model `F'`, the half-space `EuclideanHalfSpace 1` included. A slice chart at `0`
  carries `[0, b)` onto an open part of `F × {0}`, so the image of `0` has a box neighbourhood
  `O × P` with `O ≅ [0, c)`, and the box is homeomorphic to an open subset of `ℝ`. Then `P`
  embeds in `ℝ` and contains no interval (else the box would contain a disc), so the components
  of the box are the half-open arcs `O × {p}`, whereas every component of an open subset of `ℝ`
  is an open interval. A half-space slice chart needs an ambient manifold with boundary, as for
  the ray in the closed half-plane below.
- *Horned sphere.* The Alexander horned sphere is a topological embedding of `S²` in `S³` that
  is not locally flat; its exterior is not simply connected, so it is not bicollared.
- *Neat and not neat.* The inclusion `[0, 1] → [0, 1] × S¹`, `t ↦ (t, 1)`, is neat locally flat
  with tangential model `EuclideanHalfSpace 1` and complementary model `ℝ`: the preimage of the
  boundary `{0, 1} × S¹` is `{0, 1} = ∂[0, 1]`, and the product chart is a half-space slice chart
  at each endpoint. The inclusion `[0, ∞) → ℝ` is not neat, since `∂ℝ = ∅` while
  `∂[0, ∞) = {0}`; and `[0, ∞)` is not locally flat for the full-slice predicate with any model,
  which is why the boundaryless predicate cannot be used for a slice disc
  (`TauCeti.IsTopologicalSliceDisc` uses the half-plane model).
- *Three different predicates.* In the closed half-plane `{y ≥ 0}` the ray `{(0, t) : t ≥ 0}` is
  neatly embedded: it meets the boundary line exactly in its own endpoint, and the chart
  `(x, y) ↦ (y, x)` is a half-space slice chart. The ray `{(t, 0) : t ≥ 0}` along the boundary
  line is not neat, since the preimage of the ambient boundary is the whole ray while the
  boundary of the ray is one point, and it is not boundary-disjoint locally flat, since its
  image is not in the interior.
- *Interior circle.* A circle in the interior of `D³` is boundary-disjoint locally flat; the
  Alexander horned sphere in `S³` is locally flat in no variant, since its complement is not
  simply connected near the wild points while a slice chart would give it a local product
  neighbourhood (`TauCeti.IsLocallyFlat.exists_isOpenEmbedding_prod`).
- *Unknotted cone.* The cone on an unknotted polygonal circle in `S³` is a PL disc in `D⁴` that is
  locally flat at the cone point: the link of the cone point is the unknotted pair `(S³, S¹)`,
  whose complement has fundamental group `ℤ`, and a PL homeomorphism of pairs with the standard
  pair gives the slice chart.
- *Trefoil group.* Near the apex, the complement of the cone on the trefoil `K` in the open cone
  on `S³` deformation retracts onto `S³ ∖ K`, so its fundamental group is the trefoil group
  `⟨x, y | x² = y³⟩`, which is non-abelian (it surjects onto `S₃`); a slice chart would give the
  complement of `ℝ² × {0}` in `ℝ⁴`, with fundamental group `ℤ` (AlgebraicTopology Stage 1, van
  Kampen).
- *The image, not the parametrization.* The smooth embedding `t ↦ (t, t³)` of `ℝ` in `ℝ²` is
  locally flat; the homeomorphism `t ↦ t − sin t` of `ℝ/2πℤ` composed with a smooth knot is a
  topological embedding whose derivative vanishes at one point, and it is locally flat, its
  image being the same smooth circle.
- *Separation is needed.* The core circle of an open Möbius band is locally bicollared and not
  bicollared: it does not separate, and the two sides of a local bicollar are exchanged along the
  band.
- *Local flatness is needed.* A round `S¹` in `S²` is bicollared by
  `(θ, t) ↦ (cos θ cos t, sin θ cos t, sin t)` for `|t| < π/4`; the Alexander horned sphere
  separates `S³` and is not bicollared, so local flatness is a hypothesis and not a consequence
  of separation.
- *Two points.* Two points in `S¹` are bicollared by two disjoint arcs
  (`TauCeti.brownBicollaring 0`, through `LocallyFlat/Finite.lean`), so the sphere case has no
  connectedness hypothesis on the sphere.

### 2.2 The generalized Schoenflies theorem

Prove Brown's theorem: for `n ≥ 1` and a bicollared embedding of `Sⁿ⁻¹` in `Sⁿ`, each of the
two complementary domains has closure homeomorphic to `Dⁿ`, by a homeomorphism restricting to
the given parametrization on the boundary (Brown, *A proof of the generalized Schoenflies
theorem*, Bull. Amer. Math. Soc. 66 (1960), Theorems 4 and 5): collapse the two complementary
pieces to points, prove the resulting cellular decompositions shrinkable, and identify each
closure with a cell. With `TauCeti.brownBicollaring` this gives the locally flat Schoenflies
theorem: a locally flat `Sⁿ⁻¹ ⊂ Sⁿ` bounds a ball on each side.

- The homeomorphisms may be chosen so that the two balls form the standard decomposition of
  `Sⁿ` into two hemispheres.
- For `n = 2` the result without the boundary parametrization is the pinned Schoenflies
  theorem on `S²`, `TauCeti.IsJordanCurve.exists_homeomorph_image_inner_eq_zero`, which needs
  no bicollar (the parametrization is then adjusted by the cone on a homeomorphism of the
  circle); for `n = 1` it says that two points cut `S¹` into two arcs. The proof here is
  dimension-independent and consumes neither.

**Checks.**
- *Horned sphere.* The Alexander horned sphere bounds a ball on exactly one side; it is not
  bicollared, so the hypothesis excludes it.
- *Round sphere.* A round sphere of radius `r` in `Sⁿ` bounds the two round balls, which the
  theorem gives.
- *Dimension two.* A locally flat `S¹ ⊂ S²` bounds two discs, the classical Schoenflies theorem;
  the theorem asserts no smoothness of the discs' parametrizations.

*Needs:* Tau Ceti `TauCeti.IsBicollar`, `TauCeti.BrownBicollaring`, `TauCeti.brownBicollaring`;
Mathlib `Homeomorph`.

### 2.3 The annulus theorem

The statement is the pinned `TauCeti.AnnulusConjecture n`: two locally flat embeddings `f, g`
of `Sⁿ` in `ℝⁿ⁺¹` with the image of `g` strictly inside the region bounded by `f` cobound an
annulus `TauCeti.CoboundAnnulus f g`, the closed region between them being the image of an
embedding of `Sⁿ × [0, 1]` with the two spheres as its ends. It is a theorem in every
dimension: for `n + 1 ≤ 3` by Schoenflies and the classification of surfaces with the
triangulation theorem of Layer 11.2; for `n + 1 ≥ 5` by Kirby (*Stable homeomorphisms and the
annulus conjecture*, Ann. of Math. 89 (1969), 575–582: Theorem 1 derives the stable
homeomorphism conjecture in dimension `n + 1 ≥ 6` from the Hauptvermutung for tori through the
torus trick, and the addenda reach dimension `5` by Wall's theorem on ends and the
Hauptvermutung for the `2ⁿ⁺¹`-fold covers of homotopy tori from the theorems of Wall and of
Hsiang–Shaneson); for `n + 1 = 4` by Quinn (*Ends of maps III*, J. Differential Geom. 17
(1982)). `Suggested.lean` states `annulus_conjecture` for every `n`. This roadmap proves the
cases `n + 1 ≤ 3`.

- Equivalent form: every orientation-preserving homeomorphism of `ℝⁿ⁺¹` is stable, a finite
  composition of homeomorphisms each the identity on a nonempty open set (Brown–Gluck).
- The region between the spheres is a compact manifold with boundary `Sⁿ ⊔ Sⁿ`, by Layer 2.2
  applied to each sphere.
- **The bounded region.** The annulus theorem is `∀ n, TauCeti.AnnulusConjecture n`, with the
  bounded regions read off `TauCeti.filledHull`: the hypothesis is
  `range g ⊆ filledHull (range f) ∖ range f`, and the closed region between the spheres is
  `filledHull (range f) ∖ (filledHull (range g) ∖ range g)`, the image of an embedding of
  `Sⁿ × [0, 1]` whose two ends are the two spheres. So no separation theorem is assumed in the
  statement. In dimensions `n + 1 ≤ 3` the triangulation theorems used are Radó's
  (Layer 11.2.1) and Moise's (Layer 11.2). In dimensions `n + 1 ≥ 5` the route is Kirby's torus
  trick through the stable homeomorphism theorem, with the companion notion of a locally flat
  submanifold with a topological normal bundle (Kirby–Siebenmann, *Foundational Essays*,
  Essay IV); both are GeometricTopology, Part II's. *Needs:* Tau Ceti `TauCeti.filledHull`;
  Mathlib `Homeomorph`, `Metric.sphere`; Layer 2.1 (bicollars of locally flat spheres).

**Checks.**
- *Round annulus.* Two concentric round spheres cobound the round annulus; this is the pinned
  `TauCeti.coboundAnnulus_smul_coe_sphere`.
- *Strict inclusion.* For two spheres with a common point the region between them is not a
  manifold with boundary, so the strict-inside hypothesis is needed.
- *Local flatness.* A horned sphere inside a round sphere does not cobound an annulus with it,
  the complementary domain on the wild side not being simply connected.
- *Equal radii.* For `r < R` the concentric round spheres cobound `{r ≤ |x| ≤ R}`, parametrized
  by `(u, t) ↦ (R − (R − r)t)u`; with `r = R` the hypothesis
  `range g ⊆ filledHull (range f) ∖ range f` fails, and the conclusion is false, the region being
  a sphere and not an annulus.
- *Dimension zero.* For `n = 0` the spheres are pairs of points `{a, b}` and `{c, d}` with
  `a < c < d < b`, so `filledHull` of the outer pair is `[a, b] ⊆ ℝ`; they cobound the two
  disjoint closed intervals `[a, c]` and `[d, b]`, and the statement holds for every `n`.
- *A knotted tube.* The boundary of a thin tube around a knotted arc in `D³` is a smoothly, hence
  locally flatly, embedded `2`-sphere that is not round; the theorem says that it cobounds an
  annulus with a large round sphere, although the statement provides no isotopy of `ℝ³` carrying
  it to a round sphere. The region it bounds is a ball (the Schoenflies theorem), which the
  annulus theorem neither assumes nor concludes.

*Needs:* Tau Ceti `TauCeti.AnnulusConjecture`, `TauCeti.CoboundAnnulus`, `TauCeti.IsLocallyFlat`;
Layer 2.2; Layer 11.2 (triangulations in dimension three) for `n + 1 = 3`.

### Examples

The axis in the plane and the horned sphere as the positive and negative controls for local
flatness; the round and locally flat Schoenflies theorems; the concentric annulus.
Also the horned sphere as the standing negative control of Layers 2.1 and 2.3; the cone on the
trefoil as the PL negative control and the cone on the unknot as its positive counterpart
(Layer 2.1); the neat arc in `[0, 1] × S¹` and the boundary ray in the half-plane (Layer 2.1).

### Dependencies

Tau Ceti's locally flat embeddings, bicollars, Brown bicollaring and annulus statement;
Layer 11.2 for the three-dimensional case of the annulus theorem; Tau Ceti's Schoenflies
theorem on `S²` for comparison in dimension two.
Also Layer 1.1 for the boundary manifold and Layer 1.6 for PL maps; Tau Ceti's smooth, neat and
polygonal local flatness, two-sided bicollaring, collar theorem and `TauCeti.filledHull`;
Mathlib's `Topology.IsEmbedding` API; AlgebraicTopology Stage 1 for the trefoil group. The
high-dimensional route of the annulus theorem, Kirby's stable homeomorphism theorem and
Kirby–Siebenmann normal bundles, is GeometricTopology, Part II's.

## Layer 3: diffeomorphism groups

The Smale conjecture and its four-dimensional failure are statements about the homotopy type
of `Diff(M)`: the pinned `TauCeti.Diff I M n` with the weak Whitney topology
`Diffeomorph.weakWhitneyTopology` (the scoped instance of `TauCeti.DiffeomorphWeakWhitney`),
`Diffeomorph.ofSmoothFamily`, the fixing subgroups `TauCeti.RelativeDiff` and the propositions
`TauCeti.SmaleConjecture` and `TauCeti.WatanabeTheorem`. This layer compares the weak topology
with the Whitney and compact-open topologies, proves isotopy extension, and states Cerf's
theorem and the Smale conjecture.

### 3.1 The topological group `Diff(M)`

For a compact Hausdorff manifold `M` with locally compact model space, `TauCeti.Diff I M ∞` is
a topological group with continuous evaluation and closed fixing subgroups by the pinned
`Diffeomorph.continuous_trans`, `Diffeomorph.continuousMul`, `Diffeomorph.continuous_symm`,
`Diffeomorph.isTopologicalGroup`, `Diffeomorph.continuousEval_weakWhitney` and
`Diffeomorph.isClosed_fixingSubgroup`. Prove that the weak topology agrees with the Whitney
`C^∞` topology of uniform convergence of all derivatives in charts (Hirsch, *Differential
Topology*, Chapter 2 §1, for compact sources). Prove that the forgetful map `Diff(M) → C(M, M)`
to the compact-open topology is continuous and injective for every compact `M`, and that for a
nonempty `M` of positive dimension it is not a topological embedding, by a perturbation of the
identity supported in one chart whose `C⁰` size tends to zero while a higher derivative stays
bounded away from zero; in dimension zero both topologies on the finite set `Diff(M)` are
discrete and the forgetful map is an embedding.

Multiplication in `TauCeti.Diff I M n` is composition, `f * g = f ∘ g`, and the weak Whitney
topology on `M ≃ₘ^n⟮I, I⟯ M` is induced from the chart-derivative topology on `C^n⟮I, M; I, M⟯`.
Consume as well the continuity of evaluation at a point (`Diffeomorph.continuous_eval_const`),
Hausdorffness (`Diffeomorph.t2Space_weakWhitney`) and the relative subgroup
`TauCeti.RelativeDiff I M n s` of diffeomorphisms fixing a set `s` pointwise, closed for the weak
Whitney topology and a topological group when the model is locally compact. Define `Diff(M, ∂M)`
as `TauCeti.RelativeDiff I M ∞ (I.boundary M)` for `M` with boundary; `TauCeti.DiscDiff n` is the
case of the closed ball. Define the **orientation-preserving subgroup** `Diff⁺(M)` of a closed
oriented manifold `M` (`TauCeti.Orientable`, with a chosen oriented atlas) as the subgroup of
diffeomorphisms preserving that orientation (positive Jacobian determinant in every pair of
oriented charts), and prove that it is open and closed. For a closed oriented *connected* `M`
prove that `Diff⁺(M)` is the kernel of the degree homomorphism `Diff(M) → {±1}`, so that it has
index at most two. The degree of a map `f : M → N` of closed oriented connected `n`-manifolds is
read homologically, as the integer `d` with `f_*[M] = d · [N]` in `H_n(N; ℤ) ≅ ℤ` for the
fundamental classes of AlgebraicTopology Stage 6; this is AlgebraicTopology 6.5's homological
characterization of the manifold degree, and it needs no smoothness. The degree is not defined for
disconnected `M`, where the atlas description is the only one.

- The pinned topological-group theorems carry `[CompactSpace M]` because the weak and strong
  topologies agree only for compact sources, and isotopy classes are open in the strong one.
- The identity component `Diff₀(M)` is a normal subgroup; its quotient is the smooth mapping
  class group.
- A `TauCeti.Diffeotopy` gives a path in `Diff(M)` from the identity
  (`TauCeti.Diffeotopy.toPath`); a continuous path in `Diff(M)` need not be a smooth isotopy,
  and the smoothing of paths is TeichmullerGeometry §0.2's.
- `Diff(M, ∂M)` and `Diff⁺(M)` are closed subgroups of the Hausdorff topological group
  `Diff(M)`, hence topological groups.
- Evaluation `Diff(M) → M` at a point is continuous, so the orbit map of the tautological action
  (`Diffeomorph.applyMulAction`) is continuous.
- For connected `M` the degree is a continuous homomorphism to the discrete group `{±1}`, so
  `Diff⁺(M)` is the union of the components of degree one.

**Checks.**
- *Convergence in C¹ only.* On `S¹` the diffeomorphisms `θ + k⁻² sin(kθ)`, `k ≥ 2`, tend to the
  identity in `C¹` but not in `Diff(S¹)`: their second derivatives have supremum `1` (by
  evaluation).
- *Dimension zero.* For `M = S⁰`, `Diff(M)` is the discrete group of order two inside the
  discrete space `C(S⁰, S⁰)` of four maps, so the strictness assertion needs positive dimension.
- *Components.* The identity component of `Diff(S¹)` is the orientation-preserving subgroup and
  the component group is `ℤ/2`.
- *Rotations and reflection.* `Diff(S¹)` contains the rotations `TauCeti.circleRotationHom a`
  and the reflection `TauCeti.circleReflection`, of degrees `+1` and `−1`; `Diff⁺(S¹)` contains
  the rotations and not the reflection, so `Diff(S¹)/Diff⁺(S¹)` has order two.
- *Non-compact source.* On `S¹` the family `φ_t(e^{iθ}) = e^{i(θ + t)}` is jointly smooth on
  `ℝ × S¹`, so it is a continuous map `ℝ → Diff(S¹)` by `Diffeomorph.ofSmoothFamily`, with image
  the compact subgroup of rotations. On the non-compact `ℝ` the weak and strong Whitney
  topologies differ: for a bump function `b` supported in `[−1, 1]` with `|b'| < 1`, the
  diffeomorphisms `x ↦ x + b(x − k)` converge to the identity as `k → ∞` in the weak topology
  (with all derivatives, uniformly on compact sets) but not in the strong one (the perturbation
  never becomes small on all of `ℝ`); the topological-group statements of this section are for
  compact `M`, where the two agree.
- *Finite sets and disconnected sources.* For `M = {pt}`, `Diff(M)` is trivial; for `M` a finite
  set of `k` points, `Diff(M)` is the symmetric group `S_k` with the discrete topology. The
  degree description does not apply to the finite set with `k ≥ 2`, nor to `M = S¹ ⊔ S¹`: the
  degree is defined for connected closed oriented manifolds only, and the swap of the two
  circles has no degree, while the atlas description makes the swap orientation-preserving. For
  connected `M` the two descriptions agree, which is the theorem stated.
- *Interval.* `Diff(D¹, ∂D¹)` is the group of diffeomorphisms of `[−1, 1]` fixing the endpoints;
  it is contractible (the straight-line homotopy `(1 − s) f + s · id` stays among increasing
  diffeomorphisms fixing the endpoints), and `Diff(D¹)` has two components.

*Needs:* Tau Ceti `TauCeti.Diff`, `Diffeomorph.weakWhitneyTopology`,
`Diffeomorph.continuous_eval_const`, `Diffeomorph.t2Space_weakWhitney`, `TauCeti.RelativeDiff`,
`TauCeti.DiscDiff`, `TauCeti.Orientable`, `Diffeomorph.applyMulAction`,
`TauCeti.circleRotationHom`, `TauCeti.circleReflection`,
`Diffeomorph.isTopologicalGroup`, `TauCeti.Diffeotopy`; Mathlib `IsTopologicalGroup`,
compact-open topology, `Diffeomorph`; AlgebraicTopology Stage 6 (fundamental classes,
`H_n(M; ℤ) ≅ ℤ` for closed oriented connected `M`, and the homological characterization of the
degree in 6.5); Layer 1.1 (manifolds with boundary).

### 3.2 Smooth families and the reference inclusion

`Diffeomorph.ofSmoothFamily` sends a smooth `F : P × M → M`, each `F(p, ·)` a diffeomorphism,
to a continuous `P → Diff(M)`. Prove that it is a bijection from the smooth families onto the
continuous maps `P → Diff(M)` whose adjoint `P × M → M` is smooth (adjoints are continuous by
`Diffeomorph.continuousEval_weakWhitney`; Hirsch, Chapter 2 §1), and that not every continuous
map `P → Diff(M)` is in its image. The inverse is not claimed continuous: for compact `P` and
`M` the compact-open topology on `C(P, Diff(M))` induces on smooth families a topology strictly
coarser than the joint `C^∞` topology of the adjoints. The reference inclusion
`O(n+1) → Diff(Sⁿ)` is `TauCeti.orthogonalToDiffSphere n ∞`, continuous by
`TauCeti.continuous_orthogonalToDiffSphere` and injective by
`TauCeti.orthogonalToDiffSphere_injective`; prove it is a closed embedding by
`Continuous.isClosedEmbedding`, `O(n+1)` being compact and `Diff(Sⁿ)` Hausdorff
(`t2Space_weakWhitney`).

Its continuous form is the native
`TauCeti.continuousOrthogonalToDiffSphere n ∞ : O(n + 1) → Diff(Sⁿ)`, obtained by restricting
linear isometries to the unit sphere (`LinearIsometryEquiv.unitSphereDiffHom`, injective); prove
that it is a closed embedding of topological groups and, for `n ≥ 1`, that it lands in `Diff⁺(Sⁿ)`
(3.1) exactly on `SO(n + 1)`. Prove the converse of the smooth-families map up to homotopy: for
`P` a compact manifold and `M` compact, every continuous `P → Diff(M)` is homotopic to the image
under `Diffeomorph.ofSmoothFamily` of a jointly smooth family (Hirsch, Chapter 2, the
approximation of continuous maps by smooth ones, applied in charts of `C^∞(M, M)`). The non-smooth
family of the Checks shows that the converse holds only up to homotopy; the smoothing of a path
with its endpoints fixed is TeichmullerGeometry §0.2's, as in 3.1.

**Checks.**
- *Non-smooth family.* `F(t, z) = e^{i|t|} z` on `S¹` is continuous into `Diff(S¹)` but not
  smooth in `t`, so it is not in the image of `ofSmoothFamily` (by evaluation).
- *Inverse not continuous.* `F_k(θ, z) = exp(i sin(kθ)/k) z` on `S¹ × S¹` tends to the identity
  in `C(S¹, Diff(S¹))`, but `∂_θ F_k(0, z) = i z` for every `k` (by evaluation).
- *Reflection.* `O(2) → Diff(S¹)` sends the reflection `(x, y) ↦ (x, −y)` to complex
  conjugation, which is not in the identity component; the inclusion is injective on the two
  components.
- *Antipodal map.* The antipodal map `−1 ∈ O(n + 1)` has determinant `(−1)^{n+1}`, so it lies in
  `Diff⁺(Sⁿ)` exactly for odd `n`, and its degree is `(−1)^{n+1}`, a composite of `n + 1`
  reflections of degree `−1` each: `−1 ∈ O(2)` is the rotation by `π`, of degree `+1`, and
  `−1 ∈ O(3)` is the antipodal map of `S²`, of degree `−1`.
- *Surjective degree.* The inclusion `O(4) → Diff(S³)` sends the diagonal matrix
  `diag(−1, 1, 1, 1)` to a reflection of `S³`, which is not in `Diff⁺(S³)`, so
  `Diff(S³) → {±1}` is surjective.

*Needs:* Tau Ceti `Diffeomorph.ofSmoothFamily`, `Diffeomorph.continuousEval_weakWhitney`,
`TauCeti.orthogonalToDiffSphere`, `TauCeti.orthogonalToDiffSphere_injective`,
`LinearIsometryEquiv.unitSphereDiffHom`,
`TauCeti.continuousOrthogonalToDiffSphere`; Mathlib `Matrix.orthogonalGroup`,
`Continuous.isClosedEmbedding`, `Topology.IsClosedEmbedding`, `ContinuousMap.Homotopy`; Layer 3.1
(the topology, `Diff⁺` and the homological degree).

### 3.3 Isotopy extension

Let `N` be a compact manifold and `M` a boundaryless manifold, and give the space `Emb(N, M)` of
smooth embeddings the subspace topology from the weak `C^∞` topology on `ContMDiffMap`. The smooth
isotopy extension theorem on compact sets is Tau Ceti's: a `C^n` isotopy of a boundaryless
manifold through smooth embeddings into a finite-dimensional boundaryless manifold is, on any
compact subset of the source, the restriction of a compactly supported `C^m` diffeotopy for
`1 ≤ m`, `m + 1 ≤ n` (`TauCeti.SmoothIsotopy.exists_diffeotopy_apply_eq`, Hirsch, Chapter 8,
Theorem 1.3), and for a compact source smooth isotopy and smooth ambient isotopy agree
(`TauCeti.smoothAmbientIsotopic_iff_smoothIsotopic`). So are the homogeneity lemma, a diffeotopy
of a connected manifold carrying one point to another (`Diffeotopy/Homogeneity.lean`), and the
disc theorem for balls with a common centre and derivatives of the same orientation
(`TauCeti.SmoothEmbedding.exists_smoothIsotopy_of_det_chartAt_mul_pos` and its ambient form
`TauCeti.SmoothEmbedding.exists_diffeotopy_eqOn_of_det_chartAt_mul_pos`). None of these is
planned again here. Prove the restriction fibration: for an embedding `e : N → M`, the map
`Diff_c(M) → Emb(N, M)`, `g ↦ g ∘ e`, from the compactly supported diffeomorphisms has
continuous local sections near `e` onto its orbit, the orbit is open, and the map is a locally
trivial principal bundle with fibre the diffeomorphisms fixing `e(N)` pointwise (Palais, *Local
triviality of the restriction map for embeddings*, Comment. Math. Helv. 34 (1960); Cerf,
*Topologie de certains espaces de plongements*, Bull. Soc. Math. France 89 (1961)). Deduce:

- **Relative isotopy extension.** The pinned diffeotopy may be taken to be the identity on an
  open set where the family is constant, by cutting off the extended velocity field with a
  partition of unity.
- **Isotopy extension, continuous form.** A continuous path in `Emb(N, M)` is covered by a
  continuous path in `Diff_c(M)`, and more generally the homotopy lifting property holds for
  finite CW pairs.
- **The disc theorem for arbitrary centres.** Two orientation-preserving smooth embeddings of
  `Dⁿ` into a connected oriented `n`-manifold are ambient isotopic (Palais, *Extending
  diffeomorphisms*; Hirsch, Chapter 8, Theorem 3.1): move one centre to the other by the pinned
  homogeneity lemma and apply the pinned disc theorem. Layer 1.4's cut-and-glue description
  uses it.

**Checks.**
- *Orientation in the disc theorem.* The embeddings `x ↦ x` and `x ↦ −x` of `D¹` into `ℝ` are not
  ambient isotopic.
- *Shrinking trefoil.* The shrinking local trefoil of 4.2.7 is a jointly `C⁰` family of smooth
  embeddings, trefoils for positive time and the unknot at `0`; it is not `C¹`-continuous, so
  neither form applies.
- *Rotation and dilation.* The family `F_t(z) = e^{it} z` of embeddings `S¹ → ℝ²` extends to
  the rotation isotopy of `ℝ²`, compactly supported after cutting off outside a disc, and
  `F_t(z) = (1 + t) z` to a radial isotopy supported in a larger disc.

*Needs:* Layer 1.5; Tau Ceti `TauCeti.Diffeotopy`, `TauCeti.SmoothEmbedding`, `TauCeti.Diff`,
`TauCeti.SmoothIsotopy.exists_diffeotopy_apply_eq`,
`TauCeti.SmoothEmbedding.exists_diffeotopy_eqOn_of_det_chartAt_mul_pos`; Mathlib `ContMDiffMap`.

### 3.4 Cerf's theorem and the Smale conjecture

Cerf's theorem, `π₀(Diff⁺(S³)) = 0` (Cerf, *Sur les difféomorphismes de la sphère de dimension
trois*, Lecture Notes in Math. 53 (1968), Théorème 1), is Tau Ceti's proposition
`TauCeti.CerfTheorem` in orientation-free form: every diffeomorphism of `S³` is joined in the weak
Whitney topology to one induced by an orthogonal map; `TauCeti.cerfTheorem_iff_natCard_zerothHomotopy_eq_two`
says it holds exactly when `Diff(S³)` has two path components, and
`TauCeti.SmaleConjecture.cerfTheorem` derives it from the Smale conjecture, so `Suggested.lean`,
which states the Smale conjecture as `smale_conjecture`, does not state it separately. Prove its
consequence `Γ₄ = 0` (Cerf, Corollaire 1): every
orientation-preserving diffeomorphism of `S³` extends over `D⁴`, by the radial extension of an
orthogonal map along the isotopy. State Hatcher's theorem, the Smale conjecture: the inclusion
`O(4) → Diff(S³)` is a homotopy equivalence (Hatcher, *A proof of the Smale conjecture*, Ann.
of Math. 117 (1983), 553–607). The statement is the pinned `TauCeti.SmaleConjecture` and
`Suggested.lean` states it as `smale_conjecture`. Both proofs are GeometricTopology, Part II's,
by Hatcher's route from the restriction fibration of Layer 3.3: for a marked disc `D³ ⊂ S³`,
`Diff(S³)` is `O(4)` times the diffeomorphisms of `D³` fixing a boundary collar, contractible by
the parametric straightening of spheres and discs.

In the orientation-free form, `TauCeti.CerfTheorem` says that `π₀(O(4)) → π₀(Diff(S³))` is
surjective (Cerf, *Sur les difféomorphismes de la sphère de dimension trois (Γ₄ = 0)*,
Théorème 1). The native library proves that this map is injective in every dimension
(`TauCeti.joined_orthogonalToDiffSphere_iff`: two orthogonal transformations are joined as
diffeomorphisms of `Sⁿ` exactly when their determinants agree), hence the two-component
criterion above, and that the Smale conjecture implies Cerf's theorem, a homotopy equivalence
being surjective on path components; these are consumed, not targets. Prove the **comparison
with the classical form**: `TauCeti.CerfTheorem` holds exactly when `π₀(Diff⁺(S³)) = 0` for the
orientation-preserving subgroup of 3.1 (a diffeomorphism joined to an orthogonal map of
determinant `−1` has degree `−1`, so under `CerfTheorem` an element of `Diff⁺(S³)` is joined to
an element of `SO(4)`, hence to the identity, `SO(4)` being path connected; conversely a
diffeomorphism of degree `−1` composed with a reflection has degree `+1`). Prove `Γ₄ = 0` for
diffeomorphisms of either degree as well: every diffeomorphism of `S³` extends to a
diffeomorphism of `D⁴` (an orthogonal map extends linearly, and an isotopy to it extends over a
collar of Layer 1.1).

- Smale: the specific map `continuousOrthogonalToDiffSphere 3 ∞` is a homotopy equivalence, not
  merely some homotopy equivalence of the two spaces; its disc form is that `Diff(D³, ∂)` is
  contractible. `O(4)` is compact and `Diff(S³)` is not, so no isomorphism of topological groups
  is claimed.
- Cerf: every diffeomorphism of `S³` is joined to an orthogonal one; equivalently `π₀(Diff(S³))`
  has two elements; equivalently every orientation-preserving diffeomorphism of `S³` is joined
  to the identity in `Diff⁺(S³)`; hence `Γ₄ = 0`.
- `Diff(S¹) ≃ O(2)`, by straightening a diffeomorphism to a rotation, and `Diff(S²) ≃ O(3)`
  (Smale, *Diffeomorphisms of the 2-sphere*, Proc. Amer. Math. Soc. 10 (1959), Theorem A: the
  orientation-preserving diffeomorphisms of `S²` deformation retract onto `SO(3)`) are proved
  here, as is Smale's disc theorem, the route to the latter: the diffeomorphisms of the square
  `[0, 1]²` equal to the identity on a neighbourhood of the boundary form a contractible space,
  by a contraction smooth in the parameter and fixing the identity (Smale, Theorem B and
  Theorem 4). Consequently a diffeomorphism of `D²` equal to the identity near `∂D²` is smoothly
  isotopic to the identity through such diffeomorphisms; Layers 1.7.2 and 11.2.1 use this form,
  and all three are inputs to Hatcher's argument.
- In dimension four the analogue fails: `TauCeti.WatanabeTheorem` says that `π₁(Diff(D⁴, ∂))`
  has an element of infinite order (Watanabe, *Some exotic nontrivial elements of the rational
  homotopy groups of Diff(S⁴)*, arXiv 1812.02448, Theorem 1.1, which gives for every `k ≥ 1` a
  surjection from `π_k(BDiff(D⁴, ∂)) ⊗ ℚ` onto the space of trivalent graphs of degree `k`,
  nonzero first for `k = 2`). `Suggested.lean` states it as `watanabe_theorem`.
  The fundamental group is `π₁(Diff(D⁴, ∂), id)`, based at the identity, and the first class lies
  in `π₂ BDiff(D⁴, ∂) ⊗ ℚ ≅ π₁ Diff(D⁴, ∂) ⊗ ℚ` (Watanabe, Theorem 1.1 and Remark 1.2: the
  evaluation of Kontsevich's classes gives the surjection `π_k BDiff(D⁴, ∂) ⊗ ℚ → A_k` onto the
  space `A_k` of trivalent graphs of degree `k`, with `A₁ = 0` and `A₂ ≅ ℚ`). Watanabe's theorem
  refutes the four-dimensional disc Smale conjecture, that `Diff(D⁴, ∂)` is contractible (the
  native `TauCeti.WatanabeTheorem.not_contractibleSpace_discDiff_four`, consumed), which is the
  disc form of Kirby's Problem 4.34 (`Diff(S⁴) ≃ O(5)`?) and the smooth half of Kirby's
  Problem 4.126.

**Checks.**
- *Two isotopy classes.* The antipodal map of `S³` is `−I ∈ SO(4)`, isotopic to the identity; the
  reflection `(x₀, x₁, x₂, x₃) ↦ (x₀, x₁, x₂, −x₃)` has degree `−1` and is not (by evaluation).
- *Not a homeomorphism.* `π₁(SO(4)) = ℤ/2`, and Hatcher's theorem gives `π₁(Diff(S³)) = ℤ/2`;
  a homeomorphism `O(4) ≃ Diff(S³)` is excluded since `O(4)` is compact and `Diff(S³)` is not
  (Layer 3.1).
- *Dimension four.* The analogous statement for `S⁴` is false by Watanabe's theorem, so no
  dimension-independent formulation is made.
- *At most two.* The reflection is not joined to the identity
  (`TauCeti.not_pathConnectedSpace_diff_sphere`), so `π₀(Diff(S³))` has at least two elements;
  the orientation-free form asserts "at most two", not `π₀(Diff(S³)) = 0`, and the formula
  `π₀ = ℤ/2` for the full group is the correct one.
- *Not compact.* The time-`t` map of the gradient flow of a height function on `S³` has
  derivative of norm `e^{t}` at the minimum, a hyperbolic fixed point, unbounded in `t`, while
  the image of `O(4)` is compact; so `Diff(S³)` is not compact and a topological-group
  isomorphism `Diff(S³) ≅ O(4)` is false.
- *Dimensions one and six.* In dimension `1` every diffeomorphism of `S¹` is joined to a
  rotation or to a reflection, so `π₀(Diff(S¹))` has two elements, the shape of
  `TauCeti.CerfTheorem`; in dimension `6` the shape fails, since
  `π₀(Diff⁺(S⁶)) ≅ Θ₇ ≅ ℤ/28` (Kervaire–Milnor, *Groups of homotopy spheres I*, with the
  identification `Γ₇ = Θ₇`), so the dimension `3` is the content of Cerf's theorem.

*Needs:* Tau Ceti `TauCeti.SmaleConjecture`, `TauCeti.CerfTheorem`,
`TauCeti.SmaleConjecture.cerfTheorem`, `TauCeti.WatanabeTheorem`, `TauCeti.DiscDiff`,
`TauCeti.cerfTheorem_iff_natCard_zerothHomotopy_eq_two`,
`TauCeti.joined_orthogonalToDiffSphere_iff`, `TauCeti.not_pathConnectedSpace_diff_sphere`,
`TauCeti.WatanabeTheorem.not_contractibleSpace_discDiff_four`,
`TauCeti.orthogonalToDiffSphere`; Layer 3.1, Layer 3.3; Mathlib `ContinuousMap.HomotopyEquiv`,
`HomotopyGroup`, `ZerothHomotopy`, `Joined`, `ContractibleSpace`; Layer 1.1 (collars, for
`Γ₄ = 0`), Layer 3.2 (the reference inclusion).

### Examples

`Diff(S¹) ≃ O(2)`; the rotation path and its non-smooth reparametrization; the extension of
the rotation of a circle in the plane to an ambient isotopy; the two components of
`Diff(S³)`.
`Diff(S¹)` with its rotations and reflection; the reference inclusions
`O(n + 1) → Diff(Sⁿ)`; `Diff(D¹, ∂D¹)` contractible; the three headline statements, Smale's,
Cerf's and Watanabe's, all statable at the pins and stated in `Suggested.lean`.

### Dependencies

Tau Ceti's diffeomorphism group, weak Whitney topology, diffeotopies, fixing subgroups, sphere
action, isotopy extension on compact sets, homogeneity, the disc theorem and Cerf's theorem as a
proposition; Layer 1.5 (tubes) for the restriction fibration; DifferentialGeometry Layer 3
(flows).
Mathlib's `Diffeomorph`, `ContMDiffMap` and `HomotopyGroup`; AlgebraicTopology Stage 6's
fundamental classes, for the homological degree of 3.1; Layer 1.1 for manifolds with boundary
and collars.

## Layer 4: knots and links

Knot theory is owned here. Knots and links are the geometric presentation of the Conventions,
with equivalence `TauCeti.SmoothLinkEmbedding.SmoothAmbientIsotopic` (through a
`TauCeti.Diffeotopy`) or its continuous form; the combinatorial presentations at the pin are
planar PD codes, based oriented Gauss codes and braid words with their closures. This layer
connects the presentations, builds the invariants on the polynomial and matrix carriers already
in Tau Ceti, and proves the comparison theorems. Links in `S³` and `ℝ³` are related by
stereographic projection from a point off the link, an ambient-isotopy-preserving bijection of
link types used silently below.

### 4.1 Knot types, mirrors and connected sums

Define the knot type of `K` as its class under `SmoothAmbientIsotopic`; the unoriented type
additionally identifies `K` with `K.reverse`; the mirror of `K ⊂ S³` is its image under the
fixed reflection of `S³`. The empty link `TauCeti.SmoothLinkEmbedding.empty` is the unique
`0`-component link, and the `n`-component unlink is a set of `n` great circles in disjoint balls.
Define the connected sum `K # J` of two oriented knots in `S³` by choosing disjoint balls each
meeting one knot in an unknotted arc and joining the two arcs by an untwisted band compatible
with the orientations, and prove that the result is independent of the choices up to ambient
isotopy, commutative, associative, with the unknot as identity (Lickorish, *An Introduction to
Knot Theory*, Chapter 2). Define a knot to be prime when it is not the unknot and every
connected-sum decomposition has an unknotted summand.

The geometric carriers are native: `TauCeti.SmoothCircleEmbedding I M` (a smooth embedding of the
oriented circle, with `rotate` for orientation-preserving reparametrization and `reverse` for
orientation reversal), `TauCeti.UnorientedSmoothCircleEmbedding I M` (the quotient by reversal,
the carrier of the unoriented knot type), the labelled links `TauCeti.SmoothLinkEmbedding I M n`
(families of `n` smooth circle embeddings with pairwise disjoint images, with `relabel`,
`reverse` and transport by ambient diffeomorphisms; `singletonEquiv` identifies one-component
links with knots), and `SmoothAmbientIsotopic`, one diffeotopy of `M` carrying every component
onto the corresponding component at time one.

**Framings and the homological linking number.** For an oriented knot `K` in `S³` the meridian
generates `H₁(S³ ∖ K; ℤ) ≅ ℤ`, the native
`TauCeti.IsSolidTorusNeighborhood.complementHomologyEquiv` of a solid-torus neighbourhood of `K`
(Alexander duality, Hatcher, *Algebraic Topology*, Corollary 3.45, derived from the relative
form Theorem 3.44; the native proof is the Mayer–Vietoris sequence of the decomposition of `S³`
into the tube of `K` (Layer 1.5) and the complement of `K`, giving
`ℤ ⊕ H₁(complement) ≅ H₁(T²) = ℤ²`). The homological linking number of a disjoint oriented knot
`J` with `K` is the integer multiple of the positive meridian that is the class of `J`; 4.3
proves it equal to the linking number `lk(J, K)` of the Conventions. Define a **framing** of a
smooth knot `K` in `S³` as a homotopy class of nowhere-vanishing sections of the normal bundle of
`K` (Layer 1.5), and the **Seifert framing** as the one whose push-off has linking number `0` with
`K`; prove that framings form a torsor under `ℤ` through the linking number of the push-off, so
that a framed knot is a knot with an integer (Rolfsen, *Knots and Links*, Chapter 2, Section E,
and Chapter 5 for the linking number).

- Two knots are ambient isotopic iff some diffeotopy of `S³` carries one onto the other as
  parametrized maps up to rotation of the parameter (`TauCeti.SmoothCircleEmbedding.rotate`);
  ambient isotopy of unoriented knots allows `reverse` as well.
- Ambient isotopy is a congruence for connected sum and commutes with mirror and reversal.
- The complement `S³ ∖ K` is a boundaryless `3`-manifold, and ambient isotopic knots have
  homeomorphic complements
  (`TauCeti.SmoothLinkEmbedding.SmoothAmbientIsotopic.nonempty_complementHomeomorph`) and
  diffeomorphic ones: the final diffeomorphism (`TauCeti.Diffeotopy.final`) of a diffeotopy
  carrying one knot to the other maps the compact image of the first onto that of the second,
  so it restricts to a diffeomorphism of the open complements.
- A framed oriented knot is a pair `(K, n)` with `n` the framing coefficient relative to the
  Seifert framing; forgetting the framing and the orientation are the two forgetful maps, and
  reversal does not change the framing coefficient.
- Ambient isotopy preserves the Seifert framing and acts on framing coefficients by the identity.
- The linking number is an invariant of ambient isotopy of the link and changes sign under
  reversal of either component and under mirror; it is symmetric, through 4.3's Seifert-surface
  description.

**Checks.**
- *Trefoil mirror.* The mirror of the right-handed trefoil is the left-handed trefoil, and the
  two are not ambient isotopic: their Jones polynomials `t + t³ − t⁴` and `t⁻¹ + t⁻³ − t⁻⁴`
  differ (Layer 4.5) (by evaluation).
- *Square and granny.* The square knot `T # T̄` and the granny knot `T # T` of the right-handed
  trefoil `T` share the Alexander polynomial `(t − 1 + t⁻¹)²` and have signatures `0` and `−4`
  (Layer 6.2) (by evaluation).
- *Unknot.* `TauCeti.unknot` and any of its rotations are ambient isotopic, and
  `TauCeti.unknot.reverse` is ambient isotopic to `TauCeti.unknot`: the unknot is invertible.
- *Unknot framings.* `TauCeti.unknot`, the great circle `(cos t, sin t, 0, 0)` of the first
  coordinate plane of `ℝ⁴`, bounds the hemisphere disc `{x₃ = 0, x₂ ≥ 0}` of `S³`; its push-off
  `(cos ε cos t, cos ε sin t, 0, sin ε)` along the normal of that disc is a small circle missing
  the disc, with linking number `0`, so it gives the Seifert framing. Every great circle disjoint
  from the unknot forms a Hopf link with it, so the push-off onto a neighbouring Hopf fibre
  `(cos ε · z, sin ε · z)`, `z ∈ Circle`, has linking number `±1`: it is the framing `±1`, not the
  Seifert one (by evaluation).
- *Linking numbers.* The Hopf link has linking number `±1` according to orientation; the
  two-component unlink has linking number `0`; the Whitehead link has linking number `0` and is
  not the unlink (its Jones polynomial differs, 4.5) and is nonsplit (4.3), so the linking number
  detects neither the unlink nor splitness.
- *Immersion.* The map `t ↦ t − sin t` is a smooth homeomorphism of `ℝ/2πℤ` whose derivative
  vanishes at `0`; composing a smooth knot with it gives a smooth topological embedding that is
  not a smooth embedding, so it is not a `SmoothCircleEmbedding`: the carrier requires an
  immersion, which is what makes the normal bundle and the framings exist.

*Needs:* Tau Ceti `TauCeti.SmoothCircleEmbedding`, `TauCeti.SmoothLinkEmbedding`,
`TauCeti.SmoothLinkEmbedding.SmoothAmbientIsotopic`, `TauCeti.Diffeotopy`, `TauCeti.unknot`;
`rotate`, `reverse`, `TauCeti.SmoothCircleEmbedding.greatCircle`,
`TauCeti.UnorientedSmoothCircleEmbedding`, `relabel`, `TauCeti.SmoothLinkEmbedding.singletonEquiv`,
`TauCeti.IsSolidTorusNeighborhood.complementHomologyEquiv` with Tau Ceti's singular homology and
Mayer–Vietoris sequence (AlgebraicTopology Stage 2, singular homology, and Stage 3,
Mayer–Vietoris), for `H₁(S³ ∖ K) ≅ ℤ`; Mathlib `Manifold.IsImmersion`, `Circle`;
Layer 1.5 (the normal bundle and closed tube of a knot);
Layer 3.3 (isotopy extension for the independence of the band).

### 4.2 Diagrams, Reidemeister's theorem, Alexander's and Markov's theorems

A diagram is a `TauCeti.PDCode n` satisfying `TauCeti.PDCode.IsPlanar` with plane realization
data for its rotation system: an outer-face choice when the crossing graph is connected and
nonempty, otherwise region-containment (nesting) data placing every component, crossing-free
circles included, in one plane (native faces describe only the crossing graph). Prove that this
finite data and actual plane embeddings agree up to the stated equivalences. Define the
realization of a diagram as a link in `ℝ³` whose projection is the given four-valent plane graph
with the recorded crossings, and prove that every smooth link in `ℝ³` has a regular projection
after a small rotation, so every link type is realized by a diagram (Lickorish, Chapter 1).
Prove Reidemeister's theorem: two diagrams realize ambient isotopic links iff they are related by
a finite sequence of plane isotopies and Reidemeister moves of types I, II and III (Lickorish,
Chapter 1, pp. 3–4; Burde–Zieschang, *Knots*, Chapter 1). Prove Alexander's theorem, that every
oriented link is the closure `TauCeti.BraidWord.closure` of a braid, and Markov's theorem, that
two braids have ambient isotopic closures iff they are `TauCeti.MarkovEquiv` (Lickorish,
Proposition 16.10; Birman, *Braids, Links and Mapping Class Groups*, Chapter 2).

**Native presentations and moves.** The combinatorial presentations are native: oriented
PD-codes `TauCeti.OrientedPDCode n` (`n` crossings, four half-edges per crossing, crossing-free
circles recorded separately, with `writhe`, `mirror`, `reverse`, `relabel` and `face`), based
oriented Gauss codes `TauCeti.BasedOrientedGaussCode n` with their framed and unoriented variants
`TauCeti.FramedBasedOrientedGaussCode` and `TauCeti.BasedUnorientedGaussCode`, braid words
`TauCeti.BraidWord n` with `TauCeti.BraidWord.toBraid : BraidWord n → BraidGroup n` and the
braid-closure edge `TauCeti.BraidWord.closure w : OrientedPDCode w.length`, and grid diagrams
`TauCeti.GridDiagram n`. So are the moves: Reidemeister equivalence of oriented PD-codes
`TauCeti.OrientedPDCode.ReidemeisterEquiv`, generated by
`TauCeti.OrientedPDCode.IsReidemeisterMove` (relabelling, crossing rotation, the first move
`reidemeisterOne`, the second move `insertClasp` in its three forms, between two arcs, an arc and
a crossing-free circle, or two crossing-free circles, and the third move `reidemeisterThree`),
Markov equivalence `TauCeti.MarkovEquiv` on `TauCeti.MarkovBraid`, generated by
`TauCeti.IsMarkovMove` (conjugation and the two stabilizations), the Artin relations on words
`TauCeti.BraidWord.ArtinEquiv`, whose classes have Reidemeister-equivalent closures
(`TauCeti.BraidWord.reidemeisterEquiv_closure_of_artinEquiv`), and grid moves
`TauCeti.GridDiagram.MovesTo` (cyclic permutation, commutation, stabilization). The native
planarity `TauCeti.PDCode.IsPlanar` says that the surface built from the crossings and arcs
(vertices the crossings, edges the arcs, faces the orbits of the face permutation) has Euler
characteristic `2` on each connected component; prove that a connected code with `n` crossings
is planar iff it has `n + 2` faces, that planarity is preserved by every Reidemeister move and
its inverse, and that it holds for every braid closure. Prove the comparison between Gauss codes
and PD-codes: a based oriented Gauss code determines an oriented PD-code
(`TauCeti.BasedOrientedGaussCode.toOrientedPDCode`) and conversely an oriented PD-code with one
component and at least one crossing determines, with a chosen base half-edge, a based oriented
Gauss code, both compatible with mirror, reversal and writhe. Fix the spanning tree of
presentations: the PD-code is the hub; braid closure, Gauss codes and the realization are its
edges; the grid-diagram edge is CombinatorialHeegaardFloer Lane K's (Cromwell's theorem), which
consumes the hub.

**Markov's theorem in its combinatorial form.** Prove it as stated in `Suggested.lean`
(`markov_theorem`): for words `w : TauCeti.BraidWord (n + 1)` and `v : TauCeti.BraidWord (m + 1)`,
the braids `⟨n, w.toBraid⟩` and `⟨m, v.toBraid⟩` are Markov equivalent if and only if the closures
`w.closure` and `v.closure` are Reidemeister equivalent (Birman, *Braids, Links, and Mapping Class
Groups*, Theorem 2.3; Lickorish, *An Introduction to Knot Theory*, Chapter 16, Proposition 16.10,
p. 187;
Traczyk's combinatorial proof). The forward direction is the chain: conjugation gives
Reidemeister-equivalent closures and each stabilization is a first Reidemeister move; it is
native, `TauCeti.MarkovEquiv.reidemeisterEquiv_closure`. The converse is the content; it follows
from the geometric form above and Reidemeister's theorem, since the diagram of the realized
closed braid is the closure code (bullet below). The strand count `n + 1 ≥ 1` is part of the
statement: on zero strands the closure is the empty link, not the unknot.

**Reidemeister's theorem for generic projections.** Define the **diagram of a smooth link in
`ℝ³`** through a generic projection: a direction `v` is generic for `L` when the projection along
`v` is an immersion of the link with finitely many double points, all transverse, and no other
multiple points. Prove that generic directions are open and dense (Lickorish, Chapter 1, p. 3,
the general-position projection; the transversality theorem of Hirsch, Chapter 3), which gives the small
rotation above, and define the oriented PD-code `D_v(L)` of a generic projection with the
over-strand read from the height along `v`. In this form Reidemeister's theorem reads: for smooth
links `L, L' : SmoothLinkEmbedding (𝓡 3) ℝ³ n` with generic directions `v, v'`, there is a
permutation `σ` of `Fin n` with `L` smoothly ambient isotopic to `L'.relabel σ` if and only if
`D_v(L)` and `D_{v'}(L')` are Reidemeister equivalent (Lickorish, Chapter 1, pp. 3–4;
Burde–Zieschang, Chapter 1). The relabelling is part of the statement: the native
`SmoothAmbientIsotopic` is componentwise (one diffeotopy carries the `i`-th component onto the
`i`-th component), while an oriented PD-code carries no component labels and the relabelling move
permutes its crossings and half-edges freely, so the diagram forgets the labels. The forward
direction is a one-parameter general-position argument along the isotopy, a Cerf-theoretic
statement on the codimension-one degeneracies of projections; the converse realises each move by
an isotopy supported in a ball and then relabels. The realization of a planar PD-code may be
taken to be a polygonal link in `ℝ³`, regular in 4.2.4's sense for the vertical projection (the
inverse edge of the spanning tree); prove that its
projection recovers the code.

- The realization of a Gauss code `TauCeti.BasedOrientedGaussCode.toOrientedPDCode` is the
  realization of its PD code; a Gauss code whose PD code is not planar realizes no link.
- Reidemeister moves preserve the component count and the component orientations; the
  writhe of a diagram changes by `±1` under a type I move and is preserved by II and III.
- The closure of a braid on `k` strands has as many components as the orbits of its
  permutation, `TauCeti.MarkovBraid.componentCount`.
- Each presentation has its forgetful maps: framed to unframed (`FramedMarkovBraid.forgetFraming`,
  `FramedBasedOrientedGaussCode` to its unframed code), oriented to unoriented.
- The writhe of a braid closure is the exponent sum of the word
  (`TauCeti.BraidWord.writhe_closure`).
- Markov-equivalent braids have closures with the same number of components
  (`TauCeti.MarkovEquiv.componentCount_eq`).
- Markov: `MarkovEquiv ⟨n, w.toBraid⟩ ⟨m, v.toBraid⟩ ↔ ReidemeisterEquiv w.closure v.closure`.
- Every planar oriented PD-code is the code of a generic projection of a polygonal link, and every
  smooth link has a generic projection; the diagram of the braid closure of `w` realised as a
  closed braid is `w.closure` up to relabelling.
- Reidemeister: the classes of smooth links in `ℝ³` under ambient isotopy and relabelling biject
  with the Reidemeister classes of planar oriented PD-codes; for knots (`n = 1`) the relabelling
  is trivial and the bijection is with ambient isotopy classes.

**Checks.**
- *Non-planar Gauss word.* The Gauss word `1 2 1 2` has a non-planar PD code, so it is not a
  diagram; the word `1 1 2 2` is planar and realizes the unknot (by evaluation).
- *Two-strand closures.* The closures of `σ₁` and `σ₁²` in `B₂` are the unknot and the Hopf
  link, with `componentCount` equal to `1` and `2` (by evaluation).
- *Realization is not constant.* The standard three-crossing diagram of the trefoil, the
  closure of `σ₁³ ∈ B₂`, realizes a knot with Jones polynomial `t + t³ − t⁴`, so it is not the
  unknot (by evaluation).

The remaining Checks write braid letters as native `BraidWord` letters, zero-based (`σ₀` is the
`σ₁` above).

- *Planarity by faces.* The PD-code of the right-handed trefoil has three crossings and five
  faces, so it is planar; the code with one crossing whose four half-edges are paired `0–2`,
  `1–3` is a virtual crossing with `V − E + F = 1 − 2 + 1 = 0`, not planar, and no diagram
  realises it (by evaluation).
- *Kink and trefoil.* The kink `TauCeti.PDCode.kink` has writhe `±1` and is Reidemeister
  equivalent to the crossing-free circle; the trefoil code is not Reidemeister equivalent to the
  unknot code, since its Jones polynomial is `t + t³ − t⁴ ≠ 1`.
- *Closures and Markov classes.* The braid `σ₀ ∈ B₂` closes to the unknot, `σ₀³` to the
  right-handed trefoil and `σ₀²` to the Hopf link with two components. The trivial braid on two
  strands closes to the two-component unlink, which is not Markov equivalent to the trivial braid
  on one strand (`TauCeti.not_markovEquiv_one_of_ne`).
- *Gauss mirror and reversal.* Mirroring a Gauss code negates every crossing sign and fixes the
  traversal data; reversing the orientation reverses the traversal and fixes the signs; so a code
  with writhe `w` has mirror of writhe `−w` and reverse of writhe `w` (by evaluation).
- *Chiral trefoil braids.* `σ₀³` and `σ₀⁻³` on two strands close to the right- and left-handed
  trefoils, whose Jones polynomials `t + t³ − t⁴` and `t⁻¹ + t⁻³ − t⁻⁴` differ, so the closures are
  not Reidemeister equivalent and the braids are not Markov equivalent, although both closures
  have one component.
- *One stabilization.* `σ₀ ∈ B₂` and `1 ∈ B₁` are Markov equivalent by one stabilization
  (`TauCeti.markovEquiv_sigma_last_one_one`) and their closures are the one-crossing and
  zero-crossing codes of the unknot, Reidemeister equivalent by one first move.
- *Generic directions.* A projection of a knot along a direction tangent to it at a point is not
  generic (the projection is not an immersion there); generic directions are dense, and for the
  round unknot every generic direction gives a code Reidemeister equivalent to the crossing-free
  circle.
- *Virtual code.* The one-crossing non-planar code above is Reidemeister equivalent to no closure
  of a braid, since closures are planar and planarity is preserved by the moves.
- *Relabelling.* The two-component links `L = (U, T)` (component `0` an unknot, component `1` a
  right-handed trefoil, far apart) and `L' = L.relabel (swap)` have the same diagram up to the
  relabelling move, so `D(L)` and `D(L')` are Reidemeister equivalent, but no diffeotopy carries
  `L 0` (unknotted, `Δ = 1`) onto `L' 0 = T` (`Δ = t − 1 + t⁻¹`), so `L` and `L'` are not
  `SmoothAmbientIsotopic`; they are ambient isotopic after the relabelling by the swap, as the
  theorem states. An "if and only if" without the permutation would be false for this pair.

*Needs:* Tau Ceti `TauCeti.PDCode`, `TauCeti.PDCode.IsPlanar`, `TauCeti.OrientedPDCode`,
`TauCeti.BasedOrientedGaussCode.toOrientedPDCode`, `TauCeti.BraidWord.closure`,
`writhe`, `mirror`, `reverse`, `relabel`, `face`, `TauCeti.PDCode.kink`,
`TauCeti.FramedBasedOrientedGaussCode`, `TauCeti.BasedUnorientedGaussCode`, `TauCeti.BraidWord`,
`TauCeti.BraidWord.toBraid`, `TauCeti.GridDiagram`, `TauCeti.OrientedPDCode.IsReidemeisterMove`,
`TauCeti.OrientedPDCode.ReidemeisterEquiv`, `TauCeti.IsMarkovMove`,
`TauCeti.MarkovEquiv.componentCount_eq`, `TauCeti.BraidWord.ArtinEquiv` with
`TauCeti.BraidWord.reidemeisterEquiv_closure_of_artinEquiv`, `TauCeti.BraidWord.writhe_closure`,
`TauCeti.GridDiagram.MovesTo`, `TauCeti.MarkovEquiv.reidemeisterEquiv_closure`,
`TauCeti.not_markovEquiv_one_of_ne`, `TauCeti.markovEquiv_sigma_last_one_one`,
`TauCeti.SmoothLinkEmbedding.relabel`, `SmoothLinkEmbedding.SmoothAmbientIsotopic`,
`TauCeti.MarkovBraid`, `TauCeti.MarkovEquiv`; Layer 1.5 (tubes, for general position);
the native Morse–Sard theorem `TauCeti.addHaar_image_criticalPoints_eq_zero` and the density of
regular values `ContDiff.dense_compl_image_criticalPoints`, applied in charts, for the density of
generic directions (the non-generic directions are images of critical sets of smooth maps between
Euclidean spaces); Mathlib `Manifold.IsImmersion`, `Equiv.Perm`, `PresentedMonoid`; Layer 4.1;
Layer 3.3.

### 4.2.1 Strand permutations and square quotients of braid groups

Braid groups are native `BraidGroup n`, with generators σ_i of infinite order indexed by
`Fin (n−1)`, and `permHom n : BraidGroup n →* Equiv.Perm (Fin n)` with its surjectivity,
generator values and comparison with the strand permutation; permutations multiply from right
to left.

**Generator squares and the pure braid group.** For
`N_gen(n) = normalClosure {σ_i² | i∈Fin(n−1)} ⊆ B_n`, prove
`N_gen(n)=ker(permHom n)=pureSubgroup n` and construct the canonical
`B_n/N_gen(n) ≃* Equiv.Perm (Fin n)` with its generator values and projection square: for every
group `G`, a homomorphism `f : B_n → G` factors uniquely through `permHom` iff `f(σ_i)²=1` for
every `i`, the quotient has `n!` elements, and all of this is compatible with strand inclusion.
Proof: compare with the type-A Coxeter group of the native `CoxeterMatrix.A (n−1)` (trivial
groups at `n=0`) by maps both ways, identified with `permHom` on generators.

**Squares of all elements and exponent parity.** For `N_all(n) = normalClosure {b² | b∈B_n}`,
the native Artin exponent sum `e : B_n → ℤ` and its reduction `ε : B_n → Multiplicative (ZMod 2)`,
prove the generator values of `ε`, compatibility with strand inclusion,
`sign(permHom n b)=(−1)^e(b)` in `ℤˣ`, `N_gen(n)≤N_all(n)=ker ε`, and that `N_all(n)` is the
inverse image under `permHom` of the alternating subgroup, with commuting diagram `B_n→S_n→C₂`.
For `n≥2` construct `B_n/N_all(n) ≃* Multiplicative (ZMod 2)` sending every σ_i to the
nonidentity class, with the universal property for homomorphisms whose whole image satisfies
`x²=1`; for `n=2`, `e` identifies `B₂` with `ℤ` and both subgroups with `2ℤ`. Proof: the quotient
is abelian since squares are trivial in it; the braid relations make all generator classes equal,
and `ε` shows that class is nontrivial.

**Checks.**
- *Strict inclusion.* For `n≥3` and `b=σ₀σ₁` the permutation of `b` is a three-cycle, so
  `b²∈N_all` and `b²∉N_gen`; `B₃/N_gen≃S₃` has order 6, `B₃/N_all≃C₂` order 2 (by evaluation).
- *Two strands.* For `B₂ ≃ ℤ` both normal subgroups are `2ℤ` and both quotients are `C₂`
  (by evaluation).
- *Small n.* `B₀`, `B₁`, `S₀` and `S₁` are trivial with trivial parity maps, so the `C₂`
  comparison needs `n ≥ 2` (by evaluation).

*Needs:* native `BraidGroup`, `sigma`, `permHom`, `pureSubgroup`, `ArtinGroup.exponentSum`,
Coxeter/Artin presentations and finite permutation/sign APIs; `Subgroup.normalClosure`,
`QuotientGroup`, `Multiplicative (ZMod 2)` and group-homomorphism extensionality. For the
standard presentations and strand map, see
[Birman–Brendle, §1](https://www.math.columbia.edu/~jb/Handbook-21.pdf).

### 4.2.2 A signed three-strand braid calculation

This section proves its statements from the constructions it states and cites no outside proof.

Construct the mirror automorphism `M` of the native braid group, sending each generator to its
inverse, with its relation, involution, product, strand-inclusion and exponent-sum laws. On
native `BraidWord n` mirroring negates every crossing sign in place (inversion also reverses the
list); prove its `toBraid` comparison with `M`, and that the realized closure of the mirrored
word is Layer 4.1's fixed geometric mirror of the realized closure, diagram reflection and
component orientations included.

In native `BraidGroup 3` write a=σ₀ and b=σ₁ (the one-based σ₁ and σ₂ of the literature) and

```text
β = b⁻² a⁻³ b⁻¹ a b⁻¹ a⁻²,
γ = b² a³ b² a b⁻¹ a.
```

Prove `Mβ=γ`; hence the closure of `γ` is ambient isotopic to the mirror of the closure of `β`,
both closures are knots (their permutations are three-cycles), and both are chiral. Sketch:
`aba=bab` gives `a⁻¹ba=bab⁻¹`, so `Mβ = b² a³ b a⁻¹ b a² = γ`; on signed words this is one
acyclic-height signed Reidemeister III instance (signs (−,+,+)), certified by the native signed
braid-relation closure theorem and transported through 4.2's realized-diagram comparison with
marked planar codes of both closures. Chirality follows from the Check by 4.5's mirror law; no
knot-table label is identified.

**Checks.**
- *Jones values.* In 4.5's normalization `V(closure γ;t) = t³+t⁶−t⁷+t⁸−t⁹+t¹⁰−t¹¹` and
  `V(closure β;t) = V(closure γ;t⁻¹)`, with different supports (by evaluation).
- *Exponent sums.* The native Artin exponent sums of β, Mβ and γ are −8, 8 and 8 (by
  evaluation).
- *Exponent sums separate.* The word `b⁻² a³ b a⁻¹ b a⁻²`, of exponent sum 0, equals neither Mβ
  nor γ; exponent sums distinguish braids without asserting that their closures differ (by
  evaluation).

#### The Perko pair and its ordinary isotopy

Let A and B be realized planar diagrams of the two duplicated table occurrences of the Perko
pair in Perko,
[*On the classification of knots*, p263](https://doi.org/10.1090/S0002-9939-1974-0353294-X),
with explicit signed-code dictionaries giving them a common handedness (recording any global
reflection of a table occurrence).

- A and B are related by a finite ordinary Reidemeister movie, hence by an orientation-preserving
  ambient isotopy; transporting an orientation of A through the movie, with its component map,
  gives the unoriented and oriented comparisons, compatible with reindexing, simultaneous
  reversal and simultaneous mirroring. Sketch: every intermediate planar code, outer-face/arc
  correspondence and local move disc through 4.2's realized Reidemeister API, or braid closures
  with finite sequences of conjugations and stabilizations; only 4.1–4.2 are used, and matching
  invariants, a reflection or `Mβ=γ` do not supply the movie.
- The knot is chiral: A is not ordinarily isotopic to its mirror. Sketch: after 4.5, the Jones
  polynomials of A and B coincide and differ from their common reciprocal.

**Checks.**
- *Writhes.* The two Perko diagrams have ten crossings each and different writhes, so every
  movie between them contains a type I move (by evaluation).
- *Jones asymmetry.* The common Jones polynomial of A and B is not invariant under `t ↦ t⁻¹`
  (by evaluation).

*Needs:* native `BraidGroup.sigma_braid`, `ArtinGroup.exponentSum`, `BraidWord.toBraid`,
sign-negated words and the native signed braid-relation closure comparison; Layers 4.1–4.2 for
the fixed mirror, realized plane diagrams and finite sequences of relative Reidemeister moves.

### 4.2.3 Finite braid drawings and closure identification

Displayed σ indices are one-based; native `BraidGroup n` and `BraidWord n` use index `i−1` and the
bottom-to-top word order. Braid drawings and closures are compared through 4.2's
realized-diagram and Markov construction, with no second braid or knot carrier.

**Cyclic braid closures.** For `n≥1` and `m∈ℤ`, the closure of `(σ₁⋯σ_(n−1))^m` has exactly
`gcd(n,|m|)` components, the orbits of its native strand permutation, so it is a knot iff that
gcd is `1`; for `m=0` there are `n` components, and for `n=1` one for every `m`. The component
indexing is compared with 4.11's realized torus links, orientations and signed `m` included.

**Checks.**
- *Five-strand unlink.* `w=σ₁σ₂σ₃σ₂⁻¹σ₄σ₁⁻¹` equals `(σ₁σ₂)(σ₃σ₄)(σ₁σ₂)⁻¹` in `B₅`, and two
  positive Markov destabilizations of `σ₃σ₄` reach `B₃`: its closure is the three-component
  unlink (by evaluation).
- *Stevedore handedness.* The closure of `z=(σ₁⁻¹σ₂σ₃⁻¹)²σ₃³` in `B₄` is a knot with Jones
  polynomial `t⁻²−t⁻¹+2−2t+t²−t³+t⁴`, the reciprocal of, and unequal to, that of
  [the Knot Atlas 6₁](https://katlas.org/wiki/6_1) (by evaluation).
- *Torus closures.* `(σ₁⋯σ_(n−1))^m` has `gcd(n, |m|)` closure components: `n = 3, m = 2`
  gives one, the trefoil `T(3, 2)`; `n = 2, m = 2` gives two, the Hopf link; `m = 0` gives `n`
  (by evaluation).

*Needs:* native braid generators, distant/adjacent Artin relations, `BraidWord.toBraid`,
`BraidWord.closure`, `permHom` and component counts; Layer 4.2's realized Markov/Reidemeister
comparison; Layers 4.4–4.5 for normalized polynomials and 4.10.2/4.11 for the stevedore and
torus models, which feed nothing earlier.

### 4.2.4 Polygonal perturbations and regular diagrams

Build the polygonal presentation of tame knots (Burde–Zieschang, *Knots*, Chapter 1), before and
without 4.2's completeness theorems. A polygon `p:Fin n→EuclideanSpace R (Fin 3)`, `n≥3`, is
parametrized on `AddCircle (1:R)`, affinely on `n` equal intervals; prove it is an embedding iff
its vertices are distinct, consecutive edges share just their common endpoint and nonconsecutive
edges are disjoint, with cyclic reindexing, reversal and subdivision maps, and relate
subdivision to erasure of collinear vertices (the minimal-vertex convention) by nondegenerate
triangle moves. No quotient carrier for knot types is introduced.

**A controlled ambient perturbation.** For a complete real normed space `E` and `u:E→E` with
`LipschitzWith c u`, `c<1`, the maps `F_t(x)=x+t u(x)`, `0≤t≤1`, satisfy
`(1−c)‖x−y‖ ≤ ‖F_t(x)−F_t(y)‖ ≤ (1+c)‖x−y‖` and form a `TauCeti.AmbientIsotopy E` (the total
level-preserving map on `I×E` is a homeomorphism) fixing the complement of any compact set
outside which `u` vanishes, with identity, composition, inverse and restriction laws. Sketch:
invert each `F_t` by the Banach fixed-point theorem for `x↦y−t u(x)`; joint continuity of the
inverse follows from the uniform bound `c<1`.

For every embedded polygon `p` there is `δ>0` such that every `q` with all `‖q_i−p_i‖≤δ` is an
embedded polygon equivalent to `p` by finitely many elementary triangle moves and by an ambient
isotopy supported in a cube moving each edge linearly to the edge with vertices `(1−t)p_i+tq_i`.
Sketch: triangulate a cube around `p` with `p` as a subcomplex, by planes through the edges and
at the vertices, with Layer 11's geometric-simplex carriers; hat-function interpolation of the
vertex displacements is `Cδ`-Lipschitz, `C` fixed by the triangulation, so `Cδ<1/2` makes the
controlled perturbation apply; moving one vertex at a time gives the triangle moves.

**Density for the fixed projection.** For `π(x,y,z)=(x,y)`, a polygon is regular when every fibre
of π on it has at most two points and a fibre containing a vertex contains only that vertex;
prove this equivalent to: no vertical edge, distinct projected vertices, no projected
vertex/edge collision beyond the prescribed incidences, and finitely many transverse interior
double crossings with no triple crossing (straight projected vertices and disjoint parallel
projected edges allowed). For every polygon `p` and `ε>0` some regular `q` equivalent to `p`, with
the same ordered vertices, has all `‖q_i−p_i‖<ε`. Sketch: inside the vertex radius avoid finitely
many proper real polynomial zero sets (coincident or collinear projected vertices, parallel
nonadjacent edges, concurrent nonadjacent supporting lines); a nonzero `MvPolynomial` over `R`
has zero set with empty interior.

**Openness at every regular polygon.** For every regular `p` there is `ρ>0` such that every `q`
with all `‖q_i−p_i‖<ρ` is embedded, regular, equivalent to `p` and has the same oriented plane
diagram up to plane isotopy and reindexing, also when `p` has disjoint parallel projected edges
or straight projected vertices. Sketch: positive margins for projected edge lengths, vertex/edge
separations, crossing determinants and parameters and height gaps, combined with the vertex
radius; crossings move continuously by the two-segment intersection equations.

**Identical diagrams and the convex example.** Two regular polygonal knots with combinatorially
equivalent diagrams (crossing data, orientation, rotation and outer face) are equivalent, with
smooth diffeotopies between their corner roundings, without Reidemeister completeness; a convex
planar polygon is equivalent to the triangle. Sketch: a finite PL plane isotopy matching the
realized planar graphs, extended to `3`-space, then linear interpolation of heights, which keeps
each crossing's height difference of one sign, made ambient by the vertex-radius construction;
corners are smoothed in disjoint vertex balls by graphs over an axis on which both edge tangents
are positive, independently of choices by 3.3's smooth isotopy extension. For a convex polygon, cut
ears off a diagonal triangulation.

**Checks.**
- *Contraction constant.* On `ℝ`, `u(x) = −x` is `1`-Lipschitz and `F₁ = 0` is not injective,
  while for `u(x) = −x/2` every `F_t` is a homeomorphism (by evaluation).
- *Tilted square.* The square with vertices `(±1, ±1, 0)` is regular; tilted so that one vertex
  lies vertically above another it is not, though all projected edge pairs stay transverse or
  disjoint (by evaluation).
- *Convex polygon.* A planar convex `n`-gon reaches a triangle after exactly `n − 3`
  triangle moves each removing one vertex; for `n = 3` none is needed (by evaluation).

*Needs:* native affine/convex and finite geometric-simplex APIs, real `MvPolynomial`,
`LipschitzWith`, `ContractingWith.fixedPoint` and `TauCeti.AmbientIsotopy`; the plane
graph/Jordan contracts and 3.3's smooth isotopy extension.

### 4.2.5 Signed Dowker words, planar parity and planar completions

Build the signed Dowker–Thistlethwaite word presentation (Dowker–Thistlethwaite,
*Classification of knot projections*, Topology Appl. 16 (1983)) from Layer 4.2's native Gauss/PD
realizations.

**Planar encounter parity and the signed-word decoder.** For a realized regular one-component
plane diagram with `n` crossings, the two visits to each crossing, numbered `1,…,2n` from a base
point, have opposite parity; on native `BasedOrientedGaussCode n`, with zero-based visits,
`D.toOrientedPDCode.toPDCode.IsPlanar → ∀ i, (D.partner.val i).val % 2 ≠ i.val % 2` (vacuous at
`n=0`, where the circle's outer region is extra data and `PDCode.Face` is empty). Sketch: the even
intersection theorem, owned here, says that two generic closed plane curves, self-intersections
allowed, meet in an even number of points (split their mod 2 cycles into Jordan curves); smoothing
the crossing splits the traversal into two closed curves, and the `b−a−1` visits between its
encounters `a<b` are twice the crossings internal to one arc plus those between the arcs. The
inputs are the planar realization of rotation systems and compact-surface classification.

A signed word `d` of length `n` has absolute entries a permutation of `2,4,…,2n`; crossing `i`
pairs the odd visit `o_i=2i−1` with `e_i=|d_i|`, a positive entry making the even visit over
(these signs are not oriented crossing signs). The decoder enumerates all sign/rotation
assignments in `Fin n→ℤˣ`, read through the native Gauss-to-PD convention, and keeps exactly the
planar completions; prove it sound and complete against extraction from a based oriented plane
diagram with its outer face, with laws for crossing and half-edge relabelling, base point
change, reversal and mirror (the Gauss mirror keeps over bits and negates signs, compared with
PD reflection by a comparison), plane equivalences from marked rotation/face data and sphere
equivalences after forgetting the outer face, by connected permutation-triple rigidity. A word
is a knot traversal (links use a multi-component encoding) and fixes no outer face; parity is
necessary, not sufficient, and planar completions need not be unique up to one global mirror.

**Counting based oriented diagrams by their Dowker data.** For every `n≥1`, the based oriented
`n`-crossing knot diagrams (base arc directed with the knot, canonical odd-encounter labels,
nugatory crossings included), up to orientation-preserving homeomorphism of the projection
surface preserving base and over/under data and with no Reidemeister quotient, number at most
`n!·2^(n+1)` alternating and `n!·4^n` in general on the oriented sphere, and `n+2` times these in
the plane. Pin the sign convention: for crossing `i` with odd visit `a` and even visit `b`, let `ρ_i`
be true for counterclockwise order `(a_in,b_in,a_out,b_out)` and false for
`(a_in,b_out,a_out,b_in)`, and `η_i` true when `a` is over; the native sign is `+1` iff
`ρ_i=η_i`. Sketch: extraction is injective on spherical classes by uniqueness of the realized
rotation system, into `n!·4^n` raw codes (`n!·2^n` shadow codes, two alternating over patterns);
the spherical shadow has `n+2` faces by Euler characteristic, and the plane classes over a
spherical class are face orbits. Forgetting base or orientation, or identifying reflections,
preserves the bounds; at `n=0` the sphere circle is one class giving two oriented plane classes.
The sharper count `n!2^n` belongs to Layer 4.14.

**Elementary plane-diagram operations.** On realized diagrams with nugatory crossings,
disconnected projections and crossing-free circles, using the plane region/nesting data:

- For every nonempty oriented link diagram with `c` crossings and every `r∈ℕ`, `r` supported
  type I moves on a chosen arc give a diagram of the same oriented link with exactly `c+r`
  crossings, with crossing/strand maps and ambient isotopy (crossing-free circles and `r=0`
  included); so every knot has diagrams with more crossings than any prescribed bound.
- Every realized finite plane link projection (nested or disconnected crossing graphs, any
  crossing-free circles, the empty link) has a checkerboard colouring, `0` on the unbounded
  region, colouring a region by the parity of strand crossings of a generic path to the
  unbounded region: path independence follows from the even intersection theorem, colours
  differ across each strand, and the two unnormalized colourings differ by a global flip; give
  the face-adjacency solution, its naturality and change of region on the sphere, for the
  checkerboard dependency vector and Goeritz constructions.
- For a one-component shadow with `n≥1` crossings, odd-visit over bits `η_i` and target initial
  over bit `b`, switching the set `S_b={i | η_i≠b}` (negate overPair there, keeping rotation
  system, matching, nesting and traversal, so each switch negates its sign by `ρ_i=η_i`; with the
  supported spatial crossing change) makes the shadow alternating, for the Fox-rank estimate.
  `S₀` and `S₁` partition the crossings and are the only such sets, so the least number of
  changes for this fixed shadow is `min(|S₀|,|S₁|)≤floor(n/2)`, sharp for every `n≥1` on the
  `n`-kink unknot diagram; they are natural under relabelling, basepoint change and reversal,
  and nothing changes at `n=0`. Multi-component shadows are not covered.

**Recognizing decreasing Reidemeister sites.** For a completed realized plane code with its outer
face, the decreasing RI sites are the cyclically adjacent paired visits whose monogon is an
empty face, and the decreasing RII sites are the pairs of distinct crossings joined by two
crossing-free arcs bounding an empty bigon with one strand over at both, in every oriented
port/sign variant; at each site construct the smaller native code, its reindexing and the local
move movie, and prove soundness and completeness for single decreasing moves with the boundary
collar fixed, with the renumbering law on the shorter word. Plane supports are compact and miss
infinity, sphere supports may be any empty face, and emptiness accounts for nested and
crossing-free components; links use the componentwise encoding, and a bare word is first
completed in every planar way. Absence of sites proves neither minimality nor knottedness
(4.2.6), and crossing-free components survive the last move.

**Checks.**
- *Parity is not planarity.* The word `(4,10,8,2,6)` has opposite parity at every crossing and a
  connected shadow, but its 32 sign assignments have 3 or 5 faces, never the required 7 (by
  evaluation).
- *Sign convention.* With counterclockwise order `(a_in, b_in, a_out, b_out)` and `a` over, `b`
  crosses `a` from right to left and the native sign is `+1`; reading `ρ_i ≠ η_i` as positive
  would negate every writhe (by evaluation).
- *Trefoil change sets.* The trefoil shadow with over bits `(true, true, false)` has
  `|S_true| = 1` and `|S_false| = 2`, attaining `⌊3/2⌋ = 1` (by evaluation).
- *Seven-crossing word.* `(8,10,12,2,14,6,4)` has exactly two planar sign vectors, all `+` and
  all `−`; the all-`+` PD code is [Knot Atlas `7₄`](https://katlas.org/wiki/7_4)'s after an arc
  shift and crossing reordering, with Alexander polynomial `4t+4t⁻¹−7` (by evaluation).
- *Outer faces.* `(10,12,2,14,6,4,8)` has planar sign vectors exactly `±(+,−,+,−,+,−,−)`; poles in
  its degree-2 and degree-5 faces give plane projections with the same word that no plane
  homeomorphism relates (by evaluation).

*Needs:* Layers 4.2 and 4.2.4, native `BasedOrientedGaussCode`, `OrientedPDCode`, `PDCode`,
perfect matchings, permutation-triple faces and `IsPlanar`; Layer 4.2's finite plane
realization, Tau Ceti's Jordan curve theorem (`TauCeti.IsJordanCurve.not_isPreconnected_compl`,
`TauCeti.IsJordanCurve.frontier_connectedComponentIn`); Layer 1.7's compact-surface
classification; Layer 4.4 for the Alexander polynomial in the seven-crossing Check.

### 4.2.6 Bounded Reidemeister moves and the peak crossing number

Build the finite move library for diagrams with boundedly many crossings, the setting of hard
diagrams of the unknot, on 4.2's native oriented PD diagrams with their plane-realization data.
A crossing bound leaves raw PD codes infinite, so the component count `μ≥0` is fixed too (the
empty diagram and all zero-crossing nestings included); labels and orientations are fixed, with
maps forgetting them.

**Plane and sphere carriers.** For each `B, μ`, the diagrams with at most `B` crossings and `μ`
components, modulo relabelling and orientation-preserving isotopy of the plane (fixing the point
at infinity), form a finite set, since crossing slots, matchings, over-pairs, directions and
region-containment records determine a diagram by 4.2's plane-realization comparison; likewise
modulo orientation-preserving isotopy of `S²`, with the map forgetting infinity (which unroots
the placement record). Neither carrier identifies a diagram with its mirror.

**Supported moves.** Every type I, II and III move and its inverse is given by finite local data
(disc, boundary ports, cyclic order, outside matching, over/under heights) with its relative
plane/sphere realization and ambient link isotopy, and every geometrically supported move
arises so; moves preserve labels, directions, crossing-free components and region records, and
change the crossing count by `±1`, `±2` and `0` (a crossing switch is not a move). Reuse the
native curl, clasp and `PDCode.HasReidemeisterThreeTriangle` (acyclic strand heights) in every
rotated chart with empty compact supports; a type II insertion uses `face` and
`isPlanar_insertClasp_iff` within one crossing-graph component, and the region-containment data
across components or onto a placed crossing-free circle. The spherical rules are separate; the
list is complete in all these cases.

**Peak crossing number.** The peak of a finite movie is its maximum crossing count, endpoints
included; the target is the set of all zero-crossing diagrams with `μ` components and allowed
orientations, labels and nestings. The least peak lies in `WithTop ℕ`, is `⊤` exactly when no
movie exists, and for a diagram of the `μ`-component unlink is finite and attained by 4.2's
Reidemeister theorem; the extra-crossing count is peak minus starting count. Prove that a movie
with peak `≤B` exists iff the starting count is `≤B` and the target is reachable by moves among
diagrams with at most `B` crossings, that the spherical least peak is at most the planar one, and
invariance under the carrier equivalences, simultaneous reflection and reversal.

**The local obstruction.** If a positive-crossing diagram admits no decreasing type I/II move and
no type III move, every movie to zero crossings has a first non-isotopy move increasing the
count, so its peak exceeds the starting count; more generally, if no diagram reachable by
count-preserving moves admits a decreasing move, no movie has peak at most the starting count.
This is the elementary form of the hard unknot diagrams of Burton et al., *Hard diagrams of the
unknot*, §§1.1–1.2, whose every simplification must first increase the crossing count.

**Checks.**
- *Two circles.* With `B = 0` and `μ = 2` there are seven oriented plane classes and three
  spherical ones; forgetting orientations, two plane classes (nested, side by side) and one
  spherical class (by evaluation).
- *Least peaks.* The standard trefoil diagram has least peak `⊤` to the one-component
  zero-crossing target; the one-crossing kink has least peak `1`, with extra-crossing count `0`
  (by evaluation).
- *Move counts.* A type I move changes the crossing count by `±1`, type II by `±2` and type III
  by `0`; a crossing switch in the standard trefoil diagram gives a three-crossing diagram of
  the unknot and is not a Reidemeister move, the two Jones polynomials differing (by
  evaluation).

*Needs:* 4.2's finite plane/sphere realization and local ambient-move comparisons; Tau Ceti's
Jordan curve and Schoenflies theorems and 3.3's relative isotopy extension; native PD faces,
crossings, orientations and Reidemeister operations; Mathlib finite types, finite sets,
permutations and `SimpleGraph`; 4.2's global Reidemeister theorem only for attainment. See
Burton, Chang, Löffler, de Mesmay, Maria, Schleimer, Sedgwick and Spreer, *Hard diagrams of the
unknot*, §§1.1–1.2 (arXiv 2104.14076), for the plane/sphere distinction and the least peak.

### 4.2.7 A continuous family of smooth knots with a different limiting knot type

There is a family `f_t : S¹ → ℝ³`, `0≤t≤1/2`, of smooth embeddings with `f₀=e` a smooth unknot
and every `f_t`, `t>0`, the positive trefoil, such that `‖f_t(s)−e(s)‖≤2t` for every parameter;
it is jointly continuous on `S¹×[0,1/2]`, jointly smooth for `t>0` and a continuous path in the
compact-open `C⁰` embedding space, but does not converge in `C¹` and is not continuous in 3.3's
compact-open `C∞` embedding topology. So shrinking a local knot does not pass to the unknot by an
isotopy, and slicewise smoothness with joint `C⁰` continuity does not supply the hypotheses of
3.3's isotopy extension; knot equivalence stays ambient isotopy.

Sketch: `e` has a marked chart `s` with `e(s)=(s,0,0)` near `[-1,1]`, its other arc meeting the
closed unit ball only at the marked endpoints; `a:ℝ→ℝ³` is a smooth proper long embedding equal
to `(u,0,0)` near and outside `|u|=1`, with interior arc in the open unit ball, cut from the
realized `σ₁³` model at a marked arc so that its closure by the exterior unknot arc is the
positive trefoil. For `t>0` replace the marked arc by `t a(s/t)`: the new arc lies in the
radius-`t` ball, which the rest of `e` meets only at its endpoints, `f_t=e` away from `|s|<t`, and
relative dilations identify every closure with the same trefoil. Some interior `u₀` has
`a′(u₀)≠(1,0,0)`, and `∂_s f_t(tu₀)=a′(u₀)` for every `t>0` while `e′=(1,0,0)`, a fixed gap in
3.3's seminorms. See [Bode, *Knotted fields and real algebraic links*, §2.1, Definitions
2.2–2.4](https://research-information.bris.ac.uk/ws/portalfiles/portal/172921010/Final_Copy_2018_09_25_Bode_B_PhD.pdf)
for continuous knot deformations versus smooth isotopy.

**Checks.**
- *Endpoint types.* `f₀` has Jones polynomial `1` and every `f_t` with `t > 0` has `t + t³ − t⁴`
  in 4.5's normalization, so the family is not an isotopy (by evaluation).
- *C⁰ estimate.* For `|s| < t` both `f_t(s)` and `e(s) = (s, 0, 0)` lie in the closed ball of
  radius `t`, so `‖f_t(s) − e(s)‖ ≤ 2t`; outside that chart interval the difference is `0` (by
  evaluation).
- *No C¹ convergence.* By the chain rule `∂_s f_t(t u₀) = a′(u₀)` for every `t > 0`, so the `C¹`
  distance to `e′ = (1, 0, 0)` at the parameter `t u₀` is the fixed positive number
  `‖a′(u₀) − (1, 0, 0)‖` (by evaluation).

*Needs:* 4.1–4.2's smooth/PL knots, marked braid closures and relative arc straightening;
3.1–3.3's mapping-space topologies and seminorms; 1.5's tubular charts and 3.3's smooth-family
isotopy extension; 4.5's native trefoil Jones calculation and geometric comparison.
### 4.2.8 Artin action and relative tangle faithfulness

This section builds, with index comparisons, on native `TauCeti.BraidGroup n`, `sigma`, `strand`,
`strandSucc`, `permHom`, `pureSubgroup` and `BraidWord.toBraid`, Mathlib's `FreeGroup` with its
reduced-word API and `MulAut`, and ReductiveGroups §11A's identification of strand systems with
the native group. The tangle categories and coherence theorems on its carriers belong to the
consumer listed under *Downstream consumers*.

**Artin.P: smooth geometric braids and the imported presentation comparison.** Fix `n` points `P`
on the horizontal diameter of the open disc, position `i` being the `i`-th in increasing first
coordinate (§11A's base configuration gives one). A geometric braid is a disjoint union of `n`
smooth arcs in `int(D²)×[0,1]`, each meeting every level `D²×{t}` once, from `P×{0}` to `P×{1}`,
straight in collars of both faces; an isotopy is a continuous family of geometric braids fixed on
the faces. Prove that isotopy is an equivalence relation agreeing with ambient isotopy of
`D²×[0,1]` fixed on its boundary (relative isotopy extension; Artin, Theorems 1–7 and 12), that
stacking β below γ makes the classes a group (straight braid as identity, height reflection as
inverse), and that the endpoint permutation is a homomorphism to `Equiv.Perm (Fin n)`. In `σ_i` the
strand leaving position `i` passes in front of the one leaving `i+1`; this is pinned so that
`TauCeti.BraidWord.closure` (`TauCeti/KnotTheory/BraidWord/PDCode.lean`), which reads strands
upward and makes the strand entering a positive letter at its lower position the over-strand,
gives `σ_i` a positive crossing. Smooth comparison: every continuous strand system is homotopic rel
endpoints, through strand systems, to a smooth geometric braid, and smooth braids homotopic
through strand systems are smoothly isotopic, by uniform smooth approximation of the lifted path
in the ordered configuration space (4.2.4's polygonal perturbation and Layer 11.2's smoothing, or
a mollification) and the straight-line homotopy, collision-free below half the least distance
between strands (Artin, Theorem 1 and the Lemma on p. 103). With §11A (Birman–Brendle, §1.1) this
is a group isomorphism onto `TauCeti.BraidGroup n` matching the endpoint permutation with
`permHom`, pure braids with `pureSubgroup n` and `σ_i` with `sigma i` (composed with generator
inversion if §11A's half-twist is the mirror of `σ_i`); word realization is its composite with
`BraidWord.toBraid`. Generation (Artin, Theorem 16) and the presentation (Birman–Brendle, §1.2;
Artin 1925; Bohnenblust 1947) are cited, not re-proved.

A projection to the plane of the first disc coordinate and the height is generic when its only
multiple points are finitely many transverse double points at distinct heights outside the
collars; a crossing of the strands at positions `i`, `i+1` reads `σ_i` when the strand leaving
position `i` is in front and `σ_i⁻¹` otherwise. Prove the reading lemma: such a braid is isotopic
to the upward stack of the elementary braids of its crossings, so its crossing word from the
bottom, in the multiplication order of `BraidWord.toBraid` (empty without crossings, as
`BraidWord.toBraid_nil` requires), is a native `TauCeti.BraidWord n` realizing it; and every smooth
geometric braid is isotopic to one with a generic projection. Route: braids with equal
lexicographic height-patterns (first coordinate, ties by the second, which records the front
strand) are joined by a collision-free straight-line homotopy after matching crossing heights
(Artin, the Lemma on p. 103 and Theorem 2, Corollary 1); genericity by 4.2.4's perturbation with
distinct crossing heights among its avoided conditions, then corner rounding. §§4.2.10 and 4.10.5
consume the lemma.

**Artin.A: the algebraic action.** With `F_n=FreeGroup (Fin n)`, `x_j=FreeGroup.of j` and a, b the
indices `strand i`, `strandSucc i` for `i:Fin(n−1)`, the automorphism `A_i` is
`x_a ↦ x_a x_b x_a⁻¹, x_b ↦ x_a, x_j ↦ x_j (j≠a,b)`, with inverse `x_a↦x_b`, `x_b↦x_b⁻¹ x_a x_b`.
Prove the inverse identities and braid relations, obtain `ρ_n:BraidGroup n→*MulAut F_n` by the
native universal property, with formulas for generators, inverses, words, products and stabilization
`F_n→F_(n+1)`; recover `permHom` on the free abelianization; prove that `ρ_n` fixes the boundary
word `∂=x_0⋯x_(n−1)` and permutes the positive meridian classes; include `n = 0`, `n = 1` and the
infinite cyclic `n = 2`.

**Artin.G: marked geometric complements.** For n marked interior points of a disc, construct the
based meridians and the free-group identification of the punctured disc, with the boundary-word
formula, puncture deletion and naturality in orientation-preserving coordinate changes, from the
native fundamental group and `TauCeti.isPushout_fundamentalGroup`. As `FundamentalGroup.mul_def`
makes p*q traverse q first, markings take values in `MulOpposite (FundamentalGroup X p)`. For a
geometric braid β with bottom basepoint and side-wall path to the top, a braid-straightening
homeomorphism (relative isotopy extension) gives `b_β,t_β:F_n≃π₁(complement β)ᵐᵒᵖ`; the pullback
monodromy `b_β⁻¹∘t_β` is independent of the straightening, natural in marked coordinates, equal to
`ρ(β)*ρ(γ)` for β stacked below γ, and its meridian permutation runs top to bottom, inverse to the
endpoint permutation. Calibrate one positive crossing against Artin.A and Artin.P's front/back
convention, then all braid words.

**Artin.F: completeness and faithfulness.** Prove that the based action is a complete invariant of
geometric braid isotopy (Artin, Theorems 8–13), using only Artin.P's carrier: centralizers of free
generators are cyclic; deleting a strand of a pure braid kills its generator; for braids sharing
n−1 strands, equal actions give a relative homotopy of the last strand in their complement, made a
monotone isotopy fixing the other strands and the collars after straightening them; induct on n.
Prove `Function.Injective ρ_n` (Birman–Brendle, §1.2; Artin, the remark after Theorem 16;
Bohnenblust, *The algebraical braid group*, Ann. of Math. 48 (1947), 127–136); by Artin.G's
calibration ρ_n of a word is the pullback monodromy of its realization. Prove the image
characterization: φ is in the image iff `φ(∂)=∂` and φ(x_j) = w_j x_(π j) w_j⁻¹ for a permutation
π, with the image ≃ `BraidGroup n`, its pure restriction and independence of the conjugators
(Artin, Theorems 15–16, by reduced-word cancellation).

**Artin.T: forgetting monotonicity.** A relative tangle in `D²×[0,1]` is a compact properly
embedded smooth 1-manifold meeting the faces exactly in the marked points, straight in their
collars; a relative isotopy is an ambient isotopy fixed on the side wall and both faces. Prove that
geometric braids relatively isotopic as tangles, through tangles that need not be monotone, are
isotopic as braids: the isotopy, extended to fix the whole cylinder boundary, induces a complement
isomorphism (`FundamentalGroup.homeomorphMulEquivOfEq`, with its opposite-group comparison)
respecting the b and t markings, so the pullback monodromies agree and Artin.F applies. The
blackboard framing (along the first disc coordinate) is compatible with braid isotopy, stacking and
juxtaposition, so the same holds for framed and for unoriented relative tangles.

*Needs:* Layers 1.5, 3.3 and 11.2's relative isotopy extension and smoothing; Tau Ceti's
fundamental group and van Kampen theorem; Mathlib `FreeGroup`; 4.2.4's generic projections and
polygonal perturbation; ReductiveGroups §11A's identification, half-twist convention and
plane/disc homeomorphism; no mapping-class theorem for punctured surfaces. 4.12.1's
Brunnian/deletion construction consumes the based markings. Reference: Artin, [*Theory of
braids*](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/artinbraids.pdf), Ann. of Math. 48
(1947), 101–126, Theorems 8–16, transported to the pullback convention above.

**Checks.**

- *Positive closure.* The closure of `σ_0` on two strands is the one-crossing diagram with
  `overPair = true` and writhe `+1` (by evaluation).
- *Boundary word.* `A_0` fixes x_0x_1, while the wrong-side conjugation `x_a ↦ x_a⁻¹ x_b x_a`,
  `x_b ↦ x_a` sends `x_a x_b` to `x_a⁻¹ x_b x_a²` (by evaluation).
- *Reading order.* A three-strand braid with a `σ_0` crossing at height `1/3` and a `σ_1` crossing
  at `2/3` reads `σ_0 σ_1`, whose permutation differs from that of `σ_1 σ_0` (by evaluation).
- *Pure braid.* `σ_0²` has trivial permutation but `ρ_2` sends `x_0 ↦ x_0 x_1 x_0 x_1⁻¹ x_0⁻¹`, so
  it is not the identity as a relative tangle (by evaluation).

### 4.2.9 Figure-eight inversion, reflection and projected transparencies

F is the figure-eight knot, the closure of β = (ab⁻¹)² in native `BraidGroup 3` with a = σ₀,
b = σ₁ and Δ = aba, realized by 4.4.2's four-crossing code and signed braid/arc dictionary and
4.2's closure construction. Its two classical symmetries, amphichirality and invertibility, are
proved here from the constructions below and cite no outside proof: amphichirality by an explicit
braid conjugation (the Conjugation Check), invertibility by a rotation of the trigonometric model of
Hypothesis 4.2.9, a model defined by its formula and not taken from a source, whose four double
points, heights and the rotation identity `R₁K(t) = K(−t)` are finite computations. Neither uses an
invariant or the crossing number.

**Three operations on a diagram.** In projection coordinates (x, y) with crossing height z,
P = (−x,y,z) reflects the projection plane, carrying strands and underpass gaps, M = (x,y,−z)
exchanges over and under, and Q = (−x,y,−z) is the rotation through π about the y-axis, joined to
the identity by rotations. Prove the realized comparisons (over the point at infinity, and with
4.1's reflection of S³), that they are commuting involutions natural under marked diagram
equivalences, that P and M give the oriented mirror and negate every crossing sign and the writhe,
and that Q preserves them. On codes M is `PDCode.mirror` and `OrientedPDCode.mirror`, and P is M
composed with the chart/height turnover reversing each cyclic chart; transport component
directions, outer face and nesting, including crossing-free circles (whose planar-direction
Boolean a chart reversal may flip) and the empty link. Give the comparisons with the native Gauss
mirror, which keeps encounter over bits and negates crossing signs, and to component-orientation
reversal, which keeps the diagram and, reversing all components, every crossing sign. Turning a
transparency over about any line in its plane is P up to planar rotation; rotating a spatial link
with its heights is Q.

**An explicit braid amphichirality.** F is oriented ambient isotopic to its mirror, so (S³, F) has a
self-map reversing the ambient orientation and preserving the knot orientation. With 4.2.2's
generator-inversion mirror automorphism m and its realized closure comparison, the relations ΔaΔ⁻¹=b
and ΔbΔ⁻¹=a follow from aba = bab, and h = aΔ conjugates m(β) to β (Check below); the
closure-conjugation movie for h is an oriented isotopy from mirror(F) to F, composed with the fixed
reflection.

**An explicit inversion.** F is ambient isotopic to its reverse. Assuming Hypothesis 4.2.9, the
rotations through πs about the x-axis form a smooth ambient isotopy with R₁K(t) = K(−t), meeting K
on the axis only at t = 0, π, so reversing it; transfer it to F through the hypothesis's marked
comparison, composed with the amphichirality isotopy in the mirror branch. Export the four oriented
comparisons among F, reverse(F), mirror(F) and reverse(mirror(F)) with their parameter maps.

**Hypothesis 4.2.9 (trigonometric figure-eight).** K(t) = ((2+cos 2t)cos 3t, (2+cos 2t)sin 3t,
sin 4t) on ℝ/2πℤ is a `TauCeti.SmoothCircleEmbedding` in ℝ³ with a generic projection having
exactly the four double points (t_k, t_k + 2π/3), t_k = kπ/2 − π/3, at heights ±√3/2, and its code
is marked-equivalent to 4.4.2's figure-eight code or to its mirror.

With 5.1's tubes and peripheral markings, prove that a pair map of (S³, K) with ambient sign δ and
knot-orientation sign ε sends μ ↦ δεμ and λ ↦ ελ on boundary H₁, with based group maps using one
connecting-path conjugacy for both generators, and composition, inverse and transport laws: the
inversion (+1, −1) gives (−μ, −λ) and the amphichirality (−1, +1) gives (−μ, +λ).

*Needs:* 4.1–4.2's knot carriers, stereographic and realized-code dictionary, marked movies,
closure-conjugation isotopy and mirror comparison; 4.4.2's finite β/Gauss dictionary; Layer 1's circle
smoothness and compact embedding criteria. 5.1 only for the peripheral data, 4.8 only for the
crossing number.

**Checks.**

- *Figure-eight diagram.* 4.4.2's four-crossing figure-eight code is connected, reduced and
  alternating (by evaluation), so 4.8's span theorem gives c(F) = 4.
- *Conjugation identity.* In `BraidGroup 3`, `h m(β) h⁻¹ = β` with `h = aΔ`, m(β) = (a⁻¹b)² (by
  evaluation).
- *Peripheral signs.* For the inversion, `(δ, ε) = (+1, −1)`, the rule gives `(μ, λ) ↦ (−μ, −λ)`;
  the rule `λ ↦ δλ` would give `λ ↦ λ` (by evaluation).

### 4.2.10 Constructive Alexander braiding and the disc-arc route

Two constructive routes to Alexander's theorem, refining 4.2's: the axis route by sliding triangles
(Alexander 1923; [Lambropoulou, §3](https://arxiv.org/html/1811.11701v1#S3)) and the disc-arc route
by simultaneous threading ([Morton, §3, Theorem 1](https://doi.org/10.1017/S0305004100064161),
1986). Each proves that for a finite realized regular oriented plane link diagram, with
crossings, orientations, outer face and nesting, there are a natural number n, a native
`TauCeti.BraidWord n` and an oriented ambient isotopy, transporting the component labels, from the
diagram's link to the word's standard closure; n > 0 for a nonempty link, and the empty link gives
the empty word on zero strands.
Neither uses Markov's theorem, Yamada's braid-index theorem or enumeration of braid words. This
section owns the conversion of a general link to 4.2.8's carrier and the cut/closure comparisons.

**Axis.A: angular preparation and supported replacement.** Choose o off the projected link and
perturb finitely so that no edge lies on a line through o, no crossing or vertex lies on the cut
ray and crossings are regular; put o at 0 ∈ ℂ. A directed edge a→b is good (clockwise) when
`Complex.orientation.areaForm a b`, which is `im(conj(a)*b)` by `Complex.areaForm`, is negative,
and bad when positive; prove this is strict decrease (increase) of a polar-angle lift on the edge.
Subdivide bad edges into crossing-homogeneous pieces (all over or all under); for a bad piece the
apex c = −a − b satisfies `im(conj(a)*c)=im(conj(c)*b)=−im(conj(a)*b)`, 0 being the strict
barycentre. Prove the local lifting lemma: after subdivision and a supported height adjustment,
each bad piece bounds a sliding disc, a height graph over the triangle raised above (lowered below,
for under pieces) the link with tapering near its base, whose interior misses the link; relative
ambient extension gives a supported isotopy fixing the rest of the link. The link may cross the
auxiliary axis meanwhile, since an isotopy in its complement would preserve the winding degree.

**Axis.B: finiteness and extraction.** Batch the moves by original bad edge: cut each parent in
crossing-free intervals into crossing-homogeneous children and move them all, with apexes in
the open half-plane of the parent's line containing o, so no sibling not yet moved gains crossings;
prove by a two-level induction (children within a batch, then parents, whose tags never grow,
although crossings need not decrease) that finitely many moves suffice. Then smooth, keeping strict angular monotonicity, so each component's
angular projection is a covering of the clockwise circle of positive degree; every regular page
meets the link in n points, the sum of the degrees. Cut along a page inside a uniform disc core to
a geometric n-braid, with clockwise angle as 4.2.8's height and transported endpoint order and
crossing signs; after a generic perturbation read its word by 4.2.8's reading lemma (pieces
concatenating by `BraidWord.toBraid_append`) and compare with native `BraidWord.closure`,
crossing-free circles included. Components are the cycles of `permHom`, of length the covering
degrees. Another cut page conjugates the braid; other choices give isotopic closures, whose Markov
comparison consumes 4.2's Markov theorem.

**Disc.A: the region-visiting arc.** Enclose the diagram in a disc and construct a smooth proper
arc between antipodal boundary points, radial near its ends, missing the crossings, transverse to
the edges and entering every complementary region (an embedded polygonal path through one point
per region, then smoothing), for any nonempty link including crossing-free, disconnected and
nested ones; each component meets it a positive even number of times. A plane isotopy fixed near
the boundary straightens it to a diameter. Marking diameter intersections alternately over and
under along each component, every string from one over mark to the next has exactly one under
mark and a projection without self-crossings (by parity), bounding a Jordan cycle with a
complementary face missed by the diameter, also when other components subdivide its interior.

**Disc.B: simultaneous braiding with a separating arc.** Choose start and finish sets S, F
alternating along each component (also for one-kind components and crossing-free circles) such
that S→F overpasses contain no original undercrossing and F→S underpasses no original
overcrossing, and choose Disc.A's arc to separate S from F, as the frontier of a thin relative
neighbourhood of a boundary semicircle with a tree through S and one probe per region avoiding F
and the crossings. Complete the diameter to an unknotted axis and lift the link over it when
leaving the S-side and under when leaving the F-side, an alternating rule keeping the original
crossings and realized by an oriented ambient isotopy once the axis is forgotten. Morton's
simultaneous threading in the axis complement, through a comparison with the separating diameter,
overpass partition and side marks to his threading data (not from simplicity of the strings),
gives a link strictly monotone in the angular coordinate, and Axis.B's extraction finishes with the
closure isotopy and its component-label map.

**Checks.**

Braid letters in these Checks are native `BraidWord` letters, zero-based.

- *Closed braid on its axis.* For the closure of `σ₀³` on two strands with o on the braid axis
  every edge is good and the axis route gives `σ₀³`, whose permutation is the transposition of
  the two strands, with covering degree 2 (by evaluation).
- *Figure-eight on its axis.* The closure of `(σ₀σ₁⁻¹)²` on three strands with `o` on the braid
  axis has every edge good, and the axis route gives it with covering degree `3`, its
  permutation being a three-cycle; the one-based reading `(σ₁σ₂⁻¹)²` of the same symbols in
  native letters needs four strands, fixes the first and closes to two components of covering
  degrees `3` and `1` (by evaluation).
- *Unbounded face.* With `o` in the unbounded face the total winding about `o` is `0`, so bad
  edges exist and triangle moves are necessary.

*Needs:* 4.2 and 4.2.4's finite realized diagrams, polygonal/smooth comparison, supported moves
and smoothing; Layer 1.5's relative isotopy extension; Tau Ceti's Jordan curve and Schoenflies
theorems, Layer 3.3's disc theorem and Layer 11.2.1's isotopy of surface homeomorphisms to
diffeomorphisms; 4.2.8's geometric braids and word comparison, through ReductiveGroups §11A.
Markov's theorem only for the independence of choices.

### 4.3 Seifert surfaces, genus and the Seifert form

For disjoint oriented knots J, K in S³, lk(J, K) is the algebraic intersection of J with a Seifert
surface of K. Prove independence of the surface, isotopy invariance, symmetry, bilinearity on
disjoint integral 1-cycles, and equality with half the signed mixed-crossing count (an integer),
normalized as in the Conventions; reversing one component or reflecting negates it. The framing
coefficient of a framed knot is lk(K, K⁺), compared with the normal trivialization; the Seifert
longitude has coefficient 0. In any generic projection the signed count of the crossings with J
over K alone equals lk(J, K), the over/under difference being the vanishing intersection of the
projected 1-cycles.
This lk(J, K) is 4.1's homological linking number: intersection with a Seifert surface of K is a
homomorphism `H₁(S³ ∖ K; ℤ) → ℤ` with value 1 on the positive meridian, so it is 4.1's
isomorphism `H₁(S³ ∖ K; ℤ) ≅ ℤ`.

**The unframed linking matrix.** For an oriented μ-component link, A_L : `Matrix (Fin μ) (Fin μ) ℤ`
has zero diagonal and off-diagonal entries lk(Lᵢ, Lⱼ). Prove symmetry; ordered sublinks give
`Matrix.submatrix`; reindexing acts simultaneously on rows and columns; reorientation by signs oᵢ
gives D A_L D, `D = Matrix.diagonal (fun i => (o i : ℤ))`; reflection gives −A_L; these actions
commute, up to transporting the sign vector along a reindexing, with identity, composition and
naturality laws, and the multiset of absolute off-diagonal entries is an invariant of the unordered
unoriented link. A splitting sphere separating component blocks I, J forces lk(Lᵢ, Lⱼ) = 0 across
it, a split union has block diagonal matrix, and for μ ≥ 2 the `SimpleGraph (Fin μ)` of nonzero
entries is connected only if the link is nonsplit. The converse fails: the Whitehead link is
nonsplit by 4.11's Fox 3-colouring, the Borromean link by 4.12.1's three-component
Brunnian construction (a split would partition it into proper sublinks, each an unlink, making it an
unlink), and both have zero matrix (Check below).

Prove that every nonempty oriented link `L ⊂ S³` bounds a compact connected oriented Seifert
surface: Seifert's algorithm, then interior tubes (Lickorish, Theorem 2.2). The raw surface of a
diagram with n crossings and s Seifert circles has Euler characteristic `s − n`; for a knot it is
connected of genus `(n − s + 1)/2`, so `2 g(K) ≤ c(K) − 1` for a nontrivial knot. A connected
Seifert surface of a μ-component link has `rank H₁(F) = 2g + μ − 1`. The genus `g(L)` is the least
genus (Layer 1.7) of a Seifert surface; prove `g(K) = 0` iff K is the unknot and
`g(K # J) = g(K) + g(J)` (Lickorish, Theorem 2.4, cutting a minimal surface along a decomposing
sphere; full proof in 4.3.4), so every knot is a finite connected sum of primes; allowing
disconnected spanning surfaces, with summed genera, gives the same minimum by 4.3.2's interior
tubing. The Seifert form is `θ(x, y) = lk(x, y⁺)` on `H₁(F; ℤ)` with the push-off of the
Conventions; prove its identity `θ(y, x) − θ(x, y) = x · y`, so `Vᵀ − V` is unimodular for a knot,
and that Seifert matrices of isotopic links are
`TauCeti.KnotTheory.IntegralSquareMatrix.SEquivalent` (Lickorish, Chapter 8, by tubing and band
moves).

**Checks.**

- *Linking matrices.* The positive closures of `σ_0²` and `σ₀⁴` have off-diagonal entries 1 and
  2; the standard Whitehead link and Borromean rings have zero linking matrices (by evaluation).
- *Push-off sign.* The positive Hopf link bounds an annulus with Seifert form `[−1]`, the diagonal
  entry of the trefoil matrix of the Conventions (by evaluation).
- *Seifert's algorithm.* On the standard trefoil diagram it gives `s = 2`, `n = 3`, genus `1` and
  the Seifert matrix `[[−1, 1], [0, −1]]` in a suitable basis, with `Vᵀ − V = [[0, −1], [1, 0]]` of
  determinant `1` (by evaluation).

#### Basis, orientation and boundary sums

For a compact connected oriented surface F with nonempty boundary and cycle orientations chosen
independently of F's, the push-offs give integral forms θ⁺(x,y) = lk(x,y⁺) and
θ⁻(x,y) = θ⁺(y,x) on H₁(F;ℤ), and `θ⁺(y,x)−θ⁺(x,y)=x·y` with x·y the ordered-tangent
intersection, proved by summing local signs in an oriented chart through the linking/crossing
comparison; the intersection matrix J = Vᵀ − V may be degenerate or of odd size for links. A
unimodular basis change P (columns the new basis) gives PᵀVP, with its composition laws, which is
native `IntegralSquareMatrix.IsMove.congr` with Q = Pᵀ. Keeping the cycles, reversing the
orientation of F (and of every boundary component) gives `Vᵀ` and negates the intersection form,
reflection r with transported orientation and normal −rν (the mirror) gives −Vᵀ, and both together
give −V, with involution, commutation and naturality laws.

For connected oriented F, G in disjoint balls, the boundary connected sum along a product band
(4.1/4.3.4) satisfies H₁(F#∂G;ℤ) ≃ H₁(F;ℤ) ⊕ H₁(G;ℤ), `χ(F#∂G)=χ(F)+χ(G)−1`, μ_F + μ_G − 1
boundary components and additive genus, and in the concatenated basis has matrix
`Matrix.fromBlocks V 0 0 W`, the mixed pairings vanishing by the split-ball linking theorem; include
the reindexings, disc cases and associativity, exchange, mirror and reversal transports. For every
n ≥ 1, 4.4.7's positive two-disc/n-band model has in its consecutive-band basis the rank-(n−1)
matrix with diagonal −1, superdiagonal 1 and zeros elsewhere; its boundary is a knot for odd n and
a two-component link for even n, and its n = 0 and mirror branches are 4.4.7's. Inputs: 4.3's
push-offs, 4.3.2's band/spine prefix and 4.3.4's boundary gluing, none using polynomial,
genus-minimum or signature results.

**Checks.**

- *Reflection.* The trefoil surface's `V₊ = [[−1, 1], [0, −1]]` reflects to
  `−V₊ᵀ = [[1, 0], [−1, 1]]`, and both have `det(Vᵀ − V) = 1` (by evaluation).
- *Unimodularity.* Basis change by `P = diag(2, 1)` gives `PᵀV₊P = [[−4, 2], [0, −1]]`, whose
  Vᵀ − V has determinant 4 (by evaluation).

*Needs:* Layer 1.7 (surfaces and genus), Layer 1.5; Tau Ceti
`TauCeti.KnotTheory.IntegralSquareMatrix.SEquivalent`; Mathlib singular homology.

### 4.3.1 Quadratic refinements and proper links

**Finite quadratic Arf algebra.** For native `QuadraticForm (ZMod 2) V` on a finite-dimensional
F₂-space with `q.polarBilin.Nondegenerate`, independently of Seifert surfaces: `q.polarBilin` is
alternating by `QuadraticMap.polar_self` and Matrix.J's −1 is +1, so Tau Ceti's
`LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J` and `LinearMap.BilinForm.IsAlt.even_finrank`
(`TauCeti.LinearAlgebra.BilinearForm.SymplecticBasis`) give a `Module.Basis (Fin m ⊕ Fin m)`,
converted to a quadratic symplectic basis (aᵢ, bᵢ), polar(aᵢ, bⱼ) = δᵢⱼ with same-half pairings
zero, and dim V = 2m, m = 0 included. Define Arf(q) = Σ q(aᵢ)q(bᵢ) and prove independence of the
basis, isometry invariance, additivity on orthogonal sums, the hyperbolic/anisotropic plane
decomposition (two anisotropic planes are two hyperbolic ones), classification by dimension and Arf,
the Gauss sum `sum_v (-1)^(q v)=(-1)^Arf * 2^m` over any `Fintype V` with the zero count
`2^(2*m-1)+(-1)^Arf * 2^(m-1)` for m ≥ 1 (1 for m = 0) in ℤ, and that Arf(q) = 0 iff some U with
q|U=0 is its own `q.polarBilin`-orthogonal, equivalently has finrank U = m. Route: Pyronneau, §2.1,
Lemmas 2.11–2.13, Corollary 2.14 and Theorem 2.15, pp. 4–5: sum the signs on one plane and multiply
over orthogonal sums; a half-dimensional q-zero subspace extends to a hyperbolic basis.

**Checks.**

- *Planes.* On F₂², q(x,y) = xy has Arf 0 and Gauss sum 2, and q(x,y) = x²+xy+y² has Arf 1,
  Gauss sum −2 and no nonzero zero (by evaluation).
- *Orthogonal sum.* The sum of two anisotropic planes on F₂⁴ has Arf `1 + 1 = 0`, Gauss sum
  `(−2)(−2) = 4 = 2²` and `1·1 + 3·3 = 10` zeros, which is `2³ + 2¹` and also the zero count
  `3·3 + 1·1` of two hyperbolic planes; the product `Π q(aᵢ)q(bᵢ)` in place of the sum would
  give 1 here (by evaluation).
- *Basis change.* On q(x,y) = xy the symplectic basis a = (1,1), b = (0,1) (polar value 1) has
  q(a) = 1, q(b) = 0 and again Arf 0, whereas `Σ q(aᵢ)` moves from 0 on the standard basis to
  1: only the sum of products is basis-independent (by evaluation).
- *Zero space.* For V = 0 (m = 0) the Arf invariant is the empty sum 0, the Gauss sum is
  `1 = 2⁰` and the only zero is 0; read with natural-number subtraction, the m ≥ 1 zero count
  would give `2⁰ + 2⁰ = 2`, which is why m = 0 is stated separately (by evaluation).

*Needs:* Mathlib `QuadraticForm`, `Submodule`, finite sums and finrank; Tau Ceti
`LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J`.

**Seifert refinements and proper links.**

For a nonempty oriented μ-component link with a compact connected oriented Seifert surface F of
genus g, `q_F(x)=lk(x,x⁺) mod2` on `H₁(F;𝔽₂)` is native
`(S.map (Int.castRingHom (ZMod 2))).toQuadraticForm'` of the unsymmetrized Seifert matrix S, so
`q_F(x)=xᵀ(S mod2)x` with polar matrix `(S+Sᵀ) mod2`; prove equality with push-off linking, the
coefficient change from integral to singular 𝔽₂-homology, and basis, isotopy and stabilization
transport. On a simple band-core curve q_F is the parity of the ribbon framing's full twists
relative to the Seifert framing, independently of the ribbon chart and the representative.

With `R=q_F.polarBilin.ker`, prove `dim H₁=2g+μ−1`, `dim R=μ−1`, that R is generated by the boundary
classes subject only to `Σ_j[L_j]=0`, and `q_F([L_j])=Σ_(k≠j) lk(L_j,L_k) mod2`. The link is proper
when every total linking number Σ_(k≠j) lk(L_j, L_k) is even, equivalently q_F vanishes on R (R is
not `q_F.radical`). Then `R≤q_F.radical`, and q_F descends by `QuadraticMap.lift` to `H₁/R` with
nonsingular polar form of dimension 2g (quadratic `Nondegenerate` does not suffice in characteristic
two). Its Arf invariant is the proper-link Arf invariant, the knot Arf invariant for μ = 1; improper
links get none. Prove independence of surface, basis and labelling by common stabilization and
native `SEquivalent` moves, additivity under component-chosen connected sum, invariance under
oriented band fusion of proper links, mirror and global reversal, the determinant–Arf criterion for
knots, and that Alexander polynomial one implies Arf zero, all without Jones-polynomial or bordism
input.

**Checks for the geometric dictionary.**

- *Trefoil.* The trefoil Seifert matrix gives q(x,y) = x²+xy+y² and Arf 1 (by evaluation).
- *Hopf.* The positive Hopf annulus `[−1]` has q(core) = 1 on its polar radical, so the link is
  improper (by evaluation).
- *Proper link and orientation.* The closure `L_4` of `σ₁⁴` (4.4.7, linking number 2) with
  4.4.7's positive two-disc four-band surface in its consecutive-band basis (4.3) has
  `V = [[−1,1,0],[0,−1,1],[0,0,−1]]`, so
  `dim H₁ = 3 = 2·1 + 2 − 1`, `q = x₁+x₂+x₃+x₁x₂+x₂x₃` and polar matrix
  `[[0,1,0],[1,0,1],[0,1,0]]` with radical spanned by `e₁+e₃`, where `q(e₁+e₃) = 0`: the link is
  proper. The quotient has `q(e₁) = q(e₂) = 1` with polar value 1, so Arf 1, and the Gauss sum
  over all eight classes is `2 − 6 = −4 = −2^(g+μ−1)`. Reversing one component gives the
  annulus `[2]`, `q ≡ 0` on a one-dimensional radical and Arf 0, so the proper-link Arf
  invariant depends on the orientation, by `ℓ/2 = 1` as 4.5.3's reversal law says (by
  evaluation).

*Needs:* Layer 4.3 Seifert surfaces and geometric common stabilizations; the finite algebra above;
native integral S-equivalence, `Matrix.toQuadraticForm'`, `QuadraticMap.polarBilin`, `.radical` and
`.lift`; Mathlib coefficient change and singular homology.
### 4.3.2 Finite disc-band surfaces and canonical Seifert surfaces

This section proves its statements from the constructions it states and cites no outside proof.

A finite embedded disc-band presentation has d disjoint discs, b rectangular bands with two
distinct attaching-interval occurrences each (also when both ends meet one disc), cyclic
interval orders on the discs, side-pairing signs relative to chosen local disc orientations,
and the projection, height and twist data of an embedding in oriented three-space; parallel
and loop bands are allowed. Construct its collared surface with corners, the smoothing and
the embedded boundary link, independent of the collar smoothing, on Layer 1.7's
classification and Layer 4.2's realized diagram conventions; the embedding data are
transported with the surface.

**Finite boundary and orientation API.** With native finite types and `Equiv.Perm`, take ports
`P=Fin b × Bool`, corners `C=P × Bool` (the last bit marks the start 0 or end 1 of an
attaching interval along the positive disc boundary), σ the port permutation cycling the
incident ports of each used disc, τ the exchange of band ends, ε_e the side-pairing bit, and
the fixed-point-free involutions `D(p,1)=(σp,0)`, `D(p,0)=(σ⁻¹p,1)`,
`M(p,s)=(τp, s xor (not ε_e))`; so ε=0 joins opposite corner bits and ε=1 equal ones. The
boundary components are the classes of the join of the two matchings plus one per isolated
disc: prove the geometric comparison and `r=orbitCount(M*D)/2+isolatedDiscs` (evenness
first) through the generic identity
`Nat.card(Quotient(SameCycle M ⊔ SameCycle D))=orbitCount(M*D)/2`, built here and shared with
the later PD state-circle construction. The incidence multigraph
is a native `Graph` on all discs and bands whose components (equivalence closure of `IsLink`,
compared with `Graph.toSimpleGraph`, isolated vertices kept) are those of the surface; a
spanning tree from `SimpleGraph.Connected.exists_isTree_le` lifts to d−1 actual bands. The
surface is orientable iff `ε_e=o(v₀(e))+o(v₁(e))` for some o from discs to `ZMod 2` and every
edge, loops included (ε in the range of the incidence coboundary), iff ε vanishes on closed
walks; prove naturality and invariance under changing a local disc orientation, which
reverses its interval order, changes incident signs and relabels corners. On a connected
orientable surface the two solutions differ by global reversal.

**Euler characteristic and one-disc models.** A deformation retraction onto the embedded
incidence spine gives `χ=d−b`, integral first homology free of rank `b+1−d` and vanishing
higher homology; every component has boundary, and a connected surface with r boundary
components has `2g+d+r=b+2` if
orientable of genus g and `k+d+r=b+2` if nonorientable of crosscap number k. For a connected
incidence graph, repartition the surface along the disc formed by the discs and bands of a
spanning tree (the `b′` remaining bands, `b′+d=b+1`, in induced cyclic order) and construct an
ambient isotopy supported in a ball straightening it to the standard disc and transporting
bands, twist data, boundary marks and boundary knot. Every compact connected surface with
nonempty boundary has such a one-disc model, by Layer 1.7's classification and smooth/PL
comparison, with `2g+r−1` or `k+r−1` bands; two one-disc band surfaces are homeomorphic as
abstract surfaces iff their band counts, boundary counts and orientability agree. Noncompact
surfaces such as `S¹×[0,∞)` are outside this theorem; closed surfaces use Layer 1.7's models.

**Disconnected inputs.** For c components a spanning forest gives c discs and `b′+d=b+c`. The
one-disc normal form needs connectedness: two disjoint discs are not isotopic to a connected
one-disc band surface.

**Raw Seifert surfaces and genus minima.** For a nonempty oriented link diagram with n
crossings, s Seifert circles and μ components, the raw canonical surface has s discs and n
bands; with c components, each with boundary, of total genus G, prove `2G+s+μ=n+2c` and
`χ_raw=s−n`. Join the components by c−1 disjoint oriented interior tubes preserving the
boundary link, giving a connected surface of genus G with `χ_connected=s−n−2(c−1)`; route each
tube arc from a transverse polygonal path by sliding its intersections along surface arcs to
free boundary intervals and detouring around their collars, with prescribed endpoint normal
sides and general position against earlier arcs. For a knot `2g(S_D)+s=n+1`. Define the
canonical genus `g_can(K)`, the least genus of a Seifert-algorithm surface of a diagram of K,
and prove attainment, isotopy invariance and `g(K)≤g_can(K)` for 4.3's ordinary genus; one
canonical surface need not realize either minimum.

**Checks.**

- *Side-pairing sign.* One disc with one band is an annulus (r=2) at ε=0 and a Möbius band
  (r=1, k=1) at ε=1; two discs joined by one band give a disc for either sign (by evaluation).
- *Port order.* Two untwisted bands on one disc in cyclic port order e₀,f₀,e₁,f₁ give r=1,
  g=1; in order e₀,e₁,f₀,f₁ they give r=3, g=0 (by evaluation).
- *Tubing.* The crossing-free two-component unlink gives two raw discs, `c = 2` and `G = 0`; one
  interior tube gives a connected annulus spanning the unlink, of Euler characteristic `0`
  against the raw surface's `2` (by evaluation).

*Needs:* Layer 1.5 (collars and tubes), Layers 1.7 and 11.2.1 (classification and smooth/PL
comparison), Layer 3.3 (supported isotopy extension), Layer 4.2 (realized diagrams and local
Reidemeister moves), Layer 4.3's Seifert and linking carriers; 4.3.4's ordinary genus only
for `g(K)≤g_can(K)`, the realization and routing prefix preceding 4.3.4; native `Graph`,
`Equiv.Perm`, finite matching/orbit quotients and `ZMod 2` linear maps. The
finite-presentation, embedded-spine and relative straightening comparisons are built here.

### 4.3.3 Different spanning surfaces with the same boundary

This section proves its statements from the constructions and named hypotheses it states and
cites no outside proof.

**Hypothesis 4.3.3 (Möbius strip spanning the trefoil).** For `R>ε>0` the map
`((R+t cos(3s/2)) cos s, (R+t cos(3s/2)) sin s, −t sin(3s/2))` on `[0,2π]×[−ε,ε]` descends to
a smooth embedding of the quotient by `(0,t)∼(2π,−t)`, one disc with one three-half-twisted
band, whose boundary, traversed for s from 0 to 4π, is the marked `T(2,3)` model of 4.11 and
the realized closure of `σ₁³`, with the orientation and mirror convention of that comparison.

The trefoil bounds non-homeomorphic spanning surfaces: assuming Hypothesis 4.3.3, the strip
and the canonical Seifert surface of the closure of `σ₁³` (two discs, three bands, 4.3.2),
identified along their boundary by a marked ambient comparison, are not homeomorphic, since
the first is nonorientable with χ=0 and crosscap number 1 (4.3.2's nonorientable count, with
1.7.1's ambient models) and the second orientable with χ=−1 and genus 1; so they are not
ambient isotopic relative to the boundary.

**Checks.**

- *Euler counts.* The strip has χ=0, one boundary component and crosscap number `2−0−1=1`;
  the canonical surface has χ=2−3=−1, one boundary component and genus 1 (by evaluation).
- *Handedness of the strip.* For the strip map of Hypothesis 4.3.3 the projected boundary has
  three double points, at `s = π/3, π, 5π/3` and `s + 2π`; at `s = π/3` the over strand has
  tangent `1.5ε e_r + R e_θ` and the under strand `−1.5ε e_r + R e_θ`, so the crossing sign is that
  of `3εR > 0`, and all three crossings are positive: the right-handed trefoil. With third
  coordinate `+t sin(3s/2)` all three would be negative, the left-handed trefoil (by
  evaluation).
- *One half-twist.* With `3s/2` replaced by `s/2` the strip is a Möbius band with one half-twist,
  whose boundary winds once meridionally around the core, an unknot (by evaluation).

*Needs:* 1.7–1.7.1, 4.2, 4.3, 4.3.2 and the marked torus-knot construction of 4.11.

### 4.3.4 Surface compression and ordinary genus additivity

Ordinary genus is the attained minimum over all connected compact oriented embedded spanning
surfaces, distinct from 4.3.2's canonical genus; nothing here assumes surfaces canonical or
canonical genus additive. The route is Lickorish, Theorem 2.4 and its proof (innermost-circle
surgery), with compression from Lickorish, Chapter 2, and Hatcher, *Notes on Basic 3-Manifold
Topology*, §1.1. Surfaces exist by 4.3.2's disc-band, raw-surface and routing prefix, which
needs no minimum genus; 4.3.2's genus-minimum comparisons consume this section.

1. **Actual compression.** For F a compact connected orientable surface embedded in `S³` (or
   a marked ball in `ℝ³`) and D an embedded disc with `∂D⊂int F`, `int D∩F=∅` and relative
   collar/normal data, prove the collar-straightening theorem giving a product `D²×[−ε,ε]`
   meeting F exactly in its rim annulus, framing included; replace the annulus by the caps
   `D²×{−ε,ε}` and round corners, proving embeddedness, orientation compatibility and
   independence of choices relative to the unchanged boundary. Prove `χ(F_D)=χ(F)+2` and
   persistence of all boundary circles and markings, by the collar-compatible gluing identity
   `χ(A∪_C B)=χ(A)+χ(B)` along a finite disjoint union of circles C, owned here and distinct
   from 1.7.1's boundary-interval formula. The result is connected iff the attaching curve is
   nonseparating, with `g(F)=g(F_D)+1`; otherwise its two components have `b₁+b₂=b(F)` and
   `g(F)=g(F₁)+g(F₂)`, and an inessential curve splits off a sphere.

2. **Minimum knot surfaces and the unknot.** Ordinary genus is attained (constructed Seifert
   surfaces, well-ordering of ℕ) and invariant under reparametrization and ambient isotopy. A
   knot has genus 0 iff it is the unknot: shrink the boundary of a spanning disc through
   positive-radius concentric circles in a smooth disc chart and apply supported isotopy
   extension. A minimum-genus knot surface has no compressing disc with essential boundary,
   since a nonseparating compression lowers the genus and a separating one splits off a closed
   component of positive genus (compact-surface classification), whose removal lowers it.
   This disc-incompressibility is not the π₁-injectivity of native `TauCeti.IsIncompressible`;
   after 8.1's loop theorem build that comparison for the surface trimmed of its collar, properly
   embedded in the knot exterior.

3. **The lower bound at a decomposing sphere.** For oriented knots `K=K₁#K₂`, boundary
   connected sum of minimum surfaces (1.7.1) gives `g(K)≤g(K₁)+g(K₂)`. Conversely, among
   minimum surfaces F transverse to the decomposing sphere S with fixed boundary, minimize the
   circles of `F∩S` (one arc α plus circles): a circle innermost on S off α bounds a disc
   missing K and F, is inessential in F by item 2, and replacing its disc in F by a parallel copy
   of the sphere disc keeps boundary and genus and lowers the count. When `F∩S=α`, cutting
   along S gives connected spanning surfaces of the capped factors, and boundary-interval
   genus additivity gives the reverse inequality.

4. **Selected-component link sums.** For nonempty oriented links L, J construct `L#_{i,j}J`
   from one selected oriented component of each, marked trivial-arc balls and
   orientation-compatible collars, extending 4.1's sum; prove independence of arcs and balls,
   associativity, exchange and the unknot identity by supported isotopy, without genus or
   prime uniqueness, then `μ(L#_{i,j}J)=μ(L)+μ(J)−1` and `g(L#_{i,j}J)=g(L)+g(J)` for the
   connected spanning-surface genus. Minimum connected link surfaces may compress, so the
   lower bound uses a relative surgery/reconnection lemma owned here: remove innermost
   circles by compression or disc replacement, keeping every boundary-bearing component and
   discarding closed ones (the genus sum does not increase), then reconnect the
   boundary-bearing pieces on each side of S by thin oriented tubes routed as in 4.3.2,
   relative to S and earlier tubes, creating no new circles.

Hence `β(L)=2g(L)+μ(L)−1` is additive under selected-component sum, zero exactly for the
unknot and positive for every other nonempty oriented link; a nontrivial knot has g≥1 and a
nontrivial factorization lowers the genus of each factor. Export the finite-sum genus
formulas, the impossibility of `K#J=unknot` for nontrivial K, and primeness of genus-one
knots: the existence part of 4.9, whose uniqueness needs the sphere-system argument there.

**Checks.**

- *Unlink annulus.* The annulus spanning the two-component unlink has g=0, β=1 and compresses
  along its core to two discs, so a minimum connected link surface need not be incompressible
  (by evaluation).
- *Additivity realized.* `g(T # T) = 1 + 1 = 2` for two trefoils: the boundary connected sum of
  two genus-one surfaces has `χ = −1 − 1 − 1 = −3`, one boundary component and genus `2` (by
  evaluation).
- *Compressions.* Compressing a once-punctured torus along a nonseparating curve gives a disc,
  `χ` rising from `−1` to `1`; compressing an annulus along its core gives two discs, `χ` from `0`
  to `2` (by evaluation).

*Needs:* 1.1–1.5, 1.7–1.7.1 (compact-surface classification), 2.2–2.3, 3.3 (supported
isotopy extension), 4.1; 4.3's Seifert and linking carriers and 4.3.2's disc-band,
raw-surface and routing prefix; 11.2's relative PL/smooth comparison; 8.1 only for the
π₁-injectivity comparison.

### 4.3.5 Seifert matrices directly from signed braid words

For every native BraidWord n with n≥1, construct the oriented canonical surface of its closure
on 4.3.2's band carrier (n discs, unused strands included, one band per letter) with the
marked identification of its boundary with 4.2's realized closure, and prove
`rank H₁+n=length(w)+c` for c the number of components of the incidence graph (surface
components, not boundary components). For a position i whose column recurs let h(i) be the next
occurrence; the curves through the bands at i and h(i) and the intervening disc arcs, ordered
by i, form a ℤ-basis of H₁,
by a triangular unimodular comparison with the fundamental cycles of the first-band spanning
forest of the incidence spine; export relabelling and basis-order transports.

In this basis compute 4.3's form θ(x,y)=lk(x,y⁺), translating the convention of [Collins, *An
algorithm for computing the Seifert matrix of a link from a braid representation*, §§2–3,
corrected 2013](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/collinsseifert.pdf) to the
native upward braid with zero-based columns and right-handed positive letters, proving the
local crossing/slot and curve-orientation dictionaries. For pairs
(i,h(i)), (j,h(j)) with i<j:

- a diagonal entry is −1 for two positive endpoint letters, +1 for two negative, 0 for mixed;
- nested intervals h(j)<h(i) and disjoint intervals h(i)<j give both off-diagonal entries 0;
- if h(i)=j, a positive shared crossing gives (V_ij,V_ji)=(0,1) and a negative one (−1,0);
- if i<j<h(i)<h(j), `abs(column(i)−column(j))>1` (in ℤ, Collins's step 4) gives 0, 0;
  column(i)+1=column(j) gives (1,0) and column(j)+1=column(i) gives (0,−1).

These cases are exhaustive, since h is the next occurrence; prove each by a supported push-off
and signed mixed-crossing count, so the matrix is determined by the surface. A disconnected raw
surface is compared with the form after 4.3.2's joining tubes before a connected-surface
Alexander formula applies; signature comparisons are 6.2's.

**Checks.**

- *Trefoil word.* The positive two-strand word of length three has matrix `[−1,0;1,−1]` in this
  cycle order; reversing the basis order gives the native trefoil matrix `[−1,1;0,−1]` (by
  evaluation).
- *Empty word.* The empty `n`-strand word gives `n` discs and a zero-dimensional matrix (by
  evaluation).
- *One crossing.* A one-crossing two-strand word gives a disc and no cycles, so an empty
  matrix (by evaluation).

*Needs:* 4.2's native words, closures and realization; 4.3's linking and push-offs; 4.3.2's
band surfaces, spines, Euler identities and integral homology; native BraidWord, Matrix,
IntegralSquareMatrix, Fin and finite graph/tree APIs. The consecutive-band basis and every
Collins entry formula are owned here.

### 4.4 The Alexander module and the Alexander polynomial

Define the infinite cyclic cover `X∞` of the exterior `X = S³ ∖ ν(K)` of a knot (Layer 5.1) as
the cover associated with the abelianization `π₁(X) → ℤ` sending a positive meridian to `1`,
and the Alexander module as `H₁(X∞; ℤ)` with its `ℤ[t, t⁻¹]`-module structure. Prove that a
Seifert matrix `V` presents it by `t V − Vᵀ` (Lickorish, Theorem 6.5), so that
`TauCeti.KnotTheory.alexanderMatrix V` is a presentation matrix and `TauCeti.KnotTheory.alexander V`,
up to a unit, is the order of the module; the Alexander polynomial `Δ_K` is this order with
the normalization of the Conventions. Prove the Wirtinger presentation of the knot group from
a diagram, the Fox calculus computation of the Alexander matrix from it, and the agreement of
the Seifert, Fox and Burau routes (`TauCeti.MarkovBraid.burauAlexander`) up to units. Prove the
Conway skein relation `Δ(L₊) − Δ(L₋) = (t¹ᐟ² − t⁻¹ᐟ²) Δ(L₀)` for the normalized polynomial of
links (Lickorish, Theorem 8.6) and the characterization of the determinant `|Δ_K(−1)|` as the
order of `H₁` of the double branched cover.

Construct the deck-equivariant Crowell comparison: with basepoint and lift chosen, π₁(X∞) is
the commutator subgroup π′ of the knot group π and Hurewicz gives
`H₁(X∞;ℤ) ≃+ Additive (Abelianization π′)`, Laurent-linear for the following action and
independent of the meridian representative and compatible basepoint/lift changes. The
positive deck generator sends the chosen lift to the end of the lift μ̃ of the positive
meridian μ, transported by `(fundamentalGroupMulEquivOfPath μ̃).symm`; since native
multiplication is `p*q=q.trans p`, it acts by k ↦ μ⁻¹*k*μ. Native conjugation k ↦ μ*k*μ⁻¹
corresponds to the inverse deck generator and t ↦ t⁻¹; export that conversion. With the
Seifert presentation the comparison proves the perfect-commutator criterion below.

**The three native routes and their agreement.** Three routes to the Alexander polynomial are
native, each on its own presentation, and this section owns the comparison theorems between
them. Consume `TauCeti.KnotTheory.alexander V` for a Seifert matrix `V` (Conway-normalised,
symmetric, `Δ(1) = det(V − Vᵀ)`, with `invert_alexander` and `eval₂_one_alexander`, invariant
under unimodular congruence and the two enlargements `enlargeColumn`, `enlargeRow` generating
S-equivalence `TauCeti.KnotTheory.IntegralSquareMatrix.SEquivalent`, with the trefoil and
figure-eight values), the Alexander module and elementary ideals of an oriented PD-code
(`TauCeti.OrientedPDCode.AlexanderModule`, `elementaryIdeal`, from the Wirtinger presentation,
invariant under Reidemeister equivalence), and the Burau route `TauCeti.MarkovBraid.burauAlexander`
(the corner minor of `burau b − 1`, for the Burau representation `TauCeti.KnotTheory.burau`, a
Markov invariant up to units of `ℤ[T;T⁻¹]` by `TauCeti.MarkovEquiv.associated_burauAlexander`).
Define the **Seifert matrix of a diagram**: for a planar oriented PD-code `D` of a knot, `V(D)` is
the Seifert form, by linking numbers of push-offs, of Seifert's surface of `D` (4.3.2's raw
canonical surface: Seifert circles joined by half-twisted bands) in the basis of its first
homology given by the fundamental cycles of a spanning tree of the Seifert graph, another
spanning tree changing `V(D)` by a unimodular congruence (Lickorish, Chapter 6; Burde–Zieschang,
Chapter 8); on a braid closure it is congruent to 4.3.5's matrix, by 4.3.5's comparison of the
two bases. Prove that the Seifert matrices of Reidemeister-equivalent diagrams are S-equivalent
(Lickorish, Chapter 8, Theorem 8.4). Define the **Alexander polynomial `Δ_D` of a knot diagram**
as the Conway-normalised generator of the first elementary ideal `E₁(D)`: prove that `E₁` of a
knot diagram is principal, generated by a polynomial `Δ` with `Δ(t) = Δ(t⁻¹)` and `Δ(1) = 1`,
unique with these normalisations (Crowell–Fox, *Introduction to Knot Theory*, Chapter VII;
Lickorish, Chapter 6). Prove the **agreement theorems**, the exact form of the agreement of the
routes above: for a knot diagram `D` with Seifert matrix `V(D)`, `Δ_D = alexander V(D)`; for a
braid word `w` on `n + 1` strands with one-component closure,
`burauAlexander ⟨n, w.toBraid⟩ ≐ alexander V(w.closure)` (equal up to a unit `±T^k`), which the
native `associated_burauAlexander_alexander_trefoilSeifertMatrix` verifies on the trefoil.

- `Δ_K(1) = ±1` for every knot, so the normalization is possible; `Δ_{K # J} = Δ_K Δ_J` and
  `Δ_{K̄}(t) = Δ_K(t)` for the mirror.
- For a knot of genus `g`, `Δ_K` has degree at most `g` in `t` and `t⁻¹`, so `span Δ_K ≤ 2 g(K)`.
- The Alexander module is trivial iff `Δ_K = 1` iff the commutator subgroup of the knot group
  is perfect (`TauCeti.SmoothCircleEmbedding.HasPerfectCommutatorSubgroup`), which is the
  hypothesis of Freedman's theorem (Layer 6.4).
- The diagram Alexander polynomial `Δ_D` is a function on Reidemeister classes of planar oriented
  PD-codes, hence by 4.2 on smooth links.
- Agreement: Seifert-matrix, Fox-calculus and Burau Alexander polynomials coincide (the last up to
  units).
- `Δ(1) = 1` fixes the sign of `Δ` (both `Δ` and `−Δ` are symmetric); `Δ(−1) = ±det(K)`.

**Checks.**

- *Two-strand torus links.* The closure `T(2, n)` of `σ₁ⁿ` has unnormalized Alexander
  polynomial `Σ_{j<n} (−t)^j`, with value `n` at `t = −1`; for `n = 0` the order is `0`, the
  two-component unlink having infinite cyclic Alexander module (by evaluation).
- *Small knots.* Right-handed trefoil: `Δ = t − 1 + t⁻¹`, determinant `3`; figure-eight:
  `Δ = −t + 3 − t⁻¹`, determinant `5`; `T(2, 5)`: `Δ = t² − t + 1 − t⁻¹ + t⁻²`, determinant `5`;
  unknot: `Δ = 1` (by evaluation).
- *Odd determinant.* `Δ(−1)` is odd for every knot, since `V − Vᵀ` is unimodular and
  `V + Vᵀ ≡ V − Vᵀ (mod 2)`.
- *Sign and determinant.* At `t = −1`: `Δ(−1) = 1, −3, 5` for the unknot, trefoil and
  figure-eight, so `|Δ(−1)|` is the determinant `1, 3, 5`. The polynomial `−Δ` is symmetric too, so
  symmetry alone does not fix the sign; `(−Δ)(1) = −1`, so the law `Δ(1) = 1` does. With the sign
  fixed, `Δ(−1)` distinguishes the trefoil (`−3`) from the figure-eight (`5`), while `Δ(1) = 1` for
  both (by evaluation).
- *Burau route.* The Burau value of `σ₀³` (native zero-based letter) is `−t(t² − t + 1)`,
  associated to `t − 1 + t⁻¹` by the unit `−t²`; at `t = −1` over `ℤ` it is `3`, not associated to
  `1`, which separates the trefoil braid from the trivial braid although both closures have one
  component (by evaluation).

*Needs:* Layer 4.3, Layer 5.1 (the exterior); Tau Ceti `TauCeti.KnotTheory.alexanderMatrix`,
`TauCeti.KnotTheory.alexander`, `TauCeti.MarkovBraid.burauAlexander`,
`enlargeColumn`, `enlargeRow`, `invert_alexander`, `eval₂_one_alexander`,
`TauCeti.KnotTheory.IntegralSquareMatrix.SEquivalent`, `TauCeti.OrientedPDCode.AlexanderModule`,
`elementaryIdeal`, `TauCeti.KnotTheory.burau`, `TauCeti.MarkovEquiv.associated_burauAlexander`,
`TauCeti.SmoothCircleEmbedding.KnotGroup`, `HasPerfectCommutatorSubgroup`; Mathlib
`Matrix.det`, `Ideal`,
`IsCoveringMap`, `FundamentalGroup`, `LaurentPolynomial`, `PresentedGroup`.
Layer 4.1 supplies the linking numbers of the Seifert form of a diagram, and Layer 4.2 the
Reidemeister classes on which the diagram invariants are defined, with Layers 4.3.2 and 4.3.5
for Seifert's surface of a diagram and of a braid closure.

### 4.4.1 Seifert determinants, degree and stabilization

This section proves its statements from the constructions it states and cites no outside proof.

For an integral Seifert matrix V of a knot of size 2g, distinguish `D_V(X)=det(XV−Vᵀ)∈ℤ[X]`,
the native symmetric Laurent polynomial `Δ_V=T(−g)·D_V.toLaurent` and the determinant
`d(K)=|Δ_V(−1)|`, compared with native `alexanderMatrix` and `alexander` through the
coefficient and evaluation maps; surfaces, bases and S-equivalence are Layer 4.3's.

**End coefficients and degree.** From Mathlib's determinant-of-linear-polynomial lemmas prove
`natDegree D_V ≤ 2g`, `coeff D_V 0 = coeff D_V (2g) = coeff Δ_V (−g) = coeff Δ_V g = det V`
and `support Δ_V ⊆ [−g,g]` (native `coeff.support`); that D_V and Δ_V are nonzero, from the
unimodular skew pairing and Δ_V(1)=1; and that `det V≠0`, `natDegree D_V=2g` and nonvanishing
of both Laurent end coefficients are equivalent. For every nonzero inversion-symmetric integral
Laurent polynomial Δ with Δ(1)=1 and extreme support exponents m ≤ M, prove `m=−M`, `M≥0` and
that `T(−m)·Δ` is the image of a unique ordinary polynomial with nonzero constant term and
degree 2M; transport this to Δ_K.

**Symmetrization and S-equivalence.** For S_V=V+Vᵀ, unimodular congruence multiplies det S_V
by `(det P)²=1` and each native elementary enlargement by −1, so `|det S_V|` descends through
native `IntegralSquareMatrix.SEquivalent` (singular matrices included) and, for even sizes,
so does `(−1)^g det S_V`. Prove `Δ_V(−1) = (−1)^g det(V+Vᵀ)`, hence `d(K) = |det(V+Vᵀ)|`.
Reduction mod 2 and `det(V−Vᵀ)=1` make det S_V odd and nonzero for knots, so the real
symmetric form is nondegenerate with even signature, compared with native `Matrix.signature`
through its positive symmetrization law; Layer 6's Hermitian and concordance signatures
consume this comparison. Link Seifert matrices may have odd size or singular symmetrization.

**Checks.**

- *Stabilized disc.* The empty matrix and its column enlargement `[[0,1],[0,0]]` are
  S-equivalent with Δ=1 and signature 0, but have det V equal to 1 and 0 and det S_V equal to
  1 and −1 (by evaluation).
- *Native trefoil and figure-eight.* The native trefoil matrix has `det V = 1` and
  `det(V + Vᵀ) = 3`, so `Δ(−1) = −3`; the native figure-eight matrix has `det V = −1` and
  `det(V + Vᵀ) = −5`, so `Δ(−1) = 5`; both polynomials have greatest exponent `1` and span `2` (by
  evaluation).
- *Size is not span.* The stabilized disc matrix has size `2` but `Δ` has span `0`, so matrix
  size alone does not force equality in the genus bound (by evaluation).

*Needs:* Layer 4.3 (embedded Seifert surfaces, skew pairing and geometric stabilization),
Layer 4.4 (native Alexander comparison); `IntegralSquareMatrix.SEquivalent`, `enlargeColumn`,
`enlargeRow`, `LaurentPolynomial`, Mathlib's polynomial-matrix determinant lemmas, and native
finite-dimensional real inertia and `Matrix.signature`.

### 4.4.2 Signed crossing matrices and Fox specialization

Over Λ=`LaurentPolynomial ℤ`, `t=T 1`, build the Fox derivative on `FreeGroup` words with
values in the integral group ring, invariant under free cancellation, with
`D_i(xy)=D_i(x)+xD_i(y)`, `D_i(x⁻¹)=−x⁻¹D_i(x)`, the additive extension
`D_i(ab)=D_i(a)ε(b)+aD_i(b)`, the fundamental identity `Σ_i D_i(w)(x_i−1)=w−1`, and
compatibility with relabelling and with the map sending positive meridians to t: the calculus
of Layer 4.4's Wirtinger route.

**Local signs and the native presentation.** At a crossing with over-meridian o, incoming
under-meridian u and outgoing v, the signed relators `r₊=o u o⁻¹ v⁻¹`, `r₋=o⁻¹ u o v⁻¹` have
abelianized rows `(1−t,t,−1)` and `(1−t⁻¹,t⁻¹,−1)` in order (o,u,v); the negative row times
the unit −t is the normalized `(1−t,−1,t)`. Rows add all incident contributions and sum to 0;
raw and normalized rows stay distinct, their unit row transformation carried through every
comparison. Read from an incoming under-slot, native `OrientedPDCode.alexanderRelation` is the
negative of the raw row with weight `T(crossingSign)`. With arcs cut at undercrossings and a
generator for each crossing-free or over-only component, construct inverse maps between
`coker(Aᵀ)` (A: crossings × arcs) and native `D.AlexanderModule`. For a nonempty realized
oriented link, split the augmentation (arcs to 1) by a chosen arc and identify its kernel with
`H₁(X∞;ℤ)` by Layer 4.4's Wirtinger/Fox/cover comparison: `D.AlexanderModule ≃ Λ ⊕ H₁(X∞;ℤ)`
and `D.elementaryIdeal k = Fitt_(k−1)(H₁(X∞;ℤ))` for k≥1, while E₀=0. Ambient-isotopy
invariance follows from the native Reidemeister module equivalences and the geometric move
comparison; relabelling acts by permutations and total reversal by t↦t⁻¹. For links keep the
full ideal family.

**Every cofactor, with its unit.** For a realized knot diagram with c≥1 crossings (c arcs, so A
is square), the planar
Wirtinger identity (Burde–Zieschang, §3.B, Corollary 3.6), a free-group product of conjugates
`g_i r_i^δ_i g_i⁻¹` over all crossings equal to 1, yields by differentiation a left kernel of
the raw matrix with unit entries `δ_i t^(exp g_i)` (divided by −t on normalized rows), beside
the all-ones right kernel. For every square Λ-matrix of positive size with such kernels u and
1, prove `(−1)^(i+j) det B_ij = u_i κ` for a common κ, zero-based indices and the deleted
matrices B_ij related by unimodular transports. So all cofactors generate E₁, which is `(Δ_K)`
for knots by Layer 4.4, and each cofactor is `±t^m Δ_K`, tracked through relabelling,
Reidemeister moves and reversal. Layer 4.7's checkerboard specialization consumes this.

**Coefficient specialization.** For every commutative ring R and unit a∈Rˣ, along
`LaurentPolynomial.eval₂ (Int.castRingHom R) a`, prove right-exact base change of the presented
module and identify its colourings (Hom into R) with the kernel of the specialized crossing
matrix. At t=−1 every row becomes `(2,−1,−1)`, the Fox colouring presentation with its native
half-edge comparison; at t=1 the
module is free on the link components. Region Goeritz matrices need Layer 4.7.

**Alexander polynomial one from a unit cofactor.** For every positive-size square matrix A
over a commutative ring R with A·1=0 and an invertible deleted cofactor B (column j omitted),
`B⁻¹=(det B)⁻¹adj(B)` gives the augmentation isomorphism `coker(Aᵀ)≃R`, `[x_k]↦1`, with
inverse `r↦r[x_j]`. Hence if the Fox matrix of a realized knot diagram with n≥1 crossings
has a deleted cofactor `εt^k` (ε=±1), then Δ=1, the unreduced module is Λ, `H₁(X∞;ℤ)=0`, E₀=0
and E_k=Λ for k≥1, and after every specialization t↦a∈Rˣ the colourings with values in any
R-module M are the constant ones (ordinary Fox colourings: a=−1). Such a knot need not be
trivial: the positive-clasped untwisted Whitehead double of a nontrivial knot has Δ=1 (4.11.2)
and is nontrivial by its essential companion torus (4.11).

**Hypothesis 4.4.2 (figure-eight diagram).** The realized closure of `σ₁σ₂⁻¹σ₁σ₂⁻¹` on three
strands, crossings numbered 0–3 in braid order, has cyclic Gauss word
`O0,U1,O3,U0,O2,U3,O1,U2`, signs (+,−,+,−) and arcs `0:U2→U1`, `3:U1→U0`, `2:U0→U3`,
`1:U3→U2`, and is geometrically the figure-eight knot.

**Checks.**

- *Figure-eight cofactor.* The normalized crossing matrix of the diagram of Hypothesis 4.4.2
  has unit left kernel `(1,−t,1,−t)` and last-row/column cofactor `D₄=−t³+3t²−t`, with
  `t⁻²D₄=alexander figureEightSeifertMatrix=−t+3−t⁻¹` (by evaluation).
- *Unit hypothesis.* Over ℤ, `[[2, −2], [−2, 2]]` has `A·1 = 0` and transpose cokernel
  `ℤ ⊕ ℤ/2`, so invertibility of a cofactor cannot be dropped (by evaluation).
- *Kink.* The one-crossing kink diagram of the unknot has the `1 × 1` Fox matrix `(0)`, whose
  empty cofactor has determinant `1`; the reduced module is `0` and `E₁ = Λ` (by evaluation).

*Needs:* Layers 4.1–4.4 (realized diagrams, geometric Wirtinger presentations, Seifert
comparison and the meridional cover); Mathlib `FreeGroup`, `MonoidAlgebra`,
`LaurentPolynomial`, finite matrices, module quotients, tensor products and Fitting ideals;
native `TauCeti.KnotTheory.PDCode.Alexander.Basic` and the native Alexander Reidemeister
equivalences; Burde–Zieschang, *Knots*, §3.B, Corollary 3.6.

### 4.4.3 Countability and finite presentations of knot groups

This section proves its statements from the constructions it states and cites no outside proof.

For Mathlib's `Group.Presentation G ι` (generators indexed by ι, relators in `FreeGroup ι`
whose `Subgroup.normalClosure` is the evaluation kernel), with
`presentedGroupEquiv : PresentedGroup P.rel ≃* G` and `PresentedGroup.toGroup`, prove that the
normal closure consists of finite products of conjugates of relators and their inverses, and
the resulting criterion for a generator assignment to descend. Every group G has the
presentation on generator type G with relators the kernel of `FreeGroup.lift id`, whose
presentation equivalence is the identity on elements. Prove
`Countable G ↔ Nonempty (Group.Presentation G ℕ)`: forward by a surjective enumeration of G
padded by the identity, whose evaluation kernel is a countable relator set; backward by the
surjection from `FreeGroup ℕ`. Keep apart countable presentation, finite generation
(`Group.Generators`, `Group.FG`, following its `IsMulFG` replacement) and finite presentation
(`Group.IsFinitelyPresented`, via
`Group.Presentation.isFinitelyPresented_iff_exists_finite_presentation`); the last gives the
other two.

For every finite realized oriented link diagram, turn Layer 4.4's geometric Wirtinger theorem
into a finite `Group.Presentation` of the complement group, one relator per crossing and one
generator per arc (crossing-free and over-only components included), with its
generator/meridian maps and native finite-presentation instance; for a knot with c≥1
crossings, 4.4.2's once-each identity removes any one relator.

**Eliminating arcs.** With 4.4.2's signed relators `r=o^ε u o^(−ε) v⁻¹`, ε=±1, if the overarc o
and one underarc of a crossing are words in chosen seed arcs, the relator expresses the other
(`v=o^ε u o^(−ε)` or `u=o^(−ε) v o^ε`), and deleting that generator and relator while
substituting is a Tietze transformation, the deleted generator equalling its word modulo the
original relations. Iterating along a given sequence of crossings, each
used once with its overarc and one underarc already expressed, reduces the presentation to the
seed arcs, with one remaining relator redundant by the once-each identity. Substituted words
have exponent sum 1 and rewritten relators 0, so the map to `Multiplicative ℤ` sending every
arc to 1 descends.

**Checks.**

- *Countable, not finitely generated.* `FreeGroup ℕ` has the empty-relator presentation on ℕ,
  but the map to `Multiplicative (ZMod 2)` sending one letter missed by a given finite family
  of words to the generator and all others to 1 kills that family (by evaluation).
- *Trefoil elimination.* With relators `z=xyx⁻¹`, `x=yzy⁻¹`, `y=zxz⁻¹`, eliminating `z` through
  the first crossing rewrites both other relators to `xyx=yxy` (by evaluation).
- *Uncountable groups.* The additive group of `ℝ`, written multiplicatively, has the
  presentation on all its elements but no countable presentation, since it is uncountable.

*Needs:* native `Group.Presentation`, `Group.Generators`, `PresentedGroup`, `FreeGroup`,
`Subgroup.normalClosure`, `Countable`, `Group.IsFinitelyPresented` and the geometric
Wirtinger construction in Layer 4.4; Layer 4.4.2 for the signed relators, the once-each
relator identity and individual-relator deletion. The elimination lemma is built here.

### 4.4.4 The marked four-band Seifert example

This section proves its statements from the constructions and named hypotheses it states and
cites no outside proof.

**Hypothesis 4.4.4 (marked four-band surface).** On 4.3.2's embedded disc-band carrier there
is a connected orientable surface F with one boundary component and oriented curves
x₁,…,x₄ forming an integral basis of H₁(F), whose Seifert matrix `V_ij=lk(x_i,x_j⁺)` in 4.3's
positive-push-second convention is `V=[[2,1,0,0],[0,−5,1,0],[0,1,2,−1],[0,0,−2,−2]]`.

**Geometric consequences.** Assuming Hypothesis 4.4.4, the knot `∂F` has ordinary genus 2,
determinant 1089 and signature 0. The rank-four basis gives F genus 2, so g(∂F)≤2, and the
span bound of 4.4–4.4.1 applied to the Alexander polynomial of V (span 4) gives g(∂F)≥2, with
no minimum-genus assumption on F; 4.3's geometric S-equivalence theorem and 4.4's
cut-surface/Alexander-cover comparison make the invariants independent of surface and basis.

**Checks.**

- *Four-band Alexander polynomial.* Native `alexander` gives `64t²−272t+417−272t⁻¹+64t⁻²`:
  value 1 at t=1, span 4, value 1089 at t=−1, Conway polynomial `1−16z²+64z⁴` (by evaluation).
- *Four-band signature.* `V+Vᵀ` is rationally congruent by a unipotent triangular matrix to
  `diag(4,−41/4,180/41,−121/20)`, so its signature is 0 (by evaluation).
- *Square factorization.* `Δ = (8t − 17 + 8t⁻¹)²`, whose expansion is the polynomial above; the
  factorization alone does not identify a connected-sum decomposition (by evaluation).

*Needs:* 4.3 linking, push-offs and geometric S-equivalence; 4.3.2 embedded band realization
and homology; 4.4's geometric Alexander-module dictionary and 4.4.1's determinant/degree laws;
native `IntegralSquareMatrix`, `alexander`, `Matrix.signature`,
`Matrix.signature_eq_of_congr_diagonal` and `Matrix.signature_add_transpose`; for invariance
under geometric S-equivalence, `Matrix.signature_congr` and
`TauCeti.KnotTheory.signature_enlargeColumn` / `signature_enlargeRow` from
`TauCeti.KnotTheory.Signature`.

### 4.4.5 The integral Conway polynomial and coefficient comparisons

Define the Conway polynomial ∇_L∈Polynomial ℤ of nonempty oriented tame links (Lickorish,
Chapter 8) on 4.2's realized oriented skein triples, right-handed crossings positive, by
`∇_U=1` and `∇_(L₊)−∇_(L₋)=z∇_(L₀)`, through a terminating based, ordered
descending-resolution construction; prove independence of crossing choices, basepoints and
component order and invariance under oriented Reidemeister moves, and export existence,
uniqueness, evaluation along integer-coefficient ring maps and descent to ambient isotopy
classes. Prove ∇_(U_μ)=0 for μ≥2 and vanishing on a split union of two nonempty links,
multiplicativity under 4.3.4's selected-component sum, invariance under simultaneous
orientation reversal, ∇ of the mirror equal to ∇_L(−z), and, for μ=μ(L)≥1, that z^(μ−1)
divides ∇_L and nonzero coefficients have degree ≡ μ−1 mod 2, so `∇_L(−z)=(−1)^(μ−1)∇_L(z)`.
For a knot ∇ has constant coefficient 1 and even powers only; export the coefficient API,
including a₂(K), used in 4.8.3.

The coefficient of z^(μ−1) is any principal cofactor of the weighted Laplacian with
off-diagonal entries −lk(L_i,L_j) and diagonal the incident linking sums, equivalently the sum
over spanning trees of the component graph of products of edge linking numbers (for μ=2, the
linking number); prove it by skein induction tracking component merging and linking. Own the
weighted matrix-tree identity over every commutative ring (symmetric zero-diagonal weights on
a finite nonempty vertex set; all principal cofactors of diag(row sums)−weights equal the
weighted spanning-tree sum), compared with native SimpleGraph.lapMatrix for 0/1 weights. For a
connected genus-g spanning surface prove degree(∇_L)≤2g+μ−1, giving degree≤2g(K) for knots.

**Half-Laurent descent and the realized Seifert form.** Over Λ_s=LaurentPolynomial ℤ, s=T1,
construct the injective ring map `j:ℤ[z]→Λ_s`, z↦s−s⁻¹, with coefficient, leading-term and
parity rules, prove `range(j) = {f∈Λ_s : f(−s⁻¹)=f(s)}` with the inverse on this subring, and
relate the involutions s↦s⁻¹, s↦−s, s↦−s⁻¹ and their actions on j(z). For 4.3's
positive-push-second Seifert matrix V of a connected oriented spanning surface, with
r=2g+μ−1, set `D_V(s)=det(s⁻¹ V−s Vᵀ)=(−1)^r det(s V−s⁻¹ Vᵀ)`; prove invariance under basis
change and both native enlargements by the geometric common-S-equivalence theorem for
connected link spanning surfaces, odd rank included. At an oriented skein triple, compatible
band-surface bases make V₊ and V₋ differ by −1 in one diagonal entry (a sign from the
positive push-off convention) with common deleted block V₀, so
`D_(L₊)−D_(L₋)=(s−s⁻¹)D_(L₀)`, D_U=1 and `D_V(s)=j(∇_L)=Δ_L(s²)`. For a knot compare with
native `TauCeti.KnotTheory.alexander V` by t↦s²; at size n,
`D_V(s)=(−1)^n s^(−(n mod2))·(alexander V)(s²)`, so the native value is not the normalized
invariant at odd rank; at general rank `D_V(s)=(−1)^r s^(−r) det(s²V−Vᵀ)`, and the raw skein
identity is `det(tV₊−V₊ᵀ)−det(tV₋−V₋ᵀ)=(1−t)det(tV₀−V₀ᵀ)`. This fixes the representative
behind the usual “up to units” normalization; compare the resulting order with 4.4's
Fox/cover and Burau gcds, keeping zero orders and full link Fitting ideals.

**HOMFLY in the variables (l, m) and native Jones.** For 4.6's HOMFLY invariant P in the
degree-zero part of ℤ[x±,y±,w±] with xP₊+yP₋+wP₀=0 (w, to keep z for Conway), set
`ρ_L(l,m)=P_L(l,l⁻¹,m)` and prove that every nonzero l^r m^s coefficient of ρ_L has r and s
congruent to μ−1 mod 2. Define the substitutions as coefficient homomorphisms into rational
function fields (RatFunc ℂ, fixed i²=−1), prove integrality and nonnegative Conway degree by
the skein construction, descend them to the integer polynomial or half-Laurent subrings
(the images of z or m need not be units there, so evaluations at z=0 or s=±1 use the
descended invariant), and prove by skein uniqueness on all nonempty links, using total
degree 0 of P:

```text
∇_L(z) = P_L(1,−1,−z) = ρ_L(i,−iz),
∇⁻_L(z):=∇_L(−z) = P_L(1,−1,z) = ρ_L(i,iz),
Δ_L(s²) = P_L(1,−1,s⁻¹−s),
H_L(s):=V_L(s²) = P_L(s⁻²,−s²,s⁻¹−s) = ρ_L(is⁻²,−i(s−s⁻¹)),
ρ_L(is⁻²,i(s−s⁻¹))=(−1)^(μ−1)H_L(s).
```

So ∇⁻ satisfies ∇⁻₊−∇⁻₋=−z∇⁻₀ and `∇⁻_L=(−1)^(μ−1)∇_L`, and the positive-argument Jones
substitution carries the component phase `(−1)^(μ−1)` at the fixed square-root branch;
compare it with the branch change s↦−s by 4.5's parity theorem.

**Checks.**

- *Hopf signs.* The positive Hopf link has ∇=z and Seifert matrix `[−1]`, giving D_V=s−s⁻¹;
  the negative Hopf link has ∇=−z and matrix `[1]` (by evaluation).
- *Unlink phase.* For the two-component unlink ∇=0, while `ρ_L(is⁻², i(s − s⁻¹))` is
  `s + s⁻¹` and the native Jones value is `−s − s⁻¹` (by evaluation).
- *Small Conway polynomials.* `∇_U = 1`, `∇` of the positive Hopf link `z`, of the negative one
  `−z`, of the right-handed trefoil `1 + z²` and of the figure-eight `1 − z²` (by evaluation).

*Needs:* 4.2's realized oriented diagrams and descending moves; 4.3's connected link surfaces,
linking and geometric S-equivalence; 4.3.4's selected-component sums; 4.4's Alexander-module
comparisons; 4.6's diagram-skein construction and coefficient ring, not its quantum-group
trace comparison; Mathlib Polynomial, LaurentPolynomial, RatFunc, integer matrices and finite
graph/tree sums; [Lickorish–Millett,
§§0–2](https://web.math.ucsb.edu/~millett/Papers/1987Millett9LickorishTopology.pdf). For
Lickorish's Chapter 8 Seifert/Conway proof, convert his Figure 3.2 crossings and
negative-push-first form to the native crossings and positive-push-second form, keeping his
half-variable s⁻¹−s distinct from s−s⁻¹ and exporting the induced inversion/component phase.
The map j and the matrix normalization are built
here; 4.5.3 and 4.8.3 consume the Conway coefficient API.
### 4.4.6 All fourteen small-prime Seifert surfaces

**Models and their complete input comparison.** The *standard models* are one fixed
oriented `OrientedPDCode` for each of the fourteen Rolfsen rows with fewer than eight
crossings (3₁ to 7₇, global mirrors identified), decoded from the alternating PD tuples of
the [Knot Atlas standard presentations](https://katlas.org/wiki/The_Rolfsen_Knot_Table) in
their row and slot order, not from minimum braids: `X[a,b,c,d]` lists the slots in cyclic
order, a → c is the oriented under-strand with c = a + 1 modulo 2n, and the over-strand
direction is read from the consecutive labels b, d. Each model carries proofs of one
component, planarity, reducedness and alternation, a marked comparison with any existing
named model of its row (recording a global mirror or orientation comparison), and transport
to its mirror and reversal. That the rows with their mirrors and reversals exhaust the
prime knots below eight crossings is tabulated knowledge (Rolfsen, Appendix C), not a
target.

**Hypothesis 4.4.6 (fourteen small-prime Seifert surfaces).** For each standard model K
with n crossings and s Seifert circles, the Seifert-algorithm surface F of 4.3.2 has genus
(n − s + 1)/2; the non-tree bands of the lexicographically first spanning tree of its
incidence graph give an integral basis of H₁(F) whose Seifert matrix V has
det(s⁻¹V − sVᵀ) = ∇_K(s − s⁻¹), agreeing with 4.4.2's signed Fox cofactor under the fixed
unit; and ∇_K has degree 2g(F).

Assuming Hypothesis 4.4.6, prove g(K) = g(F) for each standard model, by 4.4's bound
span Δ ≤ 2g: 1 for 3₁, 4₁, 5₂, 6₁, 7₂, 7₄; 2 for 5₁, 6₂, 6₃, 7₃, 7₅, 7₆, 7₇; 3 for 7₁.

**Checks.**

- *Diagram dependence.* The six-crossing three-strand braid closure of `5₂` has
  Seifert-algorithm genus `(6 − 3 + 1)/2 = 2`, the standard model `(5 − 4 + 1)/2 = 1`
  (by evaluation).
- *Algorithm genus.* `2g = n − s + 1` in every row: `3₁` has `n = 3, s = 2, g = 1`; `5₁` has
  `n = 5, s = 2, g = 2`; `7₁` has `n = 7, s = 2, g = 3`; `7₂` has `n = 7, s = 6, g = 1` (by
  evaluation).
- *Determinants.* Each tabulated `∇` has degree `2g` and `∇(0) = 1`, and `|∇(2i)|` is the
  determinant: `3₁` gives `|1 − 4| = 3`, `4₁` gives `|1 + 4| = 5`, `7₄` gives `|1 − 16| = 15` (by
  evaluation).

*Needs:* 4.2's realized PD codes and named-model comparison; 4.3/4.3.2's linking, embedded
Seifert surfaces and relative tree moves; 4.4/4.4.1/4.4.2/4.4.5's Seifert/Fox/Alexander/
Conway comparison and genus lower bound.

### 4.4.7 Two-strand torus links and the cinquefoil group

Items 1 and 3–7 are proved here from the constructions they state and cite no outside proof.
Item 2's group is the torus-knot group `⟨a, b | aᵖ = b^q⟩` of the coprime pair `(p, q) = (2, 5)`
(Hatcher, *Algebraic Topology*, Example 1.24, p. 47), recomputed here from item 1's presentation.

For every integer n let L_n be the realized closure of `σ₁ⁿ∈B₂` by native
`TauCeti.BraidWord.closure`, with orientations, mirror and basing paths read off the twist
drawing: a knot for odd n, a two-component link of linking number n/2 for even n, L_0 the
two-component unlink and L_±1 unknots. 4.8.2's braid-index classification consumes it.

1. **The full two-meridian presentation.** With C = xy and k ∈ ℤ, the complement group of
   L_n is `⟨x,y | C^k=(yx)^k⟩` for n = 2k and `⟨x,y | C^k x=y C^k⟩` for n = 2k + 1; its
   abelianization is ℤ for odd n and ℤ² for even n, and the total-linking map ℓ sends
   both positive meridians to 1 (for even n its kernel is not the commutator subgroup).
   Route: the positive generator acts on the free group of the twice-punctured disc by
   `φ(x)=xyx⁻¹`, `φ(y)=x`, with φ(C) = C and `φ²(g)=CgC⁻¹`; van Kampen along the
   meridian paths and relator elimination, by explicit inverse maps of `PresentedGroup`s.

2. **The cinquefoil group as an actual group computation.** L_5, matched with 4.4.6's
   standard 5₁ model by an explicit relabelling and isotopy, has group `⟨a,b | a²=b⁵⟩`
   via `a=xyxyx`, `b=xy` (ℓ-values 5 and 2), meridians retained; `a²=bⁿ` is used for odd
   n only.

3. **Fox and chain conventions.** In Λ = `LaurentPolynomial ℤ` put
   `F_n=Σ_(j=0)^(n−1)(−t)^j` for n ≥ 0 and `F_(−m)=−(−t)^(−m)F_m`. By 4.4.2's Fox calculus
   (a positive letter after exponent sum s contributes t^s, a negative one −t^(s−1)) the
   specialized Fox row of the relator is `(F_n,−F_n)`, spanning im ∂₂ for
   `∂₁(u,v)=(t−1)(u+v)`; presentation matrices have relations as rows.

4. **Reduced and unreduced modules.** For the cover X_n^∞ of ℓ,
   `H₁(X_n^∞;ℤ) ≃ₗ[Λ] Λ/(F_n)`, and `N_n := Λ²/Λ·(F_n,−F_n) ≃ₗ[Λ] Λ ⊕ Λ/(F_n)` by
   `[u,v] ↦ (u+v,[−v])`, `(c,[d]) ↦ [c+d,−d]` is native `OrientedPDCode.AlexanderModule`,
   with Fitting ideals (F_n), Λ, … and 0, (F_n), Λ, … respectively, natural in basings and
   presentations. Route: lifted cellular chains against the presentation complex through
   the geometric group maps, t − 1 a non-zero-divisor, and ker ℓ, not the commutator
   subgroup, for two components.

5. **The cyclic matrix and continuants.** For n ≥ 1 the Wirtinger Fox matrix is
   `A_n(i,j)=(1−t)δ_(i,j)+tδ_(j,i+1)−δ_(j,i−1)` (indices mod n); its corner continuant
   (`D_0=1`, `D_1=1−t`, `D_(r+2)=(1−t)D_(r+1)+tD_r`) is `D_(n−1)=F_n`, and unit
   eliminations reduce A_n to N_n. In ℤ[t], `(1+t)F_n=1−(−t)^n`, and F_n has constant
   coefficient 1, leading coefficient (−1)^(n−1), degree n − 1 and `F_n(−1)=n`. The
   native unreduced Burau corner minor is `−t F_n` for σ₁ⁿ and `t(−t)^(−m)F_m` for
   σ₁^(−m), transported to `MarkovBraid.burauAlexander`.

6. **The normalized oriented-link family.** In Λ_s (t = s², z = s − s⁻¹, 4.4.5), for every
   integer n, `Δ_(L_n)(s²)=C_n(s)=(−1)^(n−1)s^(1−n)F_n(s²)`, where `C_0=0`, `C_1=1`,
   `C_(n+2)=zC_(n+1)+C_n`, `C_(−m)=(−1)^(m−1)C_m` and `C_n(s⁻¹)=(−1)^(n−1)C_n(s)`, with
   the Conway recurrence in ℤ[z], its parity, degree and leading coefficient; for
   n = 2k + 1 this is `t⁻ᵏF_n(t)` with `Δ(−1)=(−1)^k(2k+1)`. The opposite-skein
   `C_n⁻=(−1)^(n−1)C_n` is 4.4.5's component phase. Route: the two-disc/n-band surface has,
   up to basis change, 4.3's Seifert matrix `V=−B_(n−1)` of rank n − 1, where `B_(n−1)` has
   diagonal 1 and superdiagonal −1, so V has diagonal −1 and superdiagonal 1; L_0 is
   spanned by a connected untwisted annulus (matrix [0]); n < 0 uses the reflected surface,
   with matrix −Vᵀ.

7. **Geometric and coloring applications.** For |n| ≥ 2 the diagrams are reduced
   alternating, so L_n has crossing number |n| (L_0, L_±1 have 0); for odd |n| ≥ 3 the
   canonical surface has the minimal genus (|n| − 1)/2; L_n is ambient isotopic, with
   orientations, to 4.11's Clifford-torus T(2, n) through an explicit spatial braid in a
   solid torus. Reversing all orientations preserves these formulas; reversing one
   component of an even L_n has its own marked Seifert matrix. For every commutative ring
   R the arc equations at t = −1 identify the Fox-coloring module with
   `R ⊕ {d∈R : n·d=0}` (the based one with its second summand), so modulo m ≥ 1 there are
   `m*gcd(m,|n|)` colorings, and the determinant is the reduced-coloring order (0 for
   L_0).

**Checks.**

- *Cinquefoil generators.* `a=xyxyx`, `b=xy` and `x=b⁻²a`, `y=a⁻¹b³` are inverse maps
  between `⟨x,y | xyxyx=yxyxy⟩` and `⟨a,b | a²=b⁵⟩` (by evaluation).
- *One-component reversal.* The coherently oriented `L_4` has `C_4 = z³ + 2z`; reversing
  one component gives `−2z` (by evaluation).
- *Fox polynomials.* `F_1 = 1`, `F_2 = 1 − t`, `F_3 = 1 − t + t²` and
  `F_5 = 1 − t + t² − t³ + t⁴`, with `F_n(−1) = n` and `(1 + t)F_n = 1 − (−t)^n`; the quotient form
  fails at `t = −1`, the identity does not (by evaluation).
- *Small presentations.* At `n = 1` and `n = 2` the presentations give `x = y` (the group `ℤ`) and
  `xy = yx` (the group `ℤ²` of the Hopf link); `a² = b²` presents the Klein bottle group, which is
  why `a² = bⁿ` is used only for odd `n` (by evaluation).

*Needs:* 4.2's native braid/PD realizations; 4.3's disc-band Seifert surfaces; 4.4's covers
and Alexander modules; 4.4.2's Fox/PD/Fitting comparison; 4.4.5's Conway/half-Laurent
normalization; Mathlib free and presented groups, polynomial and Laurent rings, quotients,
Fitting ideals; native `TauCeti.KnotTheory.BraidWord.PDCode`,
`TauCeti.KnotTheory.PDCode.Alexander.Basic`, `TauCeti.KnotTheory.Burau.Alexander`. Only
item 7 uses 4.7's quandle/Fox-specialization prefix, 4.5/4.8.1's bracket-span and adequacy
prefix and 4.11's explicit geometric-model prefix.

### 4.4.8 Two-bridge group presentations and all knots below eight crossings

The groups and Alexander modules of the knots below eight crossings: the fourteen standard
models of 4.4.6 through a reusable marked Schubert diagram, the unknot as its
p = 1 case, and larger presentations for the composites.

1. **Marked two-bridge geometry.** For p > 0 odd, q odd, `0<q<2p`, `gcd(p,q)=1`: the
   marked Schubert diagram K(p, q) (oriented bridges, labels, closing ports, basing paths
   to positive meridians a, b) and its rational tangle/plat with numerator closure, built
   from 4.2 and 4.10.1's twist/rotation/gluing operations alone, independently of 4.10's
   polynomial, bridge and classification results; labels use the right-nested
   `[c₁,…,c_r]=c₁+1/(c₂+…+1/c_r)`. Marked isotopies or mirror maps, with basepoint
   conjugations and meridional signs, realize `q₀↦q₀+p` (q₀ even), bridge exchange,
   orientation reversal and reflection.

2. **The presentation and its usable API.** With `ε_i=(−1)^floor(iq/p)`, `s_i=Σ_(j≤i) ε_j`
   (s₀ = 0), `W=b^ε₁ a^ε₂ b^ε₃ … a^ε_(p−1)` and `R=a W b⁻¹ W⁻¹`, the group
   `G(p,q)=⟨a,b | aW=Wb⟩` (native `FreeGroup`, `PresentedGroup`) is isomorphic, by
   explicit inverse maps, to the diagram group and the complement group: the Wirtinger
   meridians propagate as conjugate words, the last crossing relation is R and the other
   closing relation is redundant. At p = 1 it is ℤ. Its abelianization is ℤ, either
   bridge meridian normally generates, and it is invariant under free cancellation, item
   1's operations and q ↦ q + 2p, with bridge-exchange maps for odd inverse denominators.

3. **Fox row and the integer walk.** At a, b ↦ t, with α = (D_aW)|_t, β = (D_bW)|_t and
   e = s_(p−1), the Fox row is `(1+(t−1)α, (t−1)β−t^e) = (P,−P)` with
   `P=Σ_(i=0)^(p−1)(−1)^i t^s_i` (fundamental Fox identity; the signed-prefix evaluator
   survives free cancellation). Then `P(1)=1`, `P(−1)=p`, `ε_(p−i)=ε_i`,
   `s_(p−1−i)=e−s_i`, e is even, `P(t⁻¹)=t^(−e)P(t)`, and `Δ=t^(−e/2)P` has Δ(1) = 1 and
   `Δ(−1)=(−1)^(e/2)p`. This is [Hoste, Theorem 1 and
   §4](https://arxiv.org/html/1907.03812#S2) with numerator and denominator swapped: for
   p < q* < 2p fold to `q′=2p−q*`, so `P_(q′)(t)=P_(q*)(t⁻¹)=t^(−e)P_(q*)(t)`, and his
   raw polynomial is tP for q* < p and `t^(1−e)P` after folding.

4. **Cover and module comparison.** As in 4.4.7, `H₁(X∞;ℤ)≃ₗ[Λ]Λ/(P)` (Fitt₀ = (P)) and
   the native unreduced PD AlexanderModule is `Λ⊕Λ/(P)` (E₀ = 0, E₁ = (P), E_j = Λ for
   j ≥ 2), with generator formulas and naturality; the unit matches 4.4.5's Seifert and
   Conway normalization, and the determinant is p.

5. **All fourteen literal inputs.** By Hypothesis 4.4.8a, each standard model has group
   G(p, q*), of rank exactly two since its Alexander polynomial is not 1 (a cyclic knot
   group has trivial Alexander module, 4.4); mirrors and reversals carry group, meridian
   and t ↦ t⁻¹ comparisons. No unknot recognition theorem is used.

6. **The composite counterexample.** The connected sum of two trefoils has a six-crossing
   diagram and a group of rank exactly three, so not every knot below eight crossings has
   a two-generator group. Its group is `Γ=⟨t,a,b | tat=ata, tbt=btb⟩` (Hypothesis
   4.4.8b), and `t↦(0,1)`, `a↦(e₁,1)`, `b↦(e₂,1)` maps Γ onto `D=(F₃²)⋊C₂` (native
   `SemidirectProduct` of `Multiplicative (ZMod3×ZMod3)` by `Multiplicative (ZMod2)`
   acting by negation), which has no generating pair (Check below); the three displayed
   generators generate Γ by `PresentedGroup.closure_range_of`.

7. **The composite rows and exhaustion.** The groups of T#T, T#mirror(T) and T#F (T the
   trefoil, F the figure-eight) are the shared-meridian amalgamations of Hypothesis
   4.4.8b, built from 4.1's connected sum and Layer 1's relative gluing. That these, the
   unknot and the fourteen prime rows, with mirrors and reversals, are all knots below
   eight crossings is tabulated knowledge, not a target.

**Hypothesis 4.4.8a (two-bridge labels of the fourteen rows).** Marked diagram isotopies and Tietze
transformations carry the standard models to K(p, q*), with the Conway words of the [Knot
Atlas entries](https://katlas.org/wiki/The_Rolfsen_Knot_Table): 3₁ K(3,1) [3], 4₁ K(5,7)
[2,2], 5₁ K(5,1) [5], 5₂ K(7,9) [3,2], 6₁ K(9,11) [4,2], 6₂ K(11,3) [3,1,2], 6₃ K(13,5)
[2,1,1,2], 7₁ K(7,1) [7], 7₂ K(11,13) [5,2], 7₃ K(13,3) [4,3], 7₄ K(15,19) [3,1,3], 7₅
K(17,5) [3,2,2], 7₆ K(19,27) [2,2,1,2], 7₇ K(21,29) [2,1,1,1,2] (for 6₁, `11·5≡1 mod18`
relates q* = 11 to the existing 9/5 word); the walk polynomials agree with the
Seifert/Conway values of Hypothesis 4.4.6.

**Hypothesis 4.4.8b (composite presentations).** By the meridional annulus and van
Kampen/Tietze maps, T#T and T#mirror(T) have group Γ (with distinct peripheral comparisons)
and T#F has `⟨t,a,u | tat=ata, R_F(t,u)=1⟩`, R_F item 2's relator for K(5, 7); their
cover modules are the direct sums of the factors' cyclic modules, with Δ = Δ_T², Δ_T²,
Δ_TΔ_F.

**Checks.**

- *Figure-eight walk.* For K(5, 7) the signs are `−, +, +, −`, the walk `0, −1, 0, 1, 0`,
  `P = 3 − t − t⁻¹`, `e = 0` and `Δ = −t + 3 − t⁻¹` (by evaluation).
- *The order-18 quotient.* In D, `tat = ata = (−e₁, 1)`, `at = (e₁, 0)`, `bt = (e₂, 0)`;
  two translations miss the `C₂` quotient and a reflection with a translation generates
  at most `6` elements, so no pair generates D (by evaluation).
- *Determinant rows.* Every tabulated `Δ` has `Δ(1) = 1` and `|Δ(−1)| = p`: `7₄` gives
  `|−4 − 7 − 4| = 15`, `6₃` gives `1 + 3 + 5 + 3 + 1 = 13`, `7₇` gives `1 + 5 + 9 + 5 + 1 = 21` (by
  evaluation).

*Needs:* 4.2's realized diagrams, Wirtinger/van Kampen and group maps; 4.3's Seifert
comparisons; 4.4.2's Fox/PD/Fitting computation; 4.4.5's normalization; 4.4.7's
augmentation/cover split; 4.10.1's marked integer-tangle/plat construction prefix only;
4.1's connected sum and Layer 1's relative gluing; native free and presented groups,
group rings, Laurent polynomials, Fitting ideals, finite fields, semidirect products.

### 4.4.9 Trefoils, peripheral signs and prime-knot groups

Let `T₊` be the closure of `σ₁³`, compared with native `rightHandedTrefoilPDCode` by a
marked relabelling, and `T₋` its reflection with the transported orientation. Marked
Wirtinger maps identify both complement groups with `G=⟨x,y | xyx=yxy⟩`, `x,y` positive
meridians, the reflection inducing `x↦x⁻¹`, `y↦y⁻¹`; put `z=(xy)³`, central, and `μ=x`.

**Hypothesis 4.4.9 (trefoil longitudes).** The preferred longitudes of `T₊` and `T₋`,
identified by zero-linking push-offs along the boundary torus, are `λ₊=zx⁻⁶` and
`λ₋=z⁻¹x⁶` in the marked copies.

`T₊` and `T₋` are prime knots with isomorphic groups that are not equivalent, even as
unoriented knots, under orientation-preserving ambient homeomorphism, so prime knots are
not determined by their groups without allowing reflection; the reflection sends
`z↦z⁻¹`, `μ₊↦μ₋⁻¹`, `λ₊↦λ₋`, preserving the peripheral subgroup and reversing exactly the
meridional sign, up to conjugacy under a change of basing paths ([Friedl, Lemma
7.3](https://friedl.app.uni-regensburg.de/papers/2024_knot-theory-final.pdf)). Route:
genus one from the braid surfaces and Alexander span, primeness by genus additivity and
genus 0 iff unknot, the peripheral images from Hypothesis 4.4.9, and distinct Jones
polynomials `t+t³−t⁴`, `t⁻¹+t⁻³−t⁻⁴` (4.5). Recognition allowing reflection is 8.5.2's.

**Checks.**

- *Reflection map.* `x ↦ x⁻¹`, `y ↦ y⁻¹` sends `xyx` and `yxy` to their inverses, so is an
  involutive automorphism of `G`; `x ↦ y`, `y ↦ x` is one too but fixes the meridian
  class (by evaluation).
- *Longitude word.* `z = (xy)³ = (xyx)²` abelianizes to `6`, so `λ₊ = zx⁻⁶ ↦ 0`, as a
  longitude must, while `zx⁻⁵ ↦ 1` (by evaluation).
- *Values at ±1.* The Jones polynomials `t + t³ − t⁴` and `t⁻¹ + t⁻³ − t⁻⁴` both have `V(1) = 1`
  and `V(−1) = −3`, so neither these values nor the determinant `3` separates the two trefoils;
  the supports `{1, 3, 4}` and `{−4, −3, −1}` do (by evaluation).

*Needs:* 4.2's realized braid/PD diagrams, mirror and complement maps; 4.4 and 4.4.7's
Wirtinger identifications; 4.3's linking and boundary push-offs; 4.3.4's genus-0 criterion
and genus additivity; 4.9's connected-sum/prime definitions; 4.5's native Jones
calculation, mirror formula and invariance.

### 4.5 The Kauffman bracket and the Jones polynomial

The state sum `TauCeti.PDCode.kauffmanBracket` and the normalized
`TauCeti.OrientedPDCode.jonesPolynomial`, with their invariance under the combinatorial
Reidemeister moves, are at the pin. Prove that the Jones polynomial of a diagram depends only
on the link type of its realization (through Layer 4.2), so that `V_L ∈ ℤ[t¹ᐟ², t⁻¹ᐟ²]` is an
invariant of oriented links, and prove the skein relation
`t⁻¹ V(L₊) − t V(L₋) = (t¹ᐟ² − t⁻¹ᐟ²) V(L₀)` (Lickorish, Theorem 3.5, Proposition 3.7). Prove the
trace formula: `V` of the closure of a braid on `k` strands is the Jimbo–Ocneanu trace of its
image in the Temperley–Lieb algebra (`TauCeti.KnotTheory.jimboWeightedTrace` and the Markov
trace of `TauCeti/Algebra/TemperleyLieb/MarkovTrace.lean`), normalized by the strand count and
the writhe (Lickorish, Chapter 16).

**The two native Jones routes.** Two routes to the Jones polynomial are native, each on its own
presentation: the Kauffman bracket with its writhe normalization
`TauCeti.OrientedPDCode.normalizedKauffmanBracket` and `TauCeti.OrientedPDCode.jonesPolynomial`
with its Reidemeister invariance, mirror and reversal laws and the unknot and trefoil values; and
the Jones representation `TauCeti.TemperleyLieb.jones` of the braid group with the
writhe-normalised Markov trace `TauCeti.MarkovBraid.jonesTrace`. Their agreement on words is the
native `TauCeti.BraidWord.jonesTrace_toBraid`, consumed here for the trace formula: for every unit
`a` of a commutative ring and every braid word `w` on `n + 1` strands,
`jonesTrace ⟨n, w.toBraid⟩ a = δ · normalizedKauffmanBracket (w.closure) a`, where
`δ = jonesDelta a = −(a² + a⁻²)` is the loop value of the Temperley–Lieb algebra at `q = a²`, the
value at which the Markov trace of `jonesTrace` is taken, and the bracket is normalised by
`⟨unknot⟩ = 1` (`TauCeti.PDCode.kauffmanBracket` has a code with `c` crossing-free circles and no
crossing at `δ^{c−1}`), so that the factor `δ` is the unknot's trace (Jones, *A polynomial
invariant for knots via von Neumann algebras*, Bull. AMS 12 (1985), and the Temperley–Lieb
state-sum comparison of Kauffman, *State models and the Jones polynomial*, Topology 26 (1987));
`TauCeti.BraidWord.jonesTrace_toBraid_eq_eval₂_jonesPolynomial` is the same identity for the
Jones polynomial at `t¹ᐟ² = a⁻²`, and 4.5.4 compares both sides with the realized closure. The
native values pin both sides: on the one-strand braid both are `δ`
(`TauCeti.MarkovBraid.jonesTrace_one_strand`), and on `σ₀³` both are
`δ · (a⁻⁴ + a⁻¹² − a⁻¹⁶)` (`TauCeti.MarkovBraid.jonesTrace_sigma_pow_three` against
`TauCeti.normalizedKauffmanBracket_rightHandedTrefoilPDCode`).

- `V_{L̄}(t) = V_L(t⁻¹)` for the mirror (`TauCeti.OrientedPDCode.jonesPolynomial_mirror`);
  reversing all orientations leaves `V` unchanged, and reversing one component of a link
  multiplies by `t^{−3 lk}` where `lk` is its linking number with the rest.
- `V_L(1) = (−2)^{μ − 1}` for a `μ`-component link; `V_K(e^{2πi/3}) = 1` and
  `V_K(i) = (−1)^{Arf(K)}` for a knot (Layer 4.5.3).
- `V_{K # J} = V_K V_J`, and `V` of a split union is `(−t¹ᐟ² − t⁻¹ᐟ²)` times the product.

**Checks.**
- Unknot `1`; two-component unlink `−t¹ᐟ² − t⁻¹ᐟ²`; positive Hopf link `−t¹ᐟ² − t⁵ᐟ²`.
- The torus knot `T(3, 4)` has `V = t³ + t⁵ − t⁸` of span `5` while its crossing number is
  `8`: the span of `V` equals the crossing number for alternating knots only (Layer 4.8).
- *Trefoils and figure-eight.* Right-handed trefoil `t + t³ − t⁴`, left-handed trefoil
  `t⁻¹ + t⁻³ − t⁻⁴`; figure-eight `t² − t + 1 − t⁻¹ + t⁻²`, equal to its mirror (by evaluation).
- *Value at one.* The right-handed trefoil has `V = t + t³ − t⁴` and its mirror has
  `V = t⁻¹ + t⁻³ − t⁻⁴`; both have `V(1) = 1`, so the trefoil value is pinned by the whole
  polynomial and not by its value at `1`, and `Δ` is the same for both. The figure-eight is
  amphicheiral, with `V = t² − t + 1 − t⁻¹ + t⁻²` (by evaluation).
- *Unlink by the native.* The two-component unlink has `V = −(t^{1/2} + t^{−1/2})`, which is
  `TauCeti.OrientedPDCode.jonesPolynomial_eq_pow` with `c = 2` (by evaluation).

*Needs:* Tau Ceti `TauCeti.PDCode.kauffmanBracket`, `TauCeti.OrientedPDCode.jonesPolynomial`,
`TauCeti.OrientedPDCode.normalizedKauffmanBracket`, `TauCeti.OrientedPDCode.jonesPolynomial_eq_pow`
and its invariance lemmas, `TauCeti.TemperleyLieb.jones`, `TauCeti.MarkovBraid.jonesTrace`,
`jonesDelta`, `TauCeti.MarkovBraid.jonesTrace_one_strand`,
`TauCeti.MarkovBraid.jonesTrace_sigma_pow_three`,
`TauCeti.normalizedKauffmanBracket_rightHandedTrefoilPDCode`,
`TauCeti.BraidWord.jonesTrace_toBraid`,
`TauCeti.BraidWord.jonesTrace_toBraid_eq_eval₂_jonesPolynomial`,
`TauCeti.KnotTheory.jimboWeightedTrace`; Layer 4.2.

### 4.5.1 Low-strand Burau identities and braid obstructions

**Burau normalization and low-strand Jones identities.** For a word `b` on `n≥1` strands
with knot closure, exponent sum `e` and native `TauCeti.KnotTheory.reducedBurauCol` matrix
`B_n(b;t)` (generator `i` has nonidentity entries `1,−t,t` in row `i`, columns
`i−1,i,i+1` where present), prove `e≡n−1 (mod 2)` and, for the normalized Alexander polynomial
of 4.4, `(1+t+⋯+t^(n−1)) Δ(t) = t^((n−1−e)/2) det(I−B_n(b;t))` with the unit fixed (in
`u=t^(1/2)`: exponent `n−1−e`, denominator `Σ_(j<n) u^(2j)`). Route: the endpoint
`n`-cycle; refine the native corner-minor association to this equality over the generic
fraction field and clear denominators by injectivity, never dividing by a vanishing
quantum integer. For every three-strand word,
`V_cl(b)(t)=(-u)^e (t+t⁻¹+tr B_3(b;t))`, so for knot closures (`e` even, `det B_3=(-t)^e`)

`V_cl(b)(t)=t^(e/2)(t+t⁻¹+1+t^e−t^(e/2−1)(1+t+t²)Δ(t))`.

For four-strand knot closures (`e` odd),

`t^(−e)V(t)+t^e V(t⁻¹) = (u⁻³+u⁻¹+u+u³)(u^e+u^(−e))−(t⁻²+t⁻¹+2+t+t²)Δ(t)`,

from the generic Hecke/Temperley–Lieb blocks of dimensions `1,3,2` (the native reduced
Burau block, and `R` with `det R=−t^e`): with `s=u+u⁻¹`, `D=t+1+t⁻¹` and
`C=t²+t+1+t⁻¹+t⁻²`, `V=u^e(C+D tr B_4+tr R)/s`, and parameter inversion,
`tr R⁻¹=tr R/det R` and the three-dimensional determinant expansion cancel the
two-dimensional traces. The block and trace theory is [TypeAHeckeAlgebras
H1–H2](../TypeAHeckeAlgebras/README.md) with the Temperley–Lieb presentation, Markov trace,
cellular blocks and semisimplicity of TemperleyLieb Layers 4–5; this layer owns their
identification with native Burau matrices and the realized-closure Jones invariant,
with block weights and specialization comparisons.

**Root-value braid obstructions and a counterexample to a stated threshold.** For
unit-circle `t≠−1` the Hermitian tridiagonal matrix with diagonal `1` and off-diagonals
`−t/(1+t)` and its conjugate is preserved by every Burau matrix (Squier, *The Burau
representation is unitary*, with a native-basis comparison), and positive definite, hence
giving ordinary unitarity, for three strands at `t=i` and four at `ζ=exp(2πi/5)`, where the
Alexander denominator has modulus `1`. With `|det(I−U)|≤2^d` for unitary `U`, three-braid
knot closures have `|Δ(i)|≤3` (an odd integer of modulus at most `4`) and four-braid knot
closures `|Δ(ζ)|≤8`; through closure invariance these obstruct three- and four-strand
presentations. The four-strand word `[2,2,−3,2,3,1,2,2,1,3,−1,3,2,2,1,−2,−3,−3,1]` (signed
one-based indices) closes to a knot with `Δ(ζ)=36−13√5>13/2` (`59²>26²·5`), so the
assertion of Jones 1985, Corollary 24 (p. 108), that `Δ(ζ)>6.5` excludes four-strand
presentations is false in this normalization and is not a target.

**Checks.**

- *The `+t` term.* For `σ₁σ₂` (`e = 2`, `Δ = 1`) the three-strand formula gives
  `t(t + t⁻¹ + 1 + t² − (1 + t + t²)) = 1`, the unknot; without `+t` it gives `0` (by
  evaluation).
- *Squier minors.* The leading principal minors are `1, 1/2` for three strands at `t = i`
  and `1, (√5 − 1)/2, √5 − 2` for four strands at `ζ` (by evaluation).
- *Threshold word.* It has exponent sum `9`, endpoint four-cycle `(0 2 3 1)` and
  `Δ = 27 − 17(t + t⁻¹) + (t² + t⁻²) + 5(t³ + t⁻³) − 3(t⁴ + t⁻⁴) + (t⁵ + t⁻⁵)` (by evaluation).

*Needs:* Layers 4.2, 4.4 and 4.5 (realized closures, normalized Alexander and native Jones
polynomials); TypeAHeckeAlgebras H1–H2; TemperleyLieb Layers 4–5; native reduced Burau
matrices; Mathlib Hermitian matrices, positive definiteness and finite determinants.

### 4.5.2 Signed braid Jones support and orientation scope

Let `w : TauCeti.BraidWord n`, `n≥1`, have `p` positive and `q` negative letters before
cancellation (`p+q` its length, `p−q` its exponent sum). In the native variable
`u=t^(1/2)`, every exponent `k` of `w.closure.jonesPolynomial.coeff.support`, and so of the
realized oriented closure, satisfies `p−3q−n+1 ≤ k ≤ 3p−q+n−1`.

**State-circle supplier and proof.** For arbitrary native `PDCode` states, changing one
crossing's smoothing changes the circle count by at most one (perfect-matching/traversal
model, no planarity). For the closure, the vertical oriented state
`s₀(j)=decide(w[j].sign=1)` (the code's `overPair`, `smoothingChoice` constantly `true`)
has `n` circles; a state changing `r₊` positive and `r₋` negative crossings has weight
`(-1)^(p+q) u^(p−q+r₊−r₋)` and `1≤c≤n+r₊+r₋` circles, so with the loop factor
`(-u−u⁻¹)^(c−1)` its exponents lie in `[p−q−n+1−2r₋, p−q+n−1+2r₊]`, inside the bounds; no
noncancellation is assumed.

**Mirror distinction and its orientation scope.** Since `V(1)=(-2)^(μ−1)≠0`, if
`p−3q−n+1>0` the Jones polynomial differs from its Laurent inverse and from `1`: the
closure is not an unknot and has no mirror equivalence preserving component orientations,
even allowing component permutation or simultaneous reversal (for knots, chirality).
Reversing only some components carries the linking-number phase and is not covered.

**The Hopf link and component orientations.** The closure of `σ₁²` is the oriented
positive Hopf link, the coordinate circles of `S³⊂ℂ²`; `(z,w)↦(conj z,w)` reverses the
orientation of `S³` and of exactly one component. So the Hopf link is amphicheiral after
forgetting component orientations, while its oriented mirror has a different Jones
polynomial: the orientation distinction behind the amphicheirality wording of Jones 1985,
Theorem 5 (p. 105), whose hypothesis is the signed count above. Its positive-braid
signature route is Layer 6.2's and is not used here.

**Checks.**

- *Sharpness.* The empty word on `n ≥ 1` strands has Jones polynomial `(−u − u⁻¹)^(n−1)`,
  reaching both endpoints `±(n − 1)` (by evaluation).
- *Oriented Hopf link.* `σ₁²` has endpoints `1` and `7` and polynomial `−u − u⁵`; its
  oriented mirror has `−u⁻¹ − u⁻⁵` (by evaluation).
- *Trefoil endpoints.* The three-positive-letter trefoil has lower endpoint `3 − 2 + 1 = 2` and
  native polynomial `u² + u⁶ − u⁸`; mirroring swaps positive and negative letters and negates
  both endpoints (by evaluation).

*Needs:* Layers 4.1–4.2 for realized braid closures and mirror/orientation transport;
Layer 4.5's native Jones state sum, mirror inversion and value at one; native `PDCode`
perfect matchings and state traversal; Mathlib finite sets, permutation orbits, `Finsupp`
support and Laurent arithmetic.

### 4.5.3 Fourth-root evaluation, the Arf invariant and the integral W quotient

This section specifies Theorems 14–20 of Jones 1985 (p. 107) on the native coefficient
rings and realized oriented links; the Seifert quadratic refinement and proper-link Arf
invariant come from 4.3.1.

**Integral and half-variable conventions.** For native `OrientedPDCode.jonesPolynomial`
H_L(u), `u=t^(1/2)`, of a planar diagram with μ ≥ 1 components, there is a unique
`P_L∈ℤ[t,t⁻¹]` with `H_L(u)=P_L(u²)` for odd μ and `H_L(u)=u P_L(u²)` for even μ, given by
its coefficient map and invariant under relabelling and isotopy; for a knot V_K = P_K.

**Finite algebraic Clifford model.** From native Clifford algebras, the native TL
presentation and algebraic Markov-trace uniqueness, with u₄ = exp(πi/4) and δ = √2,
construct (its analytic and tower comparisons belong to its consumers):

- q_m(z) = Σ_(j<m) z_j², Cl_m = `CliffordAlgebra q_m`, its even subalgebra Cl_m⁰, and the
  basis of increasing products c_S (c_j² = 1, distinct c_j anticommuting).
- The empty-monomial coefficient s_m, a trace with s_m(1) = 1 and Gram entries
  (−1)^(|S|(|S|−1)/2)δ_(S,T), so s_m(xy) is nondegenerate on Cl_m and Cl_m⁰ (m = 0
  included), and s_m(x) = 2^(−m)Tr(L_x).
- d_j = c_jc_(j+1), p_j = (1 + i d_j)/2 and the surjection
  F_m : TL_m(ℂ,√2) →ₐ[ℂ] Cl_m⁰, e_j ↦ √2p_j (surjective as c_a c_b = d_a⋯d_(b−1); scalar
  for m = 0, 1), commuting with the coordinate inclusions J_m, which preserve s_m, and
  `s_(m+1)(J_m(x)p_(m−1))=s_m(x)/2` for m ≥ 1; the trace `T_m(x)=(√2)^m s_m(F_m(x))` at
  quantum parameter −u₄ has radical ker F_m, and the quotient carries the induced trace-
  and inclusion-preserving equivalence.
- The braid units g_j = −(1 + d_j)/√2 (inverse −(1 − d_j)/√2, g_j² = d_j, g_j⁴ = −1),
  satisfying the braid relations, and ρ_Cl : BraidGroup m → (Cl_m⁰)ˣ; for a² = −u₄⁻¹,
  `jonesDelta a=√2` and `F_m(jonesUnit a j)=(−a/u₄)g_j`.

For a braid word b on m ≥ 1 strands with exponent sum e and closure L with μ components,
`H_L(u₄)=(−√2)^(m−1)s_m(ρ_Cl(b))`, keeping both even-Clifford blocks for positive even m:
the phase (−a/u₄)^e, the loop value and the writhe factor (−a³)^(−e), with a^(−2) = −u₄,
give `H_L(−u₄)=(−1)^e (√2)^(m−1) s_m(ρ_Cl(b))`, and H_L(−u₄) = (−1)^(μ−1)H_L(u₄) with
e ≡ m − μ mod 2 converts it. These signed-loop, root-branch, writhe and component-parity
comparisons are owned here.

**Finite-model checks.**

- *Three-strand kernel.* `1−√2(e_0+e_1)+e_0e_1+e_1e_0` maps to zero under F_3; TL₃ has
  dimension 5, Cl₃⁰ dimension 4, and the kernel is one-dimensional (by evaluation).

*Needs:* Mathlib `CliffordAlgebra` and its even subalgebra; native `markovTrace`,
`jonesUnit`, `jonesDelta` and `BraidGroup`; the geometric braid closure and Jones/bracket
comparisons.

**Seifert Gauss sum and the fourth root.** For a connected Seifert surface F of genus g of
a μ-component link L, with quadratic refinement q_F, let
`G(q_F)=Σ_(x∈H₁(F;𝔽₂)) (−1)^(q_F(x)) ∈ ℤ` (exponent the 0/1 lift), which is native
`TauCeti.FiniteQuadraticModule.gaussSum` through `𝔽₂→ℚ/ℤ`, `1↦1/2`, reduced to the radical
R by `gaussSum_eq_card_mul_gaussSum_quotientOfLeQuadraticRadical`: G = 0 if q_F is nonzero
on R (translate by r ∈ R with q_F(r) = 1), and otherwise, L being proper,
`G(q_F)=2^(μ−1)G(q̄_F)=2^(g+μ−1)(−1)^Arf(L)` by 4.3.1's normal form. For a braid b on m ≥ 1
strands realizing L, `(−√2)^(m−1) s_m(ρ_Cl(b)) = (−1)^(μ−1) (√2)^(−(2g+μ−1)) G(q_F)`, by a
disc-band/Clifford character-sum reduction matched with the Seifert form and invariant
under band slides, common stabilizations and braid moves. Hence, with t = i, u₄ and the
native circle value −√2,

`V_L(i;u₄)=(−√2)^(μ−1)(−1)^Arf(L)` if L is proper, `V_L(i;u₄)=0` otherwise;

`V_K(i)=(−1)^Arf(K)` for a knot. Reversing a component of a proper link with even total
linking ℓ with the rest gives `Arf(L_reversed)=Arf(L)+ℓ/2 mod2` (factor
`i^(−3ℓ)=(−1)^(ℓ/2)`), and replacing u₄ by −u₄ multiplies the value by `(−1)^(μ−1)`.

**Derivative and integral divisibility.** Let `∂ = d/du` be the formal Laurent derivative
`∂(u^k)=k u^(k−1)` in the variable `u = t^(1/2)` of the native carrier `ℤ[u,u⁻¹]` (the
generator `T` of the pinned `jonesPolynomial`), and `λ=Σ_(j<k)lk(L_j,L_k)`. Every nonempty
link has `H_L(1)=(−2)^(μ−1)` and `(∂H_L)(1)=3(−2)^(μ−1)λ`: differentiating the native skein
`u⁻²H₊−u²H₋=(u−u⁻¹)H₀` at `u=1` gives `∂H₊(1)−∂H₋(1)=4(−2)^(μ−1)+2H₀(1)`, so a
self-crossing change (`H₀(1)=(−2)^μ`) preserves the derivative and a mixed one
(`H₀(1)=(−2)^(μ−2)`) changes it by `3(−2)^(μ−1)` and λ by 1, down to the unlink through a
descending diagram. Since `d/du = 2u·d/dt`, the derivative in `t` at `t = 1` is
half of this, `(3/2)(−2)^(μ−1)λ`. For a knot `V_K(1)=1` and `V_K′(1)=0` over ℤ, in either
variable, since `H_K(u)=V_K(u²)`.

In the standard skein `∇_+−∇_−=z∇_0`, converted from the existing Conway specialization,
with `Δ_L(s²)=∇_L(s−s⁻¹)` (Layer 4.4) and compatibly with Layer 4.6's HOMFLY substitution,
every nonempty link has `H_L(i)=∇_L(−2i)=(−1)^(μ−1)∇_L(2i)`, by split-unlink initial values,
component parity and the descending skein, the native skein at u = i having difference
`−2i H_0`; knots give `V_K(−1)=Δ_K(−1)`.

With `ω=exp(2πi/3)` and `u₃=exp(πi/3)`, the algebraic character χ_m : TL_m(ℂ,1) →ₐ[ℂ] ℂ,
e_j ↦ 1 (m = 0, 1 included), satisfies the Markov axioms, hence is T_m by TemperleyLieb
Layer 4's uniqueness, and sends the normalized braid unit u₃((1+ω)e_j − 1) and its inverse
to −1; so a braid on m ≥ 1 strands of exponent sum e, closing to L with μ components, has
`H_L(u₃)=(−1)^(m−1+e)=(−1)^(μ−1)`, and `V_K(ω)=1` for every knot.

Hence, with `D(t)=(1−t³)(1−t)=(t−1)²Φ₃(t)`, there is a unique W_K ∈ ℤ[t,t⁻¹] with
`D W_K=1−V_K`, obtained by monic division by `(t−1)²` (value and derivative at 1) and by
Φ₃ after clearing negative powers ((t − 1) and Φ₃ are not comaximal over ℤ, `Φ₃(1)=3`),
with `W_(mirror K)(t)=t^(−4) W_K(t⁻¹)` and `W_(K#J)=W_K+W_J−D W_K W_J`. Since D(i) = 2,
`W_K(i)` is the 0/1 lift of Arf(K); and with `Δ_K(1)=1`, `Δ_K(−1)=1−4W_K(−1)`,
`W_K(−1)≡Arf(K) mod2` (via `ℤ[i]→𝔽₂`, `i↦1`), so `Δ_K(−1)≡1−4Arf(K) mod8`: the signed
value is 1 or 5 mod 8, unlike the unsigned criterion `±1` versus `±3`.

**Checks.**

- *Proper and improper values.* `V(i; u₄)` is `(−√2)^(μ−1)` for the `μ`-component unlink,
  `0` for the positive Hopf link (linking number `1`) and `+√2` for the positive `T(2, 4)`,
  of Arf `1` (by evaluation).
- *Jones–Conway sign.* The positive Hopf link has `H(i) = −2i` while `∇(2i) = 2i` (by
  evaluation).
- *Derivative variable.* The positive Hopf link has `H(u) = −u − u⁵`, so `(∂H)(1) = −6 =
  3·(−2)·1` with `λ = 1`, whereas differentiating `−t^(1/2) − t^(5/2)` in `t` gives `−3` at
  `t = 1`: the formula holds for `∂ = d/du` only (by evaluation).
- *W of the trefoil.* `W_unknot = 0` and `W_(right trefoil) = 1`:
  `(1 − t³)(1 − t) = 1 − V` for `V = t + t³ − t⁴` (by evaluation).

*Needs:* the Seifert-surface/quadratic dictionary, finite common stabilizations, Layer
4.3.1's finite quadratic Arf classification, native `IntegralSquareMatrix.SEquivalent`,
`Matrix.toQuadraticForm'`, `QuadraticMap.polarBilin`, `.radical` and `.lift`, native
finite-quadratic-module Gauss sums, native Jones/bracket, geometric Markov/closure
comparisons, the Clifford model above, and Mathlib finite sums, monic polynomial division,
Laurent evaluation and complex roots, with its quadratic-form radical and lift API
(`Mathlib/LinearAlgebra/QuadraticForm/Radical.lean`). Jones 1985's knot claims and
link-value remark are compared with [Murakami, *A recursive calculation of the Arf
invariant of a link*
(1986)](https://www.jstage.jst.go.jp/article/jmath1948/38/2/38_2_335/_pdf), with the
square-root branch converted by the component-parity law.
### 4.5.4 Universal bracket coefficients and writhe normalization

Work in the native `TauCeti.TemperleyLieb R c n` over every commutative ring R, with its
presented algebra only. In the two-strand algebra let I=1 and E=e₀ (E²=cE), and let the native
`crossing` elements be `r₊=aI+bE` and `r₋=bI+aE`, the A-smoothing turning left off the
over-strand; state bit true is A.

- For all a, b, c ∈ R, r₊r₋=ab I+(a²+b²+abc)E, and r₊r₋=I ↔ ab=1 and a²+b²+abc=0. Necessity:
  native `twoStrandRep` (E ↦ `[[0,0],[1,c]]`, I ↦ identity) separates I and E over every R, with
  no nonzero-divisor hypothesis. Sufficiency and type III are native
  `crossing_mul_crossing_swap_eq_one_of_polynomial` and `crossing_braid`, compared with the
  native PD Reidemeister maps.

**Universal coefficient ring.** Let Q=ℤ[A,B,C]/(AB−1, A²+B²+ABC), a quotient of
`MvPolynomial (Fin 3) ℤ` (`Ideal.Quotient`). Construct the ring equivalence
`Q ≃+* LaurentPolynomial ℤ`, A↦T1, B↦T(−1), C↦−T2−T(−2), with computing rules, and prove that
ring maps Q→R correspond to units a∈Rˣ, with b=a⁻¹ and c=−a²−a⁻², naturally in R. So the open
type II relation forces the crossing coefficient to be a unit, and c need not be invertible.

**State sums and the trace normalization.** For a finite PD diagram D, a state s chooses the A-
or B-smoothing at each crossing, with counts α(s), β(s) and ℓ(s) the native `stateLoopCount`
(crossing-free circles included). Let `Z_D(a,b,c)=Σ_s a^α(s)b^β(s)c^ℓ(s)` on all diagrams and,
for nonempty D, the reduced bracket `S_D(a,b,c)=Σ_s a^α(s)b^β(s)c^(ℓ(s)−1)`. Prove ℓ(s)≥1 for
nonempty D, the local resolution laws, relabelling invariance, coefficient-map compatibility,
`Z_D=c·S_D` without dividing by c (μ≥1 crossing-free circles give c^μ and c^(μ−1); the empty
diagram has Z=1) and `S_D(a,a⁻¹,jonesDelta a)=D.kauffmanBracket a`, hence regular-isotopy
invariance from native type II/III invariance and the geometric Reidemeister comparison. For a
closed n-strand braid, n≥1, the native unnormalized Markov trace with q=a² and loop c=−(q+q⁻¹)
is Z of the realized closure, so the writhe-corrected Jones trace is c times the reduced
normalized bracket, as a polynomial identity valid also at c=0.

**Curls and the ambient invariant.** The curl factors `ac+b` and `bc+a` are −a³ and −a⁻³ in Q;
prove their comparison with native signed kink insertion (writhe change ±1). For nonempty
oriented D prove that `X_D=((-a³)^(-w(D)))·S_D` equals native `normalizedKauffmanBracket` and is
an ambient-isotopy invariant, and that mirror image acts by a↦a⁻¹. The comparison with native
Jones polynomials is the formal Laurent embedding sending u=t^(1/2) to A⁻², choosing no
fourth-root branch.

**Joint state counts.** Derive the Jones skein relation `t⁻¹V(L₊)−tV(L₋)+(t⁻¹/²−t¹/²)V(L₀)=0`
from the two local bracket resolutions and the writhe changes of the oriented triple
`L₊, L₋, L₀`: the local proof of 4.5's skein identity. For D:PDCode n define the joint state
counts `h_D(b,ℓ)=#{s:Fin n→Bool | #{i | s(i)=false}=b and D.stateLoopCount(s)=ℓ}` and prove
finite support, total 2^n, relabelling invariance, h_(mirror D)(b,ℓ)=h_D(n−b,ℓ) for b≤n (zero
outside 0≤b≤n) and, for nonempty realized D, `⟨D⟩=Σ_(b,ℓ) h_D(b,ℓ) A^(n−2b) δ^(ℓ−1)` with
`δ=−A²−A⁻²`. For a one-strand curl and for a two-crossing connector between two alternating
regions, prove for every compatible alternating filling a supported Reidemeister movie strictly
lowering the crossing count, with its raw curl factors and writhe changes; 4.8.1's adequacy and
minimality proof consumes the bracket theory independently of these reductions.

**Checks.**

- *Trefoil normalization.* Native `rightHandedTrefoilPDCode` has writhe +3, raw bracket
  `−A⁵−A⁻³+A⁻⁷` and Jones `t+t³−t⁴`; its mirror has h(0,3)=h(3,2)=1, h(1,2)=h(2,1)=3 (by evaluation).
- *Open versus closed.* Over ℤ, (a,b,c)=(1,0,1) has reduced bracket 1 on every nonempty closed
  diagram, yet r₊r₋=E≠I under `twoStrandRep` (by evaluation).
- *Characteristic two.* In `ZMod 2` with a=1 the loop value is 0, while the unknot has reduced
  bracket 1 and unnormalized trace 0 (by evaluation).

*Needs:* Layer 4.2 (realized diagrams, geometric Reidemeister comparison), Layer 4.5 (native
bracket and Jones conventions); Mathlib `MvPolynomial`, `Ideal.Quotient`, `LaurentPolynomial` and
units; native `TauCeti.Algebra.TemperleyLieb.Basic`, `TauCeti.KnotTheory.TemperleyLieb`, PD state
counts, Kauffman brackets, signed kink and type II/III APIs. Follow
[Kauffman, *State models and the Jones polynomial*, §2, Lemmas 2.3–2.4, Propositions 2.5 and 2.7, Theorems 2.6 and 2.8](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/kauffmanjones.pdf)
for the state model, the curl factor `−a³` (Proposition 2.5) and the regular-to-ambient
normalization.

### 4.5.5 Jones polynomials of 3₁, 4₁, 9₄₁ and 9₄₂ and two excluded candidates

Polynomials here are in the integral knot variable t of 4.5.3 (t^k is T(2k) in the native
half-variable). The candidates excluded below are

```text
E(t)=−t⁻¹³+t⁻¹²−t⁻¹¹+t⁻¹⁰−t⁻⁹+t⁻⁸−t⁻⁷+t⁻⁶+t⁻⁴,
R_c(t)=−t⁻⁵+2t⁻⁴−2t⁻³+3t⁻²−3t⁻¹+3+c t+t²     (c ∈ ℤ).
```

**The two existing models.** V_3₁=−t⁻⁴+t⁻³+t⁻¹ is the value of the negative trefoil, the mirror
of 4.5's positive model (the label 3₁ does not choose a handedness), and V_4₁=t⁻²−t⁻¹+1−t+t²
that of 4.4.2's word `(σ₁σ₂⁻¹)²`; both are Checks of 4.5.

**A diagram of 9₄₁.** Let K₄₁ be the native oriented closure of the five-strand word
b41=[−1,−1,−2,1,3,2,2,−4,−3,2,−3,−4] (displayed generator j is native index j−1), a knot of
writhe −2.

**Hypothesis 4.5.5a (a diagram of 9₄₁).** K₄₁ is isotopic, after the single mirror choice
induced by the conventions, to the realization of the [Knot Atlas 9₄₁](https://katlas.org/wiki/9_41)
diagram with DT code `[6,10,14,12,16,2,18,4,8]`.

Prove that E, the Jones polynomial of T(2,−9) (the knot 9₁ or its mirror, in 4.8.2/4.11's
signed model), is not that of 9₄₁ in either mirror image, even up to a monomial unit ±t^k:
assuming Hypothesis 4.5.5a, 9₄₁ has F or F(t⁻¹) (Check below), of modulus 49 at t=−1, where
±t^k E has modulus 9. Also c(K₄₁)=9, by 4.8's span bound and the nine-crossing diagram, and
F≠F(t⁻¹) makes K₄₁ chiral.

**The 9₄₂ comparison for every value of c.** Prove that for every c∈ℤ, R_c is not the Jones
polynomial of 9₄₂ in either mirror convention, even up to a monomial unit: assuming Hypothesis
4.6.2a, 9₄₂ has the mirror-invariant G(t)=t³−t²+t−1+t⁻¹−t⁻²+t⁻³ of 4.6.2, of span 6, while R_c
has span 7 for every c. The knot tests V(1)=1 and V′(1)=0 force c=−2 and then hold, so they do
not exclude R_(−2).

**The evaluation and alternating annotations.** For every tame knot K prove `V_K(−1)=Δ_K(−1)`,
hence `|V_K(−1)|=det K`, natural and compatible with mirror, reversal and connected sum. At s=i
in the native half-variable (not s=−1; both roots agree by even support), 4.4.5's Jones
specialization has HOMFLY parameters a=−1 and z=2i; 4.6's knot parity identifies H(−1,2i) with
H(1,2i), which the Conway/Seifert comparison makes Δ(−1), through complex coefficient maps and
their integral descent.

**Hypothesis 4.5.5b (crossing number of 9₄₂).** The knot 9₄₂ has no diagram with at most eight
crossings (tabulated knowledge).

Prove that 9₄₂ is not an alternating knot: assuming Hypotheses 4.6.2a and 4.5.5b, a reduced
alternating diagram has span equal to its crossing number (4.8), so it would have six crossings,
the span of G.

**Checks.**

- *Jones polynomial of K₄₁.* The native state sum of b41's closure is
  F(t)=−t³+3t²−5t+8−8t⁻¹+8t⁻²−7t⁻³+5t⁻⁴−3t⁻⁵+t⁻⁶, with F(1)=1 and F(−1)=49 (by evaluation).
- *The candidates.* E is the Jones polynomial of the closure of σ₁⁻⁹, with E(−1)=9; R_c has
  support [−5,2], R_c(1)=3+c, R_c′(1)=2+c and R_c(−1)=15−c (by evaluation).
- *T(2, −9).* `E(−1) = 9` and `E` has span `9` with support `[−13, −4]`; no monomial unit `±t^k`
  carries it to `F`, since `9 ≠ 49` (by evaluation).

*Needs:* 4.2/4.2.5's native realized word/PD/DT/Gauss and finite move comparisons; 4.4.2's
figure-eight and 4.5's trefoil models; 4.5.3's integral knot-variable extraction; 4.5's state
sum, mirror and support APIs; 4.6.2's diagram of 9₄₂; for the signed evaluation, 4.4.5 and 4.6's
polynomial/parity comparison; for the alternating and minimality conclusions, 4.8, 4.8.2 and
4.10–4.11.

### 4.5.6 Positive Jones traces, kernels and braid-index criteria

Develop Jones's trace construction and his Theorems 8–11 (Jones, *A polynomial invariant for
knots via von Neumann algebras*, Bull. Amer. Math. Soc. 12 (1985), p. 106) on the native TL
algebra and realized oriented braid closures, with TemperleyLieb Layers 4–5 for the diagram
basis, base change, algebraic Markov uniqueness and generic blocks, and Subfactors §§3.1–3.3 for
the analytic adjoint, Jones's positivity theorem, the trace radical and the positive Jones
quotients.

**Projection and native normalizations.** For u≠0, t=u², δ=u+u⁻¹ and native generators E_i
(E_i²=δE_i; p_i=E_i/δ when δ≠0), construct the braid homomorphism ρ_u:B_n→(TL_n(ℂ,δ))ˣ,
`g_i=u((1+t)p_i−1)=u²E_i−u`, `g_i⁻¹=u⁻²E_i−u⁻¹` (also at δ=0), compatible with strand
inclusion. With T_n the native `markovTrace` at quantum parameter −u, T_n(1)=δ^n, and
tr_n=δ^(−n)T_n, prove tr_n(g_i)=tr_n(g_i⁻¹)=−1/δ and, for a²=−u⁻¹, jonesDelta a=δ and
jonesUnit(a,i)=(−a/u)g_i against native `TemperleyLieb.jones a`. For every b∈B_n, n≥1, prove over
the Laurent ring the closure formula `H_cl(b)(u)=(-δ)^(n−1) tr_n(ρ_u(b))`, H being 4.5.3's
half-variable Jones polynomial, by the native bracket trace and writhe comparison (or by
stabilization, conjugation and the geometric Markov theorem). Jones's A_r is the (r+1)-strand
algebra.

**Positive analytic comparison.** For real t>0 take u=√t>0, so δ=u+u⁻¹≥2; for k≥3 take
u=exp(πi/k), t=exp(2πi/k), δ=2cos(π/k), the other roots transported by the sign isomorphism
`u ↦ −u`. At these δ, with the native trace at q=−u and Subfactors §3.1's adjoint fixing every
E_i, consume Jones's positivity theorem `markovTrace_nonneg_iff` (Subfactors §3.2): the form
(x,y)↦tr_n(xy*) on TL_n(ℂ,δ) is positive semidefinite; its radical R_n is the trace radical, a
two-sided ideal (§3.2); the quotient Q_n=TL_n/R_n is a finite direct sum of matrix algebras on
which tr_n descends to a faithful normalized positive trace, and R_n=0 for δ≥2, so for real t>0
the form is positive definite on all of TL_n (§3.3) (Jones, *Index for subfactors*, Invent. Math.
72 (1983), §§4–5; Wenzl, *Hecke algebras of type Aₙ and subfactors*, Invent. Math. 92 (1988), §2;
Goodman–de la Harpe–Jones, *Coxeter Graphs and Towers of Algebras*, Chapter 2). Prove that
R_n=0 also at δ=2cos(π/k) when k≥n+2: every n-step path from 0 on the half-line stays among the
vertices 0,…,n of A_(k−1), so the path algebra of Subfactors §3.3 has dimension
Σ_t #paths(n,t)²=catalan n, the dimension of TL_n (TemperleyLieb Layer 4), and π_n is injective.
Construct the quotient braid map to Q_n.

**Braid-index prefix.** For every nonempty tame oriented link L, the set of positive strand
counts of realized braid closures isotopic to L is nonempty (4.2's Alexander theorem); define
braidIndex(L) as its least element, with a minimizing braid. Prove positivity, the upper bound by
every braid representative, componentCount(L)≤braidIndex(L), invariance under oriented ambient
isotopy and component relabelling, and the bijections of representatives under simultaneous
reversal of all orientations and under global reflection. The empty link has the separate value
0 from the zero-strand braid. Layer 4.8 consumes this minimum and its API.

**Rigidity and sharp braid-index bounds.** At the roots of unity the quotient braid map is
unitary. For every unitary U in a finite direct sum of matrix algebras with faithful normalized
positive trace prove `|tr U|≤1`, `tr U=1 ↔ U=1` and `|tr U|=1 ↔ ∃λ∈ℂ, |λ|=1 and U=λ·1`, with
the weighted-block formulas, by faithfulness on (U−λ1)†(U−λ1) with λ=tr U, the same λ serving
every block of positive weight. Deduce Jones's Theorem 10,
`H_cl(b)(exp(πi/k))=(-2cos(π/k))^(n−1) ↔ ρ_u(b)=1 in Q_n`, and for k>3 (δ>1) the braid-index
criterion: if ρ_u(b)=λ1 with |λ|=1, the realized closure has braid index exactly n, for every
component count and n=1 included, since an m-strand representative has Jones modulus at most
δ^(m−1) and this one has δ^(n−1). Identity braids make the bound sharp at every k>3.

**A precise common-exponent corollary.** For a syllable word b=∏_j σ_(i_j)^(e_j) on n≥1
strands, any common divisor d>1 of the integer exponents e_j forces the closure to have braid
index n (empty words and zero exponents included). For even d the closure has n components. For
odd d take k=2d, u=exp(πi/(2d)): both eigenvalues u³ and −u of g_i have d-th power −i, so
g_i^d=−i·1 in the positive quotient, also for negative exponents, and ρ_u(b) is a scalar
unitary. The divisor is of the
displayed syllable exponents, not an invariant of the braid; Jones's Corollary 9 uses his own
exponent convention.

**Transcendental parameters.** Construct the generic algebra TL_n(ℚ(u),u+u⁻¹) with braid map
`g_i=u²E_i−u` on the flat diagram basis; for every transcendental u₀∈ℂ evaluation at u₀ is
defined and injective, and identifies the specialized braid map with the native complex one, so
generic and specialized braid kernels agree. For n≥1 prove
`H_cl(b)(u₀)=(-(u₀+u₀⁻¹))^(n−1) ↔ ρ_(u₀)(b)=1`: lift the trace equality to ℚ(u) and specialize at
infinitely many u_k=exp(πi/k), k>n+1, where the positive trace is faithful on all of TL_n, so
unitarity and trace 1 give ρ_(u_k)(b)=1 and every flat-basis coefficient of ρ_u(b)−1 vanishes. A
transcendental t has transcendental square roots, giving Jones's Corollary 11. Jones's question
whether these kernels are trivial is open.

*Needs:* 4.2's geometric braid closure, Alexander/Markov theorems and endpoint/component
comparison; 4.5's geometric Jones invariant; TemperleyLieb Layers 4–5; Subfactors §3.1 (the
adjoint), §3.2 (`markovTrace_nonneg_iff`, the trace radical) and §3.3 (path models, `Q_n`, `R_n = 0`
for `δ ≥ 2`); native `BraidGroup`, `TemperleyLieb` and `markovTrace`; Mathlib matrices, positive
forms, rational functions and transcendence.

**Checks.**

- *Unlink normalization.* The identity braid on n strands has closure value (−δ)^(n−1), the
  n-component unlink's; T_n(1)=1 instead of δ^n would fail already at n=1 (by evaluation).
- *Level three.* At k=3 (δ=1), σ₁σ₂ on three strands has quotient image 1 and unknot closure, of
  braid index 1, not 3: the criterion needs δ>1 (by evaluation).
- *One generator.* `tr_n(g_i) = u²·(1/δ) − u = −1/δ` since `uδ = u² + 1`, and the closure of `σ₁`
  on two strands gives `(−δ)·(−1/δ) = 1`, the unknot's value (by evaluation).
- *Faithfulness threshold.* At `δ = √2` (`k = 4`) the path algebra on `A_3` has dimension
  `1 + 1 = 2 = dim TL_2` at `n = 2`, so `R_2 = 0`, but `2² = 4 < 5 = dim TL_3` at `n = 3`, so
  `R_3 ≠ 0`: the bound `k ≥ n + 2` cannot be lowered to `k ≥ n + 1` (by evaluation).

### 4.5.7 Nonexchange links and the five-strand cubic quotient

Give Jones's Theorem 7 (Bull. Amer. Math. Soc. 12 (1985), p. 106) and finite-group examples,
with the conventions of 4.5.6.

**All-strand geometric family.** For n≥1, m=n+1, c_m=σ₁⋯σ_(m−1) and p≥1, prove that
β_(n,p)=c_m^(mp) has trivial permutation and a closure of m components with every pairwise
linking number p (each full twist c_m^m crosses every pair of strands twice positively), from
4.2's strand/component dictionary and signed-crossing formula; the absolute linking multisets
distinguish all p, also after reorientation or reflection. For U,V∈B_n ⊂ B_(n+1), if the closure
of Uσ_n⁻¹Vσ_n has n+1 components, those starting at the last two endpoints meet only at the two
displayed crossings and have linking number 0. Hence the β_(n,p) closures are infinitely many
pairwise inequivalent links, none isotopic to an exchange-shaped closure, even unoriented.

For the four-strand word w=σ₁⁻¹σ₂σ₃, construct an explicit finite E⊂ℤ such that for every p∉E
the closure of w^p is inequivalent to every closure of Uσ₃⁻¹Vσ₃, U,V∈B₃, by a Jones/trace
obstruction with an effective bound, stating how mirror and inversion transport the signed
powers and how closed-braid equivalence compares with realized-link equivalence.

**The full cubic group and its projective quotient.** Let ζ=exp(πi/3), u=exp(πi/6), and take the
native four-dimensional reduced Burau representation of B₅ at ζ in the column basis of 4.5.1;
each generator has eigenvalues 1 and −ζ and cube 1. Let `C₅=B₅/⟨⟨σ_i³ : i=1,…,4⟩⟩` (native normal
closure and quotient). Prove that Burau descends to a faithful representation of C₅, that C₅ is
the complex reflection group G₃₂ of order 155520 with scalar centre of order 6, and that its
projective quotient is the simple group PSp₄(𝔽₃) of order 25920, by explicit generator matrices,
forward and inverse group maps and the normal-closure kernel equality; this is the cubic case of
[Marin, Introduction and Theorem 1.2](https://arxiv.org/html/1110.6621#S1).

Compare with 4.5.6's quotient Q_5 at k=6: h_i=(−u⁻¹)g_i=1−(1+ζ)p_i has h_i³=1, so h factors
through C₅; give the intertwiner of its four-dimensional block with native Burau, the comparison
with its five-dimensional block, and ρ_u(b)=(-u)^e h(b) for every braid b of exponent sum e. So a
Burau kernel witness has h(b)=1 and lies in the Jones kernel exactly when (-u)^e=1, while a
projective witness is central in C₅ and meets 4.5.6's kernel criterion only if every block is
the identity, its modulus criterion only if all blocks share one scalar.

**Checks.**

- *Full twist.* z=(σ₁σ₂σ₃σ₄)^5 has Burau image ζ^5 I₄ but full Jones image (−I₄,I₅), so
  tr ρ_u(z)=(−4+5)/9 and no criterion of 4.5.6 applies, while z² has Jones image 1 (by evaluation).
- *A cubic knot.* `b = σ₁³σ₂³σ₃³σ₄³` has a five-cycle permutation and `ρ_u(b) = 1`, each
  generator image cubing to `−i`, so by 4.5.6 its knot closure has braid index 5 (by evaluation).
- *Group orders.* In `C₅` each generator has order `3`, its Burau eigenvalues `1` and `−ζ`
  satisfying `(−ζ)³ = −ζ³ = 1`; the orders `155520 = 2⁷·3⁵·5` and `25920 = 155520/6` are those of
  `G₃₂` and `PSp₄(𝔽₃)` (by evaluation).

*Needs:* 4.2's native/geometric braid and linking interfaces; 4.5.1's reduced Burau convention
and 4.5.6's trace/minimality comparisons and positive quotient at k=6; Mathlib presented groups,
normal closures, finite matrices and symplectic/projective groups. No generic cubic Hecke algebra
or positive Jones-quotient owner is introduced.

### 4.6 The HOMFLY and Kauffman polynomials

Prove existence and uniqueness of the HOMFLY polynomial `P_L` of the Conventions on nonempty
oriented links, by the constructions of 4.6.3, and the specializations
`Δ_L(t) = P_L(1, −1, t⁻¹ᐟ² − t¹ᐟ²)` and `V_L(t) = P_L(t⁻¹, −t, t⁻¹ᐟ² − t¹ᐟ²)`. In the
two-variable convention `a P(L₊) − a⁻¹ P(L₋) = z P(L₀)` set `a = v⁻¹`, with coefficient ring
`ℤ[a,a⁻¹,z,z⁻¹]` represented by an iterated `LaurentPolynomial`.

The HOMFLY coefficient substitution, for every field `K`, indeterminate `q` and integer `N ≥ 0`,
applies `LaurentPolynomial.eval₂` twice from this ring to `K(q)`, sending `a,a⁻¹,z,z⁻¹` to
`q^N,q^(−N),q−q⁻¹,q/(q²−1)` (units, as `q` and `q²−1` are nonzero over every field). It is the
unique ring homomorphism with these generator images and commutes with extending any field
homomorphism `K → L` to rational functions. For the `sl_N` comparison, consume the algebraic
Ocneanu braid invariant and its weighted-Jimbo comparison from TypeAHeckeAlgebras H1, H2, with
their strand and writhe normalizations (Lickorish, Chapter 16, Proposition 16.10), and prove: for
`N ≥ 1` and a braid `β` on `b ≥ 1` strands with closure `L`, the substituted `P_L` is
`q^(−N w(β)) · tr_N(β) / [N]_q`, with `w` the writhe, `tr_N` the weighted Jimbo trace and
`[N]_q = Σ_{i=0}^{N−1} q^(N−1−2i)`, nonzero over every field.

**The native substitution and the diagram polynomial.** With coefficients in the field `K` the
substitution `a = q^N`, `z = q − q⁻¹` is native, `TauCeti.KnotTheory.homflySpecialization` on
`K[a, a⁻¹, z, z⁻¹]` (`z` the inner and `a` the outer Laurent variable), and the substitution above
is this native map composed with the coefficient map `ℤ → K`. Consume its uniqueness: a
two-variable Laurent polynomial over `K` is determined by its substitutions for any infinite set
of ranks `N`, in particular for all `N ≥ 1`
(`TauCeti.KnotTheory.homflySpecialization_injective_of_infinite`,
`TauCeti.KnotTheory.homflySpecialization_jointly_injective`). On planar oriented PD-codes, `P` is
the function determined by `P(unknot) = 1` and the skein relation `a P(L₊) − a⁻¹ P(L₋) = z P(L₀)`;
4.6.3's constructions prove its existence and Reidemeister invariance
(Freyd–Yetter–Hoste–Lickorish–Millett–Ocneanu, *A new polynomial invariant of knots and links*,
Bull. AMS 12 (1985); Lickorish, Chapter 15), so by 4.2 it is an invariant of smooth links. In
this convention the two specializations above are `a = 1`, `z = t^{1/2} − t^{−1/2}`, the
Conway-normalised Alexander polynomial, and `a = t⁻¹`, `z = t^{1/2} − t^{−1/2}`, the Jones
polynomial (Lickorish, Chapter 15).

Kauffman's two-variable F and absolute polynomial Q are constructed in Layer 4.6.1.

- `P_{L̄}(x, y, z) = P_L(y, x, z)`; `P_{L # J} = P_L P_J`; `P` of a split union is `−((x + y)/z)`
  times the product, and `P` of the `n`-component unlink is `(−(x + y)/z)^{n − 1}`.
- Component detection: `μ(L) ≥ 2 ⟹ P_L ≠ 1`, since `V_L(1) = (−2)^{μ−1} ≠ 1`.
- Mutation preserves `P` and `F` (Layer 6.3); so, assuming Hypothesis 6.3, the
  Kinoshita–Terasaka and Conway knots share both, and they are told apart by smooth
  concordance (Layer 6.3, through Piccirillo's theorem).
- Reversing every component leaves `P` unchanged: the reversed skein triple has the same crossing
  signs, so uniqueness applies. So for a knot `P`, like `Δ` and `V`, does not depend on the
  orientation.

**Checks.**
- *Trefoil.* In the variables `v⁻¹ P(L₊) − v P(L₋) = z P(L₀)` the right-handed trefoil has
  `P = 2v² − v⁴ + v² z²`, which at `v = 1`, `z = t¹ᐟ² − t⁻¹ᐟ²` is `t − 1 + t⁻¹` (by evaluation).
- *Sign of the Alexander specialization.* The positive Hopf link has `P_H(1, −1, w) = −w`, so
  `Δ_H = t¹ᐟ² − t⁻¹ᐟ²`, as 4.4's Conway relation gives, not `−Δ_H` (by evaluation).
- *Normalized trace.* At `N=2`, `q=2` over `ℚ`, `[2]_q=5/2`, the one-crossing two-strand weighted
  trace is 10 and the normalized closure `4⁻¹·10/(5/2)=1` is the unknot's (by evaluation).
- *Hopf link by the skein.* In the convention `a P(L₊) − a⁻¹ P(L₋) = z P(L₀)` with `P = 1` on the
  unknot, a one-crossing kink gives `P = (a − a⁻¹)z⁻¹` for the two-component unlink; switching one
  crossing of the positive Hopf link gives that unlink and smoothing it the unknot, so
  `P_H = a⁻¹z + (a⁻¹ − a⁻³)z⁻¹`. At `a = 1`, `z = t^{1/2} − t^{−1/2}` this is
  `Δ = t^{1/2} − t^{−1/2}`, and at `a = t⁻¹` it is `−t^{1/2} − t^{5/2}`, the Jones polynomial of
  the positive Hopf link in 4.5 (by evaluation).

*Needs:* Layer 4.2 for the diagram-skein construction; Layers 4.4–4.4.5 and 4.5 for the
Alexander/Jones comparisons after it; TypeAHeckeAlgebras H1, H2 for the trace comparison; Mathlib
`LaurentPolynomial.eval₂`, `LaurentPolynomial.eval₂_T`, `LaurentPolynomial.eval₂_C`, `RatFunc`.
Tau Ceti `TauCeti.KnotTheory.homflySpecialization` with its two injectivity lemmas, and the Jimbo
representation `TauCeti.KnotTheory.jimbo` with its weighted trace
`TauCeti.KnotTheory.jimboWeightedTrace` (`tr_N`).

### 4.6.1 Kauffman's regular-isotopy polynomial and absolute Q

Work on nonempty realized diagrams, crossing-free circles included, with Layer 4.2's planar
PD/outer-face carrier and geometric Reidemeister theorem, over
`R=LaurentPolynomial (LaurentPolynomial ℤ)` (outer variable a, inner x), with its coefficient,
support and monomial API and evaluation into any commutative ring at chosen units, reusing
native Laurent evaluation and inversion. Skein and curl conventions are those of Kauffman's
[regular-isotopy polynomial](https://homepages.math.uic.edu/~kauffman/IRH.pdf), not the
Dubrovnik ones.

**Regular-isotopy construction.** Construct the unique regular-isotopy invariant Λ of
unoriented diagrams with `Λ(unknot)=1`, `Λ(D₊)+Λ(D₋)=x(Λ(D₀)+Λ(D∞))` (D₊, D₋ differ at one
crossing and D₀, D∞ are its two smoothings) and an attached positive curl (writhe change +1)
multiplying Λ by a, a negative one by a⁻¹; a detached circle then multiplies Λ by
`d=(a+a⁻¹)x⁻¹−1`. Route: a terminating skein recursion on ordered, oriented, basepointed
diagrams by the lexicographic measure (crossing count, bad crossings), with descending leaves
evaluated by an unlink reduction recording curl factors; prove independence of these auxiliary
choices and of resolution order, relabelling and plane-isotopy invariance, and invariance under
every RII/RIII local model.

**Writhe correction and Q.** For an oriented diagram D let `F_D=a^(−w(D))Λ_|D|`; prove its
invariance under oriented ambient isotopy and, for arbitrary orientations on the skein
quadruple, `a^w₊ F₊ + a^w₋ F₋ = x(a^w₀ F₀ + a^w∞ F∞)` with each writhe for its chosen orientation.
With `ev₁:R→+*ℤ[x^{±1}]`, `a↦1,x↦x`, let `Q_L=ev₁(F_L)`; prove `ev₁(Λ)=ev₁(F)`, the unoriented
skein relation, `Q(unknot)=1` and uniqueness of Q. For a set S of ordered components let
`C_S=Σ_{i∈S,j∉S}lk(L_i,L_j)`; reversing exactly S changes writhe by `−4C_S`, so
`F_(L^S)=a^(4C_S)F_L` and Q is independent of orientations. Reflection inverts a and fixes x,
`Λ_mirror(a,x)=Λ(a⁻¹,x)` and likewise for F, so Q is mirror invariant. Layer 4.5's Jones
component-reversal factor agrees after the comparison below.

**Unlinks, joins and examples.** For μ≥1 prove `Λ(U_μ)=F(U_μ)=d^(μ−1)` and
`Q(U_μ)=(2x⁻¹−1)^(μ−1)`, the split-union laws for nonempty factors (one factor d for Λ and F,
`2x⁻¹−1` for Q), and multiplicativity of standard component connected sums along the untwisted
oriented band, independent of the standard joining data, with component count `μ(L)+μ(J)−1`.
For the closure of σ₁ⁿ with regular polynomial Λ_n prove Λ_0=d, Λ_1=a and
`Λ_n+Λ_(n−2)=x(Λ_(n−1)+a^(−(n−1)))` for n≥2, the turnback smoothing being an unknot with n−1
negative curls by a finite cup/cap isotopy; negative powers follow by reflection.

**Jones comparison with denominators.** The coefficient map `a↦−A³,x↦A+A⁻¹` into native
`RatFunc ℚ`, built by two native Laurent evaluations (both images nonzero, with explicit
inverses; `A+A⁻¹` is not a unit of the integer Laurent ring), sends d to `−A²−A⁻²`, Λ to the
native unknot-normalized `TauCeti.PDCode.kauffmanBracket` and F to
`TauCeti.OrientedPDCode.normalizedKauffmanBracket`, by the skein/curl laws and uniqueness; these
values lie in the integer Laurent subring, and `t=A⁻⁴` (`t¹ᐟ²=A⁻²`) gives the native Jones
polynomial.

**Checks.**

- *F is not a function of P.* The knots 8₈ and the mirror of 10₁₂₉, as in
  [Lickorish–Millett, Example 16](https://web.math.ucsb.edu/~millett/Papers/1987Millett9LickorishTopology.pdf),
  have equal P in 4.6's convention and different Q; Q being mirror invariant, the mirror choice
  does not matter. A construction of F that factored through P would identify them (by
  evaluation).
- *P is not a function of F.* The alternating 11-crossing knots numbered 255 and 257 in Conway's
  enumeration, as named in [Ng, §8.6](https://sites.math.duke.edu/~ng/math/papers/knotI.pdf),
  have equal F and different P, Conway and normalized Alexander polynomials; a construction of
  P that factored through F would identify them (by evaluation).

- *Right-handed trefoil.* `F=(a⁻²+a⁻⁴)x²+(a⁻³+a⁻⁵)x−2a⁻²−a⁻⁴` and `Q=2x²+2x−3`, and the Jones
  map sends F to the normalized bracket A⁻⁴+A⁻¹²−A⁻¹⁶ (by evaluation).
- *Hopf mirror.* The positive Hopf link has `F=(a⁻¹+a⁻³)(x−x⁻¹)+a⁻²`; its mirror has F equal to
  `a⁴F_Hopf`, as reversing one component of linking number 1 predicts (by evaluation).

*Needs:* Layer 4.2 (realized planar diagrams and Reidemeister), Layer 4.3 (oriented linking),
Layer 4.5 (native bracket/Jones), Layer 4.6 (HOMFLY and its mirror convention); Mathlib
`LaurentPolynomial.eval₂`, `LaurentPolynomial.invert`, `RatFunc`; Tau Ceti `TauCeti.PDCode`,
`TauCeti.OrientedPDCode` and their native bracket, writhe and normalized bracket APIs.

### 4.6.2 Mirror-symmetric polynomials and the chirality of 9₄₂

Prove that a tame knot with nonzero classical signature is not equivalent to its mirror by an
orientation-preserving ambient isotopy, even after reversing its orientation, from 6.2's
signature invariance, mirror negation and orientation-reversal invariance (reflection of S³ and
reversal of S¹ are distinct operations). Mirror symmetry of a polynomial is necessary for
amphichirality but not sufficient, as the following knot shows. Let K be the native oriented
closure of the four-strand word b=[1,1,1,−2,−1,−1,3,−2,3] (displayed generator j is native
index j−1), a knot.

**Hypothesis 4.6.2a (a diagram of 9₄₂).** K is isotopic, after the single global mirror choice
induced by the conventions, to the realization of the
[Knot Atlas 9₄₂ input](https://katlas.org/wiki/9_42) diagram with DT word
`[4,8,10,−14,2,−16,−18,−6,−12]`.

**An infinite chiral family with mirror-symmetric polynomials.** Let J be a knot whose HOMFLY
polynomial is mirror symmetric (`P_J(x, y, z) = P_J(y, x, z)` in 4.6's convention) and whose
signature is nonzero, and for n ≥ 1 let J_n be the n-fold connected sum of J, with marked sum
balls and coherent orientations. Prove σ(J_n) = nσ(J) while the HOMFLY, Alexander and Jones
polynomials of J_n are the nth powers of J's and mirror symmetric; so every J_n is chiral and the
J_n are pairwise distinct even up to reflection and orientation reversal, by |σ|. The signature
crossing-change bound gives `u(J_n) ≥ n|σ(J)|/2` and `d(J_n, mirror J_n) ≥ n|σ(J)|`, with no
unknotting-number additivity assumed. By the Checks, K is such a knot with σ(K) = −2, so
`u(K_n) ≥ n` and `d(K_n, mirror K_n) ≥ 2n`; assuming Hypothesis 4.6.2a, the knot 9₄₂ is chiral
even as an unoriented knot.

**Checks.**

- *Signature of K.* 4.3.5 applied to b gives a connected genus-three surface of four discs and
  nine bands with one boundary component; its six loops (four between the first two discs, one
  each between the second and third and the third and fourth) have self-pairings −1, −1, 0, 1, 1,
  −1 from the band signs, and their intersection graph is a tree, so `det(V − Vᵀ) = 1` and
  `σ(V + Vᵀ) = −2` whatever the signs of the off-diagonal entries; with the opposite
  Hopf-annulus sign `[+1]` of 4.3's push-off Check every self-pairing changes sign and the
  signature would be +2 (by evaluation).
- *HOMFLY polynomial of K.* 4.6's skein procedure on the realized knot K gives, in 4.4.5's ρ
  convention, `ρ_K(l,m)=(−2l⁻²−3−2l²)+(l⁻²+4+l²)m²−m⁴`, invariant under `l ↦ l⁻¹`, so
  `ρ_K = ρ_(mirror K)` although σ(K) ≠ 0 (by evaluation).
- *Specializations of ρ_K.* 4.4.5's maps send ρ_K to ∇_K=1−2z²−z⁴ and V_K=G of 4.5.5, the native
  state sum of b's closure, with `V(−1) = −7 = Δ(−1)` (by evaluation).

*Needs:* 4.2's realized words/PD/DT and local moves; 4.3.2 and 4.3.5's marked surfaces and
integral cycle matrices; 4.4–4.4.5, 4.5 and 4.6's polynomial constructions and coefficient
comparisons; 6.2's signature invariance and crossing bound; 4.8.3 for the Gordian-family bound.

### 4.6.3 Four constructions of the common HOMFLY invariant

Give the existence proofs of Freyd–Yetter, Hoste and Lickorish–Millett (*A new polynomial
invariant of knots and links*, printed pp. 241–244) and compare Ocneanu's algebraic
construction; all four produce the invariant P of nonempty oriented tame links of 4.6.

**The actual word-module quotient.** Let `R=ℤ[x±¹,y±¹,z±¹]` be
`LaurentPolynomial (LaurentPolynomial (LaurentPolynomial ℤ))` (outer x, middle y, inner z),
with unit inclusions, monomial dictionary, total-degree grading and iterated evaluations. For
n≥1 let W_n be native signed `BraidWord n` (displayed generator a is native index a−1),
`W=Σ n:ℕ+, BraidWord n`, `F=W→₀R` with basis `[u]_n`, and `e=[ ]₁` the empty one-strand word,
whose closure is the unknot. Let `N≤F` be the R-submodule spanned by exactly the vectors below
(same-stage contexts u, v; 1≤b<a<n where needed; ι the inclusion of W_n into W_(n+1); crossing
signs are units ε∈ℤˣ with opposite −ε) and `M=F⧸N`:

```text
A0  [u a(−a)v]_n = [uv]_n = [u(−a)a v]_n;
A1  [u a b v]_n = [u b a v]_n                 (b<a−1);
A2  [u a(a−1)a v]_n = [u(a−1)a(a−1)v]_n;
M1  [uv]_n = [vu]_n;
M2  [ιu n ιv]_(n+1) = [uv]_n = [ιu(−n)ιv]_(n+1);
P1  x[u a v]_n + y[u(−a)v]_n + z[uv]_n = 0.
```

Prove that `r↦r·[e]` induces an R-linear equivalence `R≃ₗ[R]M`. M1 and M2 relate whole typed
words only, so N is not a two-sided ideal and M carries no multiplication.

**All six directed rules.** Prove the equivalence by orienting the relations, with
`d(a,b)=a,(a−1),…,b` and `δ=−(x+y)z⁻¹`, into six rule families with differences in N: S1
commutes far generators (A1); S2 rewrites `[u d(a,b) a v]_n` to `[u(a−1)a d(a−1,b)v]_n` for
1≤b<a<n (A1, A2); S3 and S4 remove a negative letter and a square by solving P1 (with A0); S5
destabilizes `[ιu n ιv]_(n+1)` to `[uv]_n` (M2); and S6 sends `[ιw]_(n+1)` to `δ[w]_n` (P1 and both
signs of M2). Nothing divides by δ or x+y. A step replaces the whole coefficient of one support
word w, `f.erase w + f(w) • rhs(w)`; partial-coefficient rewriting admits cycles. The rules
terminate on the lexicographic measure (strand count, negative-letter count, length, positional
word code), lifted to multisets of support words, and are confluent by joining lemmas for the 21
unordered pairs of rule families, quantified over indices and contexts, and a local-to-global
comparison; the terminal forms are exactly the r·e. The resulting normalizer `T:F→ₗ[R]R`, built
without any prior link polynomial, has `T(e)=1` and `f−T(f)·e∈N` and vanishes on N, including
the full-word cyclicity `T([uv]_n)=T([vu]_n)` (a separate descending-positive-block argument);
so `ker(T)=N` and `q(f)=q(g)↔T(f)=T(g)`. Give effective coefficients as finite-support integer
exponent triples, base-change naturality to every commutative ring with unit images of x, y, z,
degree-zero values, and the scalar, unlink, skein, mirror, simultaneous-reversal and marked
connected-sum APIs, also when δ=0.

**From words to every geometric skein triple.** Prove that closure induces a linear equivalence
from M to the free R-module on nonempty oriented realized-link classes modulo the local skein
vectors, giving existence, normalization, skein relation and uniqueness of P without inverting
δ: A0/A1/A2 match the native Artin presentation, M1 closure and conjugation, and M2 the geometric
Markov stabilizations (4.2's realized closure, Artin, Alexander and geometric Markov theorems;
an algebraic `MarkovEquiv` is not the geometric theorem). This section owns the relative
simultaneous Alexander braiding: every realized oriented local skein triple can be braided
outside its fixed local box to a common n≥2 and u, v, i whose closures of `uσᵢv`, `uσᵢ⁻¹v`, `uv`
are the prescribed L₊, L₋, L₀. The four-ended skein module of 4.10 is not needed.

**Hoste's distinct diagram construction.** Construct P on ordered diagrams with one basepoint on
each component, in the descending convention of Freyd–Yetter–Hoste–Lickorish–Millett–Ocneanu
(pp. 242–243): traversing the components in order from the basepoints, each crossing is first
met as an overpass, and a bad crossing is one first met as an underpass. Resolve the first bad
crossing by switching and smoothing, with inherited order and basepoints, on the decreasing
measure (crossing number, bad count); descending diagrams are unlinks, valued δ^(μ−1). Prove
independence of resolution order, basepoints and component order, the skein identity, all
oriented Reidemeister moves and ambient descent.

**Lickorish–Millett's bounded induction.** Construct `P_n` on ordered basepointed oriented
diagrams with at most n crossings, in the opposite, ascending, convention: the first-under
ascending diagram αL gets its unlink value and the skein relations are solved backward along
the crossing changes. Prove independence of the change sequence, basepoints and component order,
invariance under local moves inside the cap, and `P_(n+1)|_(≤n)=P_n`; unrestricted Reidemeister
invariance follows at a cap at least the crossing counts of both sides, with no
crossing-nonincreasing path, so 4.2.6's hard-unknot obstruction is not bypassed. Compare Hoste,
Lickorish–Millett and FY by normalization and uniqueness: three routes with the common value P.

**Ocneanu's independent algebraic route.** Consume the TypeAHeckeAlgebras H1–H4a suppliers (the
type-A Hecke quotient and permutation basis, the split-semisimplicity criterion
`∏_(r=1)^n [r]_(q²)≠0` over fields, Specht/Young modules, tableau bases, branching and Wedderburn
decomposition, the generic q-Frobenius character formula, the normalized Ocneanu trace and its
character weights and weighted-Jimbo comparison); H2 constructs the trace, braid invariant and
both stabilization normalizations algebraically, independently of P. This roadmap owns the
geometric closure, descent and comparison with P, with exact writhe and strand factors and the
coefficient maps of 4.6, H2's sign conventions and the Conway/native-Jones dictionary of 4.4.5
and 4.5; units and root extensions are explicit, and singular specializations use an
algebraically proved regular expression agreeing with T, never an evaluation sending a Laurent
unit to 0. Mutation, two-tangle composition and their examples belong to 4.10 and 6.3.

**Checks.**

- *Whole-word relations.* In B₃ the closures of `a²b²` and `(ab)²` have three and one
  components, so a rule `[ab] = [ba]` applied inside words would identify them (by evaluation).
- *Unlink value.* S6 gives `[ι[ ]]₂ = δ[ ]₁`, so the two-component unlink has value
  `δ = −(x + y)z⁻¹`, at `x = l`, `y = l⁻¹`, `z = m` equal to `−(l + l⁻¹)/m` (by evaluation).
- *Trefoil descent.* For the standard trefoil diagram with a suitable basepoint exactly one
  crossing is bad in Hoste's descending convention; switching it gives an unknot diagram and
  smoothing it the Hopf link, so `P(3₁)` is determined by `P(unknot) = 1` and `P(Hopf)`.

*Needs:* 4.2's finite oriented diagrams and realized local moves, Artin/Alexander/geometric
Markov prefix and relative isotopy extension; native `BraidWord.toBraid`, `toBraid_surjective`,
`strandIncl`, `stabilize` and their closure comparisons; Mathlib `Finsupp`, submodule quotients,
iterated `LaurentPolynomial` and well-founded orders; TypeAHeckeAlgebras H1/H2 for the separate
algebraic trace comparison.
### 4.6.4 Polynomial unknot-detection propositions

On the nonempty tame oriented links in oriented `S³` of 4.2, up to orientation-preserving ambient
isotopy, with `U` the one-component oriented unknot, state, without asserting them, the propositions
below and their contrapositive forms with `L≇U`. Here `ρ_L(l,m)=P_L(l,l⁻¹,m)` is 4.4.5's
two-variable HOMFLY convention, with `lρ₊+l⁻¹ρ₋+mρ₀=0`, and equality to 1 is equality of formal
polynomials. J is the Jones unknot-detection question (Manolescu's survey, SIAM Review (2025), DOI
10.1137/25M1806703, §2), D its diagonal HOMFLY analogue, H the full-polynomial comparison. The empty
link is outside the domain.

```text
J: for every L, V_L=1 implies L≅U;
H: for every L, ρ_L(l,m)=1 implies L≅U;
D: for every L, ρ_L(s,s)=1 implies L≅U.
```

**The actual diagonal map.** It is the coefficient homomorphism from the iterated native
`LaurentPolynomial (LaurentPolynomial ℤ)` (outer variable l, inner m) to `LaurentPolynomial ℤ`,
built with `LaurentPolynomial.eval₂`, sending l and m to the unit s, so `l^a m^b ↦ s^(a+b)` and
`d_L(s)=ρ_L(s,s)`; it is not the minus-skein substitution `a=z`. It is compatible with the existing
coefficient changes, surjective (right inverse `f↦C(f)`) and not injective.

- J and H are equivalent to their knot-only versions, by 4.5's `V_L(1)=(−2)^(μ−1)` and 4.6's
  component detection. J ⇒ H: reduce to one component and apply 4.4.5's Jones coefficient map, whose
  phase `(−1)^(μ−1)` is then 1. D ⇒ H: apply the diagonal map. D keeps its multi-component branch,
  since component detection does not give d_L≠1 for μ≥2.
- The native form of J (for every `OrientedPDCode n` with `D.toPDCode.IsPlanar` and
  `D.componentCount=1`, `D.jonesPolynomial=1` implies Reidemeister equivalence to an oriented unknot
  code) is equivalent to J by 4.2's realization and geometric Reidemeister theorems; links use the
  full half-variable ring, and the knot parity theorem gives the ordinary one.
- `d_(mirror L)(s)=ρ_L(s⁻¹,s)`, which need not equal d_L(s⁻¹); J has 4.5's mirror and
  orientation-reversal transport.

**Proved classes and checks.** Jones detection holds for every alternating knot (reduce by 4.8.1's
nugatory removal; `span V = c` forces crossing number 0) and for every torus knot (4.11's closed
formula, with its unknot and mirror branches).

*Needs:* 4.2's realized oriented links and geometric Reidemeister theorem; 4.4.5's coefficient maps
between ρ and the native invariants; 4.5's Jones invariant, component evaluation and parity;
4.6/4.6.3's HOMFLY invariant; 4.8.1's alternating reduction and span theorem; 4.11's torus model and
closed Jones formula.

**Checks.**

- *Diagonal kernel.* `l − m` has diagonal `0` and `1 + l − m` has diagonal `1`; the substitution
  `m ↦ s⁻¹` would send `l − m` to `s − s⁻¹` and is not `d` (by evaluation).
- *Diagonal of a mirror.* The trefoil with `ρ = −2l² − l⁴ + l²m²` has diagonal `−2s²`, and its
  mirror has `1 − 2s⁻² − s⁻⁴`, not `d(s⁻¹) = −2s⁻²` (by evaluation).
- *Diagonal and components.* The two-component unlink has `ρ = −(l + l⁻¹)/m`, of diagonal
  `−1 − s⁻²`; the figure-eight, `ρ = −l⁻² − 1 − l² + m²`, has the same diagonal with one component,
  so `d` separates neither component count nor these two links, while `V(1) = (−2)^(μ−1)` does
  (by evaluation).

### 4.6.5 Four-ended HOMFLY skein modules and mutation

This is the relative construction for the mutation and two-tangle applications of 4.6.3, on 4.2's
relative realized oriented tangles and 4.10.1's four-port gluing, with cyclic port order NW, NE, SE,
SW; the closed-link invariant of 4.6 does not depend on it. Over `Λ=ℤ[l^{±1},m^{±1}]`, with
`μ=−(l+l⁻¹)/m`, the relative HOMFLY skein module of four-ended realized tangles with fixed collars
is the quotient by `lL₊+l⁻¹L₋+mL₀=0`, ambient Reidemeister moves and removal of a disjoint trivial
circle with factor μ; gluing and closure descend to it.

- *Alternating sector.* E (joining NW–NE and SW–SE) and F (joining NW–SW and NE–SE), oriented by the
  marking, form a Λ-basis; E is the unit, `F²=μF`, and for `S=aE+bF`, `T=cE+dF`

  ```
  ST=acE+(ad+bc+μbd)F,
  N(S)=μa+b,                 D(S)=a+μb,
  D(ST)=D(S)D(T),
  (1−μ²)N(ST)=N(S)D(T)+D(S)N(T)−μ[N(S)N(T)+D(S)D(T)],
  ```

with N and D the top/bottom and left/right closures. Independence: the closure matrix
`[[μ,1],[1,μ]]` has determinant μ²−1 ≠ 0, and its adjugate over the domain Λ avoids division. The
last identity is the composition formula of Freyd–Yetter–Hoste–Lickorish–Millett–Ocneanu, Bull.
Amer. Math. Soc. 12 (1985), p. 244. The algebra is native `TauCeti.TemperleyLieb Λ μ 2` (E ↦ 1, F ↦
`TemperleyLieb.e μ 0`, normal form by `e_mul_self` and `twoStrandRep` in
`TauCeti.Algebra.TemperleyLieb.Basic`).
- *Adjacent sector* (incoming NW, NE). The identity I and positive crossing B form a basis with
  `B²=−l⁻¹mB−l⁻²I`; braid closure τ and closure after B have matrix `[[μ,1],[1,−l⁻¹m−l⁻²μ]]` of
  determinant `l⁻²(1−μ²)`; the algebra is native `AdjoinRoot` of `X²+(m/l)X+l⁻²`.
- Cyclic rotations and simultaneous reversal identify every two-in/two-out marking with a sector.
  For every commutative ring R and Λ→R, base change is an isomorphism onto the skein quotient over
  R, which is therefore free of rank 2 even where the closure pairing is singular; after localizing
  at 1−μ², `a=(D−μN)/(1−μ²)` and `b=(N−μD)/(1−μ²)`, and over a specialized ring the closure kernel
  is exactly `{(a,−μa):(1−μ²)a=0}`.

**The marked half-turn action.** With ports NW=(−a,a,0), NE=(a,a,0), SE=(a,−a,0), SW=(−a,−a,0) on
the ball of radius √2a centred at 0 (z the crossing height), the half-turns `h_x(x,y,z)=(x,−y,−z)`,
`h_y(x,y,z)=(−x,y,−z)`, `h_z(x,y,z)=(−x,−y,z)` with the identity form a Klein-four group of
orientation-preserving isometries, permuting ports 0–3 by (03)(12), (01)(23), (02)(13) and
preserving every unoriented port pairing, hence the component count. Each sends a two-in/two-out
marking ε to ε or −ε; for −ε reverse all tangle components, closed ones included, before restoring
the collars. The restore sign is a character, so the half-turns act linearly on the oriented skein
module fixing both basis classes (possibly reversing composition order). Gluing to the unchanged
exterior gives HOMFLY mutation invariance for this simultaneous reversal (not independent component
reversals), consumed by 6.3, with the Alexander and Jones comparisons through 4.4.5.

*Needs:* 4.2's relative code, collar, local-move and realization comparisons; 4.10.1's port/gluing
prefix; 4.6/4.6.3's ambient HOMFLY skein construction; 4.4.5's coefficient maps; Mathlib free
modules, submodule quotients, `AdjoinRoot`, localizations; native `TemperleyLieb`.

**Checks.**

- *Singular specialization.* At `l = −1`, `m = 2` (so `μ = 1`) the closure matrix has nonzero kernel
  `{(a, −a)}`, so N and D do not separate tangles (by evaluation).
- *Quarter-turn.* `(x, y, z) ↦ (−y, x, z)` exchanges the `0` and `∞` tangles, whose numerator
  closures have `ρ = −(l + l⁻¹)m⁻¹` and `1`, so it is not a mutation (by evaluation).
- *Klein four rotations.* `h_x h_y = h_z`, and their port permutations `(03)(12)`, `(01)(23)`,
  `(02)(13)` compose in the same way, each fixing every unoriented pairing of the four ports (by
  evaluation).

### 4.7 Colourings, the determinant and the Arf invariant

Define, for a diagram and a quandle `Q` (Mathlib's `Quandle`), the set of `Q`-colourings of its
arcs; Reidemeister moves induce bijections of colouring sets, so the number of colourings is a link
invariant (Lickorish, Chapter 9; Burde–Zieschang, Chapter 1). For `Quandle.Dihedral n` the
colourings are the Fox `n`-colourings, elements of `ZMod n` on arcs with
`2·(over) = (under₁) + (under₂)` at each crossing, a `ZMod n`-module containing the constants. For a
knot and `n ≥ 1`, with `d₁, …, d_k` the invariant factors over `ℤ` of a reduced colouring matrix
(one row and one column of the crossing matrix deleted), whose product is `det K = |Δ_K(−1)|`, the
number of `n`-colourings is `n · ∏ gcd(n, d_i)`, so `K` has a non-constant `n`-colouring iff
`gcd(n, det K) > 1`; for a prime `p` it is `p · p^r`, `r` the `𝔽_p`-nullity of the reduced matrix,
and `K` is non-trivially `p`-colourable iff `p ∣ det K`. For `n = 1` there is one colouring; for
`n = 0` (`ZMod 0 = ℤ`) a knot has only the constants, `det K` being odd. Layer 4.3.1's knot Arf
invariant (from `q(x)=θ(x,x) mod 2`; its surface independence and additivity are 4.3.1's) is `0` iff
`Δ_K(−1) ≡ ±1 (mod 8)` (Lickorish, Chapter 10), with Layer 4.5.3's signed normalization and
absolute-determinant comparison; proper links use 4.3.1's polar-radical quotient.

**Checkerboard row dependencies and reduced presentations.** A realized oriented knot diagram with
c≥1 crossings has c arcs and an integer crossing matrix A with rows `2·over−under_in−under_out`
(coefficients added when arc indices coincide), so A·1=0, compared with the native half-edge Fox
constraints. The checkerboard parity of a region (transverse intersections mod 2 of a generic path
to the unbounded region, path-independent, from native `PDCode.face`/`facePerm` and Layer 4.2's
outer face) gives, with ε_i=±1 the parity of the sector just before and right of the oriented
overcrossing, a unit vector with `εᵀA=0`: the right-hand sign telescopes along each arc to
`2Σ ε_over−ε_start−ε_end=0`. ε is natural, invariant under orientation reversal and negated by the
other checkerboard choice.

- For every square integer matrix A of positive size with A·1=0 and a left-kernel vector ε in `ℤˣ`,
  the deletions B_ij (remaining indices in increasing order) satisfy `B_kl=P B_ij Q` with explicit
  unimodular P, Q, and `(-1)^(i+j) det B_ij = ε_i κ` (zero-based indices) for a common integer κ,
  with no rank premise. By the augmentation, coker(Aᵀ) ≃ ℤ⊕coker(B_ijᵀ), and over every commutative
  ring R extension by 0 at arc j is a linear equivalence from `ker(B_ij:R^(c−1)→R^(c−1))` onto the
  colourings modulo global constants, with base change `x↦x−x_l·1`, natural in relabelling and
  coefficients. The kink (A=[0]) and the crossing-free unknot have empty reduced presentations;
  links keep the half-edge presentation. Compare
  [Kolay, §4, Proposition 4](https://arxiv.org/html/1910.08044#S4).
- Colourings of a split union are products; colourings of a connected sum are the fibre product over
  a common arc, so the reduced nullities add.
- For a link, the determinant may be `0`, in which case the colouring module is infinite over `ℤ`
  and every prime colours it.
- The knot Arf invariant vanishes on smoothly and topologically slice knots and is a
  concordance invariant in both categories; these are Layer 6.2.1's (item 5), proved from
  4.3.1's half-dimensional criterion.

*Needs:* Mathlib `Quandle`, `Quandle.Dihedral`, `ZMod`; Layer 4.2, Layer 4.3, Layer 4.4.

**Checks.**

- *Composite moduli.* The trefoil's reduced matrix has invariant factors `1, 3`, so it has `18`
  six-colourings, among them `(0, 2, 4)`, though `6 ∤ det = 3` (by evaluation).
- *Arf invariants.* `Arf(trefoil) = Arf(figure-eight) = 1` (determinants `3`, `5`) and `Arf(6₁) = 0`
  (determinant `9 ≡ 1 (mod 8)`) (by evaluation).
- *Colouring counts.* The trefoil has `9 = 3 · 3¹` three-colourings, `6` of them non-constant; the
  figure-eight has `25` five-colourings; the unknot has only the `n` constant colourings for every
  `n` (by evaluation).

### 4.7.1 Based Fox colorings, numerical bounds and independent prime ranks

**Native kernel and normalization.** For `D:PDCode n` and a commutative ring R, `Col_R(D)` is the
kernel of the linear constraints on `S_D=Fin(4n) ⊕ Fin D.crossinglessComponentCount` (the two ends
of each native `edgePair` arc agree, the two over-slots agree, and `2 over=under₁+under₂`,
over-slots 0, 2 when `overPair=false`, else 1, 3), equivalent to 4.7's arc colourings and, for
`ZMod m`, to native `Quandle.Dihedral m` colourings. With `Based_R(D,a)=ker(ev_a:Col_R(D)→ₗ[R]R)` at
a site a, `Col_R(D)≃ₗ[R]R×Based_R(D,a)` and `Based_R(D,a)≃ₗ[R]Col_R(D)/globalConstants`, natural in
the site, the ring, relabelling, mirror, reversal and Reidemeister moves (the empty diagram has full
module 0; the crossing-free unknot R and 0). For a nonempty link and prime p,
`r_p(D)=finrank Based_(F_p)(D,a)` is independent of a, counts `p^(r_p+1)` colourings, descends to
the realized tame link and equals the reduced nullity; `Col_(F₂)(D)≃F₂^μ`, so r_2=μ−1.

- *Rectangular Smith comparison.* Every finite system of colouring equations (closed diagrams and cut
  tangles) is presented by coker(Aᵀ), coordinates as generators and rows as relations, its
  R-colourings being the additive homomorphisms to R. For every rectangular integer matrix A (empty
  types, zero and singular matrices included): unimodular P, Q with `PAQ=D`, positive diagonal
  d₁∣⋯∣d_r and zero remainder, unique invariant factors; the transpose-cokernel is
  `ℤ^(n−r) ⊕ ⨁_(i<r) ZMod(d_i)`, its R-colourings are `R^(n−r) × ∏_(i<r) ker(d_i·:R→R)` for every
  commutative R, of prime-field dimension `n−r+#{i<r : p∣d_i}`, and a presentation P has
  `P⊗_ℤ R≃coker(A_Rᵀ)`. Mathlib's `Module.Basis.SmithNormalForm`/`Submodule.smithNormalForm` and
  `Matrix.exists_smith_normal_form_of_det_ne_zero` give the PID and nonsingular cases; the
  rectangular, singular and zero-size cases are built here, as the shared primitive of 4.7.

**One crossing changes rank by at most one.** `|r_p(D)−r_p(change_i D)|≤1` for every prime p, 2
included: a crossing change negates only `D.overPair i`, and with `d_i(f)=f(slot0)−f(slot1)`,
`Col_R(D)∩ker d_i = Col_R(change_i D)∩ker d_i`, of codimension at most 1 in each based space over a
field. The unknotting number u, the least number of crossing changes on a path of realized diagrams
with free Reidemeister moves, equals the least number made in one diagram (descending-diagram
construction), and `r_p(K)≤u(K)`.

**Bridge restriction.** The least number of maximal overpasses equals the least number of Morse
maxima; `b(K)=br(K)` is attained and at least 1 (the unknot has one bridge). In a b-overpass
presentation from a bridge position, `out=2 over−in` along the underpasses reconstructs all labels,
giving an injection `Col_(F_p)(D)→ₗ[F_p](Fin b→F_p)`, hence `r_p(K)+1≤b(K)`, equivalently
`r_p(K)≤b(K)−1`.

**Cut ends and connected sum over every coefficient ring.** The two ends of a coloured cut-knot
1-tangle have equal colours over every ring: with `P=coker(A_tangleᵀ)` and d the difference of the
end classes, an auxiliary sliding unknot gives `2d=0`, the nonzero knot determinant gives
`rank_ℤ P=1`, and mod-2 colourings are one-dimensional, so the Smith theorem excludes even torsion
and d=0. Gluing equal-coloured marked arcs then gives `Based_R(K#J)≃ₗ[R]Based_R(K)×Based_R(J)`,
natural and associative, so `r_p(K#J)=r_p(K)+r_p(J)`; for a disjoint union the full modules
multiply, and the based dimension is the sum plus one.

**Explicit independent-prime families.** For each odd prime q the closure T(2,q) of σ₁^q is a knot
whose crossing transfer is the unreduced Burau matrix at t=−1, `M=[[2,−1],[1,0]]=I+N`,
`N=[[1,−1],[1,−1]]`, `N²=0`, so `M^m=I+mN` (signed powers for reversed twists) and the full
colouring module is `R×ker(m·:R→ₗ[R]R)` over every ring; thus r_p(T(2,q)) is 1 for p=q and 0
otherwise. For a finite set S of odd primes and multiplicities k_q, the connected sum of k_q copies
of T(2,q) has r_p=k_p on S, r_p=0 elsewhere (p=2 included) and determinant `∏_(q∈S)q^(k_q)` (the
unknot for empty S or zero multiplicities); so k trefoils and j cinquefoils T(2,5) give r_3=k and
r_5=j. Conversely r_p(K)>0 only for the finitely many odd p dividing det K.

*Needs:* native PD pairing/overpass/component data, native `Quandle.Dihedral`, `Submodule`,
`LinearMap.ker/range`, rank–nullity and rectangular integral Smith presentations; 4.7's
colouring/Reidemeister and knot-determinant comparisons; realized diagrams, relative tangle moves,
marked connected sums and two-braid closure. Compare
[Przytycki, Lemmas 1.5 and 2.2](https://arxiv.org/html/math/0608172#S2).

**Checks.**

- *Square knot.* `T(2, 3) # mirror(T(2, 3))` has `r_3 = 2` and signature `0`, so the rank bound
  gives `u ≥ 2` where the signature bound gives nothing (by evaluation).
- *P(3,3,3).* Its Goeritz matrix `[[6,−3],[−3,6]]` has Smith form `diag(3,9)`, so `r_3 = 2`, and
  its three-overpass diagram with the bridge restriction gives `b = 3` (by evaluation).
- *Two-strand ranks.* `M = [[2, −1], [1, 0]] = I + N` with `N² = 0`, so `M^m = I + mN` and the
  closure condition of `σ₁^m` is `m(x − y) = 0`: `T(2, 3)` has `r_3 = 1` and `r_5 = 0`, `T(2, 5)` has
  `r_5 = 1` and `r_3 = 0`, and `r_2 = 0` for both (by evaluation).

### 4.7.2 Transposition labels and the bridge bound

This section proves its statements from the constructions it states and cites no outside proof.

Group labels are native `Quandle.Conj G`, with `H(s,t)=(s t s⁻¹,s)` at a positive crossing and its
inverse at a negative one. The signed Reidemeister colouring bijections preserve the subgroup
generated by the labels; compare Layer 4.2's braid action with Layer 4.4's Wirtinger presentation.

- For a set S of native `Equiv.Perm (Fin N)` with `∀ s∈S, s.IsSwap` and the native
  `SimpleGraph (Fin N)` with `Adj x y := x≠y ∧ Equiv.swap x y∈S`, reachability is the orbit relation
  of `Subgroup.closure S`, which contains every transposition within a component; so
  `Subgroup.closure S=⊤` iff the graph is `Preconnected` (`Connected` for N≥1; N=0, 1 kept), and
  then `N−1≤S.ncard` for finite S, since `Nat.card graph.edgeSet=S.ncard`, by Mathlib's
  `SimpleGraph.Connected.card_vert_le_card_edgeSet_add_one`. The Hurwitz list bound and orbit counts
  come from `TauCeti.GroupTheory.Perm.SwapFactors`.
- In a b-overpass representative the underpass labels are conjugation words in the bridge labels, so
  `closure(range bridgeLabels)=closure(range allArcLabels)`; by 4.7.1's overpass comparison a tame
  knot K with a generating transposition labelling in S_N, N≥2, has `br(K)≥N−1`.
- For three-cycles c_i (native `Equiv.Perm.IsThreeCycle`) with transposition factorizations
  `c_i=a_i*b_i`, the factors have the same orbit relation as the cycles, so transitive cycles have
  factors generating S_N (native support, `MulAction.orbitRel` and swap-factor APIs).

**Checks.**

- *Trefoil.* On the closure of `σ₁³`, `H` takes `((12), (23))` to `((13), (12))`, `((23), (13))` and
  back; the labels generate `S₃`, so the two-bridge trefoil attains `br ≥ N − 1` (by evaluation).
- *Three-cycles.* `(123)` and `(345)` act transitively on five letters but generate only `A₅`; their
  factors `(13), (12), (35), (34)` form a tree and generate `S₅` (by evaluation).
- *Generation is the hypothesis.* The constant labelling by one transposition satisfies every
  crossing equation but generates a group of order `2`, so it yields no bound.

*Needs:* Layer 4.2's realized diagrams and braid action, Layer 4.4's Wirtinger presentation,
Layer 4.7's signed colourings and their Reidemeister bijections, Layer 4.7.1's overpass
comparison and bridge positions; Mathlib `Quandle.Conj`, `Equiv.Perm.IsSwap`,
`Equiv.Perm.IsThreeCycle`, `Subgroup.closure`, `MulAction.orbitRel`,
`SimpleGraph.Preconnected` and `SimpleGraph.Connected.card_vert_le_card_edgeSet_add_one`; the
swap-factor orbit counts and Hurwitz list bound of Tau Ceti's
`TauCeti.GroupTheory.Perm.SwapFactors`.

### 4.7.3 Signed pretzel diagrams and transposition labelings

The `S₃` criterion is the three-box case of the difference system for Fox colourings of a
pretzel diagram, with determinant `pq + pr + qr` and its mod-`n` nullity (Kolay, *Knot colorings:
coloring and Goeritz matrices*, arXiv 1910.08044, Exercise 16, p. 13, and Claims 17–20, p. 14);
the `S₄` classification, the colouring bijections and the bridge statement are proved here from
the constructions below and cite no outside proof.

For p,q,r∈ℤ the marked standard pretzel diagram P(p,q,r) has three boxes, two-strand braids in
downward local frames with p, q, r signed half twists (zero: two vertical arcs), top caps labelled
x, y, z with box input pairs (x,y), (y,z), (z,x), and standard planar caps joining each box's right
endpoints to the next box's left ones, the outer pair included; give its planar code with
`|p|+|q|+|r|` crossings, cap correspondence and spatial realization, component orientations being
separate from the box frames. All odd parameters or exactly one even give a knot, two even give two
components, all even three. The spatial cyclic and order-reversing rotations of the boxes give the
full S₃ parameter symmetry of the unoriented links, transporting orientations and colourings.

**Integer twist and closure API.** In native `Quandle.Conj G` (products right to left), for
involutions x, y the positive crossing is `H(x,y)=(xyx⁻¹,x)`, with inverse `H⁻¹(u,v)=(v,v⁻¹uv)`, and
for every p∈ℤ the signed transfer of the realized box is `T_p(x,y)=((xy)^p x,(xy)^(p−1)x)`, with its
p=0, recurrence and composition laws. For transpositions in S₄, restriction to the top caps and
propagation are inverse bijections between colourings and triples satisfying (a)
`(xy)^p x = (zx)^(r−1)z`, (b) `(zx)^r z = (yz)^(q−1)y` and (c) `(yz)^q y = (xy)^(p−1)x`, where (a),
(b) imply (c); the triple generates the same subgroup as all arc labels.

**Complete image classification.** The subgroup of S₄ generated by a transposition colouring of
P(p,q,r) is, up to conjugation, the product of the symmetric groups on its support-graph components
(4.7.2), and each type occurs for some colouring iff:

- C₂, one transposition: always;
- C₂×C₂, two disjoint transpositions: at least two of p, q, r are even (then labels are constant on
  components, so never for a knot);
- S₃ fixing one letter: `3 ∣ pq+pr+qr`;
- S₄: at least two parameters are divisible by 3, and each is divisible by 3 or even.

For S₄ the top swaps form a tree on four letters: a star `(12),(13),(14)`, for which (a), (b) hold
iff 3 divides p, q, r, or a path, e.g. `(12),(23),(34)`, iff 3∣p, 3∣q and r is even; the conditions
depend on p, q, r mod 6, so they are settled by a finite case analysis over the 216 residue triples and the 216 swap
triples. For S₃ the swaps are the dihedral quandle on `ZMod 3`, and with
u=x−z, v=y−z, (a), (b) are the kernel of `L(p,q,r)=[[p+r,−p],[−r,−q]]` over `ZMod 3`,
`det L=−(pq+pr+qr)`; so the Fox colourings are `ZMod 3 × ker L` (the first factor the constant z),
of reduced mod-3 rank 2, 1 or 0 as L=0, det L=0≠L or det L≠0, and a nonconstant three-swap colouring
generates S₃. Every knot P(p,q,r) satisfying the S₄ condition has bridge number exactly 3: the caps
and monotone boxes give a three-maximum position, and 4.7.2 gives at least 3.

*Needs:* Layer 4.2 (realized planar codes, box moves and isotopies), Layer 4.7 (quandle colourings),
Layer 4.7.1 (based Fox kernels and bridge minima), Layer 4.7.2 (group-word transport and
transposition graphs); native `Equiv.Perm.IsSwap`, `Subgroup.closure`, `Quandle.Conj`, dihedral
colourings and `ZMod 3` linear algebra.

**Checks.**

- *Even parameter.* `P(3,3,4)` has a generating `S₄` colouring with top swaps `(12), (23), (34)`;
  `P(3,3,5)` has none (by evaluation).
- *Colouring census.* `P(3,3,3)` has `126` transposition colourings in `S₄`: `6` constant, `96` with
  image `S₃` and `24` with image `S₄` (by evaluation).
- *Unlink.* `P(0,0,0)` is the three-component unlink, and every incoming swap triple closes,
  including the Klein-four and full `S₄` images; the knot-only exclusion of the Klein-four image
  does not apply to it (by evaluation).

### 4.7.4 Conjugation orbits of finite colourings

This section proves its statements from the constructions it states and cites no outside proof.

For every finite group G and finite realized link diagram, the signed Wirtinger colourings of 4.7
form a finite set; through the finite native `Group.Presentation` (an assignment is a colouring iff
every relator evaluates to 1) they are equivalent to the homomorphisms from the complement group to
G, the generating colourings to the surjections. An explicitly verified arc-elimination schedule,
with restriction and extension maps, justifies a smaller generator list.

**Conjugation and marked colors.** Native `ConjAct G` acts by simultaneous conjugation, commuting
with the Reidemeister maps and conjugating the generated subgroup; for a knot all meridians lie in
one native `ConjClasses G` class. For a marked arc, a class C and c∈C, with X_C the colourings whose
marked label is in C and F_c those with marked label c (all, or generating), `[g,f] ↦ g·f` is an
equivalence `X_C ≃ G ×_(C_G(c)) F_c`, the quotient by `(g,f) ~ (g h⁻¹,h·f)` for h∈C_G(c), so
`X_C/G ≃ F_c/C_G(c)` and `|X_C|=|C|·|F_c|`. A colouring's stabilizer is the centralizer of its
generated subgroup, so G/Z(G) acts freely on generating colourings; otherwise use Burnside's
`|G|·#orbits=Σ_(g∈G) #Fix(g)`. For links, mark one meridian per component and stratify by diagonal
conjugation orbits on G^μ, the joint centralizer as residual group; the empty link has one colouring
and no marked arc, and component reversal inverts its meridian.

**Finite instantiations.** Raw counts, generating counts, orbits and image subgroups are separate
invariants, transported under generator, representative, Reidemeister and mirror/orientation changes.
Instantiate them for S₃, S₄, S₅ and the native finite matrix group GL₃(𝔽₂), which is PSL₃(𝔽₂) of
order 168, with its conjugacy classes, inversion and the inverse-transpose automorphism.

*Needs:* Layers 4.4.3 and 4.7 (finite geometric presentations and signed colouring equivalences);
native `Group.Presentation`, `PresentedGroup`, `ConjAct`, `ConjClasses`, `MulAction.orbitRel`,
subgroup centralizers, finite permutation cycle types, finite matrix groups and Burnside counting.

**Checks.**

- *Diagonal orbits.* For the two-component unlink with `S₃` transposition labels, the nine ordered
  pairs form two orbits (three equal, six distinct pairs), with joint centralizers of orders `2` and
  `1` (by evaluation).
- *GL₃(𝔽₂).* In `Matrix.GeneralLinearGroup (Fin 3) (ZMod 2)` the six classes have element orders
  `1, 2, 3, 4, 7, 7` and sizes `1, 21, 56, 42, 24, 24` (by evaluation).
- *S₅ classes.* The seven conjugacy classes of `S₅` have sizes `1, 10, 20, 15, 30, 20, 24` for
  the cycle types `1, 2, 3, 2+2, 4, 3+2, 5`, summing to `120` (by evaluation).

### 4.7.5 The complete `5₂` coloring calculation

This section proves its statements from the constructions it states and cites no outside proof.

The standard `5₂` PD model of 4.4.6, through 4.2's PD/arc comparison, calibrates the counts of 4.7
and the Smith comparison of 4.7.1; its arcs `x₁,…,x₅` have over/under triples `(1;2,3)`, `(3;1,4)`,
`(4;1,5)`, `(5;2,4)`, `(2;3,5)`.

**Checks.**

- *The `5₂` count.* The arc matrix has Smith form `diag(1,1,1,7,0)`, so the `5₂` model has
  `m·gcd(m,7)` Fox `ZMod m` colourings for every `m ≥ 1` (by evaluation).
- *Cofactors.* With rows `2x_o − x_u − x_v` for the triples above, every row and column of `A`
  sums to `0`; deleting row `1` and column `1` leaves
  `[[0, 2, −1, 0], [0, 0, 2, −1], [−1, 0, −1, 2], [2, −1, 0, −1]]`, of determinant `−7` (by
  evaluation).
- *Kernel.* `A(c, c + a, c − a, c − 2a, c − 4a) = (0, 0, 0, −7a, 7a)`, so the kernel over `R` is cut
  out by `7a = 0`: modulo `7` there are `49` colourings and `42` nonconstant ones, modulo `3` only
  the `3` constant ones, and modulo `14` there are `14 · 7 = 98` (by evaluation).

*Needs:* Layer 4.4.6's standard `5₂` model, Layer 4.2's PD/arc comparison, Layer 4.7's Fox
colouring equations and counts, and Layer 4.7.1's rectangular Smith comparison and based colouring
modules; Mathlib `ZMod` and `Matrix.det`.

### 4.7.6 The three permutation-labeling examples

This section proves its statements from the constructions it states and cites no outside proof.

Permutations use one-based cycle notation (letter i is native i−1 in `Equiv.Perm (Fin N)`) with
right-to-left products; a G-labelling generates G and satisfies the crossing equations.

**Ordered crossings and actual closure maps.** With `H(s,t)=(sts⁻¹,s)`, 4.4.7's realized two-strand
closures with their geometric Artin/Wirtinger maps and 4.7.2's signed transports, for every n
restriction to the incoming pair is a bijection, preserving the generated subgroup, from colourings
of the closure of σ₁ⁿ onto pairs with Hⁿ(s,t)=(s,t). For n=2k+1>0 this is the relator
`(st)^k s=t(st)^k`, giving a homomorphism from `⟨x,y | (xy)^k x=y(xy)^k⟩`, hence from the realized
knot group, to G, surjective iff s, t generate G; 4.7.4 then gives the class-restricted counts and
orbits.

*Needs:* 4.2's realized diagrams and relative moves; 4.4/4.4.7's geometric meridional group
comparisons; 4.7.2's signed conjugation colourings; 4.7.4's class/centralizer theory; Mathlib's
`Equiv.Perm.closure_cycle_adjacent_swap` and `Equiv.Perm.closure_prime_cycle_swap`.

**Checks.**

- *Trefoil in S₄.* `s = (1234)`, `t = (1243)` satisfy `sts = tst`; `s²t = (14)` and its conjugates
  by powers of `s` form a four-cycle of swaps, so `s, t` generate `S₄` (by evaluation).
- *Cinquefoil in S₅.* `a = (45)(123)`, `b = (35)(124)` satisfy `(ab)²a = b(ab)²`; `ab = (13425)` and
  `a³ = (45)` generate `S₅`, while `a³, b³` generate only an order-`6` group (by evaluation).
- *Braid relation.* `H((12),(23)) = ((13),(12))`, `H²((12),(23)) = ((23),(13))` and
  `H³((12),(23)) = ((12),(23))`; the fixed-pair condition `H³(s, t) = (s, t)` is `sts = tst`, both
  sides equal to `(13)` for `s = (12)`, `t = (23)` (by evaluation).
### 4.7.7 Pretzel surfaces, Alexander modules and integer colorings

P(p,q,r), p,q,r ∈ ℤ, is 4.7.3's signed three-box construction (|p|+|q|+|r| crossings, zero and
negative powers included), whose parameter-permutation isotopies transport the collars,
orientations, basis cycles and meridians used here.

**The odd-parameter surface and its actual matrix.** For p,q,r odd, the two-disc/three-band
pretzel surface is connected and orientable of genus 1 (Euler characteristic −1, connected
boundary P(p,q,r); no minimal-genus claim); its band-core cycles a,b form an integral basis of H₁
with a·b = +1, and the positive push-offs, read from the signed crossing charts, give

```
W_ij=lk(x_i⁺,x_j),   W=[[(p+q)/2,(q+1)/2],[(q−1)/2,(q+r)/2]],
V_ij=lk(x_i,x_j⁺),   V=Wᵀ,
```

with W − Wᵀ = J = [[0,1],[−1,0]] and, by the reflected surface, V(−p,−q,−r) = −V(p,q,r)ᵀ. The two
strands of each box are oppositely oriented; P(1,1,1) is the left-handed and P(−1,−1,−1) the
right-handed trefoil, diag(1,−1) being the cycle map to the native trefoil matrix.

**Alexander polynomial and the full presentation.** For odd p,q,r, B = pq+pr+qr ≡ 3 mod 4, so
A = (B+1)/4 ∈ ℤ, and in Λ = ℤ[t,t⁻¹]

```
det(W−tWᵀ)=det(tV−Vᵀ)=A(1−t)²+t,
Δ_P(t)=t⁻¹det(tV−Vᵀ)=1+A(t+t⁻¹−2),   Δ_P(1)=1.
```

4.3/4.4's surface-cut comparison, positive meridian fixed, gives an explicit Λ-isomorphism from
the cokernel of tV − Vᵀ (row/column convention pinned) to the reduced Alexander module, compatible
with the marked Wirtinger/Fox presentation (whose unreduced module splits off a free Λ summand),
the parameter isotopies and the mirror; its Fitting ideals are Fitt₀ = (Δ_P) and
Fitt₁ = (t+1,p,q,r) = (t+1,g), g = gcd(|p|,|q|,|r|), so it is not cyclic for g > 1.

**All integer parameters: the geometric Goeritz and Fox comparisons.** For all p,q,r the
checkerboard surface with two discs and three signed bands, not assumed orientable, bounds the
marked P(p,q,r) (for p = q = r = 0 a pair of pants bounding the three-component unlink); in the
reduced region basis and the fixed shading convention its Goeritz matrix is
G = [[p+q,−q],[−q,q+r]], det G = B, congruent for odd parameters to S = V+Vᵀ = [[p+q,q],[q,q+r]]
by diag(1,−1). The double-cover pairing is 6.2's checkerboard prefix. Over every commutative ring
R, with x▷y = 2y−x, a box of k half twists transfers colours by
H^k(x,y) = ((k+1)x−ky, kx+(1−k)y) for every k ∈ ℤ, and the three cap equations reduce to
G·(y−x, z−x) = 0, so the colouring module is R × ker(G_R), R the constant colours, independently
of the base arc and with no division by 2; the based cokernel and its Hom into R are related by
presentation base change.

The integral Smith form of G is (g,|B|/g), with g² | B, when B ≠ 0; (g,0) when B = 0 and g > 0;
and (0,0) when p = q = r = 0. So the determinant (the absolute reduced Fox/Goeritz determinant,
compared with the oriented-link Alexander specialization) is |B|, which is |Δ_P(−1)| for
odd-branch knots; for n ≥ 1 there are n·gcd(n,g)·gcd(n,|B|/g), n²·gcd(n,g) or n³ ZMod n
colourings in the three cases; and over a field of prime characteristic ℓ the based dimension is 2
if ℓ | g (g = 0 included), 1 if ℓ ∤ g and ℓ | B, and 0 otherwise, which for ℓ = 2 is μ − 1 with μ
the number of components.

**Signature.** For odd parameters det S = B ≠ 0, and σ = 0 if B < 0,
σ = 2 sign(p+q) if B > 0 (p+q = 0 forces B = −q² < 0), identified with the classical signature by
6.2's Seifert-form comparison. In the other component and parity branches the oriented-link
signature is computed from G with 6.2's normal-Euler correction, read off the crossing types of
the port charts for each orientation assignment.

**Checks.**

- *Trefoil handedness.* For P(−1,−1,−1), the right-handed trefoil, V = [[−1,−1],[0,−1]],
  diag(1,−1) carries it to the native matrix [[−1,1],[0,−1]], and σ = −2 (by evaluation).
- *Non-cyclic colouring module.* P(3,3,3) has G = [[6,−3],[−3,6]], B = 27, g = 3 and Smith form
  (3,9). Over `R = ZMod n`, with `Ann(d) = ker(d· : R → R)`, its based module `ker(G_R)` is
  `Ann(3) × Ann(9)` and its colouring module, with the constants, is `R × Ann(3) × Ann(9)`, of
  `n·gcd(n,3)·gcd(n,9)` elements: `243` for `n = 9`. For `n = 27` the based module has `27`
  elements but is not `Ann(27) ≅ ZMod 27`, having no element of order `27` (by evaluation).
- *Unit Alexander polynomial.* `P(−3, 5, 7)` has `B = −15 + 35 − 21 = −1`, `A = 0`, `Δ = 1`,
  `det S = −1 < 0` and `σ = 0`; `P(3, 5, −7)` has `B = −41`, `A = −10`, `Δ = −10t + 21 − 10t⁻¹`,
  `Δ(−1) = 41` and `σ = 0`. So for `P(−3, 5, 7)` the Alexander module (`Fitt₀ = Fitt₁ = (1)`),
  the determinant `1`, the Fox colourings, constant over every `ZMod n` since `g = 1` and
  `|B| = 1`, and the signature `0` coincide with those of the unknot, and none of them
  separates the two (by evaluation).

*Needs:* 4.2's realized diagrams, component tracing and signed local moves; 4.3's embedded bands,
homology bases, push-offs and Seifert forms; 4.4's geometric Alexander/Fox comparison; 4.7.1's
rectangular Smith theory; 4.7.3's signed pretzels; 6.2's classical-signature and checkerboard-form
prefixes. Matrix calibration: [Balm–Friedl–Kalfagianni–Powell, *Cosmetic crossings
and Seifert matrices*, §7.2](https://friedl.app.uni-regensburg.de/papers/genusone12.pdf), whose
matrix is the push-first W; the native convention is its transpose.

### 4.7.8 Arbitrary signed pretzels and parameter permutations

For r ≥ 1 and a : Fin r → ℤ, the marked cyclic pretzel P(a) extends 4.7.3's construction: box i
is the downward two-strand braid with a_i signed half twists (zero is the identity box), and each
box's right endpoints are joined to the next box's left endpoints at top and bottom, cyclically.
It has a finite planar code with Σ_i|a_i| crossings, crossing-free circle records and a spatial
realization, invariant under relabelling and agreeing with 4.7.3's construction for r = 3.

**Endpoint and small-length API.** Label ports (i,t,s), with t = false/true for top/bottom and
s = false/true for left/right. The within-box pairing (i,t,s) ↦ (i,!t,s xor odd(a_i)) and the cap
pairing (i,t,true) ↦ (i+1,t,false), (i,t,false) ↦ (i−1,t,true) (indices mod r) are
fixed-point-free involutions whose joint orbits are the components, crossing-free ones included.
With e the number of even entries, P(a) has e components if e > 0, and 1 or 2 if e = 0 and r is
odd or even; so it is a knot iff e = 1 or (e = 0 and r odd), a criterion invariant under
permutation, signed negation and cyclic shift. The all-zero list is the r-component unlink, P(a₀)
is an unknot for every a₀, P(a₀,a₁) is the closure of the two-strand braid of signed exponent
a₀ + a₁ (with the sign comparison with the native generator), and the two-disc/r-band spanning surface
is orientable iff all a_i have the same parity.

**Adjacent swaps as marked mutations.** For 0 ≤ j < r−1 a ball around boxes j, j+1 meets P(a) in
four ports; 4.6.5's marked mutation by the h_z plane half-turn, followed by relative local moves
restoring each box's chart, gives P(a∘swap(j,j+1)), all tangle components being reversed when the
half-turn negates the boundary orientation character. Factoring π : Equiv.Perm(Fin r) into
adjacent transpositions by Mathlib's `Equiv.Perm.mclosure_swap_castSucc_succ` gives a marked
mutation chain from P(a) to P(a∘π), with component maps, inside the knot branch when P(a) is a knot.

**Polynomial consequence and geometric symmetries.** By 4.6.5's orientation-compatible mutation
theorem and the global-reversal theorem, for every a in the knot branch, every permutation π and
any orientations of the two knots, ρ(P(a))(l,m) = ρ(P(a∘π))(l,m), hence the normalized Jones,
Alexander and Conway equalities; for links the equality holds for orientations transported along
the chain. Cyclic shifts and order reversal of the list are realized by ambient isotopies
(recovering 4.7.3's S₃ symmetry for r = 3), and reflection gives P(−a); other permutations give
mutation chains, not isotopies.

**Checks.**

- *Component count.* P(2,2,2) (e = 3) has 3 components and P(1,1) (e = 0, r = 2) has 2; a count
  by odd entries would give 0 for P(2,2,2) (by evaluation).
- *One parameter.* `P(a₀)` is an unknot for every `a₀`, with one component whether `a₀` is even
  (`e = 1`) or odd (`e = 0`, `r` odd); the all-zero list of length `r` gives the `r`-component
  unlink (by evaluation).
- *Two parameters.* `P(a₀, a₁)` is the closure of the two-strand braid with exponent `a₀ + a₁`, a
  knot exactly when the sum is odd, which agrees with the component formula (by evaluation).

*Needs:* the realized signed-box, relative local-move, component-tracing, collar/gluing and
ambient-extension prefixes; 4.6.5's marked mutation and relative skein construction; the
adjacent-transposition generation of the symmetric group; the polynomial reversal and
coefficient comparisons. The permutation invariance of the HOMFLY polynomial of pretzel knots is
stated in Freyd–Yetter–Hoste–Lickorish–Millett–Ocneanu, Bull. Amer. Math. Soc. 12 (1985),
p. 244; for the ordered-list, knot-parity, dihedral and mutation distinctions compare
[Lecuona–Wand, *Fibered ribbon pretzels*, §2](https://arxiv.org/html/2408.03644#S2), with a
diagram/sign comparison to the convention fixed here.

### 4.8 Crossing, unknotting, bridge and braid numbers

Use Layer 4.7.1's unknotting number `u(K)` and bridge number `br(K)` and 4.5.6's braid-index
minimum, and define the crossing number `c(L)` as the least number of crossings of a diagram of
`L`. Prove: `c(K) = 0` iff `K` is the unknot; `br(K) = 1` iff `K` is the unknot, and
`br(K # J) = br(K) + br(J) − 1` (Schubert, *Über eine numerische Knoteninvariante*, Math. Z. 61
(1954)); `u(K # J) ≤ u(K) + u(J)`; braid index is subadditive under connected sum.

Prove the Kauffman–Murasugi–Thistlethwaite theorem: a reduced alternating diagram has the least
number of crossings of any diagram of its link, and an alternating link `L` which is the split
union of `s ≥ 1` non-split links has `span V_L = c(L) + s − 1`, in particular `span V_L = c(L)`
when `L` is non-split; while `span V_L < c(D)` for a connected, prime, non-alternating diagram `D`
(Lickorish, Chapter 5). The route is the adequacy of the extreme states of the bracket; the split
correction comes from `V(L ⊔ L') = (−t¹ᐟ² − t⁻¹ᐟ²) V(L) V(L')`, which adds `1` to the span, and
from `span V_D ≤ c(D) + k − 1` for a diagram with `k ≤ s` connected pieces. Prove the converse
through the Turaev surface: `span V_K + g_T(D) ≤ c(D)` for a connected diagram, where the Turaev
genus `g_T(D)` is `(2 + n − s_A − s_B)/2` (Turaev, *A simple proof of the Murasugi and Kauffman
theorems*, L'Enseignement Math. 33 (1987); restated as inequality (1.1) of Armond–Lowrance,
*Turaev genus and alternating decompositions*, Algebr. Geom. Topol. 17 (2017)), and
`g_T(D) = 0` iff `D` is a diagram connected sum of alternating diagrams (Turaev, op. cit.; used in
Armond–Lowrance, §4), since `s_A(D₁ # D₂) = s_A(D₁) + s_A(D₂) − 1` and likewise for `s_B`. Hence a
knot is alternating iff `span V_K = c(K)`. Prove the Morton–Franks–Williams inequality: for the
closure of a braid on `k` strands with writhe `w`, the `v`-exponents of `P` lie in
`[w − k + 1, w + k − 1]`, so `(span_v P)/2 + 1` bounds the braid index below (Morton, Math. Proc.
Cambridge Philos. Soc. 99 (1986); Franks–Williams, Trans. Amer. Math. Soc. 303 (1987)).

- `2 g(K) ≤ c(K) − 1` and `span Δ_K ≤ 2 g(K)` for nontrivial knots (Layer 4.3, 4.4).
- The signature bound `|σ(K)| ≤ 2 u(K)` is Layer 6.2.
- Every two-bridge knot is prime, and a knot of bridge number two is a rational knot
  (Layer 4.10).

**Checks.**

- *Split correction.* The two- and three-component unlinks have `V = −t¹ᐟ² − t⁻¹ᐟ²` and
  `(t¹ᐟ² + t⁻¹ᐟ²)²`, of spans `1 = 0 + 2 − 1` and `2 = 0 + 3 − 1` (by evaluation).
- *Morton–Franks–Williams bound.* The closure `T(3, 4)` of `(σ₁σ₂)⁴`, with `k = 3` and `w = 8`,
  has `P = v⁶(5 + 10z² + 6z⁴ + z⁶) − v⁸(5 + 5z² + z⁴) + v¹⁰`, whose `v`-exponents `6, 8, 10`
  fill `[w − k + 1, w + k − 1] = [6, 10]`, so `span_v P = 4` and the bound gives braid index
  `3`, attained by that braid. The bound is on the `v`-span of `P`, not on the span of the Jones
  polynomial: `V = t³ + t⁵ − t⁸` has span `5`, which in its place would give `3.5` and wrongly
  exclude the three-strand braid (by evaluation).
- *Small invariants.* Trefoil: `c = 3`, `u = 1`, `br = 2`, braid index `2`; figure-eight: `c = 4`,
  `u = 1`, `br = 2`, braid index `3`; unknot: `c = 0`, `u = 0`, `br = 1`, braid index `1`.

*Needs:* Layer 4.2 through 4.6; Layer 4.7.1 (the unknotting number `u(K)` and the bridge number
`br(K)`).

### 4.8.1 Adequate diagrams, colored cabling and crossing minimality

Develop adequate diagrams (Lickorish, Chapter 5) on the realized plane diagrams and the native
`PDCode` bracket and Jones carriers: state circles and adequacy for nonempty link diagrams,
cabling and colored polynomials for knots, the crossing-free unknot included.

**State circles and state graphs.** For `D:PDCode n` and state `s:Fin n→Bool`, with
`v_s=D.smoothingTurn(D.smoothingChoice s)` and the join
`R_s=SameCycle.setoid(D.edgePair.val) ⊔ SameCycle.setoid(v_s)` on halfedges, the state circles are
`Quotient R_s ⊕ Fin D.crossinglessComponentCount`, of cardinality `D.stateLoopCount s` (each circle
carries two directed orbits of `D.statePerm s`; 4.3.2's perfect-matching join-cardinality
comparison), with merge/split maps and relabelling and mirror naturality. The state multigraph is a
native `Graph` on these circles with edge set `Fin n`, crossing i joining the classes of
`D.crossing i 0` and `D.crossing i 2`, keeping loops, parallel edges and isolated circles. D is
A-adequate (B-adequate) when the graph of the all-A state, constant true (all-B, constant false),
is loopless, and adequate when both; reduced alternating realized diagrams are adequate, by
planar regions and the geometric nugatory-crossing criterion.

**The strict first change and extremal coefficients.** In a planar diagram every smoothing change
alters the circle count by exactly one, distinct endpoint circles merging. With
`s_A=loops(all-A)` and `s_B=loops(all-B)`, a state with `b(s)` B-choices has top exponent
`n−2b(s)+2loops(s)−2`; from an A-adequate state the first A-to-B change lowers it by 4 and later
ones never raise it, so

`maxdeg_A ⟨D⟩=n+2s_A−2`, with coefficient `(-1)^(s_A−1)` for A-adequate D;
`mindeg_A ⟨D⟩=−n−2s_B+2`, with coefficient `(-1)^(s_B−1)` for B-adequate D.

An adequate diagram has breadth `2n+2(s_A+s_B−2)`, matching 4.8's Turaev formula when connected
(genus 0 gives the alternating 4n), with a split-circle correction otherwise.

**Blackboard parallel diagrams.** The r-parallel `D^r`, r ≥ 0, replaces each crossing by an
r-by-r grid with no added framing twists: a planar framed satellite with r²n crossings, r copies
of each crossing-free circle, `D^0` empty, `s_A(D^r)=r s_A(D)` and `s_B(D^r)=r s_B(D)` by explicit
circle bijections, A/B-adequacy preserved and `w(D^r)=r²w(D)`.

**Integral color and its framing comparison.** Over `Λ=ℤ[A,A⁻¹]` the unreduced bracket
`B(D)=Σ_s A^(a(s)−b(s)) δ^loops(s)`, `δ=−A²−A⁻²`, has `B(empty)=1`, `B(D)=δ⟨D⟩` for nonempty D,
and is multiplicative under disjoint union. With native `Polynomial.Chebyshev.S ℤ (r:ℤ)`, written
S_r (`S_0=1`, `S_1=x`, `S_(r+2)=xS_(r+1)−S_r`, `S_r(x)=Σ_(j≤r/2)(−1)^j binom(r−j,j) x^(r−2j)`),
let `C_r(D)=Σ_(j∈support S_r) coeff(S_r,j) B(D^j)`, not S_r at the scalar bracket. From TemperleyLieb
Layers 2–4 and 6's Jones–Wenzl f_r, prove through the marked annular closure that
`closure(f_r)=S_r` and that the color-r positive kink eigenvalue is `θ_r=(-1)^r A^(r(r+2))`
(negative θ_r⁻¹), working over `ℚ(A)`, where the quantum integers are nonzero, and descending along
the injective `Λ→ℚ(A)`; so C_r is invariant under Reidemeister II/III with the colored
Reidemeister I factor. For an oriented knot diagram of writhe w, `F_r(K)=θ_r^(−w) C_r(D)` (Jones
color r+1) is invariant under realized Reidemeister moves and reversal, reflection inverting A,
with `F_0=1`,
`F_r(unknot)=(-1)^r Σ_(j=0)^r A^(2r−4j)`, `F_1(K)=δ V_K(A⁻⁴)` (half-variable `u=A⁻²`) and
`F_r(K)(1)=(-1)^r(r+1)`, from `V_L(1)=(-2)^(μ−1)` on the parallels and Chebyshev parity, so
F_r ≠ 0.

**Degrees and the minimality theorem.** For every realized knot diagram D and r ≥ 1,

`maxdeg_A F_r(K) ≤ r²(n−w)+2r(s_A−w)`,
`mindeg_A F_r(K) ≥ −r²(n+w)−2r(s_B+w)`,

with equality and coefficient ±1 under A- resp. B-adequacy: the bounds come from the parallel
state sum, and lower Chebyshev terms cannot cancel an adequate extreme since
`(r²−j²)n+2(r−j)s_A>0` for 0 ≤ j < r (the bottom through `LaurentPolynomial.invert`); for adequate
D the unreduced colored breadth is `2r²n+2r(s_A+s_B)`. If D is adequate and E is any diagram of
the same knot, comparing r² coefficients for all r ≥ 1 gives `n_D−w_D≤n_E−w_E` and
`n_D+w_D≤n_E+w_E`: D minimizes positive and negative crossings separately, `c(K)=n_D`, every
crossing-minimal diagram has D's signed crossing counts, all adequate diagrams of a knot have the
same writhe, and adequate diagrams are reduced. Connected sum wedges state graphs at one vertex, so
preserves adequacy, and crossing number is additive on adequate knots.

**Checks.**

- *Trefoil bracket.* The standard trefoil diagram (`n = 3`) has `{s_A, s_B} = {2, 3}`, bracket
  degrees `5`, `−7` and breadth `12 = 4n`; the one-crossing kink is not adequate (by evaluation).
- *Kink eigenvalues.* `θ_1 = −A³`, the ordinary normalized-bracket kink factor, and `θ_2 = A⁸`
  (by evaluation).
- *Writhe-separated minimality.* For the trefoil diagram `D` with `n = 3`, `w = 3` and any diagram
  `E` of the same knot, `n_D − w_D = 0 ≤ n_E − w_E` and `n_D + w_D = 6 ≤ n_E + w_E`; the mirror
  diagram has `w = −3` and the two inequalities exchange roles (by evaluation).

*Needs:* earlier realized plane diagrams, Reidemeister/Markov comparison, tubular neighbourhoods
and marked connected sums; native PD state permutations/counts, `Graph`, `Setoid` join,
`LaurentPolynomial.degree`, `.coeff` and `.invert`; native Chebyshev S; TemperleyLieb Layers 2–4
and 6 (the diagram and linear categories, the closure trace, `existsUnique_jonesWenzl`, the Wenzl
recursion and `IsMarkovTrace.apply_jonesWenzl`). Compare the cabling with
[Dasbach–Lin, Theorem 3.1](https://arxiv.org/abs/math/0604230) and the degree normalization with
[Kalfagianni, §2 and Theorem 3.2](https://arxiv.org/html/1601.03307#S2) (Jones color r+1,
t = A⁻⁴), whose sign-normalized polynomial is `(-1)^r F_r`.

### 4.8.2 The complete braid-index-two classification

This section proves its statements from the constructions it states and cites no outside proof.

Use 4.8's braid index (minimum over every braid axis) and oriented-link equivalence. For m ∈ ℤ let
L_m be the coherently oriented closure of σ₀^m in native BraidGroup 2 (4.2.1's B₂ ≃ ℤ): L_0 is the
two-component unlink, L_m has two components of linking m/2 for even m and one for odd m.
L_(±1) is the unknot, and for odd |m| ≥ 3 the determinant is |m| > 1 by 4.4's two-strand
Burau/Alexander comparison. Since one-strand braids are trivial, braidIndex(L_m) is 1 if m = ±1
and 2 otherwise, and for every nonempty oriented tame link L,
`braidIndex(L)=2 ↔ ∃m∈Z, m≠1 ∧ m≠−1 ∧ L≅oriented L_m`, through a minimizing two-strand braid and
its unique exponent, using 4.4 only. With 4.11's models, compare every L_m with the two-strand
torus link, even parameters included. The unoriented braid index, minimized over closed braids
with the given underlying link, is the minimum of the oriented index over component orientations,
classified by underlying L_m, m ≠ ±1 (signed m when reflection is not allowed); the minima
transport under mirror and simultaneous orientation reversal, not individual component reversal.

**Checks.**

- *Orientation check.* Reversing one component of L₄ (Arf 1) gives linking −2 and Arf 0, unlike
  L_(−4) (Arf 1): oriented braid index ≥ 3, unoriented index 2 (by evaluation).
- *Small members.* `L_0` is the two-component unlink, of braid index `2` since every one-strand
  closure is a knot; `L_(±1)` are unknots of index `1`; `L_(±2)` are the two Hopf links, of
  index `2`.
- *Determinant and linking.* For odd `|m| ≥ 3` the determinant is `|m|`, so `L_3` and `L_5` are
  not the unknot; for even `m` the linking number is `m/2`, separating `L_4` and `L_(−4)` (by
  evaluation).

*Needs:* Layers 4.1–4.4 for realized closures, component/linking data, Markov comparison and
Alexander/determinant normalization; native B₂ normal form, `permHom` and exponent sum. The torus
comparison and the Check consume 4.11 and 4.3.1/4.5.3 without feeding the classification.

### 4.8.3 Gordian distance and nonadditivity of unknotting number

On oriented tame knot types modulo orientation-preserving ambient isotopy, the Gordian distance
d(K,J) is the least number of crossing changes in a realized diagram movie from K to J, attained by
4.2's diagram/embedding comparisons and 4.7.1's descending construction. It is a metric with
u(K) = d(K,U), invariant under simultaneous mirror and simultaneous reversal, induces a distance on
unoriented types by minimizing over orientations, and satisfies |u(K)−u(J)| ≤ d(K,J), 6.2's
signature-distance bounds and d(K#L,J#M) ≤ d(K,J)+d(L,M) (disjoint sum balls); compare it with
4.10.3's one-diagram formulation, which a given diagram need not attain. The Gordian order A≼K is
`u(A)≤u(K) ∧ d(A,K)=u(K)−u(A)` (A≺K when also A ≠ K): a partial order, equivalent to occurrence on
a minimizing unknotting movie and transported by mirror and reversal. For natural δ ≤ u(A)+u(B),
transporting movies on the actual summands proves that A≼K, B≼J and u(A#mirror B)+δ ≤ u(A)+u(B)
imply u(K#mirror J)+δ ≤ u(K)+u(J).

**Five crossing changes.** `u(T#mirror T)≤5<6=u(T)+u(mirror T)` for T = T(2,7)
([Brittenham–Hermiller, *Unknotting number is not additive under connected sum*, Theorem 1.2 and
§2](https://arxiv.org/html/2506.24088v2)): σ(T) = −6 in 6.2's convention and three switches from
σ₀⁷ to σ₀ give u(T) = u(mirror T) = 3, and the upper bound is the five-switch path of Hypothesis
4.8.3a, read through a drawing comparison (the paper's signature convention is opposite) and, for its
signed Dowker–Thistlethwaite entries, 4.2.5's decoder.

**Hypothesis 4.8.3a (Brittenham–Hermiller path).** For the five-strand braid words, generators 1
to 4 read left to right,

```text
b  = [1,-4,2,3,3,3,2,3,2,2,4,-3,-3,-3,-3,-1,-3,-2,-3,-3]
b' = [-1,4,2,3,3,3,2,3,2,2,4,-3,-3,-3,-3,-1,-3,-2,-3,-3]
```

the closure of b is `T#mirror T`; b' switches its first two letters and closes to `K14a18636`; one
further switch gives `K15n81556`, one more `K12n412` and a last one the unknot
(Brittenham–Hermiller, Figures 3–6). Hence `u(K14a18636)≤3`, `u(K15n81556)≤2` and `u(K12n412)≤1`.

**Group and torus consequences.** u(T#T) = 6, by the signature −12 and six switches, while the
groups π₁(S³ \ K) of T#T and T#mirror T are isomorphic (meridional amalgams; the mirror isomorphism
of one factor with meridian inversion), so the knot group of a composite knot does not determine
its unknotting number (8.5.2 concerns prime knots). For k ≥ 3,
K_k = T(2,2k+1) has σ(K_k) = −2k and u(K_k) = k (two-strand signature matrix, k switches), and
k−3 switches with Reidemeister II cancellations reach T, so `u(K_k#mirror K_l)≤k+l−1` for
k,l ≥ 3, while u(K_k#K_l) = k+l by signature.

On `𝒯={T(p,q):2≤p<q, gcd(p,q)=1, (p,q)∉{(2,3),(2,5),(3,4)}}`, `u(T(p,q))=(p−1)(q−1)/2`: the upper
bound is 4.11's standard unknotting movie, the lower bound the Milnor conjecture
`g₄(T(p,q))=(p−1)(q−1)/2` with `g₄≤u` (Kronheimer–Mrowka, *Gauge theory for embedded surfaces I*,
Topology 32 (1993); Rasmussen, *Khovanov homology and the slice genus*, Invent. Math. 182 (2010),
Corollary 1), consumed as stated; its proof is CombinatorialHeegaardFloer's (Lane G, items 7
and 10, through its Lane K comparison with Layer 4's knots). Prove the coordinatewise adjacency
T(a,b) ≼ T(p,q) for coprime
positive a ≤ p, b ≤ q by monotone lifted diagrams and local crossing changes
([Feller, Theorems 2–3 and their thickened-torus proof](https://arxiv.org/html/1301.5248v2)).
With T(3,5) ≼ T(p,q) for p ≥ 3, q ≥ 5 (assuming Hypothesis 4.8.3b) and the two-strand movies for
p = 2, T ≼ K throughout 𝒯, hence `u(K#mirror J)+1≤u(K)+u(J)` for all K,J ∈ 𝒯.

**Hypothesis 4.8.3b (T(2,7) below T(3,5)).** One crossing change in a realized diagram of T(3,5)
gives T(2,7), so T(2,7) ≼ T(3,5) (Feller, Theorem 3, the case n = 7, m = 5 of n ≤ (4m+1)/3).

**The ten-crossing example and infinitely many intermediates.** Kawamura's theorem u(10₁₃₉) = 4
(Kawamura, *The unknotting numbers of 10₁₃₉ and 10₁₅₂ are 4*, Osaka J. Math. 35 (1998),
Theorem 1.3) is consumed as stated, its proof through the Seiberg–Witten adjunction inequality
being GeometricTopology, Part II's; with Hypothesis 4.8.3c,
T ≼ 10₁₃₉, so u(10₁₃₉#mirror T) ≤ 6 < 7 and u(10₁₃₉#mirror 10₁₃₉) ≤ 7 < 8, an instance of the
lower bound used in Brittenham–Hermiller Corollary 2.2.

**Hypothesis 4.8.3c (ten-crossing diagram).** The signed Dowker–Thistlethwaite word
`d10 = [12,14,-10,-20,-16,18,2,-8,4,-6]` is a diagram of 10₁₃₉, and switching its index-4 entry
gives `d10'= [12,14,-10,-20,16,18,2,-8,4,-6]`, a diagram of T.

Prove [Baader's intermediate-knot theorem](https://doi.org/10.1093/qmath/hai010): knots at Gordian
distance exactly 2 have infinitely many pairwise distinct knot types at distance 1 from both. As
in [Baader, *Gordian distance and Vassiliev invariants*, §2](https://arxiv.org/html/math/0703786),
move a minimizing two-change movie to neighbouring marked crossings A, B and insert a signed
slalom/twist with a new crossing C; for A positive, C is negative and a₂(K₀) − a₂(I_N) = lk(L_C),
L_C the oriented smoothing at C, so choosing the twist gives an intermediate I_N with Conway
coefficient a₂(I_N) = N for every integer N (likewise for A negative), by 4.4's Conway skein
relation and 4.3's linking number; a₂ separates types also up to mirror and reversal. For n ≥ 4,
T(2,2n+3) and T(2,2n−1) are at distance exactly 2, so the intermediates K_i have u(K_i) = n and
T ≼ K_i, giving `u(K_i#mirror K_j)≤2n−1`; only finitely many torus knots have u = n (factor pairs
of 2n), so infinitely many K_i are not torus knots; unoriented versions follow by a
finite-orientation-fibre argument.

**Arbitrarily large deficits, including prime summands.** For r ≥ 1 and m ≥ 3, the r-fold sum
Q_(r,m) of T(2,2m+1) has u = rm by signature, and pairing its summands with their mirrors gives
`u(Q_(r,m)#mirror Q_(r,m))≤r(2m−1)`: deficit at least r, with infinitely many examples for each r.
Every pretzel knot P(a₁,…,a_m), m ≥ 3, all a_i ≥ 2, exactly one a_i even, is prime by Menasco's
criterion (*Closed incompressible surfaces in alternating knot and link complements*, Topology 23
(1984), Theorem 1(b)): a connected reduced alternating knot diagram with a crossing represents a
prime knot iff every circle in S² meeting it transversely twice away from crossings bounds a
crossing-free disc on one side, proved by normalizing a decomposing sphere against the projection
sphere with crossing bubbles (4.9's sphere/isotopy prefix, no hyperbolization); the pretzel
diagram is connected, reduced and alternating, and a plane-graph argument excludes a two-point
circle with crossings on both sides. For n ≥ 2, one switch of the 2-box of P_n = P(7,…,7,2)
(n sevens) gives the n-fold sum of T, so |u(K)−u(J)| ≤ d(K,J) and the five crossing changes above
give 3n−1 ≤ u(P_n) ≤ 3n+1, u(P_n#mirror P_n) ≤ 5n+2 and, for n ≥ 4,
u(P_n#mirror P_n)+(n−4) ≤ 2u(P_n): n ≥ r+4 gives prime summands with deficit at least r. For odd
parameters 2k_i+1 ≥ 7, n ≥ 2, S = Σk_i, likewise S−1 ≤ u(P) ≤ S+1 and u(P#mirror P) ≤ 2S−n+2,
deficit at least n−4.

**Checks.**

- *Braid word.* `b` has `20` letters, exponent sum `0` and permutation orbit `0→4→2→1→3→0` under
  the direct zero-based encoding, which switching its first two letters preserves (by evaluation).
- *Signature bounds.* The signature lower bound on u is `0` for `T # mirror T` and `6` for
  `T # T` (by evaluation).
- *Lower endpoint.* At `n = 4` the intermediate construction has `T(2, 2n − 1) = T`, and
  `T ≼ T` holds by reflexivity of the Gordian order.

*Needs:* Layers 4.2–4.4, 4.7.1, 4.9–4.11 for realized diagrams, sum balls, crossing-change movies,
Seifert matrices and torus/pretzel models; 6.2's signature bound; the Milnor conjecture and
Kawamura's theorem consumed as stated (*Scope and ownership* names their owners).

### 4.9 Prime decomposition of knots and links

Prove Schubert's theorem: every nontrivial oriented knot is a connected sum of finitely many
nontrivial prime knots, uniquely up to order and oriented ambient isotopy of the factors
(Lickorish, Theorem 2.12), for 4.1's oriented classes and orientation-compatible sum in oriented
`S³`. Prime knots are nontrivial by definition; the unknot is the empty product.

**Existence and actual sphere systems.** Recursion on genus (4.3.4's positivity and additivity)
gives a finite system of disjoint locally flat two-point spheres realizing the factors, each arc
capped by a boundary arc to its factor knot independently of choices (2.2–2.3, 3.3 and 11.2 for the
relative ball and PL/smooth comparisons); a one-string ball tangle has unknotted closure iff it is
the standard trivial arc pair relative to its endpoints. A link splits along finitely many disjoint
balls into nonsplit sublinks, the partition independent of the balls. Nonsplit links factor under
4.3.4's selected-component (Hashizume) sum, by recursion on `β=2g+μ−1` inside a punctured `S³`
whose punctures are closed by trivial arcs: summands of nonsplit links are nonsplit, a decomposing
sphere of a composite closure is moved off earlier cap balls (cap-avoidance), and β drops in both
nontrivial branches. The resulting closures are prime, equivalently every two-point sphere bounds
on one side a ball containing just a trivial arc and no other component.

**Uniqueness with punctures.** Given two complete prime sphere systems in relative transverse
position, surger along a disc bounded by an innermost intersection circle, meeting the link in zero
or one points: the new spheres meet the link in zero or two points (oriented parity), nonsplitting
controls zero-point spheres and primeness controls trivial factors, and the surgery reduces the
intersection circles while preserving the multiset of nontrivial prime closures. Disjoint systems
have a common refinement, so the prime-factor multisets agree: Hashizume's uniqueness theorem and
Schubert's knot case (Hashizume, Osaka Math. J. 10 (1958);
[Melikhov, §§2–3](https://arxiv.org/html/2511.19579v1)), natural under relabelling, reversal and
mirror. The multiset is the invariant; reconstructing a link also needs the selected-component
gluing tree.

**The knot monoid and its quotient conventions.** Oriented knot types under connected sum (4.1's
classes) form the free commutative monoid `Multiplicative (Multiset PrimeOrientedKnotType)`, the
prime-factor map and reconstruction being inverse isomorphisms: unique factorization, both
cancellation laws, the unknot the only unit, genus additive, with mirror and simultaneous reversal
acting on the factor multiset. The coarse mirror quotient of knot tables is not a congruence: it
identifies one global reflection or reversal, not reflections of single summands, and is tested on
the full oriented factor multiset.

Unknotting-number-one knots are prime (Scharlemann, *Unknotting number one knots are prime*,
Invent. Math. 82 (1985), 37–55); 5.4 and 5.4.1 state and prove it, and this section does not use
it.

**Checks.**

- *Granny and square.* The granny and square knots have signatures of absolute value 4 and 0, so
  they are distinct modulo global reflection, where the trefoil equals its mirror (by evaluation).
- *Hopf chains.* The Hopf link is prime and nonsplit and the two-component unlink is split; two
  Hopf links summed along one selected component give the nonsplit three-component chain with
  two prime factors, `g = 0` and `β = 2`.
- *No inverses.* Every nontrivial knot `K` and every `J` satisfy `K # J ≠ unknot`; the empty
  product represents the unknot and is not an extra prime factorization.

*Needs:* 4.1, 4.3.4; 2.2–2.3 for Schoenflies/annulus and relative ball/cap comparisons, 3.3 for
supported isotopy extension, 11.2 for relative PL/smooth transport; native finite multisets and
commutative monoids; the Check consumes 6.2.

### 4.9.1 Spherical flypes and alternating classification

Flypes act on 4.2's spherical oriented diagrams (no fixed outer face) of tame links in oriented S³.
The prime theorem concerns reduced alternating diagrams of nontrivial nonsplit prime links, the
Hopf link included; the unknot and crossingless unlinks are separate, and crossing-minimal
diagrams need not be alternating.

**Actual local moves and chart changes.** A marked flype chart is an annulus around a circle in S²
meeting the diagram transversely in exactly one crossing and two regular points, its complementary
discs holding two four-ended tangles; the flype rotates one tangle by 180° about an axis in the
projection sphere, so its cyclic order is reflected **and** its over/under information reversed,
and moves the adjacent crossing across. Construct the resulting native data, crossing and component
bijections, inverse and a supported orientation-preserving ambient isotopy realizing it, and prove
it preserves crossing and component counts, crossing signs, writhe, alternation, reducedness and
diagram primeness. Keep distinct the flat chart change (an orientation-preserving homeomorphism of
S²), the entire flype (an orientation-reversing S² map with all crossings reversed, which preserves
the orientation of S³; [Kindred, §2.2](https://arxiv.org/html/2008.06490v3#S2.SS2)) and the mirror
(a bare reflection or crossing reversal, not an equivalence); independent component reversal is
not a relabelling, and spherical moves do not give fixed-outer-face plane equivalence.

**The prime theorem, including a prescribed pair map.** Prove the Tait flyping theorem: two
connected reduced alternating diagrams D,E of the same nontrivial nonsplit prime oriented tame link
are joined by finitely many flypes and flat chart changes; more strongly, every
orientation-preserving homeomorphism of oriented pairs `f:(S³,L_D)≅(S³,L_E)` with its component
correspondence is isotopic, through pair homeomorphisms preserving orientations and
correspondence, to a flype/flat-map composite (Menasco–Thistlethwaite, *The Tait flyping
conjecture*, Bull. Amer. Math. Soc. 25 (1991), 403–412, Theorem 1; full proof in *The
classification of alternating links*, Ann. of Math. 138 (1993), 113–171). This section owns the
proof, by the induction of the next three paragraphs.

**Rigid vertices and the induction.** Extend diagrams to four-valent rigid-vertex graphs (a framed
square disc with four ordered ports at each vertex), with reducedness, primeness and alternation
defined through compatible one-crossing replacements. Prove the zero-crossing base case by
straightening the graph regions, and induct on the number of ordinary crossings with arbitrary
rigid vertices and the given map: a matched pair of crossing balls is replaced by framed vertices,
the induction applied, and the crossings restored, preserving the pair-isotopy class of f.

**Simultaneous checkerboard geometry.** Both checkerboard surfaces (nonorientable ones included)
of the link or rigid graph, made proper in the exterior, satisfy the incompressibility and Euler
characteristic identities of the induction. Prove relative normal position of the two transported
surfaces against the two target surfaces (double arcs and circles, triple points, a decreasing
complexity) with innermost/outermost surgeries, and the crossing-ball matching lemma: an excellent
double arc, with no triple point and the full local quadruple `(N,N∩∂X,N∩F,N∩G)` of a standard
crossing ball, lets a pair isotopy make the ball map rigid.

**All three inductive alternatives.** Prove that every nonbase case satisfies A (an excellent arc,
cut along to produce matching crossing balls after flypes), B (the vertex/crossing configuration of
Menasco–Thistlethwaite's Figure 3(i), with flypes moving both crossings next to the vertices and
rectangular checkerboard-patch matching) or C (an essential visible Conway sphere, cut, induction
and reassembly), with the low-crossing exceptions, and prove each case. The detection uses
4.5/4.6.1's Jones, bracket and Kauffman polynomials and 4.8.1's adequacy, including the theorem
that switching one crossing of a reduced alternating n-crossing link diagram gives, if the result is
alternating, crossing number at most n−2; no hyperbolization, Mostow rigidity or knot table enters.

**Composite knots and crossing additivity for alternating knots.** Prove Menasco's
visible-decomposition theorem: every connected reduced alternating diagram of a composite knot has
a two-point projection circle with crossings on both sides, splitting it into two nontrivial
reduced alternating factor diagrams; recursion and 4.9's uniqueness match the visible factors with
any decomposition, so factors of alternating knots are alternating. Lifting prime-factor flypes
through the sum collars, with factor-exchange movies and orientations preserved, proves endpoint
flyping for all reduced alternating **knot** diagrams (not a factorization of every composite-pair
homeomorphism), and gives `c(K#J)=c(K)+c(J)` whenever K#J is alternating, compared with 4.8.1's
adequate-sum proof. Composite multi-component links keep 4.9's Hashizume/split data.

**Finite orbit.** For fixed n > 0 and component count, connected spherical diagrams without extra
crossingless components form a finite set up to relabelling (4.2.6's carrier; `PDCode n` alone is
infinite), on which reducedness, alternation and diagram primeness are decided. Marked flype
charts are given by finite face/port data, every geometric chart being equivalent to one so
given; flypes are invertible, natural and keep n crossings. The flype orbit of
a reduced alternating diagram is finite, so oriented-link equivalence of prime reduced alternating
diagrams, and of reduced alternating knot diagrams, reduces to it by constant-crossing movies (not
for non-alternating diagrams; 4.2.6's hard-unknot obstruction stands). Flypes and flat maps
generate the pair-homeomorphism isotopy classes, giving chirality and reversibility tests on the
marked mirror/reverse diagrams; a presentation of that group needs a separate relations theorem.

**Checks.**

- *Trefoil orbit.* Every flype of the standard three-crossing trefoil diagram gives it back up to a
  flat chart change, so its flype orbit has one element (by evaluation).
- *Flypes keep signs.* A flype preserves writhe, crossing count and the signs of the crossings
  under its bijection; a half-turn of a tangle that also mirrored it would change the signs and
  is excluded by the chart definition.
- *Alternating sums.* The granny knot has crossing number `3 + 3 = 6` by the visible-factor
  argument; the theorem says nothing about `c(K # J)` when `K # J` is not alternating.

*Needs:* 4.2's realized spherical diagrams, ambient pair maps and supported local moves; 4.3's
embedded band/checkerboard surfaces; 4.9's prime/split sphere, cap and uniqueness prefix;
2.2–2.3/3.3/11.2 for relative disc/ball topology, isotopy extension and PL/smooth comparison;
polynomial inputs and adequate minimality from 4.5/4.6.1/4.8.1, which do not use flyping.
### 4.10 Rational tangles and two-bridge knots

Define a rational tangle in a ball with four marked boundary points by the integer twist operations,
its fraction in `ℚ ∪ {∞}` through the continued fraction of the twists, and its numerator and
denominator closures. Prove Conway's theorem that two rational tangles are isotopic rel boundary iff
their fractions agree (Kauffman–Lambropoulou, *On the classification of rational knots*,
L'Enseignement Math. 49 (2003), Theorem 1) and Schubert's classification: the numerator closures of
`p/q` and `p'/q'`, `p, p' > 0`, are ambient isotopic as unoriented links iff `p = p'` and
`q' ≡ q^{±1} (mod p)`, and, for fractions written with `q, q'` odd (the numerator closures are then
orientation-compatible; for odd `p` an even `q` is replaced by `q + p`, which does not change the
unoriented knot), as oriented knots iff `p = p'` and `q' ≡ q^{±1} (mod 2p)` (Kauffman–Lambropoulou,
Theorems 2 and 3). The parity normalisation is part of the statement. Prove that the rational knots
are exactly the knots of bridge number at most two, that `p` is the determinant of the rational knot
`p/q`, and that the mirror of `p/q` is `p/(−q)`.

**Projective fractions, coefficient order and the canonical domain.** Slopes are native `WithTop ℚ`,
with reciprocal (0 ↔ ∞, q ↦ 1/q) and integer translations fixing ∞, and their involution,
composition and sign laws, without a field structure on the extended carrier. For an innermost-first
list w = (a₁, …, a_n), cf(w) starts at ∞ and applies `x↦a_i+1/x` in turn (intermediate 0 and ∞
allowed); it is the ordinary continued fraction of the list reversal of w, with prepend and append
formulas. Every positive rational has a unique normalized list: [a], a > 0, for an integer,
otherwise n ≥ 2 with a₁ ≥ 2, a_i ≥ 1 for 1 < i < n and a_n ≥ 0, where a_n = 0 exactly when x < 1; a
negative x negates the list of −x, 0 is [0] and ∞ the empty list. Prove existence, uniqueness and
decidability from `GenContFract.of`, `GenContFract.terminates_of_rat` and
`GenContFract.of_correctness_of_terminates`, normalizing by `[1,b]++v ↦ [b+1]++v`. The step
`[[a,1],[1,0]]` acts on primitive pairs (p, q), and w by M_(a_n)⋯M_(a₁) on (1, 0), with determinant
(−1)^n, representative independence, equality by cross-multiplication and comparison with the native
convergents.

Realize w as the marked twist/reciprocal tangle from 4.10.1's ports and gluing, matching the
recurrence, and compare Kauffman–Lambropoulou's outermost-first lists and crossing types (opposite
to Conway's) with it by relative tangle moves. These tangles have two open strands and no closed
component, and their boundary matching shows that N(T) is a knot iff p is odd and D(T) iff q is odd,
slopes 0 and ∞ included. The outermost-first Conway words of 4.4.8's fourteen prime models are the
reverses of these lists, compared in the same way; 4.4.8 owns those tables. See
[Kauffman–Lambropoulou, §§2–4](https://arxiv.org/html/math/0311499#S3).

**Checks.**
- *Projective evaluation.* cf([2,0]) = 1/2, cf([0]) = 0 and cf([0,0]) = ∞, which the field
  convention 0⁻¹ = 0 would make 0 (by evaluation).
- *Schubert's congruences.* `3 ≢ 2^(±1)` and `3 · 5 ≡ 1 (mod 7)`, so `5₂ = 7/2` differs from its mirror
  7/(−2) ≅ 7/3; 3/4, renormalized to 3/7, passes the oriented test against 3/1 (by evaluation).
- *Determinants.* `3/1`, `5/2` and `7/2` have determinants `3`, `5` and `7`, matching `|Δ(−1)|` in
  Layer 4.4 (by evaluation).

*Needs:* Layer 4.2, 4.10.1's independent port, twist and gluing prefix, Layer 4.4, 4.4.8's
small-prime dictionary, Layer 4.8; native continued-fraction, integer-matrix and list APIs. The
arithmetic and the marked tangles use no polynomial, bridge-minimum or classification result.

### 4.10.1 Algebraic tangle syntax and alternating closures

Algebraic tangles are finite expressions in the integer tangles (signed, 0 and ∞), horizontal sum
and the principal-diagonal reciprocal, realized as compact properly embedded one-manifolds in a ball
with four marked collared endpoints, with two open strands and finitely many closed components, all
retained under composition. Give the relative planar code (native crossing and four boundary slots,
a native `PerfectMatching` of edge ends, crossing-free circles, ports on the outer boundary in
cyclic order), its realization, endpoint-fixing isotopy and Layer 4.2's relative Reidemeister
comparison. Gluing identifies boundary slots, contracts the seams and registers circles created
without crossings; closure gives a native `PDCode` keeping every component; orientations are extra
data.

Ports are ordered NW, NE, SE, SW; 0 has horizontal strands, ∞ vertical ones, and 1 has NW–SE over
NE–SW. A + B joins A.NE to B.NW and A.SE to B.SW; I(A) is the reflection `(x,y,z)↦(−y,−x,z)` (z the
crossing height), fixing NW and SE, exchanging NE and SW and preserving over/under; negative
integers are crossing-height mirrors; the Conway product is `A·B=I(A)+B`. Prove I² = id, I(0) = ∞,
I(∞) = 0, naturality under reindexing, substitution, mirror and gluing, the associativity and unit
isotopies of the sum, and that on 4.10's rational tangles I sends the fraction x to 1/x (0 and ∞
included); fraction equality is used only on that subclass.

**Positive syntax and the boundary invariant.** Positive expressions are generated from 1 by sum and
I; they contain every positive rational word and every algebraic expression in such leaves, with
crossing count 1 at the primitive, additive under sum and invariant under I, and every port reaches
a crossing. Prove by syntax induction that the encounter words read with native `PDCode.isOver`
along the actual traversal alternate (`List.IsChain (· ≠ ·)` on open strands, cyclically on closed
components, empty on crossing-free circles) and that the ports' first-encounter statuses are
`(over,under,over,under)`: sum seams pair opposite statuses and I preserves the tuple. The numerator
closure (NW–NE, SW–SE) and denominator closure (NW–SW, NE–SE) pair opposite statuses, so both
closures of a positive expression are alternating links, every component kept, and mirroring gives
the negative case. This is an alternating representative only: reducedness, minimality and primeness
are separate.

**Checks.**
- *Closed components are retained.* ∞ + ∞ has vertical open strands and one crossing-free circle;
  N(0) is the two-component unlink and D(0) the unknot (by evaluation).
- *The product is neither commutative nor associative.* `1·2` has fraction 3 and `2·1` has 3/2;
  `(1·2)·3` has 10/3 and `1·(2·3)` has 9/2 (by evaluation).
- *A pretzel closure.* N(I(3)+I(3)+I(2)) is 4.7.3's marked pretzel diagram P(3,3,2), reduced and
  adequate, so of crossing number 8 by Layer 4.8.1 (by evaluation).

*Needs:* Layer 4.2 (relative codes, traversal, gluing, Reidemeister moves), Layer 4.10 (rational
constructors and their relative classification), native finite permutations and encounter words;
Layers 4.7.3 and 4.8.1 for the pretzel comparison. Conventions follow [Conway,
§1](https://webhomes.maths.ed.ac.uk/~v1ranick/papers/conway.pdf) and [Kauffman–Lambropoulou,
§2](https://homepages.math.uic.edu/~kauffman/rattl.pdf).

### 4.10.2 Equal Alexander polynomials and different transposition images

This section proves its statements from the constructions and named hypotheses it states and
cites no outside proof.

The stevedore knot 6₁ (the closure of slope 9/5, compared with slope 9/2 through `2·5≡1 mod 9`) and
the pretzel knot 9₄₆ = P(3,3,−3) (4.7.3's signed three-box model) have the same Alexander polynomial
−2t + 5 − 2t⁻¹ and determinant 9, and both admit colourings onto S₄, but only 9₄₆ admits one sending
meridians to transpositions; the distinction survives all orientation and mirror transports.
Assuming Hypotheses 4.10.2a and 4.10.2b: the S₄ witness gives a surjective colouring of 6₁ in the
4-cycle class, with arc labels and orbits from Layer 4.7.4; since br(6₁) ≤ 2, a generating
transposition colouring would force br ≥ 3 by Layer 4.7.2; the transposition star colours 9₄₆; the
polynomials come from the determinant Check.

**Hypothesis 4.10.2a (stevedore and pretzel models).** The numerator closure of 9/5 and 4.7.3's
signed pretzel P(3,3,−3) are the Knot Atlas knots [6₁](https://katlas.org/wiki/6_1) and
[9₄₆](https://katlas.org/wiki/9_46), with signed DT rows `[4,8,12,10,2,6]` and
`[4,10,−14,−12,−16,2,−6,−18,−8]`, and the group of the 9/5 model has the presentation ⟨a, b | a
w² = w² b⟩, w = b a⁻¹ b⁻¹ a, on positive meridians a, b.

**Hypothesis 4.10.2b (genus-one Seifert matrices).** These two knots bound genus-one Seifert
surfaces with matrices V₆ = [[1,0],[1,−2]] and V₉ = [[3,1],[2,0]] in the Seifert-matrix convention
of the Conventions.

**Checks.**
- *The S₄ witness.* In S₄ with right-to-left products, a = (1234) and b = (1243) give w = (132), a
  w² = w² b and a²b = (14), and generate S₄ (by evaluation).
- *The transposition star.* The labels ((12),(13),(14)) close through the boxes 3, 3, −3 of
  P(3,3,−3) under 4.7.3's signed transfer, with connected transposition graph (by evaluation).
- *The common determinant.* det(tV − Vᵀ) = −2t² + 5t − 2 for V = V₆ and V = V₉ (by evaluation).

*Needs:* Layers 4.3–4.4 (geometric Seifert and Alexander comparisons), 4.7.2–4.7.4 (transposition
bridge bound, signed pretzel transfer, conjugation orbits) and 4.10 (realized rational tangles,
inverse-slope classification, bridge presentation); native `FreeGroup`, `Group.Presentation`, finite
permutations and integral Seifert matrices.

### 4.10.3 Diagram unknotting numbers and the Nakanishi–Bleiler example

For a realized knot diagram D, its diagram unknotting number u_D is
`min{|S| : S is a subset of its crossings and switching S gives an unknot}`. Construct the switched
native PD code and realization; switching ∅ is the identity, switching twice switches the symmetric
difference, and switching commutes with reindexing, planar equivalence and mirror; a
descending diagram shows that the minimum exists. Prove `u(K)≤u_D≤c(D)` and `u(K)=min_D u_D`
for Layer 4.7.1's movie definition of u, carrying each crossing change of a movie through the
intervening isotopies.

**Explicit rational diagrams.** Here `[a₀,…,a_r]` is the right-nested fraction `a₀+1/(a₁+…+1/a_r)`
with its twist-box numerator closure (the reverse of 4.10's lists), and its primitive pair is
`P([])=(1,0)`, `P(a::w)=(a p+q,p)` for `P(w)=(p,q)`, the first column of the product of the matrices
`[[a,1],[1,0]]`, primitive and nonzero. A rational numerator closure is an unknot exactly when
`|p|=1` (including `(p,q)=(1,0)`); `p=0` gives the two-component unlink.

Let K be the closure of the reduced alternating diagram D = [5,1,4] of fraction 29/5 (the knot 10₈,
up to the ambient mirror), and E = [4,2,−2,2,−2,2], with fourteen crossings. Then c(K) = 10 by 4.8,
u_D = 3, u_E = 2 and u(K) = 2. Switching k crossings in a twist box of a crossings gives, by
Reidemeister II cancellations, a box of a − 2k crossings, so the Checks give u_D = 3 and u_E ≤ 2 (E
is K by Schubert's theorem, with the knot orientation forgotten). Assuming Hypothesis 4.10.3a, the
signature bound of Layer 6.2 gives u(K) ≥ 2.

**Every minimal diagram.** Prove `u_F≥3` for every diagram F of K with exactly 10 crossings, so no
minimal-crossing diagram realizes u(K). K is two-bridge, hence prime and alternating, so by 4.8 F is
reduced alternating (Thistlethwaite, *Kauffman's polynomial and alternating links*, Topology 27
(1988)) and by the flyping theorem of 4.9.1 lies in the finite flype orbit of D up to planar
equivalence, reindexing and orientation reversal; transport crossing subsets along the flypes and
conclude by Hypothesis 4.10.3b.

**Hypothesis 4.10.3a (signature of K).** A marked Seifert surface of K has push-off pairing matrix
of real signature ±4, so |σ(K)| = 4.

**Hypothesis 4.10.3b (the flype orbit of D).** For every diagram in the flype orbit of D, switching
any set of at most two crossings gives a nontrivial knot.

**Checks.**
- *Switches of D.* For the nine triples with k₀ + k₁ + k₂ ≤ 2, k₁ ≤ 1, [5−2k₀, 1−2k₁, 4−2k₂] has |p|
  ∈ {3,5,9,11,17,19,29}; (1,1,1) gives [3,−1,2], pair (−1,−1) (by evaluation).
- *Switches of E.* E has pair (29,6), 5 · 6 ≡ 1 (mod 29); switching one crossing in boxes 2 and 4
  gives [4,0,−2,0,−2,2], zero boxes kept, with pair (1,2) (by evaluation).
- *Small diagrams.* The empty-circle diagram has `u_D = 0`; the standard three-crossing trefoil
  diagram has `u_D = u(K) = 1` (by evaluation).

*Needs:* realized diagrams, Reidemeister equivalence and finite plane codes; the numerical-invariant
minimum, movie and descending constructions; Seifert surfaces and pairings, rational-tangle
realization and classification, and the signature crossing-change bound; native `Finset`, `Fin`,
`Matrix (Fin 2) (Fin 2) ℤ`, `Int.gcd` and the continuant recurrences. See [Bleiler, *A note on
unknotting number*, Math. Proc. Cambridge Philos. Soc. 96 (1984),
469–471](https://doi.org/10.1017/S0305004100062381).

### 4.10.4 A marked Whitehead component exchange

Let W be the numerator closure of the marked rational tangle with innermost-first coefficients
`[2,1,2]` (fraction 8/3, five crossings), with components W₀, W₁ marked by the closure ports. Give
its marked comparison to 4.11's zero-twist Whitehead clasp link and, deciding the mirror branch, to
the Whitehead PD row of 4.15, which consumes it. The diagram is connected, reduced and alternating,
so c(W) = 5 by 4.8's bracket-span minimality. That the two components of the Whitehead link are
interchangeable is classical; this section proves it from the explicit movie or isotopy formulas
below and cites no outside proof.

**The geometric exchange.** There is a native `TauCeti.AmbientIsotopy` H of S³ starting at the
identity with H₁(Wᵢ) = W_(1−i). Construct it as a finite movie of realized marked diagrams from W to
itself with the markings transposed, or by explicit ambient-isotopy formulas (or a link isotopy
extended by 3.3) with a movie extracted by 4.2's generic-position comparison; export the movie, the
ambient map, the inverse exchange, concatenations, transport A ∘ H₁ ∘ A⁻¹ along marked comparisons A
and R ∘ H ∘ R⁻¹ for a global reflection R. Relabelling an unchanged diagram is not an exchange; H
need not fix the satellite axis, and no order-two claim is made.

**Orientations and peripheral transport.** For chosen orientations let sᵢ ∈ {−1, 1} be the sign of
H₁ on Wᵢ; reorienting by oᵢ changes it to oᵢsᵢo_(1−i), so s₀s₁ is independent of the orientations;
prove the inverse and composition laws. With 5.1's peripheral markings, H₁ exchanges the boundary
tori with μᵢ ↦ sᵢμ_(1−i) and λᵢ ↦ sᵢλ_(1−i) in the positive-meridian, preferred-longitude bases, and
the based fundamental-group comparison conjugates both peripheral generators simultaneously.

**Checks.**
- *The Whitehead fraction.* cf([2,1,2]) = 8/3; the closure has two components, determinant 8 and
  linking number 0, unlike the (2,4) torus link N(4/1) with linking number 2 (by evaluation).
- *Sign product.* The product `s₀ s₁` is independent of the chosen orientations, since
  reorienting changes `(s₀, s₁)` to `(o₀ s₀ o₁, o₁ s₁ o₀)` and `o₀² o₁² = 1` (by evaluation).
- *Relabelling is not an exchange.* Exchanging the labels of an unchanged diagram is not a movie:
  the component bijection of the identity movie is the identity, and the target requires
  `H₁(W₀) = W₁`.

*Needs:* 4.1–4.2's tame links, realized marked diagrams and supported movies; 3.3's ambient
extension; 4.10–4.10.1's rational ports, twists and closures; 4.8's reduced-alternating minimum.
4.11's clasp construction and 5.1's peripheral markings enter only through comparisons.

### 4.10.5 Two-bridge links as rational links and continued fractions

This section proves that every two-bridge link is the numerator closure of a rational tangle of
4.10, with its continued-fraction conventions, without 4.10's polynomial, minimal-bridge and
Schubert classification results; 4.4.8 uses it.

**Two-bridge presentations.** A two-bridge presentation of a link `L ⊂ S³` is a collared
`2`-sphere `Σ ⊂ S³` meeting `L` transversely in four points such that, on each side of `Σ`, the
ball meets `L` in two arcs that are simultaneously boundary parallel: there are two discs with
interiors disjoint from each other and from the arcs, each cobounded by one arc and an arc of
`Σ` (a trivial two-string tangle). Prove that `L` has such a sphere exactly when it has a realized
plane diagram (4.2) with two overpasses covering every overcrossing, the two descriptions being
compared in both directions.

**Schubert's normal form.** Prove: for a link `L ⊂ S³` with a two-bridge presentation there are
coprime integers `p ≥ 0` and `q` and an ambient isotopy of `S³` carrying `L` onto the numerator
closure of the rational tangle of the fraction `p/q` (4.10), respecting the orientations and the
component labels of `L`; two-component links and the degenerate fractions (`p ≤ 1`, and `∞`) are
included. Through 4.10.1's twists the same isotopy carries `L` onto the four-plat closure of an
integer twist word whose continued fraction, in the right-nested order fixed below, is `p/q`. A
four-plat closes adjacent pairs of four endpoints at both ends; it is not 4.2's braid closure and
gives no braid-index bound.

The route cuts `S³` along `Σ` and along the two disc systems, which identifies each side with the
standard trivial two-string tangle, and keeps the orientation-reversing gluing map `g` of the
four-pointed sphere; for the standard cap gluing `J`, `f = g ∘ J⁻¹` is orientation-preserving. The
theorem is the factorization of `f` into half-twists and a map that extends over the trivial
tangle. After an isotopy making `f` the identity near a small disc, the Alexander isotopy
`H_t(x) = t f(x/t)` is a PL isotopy from the identity to `f` whose marked-point trajectories form a
geometric four-braid; smoothed by 4.2.4, its half-twist word is read by 4.2.8's reading lemma
(Artin.P), and the residual map, fixing the marked points, extends over the trivial tangle by
isotopy extension along the trajectories and a cut along the tangle's discs. The relations among
the half-twists then bring the word to the form of a continued fraction, the expansion of `p/q`.
The four-marked-point form of Layer 1.7.2's cut systems (points replaced by boundary circles,
permuted by half-twists) and the four-plat closure, with 4.10.1's gluing and 4.2.8's `BraidWord`
conventions, are built here.

**The four-plat word.** Through 4.10.1's twists and 4.10's normalization, an odd-length normalized
outermost-first list c gives the native four-strand word
`B(c) = σ₂^c₁ σ₃^(−c₂) σ₂^c₃ ⋯ σ₂^c_n` (σ₂, σ₃ of native index 1, 2, read bottom to top, caps
(1,2), (3,4) at both ends, strand 1 unused); an even-length list splits its last a into (a−1, 1),
or (a+1, −1) if negative, and 0, ∞ are separate. Prove that the four-plat closure of `B(c)` is
isotopic to the numerator closure of the rational tangle of `F(c)`, up to one global mirror, and
determine that mirror by the case `c = [3]`: whether the plat of three positive half-twists is the
right-handed trefoil of 4.11 or its mirror. Translation x ↦ x + 1 and the quarter-turn x ↦ −1/x
have determinant +1 while the recurrence `[[a,1],[1,0]]` has determinant −1; prove the
alternating dictionary of frames, reflections and signs that this forces.

**The two continued-fraction orders.** The right-nested value F(c₁,…,c_n) = c₁ + 1/(c₂ + ⋯ + 1/c_n)
is defined projectively by `F(w)=cf(reverse(w))`, so F([]) = ∞. The two orders give different marked
tangles whose closures may agree or be mirrors, so a knot label does not validate the order. 4.4.6's
fourteen-surface table uses this construction.

**Mirror and amphichirality.** Negating all coefficients mirrors the twist diagram and its closure,
so F(−w) = −F(w), represented by (p, −q) for p > 0. For odd p > 1 and gcd(p, q) = 1, Schubert's
theorem with its inverse-denominator branch gives that K(p, q) is amphichiral exactly when q² ≡ −1
(mod p); p = 1 is the unknot, and oriented statements use the odd-denominator normalization and
the congruence mod 2p. Prove that an amphichiral class contains a reduced fraction `p/q` with
`0 < q ≤ p/2` whose positive continued-fraction expansion has even length and is a palindrome
(for an expansion of length `n` with matrix `[[p, r], [q, s]]`, the reversed expansion has value
`p/r` and `rq ≡ (−1)^(n+1) (mod p)`, so `q² ≡ −1` with `n` even forces `r = q`), and that for such a
fraction a half-turn of the four-plat followed by a slide of the closing arcs is an isotopy from
`K(p, q)` to its mirror. The normal-form theorem above uses none of this. Compare
[Kauffman–Lambropoulou, rational knots, §§1/4](https://arxiv.org/html/math/0212011) with their
[rational-tangle normalization paper, §§2–4](https://arxiv.org/html/math/0311499).

**Checks.**
- *The order of the continued fraction.* F([4,3]) = 13/3 but cf([4,3]) = 13/4, a mirror closure as
  3 · 4 ≡ −1 (mod 13) (by evaluation).
- *The inverse-denominator branch.* 13/5 is amphichiral as 5² ≡ −1 (mod 13), its mirror 13/8
  matching only through 8 ≡ 5⁻¹ (mod 13) (by evaluation).
- *A palindrome.* `F([2, 1, 1, 2]) = 2 + 1/(1 + 1/(1 + 1/2)) = 13/5`, an even-length palindrome with
  `0 < 5 ≤ 13/2`, as the amphichirality statement predicts from `5² = 25 ≡ −1 (mod 13)`; the
  odd-length palindrome `F([2, 1, 2]) = 2 + 1/(1 + 1/2) = 8/3` has `3² = 9 ≡ +1 (mod 8)`, the other
  sign (by evaluation).
- *Two orders.* `F([2,2,3]) = 2 + 1/(2 + 1/3) = 17/7` while `cf([2,2,3]) = 3 + 1/(2 + 1/2) = 17/5`,
  and `F([5,1,2]) = 17/3` against `cf([5,1,2]) = 17/6` (by evaluation).

*Needs:* 4.2's realized relative diagrams, supported isotopies and ambient extension; 4.10.1's
marked tangle operations; 4.10's projective normalization; Layers 1.1, 1.7.2, 3.3 and Tau
Ceti's Jordan curve and Schoenflies theorems; 4.2.8's geometric braid comparison, through
ReductiveGroups §11A. 4.4.8's group calculations, 4.8's bridge minima and 4.10's Schubert
classification and mirror statements use this section.

### 4.11 Torus knots, satellites and Whitehead doubles

Define the torus knot `T(p, q)` for coprime `p, q` as the image of `u ↦ 2⁻¹ᐟ² (u^p, u^q)` in the
unit sphere of `ℂ²`, a smooth circle embedding by the immersion criterion
`TauCeti.isImmersion_iff_forall_isImmersionAt` and compactness. Prove `T(p, q) ≅ T(q, p)` by the
ambient isotopy `U_t = P₊ + e^{πit} P₋` of `S³` through unitary maps, `T(p, −q)` is the mirror of
`T(p, q)`, `T(−p, −q)` is the reverse of `T(p, q)`, and `T(p, q)` is the unknot when `|p| ≤ 1` or
`|q| ≤ 1` by the explicit isotopy `u ↦ (√(1 − s²) u, s u^q)`. Prove that `T(p, q)` for `p, q ≥ 2` is
the closure of `(σ₁ ⋯ σ_{p−1})^q`, has genus `(p − 1)(q − 1)/2`, Alexander polynomial
`(t^{pq} − 1)(t − 1) / ((t^p − 1)(t^q − 1))` up to normalization; its chirality is Layer 6.2's
theorem, through the signature. Define satellites with a pattern P in a marked solid torus and
companion J, using the preferred longitude for the Seifert framing. Define geometric wrapping as the
minimum meridional-disc intersection number, distinct from algebraic winding. For every tame pattern
P and nontrivial tame companion J, prove Schubert's lower bound `br(P(J))≥w_geom(P)·br(J)` (Schubert
1954).

**The closed Jones formula.** For coprime p, q ≥ 1, with g = (p−1)(q−1)/2, the native closure of
`(σ₁⋯σ_(p−1))^q` with positive generators is the marked torus model and, in ℤ[t],
(1−t²)V_T(p,q)(t) = t^g(1−t^(p+1)−t^(q+1)+t^(p+q)); construct the quotient in ℤ[t], compare it with
the native half-variable invariant at t = u²; the quotient is 1 if p or q is 1, and V ≠ 1 for p,
q > 1 (least exponent g, coefficient 1); negative parameters follow by mirror and reversal. Compute
it by the geometric trace comparison with the generic Temperley–Lieb/Hecke block and character
suppliers of 4.5 and 4.6.3, from the Coxeter-power character with every normalization factor,
descending the rational-function identity to ℤ[t] without evaluating denominators at their zeros
([Jones, §7.5](https://math.berkeley.edu/~vfr/jonesakl.pdf#page=44)).

For ε = ±1 and m ∈ ℤ construct the marked Whitehead pattern W_(ε,m) (signed clasp, marked cut and
ports, m full meridional twists relative to the preferred longitude) with a finite oriented
crossing/cap code, solid-torus realization and inverse, mirror and framing-change laws. Prove
algebraic winding 0 and geometric wrapping 2: a meridional disc meets the pattern twice, the
zero-twist pattern link and its mirror are nonsplit by the colouring Check and Layer 4.7's product
theorem (a split two-component link has at least 9 Fox 3-colourings), and mirrors and meridional
twists of the solid torus preserve wrapping. For every companion J, W_(ε,m)(J) bounds a
once-punctured torus and is unknotted by one clasp change, so genus and u are at most 1, and a
b-bridge companion gives at most 2b maxima with the clasp and twists on monotone strands. For
nontrivial J the companion torus is essential, so `br(W_(ε,m)(J))=2br(J)` and genus = u = 1; for the
unknot companion identify the rational twist-knot and unknot branches, of bridge number 2 and 1.
Compute the Seifert matrix and prove that every untwisted double of a nontrivial knot has Δ = 1.

**Checks.**
- *The torus trefoil.* `T(2, 3)` is the right-handed trefoil: its closure is `σ₁³`, with genus `1`,
  Alexander polynomial `t − 1 + t⁻¹` and Jones polynomial t + t³ − t⁴ (by evaluation).
- *Circle and great circle.* `T(0, 1)` is the circle `{(1/√2, u/√2)}`, isotopic to
  `TauCeti.SmoothCircleEmbedding.greatCircle` through `(cos θ, u sin θ)`, `θ ∈ [π/4, π/2]`, but not
  equal to it (by evaluation).
- *Whitehead colourings.* The zero-twist Whitehead pattern link has exactly three Fox 3-colourings
  (by evaluation).

*Needs:* Tau Ceti `TauCeti.isImmersion_iff_forall_isImmersionAt`, `TauCeti.unknot`,
`TauCeti.SmoothCircleEmbedding.greatCircle`; Layer 3.3 (smooth-family isotopy extension); Layer 4.3,
Layer 4.4, Layer 4.8.

### 4.11.1 Indexed cinquefoil doubles with unbounded bridge number

For k ≥ 1 put N = 2k + 3 and let K_k be the closure of the positive braid `β_k=σ₁⁵σ₂⁵⋯σ_k⁵` on k + 1
strands, with its connected-sum comparison with k copies of T(2,5) and its (k+1)-bridge position.
For the least m ∈ {0,1,2} for which the construction below closes, which exists, the Whitehead
double D_k = W_(+,m)(K_k) satisfies `b(D_k)=2k+2` and `g(D_k)=u(D_k)=1`: knots of genus one and
unknotting number one with unbounded bridge number, proved without the general satellite lower
bound.

Label the bridges, with right-to-left composition, c₀ = (123) and c_j = (3, 2j+2, 2j+3) for
1 ≤ j ≤ k. Adjacent labels are 3-cycles sharing one letter, so they satisfy the braid relation of
length five and are fixed by the fifth power of the Hurwitz crossing map H(s,t) = (sts⁻¹, s),
matched with the Wirtinger convention; each block closes. They factor as the ordered transposition
pairs ((13),(12)) and ((3,2j+3),(3,2j+2)), whose edges form a tree on N vertices, so the factors
generate S_N by Layer 4.7.2. Double the diagram by cabling each crossing as σ₂σ₁σ₃σ₂, whose Hurwitz
action is (s,t,u,v) ↦ ((st)u(st)⁻¹, (st)v(st)⁻¹, s, t), and close by 4.11's clasp W_(+,m) along the
Seifert-framed companion. H, hence a full twist, cycles the three ordered factorizations of a
3-cycle, so a correction of q_j ∈ {0,1,2} full twists at every return port closes the colouring,
transported to W_(+,m) by an explicit movie; as H⁶ = 1, m may be reduced modulo 3. The transposition
colouring gives b(D_k) ≥ N − 1 by Layer 4.7.2, the doubled (k+1)-bridge position the reverse
inequality, and 4.11's punctured torus and clasp change give g, u ≤ 1. Compare [Baader–Kjuchukova,
§2](https://arxiv.org/html/1711.08144#S2), a related chain-label construction.

**Checks.**
- *The case k = 1.* c₀ = (123) and c₁ = (345) satisfy c₀c₁c₀c₁c₀ = c₁c₀c₁c₀c₁ and are fixed by H⁵;
  their factors generate S₅, while c₀, c₁ generate only A₅ (by evaluation).
- *The factorization cycle.* H maps ((13),(12)) ↦ ((23),(13)) ↦ ((12),(23)) ↦ ((13),(12)) (by
  evaluation).
- *The braid β_k.* `β_k` has exponent sum `5k` and permutation `(12)(23)⋯(k k+1)`, a
  `(k+1)`-cycle, so its closure is a knot; `k = 1` gives `T(2, 5)` with `N = 5` and `b = 2` (by
  evaluation).

*Needs:* Layer 4.7.2 (group colourings, transposition-graph criterion, bridge bound), Layer 4.2's
realized braids, Layer 4.4's Wirtinger presentation, and Layer 4.11's marked Whitehead pattern,
punctured-torus and clasp witnesses and bridge upper bound (not its lower bound).

### 4.11.2 Signed Whitehead surfaces and their Seifert matrices

For ε = ±1, m ∈ ℤ and every tame oriented companion J, build the marked surface and Seifert matrix
of W_(ε,m)(J) on 4.11's pattern. The framing m is measured against the preferred longitude of J by
the linking of the core with its parallel; for a companion diagram of writhe w, inserting m − w
signed full twists into the blackboard parallel gives framing m.

**The actual two-band surface.** The annulus with core J and framing m, plumbed with the ε-clasp
Hopf band, is a connected oriented one-disc/two-band surface with boundary W_(ε,m)(J), χ = −1 and
H₁ ≅ ℤ². With x₀ the clasp core and x₁ the annular core (x₀·x₁ = −1), the Seifert form
`V_ij=lk(x_i,x_j⁺)` of the Conventions is V_(ε,m) = [[−ε,0],[−1,m]], with Vᵀ − V = [[0,−1],[1,0]],
the mixed entries coming from the local plumbing computation; it is independent of J, agrees with
the native `IntegralSquareMatrix` presentation, and m ↦ m + k adds k to the second diagonal entry.
With `S_ε=[[1,0],[−ε,1]]`, `S_ε V_(ε,m) S_εᵀ=[[−ε,1],[0,m]]`. The geometric mirror
`mirror(W_(ε,m)(J)) ≅ W_(−ε,−m)(mirror J)` carries the surface to one with matrix −Vᵀ, and
`C_ε=[[-1,0],[ε,−1]]` gives `C_ε(−V_(ε,m)ᵀ)C_εᵀ=V_(−ε,−m)`, as a surface and basis comparison.

**Alexander modules and finite colors.** In the native Laurent ring Λ, with t = `T 1`,
tV − Vᵀ = [[−ε(t−1),1],[−t,m(t−1)]] has determinant t − εm(t−1)², so Δ_(ε,m) = 1 − εm(t + t⁻¹ − 2),
equal to native `KnotTheory.alexander`, symmetric, with Δ(1) = 1. The unit entry identifies the
cokernel, and so H₁ of the infinite cyclic cover, with Λ/(Δ); the native unreduced PD module is
Λ ⊕ Λ/(Δ) through the meridian splitting. The determinant is d = |4εm + 1|, odd, and for every
commutative ring R the Fox colourings satisfy `Col_R ≃ R × {a : R | (4εm+1)a=0}` through the
geometric Fox and Seifert comparisons; hence modulo n ≥ 1 there are n·gcd(n,d) colourings,
n·(gcd(n,d)−1) nonconstant, and the based rank over a prime field is 1 exactly when the prime
divides d, otherwise 0 (n = 1, characteristic 2 and m = 0 included). For m ≠ 0 the Laurent span is
2, so g = u = 1, ordinary-genus additivity makes the knot prime, and for fixed J and ε distinct m
give distinct polynomials. For m = 0, Δ = 1, which does not prove triviality: give an unknotting
movie for W_(ε,0)(unknot), and for nontrivial J use 4.11's essential companion torus for g = u = 1
and primeness. For every unknot-companion branch construct the marked rational-tangle comparison
with the [2,2m] family, through its coefficient order, ports and mirror/inversion comparisons.

**Complete rank-two signature function.** With the native real matrix signature,
`tristramLevineForm`/`tristramLevineSignature` and ω on the native `Circle`, put c = |1 − ω|² and
a = 1 + εmc. Then H_ω = [[−εc, conj(ω)−1], [ω−1, mc]] has det H_ω = −c·a; at ω = 1 it is 0, and
otherwise its signature is 0, −ε or −2ε as a > 0, a = 0 or a < 0, with nullity 1 exactly at a = 0.
If εm ≥ 0 the signature function vanishes; if εm < 0 it is −2ε between the two unit-circle Alexander
roots c = −1/(εm) away from 1, 0 on the arc containing 1, and −ε, the mean of the one-sided limits,
at the roots. At ω = −1, σ(V) = −2ε for εm < 0 and 0 otherwise.

**Calibrations and explicit surfaces.** For the unknot companion, give the diagram and surface
comparisons of W_(+,−1) with the positive trefoil and of W_(+,1) with the figure-eight; the matrix
congruences of the Checks do not by themselves identify the knots. Compare
[Balm–Friedl–Kalfagianni–Powell, §7.1](https://friedl.app.uni-regensburg.de/papers/genusone12.pdf)
for the plumbing matrix and
[Hedden, pp. 2278–2279](https://msp.org/gt/2007/11-4/gt-v11-n4-p08-s.pdf) for preferred framing and
the positive-clasp polynomial, keeping the push-off and sign comparisons.

**Checks.**
- *Trefoil and figure-eight calibration.* S₁ V_(+,−1) S₁ᵀ = [[−1,1],[0,−1]], the Conventions'
  trefoil matrix, and for `Q=[[0,1],[−1,0]]`, `Q V_(+,1) Qᵀ=figureEightSeifertMatrix` (by
  evaluation).
- *Signature at −1.* `H_(−1) = [[−4ε, −2], [−2, 4m]]` has determinant −4(4εm + 1) and signature 0
  for εm ≥ 0, −2ε for εm < 0 (by evaluation).
- *Table rows.* `det(V + Vᵀ) = −4εm − 1`; `(+, −1)` gives `t − 1 + t⁻¹`, `d = 3`; `(+, 3)` gives
  `−3t + 7 − 3t⁻¹`, `d = 13`; `(+, −3)` gives `3t − 5 + 3t⁻¹`, `d = 11` (by evaluation).

*Needs:* 4.11's marked pattern, annular and clasp construction; 4.2's realized diagrams and mirror
movies; 4.3/4.3.2's embedded bands, homology bases and push-offs; 4.4's geometric Seifert, cover and
PD module comparisons; 4.4.2 and 4.7's Fox specialization and marked constant split; the
clasp-change and ordinary-genus prefixes of 4.8 and 4.3.4; native integral matrices, Laurent
modules, quotients, `Matrix.signature` and the Hermitian signature API. The rank-two calculations do
not use 4.11.1's bridge family or 6.2's concordance applications.
### 4.11.3 Bridge calibrations and independent numerical invariants

Sharp bounds, explicit families and independence theorems for the genus, bridge, unknotting,
Alexander, Fox-rank and signature invariants of realized tame knots. d(K) ∈ ℕ is the breadth of
the normalized Δ_K, σ(K) = σ(K, −1) in the sign of the Conventions, and |σ(K)| in natural-number
bounds is `Int.natAbs (σ(K))`; the independence statements involve only |σ|.

**Elementary comparisons.** In a Morse height position of an embedded circle, maxima
and minima alternate with equal positive counts (compared with 4.7.1's overpass normal forms).
Bridge positions of K and J with a and b maxima give one of K # J with a + b − 1, cancelling a
maximum/minimum pair across the gluing; with Schubert's lower bound (4.8) this is exact for
minimal a, b. A crossing-bearing plane knot diagram has at least two Seifert circles (planar
no-loop argument; not for abstract ribbon PD codes) and Seifert genus 2g_D = n − s + 1 ≤ n − 1,
so for nontrivial K, whose minimal diagrams have c(K) ≥ 1 crossings, 2g(K) + 1 ≤ c(K) (equality
for the trefoil, 3 ≤ 3; the unknot, with c = g = 0 and one Seifert circle, is excluded);
d(K) ≤ 2g(K), with equality for T(2, 2r + 1). The bounds r_p ≤ b − 1 and
r_p ≤ u are 4.7.1's and |σ| ≤ 2u is 6.2's. The three-bridge example is 8₅ = P(3,3,2), with a
three-overpass position and the meridian presentation of
[Teragaito, §4.1, equation 4.1](https://doi.org/10.1017/S0004972718000539) (Check below).

**The full family constructions.** With T = T(2,3), S = T # mirror(T) and W = W_(+,0)(T) the
untwisted positive-clasp Whitehead double, construct for r ≥ 1, with marked joining data,
diagrams, bridge positions and gluing maps natural in the choices, `A_r=T(2,2r+1)`,
`B_r=#^r S`, `C_r=#^r W`, `J_r=#^r T` and `E_r=W_(+,0)(J_r)`, and prove: A_r has
Δ = Σ_(j=0)^(2r) (−1)^j t^(j−r), b = 2, g = u = r, σ = −2r; B_r has Δ = (t − 1 + t⁻¹)^(2r),
b = 2r + 1, g = u = 2r, σ = 0; C_r has Δ = 1, b = 3r + 1, g = r, 1 ≤ u ≤ r, σ = 0; E_r has
Δ = 1, b = 2r + 2, g = u = 1, σ = 0. Bridge numbers come from A_r's rational model (4.10),
Schubert's formula and 4.11's satellite bound (b(W) = 4, b(E_r) = 2b(J_r)); genera from
explicit surfaces, additivity and breadth; Δ and σ from block-sum surfaces, 6.2's torus
signature and 4.11.2's m = 0 Seifert matrix; u from explicit crossing or clasp changes against
the signature bound (A_r), the based mod-3 rank 2r (B_r) and nontriviality. Every based Fox
rank of C_r and E_r vanishes, p = 2 included, their determinant being 1.

**Precise independence conclusions.** For every F : ℕ → ℕ each of `d(K)≤F(b(K))`,
`|σ(K)|≤F(b(K))`, `g(K)≤F(b(K))`, `u(K)≤F(b(K))`, `b(K)≤F(d(K))`, `b(K)≤F(|σ(K)|)`,
`b(K)≤F(g(K))` and `b(K)≤F(u(K))` fails for some knot: A_r with r = F(2) + 1 for the first four,
C_r with r = F(0) + 1 for the fifth, B_r with r = F(0) + 1 for the sixth and E_r with
r = F(1) + 1 for the last two. The independence of the prime ranks is 4.7.1's.

**Checks.**
- *The cinquefoil row.* A₂ = T(2,5) has Δ = t² − t + 1 − t⁻¹ + t⁻², d = 4 and σ = −4, as the
  A_r row predicts at r = 2 (by evaluation).
- *Three-bridge 8₅.* In Teragaito's presentation, a, b, c ↦ (12), (34), (23) satisfies both
  relators and generates S₄, so 4.7.2 gives br(8₅) ≥ 3 (by evaluation).
- *The square-knot row.* `B_1 = T # mirror(T)` has `Δ = (t − 1 + t⁻¹)²`, `b = 3 = 2 + 2 − 1`,
  `g = 2`, `u = 2` (based mod-`3` rank `2`) and `σ = −2 + 2 = 0`, so `|σ| ≤ 2u` is not an equality
  in general (by evaluation).

*Needs:* 4.1–4.4 (marked sums, genus, Alexander and surface comparisons); 4.7.1–4.7.3 (overpass
positions, Fox ranks, transposition labels, signed pretzels); 4.8 (Schubert's bridge theorem);
4.10 (rational models); 4.11–4.11.2 (satellites, surfaces, doubled positions); 6.2 (signature).

### 4.12 Braid groups, Garside structure and Brunnian links

Consume `TauCeti.BraidGroup n` with its Artin generators `TauCeti.BraidGroup.sigma`. Define the
positive braid monoid and prove it embeds in `B_n`; define the Garside element `Δ_n` (the half
twist) and prove `Δ_n²` is central and generates the centre for `n ≥ 3`. A positive permutation
braid is a positive braid in which each pair of strands crosses at most once; its starting set
`S(s)` and finishing set `F(s)` are the generators `σ_j` with which some positive word for `s`
begins, respectively ends. Prove the Garside normal form: for `n ≥ 2`, every braid is uniquely
`Δ_n^k s₁ ⋯ s_r` with `k ∈ ℤ`, `r ≥ 0` and `s₁, …, s_r` positive permutation braids other than
`1` and `Δ_n` forming a left-weighted sequence, `S(s_(i+1)) ⊆ F(s_i)` for `1 ≤ i < r` (Garside,
Quart. J. Math. 20 (1969); Epstein et al., *Word Processing in Groups*, Chapter 9;
Elrifai–Morton, Quart. J. Math. 45 (1994)). Deduce that two braid words represent
the same braid iff they have the same normal form, and prove that the super summit set of a
conjugacy class is finite, nonempty and connected under conjugation by simple elements, so
that conjugacy of braids is decided by it (Elrifai–Morton, op. cit.). Strand
deletion, Milnor invariants and the Brunnian families are 4.12.1's, independent of these.

**Checks.**
- *Centres.* `Δ₂ = σ₁` and `B₂ ≅ ℤ`; `Δ₃ = σ₁σ₂σ₁`, and `Δ₃²` generates the centre of `B₃`,
  with quotient `PSL(2, ℤ)` (by evaluation).
- *Normal forms.* `σ₁σ₂σ₁` and `σ₂σ₁σ₂` have normal form `Δ₃`; `σ₁σ₂⁻¹` has normal form
  `Δ₃⁻¹ · σ₂ · (σ₂σ₁)` and unknotted closure: both factors are proper and
  `S(σ₂σ₁) = {σ₂} = F(σ₂)` (by evaluation).
- *Proper factors.* Were `Δ_n` allowed as a factor, `Δ₃ = Δ₃¹` (with `r = 0`) and
  `Δ₃ = Δ₃⁰ · Δ₃` would be two normal forms; were `1` allowed, so would `σ₁ = Δ₃⁰ · σ₁` and
  `σ₁ = Δ₃⁰ · σ₁ · 1`, the pair `(σ₁, 1)` being left-weighted since `S(1)` is empty. With both
  excluded, `Δ₃` has only `k = 1`, `r = 0`; on two strands the only positive permutation braids
  are `1` and `Δ₂ = σ₁`, so the normal forms are `σ₁^k`, matching `B₂ ≅ ℤ`; on one strand
  `Δ₁ = 1` and `k` is not determined, which is why `n ≥ 2` (by evaluation).
- *Pure braids only.* Strand deletion (4.12.1) is defined on pure braids, where every strand
  returns to its position; for `σ₁ ∈ B₂` the strand starting at position `1` ends at position
  `2`, so deleting the strand of a position is not well defined.

*Needs:* Tau Ceti `TauCeti.BraidGroup`, `TauCeti.BraidGroup.sigma`, `TauCeti.BraidGroup.permHom`,
`TauCeti.BraidWord`; Layer 4.2 (closures).

### 4.12.1 Pure-strand deletion, Milnor invariants and complete Brunnian families

On the ordered oriented tame-link carrier, a link with n ≥ 2 components is Brunnian if it is not
the unlink and every proper sublink is an unlink. Prove this is equivalent to nontriviality plus
unlink after each single-component deletion, and that Brunnian links are nonsplit (a splitting
sphere would separate proper unlink factors).

**Deletion and the concrete pure words.** For each strand k construct, on 4.2.8's geometric pure
braids and independently of Garside normal form, the deletion homomorphism P_n → P_(n−1)
(remaining endpoints reindexed in order), agreeing with geometric deletion and with restriction
of closures to sublinks, with the iterated-deletion, stacking, inversion and strand-insertion
laws; the identity closes to the unlink. With one-based indices (and the zero-based native
comparison) put, for 1 ≤ i < j ≤ n, n ≥ 2 and r ∈ ℤ,
A_(i,j) = σ_(j−1)⋯σ_(i+1) σ_i² σ_(i+1)⁻¹⋯σ_(j−1)⁻¹,
β_n = [A_(1,n), [A_(2,n), …, [A_(n−2,n), A_(n−1,n)]…]] with [a,b] = aba⁻¹b⁻¹ (so β₂ = σ₁²), and
L_(n,r) = closure(β_n^r). Deleting strand i or j kills A_(i,j) and deleting another strand
reindexes it, so each single-strand deletion of β_n^r is trivial: L_(n,r) has n components,
each one-component deletion is an unlink, and L_(n,0) is the unlink.

**The truncated Magnus algebra.** For every commutative ring R, finite type I and d ≥ 0, take the
quotient of FreeAlgebra R I by the two-sided ideal of words of length d + 1 (through
TwoSidedIdeal.ringCon; variables noncommuting, d = 0 included), with its basis of words of
length ≤ d, coefficients, filtration J^q, truncations, coefficient change, relabelling and
deletion of variables, and the universal property for substitutions killing such words. The
Magnus expansion E, from FreeGroup I to the units, x_i ↦ 1 + X_i (inverse Σ_(k=0)^d (−X_i)^k),
commutes with truncation; with Γ_(k+1)G = (⊤ : Subgroup G).lowerCentralSeries k it maps Γ_qF
into 1 + J^q, and commutators of leading terms U, V of degrees a, b lead with UV − VU in degree
a + b.

**Closed-link longitudes and indeterminacy.** Let G = π₁(X, p)ᵐᵒᵖ for the exterior X of 5.1 (4.2.8's
path-word comparison with native π₁), with based positive meridians x_i and preferred longitudes λ_i from
5.1's peripheral construction and the Wirtinger and linking constructions. For q ≥ 2 prove the
Chen–Milnor presentation G/Γ_qG ≅ ⟨x₁, …, x_n | Γ_qF_n, [x_i, λ_i^(q)], 1 ≤ i ≤ n⟩, natural under
based ambient isotopy, diagram moves and component deletion. For nonrepeating I = (i₁, …, i_s),
2 ≤ s ≤ n, and q ≥ s, μ̄_I ∈ ℤ/δ_Iℤ is the residue of the coefficient of X_(i₁)⋯X_(i_(s−1)) in
E(λ_(i_s)), δ_I being the nonnegative gcd of these coefficients over the proper subsequences of
length ≥ 2 and their cyclic permutations (0 for an empty or all-zero family). Prove μ̄_I independent
of lifts, basing paths and q and invariant under ambient isotopy, with deletion, permutation,
cyclic-symmetry and shuffle laws; reversing a component in I negates it, reflection multiplies it by
(−1)^(s−1), the unlink gives 0 and μ̄_(i,j) = lk_(i,j). No classification of links by these
invariants is asserted.

**The complete coefficient calculation.** For every n ≥ 2 and r ∈ ℤ,
E(q(β_n^r)) = 1 + r(−1)^(n−2)[X₁, [X₂, …, [X_(n−2), X_(n−1)]…]] + (degree ≥ n), with
[U,V] = UV − VU, and μ̄_(1,…,n)(L_(n,r)) = r(−1)^(n−2) with δ = 0. Here 4.2.8's pullback
monodromy gives φ_β(x_n) = c_β x_n c_β⁻¹, and q(β), the image of c_β after killing x_n, is the
longitude of component n in the complement of the others, its sign fixed by the positive Hopf
link (β₂ = σ₁², λ₂ ↦ x₁, μ̄₁₂ = +1). On the kernel generated by the A_(i,n), q is an
anti-homomorphism, q(βγ) = q(γ)q(β), with E(q(A_(i,n))) = 1 + X_i + (degree ≥ 2), and the
commutator law gives the expansion, whose Lie polynomial has 2^(n−2) distinct words with
coefficients ±1, that of X₁⋯X_(n−1) being 1; shorter invariants vanish on the unlink sublinks.
The full length-n tensor (the Lie polynomial in every permutation, last label moved to n) has
entries 0, ±r and maximum |r|, invariant under relabelling, reversal and mirroring. Hence
L_(n,r) is nonsplit Brunnian for r ≠ 0, the L_(n,1) form an infinite family, and for fixed n
the L_(n,r), r ≥ 1, are pairwise distinct up to relabelling, orientation and mirror image.

**Checks.**
- *Torus links.* L_(2,r) is the closure of σ₁^(2r), the (2, 2r) torus link, with
  μ̄₁₂ = lk = r (by evaluation).
- *Borromean rings.* With a = σ₁, b = σ₂: [a², b²] = (ab⁻¹)³ and β₃ = b(ab⁻¹)³b⁻¹, so L_(3,1)
  is the closure of (σ₁σ₂⁻¹)³ with μ̄₁₂₃ = −1 in the marked convention (by evaluation).
- *Noncommuting variables.* For n = 4 the Lie polynomial is X₁X₂X₃ − X₁X₃X₂ − X₂X₃X₁ + X₃X₂X₁,
  which vanishes in commuting variables (by evaluation).

*Needs:* 4.2 and 4.2.8 (braid and PD realization, based action, deletion, closures); 4.1
(sublinks); 4.3–4.4 (linking, Wirtinger); 5.1 (exterior, peripheral markings); Mathlib
FreeAlgebra, FreeGroup, TwoSidedIdeal and RingCon, finite word bases, lower central series.
Compare [Meilhan, §§3.1–3.3](https://arxiv.org/html/1812.03319v1#S3).

### 4.13 Prescribed Alexander polynomials and unknotting number one

For every integral Laurent polynomial Δ with `invert Δ=Δ` and Δ(1) = 1 (Kondo's theorem),
construct a finite realized oriented knot diagram, fixing all band ports, orientations, twists
and closure data, with a marked crossing whose switch gives a diagram of the unknot, by finitely
many Reidemeister moves, and with normalized Alexander polynomial exactly Δ. For Δ ≠ 1 this gives u = 1; for
Δ = 1 use the untwisted Whitehead double of the right-handed trefoil (4.11: Δ = 1, one clasp
change, nontrivial by its essential companion torus). So every such Δ is the polynomial of a knot
of unknotting number exactly 1; no uniqueness is asserted.

**The integer parametrization.** Choose n ≥ 1 with the support of Δ in [−n, n] and write
`p(t)=t^n Δ(t)` as Σ_(j=0)^(n−1) a_j(t^(2n−j) + t^j) + a_n t^n (leading coefficients may
vanish); put β_j = Σ_(i=0)^j (j−i+1)a_i and
Q_β(t) = Σ_(j=0)^(n−2) β_j(t^(2n−2−j) + t^j) + β_(n−1)t^(n−1). Prove uniqueness of the expansion
and `p=t^n+(t−1)^2 Q_β` (p(1) = 1 fixes the central coefficient; for n = 1, `p=t+β₀(t−1)^2`).
Kondo's parameters are α_j = β_j for j < n − 1 and α_(n−1) = β_(n−1) + (n − 1), the shift forced
by his equation (8), whose α-polynomial carries `−(n−1)t^(n−1)(t−1)^2+t^n`; the symmetric
matrix λ has λ_(1,j) = λ_(j,1) = α_(n−j) for 1 ≤ j ≤ n and λ_ij = 0 for i, j > 1 (zero-based,
`λ_(0,j)=α_(j.rev)`). Over native `Polynomial`, `LaurentPolynomial` and integral matrices,
prove coefficient recovery, the triangular recurrence, the β-to-α conversion and padding
n ↦ n + 1 (`Q_β′=t Q_β`, the last α up by 1); the chosen n is part of the diagram.

**Band realization and polynomial comparison.** Realize every symmetric integer array λ in
Kondo's oriented band normal form by signed twists and inter-band linking boxes, with fixed
ports, closure and framing conventions and the diagonal twist convention compared with Kondo's;
give the one-crossing-change movie to the circle, derive the diagram's signed Alexander/Fox
equations and equation (8), and apply this parametrization through the monomial and sign
comparison with the symmetric Laurent convention ([Kondo, Theorem 3, system (*) and equation (8),
pp. 557–559](https://ir.library.osaka-u.ac.jp/repo/ouka/all/6492/ojm16_02_19.pdf)).

**A family of unknotting-number-one knots of unbounded genus.** For k ≥ 1 let V_k be the
2k × 2k integral matrix with diagonal entries 1 at both ends, subdiagonal entries −1,
superdiagonal entries −1 in even one-based rows, and all other entries 0. Prove
`det(V_k−tV_kᵀ)=(-1)^(k−1)(1−t)^(2k)+t^k` by the continuant recurrence on leading principal
minors (`D_(2m)=t^m`, `D_(2m+1)=(-1)^m(1−t)^(2m+1)`, `D_(2k)=(1−t)D_(2k−1)+tD_(2k−2)`), with
its extreme coefficients, degree and value at 1, so the normalized polynomial, compared with
native `alexanderMatrix`/`alexander` by transpose and even-dimensional negation, is
`Δ_k=1+(-1)^(k−1)(t+t⁻¹−2)^k`, of breadth 2k. Kondo's realization gives knots J_k with
`u(J_k)=1` and `g(J_k)≥k`, pairwise distinct; no upper bound on g(J_k) is asserted.

**Checks.**
- *Parametrization at n = 2.* For a = (−1, 4, −5): β = (−1, 2), α = (−1, 3) and the first λ row is
  (3, −1) (by evaluation).
- *First family member.* V₁ = [[1, 0], [−1, 1]] gives (1 − t)² + t and Δ₁ = t − 1 + t⁻¹ (by
  evaluation).
- *Parametrization at n = 1.* For `(a₀, a₁) = (1, −1)`, the trefoil's `t − 1 + t⁻¹`, `β = α = (1)` and
  `λ = [1]` (by evaluation).
- *Parametrization at n = 3.* For `a = (1, −6, 15, −19)`, with `p(1) = 2(1 − 6 + 15) − 19 = 1`,
  `β = (1, −4, 6)`, `α = (1, −4, 8)` and the first `λ` row is `(8, −4, 1)` (by evaluation).

*Needs:* Layers 4.2–4.4 (realized diagrams, crossing changes, Seifert/Fox comparison, genus
bound) and 4.11 (the nontrivial Whitehead double).

### 4.14 Counting knots

Define finite exact- and bounded-crossing carriers of tame knot types from realized diagrams,
with four explicit choices: prime or all, exact or cumulative crossing number, oriented or not,
and orientation-preserving ambient equivalence or equivalence allowing reflection. `C_n` counts
unoriented prime knots of crossing number n under orientation-preserving equivalence, `N_n` its
quotient by mirrors, and `O_n` all oriented knots of crossing number n under
orientation-preserving equivalence. Prove the fibre bounds of the forgetful and mirror quotients,
invertible and amphicheiral fixed points included: N_n ≤ C_n ≤ 2N_n, and forgetting orientation
has fibres of size at most 2. Finiteness comes from the finite diagram enumeration surjecting
onto knot types; the unknot has crossing number 0 and none has crossing number 1 or 2.

For a Boolean word of length m start at (p, q) = (2, 1) and apply T₀(p, q) = (p + q, q),
T₁(p, q) = (p + q, p) from the left, building alongside a reversed continued fraction from [2]
(T₀ increments its last entry, T₁ appends 1). The word map is a bijection onto coprime pairs
p > q > 0, with p/q the slope of a positive list of first entry ≥ 2 and coefficient sum m + 2
(inverse: last letter 0 and predecessor (P − Q, Q) if P > 2Q, 1 and (Q, P − Q) if P < 2Q;
P = 2Q only at (2, 1)). The positive rational diagram (4.10) is reduced alternating with m + 2
crossings, hence of crossing number m + 2 by the bracket-span theorem; for odd p and m ≥ 1 it is
a nontrivial two-bridge knot, prime by the formula b(K # J) = b(K) + b(J) − 1 of 4.8 (lower
bound by moving a decomposing sphere to bridge-compatible position by height and innermost-disc
simplifications), the bridge-one unknot theorem and 4.9.

Let `a_m` count the words with odd p. The parity automaton on A = (0,1), B = (1,0), D = (1,1),
from (1, 0, 0) by (A, B, D) ↦ (2D, A + B, A + B), gives B = D, a_m = B + D,
a_m + a_(m+1) = 2^(m+1) and, in ℤ, 3a_m = 2^(m+1) − 2(−1)^m. By 4.10's Schubert classification
a knot class contains at most the two slopes q, q⁻¹ mod p, four with reflection, so
2C_(m+2) ≥ a_m and 4N_(m+2) ≥ a_m for m ≥ 1: 3C_n ≥ 2^(n−2) − 1 and 6N_n ≥ 2^(n−2) − 1 for
n ≥ 4, with ceiling forms, and N_n ≥ 2^(n−5) for n ≥ 5.

For the upper bound, define rooted connected oriented sphere maps (loops and parallel edges allowed)
by dart rotations and a fixed-point-free involution, with a distinguished spanning tree (every
finite connected map has one), compared for s > 0 edges with native `TauCeti.BipartiteRibbonGraph` /
`TauCeti.PermutationTriple` by a white degree-two vertex on each edge (`facePerm=(rotW*rotB)⁻¹`
against the face walk; degrees, faces and Euler characteristic matched both ways), and for s = 0 by
the terminal one-vertex map. The contour code (tree-edge visits a, A; other edges b, B) is a
bijection onto shuffles of two Dyck words, giving
`Σ_(k=0)^s binom(2s,2k) Catalan(k) Catalan(s−k) = Catalan(s) Catalan(s+1)` by Vandermonde and at
most 16^s maps. A connected n-crossing shadow is a four-valent sphere map with 2n edges (root face
as outer face, orientation preserved); a crossing bit per vertex and an orientation give a code
carrier surjecting onto knots with an n-crossing diagram, so `O_n≤2·2^n·16^(2n)=2·512^n` for n ≥ 1,
likewise for C_n, N_n and, by a geometric sum, the cumulative counts. The n-th roots of the prime
counts have liminf ≥ 2 and limsup ≤ 512.

On 4.2.5's signed Dowker words, specify the root, orientation and sign data counted by `n!·2^n`
and the planar and connected-sum data needed to decode a diagram, prove the decoder's fibre
theorem, decide whether n!·2^n bounds the knots so counted, and compare it with the exponential
bound. The lower bounds `(2^(n−2)−1)/3`, `(2^(n−2)−3)/3`, `2^(n−2)/3` and `e^n` are stated each
with its own count convention and threshold; the mirror-identified prime counts violate several
at 4, 6 or 8.

**Checks.**
- *Odd words.* a₀, …, a₆ = 0, 2, 2, 6, 10, 22, 42 (by evaluation).
- *Small counts.* N₃, …, N₇ = 1, 1, 2, 3, 7 and C₄ = 1, so 3C₄ ≥ 2² − 1 is an equality and its
  strict form fails (by evaluation).
- *Low crossing numbers.* There are no knots of crossing number `1` or `2`, and crossing number
  `0` has only the unknot.

*Needs:* 4.2 (realized diagrams, sphere maps), 4.2.5 (signed Dowker words), 4.10 (rational
tangles, Schubert classification), 4.8 (bridge number), 4.9 (prime decomposition); Tau Ceti
`TauCeti.BipartiteRibbonGraph`, `TauCeti.PermutationTriple`; Mathlib `DyckWord`,
`DyckWord.card_dyckWord_semilength_eq_catalan`, `catalan`, finite fibre cardinalities and
real-power limits. References: [Kauffman–Lambropoulou, On the Classification of Rational Knots,
Schubert classification and positive rational diagrams](https://arxiv.org/html/math/0212011);
[Bernardi, Bijective counting of tree-rooted maps and shuffles of parenthesis systems,
§2](https://arxiv.org/html/math/0601684).

### 4.15 Alexander modules and Fox groups of small knots and links

The Alexander modules, Fox groups and colouring modules of the knots with fewer than eight
crossings and of the nonsplit links with at most six crossings, for every component orientation,
as evaluations of the invariants of 4.4 and 4.7. Which knots and links these are is tabulated
knowledge (Rolfsen's table; Hoste–Thistlethwaite–Weeks), not a target; no exhaustion is asserted.

**The eighteen knot classes and their actual Smith forms.** The knots are the unknot U, 4.4.8's
fourteen prime inputs and T#T, T#mirror(T), T#F (T the trefoil, F the figure-eight), up to one
global mirror and reversal, granny and square kept distinct. For a c-crossing diagram, c ≥ 1,
the square Fox matrix at t = −1 has Smith form diag(1, …, 1, d₁, …, d_k, 0), with c − 1 − k unit
entries and based Fox group K = ⊕_i ℤ/d_i; the crossing-free unknot has the one-generator
presentation and empty based matrix. Compute K by specializing the cover modules at t ↦ −1 and
comparing with the integral Fox presentation by unimodular reductions; 4.4.8's two-bridge
comparison makes K cyclic for the prime knots, and T#F has ℤ/3 ⊕ ℤ/5 ≅ ℤ/15. Over every
commutative ring R the colouring module is R × Π_i Ann_R(d_i); there are n Π_i gcd(n, d_i)
colourings in ZMod n, n of them constant, and over a prime field the based dimension counts the
d_i divisible by the characteristic, so characteristic 2 gives no nonconstant knot colourings.

**There is no global component bound.** By 4.4.5 every split union of two nonempty links has
Alexander order 0 and Conway polynomial 0, unlinks of any size included, and split unknots add no
crossings. The empty link has Alexander-module order 1 (the trivial cover S³ × ℤ → S³ has
H₁ = 0) and native PD module 0 with unit zeroth Fitting ideal; the Conway polynomial keeps its
nonempty domain. Prove c(A ⊔ B) = c(A) + c(B) (delete a sublink for ≥, juxtapose minimal
projections for ≤). For a nonsplit μ-component link the interaction graph of a projection
(components, joined when they share a mixed crossing) is connected, else its plane nesting gives
a splitting sphere, and each interacting pair has at least two crossings by 4.2.5's even
intersection theorem; so c ≥ 2(μ − 1), and c ≤ 6 forces μ ≤ 4 for each nonsplit factor.

**The nonsplit models at the link bound.** With H, S, W, B the Hopf, Solomon, Whitehead and
Borromean links, P = P(2,2,2) and Q = mirror(T(3,3)), the two-component models are H, S, W,
L6a1, L6a2, L6a3, H#T, H#F and the three-component ones H#H, H#S, B, P, Q, the latter of
crossing number 4 for H#H and 6 otherwise (a reduced alternating diagram for B, the bound
c ≥ 2Σ_(i<j)|lk_ij| for the others).

**Hypothesis 4.15 (link models).** The PD codes of rows L2a1, L4a1, L5a1, L6a1, L6a2, L6a3,
L6a4, L6a5, L6n1 of the
[Knot Atlas link table](https://katlas.org/wiki/Link_table_-_up_to_seven_crossings)
([L6a4](https://katlas.org/wiki/L6a4), [L6a5](https://katlas.org/wiki/L6a5),
[L6n1](https://katlas.org/wiki/L6n1)), read under-first counterclockwise, are planar diagrams of
H, S, W, Rolfsen's 6²₃, 6²₂, 6²₁, B = closure((σ₁σ₂⁻¹)³), P (4.7.3's signed boxes) and
Q = closure((σ₁⁻¹σ₂⁻¹)³), the reflection of the positive T(3,3).

**The missing four-component cases.** A Hopf-tree link attaches oriented Hopf summands along a
finite tree by 4.9's selected-component sum, two crossings per edge, in all sign and orientation
variants (the one-vertex tree gives U). For e edges with linking numbers ℓ_i = ±1 the boundary
sum of the Hopf annuli is a genus-zero spanning surface with push-second matrix
diag(−ℓ₁, …, −ℓ_e), so the Conway polynomial is (Π_i ℓ_i) z^e and the based Fox group (ℤ/2)^e.
For μ = 4 and c ≤ 6 a nonsplit link has no self crossings, a tree as interaction graph and two
crossings per edge; for plane codes with 2 ≤ μ ≤ 4 and these combinatorics, prove by leaf
isolation that the link is split or a Hopf-tree link (straighten a leaf and its two crossings,
find a separating sphere or a two-point sphere around the leaf and one arc of its neighbour, the
apparent bigon not assumed empty, and recurse on μ − 1). For μ = 4 the path and star models have
crossing number 6, order (t − 1)³ and Fox group (ℤ/2)³, and are distinguished by the degree
lists (2,2,1,1) and (3,1,1,1) of their linking graphs.

**The Alexander polynomials of all orientations.** A mask m reverses the components whose bits are 1, the
components of a PD code being ordered by least half-edge 4c + s and traversed from it as an
incoming end; A(t) is the generator of the Alexander order with positive leading coefficient and
no factor t (not the Conway normalization); at a crossing of sign ε the incoming-under relation
is out − t^ε in − (1 − t^ε) over. Assuming Hypothesis 4.15, for each prime model and mask prove
that the first elementary ideal of the native AlexanderModule is (A), integer content included,
compute the Smith form at t = −1 (composites through the gluing's orientation maps), compare with
4.4.5's half-determinant and Conway polynomial through surface and unit maps, and export
colouring modules as for knots. No orientation-free value is assigned to an unoriented link.

**Checks.**
- *Knot Fox groups.* Each of the eighteen knots has K cyclic of order its determinant, except
  T#T and T#mirror(T) with (ℤ/3)², so 6₁ (ℤ/9) and the granny differ mod 3 (by evaluation).
- *Link Fox groups.* For every mask, H, S, W, L6a1, L6a2, L6a3, B, P, Q have based Fox groups
  ℤ/2, ℤ/4, ℤ/8, ℤ/12, ℤ/10, ℤ/6, (ℤ/4)², ℤ/2 ⊕ ℤ/6, (ℤ/2)² (by evaluation).
- *Orientation dependence.* P(2,2,2) has A = 3(t − 1)² when all three mask bits agree and
  (t − 1)²(t² − t + 1) otherwise (by evaluation).

*Needs:* 4.2 (realized diagrams, plane parity, nesting); 4.3–4.4.5 (linking, surface, Fox, cover
and coefficient comparisons); 4.7.1 (Smith forms, presentations); 4.9 (split and
selected-component sums).

### Examples

The unknot, the trefoils, the figure-eight, `5₁` and `5₂` with their polynomials, determinants,
colourings, genera and signatures; the Hopf link, the two-component unlink and the Borromean
rings; `T(3, 4)`, non-alternating; the untwisted Whitehead double of the trefoil, nontrivial with
trivial Alexander polynomial; the square and granny knots, with equal Alexander polynomials.
The unknot, the right-handed trefoil `σ₀³`, the figure-eight, the Hopf link and the
two-component unlink are the standing examples: their Alexander, Jones and signature values pin
every convention of this layer.

### Dependencies

Layer 1 (surfaces, tubes, connected sums), Layer 2.2 (Schoenflies), Layer 3.3 (isotopy
extension), Layer 5.1 (the exterior); Tau Ceti's knot-theory carriers; Mathlib's quandles and
braid words; TypeAHeckeAlgebras H1, H2; TemperleyLieb Layers 2–6 (Layers 4–5 for 4.5.1, 4.5.3
and 4.5.6, Layers 2–4 and 6 for 4.8.1); Subfactors §§3.1–3.3 (for 4.5.6); ReductiveGroups §11A
(strand systems and the native braid group, for Layer 4.2.8). The signature statements about torus
knots and unknotting numbers are Layer 6.2's and the surgery-theoretic unknotting-number theorems
are Layer 5.4's; both consume this layer.
Mathlib's `PresentedMonoid`, `LaurentPolynomial` and matrices and the native presentations, moves,
polynomials and knot-group declarations of the supplier contracts enter through 4.1–4.6; Layer 1.5's
tubular neighbourhoods give the framings of 4.1.
## Layer 5: Dehn surgery

Dehn surgery removes a tubular neighbourhood of a knot and reglues a solid torus along a
slope. The carriers are Tau Ceti's at the pin (*From Tau Ceti*): slopes and framed tori
(`TauCeti.Slope`, `TauCeti.FramedBoundaryTorus`, `TauCeti.FramedBoundaryTorus.slopeEquiv`),
solid-torus neighbourhoods and their existence for `C²` knots, the knot and link exteriors
`TauCeti.knotExterior` and `TauCeti.linkExterior`, the preferred framing, Dehn fillings
`TauCeti.DehnFilling` and `TauCeti.LinkDehnFilling` with their existence and their uniqueness for
isotopic gluings, surgery on framed spheres `TauCeti.SphereSurgery`, the fillings of the unknot,
the cosmetic-surgery predicates and the Weeks manifold. This layer adds the smooth structure of the
exterior, the homology and orientation identities of fillings, the surgery theorems of Kirby's
list and the unknotting-number applications.

### 5.1 The exterior of a link

For a link `L ⊂ S³` with `μ` components the exterior is Tau Ceti's `TauCeti.linkExterior` of a
family of solid-torus neighbourhoods with disjoint images
(`TauCeti.exists_isSolidTorusLinkNeighborhood_of_forall_nhdsSet`), `TauCeti.knotExterior` for a
knot, the complement of the open solid tori; the exterior of the half-radius tori is a
topological `3`-manifold with boundary (`TauCeti.IsSolidTorusLinkNeighborhood.exteriorChartedSpace`)
whose boundary is a disjoint union of `μ` tori, the meridian generates the first homology of the
knot complement (`TauCeti.IsSolidTorusNeighborhood.complementHomologyEquiv`), the preferred
longitude spans the boundary classes that vanish in it
(`TauCeti.IsSolidTorusNeighborhood.ker_boundaryHomologyMap`) and gives the preferred framing
`TauCeti.IsSolidTorusNeighborhood.preferredFramedBoundaryTorus`, and the exterior of the unknot is a
solid torus exchanging meridian and longitude (`TauCeti.unknotExteriorHomeomorph`). None of this is
planned again here. For a smooth link, choose the neighbourhoods inside the tubes of Layer 1.5, and
prove: the exterior carries a smooth structure with boundary, as a compact `3`-manifold with
boundary over `𝓡∂ 3`; it is independent of the solid-torus neighbourhoods up to a diffeomorphism
that is the identity off a neighbourhood of the link and matches meridians and preferred
longitudes; its interior is diffeomorphic to `S³ ∖ L`; and ambient isotopic links have
diffeomorphic exteriors matching meridians and longitudes (Layer 3.3; Rolfsen, Chapter 2, §E;
Chapter 9, §F).

- The exterior of a nontrivial knot is not a solid torus (Layer 8.1, Dehn's lemma).
- The longitude is null-homologous in the exterior and `H₁(X_K; ℤ) ≅ ℤ` is generated by the
  meridian, transported from the pinned complement statements through the deformation
  retraction of the complement onto the exterior.
- The exterior of every knot is irreducible (`TauCeti.IsSphereBoundsBall`), by Alexander's
  theorem (Layer 8.1): a sphere in the exterior bounds a ball in `S³` on the side missing the
  knot.

The pinned carriers in detail: `TauCeti.SolidTorus = D² × S¹`;
`TauCeti.IsSolidTorusNeighborhood f Φ`, an embedding `Φ` of the closed solid torus whose core
traces the loop `f` and which carries the open solid torus onto an open set; the existence theorem
for `C²` embedded circles in `ℝ³` (`TauCeti.exists_isSolidTorusNeighborhood`), which the pin
transports to `S³` through Mathlib's `stereographic` projection; the identification of the
boundary torus with the frontier of the exterior (`TauCeti.IsSolidTorusNeighborhood.frontier_image`,
`TauCeti.IsSolidTorusNeighborhood.exteriorFrontierHomeomorph`); and the generation of the first
homology of the knot complement by the meridian, which is Alexander duality for the knot (Hatcher,
*Algebraic Topology*, Corollary 3.45). The meridian of a component is the image of `∂D² × {pt}`.
Writing `X_L` for the exterior of a link `L` and `X_K` for that of a knot, prove in addition:

- the exterior of the half-radius tori is connected, so that with
  `TauCeti.IsSolidTorusLinkNeighborhood.exteriorChartedSpace` it is a compact connected
  `3`-manifold with boundary, `TauCeti.IsCompactConnectedThreeManifold`, with one boundary torus
  per component;
- the identification with the Seifert longitude: for a knot `K ⊂ S³` the preferred longitude is,
  up to isotopy on the boundary torus, the boundary of a Seifert surface (Layer 4.3) pushed to the
  boundary torus, the unique simple closed curve on the torus, up to isotopy, meeting the meridian
  once and null-homologous in `X_K` (Rolfsen, Chapter 2, Section E; Chapter 9, Section F);
- meridian and Seifert longitude form a basis of `H₁(∂X_K; ℤ)`;
- the pinned knot group `TauCeti.SmoothCircleEmbedding.KnotGroup` is `π₁(X_K)`, since the exterior
  is a deformation retract of the complement.

**Checks.**
- *Open tubes.* For the empty link the exterior is `S³` with empty boundary; for one component
  the complement of the closed tube would omit the boundary torus and be noncompact.
- *Framing change.* `n` full twists change `λ` to `λ + n μ`; the Seifert framing has
  `lk(λ, K) = 0`, and the blackboard framing of a diagram differs from it by the writhe.
- *Hopf exterior.* The Hopf link exterior is `T² × [0, 1]`, the meridian of each component being
  the longitude of the other.
- *Unknot exterior.* The unknot's exterior is a solid torus in which the Seifert longitude bounds a
  meridian disc and the meridian is isotopic to the core, so meridian and longitude exchange roles
  under the genus-one splitting `S³ = (S¹ × D²) ∪ (D² × S¹)`.
- *Unlink and Hopf link.* The exterior of the two-component unlink has `H₁ = ℤ²` and `π₁` free of
  rank two; the exterior of the Hopf link is `T² × [0, 1]` with `π₁ = ℤ²`, so the exterior
  distinguishes them.
- *Smoothness of the knot.* A `C¹` knot whose parametrization has a corner but which is still a
  `C¹` embedding has a solid-torus neighbourhood by the `C²` theorem only after smoothing; the
  carrier `TauCeti.SmoothCircleEmbedding` is `C^∞`, so the theorem applies to it as it stands.

*Needs:* Layers 1.5, 3.3, 4.1; Tau Ceti `TauCeti.linkExterior`, `TauCeti.knotExterior`,
`TauCeti.IsSolidTorusNeighborhood`, `TauCeti.FramedBoundaryTorus`,
`TauCeti.IsSolidTorusNeighborhood.preferredFramedBoundaryTorus`, `TauCeti.SolidTorus`,
`TauCeti.exists_isSolidTorusNeighborhood`, `TauCeti.IsSolidTorusNeighborhood.frontier_image`,
`TauCeti.IsSolidTorusNeighborhood.exteriorFrontierHomeomorph`,
`TauCeti.IsCompactConnectedThreeManifold`, `TauCeti.SmoothCircleEmbedding.KnotGroup`; Layer 4.3
(Seifert surfaces); Mathlib `stereographic`.

### 5.2 Dehn filling and surgery

**Slopes and framings of the boundary torus.** The slope carriers are Tau Ceti's: `TauCeti.Slope M`,
the primitive classes (`TauCeti.IsPrimitive`) modulo sign in a `ℤ`-module; `TauCeti.BoundaryTorus`,
a space homeomorphic to `T²` with its first homology; `TauCeti.FramedBoundaryTorus`, a boundary
torus with an ordered basis `(μ, λ)` of `H₁(T; ℤ)`, with its `meridian` (value `∞`), `longitude`
(value `0`), `value : Slope T.H → ℚ ∪ {∞}` (Mathlib's `OnePoint ℚ`), the bijection `slopeEquiv`, and
`TauCeti.slopeEquivStd` on `ℤ × ℤ`. A parametrization `e : S¹ × S¹ ≃ₜ T` frames `T` by its two
coordinate circles (`TauCeti.FramedBoundaryTorus.ofHomeomorph e`); the class of the `(p, q)` curve
`t ↦ e(e^{2πipt}, e^{2πiqt})` has coordinates `(p, q)` and, for coprime `p` and `q`, slope value
`p/q` (`TauCeti.FramedBoundaryTorus.torusCurveClass`,
`TauCeti.FramedBoundaryTorus.value_mk_torusCurveClass`), which is the classical dictionary
`p/q ↔ p·μ + q·λ` (Rolfsen, Chapter 9). The boundary torus of the exterior of a knot with
solid-torus neighbourhood `Φ` is framed by `Φ`
(`TauCeti.IsSolidTorusNeighborhood.framedBoundaryTorus`): the meridian is `t ↦ Φ(e^{2πit}, 1)`,
the boundary of a disc fibre, and the longitude is the push-off `t ↦ Φ(1, e^{2πit})` of the knot.
When the ambient space has vanishing reduced integral homology in degrees `1` and `2` (for `S³`,
the native vanishing theorems, such as
`TauCeti.isZero_reducedSingularHomologyFunctor_one_sphere_euclideanSpace_fin_four`), the framing
number `n` of `Φ` (`TauCeti.IsSolidTorusNeighborhood.framingNumber`) is defined by the longitude of
`Φ` being homologous in the knot complement to `n` times the meridian; the isomorphism
`H₁(X ∖ K; ℤ) ≅ ℤ` of 5.1 sends the meridian to `1`, and the preferred framing of 5.1 is
`(μ, λ − n·μ)`, whose longitude generates the kernel of `H₁(T) → H₁(X ∖ K)` and in which a class
goes to its meridian coordinate
(`TauCeti.IsSolidTorusNeighborhood.complementHomologyEquiv_boundaryHomologyMap_preferred`). Prove
that an orientation-reversing diffeomorphism of `S³` sends the slope `p/q` of `K` to the slope
`−p/q` of the mirror image, the coefficients being read in neighbourhoods that preserve
orientation, and that reversing the orientation of `Φ` (precomposing with the reflection of `D²`)
negates the value of every slope.

- The slopes of a framed torus are `ℚ ∪ {∞}`; `∞` is the meridian and `0` the longitude; `p/q` and
  `−p/−q` are the same slope, and `p/q`, `−p/q` are different unless `p = 0` or `q = 0`.
- Changing the framing by `λ' = λ + kμ` sends the value `p/q` of a slope to `(p − kq)/q`: the
  class `pμ + qλ = (p − kq)μ + qλ'`; the preferred framing is the case `k = −n`.
- The class `(0, 0)` is not primitive and names no slope; `(2, 2)` is not primitive; `(1, 0)` and
  `(0, 1)` are.

Dehn filling is Tau Ceti's `TauCeti.DehnFilling h s Y` (and `TauCeti.LinkDehnFilling` for links):
a filling of the exterior along the slope `s`, recorded inside the filled space `Y` by closed
embeddings of the exterior and of `D² × S¹` glued along a torus homeomorphism of filling slope `s`.
The pin has their existence along every slope (`TauCeti.IsSolidTorusNeighborhood.exists_dehnFilling`,
`TauCeti.IsSolidTorusLinkNeighborhood.exists_linkDehnFilling`), the homeomorphism of two fillings
whose gluings are isotopic to matrix gluings with the same slope
(`TauCeti.DehnFilling.exists_homeomorph_of_isotopic_torusHomeomorph`), the `∞`-filling
(`TauCeti.DehnFilling.nonempty_homeomorph_of_fillingSlope_meridian`), the unknot's fillings, lens
spaces along `p/q` (`TauCeti.DehnFilling.nonempty_homeomorph_lensSpace_of_unknot_slopeValue`) and
`S¹ × S²` along the longitude
(`TauCeti.DehnFilling.nonempty_homeomorph_circle_prod_sphere_of_unknot_longitude`), surgery on a
framed sphere in every dimension (`TauCeti.SphereSurgery`), with integral Dehn surgery as its case
`k = 1`, `q = 2` (`TauCeti.SphereSurgery.toDehnFilling`), and compatible orientations of a filling
(`TauCeti.DehnFilling.IsOrientationCompatible`). None of this is planned again here. For a knot
`K ⊂ S³` and `p/q ∈ ℚ ∪ {∞}` in the preferred framing, `S³_{p/q}(K)` is a filling along
`p μ + q λ`. Prove:

- uniqueness of the filling along a slope for every gluing, not only those isotopic to matrix
  gluings, by the classification of torus homeomorphisms up to isotopy (Layer 1.7.2) and the
  extension of meridian-preserving torus maps over the solid torus;
- for smooth knots, the filling is a closed orientable smooth `3`-manifold, with smooth structure
  from the smooth exterior of Layer 5.1, unique up to diffeomorphism;
- `S³_{p/q}(K)` has `H₁ ≅ ℤ/p` (and `ℤ` for `p = 0`), and `S³_{p/q}(K̄) ≅ −S³_{−p/q}(K)`;
- Lickorish–Wallace: every closed connected orientable `3`-manifold is integer surgery on a
  framed link in `S³` (Lickorish, Chapter 12; Rolfsen, *Knots and Links*, Chapter 9): take a
  Heegaard splitting (Layer 9.1), write its gluing map as a product of Dehn twists by
  Lickorish's twist theorem (Layer 1.7.2), and realize each twist by surgery on a parallel of
  its circle pushed into a handlebody.

**Fillings, surgery coefficients and the unknot.** For `h : IsSolidTorusNeighborhood f Φ` with
exterior `E`, a filling `TauCeti.DehnFilling h s Y` consists of closed embeddings of `E` and of the
solid torus `D² × S¹` into `Y` whose images cover `Y` and meet only along the boundary torus of the
solid torus, glued to `∂E` by a homeomorphism `g` of `S¹ × S¹` whose filling slope, the class of
the image of the meridian `∂D² × {1}` (`TauCeti.IsSolidTorusNeighborhood.fillingSlope`), is `s`
(Rolfsen, Chapter 9, Section F); gluing by the identity has the meridian of `Φ` as filling slope
and gluing by the exchange of the two factors has its longitude
(`TauCeti.IsSolidTorusNeighborhood.fillingSlope_refl`,
`TauCeti.IsSolidTorusNeighborhood.fillingSlope_prodComm`). The pinned existence
(`TauCeti.IsSolidTorusNeighborhood.exists_dehnFilling`) is the pushout
`TauCeti.IsSolidTorusNeighborhood.dehnFillingSpace` of the boundary inclusions, Hausdorff, and
compact when the ambient space is; the trivial filling along the meridian is the ambient space
itself (`TauCeti.IsSolidTorusNeighborhood.meridianDehnFilling`); fillings with isotopic gluings are
homeomorphic by the identity on `E` (`TauCeti.DehnFilling.exists_homeomorph_of_isotopic`); and the
uniqueness for matrix gluings holds because a matrix of `GL₂(ℤ)` fixing the meridian up to sign
extends over the solid torus, every slope being the filling slope of a matrix gluing
(`TauCeti.IsSolidTorusNeighborhood.exists_fillingSlope_torusHomeomorph_eq`). The isotopy
classification of torus homeomorphisms that the uniqueness item above consumes is: every
homeomorphism of `S¹ × S¹` is isotopic to the homeomorphism induced by its action on `H₁`, an
element of `GL₂(ℤ)` (Rolfsen, Chapter 2, Section D; Farb–Margalit, *A Primer on Mapping Class
Groups*, Theorem 2.5, for the orientation-preserving ones, the reflection supplying the rest),
from Layer 1.7.2 with Layer 11.2.1's isotopy of homeomorphisms to diffeomorphisms.

As a space, `S³_{p/q}(K)` is the native `dehnFillingSpace` for a matrix gluing realising the slope
of value `p/q` in the preferred framing, so that the choice of matrix does not matter up to
homeomorphism; `S³_∞(K)` is the trivial filling and `S³_0(K)` the filling along the preferred
longitude, and integral surgery with coefficient `n ∈ ℤ` is the filling along the longitude of a
neighbourhood with framing number `n`. Surgery on a link is component by component: the pinned
`TauCeti.LinkDehnFilling` of the exterior of a link with pairwise disjoint neighbourhoods
(`TauCeti.IsSolidTorusLinkNeighborhood`), with existence along every family of slopes, and the
surgery slopes of coefficients `r i`, read in the preferred framing of each component alone
(`TauCeti.IsSolidTorusLinkNeighborhood.surgerySlope`; the coefficient `∞` on every component gives
back the ambient space). The pinned unknot identities fix the slope convention: the standard
neighbourhood `TauCeti.unknotSolidTorus` has the preferred framing; `S³_∞(unknot)` is `S³`, the
trivial filling; `S³_0(unknot)` is `S¹ × S²` (`TauCeti.unknotZeroDehnFilling`, the two solid tori
over the closed hemispheres of `S²`, glued by the exchange of factors,
`TauCeti.unknotZeroDehnFilling_gluing`; every filling along the preferred longitude with a matrix
gluing is homeomorphic to it); and for coprime `p ≥ 1` and `q` the filling along the slope of value
`p/q` is realised inside the lens space `L(p; ℓ₀, ℓ₁)`, the native `TauCeti.LensSpace p ℓ`, for
every `ℓ` with `ℓ₁ = −q·ℓ₀` in `ℤ/p` (`TauCeti.unknotLensSpaceDehnFilling`, whose two pieces are
the two solid tori of the genus-one splitting of the lens space; every filling with a matrix
gluing is homeomorphic to it). With `ℓ = ![1, q]` this says that `TauCeti.LensSpace p ![1, q]` is
the `−p/q`-surgery on the unknot; Rolfsen's convention (Chapter 9, Section G, Example 1) assigns
`L(p, q)` to `p/q`, the difference being the orientation of `S³`. The native
`TauCeti.LensSpace p ![1, q]`, for `p ≥ 1` and a unit `q` of `ℤ/p`, is the orbit space of `S³ ⊆ ℂ²`
under the rotation `(z, w) ↦ (ζz, ζ^q w)`, `ζ = e^{2πi/p}`, a closed analytic `3`-manifold (the
manifold instances of `Geometry/Manifold/Instances/LensSpace.lean`) with `π₁ ≅ ℤ/p`
(`TauCeti.LensSpace.fundamentalGroupMulEquiv`), hence `H₁ ≅ ℤ/p`, and with `p` a homeomorphism
invariant (`TauCeti.LensSpace.eq_of_homeomorph`). Prove:

- the surgery description up to orientation: `S³_{p/q}(unknot) ≃ₜ TauCeti.LensSpace p ![1, q]` for
  coprime `p ≥ 1` and `q`, orientation ignored, since the reflection `(z, w) ↦ (z, w̄)` of `S³`
  descends to a homeomorphism `TauCeti.LensSpace p ![1, −q] ≃ₜ TauCeti.LensSpace p ![1, q]`
  (Hatcher, *Notes on Basic 3-Manifold Topology*, Section 2.1: his `L_{p/q}` is two solid tori
  glued so that a meridian of the second goes to the curve of slope `p/q` on the first, identified
  with the quotient of `S³` by the rotation `(z, w) ↦ (e^{2πi/q}z, e^{2πip/q}w)` up to a sign fixed
  by orientations; the filling along `pμ + qλ` of the unknot exterior, on which `λ` bounds a
  meridian disc and `μ` is a longitude, is his `L_{q/p}`, the quotient of `S³` by
  `(e^{2πi/p}z, e^{2πiq/p}w)`); with orientations, the slope-`p/q` filling is
  `TauCeti.LensSpace p ![1, −q]`; so `S³_{p/q}(unknot)` has `π₁ ≅ ℤ/p` and is spherical (Layer 8.6);
- the remaining unknot identity `S³_{1/n}(unknot) ≅ S³` for every `n`: a Dehn twist of the exterior
  solid torus along its meridian disc acts on the boundary torus by `μ ↦ μ + kλ`, `λ ↦ λ`, and
  carries the slope `μ + nλ` to the meridian `μ` for `k = −n`, so the filling is the trivial one;
- the identity `H₁(S³_{p/q}(K)) ≅ ℤ/p` above by the Mayer–Vietoris sequence of the exterior and
  the solid torus, with `H₁(E) ≅ ℤ` generated by the meridian and the preferred longitude
  vanishing (5.1); in particular `S³_0(K)` has `H₁ ≅ ℤ` and `S³_{1/n}(K)` is a homology sphere;
- for a smooth knot in any closed smooth `3`-manifold, the neighbourhood chosen inside a tube of
  Layer 1.5, a filling is a closed `3`-manifold with a smooth structure in which the exterior and
  the solid torus are smooth submanifolds with boundary, unique up to diffeomorphism (the collars
  of Layer 1.1 and the gluing of Layer 1.3 on the native embeddings, or Moise's theorem, Layer
  11.2), so that the filling is determined up to homeomorphism, and up to diffeomorphism, by the
  slope.

**Surgery on framed spheres.** The pinned `TauCeti.SphereSurgery` records, inside a space `Y`, the
result of removing the open tube `φ(S^k × int D^q)` of a framed sphere `φ : S^k × D^q → M` and
gluing `D^{k+1} × S^{q−1}` along `S^k × S^{q−1}` (Milnor, *A procedure for killing homotopy groups
of differentiable manifolds*, Section 1; Milnor, *Lectures on the h-cobordism Theorem*, Section 3),
and identifies surgery along the framed circle `(x, y) ↦ Φ(y, x)` of a solid-torus neighbourhood
(`TauCeti.solidTorusFramedSphere`) with the Dehn filling along the longitude of `Φ`
(`TauCeti.SphereSurgery.toDehnFilling`). Prove that surgery on a smoothly embedded framed
`k`-sphere in a closed smooth `n`-manifold is a closed `n`-manifold with a smooth structure
extending the given ones off the seam (Layer 1.3), and that integral surgery with coefficient `n`
on a knot in `S³` is surgery along the framed circle of a neighbourhood with framing number `n`.

**Checks.**
- *Slope sign.* `+1`-surgery on the right-handed trefoil is the Poincaré homology sphere
  (fundamental group the binary icosahedral group of order `120`); `−1`-surgery is the
  Brieskorn sphere `Σ(2, 3, 7)`, not homeomorphic to it.
- *General dimension.* Surgery on `S⁰ ⊂ Sⁿ` with the standard framing gives `S¹ × Sⁿ⁻¹`, and on
  an unknotted `Sⁿ⁻¹ ⊂ Sⁿ` it gives `S⁰ × Sⁿ ≅ Sⁿ ⊔ Sⁿ`.
- *Unknot fillings.* `S³_∞(K) = S³` for every `K`; `S³_0(unknot) = S¹ × S²`;
  `S³_{p/q}(unknot) = L(p, q)`, so `S³_{±1}(unknot) = S³` and `S³_2(unknot) = ℝP³`, with
  `H₁ = ℤ/2` (by evaluation).
- *Hopf link surgery.* Surgery on the Hopf link with framings `(a, b)` gives `L(ab − 1, b)`:
  framings `(0, 0)` give `S³`, `(1, 1)` give `S¹ × S²` and `(3, 2)` give `L(5, 2)` (by
  evaluation).
- *Slope values.* `slopeValue (1, 0) = ∞`, `slopeValue (0, 1) = 0`, `slopeValue (3, 2) = 3/2`,
  and `slopeValue (−3, −2) = 3/2` as well (`TauCeti.slopeValue`), so the sign quotient is
  correct; `(2, 4)` is excluded by primitivity (`gcd = 2`).
- *Unknot framing.* The standard neighbourhood `TauCeti.unknotSolidTorus` of the unknot has
  framing number `0` (`TauCeti.framingNumber_unknotSolidTorus`), so its framing is the preferred
  one (`TauCeti.preferredFramedBoundaryTorus_unknotSolidTorus`); its exterior is the complementary
  solid torus (`TauCeti.unknotExteriorHomeomorph`), whose own framing exchanges meridian and
  longitude, so the value map between the two framings is `x ↦ 1/x`, with `∞ ↔ 0`.
- *Trefoil framing.* A solid-torus neighbourhood of the right-handed trefoil whose longitude is
  the boundary of the cabling annulus (a fibre of the Seifert fibration of the exterior) has
  framing number `6`, the torus-knot framing `pq` of the `(2, 3)` torus knot, not `0`; its
  preferred framing subtracts `6μ`.
- *Framing-change sign.* The preferred longitude `λ₀` has value `0 = 0/1` in the preferred
  framing; in the framing of the cabling neighbourhood (`λ = λ₀ + 6μ`) it is `λ − 6μ`, of value
  `−6`; a formula sending `p/q` to `(p + kq)/q` would give `+6` and is excluded.
- *Orientation of the neighbourhood.* Reversing the orientation of `Φ` turns the framing number
  `n` into `−n` and the value `r` into `−r`, so the surgery coefficient of a knot in `S³` is
  defined up to this sign unless `Φ` is required to preserve orientation; 5.3 and Layer 7.4 use
  this.
- *Native unknot fillings.* `S³_0(unknot) = S¹ × S²` has `H₁ = ℤ` and `S³_∞(unknot) = S³` has
  `H₁ = 0`; `S³_2(unknot) = L(2, 1) = ℝP³` has `H₁ = ℤ/2`, and `TauCeti.LensSpace 2 ![1, 1]` is
  `S³/{±1} = ℝP³` with `π₁` of order `2` (`TauCeti.LensSpace.card_fundamentalGroup`); here the
  native sign is invisible, since `−1 = 1` in `ℤ/2`. `S³_1(unknot) = S³` by the identity for
  `1/n`, consistent with `H₁ = ℤ/1 = 0` and with `LensSpace 1 ![1, 1]` being the quotient of `S³`
  by the trivial group.
- *Sign witness.* The witness is `p = 5`: the slope-`5/2` filling of the unknot is the native
  `LensSpace 5 ![1, −2] = LensSpace 5 ![1, 3]`, homeomorphic to `TauCeti.LensSpace 5 ![1, 2]` by
  the reflection; a convention giving `LensSpace 5 ![1, 2]` directly would differ from the native
  one by the orientation of `S³` and agree with it as unoriented spaces.
- *Exchanged parameters.* The surgery description with the two parameters exchanged,
  `S³_{p/q}(unknot) ≃ₜ TauCeti.LensSpace q ![1, p]`, is excluded by `π₁`: `S³_{5/2}(unknot)` has
  `H₁ = ℤ/5` while `LensSpace 2 ![1, 5] = ℝP³` has `π₁` of order `2`.
- *Poincaré sphere from the left-handed trefoil.* `−1`-surgery on the left-handed trefoil is
  `+1`-surgery on the right-handed one with the orientation reversed
  (`S³_{p/q}(K̄) ≅ −S³_{−p/q}(K)`), so it is the Poincaré homology sphere: `H₁ = 0` by the
  formula and `π₁` the binary icosahedral group of order `120`, not trivial, the first instance
  of Property P (5.3).
- *Unlink surgery.* Surgery on the framed two-component unlink with framings `0, 0` gives
  `S¹ × S² # S¹ × S²` and with framings `1, 1` gives `S³`; the Hopf link with framings `0, 0`
  gives `S³` and with `0, n` gives `S³` again (a slam-dunk), so framings on linked components
  interact.
- *Filling-slope convention.* A convention reading the slope off the image of the longitude of
  the filling solid torus, rather than of its meridian, would assign the exchange of factors the
  meridian of `Φ` and make the `0`-surgery on the unknot the trivial filling;
  `TauCeti.unknotZeroDehnFilling_gluing` with
  `TauCeti.IsSolidTorusNeighborhood.fillingSlope_prodComm` excludes it.

*Needs:* Layers 1.7.2, 5.1, 9.1; Tau Ceti `TauCeti.DehnFilling`, `TauCeti.LinkDehnFilling`,
`TauCeti.SphereSurgery`, `TauCeti.Slope`, `TauCeti.FramedBoundaryTorus.slopeEquiv`,
`TauCeti.LensSpace`, `TauCeti.SolidTorus`; Layers 1.1, 1.3 and 1.5 (collars, gluing and tubes,
for the smooth structure of a filling), Layer 4.3 (Seifert surfaces), Layer 11.2 (Moise's
theorem) and Layer 11.2.1 (isotopy of surface homeomorphisms to diffeomorphisms); Tau Ceti
`TauCeti.IsPrimitive`, `TauCeti.BoundaryTorus`, `TauCeti.slopeEquivStd`, `TauCeti.slopeValue`,
`TauCeti.FramedBoundaryTorus.ofHomeomorph`, `TauCeti.FramedBoundaryTorus.torusCurveClass`,
`TauCeti.FramedBoundaryTorus.value_mk_torusCurveClass`,
`TauCeti.IsSolidTorusNeighborhood.framedBoundaryTorus`,
`TauCeti.IsSolidTorusNeighborhood.framingNumber`,
`TauCeti.IsSolidTorusNeighborhood.preferredFramedBoundaryTorus`,
`TauCeti.IsSolidTorusNeighborhood.complementHomologyEquiv`,
`TauCeti.IsSolidTorusNeighborhood.ker_boundaryHomologyMap`,
`TauCeti.IsSolidTorusNeighborhood.complementHomologyEquiv_boundaryHomologyMap_preferred`,
`TauCeti.isZero_reducedSingularHomologyFunctor_one_sphere_euclideanSpace_fin_four`,
`TauCeti.unknotSolidTorus`, `TauCeti.unknotExteriorHomeomorph`,
`TauCeti.framingNumber_unknotSolidTorus`, `TauCeti.preferredFramedBoundaryTorus_unknotSolidTorus`,
`TauCeti.IsSolidTorusNeighborhood.fillingSlope`,
`TauCeti.IsSolidTorusNeighborhood.dehnFillingSpace`,
`TauCeti.IsSolidTorusNeighborhood.exists_dehnFilling`,
`TauCeti.IsSolidTorusNeighborhood.meridianDehnFilling`,
`TauCeti.IsSolidTorusNeighborhood.exists_fillingSlope_torusHomeomorph_eq`,
`TauCeti.DehnFilling.exists_homeomorph_of_isotopic`,
`TauCeti.DehnFilling.exists_homeomorph_of_isotopic_torusHomeomorph`,
`TauCeti.unknotZeroDehnFilling`, `TauCeti.unknotLensSpaceDehnFilling`,
`TauCeti.DehnFilling.nonempty_homeomorph_lensSpace_of_unknot_slopeValue`,
`TauCeti.IsSolidTorusLinkNeighborhood.exists_linkDehnFilling`,
`TauCeti.IsSolidTorusLinkNeighborhood.surgerySlope`, `TauCeti.solidTorusFramedSphere`,
`TauCeti.SphereSurgery.toDehnFilling`, `TauCeti.LensSpace.fundamentalGroupMulEquiv`,
`TauCeti.LensSpace.card_fundamentalGroup`, `TauCeti.LensSpace.eq_of_homeomorph` and the manifold
instances of `Geometry/Manifold/Instances/LensSpace.lean`; Mathlib `OnePoint ℚ`, `Diffeomorph`,
`Homeomorph`, `FundamentalGroup`, `ZMod`, `Matrix.GeneralLinearGroup`; AlgebraicTopology Stage 1
(van Kampen) and Stage 3 (Mayer–Vietoris), for the `H₁` and `π₁` computations.

### 5.3 Property P, Property R and cosmetic surgery

State Property P: for every nontrivial knot `K ⊂ S³`, every solid-torus neighbourhood whose
boundary torus is locally flat (`TauCeti.IsLocallyFlat`, as for every smooth tubular
neighbourhood) and every slope other than the meridian, every Dehn filling of the exterior is not
simply connected (Kronheimer–Mrowka, *Witten's
conjecture and Property P*, Geom. Topol. 8 (2004), main theorem; Kirby's Problem 1.15).
`Suggested.lean` states it as `property_P`. State Property R: if `S³_0(K) ≅ S¹ × S²` then `K` is
the unknot (Gabai, *Foliations and the topology of 3-manifolds III*, J. Differential Geom. 26
(1987), §8; Kirby's Problem 1.16); since a filling along `p/q` has `H₁ ≅ ℤ/p` (Layer 5.2),
`Suggested.lean` states the equivalent framing-free form, that no filling of a nontrivial knot's
exterior is homeomorphic to `S¹ × S²`, as `property_R`. Their proofs (gauge theory, foliations)
are not owned here. The cosmetic-surgery notions are Tau Ceti's: purely and chirally cosmetic
pairs of slopes, `TauCeti.IsSolidTorusNeighborhood.IsPurelyCosmetic` and
`TauCeti.IsSolidTorusNeighborhood.IsChirallyCosmetic`, the cosmetic surgery conjecture
`TauCeti.CosmeticSurgeryConjecture` (open, not asserted; Kirby's Problem 1.81), and Mathieu's
case `k = 0` below as the proposition `TauCeti.MathieuChirallyCosmeticTheorem`. State the
Gordon–Luecke corollary that the only slope on a nontrivial knot whose filling is `S³` is `∞`
(Layer 8.1; its proof is GeometricTopology, Part II's). Prove Mathieu's theorem: for the
right-handed trefoil and every `k ≥ 0`, the fillings along `(18k + 9)/(3k + 1)` and
`(18k + 9)/(3k + 2)` in the preferred framing are orientation-reversingly homeomorphic Seifert
fibred spaces (Mathieu, *Closed 3-manifolds unchanged by Dehn surgery*, J. Knot Theory
Ramifications 1 (1992)); its case `k = 0`, the coefficients `9` and `9/2` (or `−9` and `−9/2`
for the mirrored framing), is the pinned proposition.

**Forms of the headlines.** In `Suggested.lean` the knot of each headline is
`K : TauCeti.SmoothCircleEmbedding (𝓡 3) S³` not smoothly ambient isotopic to `TauCeti.unknot`,
and each headline quantifies over every solid-torus neighbourhood `Φ` of `K` with locally flat
boundary torus, every slope `s` and every filling `F : DehnFilling h s Y`; the locally flat
hypothesis is part of the stated form. Property P, `property_P`, concludes
`¬ SimplyConnectedSpace Y` for `s` other than the meridian; since such a filling is
path-connected, this says that `π₁(Y, y)` is nontrivial for every base point `y`. Its proof, not
owned here, has two routes: Kronheimer–Mrowka's main theorem, their Theorem 2 (for `K`
nontrivial, the `+1`-surgery admits a nontrivial homomorphism `π₁ → SO(3)`, so their Conjecture
1, that `S³_{+1}(K)` is not a homotopy sphere, holds; `−1` follows by mirroring, and every other
slope through the cyclic surgery theorem of Culler–Gordon–Luecke–Shalen, Ann. of Math. 125
(1987), and Moser's torus-knot surgeries, 5.4), or the Poincaré conjecture (Layer 8.6) together
with the Gordon–Luecke theorem. Property R, `property_R`, concludes `IsEmpty (Y ≃ₜ S¹ × S²)` for
every slope; Gabai's form, the filling along the longitude of the preferred framing (5.1), is its
case `s = 0`. `Suggested.lean` states the Gordon–Luecke theorem in the same form as
`gordon_luecke_theorem`: for `K` and `Φ` as above and `s` other than the meridian,
`IsEmpty (Y ≃ₜ S³)` (Gordon–Luecke, *Knots are determined by their complements*, J. Amer. Math.
Soc. 2 (1989)); its corollary, that knots with homeomorphic complements are carried onto each
other by a homeomorphism of `S³`, is Layer 8.1's `gordon_luecke`.

**Cosmetic pairs.** On the exterior of a knot in a space oriented by
`o : TauCeti.HomologicalOrientation`, two slopes are purely cosmetic
(`TauCeti.IsSolidTorusNeighborhood.IsPurelyCosmetic`) when fillings along them, oriented
compatibly with `o` on the open exterior (`TauCeti.DehnFilling.IsOrientationCompatible`), are
homeomorphic by an orientation-preserving homeomorphism, and chirally cosmetic
(`TauCeti.IsSolidTorusNeighborhood.IsChirallyCosmetic`) when they are homeomorphic by an
orientation-reversing one (Bleiler's terms, in Kirby's remarks to Problem 1.81); both relations
are symmetric and independent of `o` at the pin
(`TauCeti.IsSolidTorusNeighborhood.IsPurelyCosmetic.symm`,
`TauCeti.IsSolidTorusNeighborhood.IsChirallyCosmetic.symm`,
`TauCeti.IsSolidTorusNeighborhood.isPurelyCosmetic_neg_iff`,
`TauCeti.IsSolidTorusNeighborhood.isChirallyCosmetic_neg_iff`). The cosmetic surgery conjecture
`TauCeti.CosmeticSurgeryConjecture` is Gordon's form of Kirby's Problem 1.81 (A): a nontrivial
knot in `S³` has no purely cosmetic pair of distinct slopes. The pin records two partial results
as propositions: `TauCeti.NiWuCosmeticSurgeryTheorem`, that two distinct purely cosmetic slopes
have opposite coefficients `±p/q` in the preferred framing, with `q² ≡ −1 (mod p)` (Ni–Wu,
*Cosmetic surgeries on knots in S³*, J. Reine Angew. Math. 706 (2015)), and
`TauCeti.HanselmanCosmeticSurgeryTheorem`, that these coefficients are `±2` or `±1/q` (Hanselman,
*Heegaard Floer homology and cosmetic surgeries in S³*, J. Eur. Math. Soc. 25 (2023)). Their
proofs rest on Heegaard Floer invariants and they are not targets of this roadmap (*Scope and
ownership*); this layer claims
nothing about the conjecture or about these two statements.

`Suggested.lean` states the pinned proposition `TauCeti.MathieuChirallyCosmeticTheorem` as
`mathieu_chirally_cosmetic_theorem`: on the exterior of the native `TauCeti.rightHandedTrefoil`,
for every neighbourhood `Φ` and every orientation of `S³`, the slopes of coefficients `9` and
`9/2`, or those of coefficients `−9` and `−9/2` according to the orientation behaviour of `Φ`
(5.2), are chirally cosmetic (Mathieu's pair as recorded in Kirby's remarks to Problem 1.81).
Prove that the two slopes of each of Mathieu's pairs are inequivalent, that is, that no
self-homeomorphism of the exterior carries one to the other: a self-homeomorphism of the exterior
of a nontrivial knot in `S³`, for a neighbourhood with locally flat boundary torus, preserves the
meridian up to sign, by the Gordon–Luecke theorem as stated above, and the preferred longitude up
to sign, since that longitude spans the kernel of `H₁(∂X_K) → H₁(X_K)` (5.1); so it acts on
surgery coefficients by `r ↦ ±r`, while `(18k + 9)/(3k + 1)` and `(18k + 9)/(3k + 2)` are in
lowest terms with different denominators; for `k = 0`, `9/2 ≠ ±9`.

State the Akbulut–Kirby conjecture as the pinned proposition `TauCeti.AkbulutKirbyConjecture`:
knots in `S³` whose `0`-surgeries, oriented compatibly with one orientation of `S³`, are
homeomorphic by an orientation-preserving homeomorphism are smoothly concordant
(`TauCeti.SmoothEmbedding.Concordant`, Layer 6.1), or become so after reversing one of them
(Kirby's Problem 1.19). It is false, and `TauCeti.YasuiTheorem`, its negation, records this
(Yasui, *Corks, exotic 4-manifolds and knot concordance*, arXiv:1505.02551). Yasui's theorem is
recorded and not a target: its proof distinguishes the concordance classes by concordance
invariants whose theory belongs to GeometricTopology, Part II.

**Checks.**
- *Nontriviality.* `S³_{±1}(unknot) = S³` is simply connected, so Property P needs `K`
  nontrivial.
- *Locally flat boundary torus.* The pinned predicate `TauCeti.IsSolidTorusNeighborhood` admits a
  wild boundary torus: a standard solid torus about the unknot with an Alexander horned ball
  attached along a boundary disc is still the image of an embedding of `D² × S¹` mapping the open
  solid torus onto an open set, but its exterior is not a `3`-manifold at the wild points, so it
  is not Seifert fibred, while its fillings are still those of the unknot (a smaller tame tube
  cobounds a product `T² × [0, 1]` with the wild torus on the solid-torus side), the `5/2`-filling
  being `L(5, 2)`, cyclic, along a non-integral slope. The cyclic surgery headline therefore needs
  the boundary torus locally flat, as the tubular neighbourhoods of Layer 1.5 are; Property P and
  Property R assume it too, in the setting of their sources.
- *Property R at the unknot.* `S³_0(unknot) = S¹ × S²`
  (`TauCeti.DehnFilling.nonempty_homeomorph_circle_prod_sphere_of_unknot_longitude`), so
  Property R needs `K` nontrivial, as `property_R` assumes.
- *Mathieu's first pair.* The fillings of the right-handed trefoil along `9/1` and `9/2` are
  Seifert fibred with exceptional fibres of multiplicities `2, 3, 3` (Layer 5.4, the third being
  `|p − 6q| = 3` in both cases) and have `H₁ = ℤ/9` (by evaluation).
- *The unknot's `S³` fillings.* `S³_{1/n}(unknot) ≅ S³` for every `n` (5.2) gives infinitely many
  slopes with filling `S³`, so the Gordon–Luecke theorem needs `K` nontrivial; these slopes are
  equivalent, the exterior solid torus having a homeomorphism carrying `1/n` to `1/m`, consistent
  with the corollary on complements, the core of each of these fillings being a knot in `S³` with
  solid-torus exterior, hence the unknot.
- *Meridian.* The meridian is purely cosmetic with itself for every knot
  (`TauCeti.IsSolidTorusNeighborhood.isPurelyCosmetic_meridian`), which is why the cosmetic
  surgery conjecture asks for distinct slopes.
- *Zero-surgeries.* The `0`-surgery on the trefoil is a torus bundle over the circle, not
  `S¹ × S²` (its `π₁` is not `ℤ`); the `0`-surgery on the figure-eight knot is a torus bundle with
  Anosov monodromy, whose `π₁` is not `ℤ` either, consistent with Property R.
- *Every gluing.* Property P quantifies over every filling along `s`, with any gluing of that
  slope; by the uniqueness of the filling along a slope (5.2) these are all homeomorphic to
  `S³_r(K)`, `r` the value of `s`, so the pinned form and the classical one agree. The slope `0`
  is allowed, and `π₁(S³_0(K))` is nontrivial already by `H₁ ≅ ℤ`.
- *Mathieu's pair and Ni–Wu.* Mathieu's coefficients are distinct and not opposite,
  so they are not identified by the symmetry `r ↦ −r` of the mirror image either; the Ni–Wu
  constraint `q² ≡ −1 (mod p)` for purely cosmetic pairs fails for `9/2` (`4 ≢ −1 (mod 9)`),
  consistent with the pair being chirally and not purely cosmetic.

*Needs:* Layer 5.2, Layer 4.1, Layer 8.4 (Seifert fibred fillings, for Mathieu); Tau Ceti
`TauCeti.DehnFilling`, `TauCeti.IsSolidTorusNeighborhood.IsChirallyCosmetic`,
`TauCeti.MathieuChirallyCosmeticTheorem`; Mathlib `SimplyConnectedSpace`; Layer 5.1 (the
preferred longitude, for Mathieu's inequivalence), Layer 6.1 (the concordance relation, for the
Akbulut–Kirby statement); Tau Ceti `TauCeti.unknot`, `TauCeti.rightHandedTrefoil`,
`TauCeti.SmoothEmbedding.SmoothAmbientIsotopic`,
`TauCeti.SmoothLinkEmbedding.SmoothAmbientIsotopic`,
`TauCeti.IsLocallyFlat`, `TauCeti.IsSolidTorusNeighborhood.preferredFramedBoundaryTorus`,
`TauCeti.IsSolidTorusNeighborhood.IsPurelyCosmetic`, `TauCeti.DehnFilling.IsOrientationCompatible`,
`TauCeti.HomologicalOrientation`, `TauCeti.CosmeticSurgeryConjecture`,
`TauCeti.NiWuCosmeticSurgeryTheorem`, `TauCeti.HanselmanCosmeticSurgeryTheorem`,
`TauCeti.AkbulutKirbyConjecture`, `TauCeti.YasuiTheorem`, `TauCeti.SmoothEmbedding.Concordant`;
Mathlib `FundamentalGroup`, `Homeomorph`.

### 5.4 The cyclic surgery theorem and unknotting number one

State the cyclic surgery theorem: if the exterior of a knot `K ⊂ S³` is not Seifert fibred and
two slopes give fillings with cyclic fundamental group, then the slopes have distance at most
one, so two distinct such slopes have distance exactly one (Culler–Gordon–Luecke–Shalen, *Dehn
surgery on knots*, Ann. of Math. 125 (1987), the Cyclic Surgery Theorem); its proof is
GeometricTopology, Part II's, and every use below consumes it as stated. With one slope the
meridian, whose filling is `S³`, it says that every cyclic filling of a knot in `S³` with
non-Seifert-fibred exterior is along the meridian or a slope of integral value, the distance of a
slope of value `p/q` from the meridian being `|q|` in every framing; `Suggested.lean` states this
case against the pinned `TauCeti.DehnFilling` and `TauCeti.IsSeifertFibered`, for a solid-torus
neighbourhood with locally flat boundary torus as in 5.3, as `cyclic_surgery_theorem`. Prove that a Seifert
fibred exterior of a nontrivial knot is a torus-knot exterior, and Moser's criterion: for
coprime `r, s` with `|r|, |s| ≥ 2` and coprime `p, q`, the filling of `T(r, s)` along `p/q` is a
lens space iff `|p − q r s| = 1` (Moser, Pacific J. Math. 38 (1971)); the unknot, whose filling
`p/q` is always `L(p, q)` (with `L(1, q) = S³`, `L(0, 1) = S¹ × S²`), is excluded. Prove
Scharlemann's theorem that unknotting number one knots are prime (Scharlemann 1985) by the
sutured-manifold route of 5.4.1; the Montesinos trick, that if `u(K) = 1` then the double
branched cover of `K` is `±(d/2)`-surgery on a knot in `S³`, `d` the determinant; and the
Kanenobu–Murakami criterion for unknotting number one of two-bridge knots (Kanenobu–Murakami,
*Two-bridge knots with unknotting number one*, Proc. Amer. Math. Soc. 98 (1986)), derived from
the cyclic surgery theorem as stated by the Montesinos trick and Moser's classification applied
to the lens space that is the double branched cover (both in 5.4.2).

**Checks.**
- *Moser's hypothesis.* `T(1, 2)` is the unknot and its `5`-surgery is `L(5, 1)` although
  `|5 − 1 · 1 · 2| = 3`, so the criterion needs `|r|, |s| ≥ 2` (by evaluation).
- *Scharlemann.* The granny knot has `u = 2` and is composite; `u(8₃) = 2` and `8₃` is prime
  (5.4.2), so the converse fails.
- *The unknot is excluded.* On the unknot the meridian `∞` and the slope `1/2` both give
  `S³ = L(1, 2)`, at distance `2`, and `5/2` gives the cyclic `L(5, 2)`, also at distance `2`
  from the meridian and at distance `|1 · 2 − 2 · 5| = 8` from `1/2`; neither `1/2` nor `5/2` is
  integral. So the conclusion fails for the unknot, whose exterior is a solid torus, Seifert
  fibred, and the non-Seifert-fibred hypothesis cannot be dropped. The pair `∞`, `±1` would not
  show this: it is at distance one and satisfies the conclusion (by evaluation).
- *Trefoil lens surgeries.* `T(2, 3)` has lens-space surgeries exactly for `|p − 6q| = 1`, the
  filling being `L(p, 9q)`: `p/q = 5` and `7` give `L(5, 4)` and `L(7, 2)` up to orientation; `p/q = 6`
  gives the reducible `L(2, 1) # L(3, 1)`, which is why `|p − 6q| = 0` is excluded (by
  evaluation).

*Needs:* Layer 5.2, Layer 8.2, Layer 8.4 (Seifert fibred spaces), Layer 4.9, Layer 4.10.

### 5.4.1 Rational replacement and generalized unknotting

Prove that no generalized crossing change on a composite tame knot produces the unknot, where a
generalized crossing change is ±1/n surgery, n ≥ 1, on C = ∂D for an embedded disc D meeting
the knot twice with opposite signs. The proof runs on the exteriors, framed tori and slopes of
5.1–5.2 and the marked rational tangles of 4.10; the change has rational-replacement distance
2n, distinct from its slope distance n on the crossing-circle torus.

**Sutured and replacement proof supplier.** Build compact oriented sutured manifolds (annular
and toroidal sutures, oriented R₊/R₋ regions, product collars), properly embedded oriented
decomposing and conditioned surfaces, relative isotopy, gluing and boundary compression. A
conditioned surface has coherently oriented parallel essential boundary circles on toroidal
sutures, coherently oriented essential arcs or parallel circles on annular ones, and no
nonempty subcollection of its boundary circles in R(γ) zero in H₁(R(γ),∂R(γ);ℤ). Own the
integral surface minimum: for compact oriented N, the minimum of χ₋ over embedded oriented
representatives of each class of H₂(N,∂N;ℤ) (built by duality, circle-valued maps and relative
regular values), its existence in ℕ and its naturality under orientation-compatible
homeomorphisms; the Thurston seminorm on it is GeometricTopology, Part II's, except on a closed
oriented `3`-manifold, where it is the Thurston norm of Layer 10.4. Define sutured
irreducibility and tautness from these classes, with the arc version and the arc-to-suture
conversion, and construct, combinatorially and without taut foliations, taut conditioned
representatives, the finite hierarchy with decreasing complexity and product terminals, and
the parameterizing-surface index estimates for attaching a 2-handle. Prove the
norm/Euler/genus comparisons for links, disconnected surfaces and disc terms included: for c
components, total genus G and μ boundary curves, `χ=2c−2G−μ` and `χ₋=Σ_i max(2g_i+μ_i−2,0)`;
arc-avoiding interior tubing preserves G, lowers χ by 2(c−1) and compares the minimum over
disconnected surfaces with 4.3's connected oriented Seifert minimum (fixed preferred longitude
on each component, no closed components), while χ₋-minimality and tautness come from Taylor's
separate conditioned/norm comparison, from which the link form of the theorem below is derived.
Connected knot surfaces give the ordinary genus of 4.3.4.

A rational replacement is a marked ball B′ with a collared outside tangle and rational tangles
rα, rβ in B′ with the same four endpoints. Construct its genus-two handlebody W ⊂ S³ with discs
α, β identified with the rational-tangle constructors (two handlebody discs meeting 2d times
are not by themselves a replacement), N = closure(S³ ∖ W) with a = ∂α, b = ∂β meeting minimally
and nontrivially, N[a] and N[b] by 2-handle attachment, Lα, Lβ the cores of the remaining solid
tori and the co-core arcs ᾱ, β̄; the rational-tangle dictionary identifies `i(a,b)=2d` with
replacement distance d. Prove Taylor's meridional planar-surface theorem ([version-two
statement, Theorem 5.12](https://arxiv.org/html/0806.1572v2)): if N is irreducible, d ≥ 1,
either Lα is a knot or `∂W−∂α` is incompressible in N, and, independently, either Lα is split
or no minimum-genus Seifert surface of Lα has interior disjoint from ᾱ, then an essential
meridional planar surface with m boundary curves in the Lβ exterior can be replaced by one, Q,
with `|∂Q|≤m` and either Q ∩ β̄ = ∅ or `|Q∩β̄|(d−1)≤|∂Q|−2`, by parameterizing surfaces, the
2-handle index inequality, boundary compressions and the rational-distance calculation.

**A marked reverse crossing model.** On the unknot U, surgery of slope μ + kλ, |k| = n, on the
reverse crossing circle C = ∂D recovers K, with peripheral dictionary `μ*=μ+kλ`, `λ*=λ` and the
reverse disc's strand markings and framing identified through the radial longitude annulus of
the filling torus. For an arc η ⊂ D joining the punctures, W = ν(U ∪ η) has N irreducible by
Schoenflies, and a thin subdisc P ⊂ D around η gives a middle disc P_W splitting W into two
solid tori with `i(m_U,γ)=2`, m_U the central-rung co-core and γ = ∂P_W. With B′ = ν(P), the
signed k-fold disc twist takes U to K and m_U to `m_K=T_γ^k(m_U)`, and the annular twist formula
`i(m_U,m_K)=|k|i(m_U,γ)²=4n` gives rational distance 2n, with ᾱ = η.

**The spanning-disc dichotomy.** If U has a spanning disc E missing int η, tubing E along
C₀ = ∂P, which meets E twice with opposite signs since `lk(C₀,U)=D·U=0`, gives a χ = −1
surface that survives the 1/k filling and spans K, so g(K) ≤ 1 < 2 ≤ g(K) for composite K.
Otherwise every minimum-genus surface of U is a disc meeting η and Taylor's theorem applies: an
essential meridional annulus of composite K becomes Q with at most two boundary curves, neither
a sphere (exterior irreducibility, 5.1) nor a meridional disc (the meridian is nonzero in H₁),
hence an annulus missing β̄ since d = 2n ≥ 2, and tracking it through the replacement leaves a
nontrivial summand, contradicting the unknot. Hence
`u(K)=1⇒K prime`, and for u(K) = u(J) = 1 two crossing changes and primeness give
u(K#J) = 2.

**Checks.**
- *Norm of small surfaces.* `χ₋` is `0` for a disc and an annulus and `1` for a once-punctured
  torus, so the norm discards discs and annuli while 4.3's Seifert genus does not (by
  evaluation).
- *Crossing change.* For `n = 1`, `i(m_U, m_K) = 4` and the replacement distance is `2`,
  twice the slope distance `1` (by evaluation).
- *Tubed disc.* The surface built from a spanning disc with two punctures and a tube has
  `χ = 1 − 2 + 0 = −1`, one boundary component and genus `1`, so a knot obtained from the unknot
  by one generalized crossing change has `g ≤ 1`, while a composite knot has `g ≥ 2` (by
  evaluation).

*Needs:* 4.3.4 ordinary genus, 4.9 prime/decomposing spheres, 4.10 relative rational tangles,
5.1–5.2 marked exteriors/fillings, 8.1–8.2 sphere/loop and essential-surface theory, 11.2's
relative PL/smooth comparison. The sutured norm/hierarchy and replacement comparison are owned
here; this is the route by which 5.4's Scharlemann theorem is proved.

### 5.4.2 Two-bridge unknotting and the eight-crossing example

**Native lens models and their full homeomorphism test.** For p ≥ 1 and coprime p, q, compare
5.2's gluing model L(p, q) with the native `TauCeti.LensSpace p ℓ`, `ℓ=![1,q_unit]:Fin 2→(ZMod p)ˣ`,
pinning the deck generator and the orientation and reusing its manifold and fundamental-group
APIs; construct the marked solid-torus decomposition, a finite CW structure, the gluing
comparison and the cellular chain complex of the cyclic cover, `d₁=t−1`,
`d₂=Σ_(j=0)^(p−1)t^j`, `d₃=t^r−1` with rq ≡ 1 mod p, matched to the quotient. State the
classification of lens spaces: for positive p and units q, q′ mod p, `L(p,q)≅L(p,q′)` as
unoriented manifolds iff `q′≡±q^(±1) mod p`, with the orientation-preserving comparison and the
p = 1 sphere case stated separately (Reidemeister, *Homotopieringe und Linsenräume*, Abh. Math.
Sem. Univ. Hamburg 11 (1935); Brody, Ann. of Math. 71 (1960); Hatcher, *Notes on Basic
3-Manifold Topology*, Theorem 2.5, whose notation `L_(p/q)` exchanges the roles of p and q).
Sufficiency is proved here by the coordinate and solid-torus maps. Necessity is consumed as
stated, and its proof is GeometricTopology, Part II's: by the Reidemeister–Franz torsion of the
complex above (character values `((ζ−1)(ζ^r−1))⁻¹` at the nontrivial characters t ↦ ζ of C_p,
and Franz independence) on MorseNovikov's based cellular torsion, or by the uniqueness up to
isotopy of the torus splitting L(p, q) into two solid tori (Hatcher, Theorem 2.5, the proof),
with 11.2's comparison of homeomorphisms and diffeomorphisms. The p = 0 gluing is S¹ × S².

**Montesinos and the precise criterion.** The double cover of a marked rational tangle branched
along its strands is a solid torus whose lifted meridian slopes have intersection distance the
replacement distance. Glued to the fixed outside cover, the unknot's cover is S³ and a crossing
change lifts to a distance-two filling on the exterior of a knot J ⊂ S³ with coefficient ±d/2,
d = det K (filled first homology and the determinant comparison; sign and orientation
explicit); in particular `Σ₂(S(p,q))≅L(p,q)` for 4.10's rational knots. For every nontrivial
rational knot S(p, q), p > 1 odd, gcd(p, q) = 1, prove the Kanenobu–Murakami equivalence
([Kanenobu–Murakami, Theorem 1](https://doi.org/10.2307/2046210))

```text
u(S(p,q))=1
  iff ∃ m,n>0, gcd(m,n)=1, (2mn=p−1 or 2mn=p+1),
       q≡±(2n²)^(±1) mod p.
```

with inversion in `(ZMod p)ˣ` (2n² is a unit by the parameter conditions); the four residues
encode the unoriented Schubert comparison up to a global mirror, under which u is invariant, and
p = 1 is the separate u = 0 case. Necessity: the ±p/2 Montesinos filling and 5.4's cyclic surgery
theorem make J a torus knot or the unknot, Moser gives L(p, 2n²) with 2mn = p ± 1, and the lens
homeomorphism test and Schubert's theorem return to knots (a cover homeomorphism alone is not
branch-preserving). Sufficiency: the Conway family `[a,a₁,…,a_k,±2,−a_k,…,−a₁]` (right-nested as
in 4.10.3, k = 0 included), from a signed Euclidean expansion of n/t with m = an + t, 0 < |t| < n
(n = 1 separately), has primitive fraction (p, 2n²) by the matrices `M(x)=[[x,1],[1,0]]`;
switching one middle crossing gives 0 after Reidemeister II, and
`M(a)·M(w)·M(0)·M(−reverse(w))=M(a)·M(0)` has first column (1, 0), which with the relative tangle
isotopies and numerator closure is a one-change unknotting. Conversely every nontrivial knot of
this signed palindromic family has u = 1, which gives the full Conway-form equivalence.

**The knot 8₃.** Prove `u(8₃) = 2`, assuming Hypothesis 5.4.2. The double branched cover is
L(17, 4). If u = 1, the Montesinos lift is ±17/2 surgery on a knot J, cyclic at distance 2 from
the meridian, so the cyclic surgery theorem makes J Seifert fibred: the torus-knot case is
excluded by the torus-branch Check, and the unknot case gives L(17, ±2), excluded by the
lens-orbit Check and the lens homeomorphism test. The upper bound is the upper-bound
Check, carried through the signed Conway/PD and spatial realization dictionaries; each diagram,
cover, slope and filling identity is proved for the realized diagram, not read off the label.

**Hypothesis 5.4.2 (8₃ as a rational knot).** The rational knot of the marked diagram [4,4],
with primitive pair (17, 4), is the knot 8₃.

**Checks.**
- *Lens orbit.* The unoriented parameter orbit of `L(17, 2)` is `{2, 15, 9, 8}`, which does not
  contain `4` (by evaluation).
- *Torus branch.* `|±17 − 2rs| = 1` forces `|rs| ∈ {8, 9}`, and neither `8` nor `9` is a product
  of coprime integers of absolute value at least `2` (by evaluation).
- *Upper bound.* Switching the second and fourth crossings of the first box of `[4, 4]`
  gives the word σσ⁻¹σσ⁻¹, which two Reidemeister II moves reduce to `[0, 4]`, pair `(1, 4)`,
  the unknot (by evaluation).
- *Lens classification.* `L(5, 1)` and `L(5, 2)` have the same homology `ℤ/5` and are not
  homeomorphic, since `2 ≢ ±1^{±1} (mod 5)`; `L(7, 1)` and `L(7, 6)` are homeomorphic since
  `6 ≡ −1`; `L(5, 2)` and `L(5, 3)` are homeomorphic since `3 ≡ 2⁻¹ (mod 5)`. The parameter `p`
  is already a homeomorphism invariant by the native `TauCeti.LensSpace.eq_of_homeomorph`, so the
  classification is the comparison for fixed `p`.
- *The unknot's `5/2`-filling.* The slope-`5/2` filling of the unknot, the native
  `TauCeti.LensSpace 5 ![1, 3]` (5.2), is not homeomorphic to `L(5, 1)`, since `3 ≢ ±1 (mod 5)`
  and `3⁻¹ ≡ 2 ≢ ±1 (mod 5)`.

*Needs:* 4.2 realized diagrams, 4.4 determinant/branched-cover homology, 4.10 Schubert
classification, 4.10.3's integral continuants, 5.1–5.2, 5.4's CGLS/Moser prefix, the native
lens quotient and slope APIs, Layer 11.1's finite CW structures with Mathlib's singular
homology, the lens-space classification (necessity consumed as stated, its proof being
GeometricTopology, Part II's), 11.2's triangulation
comparison. The cellular chain complexes, the sufficiency direction of the lens classification
and the Montesinos dictionaries are built here.

### Examples

The unknot's fillings `S³`, `S¹ × S²` and the lens spaces; the Poincaré homology sphere as
`+1`-surgery on the right trefoil; the Hopf link exterior `T² × [0, 1]`; the trefoil's lens
space surgeries.
The trefoil exterior as the host of Mathieu's chirally cosmetic pair; the Weeks manifold as the
`5, 5/2` surgery on the Whitehead link (Layer 7.4).

### Dependencies

Layer 1.5 (tubes), Layer 1.7.2 (Dehn twists) and Layer 9.1 (Heegaard splittings) for the
Lickorish–Wallace theorem, Layer 3.3 (isotopy extension), Layer 4 (links), Layer 8
(irreducibility, Seifert fibred spaces); Tau Ceti's slopes, solid tori, exteriors, Dehn fillings,
sphere surgery, cosmetic predicates, the Weeks manifold and lens spaces.
Layer 1.1 and Layer 1.3 (collars and gluing, for the smooth structure of a filling) and Layer 1.4
(connected sum); Layer 4.1 and Layer 4.3 (framings and Seifert surfaces); Layer 6.1 (the
concordance relation, for the Akbulut–Kirby statement of 5.3); Layer 11.2 (Moise's theorem, for
the smooth structure of a filling); Tau Ceti's framings, the surgery statements
(`TauCeti.CosmeticSurgeryConjecture`, `TauCeti.NiWuCosmeticSurgeryTheorem`,
`TauCeti.HanselmanCosmeticSurgeryTheorem`, `TauCeti.MathieuChirallyCosmeticTheorem`,
`TauCeti.AkbulutKirbyConjecture`, `TauCeti.YasuiTheorem`) of the supplier contracts;
AlgebraicTopology Stage 1 (van Kampen) and Stage 3 (Mayer–Vietoris). The Poincaré conjecture
(Layer 8.6) is one of the two routes named for Property P and not a dependency of this layer.

## Layer 6: knot concordance

Two knots in `S³` are concordant when they cobound an annulus in `S³ × [0, 1]`: smoothly,
`TauCeti.SmoothEmbedding.Concordant`, through a collared `TauCeti.SmoothEmbedding.Concordance`
with no reflection of either end; locally flatly, `TauCeti.TopologicallyConcordant`. The slice
notions are `TauCeti.IsSmoothlySlice`, `TauCeti.IsTopologicallySlice` and
`TauCeti.sliceGenus`. This layer builds the concordance group, the signature invariants, the
concordance invariance of the knot Arf invariant and the theorems of Kirby's list about
concordance.
It also defines link cobordisms and proves the slice genus inequalities for them (6.5).

### 6.1 The concordance group

For knots `K, J ⊂ S³` smooth concordance is `TauCeti.SmoothEmbedding.Concordant K J` and
topological concordance is `TauCeti.TopologicallyConcordant` of the underlying maps. Prove that
concordance is a congruence for the connected sum of Layer 4.1, that `K` is smoothly slice iff
it is concordant to `TauCeti.unknot`, and that `K # (−K̄)` is slice by the spun annulus, so the
concordance classes form an abelian group `C` (Livingston, *A survey of classical knot
concordance*, Theorem 2.2); `C` surjects onto the topological concordance group `C_top` with
kernel the smooth concordance classes of topologically slice knots, whose nonzero elements are
the classes of the smoothly non-slice ones; assuming Hypothesis 6.4, the positive-clasped
untwisted Whitehead double `W_(+,0)(T(2,3))` of 4.11.3 gives one.

Consume the native smooth concordance `TauCeti.SmoothEmbedding.Concordance f g`, a smooth
embedding `M × ℝ → N × ℝ` that is `f × id` near the initial end and `g × id` near the final end,
with `refl` (`Concordance.refl`), `symm`, `trans` and the trace of a diffeotopy (`ofDiffeotopy`);
the relation `TauCeti.SmoothEmbedding.Concordant`, an equivalence relation for
finite-dimensional ambient models (`Concordant.equivalence`); and the topological concordance
`TauCeti.TopologicallyConcordant F F' f g` with a locally flat track, an equivalence relation on
locally flat embeddings, smooth concordance implying topological concordance
(`TauCeti.SmoothEmbedding.Concordant.exists_topologicallyConcordant`). For oriented knots
`K, K' : SmoothCircleEmbedding (𝓡 3) S³` the track is an annulus in `S³ × ℝ`, `K` at time `0`
and `K'` at time `1`, with the product collars. For the slice criterion above, cap a concordance
with the slice disc of the unknot and, conversely, remove a small disc from a slice disc; the
group laws are also in Livingston, Section 2, and Lickorish, Chapter 8. The identity of `C` is
the class of the unknot, which is the class of the slice knots, and the inverse of `[K]` is
`[−K̄]`, the class of the reverse of the mirror image. Prove that the forgetful map `C → C_top` is
a homomorphism.

Consume the slice notions `TauCeti.IsSmoothlySlice K` (a smooth properly embedded disc in `D⁴`
with boundary `K`) and `TauCeti.IsTopologicallySlice K` (a locally flat such disc, with the
half-plane tangential model), `TauCeti.IsSmoothlySlice.isTopologicallySlice`, the invariance of
both under rotation and reversal, `TauCeti.isSmoothlySlice_unknot`, and the slice genus
`TauCeti.sliceGenus K : ℕ∞`, the infimum of the genera of smooth slice surfaces
(`TauCeti.SmoothSliceSurface`), `⊤` when there is none, with
`TauCeti.IsSmoothlySlice.sliceGenus_eq_zero`. Write `g_s(K)` for `TauCeti.sliceGenus K`,
`g_s^{top}(K)` for `TauCeti.topologicalSliceGenus K` and `g(K)` for the Seifert genus of Layer
4.3. Prove `g_s(K) ≤ g(K)` by pushing the interior of a Seifert surface of Layer 4.3 into `D⁴`, so
that `g_s(K) < ⊤` for every knot in `S³` and, with the native
`TauCeti.topologicalSliceGenus_le_sliceGenus`, `g_s^{top}(K) ≤ g_s(K) ≤ g(K)`; prove
`g_s(K) = g_s(K.reverse) = g_s(mirror K)`. Prove that the slice genera are concordance invariants
(Livingston, Section 9.5), `g_s(K) = g_s(K')` for smoothly concordant `K, K'` and
`g_s^{top}(K) = g_s^{top}(K')` for topologically concordant ones (stack the concordance annulus in
`S³ × [0, 1]` onto a slice surface in `D⁴` and smooth the corner, which keeps the genus; the two
directions come from `symm`), and that `g_s` is subadditive under connected sum,
`g_s(K # K') ≤ g_s(K) + g_s(K')` (the boundary connected sum of two slice surfaces along an arc
joining the two summing balls is a slice surface for `K # K'` of genus the sum of the genera). The
native `IsSmoothlySlice K → sliceGenus K = 0` is one direction of the criterion `g_s(K) = 0` if
and only if `K` is slice; the converse uses the classification of compact surfaces (Layer 1.7), a
slice surface of genus `0` for `K`, connected with one boundary circle, being a disc.

- Ambient isotopic knots are concordant
  (`TauCeti.SmoothEmbedding.SmoothAmbientIsotopic.concordant`); the converse fails, since the
  square knot is slice and not the unknot.
- The slice genus `TauCeti.sliceGenus K` is a concordance invariant, `g_s(K) ≤ g(K)`, and
  `g_s(K) = 0` iff `K` is slice; likewise for the pinned topological slice genus
  `TauCeti.topologicalSliceGenus K`, which is at most the smooth one
  (`TauCeti.topologicalSliceGenus_le_sliceGenus`) and vanishes on topologically slice knots.
- The pin has the topological halves of the group laws: a knot topologically concordant to the
  unknot is topologically slice (`TauCeti.isTopologicallySlice_of_topologicallyConcordant_unknot`),
  and a knot in connected-sum position plus its reverse mirror image is topologically slice
  (`TauCeti.SmoothCircleEmbedding.isTopologicallySlice_connectedSum_reverseMirror`). This section
  proves their smooth forms, the converse implications and the congruence property.
- `[K] + [K'] = [K # K']`, `0 = [U] = {slice knots}` for the unknot `U`, `−[K] = [−K̄]`; `C` is
  abelian because `K # K'` and `K' # K` are ambient isotopic.
- `K # (−K̄)` is slice for every `K`; `K # K` is not slice when `σ(K) ≠ 0` (6.2).
- `g_s(K) < ⊤` for every knot in `S³`; `g_s(unknot) = 0`; `g_s^{top} ≤ g_s ≤ g`; and
  `g_s(K # K') ≤ g_s(K) + g_s(K')`, so `g_s` is a function on `C` but not a homomorphism:
  `g_s(T # (−T̄)) = 0 < 2 = g_s(T) + g_s(−T̄)`.
- Smoothly slice implies topologically slice; the converse fails for `W_(+,0)(T(2,3))` assuming
  Hypothesis 6.4 and Freedman's theorem (6.4).

**Checks.**
- *No reflection.* The product annulus `K × [0, 1]` is a concordance from `K` to itself; a
  definition with `K̄` at the far end would deny this, since the trefoil (signature `−2`) is
  not concordant to its mirror (`+2`).
- *Unknot.* `TauCeti.unknot` is slice (`TauCeti.isSmoothlySlice_unknot`) with slice genus `0`.
- *Slice but not trivial.* The square knot `T # T̄` is slice, hence concordant to the unknot,
  although its Alexander polynomial `(t − 1 + t⁻¹)²` is not `1`.
- *Infinite order.* The granny knot `T # T` has `σ = −4` and is not slice, while
  `[T] + [−T̄] = 0` by the square knot; so `2[T] ≠ 0`, and the trefoil has infinite order in `C`,
  its signature being a homomorphism to `ℤ` (6.2).
- *Order two.* The figure-eight `E` is amphicheiral and reversible, so `−Ē = E` and
  `2[E] = [E # E] = 0`; it is not slice (6.2.1, item 5), so its order in `C` is exactly two.
- *Genera of the standard knots.* The unknot has `g = g_s = g_s^{top} = 0`. The trefoil has
  `g = 1` (its genus-one Seifert surface, with Seifert matrix `trefoilSeifertMatrix`) and
  `g_s = 1` (it is not slice, its signature being `−2 ≠ 0`, 6.2), so `g_s = g` there. The
  figure-eight has `g = 1` and `g_s = 1`: its signature is `0`, and it is not slice by its Arf
  invariant (6.2.1, item 5); its Alexander polynomial `−t + 3 − t⁻¹` is not of the form
  `f(t)f(t⁻¹)` that the Fox–Milnor theorem (Lickorish, Chapter 8) requires of slice knots. The
  square knot is slice of Seifert genus two, so `g_s = 0 < 2 = g` and `g_s ≤ g` is not an
  equality in general.

*Needs:* Tau Ceti `TauCeti.SmoothEmbedding.Concordant`, `TauCeti.SmoothEmbedding.Concordance`,
`Concordance.refl`, `ofDiffeotopy`, `Concordant.equivalence`,
`TauCeti.SmoothEmbedding.Concordant.exists_topologicallyConcordant`,
`TauCeti.TopologicallyConcordant`, `TauCeti.IsSmoothlySlice`, `TauCeti.IsTopologicallySlice`,
`TauCeti.IsSmoothlySlice.isTopologicallySlice`, `TauCeti.isSmoothlySlice_unknot`,
`TauCeti.SmoothSliceSurface`, `TauCeti.IsSmoothlySlice.sliceGenus_eq_zero`,
`TauCeti.topologicalSliceGenus_le_sliceGenus`, `TauCeti.IsLocallyFlat`,
`TauCeti.sliceGenus`, `TauCeti.topologicalSliceGenus`,
`TauCeti.isTopologicallySlice_of_topologicallyConcordant_unknot`,
`TauCeti.SmoothCircleEmbedding.isTopologicallySlice_connectedSum_reverseMirror`; Layer 4.1,
Layer 4.3; Layer 1.3, Layer 1.7 (genus-zero slice surfaces), Layer 2.1 (neat locally flat
surfaces in `D⁴`); Mathlib `ℕ∞`.

### 6.2 The Levine–Tristram signatures

For a Seifert matrix `V` of `K` and `ω ∈ S¹`, `σ(K, ω)` is
`TauCeti.KnotTheory.tristramLevineSignature V ω`, the signature of
`TauCeti.KnotTheory.tristramLevineForm V ω` (the Conventions). Prove that for `ω ≠ 1` not a
root of `Δ_K` it is independent of `V` (through S-equivalence, Layer 4.3) and a concordance
invariant, zero on slice knots (Lickorish, Theorems 8.9 and 8.19); at roots of `Δ_K` it is
still independent of `V`, but as a function on all knots it is a concordance invariant exactly
at the `ω ≠ 1` that are roots of no Laurent polynomial `p ∈ ℤ[t^±]` with `p(1) = ±1`, the set
`S¹_!` (Conway, *The Levine–Tristram signature: a survey*, arXiv 1903.04477, Theorem 2.9).
Define the averaged signature `σ̄(K, ω)`, for every `ω ≠ 1`, as the mean of the two one-sided
limits of `σ(K, ·)` at `ω`; prove it is a concordance invariant at every such `ω` and agrees
with `σ(K, ω)` off the roots of `Δ_K` (6.2.1). Prove `|σ(K₊, ω) − σ(K₋, ω)| ≤ 2` (Conway,
Proposition 2.7), hence `|σ(K, ω)| ≤ 2 u(K)`, and the slice-genus bounds `|σ(K, ω)| ≤ 2 g_s(K)`
for `ω ∈ S¹_!` (Conway, Theorem 2.12, whose inequality also carries the nullity term) and
`|σ̄(K, ω)| ≤ 2 g_s(K)` for every `ω ≠ 1` (Powell's theorem, as reported in Conway, §2.4 after
Theorem 2.12), so the raw bound also holds off the roots of `Δ_K`. The classical signature is
`σ(K) = σ(K, −1)`; since `p(−1) ≡ p(1) mod 2`, `−1 ∈ S¹_!` and it needs no averaging.

Consume the native `Matrix.signature` with the trefoil and figure-eight values
(`TauCeti.KnotTheory.signature_trefoilSeifertMatrix`,
`TauCeti.KnotTheory.signature_figureEightSeifertMatrix`) and the enlargement invariance
(`TauCeti.KnotTheory.signature_enlargeColumn`, `TauCeti.KnotTheory.signature_enlargeRow`), and,
for the Tristram–Levine form and signature at `ω` on the unit circle, the value at `ω = −1`, the
classical signature (`tristramLevineSignature_neg_one`), the value `0` at `ω = 1`
(`tristramLevineSignature_one`), congruence invariance (`tristramLevineSignature_congr`),
conjugation symmetry (`tristramLevineSignature_conj`), negation under `V ↦ −Vᵀ`, the mirror image
(`tristramLevineSignature_neg_transpose`), and additivity under block sums
(`tristramLevineSignature_fromBlocks_zero`). The averaged signature `σ̄` is the signature function
of Livingston, Section 3.1, there written `σ_ω(K)`: the Tristram–Levine signature off the roots
of `Δ_K` and the average of the one-sided limits `σ_{ω⁺}` and `σ_{ω⁻}` at a root. Its vanishing
on slice knots comes from a metabolic Seifert matrix of a slice knot (Lickorish, Chapter 8, for
`ω = −1`; Tristram, Proc. Cambridge Philos. Soc. 66 (1969), and Levine, Invent. Math. 8 (1969),
for general `ω`). Prove that the averaged signatures at the roots of unity `e^{2πi/p}`, `p` prime,
are linearly independent homomorphisms `C → ℤ` (6.2.1, item 5), so that `C` maps onto `ℤ^∞`, a
free abelian group of countably infinite rank (Livingston, Section 3.1, through the twisted
doubles of the unknot).

- `σ(K # J) = σ(K) + σ(J)`, `σ(K̄) = −σ(K)`, `σ(−K) = σ(K)`; the signature is even, since
  `V + Vᵀ` is nonsingular of even rank `2g` (its determinant is `±Δ_K(−1)`, odd by Layer 4.4)
  and the signature of a nonsingular form is congruent to its rank mod `2`; `V + Vᵀ` is not
  unimodular in general.
- Torus knots: `σ(T(p, q), −1) < 0` for `p, q ≥ 2`, from the eigenvalues of `V⁻¹ Vᵀ` for the
  tensor-product Seifert matrix of the positive braid surface, so torus knots are chiral and
  `T(p, q) ≠ T(p, −q)` as unoriented knots.
- The signature is that of the intersection form of the double branched cover's spanning
  `4`-manifold; at `ω = −1` the form is `TauCeti.KnotTheory.tristramLevineForm_neg_one`'s value
  `2(V + Vᵀ)`, whose signature is that of `V + Vᵀ`.

**Positive braid links.** Extend the classical signature at `−1` to realized oriented links by
their integral Seifert matrices (odd sizes and degenerate symmetrizations allowed): independence
of the connected Seifert surface, sign change under mirror, invariance under simultaneous
orientation reversal, split-union additivity, vanishing on unlinks, and comparison of a
disconnected split surface with a connected one by joining tubes, without the knot-only
nondegeneracy or evenness. For a positive braid word on `n≥1` strands with `p` letters, let `s`
count the components of the graph on the strands with one edge per letter between its adjacent
strands; the canonical `n`-disc/`p`-band surface has `s` components and first Betti number `r`,
with `r+n=p+s` in ℕ. Prove Rudolph's theorem, in the convention where the right-handed trefoil
has signature `−2`: if `r>0` the oriented closure has strictly negative classical signature
(band-surface reductions and integral Seifert-form and inertia comparisons), and if `r=0` it is
an unlink of signature zero; this covers every positive braid closure, split ones and unused
strands included (Rudolph, *Nontrivial positive braids have positive signature*, with the
opposite-sign comparison; Feller, *On the signature of positive braids*, p. 22, for the
Betti-number convention). It uses Layer 4.3's realized band surfaces and Seifert matrices and
supplies the positive-word signature argument cited in Jones 1985 (p. 105); the signed-word
Jones support argument of Layer 4.5 is independent of it.

**Checks.**
- *Trefoil.* For the right-handed trefoil `V + Vᵀ = [[−2, 1], [1, −2]]` is negative definite
  of determinant `3`, so `σ = −2` (`TauCeti.KnotTheory.signature_trefoilSeifertMatrix`).
- *Figure-eight.* `V + Vᵀ = [[2, 1], [1, −2]]` has determinant `−5 < 0`, so `σ = 0`, consistent
  with amphichirality; the figure-eight is still not slice, since its Arf invariant is 1
  (`Δ(−1) = 5`) and 6.2.1, item 5 makes the Arf invariant vanish on slice knots (by evaluation).
- *Sharpness.* `|σ(T # T)| = 4 ≤ 2 u(T # T) = 4`, so the signature bound is sharp for the granny
  knot; for the figure-eight it gives only `0 ≤ 2` (by evaluation).
- *Trefoil off its roots.* For `V = trefoilSeifertMatrix` and `ω = e^{iθ}`, the native
  `TauCeti.KnotTheory.exists_tristramLevineSignature_trefoilSeifertMatrix_ne` gives `σ = 0` at
  `ω = (3 + 4i)/5`, where `cos θ = 3/5` and `θ < π/3`, against `σ = −2` at `ω = −1`: the
  function is not constant, and its jumps are at the roots `e^{±iπ/3}` of `Δ_T = t − 1 + t⁻¹`,
  just below `θ = π/3` the value `0` and just above it `−2`.
- *Square knot.* `σ̄(T # T̄, ω) = σ̄(T, ω) − σ̄(T, ω) = 0` for every `ω`, `−2 + 2 = 0` at
  `ω = −1`, consistent with the square knot being slice; the native value `0` at `ω = 1` for every
  `V` carries no information (by evaluation).

*Needs:* Tau Ceti `TauCeti.KnotTheory.tristramLevineForm`,
`TauCeti.KnotTheory.tristramLevineSignature`, `Matrix.IsHermitian.signature`,
`Matrix.signature`, `TauCeti.KnotTheory.signature_trefoilSeifertMatrix`,
`signature_figureEightSeifertMatrix`, `signature_enlargeColumn`, `signature_enlargeRow`,
`tristramLevineSignature_neg_one`, `tristramLevineSignature_one`, `tristramLevineSignature_congr`,
`tristramLevineSignature_conj`, `tristramLevineSignature_neg_transpose`,
`tristramLevineSignature_fromBlocks_zero`,
`TauCeti.KnotTheory.exists_tristramLevineSignature_trefoilSeifertMatrix_ne`,
`TauCeti.KnotTheory.IntegralSquareMatrix.SEquivalent`; Layer 4.3, Layer 4.11, Layer 6.1; Mathlib
`Complex`, `Matrix`.

**Checkerboard forms and the normal-Euler correction.** For every nonempty oriented tame link
L ⊂ S³ and compact connected locally flat PL spanning surface F with boundary L, F possibly
nonorientable and L possibly disconnected, construct the Gordon–Litherland pairing
G_F(x,y) = lk(x,τy) from the normal interval bundle, the boundary double cover F̃ → F and the
integral transfer τ (embedded transfer cycles in the complement of F), with independence of
representatives, bilinearity, symmetry, naturality, finite free H₁ basis/matrix comparisons
and G_F = V + Vᵀ on an oriented surface (push-second convention). Push each component of L into
its collar and off F to a parallel L_F, independent of choices, and set e(F,L) = −lk(L,L_F), the
linking of the total oriented links (all ordered component pairs, cross terms included): it is
even and zero on an oriented Seifert surface. Prove the relative S*-equivalence theorem in S³
(two such surfaces with the same boundary are related by ambient isotopies, tube and
half-twisted-band additions and removals, the boundary tracked) with each move's homology,
linking and Euler changes, so sign(G_F) + e(F,L)/2 is invariant, degenerate pairings included
(tubes add a zero-signature block, a crosscap's signature change is compensated by its Euler
change), and σ(L) = sign(G_F) + e(F,L)/2; signs are calibrated by the Seifert case and by the
two one-half-twisted Möbius bands bounding the unknot, with pairings [±1] and correction ∓1.
The proof is three-dimensional, with no four-manifold signature theorem.

For a finite checkerboard diagram construct F, its region cycles and the reduced Goeritz matrix
G from signed band charts: from the oriented ports, over/under choice and shading, η(c) ∈ {±1}
is the local Goeritz incidence and the boundary parallel contributes 0 (type I) or 2η(c)
(type II) to lk(L,L_F), so e(F,L)/2 = −Σ_typeII η(c) and σ(L) = sign(G) − Σ_typeII η(c).
Include orientation reversal, mirror, shading and basis changes, region subdivisions and
reductions, and zero blocks and joining bands for crossing-free components and disconnected
region graphs; no nonsingularity, odd-determinant or evenness hypothesis is imposed.

*Needs:* the finite-band, homology, normal and linking theory of 4.2–4.3 and this layer's
classical link signature and real inertia; the relative S*-equivalence moves and their
compensation are proved here, not taken from Seifert S-equivalence. Reference:
[Boden–Chrisman–Karimi, *The Gordon–Litherland pairing for links in thickened surfaces*,
§2.2–2.3](https://arxiv.org/abs/2107.00426), specialized to S³ with the sign comparison above.

### 6.2.1 Signature functions, angular averages and surface comparisons

Build the knot signature-function interface on the native `tristramLevineForm`,
`tristramLevineSignature` and `Matrix.IsHermitian.signature`, for realized oriented knots with a
connected genus-g Seifert surface and integral homology basis from 4.3, transporting every
matrix through those comparisons; the finite-root, evenness and near-1 statements are for
knots only. H_V(ω) denotes the Levine–Tristram form.

1. **Determinant normalization.** From `TauCeti.KnotTheory.det_tristramLevineForm_of_card` and
   `det_tristramLevineForm_int_ne_zero_iff` (`TauCeti.KnotTheory.TristramLevine.Alexander`) and
   4.4's Alexander comparisons: `det H_V(ω)=(-|ω−1|²)^g Δ_V(ω)`, so for `ω≠1` the form is
   nonsingular exactly when `Δ_V(ω)≠0`, with no invertibility assumption on V. The exceptional
   set `E_K={1}∪{ω:Δ_K(ω)=0}` is finite (clear the monomial; `Δ_K(1)=1` excludes the zero
   polynomial). At 1 a positive-size matrix is zero; the empty matrix has signature 0.

2. **Continuous inertia.** Build the finite-dimensional Hermitian perturbation API on Mathlib's
   spectral theorem: positive and negative indices (eigenvalue counts) and nullity (kernel
   dimension) summing to the dimension, signature their difference, congruence and block-sum
   laws, signature parity equal to rank parity; along a continuous Hermitian family both indices
   are locally constant at a nonsingular member (operator-norm stability below the least
   absolute eigenvalue, without continuous eigenvectors); positive scaling preserves inertia,
   negative scaling exchanges it, and connected nonsingular parameter sets, in particular the
   arcs of `Circle\E_K`, have constant signature.

3. **The parameter 1.** For a real matrix with nonsingular skew part, `H_V(exp(iθ))/θ` extends
   continuously to θ = 0 with value `i(Vᵀ−V)`, nonsingular and negated by conjugation, hence of
   signature zero, so the raw signature is zero near 1 and at 1 (4.3 supplies the unimodular skew
   Seifert pairing; g = 0 included). The nullity `2g` at 1 is not a knot invariant.

4. **Angular sides and average.** At each `ω : Circle` there are unique integers `σ₊(K,ω)` and
   `σ₋(K,ω)` equal to the raw signature at `ω*Circle.exp θ` and `ω*Circle.exp(-θ)` for all
   small θ > 0, independent of arc, angular lift and Seifert presentation, roots included (by the
   S-equivalence signature law). They are even, so `σ̄(K,ω)=(σ₊+σ₋)/2` is an integer (possibly
   odd), equal to the raw signature off E_K and at 1. The sides are constant on complementary
   arcs, the half-jump `(σ₊−σ₋)/2` is integral with finite support, and the jumps telescope
   around the circle. An exceptional point need not be a discontinuity and its raw value can be
   an isolated spike; raw and averaged values at a root are not presumed equal.

5. **Slice disks and concordance.** For a smooth or locally flat slice disk D, stabilize the
   surface to F′ of genus `g′=g+r` and build an oriented Seifert hypersurface R with
   `∂R=F′∪_K D` (exterior meridian map, relative transverse levels and normal framings in each
   category, Layer 2.1's normal-bundle statement consumed as stated); half-lives-half-dies gives
   rank g′ for `ker[H₁(F′;ℚ)≅H₁(F′∪D;ℚ)→H₁(R;ℚ)]`, pushed-off bounding chains kill the Seifert
   pairing on it, and integral saturation, with the torsion of H₁(R) accounted for, gives a
   primitive rank-g′ isotropic summand of the size-2g′ presentation. Being a direct summand, it
   reduces mod 2 to a g′-dimensional subspace of `H₁(F′;𝔽₂)` on which 4.3.1's refinement
   `q_F′(x)=lk(x,x⁺) mod 2` vanishes, and with it the polar form `q(x+y)−q(x)−q(y)`; the polar form
   of a knot being nonsingular on the 2g′-dimensional space, 4.3.1's half-dimensional criterion
   gives `Arf(K)=0` for every smoothly or topologically slice knot K (Pyronneau, Corollary 2.19,
   p. 6, reaches the same statement through Fox–Milnor). With 4.3.1's surface independence,
   additivity and invariance under mirror and global reversal, 6.1's slice disk of
   `K#reverse(mirror J)` for concordant K, J makes the knot Arf invariant a concordance invariant
   in both categories and a homomorphism from the smooth and the topological concordance groups
   onto `𝔽₂`, the trefoil mapping to 1. Prove the nonsingular
   Hermitian Witt-index theorem (a half-rank isotropic subspace forces equal positive and
   negative indices) and apply it away from 1 and the roots. For concordant K, J, 6.1's slice
   disk of `K#reverse(mirror J)` and 4.3's block-sum comparison, used off both root sets and then
   on each angular side, make σ̄ a concordance invariant at every unit parameter (6.2's average
   extended by zero at 1), descending to homomorphisms on the smooth and locally flat
   concordance groups, with connected-sum additivity, reversal invariance, mirror negation,
   slice vanishing and the `ω=−1` comparison; conjugating ω exchanges σ₊ and σ₋, preserving the
   average and negating the half-jump. The raw crossing-change estimate passes to both sides:
   `|σ̄(K₊,ω)−σ̄(K₋,ω)|≤2` and `|σ̄(K,ω)|≤2u(K)` at every ω.

6. **A surface of positive genus.** For a connected oriented genus-h surface Σ in D⁴ with
   boundary K, in both categories, put `Y=D⁴\int νΣ` and glue `W_Σ=Y∪_(S¹×Σ)(S¹×G)`, G a genus-h
   handlebody bounded by the capped Σ whose meridian Lagrangian lies in the kernel of the
   meridian map on `H₁(Σ)`, so the map to `Bℤ` extends and the remaining boundary is the
   zero-framed surgery M_K (with all boundary, framing and handlebody-choice compatibilities).
   Mayer–Vietoris gives `H_*(W_Σ;ℚ)=(ℚ,ℚ,ℚ^(2h),0,…)`, `χ(W_Σ)=2h` and `H₁(M_K;ℚ)→H₁(W_Σ;ℚ)` an
   isomorphism, so by duality the ordinary intersection form is nonsingular, and a
   half-dimensional isotropic summand gives it signature zero. Over `F=ℚ(t)` with `t↦t⁻¹`, M_K
   is acyclic (Alexander torsion, meridional-circle Mayer–Vietoris), and the augmentation
   chain-rank lemma, duality and the Euler characteristic give `H₁(W_Σ,M_K;F)=0`,
   `H₁(W_Σ;F)=0`, vanishing in degrees 0, 3, 4 and `dim_F H₂(W_Σ;F)=2h`, with Hermitian
   intersection pairing nonsingular by boundary acyclicity. The finite CW homotopy models on
   Mathlib's singular homology (no triangulation of a TOP four-manifold) and their relative
   homology, universal-coefficient and Poincaré–Lefschetz duality are targets here.

7. **Signature defect and dimension bound.** For an oriented null-bordism W of M_K over Bℤ, the
   F-pairing on `H₂(W;F)` has radical `im H₂(M_K;F)` and induces a nonsingular pairing on the
   quotient. Develop the Witt group of nonsingular Hermitian F-forms and its signature at unit
   parameters (congruence, hyperbolic stabilization, direct sum and negation laws; evaluated off
   the finitely many denominators and determinant roots, then by angular sides), independent of
   the representative and bounded by its dimension. Own the bordism comparison: Lagrangian
   kernels in bounding five-manifolds by relative duality, the direct-sum Witt identity for
   gluing along M_K, closed four-manifolds over Bℤ having the rational form extended to F, and
   `Ω₄^STOP(Bℤ)≅Ω₄^STOP` by `Bℤ≃S¹` and the vanishing of oriented topological 3-bordism. Hence
   the defect `sign_ω(λ_W)−sign(W)` is independent of W; a pushed-in Seifert surface gives the
   form `(1−t)V+(1−t⁻¹)Vᵀ` (sign fixed by the oriented intersections), so the defect is σ̄(K,ω),
   and W_Σ gives `|σ̄(K,ω)|≤2h` for every ω, minimized over surfaces; off the roots this is the
   raw bound, including on `S¹_!`, where a knot's raw nullity is zero.

**Checks.**
- *Trefoil at its root.* At `exp(±iπ/3)` the trefoil's adjacent values are `0` and `−2`, so
  `σ̄ = −1`, and its singular raw value is also `−1` (by evaluation).
- *Isotropic regression.* For `A=[[0,−1],[1,1]]` and `V=[[0₂,A],[Aᵀ−I₂,I₂]]`, at
  `ω=exp(iπ/3)` the inertia is (2, 1, 1): raw signature `+1`, both sides `0` (by evaluation).
- *No unit roots.* The figure-eight has no unit Alexander roots, `t + t⁻¹ = 3 > 2`, and its raw
  and averaged signature functions are identically zero (by evaluation).
- *Arf against signatures.* The figure-eight's Seifert matrix `[[1,1],[0,−1]]` gives
  `q = x² + xy + y²` mod 2, whose three nonzero classes all have `q = 1`, so no q-zero line
  exists and its Arf invariant is 1 (`Δ(−1) = 5`): item 5 shows it is not slice although every
  signature above vanishes (by evaluation).
- *Saturation.* For the slice square knot `T # T̄` with Seifert matrix
  `[[−1,1],[0,−1]] ⊕ [[1,−1],[0,1]]`, the summand `P = ⟨e₁+e₃, e₂+e₄⟩` has all four Seifert
  values `−1+1`, `1−1`, `0+0`, `−1+1` equal to 0, and reduces to a q-zero plane in `𝔽₂⁴`: Arf
  `1 + 1 = 0`. The sublattice `2P` is isotropic as well but reduces to 0 mod 2, so the Arf
  statement needs the primitive summand, not only an isotropic lattice of rank g′ (by
  evaluation).

[Conway, §§2.1–2.4](https://arxiv.org/html/1903.04477v1#S2) records the raw/averaged
distinction; the knot surface-exterior and zero-surgery route is [Powell,
§§3–5](https://arxiv.org/html/1605.06833v3#S3).

*Needs:* native `TauCeti.KnotTheory.TristramLevine.Basic`, `.Alexander`,
`.SEquivalence`; `TauCeti.Analysis.Matrix.HermitianSignature`; Mathlib's finite
Hermitian spectral theorem, polynomial roots and `Circle.exp`; 1.3, 1.5, Layer 2
(including 2.1's normal-bundle statement), 4.3, 4.3.1 (the knot Arf invariant and its
half-dimensional criterion, for item 5's Arf statement), 4.4 and 6.1; Mathlib's singular homology.

### 6.3 Mutation and the Conway knot

Define Conway mutation: a Conway sphere meets `K` in four points and bounds a ball; cut the
ball out, apply one of the three half-turn rotations of the sphere preserving the four points,
and reglue. Prove that mutation preserves the Alexander, Jones, HOMFLY and Kauffman polynomials
and the signature, and, assuming Hypothesis 6.3, that it does not preserve the smooth
concordance class: the Kinoshita–Terasaka knot is slice by the hypothesis's ribbon disc, and its
mutant the Conway knot is not slice (Piccirillo, *The Conway knot is not slice*, Ann. of Math.
191 (2020), Theorem 1.1, through a knot `K'` with the same trace, Proposition 1.4, and the
Rasmussen invariant `s(K') = 2`, Theorem 1.5). The statement that mutation does not preserve
smooth concordance (Kirby's Problem 1.53) is a target here; its proof consumes the Rasmussen
invariant, which is GeometricTopology, Part II's, built on KhovanovHomology.

**Hypothesis 6.3 (the Kinoshita–Terasaka and Conway knots).** The marked Kinoshita–Terasaka and
Conway diagrams are related by one Conway mutation, both have `Δ = 1`, and the
Kinoshita–Terasaka knot bounds an explicit ribbon disc.

**Checks.**
- *Topological concordance.* Assuming Hypothesis 6.3, both knots have `Δ = 1`, so both are
  topologically slice by Freedman's theorem (Layer 6.4): only smooth concordance separates them.
- *No genus input.* The Alexander-span bound of 4.4.1 gives only `g ≥ 0` for both knots, since
  `Δ = 1`, so this roadmap's genus lower bounds cannot separate them; the separation above uses
  concordance alone (by evaluation).
- *Mutation-invariant data.* Assuming Hypothesis 6.3, the invariance theorem above gives the two
  knots the same Alexander, Jones, HOMFLY and Kauffman polynomials and signature, so none of
  these separates them.

*Needs:* Layer 4.1, Layer 4.4, Layer 4.5, Layer 4.6, Layer 6.1, Layer 6.2.

### 6.4 Freedman's theorem and Levine's theorem

Freedman's theorem is the pinned proposition `TauCeti.FreedmanSliceTheorem`: every knot in `S³`
with perfect commutator subgroup, equivalently with `Δ_K = 1` (Layer 4.4), is topologically
slice (Freedman, *The topology of four-dimensional manifolds*, J. Differential Geom. 17
(1982); Freedman–Quinn, *Topology of 4-Manifolds*, Theorem 11.7B; Kirby's Problem 1.36).
`Suggested.lean` states it as `freedman_slice_theorem`. Its proof, the disc embedding theorem
in dimension four, is FourManifolds'; the equivalence of the two hypotheses is proved here.
State Levine's theorem: there is a pattern knot `P ⊂ S¹ × D²` of winding number one such that,
for every knot `K ⊂ S³`, the satellite `P(K)` (4.11, through the Seifert framing of `K`) bounds
no smoothly embedded disc in any smooth rational homology `4`-ball with boundary `S³` (Levine,
*Non-surjective satellite operators and piecewise-linear concordance*, Forum Math. Sigma 4
(2016), numbered as in arXiv 1405.1125v2, Theorem 1.2; Kirby's Problem 1.45). Its proof
computes `τ` and Hom's `ε` of the Mazur satellite from the knot Floer complex by bordered Floer
homology (Levine, Theorem 1.6 and the paragraph before it); neither invariant is built in this
roadmap, and the proof is GeometricTopology, Part II's.

Prove here the reduction from Levine's theorem to knots in homology spheres (Levine,
Proposition 1.3 and Remark 1.5). For a winding-number-one pattern `P`, let `X_P` be `S¹ × D³`
with a `2`-handle attached along `P ⊂ S¹ × S²` with the framing induced by the Seifert framing
of `P(unknot)`; `X_P` is a compact contractible smooth `4`-manifold, `Y_P = ∂X_P` an integral
homology sphere, and `J_P = S¹ × {pt} ⊂ Y_P`. A *disc with conical singularities* in a smooth
`4`-manifold `X` is a compact disc `Δ ⊂ X` with `Δ ∩ ∂X = ∂Δ` a smooth knot, which is a smooth
submanifold away from finitely many interior points `p₁, …, p_n`, each `p_i` having a smooth
chart `φ_i : U_i → ℝ⁴` with `φ_i(p_i) = 0` that carries `Δ ∩ U_i` onto the radial cone
`{t x : 0 ≤ t < 1, x ∈ K_i}` on a smooth knot `K_i` in the unit sphere `S³`; a smooth disc is the
case `n = 0`. Prove: if no `P(K)` bounds a smooth disc in a smooth rational homology `4`-ball
with boundary `S³`, then `J_P` bounds no disc with conical singularities in any smooth rational
homology `4`-ball `X` with `∂X = Y_P`. Route (Levine, proof of Proposition 1.3, from its third
sentence on), writing `K = K₁ # ⋯ # K_n`: starting from `X`, build a smooth rational homology
`4`-ball with boundary `S³` in which `P(−K)` is smoothly slice. Join the singular points to the
boundary by arcs of the disc and tube along those arcs; then `J_P # −K` is smoothly slice in
`X`. Attaching to `X` a `2`-handle along `J_P # −K` with framing `0` produces `W`, which is a
rational homology `S² × D²`; cutting and regluing solid tori and exteriors (Layers 4.11 and 5.2)
identifies `∂W` with the `0`-surgery on `P(−K)`. In `W` the slice disc and the core of that
handle together form a sphere with trivial normal bundle, and surgering it
(`TauCeti.SphereSurgery`) leaves a rational homology `S¹ × D³`. Last, attach a `2`-handle with
framing `0` whose attaching circle is the core of the surgery torus; the outcome is the promised
ball, with the cocore of this last handle as a smooth slice disc for `P(−K)`.

Concordance of knots in homology spheres is an annulus in a smooth homology cobordism between
the ambient manifolds (`TauCeti.SmoothEmbedding.HomologyConcordant` over `ℤ`, in a
`TauCeti.IsHomologyCobordism`), specializing to Layer 6.1 for `S³ × [0, 1]`. A knot in a
homology sphere `Y` homology concordant to a knot `K' ⊂ S³` bounds a disc with one conical
singularity in the homology ball obtained by capping the cobordism with `D⁴`: the annulus
followed by the radial cone on `K'`, glued along collars. Assuming Levine's theorem, for his
pattern `P` the knot `J_P` in the homology sphere `Y_P` therefore bounds no disc with conical
singularities in any rational homology ball with boundary `Y_P`, the contractible `X_P`
included, and is homology concordant to no knot in `S³`. This is the pinned proposition
`TauCeti.LevineHomologyConcordanceTheorem` (Levine, Theorem 1.1, first part, in the
homology-concordance form of Remark 1.5; Kirby's Problem 1.31), which `Suggested.lean` states
as `levine_homology_concordance_theorem`; its proof here is this reduction, Levine's theorem
being GeometricTopology, Part II's. Neither the reduction nor this consequence uses the
smoothing input below.

**PL discs.** Levine states Proposition 1.3 for piecewise-linear discs, and his proof begins by
making a PL disc smooth away from finitely many cone points (Levine, proof of Proposition 1.3,
second sentence). State that input: every compact PL disc `Δ` in a smooth `4`-manifold `X`, for
the PL structure of Layer 11.3, with `Δ ∩ ∂X = ∂Δ` a smooth knot along which `Δ` is collared, is
isotopic, by an ambient isotopy fixed on `∂X`, to a disc with conical singularities. The collar
costs nothing: attaching the exterior collar `∂X × [0, 1]` to `X` and `∂Δ × [0, 1]` to `Δ`
turns a knotted arc at a boundary vertex into an interior cone point. Its combinatorial half is
proved here: in a triangulation of `X` in which `Δ` is a subcomplex, the link pairs of the
interior edges and triangles of `Δ` are the unknotted pairs `(S², S⁰)` and `(S¹, ∅)`, so `Δ` is
locally flat at every interior point that is not a vertex, and at an interior vertex `v` the
link pair is a PL knot `(S³, K_v)`. Its other half, smoothing a locally flat PL surface in a
smooth `4`-manifold away from finitely many cone points, is four-dimensional smoothing theory,
whose proof is GeometricTopology, Part II's. Assuming the input, the reduction gives Levine's
Proposition 1.3 as he states it: `J_P` bounds no PL disc in any smooth rational homology
`4`-ball with boundary `Y_P`.

**The hypothesis of Freedman's theorem.** `TauCeti.FreedmanSliceTheorem` concerns knots
`K : S¹ → S³` whose knot group (`TauCeti.SmoothCircleEmbedding.KnotGroup`) has perfect
commutator subgroup (`TauCeti.SmoothCircleEmbedding.HasPerfectCommutatorSubgroup`, through
Mathlib's `commutator` and `Group.IsPerfect`). The equivalence with `Δ_K = 1` proved here runs
through four conditions: for a knot in `S³` with group `π`, `π'' = π'` holds if and only if the
Alexander module `π'/π''` vanishes, if and only if `E₁ = Λ`, if and only if `Δ_K = 1` (Crowell,
as cited in Freedman–Quinn, Theorem 11.7B; Rolfsen, Chapter 7, for the identification of the
Alexander module with `H₁` of the infinite cyclic cover; Layer 4.4 and the native
`TauCeti.OrientedPDCode.AlexanderModule` for its presentation from a diagram). The route to the
theorem itself is Freedman's disc embedding theorem for Alexander-polynomial-one knots,
FourManifolds' as stated above.

- `HasPerfectCommutatorSubgroup K ↔ Δ_K = 1` for knots in `S³`.
- The theorem applies to the unknot (`TauCeti.hasPerfectCommutatorSubgroup_unknot`) and to the
  untwisted Whitehead double of any knot, which has `Δ = 1` (4.11.2 at `m = 0`).
- The conclusion is topological sliceness only; the trefoil has `Δ ≠ 1` and is not even
  topologically slice, its signature `−2` being a topological concordance invariant (6.2).

**Hypothesis 6.4 (the Whitehead double of the trefoil).** The positive-clasped untwisted
Whitehead double `W = W_(+,0)(T)` of 4.11.3, with `T = T(2,3)` the right-handed trefoil of 4.11,
is not smoothly slice: its `τ`-invariant is `1` (Hedden, *Knot Floer homology of Whitehead
doubles*, Geom. Topol. 11 (2007), the `τ` formula for Whitehead doubles on p. 2277, `τ = 1` for
the positive-clasped `t`-twisted double of `K` exactly when `t < 2τ(K)`, with `τ(T) = 1`; a
Floer-theoretic fact outside this roadmap). Having `Δ = 1` (4.11.2 at `m = 0`), `W` is
topologically slice by Freedman's theorem, so assuming Hypothesis 6.4 the gap between the two
slice notions is exactly that theorem.

The clasp sign and the handedness of `T` are part of the hypothesis: by the same formula the
negative-clasped double `W_(−,0)(T)`, the mirror of `W_(+,0)` of the left-handed trefoil, and
`W_(+,0)` of the left-handed trefoil have `τ = 0`, which certifies nothing.

**Checks.**
- *Unknot.* The unknot has knot group `ℤ`, perfect commutator subgroup and is topologically
  slice (`TauCeti.hasPerfectCommutatorSubgroup_unknot`, `TauCeti.isTopologicallySlice_unknot`).
- *Trefoil.* The trefoil has `Δ ≠ 1`, so the theorem says nothing about it; it is not even
  topologically slice, its signature being `−2`.
- *Clasp and handedness.* By Hedden's formula, `τ` of the positive-clasped `t`-twisted double of
  `K` is `1` exactly when `t < 2τ(K)`: with `τ(T) = 1`, `W_(+,0)(T)` has `τ = 1`, while
  `W_(+,0)(mirror T)` and `W_(−,0)(T)`, its mirror, have `τ = 0` (by evaluation).
- *Cone points.* The radial cone in `D⁴` on a smooth trefoil in `S³` is a disc with one conical
  singularity: `(t, x) ↦ t x` is an embedding for `t > 0` with injective differential, since it
  sends `∂_t` to `x`, normal to `S³`, and is injective on the tangent line of the knot; and it is
  not locally flat at `0`, its link there being the trefoil, whose group `⟨x, y | xyx = yxy⟩`
  is not `ℤ`. The radial cone on a great circle is the flat disc `P ∩ D⁴` of a `2`-plane `P`,
  smooth at `0` as well, so a cone point on the unknot is no singularity (by evaluation).
- *Trivial and Mazur patterns.* For the core pattern `S¹ × {0}` the two handles of `X_P` cancel,
  `Y_P` is the `(0, 0)`-surgery on the Hopf link, `S³` by 5.2, and `J_P`, a `0`-framed push-off
  of the surgery curve, bounds a disc: no contradiction, since the reduction's hypothesis fails
  at `K` the unknot. The Mazur pattern `Q` has `Q(unknot)` the unknot, and `J_Q` is smoothly
  slice in another contractible manifold with boundary `Y_Q` (Levine, Remark 1.4), so the
  hypothesis on all satellites cannot be dropped.
- *Both sides of the equivalence.* The unknot: knot group `ℤ`, commutator subgroup trivial,
  hence perfect, and `Δ = 1`; both sides hold. The trefoil: knot group `⟨x, y | x² = y³⟩`,
  commutator subgroup free of rank two, not perfect, and `Δ = t − 1 + t⁻¹ ≠ 1`; both sides fail.
- *Figure-eight.* `Δ(−1) = 5 ≠ 1`, so `Δ ≠ 1` and the hypothesis fails, consistent with the
  figure-eight not being slice (6.2.1, item 5); the theorem makes no claim about it.

*Needs:* Tau Ceti `TauCeti.FreedmanSliceTheorem`,
`TauCeti.SmoothCircleEmbedding.HasPerfectCommutatorSubgroup`, `TauCeti.IsTopologicallySlice`,
`TauCeti.SphereSurgery`; Layer 4.4, Layer 6.1, Layer 6.2 for Freedman's theorem; Layer 1.3
(gluing and `2`-handles), Layer 1.5 (tubes), Layer 4.11 (satellites and their Seifert framing),
Layer 5.2 (fillings and surgery) and Mathlib singular homology for the reduction; Tau Ceti
`TauCeti.IsHomologyCobordism`, `TauCeti.SmoothEmbedding.HomologyConcordant` and
`TauCeti.LevineHomologyConcordanceTheorem`, Layer 1.1 (collars) and Levine's theorem as stated,
for the homology-concordance consequence; Layer 11.3 (smooth triangulations, PL structures and
the link pairs of a subcomplex) and the smoothing input as stated, for the PL statement only.
For the hypothesis of Freedman's theorem: Tau Ceti `TauCeti.SmoothCircleEmbedding.KnotGroup`,
`TauCeti.hasPerfectCommutatorSubgroup_unknot`, `TauCeti.OrientedPDCode.AlexanderModule`;
Mathlib `commutator`, `Group.IsPerfect`, `FundamentalGroup`; Layer 4.4 (the Alexander
polynomial of a diagram and its module); AlgebraicTopology Stage 5 (covering spaces, for the
infinite cyclic cover).

### 6.5 Link cobordisms and the slice genus inequalities

Cobordisms of manifolds in general dimension, with their collars, composition and bordism groups,
are TangentialBordism's (Layers 2–3) and are not restated. Define a **link cobordism** between
smooth links `L₀, L₁` in `S³` as a compact oriented surface `Σ` smoothly and properly embedded in
`S³ × [0, 1]` with `∂Σ = L₀ × {0} ∪ −L₁ × {1}`, and a **concordance** of links as a link cobordism
consisting of annuli, one per component. The knot case of the **slice genus inequalities**,
`|σ̄(K, ω)| ≤ 2 g_s(K)` and, for `ω` not a root of `Δ_K`, the raw `|σ(K, ω)| ≤ 2 g_s(K)`, is 6.2's
(Tristram; Livingston, Section 9.5; Lickorish, Chapter 8, for `ω = −1`), proved in both categories
by 6.2.1, items 6–7. Prove the inequality for link cobordisms: for a connected link cobordism `Σ`
of genus `g` between knots `K₀` and `K₁`, `|σ̄(K₀, ω) − σ̄(K₁, ω)| ≤ 2g` at every `ω`. For it, the
boundary connected sum of `Σ` with the product cobordism `−K̄₁ × [0, 1]`, capped with the slice
disc of `K₁ # (−K̄₁)` (6.1), is a slice surface of genus `g` for `K₀ # (−K̄₁)`, and the
additivity, reversal invariance and mirror negation of `σ̄` (6.2.1, item 5) turn its bound into
the inequality. The inequality `g_s^{top} ≤ g_s` of 6.1 is not an equality in general: assuming
Hypothesis 6.4 and Freedman's theorem (6.4), `W_(+,0)(T(2,3))`, of Seifert genus one, has
`g_s^{top} = 0 < 1 = g_s`.

- `|σ̄(K, ω)| ≤ 2 g_s^{top}(K) ≤ 2 g_s(K)`; a knot with `σ(K) ≠ 0` is not slice in either
  sense.
- Concordance of links is an equivalence relation; on knots it is the relation of 6.1, under
  which `g_s` is invariant (6.1).
- The genus of a connected cobordism between knots is additive under stacking and symmetric
  under reversal.

**Checks.**
- *Trefoil.* `|−2| ≤ 2 g_s(T)` gives `g_s(T) ≥ 1`, and its genus-one Seifert surface gives
  `g_s(T) ≤ 1`, so `g_s(T) = 1`; the figure-eight has `σ = 0` and the bound says nothing, which
  is why its non-sliceness in 6.1's Checks uses the Arf invariant (6.2.1, item 5) instead.
- *Torus knots.* `T(2, 5)` has `σ = −4` and genus `2`, so `g_s = 2`; the bound is sharp for the
  two-strand torus knots `T(2, 2k + 1)`, of signature `−2k` and genus `k`. The Milnor
  conjecture, `g_s(T(p, q)) = (p − 1)(q − 1)/2` (`2` for `T(2, 5)`, as above), is consumed as
  stated in 4.8.3; its proof is CombinatorialHeegaardFloer's (Lane G, items 7 and 10), and it is
  not proved here.
- *Unknot to trefoil.* A genus-one cobordism between the unknot and the trefoil exists (the
  trefoil's genus-one Seifert surface with an open disc removed, pushed into `S³ × [0, 1]`),
  consistent with `|0 − (−2)| ≤ 2`.

*Needs:* Tau Ceti `TauCeti.SmoothSliceSurface`, `TauCeti.IsLocallyFlat`; Mathlib
`Manifold.IsSmoothEmbedding`; Layer 1.7 (the genus of a compact surface), Layer 2.1 (locally
flat surfaces in `S³ × [0, 1]`), Layer 6.1 (concordance and the slice genera), Layer 6.2 and
6.2.1 (the signature functions and their bounds).

### Examples

The product concordance; the slice square knot; the trefoil signature `−2` and the averaged
signature `−1` at its Alexander root; the figure-eight knot, of vanishing signatures and Arf
invariant 1, hence not slice; the Kinoshita–Terasaka and Conway mutants, separated by
smooth concordance assuming Hypothesis 6.3; the positive-clasped untwisted Whitehead double of
the right-handed trefoil, topologically slice by Freedman's theorem and, assuming Hypothesis
6.4, not smoothly slice.
The trefoil of infinite order and the figure-eight of order two in `C`; the signature function
of the trefoil with its jumps at `e^{±iπ/3}` and the value `0` at `(3 + 4i)/5`; the genus-one
cobordism from the unknot to the trefoil; the two-strand torus knots, on which the signature
bound for `g_s` is sharp.

### Dependencies

Tau Ceti's concordance and slice carriers and matrix signatures; Layer 4 (knots, Seifert
matrices, polynomials, 4.3.1's knot Arf invariant), Layer 1.3 (gluing concordances), Layer 2
(locally flat discs); for the reduction of Levine's theorem in 6.4, Layer 5.2 (surgery), and
for its PL form Layer 11.3 (PL structures).
Layer 1.7 (genus-zero slice surfaces and the genus of cobordisms) and Layer 2.1 (locally flat
annuli and slice surfaces); the native slice, knot-group and signature declarations of the
supplier contracts; AlgebraicTopology Stage 5 (the infinite cyclic cover, for the hypothesis of
Freedman's theorem). Nothing of CombinatorialHeegaardFloer is consumed: its `τ` consumes this
layer.

## Layer 7: hyperbolic structures, volume and rigidity

Hyperbolic metrics (`TauCeti.HyperbolicMetric`, `TauCeti.IsHyperbolic`), their volumes
(`TauCeti.hypVolumeOfMetric`, `TauCeti.hypVolume`), finite volume, the upper half space
`TauCeti.UpperHalfSpace E`, the model geometries, the Weeks manifold and the Mostow,
Gabai–Meyerhoff–Milley, virtual fibering and virtual Haken propositions are Tau Ceti's at the pin
(*Exact supplier contracts*). This layer proves
Mostow rigidity of closed hyperbolic manifolds in every dimension `n ≥ 3` and finite-volume
Mostow–Prasad rigidity in dimension three with their closed and cusped consequences, develops
finite-volume hyperbolic `3`-manifolds, and states the Weeks and
Agol theorems.
It also develops the total Riemannian volume with its invariance, scaling and the volumes of the
standard models (7.1), the uniqueness and first homology of the Weeks manifold, and the
elementary relations between fibering over the circle, Haken manifolds and finite covers (7.4).

### 7.1 Hyperbolic space and its isometries

This section proves its statements from the pinned carriers and the suppliers in its *Needs:*
line by the routes it names, and cites no outside proof.

The upper half space `TauCeti.UpperHalfSpace (EuclideanSpace ℝ (Fin (n−1)))` with the metric
`(dx² + dy²)/y²` is Tau Ceti's complete metric of constant curvature `−1`,
`TauCeti.UpperHalfSpace.hyperbolicMetric`, with `TauCeti.UpperHalfSpace.isHyperbolic`
(`Hyperbolic/UpperHalfSpace/Metric.lean`); it is not planned again here. Identify it with
`TauCeti.ModelGeometry` and its tensor isometries with the native model isometries
`TauCeti.Isom`, acting transitively on orthonormal frames, and identify `Isom(ℍ³)` with
`PSL₂(ℂ) ⋊ ℤ/2` acting by Möbius/anti-Möbius transformations. Prove the Cartan–Hadamard property
of `ℍⁿ` (the exponential map at any point is a diffeomorphism) from the explicit geodesics, and
that a complete hyperbolic manifold is a quotient `ℍⁿ / Γ` by a discrete torsion-free subgroup
`Γ ≤ Isom(ℍⁿ)` acting freely, through the developing map and the theorem that a complete local
isometry is a covering; conversely every such quotient carries a hyperbolic metric
(`TauCeti.hasGeometricStructure_quotient` for the geometric structure; the metric descends).

- The volume of `ℍⁿ / Γ` is the volume of a fundamental domain; the volume form in the upper
  half space is `y⁻ⁿ dx dy`.
- A complete hyperbolic manifold has universal cover `ℍⁿ`, is aspherical, and its fundamental
  group is torsion free.
- A closed connected manifold is hyperbolic exactly when it is a quotient `ℍⁿ/Γ` by a
  torsion-free cocompact discrete subgroup `Γ ≤ Isom(ℍⁿ)`, through the developing map of a
  complete constant-curvature metric (as in Thurston, *Three-Dimensional Geometry and Topology*,
  Section 3.4, and Ratcliffe, Chapter 8).
- The Poincaré ball model, the open unit ball of `ℝⁿ` with the metric `4|dx|²/(1 − |x|²)²`, carries
  a hyperbolic metric, and the Cayley transform carries it isometrically onto the upper half space
  (Ratcliffe, Chapter 4, the conformal ball and upper half-space models).

**Volume and curvature.** Consume the native Riemannian volume measure
`TauCeti.riemannianVolume I M : Measure M`, glued from the chart densities `√det g`, locally
finite and characterised by `eq_riemannianVolume_iff`; DifferentialGeometry 12.4 relates it to
the volume form and densities, and no second measure is defined. The **total volume** of a
compact Riemannian manifold is the native `TauCeti.riemannianTotalVolume I M`, the real number
`(riemannianVolume I M univ).toReal`, of which `TauCeti.hypVolumeOfMetric` is the hyperbolic case.
Consume the Levi-Civita connection of HopfRinow Layer 1, its curvature tensor and the native
constant-curvature predicate `Bundle.ContMDiffRiemannianMetric.IsConstantCurvatureTensor g κ`,
the tensor identity `R(w, u)v = κ(⟪u, v⟫w − ⟪w, v⟫u)` (Lee, *Introduction to Riemannian
Manifolds*, 2nd ed., Chapter 8, the constant-curvature form of `R`), together with the sectional
and scalar curvature consequences proved natively for hyperbolic metrics
(`TauCeti.HyperbolicMetric.hasConstantSectionalCurvature`,
`TauCeti.HyperbolicMetric.scalarCurvature_metric`). Prove that the total volume is invariant
under isometries and scales by `cⁿ` under `g ↦ c² g`, and compute the volumes of the standard
models:

- `volume(M, g) = ∫ √det g` over an atlas, independent of the atlas;
  `volume(M, φ^* g) = volume(M, g)` for a diffeomorphism `φ`.
- The round `Sⁿ` of radius `1` has volume `2π^{(n+1)/2}/Γ((n+1)/2)`; the flat torus `ℝⁿ/ℤⁿ` has
  volume `1`.
- `IsConstantCurvatureTensor g κ` is equivalent, in dimension at least two, to all sectional
  curvatures of the Levi-Civita connection being `κ`
  (`CovariantDerivative.HasConstantSectionalCurvature`).

**Checks.**
- *Freeness.* The reflection of `ℍ³` in a point is an isometry with a fixed point, so its
  quotient is an orbifold, not a manifold: the freeness hypothesis is necessary.
- *Surfaces.* The hyperbolic plane modulo one translation is an annulus of infinite area;
  modulo a genus-two surface group it is a closed surface of area `4π`, by Gauss–Bonnet
  `2π · |χ| = 2π · 2` (by evaluation).
- *Cusps.* The quotient of `ℍ³` by a parabolic `ℤ²` is a cusp `T² × ℝ`, of infinite volume, with a
  finite-volume end `T² × [0, ∞)` of volume `A/2` for a cross-section of area `A` (by
  evaluation).
- *Standard volumes.* The circle of radius `r` has volume `2πr`; the round `S²` has volume `4π`,
  the round `S³` volume `2π²`; scaling `S²` by `c` multiplies its volume by `c²`, consistent with
  `cⁿ` for `n = 2` (by evaluation).
- *Volume is not topological.* The flat torus `ℝ²/ℤ²` has volume `1` and curvature `0`; the torus
  `ℝ²/(ℤ × 2ℤ)` has volume `2`, so the volume is not an invariant of the diffeomorphism type, only
  of the metric.
- *Constant curvature.* A closed connected manifold of dimension `n ≥ 2` with a metric of constant
  curvature `κ ≠ 0` has volume determined by its topology only through a theorem: for `κ > 0` it
  is the volume of the round sphere of curvature `κ` divided by the order of `π₁`, for `κ < 0` and
  `n ≥ 3` it is Mostow rigidity (7.2), and for `n = 2` it is Gauss–Bonnet, `κ · vol = 2πχ`, so a
  genus-two surface with curvature `−1` has volume `4π`.

*Needs:* Tau Ceti `TauCeti.UpperHalfSpace`, `TauCeti.HyperbolicMetric`, `TauCeti.Isom`,
`TauCeti.ModelGeometry`, `TauCeti.HasGeometricStructure`, `TauCeti.riemannianVolume`;
HopfRinow Layers 1–3; DifferentialGeometry Layer 12.
For the volume and curvature targets also Tau Ceti `TauCeti.riemannianTotalVolume`,
`eq_riemannianVolume_iff`, `Bundle.ContMDiffRiemannianMetric.IsConstantCurvatureTensor`,
`CovariantDerivative.HasConstantSectionalCurvature`; Mathlib `Bundle.ContMDiffRiemannianMetric`,
`IsRiemannianManifold`, `MeasureTheory.Measure`; HopfRinow Layer 1 (the Levi-Civita connection
and its curvature tensor) and Layer 4 (transport across smooth Riemannian isometries);
DifferentialGeometry 12.4 (the volume form and densities).

### 7.2 Mostow rigidity

Prove the pinned proposition `TauCeti.MostowRigidity`: for closed connected hyperbolic manifolds
of dimension `n ≥ 3`, any two hyperbolic metrics on the same manifold are related by an
isometry; more strongly, a homotopy equivalence between closed hyperbolic manifolds of dimension
`n ≥ 3` is homotopic to an isometry (Mostow, *Quasi-conformal mappings in n-space and the
rigidity of hyperbolic space forms*, Publ. Math. IHÉS 34 (1968); Ratcliffe, *Foundations of
Hyperbolic Manifolds*, 3rd ed., Theorem 11.8.5). `Suggested.lean` states it as `mostow_rigidity`;
its proof is a target of this layer. The route is Gromov's, through the simplicial volume, in
every dimension `n ≥ 3` (Thurston, *The Geometry and Topology of Three-Manifolds*, §§6.1–6.3;
the opening of §6.3 notes that the three-dimensional argument works in every dimension once the
simplices of maximal volume are known). It needs no quasi-conformal analysis, and its inputs are
targets of this section:

- *Boundary extension.* For closed hyperbolic `n`-manifolds `M₁`, `M₂` with `n ≥ 2` and a
  homotopy equivalence `f : M₁ → M₂`, a lift `f̃ : ℍⁿ → ℍⁿ` may be chosen to be a quasi-isometry
  (Thurston, Lemma 5.9.1); it carries each geodesic to within bounded distance of a unique
  geodesic (Proposition 5.9.2, the Morse lemma in `ℍⁿ`); and it extends to a homeomorphism
  `∂f̃` of the sphere at infinity `Sⁿ⁻¹`, equivariant for the two deck actions, whose inverse is
  the extension of a lift of a homotopy inverse (Corollaries 5.9.3 and 5.9.5).
- *Measure chains and their comparison with singular chains.* For a smooth manifold `M` and
  `k ≥ 0`, give the pinned smooth singular simplices `TauCeti.SmoothSimplex I M k` Löh's `C¹`
  topology: the topology induced from the compact-open topology by sending a simplex to its
  derivative within `Δᵏ`, unique there by `TauCeti.uniqueDiffOn_fullSimplex`, as a map from
  `TΔᵏ = Δᵏ × ℝᵏ` to `TM`. The pinned simplices are smooth near each point of `Δᵏ`, Löh's on a
  whole neighbourhood of it; prove that for `M` Hausdorff and without boundary the two classes
  agree, gluing local extensions by a partition of unity on `ℝᵏ` inside an embedding of a
  neighbourhood of the compact image in some `ℝᴺ` and returning the glued map to `M` by a
  tubular retraction. A smooth measure `k`-chain is a signed Borel measure on this space that
  has a compact determination set and finite total variation; the faces act by push-forward,
  the total variation induces a seminorm `‖·‖_sm` on the resulting measure homology `H^s_*(M)`,
  and `σ ↦ δ_σ` embeds the pinned smooth singular chains of `TauCeti.smoothSingularSubcomplex`
  preserving norms (Thurston, Definition 6.1.8; Löh, *Measure homology and singular homology are
  isometrically isomorphic*, Math. Z. 253 (2006), numbered as in arXiv math/0504103v2,
  Definitions 5.1, 5.2 and 5.6). Integrating a `k`-form `ω` along a measure chain `μ`,
  `∫ (∫_σ ω) dμ(σ)` with the inner integral the pinned `TauCeti.SmoothSimplex.integral`, is
  defined because the inner integral is continuous for the `C¹` topology, and for a `C¹` form it
  satisfies Stokes' formula `∫_(∂μ) ω = ∫_μ dω`, by integrating DifferentialGeometry Layer 8.4's
  Stokes formula for a smooth simplex against `μ`, the faces acting by push-forward; so for a closed
  form (`dω = 0`) it depends on cycles only through their class. Every `n`-form on an `n`-manifold
  is closed, and for an `n`-form `ω` on a closed oriented `n`-manifold `M` the integral along any
  measure cycle representing the image of the real fundamental class is `∫_M ω`; this top-degree
  case is the only one the proportionality and Möbius steps use. Prove Löh's comparison: for a
  connected Hausdorff second-countable smooth manifold `M` without boundary, the inclusion of smooth
  singular chains into all singular chains and the inclusion `σ ↦ δ_σ` induce an isomorphism
  `H_*(M; ℝ) ≅ H^s_*(M)` that is isometric for `SSet.homologyL1Seminorm` and `‖·‖_sm` (Löh, Theorem
  1.2, proved as Proposition 5.3 and Theorems 5.7 and 5.9 through the duality with bounded
  cohomology; Proposition 5.3 is DifferentialGeometry Layer 8.3's smoothing theorem together with
  the norm estimates listed under *Needs* below), so for a closed connected oriented smooth `M` the
  simplicial volume `‖M‖` is the measure seminorm `‖[M]‖_sm` of the fundamental class (Löh,
  Corollary 6.2).
- *Proportionality.* For a closed connected oriented hyperbolic `n`-manifold `M` with `n ≥ 2`,
  `vol(M) = v_n ‖M‖`, where `‖M‖` is the pinned simplicial volume
  `TauCeti.HomologicalOrientation.simplicialVolume`, the `ℓ¹`-seminorm `SSet.homologyL1Seminorm`
  of the real fundamental class, and `v_n` is the supremum of the volumes of straight
  `n`-simplices in `ℍⁿ`, finite for `n ≥ 2` (Thurston, Proposition 6.1.4, Corollary 6.1.7 and
  Theorem 6.2, the last proved there for the measure seminorm). Straightening singular simplices
  gives `vol(M) ≤ v_n ‖M‖`. For the reverse inequality, let `σ` be a straight `n`-simplex of
  volume `v(σ) > 0` and `σ⁻` a reflected copy; smearing over `Isom⁺(ℍⁿ)` with its Haar measure,
  normalized so that the isometries carrying a point into a region `R` have measure `vol(R)`,
  makes `½ smear_M(σ − σ⁻)` a measure cycle of total variation `vol(M)` whose integral of the
  volume form is `v(σ) vol(M)`, so it represents `v(σ)[M]` and `‖[M]‖_sm ≤ vol(M)/v(σ)`; Löh's
  comparison turns this into `‖M‖ ≤ vol(M)/v(σ)`, and the supremum over `σ` gives
  `v_n ‖M‖ ≤ vol(M)`. With the pinned homotopy invariance
  `TauCeti.HomologicalOrientation.simplicialVolume_eq_of_homotopyEquiv`, homotopy equivalent
  closed hyperbolic manifolds have equal volume (Thurston, Lemma 6.3.1).
- *Simplices of maximal volume.* For `n ≥ 2`, a geodesic `n`-simplex in `ℍⁿ`, ideal vertices
  allowed, has volume at most that of the regular ideal `n`-simplex, with equality exactly for
  the regular ideal ones, so `v_n` is that volume (Haagerup–Munkholm, *Simplices of maximal volume
  in hyperbolic n-space*, Acta Math. 147 (1981), the theorem of the introduction; for `n = 3`,
  Milnor's computation, Thurston §6.1 and Chapter 7).
- *Regular simplices and the Möbius conclusion.* For `n ≥ 3` and orientable `M₁`, `M₂`, orient
  both so that their coverings by `ℍⁿ` preserve orientation; then `deg f = ±1`, and `∂f̃` carries
  the vertices of every positively oriented regular ideal `n`-simplex to the vertices of a
  regular ideal `n`-simplex, positively oriented when `deg f = 1` and negatively oriented when
  `deg f = −1` (Thurston, Lemma 6.3.2 for `n = 3` and degree one, by smearing measure cycles as in
  the proportionality input, from the equality of volumes, proportionality and the uniqueness of
  the maximal simplices; the same argument in every dimension and for either degree, the
  straightened images having signed volume of the sign of `deg f`). A regular ideal `n`-simplex
  of a given orientation is determined by `n` of its vertices, and the vertices of the images of
  one such simplex under the group generated by the reflections in its faces are dense in `Sⁿ⁻¹`
  (Thurston, end of §6.3, for `n = 3`; the density in every dimension `n ≥ 3` is a target here).
  So `∂f̃` agrees on a dense set, hence everywhere, with the boundary map of an isometry of `ℍⁿ`,
  orientation preserving exactly when `deg f = 1`, which conjugates one deck group to the other
  (an isometry is determined by its boundary map, and `∂f̃` is equivariant) and descends to an
  isometry homotopic to `f`. For non-orientable `M₁`, `M₂`, an isometry of `ℍⁿ` preserves
  orientation exactly when its boundary homeomorphism of `Sⁿ⁻¹` has degree `1`, and conjugation
  by `∂f̃` preserves that degree, so `f` lifts to the orientation double covers with the same
  `∂f̃`; the isometry found there conjugates the full deck groups by the same equivariance.

Deduce, through `TauCeti.hypVolumeOfMetric_eq_of_mostow`, that `TauCeti.hypVolume` is metric
independent and a topological invariant, and that the full isometry group is finite and
isomorphic to `Out(π₁)`: an isometry homotopic to the identity lifts, after a deck adjustment, to
an isometry centralizing the lattice, whose limit set is the whole sphere, so the lift is
trivial; the normalizer of the lattice is discrete and contains it with finite index by the
covolume formula.

- The volume of a closed hyperbolic `n`-manifold is `v_n` times its simplicial volume, by the
  proportionality input; for `n = 3`, `v₃ = 1.0149…` is the volume of the regular ideal
  tetrahedron.

The hyperbolic carriers read as follows: `TauCeti.HyperbolicMetric` is a smooth Riemannian
metric, metrically complete, with the constant-curvature tensor of parameter `−1` (7.1);
`TauCeti.IsHyperbolic M := Nonempty (HyperbolicMetric)`; `TauCeti.hypVolumeOfMetric g` is the
total volume of `g` (7.1), and `TauCeti.hypVolume h`, on compact `M`, the volume of a metric
chosen from `h`; `TauCeti.IsMostowRigid` says that any two hyperbolic metrics on a closed
connected manifold of dimension at least three are isometric, and `TauCeti.MostowRigidity` that
this holds for every such manifold. This metric form is the one `hypVolume` consumes (see also
Mostow, *Strong rigidity of locally symmetric spaces*, Annals of Math. Studies 78 (1973)).

- `TauCeti.hypVolume` is well defined on closed connected hyperbolic manifolds of dimension at
  least three, positive, and equal to `hypVolumeOfMetric g` for every hyperbolic metric `g`; its
  homotopy invariance follows also from the homotopy form of rigidity and the isometry
  invariance of the total volume (7.1), without the simplicial volume.

**Checks.**
- *Dimension two.* A closed surface of genus `g ≥ 2` has a `(6g − 6)`-dimensional space of
  hyperbolic metrics up to isotopy, and genus-two metrics with different systoles are not
  isometric, so `n ≥ 3` is necessary.
- *Where the route fails at n = 2.* Every ideal triangle is regular, so the maximal-simplex input
  constrains nothing: two vertices of a positively oriented ideal triangle leave the third free
  on an arc of `S¹`, and the boundary map need not be Möbius, as the moduli above require. In
  `ℍ³` the three vertices `0, 1, ∞` of a regular ideal tetrahedron fix the fourth, `e^(iπ/3)` for
  one orientation and `e^(−iπ/3)` for the other (by evaluation).
- *Closedness.* The figure-eight knot complement is not closed, so the closed theorem does not
  apply to it directly; its rigidity is the finite-volume theorem of Layer 7.3.
- *Volumes.* `TauCeti.hypVolumeOfMetric_eq_of_mostow` turns rigidity for a given `M` into the
  equality of the volumes of any two hyperbolic metrics on `M`, the form `hypVolume` needs.
- *Simplicial volume.* A genus-two surface has hyperbolic area `4π` and `v₂ = π`, so its
  simplicial volume is `4 = 2|χ|`; the sphere and torus carry self-maps of degree `2`, so the
  pinned `TauCeti.HomologicalOrientation.simplicialVolume_eq_zero_of_one_lt_abs` gives them
  simplicial volume `0`, consistent with their carrying no hyperbolic metric (by evaluation).
- *Smeared surface cycles.* On a closed surface of genus `g ≥ 2`, of area `4π(g − 1)`, straight
  triangles with `v(σ) → π` give smeared cycles with `‖[Σ_g]‖_sm ≤ 4π(g − 1)/v(σ) → 4g − 4`,
  the value `2|χ|` of the previous Check; that value bounds the pinned `ℓ¹` simplicial volume
  only through Löh's comparison, the smeared cycles not being finite singular chains (by
  evaluation).
- *Compact determination sets.* On `S¹`, with `σ_i` the smooth loop wrapping `Δ¹` `i` times
  around the circle from a fixed base point, `Σ_(i≥1) i⁻² δ_(σ_i)` has boundary `0` and total
  variation `π²/6`, but integrating `dθ/2π` along it gives `Σ_(i≥1) i⁻¹ = ∞`; the derivatives of
  the `σ_i` are unbounded, so it has no compact determination set and is not a measure chain
  (by evaluation).
- *Closed forms only.* On the torus `T² = ℝ²/ℤ²` the form `ω = sin(2πx) dy` has
  `dω = 2π cos(2πx) dx ∧ dy ≠ 0`. The boundary `c` of the square `[0, ¼]²`, oriented
  counterclockwise, is the boundary of the `2`-chain of its two straight triangles, so `c` and
  `0` are homologous smooth cycles, and so are `δ_c` and `0`; yet
  `∫_c ω = ∫_square dω = ¼ · sin(π/2) = ¼` against `0`, so the class-invariance of the integral
  needs `dω = 0` (by evaluation).
- *Degree −1.* The double `M` of the compact hyperbolic `3`-manifold with totally geodesic
  genus-two boundary of Thurston §3.2 is closed hyperbolic, and the reflection exchanging the two
  halves is an isometry of degree `−1`. Its lift is the reflection of `ℍ³` in a lift of the
  boundary surface, conjugate to `z ↦ z̄` on `Ĉ`; it fixes `0, 1, ∞` and sends `e^(iπ/3)` to
  `e^(−iπ/3)`, so it carries a positively oriented regular ideal tetrahedron to a negatively
  oriented one, as the regular-simplex input predicts for `deg f = −1` (by evaluation).
- *Dimension two and volume.* The metrics of the `6`-dimensional family of non-isometric
  hyperbolic metrics on a genus-two surface all have volume `4π`, so `TauCeti.IsMostowRigid`
  carries the hypothesis `3 ≤ finrank`, while `hypVolume` in dimension two is well defined only
  through Gauss–Bonnet.
- *Flat, not hyperbolic.* `T³` is not hyperbolic: its fundamental group `ℤ³` contains `ℤ²`,
  while the fundamental group of a closed hyperbolic manifold contains no `ℤ²` (Preissmann); so
  `IsHyperbolic T³` is false although `T³` has a complete flat metric.
- *Volumes of different manifolds.* Two hyperbolic metrics on the same closed `3`-manifold have
  the same volume by rigidity; the value `0.9427…` of the Weeks manifold and `2.0298…` of the
  figure-eight complement are different manifolds' volumes, not two metrics on one manifold.

*Needs:* Tau Ceti `TauCeti.MostowRigidity`, `TauCeti.IsMostowRigid`,
`TauCeti.HyperbolicMetric.Isometry`, `TauCeti.hypVolumeOfMetric_eq_of_mostow`,
`TauCeti.HomologicalOrientation.simplicialVolume`,
`TauCeti.HomologicalOrientation.simplicialVolume_eq_of_homotopyEquiv`,
`TauCeti.HomologicalOrientation.simplicialVolume_eq_zero_of_one_lt_abs`,
`SSet.homologyL1Seminorm`, the smooth singular simplices and chains `TauCeti.SmoothSimplex` and
`TauCeti.smoothSingularSubcomplex` (`Geometry/Manifold/SmoothSingular/Basic.lean`) with
`TauCeti.uniqueDiffOn_fullSimplex`, and the integral of forms over smooth simplices
`TauCeti.SmoothSimplex.integral` (`Geometry/Manifold/SmoothSingular/Integral.lean`);
DifferentialGeometry Layer 8.3 (the smoothing theorem and its face-by-face relative Whitney
approximation step) and Layer 8.4 (Stokes' formula for a smooth simplex); Layer 7.1
(the isometry group, its transitivity on frames, the volume form and the fundamental-domain
volume); Layer 11.3 (smooth triangulations, through which Löh's Theorem 3.5, by his Remark 3.6,
and the comparison behind his Theorem 5.7 apply to `M`); Mathlib singular homology, the
compact-open topology, Haar measure on the locally compact group of isometries of `ℍⁿ`
(`MeasureTheory.Measure.haar`), signed measures and their total variation
(`MeasureTheory.SignedMeasure`, `MeasureTheory.SignedMeasure.totalVariation`) and measure
theory. The measure chains, Löh's `C¹`
topology and Löh's comparison are targets of this section, and so are the inputs of Löh's
route: the `ℓ¹` estimates that make DifferentialGeometry Layer 8.3's smoothing isometric. Built, for
`M` without boundary, by induction over faces from that layer's relative Whitney approximation step
and the homotopy extension property of `(Δᵏ, ∂Δᵏ)`, with a homotopy `H_σ` from each singular simplex
`σ` to its smoothing, compatible with faces and chosen constant when `σ` is already smooth, the
smoothing `s` sends each singular simplex to a single smooth simplex and fixes the smooth ones, so
`s ∘ j = id` and `‖s(c)‖₁ ≤ ‖c‖₁` for the inclusion `j` of smooth chains; and the prism operator of
the `H_σ` is a chain homotopy `j ∘ s ≃ id` sending each singular `k`-simplex to a chain of `ℓ¹` norm
at most `k + 1`. Every homotopy inverse of `j` induces `H(j)⁻¹` on homology, so the conclusion does
not depend on the inverse that layer chooses. These give the isometric isomorphism between smooth
singular and singular homology (Löh, Proposition 5.3) and, through the dual of the bounded homotopy,
its dual for bounded cohomology (Löh, Proposition 5.5); the bounded cohomology of spaces with its
duality principle for the `ℓ¹` seminorm (Löh, Theorem 3.3); the Kronecker product of measure chains
with bounded Borel cochains and the duality principle of measure homology it gives (Löh, Definitions
3.7–3.9, Lemmas 3.10 and 3.11), in their smooth form (Löh, §5.4); the isometric isomorphism from the
cohomology of the bounded invariant continuous functions on the powers of the universal cover of a
connected locally finite CW complex to its bounded cohomology (Löh, Theorem 3.5), which rests on the
comparison of strong relatively injective resolutions of the trivial Banach module `ℝ` (Monod,
*Continuous bounded cohomology of locally compact groups*, Lecture Notes in Math. 1758 (2001),
Theorem 7.4.5 and Lemma 7.2.6); a Borel section of the map that the universal covering induces on
singular simplices (Löh, Theorem 4.1, proved in the Appendix), Borel also on smooth simplices since
the `C¹` topology is finer than the compact-open one; and the algebraic isomorphism between smooth
singular and smooth measure homology (Löh, Theorem 5.7), from the Eilenberg–Steenrod axioms for
measure homology carried over to `C¹` simplices on a triangulated manifold (Zastrow, *On the
(non)-coincidence of Milnor–Thurston homology theory with singular homology theory*, Pacific J.
Math. 186 (1998), Theorem 3.4).
For the carriers and the volume consequences also Tau Ceti `TauCeti.HyperbolicMetric`,
`TauCeti.IsHyperbolic`, `TauCeti.hypVolumeOfMetric`, `TauCeti.hypVolume`,
`TauCeti.HyperbolicMetric.HasFiniteVolume`, `TauCeti.IsFiniteVolumeHyperbolic`; Mathlib
`ContinuousMap.HomotopyEquiv`, `IsCoveringMap`; Layer 7.1 (the total volume); HopfRinow Layer 1
(completeness and the exponential map, for the developing map) and Layer 4 (isometries).

### 7.3 Finite-volume hyperbolic 3-manifolds

Prove the Margulis lemma for `ℍⁿ` and the thick–thin decomposition: a complete hyperbolic
`3`-manifold of finite volume (`TauCeti.IsFiniteVolumeHyperbolic`, which assumes neither
orientability nor connectedness) is the interior of a compact manifold whose boundary
components are closed flat surfaces, and its ends are cusps `F × [0, ∞)` with `F` a flat torus
or Klein bottle and metric `dt² + e^{−2t} ds²` (Thurston, Chapter 5; Ratcliffe, Chapter 12);
for an orientable manifold every `F` is a torus. State the finite-volume Mostow–Prasad theorem
for `3`-manifolds: a homotopy equivalence between complete finite-volume hyperbolic
`3`-manifolds is homotopic to an isometry, so their volume is a topological invariant (Prasad,
*Strong rigidity of Q-rank 1 lattices*, Invent. Math. 21 (1973); Thurston, Chapter 6). Prove
it by Layer 7.2's measure-chain route in relative form, with the norm the measure one
throughout: Thurston's relative measure chains `C^s_*(M, A) = C^s_*(M)/C^s_*(A)`, normed by the
total variation off `A`, for `A` an open cusp neighbourhood whose complement is a compact core;
the identification of relative measure homology with relative real singular homology, from
Layer 7.2's comparison for `M` and for each component of `A` by the five lemma on the two long
exact sequences; straightening, which preserves chains in the convex cusp neighbourhoods; Haar
smearing restricted off a thinner cusp neighbourhood and retracted onto the core, with
vanishing boundary error; together these make the measure norm of the relative fundamental
class of `(M, A)` equal to `vol(M)/v₃`, independently of `A`, a diffeomorphism pushing along the
cusps carrying one choice to another (Thurston, §6.5, Lemma 6.5.4). The cusped
boundary-extension and equality steps, the reduction of the non-orientable case to orientation
double covers, and the finiteness and `Out(π₁)` identification of the isometry group, as in
Layer 7.2, are targets here. Prove that the figure-eight knot complement carries a complete finite-volume hyperbolic metric, built from two
regular ideal tetrahedra (Thurston, Chapter 3), of volume `2 v₃ = 2.0298…`, and that a
nonempty finite-volume hyperbolic manifold has positive volume. A closed hyperbolic manifold
has finite volume (`TauCeti.HyperbolicMetric.hasFiniteVolume_of_compactSpace`), but the cusp
end `T² × [0, ∞)` shows that finite volume does not imply compactness.

- A connected finite-volume hyperbolic `3`-manifold is irreducible, atoroidal in the sense of
  `TauCeti.IsAtoroidal`, and has infinite torsion-free fundamental group with trivial centre:
  an embedded sphere lifts to `ℍ³ ≃ ℝ³` and bounds a ball there by Schoenflies, and distinct
  deck translates of that ball are disjoint by proper discontinuity, so the ball descends;
  the centre is trivial because a finite-covolume lattice is non-elementary.
- Thurston's hyperbolic Dehn surgery theorem, stated here and proved in GeometricTopology,
  Part II: let `M` be a connected orientable complete finite-volume hyperbolic `3`-manifold, the
  interior of a compact `M̄` whose boundary consists of tori `T₁, …, T_k`. There are finite sets
  `E_i` of slopes on `T_i` such that, for any slopes `s_i ∉ E_i` on some of the `T_i`, the
  interior of the Dehn filling (Layer 5.2) of `M̄` along them, the other tori left unfilled, is
  complete finite-volume hyperbolic (Thurston, Theorem 5.8.2, which gives a neighbourhood of
  `(∞, …, ∞)` in `(S²)ᵏ`; a product neighbourhood inside it omits finitely many slopes on each
  torus). When at least one torus is filled its volume is strictly smaller than `vol(M)`
  (Thurston, Theorem 6.5.6), and it tends to `vol(M)` as the filling slopes leave every finite
  set: the filled manifolds converge to `M` in the geometric topology (the deformations of
  Theorem 5.8.2 tend to the complete structure; the example closing §5.12), on which volume is
  continuous (Thurston, §5.11, after the volume inequality 5.11.2a; the ordering of volumes in
  §6.6 after Corollary 6.6.2).

**Checks.**
- *Klein-bottle cusp.* The Gieseking manifold, doubly covered by the figure-eight complement,
  is complete, nonorientable, of volume `v₃`, with one Klein-bottle cusp and non-abelian cusp
  group, so not every cusp of a finite-volume manifold is a torus cusp.
- *Empty manifold.* The empty manifold satisfies `TauCeti.IsFiniteVolumeHyperbolic` vacuously
  with volume `0`, which is why positivity of volume carries nonemptiness.
- *Two cusped volumes.* The figure-eight complement has one cusp and volume `2 v₃`; the
  Whitehead link complement has two cusps and volume `3.6638…`, that of the regular ideal
  octahedron.

*Needs:* Tau Ceti `TauCeti.IsFiniteVolumeHyperbolic`, `TauCeti.HyperbolicMetric.HasFiniteVolume`,
`TauCeti.IsAtoroidal`; Layer 7.1, Layer 7.2, Layer 5.2, Layer 8.2.

### 7.3.1 Cusp lattices, shapes and horoball patterns

**Scope and geometric carriers.** For a connected, oriented, noncompact complete finite-volume
hyperbolic `3`-manifold, build a cusp-invariant API on the cusp ends of 7.3. A peripheral
marking identifies the stabilizer of a chosen horoball with a rank-two translation lattice
`L : Submodule ℤ ℂ`, `DiscreteTopology L`, `IsZLattice ℝ L`. The horotorus `ℂ ⧸ L`, with flat
metric, smooth structure and area measure, is compared, preserving marking, metric and measure,
with the cusp cross-section and, for a chosen basis, with `UnitAddTorus (Fin 2)` carrying the
transported Gram metric scaled by `h^(−2)` at height `h` (the product metric only for a basis
orthonormal at that height). Its map into the manifold is an embedding before first contact and
on the open cusp interior and an immersion at contact, where tangencies, also between different
cusps, can identify points; its image has zero volume. The end metric comes from the
upper-half-space metric of curvature `−1`, with volume measure the restriction of
`TauCeti.riemannianVolume` for the given `HyperbolicMetric`; Klein-bottle cusps keep 7.3's
nonorientable treatment.

**Area, volume and shortest translations.** At height `h>0` a translation `v∈L` has length
`‖v‖/h`, the horotorus area `ZLattice.covolume L / h²` and the cusp above it volume
`ZLattice.covolume L / (2h²)`, by quotient integration of the density `h^(−3)` (finiteness,
positivity, change of height); for periods `(a,b)` of a `ℤ`-basis the covolume is
`|Im (conj a * b)|`. A shortest nonzero vector and a shortest vector independent of it, of
lengths `λ₀ ≤ λ₁`, are the witnesses of the first two successive minima of `L` for the closed
unit disc (SuccessiveMinima, Layer 1, `exists_successiveMin_witnesses`); for *every* shortest
`v` the least length off `ℝ v` is `λ₁` and is attained, and the two form a `ℤ`-basis. Keep the
set of tied minimizing bases, and prove invariance under change of lift and normalization with
the similarity scaling of length and area: the shortest parabolic translation is the systole of
the horotorus at the scale of the chosen cusp neighbourhood.

**Maximal cusps.** A cusp neighbourhood is an equivariant family of horoballs with pairwise
disjoint interiors, tangencies allowed. Expanding one cusp's own orbit has a finite attained
maximum at first tangency of distinct lifts, giving its maximal volume and its shortest
translation (normalized by a lift at height `1`). For several cusps the largest *total* volume
of simultaneous interior-disjoint neighbourhoods is finite and attained with positive size at
every cusp (compactness from the cusp parameters, individual bounds and separation
constraints), and is not the sum of the individual maxima. Sequential expansion, for a given
ordering, maximizes each cusp with the earlier ones fixed; prove existence and disjointness,
keeping the order and any remaining choice as parameters.

**Marked shapes and conformal classes.** For a link cusp marked by meridian and longitude with
periods `(a,b)`, the Adams–Hildebrand–Weeks homological shape is `a/b`, **meridian divided by
longitude**, with the peripheral orientations pinned and nonzero imaginary part; for a
shortest-vector basis the geometrical shape is likewise first period over second. Both are
invariant under complex rescaling, and under `(a',b')=(p*a+q*b,r*a+s*b)` of determinant `±1`,
`a'/b'=(p*(a/b)+q)/(r*(a/b)+s)` with nonvanishing denominator. The conformal invariant is this
`PGL(2,ℤ)` orbit in `ℂ ∖ ℝ`, independent of basis and ties, and classifies lattices up to
complex-linear similarity; the unoriented class also allows conjugation and is compared with the
`GL(2,ℤ)` orbit in `UpperHalfPlane` under Mathlib's action (negative determinant acting with
conjugation), with basis/orientation comparisons for reciprocals and conjugates of a raw ratio. No
tied complex representative is canonical.

**Finite horoball patterns.** For a chosen disjoint cusp collection and a lift at infinity
normalized to boundary height `1`, the other lifted horoballs are given by centres in `ℂ` and
Euclidean diameters, equivariant under the peripheral lattice and satisfying the
diameter/separation inequalities of disjointness. For `0<α<1` the pattern modulo the lattice is
the set of balls of diameter **strictly greater than `α`**: finite in a fundamental
parallelogram (packing bound, boundary identifications included), independent of the
triangulation, natural under isometries, and taken up to Euclidean isometries and peripheral
change of basis; for several cusps it depends on the collection and any sequential order.

**Comparison with Adams–Hildebrand–Weeks.** The definitions follow Adams–Hildebrand–Weeks
(§2, pp. 2–4, Tables 1–2). Its Table 1 lists individual maximal-cusp volumes;
its multi-cusp Table 2 pictures use sequential expansion, with cutoff `α=1/10`.

**Checks.**
- *Square lattice.* Periods `(1, i)` give covolume `1`, shortest length `1`, raw ratio
  `1/i = −i`, horotorus area `1/h²` and cusp volume `1/(2h²)` at height `h` (by evaluation).
- *Transported metric.* Periods `(1, 2i)` at height `1` give area `2` and coordinate-loop
  lengths `1` and `2`, so the product metric on `UnitAddTorus (Fin 2)` is not the induced one
  (by evaluation).
- *Swapping periods.* Swapping the two periods inverts the raw ratio (`−i ↦ i`) and leaves the
  lattice and its `PGL(2, ℤ)` orbit unchanged. For this square lattice conjugation also fixes the
  orbit: the conjugate ratio `i = 1/(−i)` is the image of `−i` under `[[0, 1], [1, 0]]`, the
  lattice `ℤ[i]` being stable under complex conjugation (by evaluation).
- *Conjugation separates the two classes.* For periods `(1/3 + 2i, 1)`, with ratio
  `τ = 1/3 + 2i`, the conjugate `τ̄` lies in the `PGL(2, ℤ)` orbit of `τ` only if
  `−τ̄ = −1/3 + 2i` lies in the `SL(2, ℤ)` orbit of `τ` (an element of determinant `−1` is one
  of determinant `1` followed by `z ↦ −z`); both points satisfy `|Re z| = 1/3 < 1/2` and
  `|z|² = 37/9 > 1`, so they are distinct interior points of the standard fundamental domain and
  not equivalent. Conjugation therefore changes the oriented class of this lattice while
  leaving its unoriented class fixed (by evaluation).

*Needs:* this layer's finite-volume cusp decomposition, native hyperbolic metric
and Riemannian measure; SuccessiveMinima Layer 1 (1.5
`exists_successiveMin_witnesses`); Mathlib `ZLattice`/`ZSpan`, `ZLattice.covolume`,
`UnitAddTorus`, quotient additive groups, Haar measure, complex real-linear algebra
and `UpperHalfPlane` actions.

### 7.4 The Weeks manifold, virtual fibering and virtual Haken

The Weeks manifold is Tau Ceti's predicate `TauCeti.IsWeeksManifold`: a Dehn filling of the
exterior of the Whitehead link with coefficients `5` and `5/2` in the preferred framings, for
solid-torus neighbourhoods preserving orientation at their cores; one exists
(`TauCeti.exists_isWeeksManifold`) and the predicate is a topological property. Prove that a
Weeks manifold is a closed orientable `3`-manifold carrying a hyperbolic metric, of volume
`0.9427…` (Gabai–Meyerhoff–Milley, *Mom technology and hyperbolic 3-manifolds*, arXiv
0910.5043, Theorem 1.1 and §1), from the smooth filling of Layer 5.2 and the finite-volume theory
of Layer 7.3. Its minimality, that every closed orientable hyperbolic `3`-manifold has volume at
least that of a Weeks manifold with equality only for it (Gabai–Meyerhoff–Milley, *Minimum volume
cusped hyperbolic three-manifolds*, J. Amer. Math. Soc. 22 (2009), and Theorem 1.1 of the Mom
paper; Kirby's Problem 3.60), is the pinned proposition `TauCeti.GabaiMeyerhoffMilleyTheorem`,
which also asserts the existence of a hyperbolic Weeks manifold; `Suggested.lean` states it as
`gabai_meyerhoff_milley`. State Agol's theorems, the pinned
propositions `TauCeti.VirtualFiberingConjecture` and `TauCeti.VirtualHakenConjecture`: every
closed hyperbolic `3`-manifold has a finite cover that fibres over the circle, and a finite
cover that is Haken (Agol, *The virtual Haken conjecture*, Doc. Math. 18 (2013), Theorems 9.1
and 9.2; Kirby's Problem 3.51). `Suggested.lean` states them as `virtual_fibering_conjecture`
and `virtual_haken_conjecture`.

- A manifold that fibres over the circle with fibre a closed surface of negative Euler
  characteristic is Haken; `TauCeti.FibersOverCircle` and `TauCeti.IsHakenSurfaceEmbedding`
  are the pinned notions.

**The Whitehead link and the Weeks manifold.** The Whitehead link is the native
`TauCeti.whiteheadLink`, the smooth two-component link in `S³ ⊆ ℂ²` whose component `0` is the
unknot `w = 0` and whose component `1`, the Whitehead curve `TauCeti.whiteheadCurve`, runs around
the complementary solid torus with winding number `0` and closes up by a positive clasp (its
two-crossing diagram on the annulus is the untwisted Whitehead double pattern, which is how it is
matched, up to mirror image, with the link `5²₁` of the tables). `TauCeti.IsWeeksManifold Y` says
that, for some pairwise disjoint solid torus neighbourhoods of the two components preserving
orientation at their cores for the standard orientation of `ℝ⁴`, `Y` is a Dehn filling of the
link exterior (5.2) along the surgery slopes of coefficients `5` on the unknotted component and
`5/2` on the Whitehead curve, read in the preferred framing of each component
(`TauCeti.IsSolidTorusLinkNeighborhood.surgerySlope`); the property is invariant under
homeomorphism (`TauCeti.isWeeksManifold_congr`), and a compact Hausdorff Weeks manifold exists
(`TauCeti.exists_isWeeksManifold`) (Gabai–Meyerhoff–Milley, *Mom technology and hyperbolic
3-manifolds*, the paragraph following Theorem 1.1: the `(5, 1), (5, 2)` filling of the Whitehead
link complement). Prove that any two Weeks manifolds are homeomorphic (the filling depends only
on the slopes, 5.2, and the neighbourhoods are unique up to isotopy, 1.5), and that a Weeks
manifold `W` has `H₁(W; ℤ) ≅ ℤ/5 ⊕ ℤ/5`.

The pinned `TauCeti.GabaiMeyerhoffMilleyTheorem` says that some closed connected smooth Weeks
manifold carries a hyperbolic metric, and that for every smooth Weeks manifold `W` with a
hyperbolic metric `g_W` and every closed connected orientable hyperbolic `3`-manifold `M` with a
hyperbolic metric `g`, `hypVolumeOfMetric g_W ≤ hypVolumeOfMetric g`, with equality only if
`M ≃ₜ W` (Gabai–Meyerhoff–Milley, Theorem 1.1: the Weeks manifold is the unique smallest-volume
closed orientable hyperbolic `3`-manifold, with `v₁ = 0.9427…`). Assuming it, prove its
isometric form: with Mostow rigidity (7.2) the equality case gives an isometry
`(M, g) ≅ (W, g_W)`, and `hypVolume W = v₁ ≤ hypVolume M` for every closed connected orientable
hyperbolic `M`. The authors' route to the inequality is Mom technology: a closed hyperbolic
manifold of volume at most `0.943` contains a Mom-`n` structure for `n ≤ 3`, and the finitely
many resulting manifolds are enumerated; that enumeration is a finite enumeration in the sense of
*Scope and ownership* and is not a target. The hypothesis "orientable" is part of the theorem as
the authors state it; a non-orientable closed hyperbolic `3`-manifold has half the volume of its
orientation double cover, and the non-orientable case is not a target.

- A Weeks manifold `W` is a closed orientable hyperbolic `3`-manifold with
  `H₁(W) ≅ ℤ/5 ⊕ ℤ/5` and volume `0.9427…`; the minimality proposition says that the volume of
  every closed orientable hyperbolic `3`-manifold is at least `0.9427…`, with equality exactly
  for `W`.

**Fibering, Haken manifolds and finite covers.** Consume `TauCeti.MappingTorus φ`,
`TauCeti.MappingTorusPresentation M`, `TauCeti.FibersOverCircle M` (`M` is homeomorphic to a
mapping torus), `TauCeti.IsFiniteCover p` (a surjective covering map with finite fibres),
`TauCeti.IsVirtuallyFibered M` (a connected finite cover of `M` fibers over the circle), the
Haken predicates `TauCeti.IsHakenSurfaceEmbedding`, `TauCeti.IsClosedHakenSurfaceEmbedding`,
`TauCeti.IsPossiblyNonorientableClosedHakenThreeManifold` (an irreducible closed connected
`3`-manifold containing a closed bicollared incompressible surface with infinite fundamental
group) and `TauCeti.IsVirtuallyHaken M`. `TauCeti.VirtualHakenConjecture` quantifies over closed
hyperbolic `3`-manifolds given as a `MetricSpace`, charted on `ℝ³`, `IsManifold (𝓡 3) ∞`,
compact, connected and `IsHyperbolic`. Agol's Theorem 9.2 also gives that `π₁(M)` is LERF and
large; his Theorem 9.1 is the virtual Haken theorem in the aspherical form, of which the
hyperbolic case is the one stated natively. State the aspherical form: a closed connected
`3`-manifold with `π_k(M) = 0` for all `k ≥ 2` is virtually Haken (Agol, Theorem 9.1).
`Suggested.lean` states it as `agol_virtually_haken_of_aspherical`, for `M` Hausdorff, charted on
`ℝ³` and compact, with `TauCeti.IsAspherical M x` at a point `x` (`M` path-connected and
`π_(n+2)(M, x)` trivial for every `n`; independent of `x` by `TauCeti.IsAspherical.of_basepoint`),
concluding `TauCeti.IsVirtuallyHaken M`; and the hyperbolic case as
`virtual_haken_conjecture`, the native `TauCeti.VirtualHakenConjecture`. Prove that the aspherical
form implies the hyperbolic one: a closed hyperbolic `3`-manifold is aspherical, its universal
cover being `ℍ³` (the argument of the irreducibility bullet of 7.3), which is contractible.
Prove that a closed `3`-manifold that fibers over the circle with fibre a closed connected surface
of infinite fundamental group (orientable of genus at least one, or non-orientable other than
`ℝP²`) is Haken in the sense of `TauCeti.IsPossiblyNonorientableClosedHakenThreeManifold`: the
fibre is bicollared and incompressible (`TauCeti.IsIncompressible`), `π₁` of the infinite cyclic
cover injecting, and the manifold is irreducible, its universal cover being `ℝ³`, by the
argument of the irreducibility bullet of 7.3; so the fibering theorem implies the Haken one.
Prove that a space that fibers over the circle has `π₁` surjecting onto `ℤ`, so that a closed
manifold with finite fundamental group is not virtually fibered.

- Agol's statements: `∀ M` closed hyperbolic, `IsVirtuallyFibered M`
  (`TauCeti.VirtualFiberingConjecture`); `VirtualHakenConjecture`; and for aspherical `M`,
  `IsVirtuallyHaken M`.
- `FibersOverCircle M → ∃ x, Function.Surjective (π₁(M, x) → ℤ)`; `IsVirtuallyFibered M` implies
  `π₁(M)` infinite.

**Checks.**
- *Weeks homology.* The `(5, 1), (5, 2)` filling of the Whitehead link exterior has
  `H₁ = ℤ/5 ⊕ ℤ/5` (by evaluation).
- *Smallest volume.* The volume `0.9427…` of the Weeks manifold is less than `v₃ = 1.0149…`, the
  volume of the regular ideal tetrahedron, and than `2 v₃`, that of the figure-eight complement.
- *S³.* `S³` is not hyperbolic, its fundamental group being finite, so neither of Agol's
  theorems applies; it is neither Haken nor fibred over the circle.
- *Asphericity is needed.* `S³` and `ℝP³` have `π₃ ≅ ℤ`, and `S² × S¹` has `π₂ ≅ ℤ`; each is
  closed and not virtually Haken (the finite covers of the first two are `S³` and `ℝP³`, which
  contain no incompressible surface of infinite fundamental group, and every connected finite cover
  of `S² × S¹` is `S² × S¹`, in which `S² × pt` bounds no ball), so the aspherical form fails
  without its hypothesis. The `3`-torus is aspherical and Haken, its own cover.
- *Linking matrix and an `H₁ = 0` filling.* The linking matrix of the Whitehead link is zero, so
  the surgery presentation of the `5, 5/2` filling gives `H₁ = ℤ/5 ⊕ ℤ/5`, of order `25`. The
  `1, 1` filling has surgery matrix the identity, so `H₁ = 0`, and it is still not `S³`: blowing
  down the `+1`-framed unknotted component puts one full twist into the two strands of the
  Whitehead curve that pass through its spanning disc and leaves the curve's coefficient at
  `1 − 0² = 1`, so the filling is `+1`-surgery on a twist knot with one full twist, the trefoil or
  the figure-eight (determinant `3` or `5`, never `1`), and by 5.3 (`gordon_luecke_theorem`) no
  such surgery is `S³`.
- *Framing and orientation conventions.* The coefficient `5/2` is read in the preferred framing
  of the Whitehead curve alone, whose preferred longitude is null-homologous in the complement of
  that component whatever the other component does (`surgerySlope`); read in the framing of a
  neighbourhood with framing number `n` it would be `5/2 − n`
  (`value_surgerySlope_framedBoundaryTorus`), so the framing convention is part of the
  definition. The orientation condition on the neighbourhoods fixes the sign of the coefficients
  (5.2): the Whitehead link is not isotopic to its mirror image, so the fillings with coefficients
  `5, 5/2` and `−5, −5/2` need not agree, and the definition names the first.
- *Cusped volumes.* The figure-eight knot complement has volume `2.0298… = 2 v₃`, more than twice
  `0.9427…`, and is not closed; the theorem compares `W` only with closed manifolds, so this is
  not a counterexample.
- *Fillings approach from below.* A closed hyperbolic `3`-manifold obtained by a filling of the
  figure-eight knot exterior with a large slope has volume close to `2.0298…` from below
  (Thurston's hyperbolic Dehn surgery theorem, 7.3), larger than `0.9427…`, consistent with the
  theorem.
- *Weeks is not Haken.* A Weeks manifold `W` contains no closed incompressible surface, so it is
  not Haken, and Agol's theorems give it a finite cover that is Haken and fibers, a proper cover,
  without `W` itself fibering (its first Betti number is `0`).
- *The hyperbolic hypothesis.* `Σ₂ × S¹` fibers over the circle (the mapping torus of the
  identity of `Σ₂`), so it is virtually fibered through the identity cover
  (`TauCeti.FibersOverCircle.isVirtuallyFibered`); it is not hyperbolic (its `π₁` contains `ℤ²`),
  so the theorem's hypothesis is not necessary for its conclusion.
- *Finite fundamental group.* `S³` is not virtually fibered: every connected finite cover of `S³`
  is `S³`, whose `π₁` is trivial and does not surject onto `ℤ`; the lens space `L(5, 1)` likewise
  has finite `π₁`.
- *"Virtually" is not removable.* A closed hyperbolic manifold with `b₁ > 0` need not fiber itself:
  there are closed hyperbolic manifolds with `b₁ = 1` that do not fiber.
- *Cusped fibering.* Agol's Theorem 9.2 is stated for closed hyperbolic manifolds; the
  figure-eight complement, which is cusped, fibers over the circle directly (it is the mapping
  torus of an Anosov map of the punctured torus), and the theorem does not apply to it as stated.

*Needs:* Layer 5.2, Layer 7.3; Tau Ceti `TauCeti.IsWeeksManifold`,
`TauCeti.GabaiMeyerhoffMilleyTheorem`, `TauCeti.VirtualFiberingConjecture`,
`TauCeti.VirtualHakenConjecture`, `TauCeti.FibersOverCircle`, `TauCeti.IsVirtuallyFibered`,
`TauCeti.IsVirtuallyHaken`, `TauCeti.IsAspherical`.
For the Weeks manifold and the fibering targets also Tau Ceti `TauCeti.whiteheadLink`,
`TauCeti.whiteheadCurve`, `TauCeti.exists_isWeeksManifold`, `TauCeti.isWeeksManifold_congr`,
`TauCeti.IsSolidTorusLinkNeighborhood.surgerySlope`, `TauCeti.HyperbolicMetric`,
`TauCeti.hypVolumeOfMetric`, `TauCeti.hypVolume`, `TauCeti.IsHyperbolic`, `TauCeti.MappingTorus`,
`TauCeti.MappingTorusPresentation`, `TauCeti.FibersOverCircle.isVirtuallyFibered`,
`TauCeti.IsFiniteCover`, `TauCeti.IsHakenSurfaceEmbedding`, `TauCeti.IsClosedHakenSurfaceEmbedding`,
`TauCeti.IsPossiblyNonorientableClosedHakenThreeManifold`, `TauCeti.IsIncompressible` (for the
fibre); Mathlib `Homeomorph`, `FundamentalGroup`, `HomotopyGroup`, `IsCoveringMap`; Layer 1.5
(uniqueness of tubular neighbourhoods); Layer 5.2 (framings, link Dehn fillings and their
dependence on the slopes); Layer 7.2 (Mostow rigidity); AlgebraicTopology Stage 3
(Mayer–Vietoris, for `H₁(W)`).

### Examples

The upper half plane and half space; closed surfaces of genus two as quotients; the
figure-eight and Whitehead link complements; the Weeks manifold.
The round spheres and flat tori for volume; the genus-two surface for the failure of rigidity in
dimension two; the Weeks manifold and the figure-eight complement for volumes; `Σ₂ × S¹` and `S³`
for fibering.

### Dependencies

Tau Ceti's hyperbolic metrics, volumes, isometries, geometric structures, the simplicial
volume with its homotopy invariance, the Mostow, virtual fibering and virtual Haken
propositions, and its smooth singular simplices with the integral of forms over them;
Mathlib's Haar measure, signed measures, the compact-open topology and singular homology
(Layer 7.2's measure chains, their comparison with singular chains and the proportionality);
HopfRinow (geodesics, exponential map); DifferentialGeometry Layer 12 (metrics and densities)
and Layers 8.3–8.4 (the smoothing of singular chains and Stokes' formula for smooth simplices,
for Layer 7.2); SuccessiveMinima (the successive minima of a cusp lattice, for Layer 7.3.1);
Layer 5.2 (Dehn filling), Layer 8.2 (irreducibility), Layer 11.3 (smooth triangulations, for
Löh's comparison).
For Layers 7.1 and 7.4 also Mathlib's Riemannian bundles and measure theory, HopfRinow Layer 1
(the connection and its curvature tensor) and Layer 4 (isometries), Tau Ceti's total volume,
constant-curvature, mapping-torus, finite-cover, incompressibility, Whitehead link and Weeks
manifold declarations, Layer 5.2 for the link fillings and framings behind the Weeks manifold,
Layer 1.5 for the uniqueness of tubular neighbourhoods, and AlgebraicTopology Stage 3
(Mayer–Vietoris).
## Layer 8: decompositions of 3-manifolds and geometrization

The decomposition theorems of `3`-manifold topology are statable against Tau Ceti's
irreducibility, incompressibility, prime-manifold, Seifert-fibration and torus-decomposition
carriers (*From Tau Ceti*). This layer proves the classical theorems up to the JSJ theorem (Alexander's theorem,
Dehn's lemma, the loop and sphere theorems, the prime decomposition and Kneser's finiteness),
develops Seifert fibred spaces, and states the Gordon–Luecke theorem, the JSJ theorem,
geometrization and the Poincaré conjecture. Manifolds are smooth; by Layer 11.2 this loses
nothing in dimension three.
The Poincaré conjecture is stated in its topological form (its smooth form is Poincare3D's), and
the eight model geometries of Thurston's formulation are compared with geometric structures (8.6).

### 8.1 Dehn's lemma, the loop theorem and the sphere theorem

Prove Alexander's theorem: every locally flat `2`-sphere in `S³` bounds a ball on each side, so
`TauCeti.IsSphereBoundsBall S³` (Hatcher, *Notes on Basic 3-Manifold Topology*, Theorem 1.1; the
locally flat case through Layer 11.2 and the PL proof). Prove Dehn's lemma and the loop theorem:
if `M` is a `3`-manifold with boundary and the kernel of `π₁(∂M) → π₁(M)` is nontrivial, some
essential simple closed curve in `∂M` bounds an embedded disc in `M`; and the sphere theorem: if
`π₂(M) ≠ 0` for an orientable `M`, some embedded two-sided sphere in `M` is homotopically
nontrivial (Papakyriakopoulos, Ann. of Math. 66 (1957); Hatcher, Theorem 3.8, whose orientable
case this is). Deduce that a knot in `S³` with knot group `ℤ` is the unknot and that an
irreducible orientable `3`-manifold with infinite fundamental group is aspherical. State the
Gordon–Luecke theorem: knots with homeomorphic complements are carried onto each other by a
homeomorphism of `S³`, hence are equivalent up to mirror image and reversal (Gordon–Luecke,
*Knots are determined by their complements*, J. Amer. Math. Soc. 2 (1989)).

`Suggested.lean` states Alexander's theorem as `alexander_sphere_bounds_ball`, the knot-group
theorem as `smoothAmbientIsotopic_unknot_of_knotGroup` and the Gordon–Luecke theorem as
`gordon_luecke`; the proofs of the first two are targets of this layer, and the proof of the
third, through the cyclic surgery theorem stated in Layer 5.4 and the analysis of reducible
fillings, is GeometricTopology, Part II's. It states the sphere theorem as `sphere_theorem`: for a
smooth orientable `3`-manifold without boundary whose `π₂` (Mathlib's `HomotopyGroup`) at some
base point is nontrivial, there is a locally flat closed embedding of `S²` (`TauCeti.IsLocallyFlat`,
the shape `TauCeti.IsSphereBoundsBall` tests) homotopic to no constant map. Orientability is the
existence of an oriented smooth atlas, `TauCeti.IsOrientedAtlas (𝓡 3) ∞ A` for some set `A` of
charts, which makes `M` orientable (`TauCeti.IsOrientedAtlas.orientable`) and which every
orientable `M` has, `ℝ³` having no boundary (*From Tau Ceti*); so this is the orientable sphere
theorem. The smooth structure, needed to read orientations off chart Jacobians, costs no
generality by Layer 11.2, and two-sidedness is automatic. Its proof is a target of this layer.

**Meridian uniqueness and actual filling extensions.** State the Gordon–Luecke filling theorem:
for every nontrivial tame knot K in `S³` and every slope r on its compact exterior,
`X_K(r) ≅ S³` implies `r = μ_K`, with no primality hypothesis; the meridian filling gives the
converse. Its proof (punctured planar surfaces, filling caps, intersection graphs) is
GeometricTopology, Part II's, and it is consumed here as stated; the cyclic-surgery distance bound
alone does not give it. Assuming it, prove the extension theorem: for nontrivial K, J and a
homeomorphism `h : X_K ≃ₜ X_J` of exteriors, `X_J(h_*μ_K) ≅ S³` by transport, so
`h_*μ_K = μ_J`, and this `h` itself extends, by 5.2's marked solid-torus extension after adjusting collars, to a homeomorphism
of `S³` carrying one core knot onto the other, with its orientation and core-parametrization
laws. The filling and slope comparisons are 5.2's. The unknot has other `S³` fillings, so
nontriviality cannot be dropped. The proof does not use 8.5.2. Reference: [Gordon–Luecke,
*Knots are determined by their complements*, J. Amer. Math. Soc. 2 (1989),
371–415](https://doi.org/10.1090/S0894-0347-1989-0965210-7).

**Checks.**
- *Orientability in the sphere theorem.* `S¹ × ℝP²` has `π₂ ≅ ℤ` but is irreducible, so every
  embedded sphere is null-homotopic (Hatcher, Proposition 1.13 and the remark after Theorem 3.8).
- *Oriented atlases need a boundaryless model.* The interval `[0, 1]`, modelled on `[0, ∞)`, is
  orientable but has no oriented atlas: a chart at `0` is increasing in `t`, a chart at `1`
  decreasing, and along a chain of charts across `(0, 1)` with transitions of positive
  derivative that sign cannot change.
- *Knot groups.* The unknot has group `ℤ`; the trefoil has group `⟨x, y | xyx = yxy⟩`, which is not
  abelian, so the knot-group theorem does not apply, consistent with the trefoil being
  knotted.
- *An unoriented atlas.* The two stereographic charts of `S³` change coordinates by the
  inversion `y ↦ y/|y|²` of `ℝ³ ∖ {0}`, whose derivative `|y|⁻²(1 − 2ŷŷᵀ)` has determinant
  `−|y|⁻⁶ < 0`, so that atlas is not oriented; composing the chart from the south pole with
  `y₁ ↦ −y₁` gives an oriented atlas. The hypothesis asks that some oriented atlas exist (by
  evaluation).

*Needs:* Layer 11.2 (PL structures in dimension three), Layer 5.1, Layer 4.4; Tau Ceti
`TauCeti.IsSphereBoundsBall`, `TauCeti.IsIncompressible`, `TauCeti.IsLocallyFlat`,
`TauCeti.Orientable`, `TauCeti.IsOrientedAtlas`, `TauCeti.IsOrientedAtlas.orientable`; Mathlib
`FundamentalGroup`, `HomotopyGroup`.

### 8.2 Prime decomposition

Primeness is Tau Ceti's `TauCeti.IsPrimeManifold 3 M`: `M` is not `S³` and every decomposition
of it as a connected sum (`TauCeti.IsConnectedSumOf`) of two closed `3`-manifolds has an `S³`
summand; `TauCeti.IsIteratedConnectedSum 3 P M` presents `M` as the sum of `P 0, …, P (k − 1)`,
`k = 0` for `S³`. Kneser's existence and Milnor's uniqueness of prime decompositions are the
pinned propositions `TauCeti.KneserPrimeDecompositionTheorem` and
`TauCeti.MilnorPrimeDecompositionTheorem`, for closed connected orientable smooth `3`-manifolds,
uniqueness meaning the same number of factors and diffeomorphic factors after a permutation;
`Suggested.lean` states them as `kneser_prime_decomposition` and `milnor_prime_decomposition`.
Irreducibility is `TauCeti.IsSphereBoundsBall`. The connected sum is the pinned one with Layer
1.4's cut-and-glue description; the sphere system of a prime decomposition and the ball capping
of its pieces are Layers 1.2 and 1.3. Prove:

- the only closed orientable prime manifold that is not irreducible is `S¹ × S²` (Hatcher,
  Proposition 1.4), so the prime summands of a simply connected closed `3`-manifold, which has
  no `S¹ × S²` summand since `π₁(S¹ × S²) = ℤ`, are irreducible;
- Kneser's finiteness for spheres: in a compact connected `3`-manifold in which every
  `2`-sphere separates and no boundary component is a sphere, there is a bound, in terms of a
  triangulation, on the number of spheres in a system of disjoint spheres no complementary
  component of which is a punctured `3`-sphere (Hatcher, the Basic Fact in the proof of Theorem
  1.5); parallel spheres cobound a punctured sphere `S² × [0, 1]`, so such a system has no two
  parallel members;
- Kneser's finiteness for surfaces: in a compact irreducible `3`-manifold there is a bound on the
  number of components of a system of disjoint closed connected two-sided incompressible
  surfaces, none a sphere, no component of whose complement is a product `T × [0, 1]` with `T` a
  closed surface (Hatcher, Proposition 1.7). Incompressibility here is Hatcher's: a two-sided
  surface other than a sphere or a disc is incompressible when the boundary of every compressing
  disc bounds a disc in the surface; for such surfaces `TauCeti.IsIncompressible` implies it, and
  the converse is the loop theorem of Layer 8.1;
- the Kneser–Milnor theorem, the two pinned propositions: every closed connected orientable
  `3`-manifold is a connected sum of finitely many prime manifolds, unique up to order (Hatcher,
  Theorem 1.5; Milnor, *A unique decomposition theorem for 3-manifolds*, Amer. J. Math. 84
  (1962), Theorem 1).
- the native uniqueness is unoriented: a presentation along arbitrary balls is an oriented one for
  suitable orientations of the factors (1.4), so Milnor's uniqueness up to orientation-preserving
  diffeomorphism gives it; the number of prime factors is an invariant of the manifold
  (`TauCeti.MilnorPrimeDecompositionTheorem.card_eq`), and `k = 0` exactly for `S³`;
- `π₁(P 0 # ⋯ # P (k − 1)) ≅ π₁(P 0) * ⋯ * π₁(P (k − 1))` (1.4, van Kampen), so that the
  free-product decomposition of `π₁` is determined by the prime decomposition.

The carriers in full: `TauCeti.IsConnectedSumOf I k M N₁ N₂` says that `M` is `C^k` diffeomorphic
to the connected sum of `N₁` and `N₂` along some pair of coordinate balls (1.4), a relation
symmetric in the summands and invariant under diffeomorphisms of `M` and of the summands;
`TauCeti.IsPrimeManifold n M` holds when `M` is not diffeomorphic to `Sⁿ` and in every
decomposition of it as a connected sum of two closed smooth `n`-manifolds one summand is
diffeomorphic to `Sⁿ`; and `TauCeti.IsIteratedConnectedSum n P M` presents `M` as the
right-nested connected sum `P 0 # (P 1 # (⋯ # P (k − 1)))` of closed manifolds, with `k = 0`
meaning `M ≃ Sⁿ` (`TauCeti.isIteratedConnectedSum_zero_iff`). The sphere is not prime
(`TauCeti.not_isPrimeManifold_sphere`), as `1` is not a prime number, so that decompositions are
unique on the nose rather than up to inserting spheres. The summands are required to be closed,
since `M` is the connected sum of `M` with one point doubled, a non-Hausdorff manifold, and `ℝⁿ`,
neither of which is a sphere. Irreducibility, `TauCeti.IsSphereBoundsBall M`, says that every
locally flat closed embedding of `S²` in `M` extends to a closed embedding of the `3`-ball, that
is, every embedded locally flat `2`-sphere bounds a ball.

**Checks.**
- *Orientability in the uniqueness clause.* For non-orientable `N`, `N # (S¹ × S²)` and
  `N # (S¹ ×̃ S²)` are diffeomorphic although `S¹ × S²` and `S¹ ×̃ S²` are distinct primes; hence
  the theorem carries `TauCeti.Orientable`.
- *No sphere components.* In the irreducible `T³` any number of disjoint small spheres bounding
  balls are injective on `π₁`, so surface finiteness for the pinned predicate needs the
  condition that no surface is a sphere.
- *Prime versus irreducible.* `S¹ × S²` is prime and not irreducible; `T³` is irreducible, hence
  prime; `ℝP³ # ℝP³` is not prime, its prime factors being the two `ℝP³` summands.
- *The empty sum.* `S³` is the empty connected sum and is not prime, so no prime decomposition
  contains it as a factor; this is what makes uniqueness hold on the nose, where Hatcher's
  formulation discards `S³` summands. `S¹ × S²` is prime with `π₁ = ℤ`, and
  `(S¹ × S²) # (S¹ × S²)` has `π₁` free of rank two and is not prime
  (`TauCeti.IsConnectedSumOf.not_isPrimeManifold`).
- *Order and padding.* `L(2, 1) # L(3, 1)` has `π₁ = C₂ * C₃` and exactly two prime factors; the
  presentations with the factors in either order are the same decomposition up to the bijection
  of index sets, and a presentation padded by an `S³` factor is excluded, since `S³` is not prime.
- *Single pieces.* The Poincaré homology sphere is prime and irreducible with finite `π₁`; `T³` is
  prime and irreducible with `π₁ = ℤ³`; neither decomposes further, and both are their own single
  JSJ piece (8.5).
- *Non-compact manifolds.* `ℝ³` is prime in the native sense, vacuously (it is no connected sum of
  two closed manifolds) and not `S³`; the theorems quantify over closed manifolds, so this value
  never enters a decomposition.

*Needs:* Layer 1.2, Layer 1.3, Layer 1.4, Layer 8.1, Layer 11.2; Tau Ceti
`TauCeti.IsSphereBoundsBall`, `TauCeti.Orientable`, `TauCeti.IsPrimeManifold`,
`TauCeti.IsIteratedConnectedSum`, `TauCeti.KneserPrimeDecompositionTheorem`,
`TauCeti.MilnorPrimeDecompositionTheorem`.
For the carriers, the counting and the free-product decomposition also Tau Ceti
`TauCeti.IsConnectedSumOf`, `TauCeti.IsConnectedSumOf.not_isPrimeManifold`,
`TauCeti.not_isPrimeManifold_sphere`, `TauCeti.isIteratedConnectedSum_zero_iff`,
`TauCeti.MilnorPrimeDecompositionTheorem.card_eq`, `TauCeti.IsClosedConnectedManifold`; Mathlib
`FundamentalGroup`; Layer 1.4 (the connected sum, its orientation and `π₁(M # N)`); Layer 11.2 (a
triangulation of `M`, for Kneser's finiteness); AlgebraicTopology Stage 1 (van Kampen).

### 8.3 Incompressible surfaces and Haken manifolds

A surface `S ⊂ M` is incompressible when it is `TauCeti.IsIncompressible`, an embedding injective
on `π₁` at every base point; a compact orientable irreducible `3`-manifold containing a properly
embedded bicollared incompressible compact surface with nonempty boundary or infinite
fundamental group (for a closed orientable surface, positive genus) is Haken
(`TauCeti.IsHakenSurfaceEmbedding`). Prove that a compact orientable irreducible `3`-manifold with
infinite first homology is Haken, that an incompressible surface in an irreducible `3`-manifold
can be isotoped to be normal with respect to any triangulation, and the existence of a Haken
hierarchy: a Haken manifold is cut by finitely many successive incompressible surfaces into balls
(Haken, Waldhausen; Hatcher, Chapter 3). Prove Waldhausen's theorem that a homotopy equivalence
between closed Haken manifolds is homotopic to a homeomorphism (Waldhausen, *On irreducible
3-manifolds which are sufficiently large*, Ann. of Math. 87 (1968)). `Suggested.lean` states it as
`waldhausen_theorem`, for closed orientable Haken manifolds: the pinned
`TauCeti.IsPossiblyNonorientableClosedHakenThreeManifold` (irreducible, with a closed bicollared
incompressible surface of infinite fundamental group, whose witness carries the closed connected
`3`-manifold package) together with an oriented smooth atlas on each manifold
(`TauCeti.IsOrientedAtlas (𝓡 3) ∞`), which is orientability as in 8.1, the conclusion being a
homeomorphism homotopic to the given homotopy equivalence. Its proof is a target of this layer.

**Checks.**
- *Spheres are incompressible.* Every embedded sphere is injective on `π₁`, `π₁(S²)` being
  trivial, so a Haken predicate through incompressibility alone, without nonempty boundary or
  infinite fundamental group, would make every irreducible `3`-manifold Haken.
- *The Haken hypothesis.* `L(7, 1)` and `L(7, 2)` are homotopy equivalent but not homeomorphic,
  and neither is Haken, their fundamental groups being finite.
- *Virtually Haken.* The Weeks manifold is not Haken but is virtually Haken by Agol's theorem
  (Layer 7.4).

*Needs:* Tau Ceti `TauCeti.IsIncompressible`, `TauCeti.IsHakenSurfaceEmbedding`,
`TauCeti.IsPossiblyNonorientableHakenThreeManifold`,
`TauCeti.IsPossiblyNonorientableClosedHakenThreeManifold`, `TauCeti.Orientable`,
`TauCeti.IsOrientedAtlas`, `TauCeti.IsOrientedAtlas.orientable`; Layer 8.2, Layer 11.2.
For closed incompressible surfaces also Tau Ceti `TauCeti.IsClosedIncompressibleSurfaceEmbedding`
(a closed connected surface embedded incompressibly in a closed connected `3`-manifold); Mathlib
`FundamentalGroup`.

### 8.3.1 Compact Haken manifolds and relative rigidity

This is the compact-boundary counterpart of 8.3's closed Waldhausen theorem and a topological
supplier of 8.5.2; it uses neither hyperbolization nor a finite knot table.

1. **Collared cores and hierarchies.** The manifolds are compact connected orientable
   irreducible sufficiently large `3`-manifolds with collared nonempty boundary, incompressible
   (`TauCeti.IsIncompressible`) and without sphere components, carrying as data the properly
   embedded two-sided essential surfaces witnessing the Haken condition. Give them finite CW
   models with boundary subcomplexes (11.2's relative triangulations), extend 8.1's sphere, loop
   and covering arguments to them, and prove them and their nonspherical boundary components
   aspherical. Construct finite essential-surface hierarchies, with the boundary patterns,
   collars, product regions and inverse gluing maps created by cutting, and prove normalization
   and a well-founded complexity reduction to balls and product pieces, tracking the boundary
   pattern since a cut piece need not have incompressible new boundary. This normal-surface and
   annulus theory is the topological prefix of 8.5.1.
2. **Relative Waldhausen realization.** For such M, N and a homotopy equivalence `f : M → N`
   restricting to a prescribed homeomorphism `b : ∂M ≃ₜ ∂N` of the entire boundary, construct
   `h : M ≃ₜ N` with `h|∂M = b` and a homotopy from f to h relative to the boundary (Waldhausen,
   *On irreducible 3-manifolds which are sufficiently large*, Ann. of Math. 87 (1968), Theorem
   6.1; Hempel, *3-Manifolds*, Theorem 13.6), also for a prescribed boundary pattern satisfying
   the same conditions, with inverse, composition and change-of-collar comparisons. Route: collar
   straightening, induction along the hierarchy with compatible cutting-surface maps, removal of
   product-region discrepancies, gluing after collar adjustment. The `I`-bundle cases (`T²×I`, the
   orientable twisted `I`-bundle over the Klein bottle) are included: the hypothesis on the entire
   boundary removes exactly the exceptions of Hempel's boundary-into-boundary form. A smooth or PL
   realization uses in addition 11.2's relative pair comparison.
3. **From peripheral group systems to maps of pairs** (Waldhausen, Corollary 6.5; Hempel,
   Theorem 13.7). For torus-boundary inputs, fix a basepoint, a basepoint on every boundary
   component and paths defining the inclusion subgroups `P_i ≤ π₁(M)`, an indexed system rather
   than a set of conjugacy classes. Given a group isomorphism φ, a bijection σ of boundary
   components and conjugators with `φ(P_i) = g_i Q_(σ i) g_i⁻¹`, construct a homeomorphism of
   pairs inducing φ after the stated basepoint transport, natural under changes of basepoints and
   paths. Route: realize the `GL₂(ℤ)` matrices of the boundary restrictions by torus
   homeomorphisms b_i, comparing basepoint paths and orientation signs; cellular extension into
   the aspherical target gives the core map realizing φ, its inverse from φ⁻¹ and the homotopies;
   the conjugator paths make the b_i homotopic to the core map's restrictions; relative homotopy
   extension and collars give a homotopy equivalence of pairs restricting to the b_i; item 2
   finishes. Orientation is unrestricted; an orientation-preserving homeomorphism needs compatible
   relative orientation and degree data.

**Checks.**
- *Boundary data are extra.* In `T² × I` both boundary subgroups are all of `ℤ²`; the flip
  `(x, t) ↦ (x, 1 − t)` and the identity induce the same automorphism of `π₁` but exchange the
  boundary tori, so σ and the conjugators are not determined by the group isomorphism.
- *Solid torus.* A solid torus is not sufficiently large, its boundary being compressible, so
  the hypotheses exclude it; the hierarchy induction needs an incompressible boundary to begin.
- *Figure-eight exterior.* A self-homotopy equivalence `f` of the figure-eight knot exterior that
  is the identity on the boundary torus and induces the identity on `π₁` at a boundary basepoint is
  homotopic relative to the boundary to the identity, by item 1's asphericity: two maps from a CW
  complex into an aspherical space that agree on a connected subcomplex and induce the same
  homomorphism of `π₁` at a basepoint in it are homotopic relative to that subcomplex, the
  obstructions lying in `π₁`, on which the two maps agree, and in `π_k = 0` for `k ≥ 2`. Item 2
  alone gives only some homeomorphism `h` equal to the identity on the boundary with `f ≃ h`
  relative to it; that `h` is homotopic to the identity relative to the boundary is again the
  asphericity argument.

*Needs:* 8.1–8.2 and 8.3's Haken and normal-surface prefix, not its closed rigidity conclusion;
11.1–11.2 for finite relative CW and PL models; collars, gluing and supported isotopy from Layers
1–3; fundamental groups, basepoint-path equivalences, higher homotopy and homotopy extension;
Layer 1.7's compact-surface classification and Layer 1.7.2's torus mapping classes. 8.5–8.5.1
consume this prefix and supply no premise back to it.

### 8.4 Seifert fibred spaces

Consume `TauCeti.IsSeifertFibration r` (every point has a chart to the standard fibred solid
torus `TauCeti.SolidTorus` with `TauCeti.SolidTorus.fiberSetoid p q`), `TauCeti.IsSeifertFibered`,
`TauCeti.IsSeifertFibration.nonempty_homeomorph_circle` (every fibre is a circle) and
`TauCeti.isSeifertFibered_prod_circle` (`S¹ × F`, without exceptional fibres). Prove:

- the exceptional fibres are isolated, and the quotient by the fibres is a `2`-orbifold whose
  underlying space is a surface; torus-knot exteriors are Seifert fibred with two exceptional
  fibres of multiplicities `p` and `q`, and lens spaces are Seifert fibred;
- a compact connected Seifert fibred space is determined up to fibre-preserving homeomorphism by
  its Seifert invariants: the genus and orientability of the base, the number of boundary
  components, the orientation character of the fibres along loops of the base, Seifert's
  normalized pairs `(m₁, ν₁), …, (mₖ, νₖ)` of the exceptional fibres up to permutation, with
  `mᵢ ≥ 2` the multiplicity of the fibre and `0 < νᵢ < mᵢ` coprime to it, measured in an orientation
  of a neighbourhood of the fibre (reversing it replaces `νᵢ` by `mᵢ − νᵢ`), and the Euler
  obstruction `e` when the base is closed (Seifert, Acta Math. 60 (1933); Scott, *The geometries of
  3-manifolds*, Bull. London Math. Soc. 15 (1983), §3); for an orientable total space the
  orientation character is determined by the base and the invariants reduce to Hatcher's
  `M(±g, b; α₁/β₁, …, αₖ/βₖ)` (Hatcher, §2.1, p. 33), in which `g` is the genus of the base, the
  sign is `+` exactly when the base is orientable, `b` is the number of boundary components of the
  base, and the Euler obstruction is not a separate symbol but is carried by the fractions `αᵢ/βᵢ`.
  In Hatcher's notation the multiplicity of a fibre is the denominator `βᵢ` of its fraction, the
  meridian disc of its fibred solid torus meeting each nearby fibre `βᵢ` times, so the fibre of
  Seifert's pair `(mᵢ, νᵢ)` has a fraction with denominator `mᵢ`, and a fraction with `βᵢ = 1`
  records a regular fibre;
- in a compact connected irreducible Seifert fibred space every essential surface (a connected
  compact properly embedded surface that is incompressible, in Hatcher's sense of Layer 8.2, and
  `∂`-incompressible, or a sphere not bounding a ball, or a disc that is not `∂`-parallel) is
  isotopic to a vertical surface, a union of regular fibres, or a horizontal one, transverse to
  all fibres (Hatcher, Proposition 1.12, with the definitions of §1.2);
- a compact connected Seifert fibred space is irreducible unless it is `S¹ × S²`, `S¹ ×̃ S²` or
  `ℝP³ # ℝP³` (Hatcher, Proposition 1.13);
- Seifert fibrations of compact connected orientable Seifert fibred spaces are unique up to
  fibre-preserving homeomorphism except for those of Hatcher, Theorem 2.3: the model fibrations
  of `S¹ × D²`, two fibrations each of `S¹ ×̃ S¹ ×̃ [0, 1]` and of `S¹ ×̃ S¹ ×̃ S¹`, the fibrations
  of `S³`, `S¹ × S²` and the lens spaces over the sphere with at most two exceptional fibres, and
  the family `M(0, 0; 1/2, −1/2, α/β) = M(−1, 0; β/α)` for `α, β ≠ 0` (Hatcher, Theorem 2.3,
  p. 37).

The local models are the fibred solid tori `V(p, q)`, the solid torus with the fibres of
`TauCeti.SolidTorus.fiberSetoid p q`, and each model with `q > 0` and `p`, `q` coprime is itself
Seifert fibred natively (`TauCeti.SolidTorus.isSeifertFibration_fiberSetoid`), as is every
product `F × S¹`.

**Checks.**
- *Orientation character.* The circle bundles `T³ → T²` and `K × S¹ → T²` (`K` the Klein bottle
  fibred over a circle factor) both have base of genus one, a section and no exceptional fibres,
  and differ only in the orientation character; the genus, the boundary count, the Euler
  obstruction `e` and the exceptional pairs miss this.
- *Two notations.* A fibre of multiplicity `2` has Seifert's normalized pair `(2, 1)` and a
  Hatcher fraction with denominator `2`, such as `1/2`, while Hatcher's fraction `2/1` records a
  regular fibre; reading Seifert's pair `(m, ν)` as Hatcher's fraction `m/ν` would make the
  multiplicity-`2` fibre regular (by evaluation).
- *Essential surfaces.* In `T³ = S¹ × T²` a small sphere bounding a ball is injective on `π₁` but
  neither vertical nor horizontal (Euler characteristic `2`, not `0`); it is not essential.
- *Knot exteriors.* The trefoil exterior is Seifert fibred with exceptional fibres of
  multiplicities `2` and `3`; the figure-eight exterior is not Seifert fibred, being hyperbolic
  (Layer 7.3).

*Needs:* Tau Ceti `TauCeti.IsSeifertFibration`, `TauCeti.IsSeifertFibered`, `TauCeti.SolidTorus`,
`TauCeti.SolidTorus.fiberSetoid`; Layer 5.1, Layer 8.3; Layer 1.7.
For the local models also Tau Ceti `TauCeti.SolidTorus.isSeifertFibration_fiberSetoid`,
`TauCeti.IsSeifertFibration.nonempty_homeomorph_circle`, `TauCeti.isSeifertFibered_prod_circle`;
Layer 8.2 (irreducibility).

### 8.5 The JSJ theorem

State `TauCeti.JSJTheorem`: every closed orientable irreducible `3`-manifold has a
`TauCeti.IsJSJDecomposition`, a minimal finite family of disjoint locally flat incompressible tori
whose complementary components are Seifert fibred or atoroidal, and any two such families are
carried onto each other by an ambient isotopy (Jaco–Shalen, Mem. Amer. Math. Soc. 220 (1979);
Johannson, Lecture Notes in Math. 761 (1979); Hatcher, Theorem 1.9). `Suggested.lean` states it as
`jsj_theorem`. The proof is GeometricTopology, Part II's, by Hatcher's route from Layers 8.1–8.4:
Kneser finiteness bounds a maximal system of incompressible tori, the Seifert pieces are
irreducible by Proposition 1.13, and uniqueness follows from the analysis of annuli in the pieces
(Lemma 1.11, that an incompressible surface with boundary on tori is `∂`-incompressible or a
`∂`-parallel annulus; Proposition 1.14; Lemmas 1.16–1.18: annuli are vertical, boundary
restrictions of two fiberings are isotopic, and an atoroidal piece with an essential annulus is
Seifert fibred).

- The number of tori of a JSJ decomposition is an invariant (`TauCeti.JSJTheorem.card_eq`).
- The empty family is a JSJ decomposition exactly when `M` itself is Seifert fibred or atoroidal
  (`TauCeti.isJSJDecomposition_of_isEmpty`).

The carriers read as follows: `TauCeti.IsPeripheralTorus S` says that the torus `S` is the end
`T² × {0}` of a closed embedding of `T² × [0, ∞)`; `TauCeti.IsAtoroidal N` that every locally flat
incompressible torus in `N` is peripheral, which for compact `N` says that there is none;
`TauCeti.IsTorusDecomposition T` that `T` is a finite family of disjoint locally flat
incompressible tori every connected component of whose complement is Seifert fibred or
atoroidal; and `TauCeti.IsJSJDecomposition T` that `T` is a torus decomposition no proper
subfamily of which is one. Minimality is thus part of the definition: a torus decomposition with a
redundant torus is not a JSJ decomposition. The pieces of a JSJ decomposition are the connected
components of the complement of the tori, open in `M`
(`TauCeti.exists_opens_eq_connectedComponentIn_compl_iUnion_range`), each Seifert fibred or
atoroidal; the uniqueness clause of `TauCeti.JSJTheorem` is an ambient isotopy carrying the union
of the tori of one decomposition onto the union of the tori of the other.

**Checks.**
- *Minimality.* `T³` is Seifert fibred, so the torus decomposition `T² × {pt}` has the empty
  family as a proper subfamily that is also one, and is not a JSJ decomposition.
- *Why minimality is required.* `T³` with the empty family is a torus decomposition,
  `T³ = T² × S¹` being Seifert fibred, and so is `T³` with one coordinate torus, its complement
  `T² × (0, 1)` being Seifert fibred; only the empty family is a JSJ decomposition, which is the
  uniqueness the theorem asserts, and a definition without the minimality condition would make
  both families canonical.
- *Glued trefoil exteriors.* Glue two trefoil exteriors along their boundary tori by a
  diffeomorphism sending the Seifert fibre of one to a curve transverse to the fibre of the other:
  the resulting closed manifold has the glued torus as its unique JSJ torus, with two Seifert
  fibred pieces; the family with no tori is not a torus decomposition, since the glued manifold
  is neither Seifert fibred nor atoroidal.
- *Anosov torus bundle.* A torus bundle over the circle with Anosov monodromy has one JSJ torus,
  the fibre: it is irreducible, not Seifert fibred and not atoroidal, and cutting along the
  fibre leaves `T² × (0, 1)`, which is Seifert fibred.
- *Hyperbolic.* A closed hyperbolic `3`-manifold is atoroidal (Layer 7.3), so its JSJ
  decomposition is empty.
- *The Weeks manifold.* An incompressible torus in a closed hyperbolic `3`-manifold would give a
  `ℤ²` in its fundamental group, which has none (Layer 7.2); so the Weeks manifold (Layer 7.4) is
  its own single JSJ piece.

*Needs:* Tau Ceti `TauCeti.JSJTheorem`, `TauCeti.IsJSJDecomposition`, `TauCeti.IsTorusDecomposition`,
`TauCeti.IsAtoroidal`, `TauCeti.IsPeripheralTorus`; Layer 8.2, Layer 8.3, Layer 8.4; Layer 11.2.
For the carriers also Tau Ceti `TauCeti.JSJTheorem.card_eq`,
`TauCeti.isJSJDecomposition_of_isEmpty`,
`TauCeti.exists_opens_eq_connectedComponentIn_compl_iUnion_range`, `TauCeti.IsIncompressible`,
`TauCeti.IsSeifertFibered`; Mathlib `FundamentalGroup`; Layer 2.1 (locally flat tori).

### 8.5.1 The relative JSJ theorem for compact torus-boundary manifolds

Extend the 8.5 theorem to compact orientable irreducible `3`-manifolds with incompressible torus
boundary, relative to specified boundary collars and peripheral markings: build the finite
cut-and-glue records, incompressibility and boundary-parallelism tests, the minimal
characteristic torus family, its Seifert pieces and atoroidal interiors, and prove existence and
uniqueness up to ambient isotopy relative to the external boundary and that every homeomorphism
carries one characteristic family to the other up to such isotopy (existence and uniqueness up
to isotopy of a minimal family for compact irreducible orientable `3`-manifolds, boundary allowed:
Hatcher, *Notes on Basic 3-Manifold Topology*, Theorem 1.9, p. 18; Jaco–Shalen; Johannson, as in
8.5). The proof belongs to the
normal-surface and characteristic-annulus prefix of GeometricTopology, Part II, which extends
8.5's Kneser, characteristic-Seifert and annulus arguments to boundary collars from 8.1–8.4 and
11.2 alone. The pinned `TauCeti.JSJTheorem` is the closed case. `TauCeti.IsPeripheralTorus` and
`TauCeti.IsAtoroidal` describe noncompact ends through an embedded `T²×ℝ≥0`: apply them to
interiors and prove their equivalence with boundary parallelism in the compact core.

**Checks.**
- *Compact-core convention.* The Hopf link exterior `T² × [0, 1]` is Seifert fibred with two
  parallel boundary tori and empty characteristic family; the noncompact-end definition applied
  to the compact core would count a boundary-parallel torus as essential.
- *Knot exteriors.* The exterior of a hyperbolic knot has no essential torus and an empty
  characteristic family; the exterior of a satellite knot with hyperbolic pattern and companion
  has the companion torus as its one characteristic torus.
- *Closed case and solid torus.* A manifold with empty boundary is the closed case, so the
  pinned `TauCeti.JSJTheorem` is a special case; the solid torus `S¹ × D²` lies outside the
  hypotheses, its boundary torus compressing.

*Needs:* Layers 1–5, 8.1–8.5, 11.2; Layer 1.7.2's mapping classes of the boundary tori and their
isotopy classification. 8.5.2 consumes the statement.

### 8.5.2 Prime-knot groups and exterior rigidity

Assuming the relative JSJ theorem of 8.5.1 and the cyclic surgery theorem of 5.4, both stated
in this roadmap and both proved in GeometricTopology, Part II, prove: for nontrivial prime tame
knots `K, J ⊂ S³`, primeness being 4.9's, an abstract group isomorphism `π₁(X_K) ≃* π₁(X_J)`
implies that their compact exteriors are homeomorphic. This roadmap owns the reduction of the
rigidity of prime-knot groups to these two theorems. Here
`X_K = S³ \ int ν(K)` is 5.1's exterior of the native `SmoothCircleEmbedding`, with its boundary
torus and collar, the groups are the native `KnotGroup`, not presentations, and the conclusion carries
no orientation or meridian marking. The unknot, with group `ℤ`, is 8.1's knot-group theorem.

**Topological and peripheral preparation.** Prove independence of the tubular-neighbourhood
choices and the homotopy comparison of the compact exterior with the open complement, with
basepoints and peripheral subgroups. For a nontrivial knot prove irreducibility, boundary
incompressibility and the Haken hypotheses of 8.3.1: a minimum Seifert surface, trimmed of its
boundary collar, is the proper essential surface, and 8.1's loop theorem upgrades 4.3.4's
geometric disc-incompressibility to injectivity on `π₁`. With P_K the image of `π₁(∂X_K)` in
`π₁(X_K)`, with a path to the basepoint, prove Whitten's peripheral-recovery lemma: from the given
isomorphism construct some isomorphism ψ, possibly different, and a conjugator g with
`ψ(P_K) = g P_J g⁻¹`. Its group-theoretic and characteristic-submanifold proof is owned here;
neither the JSJ theorem for homeomorphisms nor the closed Waldhausen theorem gives it.

**Full recovery proof, including cables.** Compare algebraically the annulus and torus splittings,
with their injective vertex and edge groups and gluing homomorphisms (van Kampen, normal forms for
amalgams and HNN extensions), construct the characteristic annulus and Seifert and `I`-bundle data
and recover an external peripheral system, consuming the relative JSJ statement of 8.5–8.5.1:

- torus knots: a nontrivial knot group has nontrivial centre exactly for torus knots; from
  `⟨u, v | u^p = v^q⟩` recover the centre, the quotient `C_|p| * C_|q|` and the unordered coprime
  multiplicities `|p|, |q| ≥ 2`, and compare with 4.11's torus models up to global mirror;
- annulus-free exteriors: peripheral recognition and realization under the full
  characteristic-submanifold hypotheses, since a maximal rank-two abelian subgroup need not be
  the outer peripheral subgroup of a satellite exterior;
- essential annuli at the outer boundary give a connected sum, excluded by primeness, or a cable
  (a torus knot is a cable of the unknot); treat every winding number, two included, by annulus,
  slope and Dehn-filling comparisons, using 5.4's cyclic surgery theorem only with its
  non-Seifert hypotheses, cyclic fillings and slope distance established, Seifert and torus
  companions by their models, and without assuming Property P;
- satellites: retain arbitrary characteristic pieces and gluings, including internal composing
  and keychain Seifert pieces (a prime satellite may have a composite companion), and rebuild the
  outer peripheral system by hierarchy and characteristic comparisons, beyond Mostow rigidity.

Applying 8.3.1's group-to-pair realization to ψ gives the exterior homeomorphism, with its
basepoint comparison; it need not realize the original isomorphism.

**Knot equivalence and sharp scope.** Assuming in addition 8.1's Gordon–Luecke filling theorem
(proved in GeometricTopology, Part II), the chosen exterior homeomorphism sends the source
meridian to the target meridian (8.1's meridian uniqueness), and 8.1's extension theorem
extends it over the meridional fillings, so K and J are carried onto each other by a homeomorphism
of `S³`, allowing reflection and reversal of the knot orientation; conversely such a homeomorphism
gives the group isomorphism. The equivalence holds in this coarse quotient; smooth ambient
isotopy comparisons go through 11.2 and 3.4's category and Cerf bridges. References:
[Whitten, *Knot complements and groups*, Topology 26 (1987),
41–44](https://doi.org/10.1016/0040-9383(87)90019-X), and [Friedl, *Topology*, Theorem 16.11
and footnote 115](https://friedl.app.uni-regensburg.de/papers/2024_knot-theory-final.pdf) for the
compact-exterior formulation, with the meridian and longitude orientation laws in Lemma 7.3.

**Checks.**
- *Up to reflection.* A trefoil and its mirror have isomorphic groups but nonzero signatures of
  opposite sign, so the rigidity holds only in the quotient by reflection.
- *Primeness is needed.* The granny and square knots both have group
  `⟨a, b, c | aba = bab, aca = cac⟩` but signatures of absolute value `4` and `0`, so by
  Gordon–Luecke their exteriors are not homeomorphic.
- *Unknot.* The unknot has group `ℤ` and a solid-torus exterior; it is covered by 8.1's unknot
  criterion, separately from the prime rigidity.

*Needs:* 4.1, 4.3.4, 4.4, 4.9, 4.11; 5.1–5.2 and 5.4 (the cyclic surgery theorem as stated);
6.2; 8.1 (the Gordon–Luecke filling theorem as stated, for the knot-equivalence consequence only),
8.2–8.5 and 8.5.1 (the relative JSJ theorem as stated) and 11.2, with 8.3.1's relative Haken and
peripheral realization. Neither geometrization nor closed hyperbolization is a premise.

### 8.6 Geometrization and the Poincaré conjecture

The geometrization theorem is the pinned `TauCeti.GeometrizationConjecture`: every closed
orientable irreducible `3`-manifold has a `TauCeti.IsGeometricTorusDecomposition`, a finite family
of disjoint locally flat incompressible tori whose complementary components are Seifert fibred or
`TauCeti.IsFiniteVolumeHyperbolic` (Thurston, Bull. Amer. Math. Soc. 6 (1982), Conjecture 1.1;
Perelman, arXiv math/0211159, math/0303109, math/0307245; Kirby's Problem 3.45). `Suggested.lean`
states it as `geometrization_conjecture`. Prove its topological consequences: the Poincaré
conjecture, every closed simply connected `3`-manifold is homeomorphic to `S³` (Morgan–Tian,
*Ricci Flow and the Poincaré Conjecture*, Clay Math. Monographs 3 (2007), Corollary 0.2(a), the
special case of their Theorem 0.1 on closed `3`-manifolds whose fundamental group is a free product
of finite and infinite cyclic groups), stated as `nonempty_homeomorph_sphere_of_simplyConnected`;
the elliptization of closed `3`-manifolds with finite fundamental group (Morgan–Tian, Corollary
0.2(b)); and the comparison with Thurston's formulation through the eight model geometries
`TauCeti.ModelGeometry`: a closed orientable Seifert fibred manifold carries one of the six
geometries `S³`, `E³`, `S² × ℝ`, `ℍ² × ℝ`, `Nil`, `SL₂~` according to its Euler number and base
orbifold Euler characteristic, the `Sol` manifolds are the torus bundles and semi-bundles with
hyperbolic monodromy, and the remaining pieces are hyperbolic (Scott, §4).

The native formulation is that of Bessières–Besson–Boileau–Maillot–Porti (*Geometrisation of
3-manifolds*, Introduction). Prove that the prime decomposition (8.2) reduces every closed
orientable `3`-manifold to irreducible ones and `S¹ × S²`, so that the theorem describes all of
them; and that, conversely to the comparison above, a closed orientable `3`-manifold with one of
the eight geometries has a geometric torus decomposition: the empty one for the six Seifert
geometries and for `hyperbolic`, and for a `Sol` manifold the fibre torus of a torus bundle, which
cuts it into `T² × (0, 1)`, or the torus separating the two twisted `I`-bundles over the Klein
bottle of a semi-bundle, both cases with Seifert fibred pieces.

- `TauCeti.GeometrizationConjecture`: for every `M` given as a `MetricSpace`, charted on `ℝ³`,
  `IsManifold (𝓡 3) ∞`, compact, connected and `TauCeti.Orientable`, with
  `TauCeti.IsSphereBoundsBall M`,
  `∃ n (T : Fin n → C(S¹ × S¹, M)), IsGeometricTorusDecomposition T`.
  The components of the complement of the tori are open
  (`TauCeti.exists_opens_eq_connectedComponentIn_compl_iUnion_range`), each Seifert fibred or
  `TauCeti.IsFiniteVolumeHyperbolic`, and a connected Seifert fibred manifold is its own single
  piece (`TauCeti.isGeometricTorusDecomposition_of_isEmpty_of_isSeifertFibered`).

**The Poincaré conjecture from geometrization.** The route to the topological form from
`TauCeti.GeometrizationConjecture`: a closed simply connected `3`-manifold `M` has a smooth
structure (Layer 11.2) and is orientable, its fundamental group having no subgroup of index two, so
by Kneser's theorem (8.2) it is the iterated connected sum of a finite family of prime manifolds,
each simply connected, `π₁` of the sum being the free product of theirs (8.2, van Kampen). No
summand is `S¹ × S²`, whose `π₁` is `ℤ`, so each is irreducible (8.2). A simply connected summand
contains no incompressible torus (it is atoroidal, `TauCeti.isAtoroidal_of_simplyConnectedSpace`),
so its geometric torus decomposition is empty and it is Seifert fibred or finite-volume hyperbolic.
A closed hyperbolic manifold has infinite fundamental group, its universal cover `ℍ³` not being
compact (Layer 7.1), and a simply connected closed Seifert fibred space is homeomorphic to `S³`
(8.4's classification by Seifert invariants; Scott, Section 3, the classification of Seifert fibred
spaces with finite fundamental group), hence diffeomorphic to it (Layer 11.2). So every summand
would be diffeomorphic to `S³`, which is not prime (`TauCeti.not_isPrimeManifold_sphere`): the
family is empty, and `M` is diffeomorphic, hence homeomorphic, to `S³`
(`TauCeti.isIteratedConnectedSum_zero_iff`).

The smooth form of the Poincaré theorem is Poincare3D's, which consumes this roadmap's Layers 1,
2, 7 and 11 and states it twice: for closed simply connected smooth `3`-manifolds (its Layer 13)
and on Mathlib's statement `ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere M 3` (its target
15.2), with the comparison of `M ≃ₕ S³` with closed simple connectivity in its Layer 1.1 (Hatcher,
*Notes on Basic 3-Manifold Topology*, Proposition 3.7, for one direction; Hatcher, *Algebraic
Topology*, Proposition 3.29, the vanishing of `H₃` of a noncompact connected `3`-manifold, for
compactness in the other). This layer states only the topological form; the passage from it to
the smooth form is the uniqueness of smoothings in dimension three of Layer 11.2.

- Poincaré, topological form (`nonempty_homeomorph_sphere_of_simplyConnected`): `∀ M` closed
  topological `3`-manifold with `SimplyConnectedSpace M`, `Nonempty (M ≃ₜ S³)`.

**The eight model geometries.** Consume `TauCeti.ModelGeometry`, the inductive type with the eight
constructors `spherical`, `euclidean`, `hyperbolic`, `sphereProd` (`S² × ℝ`), `hyperbolicProd`
(`ℍ² × ℝ`), `sl2Tilde`, `nil` and `sol`, each with its model space `TauCeti.ModelGeometry.Space` and
isometry group, and `TauCeti.HasGeometricStructure M G`: `M` is homeomorphic to `G.Space / Γ` for a
subgroup `Γ` of `Isom(G.Space)` acting freely and properly discontinuously (Scott, *The geometries
of 3-manifolds*, Bull. London Math. Soc. 15 (1983), Sections 1 and 4; Thurston, *Three-Dimensional
Geometry and Topology*, Sections 3.4 and 3.8). It is invariant under homeomorphism
(`Homeomorph.hasGeometricStructure_iff`), holds for `G.Space` itself
(`TauCeti.hasGeometricStructure_space`) and for every free properly discontinuous quotient
(`TauCeti.hasGeometricStructure_quotient`), and makes `M` an `(Isom X, X)`-manifold, hence smooth
with a Riemannian metric (`TauCeti.HasGeometricStructure.exists_hasGroupoid`); the lens spaces are
spherical natively (`TauCeti.LensSpace.hasGeometricStructure_spherical`). Prove the comparison with
the metric description: for a closed `3`-manifold, `HasGeometricStructure M G` holds exactly when
`M` admits a smooth structure and a complete Riemannian metric for it locally isometric to `G.Space`
(Thurston, Section 3.4, the developing map, every model space being simply connected), and in
particular, for a closed connected smooth `3`-manifold,
`HasGeometricStructure M .hyperbolic ↔ IsHyperbolic M`: the native
`TauCeti.HasGeometricStructure.exists_isHyperbolic` gives a hyperbolic metric for the smooth
structure pulled back from the model, Layer 11.2 transports it to that of `M`, and Layer 7.1 gives
the converse. Prove that a closed `3`-manifold has at most one of the eight geometries (Scott,
Section 5), that a closed manifold with one of the six geometries other than `hyperbolic` and `sol`
is Seifert fibred (Scott, Sections 4 and 5), and that every closed `sol` manifold is finitely
covered by a torus bundle over the circle with Anosov monodromy (Scott, Section 4).

- The geometry of a closed geometric `3`-manifold is determined by its fundamental group (Scott,
  Section 5): `π₁` is finite exactly for `spherical`, virtually infinite cyclic for `sphereProd`,
  virtually `ℤ³` for `euclidean`, virtually nilpotent and not virtually abelian for `nil`, and
  virtually solvable and not virtually nilpotent for `sol`; among the remaining three, `π₁` has an
  infinite cyclic normal subgroup for `hyperbolicProd` and `sl2Tilde` and none for `hyperbolic`,
  and it is virtually a product `ℤ × π₁(Σ_g)` with `g ≥ 2` for `hyperbolicProd` and not for
  `sl2Tilde`.

**Checks.**
- *Decomposition versus geometries.* A torus bundle with Anosov monodromy has `Sol` geometry as a
  whole, while its JSJ and geometric torus decompositions are the fibre, with piece `T² × (0, 1)`.
- *Irreducibility.* A closed orientable `3`-manifold with `π₁ = ℤ` is `S¹ × S²`, not irreducible;
  the hypothesis `TauCeti.IsSphereBoundsBall` excludes it, and 8.2 reduces the closed case to
  irreducible manifolds.
- *Poincaré homology sphere.* Its fundamental group has order `120`, so by elliptization it is
  `S³/Γ` for the binary icosahedral group `Γ`; it is not simply connected, so the Poincaré
  conjecture does not identify it with `S³`.
- *Only `S³` is simply connected.* The Poincaré homology sphere is Seifert fibred with the
  spherical geometry, a homology sphere to which neither form of the Poincaré conjecture applies;
  `S² × S¹` has `π₁ = ℤ`. Among these examples only `S³` satisfies the hypothesis, which is the
  content of the theorem.
- *Empty decompositions.* `S³` is Seifert fibred (the Hopf fibration), so the empty family is a
  geometric torus decomposition of it, and `S³` is spherical; `T³` is Seifert fibred with the
  empty decomposition and Euclidean; the Weeks manifold is hyperbolic with the empty
  decomposition.
- *Two Seifert geometries.* The product `Σ₂ × S¹` is Seifert fibred with the `ℍ² × ℝ` geometry
  (base of negative orbifold Euler characteristic, Euler number `0`); the unit tangent bundle of
  `Σ₂` is Seifert fibred with the `sl2Tilde` geometry (nonzero Euler number, of absolute value
  `|χ(Σ₂)| = 2`); both have the empty decomposition.
- *Freeness.* `E³/ℤ³ = T³` has a Euclidean structure: `ℤ³` acts freely and properly
  discontinuously by translations. The group `{±I} ⊆ Isom(E³)` is discrete but `−I` fixes the
  origin, so the action is not free and `E³/{±I}`, the cone on `ℝP²`, is excluded by the
  definition; it is not a manifold (the link of the vertex is `ℝP²`, with `H₁ = ℤ/2`, not a
  sphere).
- *Lens spaces and `S² × S¹`.* `S³/(ℤ/p)` with `ℤ/p` acting by `(z, w) ↦ (ζz, ζ^q w)` is the lens
  space `L(p, q)`, spherical natively; `S² × S¹` is `(S² × ℝ)/ℤ`, with the `sphereProd` geometry,
  and is not spherical since its `π₁` is infinite.
- *One geometry each.* `T³` has the Euclidean geometry and not the hyperbolic one (Layer 7.2), so
  the "at most one geometry" statement is consistent; `S³` has the spherical geometry and no
  other, since every other model space is non-compact and a compact quotient of a non-compact
  simply connected model space has infinite `π₁`.

*Needs:* Tau Ceti `TauCeti.GeometrizationConjecture`, `TauCeti.IsGeometricTorusDecomposition`,
`TauCeti.IsFiniteVolumeHyperbolic`, `TauCeti.ModelGeometry`, `TauCeti.HasGeometricStructure`;
Layer 7.1, Layer 7.3, Layer 8.2, Layer 8.4, Layer 8.5; Mathlib `SimplyConnectedSpace`.
For the Poincaré route and the eight geometries also Tau Ceti
`TauCeti.ModelGeometry.Space`, `Homeomorph.hasGeometricStructure_iff`,
`TauCeti.hasGeometricStructure_space`, `TauCeti.hasGeometricStructure_quotient`,
`TauCeti.HasGeometricStructure.exists_hasGroupoid`,
`TauCeti.HasGeometricStructure.exists_isHyperbolic`,
`TauCeti.LensSpace.hasGeometricStructure_spherical`, `TauCeti.IsHyperbolic`,
`TauCeti.exists_opens_eq_connectedComponentIn_compl_iUnion_range`,
`TauCeti.isGeometricTorusDecomposition_of_isEmpty_of_isSeifertFibered`,
`TauCeti.isAtoroidal_of_simplyConnectedSpace`, `TauCeti.KneserPrimeDecompositionTheorem`,
`TauCeti.not_isPrimeManifold_sphere`, `TauCeti.isIteratedConnectedSum_zero_iff`,
`TauCeti.Orientable`, `TauCeti.IsSphereBoundsBall`; Mathlib `Diffeomorph`, `Metric.sphere`,
`IsCoveringMap`, `ProperlyDiscontinuousSMul`; Layer 7.2 (the hyperbolic carriers); Layer 11.2
(smoothing and the uniqueness of smooth structures in dimension three) and Layer 11.3 (the unique
PL structure of a smooth manifold); HopfRinow Layer 1 (completeness and the exponential map, for
the developing map); AlgebraicTopology Stage 1 (van Kampen).

### Examples

`S¹ × S²` as the prime non-irreducible manifold; `T³` and the Anosov torus bundle as contrasting
JSJ examples; the trefoil and figure-eight exteriors as Seifert fibred and hyperbolic knot
exteriors; the Poincaré homology sphere.
`T³`, the Weeks manifold, two glued trefoil exteriors and the Anosov torus bundle as JSJ and
geometric examples; `L(2, 1) # L(3, 1)` for prime decompositions; the lens spaces as spherical
manifolds; the Poincaré homology sphere as a spherical manifold that is not simply connected;
`Σ₂ × S¹` and the unit tangent bundle of `Σ₂` for two Seifert geometries.

### Dependencies

Layer 1 (connected sums, gluing), Layer 5 (exteriors, fillings), Layer 7 (hyperbolic structures),
Layer 11.2 (PL structures in dimension three); Tau Ceti's irreducibility, incompressibility,
Seifert fibration, torus decomposition and geometrization carriers; Layer 1.7.
Also Layer 2.1 (locally flat tori), Layer 11.2 (Moise's theorem, for Kneser's finiteness in 8.2,
and the uniqueness of smooth structures, for the Poincaré route and the eight geometries) and
Layer 11.3;
Tau Ceti's model geometries, geometric structures and prime-manifold declarations; HopfRinow
Layer 1 (the developing map, for the eight geometries); AlgebraicTopology Stage 1 (van Kampen).

## Layer 9: Heegaard splittings

### 9.1 Handlebodies and Heegaard splittings

Handlebodies and Heegaard splittings are Tau Ceti's (*From Tau Ceti*): the standard handlebody
`TauCeti.handlebody g`, the closed disc with `g` holes times `[−1, 1]`, a ball for `g = 0` and a
solid torus for `g = 1`, with free fundamental group of rank `g` and path-connected boundary
surface carrying its fundamental group; and `TauCeti.HeegaardSplitting M`, two closed subsets
covering `M`, each homeomorphic to `TauCeti.handlebody g` for a common genus `g`, meeting in their
common frontier, with exchange and transport along homeomorphisms; the genus-zero splitting of
`S³` into hemispheres. None of this is planned again here; the pinned splitting records no
gluing map. Prove that the frontier of a splitting of a closed `3`-manifold is a closed
orientable surface of genus `g` and that the splitting is recovered, up to homeomorphism, from
the gluing `φ` of the two boundary surfaces, which reverses the induced orientations (Layer 1.3);
that every closed connected orientable `3`-manifold has a Heegaard splitting, from a
triangulation (Layer 11.2) as the regular neighbourhoods of the `1`-skeleton and of the dual
`1`-skeleton (Scharlemann, *Heegaard splittings of compact 3-manifolds*, arXiv math/0007144,
§2.1); that isotopic gluing maps give homeomorphic manifolds and `φ` matters only through its
mapping class (Layer 1.7.2); and that a splitting may be stabilized by adding a trivial handle,
raising the genus by one. Non-orientable closed `3`-manifolds split into non-orientable
handlebodies (boundary sums of solid Klein bottles), which are not instances of the pinned
carrier.

The pinned carriers in detail (Hempel, *3-Manifolds*, Chapter 2; Scharlemann, Sections 1 and 2):
the standard handlebody `TauCeti.handlebody g ⊆ ℂ × ℝ` is the product of the planar surface
`TauCeti.planarSurface g` (the closed disc of radius `g + 1` with `g` open discs of radius `1/2`
removed about the real points `2k + 1 − g`) with `[−1, 1]`; it is compact and closed,
`handlebody 0` is the closed unit ball and `handlebody 1` is homeomorphic to the solid torus
(`TauCeti.handlebody_zero`, `TauCeti.nonempty_homeomorph_handlebody_one`), its fundamental group
is free of rank `g` at every base point
(`TauCeti.nonempty_fundamentalGroup_handlebody_mulEquiv_freeGroup`,
`TauCeti.rank_fundamentalGroup_handlebody_le`), and its frontier is path connected and carries
its fundamental group (`TauCeti.isPathConnected_frontier_handlebody`,
`TauCeti.fundamentalGroup_map_frontier_handlebody_surjective`). A splitting
`TauCeti.HeegaardSplitting M` of a space `M` has a `genus` `g` and two subsets `left` and
`right` covering `M`, each homeomorphic to `handlebody g`, whose intersection is the frontier of
each (in a `3`-manifold without boundary, their common boundary surface, by invariance of
domain), with `symm`, transport along homeomorphisms (`transHomeomorph`) and the constructor
`ofIsClosed` from two closed handlebodies covering `M` whose intersection lies in the closure of
the complement of each. Prove that `handlebody g` is a compact orientable `3`-manifold with
boundary once the corners of the product are rounded (Layers 1.1 and 1.3), diffeomorphic to `D³`
with `g` orientable `1`-handles attached (Layer 1.3), and that its frontier in `ℂ × ℝ` is a closed
connected orientable surface of genus `g` (two copies of the planar surface and `g + 1`
annuli). The existence theorem above supplies the instance `Nonempty (HeegaardSplitting M)` on
every closed connected orientable `3`-manifold, which the native Heegaard genus of 9.2 needs;
native instances exist for `S³`, `S¹ × S²` and the lens spaces.

**Non-orientable splittings.** Define the **non-orientable handlebody** `H_g^−` as `D³` with `g`
`1`-handles of which at least one is attached by an orientation-reversing map (Scharlemann,
Section 1: for `g ≥ 1` there are exactly two handlebodies of genus `g` up to diffeomorphism,
since any other non-orientable handle can be slid over a non-orientable one), and prove that
`π₁(H_g^−)` is free of rank `g`. Define a **non-orientable Heegaard splitting** in the shape of
`TauCeti.HeegaardSplitting`, with both pieces homeomorphic to `H_g^−`, and prove that every
closed connected non-orientable `3`-manifold has one (Scharlemann, Section 2.1: from a
triangulation, Moise's theorem of Layer 11.2, take regular neighbourhoods of the `1`-skeleton
and of the dual `1`-skeleton; each carries the fundamental group of `M`, hence its orientation
character, and so is non-orientable).

- Reidemeister–Singer: any two Heegaard splittings of `M` become isotopic after finitely many
  stabilizations of each (Scharlemann, §3).
- Waldhausen: every positive-genus splitting of `S³` is a stabilization of the genus-zero one
  (Waldhausen, Topology 7 (1968); Scharlemann, Theorem 3.7).
- A Heegaard splitting of genus `g` presents `M` as two handlebodies meeting in a closed surface
  of genus `g`, the frontier of each; the splitting surface is bicollared (Layer 2.1).
- Existence for every closed connected `3`-manifold: a native splitting when `M` is orientable, a
  non-orientable one otherwise.
- A union of two orientable handlebodies along a connected closed surface is orientable, so a
  non-orientable `M` has no `HeegaardSplitting` and needs `H_g^−`.

**Checks.**
- *The gluing map matters.* `S¹ × S²` and `S³` are each two solid tori, glued by the identity and
  by the factor swap of Layer 1.3; the swap is not isotopic to the identity of the torus.
- *Genus zero and one.* The genus-zero handlebody is a ball (`TauCeti.nonempty_homeomorph_handlebody_zero`),
  and `S³` is two balls, its hemisphere splitting; the genus-one handlebody is the solid torus
  (`TauCeti.nonempty_homeomorph_handlebody_one`).
- *Lens spaces.* `L(p, q)` is two solid tori glued by a map sending the meridian to a `(p, q)`
  curve, a genus-one splitting.
- *The native splittings.* `S³` has the genus-zero splitting into two closed hemispheres
  (`TauCeti.hemisphereHeegaardSplitting`) and the genus-one splitting into the solid tori
  `‖z‖ ≤ ‖w‖` and `‖w‖ ≤ ‖z‖` of `S³ ⊆ ℂ²` (`TauCeti.cliffordHeegaardSplitting`); `S¹ × S²` has
  the genus-one splitting into the solid tori over the two closed hemispheres of `S²`
  (`DehnFilling.heegaardSplitting` of the `0`-surgery on the unknot, Layer 5.2); the lens space
  `L(p; ℓ₀, ℓ₁)` has the genus-one splitting into the images of the two Clifford solid tori
  (`LensSpace.heegaardSplitting`), whose gluing sends the meridian of one solid torus to the
  `(p, q)` curve of the other.
- *A non-orientable manifold.* `ℝP² × S¹` is closed and non-orientable;
  `HeegaardSplitting (ℝP² × S¹)` is empty, since the union of two orientable handlebodies along a
  connected surface is orientable, so every splitting of it is a non-orientable one. Its
  fundamental group `ℤ/2 × ℤ` has rank `2`, so its non-orientable genus (9.2) is at least `2`.
- *One genus.* Two subsets homeomorphic to handlebodies of different genera cannot form a
  splitting: the structure carries one `genus`, and the frontiers, closed surfaces of genus `g`
  and `h`, would have to coincide.
- *Overlapping solid tori.* The closed solid tori `L = {‖z‖ ≤ ‖w‖}` and `R = {‖w‖ ≤ 2‖z‖}` of
  `S³ ⊆ ℂ²` cover `S³` and are each homeomorphic to `handlebody 1`, but they do not form a
  splitting: they meet in the thickened torus `1/5 ≤ ‖z‖² ≤ 1/2`, whose points with
  `1/5 < ‖z‖² < 1/2` lie in the interiors of both, so neither `L ∩ R ⊆ closure Lᶜ` nor
  `L ∩ R ⊆ closure Rᶜ` holds and `ofIsClosed` does not apply; the frontier of `L` is the torus
  `‖z‖ = ‖w‖`, strictly smaller than `L ∩ R`.

*Needs:* Layer 1.3, Layer 1.7, Layer 1.7.2, Layer 11.2; Tau Ceti `TauCeti.handlebody`,
`TauCeti.HeegaardSplitting`, `TauCeti.Orientable`, `TauCeti.planarSurface`,
`HeegaardSplitting.ofIsClosed`, `HeegaardSplitting.symm`, `HeegaardSplitting.transHomeomorph`,
`TauCeti.hemisphereHeegaardSplitting`, `TauCeti.cliffordHeegaardSplitting`,
`LensSpace.heegaardSplitting`, `DehnFilling.heegaardSplitting`,
`TauCeti.nonempty_fundamentalGroup_handlebody_mulEquiv_freeGroup`,
`TauCeti.fundamentalGroup_map_frontier_handlebody_surjective`; Layer 1.1 (corners and the
boundary manifold), Layer 2.1 (bicollars), Layer 5.2 (the `0`-surgery on the unknot); Mathlib
`Homeomorph`, `FundamentalGroup`; AlgebraicTopology Stage 1 (van Kampen, for `π₁(H_g^−)`).

### 9.2 Heegaard genus, rank and Li's theorem

The Heegaard genus is Tau Ceti's `TauCeti.heegaardGenus M`, the least genus of a Heegaard
splitting of a space with `[Nonempty (TauCeti.HeegaardSplitting M)]`, a topological invariant
with `heegaardGenus S³ = 0`; the bound `rank π₁(M) ≤ g(M)` for a boundaryless manifold charted on
a three-dimensional space with finitely generated `π₁` is
`TauCeti.rank_fundamentalGroup_le_heegaardGenus`, by van Kampen through the free group of a
handlebody. Waldhausen's rank-versus-genus conjecture is the pinned
`TauCeti.RankGenusConjecture`, and Li's theorem, that for every `n` some closed orientable
hyperbolic `3`-manifold has `g(M) > rank π₁(M) + n` (Li, *Rank and genus of 3-manifolds*,
J. Amer. Math. Soc. 26 (2013), Theorem 1.1), is the pinned proposition
`TauCeti.LiRankGenusTheorem`, which refutes it; `Suggested.lean` states Li's theorem as
`li_rank_genus_theorem`. None of this is planned again here. With the existence theorem of
Layer 9.1 supplying the instance on every closed connected orientable `3`-manifold, prove
`g(M) = 0` iff `M ≅ S³`, `g(M) = 1` iff `M` is a lens space `L(p, q)` with `p ≥ 2` or `S¹ × S²`,
and `g(M # N) ≤ g(M) + g(N)` by summing splittings along balls meeting the splitting surfaces in
discs (Scharlemann, §3.2), with equality by Haken's lemma, that every splitting of a reducible
manifold admits a reducing sphere meeting the splitting surface in a single circle
(Scharlemann, Theorem 3.4), which decomposes a splitting of `M # N` as a sum of splittings of `M`
and of `N`.

The native carriers in detail: `TauCeti.heegaardGenus M` is defined under
`[Nonempty (HeegaardSplitting M)]` as a `Nat.find`, so that it never silently takes a junk value
(`TauCeti.heegaardGenus_le`, `TauCeti.exists_genus_eq_heegaardGenus`,
`TauCeti.heegaardGenus_eq_zero_iff`, `TauCeti.heegaardGenus_congr` under homeomorphism, and
`TauCeti.heegaardGenus_sphere : heegaardGenus S³ = 0`). For a manifold without boundary charted
on a three-dimensional real normed space with a Heegaard splitting, the inclusion of either
handlebody surjects on fundamental groups
(`HeegaardSplitting.fundamentalGroup_map_left_surjective`, van Kampen for the cover by one
handlebody thickened along a neighbourhood of the frontier that deformation retracts onto it and
the other handlebody), so `π₁(M, x)` is finitely generated
(`HeegaardSplitting.fg_fundamentalGroup`) and `Group.rank (π₁(M, x)) ≤ heegaardGenus M` at every
base point; with the existence theorem of 9.1 these apply to every closed connected orientable
`3`-manifold. Waldhausen's conjecture `TauCeti.RankGenusConjecture` asserts that every closed
orientable `3`-manifold has finitely generated `π₁`, a Heegaard splitting, and Heegaard genus
equal to the rank at every base point. `TauCeti.LiRankGenusTheorem` asserts, for every `n`, a
closed connected orientable hyperbolic `3`-manifold `M` (`TauCeti.IsHyperbolic`, Layer 7.2) with a
base point `x`, finitely generated `π₁(M, x)`, a Heegaard splitting, and
`rank π₁(M, x) + n < heegaardGenus M` (Li, Theorem 1.1: a closed orientable hyperbolic
`3`-manifold with rank smaller than genus, the discrepancy being arbitrarily large; the bounded
version, Theorem 1.2, gives a compact irreducible atoroidal `M` with connected boundary and
`r(M) < g(M)`); the case `n = 0` refutes Waldhausen's conjecture, which is the native
`LiRankGenusTheorem.not_rankGenusConjecture` and is consumed. Define the **genus of a
non-orientable closed `3`-manifold** as the least genus of a non-orientable splitting (9.1) and
prove the rank inequality for it by the same argument.

- `heegaardGenus M` is a natural number; `heegaardGenus S³ = 0`, and `heegaardGenus M = 0` only
  for `M ≃ₜ S³` (two closed balls meeting in their common boundary sphere are the cone extension
  of a homeomorphism of `S²`).
- `π₁(M)` is finitely generated and `rank π₁(M) ≤ heegaardGenus M`.
- Li: for every `n` a closed orientable hyperbolic `M` with `rank π₁(M) + n < heegaardGenus M`;
  `n = 0` gives `rank < genus`.

**Checks.**
- *The genus-one clause.* `L(1, q) ≅ S³` has genus `0` although it has a genus-one splitting,
  stabilized from the genus-zero one; hence `p ≥ 2`.
- *Rank meets genus.* `g(T³) = 3 = rank ℤ³`, the rank giving the lower bound and the standard
  splitting the upper.
- *Low genus.* `g(S³) = 0 = rank 1`, `g(S¹ × S²) = 1 = rank ℤ` and `g(L(p, q)) = 1 = rank ℤ/p` for
  `p ≥ 2`.
- *Not homological.* The Poincaré homology sphere has `g = 2` and rank `2`, while `S³` has `g = 0`,
  so the Heegaard genus is not determined by the homology.
- *Native equalities.* `S³`: genus `0` and rank `0`, the rank of the trivial group
  (`TauCeti.exists_heegaardGenus_sphere_eq_rank`). The lens spaces `TauCeti.LensSpace m ℓ` with
  `m ≠ 1` and `S¹ × S²`: genus `1` (`LensSpace.heegaardGenus_eq_one`,
  `TauCeti.heegaardGenus_circle_prod_sphere`: the genus-one splitting bounds the genus above and
  the nontrivial cyclic `π₁` bounds it below) and rank `1`.
  `T³`: genus `3 = rank ℤ³`. So the inequality is an equality in all these cases, and the gap of
  Li's theorem is a strict statement about other manifolds.
- *The Poincaré sphere.* `π₁` is the binary icosahedral group, of rank `2`, and the genus is `2`:
  it is `+1` surgery on the trefoil, a genus-two manifold, and not a lens space.
- *The quantifier.* With `n = 0`, Li's theorem gives `rank < genus`; with `n = 1` it gives a
  manifold whose genus exceeds its rank by at least two, which the `n = 0` statement does not
  provide, so the quantified form is strictly stronger than the existential one; `rank + n < genus`
  is `genus − rank ≥ n + 1`, so a gap of at least `k` is the case `n = k − 1`.
- *No junk value.* `heegaardGenus (ℝP² × S¹)` is not defined, since `HeegaardSplitting (ℝP² × S¹)`
  is empty (9.1): the instance hypothesis is what keeps the native genus from a junk value; the
  non-orientable genus covers it, with value at least `2`.

*Needs:* Layer 9.1, Layer 7.3, Layer 8.2; Tau Ceti `TauCeti.heegaardGenus`,
`TauCeti.rank_fundamentalGroup_le_heegaardGenus`, `TauCeti.LiRankGenusTheorem`; Mathlib
`Group.rank`, `FundamentalGroup`, `Group.FG`, `Nat.find`; Tau Ceti `heegaardGenus_le`,
`exists_genus_eq_heegaardGenus`, `heegaardGenus_eq_zero_iff`, `heegaardGenus_congr`,
`heegaardGenus_sphere`, `HeegaardSplitting.fg_fundamentalGroup`, `TauCeti.RankGenusConjecture`,
`LiRankGenusTheorem.not_rankGenusConjecture`, `LensSpace.heegaardGenus_eq_one`,
`TauCeti.heegaardGenus_circle_prod_sphere`, `TauCeti.IsHyperbolic`; Layer 7.2 (closed hyperbolic
`3`-manifolds, for Li's theorem); AlgebraicTopology Stage 1 (van Kampen).

### Examples

The genus-zero and genus-one splittings of `S³`; `S¹ × S²` and the lens spaces as genus-one
manifolds; `T³` as a genus-three manifold.
The native splittings of these manifolds (9.1); `ℝP² × S¹` as the non-orientable case; `T³` with
genus equal to its rank `3`.

### Dependencies

Tau Ceti's handlebodies, Heegaard splittings, Heegaard genus, rank bound and Li's proposition;
Layer 1.3 (gluing), Layer 1.7 (surfaces), Layer 11.2 (triangulations), Layer 8.2 (prime
decomposition), Layer 7.3 (hyperbolic manifolds for Li's examples); Layer 1.7.2 (mapping classes);
Mathlib's group rank.
Also Layer 1.1 (corners), Layer 2.1 (bicollars), Layer 5.2 (the `0`-surgery on the unknot behind
the native splitting of `S¹ × S²`), Layer 7.2 (hyperbolic manifolds for Li's theorem) and
AlgebraicTopology Stage 1 (van Kampen); the native handlebodies, splittings, genus, rank inequality
and rank-versus-genus declarations of the supplier contracts.

## Layer 10: foliations of 3-manifolds

Foliations are Tau Ceti's at the pin (*From Tau Ceti*): `TauCeti.Foliation I n M k` is a `C^n`
foliation of leaf dimension `k` given by an involutive distribution with flat charts, with its
leaves, closed transversals, tautness and the linear foliations of a vector space. This layer
develops codimension-one foliations of closed `3`-manifolds up to Novikov's theorem.
The Thom pair and the Euler class of a real vector bundle, the Euler class of the tangent field of
a foliation, the Euler class inequality on embedded surfaces, and the statements of Thurston's
inequality, the Euler class one conjecture and Yazdi's theorem in their closed hyperbolic forms are
Tau Ceti's as well. On them the layer builds the Euler class of an oriented plane bundle and of a
transversely oriented foliation (10.3) and the Thurston norm of a closed oriented `3`-manifold with
its dual norm (10.4), and states Thurston's Euler class inequality, Gabai's realization theorem
and Yazdi's theorem against them (10.5).

### 10.1 Codimension-one foliations, Reeb components and Reeb stability

Define a transversely oriented codimension-one foliation of a closed orientable `3`-manifold as a
`TauCeti.Foliation` of leaf dimension `2` together with a nowhere vanishing vector field
transverse to its leaves. Define the Reeb component, the foliation of the solid torus `S¹ × D²`
whose boundary torus is a leaf and whose interior leaves are planes spiralling towards the
boundary, and the Reeb foliation of `S³` as the union of two Reeb components glued along the
torus of Layer 1.3. Prove Reeb stability: if a transversely oriented codimension-one foliation of
a closed connected orientable `3`-manifold has a compact leaf with finite fundamental group, then
that leaf is a sphere, the manifold is `S² × S¹` and the foliation is the product foliation (Reeb;
Calegari, *Foliations and the Geometry of 3-Manifolds*, Theorem 4.5, stated for a spherical leaf
under the book's standing convention that manifolds and foliations are oriented and co-oriented:
in an orientable manifold a transversely oriented leaf is two-sided, hence orientable, and an
orientable closed surface with finite fundamental group is a sphere). Prove the existence theorem: every
closed orientable `3`-manifold has a transversely oriented codimension-one foliation (Lickorish,
*A foliation for 3-manifolds*, Ann. of Math. 82 (1965), through the Lickorish–Wallace surgery
description of Layer 5.2 and the insertion of Reeb components along the surgery solid tori).

The pinned carrier in detail: `TauCeti.Foliation I n M k` is a `Cⁿ` foliation of rank `k` of a
`C^{n+1}` manifold given by its involutive `Cⁿ` tangent distribution (`1 ≤ n`;
`TauCeti.IsContMDiffDistribution`, `TauCeti.IsInvolutiveDistribution`), with the flat charts and
the Frobenius theorem of DifferentialGeometry Layer 4; its leaves `Foliation.leaf F x` are the
classes of the equivalence relation generated by `C¹` curves on compact intervals tangent to the
distribution, which on a boundaryless manifold are the maximal connected integral manifolds; and
it is taut (`Foliation.Taut`) when every point lies on a leaf met by a `C¹` closed transversal, a
`1`-periodic `C¹` curve whose velocity is nonzero and complementary to the tangent distribution at
every parameter (`Foliation.IsClosedTransversal`; Calegari, Chapter 4; Candel–Conlon,
*Foliations I*). A codimension-one foliation of a `3`-manifold is a `Foliation I n M 2`. Prove
that a transverse orientation is equivalently an orientation of the normal line bundle `TM/TF`: a
nowhere vanishing transverse vector field orients it, and an orientation of it lifts, through a
partition of unity, to such a field; the foliation is transversely oriented when one is chosen.
Prove that the tangent plane field `TF` of a transversely oriented foliation of an oriented
`3`-manifold is an oriented plane bundle, an oriented rank-two subbundle of `TM`, the input of
10.3.

- A foliation with a Reeb component is not taut: a transversal cannot leave the solid torus.
- The leaves of a codimension-one foliation of a compact manifold are either compact or
  accumulate on a minimal set; a compact leaf of a taut foliation is incompressible (Layer 10.2).
- The model argument is the native `TauCeti.not_taut_ofSubmodule_ker`: the foliation
  `Foliation.ofSubmodule` of a normed space by the cosets of the kernel of a functional is not
  taut, since the functional is a global first integral and Rolle's theorem rules out closed
  transversals; in a Reeb component the boundary torus leaf meets no closed transversal, since a
  transversal entering the component cannot leave it (Calegari, Chapter 4).

**Checks.**
- *The Reeb foliation.* The Reeb foliation of `S³` is not taut; its gluing torus is its only
  compact leaf and is compressible, consistent with Layer 10.2.
- *Sphere leaves.* The product foliation of `S² × S¹` by spheres is taut, with closed
  transversal `{pt} × S¹`; Reeb stability says it is the only transversely oriented foliation of
  a closed orientable `3`-manifold with a sphere leaf.
- *Orientability.* The product foliation of `ℝP² × S¹` is transversely oriented, with leaf `ℝP²` of
  finite fundamental group, and the sphere fibration of the nonorientable `S² ×̃ S¹` is
  transversely oriented with sphere leaves; neither manifold is `S² × S¹`, so Reeb stability
  needs the orientability of the manifold.
- *Sphere leaves are allowed.* The product foliation of `S² × S¹` by the spheres `S² × {t}` has no
  Reeb component, and its leaves are spheres, which the definition of tautness allows.
- *Planes in `ℝ³`.* The foliation of `ℝ³` by horizontal planes is not taut
  (`not_taut_ofSubmodule_ker`): the height of a closed `C¹` curve has a critical point, where the
  velocity lies in the plane; this is the local picture behind the Reeb component.
- *Rank one is not codimension one.* A foliation of a closed `3`-manifold by circles (a Seifert
  fibration with all fibres regular) is a rank-one foliation, excluded from codimension one by the
  rank in `Foliation I n M k`.

*Needs:* Tau Ceti `TauCeti.Foliation`, `TauCeti.Foliation.leaf`, `TauCeti.Foliation.Taut`,
`TauCeti.Foliation.IsClosedTransversal`, `TauCeti.Foliation.ofSubmodule`; DifferentialGeometry
Layer 4 (Frobenius), Layer 3 (flows); Layer 1.3, Layer 5.2; Tau Ceti
`TauCeti.not_taut_ofSubmodule_ker`, `TauCeti.IsContMDiffDistribution`,
`TauCeti.IsInvolutiveDistribution`, `TauCeti.Orientable`, `TauCeti.SolidTorus`; Mathlib
`TangentBundle`.

### 10.2 Novikov's theorem and taut foliations

Prove the Novikov–Rosenberg theorem: if a closed orientable `3`-manifold `M` carries a taut
transversely oriented codimension-one foliation and `M` is not finitely covered by `S² × S¹`, then
`M` is irreducible, every leaf is incompressible (the inclusion is injective on `π₁`), and every
closed transversal is essential in `π₁(M)` (Novikov, Trudy Moskov. Mat. Obšč. 14 (1965); Calegari,
Theorem 4.35). Prove Novikov's theorem proper: a codimension-one foliation of a closed
`3`-manifold with a null-homotopic closed transversal, or with a leaf whose inclusion is not
injective on `π₁`, has a Reeb component (Calegari, §4.6). Prove that a fibration of `M` over the
circle by closed surfaces is a taut foliation, and that a taut foliation pulls back to a taut
foliation under finite covers.
Prove that a taut foliation of a closed `3`-manifold has, through every leaf, a smooth closed
transversal, by smoothing the native `C¹` closed transversal while keeping it transverse (the
approximation theorems of Hirsch, Chapter 2), so that the native tautness agrees with the
classical one; and that tautness is invariant under diffeomorphism and under reversal of the
transverse orientation.

- A closed connected orientable `3`-manifold with a taut transversely oriented codimension-one
  foliation that is not finitely covered by `S² × S¹` is aspherical with universal cover `ℝ³`:
  irreducible by the theorem, with infinite `π₁` since closed transversals are essential, and
  covered by `ℝ³` by Palmeira (*Open manifolds foliated by planes*, Ann. of Math. 108 (1978),
  109–131; Calegari, Theorem 4.38).
- The leaves of a taut foliation realize the Thurston norm of their homology class (Thurston;
  the norm is that of 10.4, and the statement is proved in 10.5 as the equality case of
  Thurston's inequality);
  5.4.1 exports the shared integral surface-minimum prefix independently of foliations.

**Checks.**
- *The excluded case.* The product foliation of `S² × S¹` is taut while `S² × S¹` is not
  irreducible, and its universal cover `S² × ℝ` is not `ℝ³` although `π₁ = ℤ` is infinite.
- *S³.* A taut foliation of `S³` would have an essential closed transversal in the trivial group
  `π₁(S³)`, so `S³` carries no taut foliation, although it carries the Reeb foliation.
- *Lens spaces.* `L(p, q)`, `p ≥ 2`, has finite fundamental group and is not finitely covered by
  `S² × S¹`, so it carries no taut foliation; it carries a Reeb foliation from its genus-one
  splitting (Layer 9.1).
- *Dense leaves.* The linear foliation of `T³` by the planes parallel to a plane `P ⊆ ℝ³` that
  contains no nonzero integer vector (`P` orthogonal to `(1, √2, √3)`, say) is taut, with a closed
  transversal given by a coordinate circle direction not in `P`; its leaves are dense planes, so
  tautness does not require compact leaves.

*Needs:* Layer 10.1, Layer 8.1, Layer 8.2, Layer 7.4 (fibrations), Layer 9.1; Tau Ceti
`TauCeti.FibersOverCircle`; Mathlib `FundamentalGroup`; Hirsch, Chapter 2 (smoothing).

### 10.3 The Euler class of an oriented plane bundle

Consume the native **Euler class** of a real vector bundle `E → B` with finite-dimensional fibre
`F`: the Thom pair `(E, E₀)`, `E₀` the complement of the zero section (`TauCeti.thomPair`); a
**Thom class** `u ∈ Hʳ(E, E₀)`, `r = dim F`, a relative class restricting to a generator on every
fibre pair `(E_b, E_b ∖ 0)` (`TauCeti.IsThomClass`); and the Euler class
`TauCeti.eulerClass n : Hⁿ(E, E₀) ⟶ Hⁿ(B)`, the restriction to `E` followed by the pullback along
the zero section, natural under maps of Thom pairs and under pullback (`eulerClass_naturality`,
`eulerClass_pullback`), carried to Thom classes by fibrewise isomorphisms
(`IsThomClass.singularCohomologyMap`), vanishing on a bundle with a nowhere-vanishing section
(`eulerClass_eq_zero_of_forall_ne_zero`) and on a trivial bundle of positive rank
(`eulerClass_trivial_eq_zero`) (Milnor–Stasheff, *Characteristic Classes*, Sections 9 and 10; in
the singular cohomology of AlgebraicTopology with general coefficients, integral cohomology being
the case `ModuleCat ℤ`). Prove the **rank-two Thom isomorphism**: an oriented real plane bundle
over a CW complex has exactly one integral Thom class compatible with the orientation, and `−u` is
the Thom class of the opposite orientation (Milnor–Stasheff, Theorem 10.4, in rank two); define
the **Euler class of an oriented plane bundle** `e(E) := eulerClass u` for that Thom class, so
that `e(Ē) = −e(E)`. Prove the **comparison with the obstruction-theoretic description**: `e(E)`
is the primary obstruction to a nowhere-vanishing section, the class of the cocycle that assigns
to a `2`-cell the degree on its boundary of a section over the `1`-skeleton (Milnor–Stasheff,
Chapter 12; Hatcher, *Vector Bundles and K-Theory*, Section 3). The Thom isomorphism in every
rank is CharacteristicClasses C2's; the rank-two case and this comparison are this roadmap's,
CharacteristicClasses C2 compares its rank-two Euler class with them, and this subsection consumes
nothing of CharacteristicClasses. Prove `e(E ⊕ F) = e(E) ∪ e(F)` for oriented plane bundles over
a space where both are defined, the Euler class of the rank-four sum being taken for the Thom class
`u_E × u_F`, the relative cross product restricted along the diagonal, and, for a closed oriented
surface `S`, `⟨e(TS), [S]⟩ = χ(S)` (Milnor–Stasheff, Corollary 11.12, for the tangent bundle).
Consume the **Euler class of a foliation**: the tangent field of a foliation `F` of rank `k` is a
rank-`k` vector bundle with Thom pair `Foliation.thomPair`, Thom classes `Foliation.IsThomClass`
and Euler class `Foliation.eulerClass`, and a class `e ∈ Hᵏ(M; ℤ)` is **an Euler class of `F`**
(`Foliation.IsEulerClass e`) when it is the Euler class of some Thom class of the tangent field;
negation (`IsEulerClass.neg`) and vanishing for a nowhere-zero tangent vector field
(`Foliation.eulerClass_eq_zero_of_forall_ne_zero`) are native. Prove that for a transversely
oriented codimension-one foliation `F` of a closed connected oriented `3`-manifold the transverse
orientation and the orientation of `M` orient `TF` (10.1), whose Thom class gives
`e(F) := e(TF)`, and that `F.IsEulerClass e` holds exactly for `e = ±e(F)`; a codimension-one
foliation of an oriented `M` with some Euler class in this sense is transversely orientable,
since a Thom class orients `TF` and hence `TM/TF`. Define the **pairing** `⟨e(F), [S]⟩ ∈ ℤ` with
the fundamental class of an embedded closed oriented surface `S` through the native
`HomologicalOrientation.evalFundamentalClass` (AlgebraicTopology's fundamental classes).

- `e` is a natural characteristic class of oriented plane bundles, with `e(trivial) = 0` and
  `e(TS²) ≠ 0`.
- `⟨e(TS), [S]⟩ = χ(S)` for every closed oriented surface; `⟨e(F), [S]⟩` depends only on the
  homology class of `S`.
- Reversing the orientation of `M` or the transverse orientation of `F` negates `e(F)`, and the
  native Euler classes of `F` are exactly `±e(F)`.

**Checks.**
- *Spheres and tori.* `e(TS²)` evaluates to `χ(S²) = 2` and `e(TT²) = 0 = χ(T²)`; the trivial
  plane bundle over `S²` has `e = 0 ≠ e(TS²)` (`eulerClass_trivial_eq_zero`), so `TS²` is not
  trivial (the hairy ball theorem as a corollary).
- *Leaves.* For the product foliation of `S² × S¹`, `TF` restricted to a sphere leaf is `TS²`, so
  `⟨e(F), [S² × pt]⟩ = 2`; for the foliation of `T³` by tori `T² × pt`, the pairing with a torus
  leaf is `0`.
- *The Hopf bundle.* The Hopf plane bundle over `S²` (the tautological bundle of `ℂP¹`, as a real
  plane bundle) has `e = ±1` times the generator, half of `e(TS²)` in absolute value, so the Euler
  class of `TS²` is twice a generator; this is the parity phenomenon of 10.5.
- *Orientability.* The non-orientable plane bundle over `S¹` that is the sum of the Möbius line
  bundle and a trivial line has no integral Thom class: the restriction to the fibre pair would
  change sign around the circle; so orientability is the hypothesis of the Thom isomorphism, and
  `IsThomClass` is empty there while `eulerClass` is still defined on every relative class.
- *Connectedness.* On a disconnected `M` the Thom classes of `TF` may change sign from one
  component to another, so the native Euler classes of `F` are more than `±e(F)`; the
  description of `F.IsEulerClass` needs `M` connected.

*Needs:* Mathlib `Topology.CWComplex`, `Bundle.TotalSpace` and vector bundles, `TangentBundle`;
the native `TauCeti.thomPair`, `TauCeti.IsThomClass`, `TauCeti.eulerClass` with its naturality
and vanishing, `Foliation.thomPair`, `Foliation.IsThomClass`, `Foliation.eulerClass`,
`Foliation.IsEulerClass`, `TauCeti.HomologicalOrientation.evalFundamentalClass`;
AlgebraicTopology Stage 4 (cellular cochains) and Stage 6 (cohomology, cup products, fundamental
classes, and the homological degree of 6.5, for the degree on the boundary circle of a `2`-cell of
a section over the `1`-skeleton); Layer 1.7 (closed surfaces); 10.1 (the tangent plane bundle of a
foliation).

### 10.4 The Thurston norm

The Thurston norm of a closed oriented `3`-manifold and its dual norm are owned here; the
seminorm on `H₂(M, ∂M; ℝ)` of a compact `3`-manifold with nonempty boundary, beyond the integral
surface minimum of 5.4.1, is GeometricTopology, Part II's. For a closed oriented `3`-manifold `M`
and a class `a ∈ H₂(M; ℤ)`, the **Thurston norm** `x(a) := min χ₋(S)`, over closed embedded
oriented surfaces `S ⊆ M` with `[S] = a`, where `χ₋(S) = Σ_i max(0, −χ(S_i))` over the components,
is the integral surface minimum of 5.4.1 for `∂M = ∅`: there every class is represented by an
embedded oriented surface (Poincaré duality and transversality to a map to `S¹`), so the minimum
exists. Prove that `x` extends to a seminorm on `H₂(M; ℝ)`, linear on rays and convex (Thurston,
*A norm for the homology of 3-manifolds*, Mem. AMS 59 (1986), Theorem 1; Yazdi, *On Thurston's
Euler class one conjecture*, Section 1). Define the **dual norm**
`x*(e) := sup {⟨e, a⟩ : x(a) ≤ 1}` on `H²(M; ℝ)`, possibly `+∞` when `x` is only a seminorm.
State that the unit ball of `x` is a finite-sided polyhedron whose dual ball has integral vertices
(Thurston, Theorem 2), and that the norm is also the least `χ₋` of a singular surface representing
the class (Gabai, *Foliations and the topology of 3-manifolds*, J. Differential Geom. 18 (1983),
Corollary 6.18); both are stated here and proved in GeometricTopology, Part II, and the
comparison below consumes them as stated. Prove the **comparison with the native Euler class
inequality**: for a closed orientable hyperbolic `3`-manifold `M`, on which `x` is a norm, and
`e ∈ H²(M; ℤ)`, `x*(e) ≤ 1` holds exactly when `TauCeti.EulerClassBounded e`, that is
`|⟨e, f_*[S]⟩| ≤ −χ(S)` for every closed connected oriented surface `S` with `χ(S) ≤ 0` and every
topological embedding `f : S → M`, and `x*(e) = 1` exactly when `TauCeti.EulerClassNormOne e`,
which adds equality on some embedded `S` with `χ(S) < 0`. From `x*(e) ≤ 1` to the bound:
`|⟨e, f_*[S]⟩| ≤ x(f_*[S]) ≤ −χ(S)`, the last step by Gabai's singular form of the norm, so that
a merely topological embedding is allowed. From the bound to `x*(e) ≤ 1`: a class `a` is
represented by an incompressible surface without sphere components (below), each component of
which is an embedded `S_i` with `χ(S_i) ≤ 0`, so `|⟨e, a⟩| ≤ Σ |⟨e, [S_i]⟩| ≤ Σ −χ(S_i) = x(a)`.
For the sharp forms: `x*(e) = 1` is attained on an integral class `a` with `|⟨e, a⟩| = x(a) > 0`
(the dual ball is a polyhedron), and the componentwise inequalities on a norm-minimizing
representative then are equalities, one of them with `χ(S_i) < 0`; conversely an embedded `S`
with `|⟨e, [S]⟩| = −χ(S) > 0` gives `x*(e) ≥ |⟨e, [S]⟩| / x([S]) ≥ 1`.

- `x(ka) = |k| x(a)`, `x(a + b) ≤ x(a) + x(b)`, `x(0) = 0`; `x` is a norm exactly when no nonzero
  class is represented by a union of spheres and tori.
- `x*` is finite exactly on the annihilator in `H²(M; ℝ)` of the kernel of `x`, and is a norm
  there; its unit ball is the convex hull of finitely many integral points (Thurston, Theorem 2,
  as stated above).
- For irreducible `M`, `x(a)` is attained by an incompressible surface with no sphere components;
  in general it is attained by an incompressible surface none of whose sphere components bounds
  a ball (Thurston, Section 2: compressions do not increase `χ₋`, and a sphere bounding a ball is
  discarded).
- On a closed hyperbolic `M`: `x*(e) ≤ 1 ↔ EulerClassBounded e` and
  `x*(e) = 1 ↔ EulerClassNormOne e`.

**Checks.**
- *Spheres are free.* `x([S²]) = 0` for a sphere class, since `χ₋(S²) = max(0, −2) = 0`; on
  `S² × S¹` the class `[S² × pt]` is nonzero with norm `0`, so `x` is a seminorm and not a norm
  there, and `x*` is infinite on classes pairing nontrivially with it.
- *Fibres and tori.* On `Σ₂ × S¹`, `x([Σ₂ × pt]) = 2 = −χ(Σ₂)`, and the class of `γ × S¹` for a
  simple closed curve `γ` on `Σ₂` is a torus class of norm `0`; on `S³`, `H₂ = 0` and `x` is the
  zero norm on the zero space.
- *Why `χ₋`.* A disconnected representative `S₁ ⊔ S₂` with `χ(S₁) = −2` and `χ(S₂) = +2` (a
  sphere) has `χ₋ = 2`, not `|χ(S)| = 0`; the definition with `χ₋` is what makes spheres free and
  what makes `x` a seminorm, while a minimum of `|χ(S)|` over all representatives would vanish on
  every class, since adding a sphere bounding a ball raises `χ` by `2` and adding a genus-two
  surface bounding a handlebody in a ball lowers it by `2`, without changing the class.
- *Incompressibility is needed.* On `S² × S¹` the class `[S² × pt]` has norm `0`, and no
  incompressible representative without a sphere component attains it: a representative with
  `χ₋ = 0` and no sphere component is a union of tori, and no torus in `S² × S¹` is
  incompressible, since `ℤ² → π₁(S² × S¹) = ℤ` is never injective. Compressible tori do attain it:
  tubing `S² × pt` to itself along an arc in `S² × (0, ε)` with both ends on the same side of the
  sphere gives a torus `T` with `[T] = [S² × pt]` and `χ₋(T) = 0`, compressible along the
  meridian disc of the tube, so incompressibility is what the statement needs. The sphere
  `S² × pt` bounds no ball, so the general form of the attainment statement holds; the
  irreducible form does not apply, and a version of it without the irreducibility hypothesis
  would be false here.
- *Outside the hyperbolic case.* On `S² × S¹` the class `e` pairing to `2` with `[S² × pt]` has
  `x*(e) = +∞`, and it is not bounded, although every closed connected surface with `χ ≤ 0` in
  `S² × S¹` is compressible: the torus `T` of the previous Check is embedded with `χ(T) = 0` and
  `|⟨e, [T]⟩| = 2`. Both sides of the comparison fail there together; the hyperbolic hypothesis
  is the setting of the native predicates, on which `x` is a norm and `x*` is finite everywhere.
- *The zero class.* The zero class is bounded and never sharp (`not_eulerClassNormOne_zero`), as
  `x*(0) = 0 ≠ 1`.

*Needs:* 5.4.1 (the integral surface minimum); AlgebraicTopology Stage 6 (Poincaré duality and
`H₂(M; ℤ)`) and Stage 8 (representability of `H¹` by maps to the circle); the native Morse–Sard
theorem `TauCeti.addHaar_image_criticalPoints_eq_zero` and
`ContDiff.dense_compl_image_criticalPoints`, applied in charts, for a regular value of a smooth
map to `S¹` whose preimage is the representing surface; Mathlib `Seminorm`; the native
`TauCeti.EulerClassBounded`, `TauCeti.EulerClassNormOne`,
`TauCeti.HomologicalOrientation.evalFundamentalClass`, `TauCeti.FiniteCWType`,
`TauCeti.eulerChar`; 2.1 (embedded surfaces); 7.2 (hyperbolic manifolds); 8.1 (the loop theorem,
for compressing discs); 8.3 (incompressible surfaces); 10.3 (the pairing).

### 10.5 Thurston's inequality and Yazdi's theorem

Thurston's Euler class inequality in its general form, Gabai's realization theorem and Yazdi's
infinite family are stated here and proved in GeometricTopology, Part II; the parity condition,
the deduction of the native closed hyperbolic forms from the general ones and the equality case
for leaves are proved here.

State **Thurston's inequality**: for a taut transversely oriented foliation `F` of a closed
oriented irreducible `3`-manifold `M`, `|⟨e(F), [S]⟩| ≤ |χ(S)|` for every closed connected
embedded oriented surface `S`, and in terms of the norms, `|⟨e(F), a⟩| ≤ x(a)` for every
`a ∈ H₂(M; ℤ)`, that is `x*(e(F)) ≤ 1` (Thurston, Mem. AMS 59 (1986), Section 3; Yazdi,
Section 1, inequalities (1) and (2), and Section 3.3 for the proof through the
Roussarie–Thurston general position of an incompressible surface with respect to `F`, which
gives `|χ(S)|` saddle tangencies). The irreducibility hypothesis is where sphere leaves are
excluded: the norm form fails on `S² × S¹` (10.4). State its **surface form on irreducible
manifolds** against the native carriers: on a closed connected orientable smooth `3`-manifold `M`
with `TauCeti.IsSphereBoundsBall M`, every Euler class `e` of a smooth taut codimension-one
foliation (`Foliation.Taut`, `Foliation.IsEulerClass`) satisfies `TauCeti.EulerClassBounded e`,
the inequality `|⟨e, f_*[S]⟩| ≤ −χ(S)` for every embedding `f` of a closed connected oriented
surface `S` with `χ(S) ≤ 0`. `Suggested.lean` states it as
`thurston_euler_class_inequality_of_isSphereBoundsBall`. It needs no Thurston norm in its
statement; its route from the norm form is the singular-surface form of the norm of 10.4 (Gabai),
which bounds `x(f_*[S]) ≤ −χ(S)` for every continuous `f`, so that merely topological embeddings
are covered, with a native Euler class of `F` being `±e(F)` for a transverse orientation (10.3)
and tautness compared with the native one by 10.2. State its **hyperbolic form** as the native
`TauCeti.ThurstonEulerClassInequality`: on a closed orientable hyperbolic `3`-manifold, every
Euler class of a smooth taut codimension-one foliation satisfies `EulerClassBounded` (10.4).
`Suggested.lean` states it as `thurston_euler_class_inequality`. Prove that the surface form on
irreducible manifolds implies it, a closed hyperbolic `3`-manifold being irreducible (7.3). Prove the **equality case for leaves** recorded in 10.2:
every compact leaf `L` of a taut transversely oriented foliation `F` of a closed oriented
`3`-manifold `M` realizes the norm of its class. A sphere leaf does so with `χ₋(S²) = 0`.
Otherwise `L` is incompressible (10.2) and its fundamental group, which is not virtually cyclic,
embeds in `π₁(M)`, so `M` is not finitely covered by `S² × S¹` and hence is irreducible
(Novikov–Rosenberg, 10.2); `⟨e(F), [L]⟩ = χ(L)`, since `TF` restricts to `TL` on `L` (10.3), and
the general form gives `−χ(L) ≤ x([L]) ≤ χ₋(L) = −χ(L)` (Yazdi, Section 1, the equality case).
Define the **parity condition**: an integral class `a ∈ H²(M; ℤ)` satisfies it when
`a ∈ 2H²(M; ℤ)`, the native `Even a`; prove that the Euler class of every oriented plane field
on a closed oriented `3`-manifold satisfies it (Yazdi, Definition 1.1 and Proposition 3.12).
State **Gabai's
realization theorem**: for a closed oriented irreducible `3`-manifold, every vertex `a` of the
dual unit ball of 10.4 is the Euler class of a taut foliation (Yazdi, Theorem 1.2, attributed to
Gabai; Gabai–Yazdi, *The fully marked surface theorem*, for the proof). Gabai's theorem also
covers compact `3`-manifolds with toral boundary; that form, on the seminorm of `H₂(M, ∂M; ℝ)`, is
GeometricTopology, Part II's together with that seminorm. State the **Euler class one
conjecture** of Thurston as the statement it is: for a closed orientable irreducible atoroidal
`M`, every integral class with `x*(a) = 1` satisfying the parity condition is the Euler class of
a taut foliation (Yazdi, the Euler Class One Conjecture of Section 1); its native hyperbolic form
`TauCeti.EulerClassOneConjecture` (every even class with `EulerClassNormOne` on a closed
orientable hyperbolic `3`-manifold is an Euler class of a smooth taut codimension-one foliation)
is the restriction to hyperbolic manifolds through the comparison of 10.4, and nothing is claimed
about either, since both are false. State **Yazdi's theorem**, the negation: there are infinitely
many closed hyperbolic `3`-manifolds `M` with an integral class `a ∈ H²(M; ℤ)`, `x*(a) = 1`,
satisfying the parity condition, which is the Euler class of no taut foliation of `M` (Yazdi,
Main Theorem; the examples are Dehn surgeries on fibered hyperbolic manifolds with `b₁ = 2`, and
the fully marked surface theorem of Gabai–Yazdi removes the conditional hypothesis of the first
paper), and its **weakest form** as the native `TauCeti.YazdiEulerClassOneTheorem`: one closed
orientable hyperbolic `3`-manifold with an even class `e`, `EulerClassNormOne e`, that is an
Euler class of no smooth taut codimension-one foliation. `Suggested.lean` states the infinite
family against the native carriers as `yazdi_infinite_family`: for every finite family of
topological spaces `N₁, …, N_k` there is a closed connected orientable hyperbolic `3`-manifold
`M`, homeomorphic to no `Nᵢ`, with an even class `e`, `EulerClassNormOne e`, that is an Euler
class of no smooth taut codimension-one foliation; its case `k = 0` is the weakest form. Prove that
the norm form of the family implies this form, through the comparison of 10.4 (`x*(a) = 1` with
`EulerClassNormOne`, the parity condition with `Even`) and the description of the native Euler
classes in 10.3, a smooth taut foliation being in particular one of the `C^{∞,0}` taut foliations
of Yazdi's statement; and consume the native refutation
`YazdiEulerClassOneTheorem.not_eulerClassOneConjecture`.

- Thurston: `|⟨e(F), [S]⟩| ≤ |χ(S)|` for every closed connected embedded oriented `S`;
  `x*(e(F)) ≤ 1`; on a closed `M` with `IsSphereBoundsBall M`, and so on a closed hyperbolic `M`,
  `EulerClassBounded e` for every native Euler class `e` of a smooth taut `F`.
- Yazdi: `∃` infinitely many closed hyperbolic `M` and `a` with `x*(a) = 1`, `a ∈ 2H²`, and
  `∀ F` taut transversely oriented, `e(F) ≠ a`; in particular one `M` with an even `e`,
  `EulerClassNormOne e`, and `¬ F.IsEulerClass e` for every smooth taut `F`.
- Gabai: every vertex of the dual unit ball is realized.

**Checks.**
- *A sphere bounding a ball.* For such `S` in `M`: `[S] = 0`, `⟨e(F), [S]⟩ = 0`, `|χ(S)| = 2` and
  `x([S]) = 0`, so both forms hold as `0 ≤ 2` and `0 ≤ 0`; a bound of the form
  `|⟨e(F), [S]⟩| ≤ −χ(S)` would read `0 ≤ −2` and fail, so the absolute value is part of the
  general statement, while the native `EulerClassBounded` avoids the sphere by asking `χ(S) ≤ 0`.
- *Connectedness.* On `Σ₂ × S¹` with the foliation by the surfaces `Σ₂ × pt`, the disjoint union
  `S` of a fibre and a sphere bounding a ball has `χ(S) = 0` while `|⟨e(F), [S]⟩| = 2`; the first
  form is a statement about connected surfaces, and the norm form covers disconnected ones.
- *A torus leaf.* A torus leaf `T` of a taut foliation has `|χ(T)| = 0`, so `⟨e(F), [T]⟩ = 0`; for
  the foliation of `T³` by tori this agrees with 10.3.
- *Sphere leaves.* For the product foliation of `S² × S¹`, `⟨e(F), [S² × pt]⟩ = 2 = |χ(S²)|`, so
  the first form holds with equality, while `x([S² × pt]) = 0 < 2`, so the norm form fails;
  `S² × S¹` is reducible, and the irreducibility hypothesis of the norm form is used.
- *A torus homologous to a sphere leaf.* In `S² × S¹` with that foliation, tube `S² × pt` to
  itself by an annulus running from one disc to another on the same side: the result is an
  embedded torus `T` with `[T] = [S² × pt]`, so `|⟨e(F), [T]⟩| = 2 > 0 = −χ(T)`. The native surface
  form, which asks `χ(S) ≤ 0`, fails on `S² × S¹`, and its hypothesis `IsSphereBoundsBall` is not
  removable; `S² × pt` bounds no ball.
- *A fibre leaf.* On `Σ₂ × S¹` with the foliation by surfaces `Σ₂ × pt`,
  `⟨e(F), [Σ₂ × pt]⟩ = χ(Σ₂) = −2` and `x([Σ₂ × pt]) = 2`, so the norm form holds with equality,
  as it must when a leaf is a norm-minimizing surface (Yazdi, Section 1, the equality case).
- *Both orientations.* The native inequality quantifies over every Euler class of `F`, that is
  over both `±e(F)`; `EulerClassBounded` is invariant under negation (`eulerClassBounded_neg_iff`),
  so this is no stronger than the statement for one transverse orientation. The zero class is
  bounded and never sharp (`not_eulerClassNormOne_zero`), so the hypothesis `EulerClassNormOne`
  of the conjecture excludes it, as `x*(0) = 0 ≠ 1` does in the general form.

*Needs:* 10.1 (taut foliations); 10.2 (Novikov–Rosenberg and the native tautness); 10.3 (the
Euler class and its pairing); 10.4 (the Thurston norm, its dual and the comparison with the native
inequality); 8.2 (irreducibility); 7.2 (hyperbolic manifolds); 7.3 (a hyperbolic `3`-manifold is
irreducible); 7.4 (fibering); 5.2 (Dehn surgery, for Yazdi's examples); the native
`TauCeti.ThurstonEulerClassInequality`, `TauCeti.EulerClassOneConjecture`,
`TauCeti.YazdiEulerClassOneTheorem`, `YazdiEulerClassOneTheorem.not_eulerClassOneConjecture`,
`Foliation.Taut`, `Foliation.IsEulerClass`, `TauCeti.EulerClassBounded`,
`TauCeti.EulerClassNormOne`, `TauCeti.eulerClassBounded_neg_iff`,
`TauCeti.not_eulerClassNormOne_zero`.

### Examples

The product foliation of `S² × S¹`; the Reeb foliation of `S³`; the linear foliations of `T³`; the
fibration of a mapping torus.
The product foliations of `T³` by tori and of `Σ₂ × S¹` by the surfaces `Σ₂ × pt`, and the
tangent bundles of surfaces and the Hopf plane bundle for the Euler class.

### Dependencies

Tau Ceti's foliations, leaves and tautness; DifferentialGeometry Layers 3 and 4; Layer 1.3 (gluing
Reeb components), Layer 5.2 (surgery descriptions), Layers 8.1–8.2 (irreducibility), Layer 9.1
(splittings).
The Euler class, the Thurston norm and Thurston's inequality (10.3–10.5) need in addition the native
Thom classes, Euler classes and Euler class inequalities of the supplier contracts; Layer 2
(embedded surfaces as locally flat submanifolds); AlgebraicTopology (singular cohomology,
fundamental classes, cup products); Layer 5.4.1 (the integral surface minimum); Layer 8
(incompressible surfaces, for the attainment statement of 10.4; irreducibility, for the norm form
of Thurston's inequality in 10.5); Layer 7 (hyperbolic manifolds, for the comparison of 10.4 and
for Yazdi's examples) and Layer 5 (the Dehn surgeries that produce them).

## Layer 11: triangulations, PL structures and collapse

The simplicial carriers, triangulability and the triangulation and Zeeman conjectures are Tau
Ceti's at the pin (*Simplicial complexes* under *From Tau Ceti*). This layer joins them to Layer
1's PL manifolds, proves the two-dimensional, three-dimensional and smooth triangulation
theorems, compares the topological, PL and smooth categories in dimensions two and three, and
states Manolescu's theorem and Zeeman's conjecture.

### 11.1 The realization and its CW structure

For an abstract simplicial complex `K`, the pin has: `Realization K` is Hausdorff
(`AbstractSimplicialComplex.instT2SpaceRealization`); every compact subset uses finitely many
vertices, so lies in the realization of a finite subcomplex
(`AbstractSimplicialComplex.exists_finset_support_subset_of_isCompact`; Hatcher, *Algebraic
Topology*, Appendix, Proposition A.1); simplicial maps realize to continuous maps functorially
(`PreAbstractSimplicialComplex.SimplicialMap.realizationMap`, `realizationMap_id`,
`realizationMap_comp`); the realization of a stellar subdivision of a finite complex is
homeomorphic to it by the barycentric map
(`PreAbstractSimplicialComplex.exists_homeomorph_stellarSubdivision`, under `K.faces.Finite`);
after tagging vertices, the closed star of a face `σ` is the join `σ ∗ Lk(σ)` and its part avoiding
`σ` is `∂σ ∗ Lk(σ)` (`PreAbstractSimplicialComplex.map_closedStar_eq_join`,
`PreAbstractSimplicialComplex.map_closedStar_inf_deletion_eq_join`); the CW structure on
`Realization K` whose closed cells are the realized simplices
(`AbstractSimplicialComplex.realizationCWComplex`, an instance of Mathlib's `Topology.CWComplex`);
and the transport of a CW structure along a closed embedding, a homeomorphism in particular,
between spaces of one universe, with the cells of the source and the characteristic maps followed
by the embedding (`Topology.IsClosedEmbedding.relCWComplex`). None of this is planned again here.
Prove what the pin lacks: the stellar homeomorphism for an arbitrary, possibly infinite and not
locally finite, complex, face by face in the weak topology, from the pinned point-set bijection
(`PreAbstractSimplicialComplex.injOn_stellarSubdivisionLinearMap`,
`PreAbstractSimplicialComplex.surjOn_stellarSubdivisionLinearMap`) and its simplexwise linear
inverses (`Subdivision/Stellar/Geometry.lean`); and the geometric form of the join laws, that the
closed star of `σ` is homeomorphic to the realization of `σ ∗ Lk(σ)` and the boundary of a conical
neighbourhood of the barycentre of `σ` to the realization of `∂σ ∗ Lk(σ)`, with the convention
`∅ ∗ X = X` (Rourke–Sanderson, Chapter 2). For a vertex the boundary is the realized link
itself, and the statement is the pinned description of a closed vertex star as the cone on its
link (`Realization/Star/Basic.lean`).

Write `|K|` for `Realization K`. The pin also has the rest of the polyhedron API, consumed here
and by ClassifyingSpaces and AlgebraicTopology. `|K|` is the union of the closed simplices in
`ι →₀ ℝ` with the weak topology, with face inclusions `AbstractSimplicialComplex.faceInclusion`,
barycentric coordinates, the `carrier` of a point and the `vertex` points. A simplicial map
realizes to a map affine on each simplex, injective exactly when its vertex map is
(`PreAbstractSimplicialComplex.SimplicialMap.realizationMap_injective_iff`), and mutually inverse
simplicial maps realize to a homeomorphism (`realizationHomeomorph`). A complex with finitely many
faces has compact realization with the coordinate map a closed embedding
(`AbstractSimplicialComplex.isClosedEmbedding_realization_coe`), and `|K|` is compact exactly when
the vertex type is finite (`compactSpace_realization_iff_finite`, since `K` contains every
singleton); finite vertex stars give local compactness and the coordinate topology
(`locallyCompactSpace_realization_of_finite_vertex_stars`,
`isEmbedding_realization_coe_of_finite_vertex_stars`); subcomplexes realize to closed embeddings
(`isClosedEmbedding_realizationMap`); `|K|` is the quotient of the disjoint union of its closed
simplices (`isQuotientMap_sigma_faceInclusion`), so homotopies glue from the closed simplices
(`homotopyOfFaces`, `Realization/Homotopy.lean`); and the bottom complex on a discrete vertex type
realizes to that discrete space (`realizationBotHomeomorph`). The **restriction**
`AbstractSimplicialComplex.restrict K V` of `K` to a set `V` of its vertices (the faces contained
in `V`, as a complex on the subtype) realizes to a closed embedding
(`isClosedEmbedding_restrictInclusion_realizationMap`), and a continuous map from a compact space
into `|K|` factors through the restriction to finitely many vertices
(`exists_finite_restrict_factorization`; Hatcher, *Algebraic Topology*, Proposition A.1, with the
same proof for the weak topology on `|K|`). The realization of the combinatorial cone on `K`
contracts onto its apex by the affine homotopy, fixing the apex
(`AbstractSimplicialComplex.coneContraction`, `contractibleSpace_realization_cone`). For finite
`K, L` the realization `|orderedProd K L|` of the ordered product
`AbstractSimplicialComplex.orderedProd` is homeomorphic to `|K| × |L|`
(`orderedProdRealizationHomeomorph`; Rourke–Sanderson, Chapter 2).

For a linearly ordered vertex type, the pinned CW structure, a classical
`Topology.CWComplex (univ : Set |K|)`, is the **CW structure of the ordered polyhedron**: its
`n`-cells are the `n`-simplices, and the characteristic map of a simplex
`σ = {v₀ < ⋯ < vₙ}` parametrizes it by the closed unit ball of `Fin n → ℝ` (in Mathlib's sup norm)
through its increasing enumeration, sending the `i`-th vertex of the standard simplex to `vᵢ`
(`AbstractSimplicialComplex.RealizationCell.characteristicMap`). The pin has that simplicial maps
realize to cellular maps (`PreAbstractSimplicialComplex.SimplicialMap.isCellular_realizationMap`),
that a simplicial map injective and order-preserving on a face carries the characteristic map of
that face to the characteristic map of its image
(`PreAbstractSimplicialComplex.SimplicialMap.realizationMap_characteristicMap`), and that the
cellular chain complex is the ordered simplicial chain complex: once the basis vector of each
`n`-cell is rescaled by the unit `TauCeti.realizationChainScale`, the cellular boundary of
`[v₀, …, vₙ]` is `Σ_j (−1)^j [v₀, …, v̂_j, …, vₙ]` (`TauCeti.cellularChainComplexRealizationIso`;
Hatcher, *Algebraic Topology*, Section 2.2, Theorem 2.35 and the cellular boundary formula). A
complex with finitely many faces has a finite CW structure, so its realization has finite CW type,
`TauCeti.FiniteCWType` (`AbstractSimplicialComplex.instFiniteCWTypeRealization`), and so has every
compact triangulable space (`TauCeti.IsTriangulable.finiteCWType`). This is what the cellular
theory of AlgebraicTopology applies to polyhedra and what ClassifyingSpaces consumes for countable
joins.

Prove also: that `|K|` is compactly generated (Mathlib's `CompactlyGeneratedSpace`), as a quotient
of the disjoint union of its compact closed simplices, and is the colimit of the realizations of
its finite subcomplexes, a subset being closed when it meets the realization of every finite
subcomplex in a closed set; and the ordered form for a map `o : ι → α` into a linear order that is
injective on every face, whose characteristic maps enumerate each face increasingly in `o`, by
identifying it with the pinned structure for a linear order on `ι` refining `o` (lexicographic in
`o` and a well-order of each fibre), so that the cellularity, characteristic-map and chain-complex
statements above hold for it.

**Checks.**
- *The join law on an edge.* For one closed edge `e` with its vertices, `Lk(e) = ∅` while the
  boundary of a neighbourhood of its midpoint is two points, `∂e ∗ ∅ = S⁰`; a law using the link
  alone fails here.
- *Simplex boundary.* The realization of the boundary of the standard `n`-simplex is
  homeomorphic to `Sⁿ⁻¹` for `n ≥ 1`; for `n = 0` the boundary has no nonempty face and its
  realization is empty.
- *Infinite fan.* For the complex of the edges `{0, i}`, `i ≥ 1`, not locally finite at `0`,
  starring `{0, 1}` changes only that edge, yet the pinned homeomorphism does not apply
  (`K.faces` is infinite), and the coordinate topology, in which the points at parameter `1/i`
  on the `i`-th edge converge to `0`, differs from the weak topology, in which they form a closed
  set: the infinite case must be proved for the weak topology.
- *Compact subsets of the fan.* In the infinite wedge of edges `{v₀, vₙ}`, `n ≥ 1`, the midpoints
  of the edges form an infinite set that is closed and discrete (it meets each closed simplex in
  at most one point), so it is not compact; a compact subset of this complex lies in finitely many
  edges.
- *A closed triangle.* A single closed triangle is compact, its realization is homeomorphic to
  `Δ²`, with `3` vertices, and the finite subcomplex containing a compact subset is `K` itself.
- *Discrete realizations.* The bottom complex on an infinite vertex type realizes to an infinite
  discrete space (`realizationBotHomeomorph`), not compact, while the bottom complex on `Fin 3` is
  three points.
- *The ordered square.* `orderedProd Δ¹ Δ¹` has two triangles (`fst ≤ snd` and `snd ≤ fst`) and
  realizes to a square; the four vertices do not span a tetrahedron, as the chain condition
  enforces.
- *Cellular boundary and orientation.* In the rescaled basis, the edge `[ab]` with `a < b` has
  cellular boundary `b − a` and the triangle `[abc]` has boundary `[bc] − [ac] + [ab]`, with
  `∂∂[abc] = (c − b) − (c − a) + (b − a) = 0`; composing the characteristic map of `[ab]` with the
  reflection of the interval negates its basis vector and gives boundary `a − b`, which is why the
  identification fixes the increasing enumeration in the vertex order and the scale.

*Needs:* Tau Ceti `AbstractSimplicialComplex.Realization`, `PreAbstractSimplicialComplex.link`,
`closedStar`, `join`, `PreAbstractSimplicialComplex.map_closedStar_eq_join`,
`PreAbstractSimplicialComplex.map_closedStar_inf_deletion_eq_join`, the stellar point-set bijection
and its simplexwise inverses; Mathlib `AbstractSimplicialComplex`.
For the polyhedron API and the CW structure: Tau Ceti `faceInclusion`, `carrier`, `vertex`,
`PreAbstractSimplicialComplex.SimplicialMap`, `SimplicialMap.realizationMap`,
`realizationHomeomorph`, `realizationBotHomeomorph`, the finite, locally finite, subcomplex,
restriction, cone and glued-homotopy facts of `Realization/`,
`AbstractSimplicialComplex.orderedProd`, `orderedCylinder`, `orderedProdRealizationHomeomorph`,
`AbstractSimplicialComplex.realizationCWComplex`, `TauCeti.cellularChainComplexRealizationIso`,
`TauCeti.FiniteCWType`, `TauCeti.IsTriangulable.finiteCWType`; Mathlib
`PreAbstractSimplicialComplex`, `Topology.IsClosedEmbedding`, `CompactSpace`,
`CompactlyGeneratedSpace`, `Topology.CWComplex`, `Topology.RelCWComplex`, `LinearOrder`;
AlgebraicTopology Stage 4 (cellular chains and the cellular boundary formula).

### 11.2 Triangulations and PL structures in dimension three

Prove Moise's theorems: every topological `3`-manifold is triangulable, `TauCeti.IsTriangulable`,
by a combinatorial triangulation; and the Hauptvermutung, that two triangulated `3`-manifolds
whose realizations are homeomorphic are PL homeomorphic, so that any two triangulations of a
`3`-manifold are combinatorially equivalent (their complexes have isomorphic subdivisions) and a
`3`-manifold has a PL structure in the sense of Layer 1.6, unique up to PL homeomorphism (Moise,
*Geometric Topology in Dimensions 2 and 3*, Theorems 35.3 and 36.2; Bing, Ann. of Math. 69
(1959)). Prove that every PL `3`-manifold admits a
smooth structure compatible with its PL structure, unique up to diffeomorphism (Munkres,
*Elementary Differential Topology*, §10, with the vanishing of the smoothing obstruction in
dimension three), so that a topological `3`-manifold has a unique smooth structure and a
homeomorphism between smooth `3`-manifolds is isotopic to a diffeomorphism. Relative versions keep
a given structure on a neighbourhood of a closed subset. `Suggested.lean` states the closed case of
the triangulation theorem, that every closed topological `3`-manifold is triangulable, as
`moise_triangulation`, the pinned `TauCeti.TriangulationConjecture 3`; its proof is a target of
this layer. Dimension two is Layer 11.2.1 and dimension one the classification of `1`-manifolds;
these theorems let Layers 5, 8 and 9 pass freely between topological, PL and smooth
`3`-manifolds.

Consume `TauCeti.IsTriangulable X`: `X` is homeomorphic to the realization of some abstract
simplicial complex, whose vertex type lies in a universe that is a parameter of the predicate; it
is invariant under homeomorphism (`Homeomorph.isTriangulable_iff`) and holds for realizations
(`AbstractSimplicialComplex.isTriangulable_realization`) and discrete spaces
(`TauCeti.isTriangulable_of_discreteTopology`). Prove that for compact `X` the vertex universe does
not matter, `IsTriangulable.{v} X ↔ IsTriangulable.{0} X`: a triangulating complex of a compact
space has finitely many vertices, hence finitely many faces (Layer 11.1,
`compactSpace_realization_iff_finite`), and it relabels onto a complex on `Fin k`, a finite vertex
type (`PreAbstractSimplicialComplex.realizationRelabelingHomeomorph`, as in the proof of
`TauCeti.IsTriangulable.finiteCWType`).

Prove **Moise's theorem in PL form**: for `n = 1, 2, 3`, every compact topological `n`-manifold
`M` has a PL structure, an atlas over `EuclideanHalfSpace n` with
`HasGroupoid M (PLGroupoid (𝓡∂ n))`, and any two PL structures on it are PL homeomorphic (Moise,
*Geometric Topology in Dimensions 2 and 3*, GTM 47, Theorems 35.3 and 36.2, for `n = 3`, the PL
equivalence of any two triangulations of a `3`-manifold being recorded in Scharlemann, *Heegaard
splittings of compact 3-manifolds*, Section 7; Layer 11.2.1 for `n = 2`; the classification of
`1`-manifolds for `n = 1`; dimension zero is discrete). The triangulation theorem and the
combinatorial equivalence of two triangulations are the theorems above, and the
passage from a combinatorial triangulation to a PL structure is the pinned theorem of Layer 11.3.
So the forgetful map from PL to topological manifolds of Layer 1.6,
`TauCeti.PLGroupoid_le_continuousGroupoid`, induces a bijection from PL-homeomorphism classes to
homeomorphism classes of compact manifolds of dimension at most three, and with the smoothing
theorems (above for dimension three, Layer 11.2.1 for dimension two) the triangulable, PL and
smooth structures coincide in these dimensions.

The theorems of this section carry the dimension bound `n ≤ 3`, and nothing is stated here about
four-manifolds: in dimension four the existence statement of the PL form fails (the Check on the
`E₈` manifold below). In dimension at least five the existence and the number of PL structures on
a closed topological manifold are governed by the Kirby–Siebenmann obstruction, whose carriers (the
stable tangent microbundle, `BTOP`, `BPL`) and theory are GeometricTopology, Part II's; they are no
input of this layer.

**Checks.**
- *Dimension four is excluded.* `ℝ⁴` has uncountably many smooth structures and the `E₈` manifold
  has no PL structure, so no dimension-free form of these theorems (or of 11.2.1's) is stated.
- *S³.* `S³` has exactly one smooth structure up to diffeomorphism and its PL structures are all
  equivalent; the theorem gives the standard one.
- *Two triangulations of S³.* The boundary of the `4`-simplex (`5` vertices) and the join of two
  triangle boundaries (`6` vertices) triangulate `S³`, and their complexes have isomorphic
  subdivisions, as the Hauptvermutung asserts.
- *Isomorphic subdivisions, not a common one.* Let `h : |K| ≃ₜ M` be a triangulation, `B` a round
  ball inside one open top simplex of `|K|`, and `φ` the homeomorphism of `M` that is
  `h(x) ↦ h(‖x‖² x)` on `h(B)`, in the affine coordinates of that simplex centred at the centre of
  `B` (radius one), and the identity outside it. Then `h` and `φ ∘ h` triangulate `M` by the same
  complex `K`, so they are combinatorially equivalent; but `h⁻¹ ∘ φ ∘ h` is `t ↦ t³` on each ray
  from the centre, linear near `0` on no simplex, hence not PL, so no triangulation of `M`
  subdivides both. The theorem is about the complexes, not a common subdivision through the two
  given homeomorphisms.
- *Lens spaces.* The PL structure of `S³` is that of `∂Δ⁴`, and every PL structure on `S³` is PL
  homeomorphic to it; the lens spaces `L(p, q)` of Layer 5.2 are compact `3`-manifolds, so each
  has a PL structure, unique up to PL homeomorphism, and their classification up to homeomorphism
  (Layer 5.4.2) is also their classification up to PL homeomorphism.
- *The `E₈` manifold.* Freedman's closed simply connected topological `4`-manifold with
  intersection form `E₈` (`H₂ ≅ ℤ⁸`, even, unimodular, of signature `8`) is not triangulable
  (Casson, through the Casson invariant, as recorded in Manolescu, *Lectures on the triangulation
  conjecture*, Section 1), hence has no PL structure, a compact PL manifold admitting a
  combinatorial triangulation (Layer 11.3), and no smooth structure; so "closed topological
  `4`-manifold" is strictly weaker than "PL `4`-manifold", the existence statement of the PL form
  fails in dimension four, and the dimension bound `n ≤ 3` is not removable.
- *The five-torus.* `T⁵` carries PL structures that are not PL homeomorphic (Kirby–Siebenmann,
  *Foundational Essays*, Essay V), so a uniqueness statement in all dimensions would be false: the
  dimension bound of the PL form is not removable, and the dimension-five phenomenon is the
  obstruction theory of GeometricTopology, Part II, not a target here.
- *Spheres.* `|∂Δⁿ⁺¹| ≃ₜ Sⁿ` natively
  (`AbstractSimplicialComplex.realizationStandardSuccSimplexBoundaryHomeomorphSphere`), so `Sⁿ` is
  triangulable with `n + 2` vertices; `S⁰` is two points (`n = 0`), and the formula `S^{n−1}` for
  `∂Δⁿ` holds for `n ≥ 1` only, since `∂Δ⁰` is void.
- *Large vertex types.* No complex on an infinite vertex type, uncountable or not, triangulates a
  compact space, since an abstract simplicial complex contains every singleton and its realization
  is compact only for a finite vertex type (Layer 11.1); so the universe-free statement loses
  nothing.

*Needs:* Tau Ceti `TauCeti.IsTriangulable`, `TauCeti.IsCombinatoriallyTriangulable`,
`TauCeti.PLGroupoid`; Layer 1.6, Layer 11.1, Layer 11.2.1.
For the triangulability API and the PL form: Tau Ceti
`Homeomorph.isTriangulable_iff`, `TauCeti.IsTriangulable.finiteCWType`,
`PreAbstractSimplicialComplex.realizationRelabelingHomeomorph`,
`TauCeti.PLGroupoid_le_continuousGroupoid`,
`AbstractSimplicialComplex.realizationStandardSuccSimplexBoundaryHomeomorphSphere`; Mathlib
`HasGroupoid`; Layer 11.3 (combinatorial manifolds and PL manifolds, both directions).

### 11.2.1 Surfaces: smoothing, Radó's theorem and the Hauptvermutung in dimension two

Here a surface is a Hausdorff, second-countable topological `2`-manifold, possibly with boundary;
a smooth surface carries in addition a smooth atlas over `𝓡∂ 2` (over `𝓡 2` when the boundary is
empty). Items 1 and 2 use Kirby's torus trick in Hatcher's form (*The Kirby torus trick for
surfaces*, arXiv 1312.3518), through his Handle Smoothing Theorem (§2): a topological embedding
into a smooth surface of `ℝ²`, of `D¹ × ℝ` smooth near `∂D¹ × ℝ`, or of `D²` smooth near `∂D²`, is
isotopic, fixed away from the core and where already smooth, to one smooth near the core; for
`0`-handles, pull back to a punctured torus, extend and identify with the standard torus, lift to
a bounded homeomorphism of `ℝ²` and apply Alexander's trick (§3).

1. **Smoothing.** Prove that every surface admits a smooth structure, and that a smooth structure
   given on an open subset extends to the whole surface (Hatcher, Theorem A, and the refinement
   stated after Theorems A and B). The route smooths coordinate charts one at a time over a
   triangulation of their overlap with simplices shrinking towards its frontier, and treats the
   boundary through a collar: for a compact boundary by Brown's collaring theorem,
   `TauCeti.IsLocallyCollared.isCollared`; in general by Connelly's partition-of-unity argument
   quoted in Hatcher's proof of Theorem A.
2. **Isotopy to diffeomorphisms.** Prove that every homeomorphism between smooth surfaces is
   isotopic to a diffeomorphism, by an isotopy that moves points as little as desired and is fixed
   on a neighbourhood of the boundary when the homeomorphism is already a diffeomorphism there
   (Hatcher, Theorem B, with the refinements stated after Theorems A and B and after the proof of
   Theorem B). The route smooths near the vertices, then the edges, then the triangles of a smooth
   triangulation of the source (Layer 11.3). Applied to the identity between two smooth
   structures, this makes the smooth structure of item 1 unique up to isotopy.
3. **Radó's theorem.** Prove that every surface `M` is homeomorphic to the realization of a
   locally finite combinatorial `2`-manifold, `TauCeti.IsCombinatoriallyTriangulable M 2`, from
   item 1 and the smooth triangulations of Layer 11.3 (Radó, 1925, whose proof used the
   Schoenflies theorem, which this route does not). `Suggested.lean` states the closed case, that
   every closed topological surface is triangulable, as `rado_triangulation`, the pinned
   `TauCeti.TriangulationConjecture 2`.
4. **PL surfaces and the Hauptvermutung.** Prove that every PL surface in the sense of Layer 1.6
   admits a smooth structure compatible with its PL structure, by rounding the corners of the
   triangles on the stars of the vertices of a subdivision, unique up to isotopy by item 2, so
   that the PL and smooth categories agree in dimension two (Hatcher, §1). Deduce the
   two-dimensional Hauptvermutung: every homeomorphism between PL surfaces is isotopic to a PL
   homeomorphism, so any two triangulations of a surface have isomorphic subdivisions, from item 2
   and the uniqueness of the PL structure of a smooth manifold (Layer 11.3).
5. **Smooth and topological isotopy.** For a compact smooth surface `F`, prove that two
   diffeomorphisms of `F` fixing `∂F` pointwise that are joined by an isotopy through
   homeomorphisms fixing `∂F` pointwise are joined by a smooth isotopy, a `TauCeti.Diffeotopy`,
   through diffeomorphisms fixing `∂F` pointwise. With item 2 in its relative form this makes the
   forgetful map from the mapping class group `Mod(F)` of Layer 1.7.2 to the group of isotopy
   classes of homeomorphisms of `F` fixing `∂F` a group isomorphism. Route: make everything the
   identity near `∂F` by uniqueness of collars (Layer 1.1) and an external collar; cut the isotopy
   into uniformly small steps (uniform continuity on `F × [0, 1]`) and replace each stage by a
   nearby diffeomorphism by item 2; then show that a diffeomorphism equal to the identity near
   `∂F` and close to the identity is smoothly isotopic to it rel a neighbourhood of `∂F`, on a
   smooth triangulation of large mesh (Layer 11.3): near the vertices by the disc theorem of
   Layer 3.3, along the edges in discs cut by two arcs (Tau Ceti's Schoenflies theorem, smoothed
   by item 2) and on the triangles by Smale's disc theorem (Layer 3.4).

**Checks.**
- *Simplicial, not Δ-complex.* The torus as a square with one diagonal (one vertex, three edges,
  two triangles) is a `Δ`-complex, not an instance of `TauCeti.IsTriangulable`; a simplicial torus
  needs `V ≥ 7`, attained by the seven-vertex torus (by evaluation).
- *Fixing the boundary along the isotopy.* On `S¹ × [0, 1]` the twist `(θ, t) ↦ (θ + 2πφ(t), t)` is
  smoothly isotopic to the identity by isotopies rotating the boundary, but not rel boundary
  (Layer 1.7.2), so item 5 must fix `∂F` throughout.
- *Non-compact surfaces.* The plane is triangulable by the locally finite triangulation of `ℝ²`
  by unit squares each cut along a diagonal, but by no finite complex, whose realization is
  compact; the closed case is the one `TauCeti.TriangulationConjecture 2` states.

*Needs:* Tau Ceti `TauCeti.IsTriangulable`, `TauCeti.IsCombinatoriallyTriangulable`,
`TauCeti.TriangulationConjecture`, `TauCeti.IsLocallyCollared.isCollared`,
`TauCeti.IsJordanCurve.exists_homeomorph_image_sphere`, `TauCeti.Diffeotopy`; Layer 1.1
(uniqueness of collars), Layer 1.6 (PL surfaces), Layer 3.3 (the disc theorem), Layer 3.4 (Smale's
disc theorem), Layer 11.3 (smooth triangulations and the uniqueness of the PL structure of a
smooth manifold); Mathlib `Homeomorph`, `IsManifold`.

### 11.3 Smooth triangulations and combinatorial manifolds

Prove the Cairns–Whitehead theorem: every smooth manifold admits a smooth triangulation, a
homeomorphism `f : Realization K ≃ₜ M` with the pinned `TauCeti.IsSmoothTriangulation I n f` (on
every closed simplex `f` is a `Cⁿ` immersion of the simplex), unique up to PL homeomorphism
(Whitehead, *On C¹-complexes*, Ann. of Math. 41 (1940); Munkres, Theorems 10.5 and 10.6), with
the pinned secant approximations on edgewise subdivisions
(`Geometry/Manifold/SmoothTriangulation/`) as inputs; hence every smooth manifold is a PL
manifold in the sense of Layer 1.6, with a unique PL structure. The pin has that the realization
of a combinatorial `(n+1)`-manifold is a PL manifold with boundary, modelled on the half-space
`(Fin n → ℝ) × ℝ≥0`, with no local-finiteness hypothesis
(`PreAbstractSimplicialComplex.IsCombinatorialManifold.exists_chartedSpace_hasGroupoid_PLGroupoid`).
Prove the converse, that every PL manifold admits a combinatorial triangulation
(Rourke–Sanderson, *Introduction to Piecewise-Linear Topology*, Chapter 3), so that the
chart-based and link-based definitions agree. Prove that the boundary of a combinatorial manifold,
the vertices with ball
links, is a combinatorial manifold of one dimension less.

This is Whitehead's theorem in the form that every smooth manifold `M` is triangulated by a
combinatorial manifold `K`, through a homeomorphism `|K| → M` smooth with injective differential
on each closed simplex: prove that the complex of a smooth triangulation is a combinatorial
manifold, so that the charts of the pinned theorem above, carried to `M` by the triangulation and
read in the Euclidean or half-space model of `I` (the half-space form below), form a PL atlas on
`M`, with `HasGroupoid M (PLGroupoid I)` for that atlas; it is a charted-space structure other
than the smooth one, whose transition maps are not PL in general (Layer 1.6). The route is the
Cairns–Whitney construction of a triangulation by a fine ambient simplicial subdivision in general
position, and the uniqueness is Munkres's (Munkres, *Elementary Differential Topology*, Annals of
Math. Studies 54, Theorems 10.5 and 10.6, for the existence and uniqueness of smooth
triangulations, as above). Prove that the smooth triangulation can
be chosen to refine any locally finite open cover (every closed simplex in one of its members) and
to be compatible with a closed smooth submanifold, which it triangulates by a subcomplex; and that
a compact smooth manifold has finite CW type, `TauCeti.FiniteCWType`, by
`TauCeti.IsTriangulable.finiteCWType` (Layer 11.1). This is the item that AlgebraicTopology
(compact smooth manifolds have finite CW type) and AffineMorseLefschetz consume.

Consume, with the pinned theorem, `PreAbstractSimplicialComplex.IsCombinatorialBall K n` (stellar
equivalent, up to relabelling, to the standard `n`-simplex), `IsCombinatorialSphere K n` (stellar
equivalent to the boundary of the standard `(n+1)`-simplex) and `IsCombinatorialManifold K n`,
defined by cases on `n`: for `n = 0` every vertex has void link, and for `n + 1` the link of every
vertex is a combinatorial `n`-sphere or a combinatorial `n`-ball. The pin has that the standard
simplex and its boundary are combinatorial manifolds (`isCombinatorialManifold_simplex`,
`isCombinatorialManifold_simplexBoundary`), that `IsCombinatorialManifold K n` implies
`dimension K ≤ n`, with equality for nonvoid `K` (`IsCombinatorialManifold.dimension_le`,
`IsCombinatorialManifold.dimension_eq`), and that the realization of a combinatorial manifold is
locally compact
(`AbstractSimplicialComplex.locallyCompactSpace_realization_of_isCombinatorialManifold`). For a
combinatorial `(n+1)`-manifold the charts of the pinned theorem are the stars of vertices,
cones on links stellar equivalent to `∂Δⁿ⁺¹` (interior vertices) or to `Δⁿ` (boundary vertices)
(Rourke–Sanderson, Chapter 3). Prove the form of the pinned theorem in Mathlib's half-space model,
`HasGroupoid |K| (PLGroupoid (𝓡∂ n))` for a combinatorial `n`-manifold `K` with `n ≥ 1`, by
transporting the pinned charts along the linear isomorphism of the two half-spaces, and, when
every vertex link is a sphere, `HasGroupoid |K| (PLGroupoid (𝓡 n))` over the Euclidean model, by
transporting the pinned atlas without boundary over `Fin n → ℝ`
(`AbstractSimplicialComplex.exists_chartedSpace_hasGroupoid_of_isCombinatorialSphere_link`) along
`EuclideanSpace.equiv`; and that in the half-space structure the manifold boundary
`ModelWithCorners.boundary` of `|K|` is the realization of the boundary subcomplex, the faces whose
links are combinatorial balls, whose vertices are those with ball links. The compact case of the
converse reads: every compact PL manifold is PL homeomorphic to the realization of a combinatorial
manifold.

- The four predicates satisfy `smooth ⟹ PL ⟺ combinatorially triangulable ⟹ triangulable`, and
  the one-way implications are strict: `E8 × S¹`, `E8` Freedman's four-manifold, is a closed
  `5`-manifold triangulable without PL structure, and closed PL manifolds without smooth
  structure exist from dimension `8` on (Manolescu, *Lectures on the triangulation conjecture*,
  arXiv 1607.08163, §2, the diagram at its end). That `E8 × S¹` is triangulable is the
  Galewski–Stern–Matumoto criterion, part of GeometricTopology, Part II's TOP/PL comparison.
- Recognizing a combinatorial sphere is undecidable in dimension at least five (Novikov).
- Triangulable, combinatorially triangulable (PL) and smoothable are distinct predicates with
  implications only in one direction (this subsection gives smooth to PL, Layer 1.6 gives PL to
  topological). The Hauptvermutung fails for topological manifolds (Kirby–Siebenmann,
  *Foundational Essays*, Essay IV, part of GeometricTopology, Part II's TOP/PL comparison); a
  triangulation of a manifold need not be combinatorial (the double suspension of a homology
  sphere, Edwards and Cannon, as recorded in Kirby–Siebenmann; Check below); and the undecidability
  of recognizing combinatorial spheres is also in Volodin–Kuznetsov–Fomenko.

**Checks.**
- *Dimension zero.* A single vertex is a combinatorial `0`-manifold with empty link and the
  boundary of the `(n+1)`-simplex a combinatorial `n`-manifold
  (`isCombinatorialManifold_simplexBoundary`); using `n − 1` in `ℕ` would demand a two-vertex link.
- *A non-combinatorial triangulation.* The double suspension of the Poincaré sphere is `S⁵`
  (Cannon–Edwards), but a vertex on its suspension circle has link `ΣP`, not a manifold
  (Manolescu, Example 2.2).
- *Smooth faces.* The smooth triangulation of `S²` by the radially projected boundary of the
  tetrahedron has each face a smooth embedding of the triangle, while the realization
  homeomorphism is not smooth across edges, which the definition does not require.
- *Low dimensions.* A single point is a combinatorial `0`-manifold (void link), and so are two
  points; the standard `1`-simplex is a combinatorial `1`-manifold whose two vertices have
  one-point links (`0`-balls, boundary vertices); `∂Δ²` is a combinatorial `1`-manifold whose
  vertices have two-point links (`0`-spheres, interior vertices).
- *The bow-tie.* Two triangles sharing one vertex do not form a combinatorial `2`-manifold: the
  shared vertex's link is two disjoint edges, neither a `1`-sphere (a circle) nor a `1`-ball (an
  arc).
- *The cone on a torus.* The cone on a triangulated torus is not a combinatorial `3`-manifold: the
  apex has link a torus, neither a `2`-sphere nor a `2`-ball, and its realization is not a
  manifold at the apex.
- *Octahedron and projective plane.* The boundary of the octahedron (`6` vertices, `8` triangles)
  is a combinatorial `2`-sphere: it is reached from `∂Δ³` by stellar moves, which is what stellar
  equivalence allows. The `6`-vertex triangulation of `ℝP²` has every vertex link a circle, so it
  is a combinatorial `2`-manifold without boundary, but it is not a combinatorial `2`-sphere: its
  realization has `H₁ = ℤ/2`, while stellar moves preserve the homeomorphism type of the
  realization.
- *The circle.* `S¹` is triangulated by `∂Δ²`, the map sending the three vertices to three points
  of `S¹` and each edge radially onto the arc between them; it is smooth on each edge with nonzero
  derivative.
- *Two smooth triangulations of S².* Besides the radially projected boundary of the tetrahedron,
  `∂Δ³`, smooth with injective differential on each closed face, the radially projected boundary
  of the cube with each square face cut along a diagonal is a smooth triangulation of `S²`, and the
  two are PL homeomorphic (their complexes have isomorphic subdivisions), as the uniqueness
  asserts.
- *The torus.* `ℝ²/ℤ²` is triangulated by the `9`-vertex complex obtained from the `3 × 3` grid of
  the unit square with diagonals; fewer than `7` vertices cannot triangulate the torus
  (`χ = V − E + F` with `E ≤ V(V − 1)/2` and `3F = 2E` forces `V ≥ 7`), and the seven-vertex
  torus of Layer 11.2.1 attains the bound.

*Needs:* Tau Ceti `PreAbstractSimplicialComplex.IsCombinatorialManifold`, `IsCombinatorialSphere`,
`IsCombinatorialBall`, `TauCeti.PLGroupoid`, `TauCeti.IsSmoothTriangulation`,
`PreAbstractSimplicialComplex.IsCombinatorialManifold.exists_chartedSpace_hasGroupoid_PLGroupoid`;
Layer 1.6, Layer 11.1.
For the additions: Tau Ceti `PreAbstractSimplicialComplex.link`, `isCombinatorialManifold_simplex`,
`IsCombinatorialManifold.dimension_le`, `IsCombinatorialManifold.dimension_eq`,
`AbstractSimplicialComplex.locallyCompactSpace_realization_of_isCombinatorialManifold`,
`AbstractSimplicialComplex.exists_chartedSpace_hasGroupoid_of_isCombinatorialSphere_link`,
`TauCeti.FiniteCWType`, `TauCeti.IsTriangulable.finiteCWType`; Mathlib `HasGroupoid`,
`modelWithCornersEuclideanHalfSpace`, `EuclideanSpace.equiv`, `ModelWithCorners.boundary`,
`IsManifold`, `ContMDiff`, `Manifold.IsImmersion`; Layer 11.1 (the CW structure of a polyhedron
and finite CW type).

### 11.4 Manolescu's theorem

The triangulation conjecture in dimension `n` is the pinned `TauCeti.TriangulationConjecture n`:
every closed topological `n`-manifold is triangulable. It holds for `n ≤ 3` by Radó (Layer 11.2.1,
`rado_triangulation`) and Moise (Layer 11.2, `moise_triangulation`), and fails for every `n ≥ 5`:
there is a closed `n`-manifold admitting no simplicial triangulation (Manolescu,
*Pin(2)-equivariant Seiberg–Witten Floer homology and the triangulation conjecture*, J. Amer. Math.
Soc. 29 (2016), Corollary 1.3; survey arXiv 1607.08163, Theorem 1.1). `Suggested.lean` states it as
`manolescu_triangulation_conjecture_false`. Its gauge-theoretic proof (the Galewski–Stern–Matumoto
reduction to a homology `3`-sphere of Rokhlin invariant one and order two in the homology
cobordism group, refuted by the `β` invariant) is not owned here.

`Suggested.lean` also states the connected form, as `manolescu_theorem`: for every `n ≥ 5` there is
a closed connected topological `n`-manifold `M`, `TauCeti.IsClosedConnectedManifold n M`, with
`¬ IsTriangulable M` (Manolescu, *Lectures on the triangulation conjecture*, Theorem 1.1). There
`M` lies in `Type` and the triangulating complexes have vertex types in `Type`, which loses nothing
for a compact space: a triangulating complex of a compact space has finitely many faces and
relabels onto a finite vertex type `Fin k`, so `IsTriangulable.{v} M ↔ IsTriangulable.{0} M`
(Layer 11.2). The two forms are equivalent: a closed manifold has finitely many components, each
open and closed and itself a closed connected manifold, and a closed manifold all of whose
components are triangulable is triangulable, by the disjoint union of the triangulating complexes;
so a non-triangulable closed `n`-manifold has a non-triangulable component. In dimension four the
conjecture fails by Casson's theorem that Freedman's `E₈` manifold is not triangulable (Casson,
as recorded in Manolescu's lectures, Section 1), a four-manifold on which this roadmap states
nothing (Layer 11.2, Checks).

**Checks.**
- *No orientability clause.* Every closed orientable `5`-manifold is triangulable (Siebenmann,
  Galewski–Stern, Matumoto; Manolescu, after Corollary 1.3), so the dimension-`5` examples are
  non-orientable and the headline has no orientability hypothesis.
- *Low dimensions.* `TauCeti.TriangulationConjecture 0` holds
  (`TauCeti.triangulationConjecture_zero`); dimension `4` fails by Freedman's `E₈` manifold
  (Casson), a theorem of four-manifold topology that this roadmap does not state, so
  `TauCeti.TriangulationConjecture 4` is false although neither headline covers `n = 4`.
- *PL versus triangulable.* A non-triangulable closed manifold is in particular not a PL
  manifold; the converse direction is the Kirby–Siebenmann theory of GeometricTopology, Part II.
- *All dimensions at once.* Manolescu's manifolds exist in every dimension `n ≥ 5`; the statement
  `∃ M` in dimension `5` alone is the case `n = 5` and does not by itself give dimension `6`, so
  the quantified form `∀ n ≥ 5, ∃ M` is the theorem.

*Needs:* Tau Ceti `TauCeti.TriangulationConjecture`, `TauCeti.IsTriangulable`; Layer 11.2.
For the connected form: Tau Ceti `TauCeti.IsClosedConnectedManifold`.

### 11.5 Collapse and Zeeman's conjecture

Consume `PreAbstractSimplicialComplex.IsFreePair`, `ElementaryCollapsesTo`, `CollapsesTo` and
`Collapsible`. Prove that an elementary collapse induces a strong deformation retraction of
realizations, so a collapsible complex has contractible realization. Define the dunce hat and
Bing's house as finite `2`-complexes and prove they are contractible but not collapsible (they
have no free face). Zeeman's conjecture is the pinned `TauCeti.ZeemanConjecture`: for every finite
contractible complex `K` of dimension at most two, the ordered cylinder
`AbstractSimplicialComplex.orderedCylinder K` is collapsible (Zeeman, *On the dunce hat*, Topology
2 (1964); Kirby's Problem 5.2). It is open, so it is stated and not asserted; prove Zeeman's own
cases, that the cylinder on the dunce hat is collapsible, and that the conjecture implies the
Poincaré conjecture (Zeeman 1964).

Here `PreAbstractSimplicialComplex.ElementaryCollapsesTo` removes a free face with its unique
coface, `CollapsesTo` is its reflexive transitive closure, `Collapsible K` is collapse to a
one-vertex complex, and `Contractible2Complex K` asks for finitely many faces, dimension at most
two and contractible realization. Consume also the native collapses of cones and of the ordered
cylinders of cones (`Collapse/Cone.lean`, `Collapse/Cylinder/Basic.lean`), among them the collapse
of the ordered cylinder of a full simplex to its terminal apex
(`AbstractSimplicialComplex.collapsible_orderedCylinder_top`), so that the conclusion of
`TauCeti.ZeemanConjecture` holds for the ordered cylinders of finite cones. The deformation
retractions of the elementary collapses are glued from the closed simplices by Layer 11.1. In
**Zeeman's theorem on the dunce hat**, the dunce hat `D` is a triangle with its three edges
identified in the pattern `a a a⁻¹`, triangulated as a finite `2`-complex: `D` is contractible, has
no free face, hence is not collapsible, and `D × I` collapses to a point (Zeeman, *On the dunce
hat*, the main theorem). Zeeman's conjecture is recorded as the native proposition and nothing is
claimed about it, so it is not a theorem of `Suggested.lean`.

**Checks.**
- *Finiteness.* An infinite locally finite triangulation of the plane is contractible but not
  finite, so it is not an instance of `Contractible2Complex` and not a counterexample.
- *Trees and circles.* A finite tree collapses to a vertex; the boundary of a triangle has no
  free face and is neither collapsible nor contractible.
- *Dunce hat.* The dunce hat is contractible and not collapsible, so collapsibility is strictly
  stronger than contractibility; its cylinder is collapsible, the first nontrivial instance of
  the conjecture.
- *The triangle.* `Δ²` collapses to a vertex (remove the triangle through a free edge, then two
  edges); `∂Δ²` has no free face and is not collapsible, and it is not contractible either,
  consistent with the implication.
- *Edges of the dunce hat.* After the identification every edge of the dunce hat lies in two or
  three triangles, so it has no free face; it is contractible, being `D²` with its boundary wrapped
  by a degree-one map, so it is a non-collapsible contractible `2`-complex, and Zeeman's conjecture
  for it is his theorem.
- *The plane's cylinder.* The triangulated plane is contractible and `2`-dimensional with
  infinitely many faces; no finite sequence of elementary collapses reduces its cylinder to a
  point, so the finiteness hypothesis is not removable.
- *Cylinders of simplices.* The ordered cylinder of a full simplex collapses to the terminal apex
  (`collapsible_orderedCylinder_top`), the conjecture's first positive family.

*Needs:* Tau Ceti `PreAbstractSimplicialComplex.Collapsible`, `ElementaryCollapsesTo`,
`AbstractSimplicialComplex.Contractible2Complex`, `AbstractSimplicialComplex.orderedCylinder`,
`TauCeti.ZeemanConjecture`; Layer 11.1.
For the additions: Tau Ceti `CollapsesTo`, the collapses of `Collapse/Cone.lean` and
`Collapse/Cylinder/Basic.lean`, `collapsible_orderedCylinder_top`; Mathlib `ContractibleSpace`;
Layer 11.1 (glued homotopies and ordered cylinders).

### Examples

The boundary of the simplex as a combinatorial sphere; the seven-vertex torus and the six-vertex
projective plane as minimal triangulations; the double suspension of the Poincaré sphere as a
non-combinatorial triangulation of `S⁵`; `E8 × S¹` as a triangulable manifold with no PL
structure; the dunce hat; the tetrahedral smooth triangulation of `S²`.
Also `∂Δⁿ⁺¹ ≃ Sⁿ`; the bow-tie and the cone on the torus as non-manifolds; the ordered square; the
smooth triangulations of `S¹`, `S²` and `T²` (the `9`-vertex torus); `S³` and the lens spaces with
their unique PL structures; the `E₈` manifold with no PL structure; the five-torus `T⁵`, with PL
structures that are not PL homeomorphic, as the non-example to uniqueness above dimension three.

### Dependencies

Tau Ceti's simplicial complexes, realizations, combinatorial manifolds, collapse, triangulability
and the two propositions, Brown's collaring theorem and the Schoenflies theorem; Layer 1.6 (PL
manifolds); Layer 1.1 (collars) and Layers 3.3 and 3.4 (the disc theorem and Smale's disc theorem)
for Layer 11.2.1; Mathlib CW complexes.
Also Mathlib's simplicial-set realization and compactly generated spaces; the native realization,
product, cellular-chain, finite-CW-type and connected-manifold declarations of the supplier
contracts, with AlgebraicTopology's cellular chains; Layer 1.6 (the PL groupoid and its forgetful
map) for the PL form of Moise's theorem. The
Kirby–Siebenmann obstruction theory is GeometricTopology, Part II's and is no input of this layer.
## Downstream consumers

- **AlgebraicTopology** consumes Layer 11.3's smooth triangulations, through which a smooth
  manifold is homeomorphic to a simplicial realization, and Layer 1's boundary and collar
  constructions; the CW structure of a realization and its transport along homeomorphisms, which
  it also uses, are Tau Ceti's at the pin.
  It also uses Layer 11.1's polyhedra and, through the smooth triangulations of Layer 11.3, that
  compact smooth manifolds have finite CW type.
- **ClassifyingSpaces** consumes Layer 11.1's polyhedra, their weak topology and the cellular
  chains of countable joins.
- **CharacteristicClasses**, **GeneralizedCohomology**, **TopologicalKTheory**,
  **MorseTheory**, **RiemannianGeometry**, **IndexTheory**,
  **AffineMorseLefschetz** and **ComplexKahlerGeometry** consume Layer 1: collars, gluing,
  connected sums, tubular neighbourhoods and the metric-independent normal bundle.
  AffineMorseLefschetz also consumes Layer 11 and the smooth triangulations of Layer 11.3.
- **MorseTheory** also consumes Layer 2.2's generalized Schoenflies theorem for a bicollared
  sphere, which is proved here and is the topological input of its target M4.1.
- **CharacteristicClasses** also consumes Layer 3's mapping topology and Layer 10.3's Euler class
  of an oriented plane bundle: its C2 compares its rank-two Euler class with that plane
  construction on the pinned `TauCeti.eulerClass`. Nothing of CharacteristicClasses is consumed
  here.
- **PositiveScalarCurvature**, **RealAnalyticGeometry**, **TaubesGromov** and the
  SymplecticGeometry roadmaps (**ContactGeometry**, **CotangentLagrangian**, **ConvexityToric**)
  consume Layer 1's tubular neighbourhoods, collars, gluing and handle attachment.
- **HeegaardFloer** consumes Layer 1, Layer 3's weak Whitney topology, Layer 9's splittings and
  the smooth triangulations of Layer 11.3.
- **MorseNovikov** consumes Layers 1, 3, 4, 5 and 11.
- **OptimalTransport** consumes Layer 7's volume. **DifferentialGeometry** consumes the pinned
  boundary manifold and volume measure on which Layers 1 and 7 build, and no target of this
  roadmap.
- **TeichmullerGeometry** consumes Layer 3's topological group `Diff(M)` and isotopy
  extension, Layer 1.7.2's mapping class groups for its Layer 3.1, and Layer 11.2.1's
  comparison of smooth and topological isotopy classes of surface diffeomorphisms.
- **MordellLawrenceVenkatesh** consumes Layer 1's collars and gluing along boundary pieces,
  and Layer 1.7.2's mapping class groups, Dehn twists and their action on homology for the
  compact surfaces of its LV.5, §§5.9–5.12.
- **KhovanovHomology** and **CombinatorialHeegaardFloer** consume Layer 4's geometric and
  combinatorial presentations and the comparison theorems between them.
  KhovanovHomology also consumes Layer 1's tubes and Layer 6.5's link cobordisms.
  CombinatorialHeegaardFloer's Lane K also consumes Layer 4's polynomials and Layer 6.5's link
  cobordisms, and its Lane G consumes Layer 6.5; nothing of CombinatorialHeegaardFloer is
  consumed here as a supplier. Its Lane G, items 7 and 10, proves the Milnor conjecture that
  4.8.3 consumes as stated, and its `τ` with the bound `|τ(K)| ≤ g_s(K)` enters
  GeometricTopology, Part II's Mazur-satellite formulas.
- **FourManifolds** consumes Layers 1, 2, 3, 5 and 6, Layer 4's Seifert surfaces, Seifert
  matrices and Alexander polynomial, Layer 4.3.1's finite quadratic Arf algebra and its knot
  and proper-link Arf invariant (independence of the surface, additivity and the
  determinant–Arf criterion, with 4.5.3's signed congruence `Δ_K(−1) ≡ 1 − 4·Arf(K) mod 8`),
  and Layer 6.2.1's vanishing of the knot Arf invariant on smoothly and topologically slice
  knots (item 5); it owns the four-dimensional theorems this roadmap states (the
  dimension-four annulus theorem and Freedman's theorem).
- **TemperleyLiebOperatorAlgebras** consumes Layer 4.5.3's finite algebraic
  Clifford map, scalar trace, radical quotient, coordinate inclusions and braid phases, and
  Layer 4's Jones polynomial of braid closures; its §1.7 adds the analytic adjoint, the
  comparison with Subfactors §3.3's positive quotient `Q_n`, the blocks and the tower on top of
  that finite model.
- **TangentialBordism** consumes Layer 1's gluing, Layer 4.3.1's finite quadratic
  Arf algebra and Layer 11.3's smooth triangulations; its Spin-surface
  refinement and Spin bordism classification remain its own constructions.
- **DiagrammaticCoherence** consumes Layers 1–4: the manifold, embedding and isotopy
  foundations, the knot presentations of Layer 4.2 and, from Layer 4.2.8, the smooth
  geometric braid carrier with its comparison, through ReductiveGroups §11A, with the
  native braid group and its faithfulness among relative tangles; it owns the tangle
  categories, their cups and caps and the coherence theorems built on these carriers.
- **Poincare3D** consumes Layers 1, 2, 7 and 11. It proves by Ricci flow with surgery the
  topological Poincaré theorem that 8.6 states, with the adapter to 8.6's statement in its Layer
  15.1, and it states and proves the smooth form, for closed simply connected smooth
  `3`-manifolds (its Layer 13) and on Mathlib's
  `ContinuousMap.HomotopyEquiv.NonemptyDiffeomorphSphere M 3` (its target 15.2), which 8.6 does
  not restate.
- **GeometricTopology, Part II** consumes the foundational layers needed by each of its
  developments and owns the developments listed under *Scope and ownership*.

## References

- A. Pyronneau, *The Arf and Rohklin’s invariant*, January 2024,
  [institutional notes](https://web.ma.utexas.edu/SMC/2024/Rokhlin_s_Invariant.pdf),
  §2.1, Lemmas 2.11–2.13, Corollary 2.14 and Theorem 2.15, pp.4–5 (Layer 4.3.1); Corollary
  2.19, p. 6 (Layer 6.2.1).

- R. Kirby (ed.), *Problems in Low-Dimensional Topology*, in *Geometric Topology* (Athens,
  GA, 1993), AMS/IP Stud. Adv. Math. 2.2 (1997): Problems 1.15 (Property P), 1.16 (Property
  R), 1.31 (concordance in homology spheres), 1.36 (Alexander polynomial one), 1.45
  (winding-number-one satellite operators), 1.53 (mutation and concordance), 1.81 (cosmetic surgery), 3.45 (geometrization), 3.51 (virtual
  fibering), 3.60 (minimal volume), 4.34 (Smale conjecture), 4.126 (four-dimensional Smale
  conjecture), 5.2 (Zeeman's conjecture).
  Also Problems 1.19 (the Akbulut–Kirby conjecture), 1.41 (the shake genus) and 4.82 (a smooth
  structure on `(⋆ℝP⁴) # (⋆ℂP²)`, unresolved in Kirby's remarks); Problem 4.34 asks about
  `Diff(S⁴)`, Hatcher's theorem on `S³` being the Smale conjecture proper.
- A. Hatcher, *Notes on Basic 3-Manifold Topology*, https://pi.math.cornell.edu/~hatcher/3M/3Mfds.pdf:
  Theorem 1.1, Proposition 1.4, Theorem 1.5 (with the Basic Fact in its proof),
  Proposition 1.7, Theorem 1.9, Lemma 1.11, Propositions 1.12–1.14, Lemmas 1.16–1.18,
  Theorem 2.3, Theorem 2.5, Chapter 3 with Proposition 3.7 (a closed simply connected `3`-manifold
  is homotopy equivalent to `S³`) and Theorem 3.8 (the numbering is that of this file, `3Mfds.pdf`;
  the shorter `3M.pdf` on the same page lacks Lemma 1.10 and Corollary 1.15, so its
  Lemma 1.10 and Propositions 1.11–1.13 are this file's Lemma 1.11 and Propositions
  1.12–1.14, and its Lemmas 1.14–1.16 are this file's Lemmas 1.16–1.18).
- M. Hirsch, *Differential Topology*, Springer GTM 33 (1976): Chapter 2 §1; Chapter 4,
  Theorems 5.3, 6.1, 6.3, 6.6; Chapter 6 §1; Chapter 8, Theorems 1.3 and 3.1; Chapter 9, Theorems 3.5,
  3.6, 3.7, 3.10, 3.11 and Lemmas 3.8, 3.9. J. Lee, *Introduction to
  Smooth Manifolds*, 2nd ed., Springer GTM 218 (2013): Theorems 6.24, 9.25, 9.26. J. Lee,
  *Introduction to Riemannian Manifolds*, 2nd ed., Springer GTM 176 (2018): Theorem 5.25.
  Hirsch also: Chapter 2 (function-space topologies and the approximation theorems), Chapter 3
  (transversality), Chapter 4, Section 6 (tubular neighbourhoods, Theorems 6.3 and 6.5), and
  Chapter 8 (isotopy and gluing). Lee, *Introduction to Riemannian Manifolds*, also Chapters 2 and
  8 (volume, curvature).
- R. Palais, *Extending diffeomorphisms*, Proc. Amer. Math. Soc. 11 (1960), 274–277;
  *Local triviality of the restriction map for embeddings*, Comment. Math. Helv. 34 (1960),
  305–312. J. Cerf, *Topologie de certains espaces de plongements*, Bull. Soc. Math. France 89
  (1961), 227–380.
  A. Kosinski, *Differential Manifolds*, Academic Press (1993), Chapter VI, Section 1 (the
  connected sum).
- C. Rourke, B. Sanderson, *Introduction to Piecewise-Linear Topology*, Springer (1972),
  Chapters 2 and 3. A. Hatcher, *Algebraic Topology*, Cambridge (2002),
  https://pi.math.cornell.edu/~hatcher/AT/AT.pdf, Appendix, Proposition A.1. J. Munkres, *Elementary Differential Topology*, Ann. of Math. Stud. 54 (1966),
  §10, Theorems 10.5 and 10.6. J. H. C. Whitehead, *On C¹-complexes*, Ann. of Math. 41 (1940),
  809–824. E. Moise, *Geometric Topology in Dimensions 2 and 3*, Springer GTM 47 (1977),
  Theorems 35.3 and 36.2. R. H. Bing, *An alternative proof that 3-manifolds can be
  triangulated*, Ann. of Math. 69 (1959), 37–65.
  Rourke–Sanderson also: Chapters 1–2 (polyhedra, PL maps, products) and Chapter 3 (links,
  combinatorial manifolds, collapse). Hatcher, *Algebraic Topology*, also: Section 2.2 and Theorem
  2.35 (cellular chains), Corollary 3.45 (Alexander duality, from the relative form Theorem 3.44),
  Proposition 3.29 (a connected noncompact `n`-manifold has `Hᵢ = 0` for `i ≥ n`, for Layer 8.6).
- M. Brown, *A proof of the generalized Schoenflies theorem*, Bull. Amer. Math. Soc. 66 (1960),
  74–76; *Locally flat imbeddings of topological manifolds*, Ann. of Math. 75 (1962), 331–341.
  R. Kirby, *Stable homeomorphisms and the annulus conjecture*, Ann. of Math. 89 (1969),
  575–582. F. Quinn, *Ends of maps III: dimensions 4 and 5*, J. Differential Geom. 17 (1982),
  503–521. R. Daverman, G. Venema, *Embeddings in Manifolds*, AMS GSM 106 (2009).
- J. Cerf, *Sur les difféomorphismes de la sphère de dimension trois (Γ₄ = 0)*, Lecture Notes
  in Math. 53 (1968), Théorème 1 and Corollaire 1. A. Hatcher, *A proof of the Smale
  conjecture, Diff(S³) ≃ O(4)*, Ann. of Math. 117 (1983), 553–607. S. Smale, *Diffeomorphisms
  of the 2-sphere*, Proc. Amer. Math. Soc. 10 (1959), 621–626, Theorems A and B and
  Theorem 4 (AMS open archive). T. Watanabe, *Some exotic
  nontrivial elements of the rational homotopy groups of Diff(S⁴)*, arXiv 1812.02448,
  Theorem 1.1.
  Watanabe also: Remark 1.2. M. Kervaire, J. Milnor, *Groups of homotopy spheres I*, Ann. of Math.
  77 (1963), 504–537.
- W. B. R. Lickorish, *An Introduction to Knot Theory*, Springer GTM 175 (1997): Chapter 1
  (diagrams, Reidemeister moves, braids), Chapter 2 (Theorems 2.2, 2.4, 2.12), Chapter 3
  (Theorem 3.5, Proposition 3.7), Chapter 5, Chapter 6 (Theorem 6.5), Chapter 8 (Theorems
  8.6, 8.9, 8.19), Chapter 9, Chapter 10, Chapter 12, Chapter 15, Chapter 16 (Proposition
  16.10). G. Burde, H. Zieschang, *Knots*, 2nd ed., de Gruyter (2003), Chapter 1. D. Rolfsen,
  *Knots and Links*, Publish or Perish (1976), Chapter 9. J. Birman, *Braids, Links, and
  Mapping Class Groups*, Ann. of Math. Stud. 82 (1974), Chapter 2. W. B. R. Lickorish, *A
  representation of orientable combinatorial 3-manifolds*, Ann. of Math. 76 (1962),
  531–540; *A finite set of generators for the homeotopy group of a 2-manifold*, Proc.
  Cambridge Philos. Soc. 60 (1964), 769–778, and its corrigendum, 62 (1966), 679–681.
  B. Farb, D. Margalit, *A Primer on Mapping Class Groups*, Princeton Math. Ser. 49 (2012),
  Lemma 2.1, Proposition 2.4, Theorem 2.5, Theorem 4.1.
  Lickorish, *An Introduction to Knot Theory*, also: Chapter 1, pp. 3–4 (Reidemeister's
  theorem, stated there in prose and unnumbered), and Proposition 16.10 on p. 187. Burde–Zieschang also Chapter 8. Rolfsen also Chapter 2, Section E, Chapter 5 and
  Chapter 7. Birman, *Braids, Links, and Mapping Class Groups*, Theorem 2.3. R. Crowell, R. Fox,
  *Introduction to Knot Theory*, Springer GTM 57, Chapters VI–VII.
- A. Hatcher, *The Kirby torus trick for surfaces*, arXiv 1312.3518 (v3, 2025): §1, Theorems A
  and B with the refinements stated after them and after the proof of Theorem B, §2 (the
  Handle Smoothing Theorem), §3 (the torus trick for `0`-handles).
- P. Freyd, D. Yetter, J. Hoste, W. B. R. Lickorish, K. Millett, A. Ocneanu, *A new polynomial
  invariant of knots and links*, Bull. Amer. Math. Soc. 12 (1985), 239–246, pp. 241–244
  (the Freyd–Yetter, Hoste and Lickorish–Millett existence proofs, with the descending
  diagrams of pp. 242–243) and p. 244 (mutation, pretzel permutations and the two-tangle
  composition formula). L. Kauffman, *State models and the Jones polynomial*, Topology 26
  (1987), 395–407, §2: Lemmas 2.3–2.4, Propositions 2.5 and 2.7, Theorems 2.6 and 2.8 (copy
  on A. Ranicki's page at the University of Edinburgh). L. Kauffman, *An invariant of regular
  isotopy*, Trans. Amer. Math. Soc. 318 (1990), 417–471 (author's page), the skein and curl
  conventions of the regular-isotopy polynomial. L. Ng, *Knot and braid invariants from
  contact homology I*, Geom. Topol. 9 (2005), 247–297, §8.6 (author's page).
  V. Jones, *A polynomial invariant for knots via von Neumann algebras*, Bull. Amer. Math.
  Soc. 12 (1985), 103–111, Theorems 5, 7–11 and 14–24 (Corollary 24 is in error: the
  bound `6.5` must be `8`). V. Jones, *Hecke algebra representations of braid groups and
  link polynomials*, Ann. of Math. 126 (1987), 335–388, §7.5 (author's page). E. Artin,
  *Theory of braids*, Ann. of Math. 48 (1947), 101–126, Theorems 8–16 (copy on A. Ranicki's
  page at the University of Edinburgh). E. Artin, *Theorie der Zöpfe*, Abh. Math. Sem. Univ.
  Hamburg 4 (1925), 47–72 (the defining relations). H. Bohnenblust, *The algebraical
  braid group*, Ann. of Math. 48 (1947), 127–136 (the algebraic proof that the relations
  are complete). J. Birman, T. Brendle, *Braids: a survey*, in *Handbook of Knot Theory*
  (2005), §§1.1–1.2 (author's page). S. Lambropoulou,
  *Braid structures in knot complements, handlebodies and 3-manifolds*, arXiv 1811.11701,
  §3. H. Morton, *Threading knot diagrams*, Math. Proc. Cambridge Philos. Soc. 99 (1986),
  247–260, Theorem 1. K. Perko, *On the classification of knots*, Proc. Amer. Math. Soc.
  45 (1974), 262–266. J. Hoste, M. Thistlethwaite, J. Weeks, *The first 1,701,936
  knots*, Math. Intelligencer 20 (1998), 33–48, Table 1. T. Kindred, *A geometric proof of
  the flyping theorem*, arXiv 2008.06490, §2.2, Definition 2.11 and footnote 11. M. Teragaito, *Hyperbolic knots with
  three toroidal Dehn surgeries*, Bull. Aust. Math. Soc. (2018), DOI
  10.1017/S0004972718000539, §4.1. A. Lecuona, A. Wand, *Fibered ribbon pretzels*, arXiv
  2408.03644, §2. L. Kauffman, S. Lambropoulou, *On the classification of rational
  tangles*, arXiv math/0311499, §§2–4. I. Marin, *The cubic Hecke algebra on at most 5
  strands*, arXiv 1110.6621, Introduction and Theorem 1.2. J.-B. Meilhan, *Milnor
  invariants*, arXiv 1812.03319, §§3.1–3.3. C. Manolescu, *Knots, invariants and open
  problems*, SIAM Review (2025), DOI 10.1137/25M1806703, §2. V. Jones, *Index for
  subfactors*, Invent. Math. 72 (1983), 1–25, §§4–5. H. Wenzl, *Hecke algebras of type
  Aₙ and subfactors*, Invent. Math. 92 (1988), 349–383, §2. F. Goodman, P. de la Harpe,
  V. Jones, *Coxeter Graphs and Towers of Algebras*, MSRI Publ. 14, Springer (1989),
  Chapter 2. V. Turaev, *A
  simple proof of the Murasugi and Kauffman theorems on alternating links*, L'Enseignement
  Math. 33 (1987), 203–225. C. Armond, A. Lowrance, *Turaev genus and alternating
  decompositions*, Algebr. Geom. Topol. 17 (2017), arXiv 1507.02771, §2. H. Morton, *Seifert
  circles and knot polynomials*, Math. Proc. Cambridge Philos. Soc. 99 (1986), 107–109.
  J. Franks, R. Williams, *Braids and the Jones polynomial*, Trans. Amer. Math. Soc. 303
  (1987), 97–108. E. Kalfagianni, *A Jones slopes characterization of adequate knots*,
  arXiv 1601.03307 (v3; Indiana Univ. Math. J. 67 (2018), 205–219), §2 and Theorem 3.2.
  S. Kolay, *Knot colorings: coloring and Goeritz matrices*, arXiv 1910.08044 (2019), §4,
  Proposition 4. B. Bode, *Knotted fields and real algebraic links*, PhD thesis, University
  of Bristol (2018), §2.1, Definitions 2.2–2.4.
- H. Schubert, *Über eine numerische Knoteninvariante*, Math. Z. 61 (1954), 245–288; *Knoten
  mit zwei Brücken*, Math. Z. 65 (1956), 133–170. L. Kauffman, S. Lambropoulou, *On the
  classification of rational knots*, L'Enseignement Math. 49 (2003), arXiv math/0212011,
  Theorems 1–3. Y. Hashizume, *On the uniqueness of the decomposition of a link*, Osaka Math.
  J. 10 (1958), 283–300. S. Melikhov, *Local knots and the prime factorization of links*,
  arXiv 2511.19579, §§2–3.
- F. Garside, *The braid group and other groups*, Quart. J. Math. Oxford 20 (1969), 235–254.
  C. Squier, *The Burau representation is unitary*, Proc. Amer. Math. Soc. 90 (1984),
  199–202. L. Rudolph, *Nontrivial positive braids have positive signature*, Topology 21
  (1982), 325–327. P. Feller, *On the signature of positive braids*, BORIS Theses, Universität
  Bern, p. 22.
  D. Epstein et al., *Word Processing in Groups*, Jones and Bartlett (1992), Chapter 9.
  E. Elrifai, H. Morton, *Algorithms for positive braids*, Quart. J. Math. Oxford 45 (1994),
  479–497.
- H. Kondo, *Knots of unknotting number 1 and their Alexander polynomials*, Osaka J. Math. 16
  (1979), 551–559, Theorem 3, the linear system (*) and formula (8). M. Scharlemann,
  *Unknotting number one knots are prime*, Invent. Math. 82 (1985), 37–55. T. Kanenobu, H. Murakami, *Two-bridge knots with
  unknotting number one*, Proc. Amer. Math. Soc. 98 (1986), 499–502. S. Taylor, *Adding
  2-handles to sutured manifolds*, arXiv 0806.1572, for a second proof. C. Ernst, D. Sumners, *The growth of the
  number of prime knots*, Math. Proc. Cambridge Philos. Soc. 102 (1987), 303–315. O. Bernardi,
  *Bijective counting of tree-rooted maps and shuffles of parenthesis systems*, Electron. J.
  Combin. 14 (2007), arXiv math/0601684, Theorem 1.
- P. Kronheimer, T. Mrowka, *Witten's conjecture and Property P*, Geom. Topol. 8 (2004),
  295–310, arXiv math/0311489. D. Gabai, *Foliations and the topology of 3-manifolds III*,
  J. Differential Geom. 26 (1987), 479–536, §8. Y. Mathieu, *Closed 3-manifolds unchanged by
  Dehn surgery*, J. Knot Theory Ramifications 1 (1992), 279–296. M. Culler, C. Gordon, J. Luecke, P. Shalen,
  *Dehn surgery on knots*, Ann. of Math. 125 (1987), 237–300. L. Moser, *Elementary surgery
  along a torus knot*, Pacific J. Math. 38 (1971), 737–745. C. Gordon, J. Luecke, *Knots are
  determined by their complements*, J. Amer. Math. Soc. 2 (1989), 371–415. Y. Ni, Z. Wu,
  *Cosmetic surgeries on knots in S³*, J. Reine Angew. Math. 706 (2015), 1–17. J. Hanselman,
  *Heegaard Floer homology and cosmetic surgeries in S³*, J. Eur. Math. Soc. 25 (2023).
  Kronheimer–Mrowka also: Conjecture 1 and Theorem 2. K. Yasui, *Corks, exotic 4-manifolds and
  knot concordance*, arXiv 1505.02551. R. Gompf, A. Stipsicz, *4-Manifolds and Kirby Calculus*,
  AMS GSM 20 (1999), Section 4.1. J. Milnor, *Lectures on the h-cobordism Theorem*, Princeton
  (1965), Section 3; *A procedure for killing homotopy groups of differentiable manifolds*, Proc.
  Sympos. Pure Math. 3 (1961), 39–55, Section 1.
- C. Livingston, *A survey of classical knot concordance*, arXiv math/0307077, Theorem 2.2.
  A. Conway, *The Levine–Tristram signature: a survey*, arXiv 1903.04477, Propositions 2.3
  and 2.7, Theorems 2.9 and 2.12. L. Piccirillo, *The Conway knot is not slice*, Ann. of
  Math. 191 (2020), arXiv 1808.02923, Theorem 1.1, Proposition 1.4, Theorem 1.5. A. S.
  Levine, *Non-surjective satellite operators and piecewise-linear concordance*, Forum Math.
  Sigma 4 (2016), arXiv 1405.1125. M. Freedman, *The topology of four-dimensional manifolds*,
  J. Differential Geom. 17 (1982), 357–453. M. Freedman, F. Quinn, *Topology of 4-Manifolds*,
  Princeton (1990), Theorem 11.7B.
  Livingston also: Sections 2, 3.1 and 9.5. A. Tristram, *Some cobordism invariants for links*,
  Proc. Cambridge Philos. Soc. 66 (1969). J. Levine, *Invariants of knot cobordism*, Invent. Math.
  8 (1969), 98–110. J. Hudson, *Concordance, isotopy, and diffeotopy*, Ann. of Math. 91 (1970).
- G. Mostow, *Quasi-conformal mappings in n-space and the rigidity of hyperbolic space
  forms*, Publ. Math. IHÉS 34 (1968), 53–104. G. Prasad, *Strong rigidity of Q-rank 1
  lattices*, Invent. Math. 21 (1973), 255–286. J. Ratcliffe, *Foundations of Hyperbolic
  Manifolds*, 3rd ed., Springer GTM 149 (2019), Theorem 11.8.5, Chapter 12. W. Thurston, *The
  Geometry and Topology of Three-Manifolds*, Princeton lecture notes (1980),
  https://library.slmath.org/nonmsri/gt3m/, Chapters 3, 5, 6. C. Löh, *Measure homology and
  singular homology are isometrically isomorphic*, Math. Z. 253 (2006), arXiv math/0504103v2
  (whose numbering is cited), Definitions 3.7–3.9, 5.1, 5.2 and 5.6, Theorems 1.2, 3.3, 3.5,
  4.1, 5.7 and 5.9, Remark 3.6, Lemmas 3.10 and 3.11, Propositions 5.3 and 5.5, Corollary 6.2.
  N. Monod, *Continuous Bounded Cohomology of Locally Compact Groups*, Lecture Notes in Math.
  1758, Springer (2001), Lemma 7.2.6, Theorem 7.4.5. A. Zastrow, *On the (non)-coincidence of
  Milnor–Thurston homology theory with singular homology theory*, Pacific J. Math. 186 (1998),
  369–396, Theorem 3.4. P. Scott, *The geometries of
  3-manifolds*, Bull. London Math. Soc. 15 (1983), 401–487. C. Adams, M. Hildebrand,
  J. Weeks, *Hyperbolic invariants of knots and links*, Trans. Amer. Math. Soc. 326 (1991),
  1–56, §2 (pp. 2–4), Tables 1–2.
  G. Mostow, *Strong rigidity of locally symmetric spaces*, Ann. of Math. Stud. 78 (1973).
  Ratcliffe also: Chapters 4 and 8. W. Thurston, *Three-Dimensional Geometry and Topology, Vol.
  1*, Princeton (1997), Sections 3.4 and 3.8.
- D. Gabai, R. Meyerhoff, P. Milley, *Minimum volume cusped hyperbolic three-manifolds*,
  J. Amer. Math. Soc. 22 (2009), 1157–1215, arXiv 0705.4325; *Mom technology and hyperbolic
  3-manifolds*, arXiv 0910.5043, Theorem 1.1. I. Agol, *The virtual Haken conjecture* (with an
  appendix by Agol, Groves and Manning), Doc. Math. 18 (2013), 1045–1087, arXiv 1204.2810,
  Theorems 9.1 and 9.2.
- C. Papakyriakopoulos, *On Dehn's lemma and the asphericity of knots*, Ann. of Math. 66
  (1957), 1–26. J. Milnor, *A unique decomposition theorem for 3-manifolds*, Amer. J. Math. 84
  (1962), 1–7. F. Waldhausen, *On irreducible 3-manifolds which are sufficiently large*, Ann.
  of Math. 87 (1968), 56–88; *Heegaard-Zerlegungen der 3-Sphäre*, Topology 7 (1968),
  195–203. W. Jaco, P. Shalen, *Seifert fibered spaces in 3-manifolds*, Mem. Amer. Math. Soc.
  220 (1979). K. Johannson, *Homotopy equivalences of 3-manifolds with boundaries*, Lecture
  Notes in Math. 761 (1979). W. Thurston, *Three-dimensional manifolds, Kleinian groups and
  hyperbolic geometry*, Bull. Amer. Math. Soc. 6 (1982), 357–381. G. Perelman, arXiv
  math/0211159, math/0303109, math/0307245. J. Morgan, G. Tian, *Ricci Flow and the Poincaré
  Conjecture*, Clay Math. Monographs 3 (2007), arXiv math/0607607, Theorem 0.1 and
  Corollary 0.2.
  Scott, *The geometries of 3-manifolds*, also: Sections 1, 3, 4 and 5. L. Bessières, G. Besson,
  M. Boileau, S. Maillot, J. Porti, *Geometrisation of 3-manifolds*, EMS Tracts Math. 13 (2010),
  Introduction.
- M. Scharlemann, *Heegaard splittings of compact 3-manifolds*, arXiv math/0007144, §§2.1
  and 3.2, Theorems 3.4 and 3.7. T. Li, *Rank and genus of 3-manifolds*, J. Amer. Math. Soc. 26
  (2013), 777–829, arXiv 1106.6302, Theorem 1.1.
  Scharlemann also: Section 1, and Section 7 (the PL equivalence of any two triangulations of a
  `3`-manifold, for Layer 11.2). Li: Theorems 1.1 and 1.2. Hempel, *3-Manifolds*, also: Chapters 2
  and 3.
- D. Calegari, *Foliations and the Geometry of 3-Manifolds*, Oxford (2007),
  https://math.uchicago.edu/~dannyc/books/foliations/oupbook.pdf, Theorems 4.5, 4.35 and 4.38,
  §4.6. C. F. B. Palmeira, *Open manifolds foliated by planes*, Ann. of Math. 108 (1978),
  109–131.
  S. Novikov, *The topology of foliations*, Trudy Moskov. Mat. Obšč. 14 (1965), 248–278.
  W. B. R. Lickorish, *A foliation for 3-manifolds*, Ann. of Math. 82 (1965), 414–420.
  Calegari also: Chapter 4. A. Candel, L. Conlon, *Foliations I*, AMS GSM 23. W. Thurston, *A norm
  for the homology of 3-manifolds*, Mem. Amer. Math. Soc. 59 (1986), Theorems 1 and 2 and Section
  3. M. Yazdi, *On Thurston's Euler class one conjecture*, Acta Math. 225 (2020), arXiv
  1603.03822, Section 1 (inequalities (1) and (2), Definition 1.1, Theorem 1.2 and the Main
  Theorem), Section 3.3 and Proposition 3.12. D. Gabai, M. Yazdi, *The fully marked surface
  theorem*, Acta Math. 225 (2020). D. Gabai, *Foliations and the topology of 3-manifolds*, J.
  Differential Geom. 18 (1983), 445–503, Corollary 6.18. J. Milnor, J. Stasheff, *Characteristic
  Classes*, Ann. of Math. Stud. 76 (1974), Sections 9 and 10, Theorem 10.4, Corollary 11.12 and
  Chapter 12. A. Hatcher, *Vector Bundles and K-Theory*, author's page, Section 3.
- C. Manolescu, *Pin(2)-equivariant Seiberg–Witten Floer homology and the triangulation
  conjecture*, J. Amer. Math. Soc. 29 (2016), 147–176, arXiv 1303.2354, Corollary 1.3;
  *Lectures on the triangulation conjecture*, arXiv 1607.08163, Theorem 1.1, Example 2.2 and
  the diagram closing §2. E. C. Zeeman,
  *On the dunce hat*, Topology 2 (1964), 341–358.
  Manolescu, *Lectures on the triangulation conjecture*, also: Section 1. R. Kirby, L. Siebenmann,
  *Foundational Essays on Topological Manifolds, Smoothings, and Triangulations*, Ann. of Math.
  Stud. 88 (1977), Essays IV and V. I. Volodin, V. Kuznetsov, A. Fomenko, *The problem of
  discriminating algorithmically the standard three-dimensional sphere*, Russian Math. Surveys
  29:5 (1974), 71–172.
- M. Brittenham, S. Hermiller, *Unknotting number is not additive under connected sum*,
  arXiv 2506.24088, Theorem 1.2, §2 and Corollary 2.2. P. Feller, *Gordian adjacency for
  torus knots*, Algebr. Geom. Topol. 14 (2014), 769–793, arXiv 1301.5248, Theorems 2–3.
  S. Baader, *Note on crossing changes*, Q. J. Math. 57 (2006), 139–142; *Gordian distance
  and Vassiliev invariants*, arXiv math/0703786, §2. S. Baader, A. Kjuchukova, *Symmetric
  quotients of knot groups and a filtration of the Gordian graph*, Math. Proc. Cambridge
  Philos. Soc. 169 (2020), arXiv 1711.08144, §2. T. Kawamura, *The unknotting numbers of
  10₁₃₉ and 10₁₅₂ are 4*, Osaka J. Math. 35 (1998), 539–546, Theorem 1.3. P. Kronheimer,
  T. Mrowka, *Gauge theory for embedded surfaces I*, Topology 32 (1993), 773–826.
  J. Rasmussen, *Khovanov homology and the slice genus*, Invent. Math. 182 (2010), 419–447,
  arXiv math/0402131, Corollary 1.
- J. Hoste, *A note on Alexander polynomials of 2-bridge links*, arXiv 1907.03812, Theorem 1
  and §4. J. Przytycki, *3-coloring and other elementary invariants of knots*, Banach Center
  Publ. 42 (1998), arXiv math/0608172, Lemmas 1.5 and 2.2. W. Menasco, *Closed
  incompressible surfaces in alternating knot and link complements*, Topology 23 (1984),
  37–44, Theorem 1(b). W. Menasco, M. Thistlethwaite, *The Tait flyping conjecture*, Bull.
  Amer. Math. Soc. 25 (1991), 403–412; *The classification of alternating links*, Ann. of
  Math. 138 (1993), 113–171. M. Thistlethwaite, *Kauffman's polynomial and alternating
  links*, Topology 27 (1988), 311–318. S. Bleiler, *A note on unknotting number*, Math.
  Proc. Cambridge Philos. Soc. 96 (1984), 469–471. B. Burton, H. Chang, M. Löffler,
  A. de Mesmay, C. Maria, S. Schleimer, E. Sedgwick, J. Spreer, *Hard diagrams of the
  unknot*, Exp. Math. (2023), arXiv 2104.14076, §§1.1–1.2. C. Dowker, M. Thistlethwaite,
  *Classification of knot projections*, Topology Appl. 16 (1983), 19–31. O. Dasbach,
  X.-S. Lin, *A volumish theorem for the Jones polynomial of alternating knots*, Pacific J.
  Math. 231 (2007), 279–291, arXiv math/0604230, Theorem 3.1.
- H. Boden, M. Chrisman, H. Karimi, *The Gordon–Litherland pairing for links in thickened
  surfaces*, arXiv 2107.00426, §§2.2–2.3. M. Hedden, *Knot Floer homology of Whitehead
  doubles*, Geom. Topol. 11 (2007), 2277–2338. C. Balm, S. Friedl, E. Kalfagianni,
  M. Powell, *Cosmetic crossings and Seifert matrices*, Comm. Anal. Geom. 20 (2012),
  235–253, §§7.1–7.2. M. Powell, *The four-genus of a link, Levine–Tristram signatures and
  satellites*, J. Knot Theory Ramifications 26 (2017), arXiv 1605.06833, §§3–5. S. Friedl,
  *Topology*, lecture notes (2024), author's page, Lemma 7.3, Theorem 16.11 and footnote
  115. W. Whitten, *Knot complements and groups*, Topology 26 (1987), 41–44. J. Hempel,
  *3-Manifolds*, Ann. of Math. Stud. 86 (1976), Theorems 13.6–13.7. K. Reidemeister,
  *Homotopieringe und Linsenräume*, Abh. Math. Sem. Univ. Hamburg 11 (1935), 102–109.
  E. J. Brody, *The topological classification of the lens spaces*, Ann. of Math. 71
  (1960), 163–184. M. Freedman, F. Quinn, *Topology of 4-Manifolds*, Princeton (1990),
  §9.3, Theorem 9.3A.
