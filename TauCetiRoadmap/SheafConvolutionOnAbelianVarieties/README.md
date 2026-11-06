# Roadmap: sheaf convolution on abelian varieties

**Summary.** Construct convolution on the negligible quotient of perverse sheaves on an abelian variety, its character-twisted cohomological fibres, and its geometric and arithmetic Tannaka groups. Compute the Euler characteristics and Hodge–Tate multiplicities of smooth ample hypersurfaces. Clean characteristic cycles, minuscule representations and an exact exterior-weight classification identify their connected derived convolution groups. The family theory gives generic simultaneous-twist monodromy and a Galois-uniform product theorem; isogeny pullbacks lead to finite-fibre period maps.

## Scope and ownership

This roadmap owns generic vanishing on abelian varieties with its Fourier–Mellin proof, Simpson's linearity theorems for rank-one local systems on abelian varieties, the Fourier–Mukai transform for D-modules on an abelian variety with the Laumon–Rothstein equivalence and Schnell's structure theorems for the transforms of holonomic modules, the resulting structure of exceptional character loci, Euler-one rigidity, character-admissibility, the abelian convolution quotient and its fibre functors, the microlocal fibre functor and its cycle–weight dictionary, the arithmetic–geometric comparison for these categories, the hypersurface-specific microlocal applications, the exterior-weight obstruction, the family monodromy mechanism and its period application. Its finite permutation predicate is solely an acceptance-signature expansion of the Eulerian row; it adds no general Eulerian-number theory.

Mathlib already supplies finite subsets, binomial coefficients, derived categories and additive Serre localization. Tau Ceti supplies the abelian-variety carrier and the known-group finite-comodule Tannaka dictionary. These are inputs, rather than construction targets. EtaleCohomologyFoundations §§F.0–F.6 supplies the constructible categories and six operations; its §F.6, with the étale–Betti comparison of ComplexComparisonPartII §C6.6, supplies the Chern–Gauss–Bonnet comparison; EtaleDualityAndPerverseSheaves §§2.1–2.10, 3.3–3.5 and 5.10 supplies the perverse calculus, coefficient comparison and geometric-origin decomposition. The quotient here specializes their heart and Mathlib's localization to Euler-negligible sheaves.

AbelianSchemesAndArithmeticModuli §§A1.2, A1.8 and A2–A6 owns Weil's extension criterion, abelian schemes, duality, isogenies, the universal vector extension (hence the moduli space A♮ of §0.7), degree-one realizations and rigid Hom spaces; AbelianSchemesAndArithmeticModuliPartII §P1.1 owns the Poincaré bundle on A×A♮ with its universal relative connection. SchemeAndStackFoundations Layer 5 owns Chow operations, Chern classes and Riemann–Roch. SpringerResolutionAndCharacteristicCycles §§8.1, 8.6, 9.1, 9.4–9.5 and 9.7 owns coherent D-modules, their full characteristic cycles and regular holonomicity. The clean quotient and its convolution applications here differ from those full cycles. ComplexComparisonPartII §§C6.1 and C6.6 owns constructible topological coefficients and the étale–Betti comparison, and §§C5.1–C5.6 owns de Rham–Betti comparison, geometric Hodge theory and regular-singular connections. PadicHodgeTheory §§3.3 and 8.1–8.2 owns geometric p-adic comparison and its sign convention.

MotivesAndAlgebraicCycles §§6.1–6.3 and 6.8 owns abstract neutral reconstruction and tensor-isomorphism torsors. ReductiveGroups Layers 6–10, LieHighestWeight Layers 4, 6 and 8, SpinRepresentations Layers 4–5, and LieHighestWeightPartII §N2 own the generic group and highest-weight inputs. MordellLawrenceVenkatesh §§0.22–0.24 owns Lie-Goursat. ClassicalArithmeticCompletion §§2.18, 2.39, 2.56–2.57, 2.71 and 2.77–2.78 owns Eulerian numbers and all general Appendix C inequalities. This roadmap owns the bespoke Appendix B comparisons of §6.2, with their unbounded ranges, and their occupancy consequences: each comparison is calibrated to one occupancy estimate of LS Appendix B and has no use outside the exterior-power argument, and it is derived from the imported general bounds rather than restating them. FiniteGroupInvariants §10.5 owns Jordan's theorem on finite subgroups of general linear groups over characteristic-zero fields, its form for subgroups finite modulo scalars and the resulting bound on irreducible dimensions; the family detection argument of §7.4 consumes them and states no Jordan theorem of its own.

ShimuraData §§3.1–3.4 owns variations, their morphisms, subvariations, direct sums, holomorphic pullbacks and polarizations; it constructs no Hom, tensor or dual variation, and the Hom variation of two polarized integral variations, on which the transport relation of §9.3 is read, is owned here (§9.3), built on the fibrewise integral internal Hom of Hodge structures that Tau Ceti supplies. HodgeStructures L0–L3 owns pure integral Hodge structures, their polarizations and period-domain points. StableReductionPartII §§4.8, 6.3, 6.6, 6.12 and 6.14 owns curve level moduli, the full-level Torelli morphism and its finite fibres. JacobianChallenge Layer F and JacobianChallengePartII §2 own Abel–Jacobi morphisms. The fixed-linear-system period-finiteness arguments here consume these objects. This roadmap owns the transport Hodge relation theorem of §9.3 and its application to the period maps of §9.1: HodgeStructures stops at period-domain points, ShimuraData §§3.1–3.4 supplies variations and their morphisms, and ShimuraVarieties §§3.5b.1 and 3.5c treat period maps of polarized variations only through local nilpotent orbits and definability; none of them states the transport relation, its descent along split morphisms of variations or its comparison with period-map fibres. Exact additions needed of these owners are specified below.

FourierDeligneTransform owns kernel transforms and their composition law, built on the canonical compact-support direct image of EtaleCohomologyFoundations §0.8. Derived convolution has no separate construction here: §0.3 obtains it as the kernel transform of the difference kernel on A×A, and this roadmap owns only the identification of that transform with Ra_!(K⊠L) and the rigid symmetric monoidal structure it carries. The Fourier–Deligne transform and the Artin–Schreier and Kummer sheaves of that roadmap are not used; the characteristic-zero Fourier–Mellin and Fourier–Mukai transforms of §§0.4 and 0.8 are owned here.

## Conventions

All abelian varieties and geometric sheaf arguments are in characteristic zero. A variety is a separated scheme of finite type over its field. In Layer 7 the parameter X is a nonempty smooth connected complex variety, hence integral; the smooth-divisor space M in Layer 9 can be empty. Write k̄ for a chosen algebraic closure of k, use the identity as base point, and let F=Q̄_ℓ with its ℓ-adic topology. An F-valued constructible object is defined over some finite coefficient extension with a lisse lattice on each normal lisse stratum; comparison uses that coefficient essential image. Categories are essentially small in a fixed universe, enlarged for their fibre-functor group schemes as necessary. The total Tannaka groups are proalgebraic; a tensor-generated represented image is of finite type.

Set n=dim A, i:H↪A for a smooth ample divisor, L=O_A(H), d=[H]ⁿ/n!=χ(A,L)>0 and N=n!d. Hypersurface statements impose n≥2, so H is geometrically connected. Use K_H=i_*F[n−1] and G_H*=(G_H°)^der, the actual faithful image, distinguished from its simply connected cover. A group called simple is connected and noncommutative with simple derived Lie algebra, allowing a finite centre. A finite-type affine group over a field of characteristic zero whose identity component is reductive is called linearly reductive; in characteristic zero this is equivalent to semisimplicity of its finite-dimensional representations, and it allows finite component groups such as μ₂ or Q₈. Reductive without qualification means connected reductive. Comparisons of fibre characters identify represented groups up to inner conjugacy.

The Eulerian number A(n,q) is descent-indexed. For n≥1 extend it by zero to integral q outside 0≤q<n; retain the supplier's A(0,0)=1. In §5.4 the acceptance predicate is used only for n≥2. Shifts have the usual cohomological sign and the symmetry of complexes includes Koszul signs. Native Hodge–Tate weight of the cyclotomic representation is +1, so the summand labelled q by its differential-form degree has native weight −q.

The cohomological prime, the order prime of a finite character, and the residue characteristic of a reduction place are independent. In Layer 8 choose the order prime different from the residue characteristic to apply its prime-to-residue-characteristic avoidance theorem. Multiplication covers in characteristic zero allow every positive m, including m divisible by the cohomological prime. Fix arithmetic Frobenius in the geometric and cyclotomic transport actions; on prime-to-p character values the latter raises roots of unity to the pth power. Their combined eigenvalues have absolute value p^(1/2) for a degree-one place, with the corresponding residue-cardinality version at other places.

Define the derived negligible category by every perverse cohomology object being negligible, rather than by cancellation in the total Euler characteristic. The Serre quotient is the image of the perverse heart in the Verdier quotient; the whole Verdier quotient is triangulated. All pairings and period maps retain their integral lattice modulo torsion, polarization and marking convention. Period-fibre finiteness means finitely many points in each fibre of the polarized period map to the quotient of the period domain by the full integral isometry group of the reference lattice (§9.1); it asserts neither properness nor injectivity.

## Exact supplier contracts

### From Mathlib

Use `Finset.powersetCard` and `Finset.card_powersetCard` in Mathlib/Data/Finset/Powerset.lean for actual unordered subsets and their binomial cardinality, and `Nat.choose` in Mathlib/Data/Nat/Choose/Basic.lean, including choose(a,a)=1. `Equiv.Perm` and finite-set filtering supply the finite permutation count in §5.4. `AlgebraicGeometry.Scheme.Hom.smoothLocus` and `AlgebraicGeometry.Scheme.Hom.isOpen_smoothLocus` in Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean give, for a morphism locally of finite presentation, the open subset of its source at which it is smooth; with the closedness of images under the proper projection, this makes the smooth-member locus M of §9.1 open in the projective section space. `DerivedCategory` in Mathlib/Algebra/Homology/DerivedCategory/Basic.lean assumes an abelian category and `HasDerivedCategory`; it does not by itself select geometric constructible coefficients.

Use `CategoryTheory.ObjectProperty.SerreClassLocalization.abelian`, `CategoryTheory.ObjectProperty.SerreClassLocalization.preservesFiniteLimits` and `CategoryTheory.ObjectProperty.SerreClassLocalization.preservesFiniteColimits` in Mathlib/CategoryTheory/Abelian/SerreClass/Localization.lean. Their inputs are a Serre class, an additive functor and localization at the morphisms invertible modulo that class. These give the abelian quotient and exactness after the negligible class is proved Serre.

### From Tau Ceti

`TauCeti.AffineGroupSchemeCat` in TauCeti/AlgebraicGeometry/AffineGroupScheme/Basic.lean and `TauCeti.ReductiveAffineGroupSchemeCat` in TauCeti/AlgebraicGeometry/AffineGroupScheme/Reductive/Basic.lean supply affine and reductive group-scheme carriers over their stated affine bases and fields, and `TauCeti.FiniteTypeAffineGroupSchemeCat` in TauCeti/AlgebraicGeometry/AffineGroupScheme/FiniteType.lean supplies finite-type affine group schemes. The affine carrier requires affineness, rather than smoothness or finite type; the reductive carrier includes finite type over a field, smoothness and geometric connectedness (`TauCeti.geometricallyConnected_of_reductiveAffineGroupSchemeProperty`). The convolution groups of §1.3 and the subgroups B of §7.4 may be disconnected: they are objects of the finite-type carrier, and only their identity components are objects of the reductive carrier.

`TauCeti.AlgebraicGeometry.AbelianVariety` in TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean bundles a group object over the field, properness and geometric integrality; smoothness and commutativity are derived properties. `TauCeti.Tannaka.tensorAutFunctor` in TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean and `TauCeti.Tannaka.fgPointTensorIsoEquiv` in TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.lean provide the tensor automorphisms of scalar extension of finite comodules and their Hopf-algebra point comparison. Their input is a known bialgebra or commutative Hopf algebra, rather than an arbitrary perverse category.

`TauCeti.IsMinuscule` in TauCeti/Algebra/Lie/HighestWeight/Minuscule.lean is the single-Weyl-orbit definition of a minuscule weight used here (dominant integral, every weight of L(μ) in the Weyl orbit of μ), with `TauCeti.isMinuscule_zero` for the zero weight and `TauCeti.IsMinuscule.finrank_irreducibleQuotient_eq_card_orbit` for dim L(μ)=|W·μ|; the per-type table of nonzero minuscule weights is not at the pin and is the LieHighestWeightPartII contract below.

`TauCeti.Hodge.HodgeStructure.internalHom` in TauCeti/Geometry/Hodge/InternalHom/Basic.lean is the integral internal Hom of two integral pure Hodge structures of weights n₁ and n₂, carried by the lattice of integral linear maps and of weight n₂−n₁; `TauCeti.Hodge.HodgeStructure.Hom.exists_toIntLinearMap_eq_iff` in the same file says that an integral linear map underlies a morphism of integral Hodge structures exactly when its complexification lies in F⁰ of that internal Hom; and `TauCeti.Hodge.IsPolarization.internalHom` in TauCeti/Geometry/Hodge/InternalHom/Polarization.lean polarizes the internal Hom by the pullback of the tensor product of a polarization of the dual of the source and a polarization of the target. These are fibrewise inputs; the Hom variation over a base is the construction of §9.3.

`AlgebraicGeometry.Scheme.IdealSheafData.IsRelativeEffectiveCartier` in TauCeti/AlgebraicGeometry/EffectiveCartierDivisor/Relative.lean is an effective Cartier divisor whose closed subscheme is flat over the base, with `AlgebraicGeometry.Scheme.IdealSheafData.IsRelativeEffectiveCartier.comap` for its stability under arbitrary base change; it is the carrier of the universal divisor of §9.1. The fibre criterion of TauCeti/AlgebraicGeometry/EffectiveCartierDivisor/Fiber.lean assumes the closed subscheme already flat over the base, so §9.1 obtains the flatness of the universal divisor from the fibrewise criterion for locally principal closed subschemes of a flat finitely presented family (Stacks, Divisors, Lemma 19.9(3), tag 062Y).

### From TauCetiRoadmap.EtaleCohomologyFoundations

Consume §§F.0.2 and F.0.A2 for based geometric π₁ and the arithmetic exact sequence split by a rational point; §§F.2–F.3 for proper/smooth base change, projection and Künneth; §§F.4.0–F.4.6 for lattices, finite-extension rational coefficients, continuous lisse monodromy on normal schemes and geometric Galois actions; §§F.5–F.6 for duality, purity and the rational étale Gauss–Bonnet identity; ComplexComparisonPartII §C6.6 (`adicArtinComparison`) identifies rational étale and Betti cohomology, hence their Euler characteristics, over C. Abelian varieties are normal, so the lisse-monodromy comparison is used within this scope.

What EtaleCohomologyFoundations must provide (gap:geometric-character-comparisons): the geometric character comparison contract. For abelian varieties A and A′ over an algebraically closed characteristic-zero field, the geometric étale fundamental group of A×A′ based at the identity is the product of those of A and A′, and it is unchanged under extension to a larger algebraically closed field.

What EtaleCohomologyFoundations must provide (gap:closed-extension-constructible-comparison): the closed-extension constructible comparison contract. For an extension k⊂K of algebraically closed characteristic-zero fields and a variety X over k, pullback of constructible Q̄_ℓ-complexes from X to X_K is fully faithful on Hom and preserves the simple perverse constituents of tensor constructions of objects defined over k.

The first is used for the character spaces of §§0.1–0.2, the second for the extension comparison of §2.4.

For the convolution of §0.3 consume EtaleCohomologyFoundations §0.8 (`ClassicalAlgebraic.properSupports`) for the canonical lower shriek Rf_! of a compactifiable morphism: it is defined once, without a chosen compactification, on the unbounded D(X,Λ) for torsion Λ, is computed through any compactification by its canonical comparison isomorphism, and carries composition isomorphisms; for proper f its forget-supports map Rf_!→Rf_* is an isomorphism. Consume §F.2.4 for base change of Rf_! along every cartesian square, and §F.2.6 (`VanishingCycles.etaleKunneth`) for the external product K⊠L=p₁*K⊗ᴸp₂*L, defined there once, with its Koszul symmetry and associativity. Consume §F.2.7 for the projection formula, and §§F.1 and F.3 for the stability of Dᵇ_ctf under ⊗ᴸ and, for finite Λ with invertible annihilator, under Rf_!. Consume §§F.4.5–F.4.6 to carry these operations and their exchange isomorphisms through normalized adic systems, rationalization and the 2-colimit Dᵇ_c(X,Q̄_ℓ) of Dᵇ_c(X,E) over finite E/ℚ_ℓ. Consume §F.5 for the duality functor D_A=RHom(−,f^!Λ) of the structure morphism f:A→Spec k. No second lower shriek and no compactification of A×A occur in this roadmap.

### From TauCetiRoadmap.EtaleDualityAndPerverseSheaves

Consume §2.1 for bounded hearts, §§2.6–2.10 for perverse amplitudes, products and intermediate extensions, §§3.3–3.5 for rational coefficient extension and analytic comparison with its integral-lattice essential image, and §5.10 for the decomposition theorem of geometric origin over the complex numbers. These inputs retain ordinary versus perverse shifts and the coefficient restrictions just specified.

What EtaleDualityAndPerverseSheaves must provide (gap:serre-heart-verdier-comparison): the Serre-heart/Verdier comparison contract. For a bounded t-structure with heart P and Serre subcategory N, the thick category of objects with every t-cohomology in N gives a t-exact Verdier localization whose heart is P/N and whose heart inclusion is fully faithful.

What EtaleDualityAndPerverseSheaves must provide (gap:semisimple-proper-direct-image): the semisimple proper-direct-image contract. In characteristic zero, proper direct images of arbitrary semisimple perverse Q̄_ℓ-sheaves split into shifted semisimple perverse cohomology, including semisimple local systems without a geometric-origin hypothesis.

The latter contract supplies §§2.1, 7.3 and 7.5 for arbitrary characters. Tensoring a geometric-origin object by an arbitrary infinite-order character need not preserve geometric origin. Finite-order twists in Layers 3 and 8 use §5.10 directly. (LS Lemma 2.7, p.17, LS line 777; KW §13, KW line 1087.)

### From TauCetiRoadmap.MotivesAndAlgebraicCycles

Consume §§6.1–6.3 for neutral reconstruction, represented finite-type images and faithful-flat/closed-immersion criteria, and §6.8 for the affine tensor-isomorphism torsor with precomposition and postcomposition actions. On the category generated by one object its finite-type torsor has an F-point because F is algebraically closed; this uses finite type and gives inner-conjugacy independence of the chosen point.

What MotivesAndAlgebraicCycles must provide (gap:tannaka-kernel-exactness): the Tannaka kernel exactness contract. For a closed immersion L→G followed by a faithfully flat G→Q of affine group schemes, identify L with the scheme-theoretic kernel precisely when Q-representations are the L-trivial objects, maximal L-trivial subobjects descend, and every L-object embeds in a restriction of a G-object.

This is the general criterion of EHS Appendix A, Theorem A.1(iii), pp.20–21, EHS line 781.

### From TauCetiRoadmap.AbelianSchemesAndArithmeticModuli

Consume §A1.8(1) for Weil's extension criterion; §§A2.4 and A3.6 for χ(L), deg φ_L=χ(L)² and the finite translation stabilizer contained in ker φ_L; §§A3.1–A3.5 for multiplication isogenies, their kernel torsors and pairings; §A4.1 for Tate modules; §A4.2 (`AbelianVectorExtension`) for the universal vector extension and its identification with the moduli of rigidified line bundles with integrable connection, which supplies A♮=E(Â) in §0.7; §A5 for polarized degree-one Hodge realization; §A1.2 for rigidity and §A6.25 for relative Hom. Use its proper group carrier throughout.

For rational maps X⇢A from a smooth variety X over a field k to an abelian variety A over k, consume §A1.8(1): smoothness makes the local rings of X at its codimension-one points discrete valuation rings, properness of A extends the rational map over each of them, Weil's criterion then extends it to all of X, and separatedness of A gives uniqueness. Smoothness of X is needed: the inverse of the normalization of the nodal curve obtained from an elliptic curve E by gluing two distinct points is a rational map to E that is undefined at the node. This is used in §§1.5, 4.6 and 9.4. (K2, proof of Lemma 5.2.2, pp. 25–26, K2 line 1221; JV, proof of Proposition 6.1, p. 19, JV line 947.)

What AbelianSchemesAndArithmeticModuli must provide (gap:ample-divisor-albanese): the ample-divisor Albanese contract. For a smooth ample divisor H in an abelian variety A over an algebraically closed characteristic-zero field with dim A≥3, the homomorphism Alb(H)→A induced by the inclusion H↪A is an isomorphism.

This is used in §4.6 (weak Lefschetz for H of dimension at least two).

What AbelianSchemesAndArithmeticModuli must provide (gap:translation-stabilizer-family-quotient): the translation-stabilizer quotient contract. After shrinking a characteristic-zero family of smooth ample divisors, its finite geometric generic translation stabilizer descends and the family is pulled back from a smooth ample divisor family on the quotient abelian variety with trivial generic stabilizer.

What AbelianSchemesAndArithmeticModuli must provide (gap:isogeny-character-trace-decomposition): the isogeny character/trace contract. For every m>0 in characteristic zero, decompose the constant-sheaf pushforward under [m] into deck-character local systems and corresponding torsion line bundles, compatibly with pullback, trace and character idempotents for m dividing m′.

These specialize LS Lemmas 3.9 and 3.13 and Proposition 4.11 (LS lines 1025, 1137 and 1698); multiplication covers have no exclusion at the cohomological prime.

### From TauCetiRoadmap.AbelianSchemesAndArithmeticModuliPartII

Consume §P1.1 for the notation A♮=E(Â) with its forgetful map π:A♮→Â, for the pullback P♮=(id_A×π)⁎P of the rigidified Poincaré bundle to A×A♮ with its universal integrable connection ∇♮ relative to A♮, and for the identifications Lie(A♮)≅H¹_dR(A) and of the invariant differentials of A♮ with H¹_dR(A)^∨, with their Hodge sequences. These are the kernel data of the Fourier–Mukai transform of §0.8; no second construction of the universal vector extension or of the Poincaré connection is made here.

### From TauCetiRoadmap.SchemeAndStackFoundations

Consume §§5.1–5.4 and 5.8 for cycles, proper pushforward, intersection, Chern classes and Riemann–Roch, §5.5 for regular-immersion conormal and normal bundles, §2.18 (`DQCoh`, `totalDirectImage`, `torIndependent_baseChange`) for derived direct images of quasi-coherent complexes and their base change along Tor-independent squares, used for the fibres of the Fourier–Mukai transform in §0.8, and §2.21 (`NormalizedDualizing`, `NormalizedDualizing.localization_shift`) for normalized dualizing complexes over Noetherian rings and their localization, over which the local-duality support criterion is proved in §0.4; that criterion is a target of this roadmap and is not stated by SchemeAndStackFoundations.

What SchemeAndStackFoundations must provide (gap:conormal-gauss-geometry): the conormal geometry contract. Construct conormal cycles of closed subvarieties in T*A=A×H⁰(A,Ω¹_A) with the generic degree of their projection to the cotangent fibre.

### From TauCetiRoadmap.SpringerResolutionAndCharacteristicCycles

Consume §8.1 for the carrier of coherent D_X-modules, §§8.3–8.4 for good filtrations, §9.1 for the bounded derived categories and the direct image, inverse image and duality functors (the f_+, f^+ and D_X of HTT), §9.4 for holonomic modules, §8.6 for the full characteristic cycle of a coherent D-module with its generic-length multiplicities, §9.5 for the additivity of that cycle on holonomic exact sequences, and §9.7 for regular holonomicity. The map in §4.2 applies that cycle to a regular-holonomic realization and then takes its clean part; it does not construct a second D-module cycle.

What SpringerResolutionAndCharacteristicCycles must provide (gap:microdifferential-localization): the microdifferential localization contract, extending its Layer 8 (§§8.1–8.6), which has no microdifferential operators. For a smooth complex variety X, the sheaf of microdifferential operators on T*X and the microlocalization of coherent D_X-modules, exact and compatible with proper direct image and external product, whose support is the characteristic variety and whose generic length along each component is the multiplicity of the characteristic cycle.

This is used in §4.3 to construct the microlocal fibre functor (K1, §1.d and Theorem 5.10, K1 lines 254 and 1893).

### From TauCetiRoadmap.ComplexComparisonPartII

Consume §C6.1 for constructible topological coefficients and §C6.6 (`adicArtinComparison`) for the integral and rational étale–Betti comparison of cohomology and Euler characteristics; EtaleDualityAndPerverseSheaves §3.5 supplies the constructible and perverse comparison with its stable-lattice essential image. Consume §§C5.1–C5.3 for de Rham–Betti comparison, smooth proper variations and geometric Hodge theory, and §C5.6 for regular-singular connections and the holonomy of rank-one connections.

What ComplexComparisonPartII must provide (gap:holonomic-riemann-hilbert-index): the holonomic realization contract. The de Rham functor is an equivalence from the bounded derived category of complexes of D_X-modules with regular holonomic cohomology to the bounded constructible derived category of X^an with complex coefficients, t-exact for the perverse t-structure, identifying regular holonomic modules with complex perverse sheaves, compatible with Verdier duality, with proper direct image and external product, and with twisting by an algebraic line bundle with integrable connection (the de Rham complex of M⊗(L,∇) is that of M tensored over C with the horizontal sections of ∇); and it transports characteristic cycles compatibly with proper image, external product, isogenies and the index formula, with independence of the integral cycle under coefficient realization.

What ComplexComparisonPartII must provide (gap:stein-perverse-artin-vanishing): the Stein Artin-vanishing contract. For a Stein complex manifold V and a bounded complex K of sheaves of F-vector spaces on V, constructible for a locally finite complex-analytic stratification and in the perverse range pD^(≥0), the compactly supported cohomology H^i_c(V,K) vanishes for i<0.

This is used in §0.4 for the universal cover of an abelian variety (BSS, proof of Proposition 2.7, p. 4, BSS line 188). The derived equivalence is used in §0.9, where an arbitrary bounded constructible complex is realized as a complex with regular holonomic cohomology, and in §§1.5 and 4.3; an equivalence of the perverse hearts alone does not realize a complex such as δ₀⊕δ₀[1], whose realization has two nonzero cohomology modules. The cycle is the one supplied by SpringerResolutionAndCharacteristicCycles §8.6. The abelian clean index formula is used at KW Proposition 10.1, p.22, KW line 805; K2 Definition 2.2.1, p.13, K2 line 628.

### From TauCetiRoadmap.DiophantineApproximationAndTranscendence

Consume §3.5 for the Schneider–Lang criterion in its exponential form, for the groups 𝔾_a^r×𝔾_m^s. That form does not cover the group used in §0.7(c), an extension of an abelian variety by 𝔾_m.

What DiophantineApproximationAndTranscendence must provide (gap:schneider-lang-commutative-groups): the Schneider–Lang commutative-group contract. For a connected commutative algebraic group G over Q̄ and an analytic homomorphism ψ:Cⁿ→G(C) whose differential at the origin is defined over Q̄, if a subgroup Γ⊂Cⁿ contains n elements linearly independent over C and ψ(Γ)⊂G(Q̄), then the Zariski closure of ψ(Cⁿ) is an algebraic subgroup of G of dimension at most n.

This is the criterion quoted in the proof of Sim Proposition 3.4, pp. 369–370, Sim line 379; it is used in §0.7(c) to show that a Q̄-point of A♮ with Q̄-valued holonomy is a torsion point, which is the step of §0.7(b) that makes a translate of a character subtorus with Betti and de Rham points defined over Q̄ contain a point of finite order (Sim, Theorem 3.3, p. 369, Sim line 367).

### From TauCetiRoadmap.PadicHodgeTheory

Consume §§3.3 and 8.1–8.2 for proper smooth Hodge–Tate comparison, tensor operations, duality and HT(Q_p(1))=+1. The q=1 differential summand of H¹ has native weight −1.

What PadicHodgeTheory must provide (gap:hodge-tate-image-cocharacter): the Hodge–Tate image cocharacter contract. For a Hodge–Tate p-adic representation, comparison of graded and ordinary fibre functors on its tensor-generated category gives a cocharacter of the Zariski closure of its Galois image over C_p, up to conjugacy, with its native Hodge–Tate weights.

