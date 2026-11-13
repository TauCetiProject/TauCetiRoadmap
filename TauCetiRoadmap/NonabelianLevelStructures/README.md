# Roadmap: nonabelian level structures on elliptic curves

**Summary.** For a finite group G, an elliptic G-level structure is a connected G-torsor over a once-punctured elliptic curve, and its moduli stack M(G) is a finite étale cover of the elliptic moduli stack 𝓜(1) whose geometric fibre is the set Epi^ext(F₂, G) of surjections from the free group of rank two modulo inner automorphisms of G. ArithmeticDynamicsPartII §6.0 constructs these stacks, their admissible compactification and the coarse degree congruence of Chen's Theorem 3.5.1. This roadmap develops the rest of Chen's theory on top of that construction: the ramification and branch data of the level covers, their functoriality and cofinality, the complete description of their cusps by finite group data, the vertical automorphism groups of cuspidal covers, and from these the combinatorial congruence, which says that the order of the commutator class, divided by two explicit cusp and centralizer obstructions, divides the size of every Out⁺(F₂)-orbit on Epi^ext(F₂, G)/⟨γ₋ᵢ⟩, the quotient by the central element γ₋ᵢ of Out⁺(F₂) (Chen, Theorem 4.10.5). It deduces the congruence for nonabelian finite simple groups other than PSL₂(𝔽_q), develops the integral rank-two trace coordinates over every commutative ring, computes the vertical automorphisms of SL₂(𝔽_q)-level structures, and ends with the modular geometry of the trace −2 Markoff level curves: their two components, branch data, genus, finiteness of j-invariants over number fields, large projective monodromy and noncongruence.

## Scope and ownership

This roadmap owns: theorems about the reduced ramification divisor and the Higman invariant of an elliptic admissible G-cover; the branch cycles of the level cover over j = 0, 1728, ∞ and the Galois correspondence between finite étale covers of 𝓜(1) over an algebraically closed field of characteristic zero and finite SL₂(ℤ)-sets; boundary deformation and density; the properness, surjectivity, fibre description and functoriality in G of the quotient-cover maps, and absolute level structures; cofinality; the finite description of cusps (gluing data, precuspidal data, cusp graphs, the invariant set I(G), the standard cusp, classification and inversion); cusp automorphism groups and the representability criterion; the obstruction pair m′_c, d′_c and the combinatorial congruence; the square-subgroup lemma and the simple-group congruence; the integral rank-two character scheme, the outer action in trace coordinates over every commutative ring, the matrix-algebra criterion, trace strata, admissible traces, the diagonal outer group with its bound |D(q, G)| ≤ 2 for absolutely irreducible non-dihedral images, and normalizers of SL_n(𝔽_q); the epimorphic trace loci over every finite field, the branch cycles in trace coordinates, rotation slices at arbitrary level over every finite field, the exact rotation order, the containment of Z(SL₂(𝔽_q)) in every absolutely irreducible subgroup and the vertical automorphisms of SL₂(𝔽_q)-level structures; and the trace −2 Markoff modular geometry of Layer 7: the two components, their branch data and genus, finiteness of j-invariants, the projective absolute quotient, its large monodromy and the noncongruence of the associated subgroups of SL₂(ℤ).

It leaves the following to named roadmaps.