No closure of Hodge–Tate representations under arbitrary extensions is used. (LS Lemma 3.14, pp.26–27, LS line 1191.)

### From TauCetiRoadmap.ReductiveGroups and representation theory

ReductiveGroups Layer 3 provides identity components and component groups; Layer 6 the characteristic-zero equivalence of reductivity and linear reductivity for smooth connected groups, derived groups, central isogenies and the simply connected and adjoint forms; Layer 7 Borel subgroups and maximal tori with their conjugacy, and root data with their Weyl groups; Layer 8 the isomorphism theorem for split reductive groups, from which, with the conjugacy of Layer 7, the outer automorphism group of a semisimple group embeds in the finite automorphism group of its based root datum; and Layer 10 rational highest-weight representations with their classification by dominant weights of the torus lattice. LieHighestWeight Layers 4 and 6 provides irreducible highest weights, Weyl dimensions and the minuscule Pieri rule; Layer 8 provides dimensions 27 and 56. SpinRepresentations Layers 4–5 provides the spin and half-spin modules and dimensions. LieHighestWeightPartII §N2 provides classical highest-weight comparisons.

What LieHighestWeightPartII must provide (gap:minuscule-weight-table): the minuscule-weight-table contract. Over an algebraically closed characteristic-zero field, for each simple type the nonzero minuscule dominant weights are A_r: all fundamental weights of dimensions choose(r+1,k), B_r: ω_r of dimension 2^r, C_r: ω₁ of dimension 2r, D_r: ω₁ of dimension 2r and ω_(r−1),ω_r of dimension 2^(r−1), E₆: ω₁,ω₆ of dimension 27, E₇: ω₇ of dimension 56, and none for E₈, F₄ or G₂.

Minuscule is `TauCeti.IsMinuscule` (the weights form a single Weyl orbit), so the zero weight, with orbit {0}, is minuscule in every type, E₈ included; it gives the one-dimensional trivial representation. The contract classifies the nonzero weights only, as the paragraph and table of K1 before Corollary 1.10 (pp. 11–12, K1 line 433) list only nontrivial minuscule representations; the hypersurface application excludes the zero weight independently because N=n!d≥6.

MordellLawrenceVenkatesh §§0.22–0.24 supplies the two-factor Lie-Goursat graph alternative and its finite-product consequence. These are used on connected noncommutative simple derived factors, rather than on arbitrary abstract simple groups.

### From TauCetiRoadmap.FiniteGroupInvariants

Consume §10.5 for Jordan's theorem: `jordanBound n` is the least J such that every finite subgroup of GL_n(C) has an abelian normal subgroup of index at most J; `jordan_exists_abelian_normal_index_le` gives, over every field F of characteristic zero, an abelian normal subgroup of index at most `jordanBound n` in every finite subgroup of GL_n(F), the index taken inside the finite subgroup; `jordan_exists_abelian_normal_index_le_of_finite_map` gives the same for a subgroup of GL_n(F) with finite image in PGL_n(F); and `finrank_le_jordanBound` bounds by `jordanBound n` the dimension of every irreducible finite-dimensional representation, over an algebraically closed F of characteristic zero, of such a subgroup. Characteristic zero is part of each statement, as in characteristic p the groups SL₂(𝔽_q)⊂GL₂(𝔽̄_p) have no abelian subgroups of index bounded independently of q. These are used in §7.4 with n=N=dim V_H and F=Q̄_ℓ; no Jordan constant is computed here.

### From TauCetiRoadmap.ClassicalArithmeticCompletion

Consume §§2.18 and 2.39 for the descent-indexed Eulerian row, sum, symmetry, recurrence and finite-difference identity; §2.56 for unimodality; §§2.57 and 2.71 for exponential and factorial bounds; §2.77 for the square-separation inequality and §2.78 for 27A(n,2)<A(n,1)² when n≥11. Keep their ranges: for n=10 the last comparison is 1,291,680>1,026,169, and fails. No general Appendix C target is reconstructed here. The bespoke Appendix B comparisons, which this supplier does not state, are the target §6.2 of this roadmap and are derived from these bounds.

### From TauCetiRoadmap.DeligneWeightsAndPurity

Consume §§0.1–0.3 and 0.11 for Weil numbers, powers and inverse eigenvalues, and §1.4 for the abelian-variety Weil estimate. In the degree-one-place convention of Layer 8, geometric transport has inverse weight-one eigenvalues and cyclotomic transport contributes p, so the product has absolute value √p. It has no root-of-unity eigenvalue. For p=2 this modulus is √2, rather than 1. (LS Lemma 4.8, pp.34–35, LS line 1591.)

### From TauCetiRoadmap.ShimuraData and HodgeStructures

Consume ShimuraData §3.1 (`Variation`, `variationMk`, `variationPullback`) and §3.2 (`VariationHom`, `variationSub`, `variationDirectSum`, whose flat idempotent endomorphisms split a variation) for variations, their morphisms, subvariations, direct sums and holomorphic pullback, and §§3.3–3.4 (`RationalPolarizedVariation`, `polarizedIntegralVariation`, `integralVariationMk`, `integralVariationPullback`) for rational and integral polarized variations and their pullback. ShimuraData constructs no Hom, tensor or dual variation: the Hom variation of §9.3 is a target of this roadmap, built fibrewise on the internal Hom of Tau Ceti named above. Consume HodgeStructures L0–L3 for the pure structures, the positive definite Hodge metric of a polarization (L1) and period-domain points with the integral isometry group (L3). Combine these with ComplexComparisonPartII §§C5.2–C5.3 for the geometric variation. AlgebraicModuliForArithmeticGeometry §1.1 supplies the projective bundle P_S(E)=Proj_S Sym(E) in the quotient convention, with its tautological quotient π*E→O(1), its integer twists and their base change, and §1.7 (`rankLocus` with r=0) supplies the zero scheme of a map of finite locally free sheaves as a closed subscheme commuting with base change; neither section constructs a universal divisor. The projective space of sections P(H⁰(A,L)), whose points are nonzero sections modulo scalars, is the bundle of §1.1 on E=H⁰(A,L)^∨, and its universal divisor 𝒟⊂A×P(H⁰(A,L)), the zero scheme of the tautological section of pr₁*L⊗pr₂*O(1), is formed in §9.1 as a relative effective Cartier divisor in the Tau Ceti carrier named above; the smooth-member locus M⊂P(H⁰(A,L)) is open by Mathlib's open smooth locus (`AlgebraicGeometry.Scheme.Hom.isOpen_smoothLocus`) and the closedness of images under the proper projection, and AlgebraicModuliForArithmeticGeometry §2.1 (Hilbert and Quot representability) is not used.

What ShimuraData must provide (gap:bounded-norm-orbit-hodge-loci): the bounded-norm orbit Hodge-locus contract. For an integral polarized weight-zero variation on a smooth complex algebraic base, integral (0,0) classes of polarization norm at most K form an algebraic space finite over the base, and the Hodge locus projected from one fixed flat-section orbit is closed algebraic, also after clearing one fixed rational denominator.

This is CDK Theorem 1.1 and Corollary 1.3, p.2, CDK line 54; countable-union algebraicity alone does not give this closedness.

### From TauCetiRoadmap.StableReductionPartII and JacobianChallengePartII

Consume StableReductionPartII §4.8 for the fine smooth full-level curve scheme M_g[N] with its universal curve, §§6.3 and 6.12 for the full-level Torelli morphism formed from the relative Jacobian, and §§6.6 and 6.14 for its geometric fibres. At full level N≥3 the Torelli fibres have size at most two, with the two signs identified for hyperelliptic curves. JacobianChallenge Layer F supplies pointed Abel–Jacobi over fields; JacobianChallengePartII §§2.1–2.4 supplies relative Abel morphisms and their base change.

What StableReductionPartII must provide (gap:polarized-integral-jacobian-comparison): the polarized integral Jacobian contract, extending the Hodge-bundle comparisons of its §§6.7 and 6.13 along the Torelli morphism of §6.12. For every smooth proper complex curve family, the Abel–Jacobi comparison H¹(J(C),ℤ)≅H¹(C,ℤ) is an isomorphism of polarized integral weight-one variations, identifies the canonical principal polarization with cup product, and commutes with base change and the Torelli period map.

What JacobianChallengePartII must provide (gap:relative-pointed-albanese): the relative pointed Albanese contract. For a pointed smooth projective curve C of genus at least one, a reduced connected parameter scheme T and a pointed T-map C×T→A×T to a constant abelian scheme, there is a unique factorization through a homomorphism J(C)×T→A×T, compatible with base change in T.

The field statement and Torelli are JV Proposition 6.1, pp.19–20, JV line 941, and Theorem 12.1, p.38, JV line 1713; the relative and polarized requirements are retained explicitly.

### From TauCetiRoadmap.FourierDeligneTransform

Consume its kernel transforms, which are built on the canonical lower shriek of EtaleCohomologyFoundations §0.8 and take no compactification argument. The data are morphisms π:V→S and π′:V′→S, a torsion coefficient ring Λ, a kernel 𝒦 in D(V×_SV′,Λ) and an integer a. The kernel transform is the functor K↦Rp₂!(p₁*K⊗ᴸ𝒦)[a] from D(V,Λ) to D(V′,Λ), where p₁ and p₂ are the projections of V×_SV′. Its composition isomorphism identifies the transform of 𝒦 followed by that of a kernel 𝒦′ on V′×_SV″ with the transform of the composite kernel Rp₁₃!(p₁₂*𝒦⊗ᴸp₂₃*𝒦′) on V×_SV″, with the shifts added. The diagonal kernel Δ_!Λ gives the identity functor. Its adic and Q̄_ℓ forms are the realization of the torsion ones through EtaleCohomologyFoundations §§F.4.5–F.4.6, not a second construction.

What FourierDeligneTransform must provide (gap:kernel-composition-coherence): the kernel-composition coherence contract. The composition isomorphisms of kernel transforms are natural in both kernels, associative for three composable kernels and unital for the diagonal kernel on either side.

The convolution of §0.3 is the case V=V′=A over S=Spec k with the difference kernel, and its associator and unit come from these composition isomorphisms.

## How to read the build

Layer 0 constructs characters, obtains convolution as a kernel transform, proves generic vanishing by the Fourier–Mellin transform, proves the negligible quotient laws, proves Simpson's linearity theorems and the Fourier–Mukai theory of D-modules on an abelian variety (§§0.7–0.8), and then determines the exceptional character loci (§0.9). Layer 1 gives twisted fibres and represented groups; Layer 2 compares arithmetic and geometric groups. Layer 3 computes the hypersurface data. Layer 4 reduces its connected derived image to minuscule possibilities. Layers 5–6 solve the exterior-weight obstruction and identify the classical groups. Layer 7 converts convolution groups into family monodromy; Layer 8 makes the product conclusion uniform along character orbits. Layer 9 constructs the period maps (§9.1), proves fibre finiteness for surfaces by Torelli (§9.2), proves the transport Hodge relation theorem for polarized integral variations (§9.3) and deduces fibre finiteness in every dimension (§9.4). Each target lists the inputs its statement and the indicated proof route use.

## Layer 0: characters, convolution and negligible objects

### 0.1 Geometric character space

For an abelian variety A over a characteristic-zero field k, a chosen algebraic closure k̄, and coefficient field F=Q̄_ℓ, put Π(A)=Hom_cont(π₁ᵉᵗ(A_k̄,0),F×). It is an abelian group under multiplication of characters. For a positive-dimensional abelian subvariety B⊂A_k̄, let T_B be the subgroup of characters trivial on the image of π₁ᵉᵗ(B,0). A torsion character has finite image; a torsion coset is τT_B with τ of finite order. On A^c use abelian subvarieties of A^c, including those coupling coordinates. This is a set with group structure; it is not asserted to be an algebraic F-torus. (LS, §4, p. 30, definitions preceding Lemma 4.4; pp. 34–36, finite-order character actions; LS line 1388.)

Throughout this subsection, char(k)=0; ℓ is a prime; all fundamental groups are geometric and based at the identity.

Its API includes the following facts.

- Multiplication, inverse and unit are pointwise; restriction and pullback are group homomorphisms.
- The product decomposition of geometric π₁ induces Π(A×A′)≅Π(A)×Π(A′).
- χ belongs to τT_B exactly when χτ⁻¹ restricts trivially to π₁(B).
- χ is torsion exactly when it factors through A[m] for some m>0; this concerns finite-order characters only.

One proof route is as follows. Import the geometric étale fundamental group, its finite-cover equivalence and the torsion/isogeny description for abelian varieties. Define the subgroup as a restriction kernel. Use π₁(A×A′)=π₁(A)×π₁(A′) to identify product characters. Keep the algebraic Betti-character torus and continuous étale characters distinct.

**Checks.**

- For A of dimension zero the character space has one element and no proper T_B occurs.
- For dim A>0, B=A gives T_A={1}; B=0 is excluded because its kernel would be the whole character space.
- For c=2, restriction to the anti-diagonal a↦(a,−a) gives χ₁χ₂⁻¹, so the diagonal character locus χ₁=χ₂ is a proper restriction kernel; restriction to a↦(a,a) instead gives χ₁χ₂=1. Coordinate-only exceptions miss both.
- Π(A^c)≅Π(A)^c, with coordinate restrictions fixed.
- Proper torsion cosets have codimension at least one in the torsion-point counting sense.

*Needs:* Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety`; AbelianSchemesAndArithmeticModuli §§A3.1–A3.5; EtaleDualityAndPerverseSheaves §§3.3–3.5; EtaleCohomologyFoundations §§F.0.2, F.4.5; geometric character comparison contract; isogeny character/trace contract.

### 0.2 Origin-normalized character sheaf

For χ∈Π(A), construct the rank-one lisse F-sheaf Lχ on A_k̄ with monodromy χ. If χ is fixed by Gal(k̄/k), extend its representation across π₁(A,0)=π₁(A_k̄,0)⋊Gal(k̄/k) by making the identity-section factor act trivially. This is the unique descent with a chosen trivialization at 0 fixed by Galois. Its multiplicative structure a⁎Lχ≅Lχ⊠Lχ is normalized at (0,0) and coherent. (LS, Definitions 2.3–2.4, p. 15; Lemma 2.5, p. 16; LS line 693.)

Throughout this subsection, use the identity-section splitting; descent is asserted only for Galois-invariant χ.

Its API includes the following facts.

- The geometric monodromy is χ and the origin-normalized arithmetic monodromy is trivial on the identity-section Galois factor.
- Lχ⊗Lψ≅Lχψ, Lχ∨≅Lχ⁻¹ and [−1]⁎Lχ≅Lχ⁻¹, compatibly with origin trivializations.
- a⁎Lχ≅Lχ⊠Lχ has associative and unital coherence.
- Base change transports both the representation and its normalized descent; identity and composition comparisons commute.

One proof route is as follows. Apply the lisse sheaf/continuous representation equivalence. The invariant-character condition is precisely the compatibility needed to extend over the semidirect product. Normalize the rank-one tensor isomorphism by the identity fibre, which forces associativity and the unit laws.

**Checks.**

- The unit character gives the constant sheaf with trivial Galois origin fibre.
- A character moved by Galois has no descent of the prescribed normalized kind.
- Tensoring a normalized descent by a nontrivial Galois character preserves geometric monodromy but fails the normalization.
- The identity fibre has no unspecified arithmetic rank-one factor.
- Tensoring by Lχ respects convolution via its multiplicative structure.

*Needs:* §0.1; EtaleDualityAndPerverseSheaves §§3.3–3.5; EtaleCohomologyFoundations §§F.0.2, F.4.5; geometric character comparison contract.

### 0.3 Derived sheaf convolution

On Dᵇ_c(A,F), convolution is K*L=Ra_!(K⊠L). Here a is addition, ⊠ is the derived external tensor product of EtaleCohomologyFoundations §F.2.6, and Ra_! is the canonical lower shriek of EtaleCohomologyFoundations §0.8, which agrees with Ra_* because a is proper. It is not a separate construction: as a functor of K it is the kernel transform of FourierDeligneTransform with the difference kernel, formed for torsion coefficients and realized to F (last paragraph of this subsection). With the symmetry inherited from complexes, including Koszul signs, this is a rigid symmetric monoidal structure. Its unit is δ₀ and its dual is K∨=[−1]⁎D_AK. Evaluation and coevaluation satisfy both triangle identities. (LS, Lemma 2.1 and its proof, p. 14; LS line 650; W, unnumbered Proposition and its proof, pp. 1–2, W line 24.)

Throughout this subsection, A is proper over k of characteristic zero; coefficients are F; constructible adic boundedness and finite-dimensionality are imported.

Its API includes the following facts.

- The associator and unit/symmetry maps obey the pentagon, triangle and hexagon identities.
- δₓ*K identifies with translation pushforward tₓ* K.
- The convolution dual agrees with inversion-pullback of Verdier duality, with evaluation and coevaluation.
- (K*L)⊗Lχ≅(K⊗Lχ)*(L⊗Lχ).

One proof route is as follows. Obtain the associator and unit from the composition isomorphism of kernel transforms, after identifying composite difference kernels by base change along the group law. Obtain the symmetry from the swap of A×A and the Koszul symmetry of ⊠. Use these coherent comparisons, rather than equality of chosen derived models. Construct evaluation from duality and the antidiagonal, as in Weissauer’s rigidity proposition; verify both triangle identities before passing to a quotient.

**Checks.**

- Two skyscrapers supported at x and y convolve to one at x+y, not at x−y, and δₓ∨≅δ₋ₓ.
- Convolution with δ₀ preserves an arbitrary complex; convolution with the constant sheaf is not the unit operation.
- Exchanging two copies shifted by one introduces the negative Koszul sign.
- The symmetry on shifts of constant sheaves retains the sign needed by Layer 4.

*Needs:* Mathlib `DerivedCategory`; FourierDeligneTransform kernel transforms; EtaleCohomologyFoundations §§0.8, F.2.6–F.2.7; EtaleCohomologyFoundations §§F.5–F.6; EtaleDualityAndPerverseSheaves §0.5; EtaleDualityAndPerverseSheaves §§3.3–3.5; EtaleCohomologyFoundations §§F.0.2, F.4.5.

Convolution is obtained from the kernel transforms of FourierDeligneTransform. For a torsion coefficient ring Λ, let d:A×A→A be the difference morphism d(x,z)=z−x, with products over k. For L in D(A,Λ), the difference kernel d*L defines the kernel transform K↦Rp₂!(p₁*K⊗ᴸd*L) with shift zero. The shear automorphism σ(x,y)=(x,x+y) of A×A satisfies p₁∘σ=p₁, d∘σ=p₂ and p₂∘σ=a. So pullback along σ and the composition isomorphism of EtaleCohomologyFoundations §0.8 for p₂∘σ give a named isomorphism from this transform to Ra_!(K⊠L), natural in K and L; convolution with L is this kernel transform. Base change along the group law and a shear of A×A×A identify the composite of the kernels d*L and d*L′ with d*(L*L′). Base change of the origin along d identifies d*δ₀ with the diagonal kernel Δ_!Λ. The composition isomorphism of kernel transforms then gives the associator (K*L)*L′≅K*(L*L′) and the unit isomorphism K*δ₀≅K. Their pentagon and triangle identities follow from the kernel-composition coherence contract and the coherence of base change. The symmetry K*L≅L*K is the swap of A×A, which commutes with a, composed with the Koszul symmetry of ⊠. These constructions are made on the unbounded D(A,Λ), with no compactification and no finiteness hypothesis. For finite Λ, K*L lies in Dᵇ_ctf(A,Λ) whenever K and L do; this is a theorem, by EtaleCohomologyFoundations §§F.1 and F.3, since every integer is invertible on A in characteristic zero. For F=Q̄_ℓ, the convolution and its associator, unit and symmetry are the realization of the torsion constructions at the finite levels O_E/𝔪_Eⁿ of normalized adic systems (EtaleCohomologyFoundations §F.4.6). They are then rationalized and passed to the 2-colimit over finite E/ℚ_ℓ inside Q̄_ℓ (EtaleCohomologyFoundations §F.4.5). No coefficient ring has a convolution defined separately.

**Checks.**

- For L=δ_y the difference kernel d*δ_y is supported on the graph of translation by y, and the kernel transform sends δₓ to δₓ₊ᵧ. The sum kernel s*L with s(x,z)=x+z would send δₓ to δᵧ₋ₓ and compute ([−1]*K)*L instead, so the sign in d is forced.
- d*δ₀ is the diagonal kernel, whose transform is the identity. The constant sheaf Λ_A gives the constant kernel, whose transform is K↦RΓ_c(A,K)⊗Λ_A by base change, not the identity.
- On 𝔾_m over an algebraically closed field of characteristic zero with Λ=ℤ/ℓ, the same construction for the multiplication law of 𝔾_m gives Ra_!(Λ⊠Λ). It is lisse with stalks RΓ_c(𝔾_m,Λ) in degrees 1 and 2, whereas Ra_*(Λ⊠Λ) has stalks in degrees 0 and 1. The definition goes through the lower shriek, and its agreement with Ra_* on A uses properness.

*Needs:* FourierDeligneTransform kernel transforms; kernel-composition coherence contract; EtaleCohomologyFoundations §§0.8, F.1, F.2.4, F.2.6, F.3, F.4.5–F.4.6.

### 0.4 Generic vanishing on abelian varieties

Let A be a complex abelian variety of dimension g, let F be a coefficient field (F=Q̄_ℓ with its discrete topology for the Betti realization), put R=F[π₁(A,0)], a Laurent polynomial ring in 2g variables, and Char_F(A)=Spec R, the split F-torus of characters of π₁(A,0). Let L_R=π_!F for the universal cover π:V→A, the rank-one R-local system of the tautological character, and define the Fourier–Mellin transform FM_A(K)=RΓ(A,K⊗_F L_R) for K in Dᵇ_c(A,F). Then FM_A(K) is a perfect R-complex whose derived fibre at χ is RΓ(A,K⊗Lχ), and its R-dual is FM_A([−1]⁎D_AK). If K is perverse, FM_A(K) and its R-dual lie in D^(≥0)(R). Consequently, for perverse K: each cohomology support locus S^j(K)={χ : H^j(A,K⊗Lχ)≠0} is Zariski closed in Char_F(A) of codimension at least |j|; H^j(A,K⊗Lχ)=0 for every j≠0 and every χ off a proper Zariski-closed subset; χ(A,K)≥0; and χ(A,K)=0 exactly when RΓ(A,K⊗Lχ)=0 for some χ. A finite family of perverse sheaves admits one common good character, which can be taken of finite order, since finite-order characters are Zariski dense in the torus; continuous étale characters are reached through the Artin comparison. The finer description of the exceptional loci by translates of character subtori is §0.9. (BSS, Theorem 1.1, p. 1, BSS line 25; Lemma 2.6, Proposition 2.7 and Corollary 2.10, pp. 4–5, BSS lines 50, 172, 183 and 221; LS, Lemma 2.2(1), p. 15, LS line 672.)

Throughout this subsection, A is a complex abelian variety; the vanishing assertions are for perverse K, and the codimension bound holds on the algebraic torus Char_F(A), not on the set of continuous étale characters.

Its API includes the following facts.

- FM_A(K)⊗ᴸ_R κ(χ)≅RΓ(A,K⊗Lχ) for every point χ of Char_F(A), compatibly with distinguished triangles in K.
- The R-dual of FM_A(K) is FM_A([−1]⁎D_AK).
- For perverse K, H^j(FM_A(K)) is supported in codimension at least j, and likewise for the R-dual.
- Local-duality support criterion: for a Noetherian ring S with a dualizing complex ω normalized so that its dualizing sheaf sits in degree −dim S, a complex M in Dᵇ_coh(S) and an integer k, RHom_S(M,ω) lies in D^(≥−k)(S) iff dim Supp H^i(M)≤k−i for every i; for S regular of dimension 2g, where ω=S[2g] is normalized, this says that RHom_S(M,S) lies in D^(≥0)(S) iff codim Supp H^i(M)≥i for every i (BSS, Lemma 2.8 and Remark 2.9, pp. 4–5, BSS lines 192 and 214).
- For perverse K, χ(A,K) equals dim H⁰(A,K⊗Lχ) for every χ off the exceptional closed set, hence χ(A,K)≥0.

One proof route is as follows. Construct L_R and identify it with the local system of the tautological character π₁(A,0)→R^×; [−1]⁎L_R is its R-dual. The projection formula gives FM_A(K)≅RΓ_c(V,π⁎K). If K is perverse then π⁎K is perverse for the analytic constructible t-structure on the Stein manifold V, so Artin vanishing on Stein spaces puts RΓ_c(V,π⁎K) in D^(≥0)(F); compact Verdier duality and the identification of the dual local system give the same for the R-dual. Over the regular Gorenstein ring R, a perfect complex whose dual lies in D^(≥0) has H^j supported in codimension at least j, by the local-duality support criterion of the API above (BSS, Lemma 2.8 and Remark 2.9, pp. 4–5, BSS line 192), proved as follows: for a finitely generated S-module N, Ext^i_S(N,ω) vanishes for i outside [−dim Supp N, 0], and the spectral sequence Ext^i_S(H^(−j)(M),ω)⇒H^(i+j)(RHom_S(M,ω)) gives the forward implication; for the converse, localization at a prime 𝔭 of codimension c turns ω into ω_(S_𝔭)[c] (`NormalizedDualizing.localization_shift`), so induction on the dimension bounds the support of H^i(M) away from the closed point, and adding the closed point raises the dimension by at most one. On the dense open set where FM_A(K) is a vector bundle in degree zero the fibres are concentrated in degree zero; constancy of the fibre Euler characteristic on the connected torus gives nonnegativity and the Euler-zero criterion. Finitely many proper closed subsets do not cover the irreducible torus, and their complement contains finite-order points. This route uses neither convolution nor any Tannakian quotient.

**Checks.**

- On an elliptic curve E with F[1]: the untwisted cohomology has dimensions 1,2,1 in degrees −1,0,1, a nontrivial twist has dimensions 0,0,0, and S^(−1)=S^1={1}, of codimension 2≥1. A definition ignoring negative degrees misses the exceptional point.
- For a non-torsion character α of π₁(E), the perverse sheaf L_α[1] has S^(±1)={α⁻¹}; its exceptional character is non-torsion, so no torsion-translate assertion holds for arbitrary perverse sheaves.
- The complex δ₀⊕δ₀[1] is not perverse; every twist has cohomology in degrees −1 and 0, so the perversity hypothesis cannot be dropped from generic concentration.
- A rank-one skyscraper δₓ has FM_A(δₓ) a free R-module of rank one in degree zero, all S^j with j≠0 empty and χ=1.
- For S=k[x] with normalized dualizing complex S[1]: the module k=S/(x) has Ext⁰_S(k,S)=0 and Ext¹_S(k,S)=k, so RHom_S(k,S[1])=k[0] lies in D^(≥0) and dim Supp H⁰(k)=0≤0; the module S has RHom_S(S,S[1])=S[1], which lies in D^(≥−1) but not in D^(≥0), and dim Supp H⁰(S)=1 needs k≥1. The criterion separates the two. With the unshifted complex ω=S in place of S[1], RHom_S(S,S)=S[0] lies in D^(≥0) although dim Supp H⁰(S)=1>0, so the equivalence fails for the module S, while the verdict for k is unchanged, RHom_S(k,S)=k[−1] still lying in D^(≥0): the normalization is what makes the criterion an equivalence.

*Needs:* §0.1; §0.2; ComplexComparisonPartII §C6.1 and §C6.6; Stein Artin-vanishing contract; SchemeAndStackFoundations §2.21 (`NormalizedDualizing.localization_shift`); EtaleDualityAndPerverseSheaves §§2.1, 3.3–3.5; EtaleCohomologyFoundations §§F.0.2, F.4.5.

### 0.5 Negligible perverse sheaves

For K perverse on A set χ(A,K)=Σ_j(−1)^j dim_F H^j(A_k̄,K_k̄). Let N be the full subcategory with χ(A,K)=0, and let D_N be the full subcategory of Dᵇ_c whose every perverse cohomology object lies in N. N is a Serre subcategory and D_N is a thick triangulated subcategory stable under convolution with arbitrary constructible complexes. For perverse K,L, pH^j(K*L)∈N when j≠0. (LS, Lemma 2.2(1)–(5), p. 15; LS line 672; KW, Proposition 10.1 and the preceding paragraph, pp. 21–22; Lemma 13.1, pp. 29–30; KW line 787.)

Throughout this subsection, the Euler characteristic is geometric, the coefficients form a field, and the cohomology of a constructible complex is finite-dimensional.

Its API includes the following facts.

- For a perverse object, negligibility is exactly vanishing of its geometric Euler characteristic.
- Subobjects, quotients and extensions of negligible perverse objects remain negligible.
- A bounded complex is in D_N iff every pH^j is negligible.
- D_N is stable under either convolution variable and nonzero perverse degrees of K*L lie in N.

One proof route is as follows. Prove nonnegativity by generic vanishing. Additivity in perverse short exact sequences then proves the Serre assertion. Use finitely many perverse cohomology objects and a common generic character to prove the convolution ideal and nonzero-degree negligibility, following KW. Generic vanishing is established before the quotient and has no quotient prerequisite.

**Checks.**

- A rank-one skyscraper has Euler characteristic 1 and is not negligible.
- On a positive-dimensional abelian variety the shifted constant perverse sheaf F[n] is negligible.
- δ₀⊕δ₀[1] has total Euler characteristic zero but is not in D_N because its nonzero perverse cohomology contains δ₀.
- Every perverse Euler characteristic is nonnegative.

*Needs:* §0.3; §0.4; EtaleDualityAndPerverseSheaves §§2.1, 2.6–2.10; EtaleDualityAndPerverseSheaves §§3.3–3.5; EtaleCohomologyFoundations §§F.0.2, F.4.5.

### 0.6 Perverse convolution quotient

Construct the abelian Serre quotient P(A)/N. Its tensor product is represented by pH⁰(K*L); the essential image of P(A) in Dᵇ_c(A,F)/D_N is equivalent to this Serre quotient and is closed under convolution and duality. These comparisons transport the coherent rigid symmetric monoidal structure to the quotient. The quotient functor is exact and kills exactly N. (LS, Lemma 2.2(6)–(9), p. 15; LS line 680; KW, Lemmas 12.2–12.3, pp. 28–29; Lemma 13.1, pp. 29–30; KW line 1020.)

Throughout this subsection, the quotient is a Serre quotient, not a naive quotient of every Hom space by negligible factorisations.

Its API includes the following facts.

- The quotient functor is exact, F-linear, and universal among exact functors annihilating N.
- Q(K)⊗Q(L)≅Q(pH⁰(K*L)) with coherent associator and symmetry.
- P/N is equivalent to the essential image of P in Dᵇ_c/D_N.
- Q([−1]⁎DK) is the rigid dual of Q(K).

One proof route is as follows. Use Mathlib’s Serre-class localization for the abelian quotient and its exact functor. Apply the bounded-heart/Verdier quotient contract to the perverse heart and its thick ideal. Transport convolution and duality through the equivalence, using negligibility of every other perverse degree.

**Checks.**

- For dim A>0, the image of F[n] is zero.
- The image of δ₀ is a nonzero tensor unit with endomorphism field F.
- On an elliptic curve E, Q(δ₀⊕F_E[1])≅Q(δ₀), so its endomorphism algebra in the quotient has dimension one; before localization End(δ₀⊕F_E[1])=F⊕F has dimension two, since Hom(δ₀,F_E[1]) and Hom(F_E[1],δ₀) vanish, and the negligible summand is what the quotient removes.
- Q(δ₀⊕δ₀) has endomorphism algebra M₂(F), of dimension four; a quotient identifying objects by their support alone would give dimension one.

*Needs:* §0.5; Mathlib `CategoryTheory.ObjectProperty.SerreClassLocalization.abelian`; Mathlib `CategoryTheory.ObjectProperty.SerreClassLocalization.preservesFiniteLimits`; Mathlib `CategoryTheory.ObjectProperty.SerreClassLocalization.preservesFiniteColimits`; EtaleDualityAndPerverseSheaves §§2.1, 2.6–2.10; Serre-heart/Verdier comparison contract.

### 0.7 Rank-one de Rham moduli and Simpson's linearity theorems

Let A be a complex abelian variety of dimension g and Â its dual. Let A♮=E(Â) be the universal vector extension of Â (AbelianSchemesAndArithmeticModuli §A4.2, `AbelianVectorExtension` applied to Â), which that section identifies with the moduli space of rigidified algebraic line bundles with integrable connection on A: a quasi-projective connected commutative algebraic group of dimension 2g, an extension of Â by the vector group of H⁰(A,Ω¹_A), with forgetful map π:A♮→Â. Let Char(A)=Hom(π₁(A,0),C^×), a split torus of dimension 2g, and Φ:A♮→Char(A) the holonomy map, a biholomorphic group isomorphism; for g>0 it is not algebraic, and for g=0 it is the identity of a point. For an abelian subvariety B⊂A (B=0 allowed) call ρ·T_B⊂Char(A) a linear subvariety, and an arithmetic one when ρ can be taken of finite order; here T_B is the subgroup of characters trivial on π₁(B,0), as in §0.1. For σ∈Aut(C/Q) let c_σ:A♮→(A^σ)♮ be conjugation of the algebraic data. Prove: (a) if Z⊂A♮ is closed algebraic and Φ(Z) is closed algebraic in Char(A), then Φ(Z) is a finite union of linear subvarieties; (b) if Z⊂A♮ is closed and, for every σ∈Aut(C/Q), Φ(c_σZ) is closed algebraic in Char(A^σ) and defined over Q̄, then Φ(Z) is a finite union of arithmetic linear subvarieties; (c) if A is defined over Q̄ and (L,∇) is a Q̄-point of A♮ whose holonomy character Φ(L,∇):π₁(A,0)→C^× takes values in Q̄^×, then (L,∇) is a torsion point of A♮. (Sim, Theorem 3.1(c) and Corollary 3.2, pp. 366–369, Sim lines 243 and 360; Theorem 3.3 and Proposition 3.4 with its proof, pp. 369–370, Sim lines 367, 376 and 379; Theorem 6.1, p. 376, Sim line 655; Sch, Definition 2.3, p. 2, Sch line 88; Theorem 16.1 and Definition 17.3 with Theorem 17.4, pp. 25–26, Sch lines 1236 and 1291.)

Throughout this subsection, the triple tori of Sim for X=A are exactly the subgroups T_B: a subtorus of Char(A) that is algebraic on both sides is the image of the character group of a quotient abelian variety A→A/B with connected fibres.

Its API includes the following facts.

- Φ is a group isomorphism of complex Lie groups, equivariant for pullback along homomorphisms of abelian varieties.
- For every abelian subvariety B, Φ⁻¹(T_B) is a closed algebraic subgroup of A♮, the image of (A/B)♮.
- Conjugation c_σ is a group isomorphism carrying the torsion points of A♮ to those of (A^σ)♮.
- Statements (a) and (b) are stable under finite unions and under translation by finite-order points.

One proof route is as follows. Define Φ through the monodromy of the connection, using the regular-singular Riemann–Hilbert equivalence for rank-one connections on the proper A (ComplexComparisonPartII §C5.6). For (a), reduce to an irreducible Z and, after translation, to a subgroup statement; compare the real-analytic group structures of A♮ and Char(A) to show that a subset algebraic on both sides is a translate of a subgroup algebraic on both sides, and identify such subgroups with the T_B (Sim §3). For (c), form the extension 1→𝔾_m→G→A→1 of commutative algebraic groups over Q̄ whose points are the pairs (x,ι) of a translation t_x of A and an isomorphism ι:t_x⁎L≅L; the connection ∇ provides an analytic homomorphism ψ:T₀A→G(C) lifting the exponential map, whose differential at the origin is defined over Q̄ because (L,∇) is; the period lattice Γ⊂T₀A contains a C-basis, and ψ(Γ) consists of the holonomy values, which lie in G(Q̄) by hypothesis. The Schneider–Lang criterion for commutative algebraic groups (the contract above) gives an algebraic subgroup G′⊂G of dimension g containing ψ(T₀A); G′ maps onto A, so G′∩𝔾_m is finite and the holonomy Γ→G′∩𝔾_m takes values in roots of unity: (L,∇) is torsion (Sim, proof of Proposition 3.4, Sim line 379). For (b), a translate ρ·T_B whose Betti and de Rham points are defined over Q̄ contains a finite-order point: its image in Char(A)/T_B=Char(B), with de Rham side B♮=A♮/(A/B)♮, is a Q̄-point with Q̄-valued holonomy, torsion by (c), and it lifts to a torsion point of the translate (Sim, proof of Theorem 3.3, p. 370, Sim line 399); then spread out over a finitely generated field and specialize to deduce (b) from (a) (Sim Theorem 6.1, in the form of Sch Theorem 17.4, which drops Simpson's Dolbeault conditions using the strengthening of Theorem 3.1(c)).

**Checks.**

- On an elliptic curve E with period lattice spanned by 1 and τ, the connections d+t·dz on the trivial bundle form a closed algebraic line in E♮, but their holonomies (e^(−t),e^(−tτ)) are Zariski dense in Char(E) because τ is not real; the hypothesis that Φ(Z) be algebraic is essential.
- A single point Z=Φ⁻¹(ρ) is linear (B=A) and is arithmetic exactly when ρ has finite order. For E over Q̄ and ρ with values 2 and 1 on a basis of π₁(E), the holonomy values are algebraic and ρ has infinite order (2^k≠1), so by (c) the point Φ⁻¹(ρ) is not a Q̄-point of E♮ although Φ(Z) is defined over Q̄; and by (b) some conjugate Φ(c_σZ) is not defined over Q̄: the condition in (b) is needed for every σ, not only σ=1. The exponential-form criterion for 𝔾_a^r×𝔾_m^s says nothing about E♮, which is a 𝔾_a-extension of Ê.
- For B=0, T_B=Char(A) is a linear subvariety; for B=A, T_B={1}. On E×E the antidiagonal B={(a,−a)} gives T_B={χ₁=χ₂}, a linear subvariety not of coordinate form.
- For g=0, A♮ and Char(A) are single points and Φ is the identity, an algebraic isomorphism; (a), (b) and (c) hold with B=A=0 and the unique point torsion. For an elliptic curve the connection line t↦(e^(−t),e^(−tτ)) of the first Check is not algebraic, so nonalgebraicity of Φ is a statement about g>0 only.

*Needs:* §0.1; AbelianSchemesAndArithmeticModuli §§A3.1–A3.5 and A4.2; ComplexComparisonPartII §C5.6; DiophantineApproximationAndTranscendence §3.5; Schneider–Lang commutative-group contract.

### 0.8 The Fourier–Mukai transform for D-modules on an abelian variety

Let A be a complex abelian variety of dimension g, A♮=E(Â) with π:A♮→Â as in §0.7, and (P♮,∇♮) the pullback of the rigidified Poincaré bundle to A×A♮ with its universal integrable connection relative to A♮ (AbelianSchemesAndArithmeticModuliPartII §P1.1). For a bounded complex M of algebraic (quasi-coherent) D_A-modules let DR(p₁⁎M⊗(P♮,∇♮)) be the de Rham complex of p₁⁎M⊗P♮ relative to A♮ (tensor product over the structure sheaf of A×A♮) for the connection p₁⁎∇_M⊗id+id⊗∇♮, placed in degrees −g,…,0, and define FM_A(M)=Rp₂∗DR(p₁⁎M⊗(P♮,∇♮)) for the projection p₂:A×A♮→A♮; write O♮ for the structure sheaf of A♮. Prove the following. (a) If M has coherent cohomology, FM_A(M) is a bounded complex with coherent cohomology on A♮; for every C-point (L,∇) of A♮ its derived fibre at (L,∇) is RΓ(A,DR_A(M⊗(L,∇)))=RΓ(A,DR_A(M)⊗_C ker∇); hence Supp FM_A(M) is the union over k of the loci S^k₁(A,M)={(L,∇):H^k(A,DR_A(M⊗(L,∇)))≠0}, and for a∈A(C) the transform FM_A(δ_a) is the line bundle π⁎P_a in degree zero, P_a∈Pic⁰(Â) the point corresponding to a. (b) FM_A is an equivalence of triangulated categories D^b_coh(D_A)→D^b_coh(A♮) (Laumon, Rothstein). It converts tensoring with (L,∇) into pullback along the translation of A♮ by (L,∇), satisfies FM_A∘D_A=[−1]⁎RHom(FM_A(−),O♮) for the inversion [−1] of A♮ and the duality functor D_A, satisfies L(f♮)⁎∘FM_A=FM_B∘f_+ and R(f♮)∗∘FM_B=FM_A∘f^+ for a homomorphism f:A→B with induced f♮:B♮→A♮, and sends an induced module D_A⊗E (tensor product over O_A) with E coherent to Lπ⁎RΦ_P(E), RΦ_P the Mukai transform of E to Â. (c) For a bounded complex M with holonomic cohomology, M is a single holonomic module placed in degree zero exactly when codim S^k₁(A,M)≥2|k| for every k; for a holonomic module M both FM_A(M) and RHom(FM_A(M),O♮) lie in D^(≥0)_coh with codim Supp H^i≥2i for every i, and if M is moreover simple with χ(A,DR_A(M))≠0 then codim Supp H^k FM_A(M)≥2k+2 for k>0, H⁰FM_A(M) is a reflexive sheaf, locally free outside a closed subset of codimension at least four, and FM_A(M) is determined up to isomorphism by the restriction of H⁰FM_A(M) to that locally free locus. (d) For a holonomic module M the Chern classes of FM_A(M) vanish in H²ⁱ(A♮,Z)=H²ⁱ(Â,Z), and π⁎:Pic(Â)→Pic(A♮) is an isomorphism. (Sch, §10, pp. 12–14, Sch line 574; Theorem 10.3, Sch line 609; Theorem 10.5, Sch line 616; Theorem 4.1, p. 5, Sch line 192; Theorem 15.1 and its proof, Sch line 1033; Proposition 16.2 and its proof, Sch line 1242; Theorem 19.1 and Proposition 19.2, Sch lines 1433 and 1441; Theorem 21.1, Corollary 21.5 and Proposition 22.1, pp. 34–36, Sch lines 1636, 1751 and 1762; Proposition 25.1 and Corollary 25.3, pp. 40–41, Sch lines 1995 and 2019; K1, Proposition 3.1, pp. 22–24, K1 line 856.)

Throughout this subsection, D_A-modules are algebraic and quasi-coherent over O_A; holonomic complexes have bounded holonomic cohomology; perverse coherent conditions are stated through codimensions of supports of cohomology sheaves, and all codimensions are taken in A♮.

Its API includes the following facts.

- FM_A is exact (triangulated), and FM_A(M⊗(L,∇)) is the pullback of FM_A(M) along translation by (L,∇).
- The derived fibre of FM_A(M) at (L,∇) is RΓ(A,DR_A(M⊗(L,∇))); for (L,∇) off a proper closed subset and M a single holonomic module this is a vector space in degree zero of dimension χ(A,DR_A(M)).
- FM_A(δ_a)=π⁎P_a in degree zero, FM_A(δ₀)=O♮, and FM_A(δ_a)⊗FM_A(δ_b)=FM_A(δ_c) for c=a+b.
- Supp FM_A(M)=A♮ exactly when H⁰FM_A(M)≠0 for a holonomic module M, and then the generic rank of H⁰FM_A(M) is χ(A,DR_A(M)).
- For a simple holonomic M with χ(A,DR_A(M))≠0, a reflexive H⁰FM_A(M) of generic rank one is a line bundle, since A♮ is smooth.

One proof route is as follows. For (a), the terms of the relative de Rham complex are quasi-coherent and flat over A♮, so Rp₂∗ lands in the quasi-coherent derived category and commutes with base change along the Tor-independent square of a point of A♮ (SchemeAndStackFoundations §2.18, `torIndependent_baseChange`); the fibre is the de Rham complex of M⊗(L,∇), and DR_A(M⊗(L,∇))≅DR_A(M)⊗_C ker∇ because ker∇⊗_C O_A=L (Sch, proof of Theorem 15.1). Coherence is obtained with the equivalence (b): for an induced module D_A⊗E the transform is Lπ⁎RΦ_P(E), coherent because the Mukai transform of a coherent sheaf is coherent; a coherent D_A-module on the projective A has a finite resolution by induced modules D_A⊗E_i with E_i coherent, and dévissage gives coherence of FM_A(M) for every bounded coherent complex. For (b) follow Laumon: the formal properties come from base change and the projection formula for the kernel (P♮,∇♮), and essential surjectivity and full faithfulness from the inverse transform with kernel the dual Poincaré connection and the computation of Rp₁∗(P♮,∇♮) through the structure of D_A as the Fourier dual of O♮ (Sch Theorems 10.3 and 10.5, citing Laumon, Théorème 3.2.1 and Corollaire 3.2.5). For (c), the Rees module of a good filtration gives a C^×-equivariant extension of FM_A(M) to the vector bundle E(A)⊇A♮ whose restriction to the zero fibre is the Mukai transform of the associated graded module, a coherent sheaf whose generic fibrewise support is finite because M is holonomic; semicontinuity gives the codimension bounds (Sch Proposition 19.2 and Theorem 19.1). The perverse coherent t-structure of Kashiwara and Arinkin–Bezrukavnikov with the supporting function 2·codim turns these bounds into the statement that FM_A identifies the standard t-structure on holonomic complexes with the m-perverse one. For a simple M with χ≠0, the least degree with nonzero cohomology is zero and a component of the support of a higher cohomology sheaf of codimension exactly 2k would make M a pullback from a quotient of dimension g−k by a simple module, contradicting χ≠0; this gives codim≥2k+2 (Sch Theorem 21.1 and Corollary 21.5). The reflexivity of H⁰ follows from the codimension bounds for the Ext sheaves of H⁰, which are controlled by those of FM_A(M) and of its dual, through the criterion that a coherent sheaf on a regular scheme with codim Supp Ext^i(−,O)≥i+2 for i≥1 is reflexive; the reconstruction of FM_A(M) from H⁰ restricted to its locally free locus proceeds by truncation and duality (Sch Proposition 22.1). For (d), the C^×-equivariant extension of (c) shows that the Chern character lies in the subring of CH(Â)=CH(A♮) generated by Pic⁰(Â), whose classes vanish in singular cohomology (Sch Proposition 25.1 and Corollary 25.3); A♮ is a Zariski-locally trivial affine bundle over Â, so pullback is an isomorphism on Picard groups. The microlocal realization of §4.3 uses the tensor property FM_A(M₁*M₂)≅FM_A(M₁)⊗^L FM_A(M₂), which follows from the functoriality in (b) for the addition homomorphism (K1 Proposition 3.1).

**Checks.**

- FM_A(δ_a)=π⁎P_a in degree zero; for a≠b the line bundles π⁎P_a and π⁎P_b are not isomorphic, so the transform separates skyscrapers, whereas the Fourier–Mellin transform of §0.4 gives the free module R for every δ_a.
- For the constant module O_A with DR_A(O_A)=C[g] and g>0, the fibre at (L,∇) vanishes unless ∇ is the trivial connection, where it is H^•(A,C)[g]; so FM_A(O_A) is supported at the origin of A♮, in codimension 2g≥2|k| for its cohomology degrees −g≤k≤g, as (c) requires, its H⁰ is a skyscraper and not reflexive, and its Euler characteristic is 0, so the simple-module part of (c) does not apply.
- For g=0, A♮ is a point and FM_A is the identity functor on finite-dimensional vector spaces; every assertion is trivial.
- On an elliptic curve E, M=δ_x⊕δ_y with x≠y has FM_E(M)=π⁎P_x⊕π⁎P_y, locally free of rank two with H⁰ reflexive, but M is not simple: (c) asserts simplicity nowhere, and the Euler characteristic 2 is the rank.
- Tensoring δ_a by (L,∇) returns δ_a, and the pullback of π⁎P_a along the translation of A♮ by (L,∇) is π⁎(t⁎P_a) for t the translation of Â by π(L,∇), which is π⁎P_a because P_a is translation invariant on Â; the two sides of the twist formula of (b) agree.

*Needs:* §0.7; AbelianSchemesAndArithmeticModuli §§A2.2, A4.2; AbelianSchemesAndArithmeticModuliPartII §P1.1; SchemeAndStackFoundations §§2.18, 5.1–5.4; SpringerResolutionAndCharacteristicCycles §§8.1, 9.1, 9.4 and 9.7; holonomic realization contract; ComplexComparisonPartII §C5.6.

### 0.9 Linear structure of the exceptional loci

Let A be a complex abelian variety and K∈Dᵇ_c(A,F). For all integers j and m≥1 the loci S^j_m(K)={χ∈Char(A) : dim H^j(A,K⊗Lχ)≥m} are finite unions of linear subvarieties in the sense of §0.7. If K is a semisimple perverse sheaf of geometric origin, they are finite unions of arithmetic linear subvarieties. Consequently, for perverse K and j≠0, S^j(K) is a finite union of translates ρ·T_B with B≠0 (each such component is proper by the codimension bound of §0.4), and ρ can be taken of finite order when K is semisimple of geometric origin. The same holds for continuous étale characters through the comparison of §0.4, and for a finite family by taking the union. (Sch, Theorem 7.3, p. 9, Sch line 423; Corollary 7.5, p. 10, Sch line 453; KW, Theorem 1.1, p. 2, KW line 41, and Lemma 11.2(b)–(c), pp. 25–26, KW line 922, prove the same statement through convolution quotients; LS, §4, p. 30, paragraph before Lemma 4.4, LS line 1392.)

Throughout this subsection, F-coefficients are extended to C along a fixed field embedding ι:F→C for the Betti and de Rham statements, and the loci over Char_F(A) are recovered as the F-structures of their base changes; geometric origin is in the sense of BBD 6.2.4, and finite order of a character is independent of ι.

Its API includes the following facts.

- S^j_m(K⊗Lψ)=ψ⁻¹·S^j_m(K) for every character ψ.
- For an isogeny or quotient map f:A→A′ with connected fibres, the loci of Rf_*K pull back to loci of K in Π(A).
- For semisimple K of geometric origin and finite-order ψ, K⊗Lψ is again semisimple of geometric origin.
- For perverse K the exceptional set of §0.4 is the finite union of the S^j(K), j≠0.

One proof route is as follows. Through the bounded derived regular-holonomic Riemann–Hilbert correspondence (holonomic realization contract) write K=DR_A(M) with M a bounded complex of D_A-modules with regular holonomic cohomology; an arbitrary bounded K is not the de Rham complex of a single module. Twisting by a line bundle with integrable connection corresponds to twisting by its holonomy, DR_A(M⊗(L,∇))≅DR_A(M)⊗_C ker∇, so Φ carries the de Rham loci S^j_m(A,M) of M onto S^j_m(K) (Sch Theorem 15.1). The loci are algebraic in Char(A) because FM_A(K) of §0.4 is a perfect R-complex whose derived fibres are the twisted cohomologies, and the locus where the j-th cohomology of the fibre of a bounded complex of free modules has dimension at least m is closed. They are algebraic in A♮ because FM_A(M) of §0.8(a) is a bounded coherent complex on A♮ whose derived fibres are the de Rham cohomologies of the twists (Sch Proposition 16.2). Apply §0.7(a). For geometric origin, K is a direct sum of simple constituents of Q-perverse sheaves obtained from constant sheaves by the standard functors; such constituents are complexifications of perverse sheaves with Q̄-coefficients (Sch Lemma 17.6), their loci are defined over Q̄ by the Fourier–Mellin transform over Q̄[π₁] (Sch Lemma 17.5), and applying σ∈Aut(C/Q) to the construction yields an object of the same kind on A^σ whose loci are the conjugates. Apply §0.7(b). Mixed Hodge modules are not needed for this argument.

**Checks.**

- On E, F[1] has S^(±1)={1}=1·T_E, an arithmetic linear subvariety, while a non-torsion L_α[1] has S^(±1)={α⁻¹}, linear but not arithmetic: the geometric-origin hypothesis is necessary for finite-order translates.
- For the antidiagonal curve C={(a,−a)}⊂E×E and K the constant perverse sheaf on C, S^(±1)(K)=T_C={χ₁=χ₂}, of codimension 2; a description by coordinate subtori alone misses it.
- For a rank-one skyscraper δₓ every S^j with j≠0 is empty, and S^0_1=Char(A) is the linear subvariety with B=0.

*Needs:* §0.4; §0.7; §0.8; holonomic realization contract; SpringerResolutionAndCharacteristicCycles §§8.1, 9.1, 9.4 and 9.7; ComplexComparisonPartII §C6.6; EtaleDualityAndPerverseSheaves §§3.3–3.5, 5.10.

### Examples

On an elliptic curve take two points x,y. The convolution δₓ*δᵧ is δₓ₊ᵧ, of Euler characteristic 1, and its dual is δ₋ₓ₋ᵧ. The untwisted constant perverse sheaf has Betti dimensions 1,2,1 in degrees −1,0,1, hence Euler characteristic 0. Its generic nontrivial twist has no cohomology. The complex δ₀⊕δ₀[1] has Euler characteristic 1−1=0 but perverse cohomology δ₀ in two degrees, so it is outside the derived negligible category. For the constant perverse sheaf on the antidiagonal curve of E×E the exceptional loci in degrees ±1 are the subtorus χ₁=χ₂, a linear subvariety of codimension 2 that is not of coordinate form. The Fourier–Mukai transform of δₓ on E is the line bundle π⁎P_x on E♮, and that of the constant module O_E is a complex supported at the origin of E♮ with cohomology in degrees −1, 0, 1 of dimensions 1, 2, 1. (LS Lemmas 2.1–2.2, LS lines 650 and 672; Sch Theorem 7.3, Sch line 423; Sch Theorem 10.5, Sch line 616.)

### Dependencies

Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety`; AbelianSchemesAndArithmeticModuli §§A2.2, A3.1–A3.5, A4.2; AbelianSchemesAndArithmeticModuliPartII §P1.1; EtaleDualityAndPerverseSheaves §§3.3–3.5; EtaleCohomologyFoundations §§F.0.2, F.4.5; Mathlib `DerivedCategory`; ComplexComparisonPartII §§C5.6, C6.1, C6.6; Stein Artin-vanishing contract; SchemeAndStackFoundations §§2.18, 2.21, 5.1–5.4; DiophantineApproximationAndTranscendence §3.5; Schneider–Lang commutative-group contract; holonomic realization contract; SpringerResolutionAndCharacteristicCycles §§8.1, 9.1, 9.4 and 9.7; EtaleCohomologyFoundations §§F.5–F.6; EtaleDualityAndPerverseSheaves §0.5; EtaleDualityAndPerverseSheaves §5.10; EtaleDualityAndPerverseSheaves §§2.1, 2.6–2.10; Mathlib `CategoryTheory.ObjectProperty.SerreClassLocalization.abelian`; Mathlib `CategoryTheory.ObjectProperty.SerreClassLocalization.preservesFiniteLimits`; Mathlib `CategoryTheory.ObjectProperty.SerreClassLocalization.preservesFiniteColimits`; FourierDeligneTransform kernel transforms; kernel-composition coherence contract; EtaleCohomologyFoundations §§0.8, F.1, F.2.4, F.2.6–F.2.7, F.3, F.4.6. The exact supplier contracts above retain their coefficient, dimension and finiteness hypotheses.

## Layer 1: twisted fibres and convolution groups

### 1.1 Character-admissible perverse sheaves

For χ∈Π(A), define Pχ to be the full subcategory of perverse K on A for which H^j(A_k̄,Q⊗Lχ)=0 for every geometric perverse subquotient Q of K_k̄ and every j≠0. Set Nχ=Pχ∩N. Then Pχ is Serre and its essential image in P/N is equivalent to Pχ/Nχ. That image contains δ₀ and is closed under quotient convolution and rigid duals. A fixed χ suffices for a tensor category generated by any K belonging to Pχ. (LS, Definition of P^χ before Lemma 2.5, and Lemma 2.5(1)–(2), p. 16; LS line 707; KW, §13, definition of P^χ before Theorem 13.2, and Theorem 13.2, p. 30; KW line 1087.)

Throughout this subsection, χ need not be Galois-invariant for this definition or for a vector-space-valued geometric fibre functor.

Its API includes the following facts.

- K is in Pχ iff every simple geometric constituent has twisted cohomology only in degree zero.
- Pχ is stable under subobjects, quotients and extensions.
- Its quotient by Nχ is the full essential image in P/N.
- The quotient contains the unit and is stable under convolution, duals, finite direct sums and subquotients.