- ArithmeticDynamicsPartII §6.0 owns the specialization of the admissible-cover stack to (g, n) = (1, 1), written Adm(G) here; the center-rigidified level stack, written M(G) here; its admissible compactification M̄(G); their coarse spaces and forgetful maps to the j-line; the comparison of geometric components with Out⁺(F₂)-orbits on Epi^ext(F₂, G); the cotangent line at a marked ramification point and its character exponent m; the coarse degree congruence `12·ord(c) ∣ m·d·deg(X → P¹_j)` of Chen's Theorem 3.5.1; the vertical automorphism group Z(G) ∩ ⟨c⟩ at a smooth ramification point and the bound of the full character exponent by 12 times the vertical one; the general prime-power degree congruence of Chen's Corollary 4.12.5(a), whose proof route there argues through the case j = 0 of Chen's Lemma 4.12.2 without stating it as a target (the bounds on m′_c and d′_c that this case gives, in terms of the obstruction pair of §3.2, are stated only here, in §4.1, and §4.2 uses them and §3.3 rather than Corollary 4.12.5(a)); the quotient-cover map M(H) → M(H/N) for a normal subgroup N, its compatibility with compactification, inner conjugacy and γ₋ᵢ, and the divisibility of coarse degrees along it; and, for absolutely irreducible non-dihedral H ≤ SL₂(𝔽_q) and a component whose ramification element c is noncentral of trace ≠ 2, the bounds `m ∣ 24` (odd q) or `m ∣ 12` (even q) and, for semisimple c, the centralizer bound `d ∣ |C_H(c)/⟨c⟩|`. Its §6.1 owns the finite-field trace dictionary (absolutely irreducible pairs modulo GL₂(𝔽_q) for commutator trace t ≠ 2, and the non-dihedral locus as the triples with at least two nonzero coordinates) and the prime-field trace −2 equality of the non-dihedral and epimorphic loci with X*(𝔽_p) for primes p ≥ 3, §6.2 the trace order n_q(t) as `traceOrder`, §§6.3–6.4 the generalized Markoff orbit congruences, §6.5 the oriented Markoff orbit divisibility and §6.6 oriented transitivity and geometric connectedness of the absolute trace −2 level stack. Its §1.4 owns Chen's divisibility theorem for Vieta-stable sets (Martin's proof), §§2.1–2.2 the rotation slices and their periods on the prime-field zero level, §2.3 the count of X*(𝔽_p), §2.4 the divisor sum Φ and the rotation orbit count, §§3.6–3.7 and 4.2 the giant orbit, the sparse and then finite exceptional set, and §§7.2–7.4a the sign blocks, the Meiri–Puder condition MP(p), primitivity of the block action and alternating containment at primes congruent to 1 modulo 4.
- InverseGaloisAndArithmeticFundamentalGroups §IG.5.4 owns balanced admissible G-covers of marked curves, the proper admissible-cover stack and the equivalence with stable marked G-curves, whose marking over a ramified label is the reduced ramification divisor; §IG.3.2 owns exterior epimorphisms and the action of Out(F_r) on them; §IG.3.1 owns Riemann existence for punctured curves, and ComplexComparisonPartII §C6.2 Riemann existence for complex schemes locally of finite type (`riemannExistence`); §§IG.1.2–IG.1.4 own tame tangential fibres, invariance under algebraically closed base extension in characteristic zero and the moduli outer action.
- AnabelianGeometryAndNonabelianChabauty §§1.1–1.2 own tangential fibre functors on P¹ ∖ {0, 1, ∞}, local inertia orbits on branches, good paths and the existence of symmetric good paths.
- StableReduction owns nodes, normalization and dual graphs with loops (Layer 1), the relative dualizing sheaf of nodal curves (Layer 2), and prestable and stable pointed curves with external and self-clutching (Layer 3).
- SchemeAndStackFoundations owns Deligne–Mumford stacks (§1.19), quotient stacks (§1.21), coarse moduli spaces (§1.23), Riemann–Hurwitz for curves (§3.2), versal deformation of a node (§4.6) and the stack of stable pointed curves (§4.15). AlgebraicModuliForArithmeticGeometry §5.1 owns rigidification along inertia subgroups and its vertical-kernel representability criterion, and §8.3 the comparison of framed deformations with completed local rings and atlas presentations. ModularCurvesPartII owns full level structures and the Deligne–Rapoport level stacks (§§3.1, 3.12) and the compactified coarse j-line (§3.11).
- ArithmeticGaloisRepresentations owns absolute irreducibility in Burnside's form (§1.7), normal subgroups and automorphisms of PSL₂ and PGL₂ (§4.3) and Dickson's classification (§4.4). ClassicalArithmeticCompletion owns the Markoff level surfaces V_k and the trace-coordinate surface X (§4.58), the Markoff–Hurwitz moves with permutations and even sign changes (§4.57) and the finite-field point count (§4.76). Tau Ceti owns the Fricke identity `Matrix.SpecialLinearGroup.trace_commutatorElement_fin_two`.
- NoncongruenceModularForms owns the monodromy group PSL₂(ℤ)/core(Γ̄) of a finite-index subgroup Γ̄ ≤ PSL₂(ℤ) (§1.1) and the composition-factor obstruction (§3.5): when the preimage of Γ̄ in SL₂(ℤ) is a congruence subgroup, every nonabelian simple composition factor of that monodromy group is PSL₂(𝔽_ℓ) for a prime ℓ ≥ 5 dividing the level, so a subgroup of index n ≥ 6 with monodromy group A_n or S_n is noncongruence. §7.7 consumes it, and proves only the passage from point stabilizers in SL₂(ℤ) to their images in PSL₂(ℤ).
- MappingClassGroupsAndCanonicalRepresentations owns the analytic orbifold fundamental group of the moduli stack of pointed curves (§2.3, "Teichmüller uniformization of the pointed moduli stack") and the representation schemes and character varieties of finitely presented groups over ℂ (§1.4); §5.1 here is their rank-two, determinant-one case for the free group of rank two, taken over every commutative ring with its explicit trace coordinates, and over ℂ it is that section's M₂(F₂)_χ for trivial χ. HeightsRationalPointsAndObstructions §4.6 owns Faltings's finiteness theorem. BelyiMaps Layer 10 §10.4 owns Belyi's theorem, implemented in Tau Ceti as `TauCeti.IsFunctionField.exists_isAlgebraicBelyiPair`. CFSGBasicProperties owns the properties of the groups on the CFSG list (A0); Vdovin's bound on abelian subgroups of every nonabelian finite simple group other than PSL₂(𝔽_q), which rests on the classification of finite simple groups, is requested from it as gap:vdovin-abelian-subgroups and is not proved here.

The stack Hodge degree deg λ = 1/24 and the conormal power isomorphism along a ramified section enter only the proof of Chen's Theorem 3.5.1, which ArithmeticDynamicsPartII §6.0 states; they belong to that proof and are not separate targets here.

## Conventions

G is a finite group. Bases lie over ℤ[1/|G|]; every characteristic-zero or algebraically closed hypothesis is stated in the target that uses it. Right G-actions are used on covers and left fundamental-group actions on fibres. The commutator is [x, y] = x y x⁻¹ y⁻¹, Mathlib's `commutatorElement`. For an element c, |c| is its order (Mathlib `orderOf`); a conjugacy class is named as such. Valuations v_ℓ are taken of positive integers only (Mathlib `Nat.factorization`).

F₂ is free on a, b, identified with the fundamental group of a once-punctured complex torus by a positively oriented basis; with these conventions the positive peripheral loop is [b, a]. A surjection φ : F₂ → G is recorded by its generating pair (φ(a), φ(b)); Epi^ext(F₂, G) is the set of surjections modulo simultaneous conjugation in G (InverseGaloisAndArithmeticFundamentalGroups §IG.3.2). Aut(F₂) acts by precomposition, which is a right action; its polynomial realization in trace coordinates is therefore an anti-homomorphism. InverseGaloisAndArithmeticFundamentalGroups §IG.3.2 writes the same action as the left action e ↦ e ∘ α⁻¹; the orbits, and hence every statement here, agree. Out(F₂) ≅ GL₂(ℤ) through abelianization, and Out⁺(F₂) is the preimage of SL₂(ℤ). The central element γ₋ᵢ : (a, b) ↦ (a⁻¹, b⁻¹) maps to −I. The positive transvections (a, b) ↦ (a, a b) and (a, b) ↦ (b a, b) have abelianization matrices `[[1, 1], [0, 1]]` and `[[1, 0], [1, 1]]` (columns are the images of a and b); they generate SL₂(ℤ).

Adm(G) is the stack of elliptic admissible G-covers before rigidification, Adm⁰(G) its smooth-target locus, M(G) the smooth level stack and M̄(G) its center-rigidified compactification (ArithmeticDynamicsPartII §6.0). A subscript X denotes a connected component; X^coarse its coarse curve. Every j-degree is the generic degree of a map of coarse curves. Admissible covers are finite and balanced at nodes; flatness at a ramified node is not required: the index-two chart has generic rank two and special fibre of length three.

A compatible system of primitive roots of unity (ζ_n) is fixed wherever a Higman invariant is formed; over ℂ it is ζ_n = exp(2πi/n). Changing the system by a coprime power changes the Higman class by that power; no invariance under arbitrary coprime powers is asserted.

The trace-coordinate surface at level t + 2 is `x² + y² + z² − x y z = t + 2` (ClassicalArithmeticCompletion §4.58 with k = t + 2), so the commutator trace t = −2 is the Markoff surface X and X*(R) removes the origin. Γ is generated by the Vieta moves and the coordinate permutations, without sign changes (ArithmeticDynamicsPartII §0.1); the group of ClassicalArithmeticCompletion §4.57 adjoins the even sign changes, which is a strict enlargement when 4 ≠ 0 in the coefficient ring and no enlargement in characteristic two (§5.2); the two are compared explicitly where both occur. A trace t is split semisimple when `X² − t X + 1` has two distinct roots in the field and nonsplit when it is irreducible; this works in characteristic two, where a discriminant-square test does not. Invariants under GL₂ as an algebraic group are invariants of the coaction of the group scheme.

Convention witnesses.

- The Fricke normalization: for A = `[[1, 1], [0, 1]]`, B = `[[1, 0], [1, 1]]` the traces are (2, 2, 3) and tr[A, B] = 4 + 4 + 9 − 12 − 2 = 3; for A = B = I they are (2, 2, 2) and the commutator trace is 2.
- The peripheral orientation: over 𝔽₇, if φ([a, b]) is conjugate to `[[−1, 1], [0, −1]]`, then the Higman element φ([b, a]) = φ([a, b])⁻¹ is conjugate to `[[−1, −1], [0, −1]]`, which lies in the other noncentral trace −2 class because −1 is not a square modulo 7. Choosing [a, b] in place of [b, a] exchanges the two Higman classes.
- The anti-action: precomposition satisfies φ ∘ (α ∘ β) = (φ ∘ α) ∘ β, so the trace transformation of α ∘ β is that of α followed by that of β. For r : (a, b) ↦ (a⁻¹, b) and t : (a, b) ↦ (a⁻¹, a b), with trace transformations (x, y, z) ↦ (x, y, x y − z) and (x, y, z) ↦ (x, z, y), the automorphism r ∘ t sends a ↦ a and b ↦ a⁻¹ b, and the triple (2, 3, 5) of φ becomes (2, 1, 3) for φ ∘ (r ∘ t): first the move of r, (2, 3, 5) ↦ (2, 3, 1), then that of t. Composing the moves in the other order gives (2, 5, 3) ↦ (2, 5, 7).
- The rotation: γ∞ (a, b) ↦ (a, a b) acts on trace coordinates by (x, y, z) ↦ (x, z, x z − y), so (3, 3, 3) ↦ (3, 3, 6).

## Exact supplier contracts

### From Mathlib

`commutatorElement` (`Mathlib/Algebra/Group/Commutator.lean`) is x y x⁻¹ y⁻¹. `orderOf` (`Mathlib/GroupTheory/OrderOfElement.lean`) is zero for elements of infinite order, which do not occur in the finite groups here. `Subgroup.centralizer` (`Mathlib/GroupTheory/Subgroup/Centralizer.lean`) has membership `h * g = g * h` for every h of the given set; the centralizer of a generating set equals that of the generated subgroup. `Subgroup.zpowers` and `Subgroup.closure` are the cyclic and generated subgroups. `Equiv.prodShear`, `Equiv.prodComm` (`Mathlib/Logic/Equiv/Prod.lean`), `Equiv.mulLeft` (`Mathlib/Algebra/Group/Units/Equiv.lean`) and `Equiv.inv` (`Mathlib/Algebra/Group/Equiv/Basic.lean`) give the permutations of pairs used in §3.1. `MulAction.toPermHom` (`Mathlib/Algebra/Group/Action/End.lean`) and the diagonal action of `ConjAct G` on `G × G` give simultaneous conjugation; `MulAction.orbit`, `MulAction.orbitRel` and `MulAction.orbitRel.Quotient` (`Mathlib/GroupTheory/GroupAction/Defs.lean`) give orbits and orbit spaces; an orbit is the range of the orbit map and carries no transitivity assertion. `orbit_subgroup_eq_rightCoset` (`Mathlib/GroupTheory/Coset/Basic.lean`) identifies the orbit of g under left multiplication by a subgroup H with the right coset H g, the coset convention of §§1.3 and 1.7. `Finset.lcm` is 1 on the empty finset (`Finset.lcm_empty`, `Mathlib/Algebra/GCDMonoid/Finset.lean`). `Nat.factorization` (`Mathlib/Data/Nat/Factorization/Defs.lean`) is used only on positive integers. `IsSimpleGroup` (`Mathlib/GroupTheory/Subgroup/Simple.lean`) includes nontriviality but not nonabelianness. `Matrix.SpecialLinearGroup`, `Matrix.trace` and `Matrix.ProjectiveSpecialLinearGroup` (`Mathlib/LinearAlgebra/Matrix/ProjectiveSpecialLinearGroup.lean`, the quotient of SL by its center) are the native matrix groups. `FreeGroup`, `Nat.totient`, `Function.minimalPeriod`, `Monoid.exponent` and `Algebra.adjoin` keep their library meanings. `alternatingGroup.isSimpleGroup` (`Mathlib/GroupTheory/SpecificGroups/Alternating/Simple.lean`) requires at least five points. `Matrix.GeneralLinearGroup` is the group of units of the matrix ring, `Algebra.TensorProduct.productMap` (`Mathlib/RingTheory/TensorProduct/Maps.lean`) is the algebra map out of a tensor product of commutative algebras given by two algebra maps, with `Algebra.TensorProduct.includeLeft` and `Algebra.TensorProduct.includeRight` the two factor inclusions, `MvPolynomial.aeval` the evaluation map of a polynomial algebra and `AlgHom.range` the image subalgebra. `CongruenceSubgroup.Gamma` and `CongruenceSubgroup.IsCongruenceSubgroup` (`Mathlib/NumberTheory/ModularForms/CongruenceSubgroups.lean`) are the principal congruence subgroups and the predicate that a subgroup of SL₂(ℤ) contains one of nonzero level; they are used unchanged. `Subgroup.center` (`Mathlib/GroupTheory/Subgroup/Center.lean`), `Subgroup.map` (`Mathlib/Algebra/Group/Subgroup/Map.lean`) and `QuotientGroup.mk'` (`Mathlib/GroupTheory/QuotientGroup/Defs.lean`) give the image of a subgroup of SL₂(𝔽_q) in PSL₂(𝔽_q) = SL₂(𝔽_q)/Z; `DihedralGroup` n (`Mathlib/GroupTheory/SpecificGroups/Dihedral.lean`) has order 2n, so DihedralGroup 1 is cyclic of order 2 and DihedralGroup 2 is the Klein four group; `Submodule.span` (`Mathlib/LinearAlgebra/Span/Defs.lean`) gives the 𝔽_q-span of a set of matrices, used for absolute irreducibility in Burnside's form.

### From Tau Ceti

`Matrix.SpecialLinearGroup.trace_commutatorElement_fin_two` (`TauCeti/LinearAlgebra/Matrix/Trace/FinTwo.lean`) is the Fricke identity tr[A, B] = x² + y² + z² − x y z − 2 for A, B ∈ SL₂(R) over every commutative ring, with (x, y, z) = (tr A, tr B, tr AB). `MonoidHom.exists_comp_eq_and_closure_range_eq_top_of_surjective` (`TauCeti/GroupTheory/Gaschutz.lean`) is Gaschütz's lemma: along a surjection f : G → H from a finite group G generated by an ι-tuple, ι finite, every generating ι-tuple of H lifts along f to a generating ι-tuple of G. `TauCeti.PermutationTriple` (`TauCeti/Combinatorics/PermutationTriple/Basic.lean`) is a triple of permutations of `Fin n` with σ∞ σ₁ σ₀ = 1; `TauCeti.PermutationTriple.eulerChar` and `TauCeti.PermutationTriple.genus` (`TauCeti/Combinatorics/PermutationTriple/EulerCharacteristic.lean`) are the sum of the cycle counts minus n and the truncated combinatorial genus, and `TauCeti.PermutationTriple.IsConnected.two_sub_two_mul_genus` gives 2 − 2g = χ for a connected triple; the genus has geometric meaning only for connected triples. `TauCeti.IsFunctionField.exists_isAlgebraicBelyiPair` (`TauCeti/FieldTheory/FunctionField/Belyi/Existence.lean`) is Belyi's existence theorem in function-field form: over a field k algebraic over ℚ, a function field F/k with exact constant field k (`IsIntegrallyClosedIn k F`) has an element β transcendental over k such that F over k(β) is an algebraic Belyi pair, branched over at most 0, 1, ∞. `TauCeti.SpecialLinear.coordinateHopfAlgebra` (`TauCeti/Algebra/AlgebraicGroup/SpecialLinear/Basic.lean`) is the coordinate Hopf algebra 𝒪(SLₙ) over every commutative ring, including the zero ring, the quotient of 𝒪(GLₙ) by the ideal generated by the generic determinant minus one; `TauCeti.SpecialLinear.coordinateMap` is the quotient map from 𝒪(GLₙ), `TauCeti.GeneralLinear.genericMatrix` (`TauCeti/Algebra/AlgebraicGroup/GeneralLinear/Coordinate/HopfAlgebra.lean`) the generic matrix of GLₙ, and `TauCeti.SpecialLinear.pointsMulEquiv` the natural identification of the R-algebra maps 𝒪(SLₙ) → S with `Matrix.SpecialLinearGroup (Fin n) S`, a point taking the value M i j on the (i, j) entry of the generic matrix (`TauCeti.SpecialLinear.ofConv_pointsMulEquiv_symm_genericMatrix`). No polynomial presentation, smoothness or invariant theory of 𝒪(SLₙ) is assumed from that file. `TauCeti.SpecialLinear.coordinateHopfAlgebraBaseChangeIso` (`TauCeti/Algebra/AlgebraicGroup/SpecialLinear/BaseChange.lean`) identifies S ⊗_R 𝒪(SLₙ)_R with 𝒪(SLₙ)_S compatibly with the generic matrices (`TauCeti.SpecialLinear.coordinateHopfAlgebraBaseChangeIso_hom_tmul_coordinateMap`, `TauCeti.GeneralLinear.coordinateHopfAlgebraBaseChangeIso_hom_genericMatrix`). `TauCeti.ComoduleAlgebra.coinvariants` (`TauCeti/Algebra/Bialgebra/ComoduleAlgebra.lean`) is the subalgebra of coinvariants of a comodule algebra, the equalizer of the coaction and a ↦ a ⊗ 1; it is the coaction-equalizer description of the invariants of §5.1, and it proves no generation theorem. `TauCeti.CoveringSpace.monodromyFunctor` (`TauCeti/Topology/Covering/Monodromy/Basic.lean`) is the monodromy functor from covering spaces of a topological space X to functors from the fundamental groupoid of X to sets, sending a cover to the action of paths on its fibres; it is topological, is the input of §0.3 for covering spaces, and proves no Riemann existence statement for stacks.

### From TauCetiRoadmap.ArithmeticDynamicsPartII

§6.0: for every finite group H over ℤ[1/|H|], Adm(H), Adm⁰(H), M(H) and M̄(H) with M(H) → 𝓜(1) representable finite étale; coarse formation compatible with the base changes of Chen's Theorem 2.5.2(2); geometric fibres Epi^ext(F₂, H) with components the Out⁺(F₂)-orbits; the coarse degree congruence `12·ord(c) ∣ m·d·deg` on a component with ord(c) > 1 and a chosen component of the reduced ramification divisor; the vertical group Z(H) ∩ ⟨c⟩ at a smooth ramification point, the embedding of boundary vertical automorphisms into the cusp automorphism group and the bound of the full exponent by 12 times the vertical one; Chen's Corollary 4.12.5(a) in degree form; for a normal subgroup N of H over ℤ[1/|H|], the quotient-cover map M(H) → M(H/N), compatible with compactification, inner conjugacy and γ₋ᵢ, whose nonempty coarse components over an algebraically closed field of characteristic zero map finitely and dominantly onto their images; and, for q ≥ 3, H ≤ SL₂(𝔽_q) absolutely irreducible and not dihedral, and a nonempty component whose ramification element c is noncentral of trace ≠ 2, `m ∣ 24` (odd q) or `m ∣ 12` (even q) on a ramification component and, for semisimple c, `d ∣ |C_H(c)/⟨c⟩|`. §6.1: for a finite field and t ≠ 2 the trace map identifies absolutely irreducible pairs modulo GL₂-conjugacy with the points of the level t + 2 surface, the non-dihedral locus is the set of triples with at least two nonzero coordinates, for every prime p ≥ 3 the trace −2 non-dihedral and epimorphic loci both equal X*(𝔽_p), and the Aut⁺(F₂)-image is normal of index at most two in the image of Aut(F₂). §6.2: `traceOrder`, the order of the companion matrix of `X² − t X + 1`, with n_q(2) = p and n_q(−2) = 2p for odd q and the split and nonsplit divisibilities. §§6.3–6.6, §1.4, §§2.1–2.4, §§3.6–3.7, §4.2 and §§7.2–7.4a as listed in Scope and ownership; in particular the predicate MP(p) of §7.3 and the block group Q_p on Y*(p) = X*(𝔽_p)/(even sign changes) of §7.2.

What ArithmeticDynamicsPartII must provide (gap:markoff-alternating-three-mod-four): for primes p ≡ 3 (mod 4) with Q_p transitive on Y*(p) and MP(p), the block group Q_p contains the alternating group of Y*(p) (Meiri–Puder, Theorem 1.4, from the primitivity of ArithmeticDynamicsPartII §7.4 and the Guralnick–Magaard classification of primitive groups containing an element with at least half the points fixed).

### From TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups

§IG.5.4, "Admissible G-covers of marked curves" and "Admissible stacks and stable marked G-curves": balanced admissible G-covers over ℤ[1/|G|], their base change, the connected and smooth loci, inverse node characters, the proper Deligne–Mumford admissible stack for 2g − 2 + n > 0, the equivalence with stable marked G-curves marking the reduced ramification divisor over a ramified label and the whole étale fibre over an unramified one, and the vertical automorphism group Z(G) of a connected smooth cover. §IG.3.2, "Exterior epimorphisms and T-systems": exterior epimorphisms as the classes of surjections F_r → G modulo inner automorphisms of G, the action of Out(F_r) after the inner quotient, and generating tuples as surjections. §IG.3.1, "Riemann existence for punctured curves", with ramification indices read from cycle lengths. §IG.1.2, "Tame tangential fibres at a boundary point", with the cyclic inertia and its peripheral character convention. §IG.1.3, "Invariance under algebraically closed base extension in characteristic zero". §IG.1.4, "Exactness in families and the moduli outer action", including the generic stabilizer ±1 of 𝓜(1,1).

### From TauCetiRoadmap.ComplexComparisonPartII

§C6.2, "Riemann existence for complex schemes locally of finite type": `riemannExistence`, the equivalence, given by analytification, between finite étale schemes over a scheme X locally of finite type over ℂ and finite topological covering spaces of its analytification, compatible with pullback, fibre products and connected components. §0.3 applies it to a smooth affine curve and its automorphisms; no statement for stacks is taken from it.

### From TauCetiRoadmap.AnabelianGeometryAndNonabelianChabauty

§1.1, "Tangential fibre functors and their analytic comparison": the fibre functor F_t at a tangent vector, its inertia generator γ_t for a compatible root system, the positively oriented loop over ℂ, and the involution ι(z) = 1/z exchanging the functors at t₀ and ι*t₀. §1.2, "Local inertia orbits on branches", "Good path between tangential basepoints", "Symmetric tangential path" and "Existence of symmetric good paths": a good path δ : t₀ → t∞ makes γ₀ and δ⁻¹γ∞δ topological generators of π₁(P¹ ∖ {0, 1, ∞}) with the ordered relation through γ₁, and symmetric good paths exist for t∞ = ι(t₀).

### From TauCetiRoadmap.StableReduction

Layer 1: normalization, the conductor and the dual graph of a nodal curve with loops allowed and valence counted by half-edges. Layer 2: the relative dualizing sheaf of nodal curves and effective Cartier divisors in the smooth locus. Layer 3: pointed prestable and stable families, their smooth locus and normalization, and external and self-clutching with their dual-graph and pushout universal properties.

### From TauCetiRoadmap.SchemeAndStackFoundations

§1.19 Deligne–Mumford stacks; §1.20 `setoid_criterion`, that an algebraic stack with trivial inertia is an algebraic space; §1.21 quotient stacks, with the quotient map a torsor under the acting group; §1.23 coarse moduli spaces, Keel–Mori and their base-change hypotheses; §3.2 `scheme_riemann_hurwitz` for finite morphisms of smooth proper curves, with equality in the tame case; §4.6 `node_versal_deformation`, the hull Λ[[t]] of the split node with versal family u v = t; §4.15 the proper Deligne–Mumford stack of stable pointed curves.

What SchemeAndStackFoundations must provide (gap:equivariant-node-smoothing): for a stable marked G-curve over an algebraically closed field of characteristic prime to |G| with tame balanced action, whose target has a single node with stabilizer of order r, the equivariant deformation functor is unobstructed and its framed elliptic deformation map on hulls is Λ[[T]] → Λ[[t]], T ↦ t^r, with r = 1 for a smooth object.

### From TauCetiRoadmap.AlgebraicModuliForArithmeticGeometry

§5.1, "Inertia subgroups and rigidification": `ArithmeticModuli.Rigidification.stack` for a flat finitely presented subgroup of inertia, and `ArithmeticModuli.Rigidification.vertical_kernel`: when the vertical inertia kernel of X → Y is such a subgroup, the rigidification factors X → Y through a representable morphism. §8.3, "Exact completion and tangent interfaces": `schemeFramedCompletionEquiv` and `completedAtlasPresentation_equivalence`.

What AlgebraicModuliForArithmeticGeometry must provide (gap:geometric-point-completion): at a geometric point of a locally Noetherian Deligne–Mumford stack whose residue field is algebraically closed but not finite over the residue field of a Cohen ring Λ, the universal framed deformation ring over Λ is identified with the completed strictly henselian local ring, retaining the point identification and the residual automorphism group.

### From TauCetiRoadmap.ModularCurvesPartII

§3.1 integral full level structures and §3.12 the Deligne–Rapoport level-H stack: the compactified full level (ℤ/n)² problem over ℤ[1/n] with its Weil-pairing components. §3.11, "The compactified coarse j-line": j : X(1) → P¹ is the coarse space of the compactified elliptic stack.

### From TauCetiRoadmap.ArithmeticGaloisRepresentations

§1.7 absolute irreducibility over a field in Burnside's form: the k-span of the image is the full endomorphism algebra. §4.3: normal subgroups of GL₂(𝔽_q), PSL₂ and PGL₂, and Aut PSL₂(𝔽_q) = PGL₂(𝔽_q) ⋊ Gal(𝔽_q/𝔽_p) for q ≥ 4. §4.4, "Dickson's classification": a finite subgroup of PGL₂(k̄) fixes a point of P¹, or is conjugate to a subfield PSL₂ or PGL₂, or is dihedral, or is A₄, S₄ or A₅, with genuine subfield embeddings.

### From TauCetiRoadmap.LanglandsParameterStacks

§2.1, "Coarse parameter quotients": the coarse quotient `Spec A^Ĥ` by the coaction equalizer and the unique factorization of invariant morphisms through it. §3.8, "Trace and excursion character comparison": the generation of invariant functions on tuples by trace functions over an algebraically closed field of characteristic zero.

What LanglandsParameterStacks must provide (gap:integral-rank-two-invariants): for every commutative ring R, the invariants of the GL₂-scheme coaction on the coordinate ring of pairs of 2 × 2 matrices are generated by traces of words and determinants, their formation commutes with arbitrary base change R → S, and restriction to pairs in SL₂ × SL₂ is surjective on invariants.

### From TauCetiRoadmap.ClassicalArithmeticCompletion

§4.58: the Markoff cubic M(x) = x₁² + x₂² + x₃² − x₁x₂x₃ over a commutative ring R, its level sets V_k(R) (the declaration `markoffLevelSet`), and the trace-coordinate surface X(R) := V_0(R), with X*(R) = X(R) ∖ {0}. §4.57: `markoffHurwitzMove` and `markoffHurwitzGroup`, the group generated by the moves, the coordinate permutations and the even sign changes. §4.76: the point count of x₁² + x₂² + x₃² − α x₁ x₂ x₃ = β over 𝔽_p.

### From TauCetiRoadmap.MappingClassGroupsAndCanonicalRepresentations

§2.3, "Teichmüller uniformization of the pointed moduli stack": for 2g − 2 + n > 0 the analytic moduli stack M(g, n)^an is the orbifold quotient of the contractible Teichmüller space by the pure mapping class group, so its orbifold fundamental group is that group, as an orbifold group rather than the fundamental group of a coarse space; the stabilizers of the action on Teichmüller space are the automorphism groups of the pointed curves; in genus one with one point the Teichmüller space is the upper half-plane and the orbifold group is SL₂(ℤ), with generic stabilizer ±1.

What MappingClassGroupsAndCanonicalRepresentations must provide (gap:punctured-torus-nielsen): Nielsen's isomorphism Out(F₂) ≅ GL₂(ℤ) through abelianization with Out⁺(F₂) the preimage of SL₂(ℤ), the identification of the orbifold fundamental group of 𝓜(1,1)^an with Out⁺(F₂) for a positively oriented basis (a, b) of the punctured torus with boundary loop [b, a], and the images in Out⁺(F₂) of the standard loops of the j-line around j = 0, 1728, ∞, namely the classes of (a, b) ↦ (a b⁻¹, a), (a, b) ↦ (b⁻¹, a) and (a, b) ↦ (a, a b).

What MappingClassGroupsAndCanonicalRepresentations must provide (gap:asada-cofinality): for every finite-index subgroup Γ of Out⁺(F₂) there are a finite group G generated by two elements and a class e ∈ Epi^ext(F₂, G) whose stabilizer in Out⁺(F₂), for the action by precomposition, is contained in Γ (Asada, §7; Chen 2018, Corollary 3.4.2, the stabilizer form of the congruence subgroup property of Aut(F₂)).

### From TauCetiRoadmap.HeightsRationalPointsAndObstructions

§4.6, "Mordell over number fields": `mordell_finite`, finiteness of the rational points of a smooth projective geometrically connected curve of genus at least two over a number field.

### From TauCetiRoadmap.BelyiMaps

Layer 10, §10.4, "A curve over ℚ̄ admits a Belyi map": for a function field F/ℚ̄ there is a nonconstant β ∈ F with F/ℚ̄(β) finite separable and branched over at most 0, 1, ∞; its function-field form over any algebraic extension of ℚ is the Tau Ceti declaration `TauCeti.IsFunctionField.exists_isAlgebraicBelyiPair` listed above.

### From TauCetiRoadmap.NoncongruenceModularForms

§1.1, "The modular triple": for a finite-index subgroup Γ̄ ≤ PSL₂(ℤ) of index n with a labelling of PSL₂(ℤ)/Γ̄ by n points, the monodromy group is the image of PSL₂(ℤ) in the permutations of the cosets, isomorphic to PSL₂(ℤ)/core(Γ̄). §3.5, "The order obstruction", its composition-factor obstruction `compositionFactor_of_isCongruenceSubgroup`: if the preimage of Γ̄ in SL₂(ℤ) is a congruence subgroup (Mathlib `CongruenceSubgroup.IsCongruenceSubgroup`), every nonabelian simple composition factor of that monodromy group is isomorphic to PSL₂(𝔽_ℓ) for a prime ℓ ≥ 5 dividing the level of Γ̄; and its consequence that, A_n for n ≥ 6 being isomorphic to no PSL₂(𝔽_ℓ), a subgroup of index n ≥ 6 whose monodromy group is A_n or S_n is noncongruence. Both are consumed as stated, for subgroups of PSL₂(ℤ); the comparison with point stabilizers in SL₂(ℤ) is proved in §7.7.

### From TauCetiRoadmap.CFSGBasicProperties

A0 assembles the finiteness and simplicity of every group on the CFSG list; it does not prove that every finite simple group is on the list, so on its own it says nothing about an arbitrary finite simple group.

What CFSGBasicProperties must provide (gap:vdovin-abelian-subgroups): for every nonabelian finite simple group G, in every universe, that is not isomorphic to PSL₂(𝔽_q) for any prime power q, every abelian subgroup of G has order strictly less than |G|^(1/3) (Vdovin, Theorem A); the contract concerns every finite simple group, not only the listed ones, so it includes the passage from the list to all finite simple groups, which is the truth of the classification proposition `TauCeti.ClassificationStatement` and is not supplied by the `Prop`-valued definition itself.

## How to read the build

Layer 0 proves the ramification, Higman, branch-cycle, deformation and functoriality properties of the level stacks of ArithmeticDynamicsPartII §6.0, the Galois correspondence for covers of the elliptic stack, and the cofinality of the level stacks. Layer 1 describes the cusps of these stacks completely by finite group data and Layer 2 computes their automorphism groups, including the criterion for the rigidified compactification to be representable over the elliptic stack. Layer 3 combines the cusp automorphism groups with the coarse degree congruence of ArithmeticDynamicsPartII §6.0 to obtain the combinatorial congruence on Out⁺(F₂)-orbits, stated in `combinatorial_congruence`. Layer 4 bounds the two obstructions group-theoretically and proves `simple_group_congruence`. Layer 5 builds the rank-two trace coordinates over every commutative ring, with the integral trace-coordinate isomorphism stated in `integral_trace_coordinates`, and the finite-field trace data. Layer 6 specializes to SL₂(𝔽_q): the epimorphic trace loci, the branch cycles and rotations in trace coordinates, and vertical automorphisms, whose finite-group form is stated in `sl2_cusp_automorphism_central`. Layer 7 combines these with the Markoff dynamics of ArithmeticDynamicsPartII to describe the trace −2 Markoff level curves. A target's *Needs:* line lists what its statement and its indicated proof route use.

## Layer 0: ramification, branch cycles and functoriality of elliptic level structures

All objects of this layer are those of ArithmeticDynamicsPartII §6.0 and InverseGaloisAndArithmeticFundamentalGroups §IG.5.4; this layer proves properties of them.

### 0.1 The reduced ramification divisor and its monodromy

Let π : C → E be an elliptic admissible G-cover over S. Where the origin is ramified, the reduced ramification divisor R_π is the marking of the stable marked G-curve attached to π; where the origin is unramified, the marking is the whole étale origin fibre and R_π is empty (InverseGaloisAndArithmeticFundamentalGroups §IG.5.4). Prove the following description and properties. For a nontrivial cyclic H ≤ G let Δ(H) be the fixed locus of H in the smooth locus C^sm minus the fixed loci of all strictly larger cyclic subgroups; then R_π is the disjoint union of the Δ(H), with the induced fixed-locus scheme structures. It is an effective Cartier divisor in C^sm, finite étale over S, compatible with every base change, and its geometric points are the points over the origin with nontrivial inertia. On a connected base the ramification index e at the origin is constant; if e ≥ 2 then R_π has degree |G|/e over S and is the fibrewise reduced origin fibre, while if e = 1 it is empty and the marking is the whole étale origin fibre. If S is reduced then R_π is reduced; conversely, if R_π → S is surjective (in particular if e ≥ 2 and S is nonempty and connected) and R_π is reduced, then S is reduced. (Chen, §2.2, pp. 323–325, Proposition 2.2.3 and Remark 2.2.4; Definition 3.2.1, pp. 351–352.) The converse without surjectivity, asserted in Chen's Remark 2.2.4, is false (Checks below).

Monodromy. Let S be connected and e ≥ 2, and let x be a geometric ramified point with inertia group H. Then all connected components of R_π are isomorphic finite étale Galois covers of S, and their deck groups embed in N_G(H)/H. If S is regular and integral and contains a primitive e-th root of unity, they embed in C_G(H)/H. For a connected component X of Adm(G) over ℤ[1/|G|, ζ_e] the same holds for the universal reduced ramification divisor; consequently the degree d_X of a connected component of the universal divisor over X^coarse divides |C_G(⟨c⟩)/⟨c⟩| for the Higman element c. (Chen, Proposition 2.2.5, pp. 325–326; Proposition 3.2.2, pp. 352–353.)

One proof route: use the tame smooth chart x = ξ^e to identify each fixed locus with a section after an étale cover, separate loci with different stabilizers (they are disjoint in the smooth locus), descend their union and the Cartier property, and count the geometric fibre G/H. Reducedness of S passes to the finite étale R_π, and the converse uses faithfully flat descent along the surjective finite étale R_π → S. For monodromy, the G-action commutes with finite étale monodromy and is transitive on the geometric fibre G/H; an equivariant permutation is determined by its value at H, and its stabilizer condition gives the normalizer quotient. The faithful inertia character H → μ_e on the cotangent line is constant over a regular integral base containing ζ_e, which forces centralization. For the universal stack the fixed-subgroup loci are open and closed; on each connected component the faithful character takes constant values in the constant group μ_e, monodromy preserves it, so the normalizer image centralizes H; descend this through an étale atlas. Connectedness of pulled-back covers uses that the forgetful configuration maps are smooth and surjective with nonempty geometrically connected fibres; no properness is used (Chen's proof of Proposition 3.2.2(b) argues with properness of these maps, whose fibres are open curves).

**Checks.**

- Every unramified connected cover has R_π = ∅, although π⁻¹(O) has |G| points; the marking is the whole origin fibre.
- For inertia of order 3 in S₃, R_π has degree 6/3 = 2.
- For the chart x = ξ^e with e ≥ 2, R_π is ξ = 0 with multiplicity one, not the different, which has multiplicity e − 1.
- After base change to S = Spec k[ε]/(ε²), R_π remains finite étale and fibrewise reduced but is not a reduced scheme; replacing it by its reduction would break base change.
- For G = 1 over S = Spec k[ε]/(ε²), R_π is empty, hence reduced, of degree 0 (not |G|/e = 1), while S is not reduced; this refutes the converse without surjectivity.
- The centralizer quotient, not the normalizer quotient, bounds d_X: for odd dihedral G of order 2k and a rotation c of order k, C_G(⟨c⟩)/⟨c⟩ is trivial while N_G(⟨c⟩)/⟨c⟩ has order 2.

*Needs:* InverseGaloisAndArithmeticFundamentalGroups §IG.5.4 (admissible covers, stable marked G-curves); InverseGaloisAndArithmeticFundamentalGroups §IG.1.2 (tame tangential fibres and inertia characters); StableReduction Layer 2 (effective Cartier divisors in the smooth locus); ArithmeticDynamicsPartII §6.0 (Adm(G) and its components); SchemeAndStackFoundations §1.19 (étale atlases).

### 0.2 The Higman invariant and its strata

Fix a compatible system (ζ_n) on a ℤ[1/|G|]-base with every inertia index e dividing n. At a geometric point x over the origin with inertia group H, the action of H on the cotangent line of C at x is a faithful character χ_x : H → μ_e. Define the Higman invariant Hig_ζ(π) as the conjugacy class of the unique c ∈ H with χ_x(c) = ζ_n^(n/e); in the unramified case e = 1 and c = 1. ArithmeticDynamicsPartII §6.0 indexes its components by this ramification class; this section fixes its normalization and proves its invariance properties. (Chen, Definition 2.3.1, p. 327; Proposition 2.3.2 and Definition 2.3.4, pp. 327–328; Situation 2.5.14, pp. 346–347.)

The defining API is:

- Hig_ζ assigns a conjugacy class of G to every geometric object of Adm(G), independent of the chosen point x over the origin, and compatible with base change and isomorphisms.
- The order of a representative of Hig_ζ(π) is the ramification index e at the origin.
- Replacing (ζ_n) by (ζ_n^a) with a coprime to n replaces the class by its a-th power.
- Over ℂ with ζ_n = exp(2πi/n), Hig_ζ(π) is the class of φ([b, a]) for the monodromy φ : F₂ → G in a positively oriented basis (a, b).
- The index e and Hig_ζ are locally constant on Adm(G) and on its smooth locus. After adjoining the needed roots, each conjugacy class c gives an open and closed substack Adm(G)_c, every geometric cover lies in exactly one of them (the unramified ones in Adm(G)_1), the decomposition descends through the central rigidification to M(G) and M̄(G) and agrees on coarse spaces, and changing the root system permutes the strata by the corresponding coprime power map. A stratum is not asserted to be connected. (Chen, Proposition 2.3.2 and Definition 2.3.4, pp. 327–328.)

**Checks.**

- For abelian G every elliptic G-cover has Higman class 1, since every commutator is trivial.
- For the generating pair of two distinct transpositions of S₃, the Higman class is the class of 3-cycles and e = 3.
- Replacing ζ_e by ζ_e⁻¹ inverts the Higman element; in SL₂(𝔽₇) this exchanges the two noncentral trace −2 classes (the peripheral witness of Conventions), so a class need not equal its inverse.
- For G = 1 the only stratum is Adm(1)_1 = M̄(1).

One proof route: the tame chart shows χ_x faithful; changing x conjugates the generator; étale-local charts give base change; the analytic comparison of the chosen root with the oriented peripheral loop uses the tangential fibre functors. Local constancy follows on tame charts and descends along an étale atlas; the clopen preimages are invariant under central rigidification.

*Needs:* §0.1; InverseGaloisAndArithmeticFundamentalGroups §IG.1.2; InverseGaloisAndArithmeticFundamentalGroups §IG.3.2 (exterior epimorphisms); AnabelianGeometryAndNonabelianChabauty §1.1 (positively oriented inertia over ℂ); AlgebraicModuliForArithmeticGeometry §5.1 (rigidification); ArithmeticDynamicsPartII §6.0.

### 0.3 Branch cycles of the level cover

Let k be algebraically closed of characteristic zero. Under the identification of the geometric fibre of M(G) with Epi^ext(F₂, G) of ArithmeticDynamicsPartII §6.0, the local monodromies of M(G) → 𝓜(1) around j = 0, 1728, ∞ and the generic stabilizer act on exterior pairs by right precomposition with γ₀ (a, b) ↦ (a b⁻¹, a), γ₁₇₂₈ (a, b) ↦ (b⁻¹, a), γ∞ (a, b) ↦ (a, a b) and γ₋ᵢ (a, b) ↦ (a⁻¹, b⁻¹). Prove: the generic fibre of a component of M(G)^coarse over the j-line is the quotient of the corresponding Out⁺(F₂)-orbit O by ⟨γ₋ᵢ⟩, so the coarse degree is |O/⟨γ₋ᵢ⟩|, which is |O| or |O|/2; the fibres of the compactified coarse component over j = 0, 1728 and ∞ are respectively the orbit sets of O/⟨γ₋ᵢ⟩ under γ₀, under γ₁₇₂₈, and under the group generated by γ₋ᵢ and γ∞, with ramification indices the orbit lengths. Stack monodromy uses the orbifold fundamental group of 𝓜(1)^an, not that of the coarse affine line. (Chen, Theorem 2.5.2(3)–(5), pp. 335–338; Situation 2.5.14, pp. 346–347.)

Prove also the Galois correspondence for the elliptic stack, by which covers are named by subgroups. For k algebraically closed of characteristic zero there is an equivalence, compatible with extension of such fields, from the category of representable finite étale covers of 𝓜(1)_k to the category of finite sets with an action of Out⁺(F₂) ≅ SL₂(ℤ) (gap:punctured-torus-nielsen); over ℂ it is the fibre functor at a geometric point E with the monodromy action of the orbifold fundamental group of 𝓜(1)^an. Under it, M(G)_k corresponds to Epi^ext(F₂, G) with the action by precomposition, connected covers correspond to transitive sets, and for a finite-index subgroup Γ ≤ SL₂(ℤ) the cover V_Γ is the one whose fibre is transitive with point stabilizers the conjugates of Γ, so that the component of M(G)_k through a class e is V_Stab(e). V_Δ maps to V_Γ over 𝓜(1)_k exactly when Δ is conjugate to a subgroup of Γ, and when Δ is a normal subgroup of Γ the map V_Δ → V_Γ induced by the inclusion is finite étale Galois with group Γ/Δ. The degrees, fibres and ramification indices of the previous paragraph hold for the cover of every finite Out⁺(F₂)-set, with O an orbit of that set. Over ℂ, Aut(E) is identified, up to conjugacy, with a cyclic subgroup of Out⁺(F₂) of order 2, 4 or 6 containing γ₋ᵢ, of order 4 or 6 exactly when j(E) = 1728 or 0, and the automorphism group of a geometric point of the cover of a set S lying over E is the stabilizer in Aut(E) of the corresponding element of S. Hence, over every k, V_Γ has trivial automorphism groups at all its points exactly when Γ is torsion-free, and V_Γ is then a smooth affine curve over k equal to its coarse space. (Chen, Theorem 2.5.2(5) and its proof, pp. 336–338; Chen 2018, Theorem 3.5.3, for the components of M(G).)

One proof route: transport the elliptic universal family through the orbifold identification of 𝓜(1,1)^an with Out⁺(F₂) and the images of the standard loops; apply the exterior-epimorphism fibre description; compute the four words and the stabilizer quotients, distinguishing stack and coarse fibres; transport to every algebraically closed field of characteristic zero by base-change invariance. For the Galois correspondence, reduce to a curve through full level 3. Let Y be a connected component of M((ℤ/3)²)_k. Its geometric fibre is one Out⁺(F₂)-orbit of 24 surjections ℤ² → (ℤ/3)², those of one determinant, with stabilizer Γ(3). Twisting the (ℤ/3)²-action of the torsors by automorphisms of (ℤ/3)² of determinant one gives an action of SL₂(𝔽₃) on Y over 𝓜(1)_k that is simply transitive on geometric fibres, so Y → 𝓜(1)_k is an SL₂(𝔽₃)-torsor and 𝓜(1)_k is the quotient stack [Y/SL₂(𝔽₃)]. An automorphism of an elliptic curve acts on the fibre through a finite subgroup of SL₂(ℤ), and such a subgroup meets the torsion-free Γ(3) trivially, so Y has trivial automorphism groups; it is therefore an algebraic space, finite over the coarse j-line, hence a smooth affine curve. Representable finite étale covers of 𝓜(1)_k are then the SL₂(𝔽₃)-equivariant finite étale covers of Y. Over ℂ, `riemannExistence` applied to Y and to its automorphisms makes these the SL₂(𝔽₃)-equivariant finite covering spaces of Y^an. Pulling Y^an back along the orbifold chart ℍ → 𝓜(1)^an of the upper half-plane identifies it, by the monodromy of the first paragraph, with Γ(3)∖ℍ, on which Γ(3) acts freely; so the equivariant covers of Y^an are the SL₂(ℤ)-equivariant finite covers of the simply connected ℍ, that is, finite SL₂(ℤ)-sets, and the stabilizers of points of ℍ are the automorphism groups of the curves they parametrize. Descend from ℂ to ℚ̄ and extend to every algebraically closed k of characteristic zero by invariance under algebraically closed base extension, applied to Y and its automorphisms. A cover V_Γ with Γ torsion-free has trivial automorphism groups, hence is an algebraic space, and is finite over the coarse j-line, hence an affine curve; conversely a nontrivial element of finite order of Γ is −I or is conjugate in SL₂(ℤ) into the automorphism group of the curve with j = 0 or j = 1728, and then fixes a point of the fibre over that curve.

**Checks.**

- For G = 1 every fibre has one element and every branch operator acts trivially.
- For G = C₂ the three nonzero pairs form one component of coarse degree 3, and γ₋ᵢ acts trivially since every element is its own inverse.
- The generic stack fibre has twice the size of the coarse fibre exactly when γ₋ᵢ has no fixed point on the orbit: for G = C₃ the orbit O consists of the 8 surjections ℤ² → ℤ/3, γ₋ᵢ (negation) acts freely and the coarse degree is 4, the index in PSL₂(ℤ) of the image of Γ₁(3), not 8; for G = C₂ it acts trivially and the coarse degree is |O| = 3.
- For G = (ℤ/n)² the operators reduce, through Epi^ext(F₂, (ℤ/n)²) = surjections ℤ² → (ℤ/n)², to the standard SL₂(ℤ)-action on full level n bases, matching ModularCurvesPartII §3.1 after fixing the Weil pairing.
- The Galois correspondence is about the stack, not its coarse space: the affine j-line has no nontrivial connected finite étale cover in characteristic zero, while 𝓜(1)_k has the connected cover M(C₂)_k of degree 3 and the cover Y of degree 24 used in the proof; a correspondence read off the coarse line would miss them all.
- For Γ = Γ(3) the cover is the curve Y: its fibre has 24 points, γ₋ᵢ acts on them without fixed points, so the coarse degree is 12, the index of the image of Γ(3) in PSL₂(ℤ); the images of γ₀, γ₁₇₂₈ and γ∞ in PSL₂(𝔽₃) have orders 3, 2 and 3 and act freely on its 12 elements, giving 4, 6 and 4 points over 0, 1728 and ∞, and Riemann–Hurwitz gives 2 − 2g = 2·12 − 8 − 6 − 8 = 2, so g = 0 with four punctures.
- A subgroup with torsion gives a cover with an orbifold point. For G = C₃, γ₀ acts on the images (x, y) of (a, b) by (x, y) ↦ (x − y, x), so γ₀² acts by (x, y) ↦ (−y, x − y) and fixes (2, 1) modulo 3, while γ₀³ = γ₋ᵢ sends it to (1, 2). So the point of M(C₃)_k over j = 0 given by the class of (2, 1) has automorphism group ⟨γ₀²⟩ of order 3, and this component, whose subgroup is conjugate to Γ₁(3), is not a curve.

*Needs:* ArithmeticDynamicsPartII §6.0 (fibres and components); MappingClassGroupsAndCanonicalRepresentations §2.3 (orbifold fundamental group of 𝓜(1,1)^an and the stabilizers of the upper half-plane) and gap:punctured-torus-nielsen; InverseGaloisAndArithmeticFundamentalGroups §§IG.3.1, IG.3.2, IG.1.3 (invariance under algebraically closed base extension), IG.1.4; ComplexComparisonPartII §C6.2 (`riemannExistence`); SchemeAndStackFoundations §1.20 (`setoid_criterion`), §1.21 (quotient stacks and torsors), §1.23 (coarse moduli spaces); Tau Ceti `TauCeti.CoveringSpace.monodromyFunctor` (topological monodromy of covering spaces, not Riemann existence for stacks).

### 0.4 Boundary deformation and density

At a geometric object of Adm(G) in characteristic prime to |G|, the deformation map of universal rings over the elliptic stack is Λ[[T]] → Λ[[t]], T ↦ t^r, for a Cohen ring Λ and the order r of the node stabilizer; r = 1 for a smooth object. Consequently Adm(G) → M̄(1) is flat, proper and quasi-finite, its smooth-target open is dense, and the whole compactification is empty when G is not generated by two elements. (Chen, Proposition 2.5.3 and Corollary 2.5.4, pp. 338–341; Appendix 6.5, pp. 430–434.)

One proof route: use equivariant nodal deformation theory with the framed comparison at geometric points; specialize to the single target node, where balanced smoothing gives T = t^r; flatness follows from the free ring extension and density because t ≠ 0 is dense; combine with the generation obstruction of the geometric fibre.

**Checks.**

- A node with r = 2 has T = t², so the compactified forgetful morphism is not étale there.
- A smooth cover has r = 1; boundary étaleness is not inferred from the generic point.
- For G = C₂ × C₂ × C₂, which is not generated by two elements, Epi(F₂, G) is empty and so is Adm(G).

*Needs:* gap:equivariant-node-smoothing (SchemeAndStackFoundations §4.6); gap:geometric-point-completion (AlgebraicModuliForArithmeticGeometry §8.3); InverseGaloisAndArithmeticFundamentalGroups §IG.5.4; ArithmeticDynamicsPartII §6.0.

### 0.5 Functoriality under quotients of G

For a surjection f : G₁ → G₂ of finite groups with G₁ generated by two elements, let M(f) : M(G₁) → M(G₂) over ℤ[1/|G₁|] be the quotient-cover map of ArithmeticDynamicsPartII §6.0 for the normal subgroup ker f, followed by the identification G₁/ker f ≅ G₂ induced by f, and let M̄(f) : M̄(G₁) → M̄(G₂) be its extension to compactifications, also constructed there. Prove the properties that §6.0 does not state: M̄(f) is proper, quasi-finite and surjective; on geometric fibres M(f) is postcomposition φ ↦ f ∘ φ on Epi^ext(F₂, −); it maps the Higman class c to f(c); and identities and composites of surjections give canonically isomorphic maps. Surjectivity uses the lifting of generating pairs along f, not surjectivity of f on elements. (Chen, Theorem 2.5.2(6), p. 337; Proposition 2.5.10(f), pp. 344–345; §4.12, p. 389.)

The API proved here is:

- M(f₂ ∘ f₁) is canonically isomorphic to M(f₂) ∘ M(f₁), and M(id) to the identity.
- The fibre map is φ ↦ f ∘ φ, equivariant for Out⁺(F₂) and surjective onto Epi^ext(F₂, G₂).
- The Higman class of the quotient cover is the image of the Higman class.
- The extension M̄(f) on compactifications is proper, quasi-finite and surjective.

**Checks.**

- An isomorphism G₁ ≅ G₂ gives an isomorphism of level stacks.
- G → 1 gives the forgetful map to 𝓜(1) and agrees with the coarse j-line.
- A nonsurjective homomorphism is not admitted: for C₂ → C₂ × C₂ the composite of a surjection F₂ → C₂ is not surjective, so it classifies no connected (C₂ × C₂)-torsor.
- The two-generation hypothesis on G₁ is needed for surjectivity: the projection C₂ × C₂ × C₂ → C₂ × C₂ is surjective on elements, but M(C₂ × C₂ × C₂) is empty (§0.4) while M(C₂ × C₂) is not.

One proof route: start from the quotient-cover map of ArithmeticDynamicsPartII §6.0 and its compactification; properness and quasi-finiteness follow from those of the compactified forgetful map of G₁ (§0.4), since M̄(G₂) is a separated Deligne–Mumford stack over M̄(1); the lifting of generating pairs and the fibre dictionary give surjectivity over M(G₂), and properness with the density of the smooth-target locus (§0.4) extends it to M̄(G₂); check identity and composition by the quotient universal property.

*Needs:* §0.3; §0.4; Tau Ceti `MonoidHom.exists_comp_eq_and_closure_range_eq_top_of_surjective` (Gaschütz's lemma, with ι = `Fin 2`); InverseGaloisAndArithmeticFundamentalGroups §IG.3.2 (exterior epimorphisms) and §IG.5.4; ArithmeticDynamicsPartII §6.0 (the quotient-cover map M(H) → M(H/N) for a normal subgroup N and its compactification).

### 0.6 Absolute and intermediate level structures

For a subgroup A ≤ Out(G), Out(G) acts on M(G) by postcomposing exterior epimorphisms with automorphisms of G, freely on geometric fibres. Define M(G|A) = M(G)/A, the stack of (G|A)-structures, and M(G)^abs = M(G|Out(G)). On compactifications the quotient means the normalization of the coarse quotient, or the stack quotient with its residual stabilizers retained. A fixed Higman stratum is used only when A preserves its class; otherwise it is replaced by the union over its A-orbit. (Chen, Definition 2.5.13 and Situation 2.5.14, pp. 346–347.)

The defining API is:

- A section of M(G) determines a section of M(G|A), with the universal property of the A-quotient.
- The geometric fibre of M(G|A) is Epi^ext(F₂, G)/A.
- Taking A = Out(G) gives absolute level structures.
- For A ≤ B the quotient maps M(G) → M(G|A) → M(G|B) compose naturally.

**Checks.**

- A = 1 recovers M(G).
- For G = C₂, Out(G) = 1 and absolute structures still give the degree-three cover.
- For G = SL₂(𝔽₇) the outer automorphism of conjugation by a matrix of nonsquare determinant exchanges the two noncentral trace −2 Higman classes, so the quotient of one of the two strata alone is undefined; the union of both strata must be taken.
- Freeness: an automorphism of G fixing the exterior class of a surjection agrees with an inner automorphism on a generating pair, hence is inner.

One proof route: postcompose exterior epimorphisms by automorphisms of G; surjectivity shows that an automorphism fixing an exterior class is inner; take the quotient of the finite locally constant sheaf and compare fibres and compactifications.

*Needs:* §0.2; §0.3; ArithmeticDynamicsPartII §6.0; SchemeAndStackFoundations §§1.21, 1.23.

### 0.7 Cofinality of elliptic nonabelian levels

Every connected finite étale cover of 𝓜(1)_ℚ̄ is dominated by a connected component of M(G)_ℚ̄ for some finite group G generated by two elements. Consequently, for every smooth projective connected curve X over ℚ̄ there are a nonempty open U ⊆ X, a finite group G generated by two elements and a connected component N of the stack M(G)_ℚ̄ with a finite étale Galois morphism N → U; N can be chosen with trivial automorphism groups at all its points, so that it is a smooth affine curve and equals its coarse space. The target is the open curve U, not X. (Chen, Theorem 2.5.2(7) and its proof, pp. 337–338; Chen 2018, Corollary 3.4.2 and its proof; Asada, §7.) The group-theoretic input, that stabilizers of exterior epimorphisms are cofinal among finite-index subgroups of Out⁺(F₂), is gap:asada-cofinality; this section proves its translation into covers and the curve consequence.

One proof route. By the Galois correspondence of §0.3, a connected finite étale cover of 𝓜(1)_ℚ̄ is V_Γ for a finite-index subgroup Γ ≤ Out⁺(F₂), the component of M(G)_ℚ̄ through e is V_Stab(e), and V_Stab(e) dominates V_Γ as soon as Stab(e) ≤ Γ; with the gap this is the domination statement. For a curve X the task is to place an open part of X over 𝓜(1)_ℚ̄ with a torsion-free subgroup. Belyi's theorem makes a nonempty open U ⊆ X finite étale over the thrice-punctured line P* = P¹ ∖ {0, 1, ∞}, and P* is itself such a cover. Let Γ(2)′ be the set of matrices in SL₂(ℤ) with even off-diagonal entries and diagonal entries congruent to 1 modulo 4. It is closed under products and inverses; an element of Γ(2) has ad ≡ 1 modulo 4, hence a ≡ d modulo 4, so Γ(2) = Γ(2)′ ⊔ −Γ(2)′ and Γ(2)′ has index 12 in SL₂(ℤ); it contains the squares `[[1, 2], [0, 1]]` and `[[1, 0], [2, 1]]` of the two positive transvections, which generate it because their images generate the image of Γ(2) in PSL₂(ℤ). Its traces are congruent to 2 modulo 4, which excludes the traces −1, 0, 1 of the elements of order 3, 4 and 6, and it omits −I, so it is torsion-free. By §0.3 its cover V is a smooth affine curve, and the branch data of §0.3 give it genus 0 and three punctures (Checks below), so V ≅ P*; the same subgroup is used in Bell–Booher–Chen–Liu, proof of Theorem 2.2.3. The composite U → V → 𝓜(1)_ℚ̄ makes U a connected cover V_(Γ_U) whose subgroup, after conjugation, lies in Γ(2)′ and so is torsion-free, and the gap gives e : F₂ ↠ G whose stabilizer lies in Γ_U. To make the map Galois, let K be the intersection of the finitely many images of ker e under Aut⁺(F₂) and e′ : F₂ → F₂/K the quotient. Every element of Aut⁺(F₂) preserves K, so Out⁺(F₂) acts on F₂/K by outer automorphisms; the stabilizer of the class of e′ is the kernel of Out⁺(F₂) → Out(F₂/K), hence normal, and it lies in the stabilizer of e because e factors through e′ (Chen 2018, proof of Corollary 3.4.2, where F₂/K is the image of the product of the orbit of e). The component N through e′ maps finite étale onto U with Galois group Γ_U/Stab(e′), and N has trivial automorphism groups because Γ_U is torsion-free. A Galois closure of an arbitrary dominating component need not itself be a component of a level stack; the intersection of kernels makes it one.

**Checks.**

- A component N of M(G)_ℚ̄ is finite over the non-proper 𝓜(1)_ℚ̄, hence not proper, while a finite morphism to a projective curve has proper source; so N maps onto no projective curve finitely and the open U is essential.
- The Galois step is needed: for G = C₃ and e : (a, b) ↦ (1, 0), the stabilizer of e is the index-8 subgroup of matrices whose first row is (1, 0) modulo 3 (columns are the images of a and b), which is not normal; the four kernels of surjections F₂ → ℤ/3 intersect in the kernel of F₂ → (ℤ/3)², e′ is a full level-3 structure, and its stabilizer Γ(3) is normal, of index 24, and contained in the former.
- For V: the image of Γ(2)′ in PSL₂(ℤ) has index 6, with two points of index 3 over j = 0, three of index 2 over 1728 and three cusps of width 2, so Riemann–Hurwitz gives 2 − 2g = 2·6 − 4 − 3 − 3 = 2 and g = 0, with three punctures. Replacing Γ(2)′ by Γ(2) gives the same coarse curve but the full level-2 stack, whose automorphism group at every point is ±1, so it is not a curve.

*Needs:* gap:asada-cofinality (MappingClassGroupsAndCanonicalRepresentations); §0.3; MappingClassGroupsAndCanonicalRepresentations §2.3 (orbifold fundamental group of 𝓜(1,1)^an); BelyiMaps Layer 10 §10.4 (Tau Ceti `TauCeti.IsFunctionField.exists_isAlgebraicBelyiPair`); SchemeAndStackFoundations §3.2 (`scheme_riemann_hurwitz`); InverseGaloisAndArithmeticFundamentalGroups §IG.3.1; Mathlib `FreeGroup`.

### Examples

For G = C₂ the level stack is the Γ₁(2)-curve: one component of coarse degree 3, Higman class 1, empty reduced ramification divisor and γ₋ᵢ acting trivially. For G = S₃ with transpositions u, v, the commutator is a 3-cycle, e = 3, R_π has degree 2 over the base, the Out⁺(F₂)-orbit of (u, v) in Epi^ext(F₂, S₃)/⟨γ₋ᵢ⟩ has 3 elements, and the corresponding coarse component has degree 3.

### Dependencies

InverseGaloisAndArithmeticFundamentalGroups §§IG.1.2, IG.1.3, IG.1.4, IG.3.1, IG.3.2, IG.5.4; ArithmeticDynamicsPartII §6.0; AnabelianGeometryAndNonabelianChabauty §1.1; ComplexComparisonPartII §C6.2 (`riemannExistence`); StableReduction Layer 2; SchemeAndStackFoundations §§1.19, 1.20, 1.21, 1.23, 3.2 and gap:equivariant-node-smoothing; AlgebraicModuliForArithmeticGeometry §§5.1, 8.3 and gap:geometric-point-completion; ModularCurvesPartII §3.1; MappingClassGroupsAndCanonicalRepresentations §2.3, gap:punctured-torus-nielsen and gap:asada-cofinality; BelyiMaps Layer 10 §10.4; Tau Ceti `TauCeti.CoveringSpace.monodromyFunctor`, `TauCeti.IsFunctionField.exists_isAlgebraicBelyiPair`, `MonoidHom.exists_comp_eq_and_closure_range_eq_top_of_surjective`; Mathlib `FreeGroup`.

## Layer 1: cusps and their finite data

Throughout this layer k is algebraically closed of characteristic zero, a compatible root system is fixed, E is the nodal genus-one curve over k with origin O, and ν : P¹ → E is a standard normalization sending 1 to O and identifying 0 with ∞. Put P* = P¹ ∖ {0, 1, ∞}, choose tangent vectors t₀ at 0 and t∞ = ι(t₀) at ∞ for ι(z) = 1/z, and a good path δ : t₀ → t∞ (AnabelianGeometryAndNonabelianChabauty §1.2). Write Π = π₁(P*, t₀), freely topologically generated by γ₀ and γ∞^δ = δ⁻¹γ∞δ.

### 1.1 Gluing data at a cusp

A gluing datum is a finite right G-equivariant morphism q : D → P¹ from a possibly disconnected smooth curve, whose restriction over P* is a right G-torsor, together with a G-equivariant bijection α from the reduced fibre D₀ to the reduced fibre D∞. Morphisms are G-equivariant isomorphisms of covers respecting α. A precuspidal cover of E is the finite quotient obtained by gluing, without flatness at its nodes. (Chen, Definitions 4.1.1–4.1.3, pp. 361–362; Definitions 4.4.1–4.4.2, p. 367.)

The defining API is:

- A datum is formed from q and an equivariant bijection of reduced branch fibres.
- The normalization of a precuspidal cover recovers q and α.
- An isomorphism of data is determined by its map on D and its compatibility with α.
- A change of standard normalization transports the datum and its gluing canonically.
- Every geometric fibre of q over P* is a free transitive right G-set, so q has degree |G|.

**Checks.**

- G = 1 with D = P¹ and α(0) = ∞ glues to the nodal genus-one curve itself.
- D need not be connected: for G = C₂ and the generating pair (u, h) = (1, h), D is two copies of P¹ and the glued curve is connected.
- Only reduced branch fibres are identified; identifying a scheme-theoretic branch fibre of length e would create the wrong singularity.
- For G = S₃ and a subgroup H of order 2, the faithful action on (H∖G) × P¹ has quotient P¹ but is not a gluing datum: its fibres over P* have three points with nontrivial stabilizers rather than six torsor points.

*Needs:* StableReduction Layers 1 and 3 (normalization, pointed prestable curves); InverseGaloisAndArithmeticFundamentalGroups §IG.5.4 (admissible G-covers); AnabelianGeometryAndNonabelianChabauty §1.2 (good paths).

### 1.2 The cusp normalization equivalence

Normalization is an equivalence from precuspidal covers of E to gluing data relative to ν. Its inverse is the scheme pushout identifying each x ∈ D₀ with α(x) ∈ D∞; the pushout is prestable, has normalization D, is unchanged away from the glued fibres, and its local functions are those taking equal values at the two points of each glued pair. Connected balanced objects correspond exactly to the cusp fibre Adm(G) ×_(M̄(1)) {E}, and automorphisms over E correspond to vertical automorphisms. (Chen, Proposition 4.1.4, pp. 362–363; Lemma 4.4.4 and Theorem 4.4.5, pp. 369–371.) The equivalence is established through the clutching pushout and the conductor, not through flatness of the quotient at a ramified node, which fails (Chen's Lemma 4.4.4(g) asserts it).

One proof route: apply StableReduction Layer 3 self- and external clutching to the finitely many paired smooth points; descend q to the fixed nodal target and the right G-action by the pushout universal property; prove the two natural inverse isomorphisms by uniqueness of normalization and the conductor; read the balanced node charts from the paired inertia characters.

**Checks.**

- The normalization of a connected glued cover may be disconnected (the C₂ example of §1.1).
- The equivalence preserves automorphism groups over the fixed target E, not all automorphisms of E.
- At the balanced node x = ξ², y = η², ξη = 0 the fibre over x = y = 0 has basis 1, ξ, η of length 3, while the generic rank is 2; the cover is admissible and finite but not flat.

*Needs:* §1.1; StableReduction Layer 3 (clutching); InverseGaloisAndArithmeticFundamentalGroups §IG.5.4 (node characters).

### 1.3 Finite precuspidal data

A precuspidal G-datum is a finite set F with a continuous left Π-action and a commuting free transitive right G-action, together with a G-equivariant bijection α : ⟨γ₀⟩∖F → ⟨γ∞^δ⟩∖F. (Chen, Definition 4.6.1, p. 373.) For x ∈ F define φ_x : Π → G by γ x = x φ_x(γ) (Chen, §4.7, p. 374; for the effect of changing x, Proposition 4.4.3(e), p. 369), and H_(δ,x) = {h : α([x]₀) = [x]∞ h}, a right coset ⟨φ_x(γ∞^δ)⟩h (an orbit of left multiplication by ⟨φ_x(γ∞^δ)⟩) rather than a chosen element (Chen, equation (4.6), p. 375; the same coset for a cover with gluing data is formed in §4.5, p. 371). The tangential fibre functor at t₀, followed by transport along δ, is an equivalence from the category of three-point G-covers of P¹ with gluing data to precuspidal G-data (Chen, Proposition 4.6.2, pp. 373–374). In Chen's Proposition 4.4.3(d), p. 369, the loop on the left is based at t₀.

The defining API is:

- A datum bundles the commuting actions and the equivariant bijection of inertia orbit sets.
- φ_x is continuous, and replacing x by x g replaces φ_x by g⁻¹ φ_x g.
- H_(δ,x) is a nonempty right coset of ⟨φ_x(γ∞^δ)⟩, of the form ⟨φ_x(γ∞^δ)⟩h.
- The tangential fibre functor, transported along δ, is an equivalence from three-point G-covers with gluing data to these finite data (Chen, Proposition 4.6.2).

**Checks.**

- For F = G with γ∞^δ acting by left multiplication by u, the γ∞^δ-orbit set is ⟨u⟩∖G, the set of right cosets ⟨u⟩g; calling these left cosets would name the quotient G/⟨u⟩ by right multiplication instead.
- The coset side is visible in S₃ (product read right to left): for H = ⟨(1 2)⟩ and h = (1 2 3), the right coset H h = {(1 2 3), (2 3)} differs from the left coset h H = {(1 2 3), (1 3)}; both have two elements, so a cardinality test cannot tell them apart, and only H h is an orbit of left multiplication by H, as the gluing set H_(δ,x) must be.
- G = 1 gives the singleton datum with its unique α.
- Dropping free transitivity of the right G-action admits disconnected non-torsor generic fibres, as in the last Check of §1.1, and must fail the constructor.

*Needs:* §1.1; AnabelianGeometryAndNonabelianChabauty §1.1 (tangential fibre functors) and §1.2 (local inertia orbits on branches, good paths); Mathlib `Subgroup.zpowers`, `orbit_subgroup_eq_rightCoset`.

### 1.4 The graph of a glued cover

The graph of a datum (F, α) has vertices Π∖F, half-edges ⟨γ₀⟩∖F ⊔ ⟨γ∞^δ⟩∖F, incidence given by projection to Π-orbits, and the fixed-point-free reversal pairing the two summands through α and α⁻¹. It is identified with the dual graph of the glued cover (StableReduction Layer 1), admits loops and multiple edges, and is connected if and only if ⟨φ_x(Π), h⟩ = G for one, equivalently every, x and h ∈ H_(δ,x). (Chen, Definition 4.7.2 and Propositions 4.7.3–4.7.4, pp. 375–377.)

The defining API is:

- The graph is formed on the half-edge carrier of StableReduction Layer 1.
- Normalization identifies it with the dual graph of the glued curve.
- Connectedness is equivalent to ⟨φ_x(Π), h⟩ = G.
- An isomorphism of data induces a graph isomorphism preserving the pairing of half-edges.

**Checks.**

- G = 1 gives one vertex and one loop: two half-edges and first Betti number one.
- For G = C₂, u = 1 and h the generator, the graph has two vertices joined by two edges forming a cycle; the normalization is disconnected but the graph is connected.
- A simple graph would erase the loop in the trivial-group example and give first Betti number zero, hence arithmetic genus zero instead of one.

One proof route: construct the incidence maps from orbit-set projections; pair the summands through α with no fixed half-edge; translate paths in the graph into products of monodromy elements and h.

*Needs:* §1.2; §1.3; StableReduction Layer 1 (dual graphs with loops).

### 1.5 Balance and connectedness in finite data

The glued cover is balanced if and only if φ_x(γ₀)⁻¹ = h⁻¹ φ_x(γ∞^δ) h for one, equivalently every, x and h ∈ H_(δ,x). Together with connectedness of the graph this is equivalent to the two conditions φ_x(γ₀) = h⁻¹u⁻¹h and ⟨u, h⟩ = G, where u = φ_x(γ∞^δ). The normalization, fibre and gluing equivalences restrict to the full subgroupoids of connected, balanced and cuspidal objects. (Chen, Proposition 4.5.2, pp. 372–373; Definition 4.7.1, p. 375; Propositions 4.7.6 and 4.8.1, pp. 377–378.)

One proof route: balance is inverse matching of the faithful cotangent inertia characters on the two branches; independence of x follows by conjugation and of h by the cyclic inertia ambiguity; combine the balance equation with the generation criterion of §1.4.

**Checks.**

- For u = 1 and h generating a cyclic group, balance holds and the glued graph is a connected polygon.
- Replacing h by u^k h leaves both the balance equation and the generation condition invariant.
- For G = C₂ × C₂ with u = 1 and h of order 2 the balance equation holds but ⟨u, h⟩ ≠ G, so the glued cover is disconnected.

*Needs:* §1.3; §1.4; AnabelianGeometryAndNonabelianChabauty §1.2 (local inertia orbits); InverseGaloisAndArithmeticFundamentalGroups §IG.5.4 (inverse node characters).

### 1.6 The cusp invariant set I(G)

Let Gen₂(G) = {(u, h) : ⟨u, h⟩ = G}. Define I(G) as the quotient of Gen₂(G) by simultaneous conjugation in G and by the commuting ℤ-action (u, h) ↦ (u, u^k h); write [[u, h]] for a class. This set classifies cusps only after a good path and a standard normalization are chosen. (Chen, Definition 4.8.2, p. 378; Theorem 4.8.4, pp. 379–380.)

The defining API is:

- A generating pair determines its class [[u, h]].
- [[u, h]] = [[u′, h′]] if and only if (u′, h′) is simultaneously conjugate to (u, u^k h) for some integer k.
- A function on Gen₂(G) constant along both moves descends uniquely to I(G).
- A group isomorphism induces a bijection of the I-sets.

**Checks.**

- I(1) has exactly one element.
- For C₂ with generator h, the generating pairs (1, h), (h, 1), (h, h) give two classes: (h, 1) and (h, h) are related by the twist, and (1, h) has u = 1.
- The nongenerating pair (1, 1) is not in Gen₂(G) for nontrivial G.

One proof route: restrict the two commuting actions to generating pairs; use the orbit relation of the product action and expose its descent and its explicit criterion.

*Needs:* Mathlib `Subgroup.closure`, `Subgroup.zpowers`, `MulAction.orbitRel`.

### 1.7 The standard cusp of a generating pair

For (u, h) ∈ Gen₂(G) take F = G as a right torsor, let γ∞^δ act by left multiplication by u and γ₀ by left multiplication by h⁻¹u⁻¹h, and put α(⟨h⁻¹u⁻¹h⟩x) = ⟨u⟩hx. This is a connected balanced precuspidal datum. Its normalization monodromy group is M_(u,h) = ⟨u, h⁻¹u⁻¹h⟩ and its glued curve has [G : M_(u,h)] irreducible components, the left M_(u,h)-orbits in G. Simultaneous conjugation and twisting give isomorphic data. (Chen, Definition 4.8.3, pp. 378–379; Theorem 4.10.3(c), p. 385.)

The defining API is:

- The formulas define a cuspidal datum and hence a cuspidal cover.
- The monodromy subgroup at the point 1 is M_(u,h).
- (u, h) and (g u g⁻¹, g u^k h g⁻¹) give isomorphic data.
- The irreducible components correspond to the left M_(u,h)-orbits in G.

**Checks.**

- u = h = 1 in G = 1 gives the nodal elliptic curve.
- For cyclic G generated by h and u = 1, M_(u,h) = 1 and the cover is a |G|-gon.
- For G = S₃, u a 3-cycle and h a transposition, M_(u,h) = C₃ and the normalization has two components.

One proof route: define the two finite left permutations by the free profinite universal property; check that α is well defined on the right cosets ⟨h⁻¹u⁻¹h⟩x by conjugation with h; balance is built in and §1.4 gives connectedness.

*Needs:* §1.5; §1.6.

### 1.8 Classification of cusps and their Higman class

The assignment (F, α) ↦ [[φ_x(γ∞^δ), h]] is independent of x ∈ F and h ∈ H_(δ,x) and gives a bijection from the set of isomorphism classes of objects in the cusp fibre of Adm(G) over E to I(G), with inverse the standard construction of §1.7. The Higman class of [[u, h]] is the class of [u⁻¹, h⁻¹], which is conjugate to [u, h] (conjugation by u h). The bijection is on isomorphism classes; the automorphism groups are computed in Layer 2. (Chen, Theorem 4.8.4 and Definition 4.8.5, pp. 379–380; Proposition 4.8.6, p. 380.)

One proof route: changing the torsor point conjugates the pair and changing the gluing representative multiplies h by a power of u; choosing x as the torsor origin identifies every datum with its standard construction; the good-path relation through γ₁ and the inertia-character convention give the Higman word.

**Checks.**

- For G = 1 there is one cusp, with Higman class 1.
- For G = C₂ there are two cusps, [[1, h]] and [[h, 1]], both with Higman class 1, matching the two cusps of the Γ₁(2)-curve.
- (u h)[u⁻¹, h⁻¹](u h)⁻¹ = [u, h] for all u, h; for u = (1 2 3), h = (1 2) in S₃ both sides are 3-cycles.

*Needs:* §1.7; §0.2; AnabelianGeometryAndNonabelianChabauty §1.2 (the ordered relation of a good path).

### 1.9 Inversion of the target at a cusp

Choose a symmetric good path. Pullback along [−1] on the nodal target sends [[u, h]] to [[u⁻¹, h⁻¹]]. The automorphism [−1] of E lifts to an automorphism of the cuspidal cover if and only if these classes agree, equivalently (u⁻¹, h⁻¹) is simultaneously conjugate to (u, u^r h) for some integer r. Existence of a lift does not choose a splitting of the resulting extension of automorphism groups. (Chen, Proposition 4.9.1, pp. 380–382.)

One proof route: use the transformation identities of a symmetric good path rather than a literal reflection of an arbitrary path; compute the two new generators and the gluing coset after inversion; translate equality in I(G) into an isomorphism of the pulled-back cusp.

**Checks.**

- For G = C₃, u = 1 and h a generator, [[1, h⁻¹]] ≠ [[1, h]], because conjugation is trivial and the twist fixes h when u = 1; so [−1] does not lift at this cusp and exchanges it with [[1, h⁻¹]].
- For G = C₂ every class is fixed and [−1] lifts at every cusp.

*Needs:* §1.8; AnabelianGeometryAndNonabelianChabauty §1.2 (existence of symmetric good paths).

### Examples

Enumeration of generating pairs modulo simultaneous conjugation and twisting gives |I(C₂)| = 2, |I(C₃)| = 4, |I(S₃)| = 2 and |I(D₁₀)| = 4. The two classes for S₃ are represented by ((1 2 3), (1 2)), whose cover has M = C₃ and a normalization with [S₃ : C₃] = 2 components, each a cyclic triple cover of P¹, glued into a connected curve whose graph has two vertices; and by ((1 2), (2 3)), for which h⁻¹u⁻¹h = (1 3), M = S₃, the cover is irreducible and its vertical group is Z(S₃) = 1.

### Dependencies

StableReduction Layers 1 and 3; InverseGaloisAndArithmeticFundamentalGroups §IG.5.4; AnabelianGeometryAndNonabelianChabauty §§1.1, 1.2; §0.2; Mathlib `Subgroup.closure`, `Subgroup.zpowers`, `MulAction.orbitRel`.

## Layer 2: cusp automorphism groups

### 2.1 The cusp automorphism group A(G, u, h)

For a finite group G and (u, h) ∈ Gen₂(G) put M = M_(u,h) = ⟨u, h⁻¹u⁻¹h⟩ and A(G, u, h) = {a ∈ C_G(M) : [a, h] ∈ ⟨u⟩}; the condition [a, h] ∈ ⟨u⟩ says a h a⁻¹ = u^k h for some k. Let k_(u,h) be the least positive k such that (u, h) is simultaneously conjugate to (u, u^k h); it exists because k = |u| works. (Chen, (4.15) and Proposition 4.10.1, pp. 383–384; Theorem 4.10.3, pp. 384–386.)

The defining API is:

- Membership in A(G, u, h) is exactly centralizing u and h⁻¹u⁻¹h and having [a, h] ∈ ⟨u⟩; A(G, u, h) is a subgroup of C_G(M).
- k_(u,h) is positive, divides |u|, and the positive twist periods are exactly its multiples.
- z(a) = [a, h] defines a group homomorphism A(G, u, h) → ⟨u⟩.
- Conjugating (u, h) conjugates A(G, u, h) and preserves k_(u,h).

**Checks.**

- For abelian G, A = G, z = 1 and k_(u,h) = |u|.
- For G = S₃, u = (1 2 3), h = (1 2): M = C₃, A = ⟨u⟩, k_(u,h) = 1 and z maps onto ⟨u⟩.
- If M = G then A = Z(G), z = 1 and k_(u,h) = |u|; for G = SL₂(𝔽₃) with u, h of order 3 and 4 generating, M = G and A = {±1}.

*Needs:* §1.6; §1.7; Mathlib `Subgroup.centralizer`, `Subgroup.zpowers`, `commutatorElement`, `orderOf`.

### 2.2 The cusp automorphism exact sequence

The kernel of z is Z(G) and its image is ⟨u^(k_(u,h))⟩, so 1 → Z(G) → A(G, u, h) → ⟨u^(k_(u,h))⟩ → 1 is exact and |A(G, u, h)| = |Z(G)|·|u|/k_(u,h). Evaluation at 1 identifies A(G, u, h) with the automorphism group of the standard datum of §1.7, hence with the vertical automorphism group of its glued cover. (Chen, Proposition 4.10.1, pp. 383–384; Theorem 4.10.3(a), pp. 384–385.)

One proof route: an endomorphism of the torsor G commuting with right multiplication is left multiplication by some a, and Π-equivariance means a centralizes M; respecting α is equivalent to [a, h] ∈ ⟨u⟩; the kernel commutes with u and h, which generate G; the image follows from the twist-period characterization.

**Checks.**

- For G = S₃, u = (1 2 3), h = (1 2): |Z(G)| = 1, |u| = 3, k = 1, so |A| = 3.
- For abelian G: |A| = |G|·|u|/|u| = |G|.
- For dihedral G of order 2k with k odd, u a rotation of order k and h a reflection: Z(G) = 1, k_(u,h) = 1 and |A| = k.

*Needs:* §2.1; §1.2.

### 2.3 Full and marked cusp stabilizers and representability

For a cusp [[u, h]], its vertical automorphism group is A(G, u, h). Its full automorphism group in Adm(G) equals A(G, u, h) if [[u, h]] ≠ [[u⁻¹, h⁻¹]], and otherwise is an extension 1 → A(G, u, h) → Aut → C₂ → 1. For every generating pair, the stabilizer in A(G, u, h) of a point over the origin is A(G, u, h) ∩ ⟨[u⁻¹, h⁻¹]⟩, and a vertical automorphism fixing one such point fixes the whole origin fibre. If [u, h] ≠ 1 the origin is ramified, the points over it are the points of the reduced ramification divisor, and this group is the vertical automorphism group of the corresponding cuspidal point of that divisor; if [u, h] = 1 the divisor is empty, the marking is the whole origin fibre and the stabilizer is trivial. The cover is irreducible if and only if M_(u,h) = G, and then its vertical group is Z(G). The rigidified compactification M̄(G) → M̄(1) is representable if and only if k_(u,h) = |u|, equivalently A(G, u, h) = Z(G), for every generating pair (u, h). (Chen, Theorem 4.10.3(a′)–(d), pp. 384–386.)

One proof route: compute the stabilizer of an origin point from the gluing description, through the canonical bijection of the fibre over 1 with the γ₁-orbits on the tangential fibre (the stabilizer condition becomes a ∈ ⟨u⁻¹h⁻¹uh⟩); apply §1.9 for the image in Aut(E) = C₂; apply the vertical-kernel criterion of AlgebraicModuliForArithmeticGeometry §5.1 after rigidifying by Z(G), together with the smooth-locus vertical group Z(G) of InverseGaloisAndArithmeticFundamentalGroups §IG.5.4.

**Checks.**

- For G = S₃, u = (1 2 3), h = (1 2): A ∩ ⟨[u⁻¹, h⁻¹]⟩ = C₃, so the marked stabilizer has order 3 and M̄(S₃) → M̄(1) is not representable.
- For abelian G every cusp has A = G = Z(G), so the rigidified map is representable.
- For G = 1 the single cusp [[1, 1]] is the identity cover of the nodal curve: the marking is the origin, of degree 1, the reduced ramification divisor is empty, of degree 0, and the stabilizer A ∩ ⟨1⟩ is trivial; reading the stabilizer as the automorphism group of a point of the divisor would have no point to attach it to.
- For G = SL₂(𝔽₅) and every generating pair, k_(u,h) = |u| (Chen, Remark 4.10.2), so M̄(SL₂(𝔽₅)) → M̄(1) is representable; the marked stabilizer at a trace −2 cusp is {±1} ∩ ⟨c⟩ = {±1}, since the element of order 10 has fifth power −1.

*Needs:* §2.2; §1.9; §0.1; AlgebraicModuliForArithmeticGeometry §5.1 (`ArithmeticModuli.Rigidification.vertical_kernel`); InverseGaloisAndArithmeticFundamentalGroups §IG.5.4; ArithmeticDynamicsPartII §6.0 (M̄(G)).

### 2.4 Comparison with abelian full levels

For abelian G every cusp has A(G, u, h) = G = Z(G), so the rigidified forgetful map is representable. For G = (ℤ/n)² with n ≥ 3, the compactified level stack is identified with the Deligne–Rapoport full level n problem over ℤ[1/n], respecting the Weil-pairing components, and its cuspidal objects have no residual automorphisms. This compares with the full level carrier of ModularCurvesPartII; it is not a second construction of modular curves. (Chen, Remark 4.10.4, p. 386.)

One proof route: identify connected abelian punctured-elliptic torsors with étale isogenies and their level duals; use the full marking at unramified origins and the generalized elliptic compactification; check that n ≥ 3 kills residual automorphisms on each pairing component.

**Checks.**

- For G = (ℤ/n)² the number of components over ℚ̄ is φ(n), each of degree |SL₂(ℤ/n)|/2 over the j-line for n ≥ 3 (Chen, p. 306).
- For n = 2, the element −I acts trivially on full level 2 structures, so the comparison requires n ≥ 3 for representability of the fine problem.
- For G = ℤ/n the single component has coarse degree equal to the index of the image of Γ₁(n) in PSL₂(ℤ).

*Needs:* §2.3; ModularCurvesPartII §§3.1, 3.12.

### 2.5 The odd-dihedral obstruction example

For G dihedral of order 2k with k odd and k ≥ 3, a generating pair has commutator of order k, but every compactified coarse component has degree 3 over P¹_j, and there are φ(k)/2 components. The centralizer obstruction is d′ = 1 while the cusp exponent is m′ = k: for a rotation u and a reflection h, M = ⟨u⟩, A = ⟨u⟩ and k_(u,h) = 1. Thus divisibility of the coarse degree by the ramification index fails arbitrarily strongly. (Chen, §4.11, p. 388; Chen 2018, Theorem 4.2.2.) Chen's text gives d′ = 2 here; the centralizer of a primitive rotation c is ⟨c⟩, so d′ = |C_G(⟨c⟩)/⟨c⟩| = 1, while the normalizer quotient has order 2.

One proof route: compute the dihedral generating pairs and their commutators directly; count their exterior Out⁺(F₂)-orbits, giving φ(k)/2 orbits of coarse degree 3; compute C_G(⟨c⟩) = ⟨c⟩.

**Checks.**

- For k = 3, 5, 7 with u a rotation and h a reflection: A = ⟨u⟩ of order 3, 5, 7, trivial center, twist period one.
- For k = 5 there are φ(5)/2 = 2 orbits on Epi^ext(F₂, D₁₀)/⟨γ₋ᵢ⟩, each of size 3, while the commutator has order 5.
- The combinatorial congruence of §3.3 gives modulus 5/gcd(5, 5·1) = 1, consistent with degree 3.

*Needs:* §2.2; §0.3; Mathlib `Nat.totient`.

### Examples

The cusp formulas on D₆, D₁₀, D₁₄ (u a rotation, h a reflection) give A = ⟨u⟩, trivial center and twist period one, so |A| = 3, 5, 7 and the centralizer obstruction is one. For SL₂(𝔽₃) a generating pair of elements of orders 3 and 4 has M = G and A = Z(G) = {±1}.

### Dependencies

§§0.1, 0.3, 1.2, 1.6, 1.7, 1.9; AlgebraicModuliForArithmeticGeometry §5.1; InverseGaloisAndArithmeticFundamentalGroups §IG.5.4; ArithmeticDynamicsPartII §6.0; ModularCurvesPartII §§3.1, 3.12; Mathlib `Subgroup.centralizer`, `Subgroup.zpowers`, `commutatorElement`, `orderOf`, `Nat.totient`.

## Layer 3: the combinatorial congruence

### 3.1 Positive Nielsen orbits on exterior pairs

A surjection φ : F₂ → G is recorded by its generating pair (φ(a), φ(b)). Define the permutations `nielsenRight` (u, v) ↦ (u, u v) and `nielsenLeft` (u, v) ↦ (v u, v) of G × G; they are precomposition with the automorphisms (a, b) ↦ (a, a b) and (a, b) ↦ (b a, b), whose abelianizations generate SL₂(ℤ). Let `positiveNielsenGroup` be the subgroup of permutations of G × G they generate, and `exteriorInversionGroup` the subgroup generated by simultaneous conjugation and the central move γ₋ᵢ : (u, v) ↦ (u⁻¹, v⁻¹). For a pair (u, v), `coarseNielsenOrbit` is the image of its `positiveNielsenGroup`-orbit in the orbit space of `exteriorInversionGroup`. (Chen, §1.1, p. 305, and the paragraph after Theorem 4.10.5, p. 387; InverseGaloisAndArithmeticFundamentalGroups §IG.3.2.)

The defining API is:

- For a generating pair (u, v), the orbit space of `exteriorInversionGroup` on generating pairs is Epi^ext(F₂, G)/⟨γ₋ᵢ⟩, and `coarseNielsenOrbit` is the Out⁺(F₂)-orbit of the class of (u, v) in it: Aut⁺(F₂) is generated by the two transvections and the inner automorphisms, the inner automorphism by a word w acts on pairs by conjugation by φ(w), and γ₋ᵢ is central in Out⁺(F₂).
- Precomposition is a right action, so the map from automorphisms to permutations of pairs is an anti-homomorphism; the image of the subgroup generated by the transvections is the subgroup generated by their images, so orbits are unaffected, and they coincide with the orbits of the left action e ↦ e ∘ α⁻¹ of InverseGaloisAndArithmeticFundamentalGroups §IG.3.2.
- `nielsenRight` and `nielsenLeft` preserve generating pairs and conjugate the commutator, [u, u v] = u [u, v] u⁻¹ and [v u, v] = v [u, v] v⁻¹, so the commutator class is constant on `positiveNielsenGroup`-orbits; γ₋ᵢ preserves it as well, since (u v)[u⁻¹, v⁻¹](u v)⁻¹ = [u, v].
- The cardinality of `coarseNielsenOrbit` is the coarse degree over the j-line of the corresponding component of M̄(G) (ArithmeticDynamicsPartII §6.0 and §0.3).

**Checks.**

- For G = 1 the orbit is a single point.
- For G = C₂ the orbit of (h, 1) is the three nonzero pairs, of size 3; γ₋ᵢ and conjugation act trivially.
- For G = C₃ the orbit of (h, 1) has 8 pairs and 4 classes modulo γ₋ᵢ; omitting γ₋ᵢ would give 8.
- For G = S₃ the orbit of two transpositions has 3 classes; for D₁₀ there are two orbits of 3 classes each; for A₅ the orbit sizes are 18 and 10 (commutators of orders 3 and 5); for SL₂(𝔽₅) the orbit of a pair with commutator of order 10 has 40 classes, and with commutator of order 6 it has 72.
- The swap (u, v) ↦ (v, u) has abelianization of determinant −1 and sends the commutator to its inverse; adjoining it would replace Out⁺(F₂)-orbits by Out(F₂)-orbits, and in SL₂(𝔽₇) it would merge orbits whose commutators lie in the two different noncentral trace −2 classes.

*Needs:* InverseGaloisAndArithmeticFundamentalGroups §IG.3.2; gap:punctured-torus-nielsen (MappingClassGroupsAndCanonicalRepresentations); Mathlib `Equiv.prodShear`, `Equiv.prodComm`, `Equiv.mulLeft`, `Equiv.inv`, `Subgroup.closure`, `MulAction.toPermHom`, `MulAction.orbit`, `MulAction.orbitRel.Quotient`.

### 3.2 The obstruction pair m′_c and d′_c

For a finite group G and c ∈ G define `cuspVerticalExponent` c = m′_c, the least positive integer killing A(G, u, h) ∩ ⟨[u⁻¹, h⁻¹]⟩ for every generating pair (u, h) with [u, h] conjugate to c; it is the least common multiple of the orders of the elements of these groups, and equals 1 when no such pair exists. Define `centralizerQuotientOrder` c = d′_c = |C_G(⟨c⟩)/⟨c⟩|. Both are invariants of the conjugacy class of c. Each A(G, u, h) ∩ ⟨[u⁻¹, h⁻¹]⟩ is cyclic; by §2.3 it is the stabilizer of a point over the origin of the cusp [[u, h]], and, when c ≠ 1, the vertical automorphism group of the corresponding cuspidal point of the reduced ramification divisor (for c = 1 the divisor is empty and the group is trivial). (Chen, Theorem 4.10.5(a)–(b) and its proof, pp. 386–387.)

The defining API is:

- m′_c is positive and is divisible by the order of every element of A(G, u, h) ∩ ⟨[u⁻¹, h⁻¹]⟩ for every generating pair with [u, h] conjugate to c; it is the least such integer.
- d′_c is a positive integer, since ⟨c⟩ ≤ C_G(⟨c⟩).
- Conjugating c leaves m′_c and d′_c unchanged.
- Every vertical character exponent at a cuspidal point of the reduced ramification divisor of Adm(G)_c divides m′_c, and the degree d_X of §0.1 divides d′_c.

**Checks.**

- For G = 1 and c = 1, both invariants equal 1.
- For D₁₀ and c a nontrivial rotation, m′_c = 5 and d′_c = 1.
- For a class c that is not the commutator class of any generating pair the family is empty and m′_c = 1; this asserts nothing about a nonempty stratum.
- For SL₂(𝔽₅) and c noncentral of trace −2: m′_c = 2 (A = Z(G) = {±1}, which lies in ⟨[u⁻¹, h⁻¹]⟩) and d′_c = 10/10 = 1; every pair in the family contributes the group {±1}.
- For the dihedral group of order 16 with rotation ρ of order 8, reflection σ and c = ρ² of order 4: the pair (ρ, σ) has A = ⟨ρ⟩ and A ∩ ⟨[ρ⁻¹, σ]⟩ = ⟨ρ²⟩ of order 4, while the pair (σ, σρ) has A = {1, ρ⁴} and A ∩ ⟨[σ, ρ⁻¹σ]⟩ = {1, ρ⁴} of order 2; so m′_c = 4, the least common multiple of the element orders 1, 2, 4, not the product 8 of the two group orders and not the order 2 at a single pair; d′_c = |⟨ρ⟩|/4 = 2.
- For A₄ with c of order 2: m′_c = 2 and d′_c = 4/2 = 2.

*Needs:* §2.1; §2.3; §0.1; Mathlib `Subgroup.centralizer`, `Subgroup.zpowers`, `Finset.lcm`, `orderOf`, `IsConj`.

### 3.3 The combinatorial congruence

Let G be a finite group and (u, v) a generating pair, with c = [u, v]. Then |c|/gcd(|c|, m′_c d′_c) divides the cardinality of the Out⁺(F₂)-orbit of the class of (u, v) in Epi^ext(F₂, G)/⟨γ₋ᵢ⟩; this is `combinatorial_congruence`. Equivalently, for every connected component X of Adm(G)_c over an algebraically closed field of characteristic zero, |c|/gcd(|c|, m′_c d′_c) divides deg(X^coarse → P¹_j). The case c = 1 is included and has modulus 1. The theorem bounds the orbit size, not the number of cusps. (Chen, Theorem 4.10.5 and the paragraph after it, pp. 386–387.) Through the Higman class φ([b, a]) the same congruence holds for orbits of fixed Higman class, since the swap (a, b) ↦ (b, a) induces a bijection of the corresponding orbits (Chen, footnote 28, p. 387).

One proof route. If c = 1 there is nothing to prove; otherwise the ramification index is |c| ≥ 2. On the reduced ramification divisor of the universal family over Adm(G)_c, the vertical automorphism groups at smooth points are Z(G) ∩ ⟨c⟩ (ArithmeticDynamicsPartII §6.0), contained in A(G, u, h) ∩ ⟨[u⁻¹, h⁻¹]⟩ for any generating pair with [u, h] conjugate to c; at cuspidal points they are these groups by §2.3; so every vertical group is killed by m′_c and every full automorphism group by 12 m′_c (ArithmeticDynamicsPartII §6.0). By §0.1 the components of the divisor have degree over X dividing d′_c. The coarse degree congruence `12·|c| ∣ m·d·deg` of ArithmeticDynamicsPartII §6.0, with m ∣ 12 m′_c and d ∣ d′_c, gives |c|/gcd(|c|, m′_c d′_c) ∣ deg after cancelling 12. Translate degree into orbit size through the component–orbit comparison of ArithmeticDynamicsPartII §6.0 and §0.3: the coarse fibre is the orbit modulo ⟨γ₋ᵢ⟩.

**Checks.**

- G = 1 and every abelian G give modulus 1.
- For S₄ with c of order 3: m′_c = 1, d′_c = 1, modulus 3, and the single orbit has 9 classes.
- For SL₂(𝔽₅) with c of trace −2 (order 10): modulus 10/gcd(10, 2) = 5, and the orbit has 40 classes; with c of order 6: m′_c = 2, d′_c = 1, modulus 3, orbit of 72 classes.
- For PSL₂(𝔽₇) the orbits with commutators of orders 3, 4, 7 have 18, 16, 7 classes and moduli 3, 4, 7.
- For dihedral groups of order 2k, k odd, the modulus is 1, consistent with degree 3 (§2.5); a version without the m′ correction would predict k ∣ 3, which is false for k = 5.

*Needs:* §3.1; §3.2; §2.3; §0.1; §0.3; ArithmeticDynamicsPartII §6.0 (Theorem 3.5.1 congruence, vertical groups at smooth points, the 12-fold bound, component–orbit comparison).

### Examples

Brute-force enumeration of generating pairs, the two positive transvections, simultaneous conjugation and γ₋ᵢ on S₃, D₁₀, A₄, S₄, SL₂(𝔽₃), A₅, SL₂(𝔽₅) and PSL₂(𝔽₇) gives the following moduli and orbit sizes, each divisible as asserted: S₃ (1, 3); D₁₀ (1, 3 twice); A₄ (1, 4); S₄ (3, 9); SL₂(𝔽₃) (2, 16); A₅ (3, 18 and 5, 10); SL₂(𝔽₅) (3, 72 and 5, 40); PSL₂(𝔽₇) (3, 18; 4, 16; 7, 7).

### Dependencies

§§0.1, 0.3, 2.1, 2.3; ArithmeticDynamicsPartII §6.0; InverseGaloisAndArithmeticFundamentalGroups §IG.3.2; gap:punctured-torus-nielsen; Mathlib `Equiv.prodShear`, `Equiv.prodComm`, `Equiv.mulLeft`, `Equiv.inv`, `Subgroup.closure`, `Subgroup.centralizer`, `Subgroup.zpowers`, `MulAction.toPermHom`, `MulAction.orbit`, `MulAction.orbitRel.Quotient`, `Finset.lcm`, `orderOf`, `IsConj`.

## Layer 4: group-theoretic bounds

### 4.1 Square subgroups from cusp stabilizers

Let ℓ be prime, G a nonabelian finite group and c ∈ G, with r = v_ℓ(|c|) and r + s = v_ℓ(|G|). Assume that G has no proper normal subgroup of order divisible by ℓ. If k = v_ℓ(m′_c) > 0, then G contains a subgroup isomorphic to C_(ℓ^k) × C_(ℓ^k); hence 2k ≤ r + s. Also v_ℓ(d′_c) ≤ s. Consequently v_ℓ(m′_c) ≤ ⌊(r + s)/2⌋. (Chen, Lemmas 4.12.1–4.12.2 and Corollary 4.12.4(a), pp. 389–390, in the case j = 0.) Chen's Lemma 4.12.2 also asserts, for j > 0, a subgroup C_(ℓ^k) × C_(ℓ^(k−j)) under the weaker hypothesis that no proper normal subgroup has order divisible by ℓ^(j+1); its proof shows only that two cyclic subgroups meet in a subgroup of order at most ℓ^j, which does not yield that product (for k = 2, j = 1 an element of order ℓ² and one of order ℓ inside it satisfy the intersection bound but generate a cyclic group). This section states the case j = 0, where the intersection is trivial.

One proof route. Choose a generating pair (u, h) with [u, h] conjugate to c and z ∈ A(G, u, h) ∩ ⟨[u⁻¹, h⁻¹]⟩ of order ℓ^k. Since |A(G, u, h)| divides |u|·|Z(G)| (§2.2) and Z(G) is a proper normal subgroup, of order prime to ℓ, ℓ^k divides |u|. Put U = ⟨u⟩ and U_h = ⟨h⁻¹uh⟩; their intersection is normalized by h (it and its conjugate h⁻¹(U ∩ U_h)h = U_h ∩ h⁻²Uh² are subgroups of the same order of the cyclic group U_h, hence equal; Chen, Lemma 4.12.1 with g = h⁻¹, where equal finite index is the correct invariant for infinite cyclic groups) and by u, hence is normal in G and proper, so its order is prime to ℓ. The cyclic groups ⟨z⟩ ∩ U and ⟨z⟩ ∩ U_h cannot both have nontrivial ℓ-part, since their subgroups of order ℓ would coincide inside ⟨z⟩ and lie in U ∩ U_h. Choose the one with trivial ℓ-part; as z centralizes U and U_h, z and the subgroup of order ℓ^k of that cyclic group generate C_(ℓ^k) × C_(ℓ^k). Lagrange gives 2k ≤ r + s. The bound on d′_c follows from |c|·d′_c = |C_G(⟨c⟩)| dividing |G|.

**Checks.**

- For G = SL₂(𝔽₅), ℓ = 5 and c of order 10: r = 1, s = 0, the proper normal subgroups have orders 1 and 2, v₅(m′_c) = v₅(2) = 0 and v₅(d′_c) = 0, consistent with the bounds 0 ≤ ⌊1/2⌋ and 0 ≤ 0.
- For dihedral G of order 2k with k an odd prime and ℓ = k: the rotation subgroup is a proper normal subgroup of order k, so the hypothesis fails, and indeed v_k(m′_c) = 1 although G contains no C_k × C_k.
- For G = A₅, ℓ = 5, c of order 5: r = 1, s = 0 and m′_c = 1, so the lemma asserts nothing, consistent with the absence of C₅ × C₅.

*Needs:* §2.2; §3.2; Mathlib `Nat.factorization`.

### 4.2 The simple-group congruence

Let G be a nonabelian finite simple group not isomorphic to PSL₂(K) for any finite field K, let (u, v) be a generating pair with c = [u, v], let ℓ be a prime and r = v_ℓ(|c|). If ℓ^(r+1) ≥ |G|^(1/3), equivalently |G| ≤ ℓ^(3(r+1)), then ℓ^(⌈r/2⌉) divides the cardinality of the Out⁺(F₂)-orbit of the class of (u, v) in Epi^ext(F₂, G)/⟨γ₋ᵢ⟩, and hence the coarse j-degree of every component of Adm(G)_c; this is `simple_group_congruence`. The order of c need not be a power of ℓ. (Chen, Corollary 4.12.5(b), p. 391, through Corollary 4.12.4(b) and Theorem 4.12.3; Vdovin, Theorem A.)

One proof route. By Vdovin's theorem every abelian subgroup B of G has |B| < |G|^(1/3) ≤ ℓ^(r+1). If v_ℓ(d′_c) > 0, an ℓ-element z ∈ C_G(⟨c⟩) ∖ ⟨c⟩ generates with c an abelian subgroup of order at least ℓ^(r+1), a contradiction; so v_ℓ(d′_c) = 0. If κ = v_ℓ(m′_c) > r/2, §4.1 (whose hypothesis holds because G is simple and nonabelian) gives C_(ℓ^κ) × C_(ℓ^κ), of order ℓ^(2κ) ≥ ℓ^(r+1), the same contradiction; so v_ℓ(m′_c) ≤ ⌊r/2⌋. Hence v_ℓ of |c|/gcd(|c|, m′_c d′_c) is r − min(r, v_ℓ(m′_c d′_c)) ≥ ⌈r/2⌉, and §3.3 applies.

**Checks.**

- For r = 0 the conclusion is divisibility by ℓ⁰ = 1.
- For G = A₇ (order 2520, not a PSL₂), ℓ = 7 and c of order 7: 7^(3·2) = 117649 ≥ 2520, so 7 divides the orbit size; with ℓ = 5 and c of order 5, 5^6 = 15625 ≥ 2520, so 5 does. Enumeration of the 958 classes of Epi^ext(F₂, A₇)/⟨γ₋ᵢ⟩ gives Out⁺(F₂)-orbits of sizes 21 (four orbits), 28 (two) and 42 (four) for commutators of order 7 and 30, 40, 60, 60 for commutators of order 5, each divisible as asserted; for commutators of order 3 the hypothesis fails (3^6 = 729 < 2520) and nothing is asserted.
- For G = A₅ ≅ PSL₂(𝔽₄) ≅ PSL₂(𝔽₅) the theorem does not apply, and A₅ has an abelian subgroup of order 5 ≥ 60^(1/3) ≈ 3.9; the exclusion of PSL₂ is necessary for Vdovin's bound.
- For G = A₆ ≅ PSL₂(𝔽₉) the theorem does not apply.

*Needs:* §4.1; §3.3; gap:vdovin-abelian-subgroups (CFSGBasicProperties, Vdovin's bound for every nonabelian finite simple group other than PSL₂(𝔽_q)); Mathlib `IsSimpleGroup`, `Matrix.ProjectiveSpecialLinearGroup`, `Nat.factorization`.

### Examples

For G = PSU₃(4), of order 62400, and the four rationally conjugate classes c of order 5 with m′_c = 1, Chen reports components of degrees 1 and 184 (Chen, §4.11, pp. 388–389). The component of degree 1 and §3.3 force 5 ∣ d′_c, so the centralizer obstruction, not the cusp exponent, prevents a congruence modulo 5. §4.2 does not apply there: with ℓ = 5 and r = 1, 5^6 = 15625 < 62400.

### Dependencies

§§2.2, 3.2, 3.3; gap:vdovin-abelian-subgroups (CFSGBasicProperties); Mathlib `IsSimpleGroup`, `Matrix.ProjectiveSpecialLinearGroup`, `Nat.factorization`.

## Layer 5: rank-two trace coordinates

Coefficient rings are commutative. For A, B ∈ SL₂(R) write x = tr A, y = tr B, z = tr AB; by the Fricke identity tr[A, B] = x² + y² + z² − x y z − 2 (Tau Ceti `Matrix.SpecialLinearGroup.trace_commutatorElement_fin_two`), so the fibre of commutator trace t is the level t + 2 surface of ClassicalArithmeticCompletion §4.58, and the commutator trace −2 fibre is the Markoff surface X.

### 5.1 The integral rank-two character scheme

For every commutative ring R, let `SL2Coord` R be the coordinate Hopf algebra 𝒪(SL₂) over R (Tau Ceti `TauCeti.SpecialLinear.coordinateHopfAlgebra`) and `SL2PairCoord` R = 𝒪(SL₂) ⊗_R 𝒪(SL₂) the coordinate ring of SL₂ × SL₂. For an R-algebra S and A, B ∈ SL₂(S), `evalSL2Pair` is evaluation at the S-valued point (A, B), the R-algebra map 𝒪(SL₂ × SL₂) → S whose restrictions to the two factors are the points of SL₂ attached to A and B by Tau Ceti `TauCeti.SpecialLinear.pointsMulEquiv`; for P ∈ GL₂(S), `conjSL2` P A = P A P⁻¹. Let `traceCoordinates` be the three functions tr A, tr B, tr AB on SL₂ × SL₂ (the traces of the generic matrices of the two factors and of their product) and `integralTraceMap` the R-algebra map R[x, y, z] → 𝒪(SL₂ × SL₂) sending x, y, z to them. A function f is `IsGL2ConjugationInvariant` when its values at (P A P⁻¹, P B P⁻¹) and at (A, B) agree for every R-algebra S in the universe of R, every P ∈ GL₂(S) and all A, B ∈ SL₂(S). Evaluating at the universal point, with S = 𝒪(GL₂) ⊗_R 𝒪(SL₂ × SL₂) (which lies in the same universe), shows that these are exactly the invariants of the coaction of the group scheme GL₂ acting by simultaneous conjugation, the equalizer of the coaction and f ↦ f ⊗ 1 (the construction of Tau Ceti `TauCeti.ComoduleAlgebra.coinvariants`); invariance under the group GL₂(R) of R-points alone is weaker. The rank-two SL₂ character scheme is the affine invariant quotient, Spec of this ring of invariants; over ℂ it is the character variety M₂(F₂)_χ with trivial χ of MappingClassGroupsAndCanonicalRepresentations §1.4.

Prove that `integralTraceMap` is injective with image the subalgebra of invariant functions, so that it is an isomorphism R[x, y, z] ≅ 𝒪(SL₂ × SL₂)^(GL₂) and the character scheme is 𝔸³_R; this is `integral_trace_coordinates`. Since it holds for every R, and the base-change isomorphism Tau Ceti `TauCeti.SpecialLinear.coordinateHopfAlgebraBaseChangeIso` sends the generic matrix over R to the generic matrix over S (Tau Ceti `TauCeti.GeneralLinear.coordinateHopfAlgebraBaseChangeIso_hom_genericMatrix`, `TauCeti.SpecialLinear.coordinateHopfAlgebraBaseChangeIso_hom_tmul_coordinateMap`) and hence the trace coordinates over R to those over S, the isomorphism is compatible with every ring map R → S, including nonflat ones: S ⊗_R 𝒪(SL₂ × SL₂)_R^(GL₂) → 𝒪(SL₂ × SL₂)_S^(GL₂) is the identity of S[x, y, z]. (Chen, Theorem 5.2.1 and Definitions 5.2.2–5.2.3, pp. 395–396; Appendix 6.2, Theorem 6.2.2 and Lemma 6.2.3, pp. 426–427.)

The defining API is:

- `SL2PairCoord` R is the coordinate ring of the affine group scheme SL₂ × SL₂ over R, and `evalSL2Pair` identifies its R-algebra maps to S with pairs in SL₂(S), naturally in S.
- `traceCoordinates` evaluate at (A, B) to (tr A, tr B, tr AB), and each is `IsGL2ConjugationInvariant`, since tr(P A P⁻¹) = tr A and (P A P⁻¹)(P B P⁻¹) = P A B P⁻¹; `conjSL2` P A has determinant one.
- `IsGL2ConjugationInvariant` f holds if and only if f lies in the equalizer of the GL₂-conjugation coaction and f ↦ f ⊗ 1; the invariant functions form an R-subalgebra.
- `integral_trace_coordinates`: for every commutative ring R, `integralTraceMap` is injective and its image is the subalgebra of invariant functions.
- The isomorphism commutes with every base change R → S.
- Orbit statements require the absolutely irreducible locus (§5.3); the invariant ring does not separate all orbits.

**Checks.**

- The pair (I, I) has coordinates (2, 2, 2) in every R.
- For A = `[[1, 1], [0, 1]]`, B = `[[1, 0], [1, 1]]` over ℤ the coordinates are (2, 2, 3), and after reduction to 𝔽₂ they are (0, 0, 1); a construction that took both generic matrices from the same factor would give (tr A, tr A, tr A²) = (2, 2, 2).
- After reduction ℤ → 𝔽₂ the same polynomial algebra is obtained; a proof dividing by 2 (for example through a Reynolds operator) is invalid.
- Over the zero ring both 𝒪(SL₂ × SL₂) and R[x, y, z] are zero, and the statement holds with both sides trivial; no nontriviality hypothesis is needed.
- Injectivity holds over every R, with no field or flatness hypothesis: over S = R[x, y, ζ, ζ⁻¹] the pair A = `[[x, 1], [−1, 0]]`, B = `[[0, −ζ], [ζ⁻¹, y]]` has determinants 1 and 1, AB = `[[ζ⁻¹, y − xζ], [0, ζ]]`, and trace coordinates (x, y, ζ + ζ⁻¹); a nonzero polynomial P(x, y, w) of degree n in w with leading coefficient c ≠ 0 becomes P(x, y, ζ + ζ⁻¹) with coefficient c of ζⁿ, which is nonzero, so evaluation at (A, B) composed with `integralTraceMap` is injective. A route that tested algebraic independence only at field-valued points would miss the case where R has nilpotents.
- Invariance under the R-points alone would make the statement false over 𝔽₂: the product N of the six GL₂(𝔽₂)-conjugates of the upper-right entry a₁₂ of A is fixed by the finite group GL₂(𝔽₂), and N ≠ 0 since each factor is a nonzero linear form in the entries of A and 𝒪(SL₂ × SL₂) over 𝔽₂ is a domain. But N vanishes at every pair with a₁₂ = 0, and the trace triples (s + s⁻¹, p + w, s p + c q + s⁻¹ w) of the pairs A = `[[s, 0], [c, s⁻¹]]`, B = `[[p, q], [r, w]]` over 𝔽̄₂ fill all of 𝔸³ (take q = 1, r = p w − 1 and c free), so N is not a polynomial in the traces. Quantifying over every 𝔽₂-algebra S excludes N.
- Reducible pairs with the same semisimplification, such as (I, I) and (`[[1, 1], [0, 1]]`, I), have equal coordinates (2, 2, 2) without being conjugate; the quotient does not classify all orbits.

One proof route: obtain generation of the invariants of pairs of 2 × 2 matrices by traces of words and determinants over every ring, with base change and surjective restriction to SL₂ × SL₂; reduce words in two determinant-one matrices to the three traces by Cayley–Hamilton; prove algebraic independence on a universal three-parameter family.

*Needs:* gap:integral-rank-two-invariants (LanglandsParameterStacks); LanglandsParameterStacks §2.1 (coarse quotients); Tau Ceti `TauCeti.SpecialLinear.coordinateHopfAlgebra`, `TauCeti.SpecialLinear.coordinateMap`, `TauCeti.GeneralLinear.genericMatrix`, `TauCeti.SpecialLinear.pointsMulEquiv`, `TauCeti.ComoduleAlgebra.coinvariants`, `TauCeti.SpecialLinear.coordinateHopfAlgebraBaseChangeIso`, `Matrix.SpecialLinearGroup.trace_commutatorElement_fin_two`; Mathlib `Matrix.SpecialLinearGroup`, `Matrix.GeneralLinearGroup`, `Matrix.trace`, `Algebra.TensorProduct.productMap`, `MvPolynomial.aeval`.

### 5.2 Outer automorphisms in trace coordinates

Over every commutative ring R, right precomposition by Aut(F₂) induces an anti-homomorphism from Aut(F₂) to the group of polynomial automorphisms of 𝔸³_R, which factors through Out(F₂)/⟨−I⟩ ≅ PGL₂(ℤ). The Nielsen generators r : (a, b) ↦ (a⁻¹, b), s : (a, b) ↦ (b, a) and t : (a, b) ↦ (a⁻¹, a b) act by (x, y, z) ↦ (x, y, x y − z), (y, x, z) and (x, z, y), and the central element γ₋ᵢ acts trivially. The image is the group generated by the Vieta move and the coordinate permutations, which over a finite field restricts on the punctured Markoff surface to the group Γ of ArithmeticDynamicsPartII §0.1; no faithfulness is asserted. On R³ the group Γ_(3,1)(R) of ClassicalArithmeticCompletion §4.57 is generated by the permutations this image induces together with the even sign changes (x, y, z) ↦ (ε₁x, ε₂y, ε₁ε₂z). Over every ring in which 4 ≠ 0, for instance ℤ or a field of odd characteristic, it is strictly larger: every element of the image fixes (2, 2, 2), the triple of the pair (I, I), while (x, y, z) ↦ (−x, −y, z) sends it to (−2, −2, 2). Over a ring of characteristic two the even sign changes are the identity and the two groups coincide. ArithmeticDynamicsPartII §6.1 states the finite-field orientation index; this section states the polynomial action over every ring. (Chen, Proposition 5.2.5, pp. 396–397; Chen displays the map with an injective arrow, but it is not injective, since γ₋ᵢ and every inner automorphism act trivially on triples.)

One proof route: compute the three trace transformations from tr(AB) + tr(AB⁻¹) = tr A · tr B; check the composition order of the right action explicitly; inner automorphisms act by simultaneous conjugation and fix the coordinates, and γ₋ᵢ fixes them because tr(A⁻¹B⁻¹) = tr(BA) = tr(AB).

**Checks.**

- The composition rule: φ ∘ (r ∘ t) sends a ↦ φ(a), b ↦ φ(a)⁻¹φ(b), with triple (x, x y − z, y); this is the move of r followed by that of t, and differs from the reverse composite (x, z, x z − y) at (2, 3, 5), giving (2, 1, 3) against (2, 5, 7).
- r² = 1 in Aut(F₂) and its move is an involution: (x, y, x y − z) ↦ (x, y, x y − (x y − z)) = (x, y, z).
- γ₋ᵢ is not inner in F₂ but fixes every triple, so the map is not injective on Out(F₂).
- Over ℤ a single sign change (x, y, z) ↦ (−x, y, z) does not preserve the level surfaces ((1, 1, 1) has level 2 and (−1, 1, 1) level 4), so it is not in the image; over 𝔽₂ it is the identity.
- Negative control for strictness: over 𝔽₂, and over 𝔽₂[ε]/(ε²), −1 = 1, so each even sign change is the identity and adjoining them leaves the group unchanged; (−1, −1, 1) = (1, 1, 1) there, whereas over ℤ the map (x, y, z) ↦ (−x, −y, z) sends (1, 1, 1) to (−1, −1, 1) and (2, 2, 2) to (−2, −2, 2), and no element of the image moves (2, 2, 2).

*Needs:* §5.1; gap:punctured-torus-nielsen (Out(F₂) ≅ GL₂(ℤ)); ClassicalArithmeticCompletion §4.57; ArithmeticDynamicsPartII §0.1; Mathlib `FreeGroup`.

### 5.3 The matrix-algebra criterion

For a commutative ring R and A, B ∈ SL₂(R), the R-subalgebra of M₂(R) generated by A and B is all of M₂(R) if and only if tr[A, B] − 2 = x² + y² + z² − x y z − 4 is a unit of R. Over a field this is equivalent to absolute irreducibility of the representation of F₂ generated by A and B, in the sense of ArithmeticGaloisRepresentations §1.7. Over a general ring the conclusion is the full matrix-algebra condition; no field notion is extended. (Chen, Lemma 5.2.9, p. 398.)

One proof route: by Cayley–Hamilton the generated algebra is the R-span of I, A, B, AB; the determinant of these four elements in the standard basis is, up to sign, tr[A, B] − 2; a surjective endomorphism of R⁴ is an isomorphism exactly when this determinant is a unit; over a field use Burnside's characterization.

**Checks.**

- For A = B = I the quantity is 0 and the algebra is R·I.
- For A = `[[1, 1], [0, 1]]`, B = `[[1, 0], [1, 1]]` the quantity is 1, a unit over every ring, and indeed A − I and B − I are the matrix units E₁₂ and E₂₁.
- For A = `[[1, 2], [0, 1]]`, B = `[[1, 0], [1, 1]]` the triple is (2, 2, 4) and the quantity is 4: over ℤ the generated algebra is the proper sublattice spanned by I, 2E₁₂, E₂₁, 2E₁₁, while over ℚ it is M₂(ℚ).

*Needs:* §5.1; ArithmeticGaloisRepresentations §1.7; Tau Ceti `Matrix.SpecialLinearGroup.trace_commutatorElement_fin_two`; Mathlib `Algebra.adjoin`.

### 5.4 Trace strata of SL₂-covers

For a prime power q and an SL₂(𝔽_q)-cover over ℚ̄, with the roots exp(2πi/n) fixed through a chosen embedding into ℂ, define its trace invariant t = tr(c) ∈ 𝔽_q for a representative c of its Higman class (§0.2). It is independent of the ramification point by conjugation invariance. The t-strata are unions of Higman strata, open and closed, and the invariant descends through central rigidification and GL₂(𝔽_q)-conjugation. Since tr(c⁻¹) = tr(c), the commutator and peripheral conventions give the same t. The root convention is part of the definition: an arbitrary coprime power of c need not have the same trace. (Chen, Definition 5.1.1, p. 392.)

The defining API is:

- t ∈ 𝔽_q is defined for every cover with the fixed root convention.
- The t-locus is exactly the union of the Higman strata of classes of trace t.
- The strata pull back along base change of the coefficient scheme.
- tr(c⁻¹) = tr(c).

**Checks.**

- In odd characteristic −`[[1, 1], [0, 1]]` has trace −2 and order 2p.
- Trace −2 does not force a matrix to equal −I.
- In characteristic 2 the labels 2 and −2 coincide, so they cannot define disjoint strata.
- Over 𝔽₁₁ the element diag(3, 4) has order 5 and trace 7, while its square diag(9, 5), a power with exponent prime to 5, has trace 3; a coprime power need not preserve the trace.

*Needs:* §0.2; Mathlib `Matrix.SpecialLinearGroup`, `Matrix.trace`.

### 5.5 Admissible traces

A conjugacy class, or a trace, of SL₂(𝔽_q) is q-admissible if it is the commutator class, or trace, of a generating pair. The admissible traces are: all t ≠ 2 for q = 2, 4, 8 and q ≥ 13; all t other than 1, 2 for q = 3, 9, 11; all t other than 0, 2, 4 for q = 5; all t other than 0, 1, 2 for q = 7. The trace-t level stack M(SL₂(𝔽_q))_t is nonempty if and only if t is q-admissible. For t ≠ ±2 there is one conjugacy class of trace t. For even q every admissible trace is the trace of a unique admissible class. For odd q there are three classes of trace −2, represented by −I, −`[[1, 1], [0, 1]]` and −`[[1, a], [0, 1]]` with a a nonsquare; when −2 is admissible exactly the two noncentral ones are admissible, and they are exchanged by conjugation by a matrix of nonsquare determinant. (Chen, Definition 5.1.2 and Proposition 5.1.3, pp. 392–393.)

The defining API is:

- Admissibility of a class and of a trace is the existence of a generating pair with that commutator class or trace.
- The trace-t level stack is nonempty exactly for admissible t.
- The admissible traces and the numbers of admissible classes are as listed.
- For odd q with admissible −2, conjugation by a nonsquare-determinant matrix swaps the two noncentral trace −2 classes.

**Checks.**

- For q = 5 exactly the traces 1 and 3 are admissible.
- For q = 3, trace 1 = −2 is excluded and only 0 is admissible; for q = 2 only 1 is admissible.
- For q = 7 the admissible traces are 3, 4, 5, 6.
- Over 𝔽₅ the matrices `[[0, 1], [4, 0]]` and `[[0, 1], [4, 2]]` have traces (0, 2, 3), commutator trace 0 + 4 + 9 − 0 − 2 = 11 = 1, and generate all 120 elements of SL₂(𝔽₅).

One proof route: use the finite-field trace dictionary of ArithmeticDynamicsPartII §6.1 and Dickson's classification to decide which trace fibres contain generating pairs; separate central and noncentral unipotent classes; treat the exceptional fields q ≤ 11 by explicit finite enumeration with q and the admitted set recorded.

*Needs:* §5.4; ArithmeticGaloisRepresentations §4.4; ArithmeticDynamicsPartII §6.1.

### 5.6 The diagonal outer group

For G ≤ SL₂(𝔽_q) define D(q, G) as the image of the normalizer N_(GL₂(𝔽_q))(G) in Out(G), equivalently N_(GL₂(𝔽_q))(G)/(G · C_(GL₂(𝔽_q))(G)). Write D(q) for G = SL₂(𝔽_q). Its orbits on Epi^ext(F₂, G) are the classes of surjections up to GL₂(𝔽_q)-conjugation. Prove that |D(q)| = gcd(2, q − 1), and that |D(q, G)| ≤ 2 whenever G is absolutely irreducible and not dihedral, meaning that its image in PSL₂(𝔽_q) is isomorphic to no dihedral group, the Klein four group included; for q = 2 no subgroup is both, since SL₂(𝔽₂) ≅ S₃ is dihedral and its proper subgroups are cyclic. (Chen, Definition 5.2.12 and Proposition 5.2.13, pp. 400–401; Proposition 6.4.1(b), p. 429, where the quotient N/C is replaced by N/(G·C), since N/C contains the inner automorphisms of G.)

The defining API is:

- D(q, G) is a subgroup of Out(G).
- D(q, G) is the quotient N/(G · C), not N/C.
- Its orbits on exterior pairs are the GL₂(𝔽_q)-conjugacy classes of surjections.
- |D(q)| = gcd(2, q − 1), and D(p) = Out(SL₂(𝔽_p)) for p prime.
- For G absolutely irreducible and not dihedral, |D(q, G)| ≤ 2.

**Checks.**

- For q = 5, D(q) has order 2, whereas N/C contains the inner automorphism group PSL₂(𝔽₅) of order 60.
- For q = 4, D(q) is trivial.
- For a general subgroup G, N/C contains the inner automorphisms and cannot serve as the outer image.
- The non-dihedral hypothesis of the bound is necessary: Q₈ ≤ SL₂(𝔽₃) is absolutely irreducible with Klein four projective image, it is normal in GL₂(𝔽₃) and its centralizer there is the scalars {±I} ⊂ Q₈, so D(3, Q₈) = GL₂(𝔽₃)/Q₈ has order 48/8 = 6.
- The bound is attained by a proper subgroup: for G = SL₂(𝔽₃) ≤ SL₂(𝔽₉), the normalizer in GL₂(𝔽₉) is 𝔽₉^× · GL₂(𝔽₃) (§5.7) and the centralizer is 𝔽₉^×, so D(9, G) ≅ GL₂(𝔽₃)/SL₂(𝔽₃) has order 2; for the binary octahedral subgroup of SL₂(𝔽₇), of order 48, D(7, G) is trivial.

One proof route: map the normalizer to Out(G) by conjugation; its kernel is G · C; for G = SL₂(𝔽_q) the image is detected by determinants modulo squares, with p = 2, 3 treated directly and ArithmeticGaloisRepresentations §4.3 used within its range q ≥ 4. For the bound, Dickson's classification (ArithmeticGaloisRepresentations §4.4) makes the projective image of a non-dihedral absolutely irreducible G one of A₄, S₄, A₅ or conjugate to a subfield PSL₂(𝔽_q′) or PGL₂(𝔽_q′). An element of the normalizer inducing an inner automorphism of the projective image acts on G, after multiplication by an element of G, as x ↦ χ(x)x for a homomorphism χ : G → Z(SL₂(𝔽_q)); conjugation preserves traces, so χ(x) = −1 forces tr x = 0, and in each case of the list the elements of nonzero trace generate G, so χ is trivial. Hence D(q, G) embeds in the image of the normalizer in Out of the projective image, which has order at most 2: Out(A₄) and Out(A₅) have order 2, Out(S₄) is trivial, and in the subfield cases §5.7 rescales every normalizing element into 𝔽_q^× · GL₂(𝔽_q′), which induces at most the class of a nonsquare determinant.

*Needs:* ArithmeticGaloisRepresentations §§4.3, 4.4; §5.7; Mathlib `Subgroup.centralizer`.

### 5.7 Normalizers of SL_n(𝔽_q)

Let q be a prime power and n ≥ 2. The normalizer of SL_n(𝔽_q) in GL_n(𝔽̄_q) is 𝔽̄_q^× · GL_n(𝔽_q), and the same holds for GL_n(𝔽_q) in place of SL_n(𝔽_q); for n = 1 both sides are 𝔽̄_q^×. Consequently a conjugator over the algebraic closure between the standard groups SL_n(𝔽_q) can be rescaled to an 𝔽_q-rational one. (Chen, Proposition 6.3.1, p. 428.)

One proof route: if A normalizes SL_n(𝔽_q), then A⁻¹ Frob(A) centralizes every elementary matrix over 𝔽_q and is therefore scalar; all ratios of nonzero entries of A are Frobenius-fixed; dividing by a nonzero entry gives a matrix over 𝔽_q.

**Checks.**

- For n = 2, q = 2: diag(ω, 1) with ω ∈ 𝔽₄ ∖ 𝔽₂ does not normalize SL₂(𝔽₂), since it conjugates `[[1, 1], [0, 1]]` to `[[1, ω], [0, 1]]`.
- ω·I normalizes SL₂(𝔽_q) for every ω ∈ 𝔽̄_q^× and is the rescaling ambiguity.
- For n = 1 the group SL₁ is trivial and its normalizer is everything, 𝔽̄_q^×.

*Needs:* Mathlib `Matrix.SpecialLinearGroup`, `Matrix.GeneralLinearGroup`.

### Examples

Over 𝔽₂, 𝔽₃, 𝔽₅, 𝔽₇ the trace map on SL₂(𝔽_q)² attains all 8, 27, 125, 343 triples, while the commutator traces of generating pairs are {1}, {0}, {1, 3}, {3, 4, 5, 6}; this separates admissibility from surjectivity of the unrestricted trace map.

### Dependencies

Tau Ceti `Matrix.SpecialLinearGroup.trace_commutatorElement_fin_two`, `TauCeti.SpecialLinear.coordinateHopfAlgebra`, `TauCeti.SpecialLinear.pointsMulEquiv`, `TauCeti.GeneralLinear.genericMatrix`, `TauCeti.ComoduleAlgebra.coinvariants`, `TauCeti.SpecialLinear.coordinateHopfAlgebraBaseChangeIso`; gap:integral-rank-two-invariants; LanglandsParameterStacks §2.1; gap:punctured-torus-nielsen; ClassicalArithmeticCompletion §4.57; ArithmeticGaloisRepresentations §§1.7, 4.3, 4.4; ArithmeticDynamicsPartII §§0.1, 6.1; §0.2; Mathlib `Matrix.SpecialLinearGroup`, `Matrix.trace`, `Matrix.GeneralLinearGroup`, `Algebra.adjoin`, `Subgroup.centralizer`, `FreeGroup`.

## Layer 6: SL₂ level structures

Throughout, q = p^f is a prime power and t ∈ 𝔽_q; X_t(q) is the level t + 2 surface, and its non-dihedral locus X_t*(q) is the set of triples coming from absolutely irreducible pairs whose projective image is neither trivial nor dihedral, equivalently for t ≠ 2 the triples with at least two nonzero coordinates (ArithmeticDynamicsPartII §6.1).

### 6.1 Epimorphic trace loci

Let X_t°(q) be the set of triples of pairs generating SL₂(𝔽_q) with commutator trace t. For every prime power q both X_2°(q) and X_2*(q) are empty. For q ≥ 3 and every t ∈ 𝔽_q, X_t°(q) ⊆ X_t*(q); for q = 2 the non-dihedral locus is empty (SL₂(𝔽₂) ≅ S₃ is dihedral) while X_1°(2) is not. (Chen, Definitions 5.2.14–5.2.15 and Proposition 5.2.16(a)–(c), pp. 401–402.) For every prime p ≥ 3 and t = −2, ArithmeticDynamicsPartII §6.1 identifies both loci with the punctured Markoff surface X*(𝔽_p), which has 40 points at p = 5 and none at p = 3, and with the trace dictionary of that section the trace map is a bijection Epi(F₂, SL₂(𝔽_p))_(−2)/GL₂(𝔽_p) → X*(𝔽_p); no such equality is asserted for proper prime powers (Chen, Proposition 5.2.17, p. 402; (1.2), p. 307). The coordinate description of X_t*(q) for t ≠ 2, Chen's Proposition 5.2.16(d), is also ArithmeticDynamicsPartII §6.1; in Chen's proof of it absolute irreducibility is equivalent to commutator trace different from 2, not equal to 2, and the dihedral case with one rotation and one reflection must be added: the reflection and the product are involutions, so two traces vanish.

One proof route: a generating pair of SL₂(𝔽_q) has image SL₂(𝔽_q), whose span is M₂(𝔽_q), so the pair is absolutely irreducible (ArithmeticGaloisRepresentations §1.7) and its commutator trace is not 2 (§5.3); at t = 2 no pair is absolutely irreducible, which empties both loci. For q ≥ 3 the projective image PSL₂(𝔽_q) is neither trivial nor dihedral: PSL₂(𝔽₃) ≅ A₄ has no subgroup of index two, and PSL₂(𝔽_q) is nonabelian simple for q ≥ 4. For q = 2 every subgroup of SL₂(𝔽₂) ≅ S₃ is cyclic, hence not absolutely irreducible, or dihedral, while generating pairs exist.

**Checks.**

- Over 𝔽₃ the matrices u = `[[1, 1], [0, 1]]` and h = `[[0, −1], [1, 0]]` have orders 3 and 4, so they generate SL₂(𝔽₃), which has order 24 and no subgroup of order 12; with u h = `[[1, −1], [1, 0]]` their triple is (2, 0, 1), with two nonzero coordinates, and the commutator trace is 4 + 0 + 1 − 0 − 2 = 3 = 0 ≠ 2, so the point lies in X_0°(3) ∩ X_0*(3).
- Over 𝔽₂ the punctured zero-level surface has four points, but X_(−2)°(2) = ∅ because −2 = 2.
- At q = 2 the inclusion X_t° ⊆ X_t* fails at t = 1, so no blanket statement for all q holds.

*Needs:* §5.3; ArithmeticGaloisRepresentations §1.7; ArithmeticDynamicsPartII §6.1 (the prime-field trace −2 equality and the coordinate description of the non-dihedral locus); ClassicalArithmeticCompletion §4.58; Mathlib `Matrix.SpecialLinearGroup`.

### 6.2 Branch cycles in trace coordinates

Let φ : F₂ → SL₂(𝔽_q) have absolutely irreducible non-dihedral image G (for q = 2 there is no such φ, as in §6.1). Under the trace dictionary of ArithmeticDynamicsPartII §§6.0–6.1, the fibre of M(G)/D(q, G) over a geometric elliptic curve is Epi^ext(F₂, G)/D(q, G), identified with the triples whose pairs have image GL₂-conjugate to G; an Out⁺(F₂)-orbit O corresponds to a coarse component of degree |O|, because γ₋ᵢ acts trivially on triples. The branch permutations of §0.3 act by γ₀ (x, y, z) ↦ (x y − z, x, x² y − x z − y), γ₁₇₂₈ (x, y, z) ↦ (y, x, x y − z) and γ∞ (x, y, z) ↦ (x, z, x z − y), with γ∞ ∘ γ₁₇₂₈ ∘ γ₀ = id on triples; the fibres above 0, 1728, ∞ are their cycles and the ramification index at a point is its cycle length. (Chen, Proposition 5.2.20 and Remark 5.2.21, pp. 403–404; in the matrix of Remark 5.2.21 for γ∞ the upper-right entry is +1.)

One proof route: descend the finite-field trace bijection by the normalizer action and restrict to one image type; compute the three trace transformations with the anti-homomorphism convention of §5.2; apply §0.3 for the coarse branch cycles.

**Checks.**

- An absolutely irreducible dihedral image does not give a point of X_t*: over 𝔽₇, diag(2, 4) and `[[0, 6], [1, 0]]` have triple (6, 0, 0) and commutator trace 6 ≠ 2; the non-dihedral hypothesis cannot be dropped.
- γ∞ fixes the first coordinate: (x, y, z) ↦ (x, z, x z − y), so (3, 3, 3) ↦ (3, 3, 6).
- γ₁₇₂₈² is the identity on triples, while its class in Out(F₂) is −I; this accounts for the coarse involution.
- On X*(𝔽₅) (40 points) γ₀ has 14 cycles, γ₁₇₂₈ 20 and γ∞ 8, and γ∞ ∘ γ₁₇₂₈ ∘ γ₀ fixes every point.

*Needs:* §0.3; §5.2; §5.6; §6.1; ArithmeticDynamicsPartII §§6.0, 6.1; ClassicalArithmeticCompletion §4.57.

### 6.3 Rotation slices at arbitrary level

For a, t ∈ 𝔽_q with t ≠ 2 let C₁(a)_t be the slice x = a of X_t(q), the conic y² + z² − a y z + (a² − 2 − t) = 0, and C₁(a)_t* = C₁(a)_t ∩ X_t*(q). The rotation γ∞ acts on (y, z) by L_a = `[[0, 1], [−1, a]]`, whose characteristic polynomial is X² − a X + 1, and every point of C₁(a)_t* has (y, z) ≠ (0, 0). This extends ArithmeticDynamicsPartII §2.1 from the prime-field zero level to every level t ≠ 2 over every finite field. (Chen, proof of Lemma 5.3.1, pp. 406–409.)

The defining API is:

- C₁(a)_t and C₁(a)_t* are the slice of the level surface and its non-dihedral part.
- γ∞ restricts to multiplication by L_a on the slice.
- L_a is classified by X² − a X + 1 over 𝔽_q: split with distinct roots, irreducible, or with a repeated root.
- Formation of the slice, of its non-dihedral part and of L_a commutes with every embedding 𝔽_q ↪ 𝔽_q′, and the embedding preserves the γ∞-period of every point of the smaller slice, since L_aⁿ P = P is an equation between coordinates and the embedding is injective; the larger field can only add points, for instance on a slice whose polynomial X² − a X + 1 is irreducible over 𝔽_q and splits over 𝔽_q′.

**Checks.**

- For odd q and a = 2 the slice is (y − z)² = t − 2.
- A nonsplit degenerate slice with a² = t + 2 consists of the single point (a, 0, 0), which X_t* removes; the full affine conic is not empty.
- Over 𝔽₄ with a satisfying a² + a + 1 = 0, X² + a X + 1 is irreducible and L_a has order 5, although the discriminant a² is a square.
- Embeddings keep periods and add points. Over 𝔽₅ with a = 0, t = −2, the point (0, 1, 2) has (y, z)-orbit (1, 2), (2, 4), (4, 3), (3, 1) of length 4, and the same four pairs form its orbit over 𝔽₂₅. For a = 1, t = 4 the slice over 𝔽₅ is the single point (1, 0, 0), while over 𝔽₂₅, where X² − X + 1 splits into two primitive sixth roots of unity, it is two lines through (1, 0, 0) with 2·25 − 1 = 49 points; the 48 new points lie in C₁(1)_4* and have period 6, and the old point keeps period 1.

*Needs:* ClassicalArithmeticCompletion §4.58; ArithmeticDynamicsPartII §§2.1, 6.1; §6.2.

### 6.4 The exact rotation order

For q ≥ 3, t ≠ 2 and P = (a, y, z) ∈ C₁(a)_t with (y, z) ≠ (0, 0), the γ∞-orbit of P has length n_q(a), the order of a noncentral element of SL₂(𝔽_q) of trace a (ArithmeticDynamicsPartII §6.2, `traceOrder`); in particular this holds on C₁(a)_t*. Correspondingly, the γ∞-orbit of an absolutely irreducible representation φ with (tr φ(b), tr φ(ab)) ≠ (0, 0), modulo the diagonal outer action and conjugacy, has length the order of φ(a). (Chen, Lemma 5.3.1 and its proof, pp. 405–409.)

One proof route: for distinct eigenvalues λ ≠ λ⁻¹ diagonalize L_a over 𝔽_q or 𝔽_q²; since λ and λ⁻¹ have the same order, every nonzero vector has period ord(λ) = n_q(a), whether both of its eigencoordinates are nonzero or it lies on an eigenline, so L_a acts freely with orbits of that length on the punctured plane and only (y, z) ≠ (0, 0) is used (Chen, proof of Lemma 5.3.1, p. 408); eigenline points occur, as the two lines of a split degenerate slice; for a = ±2 in odd characteristic use the nontrivial Jordan block, where t ≠ 2 excludes the fixed eigenline; in characteristic 2 with a = 0, L_0 swaps y and z and t ≠ 2 excludes y = z; translate through the trace bijection, an absolutely irreducible representation having noncentral first matrix, since a central φ(a) would make the image abelian.

**Checks.**

- At p = 5 the slice a = 0 of X*(𝔽₅) has 8 points in two 4-cycles, n₅(0) = 4; the slice a = 2 has 10 points, all of period n₅(2) = 5, and the slice a = −2 has 10 points, all of period n₅(−2) = 10.
- At a = 2 the eigenvalue is 1 but the period is p, not 1.
- Over 𝔽₄ with X² + a X + 1 irreducible the period is 5, which divides q + 1 = 5 and not q − 1 = 3.
- Eigenline points keep the full period: over 𝔽₇ with a = 1, t = 6 the point P = (1, 1, 3) satisfies 1 + 9 − 3 + (1 − 2 − 6) = 0, lies in C₁(1)_6* since all coordinates are nonzero, and is an eigenvector, L₁(1, 3) = (3, 2) = 3·(1, 3); its orbit (1, 3), (3, 2), (2, 6), (6, 4), (4, 5), (5, 1) has length 6 = ord₇(3) = n₇(1). A route that discarded eigenline points would leave these points without a period.
- Points outside the non-dihedral locus are covered: over 𝔽₅ with t = −1 the point P = (0, 1, 0) lies on the level-one surface, has a single nonzero coordinate, so P ∉ X_(−1)*(5) and its representations are of dihedral type, and its (y, z)-orbit (1, 0), (0, 4), (4, 0), (0, 1) has length 4 = n₅(0).

*Needs:* §6.3; ArithmeticDynamicsPartII §§6.1, 6.2; Mathlib `Function.minimalPeriod`, `orderOf`.

### 6.5 Split, nonsplit and parabolic slices

Let q be odd and t ≠ 2. For a = ±2 the full conic C₁(a)_t is empty if t − 2 is a nonsquare and otherwise is two parallel lines with 2q points. If X² − a X + 1 has distinct roots in 𝔽_q, the conic has q − 1 points when a² ≠ t + 2, and 2q − 1 points, two intersecting lines, when a² = t + 2. If X² − a X + 1 is irreducible, it has q + 1 points when a² ≠ t + 2 and exactly the single point (a, 0, 0) when a² = t + 2. The split and irreducible counts hold verbatim for even q and a ≠ 0, where X² − a X + 1 is separable. For even q, a = 0 (the repeated-root case, since 2 = −2 = 0) and t ≠ 0, C₁(0)_t has q points and its rotation orbits have size 2. These statements concern the full conic; X_t* additionally removes the points with fewer than two nonzero coordinates. This extends the slice classification of ArithmeticDynamicsPartII §2.2 from the prime-field zero level to every level and every finite field. (Chen, proof of Lemma 5.3.1, pp. 406–409; Chen's nonsplit degenerate case is corrected to the single point (a, 0, 0).)

One proof route: for repeated roots complete the square in y ∓ z and use t − 2 ≠ 0; for split distinct roots factor the quadratic form into two independent linear forms; for irreducible X² − a X + 1 identify the form with the norm of y − λz from 𝔽_q² to 𝔽_q for a root λ, whose nonzero fibres have q + 1 elements and whose zero fibre is the origin; neither argument divides by 2, so both apply for even q and a ≠ 0; in characteristic 2 with a = 0 the squaring map is bijective, y + z is fixed to a nonzero value, and swapping has no fixed point.

**Checks.**

- Over 𝔽₅ with a = 1, t = 4: X² − X + 1 is irreducible and a² = 1 = t + 2, so the full slice is the single point (1, 0, 0) and the non-dihedral slice is empty.
- At p = 5, t = −2, a = 0: X² + 1 splits and a² = 0 = t + 2, so the conic y² + z² = 0 has 2·5 − 1 = 9 points, and removing the origin leaves the 8 points of §6.4.
- At p = 5, t = −2, a = 2: t − 2 = −4 = 1 is a square, giving 10 points.
- Over 𝔽₄ with a² + a + 1 = 0 and t = 1: X² + a X + 1 has no root in 𝔽₄, a² = a + 1 ≠ t + 2 = 1, and the conic y² + z² + a y z = a² + 1 = a has q + 1 = 5 points; a classification restricted to odd q and the slice a = 0 would leave this slice uncounted.

*Needs:* §6.3; §6.4; ArithmeticDynamicsPartII §2.2.

### 6.6 SL₂ vertical automorphisms and representability

Let q be a prime power and let G ≤ SL₂(𝔽_q) be absolutely irreducible, that is, its 𝔽_q-span is M₂(𝔽_q) (ArithmeticGaloisRepresentations §1.7), and not dihedral, that is, its image in PSL₂(𝔽_q) is isomorphic to no dihedral group, the Klein four group included. For q = 2 no subgroup satisfies both hypotheses (last Check), so the statement has content only for q ≥ 3, the range of Chen's Theorem 5.3.2. Then G contains Z(SL₂(𝔽_q)), so Z(G) = Z(SL₂(𝔽_q)), and for every generating pair (u, h) of G the cusp automorphism group A(G, u, h) of §2.1 equals Z(SL₂(𝔽_q)): every element of G centralizing u and h⁻¹u⁻¹h whose commutator with h lies in ⟨u⟩ is central in SL₂(𝔽_q). This finite-group statement is `sl2_cusp_automorphism_central`. Consequently all geometric vertical automorphism groups of Adm(G) in characteristic zero equal Z(G), and M̄(G) → M̄(1) is representable (§2.3). On the reduced ramification divisor of the Higman-c stratum the vertical group is Z(SL₂(𝔽_q)) ∩ ⟨c⟩: trivial for even q, and for odd q of order 2 exactly when n_q(tr c) is even, which includes the noncentral trace −2 case of order 2p. (Chen, Theorem 5.3.2, pp. 405–406; Proposition 6.4.1(a), pp. 428–429.)

One proof route. Centre: Z(G) commutes with the span M₂(𝔽_q) of G, so it consists of scalars and Z(G) ≤ Z(SL₂(𝔽_q)). Conversely, Z(SL₂(𝔽_q)) is trivial for even q; for odd q, a subgroup of SL₂(𝔽_q) of odd order maps isomorphically onto a subgroup of odd order of PSL₂(𝔽_q), which by Dickson's classification (ArithmeticGaloisRepresentations §4.4) fixes a point of P¹ over 𝔽̄_q, so the subgroup fixes a line and is not absolutely irreducible; hence |G| is even, and −I is the only element of order 2 in SL₂(𝔽_q). Cusp groups: the trace triple of a generating pair (u, h) of G lies in X_t*(q) with t = tr[u, h] ≠ 2 (§5.3) and u is noncentral, so by §6.4 its γ∞-orbit has length n_q(tr u) = |u|; the pairs (u, h) and (u, u^k h) have the triples P and γ∞^k P, so they are conjugate in G only when |u| divides k, that is k_(u,h) = |u|; then A(G, u, h) = Z(G) by §2.2, and §2.3 gives representability; intersect with the inertia group at a marked ramification point.

**Checks.**

- For G = SL₂(𝔽₅) and c of trace −2 (order 10): Z ∩ ⟨c⟩ = {±1}, of order 2, and n₅(−2) = 10 is even.
- Over 𝔽₇, trace 3 has n = 8 (even) and vertical group of order 2, while trace 6 has n = 3 (odd) and trivial vertical group.
- The dihedral group D₁₀ ≤ SL₂(𝔽₄), the normalizer of a nonsplit torus, is absolutely irreducible but dihedral, and its cusps have A = ⟨u⟩ of order 5 ≠ Z = 1, so its compactified map is not representable; the non-dihedral hypothesis is necessary.
- Q₈ ≤ SL₂(𝔽₃) is absolutely irreducible with Klein four projective image, so it is dihedral in the sense used here: it contains −I, but for its generating pair (i, j) the element i centralizes i and j⁻¹i⁻¹j = i, and [i, j] = −I ∈ ⟨i⟩, so i ∈ A(Q₈, i, j) is not central; reading "dihedral" as excluding only dihedral groups of order at least 6 would admit this counterexample.
- Proper subgroups occur: the subgroup SL₂(𝔽₃) of SL₂(𝔽₅) (projective image A₄) and the binary octahedral subgroup of SL₂(𝔽₇) (projective image S₄) contain −I, and enumeration of their 384 and 864 generating pairs gives A(G, u, h) = {±I} for each.
- For q = 2 no subgroup satisfies the hypotheses: SL₂(𝔽₂) ≅ S₃ is dihedral and its proper subgroups are abelian; there the conclusion fails, since for u a 3-cycle and h a transposition A(S₃, u, h) = ⟨u⟩ has order 3 (§2.1), on 6 of the 18 generating pairs.

*Needs:* §2.1; §2.2; §2.3; §5.3; §6.4; ArithmeticDynamicsPartII §§6.0, 6.2; ArithmeticGaloisRepresentations §§1.7, 4.4; Mathlib `Matrix.SpecialLinearGroup`, `Subgroup.center`, `Subgroup.map`, `QuotientGroup.mk'`, `DihedralGroup`, `Submodule.span`.

### Examples

At p = 5, X*(𝔽₅) has 40 points; under γ∞ the slice a = 0 splits into two 4-cycles, the slice a = 2 into two 5-cycles, the slice a = −2 into one 10-cycle, the slice a = 1 into one 6-cycle and the slice a = −1 into two 3-cycles, for 8 cycles on 40 points; the fixed point of γ₀ is (3, 3, 1).

### Dependencies

§§0.3, 2.2, 2.3, 5.2, 5.3, 5.6; ArithmeticDynamicsPartII §§2.1, 2.2, 6.0, 6.1, 6.2; ArithmeticGaloisRepresentations §§1.7, 4.4; ClassicalArithmeticCompletion §§4.57, 4.58; Mathlib `Matrix.SpecialLinearGroup`, `Function.minimalPeriod`, `orderOf`, `Subgroup.center`, `Subgroup.map`, `QuotientGroup.mk'`, `DihedralGroup`, `Submodule.span`.

## Layer 7: Markoff modular geometry

Throughout, p ≥ 5 is prime, X* = X*(𝔽_p), D = |X*| = p(p + 3) for p ≡ 1 (mod 4) and p(p − 3) for p ≡ 3 (mod 4) (ArithmeticDynamicsPartII §2.3), and "transitive" means that Γ acts transitively on X*.

### 7.1 Markoff components and Higman classes

Assume Γ is transitive on X*. Then the orientation-preserving image is transitive (ArithmeticDynamicsPartII §6.6), the stack M(SL₂(𝔽_p))_(−2) has exactly two geometric connected components, distinguished by the two noncentral trace −2 Higman classes and exchanged by the involution of D(p), each coarse component is isomorphic to the coarse absolute level curve M_p of M(SL₂(𝔽_p))_(−2)/D(p) and has j-degree D, and its compactification is a smooth proper geometrically connected curve. (Chen, Theorem 5.5.7(b), p. 416; opening of §5.6 and Theorem 5.6.3, pp. 417–418.) The hypothesis p ≥ 5 is needed: at p = 3 the trace −2 equals 1 and X*(𝔽₃) is empty (Chen's Theorem 1.2.10 omits it).

One proof route: by ArithmeticDynamicsPartII §6.1 and §6.2 the fibre of M(SL₂(𝔽_p))_(−2)/D(p) is X*; the Γ⁺-orbit is all of X*; the two Higman classes are interchanged freely by D(p), so an orbit on the quotient meets each class in exactly one orbit on exterior pairs; use §6.2 for the coarse degree and the compactification of ArithmeticDynamicsPartII §6.0, and base-change invariance from ℚ̄ to every algebraically closed field of characteristic zero.

**Checks.**

- p = 5: D = 40; p = 7: D = 28; p = 13: D = 208.
- At p = 3 the punctured surface is empty and no connected curve is obtained.
- The coordinate swap fixes (3, 3, 3) and reverses orientation, so Γ-transitivity gives Γ⁺-transitivity; without such a fixed point two Γ⁺-orbits exchanged by Γ could occur.

*Needs:* §§0.6, 5.5, 5.6, 6.2; ArithmeticDynamicsPartII §§2.3, 6.0, 6.1, 6.6; InverseGaloisAndArithmeticFundamentalGroups §IG.1.3.

### 7.2 Branch and cusp counts

Assume Γ is transitive on X*. The fibre of the compactified M_p over j = 0 has (D + 2)/3 points: exactly one fixed triple of γ₀, which is (3, 3, 6) (equal to (3, 3, 1) at p = 5), all other γ₀-cycles having length 3. The fibre over 1728 has (D + f_p)/2 points, where f_p = 2 for p ≡ ±1 (mod 8) and f_p = 0 for p ≡ ±3 (mod 8). The fibre over ∞ has C_p points, where C_p is the number of γ∞-orbits on X*, given by ArithmeticDynamicsPartII §2.4 as C_p = ((p − 1)/2)Φ(p − 1) + ((p + 1)/2)Φ(p + 1) + κ_p with κ_p = (−5p + 11)/4 for p ≡ 1 (mod 4) and (−7p − 1)/4 for p ≡ 3 (mod 4), and Φ(n) = Σ_(d ∣ n) φ(d)/d. (Chen, Propositions 5.6.1–5.6.2 and proof of Theorem 5.6.3, p. 418.) Chen's Proposition 5.6.1(a) prints (D − 3)/3 for the count over 0; the correct count is (D + 2)/3.

One proof route: solve the γ₀ and γ₁₇₂₈ fixed-point equations with the formulas of §6.2 (γ₀ has order 3 and γ₁₇₂₈ order 2 on triples); translate cycles into points of the fibres by §6.2; take C_p from ArithmeticDynamicsPartII §2.4, since γ∞ is the rotation there and γ₋ᵢ acts trivially.

**Checks.**

- p = 5: 14 points over 0, 20 over 1728, 8 cusps; the fixed triple is (3, 3, 1), and (40 − 3)/3 is not an integer.
- p = 7: 10, 15, 5; p = 11: 30, 44, 14.
- f_p distinguishes p = 7 (f = 2, (28 + 2)/2 = 15) from p = 5 (f = 0, 40/2 = 20).

*Needs:* §7.1; §6.2; ArithmeticDynamicsPartII §§2.3, 2.4; Mathlib `Nat.totient`.

### 7.3 The genus formula

Assume Γ is transitive on X*. The common genus of the two compactified trace −2 components is p²/12 − ((p − 1)/4)Φ(p − 1) − ((p + 1)/4)Φ(p + 1) + ε_p, where ε_p = 7p/8 − 29/24, 5p/8 + 19/24, 7p/8 − 17/24, 5p/8 + 7/24 for p ≡ 1, 3, 5, 7 (mod 8). It is 0, 0, 1 for p = 5, 7, 11 and at least 2 for every p ≥ 13 satisfying the hypothesis. (Chen, Theorem 5.6.3 and proof, pp. 418–419.)

One proof route: apply Riemann–Hurwitz (SchemeAndStackFoundations §3.2) to the smooth proper connected coarse curve with its three branch fibres, or equivalently form the connected branch triple (γ₀, γ₁₇₂₈, γ∞) on X*, which satisfies σ∞ σ₁ σ₀ = 1 by §6.2, and use `TauCeti.PermutationTriple.IsConnected.two_sub_two_mul_genus`; substitute D and the counts of §7.2 and simplify by p modulo 8. For the lower bound use Φ(n) ≤ τ(n) ≤ 2√n and ε_p ≥ p/2, which give genus ≥ p²/12 − (p − 1)^(3/2)/2 − (p + 1)^(3/2)/2 + p/2; for p ≥ 2304, (p ± 1)^(3/2) < 3p^(3/2) and √p ≥ 48 make this exceed p^(3/2) + p/2 > 2; for the 337 primes 13 ≤ p < 2304 the formula, evaluated exactly, has minimum 5, attained at p = 13.

**Checks.**

- p = 5: 25/12 − 2 − 15/4 + (35/8 − 17/24) = 0, with Φ(4) = 2 and Φ(6) = 5/2.
- p = 13, 17, 19, 23, 29, 31: genus 5, 10, 9, 18, 35, 38, agreeing with 1 + (D − c₀ − c₁₇₂₈ − c∞)/2 computed from the cycle counts of §7.2.
- The formula takes integer values at every prime 5 ≤ p < 2304; a numerator D − 3 in the count over 0 would make it nonintegral at p = 5.

*Needs:* §7.2; §6.2; SchemeAndStackFoundations §3.2; Tau Ceti `TauCeti.PermutationTriple`, `TauCeti.PermutationTriple.genus`, `TauCeti.PermutationTriple.IsConnected.two_sub_two_mul_genus`.

### 7.4 Finiteness of elliptic j-invariants

Let K be a number field and p ≥ 13 a prime for which Γ is transitive on X*. Then only finitely many j ∈ K are j-invariants of elliptic curves corresponding to K-rational points of either compactified trace −2 component; in particular only finitely many j-invariants occur among elliptic curves E over K carrying a geometrically connected SL₂(𝔽_p)-torsor over E ∖ O with trace invariant −2. Finiteness of K-isomorphism classes of such curves is not asserted: quadratic twists preserve j and can give infinitely many classes. (Chen, Theorem 5.6.4, p. 419, with the conclusion corrected from isomorphism classes to j-invariants.)

One proof route: extend K finitely so that each relevant component is defined and geometrically connected; by §7.3 it has genus at least 2, so Faltings's theorem gives finitely many rational points; map them to the j-line and descend the finite set of j-invariants; an actual torsor gives a rational point of the level stack, hence of the coarse curve.

**Checks.**

- For p = 5, 7 the genus is 0 and for p = 11 it is 1, so no finiteness follows from this argument.
- The map to the j-line forgets the level information, not the coarse curve: at p = 13 the coarse component has degree 208 and j = 1 is not a branch value, so above j = 1 lie 208 distinct geometric points, all rational over a finite extension of K and all with the same image. On the elliptic-curve side, for j ≠ 0, 1728 an elliptic curve E over K and its quadratic twists by the classes of K^×/K^(×2) have the same j and are pairwise non-isomorphic over K; so the finiteness conclusion is about the image in the j-line of the finite set of rational points, not about K-isomorphism classes of curves.

*Needs:* §7.3; HeightsRationalPointsAndObstructions §4.6 (`mordell_finite`); §7.1.

### 7.5 The projective absolute-level quotient

Central twists by Hom(F₂, {±I}) act on X* by the Klein four group (x, y, z) ↦ (ε₁x, ε₂y, ε₁ε₂z), which is the even sign-change action of ClassicalArithmeticCompletion §4.57 and the block structure Y* = X*/(even sign changes) of ArithmeticDynamicsPartII §7.2. It is free on X*, so its blocks have four points and |Y*| = D/4 (ArithmeticDynamicsPartII §7.2). The quotient Y* is the trace fibre of absolute PSL₂(𝔽_p)-structures; under transitivity the associated coarse component N_p has degree d_p = D/4 over the j-line. (Chen, §5.6, pp. 419–420, the paragraphs before Theorem 5.6.6 and its proof; Theorem 5.6.6, p. 420.)

The defining API is:

- Central twists correspond exactly to the even sign changes.
- The sign quotient is identified with the fibre of the projective absolute level stack.
- The coarse degree of N_p is d_p = |Y*|.

**Checks.**

- p = 5: D = 40 and d_p = 10; p = 7: D = 28 and d_p = 7.
- Central twists give only even sign changes: the twist by the character a ↦ −I, b ↦ I replaces (A, B, A B) by (−A, B, −A B), so (x, y, z) becomes (−x, y, −z). A single sign change is no twist and leaves X: over 𝔽₅, (3, 3, 3) ∈ X*, while (−3, 3, 3) = (2, 3, 3) gives 4 + 9 + 9 − 18 = 4 ≠ 0.
- At p = 5 the fibre is recomputed on the group side: PSL₂(𝔽₅) ≅ A₅ has 1200 generating pairs whose commutator has order 5, the images, four to one, of the 4800 generating pairs of SL₂(𝔽₅) with commutator trace −2; Aut(A₅) ≅ S₅ acts freely on them with 10 = |Y*| orbits, while inner automorphisms alone leave 20 classes, so the quotient by D(5) is needed.

One proof route: identify central twists with the even sign action; compare lifts of projective representations and quotient by projective outer automorphisms through the full SL₂ trace fibre and the two Higman classes.

*Needs:* §7.1; §0.6; ClassicalArithmeticCompletion §4.57; ArithmeticDynamicsPartII §§6.1, 7.2; ArithmeticGaloisRepresentations §4.3.

### 7.6 Large projective monodromy

Let P_MP be the set of primes p ≥ 5 for which Γ is transitive on X* and MP(p) holds (ArithmeticDynamicsPartII §7.3: p ≡ 1 (mod 4), or p ≡ 3 (mod 4) and the order of a root of X² − 3X + 1 in 𝔽_p²^× is at least 32√(p + 1)). For p ∈ P_MP the geometric monodromy group of N_p → P¹_j is the symmetric group S_(d_p) when p ≡ 5, 7, 9, 11 (mod 16) and the alternating group A_(d_p) when p ≡ 1, 3, 13, 15 (mod 16). (Chen, Theorem 5.6.6, p. 420; condition (5.8) and Theorem 5.5.8, pp. 416–417; Meiri–Puder, Theorems 1.3–1.4; Bell–Booher–Chen–Liu, Propositions 3.3.2–3.3.3 and Corollary 3.3.4, for the parity.) Meiri and Puder show that the order condition holds for a set of primes p ≡ 3 (mod 4) of density one among them (Meiri–Puder, §1 and Appendix A), so with the finiteness of the non-transitive primes (ArithmeticDynamicsPartII §4.2) P_MP has density one among all primes.

One proof route: the block group Q_p of the full Γ-action on Y* contains A_(d_p), by ArithmeticDynamicsPartII §7.4a for p ≡ 1 (mod 4) and by the alternating containment requested from ArithmeticDynamicsPartII for p ≡ 3 (mod 4); the orientation-preserving image is normal of index at most two in Q_p (ArithmeticDynamicsPartII §6.1), and A_(d_p) has no subgroup of index two, so the orientation-preserving image contains A_(d_p); transfer this image to the geometric fibre through §§7.1 and 7.5. The geometric monodromy group is generated by the projective γ₀ and γ₁₇₂₈, whose abelianizations generate SL₂(ℤ), so it is A_(d_p) exactly when both are even. On Y*, γ₀³ and γ₁₇₂₈² equal γ₋ᵢ, which fixes every triple, so γ₀ has cycles of lengths 1 and 3 and is even, and γ₁₇₂₈ is an involution; since γ∞ ∘ γ₁₇₂₈ ∘ γ₀ = id (§6.2), γ∞ has the sign of γ₁₇₂₈. A triple fixed by γ₁₇₂₈ up to an even sign change satisfies x² = 8 and is one of the four sign changes of (x, x, 4), so γ₁₇₂₈ has u_p fixed points on Y*, with u_p = 1 for p ≡ ±1 (mod 8) and u_p = 0 otherwise, and it is a product of (d_p − u_p)/2 transpositions; computing d_p − u_p modulo 4 for each residue of p modulo 16 shows that this number is even exactly for p ≡ 1, 3, 13, 15 (mod 16).

**Checks.**

- p = 5 (≡ 5 mod 16) is in P_MP and the projective γ₁₇₂₈ and γ∞ act on the 10 blocks as odd permutations, so the monodromy is S₁₀.
- For p = 13, 17, 19, 29, 31 (≡ 13, 1, 3, 13, 15 mod 16) all three projective branch permutations are even, and for p = 23, 37, 41, 43 (≡ 7, 5, 9, 11 mod 16) odd ones occur, matching the residue rule.
- The fixed blocks of γ₁₇₂₈ enter the parity: at p = 17, d_p = 85 is odd, and the one fixed block is the class of (5, 5, 4), a Markoff point since 25 + 25 + 16 − 100 = −34 ≡ 0 and 5² ≡ 8 (mod 17); so γ₁₇₂₈ is a product of (85 − 1)/2 = 42 transpositions and is even, whereas a count without the fixed block, 85/2, is not an integer.
- p = 7 is not in P_MP: every element order in 𝔽₄₉^× divides 48, and the roots of X² − 3X + 1 have order dividing 8, far below 32√8.

*Needs:* §7.5; §7.1; §6.2 (the branch permutations on triples and their product relation); ArithmeticDynamicsPartII §§4.2, 6.1, 7.2, 7.3, 7.4, 7.4a and gap:markoff-alternating-three-mod-four; Mathlib `alternatingGroup.isSimpleGroup`.

### 7.7 Noncongruence of Markoff levels

For p ∈ P_MP, the finite-index subgroup of SL₂(ℤ) ≅ Out⁺(F₂) stabilizing a point of the fibre of either trace −2 component of M(SL₂(𝔽_p)) is not a congruence subgroup, in the sense of Mathlib `CongruenceSubgroup.IsCongruenceSubgroup`. The obstruction is already visible on N_p, whose monodromy has A_(d_p) as a composition factor with d_p ≥ 10. (Chen, Corollary 5.6.8, pp. 420–421; Definition 5.6.5, p. 419.)

Prove also the comparison with subgroups of PSL₂(ℤ) on which the obstruction of NoncongruenceModularForms §3.5 is stated. For p ∈ P_MP let Γ_y ≤ SL₂(ℤ) be the stabilizer of a point y of Y* (§7.5) and Γ̄_y its image in PSL₂(ℤ). Then −I ∈ Γ_y, so Γ_y is the full preimage of Γ̄_y; the index of Γ̄_y in PSL₂(ℤ) equals that of Γ_y in SL₂(ℤ), namely d_p; and g Γ̄_y ↦ y · g⁻¹ identifies the left coset set PSL₂(ℤ)/Γ̄_y with Y*, equivariantly for left multiplication and for the left action in which g sends y′ to y′ · g⁻¹, induced by the right precomposition action (Conventions), so that the monodromy group of Γ̄_y (NoncongruenceModularForms §1.1) is isomorphic, as a permutation group, to the geometric monodromy group of N_p → P¹_j. The stabilizer of a point x of the fibre of a trace −2 component of M(SL₂(𝔽_p)) is contained in Γ_y for y the image of x under the equivariant maps to X* (§7.1) and to Y* (§7.5).

One proof route: γ₋ᵢ maps to −I and fixes every trace triple, since tr A⁻¹ = tr A for A ∈ SL₂ and tr(A⁻¹B⁻¹) = tr((BA)⁻¹) = tr(BA) = tr(AB), so −I lies in every point stabilizer of X* and of Y*; by §7.1 and the free sign action of §7.5, Out⁺(F₂) is transitive on Y*, which has d_p elements; the permutation groups of SL₂(ℤ) and of PSL₂(ℤ) on Y* are the same subgroup of the permutations of Y*, which is the geometric monodromy group of N_p by gap:punctured-torus-nielsen. If the stabilizer of x contained a principal congruence subgroup Γ(n) (Mathlib `CongruenceSubgroup.Gamma`), so would its overgroup Γ_y, which is the preimage of Γ̄_y; NoncongruenceModularForms §3.5 would then make every nonabelian simple composition factor of the monodromy group of Γ̄_y a PSL₂(𝔽_ℓ) with ℓ prime. By §7.6 that group is S_(d_p) or A_(d_p), and A_(d_p) is a nonabelian simple composition factor of it (Mathlib `alternatingGroup.isSimpleGroup`); since d_p ≥ 10 ≥ 6, NoncongruenceModularForms §3.5 excludes A_(d_p) ≅ PSL₂(𝔽_ℓ), a contradiction.

**Checks.**

- The obstruction needs d ≥ 6: A₅ ≅ PSL₂(𝔽₅), both of order 60, and the stabilizer of a point under PSL₂(ℤ) → PSL₂(𝔽₅) ≅ A₅ acting on five points is a subgroup of index 5 with monodromy group A₅ that contains the image of Γ(5), hence whose preimage in SL₂(ℤ) is congruence. At p = 5, d_p = 10 and |A₁₀| = 10!/2 = 1 814 400, while the prime-field candidates with 5 ≤ ℓ ≤ 10 have |PSL₂(𝔽₅)| = 60 and |PSL₂(𝔽₇)| = 168.
- The passage to PSL₂(ℤ) uses −I ∈ Γ_y: for the unit unipotents A = `[[1, 1], [0, 1]]`, B = `[[1, 0], [1, 1]]` the triples of (A, B) and (A⁻¹, B⁻¹) are both (2, 2, 3), since A⁻¹B⁻¹ = `[[2, −1], [−1, 1]]` has trace 3. For a subgroup without −I the indices differ: Γ₁(3) has index 8 in SL₂(ℤ), its image in PSL₂(ℤ) has index 4, and the preimage of that image is Γ₀(3) = ±Γ₁(3); reading d_p off the image of a stabilizer that omitted −I would halve it.
- The transfer runs from the overgroup to the subgroup: Γ(n) ≤ Γ_x ≤ Γ_y makes Γ_y congruence, so noncongruence of Γ_y gives that of Γ_x; the converse inference fails, since SL₂(ℤ) is congruence and contains the noncongruence subgroups of this target.
- Γ₁(n) and Γ(n) are congruence subgroups by Mathlib's definition, so the conclusion must fail for abelian levels; for G = (ℤ/n)² the monodromy factors through SL₂(ℤ/n).

*Needs:* §7.6; §7.1; §7.5; NoncongruenceModularForms §1.1 (the monodromy group of a finite-index subgroup of PSL₂(ℤ)) and §3.5 (the composition-factor obstruction and its alternating consequence); Mathlib `CongruenceSubgroup.IsCongruenceSubgroup`, `CongruenceSubgroup.Gamma`, `alternatingGroup.isSimpleGroup`; gap:punctured-torus-nielsen.

### Examples

Direct enumeration of X* and the three branch permutations of §6.2 gives the table below; for these primes the orientation generators are already transitive. The projective column is the quotient by the free even-sign action, and its branch signs agree with §7.6.

| p | D | Points over 0 | Points over 1728 | Cusps | Genus | d_p |
| ---: | ---: | ---: | ---: | ---: | ---: | ---: |
| 5 | 40 | 14 | 20 | 8 | 0 | 10 |
| 7 | 28 | 10 | 15 | 5 | 0 | 7 |
| 11 | 88 | 30 | 44 | 14 | 1 | 22 |
| 13 | 208 | 70 | 104 | 26 | 5 | 52 |
| 17 | 340 | 114 | 171 | 37 | 10 | 85 |
| 19 | 304 | 102 | 152 | 34 | 9 | 76 |
| 23 | 460 | 154 | 231 | 41 | 18 | 115 |
| 29 | 928 | 310 | 464 | 86 | 35 | 232 |
| 31 | 868 | 290 | 435 | 69 | 38 | 217 |

The genus column is (2 + D − c₀ − c₁₇₂₈ − c∞)/2 for the cycle counts c₀, c₁₇₂₈, c∞, and agrees with the formula of §7.3.

### Dependencies

§§0.6, 5.5, 5.6, 6.2; ArithmeticDynamicsPartII §§2.3, 2.4, 4.2, 6.0, 6.1, 6.6, 7.2, 7.3, 7.4, 7.4a and gap:markoff-alternating-three-mod-four; ClassicalArithmeticCompletion §4.57; ArithmeticGaloisRepresentations §4.3; NoncongruenceModularForms §§1.1, 3.5; InverseGaloisAndArithmeticFundamentalGroups §IG.1.3; SchemeAndStackFoundations §3.2; HeightsRationalPointsAndObstructions §4.6; gap:punctured-torus-nielsen; Tau Ceti `TauCeti.PermutationTriple`, `TauCeti.PermutationTriple.genus`, `TauCeti.PermutationTriple.IsConnected.two_sub_two_mul_genus`; Mathlib `CongruenceSubgroup.IsCongruenceSubgroup`, `CongruenceSubgroup.Gamma`, `alternatingGroup.isSimpleGroup`, `Nat.totient`.

## Downstream consumers

No roadmap earlier in the merge order consumes this one. Its combinatorial congruence and simple-group congruence are the general finite-group statements behind Nielsen-orbit questions for finite groups, such as Chen's divisibility question recorded in InverseGaloisAndArithmeticFundamentalGroups §IG.3.2; its cusp classification and automorphism groups describe the boundary of elliptic nonabelian level curves for any later study of their moduli; and its Markoff modular geometry (two components, genus, monodromy and noncongruence) is the geometric companion of the finite-field dynamics of ArithmeticDynamicsPartII.

## Worked examples

The combinatorial congruence on SL₂(𝔽₅). Every generating pair of SL₂(𝔽₅) has k_(u,h) = |u|, so A(G, u, h) = Z(G) = {±1} and m′_c = 2 for every commutator class of order divisible by 2. For c of trace −2 (order 10), d′_c = |C(c)|/10 = 1 and the modulus is 10/gcd(10, 2) = 5; the Out⁺(F₂)-orbit has 40 classes, matching the 40 points of X*(𝔽₅) through ArithmeticDynamicsPartII §6.1. For c of trace 1 (order 6), d′_c = 6/6 = 1 and the modulus is 6/gcd(6, 2) = 3; the orbit has 72 classes.

The conic slices at p = 5. Over 𝔽₅ with a = 1, t = 4 the slice is the single point (1, 0, 0) and its non-dihedral part is empty; over 𝔽₄ = 𝔽₂[a]/(a² + a + 1) the polynomial X² + a X + 1 has no root and `[[0, 1], [1, a]]` has order five although its discriminant a² is a square.

The odd dihedral groups. For D₆, D₁₀, D₁₄ with u a rotation and h a reflection, A = ⟨u⟩ has order 3, 5, 7, the center is trivial, the twist period is one and the centralizer obstruction is one, while every coarse component has degree 3: the cusp exponent m′ alone explains the failure of divisibility by the ramification index.

## References

- **CHEN2024.** William Y. Chen, *Nonabelian level structures, Nielsen equivalence, and Markoff triples*, Annals of Mathematics 199 (2024), 301–443, DOI 10.4007/annals.2024.199.1.5; published copy on the author's site. All Chen locators refer to this text: §§2.1–2.5, Theorem 2.5.2, Proposition 2.5.3, Corollary 2.5.4, Definitions 2.5.9–2.5.13; §§3.1–3.5; §§4.1–4.12, Theorem 4.8.4, Proposition 4.9.1, Proposition 4.10.1, Theorems 4.10.3 and 4.10.5, Lemmas 4.12.1–4.12.2, Corollaries 4.12.4–4.12.5; §§5.1–5.6, Proposition 5.1.3, Theorem 5.2.1, Lemma 5.2.9, Proposition 5.2.20, Lemma 5.3.1, Theorem 5.3.2, Theorems 5.6.3, 5.6.4, 5.6.6, Corollary 5.6.8; Appendix 6.2–6.5.
- **CHEN2018.** William Y. Chen, *Moduli interpretations for noncongruence modular curves*, Mathematische Annalen 371 (2018), 41–126, DOI 10.1007/s00208-017-1575-6; arXiv:1510.05687v5. Theorem 4.2.2 (structure of M(D₂k)); Theorem 3.5.3 (a component of M(G) is a scheme exactly when its stabilizers are torsion-free); Corollary 3.4.2 and its proof (stabilizers of exterior epimorphisms are cofinal, and the passage to a normal stabilizer).
- **BBCL22.** Renee Bell, Jeremy Booher, William Y. Chen and Yuan Liu, *Tamely ramified covers of the projective line with alternating and symmetric monodromy*, Algebra & Number Theory 16 (2022), 393–446, DOI 10.2140/ant.2022.16.393; arXiv:2007.12299v2. Proof of Theorem 2.2.3 (the cover of 𝓜(1)_ℚ̄ attached to the free index-two subgroup of Γ(2) is P¹ ∖ {0, 1, ∞}); §3.3, Propositions 3.3.2–3.3.3 and Corollary 3.3.4 (ramification over j = 0 and 1728 and the parity of the branch permutations on Y*).
- **MP18.** Chen Meiri and Doron Puder, with an appendix by Dan Carmon, *The Markoff group of transformations in prime and composite moduli*, Duke Mathematical Journal 167 (2018), 2679–2720, DOI 10.1215/00127094-2018-0024; arXiv:1702.08358v2. Theorems 1.3–1.4, §4.3 and Appendix A.
- **ASADA2001.** Mamoru Asada, *The faithfulness of the monodromy representations associated with certain families of algebraic curves*, Journal of Pure and Applied Algebra 159 (2001), 123–147, DOI 10.1016/S0022-4049(00)00056-6. §7; cited by locator.
- **VDOVIN1999.** E. P. Vdovin, *Maximal orders of abelian subgroups in finite simple groups*, Algebra i Logika 38 (1999), 131–160, English translation in Algebra and Logic 38, DOI 10.1007/BF02671721. Theorem A; cited by locator.