One proof route is as follows. Test the vanishing on the finitely many geometric composition factors; extension stability follows from the long cohomology sequence. Use KW’s closure of the good subcategory under convolution and duality in the quotient, together with the Serre quotient comparison.

**Checks.**

- Every skyscraper δₓ is admissible for every character.
- For dim A>0, F[n] is not admissible for χ=1.
- For a nontrivial geometric rank-one character on a complex abelian variety, F[n] has zero twisted cohomology and is admissible; it becomes zero in the quotient.
- Duality changes χ to χ⁻¹ before the Verdier dual, and yields the stated closure for the same fibre functor.

*Needs:* §0.6; §0.2; §0.4.

### 1.2 Twisted cohomology fibre functor

Define ωχ(K)=H⁰(A_k̄,K_k̄⊗Lχ) on Pχ/Nχ. This is F-linear, faithful, exact and symmetric monoidal with finite-dimensional values, and dim_Fωχ(K)=χ(A,K). Thus (Pχ/Nχ,ωχ) is a neutral Tannakian category in the convention of MotivesAndAlgebraicCycles §6.1. The tensor structure uses the same χ in both factors and the normalized multiplication of Lχ. (LS, Lemma 2.5(3)–(4), p. 16; LS line 710; KW, Theorem 13.2, p. 30; KW line 1087.)

Throughout this subsection, use the Serre quotient and the ordinary vector-space symmetry induced by degree-zero cohomology.

Its API includes the following facts.

- dim ωχ(K)=χ(A,K) for every admissible K.
- ωχ(Q(pH⁰(K*L)))≅ωχ(K)⊗ωχ(L) is coherent with unit, associator and symmetry.
- ωχ preserves short exact sequences and detects zero objects and zero morphisms in the quotient.
- ωχ([−1]⁎DK)≅ωχ(K)∨, compatibly with evaluation.

One proof route is as follows. Concentration turns the long exact cohomology sequence into a short exact sequence and makes Künneth identify convolution cohomology with the tensor product. The kernel consists of Nχ by dimension=Euler characteristic. Descend through the exact quotient; faithfulness follows from exactness and the trivial object kernel.

**Checks.**

- ωχ(δ₀)=F, with the prescribed unit identification.
- A negligible admissible shifted constant object has zero fibre, so faithfulness before quotienting is false.
- The fibre of δₓ*δᵧ has dimension 1, equal to the product of the two fibre dimensions.

*Needs:* §1.1; MotivesAndAlgebraicCycles §§6.1–6.3, 6.8; EtaleDualityAndPerverseSheaves §§3.3–3.5; EtaleCohomologyFoundations §§F.0.2, F.4.5.

### 1.3 Convolution monodromy group

For K∈Pχ let ⟨K⟩⊗ be the full Tannakian subcategory of Pχ/Nχ generated by Q(K) using tensor products, duals, finite sums and subquotients. Define G(K,χ)=Aut⊗(ωχ|⟨K⟩⊗); it is an affine algebraic subgroup of GL(ωχK), acting faithfully on that space. The total category has a proalgebraic Tannaka group; G(K,χ) is its finite-type image. For geometrically semisimple K over an algebraically closed field, G(K,χ) is linearly reductive: its identity component is reductive, while G(K,χ) itself may be disconnected. (LS, §2, pp. 14 and 16–18; §4, p. 28, definition of G and G*; LS line 741.)

Throughout this subsection, the subcategory is essentially small; an object killed by N generates the trivial group with zero distinguished representation.

Its API includes the following facts.

- The action on ωχK is a closed immersion into its general linear group.
- Representations of G(K,χ) identify with the tensor category generated by Q(K), with the given fibre functor.
- The group of K⊕L maps as a closed subgroup to G(K)×G(L), surjecting to each factor.
- For a geometrically semisimple generator in the geometric category the group is linearly reductive in characteristic zero, and its identity component is an object of `TauCeti.ReductiveAffineGroupSchemeCat`.

One proof route is as follows. Apply MotivesAndAlgebraicCycles §§6.1–6.3 to the neutral category. One tensor generator gives a closed faithful finite-dimensional representation. Semisimplicity of the geometric generated category makes every finite-dimensional representation of G(K,χ) semisimple. In characteristic zero restriction to the finite-index normal subgroup G(K,χ)° preserves semisimplicity, and a smooth connected group with semisimple representations is reductive (ReductiveGroups Layer 6).

**Checks.**

- The tensor category generated by δ₀ has trivial group.
- A negligible generator has zero distinguished fibre and cannot yield a positive-rank monodromy group.
- K⊕K gives a diagonal copy of G(K) in G(K)², rather than automatically the full product.
- For a nonzero hypersurface object, the distinguished representation is faithful of positive rank.
- For δₓ with x of order 2 the group is μ₂, with two geometric components and semisimple representations; it is linearly reductive but not an object of the connected reductive carrier.

*Needs:* §1.2; MotivesAndAlgebraicCycles §§6.1–6.3, 6.8; Tau Ceti `TauCeti.Tannaka.tensorAutFunctor`; Tau Ceti `TauCeti.Tannaka.fgPointTensorIsoEquiv`; Tau Ceti `TauCeti.FiniteTypeAffineGroupSchemeCat`; Tau Ceti `TauCeti.ReductiveAffineGroupSchemeCat`; ReductiveGroups Layers 3 and 6.

### 1.4 Change of fibre character

If χ and ψ are good for K, the two tensor-generated geometric categories are the same full subcategory of P/N. The tensor-isomorphism functor Isom⊗(ωχ,ωψ) is a torsor for their Tannaka groups. On the finite-type category generated by K over F=Q̄_ℓ it has an F-point, giving an isomorphism of the two represented groups, well defined up to inner conjugation. No canonical identification of their fibres is asserted. (LS, §2, p. 16, paragraph after Lemma 2.5; LS line 741.)

Throughout this subsection, work on a finitely tensor-generated category over the algebraically closed coefficient field.

One proof route is as follows. Identify both generated categories inside the common quotient. Apply MotivesAndAlgebraicCycles §6.8. Use finite type and algebraic closedness to obtain a rational torsor point. Changing that point changes the comparison by conjugation.

**Checks.**

- For δ₀ both fibres are F and the group comparison is the unique map of the trivial group.
- For G=GL₂, changing a tensor-isomorphism by diag(2,1) sends the matrix unit E₁₂ to 2E₁₂; a canonical basis-independent equality of matrices fails.
- Over a field that is not algebraically closed a torsor need not have a rational point: the μ₂-torsor x²=−1 over ℝ has no real point and two complex points, so the comparison uses the algebraically closed coefficient field F.

*Needs:* §1.3; MotivesAndAlgebraicCycles §§6.1–6.3, 6.8.

### 1.5 Euler-one perverse sheaves

A simple perverse sheaf K on a complex abelian variety A of any dimension with χ(A,K)=1 is a rank-one skyscraper δₓ. Consequently every one-dimensional simple object of the semisimple convolution quotient has such a representative. Convolution by it translates supports. (K1, Lemma 3.5 and its proof, pp. 26–27, K1 line 1036; KW, Proposition 10.1(b) and its proof, pp. 21–22, KW lines 787 and 795; Sch, Proposition 22.1 and Corollary 25.3, Sch lines 1762 and 2019; LS, proofs of Lemma 3.11, p. 24, and Lemma 4.1, p. 29; LS line 1085.)

Throughout this subsection, the field is algebraically closed of characteristic zero, reached through the comparison and base-extension interfaces; the proof is over C after extending coefficients along ι:F→C, and the conclusion descends because a skyscraper is detected by its support and rank.

One proof route is as follows. Realize K as a simple regular holonomic D_A-module M (holonomic realization contract) and let F=FM_A(M) be its transform (§0.8). By generic vanishing (§0.4) and the fibre formula of §0.8(a), the derived fibre of F at a general point of A♮ is a one-dimensional vector space in degree zero, so H⁰F has generic rank χ(A,K)=1 and Supp F=A♮. By §0.8(c), H⁰F is reflexive of rank one, hence a line bundle ℒ on the smooth variety A♮, and every H^kF with k>0 is supported in codimension at least four, so its first Chern class vanishes; hence c₁(ℒ)=c₁(F)=0 in H²(A♮,Z)=H²(Â,Z) by §0.8(d). Since π⁎:Pic(Â)→Pic(A♮) is an isomorphism and the Néron–Severi group of Â injects into H²(Â,Z), ℒ=π⁎P_x for a point x∈A(C), that is ℒ≅H⁰FM_A(δ_x). The transforms F and FM_A(δ_x) are transforms of simple holonomic modules with support A♮ and isomorphic locally free H⁰, so they are isomorphic by the reconstruction statement of §0.8(c), and the equivalence §0.8(b) gives M≅δ_x. Finally dim ω=Euler characteristic identifies the one-dimensional simple objects of the quotient, after discarding negligible summands, with such representatives. The argument of KW Proposition 10.1(b) through the index formula (§4.2) and the conormal lemmas KW 10.3–10.4 covers a simple A of dimension at least two; the Fourier–Mukai route is uniform in A and needs no reduction to simple factors.

**Checks.**

- A rank-r skyscraper has Euler characteristic r; rank one is essential.
- A positive-dimensional smooth ample support cannot itself be a one-dimensional fibre object.
- For δₓ⊕δₓ, the Euler characteristic is 2 and the object is not simple; the theorem cannot identify it with a rank-one skyscraper.
- On an elliptic curve E, an irreducible local system L of rank r≥2 on E∖{0} with local monodromy T at the puncture gives the simple perverse sheaf j_*L[1] with χ=r−dim L^T. For r=2, T is the commutator of the images A,B of the two generators of π₁(E∖{0}), of determinant one, and a fixed vector would make T unipotent with trace 2; but for two elements of SL₂(C) the commutator has trace 2 exactly when they have a common eigenvector, which contradicts irreducibility. So χ=2 and never 1: the theorem has content for g=1, where the conormal argument of KW is not available, and the Fourier–Mukai route covers it.

*Needs:* §1.2; §0.3; §0.4; §0.8; holonomic realization contract; EtaleDualityAndPerverseSheaves §§3.3–3.5; EtaleCohomologyFoundations §§F.0.2, F.4.5.

### Examples

For δₓ the twisted fibre has dimension 1. If x has order m, its geometric tensor group is μ_m; if x has infinite order it is G_m. At x=0 it is trivial. Two copies of the same generator give a diagonal group, rather than a product. These three cases distinguish tensor generation, faithful image and finite versus finite-type group. (LS §2, LS line 741; KW Proposition 10.1, KW line 787.)

### Dependencies

§0.6; §0.2; §0.4; §0.8; holonomic realization contract; MotivesAndAlgebraicCycles §§6.1–6.3, 6.8; EtaleDualityAndPerverseSheaves §§3.3–3.5; EtaleCohomologyFoundations §§F.0.2, F.4.5; Tau Ceti `TauCeti.Tannaka.tensorAutFunctor`; Tau Ceti `TauCeti.Tannaka.fgPointTensorIsoEquiv`; Tau Ceti `TauCeti.FiniteTypeAffineGroupSchemeCat`; Tau Ceti `TauCeti.ReductiveAffineGroupSchemeCat`; ReductiveGroups Layers 3 and 6; §0.3. The exact supplier contracts above retain their coefficient, dimension and finiteness hypotheses.

## Layer 2: arithmetic and geometric Tannaka groups

### 2.1 Arithmetic and geometric convolution categories

Fix χ∈Π(A). Let C_ar be the full subcategory of Pχ/Nχ represented by geometrically semisimple perverse sheaves on A. Let C_geo be the full subcategory on A_k̄ consisting of direct summands of pullbacks of these objects. Both, with ωχ, are neutral Tannakian. For geometrically semisimple representatives K,L the quotient Hom is Hom_P(K,L) modulo maps factoring through N. C_geo is deliberately the category generated by arithmetic pullbacks, rather than the entire geometric perverse quotient. The arbitrary semisimple category uses the semisimple proper-direct-image contract; its geometric-origin subcategory uses the geometric decomposition theorem. (LS, Lemmas 2.6–2.7, pp. 16–17; LS line 749.)

Throughout this subsection, k has characteristic zero. Geometric semisimplicity is imposed on pullbacks, not on the arithmetic representation at the origin. LS state Lemma 2.7 for every geometrically semisimple object; its closure under convolution then needs Kashiwara’s conjecture (the semisimple proper-direct-image contract). Restricted to objects of geometric origin, which include the finite-order geometric constructions of Layers 3–9, the decomposition theorem EtaleDualityAndPerverseSheaves §5.10 suffices.

Its API includes the following facts.

- Geometric pullback is exact tensor from C_ar to C_geo and agrees with ωχ on underlying vector spaces.
- For the specified representatives, morphisms are honest perverse morphisms modulo negligible factorizations.
- Every object of C_geo is a direct summand, hence both subobject and quotient, of an arithmetic pullback.
- A continuous finite-dimensional F-representation V of Gal(k̄/k) gives δ₀⊗V in C_ar; this embedding is full and exact tensor.

One proof route is as follows. Split each geometrically semisimple object into its negligible and nonnegligible geometric parts; Galois-stable isotypic projectors descend. This proves the Hom formula without asserting it for arbitrary objects. Convolution is proper pushforward along addition. For objects of geometric origin the decomposition theorem EtaleDualityAndPerverseSheaves §5.10 makes the convolution of geometrically semisimple objects geometrically semisimple; for arbitrary geometrically semisimple objects, as LS state it, this is Kashiwara’s conjecture, the semisimple proper-direct-image contract. Semisimplicity then makes kernels, cokernels and geometric subobjects summands of arithmetic pullbacks.

**Checks.**

- A nonsplit extension of trivial Galois representations at the origin is geometrically semisimple, so arithmetic semisimplicity cannot be substituted.
- The pullback of δ₀⊗V is a direct sum of dim V copies of the tensor unit.
- An arbitrary continuous Galois representation supported at 0 belongs to C_ar, even if the arithmetic representation is not semisimple.
- For k with a Galois quotient S₃ and V its irreducible two-dimensional representation, δ₀⊗V has endomorphism algebra F in C_ar (Schur) and M₂(F), of dimension four, in C_geo; a comparison identifying the two Hom spaces would be wrong by a factor of four.

*Needs:* §1.1; §1.2; EtaleDualityAndPerverseSheaves §5.10; MotivesAndAlgebraicCycles §§6.1–6.3, 6.8; semisimple proper-direct-image contract.

### 2.2 Arithmetic–geometric exact sequence

Let G_ar=Aut⊗(ωχ|C_ar), G_geo=Aut⊗(ωχ|C_geo), and Gal_k^alg be the Tannaka group of continuous finite-dimensional F-representations of Gal(k̄/k). There is an exact sequence of affine proalgebraic group schemes 1→G_geo→G_ar→Gal_k^alg→1: the first map is a closed immersion and the second faithfully flat, with scheme-theoretic kernel G_geo. Gal_k^alg is not identified with the profinite Galois group as a constant group scheme. (LS, Lemma 2.8 and its proof, p. 18; LS line 804; EHS, Appendix A, Theorem A.1, pp. 20–21; EHS line 781.)

Throughout this subsection, categories and fibre functors are those of Layer 2; the coefficient field F has characteristic zero.

One proof route is as follows. Apply EHS Theorem A.1 through the Tannaka kernel exactness contract. The origin-supported Galois embedding is full and stable under subquotients, giving faithful flatness. Every geometric object embeds in a pullback. Objects becoming sums of geometric units are precisely origin-supported arithmetic objects modulo N. The maximal geometric unit subobject descends, by its canonical origin-supported projector. These verify kernel exactness, not merely normality on rational points.

**Checks.**

- For A=Spec k, the geometric group is trivial and G_ar=Gal_k^alg.
- For k algebraically closed the arithmetic and geometric categories coincide.
- The upper-triangular two-dimensional unipotent Galois representation at 0 has geometric fibre F² but a nontrivial arithmetic action; replacing the proalgebraic quotient by a trivial group fails.

*Needs:* §2.1; MotivesAndAlgebraicCycles §§6.1–6.3, 6.8; Tannaka kernel exactness contract.

### 2.3 Galois normalization of geometric monodromy

Suppose χ is Galois-invariant and K on A is geometrically semisimple and belongs to Pχ. Using the origin-normalized descent Lχ, the continuous Galois action on ωχK normalizes the geometric convolution group G_K and hence (G_K°)^der. These groups are viewed in GL(ωχK) through the same fibre functor; changing χ conjugates the comparison. (LS, Lemma 2.9 and its proof, pp. 18–19; LS line 842.)

Throughout this subsection, for a geometrically semisimple K it suffices to check concentration on K, since geometric direct summands then inherit it.

One proof route is as follows. The normalized descent defines tensor automorphisms of the arithmetic fibre functor for each Galois element. Take the image of the normal geometric subgroup in GL(ωχK); identity component and derived subgroup are characteristic and are therefore preserved.

**Checks.**

- For K=δₓ with x∈A(k) of infinite order and χ of finite order m fixed by Galois, the geometric group is 𝔾_m acting on the one-dimensional fibre ωχ(δₓ)=(Lχ)ₓ, and Galois acts on that fibre through the Kummer character σ↦χ(σ(y)−y) for y with my=x, which is trivial for x=mz with z∈A(k) and nontrivial for a suitable χ of order m when x∉mA(k): the normalized descent makes the arithmetic action a scalar, which normalizes 𝔾_m, whereas the unnormalized descent twisted by a Galois character would act by a different scalar on the same fibre.
- For K=δ₀⊗V with V a Galois representation, the geometric group is trivial, its normalizer is all of GL(V), and the Galois action on ωχ(K)=V is V itself: normalization constrains nothing here and does not place the Galois image inside the geometric group.
- The identity Galois action normalizes G but need not contain G=SL₂: the identity subgroup has dimension 0 and SL₂ has dimension 3.

*Needs:* §0.2; §2.2; §1.3; §1.4.

### 2.4 Geometric extension comparison

For algebraically closed characteristic-zero fields k⊂K, A/k, and a constructible perverse F-sheaf Q defined over k, pullback identifies the tensor-generated convolution categories of Q and Q_K, their negligible quotients, and the represented convolution groups after choosing compatible fibre functors. This comparison is for the categories generated by the given object; it does not claim that every perverse sheaf over K descends to k. (LS, Uses in Lemma 3.14, pp. 25–26, and Lemmas 4.1 and 4.4, pp. 28–31; LS line 1406.)

Throughout this subsection, sheaves are continuous adic sheaves with finite stratifications satisfying the coefficient essential-image condition of EtaleDualityAndPerverseSheaves §§3.3–3.5.

One proof route is as follows. Use the closed-extension constructible comparison contract for fully faithful invariance of constructible Hom and geometric simple objects under algebraically closed extension. Proper base change preserves convolution, cohomology and Euler characteristic. Full faithfulness and preservation of simple constituents identify all subquotients of tensor constructions of Q.

**Checks.**

- δₓ with x defined over k remains the same tensor generator after extension.
- For k=Q̄⊂K=C, A over Q̄ and Q=δ_y with y∈A(Q̄) of infinite order, the category generated by Q_C contains exactly the skyscrapers at the multiples ny, n∈Z, of y, with group 𝔾_m, and a point x∈A(C)∖A(Q̄) gives a skyscraper δₓ on A_C that lies in no such category: the comparison identifies the groups of Q and Q_C without admitting objects defined only over K.
- A rank-one skyscraper has endomorphism dimension 1 before and after extension; the comparison cannot enlarge it to a free family of supports.

*Needs:* §1.3; §0.6; EtaleDualityAndPerverseSheaves §§3.3–3.5; EtaleCohomologyFoundations §§F.0.2, F.4.5; closed-extension constructible comparison contract.

### Examples

For A=Spec k, every geometric object is a sum of tensor units, so G_geo=1 and G_ar=Gal_k^alg. A nonsplit unipotent two-dimensional Galois representation supported at 0 pulls back to F². It remains an arithmetic object even though it is not arithmetically semisimple. (LS Lemmas 2.7–2.8, LS lines 777 and 804.)

### Dependencies

§1.1; §1.2; EtaleDualityAndPerverseSheaves §5.10; MotivesAndAlgebraicCycles §§6.1–6.3, 6.8; §0.2; §1.3; §1.4; §0.6; EtaleDualityAndPerverseSheaves §§3.3–3.5; EtaleCohomologyFoundations §§F.0.2, F.4.5; closed-extension constructible comparison contract. The exact supplier contracts above retain their coefficient, dimension and finiteness hypotheses.

## Layer 3: hypersurface Euler and Hodge data

### 3.1 Euler characteristics of a smooth ample divisor

Let A be a complex abelian variety of dimension n≥2 and i:H↪A a smooth ample divisor, with L=O_A(H). Put d=[H]^n/n!=χ(A,L)>0 and N=[H]^n=n!d. Then χ(H,O_H)=(−1)^(n−1)d, e_top(H)=(−1)^(n−1)N, and χ(H,Ω_H^q)=(−1)^(n−1−q)d A(n,q) for 0≤q<n. Here A(n,q) counts permutations with q descents; for integral q outside [0,n−1] it is extended by zero. The n=0 convention of ClassicalArithmeticCompletion Layer 2 is not overwritten. (LS, Lemmas 3.1–3.4, pp. 20–21; equation (2), p. 20; LS line 873.)

Throughout this subsection, H is smooth and ample; intersection degree is an integer; n≥2 ensures connectedness.

One proof route is as follows. Use the imported abelian Riemann–Roch formula and vanishing to identify the positive integer d; the trivial tangent bundle and normal sequence give e_top(H) with the displayed sign. Resolve Ω_H^q using the conormal exact sequence and the exterior powers of the trivial cotangent bundle of A. Apply line-bundle Riemann–Roch to the alternating Euler characteristics, and identify the resulting finite difference with the imported Eulerian formula.

**Checks.**

- For n=2 the Euler characteristics of O_H and Ω_H¹ are −d,d and e_top(H)=−2d.
- For n=3 the Ω-row is d,−4d,d and N=6d.
- For n=4 the unsigned row is d,11d,11d,d and N=24d.
- At n=2,d=1, χ(O_H)=−1, e_top(H)=−2 and dim V_H=2; equating signed Euler characteristic with dimension fails.

*Needs:* AbelianSchemesAndArithmeticModuli §A1.3; AbelianSchemesAndArithmeticModuli §A2.4; SchemeAndStackFoundations §§5.4–5.5 and 5.8; EtaleCohomologyFoundations §F.6; ComplexComparisonPartII §C6.6; ClassicalArithmeticCompletion §§2.18 and 2.39.

### 3.2 Distinguished hypersurface representation

For the smooth ample divisor H in Layer 3, define K_H=i_*F[n−1] in the perverse category. Its image under a good ωχ is the distinguished representation V_H of G_H=G(K_H). It is irreducible, has dimension N=n!d>0, and identifies with H^(n−1)(H,Lχ|H). The shift is n−1, not n. The subgroup used in monodromy theorems is G_H*=(G_H°)^der. (LS, §3 before Theorem 3.5 and Lemma 3.7, p. 21; §4, p. 28; LS line 864.)

Throughout this subsection, use a good character; H is geometrically connected and smooth.

Its API includes the following facts.

- i_*F[n−1] is a simple perverse object on A.
- dim V_H=[H]^n=n!d.
- For good χ, V_H≅H^(n−1)(H,Lχ|H).
- Translating H translates K_H by convolution with δₓ and compares the generated representation by a one-dimensional tensor twist.

One proof route is as follows. The rank-one constant local system on the smooth connected support shifted by its dimension is a simple perverse sheaf; finite closed pushforward preserves it. Its fibre dimension is its perverse Euler characteristic, which changes the topological sign to N>0. Identify degree-zero cohomology of the shift with middle unshifted cohomology.

**Checks.**

- For n=2 the perverse shift is [1]; the dimension is 2d despite the negative topological Euler characteristic.
- For n=3,d=1, dim V_H=6 and the relevant cohomology degree is 2.
- i_*F[n] is not in the perverse heart; its degree-zero fibre cannot be substituted for V_H.
- The zero object cannot occur because N>0.

*Needs:* §3.1; §1.3; EtaleDualityAndPerverseSheaves §§2.1, 2.6–2.10.

### 3.3 Hodge–Tate row of a generic torsion twist

Let A/k be an n-dimensional abelian variety over a finite extension k/Q_p, let H⊂A be smooth ample, and let χ be a finite-order geometric character for which H^j(H_k̄,Lχ)=0 when j≠n−1. After a finite extension k′ defining χ, its coefficients and normalized descent, V=H^(n−1)(H_k̄,Lχ) is Hodge–Tate. In the PadicHodgeTheory §3.3 convention HT(cyclotomic)=+1, weight −q occurs with multiplicity d A(n,q), for 0≤q<n. Thus the nonnegative label q used in LS is the negative of the native Hodge–Tate weight. No good-reduction hypothesis is needed. (LS, Lemma 3.13, p. 25; LS line 1137.)

Throughout this subsection, p is the cohomological prime in this node; finite coefficients can be enlarged inside Q̄_p.

One proof route is as follows. Realize the character-isotypic part of the cohomology of [m]⁻¹H using the finite étale A[m]-cover and its rational idempotent after coefficient extension. The idempotent is valid also when p divides m, since the coefficient field has characteristic zero. Apply proper smooth comparison and its Hodge decomposition to each isotypic part. A torsion line-bundle twist has rational Chern character 1, so Riemann–Roch preserves the Ω-Euler characteristics. Concentration of total cohomology and Hodge–de Rham degeneration isolate H^(n−1−q)(Ω^q⊗L), giving dA(n,q). Translate the source’s labels by h=−q.

**Checks.**

- For n=3,d=1 the native weights are 0,−1,−2 with multiplicities 1,4,1.
- Their total dimension is n!d, as required by the distinguished representation.
- For n=2 the row has d copies of weight 0 and d copies of weight −1, total 2d=2!d; a convention with native weight +1 for the cyclotomic character and weights +q here would give d copies of +1 instead, which is not the Hodge–Tate decomposition of H¹ of a curve.

*Needs:* §3.1; §0.2; PadicHodgeTheory §§3.3, 8.1–8.2; Hodge–Tate image cocharacter contract; AbelianSchemesAndArithmeticModuli §§A3.1–A3.5; isogeny character/trace contract.

### Examples

For n=2,d=1, χ(O_H)=−1, χ(Ω¹_H)=1, e_top(H)=−2 and dim V_H=2, with shift [1]. For n=3,d=1 the coherent row is 1,−4,1 and the distinguished dimension is 6, with native Hodge–Tate weights 0,−1,−2 and multiplicities 1,4,1. For n=4 the unsigned row is 1,11,11,1 and N=24. (LS Lemmas 3.1–3.4 and 3.13, LS lines 873 and 1137.)

### Dependencies

AbelianSchemesAndArithmeticModuli §A1.3; AbelianSchemesAndArithmeticModuli §A2.4; SchemeAndStackFoundations §§5.1–5.4, 5.8; conormal geometry contract; ClassicalArithmeticCompletion §2.18; ClassicalArithmeticCompletion §2.39; §1.3; EtaleDualityAndPerverseSheaves §§2.1, 2.6–2.10; §0.2; PadicHodgeTheory §§3.3, 8.1–8.2; Hodge–Tate image cocharacter contract; AbelianSchemesAndArithmeticModuli §§A3.1–A3.5. The exact supplier contracts above retain their coefficient, dimension and finiteness hypotheses.

## Layer 4: microlocal structure and simple groups

### 4.1 Clean conormal cycle ring

For a complex abelian variety A of dimension n set V=H⁰(A,Ω_A¹) and T*A=A×V. Let L(A) be the free abelian group on irreducible conic Lagrangian n-dimensional subvarieties Λ⊂A×V that dominate V (the clean components). The clean part discards nondominant components. Define degΛ by the generic Gauss-map degree and extend additively. For two generators restrict to a common open U⊂V on which both Gauss maps are finite flat, take their fibre product, push its cycle forward along addition A×A×U→A×U with generic degrees and multiplicities, and take the unique clean closure. Extend bilinearly to obtain ◦. This is a commutative ring with unit Λ₀; deg(Λ₁◦Λ₂)=degΛ₁ degΛ₂. (K2, Definition 1.2.2, p. 8, and Example 1.3.2, p. 9; K2 line 341; LS, proof of Lemma 3.9, p. 22; LS line 1003.)

Throughout this subsection, cycle pushforward uses lengths and mapping degrees; an image support alone is insufficient.

Its API includes the following facts.

- Taking the clean part twice has the same result as taking it once.
- Restriction of Λ₁◦Λ₂ to a valid common Gauss open is the cycle pushforward of the finite-flat fibre product.
- The operation is associative, commutative, bilinear, with unit the conormal to 0.
- Generic Gauss degree is a ring homomorphism to ℤ and is positive on nonzero effective clean cycles.

One proof route is as follows. Construct the cycle group and clean projection from the imported algebraic-cycle operations. Shrink the finite flat Gauss open to make cycle intersections and addition pushforward well defined. Show independence by restricting two choices to their common dense open and uniqueness of clean closure. Associativity comes from the triple fibre product; degrees multiply by finite-flat degree.

**Checks.**

- Λₓ◦Λᵧ=Λₓ₊ᵧ, with Gauss degree 1.
- For n>0 the zero section has clean part zero since its image in V is {0}.
- (2Λₓ)◦(3Λᵧ)=6Λₓ₊ᵧ; replacing the product by its reduced support fails this test.
- Positive-degree effective clean cycles have nonzero convolution.

*Needs:* AbelianSchemesAndArithmeticModuli §A1.3; SchemeAndStackFoundations §§5.1–5.4, 5.8; conormal geometry contract; §0.3.

### 4.2 Clean characteristic cycle of a perverse sheaf

Through regular-holonomic Riemann–Hilbert and the constructible comparison, attach to a perverse F-sheaf K on a complex abelian variety its effective characteristic cycle CC(K), and let cc(K) be its clean part. The clean map cc on Grothendieck groups is additive, respects quotient convolution, and satisfies deg cc(K)=χ(A,K); the full cycle CC is additive on perverse exact sequences. For a smooth closed subvariety Z of dimension r with a rank-one constant local system, CC(i_*F[r]) is the conormal Λ_Z with multiplicity one. It respects translation, inversion duality and finite étale isogeny pushforward. (K2, §2, Definition 2.2.1, p. 13, with §§2.1–2.2, pp. 12–14; K2 line 628; KW, proof of Proposition 10.1, p. 22; KW line 805; LS, proof of Lemma 3.9, p. 22; LS line 1003.)

Throughout this subsection, choose a coefficient-field identification for the complex microlocal realization and record independence of the resulting integral cycle. General RH belongs to ComplexComparisonPartII.

Its API includes the following facts.

- Characteristic cycles add in perverse short exact sequences.
- cc(pH⁰(K*L))=cc(K)◦cc(L).
- A rank-r local system shifted by the support dimension on a smooth closed support has cycle rΛ_Z.
- deg cc(K)=χ(A,K), compatibly with finite-isogeny pushforward.

One proof route is as follows. Import the characteristic cycle of a coherent D-module from SpringerResolutionAndCharacteristicCycles §8.6, and the regular-holonomic Riemann–Hilbert correspondence, Kashiwara’s index theorem and the direct-image, external-product and isogeny compatibilities specified in the holonomic realization contract; use the direct-image compatibility to compare convolution. Pass to the clean part. Its Gauss degree gives the index formula; negligible components are exactly those discarded from the Euler-characteristic calculation.

**Checks.**

- The cycle of δₓ is a reduced conormal of degree 1.
- For dim A>0, CC(F[n]) is the zero section with multiplicity one, whereas cc(F[n])=0.
- A rank-two constant sheaf on a smooth support has multiplicity two, rather than a reduced cycle.
- For the smooth ample H, cc(K_H)=Λ_H and degΛ_H=N.

*Needs:* §4.1; EtaleDualityAndPerverseSheaves §§3.3–3.5; EtaleCohomologyFoundations §§F.0.2, F.4.5; ComplexComparisonPartII §§C5.6, C6.6; holonomic realization contract; SpringerResolutionAndCharacteristicCycles §§8.6 and 9.5.

### 4.3 Microlocal fibre functor and the cycle–weight dictionary

Let A be a complex abelian variety, V=H⁰(A,Ω¹_A) and η the generic point of V. Through the regular-holonomic realization, let M(A) be the quotient of the perverse category by negligible objects with its convolution product (§0.6). Prove the following. (a) There is an F-linear exact tensor functor μ from M(A) to the tensor category of germs over η of vector bundles on clean conic Lagrangian cycles finite étale over an open subset of V, with direct-image tensor product along addition, such that the support of μ(K) is cc(K) with its multiplicities (§4.2). (b) For K in M(A) and a very general point u∈V (outside countably many proper closed subsets), μ restricted to the tensor category ⟨K⟩ generated by K factors through germs at u; taking the fibre at u gives a fibre functor ω_u on ⟨K⟩ with values in vector spaces graded by the finitely generated subgroup X_u⊂A(C) generated by the points a with (a,u) in the support of CC(K). Put G_u=Aut⊗(ω_u|⟨K⟩) and T_u=Hom(X_u,G_m). Then T_u is a closed subgroup of multiplicative type of G_u, the monodromy group of the Gauss map of the characteristic variety embeds in N_(G_u)(T_u)/Z_(G_u)(T_u) compatibly with its action on X_u, and in ω_u(K) the T_u-character of a point a has multiplicity equal to the multiplicity in CC(K) of the component through (a,u). (c) The map ω_u(N)↦cc(N) is a λ-ring homomorphism from the representation ring R(G_u) to the ring of clean cycles of §4.1, with dim ω_u(N)=deg cc(N)=χ(A,N); on clean cycles the Adams operation Ψ^n is pushforward [n]_*. (d) Let K₀⊂A(C) be the finite group of torsion points a such that δ_a lies in ⟨K⟩. The component group G_u/G_u° is Cartier dual to K₀. For an isogeny f:A→B the Tannaka group of f_*K is the finite-index subgroup of G_u containing G_u° whose component group is dual to K₀/(K₀∩ker f); in particular it is G_u° when K₀⊂ker f. For simple K the representation ω_u(K) restricts irreducibly to G_u° iff K is not isomorphic to its translate by any nonzero point of K₀. (e) Suppose ⟨K⟩ is semisimple, let T⊂G_u be a maximal torus, and let h:A→A/(X_u)_tors be the quotient isogeny, so that X_u/(X_u)_tors is a subgroup of (A/(X_u)_tors)(C). There is an epimorphism from the character group of T onto X_u/(X_u)_tors such that, for every N in ⟨K⟩, the character of ω_u(N) restricted to T and pushed along this epimorphism is the fibre over u of the clean cycle h_*cc(N) on A/(X_u)_tors; and each Weyl orbit of characters of T is the image of a unique effective clean cycle on A/(X_u)_tors. The comparison takes values in cycles on the quotient A/(X_u)_tors, not on A: restriction to G_u° forgets the torsion part of the grading, and distinct cycles on A with the same image under h give the same character. (f) Suppose G_u is connected, which (d) achieves for f_*K after an isogeny f with K₀⊂ker f, and let p:Ĝ→G_u be a central isogeny of degree e from a connected reductive group. If N∈⟨K⟩ and p⁎ω_u(N)≅S(U₁,…,U_r) for a tensor construction S and representations U_i of Ĝ, then [e]_*cc(N)=S(Λ₁,…,Λ_r) with Λ_i=cc(Ψ^e U_i)∈⟨cc(K)⟩ clean cycles of degree dim U_i. The Λ_i need not be effective on A; they are effective up to isogeny: for g:A→A/(X_u)_tors each g_*Λ_i is effective, so if t is the exponent of (X_u)_tors and q:A/(X_u)_tors→A is the isogeny with q∘g=[t], then [et]_*cc(N)=S(q_*g_*Λ₁,…,q_*g_*Λ_r) with effective clean factors q_*g_*Λ_i=[t]_*Λ_i of degree dim U_i. (K1, Theorem 1.5, Corollary 1.6 and Theorem 1.7, pp. 6–10, K1 lines 227, 242 and 360; Theorem 5.10, p. 47, K1 line 1893; K2, Proposition 1.3.3, p. 10, K2 line 452; Theorem 2.1.1, Corollaries 2.1.2 and 2.2.2, pp. 12–14, K2 lines 580, 611 and 637; Theorem 2.2.3 and Corollary 2.2.4, pp. 14–15, K2 lines 677 and 711; Theorem 2.3.1 and Remark 2.3.2, pp. 15–16, K2 lines 728 and 776.)

Throughout this subsection, coefficients are extended to C along ι:F→C, so that M(A) and ⟨K⟩ are C-linear and the fibre functors take values in C-vector spaces; very general means outside a countable union of proper Zariski-closed subsets of V; the groups G_u for different u and the base changes to C of the groups G(K,χ) of §1.3 are isomorphic up to inner conjugacy, and all statements are transported through that comparison.

Its API includes the following facts.

- ω_u is exact, faithful and tensor on ⟨K⟩, and the grading by X_u is compatible with convolution through addition in A(C).
- The T_u-weights of ω_u(K) are the Gauss-fibre points over u, with multiplicities given by CC(K).
- cc(N₁⊗N₂)=cc(N₁)◦cc(N₂), cc(N^∨)=[−1]_*cc(N) and cc(Ψ^n N)=[n]_*cc(N) on R(G_u).
- Ψ^e U has character Σ_λ m_λ e^(eλ) with nonnegative coefficients when U has weight multiplicities m_λ, so the pushforward g_*cc(Ψ^e U) to A/(X_u)_tors is effective although Ψ^e U is in general only a virtual representation; cc(Ψ^e U) itself need not be effective on A.
- The character map R(G_u°)→ℤ[X(T)], N↦ch(N|_T), is injective with image the Weyl invariants ℤ[X(T)]^W: characters are Weyl-invariant, and for dominant λ the character of the irreducible representation of highest weight λ is e^λ plus terms lower in the dominance order, so the irreducible characters are unitriangular against the orbit sums Σ_(μ∈Wλ) e^μ, which form a ℤ-basis of the invariants (K2, proof of Corollary 2.2.4, p. 15, K2 line 714).

One proof route is as follows. Microlocalize regular holonomic modules to microdifferential modules on T*A, restrict to the locus where the Gauss map of the characteristic variety is finite étale, and twist by a square root of the relative canonical bundle chosen compatibly with convolution (K1 §§4–5, K2 §2.1); this gives μ, first with values in germs of local systems on the finite étale Gauss covers and then, by taking holomorphic sections, in germs of vector bundles, with its support property (K1 Theorem 5.10, K2 Theorem 2.1.1). For (b) choose u from the tensor words, not from the objects of ⟨K⟩: let 𝒲 be the countable set of convolution powers of K⊕K^∨; μ(W) is a germ of local systems over an open U_W⊂V, and for each pair W,W′ a basis of the finite-dimensional space Hom(W,W′) is realized by morphisms of local systems over an open U(W,W′); a point u in the intersection of these countably many opens is very general. Every object of ⟨K⟩ is a subquotient W₁/W₂ of some W, and the sub-local systems μ(W₂)⊂μ(W₁)⊂μ(W), given a priori near the generic point, extend uniquely over U_W because the fundamental group of a dense open of the smooth finite étale cover of U_W surjects onto that of the whole cover; morphisms of local systems have locally constant rank, so kernels, images and cokernels are again local systems over U_W and μ is exact there. Taking fibres at u gives ω_u, exact, faithful and tensor; only then are local systems replaced by vector-bundle germs. The isomorphism classes of ⟨K⟩ are not countable in general (the genus-two Check below), so a very general point cannot be chosen object by object. The grading by X_u makes T_u act; Gauss monodromy acts on the grading by tensor automorphisms, giving the Weyl-group embedding (K1 Theorem 4.3). The λ-ring property follows because μ is a tensor functor and support is a λ-ring homomorphism into the group ring of X_u, where Ψ^n is multiplication by n. The component-group description (d) follows from the description of Rep(G_u/G_u°) by finite-order characters of π₁ of the dual abelian variety, obtained from the principal-bundle reduction of the vector bundle H⁰FM_A(M) on the locally free locus of the Fourier–Mukai transform of §0.8 and the reconstruction of FM_A(M) from that vector bundle (K1 Theorems 3.2 and 3.4, K1 lines 946 and 1010). For (e), the identity component of the group of multiplicative type T_u=Hom(X_u,𝔾_m) is the torus Hom(X_u/(X_u)_tors,𝔾_m), which lies in a maximal torus up to conjugacy, giving the epimorphism on character groups; the restriction of the character of ω_u(N) to that subtorus is the X_u/(X_u)_tors-grading of ω_u(N), which is the fibre over u of h_*cc(N) by (b) and the isogeny compatibility of cc (§4.2), and the character map identifies R(G_u°) with the Weyl invariants ℤ[X(T)]^W, as in the API bullet above (ReductiveGroups Layer 10 for the classification of rational simples by dominant weights of X(T); LieHighestWeight Layers 4 and 6 for highest weights and the Weyl invariance of characters). For (f), the Adams operation Ψ^e maps R(Ĝ) into R(G_u) because the character group of p(T̂) has index e in that of T̂ and Ψ^e=[e]_* on character rings; naturality of tensor constructions under the λ-ring homomorphism Ψ^e and (c) give the cycle identity. The cycles cc(Ψ^eU_i) are differences of effective cycles in general; by (e) their pushforwards to A/(X_u)_tors are the cycles of the nonnegative weight multisets of Ψ^eU_i, hence effective, and pushing further along q and using that [t]_*=Ψ^t is a λ-ring homomorphism of clean cycles gives the displayed identity for [et]_*cc(N) (K2 Theorem 2.3.1 and Remark 2.3.2, K2 lines 728 and 776).

**Checks.**

- For δₓ the grading has the single point x with multiplicity one, matching CC(δₓ)=Λₓ; for δₓ⊕δₓ the multiplicity is two, matching 2Λₓ.
- For δₓ^(⊕2)*δᵧ^(⊕3)=δ_(x+y)^(⊕6) the single weight x+y has multiplicity six, matching (2Λₓ)◦(3Λᵧ)=6Λ_(x+y); a dimension-only assignment would give the same total 6 but would not determine the grading point.
- For Λ=Λₓ+Λᵧ with x≠y, the λ-ring formula λ²(Λ)=½(Λ◦Λ−[2]_*Λ)=½(Λ_(2x)+2Λ_(x+y)+Λ_(2y)−Λ_(2x)−Λ_(2y)) equals Λ_(x+y), the exterior square of a two-dimensional representation with weights x and y.
- For Ĝ=SL₂→PGL₂ (e=2) and the adjoint representation Sym²U of the standard U, Ψ²U=Sym²U−Λ²U is virtual but has character with weights ±2 and coefficients one, so after the pushforward to A/(X_u)_tors the cycle of Ψ²U is effective of degree 2 and the cycle of N=Sym²U has degree 3=dim Sym²U; the degrees 2 and 3 are unchanged by the isogenies [e] and [t].
- In SO₃ the Klein four-group V₄ of diagonal sign matrices lies in no torus. For Ĝ=SL₂→SO₃ the virtual representation Ψ²U=Sym²U−1 has the nonnegative torus character e²+e⁻², but its restriction to V₄ is ε₁+ε₂+ε₃−1, with a negative coefficient; so a nonnegative character of a maximal torus need not restrict to a nonnegative character of a subgroup of multiplicative type such as T_u, and effectiveness of cc(Ψ^eU) is asserted on A/(X_u)_tors, not on A.
- For K=δ_a with a of order two, G_u=μ₂ and G_u°=1; δ_a and δ₀ both restrict to the unit representation of G_u°, while cc(δ_a)=Λ_a≠Λ₀=cc(δ₀); the quotient by ⟨a⟩ sends both to Λ₀, so the comparison of (e) is well defined on A/⟨a⟩ and no map from the representation ring of the trivial group to cycles on A recovers both cycles.
- Embed a genus-two curve C in J(C). Ext¹(C_C,C_C)=H¹(C,C) has dimension four; two independent classes e₁,e₂ give rank-two unipotent local systems E₁,E₂ on C, and K=i_*(E₁⊕E₂)[1] has in ⟨K⟩ the extension of class e₁+λe₂ for every λ∈C, obtained by pulling E₁⊕E₂ back along the diagonal C→C⊕C and pushing out along (1,λ). Nonzero classes give isomorphic rank-two unipotent extensions only when proportional, so these objects are pairwise non-isomorphic and uncountably many, and all their perverse constituents are i_*C_C[1] with Euler characteristic 2, so no negligible subquotient identifies them in the quotient: ⟨K⟩ has uncountably many isomorphism classes, although its tensor words are countable.
- On an elliptic curve with CC(K)=Λ₀+Λ_p+Λ_(−p)+rΛ_E and G_u≅SL₃, T_u≅G_m has rank one and is not a maximal torus, although the three weights of the standard representation remain distinct; (e) requires a maximal torus and is not this statement.

*Needs:* §4.1; §4.2; §0.6; §0.8; §1.3; §1.4; holonomic realization contract; SpringerResolutionAndCharacteristicCycles §§8.6 and 9.5; microdifferential localization contract; conormal geometry contract; MotivesAndAlgebraicCycles §§6.1–6.3; ReductiveGroups Layers 3, 6 and 10; LieHighestWeight Layers 4 and 6.

### 4.4 Microlocal tensor factorization

Let K be a simple perverse sheaf on a complex abelian variety, of positive Euler characteristic and with trivial translation stabilizer. Suppose the nonzero semisimple derived Lie algebra of its connected convolution group has at least two simple factors. Prove that for some integer m>0 there are effective clean cycles Λ₁,Λ₂ of Gauss degrees greater than 1 with [m]_*cc(K)=Λ₁◦Λ₂. The splitting hypothesis excludes a zero derived Lie algebra. For the support maps, write Λ₁=Σ_i a_iΛ_(Z₁,i) and Λ₂=Σ_j b_jΛ_(Z₂,j) with integers a_i,b_j>0 and distinct irreducible clean components; each Z is irreducible with finite translation stabilizer, because a positive-dimensional stabilizer B puts Λ_Z inside A×(Lie B)^⊥, which does not dominate V. Prove that if an irreducible clean component Λ_Y has multiplicity one in Λ₁◦Λ₂, then exactly one pair (i,j) has Λ_Y in Λ_(Z₁,i)◦Λ_(Z₂,j); for that pair a_i=b_j=1, Λ_Y has multiplicity one in Λ_(Z₁,i)◦Λ_(Z₂,j), and addition induces dominant rational maps Y⇢Z₁,i and Y⇢Z₂,j. No map from Y onto the whole support of Λ₁ or of Λ₂ is asserted. (K2, Theorem 2.3.1, p. 15; Lemma 5.2.2, p. 25, K2 line 1200; Proposition 6.1.1, pp. 29–30; K2 line 1402.)

Throughout this subsection, use the regular-holonomic realization, where translation stabilizer and the tensor group agree with the perverse realization.

One proof route is as follows. Let f:A→B=A/K₀ be the quotient by the finite group K₀ of §4.3(d); the group of f_*K is the connected group G_u°, and ω_u(K) restricts irreducibly to it because the translation stabilizer is trivial (§4.3(d)). Pull back to a central product cover Ĝ=G₁×G₂×Z of the connected reductive group and split the irreducible representation into two tensor factors U₁⊠U₂. Apply the isogeny lifting §4.3(f) on B: [e]_*cc(f_*K)=Λ₁′∘Λ₂′ with Λ_i′ of degree dim U_i, and its further isogeny [t] makes the factors effective. With q′:B→A the isogeny satisfying q′∘f=[k] for the exponent k of K₀, push forward along q′, using f_*cc(K)=cc(f_*K) (§4.2) and that pushforward along a homomorphism is a ring homomorphism for ∘: this gives [etk]_*cc(K)=Λ₁∘Λ₂ with Λ_i=q′_*[t]_*Λ_i′ effective clean of degree dim U_i, so m=etk. The degree bounds reflect the nontrivial semisimple factors. For the support maps, bilinearity gives Λ₁◦Λ₂=Σ a_ib_j Λ_(Z₁,i)◦Λ_(Z₂,j), and each product of two irreducible clean conormals is effective, being the clean part of a cycle pushforward of an effective fibre product. The multiplicity of Λ_Y is therefore a sum of terms a_ib_jc_(ij) with c_(ij)≥0 the multiplicity of Λ_Y in Λ_(Z₁,i)◦Λ_(Z₂,j); a total of one forces a single nonzero term with a_i=b_j=c_(ij)=1. For that pair, a component of Λ_(Z₁,i)×_VΛ_(Z₂,j) maps birationally onto Λ_Y, and its two projections give the dominant rational maps, as in Lemma 5.2.2.

**Checks.**

- Both factors must have degree >1; the trivial skyscraper factor is excluded.
- If two clean factors each have degree 2, their product has degree 4.
- A rank-one skyscraper has degree 1 and connected group either trivial or a torus; its zero derived Lie algebra cannot satisfy the two-factor hypothesis.
- A connected simple derived group has one simple ideal, so the splitting hypothesis is false even when its representation has dimension 6.
- As cycles, take Λ₁=Λ_x+Λ_y and Λ₂=Λ_z+Λ_t for points with four distinct sums. Both factors have degree 2, and Λ₁◦Λ₂=Λ_(x+z)+Λ_(x+t)+Λ_(y+z)+Λ_(y+t) has degree 4. The component Λ_(x+z) has multiplicity one and is contributed only by the pair (Λ_x,Λ_z), so the support maps are {x+z}→{x} and {x+z}→{z}; a map from the one-point support onto the two-point support {x,y} of Λ₁ does not exist.
- If instead x+z=y+t, for instance x=0, y=a, z=b, t=b−a with a≠0, then Λ_(x+z) has multiplicity two, contributed by the pairs (Λ_x,Λ_z) and (Λ_y,Λ_t), and no support map is asserted.

*Needs:* §4.1; §4.2; §4.3; §1.3; ReductiveGroups Layer 7; LieHighestWeight Layer 4.

### 4.5 Minuscule hypersurface representation

Let H⊂A be smooth ample with no nonzero translation stabilizer. The restriction of V_H to G_H° is irreducible minuscule. Its characteristic cycle is the single reduced irreducible clean conormal Λ_H and is invariant under no nontrivial translation. This assertion applies for n≥2. (K1, Corollary 1.10 and the table before it, p. 12; K1 line 444; LS, Lemma 3.8 and its proof, p. 21; LS line 966.)

Throughout this subsection, the dimension is N>0; use the faithful represented group, not a guessed simply connected covering group.

One proof route is as follows. Compute the smooth characteristic cycle with shift [n−1] and use the index to show it is clean. Apply K1 Corollary 1.10 to the irreducible conormal through §4.3: by §4.3(b) the Gauss-fibre points are the weights of ω_u(K_H) with multiplicity one, the Gauss monodromy is transitive on them because Λ_H is irreducible, and it acts through the Weyl group, producing one Weyl orbit of weights; by §4.3(d) the trivial translation stabilizer makes the restriction to G_H° irreducible.

**Checks.**

- For a smooth hypersurface with n=3,d=1, the reduced conormal has degree 6, giving six weights counted with multiplicity.
- The standard SL₂ module has weights −1,1 in one Weyl orbit; Sym² has weights −2,0,2 in two orbits and is not minuscule.
- A conormal with coefficient two has fibre multiplicity two; reducedness is necessary for the one-orbit weight conclusion.

*Needs:* §3.2; §4.2; §4.3; LieHighestWeight Layer 4; LieHighestWeightPartII §N2; minuscule-weight-table contract.

### 4.6 Simplicity modulo the centre

If n>2 and H is a smooth ample divisor on A with trivial translation stabilizer, G_H° is simple modulo its centre; equivalently its nonzero derived Lie algebra is simple. This holds whether or not H is a translate of its inverse image under inversion. (LS, Lemma 3.9 and its proof, pp. 21–23; LS line 1000; K2, Proposition 6.1.1, pp. 29–30; Lemma 5.2.2, p. 25; proof of Theorem 6.2.1, p. 30; K2 line 1402.)

Throughout this subsection, n>2 is needed for the Albanese/Lefschetz step.

One proof route is as follows. Assuming failure of simplicity, §4.4 factors [m]_*Λ_H as Λ₁◦Λ₂ with effective clean cycles of degree >1. Trivial stabilizer makes [m]|H generically injective, hence the left side is the reduced irreducible cycle Λ_([m]H), of degree N. Let Λ_(Z₁) and Λ_(Z₂) be the components of Λ₁ and Λ₂ contributing to it, each of multiplicity one (§4.4). Compose H→[m]H with the dominant rational maps [m]H⇢Z_i, extend the composites to morphisms H→A (Weil extension, AbelianSchemesAndArithmeticModuli §A1.8(1), as in the supplier contract; H is smooth), and factor them through Alb(H)=A (ample-divisor Albanese contract; weak Lefschetz, dim H≥2). The addition identity becomes an identity of homomorphisms plus translation. Write g₁:A→B₁ for the induced surjective homomorphism, so that Z₁ is a translate of g₁(H). If g₁=0 then Z₁ is a point, Λ_(Z₁)=Λ_pt has degree one, and Λ_([m]H) is a component of Λ_pt◦Λ_(Z₂), a translate of Λ_(Z₂); then deg Λ₂≥N and deg Λ₁≤1, a contradiction. So B₁ is positive-dimensional. If Z₁ were a translate of B₁ its Gauss degree would be zero, whereas Λ_(Z₁) is clean. Otherwise H is an irreducible component of g₁⁻¹Z₁ by dimension. The connected kernel preserves every such component; a positive-dimensional kernel would preserve the ample divisor, which is impossible. Thus g₁ is an isogeny onto A. Trivial stabilizer makes its restriction H→Z₁ generically one-to-one: outside the intersections with finitely many distinct kernel translates there are no collisions. Isogeny pushforward of conormals therefore gives deg Λ_(Z₁)=N, so deg Λ₁≥deg Λ_(Z₁)=N because Λ₁ is effective; as deg Λ₁·deg Λ₂=deg Λ_([m]H)=N, this forces deg Λ₂≤1, contradicting deg Λ₂>1. Only the isogeny, the generically degree-one restriction and this component bound are required; the factors need not be irreducible.

**Checks.**

- For n=3,d=1, N=6>1; an irreducible representation of a connected torus has dimension 1, so the derived algebra cannot be zero.
- An isogeny with kernel of size 4 has four possible translates, but a divisor with trivial stabilizer meets each distinct kernel translate only in a proper closed set; its generic restriction has degree 1.
- On a smooth curve in an abelian surface, dim Alb(H)=g=1+d>2 when d>1; the isomorphism Alb(H)=A cannot be used for n=2.
- For n=3,d=1 the contradiction is numerical: deg Λ_(Z₁)=6, so an effective Λ₁=Λ_(Z₁)+Λ′ has deg Λ₁=6+deg Λ′≥6, and deg Λ₁·deg Λ₂=6 leaves deg Λ₂=1, below the required degree 2.

*Needs:* §4.4; §4.5; AbelianSchemesAndArithmeticModuli §§A1.8(1) and A2.4; ample-divisor Albanese and translation-stabilizer quotient contracts.

### 4.7 Minuscule representation alternatives

For n>2 under the preceding hypotheses, the image G_H* in GL_N is either a standard classical group SL_N, Sp_N or SO_N, an image of a spin or half-spin representation, or the image of ∧^k of the standard SL_m representation with 1<k<m−1. The exceptional minuscule images of E₆ and E₇ have dimensions 27 and 56 and are excluded because 6 divides N=n!d. Spin dimensions are powers of 2, so the same divisibility excludes them. The ∧²SL₄ image is SO₆ and belongs to the classical case. (LS, Lemma 3.10, p. 23, and Lemma 3.12, p. 24; LS line 1057.)

Throughout this subsection, classify faithful images up to central isogeny; do not identify the image with SL_m when its exterior-power kernel is nontrivial.

One proof route is as follows. Use the minuscule table specified by the minuscule-weight-table contract, including types A–D, E₆ and E₇ and the absence of nonzero minuscule weights in the remaining exceptional types; the zero weight, minuscule in every type, gives the trivial representation of dimension 1<N and is discarded. Apply the Weyl dimension formula and the spin and exceptional dimensions of the Tau Ceti layers cited as they stand. For n≥3, divisibility by 6 rules out powers of 2, 27 and 56. Keep the standard representations and interior exterior powers.

**Checks.**

- For n=3,N=6 the ∧²SL₄ representation must not be eliminated as a nonclassical exception.
- For n=3, N is divisible by 6; 27 mod 6=3, 56 mod 6=2 and 2^r mod 3 is 1 or 2, excluding all three dimension types.
- For n=2,d=28, N=56 and the divisibility-by-6 premise fails; no surface exclusion follows.
- The zero weight is minuscule in every type, E₈ included, and gives a one-dimensional representation; since N=n!d≥6 it cannot be the distinguished representation, so classifying only nonzero minuscule weights loses no case.

*Needs:* §4.6; §4.5; §3.1; LieHighestWeight Layer 4; LieHighestWeight Layer 6; LieHighestWeight Layer 8; SpinRepresentations Layer 4; LieHighestWeightPartII §N2; minuscule-weight-table contract.

### 4.8 Inversion symmetry and the classical form

When G_H* acts by a standard classical representation and N≥6, if H is not a translate of [−1]H, the image is SL_N. If H is such a translate, the resulting pairing on V_H is alternating for even n and symmetric for odd n, so the image is Sp_N or SO_N respectively. The pairing may be valued in a one-dimensional object; translating H to make it symmetric trivializes the geometric tensor factor. The connected derived image remains the stated group. (LS, Lemma 3.11, p. 24; LS line 1071.)

Throughout this subsection, H is smooth ample with trivial stabilizer and n>2; conclusions are up to change of basis of V_H.

One proof route is as follows. A self-duality of the irreducible derived representation gives a one-dimensional tensor factor in the geometric generated category. Identify it with a skyscraper and compare supports to obtain inversion up to translation. For the inverse implication translate by a half-point over the algebraic closure. Use Verdier/Poincaré duality and the shift n−1 to compute the symmetry as (−1)^(n−1). Connected derived subgroups kill the line-valued similitude character.

**Checks.**

- For n=3 the support shift is 2 and its self-exchange sign is +1; the classical image is orthogonal.
- For n=4 the shift is 3 and its self-exchange sign is −1; the classical image is symplectic.
- The standard SL₆ module is not self-dual, even up to a character of SL₆; assigning it a nondegenerate invariant bilinear form would fail.

*Needs:* §4.7; §1.5; §0.3; §3.2.

### Examples

Point conormals satisfy (2Λₓ)◦(3Λᵧ)=6Λₓ₊ᵧ and degree 6. For a symmetric hypersurface, shift [2] at n=3 gives a symmetric pairing, while shift [3] at n=4 gives an alternating one. These are the same signs used for cohomological duality in Layer 0, and select SO_N and Sp_N respectively. (K2 §1.3, K2 line 389; LS Lemma 3.11, LS line 1071.)

### Dependencies

AbelianSchemesAndArithmeticModuli §§A1.3, A1.8(1); SchemeAndStackFoundations §§5.1–5.4, 5.8; conormal geometry contract; §0.3; EtaleDualityAndPerverseSheaves §§3.3–3.5; EtaleCohomologyFoundations §§F.0.2, F.4.5; ComplexComparisonPartII §§C5.6, C6.6; holonomic realization contract; SpringerResolutionAndCharacteristicCycles §§8.6 and 9.5; microdifferential localization contract; §0.6; §0.8; §1.3; §1.4; MotivesAndAlgebraicCycles §§6.1–6.3; ReductiveGroups Layers 3, 6, 7 and 10; LieHighestWeight Layer 4; §3.2; LieHighestWeightPartII §N2; minuscule-weight-table contract; AbelianSchemesAndArithmeticModuli §A2.4; ample-divisor Albanese and translation-stabilizer quotient contracts; §3.1; LieHighestWeight Layer 6; LieHighestWeight Layer 8; SpinRepresentations Layer 4; §1.5. The exact supplier contracts above retain their coefficient, dimension and finiteness hypotheses.

## Layer 5: exterior-power counts and exceptional degrees

### 5.1 Exterior-power weight multiplicity

Define `wedgeMultiplicity`. For m≥0, an integer weight list w:Fin(m)→Z, k≥0 and t∈Z, define W(w,k,t) to be the number of subsets S⊂Fin(m) with |S|=k and weight sum t. Equivalently, for the finitely supported histogram h(j)=#{i:w_i=j}, this number is Σ_u Π_j binom(h(j),u(j)), over finitely supported u with 0≤u≤h, Σ_j u(j)=k and Σ_j j u(j)=t. Binomial coefficients use Nat.choose, including binom(a,a)=1; invalid occupancies contribute zero. This counts subsets, not ordered tuples. (LS, Lemma 3.14, equation (3), pp. 25–27; Appendix B, equation (10), p. 93; LS line 1159.)

Throughout this subsection, all weights are integers; h has finite support.

Its API includes the following facts.

- The subset count equals the finite histogram sum with binomial multiplicities.
- If k≤m and T=Σ_iw_i, W(w,m−k,t)=W(w,k,T−t).
- W(w+b,k,t+kb)=W(w,k,t).
- For k=0 the only weight is 0 with multiplicity one; for k=m the only weight is T with multiplicity one; for k>m all counts vanish.
- Summing the finite support of t↦W(w,k,t) gives binom(m,k).

One proof route is as follows. Filter the actual finite set of k-subsets by its integer sum. Group subsets by their histogram to obtain the product of binomial coefficients. For complements use the total weight T=Σ_iw_i. Translate all weights by b to add kb to every k-subset sum.

**Checks.**

- For four weights all zero, the multiplicity at k=2,t=0 is 6, not 1 or 12.
- For m=0,k=0 there is one empty subset of weight zero; all other weights have multiplicity zero.
- For m=2,k=3 every multiplicity vanishes.
- For weights −1,0,1 and k=2 the multiplicities at −1,0,1 are all 1.
- For a constant-zero list of length m, W(w,k,0)=binom(m,k).

*Needs:* Mathlib `Finset.powersetCard`; Mathlib `Finset.card_powersetCard`; Mathlib `Nat.choose`.

For the acceptance statement, define `hasEulerianExteriorWeights` on the same finite weight list by requiring, for every integer q, W(w,k,s+q)=d times the number of permutations of Fin(n) having q descents when 0≤q<n, and zero otherwise. A descent is an index i with i+1<n and σ(i+1)<σ(i). Thus the condition specifies the entire row, including its vanishing outside the range. It is used with n≥2; it does not redefine the supplier’s n=0 convention. Its API includes the following facts.

- The predicate is equivalent to the displayed all-integer row equation with the supplier’s descent-indexed Eulerian number.
- Adding b to every standard weight and kb to s preserves the predicate.
- Replacing k by m−k, reversing the integer row and shifting by the total standard weight preserves the predicate through Eulerian symmetry.

 (LS equation (10), p.93, LS line 4343; ClassicalArithmeticCompletion §§2.18 and 2.39.)

**Checks.**

- Weights 0,0,1,1 at k=2,n=3,d=1,s=0 give 1,4,1 and satisfy the predicate, with counts 0 at q=−1 and q=3.
- Four zero weights at k=2 give only multiplicity 6 at weight 0; they do not give the threefold row 1,4,1.
- The weights 0,0,1,2 at k=2 give 1,2,2,1 and fail the fourfold row 1,11,11,1 even though the support width is 3.

*Needs:* `wedgeMultiplicity`; Mathlib `Equiv.Perm`; ClassicalArithmeticCompletion §§2.18 and 2.39.

### 5.2 Exceptional Pell sequence

Define `exceptionalPair`. Define pairs P₀=(1,5), Pⱼ₊₁=(b,4b+1−a) when P_j=(a,b), in natural numbers. All generated subtractions are exact, 0<a<b, and a²−4ab+b²=a+b in Z. This is the source sequence with P_j=(a(j+1),a(j+2)); thus its initial pairs are (1,5),(5,20),(20,76),(76,285). Every positive integer solution a≤b of the displayed equation occurs in exactly one P_j. (LS, Lemma B.7, p. 96; sequence before Theorem 3.5, p. 21; LS line 4641.)

Throughout this subsection, the recurrence uses natural subtraction but the invariant proves 4b+1≥a at every step.

The headline signature is `exceptionalPair_classification`.

Its API includes the following facts.

- P₀=(1,5) and Pⱼ₊₁=(P_j.2,4P_j.2+1−P_j.1).
- Both coordinates are positive and strictly increasing; the successor subtraction is exact.
- Each pair solves a²−4ab+b²=a+b in Z.
- Positive a≤b solve the equation iff (a,b)=P_j for a unique j≥0.

One proof route is as follows. The real-bodied recursion supplies the pair. Preserve the quadratic identity and strict ordering by direct algebra. For a>1 descend to (4a+1−b,a), whose first coordinate is (a²−a)/b and lies strictly between 0 and a. The a=1 case forces b=5. Strict growth gives uniqueness.

**Checks.**

- The positive ordered pair (1,1) is not a solution: 1−4+1=−2≠2, and it occurs at no index of the sequence.
- P₁=(5,20), not (5,19); the affine +1 term is necessary.
- P₂=(20,76); swapping the two prior terms changes the answer.
- The first permitted geometric threefold pair is P₁, since interior exterior powers require k>1.

*Needs:* Mathlib `Nat.choose`.

### 5.3 Exceptional threefold degree

Define `exceptionalDegree`. For P_j=(a,b), define D_j=binom(a+b,a)/6 in natural numbers. For j≥1 this division is exact, D_j>0, and binom(a+b,a)=6 binom(a+b−2,a−1). Geometric threefold exceptions are the normalized degrees d=D_j for j≥1; their distinguished dimensions are N=6D_j. The index j=0 is excluded by k>1. (LS, Theorem 3.5(2), p. 21; Lemmas B.6–B.8, pp. 95–96; LS line 4655.)

Throughout this subsection, natural-number division is part of the definition; exactness is a theorem from the Pell invariant.

Its API includes the following facts.

- For j≥1, 6D_j=binom(P_j.1+P_j.2,P_j.1).
- For j≥1, D_j=binom(P_j.1+P_j.2−2,P_j.1−1).
- D_j>0 for j≥1.
- The representation dimension for the j-th exception is 6D_j, not D_j.

One proof route is as follows. From the Pell equation derive (a+b)(a+b−1)=6ab. Combine it with the factorial ratio for consecutive binomial coefficients. Use positivity of a,b and a>1 for j≥1. Translate between the zero-based pairs and one-based source indexing.

**Checks.**

- D₁=binom(25,5)/6=8855.
- 6D₁=53130; a definition returning 53130 for d fails.
- D₀=1 is computed but is excluded from the geometric exception set because its exponent is 1.
- For P₂=(20,76), binom(96,20)=216182590635135019896 is divisible by 6 and D₂=36030431772522503316=binom(94,19); this tests the recurrence beyond the seed and the first step.

*Needs:* §5.2; Mathlib `Nat.choose`.

### 5.4 Hodge constraint on exterior powers

If G_H* is the image of SL_m acting on ∧^k of its standard representation, with 1<k<m−1, then there exist integer weights w:Fin(m)→Z and s∈Z such that W(w,k,s+q)=dA(n,q) for every q∈Z. The Eulerian row is zero outside 0≤q<n. Complementing k-subsets and using Eulerian symmetry permits the normalization 2k≤m. Finite support and positive d are part of the assertion. (LS, Lemma 3.14, equation (3), pp. 25–27; LS line 1159.)

Throughout this subsection, H is a smooth ample divisor of dimension n−1 over an algebraically closed characteristic-zero field, with trivial translation stabilizer; use compatible complex and p-adic realizations.

One proof route is as follows. Choose a finite-order good character and a finitely generated field of definition. Spread the finite normalizer tensor constraints and specialize to a number-field point, retaining the inclusion of the arithmetic image in the exterior-power normalizer. Use the Hodge–Tate image cocharacter in the Zariski closure of the Galois image. Compare its graded fibre functor with the ordinary fibre functor over C_p; this comparison is required and is not a canonical equality of fibres. The normalizer of the image of SL_m in GL(∧^k) has identity component the image of GL_m (its centralizer is scalar by Schur’s lemma, and every scalar is a k-th power), the kernel of GL_m on ∧^k is μ_k, and its component group has order at most two, nontrivial only when m=2k, since an outer automorphism exchanges ∧^k with ∧^(m−k). The connected cocharacter lands in the connected exterior-power normalizer. After pulling it back by t↦t^k, lift to GL_m. The lifted standard weights are congruent modulo k because their differences are adjoint weights. Remove their common fractional part into an integral central shift s. Reverse signs to match the native weights −q with the source’s q labels. Count k-subsets of the resulting integer weights and apply the Hodge–Tate row. For complementary exponent use W-complement and A(n,q)=A(n,n−1−q).

**Checks.**

- Summing the row gives binom(m,k)=n!d.
- Discarding the common fractional part without a shift would give an incorrect constraint.
- Weights 0,0,1,1 with k=2 give the shifted row 1,4,1; the corresponding native Hodge–Tate weights are 0,−1,−2.
- Adding 3 to each standard weight adds 6 to each exterior-square weight; changing the central shift by only 3 fails.
- On ∧²F⁴ the scalar −1 acts as +1, so the kernel includes μ₂; treating the represented image as faithful SL₄ loses this central kernel.

*Needs:* §2.3; §2.4; §3.3; §5.1; PadicHodgeTheory §§3.3, 8.1–8.2; Hodge–Tate image cocharacter contract; LieHighestWeight Layer 6; ReductiveGroups Layer 7; ClassicalArithmeticCompletion §2.39.

### 5.5 Extremal occupancies and weight width

Assume n≥2,d≥1,1<k<m−1,2k≤m and W(w,k,s+q)=dA(n,q) for every integral q. Let h be the finite weight histogram and u_min,u_max the unique histograms of minimum- and maximum-weight k-subsets (the subsets themselves need not be unique). Let v be the greatest occupied weight of u_min and v′ the least of u_max. Then v≤v′, u_min fills all h below v and none above, u_max fills all h above v′ and none below, and the sum of (v−i)h(i) over i<v, plus the sum of (i−v′)h(i) over i>v′, plus k(v′−v), equals n−1. Every summand is nonnegative. (LS, Lemmas B.2–B.3, pp. 93–94; LS line 4380.)

Throughout this subsection, uniqueness concerns occupancies, not choices among repeated equal weights.

One proof route is as follows. A weight-reducing exchange fills the lowest available slots, and the analogous highest exchange gives u_max. The bound 2k≤m implies v≤v′. The least and greatest nonzero row indices are s and s+n−1, since A(n,0)=A(n,n−1)=1 and the interior is positive. Subtract the two extremal sums, adding and subtracting kv and kv′.

**Checks.**

- Repeated weights may give many subsets with the same extremal histogram.
- For n=2 the width is exactly 1, so one cannot replace the equation by a mere inequality.
- For weights 0,0,1,1 and k=2, v=0,v′=1 and width k(v′−v)=2=3−1.

*Needs:* §5.1; ClassicalArithmeticCompletion §2.39.

### 5.6 Surface exterior-power classification

Under the counting hypotheses of extremal-width, if n=2 then m=2k and d=binom(2k−1,k). Up to translating and reflecting all weights, the histogram is (2k−1)[v]+[v+1]. For k=2 this is the classical m=4 case; for k>2 it is the separate surface alternative. Without exponent normalization replace k by min(k,m−k). (LS, Lemma B.4, p. 94; LS line 4452.)

Throughout this subsection, this is a combinatorial surface statement; it does not extend the geometric simplicity theorem to n=2.

The headline signature is `surface_exterior_classification`.

One proof route is as follows. The width equation equals 1; since k≥2, its only nonzero term is one singleton at an adjacent weight. Equate the two endpoint binomial coefficients to obtain h(v)=2k−1, then m=2k.

**Checks.**

- At k=3,m=6, weights 0 repeated five times and 1 once give d=10.
- At k=2,m=4 the row is 3,3 and d=3.
- At k=3 the six weights 0,0,0,0,0,1 have ten triples at each of weights 0 and 1; taking ordered triples would give sixty at each.

*Needs:* §5.5; Mathlib `Nat.choose`.

### 5.7 Threefold exterior-power classification

Under the counting hypotheses of extremal-width, if n=3 then either m=4,k=2,d=1, or there is j≥1 with m=P_j.1+P_j.2, k=P_j.1 and d=D_j. Outside the m=4 case the histogram is h(v−1)=h(v+1)=1, h(v)=m−2 and zero elsewhere. These statements concern the necessary alternatives of a weight realization; they do not assert existence of an abelian hypersurface for every pair. (LS, Lemmas B.5–B.8, pp. 95–96; LS line 4503.)

Throughout this subsection, use 2k≤m; complementation recovers the unnormalized statement.

The headline signature is `threefold_exterior_classification`.

One proof route is as follows. Enumerate the partitions of width 2. A gap of two excludes one parity of weights; a double endpoint or k(v′−v)=2 forces m=4,k=2. In the remaining three-slot pattern, endpoint coefficient binom(m−2,k−1)=d and the middle coefficient equation imply (m−k)²−4(m−k)k+k²=m. Apply the positive Pell classification with a=k,b=m−k. Since k>1, j≥1. The total dimension gives d=D_j.

**Checks.**

- Weights 0,0,1,1 with k=2 give row 1,4,1.
- For j=1 the histogram 1,23,1 with k=5 gives the scaled row 8855,35420,8855.
- For P₀=(1,5), the exponent is 1; its numerical degree 1 is excluded by the interior-exponent hypothesis.

*Needs:* §5.5; §5.3.

### 5.8 Fourfold exterior-power obstruction

There is no integer weight list and interior exponent 1<k<m−1 with W(w,k,s+q)=dA(4,q) for every q∈Z and d≥1. In particular the row d(1,11,11,1) has no such realization, including the exterior-square m=4 case. (LS, Lemma B.9, pp. 96–99; LS line 4660.)

Throughout this subsection, the weight list is finite; k may be normalized by complementation.

The n=4 case of the headline `exterior_eulerian_classification` (§6.6) is this statement.

One proof route is as follows. Use width 3. When v′>v only k=2 or 3 can occur; list the resulting endpoint occupancies and compare the adjacent binomial ratios. When v′=v, distribute the width among the slots v±1,v±2,v±3. Eliminate each pattern by the required row ratios 11 and symmetry; the source’s computations use actual binomial multiplicities.

**Checks.**

- The Eulerian row for n=4 is 1,11,11,1; using 1,4,1 would test the wrong dimension.
- Weights 0,0,1,2 with k=2 give multiplicities 1,2,2,1 at 0,1,2,3; the required adjacent ratio is 11 rather than 2.
- For m=4,k=2, the total is 6; an n=4 row has total 24d≥24, so this boundary is impossible.

*Needs:* §5.5; Mathlib `Nat.choose`.

### Examples

At k=2, weights 0,0,1,1 have pair sums 0 once, 1 four times and 2 once. At k=3, weights 0,0,0,0,0,1 give ten subsets at each endpoint. For P₁=(5,20), the histogram 1[−1]+23[0]+1[1] with k=5 has endpoint count choose(23,4)=8855 and middle count choose(23,5)+choose(23,3)=35420. Its total dimension is 53130=6·8855. (LS Lemmas B.4–B.8, LS lines 4452 and 4641.)

### Dependencies

Mathlib `Finset.powersetCard`; Mathlib `Finset.card_powersetCard`; Mathlib `Nat.choose`; §2.3; §2.4; §3.3; PadicHodgeTheory §§3.3, 8.1–8.2; Hodge–Tate image cocharacter contract; LieHighestWeight Layer 6; ReductiveGroups Layer 7; ClassicalArithmeticCompletion §2.39. The exact supplier contracts above retain their coefficient, dimension and finiteness hypotheses.

## Layer 6: Eulerian exclusion and classical monodromy

### 6.1 Adjacent occupancy ratios

Under the normalized counting hypotheses, put h=histogram(w), u₀=u_min, v=max supp u₀, r=u₀(v), t=h(v)−r, and D=Π_i binom(h(i),u₀(i))=d. Define R_a=h(v−1)t/(r+1) and R_b=h(v+1)r/(t+1) as rational numbers. They are the ratios to D of occupancies u₀+[v]−[v−1] and u₀+[v+1]−[v], respectively, with invalid occupancies assigned count zero. Then R_a+R_b=A(n,1), and R_aR_b≤h(v−1)h(v+1), strictly if both adjacent histogram values are positive. At q=2 the sum of the five ratios from u₀+[v]−[v−2], u₀+2[v]−2[v−1], u₀+[v+1]−[v−1], u₀+2[v+1]−2[v], u₀+[v+2]−[v] equals A(n,2). (LS, Appendix B.2, pp. 99–100, equations (13)–(14), Lemma B.10; LS line 5013.)

Throughout this subsection, r≥1,t≥0. Use rational ratios; do not truncate division in N.

One proof route is as follows. Enumerate modifications increasing the minimum weight by one or two. Divide their binomial products by the positive extremal count. Cancel factorial ratios. The product factor tr/((r+1)(t+1)) is strictly below one; when an adjacent h-value is zero only the non-strict product inequality remains.

**Checks.**

- For the surface histogram 5[0]+[1], k=3, R_a=0,R_b=1 and both sides of the product bound are zero.
- For the threefold histogram 1[−1]+23[0]+1[1] at k=5, with r=4 and t=19, the five q=2 ratios are 0,0,1,0,0, including the three with invalid occupancy counted as zero, and their sum is 1=A(3,2); omitting the invalid terms or the middle term h(v−1)h(v+1)=1 gives a different total.
- For the threefold histogram 1[−1]+23[0]+1[1] at k=5, R_a=19/5 and R_b=1/5; their sum is 4 and their product is 19/25<1.

*Needs:* §5.5; Mathlib `Nat.choose`.

More explicitly, the five q=2 ratios in their displayed order are h(v−2)t/(r+1), h(v−1)(h(v−1)−1)t(t−1)/(2(r+1)(r+2)), h(v−1)h(v+1), h(v+1)(h(v+1)−1)r(r−1)/(2(t+1)(t+2)), and rh(v+2)/(t+1). Arithmetic is rational, with r≥1,t≥0 making every denominator positive; an invalid occupancy has count zero. For the histogram 1[−1]+23[0]+1[1] and k=5, d=8855,r=4,t=19. Then R_a=19/5,R_b=1/5, their sum is 4=A(3,1), their product is 19/25<1, and the five second ratios are 0,0,1,0,0, summing to A(3,2)=1. (LS equations (13)–(14), pp.99–100, LS line 5013.)

### 6.2 Eulerian comparisons

Write A_j=A(n,j) for the descent-indexed Eulerian numbers, with A_j=0 for j≥n. Prove the following inequalities on exactly the stated ranges of n; square roots and quotients are taken in ℝ, every denominator being positive.

- For every n≥5: (n−1)²/2<A₁−1, 6(n−1)<A₁−1, 28A₂<3(A₁−1)², 10A₂<A₁², n+1+(n−1)A₁/2<A₂, 78nA₄<(A₁−1)³, 341A₅<A₁³, 6nA₄<A₁²A₂, 100A₆<(A₂−1)², and (n−1)A₁/2+4A₃/A₁+1+sqrt(2A₅)+1<A₂.
- For every n≥6: 9(n−1)≤A₁. For every n≥8: 247≤A₁ and 140A₇<A₁⁴.
- For every n≥11: 2A₁+sqrt(48A₃A₁/11)+1+48A₃/(11A₁)+sqrt(96A₅/(11A₁))+1<A₂.
- For 6≤n≤19: 2A₁+sqrt(2·n!)+1+2(sqrt(2·n!)+1)²/A₁²+sqrt(96A₅/(11A₁))+1<A₂.
- For 5≤n≤10: sqrt(2A₄)+1≤A₁²/(48(n−1)), sqrt(36A₃A₁/11)+1+36A₃/(11A₁)+sqrt(72A₅/(11A₁))+1<A₂, and sqrt(48A₃A₁/11)+1+sqrt(96A₅/(11A₁))+1<A₂.
- For 6≤n≤10: 27·46²·A₂<4·45²·A₁². For n=5: 6·13·46²·A₂<11·45²·A₁² and 2A₁+3+sqrt(96A₅/(11A₁))+1<A₂.

These are the Eulerian comparisons that LS Lemmas B.11–B.31 use without proof, apart from 27A₂<A₁² for n≥11 and the product inequality of Lemma C.4, which are ClassicalArithmeticCompletion §§2.78 and 2.77 and are imported. The entries for n≥6 and n≥8, the first entry for 5≤n≤10 and the entries for 6≤n≤10 and n=5 serve B.11–B.12; the sums bounding five occupancy ratios serve B.15–B.18; the n≥5 list serves B.19–B.31, with 6(n−1)<A₁−1 giving the integrality steps of B.20, B.22 and B.24. (LS, Appendix B, Lemmas B.11–B.31, pp. 101–115, LS lines 5083–5741; Appendix C, opening paragraph, p. 116, LS line 5745.)

The comparisons have exactly the displayed ranges; none is asserted outside them.

One proof route is as follows. Use A₁=2ⁿ−n−1 (ClassicalArithmeticCompletion §2.39(e)), the bounds (q+1)ⁿ−(n+1)qⁿ≤A_q≤(q+1)ⁿ and A_q≤n! (§2.57), and (1−1/e)(q+1)ⁿ≤A_q in the range of §2.71. Bounding each smaller side above and each larger side below by these, and each square root above through the bound on its argument, reduces every comparison with an unbounded range to an inequality between exponentials in n that holds beyond an explicit threshold; for instance 78nA₄<(A₁−1)³ follows from 78n·5ⁿ<(2ⁿ−n−2)³ once n is large. Below the threshold, and on the bounded ranges, each comparison is an inequality between explicit integers A(n,q), determined by the recurrence of §2.39(c), with each square root replaced by a rational upper bound. The target includes the unbounded ranges, which a list of verified cases does not prove.

**Checks.**

- At n=5, A₁=26,A₂=66,A₃=26,A₄=1,A₅=A₆=0: 28A₂=1848<1875=3(A₁−1)² and 78nA₄=390<15625=(A₁−1)³.
- At n=11, A₁=2036,A₂=152637: 27A₂=4121199<4145296=A₁². At n=10 this reverses to 1291680>1026169; the supplier threshold is necessary.
- At n=2, A(2,1)=1, so the inequality (n−1)²/2<A₁−1 becomes 1/2<0 and fails; the n≥5 premise cannot be erased.
- At n=7, A₁=120 and A₄=1191: sqrt(2A₄)+1=sqrt(2382)+1≈49.81≤50=A₁²/(48·6). Replacing the constant 48 by 49 gives 14400/294≈48.98, which fails, so the B.11 comparison leaves no room for a coarser constant.
- At n=11, A₄=9738114: 78nA₄=8355301812<8427392875=(A₁−1)³, a ratio of about 0.991; the exponential reduction does not reach this n, so the base range is needed as exact integer inequalities.
- At n=5, 9(n−1)=36>26=A₁, so 9(n−1)≤A₁ needs n≥6 and B.11 treats n=5 with A₁/(n−1)=13/2 instead; 6(n−1)=24<25=A₁−1 holds at n=5 but fails at n=4, where A(4,1)=11 gives 18>10.

*Needs:* ClassicalArithmeticCompletion §2.39; ClassicalArithmeticCompletion §2.57; ClassicalArithmeticCompletion §2.71; ClassicalArithmeticCompletion §2.77; ClassicalArithmeticCompletion §2.78.

### 6.3 Exclusion of the first large-ratio regime

Under the normalized counting hypotheses with n≥5, it is impossible that R_a≥A(n,1)/2. The argument uses this particular ratio; it does not exclude the R_b regime by symmetry. (LS, Lemmas B.11–B.18, pp. 101–107; LS line 5083.)

Throughout this subsection, R_a,R_b are the rational quantities of ratio-identities.

One proof route is as follows. B.11 and B.12 give h(v−1)=1 and h(v−2)≤2, from their comparisons in §6.2 and, for 5≤n≤10, the bound R_a≥(45/46)A(n,1) that §6.1's product bound gives because (1+sqrt(11/12))/2≥45/46. For j=1,2, B.13–B.14 give h(v+j)(h(v+j)−1)≤(48/11)A(n,2j+1)R_a, improved to 36/11 if r≥2. Keep R_a in this sharper intermediate bound. Bound each of the five q=2 ratios. Their sum is less than A(n,2) for n≥11, so 5≤n≤10. The q=s+3 occupancy in B.16 excludes filled weights below v−1; then B.17 forces r=1. With r=1 the q=2 ratios a,b,d vanish; the remaining c,e estimates contradict the last 5≤n≤10 comparison of §6.2. The comparisons of §6.2, with their unbounded ranges, are required.

**Checks.**

- The candidate histogram 1[−1]+53[0] at k=2 has R_a=26, but its q=2 ratio is 0 rather than A(5,2)=66; it fails the full-row hypothesis.
- At n=11, A₁=2036 and the large-ratio threshold is 1018; an estimate that uses the n=5 value 13 fails this boundary.
- For n=5 the row is 1,26,66,26,1; the first large-ratio threshold is 13. The sum equation alone permits (R_a,R_b)=(0,26), so it cannot establish both individual exclusions.

*Needs:* §6.1; §6.2; ClassicalArithmeticCompletion §2.78.

### 6.4 Exclusion of large exterior exponents

Under the normalized counting hypotheses with n≥5, k<n. Indeed, if k≥n then the width equation forces v=v′; the adjacent-ratio product bound shows that one ratio is less than 1 and the other greater than A(n,1)−1, and neither possibility can occur. (LS, Lemmas B.19–B.21, pp. 108–110; LS line 5393.)

Throughout this subsection, the width bound gives h(v−1)+h(v+1)≤n−1 only after v=v′ has been established.

One proof route is as follows. Apply B.19 to the quadratic roots using the non-strict product bound of §6.1. Section 6.3 excludes the R_a-large alternative. For R_b>A₁−1, B.20 forces h(v+1)≤1. The five q=2 ratios are respectively <1,<1,≤n−1,0,≤(n−1)A₁/2. Their sum is ≤n+1+(n−1)A₁/2<A₂. Use the exact comparison in §6.2.

**Checks.**

- At n=5 the quadratic with sum 26 and product at most 4 has small root at most 13−√165<1 and large root at least 13+√165>25.
- For n=5 the five-term upper bound is 5+1+4·26/2=58<66; omitting a term would give a different bound.
- At n=5 and k=5≥n, v′>v would give width k(v′−v)≥5>4=n−1, so the width equation forces v′=v, as the argument requires.

*Needs:* §6.3; §6.1; §6.2.

### 6.5 Exclusion of the second large-ratio regime

Under the normalized counting hypotheses with n≥5 and k≤n−1, it is impossible that R_b≥A(n,1)/2. Combined with R_a+R_b=A(n,1), this excludes every n≥5 weight realization. (LS, Lemmas B.22–B.31, pp. 110–115; LS line 5485.)

Throughout this subsection, let r be the least positive integer with h(v−r)>0 after u₀(v)=1 has been proved; r here is a gap length, not the earlier occupancy variable.

One proof route is as follows. B.22–B.25 give h(v+1)≥A₁/(2(n−1)), hence, h(v+1) being an integer, h(v+1)≥⌈A₁/(2(n−1))⌉≥4, and u₀(v)=1, treating R_a=0 and R_a>0 separately: at n=5 the ceiling is ⌈26/8⌉=⌈13/4⌉=4, and for n≥6 the comparison 9(n−1)≤A₁ of §6.2 gives A₁/(2(n−1))≥9/2. For gap length r=1, B.26 gives u₀(v−1)≤1 and B.27 contradicts A₂>(n−1)A₁/2+4A₃/A₁+1+sqrt(2A₅)+1. Use the surviving q=2 terms a,c,e. For r≥2, the q≤r equations give h(v+i)=dA(n,i), 0≤i<r, and h(v+r)=dA(n,r)−d(d−1)h(v−r)/2. The q=3r−2 occupancy implies A(n,3r−2)≥A(n,r−1)(dA(n,r−1)−1)/2. Apply the imported square-separation bound for 3≤r≤n−2; if r=n−1 the right row entry A(n,3r−2) is zero and the contradiction is immediate. Thus r=2 and d<3A₄/A₁². This bound alone is not a contradiction. B.31 uses 6nA₄<A₁²A₂ to get d<A₂/(2n), hence h(v+2)≥3dA₂/4. Its q=6 occupancy gives A₆≥9(A₂−1)²/32, contradicting 100A₆<(A₂−1)². Use §6.2 for the uniform comparisons.

**Checks.**

- At n=5, A₁/(2(n−1))=26/8=13/4<4, so the bound h(v+1)≥4 holds only after rounding up the integer h(v+1); at n=6, ⌈57/10⌉=6≥4. An argument that keeps the unrounded quotient fails at n=5.
- The bound d<3A₄/A₁² can exceed 1 and cannot alone finish the proof.
- For n=5 and gap r=4, A(5,3)=26 and A(5,10)=0; the normalized lower bound is at least 26·25/2=325>0.
- The estimate d<3A(5,4)/A(5,1)² is d<3/676 here; for larger n this expression can exceed 1, so the subsequent occupancy argument is retained.

*Needs:* §6.4; §6.1; §6.2; ClassicalArithmeticCompletion §2.77.

### 6.6 Exterior-power Eulerian classification

Let n≥2,d≥1 and let a finite integer weight list w of length m, an integer s and 1<k<m−1 satisfy W(w,k,s+q)=dA(n,q) for every q∈Z. Put k₀=min(k,m−k). Then either m=4,k=2; or n=2, k₀>2 and d=binom(2k₀−1,k₀); or n=3 and d=D_j for some j≥1. These are necessary alternatives for a counting solution. No n=4 or n≥5 solution exists. (LS, Proposition 3.15, p. 27; Proposition B.1, p. 93, with proof pp. 93–115; LS line 4343.)

Throughout this subsection, use the integer zero-extension of Eulerian numbers and finite support of weights.

The headline signature is `exterior_eulerian_classification`.

One proof route is as follows. Normalize k using complementation and Eulerian symmetry. Apply the n=2,3,4 results. For n≥5, first-ratio-exclusion gives R_a<A₁/2, so R_b>A₁/2. Use large-k-exclusion and then second-ratio-exclusion.

**Checks.**

- The Pell branch at j=1 has m=25, k=5 and d=8855; its complement k=20 has min(k,m−k)=5 and the same d, so the classification must use min(k,m−k).
- For weights 0,0,1,1 and k=2, the row 1,4,1 realizes the classical branch; discarding every interior exterior power would discard this example.
- Weights 0,0,0,0,0,1 at k=3 give the surface row 10,10 with k₀=3>2 and d=binom(5,3)=10; omitting the n=2 branch would lose this solution.

*Needs:* §5.6; §5.7; §5.8; §6.3; §6.5.

### 6.7 Classical convolution monodromy

Let A/C have dimension n>2 and let H⊂A be smooth ample with trivial translation stabilizer. Write d=[H]ⁿ/n! and N=n!d. For n=3 assume d≠D_j for every j≥1; for n≥4 impose no numerical exception. Prove that G_H* equals SL_N when H is not a translate of [−1]H, Sp_N when it is such a translate and n is even, and SO_N when it is such a translate and n is odd. These groups are normal subgroups of G_H in the distinguished representation. This statement makes no dimension-two assertion. (LS, Theorem 3.5, p. 21; proof, p. 27; LS line 1252.)

Throughout this subsection, coefficients are F=Q̄_ℓ; group comparisons are up to inner conjugacy; all characteristic-zero extensions use the Layer 2 comparison.

One proof route is as follows. Simplicity and minuscule property reduce the representation to the listed alternatives. Divisibility excludes spin and exceptional minuscule dimensions. Apply the Hodge exterior-power constraint and the Eulerian classification; the only interior power surviving outside the stated threefold exception is ∧²SL₄=SO₆. Use inversion duality to select the classical group. It is the connected derived subgroup of a normal geometric image, hence normal in the whole convolution group.

**Checks.**

- For n=4,d=1, N=24 and the row 1,11,11,1 has no interior exterior-power realization (§5.8), so only the classical alternatives remain and no degree is excepted; at n=3 the same count would be 1,4,1 with the realization 0,0,1,1.
- At n=3 the theorem excludes d=8855 as a possible nonclassical case, without asserting such a hypersurface exists.
- For n=3,d=1 the symmetric classical image is SO₆, and the ∧²SL₄ representation has dimension 6 with kernel μ₂; identifying its image with SL₄ fails.

*Needs:* §4.7; §4.8; §5.4; §6.6.

### Examples

The n=5 row is 1,26,66,26,1. A large-exponent candidate has first-ratio sum 26, product at most 4 and second-ratio total at most 58<66, a contradiction. At n=3,d=1, ∧²SL₄ has image SO₆ and is retained. At P₁ the excluded normalized degree is 8855, whereas the represented dimension is 53130. (LS Lemmas B.19–B.21 and Theorem 3.5, LS lines 5393 and 1252.)

### Dependencies

§5.5; Mathlib `Nat.choose`; ClassicalArithmeticCompletion §2.57; ClassicalArithmeticCompletion §2.71; ClassicalArithmeticCompletion §2.77; ClassicalArithmeticCompletion §2.78; ClassicalArithmeticCompletion §2.39; §5.6; §5.7; §5.8; §4.7; §4.8; §5.4. The exact supplier contracts above retain their coefficient, dimension and finiteness hypotheses.

## Layer 7: generic twists in hypersurface families

### 7.1 Rigidity of constant tensor constituents

Let X/C be smooth connected, A/C an abelian variety, and Y⊂X×A a smooth proper family of ample hypersurfaces. On A_η̄ let K=i_*F[n−1], G=G(K), G*=(G°)^der. Assume the geometric generic hypersurface has trivial translation stabilizer, G* is noncommutative connected simple with irreducible distinguished representation, and the family is not generically a translate of a fixed hypersurface by a section of A (equivalently here after spreading the unique translation). If a simple object in ⟨K⟩⊗ has a representative pulled back from A_C, then G* acts trivially on it. (LS, Lemma 4.1, pp. 28–29; LS line 1271.)

Throughout this subsection, simple means simple modulo negligible objects, with a nonnegligible simple representative.

One proof route is as follows. Compare two independent geometric generic fibres over X². Goursat gives either independent simple derived factors or a graph relation modulo scalars. In the independent case a constant constituent is pulled back in both ways, so both simple factors act trivially. In the graph case use enough independent points of X^r to kill the finite outer-automorphism ambiguity. The remaining scalar relation gives a one-dimensional factor between the two distinguished objects. Identify it with a skyscraper, hence translation. Trivial stabilizer makes the translating section unique and allows descent, contradicting the nonconstant hypothesis.

**Checks.**

- For a family Y=H₀+s(x) translating a fixed H₀ by a nonconstant section s:X→A, the geometric generic object is the convolution of the skyscraper at s(η) with a constant K₀: K₀ is a constant simple object of ⟨K⟩⊗ on which G* acts irreducibly and nontrivially, so the conclusion fails and the nontranslation hypothesis is necessary.
- For a constant family and two independent geometric generic points, pr₁⁎K and pr₂⁎K are isomorphic and the group of their sum is the diagonal copy of G, not G×G; the Goursat alternative lands in the graph case with the identity relation, which is the case the proof must exclude by the nontranslation hypothesis.
- For a constant family and its distinguished object, the constituent is constant but G* acts irreducibly and nontrivially; this is the negative control for the nontranslation hypothesis.

*Needs:* §2.4; §1.5; §2.1; ReductiveGroups Layers 6–8; MordellLawrenceVenkatesh §§0.22–0.24.

### 7.2 Independent coordinate convolution factors

For abelian varieties A₁,A₂ over an algebraically closed characteristic-zero field and perverse K_j, the convolution group of z₁*K₁⊕z₂*K₂ on A₁×A₂, where z₁(a)=(a,0),z₂(b)=(0,b), is G(K₁)×G(K₂). Iterating, the axis-supported sum of c copies of K has group G^c. Under constant-part-rigidity, (G*)^c acts trivially on every constant tensor constituent of this axis-supported sum on A^c_η̄. (LS, Lemma 4.2 and Corollary 4.3, p. 30; LS line 1358.)

Throughout this subsection, c≥1; all good characters and fibre comparisons are chosen compatibly.

One proof route is as follows. A common quotient of the two generated groups would give isomorphic objects supported on the two different axes. Their common support is the origin, so the common quotient is trivial. Apply induction on c. For a homomorphism p:A^c→A, proper base change along the group laws makes Rp_* a tensor functor for convolution, and the projection formula gives Rp_*(K⊗p*Lχ)≅(Rp_*K)⊗Lχ; restricted to the good subcategory of a generic character, twisting and pushing to a coordinate is the exact faithful tensor functor of LS Corollary 4.3. A constant constituent nontrivial on a coordinate G* would push to a constant constituent nontrivial on G*, contradicting constant-part-rigidity.

**Checks.**

- At c=1 the result gives G.
- At c=2 it gives G×G even when K₁ and K₂ are isomorphic as sheaves on their original factors.
- Putting two copies on the same axis gives a diagonal action on V⊕V, of derived dimension dim G* rather than 2dim G*; distinct axes are essential.

*Needs:* §7.1; §1.3; §0.3; EtaleDualityAndPerverseSheaves §§3.3–3.5; EtaleCohomologyFoundations §§F.0.2, F.4.5; ReductiveGroups Layer 7.

### 7.3 Generic twists with no constant invariants

Let X/C be smooth connected with function field C(X), A/C an abelian variety, and K a geometrically semisimple perverse F-sheaf of geometric origin on A_C(X), defined over C(X), not just its algebraic closure. Suppose no simple geometric constituent is pulled back from A_C. Outside a finite union of torsion cosets in Π(A), H^j(A_C(X)̄,K⊗Lχ)=0 for j≠0 and H⁰(A_C(X)̄,K⊗Lχ)^Gal(C(X)̄/C(X))=0. Characters from A_C have their canonical descent to C(X). (LS, Lemma 4.4 and its proof, pp. 30–32; LS line 1399.)

Throughout this subsection, geometric origin and semisimplicity are needed for the decomposition/constituent argument; X may be shrunk to spread K.

One proof route is as follows. Spread K to K′ on A×X with K′[dim X] perverse. First exclude the bad loci of K and of the finitely many perverse cohomology objects of Rπ_*K′ for π:A×X→A. If a twisted generic fibre has a nonzero invariant, proper decomposition and intermediate extension give a constant summand of its pushforward to X. Its H⁰ is nonzero. Künneth/Leray, the projection formula and generic vanishing then give nonzero pH⁰(Rπ_*K′). The fibre-dimension bound provides its natural map to Rπ_*K′. Adjunction yields a constant perverse constituent of K, a contradiction. For arbitrary χ, the semisimple proper-direct-image contract applies to the twisted semisimple objects. Geometric origin of K alone does not make an infinite-order twist geometric. This preserves the full character range of the theorem.

**Checks.**

- A nonzero constant constituent violates the hypothesis and can produce invariants.
- The exceptional translates are torsion because the relevant sheaves have geometric origin (§0.9).
- For a constant skyscraper δ₀ the degree-zero twisted cohomology is F with invariant dimension 1 for every χ; removing its constant constituent is necessary.

*Needs:* §0.4; §0.9; §2.4; §0.2; EtaleDualityAndPerverseSheaves §§2.1, 2.6–2.10; EtaleDualityAndPerverseSheaves §5.10; semisimple proper-direct-image contract.

### 7.4 Finite representations detecting a simple product

Let G* be a noncommutative connected simple algebraic group over an algebraically closed characteristic-zero field acting faithfully and irreducibly on V, and let N=N_GL(V)(G*). For c≥1 construct a finite list T of irreducible representations of N^c with no (G*)^c-invariants such that for every linearly reductive algebraic subgroup B⊂N^c (identity component reductive, B possibly disconnected or finite), (G*)^c⊂B iff T^B=0 for every T in the list. Choose J=`jordanBound` N, the Jordan bound of FiniteGroupInvariants §10.5 for subgroups of GL(V) finite modulo scalars, and an N-representation W of dimension >J restricting irreducibly to G*. Take the irreducible constituents of End(W)/F and End(Lie G*)/F in each coordinate, and the cross-coordinate representations Lie(G*)_i⊗Lie(G*)_j∨ for i<j. (LS, Lemma 4.5, pp. 32–33; LS line 1479.)

Throughout this subsection, linear reductivity of B and characteristic zero are essential; the normalizer and all tensor constructions use the actual faithful image.

Its API includes the following facts.

- The construction yields finitely many concrete tensor representations of N^c, with their coordinate action maps.
- Every test object has zero invariants under (G*)^c.
- For linearly reductive B⊂N^c, vanishing of all test invariants is equivalent to containing (G*)^c.
- Conjugating the faithful realization transports the list and preserves its detection property.

One proof route is as follows. Take J from FiniteGroupInvariants §10.5. For W take the Cartan component of highest weight rλ in Sym^r V for large r, where λ is the highest weight of V: it is irreducible under G*, stable under N because N fixes the isomorphism class of V and hence λ, and its dimension grows without bound by the Weyl dimension formula (LieHighestWeight Layer 6). No invariants in the two endomorphism tests makes each coordinate projection act irreducibly on W and on the adjoint module. The projection Lie algebra either contains Lie(G*) or is central. In the second case the projection is finite modulo scalars, so by `finrank_le_jordanBound` its irreducible representations have dimension at most J, contradicting irreducibility on W. Pairwise Lie-Goursat detects any remaining graph relation. Such a graph creates an invariant in a cross-coordinate adjoint tensor, so all projections together contain the full connected product.

**Checks.**

- For B=(G*)^c all invariants in the test list vanish.
- For c=2 and B=diagonal G*, the identity intertwiner gives a nonzero cross-adjoint invariant.
- For B=1 a nonzero test representation has fixed vectors; the trivial subgroup is rejected.
- A finite subgroup B⊂N^c, such as a copy of Q₈ in one coordinate, is linearly reductive but disconnected; its irreducible representations have dimension at most J<dim W, so W is reducible under B, B fixes a nonzero vector in a constituent of End(W)/F, and the W-test rejects it.

*Needs:* ReductiveGroups Layers 3, 6 and 7; LieHighestWeight Layer 4; LieHighestWeight Layer 6; MordellLawrenceVenkatesh §§0.22–0.24; FiniteGroupInvariants §10.5.

### 7.5 Big monodromy for generic simultaneous twists

In the family setting of constant-part-rigidity, assume the geometric generic stabilizer is trivial and G* is connected simple with irreducible distinguished representation. For every c≥1 there is a finite union S of torsion cosets in Π(A)^c such that for (χ₁,…,χ_c) outside S, R^j f_*(g⁎Lχ_i)=0 for j≠n−1 and the geometric monodromy of ⊕_i R^(n−1)f_*(g⁎Lχ_i) contains (G*)^c as a normal subgroup. On this product it is the direct sum of the c distinguished representations, each supported on its own factor. Here f:Y→X,g:Y→A are the projections. All sheaves are lisse on X by smooth proper base change. (LS, Theorem 4.7 and proof, pp. 33–34; LS line 1526.)

Throughout this subsection, X is smooth connected over C; f is smooth proper with smooth ample hypersurface fibres; the family is not generically constant up to translation.

One proof route is as follows. First remove concentration failures for the c twists. Arithmetic normalization places the simultaneous monodromy group inside N(G*)^c. Realize the finite detecting tensor representations by geometrically semisimple perverse objects in the arithmetic axis-generated category. Their geometric constituents have no constant part by independent-coordinate-factors. Apply relative-generic-vanishing to all those objects. For arbitrary characters apply the semisimple proper-direct-image contract to the semisimple twisted local systems; the finite-order case also follows from geometric-origin decomposition. The finite test battery forces product containment; the normalizer inclusion makes the contained product normal. For arbitrary χ, the semisimple proper-direct-image contract applies to the twisted semisimple objects. Geometric origin of K alone does not make an infinite-order twist geometric. This preserves the full character range of the theorem.

**Checks.**

- For c=1 recover one simple normal subgroup.
- The diagonal character tuple must lie in the exceptional set when c>1 and the same monodromy would otherwise act diagonally.
- At c=2 a diagonal tuple gives diagonal monodromy on V⊕V, of derived dimension dim G*, whereas the required product has dimension 2dim G*.

*Needs:* §7.2; §7.3; §7.4; §2.3; EtaleDualityAndPerverseSheaves §5.10; semisimple proper-direct-image contract.

### Examples

For G*=SL₂ and c=2 the product has dimension 6. A diagonal copy has dimension 3 and fixes the identity in the cross-adjoint Hom representation, a one-dimensional invariant space. For Q₈ placed in one coordinate of N², its irreducible representations have dimension at most 2, so a test representation W of dimension greater than the Jordan bound is reducible under it and the W-test rejects it. These distinguish the product detector from a coordinate-only test. (LS Lemma 4.5, LS line 1479.)

### Dependencies

§2.4; §1.5; §2.1; ReductiveGroups Layers 6–8; MordellLawrenceVenkatesh §§0.22–0.24; §1.3; §0.3; EtaleDualityAndPerverseSheaves §§3.3–3.5; EtaleCohomologyFoundations §§F.0.2, F.4.5; §0.4; §0.9; §0.2; EtaleDualityAndPerverseSheaves §§2.1, 2.6–2.10; EtaleDualityAndPerverseSheaves §5.10; FiniteGroupInvariants §10.5; LieHighestWeight Layer 4; LieHighestWeight Layer 6; §2.3. The exact supplier contracts above retain their coefficient, dimension and finiteness hypotheses.

## Layer 8: Frobenius and Galois-uniform monodromy

### 8.1 Prime-to-p Frobenius avoidance

Let A/K be an abelian variety over a number field with good reduction at a place of residue characteristic p, fix lifts of its Frobenius in the two actions on finite-order character pairs, and choose m>0 whose Frobenius power fixes the Galois closure of K. Given c≥1 and a finite union S of torsion cosets in Π(A)^c, there is a finite union S′ of torsion cosets in Π(A) such that for each finite-order χ of order prime to p outside S′, some e₁,…,e_c∈Z give (Frob_p^(me₁)χ,…,Frob_p^(me_c)χ) outside S. The two actions are geometric transport and cyclotomic transport of character values. (LS, Lemma 4.8 and proof, pp. 34–35; LS line 1582.)

Throughout this subsection, only prime-to-p torsion characters are asserted; fix a common algebraic closure and compatible embeddings for the transport.

One proof route is as follows. Let M be the number of cosets in S. The case M=0 is immediate. Replace m by a multiple so the geometric restriction kernels and translating torsion data are stable under σ=Frob^m. On every prime-to-p Tate module the combined geometric/cyclotomic action has Weil eigenvalues of nonzero weight, so no positive power has eigenvalue 1. For a fixed proper coset τT in Π(A)^c, choose a coordinate axis r with proper inverse image T_r⊂Π(A) under the r-th axis inclusion. The projected positive-dimensional abelian subvariety B⊂A determines the restriction ρ_B:Π(A)→Π(B) with kernel T_B, and T_r is a finite union of torsion translates of T_B, finitely many because of the isogeny part of the projection onto B; hence E_r=ρ_B(T_r) is a finite torsion subgroup of Π(B). Enlarging m makes B stable under σ, so ρ_B commutes with σ. Writing character groups additively, for every 0≤e<e′≤M and every η∈E_r the prime-to-p torsion characters ψ of B with (σ^e−σ^e′)ψ=η form a finite set, because σ^(e′−e)−1 has nonzero determinant on every prime-to-p Tate module and so has finite kernel on prime-to-p torsion; their inverse images under ρ_B form a finite union of torsion cosets of T_B. Collect these collision loci for all cosets, exponent pairs and values η into S′. For χ outside S′, fix all exponents other than e_r in {0,…,M}. At most one e_r can place the tuple in τT: two choices e≠e′ would put the difference (σ^e−σ^e′)χ in T_r, so (σ^e−σ^e′)ρ_B(χ)=ρ_B((σ^e−σ^e′)χ) would be some η∈E_r and χ would lie in S′. Equality of σ^eχ and σ^e′χ on B detects only η=0 and does not suffice. Thus at most (M+1)^(c−1) tuples are bad for each coset and at most M(M+1)^(c−1)<(M+1)^c are bad in total. A good tuple exists. Exponents for the original Frobenius step are obtained by the integer scaling used when enlarging m. The determinant argument applies to prime-to-p torsion. Its finite-box inequality bounds the tuples inside each exceptional coset.

**Checks.**

- For a character ψ of exact order p, the cyclotomic transport raises its values to the p-th power and makes them 1, so σψ, and hence every σ^eψ with e≥1, is the trivial character: σ^eψ=σ^fψ for all e,f≥1, and all p²ⁿ−1 characters of exact order p are collisions for the exponent pair (1,2). The finite-collision claim therefore fails for p-power characters, which is why only characters of order prime to p are asserted.
- For E×E, the embedded curve a↦(2a,3a) has restriction equation χ₁²χ₂³=1; its first-axis inverse image contains all four characters in Π(E)[2], rather than just the trivial character. With two bad cosets and c=2 the box has 3²=9 tuples and at most 2·3=6 bad tuples, leaving at least 3 good ones.
- On E³ take the embedded curve a↦(2a,3a,5a), with restriction equation χ₁²χ₂³χ₃⁵=1, so that the first-axis inverse image is Π(E)[2] while T_E={1} and E₁=Π(E)[2]. Let σ act by 3 on a cyclic group of characters of order 4, as for a scalar Frobenius of modulus 3 over a residue field with 9 elements, take M=1, the generator χ, and (e₂,e₃)=(1,0). Both e₁=0 and e₁=1 are bad, since 2+9+5=16 and 6+9+5=20 are divisible by 4, although σχ≠χ: in the additive notation χ−σχ has exponent 1−3≡2 modulo 4. It lies in E₁ as the nonzero value η=2, which the collision loci therefore exclude.

*Needs:* §0.1; AbelianSchemesAndArithmeticModuli §A4.1; DeligneWeightsAndPurity §§0.1–0.3, 0.11, 1.4.

### 8.2 Character generic in every conjugate

For each embedding ι:K→Q̄ suppose S_ι is a finite union of torsion cosets in Π(A_ι). For any chosen prime ℓ there are an embedding ι and a finite-order ℓ-power character χ on A_ι such that every conjugate (ι′,χ′) under Gal(Q̄/Q)×Gal(Q^cyc/Q) avoids S_ι′. This lemma alone has no ℓ≠p condition; that condition is imposed when combining it with Frobenius avoidance. (LS, Lemma 4.9, pp. 35–36; LS line 1628.)

Throughout this subsection, character values are finite-order roots of unity; the cyclotomic action on values is defined on this torsion character set.

One proof route is as follows. Take the finite Galois/cyclotomic conjugate closure of the torsion-coset data, using finite fields of definition of abelian subvarieties and translating torsion characters. Among characters of order dividing ℓ^r, the total count is ℓ^(2nr). A restriction kernel from a positive-dimensional abelian subvariety has at most a fixed multiple of ℓ^(2(n−1)r) points. For large r the finite exceptional union cannot exhaust all characters.

**Checks.**

- For a simple elliptic curve, each proper torsion coset is a point, while the number of ℓ^r characters grows as ℓ^(2r).
- For E over Q, one exceptional point ψ of order 4 in one embedding and its complex conjugate in the other: the Galois and cyclotomic conjugates of ψ are characters of order 4, at most |GL₂(Z/4)|=96 of them, so among the 4^r characters of order dividing 2^r at least 4^r−96>0 avoid all conjugates once r≥4, and every character of exact order 2^r with r≥3 does so, since conjugation preserves the order.
- On an elliptic curve, characters of order dividing 2³ number 64; three exceptional points cover at most 3 of them, leaving at least 61.

*Needs:* §0.1; AbelianSchemesAndArithmeticModuli §A4.1.

### 8.3 Uniform big monodromy on a character orbit

Let the family Y⊂X×A and the hypotheses of generic-big-monodromy be defined over a number field K. Fix c≥1, a good-reduction place of residue characteristic p, m>0 as in Frobenius avoidance and a prime ℓ≠p. Then some embedding ι and an ℓ-power finite-order character χ have the following property for every Gal(Q̄/Q)×Gal(Q^cyc/Q)-conjugate (ι′,χ′): R^j f_*(g⁎Lχ′)=0 for j≠n−1, and there exist e₁,…,e_c∈Z for which the geometric monodromy of the sum twisted by Frob_p^(me_i)χ′ contains (G*)^c normally, with the c distinguished actions. The exponents may depend on the conjugate. (LS, Corollary 4.10 and proof, pp. 36–37; LS line 1669.)

Throughout this subsection, the Frobenius and cyclotomic lifts are fixed once; ℓ is the order prime of the finite character, and need not equal the cohomological prime.

One proof route is as follows. Apply the generic simultaneous-twist theorem to the finitely many embedding-conjugate families. Use Frobenius avoidance to turn each c-fold bad set into a one-character bad set, adding the single-character concentration loci. Choose an ℓ-power character whose every conjugate avoids all of these one-character sets. Its order is prime to p, so every conjugate satisfies the prime-to-p avoidance theorem of §8.1.

**Checks.**

- At c=2 and G*=SL₂, the contained product has dimension 6 and acts on two rank-two summands; a diagonal copy has dimension 3 and fails.
- For c≥2 equal exponents e₁=…=e_c give the diagonal tuple (σ^eχ′,…,σ^eχ′), which lies in the exceptional set of §7.5; the exponents must be allowed to differ, and to depend on the conjugate.
- With ℓ=p=2 the cyclotomic transport raises the values ±1 of an order-2 character to the power 2, giving 1, so it is not injective on 2-power-order characters and the collision sets of §8.1 need not be finite; this is why ℓ≠p is imposed.

*Needs:* §7.5; §8.1; §8.2.

### Examples

For two bad cosets and c=2, 9 exponent tuples contain at most 6 bad choices and hence at least 3 good ones. On an elliptic curve 2³-torsion characters number 64, while a union of three point cosets contains at most 3 of them. The arithmetic Frobenius modulus √2 at a degree-one place of residue characteristic 2 excludes eigenvalue 1 on the prime-to-2 part. (LS Lemmas 4.8–4.9, LS lines 1582 and 1628.)

### Dependencies

§0.1; AbelianSchemesAndArithmeticModuli §A4.1; DeligneWeightsAndPurity §§0.1–0.3, 0.11, 1.4; §7.5. The exact supplier contracts above retain their coefficient, dimension and finiteness hypotheses.

## Layer 9: isogeny pullbacks and finite period detection

### 9.1 Period maps of isogeny pullbacks

Fix a complex abelian variety A of dimension n≥2 and an ample line bundle L. Let M be the open subset of the complete linear system P(H⁰(A,L)) parameterizing smooth divisors, using the convention that points are nonzero sections modulo scalar. For m>0 let Y_m→M be the family [m]⁻¹H. The torsion-free integral middle cohomology V_m with its polarization Q and Hodge filtration is a polarized integral variation on M. Fix a base point b∈M, let D_m be the set of polarized Hodge filtrations of the type of V_m on (V_(m,b),Q) (HodgeStructures L3) and Γ_m the full group of integral isometries of (V_(m,b),Q). The period map Φ_m:M→Γ_m\D_m sends s to the Γ_m-orbit of the Hodge filtration at s transported to b along a path; it is well defined because monodromy preserves the lattice and Q. Its rational local system splits, after a coefficient extension, into character-isotypic summands H^(n−1)(H,Lχ), for characters of A[m]. The fixed class is in Pic(A), not merely NS(A). (LS, Proposition 4.11 and its proof, pp. 37–38; LS line 1698.)

Throughout this subsection, use polarizations from the fixed ample geometric data and finite level/markings when a period domain rather than its quotient is used.

Its API includes the following facts.

- M(C) is the set of smooth effective divisors H with O_A(H)≅L, embedded by their section line.
- The family and polarized variation commute with base change in M.
- For m|m′, pullback u:V_m→V_(m′) and trace t:V_(m′)→V_m along the finite étale map [m′/m]:Y_(m′)→Y_m of degree r=(m′/m)^(2n) are integral morphisms of variations with t∘u=r·id, so e=u∘t/r is a flat idempotent endomorphism of the rational m′-variation whose image is u(V_m)⊗Q.
- The rational variation after adjoining deck characters is the direct sum of the corresponding twisted cohomology local systems.

One proof route is as follows. Form the projective section space P(H⁰(A,L)) as the projective bundle of AlgebraicModuliForArithmeticGeometry §1.1 on the dual E=H⁰(A,L)^∨, so that its points are the lines of H⁰(A,L), nonzero sections modulo scalars. Dualizing the tautological quotient H⁰(A,L)^∨⊗O→O(1) gives O(−1)→H⁰(A,L)⊗O, and composing its pullback with evaluation H⁰(A,L)⊗O_(A×P)→pr₁*L gives the tautological section σ of pr₁*L⊗pr₂*O(1), whose restriction to the fibre A×{[t]} is t once a generator of the line [t] is chosen. The universal divisor 𝒟⊂A×P(H⁰(A,L)) is the zero scheme of σ (AlgebraicModuliForArithmeticGeometry §1.7, `rankLocus` with r=0), a locally principal closed subscheme whose fibre over [t] is the divisor of the nonzero section t of L on the integral variety A, an effective Cartier divisor; since the projection A×P(H⁰(A,L))→P(H⁰(A,L)) is smooth, 𝒟 is a relative effective Cartier divisor (Stacks, Divisors, Lemma 19.9(3), tag 062Y, p. 40, Stacks line 1796), in the carrier `AlgebraicGeometry.Scheme.IdealSheafData.IsRelativeEffectiveCartier` of Tau Ceti, hence flat and of finite presentation over the base and stable under base change in the parameter; the open subset of 𝒟 at which the projection is smooth is `AlgebraicGeometry.Scheme.Hom.smoothLocus`, its closed complement has closed image under the proper projection, and M is the open complement of that image. Multiplication by m is finite étale in characteristic zero, so the pulled-back universal divisor is smooth proper. Take the polarized integral variation from the geometric Hodge theory of ComplexComparisonPartII §§C5.2–C5.3 in the carrier of ShimuraData §3.4, keeping the lattice modulo torsion, and define Φ_m by transport to the base point. Decompose the finite abelian deck group after scalar extension; trace and pullback maps compare the variations for m|m′.

**Checks.**

- Translation by x preserves M’s line bundle condition only when x lies in the finite kernel of φ_L.
- At m=1 the deck decomposition has only the trivial character.
- Replacing Pic(A) by NS(A) makes all translations preserve the parameter condition and destroys the intended finiteness test.
- For an elliptic curve E and L of degree 2, which tests the construction of 𝒟 and M alone since the subsection assumes n≥2: h⁰(E,L)=2, P(H⁰(E,L))=P¹, the pencil has no base point, so 𝒟→E is an isomorphism and 𝒟→P¹ is the degree-two map of |L|, flat of degree 2 with four simple ramification points by Riemann–Hurwitz; the projection fails to be smooth exactly at those four points, their images are the four branch points, and M is P¹ minus four points. A definition of M asking only that the member be flat over its point would keep the four branch points, whose members 2a are nonreduced.
- For a principally polarized abelian surface A with L=O_A(Θ): h⁰(A,L)=1, so P(H⁰(A,L)) is a point and 𝒟=Θ×{pt}; M is that point for the Jacobian of a genus-two curve, where Θ is the smooth curve itself, and M is empty for A=E₁×E₂ with Θ=E₁×{0}+{0}×E₂, singular at the origin. A definition of M by reducedness of the member instead of smoothness would keep the product case, whose theta divisor is reduced but singular.

*Needs:* AbelianSchemesAndArithmeticModuli §A2.4; AbelianSchemesAndArithmeticModuli §§A3.1–A3.5; AlgebraicModuliForArithmeticGeometry §§1.1 and 1.7; Tau Ceti `AlgebraicGeometry.Scheme.IdealSheafData.IsRelativeEffectiveCartier`; Mathlib `AlgebraicGeometry.Scheme.Hom.isOpen_smoothLocus`; ComplexComparisonPartII §§C5.2–C5.3; ShimuraData §§3.1–3.4; HodgeStructures L3; isogeny character/trace contract.

### 9.2 Surface period finiteness by Torelli

When dim A=2, the period map Φ₁ of smooth curves in the fixed complete linear system |L| has finite fibres. Here the polarization on H¹ is the canonical cup-product principal polarization. The genus is g=1+d≥2. No convolution simplicity assertion in dimension two is required. (JV, Proposition 6.1 and its proof, pp. 19–20; Theorem 12.1, p. 38; JV line 941; LS, Proposition 4.11, pp. 37–38; LS line 1698.)

Throughout this subsection, A is a complex abelian surface, L is ample, and the parameter space is the smooth-divisor open M⊂|L|; the statement is vacuous when M is empty.

One proof route is as follows. Use adjunction and the Layer 3 Euler calculation to obtain g=1+d. A polarized integral weight-one Hodge structure determines the principally polarized Jacobian. The full-level Torelli theorem gives finite geometric fibres from the moduli of genus-g curves to the moduli of their polarized Jacobians. Show that M→M_g has zero-dimensional geometric fibres. On a reduced connected component of such a fibre, the universal curve becomes a fixed curve C after the finite étale isomorphism cover; finite automorphisms for g≥2 and a fine level N≥3 justify this reduction. Fix c₀∈C. The pointed map C→A uniquely factors through J(C) by Abel–Jacobi, and the relative Hom space is unramified, so its homomorphism component is constant on a connected reduced parameter space. Consequently the embedded images in A on that component differ only by translations. Translating a fixed divisor H₀ preserves O_A(H₀)≅L only for points in ker φ_L. Amplitude makes this kernel finite; hence the component has constant image in M. The fibre of M→M_g is a zero-dimensional finite-type algebraic space, so has finitely many geometric points. Combine these finite fibres with Torelli and the weight-one comparison. Passing to and forgetting a finite level cover preserves fibre finiteness. This gives m=1 for n=2, the case that the convolution route of §9.4 does not reach.

**Checks.**

- For d=1 the curve genus is 2, including the hyperelliptic Torelli case.
- A positive-dimensional translation orbit cannot lie in this fixed |L|.
- For a polarization with d=2, deg φ_L=d²=4; a translation class therefore contributes at most four Picard-fixed translates.

*Needs:* §9.1; §3.1; AbelianSchemesAndArithmeticModuli §A2.4; AbelianSchemesAndArithmeticModuli §A5; AbelianSchemesAndArithmeticModuli §§A1.2 and A6.25; StableReductionPartII §§4.8, 6.3, 6.6, 6.12 and 6.14; polarized integral Jacobian contract; JacobianChallenge Layer F; JacobianChallengePartII §§2.1–2.4; relative pointed Albanese contract.

### 9.3 Transport Hodge relations and period fibres

Let S be a smooth connected complex algebraic variety and V a polarized integral variation of Hodge structures on S, with lattice V_Z, polarization Q and Hodge filtration F. Define the transport Hodge relation R_V⊂S×S as the set of pairs (s₁,s₂) for which some path from s₁ to s₂ has parallel transport V_(Z,s₁)→V_(Z,s₂) carrying F_(s₁) to F_(s₂); such a transport preserves Q and is an isomorphism of polarized integral Hodge structures. For a base point b and a group Γ of integral isometries of (V_(Z,b),Q) containing the monodromy image, let Φ_Γ:S→Γ\D be the period map defined as in §9.1. For polarized integral variations V and V′ on S of weights w and w′, define the Hom variation Hom(V,V′): its lattice is the local system Hom(V_ℤ,V′_ℤ), its fibre at s is the integral internal Hom of the Hodge structures V_s and V′_s, of weight w′−w, its Hodge filtration is the holomorphic subbundle filtration induced fibrewise, and its polarization is the form induced from the polarization Q′ of V′ and from the polarization of the dual lattice V_ℤ^∨ obtained from Q, the latter multiplied by one fixed positive integer when Q is not unimodular. Pullback of a polarized integral variation along a morphism f:S′→S of smooth varieties is the holomorphic pullback variation, and Hom commutes with pullback. Prove the following.

- (a) R_V is an equivalence relation and a closed algebraic subset of S×S.
- (b) If V′ is a second polarized integral variation on S and u:V→V′, t:V′→V are morphisms of variations with t∘u=r·id for an integer r>0, then R_(V′)⊆R_V.
- (c) Pairs in R_V have equal images under Φ_Γ, and conversely when Γ is the monodromy image. When Γ is the full group of integral isometries, every fibre of Φ_Γ is a closed algebraic subset of S.
- (d) If W⊂S is a connected locally closed analytic subset on which Φ_Γ is constant, then W×W⊆R_V, and for w∈W the monodromy of V restricted to W at w lies in the automorphism group of the polarized integral Hodge structure V_w, which is finite.

(LS, Proposition 4.11 and its proof, pp. 37–38, LS lines 1707–1726; CDK, Theorem 1.1 and Corollary 1.3, p. 2, CDK lines 54 and 59; positivity of the Hodge metric, CDK line 121.)

Throughout this subsection, paths run in S, and the relation is defined by parallel transports, not by abstract isomorphisms between fibres.

Its API includes the following facts.

- Hom(V,V′) is a polarized integral variation of weight w′−w on S; over a simply connected open U⊂S its flat sections are the morphisms of local systems V_ℤ|_U→V′_ℤ|_U.
- An integral class φ in Hom(V_s,V′_s) is of type (0,0) exactly when φ is a morphism of integral Hodge structures; in particular the transport of V along a path from s₁ to s₂ is a (0,0) class of Hom(V_(s₁),V_(s₂)) exactly when it carries F_(s₁) to F_(s₂).
- f*Hom(V,V′)=Hom(f*V,f*V′) for f:S′→S; on S×S the variation Hom(pr₁*V,pr₂*V) has weight zero, its germ at a diagonal point (s,s) contains the identity of V_s as an integral (0,0) class, and the flat continuation of that class along a path in S×S from (s,s) to (s₁,s₂), lifted to paths γ₁ from s to s₁ and γ₂ from s to s₂, is the transport of V along γ₁⁻¹γ₂ from s₁ to s₂.
- The polarization norm of the identity at a diagonal point is the rank of V times the fixed scaling integer, positive by the Hodge–Riemann positivity on classes of type (0,0).

One proof route is as follows. For (a), concatenation and reversal of paths give an equivalence relation. On S×S take the weight-zero Hom variation Hom(pr₁*V,pr₂*V) of the API above, with pr₁*V and pr₂*V the pullback variations of ShimuraData §3.4 and the fibrewise internal Hom and induced polarization of Tau Ceti. The flat continuation of the identity at a diagonal point has as determinations at (s₁,s₂) exactly the transports along paths from s₁ to s₂, and a determination has type (0,0) exactly when it carries F_(s₁) to F_(s₂); the orbit form of CDK Corollary 1.3, supplied by the bounded-norm contract, makes R_V closed algebraic. For (b), parallel transport commutes with the flat maps u and t, so the transport T of V along a path equals r⁻¹·t∘T′∘u for the transport T′ of V′. If T′ is a Hodge isomorphism, T is an integral isomorphism and a rational Hodge morphism, hence a Hodge isomorphism; in particular T′ commutes with the flat projector e=u∘t/r. For (c), a transport carrying F_(s₁) to F_(s₂) changes the filtration transported to b by an element of the monodromy image, and conversely a monodromy element relating the transported filtrations gives such a transport by composing paths. For the full isometry group, s lies in the fibre through x exactly when Hom(V_x,V_s) contains an integral (0,0) class that is an isometry; these classes have one fixed polarization norm, the bounded-norm contract makes them an algebraic space finite over S, the isometries form a union of its connected components because flat continuation preserves them, and the fibre is the image of that union. For (d), along a path in W the filtration transported back to its start moves continuously inside one Γ-orbit. Each Γ-orbit in D is discrete: if γ_kF₀ converges, the Hodge metrics of γ_kF₀ converge, so the γ_k⁻¹ are bounded in the positive definite Hodge metric of F₀, and bounded integral isometries are finitely many. A continuous path in a discrete set is constant, so every path in W transports Hodge filtrations to Hodge filtrations. A loop in W at w therefore preserves the lattice, Q and F_w, hence the positive definite Hodge metric of V_w, and such automorphisms form a discrete subgroup of a compact group, which is finite.

**Checks.**

- For n=3, m=1 and m′=2 the cover has degree r=2⁶=64. With u=(1,0)ᵀ and t=(64,0) one has t∘u=64 and e=u∘t/64=diag(1,0), e²=e. For two identical one-dimensional rational Hodge summands the swap P is a Hodge isomorphism of the total space with PeP⁻¹=diag(0,1)≠e, so an arbitrary Hodge isomorphism of total cohomology neither preserves the designated summand nor descends, whereas a transport commutes with the flat e.
- The weight-one Hodge structure of ℂ/ℤ[i] has integral polarized automorphism group {±1,±i} of order 4, while multiplication by (3+4i)/5 is a rational Hodge isometry of infinite order, its minimal polynomial x²−(6/5)x+1 not being integral; the finiteness in (d) needs the integral lattice.
- For the universal elliptic curve over Y(3), with monodromy Γ(3), the points [τ] and [τ+1] have the same image in SL₂(ℤ)\ℍ under the full-isometry period map. For τ with stabilizer {±1} in SL₂(ℤ), a transport identifying them would be some δ∈Γ(3) with δτ=τ+1, forcing δ=±T with T=[[1,1],[0,1]]∉±Γ(3); so ([τ],[τ+1])∉R_V, the converse in (c) needs the monodromy image, and (d) needs W connected.
- For a constant variation V, the pullbacks pr₁*V and pr₂*V are the constant variation on S×S and Hom(pr₁*V,pr₂*V) is the constant variation Hom(V,V), on which the identity is a global flat (0,0) section, so R_V=S×S; and if u and t are mutually inverse (r=1) then R_(V′)=R_V.
- For the universal elliptic curve over Y(3) with V=H¹ of weight one, Hom(pr₁*V,pr₂*V) on Y(3)×Y(3) has weight 0, and at a diagonal point the identity of H¹(E,ℤ) is an integral class of type (0,0) of polarization norm 2, the rank, Q being unimodular; a convention adding the weights would give weight 2 to a variation whose fibre contains the identity, of type (0,0).
- On a contractible open U⊂Y(3) trivialize V_ℤ≅ℤ²; the transport between two points s₁,s₂ of U is the identity of ℤ² in that frame, which carries F¹_(s₁) to F¹_(s₁), different from F¹_(s₂) when the two j-invariants differ, so this integral class of Hom(V_(s₁),V_(s₂)) is not of type (0,0), whereas the identity at a diagonal point is.

*Needs:* §9.1; ShimuraData §3.1 (`variationMk`, `variationPullback`), §3.2 and §3.4 (`integralVariationMk`, `integralVariationPullback`); Tau Ceti `TauCeti.Hodge.HodgeStructure.internalHom`, `TauCeti.Hodge.HodgeStructure.Hom.exists_toIntLinearMap_eq_iff`, `TauCeti.Hodge.IsPolarization.internalHom`; HodgeStructures L1; HodgeStructures L3; bounded-norm orbit Hodge-locus contract.

### 9.4 Quasi-finite isogeny-pullback period map

Let M be the smooth-divisor open of the complete linear system of an ample line bundle on a complex abelian variety of dimension n≥2. Prove that some m>0 makes every fibre of the full-isometry period map Φ_m of §9.1 finite; a period map to Γ\D_m with Γ a smaller group containing the monodromy has smaller fibres, so it is quasi-finite as well. For n=2 take m=1 by §9.2. For n>2 apply §9.3 to the variations V_m and use the finite generic translation-stabilizer quotient followed by simple convolution monodromy. The scope is the entire fixed Picard class, including divisors with nontrivial finite stabilizer. (LS, Proposition 4.11 and its proof, pp. 37–38; LS line 1698; CDK, Theorem 1.1 and Corollary 1.3, p. 2; CDK line 54.)

One proof route is as follows. Put Z_m=R_(V_m)⊂M×M. By §9.3(a) Z_m is closed algebraic, and by §9.3(b), applied to the pullback and trace maps of §9.1, Z_(m′)⊆Z_m whenever m|m′. Since M×M is Noetherian, choose m with Z_m minimal among all Z_k; then Z_(m′)=Z_m for every multiple m′ of m. If some fibre of Φ_m were infinite, it would be closed algebraic by §9.3(c), hence contain an irreducible positive-dimensional subvariety W, and W×W⊆Z_m by §9.3(d). Fix x∈W and let X be the smooth locus of an irreducible component containing W of the fibre of Z_m over x; it is connected, algebraic and positive-dimensional. For every multiple m′ of m, {x}×X⊆Z_(m′), so Φ_(m′) is constant on X by §9.3(c) and V_(m′) has finite monodromy on X by §9.3(d). The deck-character decomposition of §9.1 then gives finite monodromy for every torsion-twist summand R^(n−1)f_*(g*Lχ) over X, since every torsion character has order dividing some multiple of m. Fixing L rules out constancy by translations. Quotient by the finite generic translation stabilizer, shrinking the family so that its action is fixed; the resulting ample family has trivial stabilizer. For n>2 apply simplicity and generic-big-monodromy to contradict finite monodromy for a torsion character outside the finite exceptional union. For n=2 use §9.2.

**Checks.**

- For d=1 the space H⁰(A,L) is one-dimensional, so |L| is a single divisor and M is a point or empty, and every fibre is finite trivially; for d=2, |L| is a line and M is a nonempty open subset of it when a smooth member exists.
- If the parameter space were the Néron–Severi class of L, all translates H₀+x with x∈A would be parameters with the same polarized variation, and the fibre of the period map through H₀ would contain the n-dimensional translation orbit: the Picard-fixed parameter space is what makes finiteness possible, and translates preserving the Picard class are the finitely many x∈ker φ_L.
- The descent Z_(m′)⊆Z_m uses transports, which commute with e=u∘t/r; for two identical one-dimensional rational Hodge summands the swap matrix sends the projector diag(1,0) to diag(0,1), so a relation defined by arbitrary Hodge isomorphisms of total cohomology would not descend.

*Needs:* §9.1; §9.2; §9.3; §7.5; §4.6; ShimuraData §§3.1–3.4; AbelianSchemesAndArithmeticModuli §§A1.8(1) and A2.4; ample-divisor Albanese and translation-stabilizer quotient contracts.

### Examples

For an abelian surface, g(H)=1+d; d=1 gives genus 2 and Torelli applies also to its hyperelliptic curves. At d=2, at most d²=4 translations of a fixed divisor preserve its line bundle. At m=1 there is one deck-character summand. At a cover of degree r, trace after pullback is multiplication by r, so division by r makes the pullback/trace endomorphism idempotent over Q. (LS Proposition 4.11, LS line 1698; JV Theorem 12.1, JV line 1713.)

### Dependencies

AbelianSchemesAndArithmeticModuli §A2.4; AbelianSchemesAndArithmeticModuli §§A3.1–A3.5; AlgebraicModuliForArithmeticGeometry §§1.1 and 1.7; Tau Ceti `AlgebraicGeometry.Scheme.IdealSheafData.IsRelativeEffectiveCartier`; Mathlib `AlgebraicGeometry.Scheme.Hom.isOpen_smoothLocus`; ComplexComparisonPartII §§C5.2–C5.3; ShimuraData §§3.1–3.4; Tau Ceti `TauCeti.Hodge.HodgeStructure.internalHom`, `TauCeti.Hodge.HodgeStructure.Hom.exists_toIntLinearMap_eq_iff`, `TauCeti.Hodge.IsPolarization.internalHom`; HodgeStructures L1, L3; bounded-norm orbit Hodge-locus contract; isogeny character/trace contract; §3.1; AbelianSchemesAndArithmeticModuli §A5; AbelianSchemesAndArithmeticModuli §§A1.2 and A6.25; StableReductionPartII §§4.8, 6.3, 6.6, 6.12 and 6.14; polarized integral Jacobian contract; JacobianChallenge Layer F; JacobianChallengePartII §§2.1–2.4; relative pointed Albanese contract; §7.5; §4.6; AbelianSchemesAndArithmeticModuli §A1.8(1); ample-divisor Albanese and translation-stabilizer quotient contracts. The exact supplier contracts above retain their coefficient, dimension and finiteness hypotheses.

## Downstream consumers

The Galois-uniform product theorem of §8.3 supplies the geometric monodromy input for a Part II development of MordellLawrenceVenkatesh. Layers 3–6 supply hypersurface dimensions, Hodge multiplicities and connected derived images for independent arithmetic applications. Section 9.4 supplies a finite-fibre period statement; it does not itself prove arithmetic Shafarevich finiteness. Every consumer uses these results with their stated stabilizer, dimension and coefficient hypotheses.

## References

All locators refer to the versions listed here. Source line references identify the line-numbered text of those versions.

- LS: Brian Lawrence and Will Sawin, [The Shafarevich conjecture for hypersurfaces in abelian varieties](https://arxiv.org/abs/2004.09046v5), arXiv v5 (2025), §§2–4 and Appendices B–C, PDF pp.14–38 and 93–118. Published in Annals of Mathematics 202 (2025), 857–1000; the locators here use the preprint numbering.
- KW: Thomas Krämer and Rainer Weissauer, [Vanishing theorems for constructible sheaves on abelian varieties](https://arxiv.org/abs/1111.4947v6), arXiv v6 (2015), Theorem 1.1, Proposition 10.1, Lemma 11.2 and §§12–13.
- K1: Thomas Krämer, [Characteristic cycles and the microlocal geometry of the Gauss map, I](https://arxiv.org/abs/1604.02389v3), arXiv v3 (2021), Theorems 1.5 and 1.7, Corollaries 1.6 and 1.10, pp.6–12, Proposition 3.1, Theorems 3.2 and 3.4 and Lemma 3.5, pp.22–27, Theorem 5.10, p.47.
- K2: Thomas Krämer, [Characteristic cycles and the microlocal geometry of the Gauss map, II](https://arxiv.org/abs/1807.01929v2), arXiv v2 (2019), Definitions 1.2.2 and 2.2.1, Proposition 1.3.3, Theorems 2.1.1, 2.2.3 and 2.3.1 with Remark 2.3.2, Corollaries 2.1.2, 2.2.2 and 2.2.4, Lemma 5.2.2 and Proposition 6.1.1.
- EHS: Hélène Esnault, Phùng Hô Hai and Xiaotao Sun, [On Nori’s fundamental group scheme](https://page.mi.fu-berlin.de/esnault/preprints/helene/83nori070514c.pdf), author version (2007), Appendix A, Theorem A.1, pp.20–21.
- W: Rainer Weissauer, [A remark on rigidity of BN-sheaves](https://arxiv.org/abs/1111.6095v1), arXiv v1 (2011), unnumbered proposition, pp.1–2.
- CDK: Eduardo Cattani, Pierre Deligne and Aroldo Kaplan, [On the locus of Hodge classes](https://arxiv.org/abs/alg-geom/9402009v1), arXiv v1 (1994), Theorem 1.1 and Corollary 1.3, p.2.
- JV: J. S. Milne, [Jacobian varieties](https://www.jmilne.org/math/xnotes/JVs.pdf), corrected author notes (2021), Proposition 6.1, pp.19–20, and Theorem 12.1, p.38.
- BSS: Bhargav Bhatt, Christian Schnell and Peter Scholze, [Vanishing theorems for perverse sheaves on abelian varieties, revisited](https://arxiv.org/abs/1702.06395), arXiv v1 (2017), Theorem 1.1, p.1, Lemma 2.6, Proposition 2.7, Lemma 2.8, Remark 2.9 and Corollary 2.10, pp.4–5. Published in Selecta Mathematica 24 (2018), 63–84; not collated.
- Sch: Christian Schnell, [Holonomic D-modules on abelian varieties](https://arxiv.org/abs/1307.1937v1), arXiv v1 (2013), Definition 2.3, Theorems 3.2 and 4.1, Theorems 7.3 and 7.6 and Corollary 7.5, §10 with Theorems 10.3 and 10.5, Theorems 15.1 and 16.1, Proposition 16.2, Definition 17.3, Theorem 17.4 and Lemmas 17.5–17.6, Theorem 19.1, Proposition 19.2, Theorem 21.1, Corollary 21.5, Proposition 22.1, Proposition 25.1 and Corollary 25.3. Published in Publications mathématiques de l'IHÉS 121 (2015), 1–55, with different section numbering; not collated.
- Sim: Carlos Simpson, [Subspaces of moduli spaces of rank one local systems](https://doi.org/10.24033/asens.1675), Annales scientifiques de l'École normale supérieure 26 (1993), 361–401, Theorem 3.1(c), Corollary 3.2, Theorem 3.3, Proposition 3.4 and Theorem 6.1; journal pagination.
- Stacks: The Stacks project authors, [The Stacks project, chapter Divisors](https://stacks.math.columbia.edu/tag/062Y), version of 2026, Lemma 19.9 (tag 062Y), p. 40.
