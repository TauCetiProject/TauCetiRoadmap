# Roadmap: GL₂ modularity lifting

**Summary.** Build the modularity lifting theorems for two-dimensional Galois representations that the proofs of Serre's modularity conjecture use, in two strands. The classical strand runs from a supplied modular residual representation over a totally real field, through the finite-level deformation-to-Hecke map for definite quaternionic forms, the Taylor–Wiles auxiliary levels, the arithmetic instance of Kisin's patching and the comparison of local components, to the Khare–Wintenberger lifting theorems at odd primes and at 2, Kisin's potentially Barsotti–Tate theorems, the Fontaine–Laffaille, BCDT-type and crystalline lifting theorems, and Khare–Wintenberger's Theorem 4.1 and Hypothesis (H). The modern strand over `ℚ` states the four lifting branches used by Dieulefait–Pacetti's proof of Serre's conjecture as separate theorems: regular de Rham lifting at every odd prime (Kisin's multiplicity method with the Breuil–Mézard input of Paškūnas, Hu–Tan and Tung), dyadic de Rham lifting with nonsolvable residual image (Tung), Pan's residually reducible Fontaine–Mazur theorem, and the ordinary 3-adic completion. It ends with the modularity-transfer statements used along congruences between families of representations. Residual modularity is a hypothesis throughout, except in Pan's residually reducible theorem, and every conclusion says which kind of `R = T` or modularity statement it is.

## Scope and ownership

This roadmap owns the arithmetic of modularity lifting for `GL₂` over totally real fields as Khare–Wintenberger II §§7 and 9–10, Kisin's papers on potentially Barsotti–Tate and 2-adic Barsotti–Tate representations, Gee's survey and Breuil–Conrad–Diamond–Taylor organise it: the arithmetic instances of the supplied deformation-to-Hecke maps and their surjectivity, the Taylor–Wiles systems of Hecke modules, the patching data built from them, the support and component arguments, the comparison of integral and generic-fibre `R = T` statements, and the lifting theorems with their exact hypotheses. It also owns the conditional arithmetic proofs and transfer adapters for the modern general lifting results used over `ℚ` in Dieulefait–Pacetti’s Theorems 1.4–1.7, with the standalone ordinary branch imported: the statement table, Kisin's multiplicity criterion as Gee–Kisin's Appendix B corrects it, Tung's 2-adic theorem and its totally real form, the construction steps of Pan's residually reducible theorem (nice and potentially nice primes, good components, extension components and their geometry), and the transfer statements for congruence arguments.

The following developments are supplied by other roadmaps. SerreWeightAndLevelOptimisation §§6.6–6.11 owns Khare–Wintenberger II §8: allowable base changes, the determinant kinds, minimal modular lifts and prescribed-type lifts; Theorem 8.2 is §6.7. ArithmeticGaloisDuality §R02.6.2, “Finite-order determinant twists”, supplies KW II Lemma 7.10 with its equal-reduction, local-unit and total-evenness hypotheses, and §§R02.4.5b–R02.4.6 supplies the extension of finitely many local characters used in CHT Lemma 4.1.1. HilbertModularVarietiesAndShimuraCurves §§R18.3.1–R18.3.32 supplies definite quaternionic forms, Hecke algebras, Taylor–Wiles levels, isotropy, freeness, localised control, Iwahori roots and dyadic norm twists. DeformationAndDerivedPatchingAlgebra, Layers 1–6, owns the commutative algebra of patching, depth, support and quotient identification. LocalGaloisDeformationRings, Layer F and Layers 1–8, owns generic deformation and pseudodeformation functors, their representing rings, and the local conditions; GlobalGaloisDeformations §§3.3–6.6 supplies the global presentations, twists, Taylor–Wiles primes and Khare–Wintenberger lifting data. AutomorphicGaloisRepresentations, Layers 1–4 and §§6.10–6.12, 7.3, supplies classical and Hilbert Galois representations, local–global compatibility, the quaternionic Hecke representation and the fixed-eigenform family. GL2AutomorphicRepresentationsAndTransfer §§R17.3.1–R17.3.9, R17.4.1–R17.4.11 and R17.6.19 supplies Jacquet–Langlands, solvable base change and descent. OrdinaryAutomorphicFormsAndModularityLifting §§5.4–5.7 supplies the Skinner–Wiles lifting theorems on their stated scopes, including the `p = 3` theorem of §5.5; its full-scope totally real export in §5.8 assumes `CMComponentSupport`. Dieulefait–Pacetti's Lemma 1.13 is the case `F = ℚ` of ArithmeticGaloisRepresentations §§4.6–4.7.

The arithmetic refinements listed under the supplier contracts are targets here, in the consuming sections named there, with their hypotheses and sources. In particular, Pan's comparisons at reducible pseudodeformation points and his scalar and distinguished ordinary pseudo-ring comparisons are built in Layer 10. They add arithmetic information to the supplied general deformation functors; they are not consequences of representability alone.

From Tau Ceti and its roadmaps: global class field theory (TauCetiRoadmap ClassFieldTheory, Layers 7, 11–13, including Kronecker–Weber), Chebotarev density (Chebotarev, Layer 10), Dirichlet twists and primitive associates of newforms (ModularForms, Layer 9), weak approximation (`TauCeti.GlobalNumberFields.weakApproximation_denseRange`) and solvability of upper-triangular groups (`TauCeti.UpperTriangularGroup.instIsSolvable`). The signed prime `p* = (−1)^{(p−1)/2}p` of an odd prime p is Tau Ceti's `TauCeti.Multiquadratic.oddPrimeDiscriminant`, with `|p*| = p` (`oddPrimeDiscriminant_natAbs`), `p* ≡ 1 mod 4` (`oddPrimeDiscriminant_mod_four_eq_one`) and the sign formula (`oddPrimeDiscriminant_eq_neg_one_pow_pred_div_two_mul`); a field containing a primitive p-th root of unity contains a square root of `p*` (`TauCeti.Multiquadratic.exists_mem_sq_eq_oddPrimeDiscriminant`), so `ℚ(√p*) ⊆ ℚ(ζ_p)`. That definition takes the value −2 at `p = 2`; this roadmap uses `p*` only for odd p. IntegralHeckeAndGaloisDeterminants §§0.5, 1.2–1.4 supplies the determinant, Cayley–Hamilton, generalized-matrix-algebra, reducibility-ideal and Ribet-lattice objects used in Layer 10. Layer 0 adds Pan’s odd-involution descent and arithmetic trace comparisons on those objects.

Downstream, PotentialModularityAndCompatibleSystems builds the global finiteness of deformation rings (KW II Theorem 10.1), potential modularity and compatible systems on Layers 1–6 and 12; it consumes the `α/β` predicates of §1.2–§1.3, the Khare–Wintenberger exports of §5.18 and §6.16, and the transfer statements of Layer 12, and uses the shared family data of the Conventions. EllipticCurveModularity uses the lifting theorems of Layers 5–6. ClassicalSerreModularity §I.1 supplies standalone ordinary lifting over `ℚ`, including the full imaginary-quadratic branch, through the comparisons in OrdinaryAutomorphicFormsAndModularityLifting §§5.4–5.5 and 5.7. Its §I.2 also supplies `I.2/same-weight-crystalline-lifting`, including the fixed-determinant crystalline-domain comparison of Kisin Durham (3.13); §5.16 imports that theorem with its matching-weight seed, scalar-centralizer and weight-range hypotheses. Its §§I.2 and R33.1 own the classical rational-field application contracts. The comparisons with §§5.18, 6.16 and Layers 7–12 here retain each contract’s local hypotheses; the modern proofs here carry LL/CC/LC and do not discharge an unconditional application contract. Serre’s conjecture itself is not an input.

The p-adic local Langlands hypotheses LL1–LL3, completed-cohomology hypotheses CC1–CC5 and twist-two vanishing hypothesis LC are stated under Conditional arithmetic hypotheses. Every target of Layers 7–12 that uses one is conditional on it and names it in its *Needs* line. These are hypotheses on the actual arithmetic objects and comparison maps, including their support and finiteness properties.

## Conventions

F is a totally real number field and p a prime. E is a finite extension of `ℚ_p` with ring of integers `𝒪`, uniformiser `π` (written `λ` when it names a prime of a coefficient field) and residue field `𝔽` (or k); coefficient rings of deformation problems are complete local Noetherian `𝒪`-algebras with residue field `𝔽`. A residual representation `ρ̄ : G_F → GL₂(𝔽)` is continuous, absolutely irreducible unless a statement says otherwise, and totally odd: `det ρ̄(c) = −1` for every complex conjugation c. A characteristic-zero representation is odd when `det ρ(c) = −1`; at `p = 2` the residual determinant is 1 at every c and cannot detect oddness, so oddness of a 2-adic lift is always a hypothesis on the lift (§6.2, §7.10).

Use arithmetic Frobenius. `ε` (or `χ_p`) is the p-adic cyclotomic character and `ω` its reduction. Hodge–Tate weights are normalised by `HT(ε) = 1`; a representation with distinct weights `a < b` is normalised by `ρ ⊗ ε^{−a}` to weights `{0, k − 1}` with `k = b − a + 1 ≥ 2` (§7.6), and a newform of weight `k ≥ 2` has p-adic representation with weights `{0, k − 1}` and determinant `ψε^{k−1}, ψ` of finite order. "Modular" for a representation of `G_F` means isomorphic, for fixed embeddings of coefficient fields, to the representation attached to a cuspidal Hilbert eigenform (over `ℚ`, a classical newform); "modular up to twist" means `ρ ≅ ρ_π ⊗ χ` for a continuous global character χ, de Rham at the p-places in the regular de Rham statements. Over `ℚ`, §§7.11 and 7.9 give exact newform modularity when `ρ` has weights `{0,k−1}`. For a Hilbert form use labelled integers `k_τ≥2, η_τ`, with `k_τ−1+2η_τ=w` independent of τ: its attachment has weights `{η_τ,η_τ+k_τ−1}` and determinant finite order times `ε^w`. Here the arithmetic Hilbert attachment is the dual of the cohomological representation of AutomorphicGaloisRepresentations; its type parameter there is `w−1`. This fixes the algebraic central-character normalization; changing it transports both labelled weights and determinant.

Over `ℚ`, residual modularity means `TauCeti.ResidualModularity.IsModular` from AlgebraicModularFormsAndSerreWeights [Layer R15.6, “S-type and modularity predicates”](../AlgebraicModularFormsAndSerreWeights/README.md#target-s-type-arises-from-and-modular). Attachment to a specified form uses its `TauCeti.ResidualModularity.ArisesFrom`; the coefficient map, weight and actual level belong to the witness. Use the supplier’s integral-model and maximal-Hecke-ideal comparison theorems to obtain the eigenform and Hecke data needed here. For an absolutely irreducible residual representation these identify `ρ̄` itself after compatible coefficient extension; in general they identify only its semisimplification. Over a totally real field use the supplied Hilbert attachment and its actual cuspidal witness, including the level, Hecke maximal ideal and residual isomorphism. The extra weight and local-level restrictions in `ResidualModularAlpha`, `ResidualModularBeta` and `StronglyResiduallyModular` remain predicates on these witnesses. The deformation ring, the chosen union of local components and the module patched over it are separately constructed objects. Each `R = T` conclusion states which of three kinds it is: an integral isomorphism `R ≅ 𝕋` (§4.2), an isomorphism after inverting p of the reduced, `𝒪`-flat quotients (§3.7, §6.14), or modularity of the points on specified components (§4.5, §5.6). They are not interchangeable: a patched Cohen–Macaulay module supported on one component says nothing about another.

In Khare–Wintenberger's lifting data the local condition at `v | p` is of type (A), crystalline of weight `2 ≤ k ≤ p + 1` (with `k(ρ̄) = p + 1` when `k = p + 1`), (B), weight two and crystalline over `ℚ_p^{nr}(μ_p)`, or (C), semistable non-crystalline of weight two of the form `(γ_vχ_p ∗; 0 γ_v)` with `γ_v` unramified; at a place of `Σ` away from p it is of the form `(γ_vχ_p ∗; 0 γ_v)`. An allowable base change is a finite solvable totally real extension in the sense of KW II Definition 7.9 (SerreWeightAndLevelOptimisation §6.6). For an odd prime p, `p* = (−1)^{(p−1)/2} p` (Tau Ceti's `oddPrimeDiscriminant`, see Scope and ownership), so `ℚ(√p*)` is the quadratic subfield of `ℚ(ζ_p)`; for example `3* = −3, 5* = 5` and `7* = −7`, and `ℚ(√−3) = ℚ(ζ₃)`.

Rank-two family data over `ℚ`, used in Layer 12, consist of a number field E, a finite set S of rational primes, for every finite place `λ` of E a continuous semisimple representation `ρ_λ : G_ℚ → GL₂` over a finite extension of `E_λ`, and polynomials `P_q ∈ E[X]` for `q ∉ S`, such that `ρ_λ` is unramified at every `q ∉ S` different from the residue characteristic ℓ of `λ`, with characteristic polynomial of `Frob_q` equal to the image of `P_q`. Oddness, irreducibility, the de Rham property at ℓ and the Hodge–Tate weights are stated as separate hypotheses on the members that need them. Dieulefait–Pacetti's almost strictly compatible systems (their Definition 1.10) are family data in which every member is de Rham at its own coefficient prime ℓ, crystalline there when `ℓ ∉ S` (clause (4)), with Hodge–Tate weights `{0, k − 1}` (clause (5)), and with a Weil–Deligne representation `WD_ℓ` at every prime matching each member (clause (6)), except that at a member whose residual representation is reducible the comparison at its own residue characteristic p is imposed only when p is odd and `WD_p` is unramified. Khare–Wintenberger's almost strict compatibility does not include the de Rham clause.

**Shared family view.** `RankTwoFamily` is the base-`ℚ`, rank-two, Hodge-forgetting view of `AutomorphicSystemData` from SmallRamificationAndAbelianVarietyBaseCases §5.0d, equipped with the common-good-Frobenius predicate of the preceding paragraph. The view is the quotient of that specialization by equality of the coefficient field, S, polynomials, members and finite local realization fields, using the supplied memberwise isomorphisms; the equivalence relation forgets exactly the numerical Hodge labels. It carries no chosen Hodge labels. Coefficient extension, conjugation, twisting and memberwise isomorphisms are induced by the shared operations and descend through that projection. Character twisting uses a character family with common good values. No `E_λ`-model is required beyond the given finite realization fields.

Use the supplier’s convention adapter: for a geometric polynomial P of degree n the arithmetic polynomial is `X^n P(1/X)/P(0)`; `HT(ε)=1` reverses the signs of numerical Hodge labels. This leaves the representation unchanged. For the fixed-eigenform input, use the arithmetic attachment specified above: when §7.3 of AutomorphicGaloisRepresentations supplies its cohomological family, first apply the shared dual operation and then the Frobenius adapter. All-member de Rhamness, crystallinity, labelled weights and Weil–Deligne comparison are separate predicates on the view. The DP almost-strict predicate on a view holds when a lift whose labels are the actual Hodge–Tate weights satisfies `AutomorphicSystemData.IsAlmostStrictlyCompatible` of AutomorphicGaloisRepresentations §7.1; that property is independent of such a lift. Layer 12 uses only the weaker good-polynomial predicate and the explicitly stated member conditions. (DP Definition 1.10, pp.6–7; [ACC+, Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf), §7.1, pp.1084–1086; ArithmeticGaloisRepresentations §§1.2, 5.3–5.7.)

**Checks.**

- The family of trivial rank-two representations has `P_q = (X − 1)²` and satisfies the family-data condition with `S = ∅`; it fails irreducibility and distinct-weight hypotheses of the lifting theorems.
- The family of a fixed weight-two eigenform has good polynomials `X² − a_q X + ψ(q)q`, with constant coefficients `ψ(q)q`; it satisfies the stronger comparison when supplied by AutomorphicGaloisRepresentations §7.3.
- Assigning different traces at one good q to two coefficient-place members cannot satisfy a common polynomial over the fixed coefficient field. Compatibility only away from coefficient primes does not itself assert a de Rham condition at those primes.
- Two shared raw data differing only in their numerical Hodge labels have the same view. No labels are filled in when consuming that view.
- For trivial nebentypus, the geometric weight-two polynomial `X²−(a_q/q)X+1/q` becomes `X²−a_qX+q` under the reciprocal formula.

## Exact supplier contracts

*Uses* lists the supplier sections and their consuming sections here. *Arithmetic refinements* specifies the additional arithmetic statements proved in the consuming targets of this roadmap, using the supplied general theory and the source locators in those targets. These refinements are owned here; the supplier contracts assert only the contents of the cited supplier sections. All fields, coefficient rings, local conditions and residual-image hypotheses are those of the named consuming section.

### From Mathlib and Tau Ceti

Mathlib at 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti at a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 supply the algebraic carriers. Use `Module.Free` (Mathlib/LinearAlgebra/FreeModule/Basic.lean) and `MonoidAlgebra` (Mathlib/Algebra/`MonoidAlgebra`/Defs.lean) for the freeness of Taylor–Wiles modules over `𝒪[Δ_Q]` (§2.5); freeness is existence of a basis, and finiteness, control and specialisation are separate assertions. Use `Group.IsSolvable, Group.isSolvable_of_ker_le_range` and `Group.isSolvable_of_isSolvable_injective` (Mathlib/GroupTheory/Solvable.lean) and `TauCeti.UpperTriangularGroup.instIsSolvable` (TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/UpperTriangular/Solvable.lean) for the consequences of nonsolvable residual image (§7.5): a subgroup of a solvable group is solvable, an extension of solvable groups is solvable, and the Borel subgroup of `GL₂` is solvable. Use `ZMod.neg_one_ne_one` (Mathlib/Data/ZMod/Basic.lean, under Fact `(2 < n)`) for the oddness bridge at odd residue characteristic (§7.10). Use `Relation.ReflTransGen, Relation.ReflTransGen.trans` and `Relation.reflTransGen_iff_eq` (Mathlib/Logic/Relation.lean) for Pan's finite chains of components (§10.3), and `PrimeSpectrum.comap` (Mathlib/RingTheory/Spectrum/Prime/RingHom.lean), `minimalPrimes` (Mathlib/RingTheory/Ideal/MinimalPrime/Basic.lean) and `minimalPrimes.equivIrreducibleComponents` (Mathlib/RingTheory/Spectrum/Prime/Topology.lean) for the components detected by an extension deformation (§10.4). Use `TauCeti.GlobalNumberFields.weakApproximation_denseRange` (TauCeti/NumberTheory/NumberField/Global/Approximation/Weak.lean) for the square classes and signs prescribed in §1.8. Use `TauCeti.Multiquadratic.oddPrimeDiscriminant` with `oddPrimeDiscriminant_natAbs, oddPrimeDiscriminant_mod_four_eq_one` and `oddPrimeDiscriminant_eq_neg_one_pow_pred_div_two_mul` (TauCeti/NumberTheory/Multiquadratic/Prime/Discriminant/Basic.lean), and `TauCeti.Multiquadratic.exists_mem_sq_eq_oddPrimeDiscriminant` (TauCeti/NumberTheory/Multiquadratic/Cyclotomic/GaussSum.lean), for `p*` and `ℚ(√p*) ⊆ ℚ(ζ_p)` in Layers 7–12. The matrix identities `Matrix.det_fin_two` and `Matrix.det_smul` fix the determinant conventions of Layers 7 and 12.

### From TauCetiRoadmap

ClassFieldTheory, Layer 7 (the local Artin map and its normalisations): cyclic local extensions correspond to finite-order local characters, with the same normalisation as global existence (§1.7). ClassFieldTheory, Layer 12 (global existence): a finite-order idele class character of F cuts out a cyclic extension in which v splits completely exactly when the character is trivial on `F_v^×`; it is totally real when the character is trivial at the real places (§1.7). ClassFieldTheory, Layer 13: Kronecker–Weber, used to identify finite-order characters of `G_ℚ` with Dirichlet characters (§7.11). Chebotarev, Layer 10: a finite Galois extension of number fields has infinitely many completely split places (§1.7, §1.8). ModularForms, Layer 9: the Dirichlet twist of a normalised newform h of weight `k ≥ 2` by `μ` is cuspidal of weight k with good eigenvalues `μ(q)a_q(h)` and nebentypus multiplied by `μ²`, and has a normalised primitive associate of weight k with the same good eigenvalues (§7.9, §12.8); the twist itself need not be new at the displayed level. IntegralHeckeAndGaloisDeterminants §§0.5, 1.2–1.4 supplies the native determinant, reconstruction, generalized-matrix-algebra, reducibility and nonsplit-lattice interfaces used in §§0.1–0.3 and 10.1–10.4, 10.13. Pan §2’s completion and height-at-most-one comparisons are constructed in those consuming sections using LocalGaloisDeformationRings §F.2.11.

### From IntegralHeckeAndGaloisDeterminants

Rank-two determinant/trace equivalence with 2 invertible (§0.5), semisimple reconstruction and henselian Cayley–Hamilton generalized matrix algebras (§§1.2–1.3), and the two-block reducibility ideal and classical Ribet lattice with prescribed orientation (§1.4).

*Uses.* §§0.5, 1.2–1.4 (§§0.1–0.3, 10.1–10.4, 10.13).

*Arithmetic refinements.* Odd-involution descent over Pan’s coefficient fields, the one-dimensional completion and trace/deformation comparisons, and the bounded-denominator comparison of Pan Proposition 2.3.2 (§§0.1–0.3). They use the supplied determinant and GMA carriers.

### From SmallRamificationAndAbelianVarietyBaseCases

`AutomorphicSystemData` with its coefficient field, bad set, polynomials, finite local realization fields, members and representation operations (§5.0d), including the arithmetic/geometric Frobenius adapter.

*Uses.* §5.0d (Conventions; §§12.6–12.8). The common-polynomial rank-two view forgets numerical Hodge labels; the stronger `ArithmeticCompatibleFamily` predicate is not an input.

### From LinearFormsInLogarithms

Qualitative p-adic Baker–Brumer, `PadicBaker.eq_zero_of_add_sum_mul_eq_zero` (§8.10), with its small-exponential-disc and algebraic-exponential hypotheses.

*Uses.* §8.10 (§10.7a). The common-power logarithm adapter, the abelian unit-character argument, Leopoldt and the class-field-theory dimension consequences are built in §10.7a.

### From ClassicalSerreModularity

Standalone ordinary lifting over `ℚ` with the designated quotient character and finite determinant factor, including the full imaginary-quadratic correction (§I.1), and `I.2/same-weight-crystalline-lifting` over `ℚ` for `p>2`, weights `{0,k−1}` with `2≤k≤2p−1`, cyclotomic residual absolute irreducibility, scalar local residual endomorphisms and a weight-k cuspidal modular residual witness (§I.2). The latter owns the Durham (3.13) local-domain comparison used in its proof. OrdinaryAutomorphicFormsAndModularityLifting §§5.4–5.5 and 5.7 supplies the comparisons with its totally real ordinary theorems.

*Uses.* §I.1 (§§5.9, 5.18, 10.8–10.9, 11.1–11.2, 12.3, 12.5); §I.2, `I.2/same-weight-crystalline-lifting` (§5.16, hence §5.17). The other rational-field contracts in §§I.2 and R33.1 are compared with the exports here at their stated hypotheses, not used to prove the modern conditional lifting theorems. Ordinary lifting retains its supplier’s scope; LL1–LL3, CC1–CC5 and LC remain hypotheses of every modern application that needs them.

### From ArithmeticGaloisRepresentations

Continuous representations, coefficient fields and stable lattices (Layer 1), local restriction, cyclotomic and Dirichlet characters (§§1.2, 1.10, 2.1–2.4, 4.1), residual images and the dihedral criterion (Layer 4), and recognition by Frobenius characteristic polynomials (Layer 5).

*Uses.* Layer 1 (§10.1, §10.2, §10.14, §11.1, §12.1, §12.2, §12.3, §12.5); §1.5 (§7.1, §7.2, §7.3, §7.4, §8.8); §1.2 (§12.8); §§1.5–1.9 (§7.1, §7.2, §7.3, §7.4, §8.8); §1.6 (§7.1, §7.2, §7.3, §7.4, §8.8); §1.9 (§12.8); §1.9 (§12.8); §§1.2, 1.10, 2.1–2.4, 4.1 (§9.3, §10.15, §11.1, §11.2, §12.1, §12.2, §12.3); §§1.2, 1.10 (§7.11); Layer 4 (§1.8); §§4.6–4.7 (§8.8, §8.9, §12.1); §§5.3–5.7 (§7.9, §12.6, §12.7, §12.8).

*Arithmetic refinements.* The restriction-image comparison: if K cuts out `ρ̄` then the image of `ρ̄|G_{F′}` is `Gal(K/(K ∩ F′))`, and linear disjointness from `K(μ_p)` preserves the images over F′ and `F′(μ_p)` (§1.8). Continuous finite-coefficient characters with their Teichmüller lifts, finite-order twists and determinant formulas (Layers 10–12). Finitely ramified de Rham characters of `G_ℚ` are finite order times a power of `ε`, and a finite-order quotient normalisation has weight zero and preserves oddness (Layers 9–12; §7.11 proves the twist statement it needs from §§1.2, 1.10, 2.1–2.4, 4.1 and Kronecker–Weber). Frobenius-polynomial recognition for semisimple members after common coefficient extension, used one residue characteristic at a time (Layer 12).

### From ArithmeticGaloisDuality

Grunwald–Wang (Layer R02.4) and finite-order determinant twists, global Euler characteristics and Poitou–Tate duality (§§R02.4.3–R02.4.4, D8.1, R02.6.1–R02.6.2).

*Uses.* §§R02.4.5b–R02.4.6 (§1.7); §§R02.4.3–R02.4.4, D8.1, R02.6.1–R02.6.2 (§10.7, §10.11).

*Arithmetic refinements.* The global Euler characteristic for `ad⁰ρ` and nonsplit extensions, and the exact restriction isomorphism of Pan Lemma 7.4.15, of dimension `[F : ℚ]` when `ψ₁/ψ₂ = εθ`, through Poitou–Tate and the explicit arithmetic hypothesis LC for the full finite set S (§10.7, §10.11). The restriction–corestriction and coefficient comparisons are proved in §10.11; the arithmetic vanishing is carried as LC.

### From DeformationAndDerivedPatchingAlgebra

The commutative algebra of patching: flat completion and finite modules (Layer 1), Cohen–Macaulay, depth and regularity comparisons (Layer 3), finiteness from faithful finite modules (Layer 4), Kisin's domain-case patching datum and its limits and finite stabilization (Layer 5), and faithfulness, support and component conclusions (Layer 6). The single free-module consumer theorem [§5.6, `patching_surjection_iso`](../DeformationAndDerivedPatchingAlgebra/README.md#patching-surjection-iso), with §5.5’s depth comparison, supplies integral `R ≅ T`, module freeness and a complete-intersection presentation when the arithmetic data have equal scalar and presentation variable counts. Its finite-level inputs are independent; transition maps between the original Taylor–Wiles levels are not hypotheses. The supplier interface follows the Imperial College London FLT project.

*Uses.* §§5.5–5.6, `patching_surjection_iso` (§4.2, formally smooth case); §§1.1–1.5, 5.2–5.4 (§3.4a); §§5.3–5.4 (§8.1); §1.13 (§1.11, §1.12, §1.14); §3.9 (§4.2); §§3.1–3.3, 6.1 (§3.5); §6.1 (§3.5); §§3.1–3.3 (§3.7, §4.2, §5.6, §6.11, §6.14); §§3.4–3.5 (§4.2, §5.13); §3.3 (§3.5, §3.7, §6.11); §3.3 (§4.2); §3.1 (§4.2); §3.9 (§4.2); §§3.11–3.13 (§8.3, §8.5); §3.2 (§3.7, §6.12); §4.6 (§5.6); §§3.3, 4.1 (§3.6); Layer 5 (§5.13); §§5.6–5.7 (§3.1, §3.3, §3.4, §6.4); §5.2 (§3.3); §5.7 (§3.7, §5.6); §5.6 (§3.1, §3.2); §§5.5–5.7 (§3.5); §5.6 (§3.4); §5.3 (§3.3); Layer 6 (§10.11, §10.13); §6.7 (§4.4, §6.13); §§6.7–6.8 (§8.3, §8.5); §6.1 (§6.13); §§6.4–6.5 (§3.7, §4.2, §4.5, §6.13, §6.14); §6.1 (§4.4); §6.3 (§3.7, §6.14); §§6.1–6.5 (§3.5, §4.4); §6.1 (§4.5, §9.1); §6.7 (§4.4); §6.2 (§9.1); §6.4 (§4.2); §6.4 (§4.4); §§6.4–6.5 (§4.2); §§6.4–6.5 (§4.2); §6.5 (§6.14); §6.5 (§4.5); §6.5 (§4.5); §6.5 (§3.7, §6.14).

*Arithmetic refinements.* Simultaneous arithmetic module patching over the fixed ambient avoidance rings, with common special fibre, scalar actions and augmentations (§3.4a), uses finite stabilization without a domain assumption. The ambient dyadic construction of §6.7a likewise uses §§5.2–5.4 for finite decorated limits and §§6.1–6.2 for support on components and specialization; its arithmetic modules and determinant-twist comparisons are constructed here. The classical numerical criterion of Wiles–Lenstra and Taylor–Wiles in the form of CDT Theorem 5.4.2 and §§5.5–5.6: an `𝒪`-flat deformation-to-Hecke surjection with controlled cotangent and congruence lengths, a self-dual finite free coefficient module with perfect pairing, residually injective level-change maps, explicit local congruence factors and free auxiliary diamond actions give the isomorphism, the complete-intersection property and freeness (§5.13); neither the characteristic-zero patching criterion nor Kawasaki's blow-up algebra of the roadmap's Part II states it. Pan Proposition 5.4.7's connectedness-dimension bound for completed local rings with g variables and r relations, with the localisation–completion comparison and the bound `c ≥ 2[F : ℚ] − 1` of Pan §7.4, at extension points and at the irreducible ordinary prime of Pan Lemma 7.4.8 (§10.11, §10.13).

### From FiniteFlatGroupsAndIntegralPadicHodgeTheory

Crystalline representations with Hodge–Tate weights {0, 1} arise from p-divisible groups (§R07.4.20).

*Uses.* §R07.4.20 (§6.10).

### From ModularCurvesPartII

Coefficient cohomology of modular curves (§§14.1–14.15) and its Hecke and level-change package (§§15.7–15.8, 17.8–17.10).

*Uses.* §§14.1–14.15 (§5.2, §5.12); §§15.7–15.8, 17.8–17.10 (§5.2, §5.13).

*Arithmetic refinements.* The finite compact type-lattice coefficient systems of corrected CDT §6.2 and BCDT §10: the local system uses the `𝒪`-dual of `M_ℓ`, Serre's group-cohomology coefficient is `L_n ⊗ k`, descent requires V′ normal in V with ℓ-adic continuous coefficient action, exactness after non-Eisenstein localisation, and the corrected levels `U′_{S,q} = V′_{S,q} = U_1(q^{c_q})` at `q ∈ T(ρ̄)`, unchanged at the other primes, followed by the spherical comparison level `U′_S GL₂(ℤ_ℓ)` and induction back to `U₀(ℓ)` in the irreducible-type branch (§5.2, §5.12). The type-sensitive finite free localised H¹ with its perfect integral pairing, residually injective level changes, local congruence factors and free auxiliary diamonds of corrected CDT §§5.5–6.4, including the `w_ℓ = 1` summand for an extended type in ordinary and compactly supported cohomology (§5.2, §5.13).

### From AlgebraicModularFormsAndSerreWeights

Integral lattices and reduction of eigenforms (Layer R15.2), reduction to weight at least two (Layer R15.5), and the residual predicates `TauCeti.ResidualModularity.ArisesFrom` and `TauCeti.ResidualModularity.IsModular` with their integral-model, coefficient-place and maximal-Hecke-ideal comparisons ([Layer R15.6, “S-type and modularity predicates”](../AlgebraicModularFormsAndSerreWeights/README.md#target-s-type-arises-from-and-modular)). Over `ℚ` these are the attachment and residual-modularity predicates throughout this roadmap, including Layers 7–12; no second attachment predicate is introduced.

*Uses.* Layer R15.6, “S-type and modularity predicates” (Conventions, §§1.2–1.3 over `ℚ`, §5.5, Layers 7–12); Layer R15.2, “Hecke operators and the classical integral lattice” (§5.2, §5.5); Layer R15.5, “Application to modular forms” (§5.5); Layer R15.6, “Modularity predicates and their comparisons” (§5.5).

### From PadicHodgeTheory

Fontaine's period functors, Hodge–Tate weights and de Rham characters (§§3.2–3.6), the p-adic monodromy theorem (§§5.1–5.3) and the Berger–Li–Zhu endpoint (§6.4).

*Uses.* §§3.2–3.6 (§7.6, §7.9, §10.6); §§3.3–3.5 (§7.11); §3.3 (§7.11); §3.6 (§7.11); §§5.1–5.3 (§9.3, §10.15, §12.1, §12.2, §12.3, §12.6); §§5.1–5.3 (§8.8); §6.4 (§5.17); §6.4 (§11.2).

*Arithmetic refinements.* The Berger–Li–Zhu endpoint used in KW II §10.2: for a nonordinary crystalline rank-two representation with weights {0, p}, the residual-weight-two branch has absolutely irreducible local residual representation, with the slope alternatives and coefficient enlargement (§5.17). The tensor and cyclotomic-twist formula for labelled Hodge–Tate weights, and the identification of a weight-zero de Rham global character over `ℚ` with a finite-order character (§7.6, §7.9). The coefficient-extension statement that an irreducible two-dimensional de Rham representation of `G_{ℚ_p}` with distinct weights is absolutely irreducible (§10.6).

### From HilbertModularVarietiesAndShimuraCurves

Definite quaternionic forms `S_{k,ψ}(U, 𝒪)`, their Hecke algebras and non-Eisenstein localisation, Taylor–Wiles levels with isotropy, freeness, selected roots and localised control, the dyadic norm twist and Jacquet–Langlands on definite forms (§§R18.3.1–R18.3.32).

*Uses.* §§R18.3.1–R18.3.32 (§1.1, §2.1, §2.2, §2.5, §2.9, §4.5, §8.1, §8.2); §R18.3.27 (§2.9); §R18.3.25 (§2.9); §R18.3.26 (§2.9); §R18.3.10 (§2.1); §R18.3.28 (§2.3, §2.5); §R18.3.14 (§2.5); §R18.3.12 (§2.1); §R18.3.31 (§2.3, §2.5, §2.7, §2.8, §2.12); §R18.3.13 (§2.1).

*Arithmetic refinements.* The Khare–Wintenberger specialisation of the definite-form package, for the given weight, central character, quaternion algebra and, at `p = 2`, the noncompact factors `D_v^×` at `Σ`: finite `𝒪`-free localised coefficient modules, the faithful finite reduced `𝒪`-flat Hecke image, the characteristic-zero automorphic decomposition, and the residual degeneracy injectivity that gives integral control of selected-root coinvariants (§1.1, §2.1, §2.2, §2.5, §2.9, §4.5, §8.2). For Kisin's filtration: exactness in finite coefficient lattices and the mod-π Jordan–Hölder filtration after non-Eisenstein localisation, with a trivial-isotropy level chosen at `p = 3` (§8.1).

### From GL2AutomorphicRepresentationsAndTransfer

Global Jacquet–Langlands (§§R17.3.1–R17.3.9) and solvable base change and descent (§§R17.4.1–R17.4.11, R17.6.19).

*Uses.* §§R17.3.1–R17.3.9 (§9.1, §10.6); §R17.3.1 (§1.1); §§R17.4.1–R17.4.11, R17.6.19 (§1.6, §5.3, §5.5, §5.18, §6.16, §9.2, §10.10, §10.14).

*Arithmetic refinements.* For a solvable totally real E/F and `r : G_F → GL₂(ℚ̄_p)` with `r|G_E` irreducible, automorphy of r is equivalent to automorphy of `r|G_E` (Gee Proposition 4.25); cyclic base change of prime degree with local compatibility at every place and cuspidality when the restriction stays irreducible (§1.6, §5.3, §5.5, §5.18, §6.16, Layers 9–10). Jacquet–Langlands from definite quaternionic eigenforms of the specified local types to regular algebraic cuspidal forms (§9.1, §10.6).

### From GlobalGaloisDeformations

Global deformation data and presentations (§§3.3–3.8), twisting, free-action quotients and the determinant torsor (Layer R04.4), Taylor–Wiles primes and inertia actions (Layer R04.5), and Khare–Wintenberger lifting data with their dyadic patching data (Layer R04.6). The common deformation-to-Hecke interface is [§6.7, `HeckeGaloisDatum`](../GlobalGaloisDeformations/README.md#hecke-galois-datum), with `classifying_surjective` and `classifying_unique`; [§6.8](../GlobalGaloisDeformations/README.md#hecke-galois-points) supplies `ofPoints` and `mem_of_points`. This roadmap constructs the arithmetic inputs and uses those maps and comparison theorems.

*Uses.* §§6.7–6.8 (§§1.1, 1.4–1.5, 1.9–1.10; §§2.4, 2.10–2.11 after the trace-algebra comparison); §§3.3–3.8 (§10.7, §10.10, §10.11, §10.12, §10.13); §3.8 (§4.2); §3.7 (§4.2, §5.13); Layer R04.4 (§9.2, §10.10, §10.14); §4.11 (§6.7); §4.6 (§6.6, §6.7, §6.11); §4.7 (§6.1, §6.4, §6.6); §4.10 (§6.3, §6.4); §4.9 (§2.9); §5.2 (§5.4, §5.7, §5.8); §5.1 (§2.1); §5.5 (§2.6, §2.7, §2.9); §6.6 (§2.9, §6.1, §6.3, §6.4); §6.3 (§1.5, §2.4); §6.1 (§1.1, §1.2, §1.3, §5.4, §6.2); §6.5 (§3.1, §3.5); §6.4 (§2.8, §3.1, §3.2); §6.2 (§1.5, §1.9, §2.10).

*Arithmetic refinements.* Pan's determinant-fixed pseudodeformation functor lifting `1 + χ̄` with the tame inertia condition `ξ_v + ξ_v^{−1}`, its representability, the comparisons at irreducible characteristic-zero points and at one-dimensional nonsplit-lattice primes (Pan Corollaries 2.2.3 and 2.3.7), the characteristic-zero extension deformation ring `R_B` with its trace map and the height-at-most-one comparison (§10.1–§10.4, §10.7, §10.11, §10.13). Pan §2’s completion and height-at-most-one comparisons for the pseudodeformation ring, built on the generalized matrix algebras and reducibility ideals of §0.2 (§10.1, §10.2, §10.4, §10.13). Euler-characteristic presentations at nonsplit extension points, the bound `dim R_B^{red} ≤ 1 + δ_F + dim H¹` for the reducible locus (a closed subscheme, not the nilradical quotient), and the trace-cut prime selection of Pan §7.2.4 and Corollary 7.4.22 (§10.10–§10.12). Solvable field selection and restriction for Tung Theorem 8.0.3 and Pan §§7.1.2, 7.2.5 and 7.4.2, and preservation of nonsolvable residual image under finite solvable Galois extensions of an arbitrary totally real field (§9.2, §9.3, §10.10, §10.14).

### From LocalGaloisDeformationRings

Local framed deformation rings with fixed determinant, Ihara-avoidance rings and components (Layer 2), BCDT type rings (Layer 3), Barsotti–Tate components (Layers 4–5), and the Fontaine–Laffaille, ordinary, endpoint, archimedean and away-from-p rings with their completed tensor product (Layer 8).

*Uses.* §§F.1.1–F.2.11 (generic deformation functors for §10.1); §§F.2.5–F.2.11 (§10.1, §10.2, §10.4, §10.7, §10.11, §10.13); §F.2.7 (§2.11); §F.2.6 (§1.11); §F.2.5 (§1.5); §2.15 (§3.4a, §4.1, §4.3–§4.4, §5.7); §2.29 (§4.3); Layer 3 (§5.2, §8.2); §3.12 (§5.2, §5.12, §5.14, §5.15); §3.1 (§7.1, §7.2, §7.3, §7.4, §7.6); §3.10 (§1.4, §4.2, §5.8); §3.4 (§8.3, §8.6); §3.9 (§8.2, §8.3); Layer 4 (§5.6, §5.7, §6.8); §4.14 (§5.1, §5.6, §5.7, §6.8); §5.3 (§6.8, §6.15); §5.2 (§6.8, §6.15); §5.13 (§6.8, §6.15); Layer 8 (§1.4, §4.2, §5.8, §10.8, §10.9, §10.13); §8.7 (§6.2); §8.8 (§6.8); §8.17 (§5.4, §6.11, §6.12); §8.15 (§5.9); §8.3 (§5.8); §8.13 (§5.9, §6.15); §8.2 (§5.4).

*Arithmetic refinements.* The Fontaine–Laffaille application uses the general unramified theorem of §3.10: trivial inertial type, regular labelled weights of width at most `p−2`, Fontaine–Laffaille residual data and a nonempty compatible fixed determinant give relative dimension `d²−1+[F_v:ℚ_p]d(d−1)/2`, hence `3+[F_v:ℚ_p]` in rank two (§1.4, §4.2, §5.8). The local smoothness theorem remains with that supplier. The transport of the Barsotti–Tate component criteria to fixed determinant and fixed type after Kisin's base changes, keeping the residual quotient character on ordinary components and the residue-field or trivial-action hypotheses on nonordinary ones (§5.6, §5.7, §6.8). The full BCDT admission predicate (integral type lattice, admitting constituent, inertia alternatives, peu and très ramifié cases, extended types) and the corrected generic-reducedness and smoothness criteria of Gee–Kisin B.4 (§5.2, §5.12, §5.13, §8.2, §8.5). Pan's local pseudo-ring case table: the generic ordinary ideal is principal; the scalar ring `𝒪⟦t₁, t₂, t₃⟧` with its chosen-character ordinary cover `𝒪⟦x₁, x₂⟧`; and the cyclotomic node `𝒪⟦x₀, x₁, y₀, y₁⟧/(x₀y₁ − x₁y₀)` for `p ≥ 5` with ordinary ideal `(x₀, x₁)`, principal away from the singular point (§10.8, §10.9, §10.13).

### From AutomorphicGaloisRepresentations

Representations attached to classical and Hilbert eigenforms, including weight one (Layers 1–3), absolute irreducibility for classical newforms (§4.8), local behaviour at `Σ` and above p (§§4.4–4.9), the Hecke-algebra representation for quaternionic forms (§§6.10–6.12), and the fixed-eigenform family over a common coefficient field with common good Frobenius polynomials (§7.3).

*Uses.* §7.3 (§12.6, §12.7, §12.8); §1.5 (§12.8); §§1.2–1.4 (§5.2); §2.10 (§7.11); §§3.10–3.14 (§1.2, §1.3, §1.6, §7.9); §4.8 (§12.6, §12.7, §12.8); §§4.5–4.9 (§8.2); §§4.5–4.7, 4.9 (§7.1, §7.2, §7.3, §7.4, §7.9, §7.11, §8.2); §§6.10–6.12 (§1.4, §1.5, §2.5, §2.7, §5.7, §5.9, §5.10); §6.10 (§1.4, §1.5, §2.4, §2.6).

*Arithmetic refinements.* The tame-inertia identity at a Taylor–Wiles place (§1.4, §2.5, §2.7). Cuspidal Hilbert automorphic representations with their weight and conductor invariants and residual representations, for the `α/β` predicates, with exact transport of weight, determinant and residual representation under finite-order twists (§1.2, §1.3, §1.6, §7.9). KW II Lemma 7.7 and Corollary 7.8 above p, purity at the potentially semistable automorphic points used in Gee–Kisin B.5.1, and the finite-order global twist that takes a potentially semistable noncrystalline case over `ℚ` to type (C) (§5.18, §8.2). The newform system with common coefficient field, good Frobenius polynomials, oddness and the weight convention (Layer 12).

### From SerreWeightAndLevelOptimisation

The weight part of Serre's conjecture over `ℚ` (Layers 3–4), Buzzard's dyadic results (Layer 5) and the totally real optimisation of KW II §8 (§§6.6–6.11).

*Uses.* §3.7 (§5.5, §5.12, §5.17); §3.14 (§5.17); Layer 4 (§5.17); §4.2 (§5.5, §5.12); §4.7 (§5.5); §§6.6–6.11 (§5.5, §5.7, §5.10, §5.11, §6.9, §8.1, §8.4, §8.5, §8.6, §12.4); §6.6 (§1.6, §1.8); §6.11 (§1.1, §5.4, §6.15).

*Arithmetic refinements.* The type and level changes of definite quaternionic eigenforms used by Kisin (his 2-adic Lemmas (3.3.1)–(3.3.4), his Annals (3.1.6), (3.5.2), (3.5.3)) and Diamond's potentially ordinary modular lift; Gee's auxiliary smooth type `σ̃_i` with `σ_i` in its reduction and the localised comparison `S_{σ̃_i,ψ}(U, 𝒪)_𝔪 ⊗ k ≅ S_{σ_i,ψ}(U, k)_𝔪` (§5.7, §5.10, §5.11, §6.9, §8.4, §8.6). For §5.5 at small primes: at `p = 2 a` modular `ρ̄` of nonsolvable image comes from `S₂(Γ₁(N))` with N odd when `k(ρ̄) = 2`, and from weight two with 2-adic level valuation at most one when `k(ρ̄) = 4`; at `p = 3` removal of the 3-part of the level and weight two at level 3N when `N ≤ 3`. Over `ℚ`, for `k = p + 1` with residual weight two, the weight-two realisation at level prime to p combined with Hasse multiplication and Deligne–Serre lifting supplies the matching-weight seed for the imported crystalline theorem (§5.17). The weight-part theorem for an already modular representation that Kisin's proof uses (Gee, Automorphic lifts of prescribed types, Theorem 4.4.12 as Kisin cites it; Theorem 4.6.9 in the author PDF), and the restricted weight-part theorem for Emerton's CM-induced residual representation, both kept distinct from Serre's conjecture (§8.6, §12.4).

### From OrdinaryAutomorphicFormsAndModularityLifting

Skinner–Wiles ordinary modularity lifting, with its distinct reducible and irreducible residual hypotheses (§§5.4–5.7), and the full-scope totally real implication conditional on `CMComponentSupport` (§5.8). Pan’s ordinary comparisons of §§10.8–10.9 below add the local-scalar and completed pseudo-ring arithmetic needed in this roadmap.

*Uses.* Layer 5 (§5.18, §10.8, §10.9, §10.13, §10.15), with `CMComponentSupport` for any use of §5.8; §5.6 (§5.9); §5.5 (§7.4, §11.1, §11.2, §12.5, §12.8); §5.4 (§11.1, §11.2, §12.3).

*Arithmetic refinements.* The ordinary crystalline endpoint is an application of ClassicalSerreModularity §I.1 with a compatible ordinary witness, distinguishedness and the designated quotient (§5.9, §5.18). The restricted totally real result of OrdinaryAutomorphicFormsAndModularityLifting §5.6 retains its distinguishedness, labelled quotient, compatible seed and exclusion of quadratic induction from a field with a complex place. Every use of its §5.8 assumes `CMComponentSupport`: for the prepared datum over L, a minimal prime q satisfies `ker(r_{𝒟_L}) ⊆ q ⊆ ker(x_L)`, retaining the selected local flags. ClassicalSerreModularity §I.1 supplies the full rational ordinary theorem, including the imaginary-quadratic branch. Pan's reducible local pseudo quotient and `Λ_F-character` map, and the chosen-character ordinary cover for a scalar local residual ratio (Pan §§5.1.1, 6.1.1); finiteness over `Λ_F` of the ordinary pseudo-rings with dense arithmetic points (Pan Theorems 5.1.2(1), 6.1.2(1)); and modularity of the ordinary points over abelian totally real F with p unramified in both the distinguished and the scalar local cases (Pan Theorems 5.1.2(2), 6.1.2(2)) (§10.8, §10.9, §10.13, §10.15).

### Conditional arithmetic hypotheses

The following are explicit mathematical hypotheses of the modern lifting and transfer theorems. Each hypothesis includes the stated objects and comparisons with the indicated sources. Every target that uses one names it in its *Needs* line; none is inferred from generic deformation-ring representability or from finite-level cohomology alone.

- **LL1 (Breuil–Mézard in cycle form).** For `p > 2`, every `ρ̄ : G_{ℚ_p} → GL₂(k)` and every p-adic Hodge type, the special fibre of the potentially semistable deformation ring has cycle equal to the automorphic multiplicity cycle (Tung, odd p, Theorem 1.2; for `p ≥ 5` also Paškūnas, Duke 2015, Theorem 1.1 when `End ρ̄ = k`, and Hu–Tan for split non-scalar `ρ̄`), stated with the Hilbert–Samuel and cycle formalism of DeformationAndDerivedPatchingAlgebra.
- **LL2 (Kisin's local inequality).** `e(R̄_v/π) ≤ μ_Aut` through Colmez's functor (Kisin, Fontaine–Mazur for `GL₂`, §§1.6–1.7, as Gee–Kisin Appendix B.1–B.2 corrects it).
- **LL3 (Kisin's Hypothesis (1.2.6)).** For every de Rham type, the lattice of Kisin's (1.2.6) exists (Emerton, Theorem 3.3.22; Colmez, Theorem VI.6.50, for the crystabelline and semistable cases).
- **CC1.** Tung Lemma 5.3.2's comparison of type-specialised finite-level modules with a faithful algebraic quaternionic module, and Pan's classicality comparison with regular algebraic eigenforms.
- **CC2.** Pan §§3.3, 3.7 and 4.1: the completed Hecke quotient, the determinant-fixed pseudo-character, the p-power tame characters and the nonzero Eisenstein localisation after ordinary modular seed points; Tung §4.2's Hecke-valued representation with determinant `ψε`; and pro-modularity of a prime q of the pseudodeformation ring as containment `ker(R^{ps} → 𝕋_𝔪) ⊆ q`, closed under specialisation. This is a different carrier from the ordinary pro-modular primes of OrdinaryAutomorphicFormsAndModularityLifting.
- **CC3.** Pan Theorem 3.5.5 (Galois and spectral local pseudo-ring actions agree), Corollary 3.5.10 (the block multiplicity module is finite and faithful over completed Hecke, which is finite over the local pseudo-ring) and Corollary 3.5.12 (regular de Rham points that are locally absolutely irreducible at every place above p are classical), with their residual-block and determinant normalisations.
- **CC4.** The global inputs of Tung's proofs: the patched module `M∞` of Caraiani–Emerton–Gee–Geraghty–Paškūnas–Shin with its projectivity, Emerton–Paškūnas's faithfulness of `R∞` on `M∞`, and automorphy of components in the reducible locus through Barnet-Lamb–Gee–Geraghty Theorem A.4.1 (Tung, odd p, §§3–4); Tung's dyadic Theorem 8.0.1 with full support on every patched component, the type-specialised finite modules of his Lemma 5.3.2 and the ordinary and nonordinary component cases; and Pan Theorem 4.1.7 (the localised pseudo-ring-to-Hecke surjection has nilpotent kernel at a nice prime) with the one-dimensional-prime patching of Pan §§4.2–4.8 and §8. Raw completed homology is not finite; finiteness of the modules used comes from CC3.
- **CC5 (independence of the auxiliary globalisations).** The globalisations inside CC4 and LL1 do not use Serre's conjecture: Tung's Lemma 4.3.3 (Calegari Proposition 3.2, Snowden Proposition 8.2.1, KW II Theorem 6.1 at `p = 2`) and Lemma 4.3.4 (Paškūnas Lemma 3.29, KW II Lemma 3.5), the potential automorphy inputs of the patched modules, and the potentially automorphic residual seed assumed by Barnet-Lamb–Gee–Geraghty Theorem A.4.1. Emerton–Paškūnas Theorem 6.3 gives support on a union of components, not full support, so Tung Proposition 3.9's irreducibility, reducedness and density inputs stay. The full-Serre consequences Pan Theorem 1.0.4 (through his Remark 8.0.4) and Emerton's §7.3 are excluded (§12.4).

**LC (twist-two arithmetic vanishing).** For every totally real number field L, odd prime p, finite extension `E/ℚ_p` with integers `𝒪`, and finite set S of finite places of L containing every place above p, assume
`H²(G_{L,S},(E/𝒪)(2))^∨ ⊗_𝒪 E = 0`,
where cohomology is continuous, the coefficient module is discrete and ∨ is Pontryagin duality. The hypothesis includes every finite coefficient extension and every such S. For `F′=F(θ)` in §10.11, total evenness of the finite-order θ makes F′ totally real; restriction–corestriction and the θ-isotypic summand give the corresponding vanishing with coefficients `(E/𝒪)(θε²)`. This is an arithmetic hypothesis separate from Poitou–Tate. Its source is Lichtenbaum, Proposition 9.6, with the coefficient and finite-S passage used in Pan Lemma 7.4.15, pp.119–120; only the displayed rational dual vanishing is assumed here. The Pan conclusions of §§10.11–10.15, the proof of §7.3 and the Pan alternatives of §§12.3, 12.6–12.8 carry LC.

**Checks.**

- `L=ℚ`, `E=ℚ_p` and `S={p}` give the twist-two rational dual vanishing, without any abelian-extension hypothesis on L.
- Replacing S by `S∪{w}` for `w∤p` requires the stated enlarged-S instance; a theorem only for p-places would not supply it.
- This hypothesis does not assert vanishing with finite coefficients `𝒪/πⁿ(2)`. Nor does it assert vanishing of `H²(G_{L,S},(E/𝒪)(1))`, whose twist is different.

## How to read the build

Layers 1–4 build the classical patching argument at a fixed residual representation: the minimal-level Hecke data and the deformation-to-Hecke map (Layer 1), the Taylor–Wiles levels (Layer 2), the arithmetic patching datum and its limit (Layer 3), and the support and avoidance arguments that turn support into modularity (Layer 4). Layers 5 and 6 combine them into the lifting theorems at odd primes and at 2, ending with Khare–Wintenberger I Theorem 4.1 and Hypothesis (H). Within Layer 6, §§6.11–6.14 treat the domain-base Khare–Wintenberger system; §6.7a constructs the ambient component-support system used by §§6.8–6.10. Layers 7–12 are the modern strand over `ℚ`: the statement table and normalisations (Layer 7), de Rham lifting at odd primes (Layer 8) and at 2 (Layer 9), Pan's residually reducible theorem (Layer 10), the ordinary 3-adic completion (Layer 11), and the transfer statements along congruences (Layer 12). Layers 8–10 rest on the conditional inputs LL1–LL3 and CC1–CC5; the Pan branch also carries LC. Layer 0 adds Pan’s arithmetic comparisons to the supplied rank-two trace and lattice theory, and §10.7a supplies abelian Leopoldt. The dependencies form a graph: Layer 5 uses Layers 1–4, Layer 6 uses Layers 1–5, and the modern layers use the classical ones only where a section says so.

## Layer 0: Rank-two traces and nonsplit lattices for Pan’s argument

This layer adds Pan’s odd-involution and trace/deformation comparisons to IntegralHeckeAndGaloisDeterminants §§0.5, 1.2–1.4. Its coefficient rings have 2 invertible. All determinants, Cayley–Hamilton algebras, generalized matrix algebras, reducibility ideals and Ribet lattices use that supplier’s carriers. General representing deformation and pseudodeformation functors remain LocalGaloisDeformationRings Layer F.

### 0.1 Determinants, pseudocharacters and field reconstruction

**Odd-involution field descent.** Use the continuous rank-two determinant and trace equivalence of IntegralHeckeAndGaloisDeterminants §0.5, with normalization `T(1)=2` and `D(g)=(T(g)²−T(g²))/2`, including coefficient change, restriction and the Cayley–Hamilton identities. Let Γ be profinite, K a topological field with 2 invertible, T a continuous rank-two pseudocharacter and c an involution with `T(c)=0`. Prove that the semisimple reconstruction of its determinant descends to a continuous representation over K, uniquely up to isomorphism. The projectors `(1±c)/2` split the obstruction; Pan’s formulas for `a(σ),d(σ),x(σ,τ)` give the descent and its coefficient-change compatibility. Apply this to the residue fields and normalization fraction fields in §§10.1–10.4. Without the odd involution use only the supplier’s reconstruction over an algebraic coefficient extension.
Source: Pan §§2.1.1–2.1.6, pp.7–8, and Taylor’s pseudocharacter theorem cited there. Use the supplied generic pseudodeformation functor rather than defining a second representing ring. Apply reconstruction to the residue fields and normalization fraction fields occurring in §§10.1–10.4.

**Checks.**

- The sum of two characters has trace `χ₁+χ₂` and determinant `χ₁χ₂`; replacing the latter by the sum is rejected by the formula.
- An upper triangular nonsplit extension has the same pseudocharacter as its split semisimplification; field reconstruction returns the semisimplification and cannot recover the extension class.
- For `diag(1,−1)` at c, `T(c)=0` and `D(c)=−1`. At characteristic two, division by 2 and these idempotents are unavailable, outside this layer’s scope.

*Needs:* IntegralHeckeAndGaloisDeterminants §§0.5, 1.2–1.3; ArithmeticGaloisRepresentations Layer 1; LocalGaloisDeformationRings §F.2.11.

### 0.2 Two-block matrix algebras and reducibility ideals

**Arithmetic trace/deformation comparisons.** Let A be complete Noetherian local with odd residual characteristic and a continuous rank-two determinant whose residual characters are distinct. Use its supplied Cayley–Hamilton GMA and two-block ideal `J=im(B⊗_A C→A)` from IntegralHeckeAndGaloisDeterminants §§1.3–1.4, with ordered residual projectors. In Pan’s setting choose them using the involution of §0.1. The supplier’s quotient property, projector independence and coefficient transport are retained. For Γ satisfying Mazur’s p-finiteness condition, an odd multiplicity-free residual trace and the supplied universal rings, prove the following trace/deformation comparisons. At an absolutely irreducible characteristic-zero point with residue field E, the completed localized pseudo-ring represents the E-deformations of that representation. For the deformation ring `R_b` of a nonsplit residual extension and a prime `p_b` with `dim R_b/p_b=1` and irreducible associated representation, the trace map induces an isomorphism of completed localized rings at `p_b` and its contraction, and a surjection of their local spectra. At any prime Q with irreducible associated representation, `dim R_b/Q≤dim R^{ps}/(Q∩R^{ps})`; if Q is minimal its contraction is minimal. Retain finite unramified coefficient extension and descent. These comparisons are not consequences of representability alone.

Source: Pan §§2.1.4–2.3.8, pp.7–15, including the generalized matrix algebra and reducibility references there. In the odd setting `x(σ,τ)=a(στ)−a(σ)a(τ)` generates J and corresponds to `b(σ)c(τ)` in a matrix realization.

**Checks.**

- In an upper triangular matrix realization every product `b(σ)c(τ)` vanishes, hence its trace has J=0, even when the extension class is nonzero.
- For the generalized matrix algebra with B=A and C=tA over `A=k[[t]]`, J=(t); its special fibre is reducible and its generic fibre is not.
- In the preceding example, after `A→k[ε]/(ε²)`, `t↦ε`, the image ideal is `(ε)≠0`; using only reduced field points would incorrectly discard this infinitesimal reducibility obstruction.

*Needs:* §0.1; IntegralHeckeAndGaloisDeterminants §§1.3–1.4; LocalGaloisDeformationRings §§F.2.5–F.2.11.

### 0.3 Nonsplit stable lattices

**One-dimensional lattice/trace comparison.** Use the classical Ribet lattice of IntegralHeckeAndGaloisDeterminants §1.4 for a continuous irreducible rank-two representation of a profinite group over a complete locally compact nonarchimedean fraction field, with distinct residual characters; the supplier gives either prescribed nonsplit orientation. For the one-dimensional complete Noetherian local domains with finite residue field in Layer 10, pass to a local branch of the finite normalization. Its complete DVR has locally compact fraction field, so that theorem applies. Retain its branch map, residue-field extension, homothety and semisimplified trace. For the normalized lattice used in §10.13, fix an involution acting as `diag(1,−1)` and an off-diagonal entry `b(σ₀)=1`. Choose `τ₀` with `c(τ₀)≠0`. After inverting this entry, the trace coordinates of §0.2 recover the other off-diagonal entries by their product identities. For each positive integer n, retain Pan Proposition 2.3.2’s bound: there exists `N=N(n,ρ₀)≥0` such that `c^N` kills the kernel and cokernel of `R^{ps}/q^n→R_b/q_b^n`. Here c is the trace coordinate lifting `c₀(τ₀)`, outside q. The exponent is independent of the ambient profinite group Γ once n and the normalized representation `ρ₀` are fixed; no uniform bound in n is asserted. This gives the lattice/trace comparisons used here. Irreducibility of the generic representation remains a hypothesis.

Source: Pan §2.1.6, §2.3 and §5.7.9, pp.8–15, 84–85; Ribet Proposition 2.1 as cited in Pan §5.7.9.

**Checks.**

- Changing a stable lattice may change a residual extension class, but cannot change its residual semisimplified trace and determinant.
- For `Γ=C₂` at odd p, `1⊕sign` has distinct residual characters, but every stable lattice splits under `(1±c)/2`. It admits no nonsplit residual lattice, so generic irreducibility cannot be dropped.
- At an away-p place over `k[[t]]`, Frobenius `!![1,t;0,1]` gives a finite image with trivial reduction but not the constant residual lift. A nonsplit global residual lattice does not itself imply Pan’s constant away-p condition.

*Needs:* §§0.1–0.2; IntegralHeckeAndGaloisDeterminants §1.4; ArithmeticGaloisRepresentations Layer 1; LocalGaloisDeformationRings §F.2.11.

## Layer 1: Minimal deformation-to-Hecke maps

Start from a residual representation with Khare–Wintenberger lifting data and an actual modular witness at minimal level, and build the localised definite quaternionic Hecke algebra and module whose points satisfy the lifting data at every place of S (§1.1, §1.4). These arithmetic inputs instantiate GlobalGaloisDeformations §§6.7–6.8’s `HeckeGaloisDatum` and its classifying surjection (§1.5, §1.9, §1.10); framing gives the framed algebra, module and map that patching uses (§1.11–§1.14). The `α/β` residual hypotheses of Khare–Wintenberger I are fixed as predicates on actual witnesses and shown stable under allowable base change (§1.2, §1.3, §1.6), and the solvable fields with prescribed completions that the base changes need are constructed (§1.7, §1.8). No datum here contains an `R = T` statement.

### 1.1 Minimal-level data for a modular residual representation

Let `ρ̄ : G_F → GL_2(𝔽)` satisfy KW II's hypotheses with lifting data and `ψ` (GlobalGaloisDeformations §6.1), and suppose, after an allowable base change, that F is totally real of even degree with `[F : ℚ] + |Σ|` even. Minimal-level data consist of: the definite quaternion algebra D/F ramified exactly at `Σ` and the infinite places; the level `U = ∏_v U_v`, maximal compact outside S, `(𝒪_D)_v^×` at `v ∈ Σ` (`D_v^×` when `p = 2`), and at `v | p` maximal compact or `U_1(v)` according to type (A) or (B); the weight module `W_k` (`k = 2` if `p = 2`, with `W_2` extended to `U(𝔸_F^∞)^×` when U is not compact); and a non-Eisenstein maximal ideal `𝔪 ⊂ 𝕋_ψ(U)` such that `ρ̄_𝔪 ≅ ρ̄` and `𝔪` comes from a cuspidal `π` that fits the lifting data. The data record a residual modularity witness (actual eigenform data), not an `R = T` statement.

At each `v∈Σ`, fix the unramified character `γ_v` with `γ_v²=ψ_v`. For odd p and `v∤p`, require `Nv≢−1 (mod p)` or ramification of the common residual local representation. For odd p and `v|p`, retain p unramified in F and nontrivial residual cyclotomic inertia; if `k>2`, Σ is disjoint from the p-places. At `p=2`, use full division level and fix its central-compatible coefficient extension, which selects `γ_v`. These are the hypotheses of HilbertModularVarietiesAndShimuraCurves §R18.3.32, used throughout the fixed-character local-ring construction.

The spaces `S_{k,ψ}(U, 𝒪)`, the Hecke algebra `𝕋_ψ(U)` and non-Eisenstein ideals are HilbertModularVarietiesAndShimuraCurves §§R18.3.1–R18.3.32, with the Khare–Wintenberger specialisations listed in its supplier contract.

The localized faithful Hecke image T is finite, reduced and `𝒪`-flat, with the residue identification `T/𝔪_T ≅ 𝔽`. Its arithmetic eigensystem has `t_v=T_v` and `s_v=ψ(π_v)` for `v∉S`, so the constant coefficient is `Nv·s_v`. These scalars and the `T_v` topologically generate T. Use the jointly injective characteristic-zero eigenform points and their attached representations in GlobalGaloisDeformations §6.8’s `HeckeGaloisDatum.ofPoints`; the absolute irreducibility of `ρ̄` and the compatible residue embeddings are retained. This produces the supplied datum over T, rather than a separate Hecke–Galois structure here. Section 1.4 supplies its local-condition membership.

The existence of the cuspidal `π` fitting KW lifting data is SerreWeightAndLevelOptimisation §6.11 (KW II Theorem 8.4), conditional on its `α/β` witnesses and admissible local data.

A definite D ramified exactly at `Σ ∪ {∞}` exists because `[F : ℚ] + |Σ|` is even (Hasse's parity condition). `π` transfers to `D^×` by Jacquet–Langlands (`π` is discrete series at `Σ`), and its Hecke eigenvalues cut out `𝔪`.

Provide the following operations and compatibility statements.

- `MinimalLevelData: (D, U, W_k, ψ, 𝔪)` with `ρ̄_𝔪 ≅ ρ̄` and `𝔪` from `π` fitting the lifting data.
- `MinimalLevelData.heckeAlgebra: 𝕋 = 𝕋_ψ(U)_𝔪`.
- `MinimalLevelData.heckeModule: M = S_{k,ψ}(U, 𝒪)_𝔪`.
- `MinimalLevelData.residual_iso: ρ̄_𝔪 ≅ ρ̄`.

**Checks.**

- At `p=2`, `U_v=D_v^×` for `v∈Σ`; U is noncompact when `Σ≠∅`. For `Σ=∅` and even `[F:ℚ]`, the parity condition holds and the product of the compact local factors is compact.
- If a candidate ideal has residual `T_w`-eigenvalue different from `tr ρ̄(Frob_w)` at one `w∉S`, it cannot give minimal-level data for `ρ̄`.
- At `p=2` and `v∈Σ` with `ψ_v=1`, a coefficient extension selecting `γ_v(Frob_v)=1` rejects a Steinberg witness with `γ_v(Frob_v)=−1`, despite identical residual signs.
- At `p=2`, the fixed extension of `W_2` at the full division factors selects one of `2^{|Σ|}` character choices (KW II §7).
- Gee’s setting `(p≥5)`: `Σ=∅` after base change and `U_v=GL₂(𝒪_{F_v})` outside T.
- At odd p with `Nv≡−1 (mod p)` and unramified residual restriction, opposite Steinberg signs have the same unordered residual pair; such data fail the sign-identifiability hypothesis.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) §9.1.1, pp. 78–79; [Gee, MLT](<https://arxiv.org/pdf/2202.05818v2>) §5.6, p. 35.)

*Needs:* GlobalGaloisDeformations §§6.1, 6.7–6.8; HilbertModularVarietiesAndShimuraCurves §§R18.3.1–R18.3.32; SerreWeightAndLevelOptimisation §6.11; GL2AutomorphicRepresentationsAndTransfer §R17.3.1.

### 1.2 Residual modularity of minimal weight and unramified level

For F totally real and the residual representation `ρ̄` of KW lifting data, `ResidualModularAlpha (ρ̄)` means there exists a cuspidal `π` of `GL₂(𝔸_F)` with `ρ̄_π≅ρ̄`, parallel weight `k(ρ̄)`, and `π_v` unramified at every v|p. This is a predicate on witnesses, not an assertion that every modular witness has minimal weight.

F is totally real and `ρ̄ : G_F → GL_2(𝔽)` is as in KW II §8, with lifting data and determinant character `ψ` (GlobalGaloisDeformations §6.1; the local conditions are LocalGaloisDeformationRings §8.2).

Define the existential predicate using the Hilbert automorphic representation and its attached Galois representation from AutomorphicGaloisRepresentations §§3.10–3.14. It precedes construction of §1.1; no residual-modularity theorem or optimized witness is part of the definition.

Provide the following operations and compatibility statements.

- `ResidualModularAlpha: (α): ρ̄ ≅ ρ̄_π` with `π` unramified above p, of weight `k(ρ̄)`.
- `residualModularAlpha_iff`: The predicate holds iff a cuspidal witness of weight `k(ρ̄)`, unramified at all v|p, with residual representation `ρ̄` exists.
- `residualModularAlpha_of_witness`: A witness with the stated residual representation, weight and level gives `ResidualModularAlpha (ρ̄)`.

**Checks.**

- `alpha_of_goodReduction`: A modular elliptic curve with good reduction at p and `k(ρ̄)=2` supplies an `α-witness`.
- `alpha_weight_must_match`: An unramified weight `k(ρ̄)+p−1` eigenform is not itself an `α-witness`, since its weight differs from `k(ρ̄)`.
- `steinberg_not_alpha`: A Steinberg eigenform at p is not an `α-witness`, while its conductor-p component is allowed in `a β-witness`. This concerns that witness, not nonexistence of every `α-witness` for `ρ̄`.
- `ρ̄ = ρ̄_E` for an elliptic curve `E/ℚ` with good reduction at p: E's newform is unramified at p of weight 2, so `(α)` holds when `k(ρ̄) = 2`.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) §8.2, p. 70.)

*Needs:* GlobalGaloisDeformations §6.1; AutomorphicGaloisRepresentations §§3.10–3.14.

### 1.3 Residual modularity of weight two and conductor at most one

For F totally real and the residual representation `ρ̄` of KW lifting data, `ResidualModularBeta (ρ̄)` means there exists a cuspidal `π` of `GL₂(𝔸_F)` with `ρ̄_π≅ρ̄`, parallel weight two, and conductor exponent at most one at every v|p.

F is totally real and `ρ̄ : G_F → GL_2(𝔽)` is as in KW II §8, with lifting data and determinant character `ψ` (GlobalGaloisDeformations §6.1; the local conditions are LocalGaloisDeformationRings §8.2).

Define the existential predicate using the Hilbert automorphic representation and its attached Galois representation from AutomorphicGaloisRepresentations §§3.10–3.14. It precedes construction of §1.1; no residual-modularity theorem or optimized witness is part of the definition.

Provide the following operations and compatibility statements.

- `ResidualModularBeta`: The existential predicate with the stated weight-two and conductor conditions.
- `residualModularBeta_iff: ResidualModularBeta (ρ̄)` iff a cuspidal `π` with residual representation `ρ̄`, weight two and local conductor exponent `≤1` exists.
- `residualModularBeta_of_witness: A π` satisfying those three conditions gives `ResidualModularBeta (ρ̄)`.

**Checks.**

- `beta_of_unramified_weight_two`: A weight-two unramified local witness has conductor exponent zero and hence satisfies the `β` local bound.
- `beta_allows_steinberg_witness`: A weight-two Steinberg component of conductor exponent one is allowed in `a β-witness`.
- `conductor_two_not_beta_witness`: A weight-two eigenform with conductor exponent two at a place above p is not itself `a β-witness`; this does not preclude another witness.
- At weight two an `α-witness` also witnesses `β`; for `ρ̄ = ρ̄_E` with `E/ℚ` of good reduction at p, E's newform witnesses `(β)`.
- A residual witness of weight `k(ρ̄) + p − 1 ≥ 3`, unramified at p, is not `a β-witness`: the weight at infinity must be 2.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) §8.2, p. 70.)

*Needs:* GlobalGaloisDeformations §6.1; AutomorphicGaloisRepresentations §§3.10–3.14.

### 1.4 Hecke eigen-systems satisfy the lifting data at every place of S

Under §1.1’s residual-sign, p-adic inertia and division-level coefficient hypotheses, for every `𝒪`-algebra map `x : 𝕋_ψ(U)_𝔪 → 𝒪′` (`𝒪′` the integers of a finite extension of E), the specialisation `ρ_x` of `ρ_𝔪` has determinant `ψχ_p`, is unramified outside S, and satisfies the local condition of the lifting data at each `v ∈ S`. At `v ∈ Σ` not above p it is semistable of the form `(χ_pγ_v ∗; 0 γ_v)` with a fixed unramified `γ_v` (KW II Lemma 7.2). At the infinite places it is odd. At `v | p` it is of type (A) (crystalline of low weight), (B) (weight two) or (C) (weight-two semistable), according to `U_v`. This identifies the local deformation problem represented at each place.

The datum’s representation `ρ_𝔪` over `𝕋_ψ(U)_𝔪`, and the compatibility of `π` ↦ `ρ_π` with the local Langlands correspondence away from p (Carayol, Taylor) and at p (Kisin, Saito, Skinner; KW II Lemma 7.7 and Corollary 7.8), are the arithmetic refinements of this target using AutomorphicGaloisRepresentations §§4.4–4.9 and 6.10–6.12.

Apply GlobalGaloisDeformations §6.8’s `HeckeGaloisDatum.mem_of_points` to these specializations. The point maps to the finite-extension DVRs have jointly zero kernel because the Hecke image is reduced and `𝒪`-flat. The local defining ideals and fixed determinant therefore vanish in T. This establishes membership in the global deformation problem. The local conditions and their rings are LocalGaloisDeformationRings Layer 8, with the arithmetic refinements listed in the supplier contract.

`𝒪′-points` of `𝕋_ψ(U)_𝔪` correspond to the Hecke eigenforms in `S_{k,ψ}(U, 𝒪)_𝔪`, hence to cuspidal `π` with `ρ̄_π ≅ ρ̄` (Jacquet–Langlands, HilbertModularVarietiesAndShimuraCurves §§R18.3.1–R18.3.32). At `v ∈ Σ: π_v` is an unramified twist of Steinberg, and the Galois representation restricted to `D_v` has the form `(χ_pγ_v ∗; 0 γ_v)` with `γ_v` unramified and fixed independently of the eigenform under §1.1’s sign-identifiability hypotheses (HilbertModularVarietiesAndShimuraCurves §R18.3.32; at `p=2` through full division level and its fixed coefficient extension). At `v | p: U_v` maximal compact means `π_v` unramified, so `ρ_x|D_v` is crystalline of weight k; `U_1(v)` gives weight two with the tame inertial type; `v ∈ Σ` above p gives semistable weight two (Corollary 7.8). At `∞: ρ_π` is totally odd.

**Checks.**

- For type (A) at `v | p` with `k = 2` and `π_v` unramified, the specialisation is crystalline with Hodge–Tate weights {0, 1}.
- For `p=3`, `Nv≡−1` and an unramified residual restriction, the two signs give `{1,−1}` and do not select a single fixed-character ring; this case is excluded by §1.1.
- If the residual local representation is ramified, its unique inertia-invariant line fixes the quotient character even when `Nv≡−1`; the character stays fixed while the extension class may vary.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) §9.1.1 and the proof of Lemma 9.1, pp. 79–80; [KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) Lemma 7.2, pp. 60–61.)

*Needs:* §1.1; GlobalGaloisDeformations §6.8; HilbertModularVarietiesAndShimuraCurves §R18.3.32; AutomorphicGaloisRepresentations §§6.10–6.12; LocalGaloisDeformationRings Layer 8; AutomorphicGaloisRepresentations §6.10.

### 1.5 The deformation-to-Hecke map

Use the fixed-determinant classifying map of GlobalGaloisDeformations [§6.7](../GlobalGaloisDeformations/README.md#hecke-galois-datum) on the `HeckeGaloisDatum` constructed in §1.1. Section 1.4 supplies membership in the prescribed global deformation problem, including `det ρ_𝔪=ψχ_p`. Denote this arithmetic specialization by `defToHecke: π : R̄^ψ_S →ₐ[𝒪] 𝕋_ψ(U)_𝔪`. It is continuous and local. Its Frobenius trace identity is `defToHecke_trace`; `defToHecke_unique` denotes the specialization of `HeckeGaloisDatum.classifying_unique`, so agreement on the universal traces outside S determines the map. These are names for the supplied interface at this arithmetic input. Framed base change is constructed in §§1.11–1.14.

**Checks.**

- A proposed map sending a good Frobenius trace to `T_v+1` is rejected: composing with an eigenform point gives `a_v+1`, whereas its Galois trace is `a_v`.
- For a weight-two witness unramified at `v|p`, composing with its Hecke point gives a crystalline lift of weights `{0,1}` and determinant `ψχ_p`, as prescribed by §1.4.
- A map from the unrestricted ring whose specialization is ramified at an away-p place required to be unramified cannot factor through the specified local-condition quotient.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) Lemma 9.1, p. 80; [Gee, MLT](<https://arxiv.org/pdf/2202.05818v2>) §5.6, p. 35.)

*Needs:* §§1.1, 1.4; GlobalGaloisDeformations §§6.7–6.8; AutomorphicGaloisRepresentations §§6.10–6.12.

### 1.6 The residual hypotheses (α) and (β) persist under allowable base change

Let F and `ρ̄` be as in KW II §7.6.2 and F′/F an allowable base change. If `ρ̄|_{G_F}` satisfies `(α)` with witness `π`, then `ρ̄|_{G_{F′}}` satisfies `(α)` with witness the base change `π_{F′}`; likewise for `(β)`. More precisely `π_{F′}` is cuspidal, it is discrete series of the same parallel weight at every infinite place of F′, `ρ̄_{π_{F′}} ≅ ρ̄_π|_{G_{F′}}`, and for places `w | v | p: π_{F′,w}` is unramified if `π_v` is, and its conductor exponent is at most 1 if that of `π_v` is.

Allowable changes are those of SerreWeightAndLevelOptimisation §6.6 (KW II Definition 7.9). KW II do not define "solvable"; what their constructions give, and what is used here, is a tower `F = F₀ ⊂ … ⊂ F_n = F′` of Galois steps with soluble groups, so that base change can be applied along cyclic steps of prime degree. Image preservation is the relative condition `ρ̄(G_{F′}) = ρ̄(G_F)` with `ρ̄|G_{F′(μ_p)}` absolutely irreducible.

Cuspidality of each base change uses that the restriction of `ρ̄` stays absolutely irreducible (the image condition of an allowable change): a cuspidal `π` whose base change along a cyclic extension is not cuspidal is automorphically induced from that extension, and then `ρ_π` restricted to it is reducible.

F′/F is unramified above p, and for an unramified local extension the conductor exponent of the local base change equals that of `π_v`.

The definitions of `(α)` and `(β)` do not contain this transport; KW II use it without comment whenever they 'reinitialise' the base field.

Refine the soluble tower of the allowable change to cyclic steps of prime degree, each Galois over the previous field and totally real. For one cyclic step apply Langlands' base change (GL2AutomorphicRepresentationsAndTransfer §§R17.4.1–R17.4.11, R17.6.19): it exists, is compatible with local base change at every place, and is cuspidal by the irreducibility remark above. Local behaviour. At infinite places the extension of completions is `ℝ/ℝ` and the weight is unchanged. At `w | v | p` the extension `F′_w/F_v` is unramified: an unramified principal series stays unramified, and the conductor exponent is unchanged in general. Galois side. `ρ_{π_{F′}} ≅ ρ_π|_{G_{F′}}` by comparison of Frobenius traces at the unramified places (AutomorphicGaloisRepresentations §§3.10–3.14), hence the same for the residual representations.

**Checks.**

- F′/F quadratic, `π` unramified at `v | p` inert in `F′: π_{F′,w}` is unramified, so an `(α)-witness` base-changes to an `(α)-witness`.
- A Steinberg component at `v | p` (conductor exponent 1) base-changes along an unramified extension to a Steinberg component: `a (β)-witness` stays `a (β)-witness` and does not become an `(α)-witness`.
- If the residual image shrank over F′ so that `ρ̄|_{G_{F′}}` were reducible, `π_{F′}` could fail to be cuspidal; this is excluded by the definition of allowable.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) §7.6.2, after Definition 7.9, p. 68.)

*Needs:* §1.2; §1.3; SerreWeightAndLevelOptimisation §6.6; GL2AutomorphicRepresentationsAndTransfer §§R17.4.1–R17.4.11, R17.6.19; AutomorphicGaloisRepresentations §§3.10–3.14.

### 1.7 Soluble extensions with prescribed completions

This roadmap owns `cht_soluble_prescribed_completions`, the prescribed-completion theorem below.

Let F be a number field, D/F finite Galois, S a finite set of places, and `E_v/F_v` finite Galois for each v in S (at real places either R or C). There is a finite soluble Galois E/F linearly disjoint from D/F such that for every w above v in S, `E_w` is isomorphic to `E_v` as an `F_v-algebra`. Taking `E_v=R` at every real place makes E totally real when F is totally real. No assertion of cyclic E of a prescribed degree is made.

At a real place v, `E_v` is `ℝ` or `ℂ`; at a finite place `E_v/F_v` is any finite Galois extension, hence soluble. D/F is finite Galois.

Add split conditions at a nonsplit prime for each simple Galois subextension of D, by Chebotarev. Induct on the maximum of the local extension degrees. Finite Galois groups of nonarchimedean local fields are soluble, so choose a nontrivial cyclic quotient at each nonsplit place. Realise each cyclic local first step: by local class field theory (Tau Ceti ClassFieldTheory, Layer 7) choose a finite-order character `χ_S` of `∏_{v∈S} F_v^×` whose kernel at v corresponds to the cyclic `E_v/F_v`; extend it to a finite-order idele class character by the Grunwald–Wang theorem (ArithmeticGaloisDuality §§R02.4.5b–R02.4.6; the possible doubling of the order is harmless); let the cyclic extension be its class field (Layer 12). Apply induction to the remaining local extensions. Take the normal closure of the composite over F; local normality ensures the completions remain `E_v`, solvability is preserved, and the added split conditions force disjointness.

**Checks.**

- For all `L_v=K_v` check complete splitting, and for a real place prescribed R check that all resulting real completions remain R. The avoidance field must be included at each cyclic tower step.
- If every `E_v = F_v`, the lemma gives a soluble E/F, linearly disjoint from D, in which every `v ∈ S` splits completely; `E = F` is allowed.
- Prescribing `E_v = ℝ` at every real place of a totally real F makes E totally real.

([CHT](<https://www.numdam.org/item/10.1007/s10240-008-0016-1.pdf>) Lemma 4.1.2, statement p. 116 and proof p. 117.)

*Needs:* ArithmeticGaloisDuality §§R02.4.5b–R02.4.6; TauCetiRoadmap Chebotarev, Layer 10; TauCetiRoadmap ClassFieldTheory, Layer 12; TauCetiRoadmap ClassFieldTheory, Layer 7.

### 1.8 Existence of allowable base changes with prescribed completions

Let F and `ρ̄` be as in KW II §7.6.2 (F totally real, unramified at p, split at p if `ρ̄|_{D_p}` is irreducible; `ρ̄|_{G_F}` of non-solvable image if `p = 2`, and `ρ̄|_{G_{F(μ_p)}}` absolutely irreducible if `p > 2`). Let `S₀` be a finite set of finite places of F containing the places above p, and for `v ∈ S₀` let `E_v/F_v` be a finite Galois extension, unramified if `v | p` and equal to `F_v` if `v | p` and `ρ̄|_{D_p}` is irreducible. Let L/F be a finite extension. Then there is a finite Galois extension F′/F with soluble Galois group such that: (1) F′ is totally real; (2) [F′ : F] is even; `(3) F′_w ≅ E_v` over `F_v` for every `v ∈ S₀` and every place `w | v` of F′, so that F′/F is unramified above p, split at each v with `E_v = F_v`, and split above p when `ρ̄|_{D_p}` is irreducible; (4) F′ is linearly disjoint over F from L, from the fixed field K of `ker ρ̄|_{G_F}` and from `K(μ_p)`, so that `ρ̄(G_{F′}) = ρ̄(G_F)` and `ρ̄(G_{F′(μ_p)}) = ρ̄(G_{F(μ_p)})`. (5) If every `E_v, v ∈ S₀`, has degree at most 2 over `F_v`, then F′ can be taken quadratic over F. In particular F′/F is an allowable change in the sense of SerreWeightAndLevelOptimisation §6.6 (KW II Definition 7.9), with the prescribed completions at `S₀`. The base F′ again satisfies the conditions of §7.6.2, so the statement can be applied repeatedly, and the resulting towers are allowable over `F (kwOptimisationData_allowable_comp)`.

At a place above p only an unramified `E_v` may be prescribed, and only the trivial one when `ρ̄|_{D_p}` is irreducible. A nontrivial unramified `E_v` above p occurs in Lemma 8.1 (to make `ρ̄` trivial above p when it is unramified there), in the dyadic branch with `k(ρ̄) = 4` and in type (C) with `k(ρ̄) = 2`, the two cases in which Theorem 8.4 does not promise splitting at p.

Evenness comes from one auxiliary place with the unramified quadratic extension prescribed, not from the places of `S₀`; without it `F′ = F` would satisfy (1), (3) and (4).

KW II's second criterion, for dihedral projective image (a prime split in the field cut out by the projective image and inert in `F(μ_p)`), is not needed: disjointness from `K(μ_p)` preserves the image over the cyclotomic field.

KW II cite Lemma 2.2 of Taylor's 'On icosahedral Artin representations II' for this; the statement is derived here from Clozel–Harris–Taylor's Lemma 4.1.2 (§1.7), whose cyclic steps use the Grunwald–Wang theorem of ArithmeticGaloisDuality Layer R02.4.

No automorphic input is used: this is existence of a field, not GL2AutomorphicRepresentationsAndTransfer §§R17.4.1–R17.4.11, R17.6.19's base change.

`'ρ̄|_{D_p}` is irreducible' means absolutely irreducible, as everywhere in KW II §§7–8: an unramified `ρ̄|_{D_p}` has cyclic image and is reducible over `𝔽̄_p`.

Clause (5) matters: Lemma 4.1.2 controls the completions but not the global degree, and the proof of Theorem 8.4 needs extensions of degree exactly 2 (KW II p. 77: each `F_i/F_{i−1}` is quadratic, with one place above `v_i's` neighbours and two above `v_i`). For exponent 2 no class field theory is needed, only weak approximation.

Auxiliary place. Choose a finite place u of F outside `S₀`, not above p, and let `E_u` be the unramified quadratic extension of `F_u`. Apply Clozel–Harris–Taylor's Lemma 4.1.2 (§1.7) to F, to D the Galois closure over F of `L·K(μ_p)`, and to the set `S = S₀ ∪ {u} ∪` {real places of F}, with the given `E_v` at `S₀, E_u` at u and `E_v = F_v = ℝ` at the real places. It gives a finite soluble Galois F′/F, linearly disjoint from D, with `F′_w ≅ E_v` for all `w | v ∈ S`. Totally real: every real place of F splits completely in F′. Even degree: F′/F is Galois, so the local degree `[F′_w : F_u] = 2` divides [F′ : F]. The conditions at p are read off (3). Images. F′ is linearly disjoint from `K(μ_p)` over F, so restriction is an isomorphism `Gal(F′K(μ_p)/F′) ≅ Gal(K(μ_p)/F)` carrying the subgroup that fixes `μ_p` to the subgroup that fixes `μ_p`. Hence `ρ̄(G_{F′}) = ρ̄(G_F)` and `ρ̄(G_{F′(μ_p)}) = ρ̄(G_{F(μ_p)})`; absolute irreducibility over `F′(μ_p)`, and non-solvability at `p = 2`, are properties of these images (ArithmeticGaloisRepresentations Layer 4). Quadratic case (5). Write `E_v = F_v(√d_v)` with `d_v ∈ F_v^×` (`d_v = 1` if `E_v = F_v`). Choose a finite place z of F outside `S₀`, not above 2, that splits completely in D (Chebotarev for the trivial class; Tau Ceti Chebotarev, Layer 10), and a non-square unit `d_z` of `F_z`. The squares are open in each `F_v^×`, so by weak approximation there is `d ∈ F^×` that is totally positive, lies in `d_v·(F_v^×)²` for `v ∈ S₀` and in `d_z·(F_z^×)²`. Put `F′ = F(√d)`. It is totally real, quadratic (z is inert), with completions `E_v` at `S₀`; and F′ is not contained in D, because z is inert in F′ and splits completely in D, so `F′ ∩ D = F`. No auxiliary place u is needed, since the degree is 2. Iteration. F′ is totally real, unramified at p and split at p when required, with the same residual images, so §7.6.2 holds over F′; a tower of such steps is allowable over F by the composition of allowable changes (SerreWeightAndLevelOptimisation §6.6, `kwOptimisationData_allowable_comp`).

**Checks.**

- `F = ℚ, p = 5, S₀ = {5}` with `E₅ = ℚ₅, u = 3: ℚ(√11)` is real quadratic, 5 splits in it `(11 ≡ 1 mod 5)` and 3 is inert `(11 ≡ 2 mod 3)`. Disjointness from K is a further condition, which is why D enters the construction.
- With `S₀ = {v | p}` and every `E_v = F_v` the lemma gives the allowable base changes 'split at p' of Theorem 8.2.
- Prescribing the unramified extension of degree m at the places of a finite set makes the p-part of the residue-field unit groups there as large as required; this is the use in the proof of Theorem 8.2 (order divisible by the p-part of `2p(4N_w)`).
- Over the field `F_{i−1}` of the proof of Theorem 8.4, clause (5) with the trivial extension at the places above `v_i` and the unramified quadratic extension at the places above the other `v_j` gives a quadratic `F_i`, with `v_j` inert for `j ≠ i` and split for `j = i`. Without clause (5) the degree of `F_i` could be a larger even number, and the count of places above `v_1, …, v_i` in the proof would be wrong.
- Without the real places in S the extension could be totally complex, and the Hilbert modular setting would be lost.

([CHT](<https://www.numdam.org/item/10.1007/s10240-008-0016-1.pdf>) Lemma 4.1.2, statement p. 116 and proof p. 117; [KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) §7.6.2, paragraph after Definition 7.9, p. 68; [KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) §7.6.2, p. 68.)

*Needs:* SerreWeightAndLevelOptimisation §6.6; §1.7; ArithmeticGaloisRepresentations Layer 4; TauCetiRoadmap Chebotarev, Layer 10; `TauCeti.GlobalNumberFields.weakApproximation_denseRange`.

### 1.9 Trace characterization of the Hecke map

For the minimal-level Hecke map `π` and every v outside S, `π(tr ρ_univ(Frob_v))=T_v` and `π(det ρ_univ(Frob_v))=N(v)ψ(π_v)`, with the normalization fixed by the Hecke representation. These identities determine `π` because the global trace subring is the entire unframed deformation ring.

`ρ̄` is absolutely irreducible, so the unframed ring is generated topologically by traces (GlobalGaloisDeformations §6.2); `T_v` and `S_v` are the Hecke operators at the places `v ∉ S`, with `S_v` acting by `ψ(π_v)`.

Both identities follow from the characteristic polynomial of the supplied datum. Uniqueness is the specialization of `HeckeGaloisDatum.classifying_unique` in GlobalGaloisDeformations §6.7.

**Checks.**

- KW II use arithmetic Frobenius: the characteristic polynomial of `ρ_𝔪(Frob_v)` is `X² − T_vX + N(v)ψ(π_v)`; with geometric Frobenius the eigenvalues are inverted and both coefficients change, so the convention is part of the statement.
- Two continuous maps `R̄^ψ_S → 𝕋` agreeing on all `tr ρ_univ(Frob_v), v ∉ S`, are equal by the supplied unframed uniqueness theorem.
- With a nonempty framing set, distinct choices of images for a formal frame coordinate have the same traces. The uniqueness theorem is applied to the unframed ring only.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) Lemma 9.1 and proof, pp. 79–80.)

*Needs:* §1.5; GlobalGaloisDeformations §6.7.

### 1.10 Surjectivity of the deformation-to-Hecke map

The unframed deformation-to-Hecke map `π:R̄_S^ψ→T_ψ(U)_m` is surjective. Framed surjectivity is established after the framed algebra is constructed, in §1.13.

Apply GlobalGaloisDeformations §6.7’s `HeckeGaloisDatum.classifying_surjective` to §1.1’s datum and §1.4’s local-condition membership. The trace-generation hypothesis holds because the away-S determinant operators are the fixed coefficient scalars `S_v=ψ(π_v)`. Framed surjectivity is its base change in §1.13.

**Checks.**

- Gee's argument (MLT, before Lemma 5.7): local–global compatibility puts the Hecke operators that generate `𝕋_∅` in the image of the deformation ring, which gives surjectivity.
- At Taylor–Wiles level the same argument gives `R̄^ψ_{S∪Q} ↠ 𝕋_{ψ,Q}(U_Q)_𝔪` (§2.2).
- If `𝕋` included `U_v` at a place of S outside the image of the traces, surjectivity could fail; KW II's `𝕋_ψ(U)` uses only `v ∉ S`.
- Extend the standard rank-two `S₃` representation over `ℤ₅` to `T=ℤ₅[ε]/(ε²)` without changing its matrices. Its traces remain in `ℤ₅`, so it fails the datum’s trace-generation hypothesis and cannot give a classifying surjection onto T.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) proof of Lemma 9.1, p. 81.)

*Needs:* §§1.1, 1.4–1.5, 1.9; GlobalGaloisDeformations §6.7.

### 1.11 Framed Hecke algebra

Fix a framing presentation `R̄_S^{□,ψ}≅R̄_S^ψ[[y_1,…,y_j]], j=4|S|−1` (from Layer 2 on these framing variables are renamed `y_{h+1},…,y_{h+j}`, after the h variables of the Taylor–Wiles group rings). Define `T^□=T⊗_{R̄_S^ψ}R̄_S^{□,ψ}`. Because T is a finite, hence finitely presented, `R̄_S^ψ-module` over the complete Noetherian base, this ordinary tensor product agrees with the completed tensor and identifies with `T[[y_1,…,y_j]]`.

`T = 𝕋_ψ(U)_𝔪` is finite over O, reduced and O-flat, and receives the surjection from `R̄^ψ_S` (§1.10); the framing presentation of `R̄_S^{□,ψ}` over `R̄^ψ_S` is fixed once (LocalGaloisDeformationRings §F.2.6).

Use the chosen framed/unframed presentation and the unframed surjection. The finite O-module T is finite over `R̄`, hence finitely presented because `R̄` is Noetherian. Apply the finite-module completion comparison to identify `T⊗R̄ R̄[[y]]` with T[[y]]. The quotient by the variables is T. No tensor–infinite-product interchange is used without finite presentation.

Provide the following operations and compatibility statements.

- `framedHecke`: The O-algebra `T⊗_R̄ R̄^□` with its specified deformation and Hecke maps.
- `framedHecke_series: T^□≅T[[y_1,…,y_j]]` as T-algebras, for the chosen framing presentation and finite presentation of T.
- `framedHecke_augmentation`: Quotienting by all framing variables gives T with its original map from `R̄`.

**Checks.**

- `framedHecke_three`: For `|S|=1` the ring is `T[[y_1,y_2,y_3]]`.
- `framedHecke_aug`: Killing every framing variable recovers T.
- `framedHecke_tensor_limit`: The interchange of a tensor product with infinite coefficient products requires finite presentation; no unrestricted tensor–power-series identity is asserted.
- `T^□` is not finite over O when `|S| ≥ 1`: it has `j = 4|S| − 1` free framing variables.
- For a module that is not finitely presented the ordinary tensor with a power-series ring need not be the module of power series; the identification is used only for the finite T.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) Lemma 9.1 and §9.1.1, pp. 79–80.)

*Needs:* §1.10; LocalGaloisDeformationRings §F.2.6; DeformationAndDerivedPatchingAlgebra §1.13.

### 1.12 Framed Hecke module

For the finite O-free Hecke module `M=S_{k,ψ}(U,O)_m`, define `M^□=M⊗_{R̄_S^ψ}R̄_S^{□,ψ}`. Its commuting `T^□-action` is induced by the Hecke action and the framing presentation. Finite presentation over the Noetherian deformation base gives `M^□≅M[[y_1,…,y_j]]`, and augmentation gives M.

M is finite O-free; T is its faithful Hecke action image. Fix the same framing presentation used to define `T^□`. All tensor–completion comparisons use finite presentation.

Use the finite-module tensor–completion comparison, then transport the two commuting actions. The action, not just the underlying O-module, is preserved under the augmentation.

Provide the following operations and compatibility statements.

- `framedHeckeModule: M^□` with its `T^□-action` and O[[y]]-scalar action.
- `framedHeckeModule_series: M^□≅M[[y]]` as modules with both actions.
- `framedHeckeModule_augmentation: M^□/(y)≅M, T^□/(y)≅T` equivariantly.

**Checks.**

- `framedModule_rank`: If `M≅O^s`, then `M^□≅O[[y]]^s`.
- `framedModule_aug`: Augmentation recovers the original Hecke module with its action.
- `framedModule_action`: Replacing the faithful Hecke action on a nonzero M by the zero action fails the required unital `T^□-module` compatibility.
- `|S| = 1`: three framing variables.
- `M^□/(y_1, …, y_j) = S_{k,ψ}(U, 𝒪)_𝔪`.
- `𝕋^□_𝔪` is not finite over `𝒪`: the framing variables are free.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) Lemma 9.1 and §9.1.1, p. 80.)

*Needs:* §1.11; DeformationAndDerivedPatchingAlgebra §1.13.

### 1.13 Framed deformation-to-Hecke map

Define `π^□:R̄_S^{□,ψ}→T^□` by `r↦1⊗r`. It is the base change of `π`, is surjective, and the chosen framing presentations identify it with coefficientwise `π` on power series.

The unframed `π : R̄^ψ_S ↠ T` and the framing presentation `R̄_S^{□,ψ} ≅ R̄^ψ_S[[y_1,…,y_j]]` are fixed; `π^□` is defined on the framed ring by base change, not by a choice of images of the framing variables.

Base change the unframed surjective map `R̄→T` along `R̄→R̄^□`. Right exactness of tensor gives surjectivity. The selected power-series presentations identify this map with coefficientwise `π`. Taking the quotient by the variables recovers `π` and proves the augmentation square.

Provide the following operations and compatibility statements.

- `defToHeckeFramed`: The continuous O-algebra map `r↦1⊗r`.
- `defToHeckeFramed_coeff`: Its restriction to `R̄` is `π` followed by `T→T^□`.
- `defToHeckeFramed_aug`: Its quotient by all framing variables is `π`.

**Checks.**

- `framedMap_variable`: Each chosen framing variable maps to the matching variable in T[[y]].
- `framedMap_aug`: At augmentation the map is the unframed map.
- `framedMap_not_aug`: For j>0 and `T≠0`, sending all framing variables to zero does not give the specified base-change map.
- Right exactness: the base change of a surjective ring map is surjective, so `π^□` is onto `T^□`.
- Composing `π^□` with the quotient by `(y_1,…,y_j)` recovers `π`.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) §9.1.1 after Lemma 9.1, p. 80.)

*Needs:* §1.11; §1.10.

### 1.14 Faithfulness and freeness after framing

Assume `M≠0` is finite O-free and faithful over its finite reduced O-flat Hecke action image T. For the chosen framing presentation, `T^□` is reduced and O-flat, `M^□` is faithful over `T^□`, and `M^□` is finite free of `rank rank_O M` over `O[[y_1,…,y_j]]`. The faithful flat base extension argument uses the finite presentation of M.

`M ≠ 0` is finite free over O and faithful over its Hecke action image T, which is finite, reduced and O-flat; the framing presentation is the one used for `T^□` and `M^□`.

Use the finite-presentation power-series identifications `T^□≅T[[y]]` and `M^□≅M[[y]]`. A basis of the finite O-free module M gives a basis of `M^□` over O[[y]]. A nonzero power series acting on M[[y]] has a first nonzero coefficient, which acts nontrivially on some element of M by faithfulness. Thus the framed action is faithful. Reducedness of T[[y]] and O-flatness follow coefficientwise from reducedness and O-torsion-freeness of T.

**Checks.**

- For `M = O` and `T = O` the conclusions read: O[[y]] is reduced, O-flat, and O[[y]] acts faithfully on itself.
- Faithfulness of `M^□` over `T^□` uses faithfulness of M over T: the zero action of T on M would give a non-faithful framed action.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) Lemma 9.1 and §9.1.1, p. 80.)

*Needs:* §1.12; §1.11; DeformationAndDerivedPatchingAlgebra §1.13.

### Examples

For KW II at `p = 2` with `Σ` nonempty the level is not compact (`U_v = D_v^×` at `v ∈ Σ`) and `W_2` has `2^{|Σ|}` extensions (§1.1). The field `ℚ(√11)` at `p = 5` is an allowable quadratic change with `u = 3: 11` is a square modulo 5 and not modulo 3 (§1.8). A Hecke point of type (A) at `v | p` with `k = 2` and `π_v` unramified is crystalline with weights {0, 1} (§1.4).

### Dependencies

ArithmeticGaloisDuality (Layer R02.4); ArithmeticGaloisRepresentations (Layer 4); AutomorphicGaloisRepresentations (§§3.10–3.14; §§6.10–6.12); DeformationAndDerivedPatchingAlgebra (Layer 1); GL2AutomorphicRepresentationsAndTransfer (§§R17.3.1–R17.3.9; §§R17.4.1–R17.4.11, R17.6.19); LocalGaloisDeformationRings (§§F.2.5–F.2.11); GlobalGaloisDeformations (Layer R04.6); HilbertModularVarietiesAndShimuraCurves (§§R18.3.1–R18.3.32); LocalGaloisDeformationRings (Layer 8); Mathlib and Tau Ceti (`TauCeti.GlobalNumberFields.weakApproximation_denseRange`); SerreWeightAndLevelOptimisation (§§6.6–6.11); TauCetiRoadmap Chebotarev (Layer 10); TauCetiRoadmap ClassFieldTheory (Layer 12, Layer 7).

## Layer 2: Auxiliary Taylor–Wiles levels and freeness

Add the Taylor–Wiles places chosen by GlobalGaloisDeformations Layer R04.5 to the level (§2.1), build the auxiliary Hecke image, the residual branch ideal and the auxiliary deformation-to-Hecke map (§2.2–§2.4), and prove that the diamond and Galois actions of `Δ_Q` agree, that the localised modules are free over `𝒪[Δ_Q]` and that they specialise back to the original level (§2.5–§2.8, §2.10–§2.12). The dyadic twist of forms is compared with the twist on the deformation side (§2.9). Localised control itself is HilbertModularVarietiesAndShimuraCurves §§R18.3.1–R18.3.32; this layer checks its hypotheses at the arithmetic levels.

### 2.1 Auxiliary levels at Taylor–Wiles places

For minimal-level data and a Taylor–Wiles datum Q of GlobalGaloisDeformations Layers R04.5–R04.6, disjoint from S, specialize the existing HilbertModularVarietiesAndShimuraCurves §R18.3.12 construction. Use the supplied isotropy exponent bound N, `Δ′_v` the maximal p-quotient of k(v)×, `Δ_v=Δ′_v/Δ′_v[N]` and its product `Δ_Q`. The actual arithmetic levels have `(U_Q^0)_v=U_0(v)` and `(U_Q)_v` the kernel of `a/d→Δ_v`, and are U away from Q. Record their identification `U_Q^0/U_Q≅Δ_Q`, the chosen uniformizers and root labels, and the common coefficient lattice/character. The generic level and group-quotient constructions belong to HilbertModularVarietiesAndShimuraCurves §§R18.3.1–R18.3.32; this target assembles them for this lifting problem.

The finiteness of the isotropy groups and the bound on the exponent of their Sylow p-subgroups are KW II §7.2 (HilbertModularVarietiesAndShimuraCurves §§R18.3.1–R18.3.32). For `p ≥ 5` unramified in F they have order prime to p (Gee §5.3), so N is prime to p and `Δ_v = Δ′_v`.

Quotienting by the N-torsion is what makes characters of `Δ_Q` kill the isotropy groups; the congruence `N(v) ≡ 1 mod p^n` alone does not.

`U_Q` is normal in `U^0_Q`, and a ↦ `ad^{−1}` induces `U^0_Q/U_Q ≅ ∏_v Δ_v`. Every character of `Δ_v`, viewed on `Δ′_v`, kills the N-torsion, so it is an N-th power.

Provide the following operations and compatibility statements.

- `auxLevel: U_Q ⊆ U^0_Q ⊆ U` for a Taylor–Wiles datum Q.
- `auxDelta: Δ_Q = ∏_v Δ′_v/(N-torsion)`.
- `auxLevel_quotient: U^0_Q/U_Q ≃ Δ_Q`.
- `auxDelta_char_pow`: Under the fixed coefficient extension containing the needed roots of unity, the `Δ_Q` characters of HilbertModularVarietiesAndShimuraCurves §§R18.3.1–R18.3.32 are N-th powers on `Δ′_Q`, for these arithmetic levels.

**Checks.**

- `auxLevel_empty: Q = ∅` gives U.
- `auxLevel_quotient: U^0_Q/U_Q ≅ Δ_Q`.
- `auxDelta_needs_quotient`: With `Δ′_v` in place of `Δ_v`, characters need not kill p-torsion isotropy. For `Δ′_v=ℤ/4` and N=2, `Δ′_v[N]` has order two and `Δ_v=ℤ/2`, rather than `ℤ/4`.
- `Q = ∅: U_Q = U^0_Q = U` and `Δ_∅ = 1`.
- For `p ≥ 5` unramified (Gee), N is prime to p and `Δ_v` is the full p-part of `k(v)^×`.
- Using `Δ′_v` when the isotropy groups have p-torsion (possible for `p = 2`, 3) breaks the freeness of Lemma 7.4: a character of `Δ′_v` need not kill the isotropy.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) §7.4, p. 63; [Gee, MLT](<https://arxiv.org/pdf/2202.05818v2>) §5.6, p. 35.)

*Needs:* §1.1; GlobalGaloisDeformations §5.1; HilbertModularVarietiesAndShimuraCurves §§R18.3.1–R18.3.32; HilbertModularVarietiesAndShimuraCurves §R18.3.12; HilbertModularVarietiesAndShimuraCurves §R18.3.10; HilbertModularVarietiesAndShimuraCurves §R18.3.13.

### 2.2 Auxiliary Hecke action image

For the specified auxiliary level `U_Q`, let `T_{ψ,Q}(U_Q)` be the O-subalgebra of `End_O S_{k,ψ}(U_Q,O)` generated by `T_v,S_v` for v outside `S∪Q`, the uniformizer-dependent `U_v` at `v∈Q`, and diamonds for `Δ_Q`. This target constructs the action image before choosing a residual branch or constructing a deformation map.

Fix the level, central character, coefficient lattice and uniformizers. The diamond action factors through `Δ_Q`; the global deformation ring still carries the larger `Δ′_Q` action.

Take the algebra generated by the specified Hecke operators on the finite O-module. The branch localization, eigenvalue identities and comparison with the smaller Hecke algebra are separate targets.

Provide the following operations and compatibility statements.

- `auxHecke`: The generated O-subalgebra of `End_O S(U_Q,O)`.
- `auxHecke_action_faithful`: The tautological action is faithful because this is its action image.
- `auxHecke_diamonds`: Diamonds give `O[Δ_Q]→T_{ψ,Q}(U_Q)`, compatible with right translation.

**Checks.**

- `auxHecke_empty`: For Q empty this is the original Hecke algebra.
- `auxHecke_scalar`: A scalar central operator acts by the fixed central character.
- `auxHecke_delta_quotient`: An element of `Δ′_Q[N]` acts trivially after passage to `Δ_Q`; retaining an independent nontrivial diamond for it gives the wrong algebra.
- For `Q=∅`, `auxHecke=𝕋_ψ(U)` before localization. After §2.3 selects `𝔪_∅=𝔪`, its localized ring is `𝕋_ψ(U)_𝔪`, and §2.4 recovers §1.5’s map. For an action image `𝒪×𝒪`, choosing one residual branch gives `𝒪`, not the entire action image.
- `U_v` ↦ `A_v` under the map to level U (§2.5), not `U_v` ↦ `B_v`.
- With equal residual eigenvalues the simple-root Hensel argument and separation into two residual eigenlines fail; this does not assert that a maximal ideal cannot exist.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) §7.4 before Corollary 7.5, p. 65; §9.1.1, p. 80; [KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) Remark after Lemma 9.1, p. 81.)

*Needs:* §2.1; HilbertModularVarietiesAndShimuraCurves §§R18.3.1–R18.3.32.

### 2.3 Auxiliary residual branch ideal

Let `m^away` be the ideal of the algebra generated by away-from-Q operators specifying the residual eigensystem. Choose `α_v` at every `v∈Q` and any coefficient representative `α̃_v`. Define `m_Q=`(`m^away,U_v−α̃_v` for `v∈Q`) in `T_{ψ,Q}(U_Q)`, and take its complete local factor. The ideal is independent of all representatives of the same `α_v`; choosing `β_v` selects the other branch.

For each `v ∈ Q` the residual Frobenius eigenvalues `α_v ≠ β_v` are fixed and `N(v) ≡ 1 mod p`; the residual eigensystem away from Q is the non-Eisenstein `𝔪` of the minimal level.

Apply the supplied selected-root Iwahori comparison to the distinct residual eigenvalues to obtain the nonzero residual eigenspace with `U_v=α_v`. Its Hecke character defines the required maximal ideal. Two coefficient representatives differ by the coefficient maximal ideal, already in `m^away`. They generate the same ideal. The other residual root defines a different residual character; it is a different branch, rather than another lift of the same root.

Provide the following operations and compatibility statements.

- `auxMaxIdeal`: The branch ideal `(m^away,U_v−α̃_v:v∈Q)`.
- `auxMaxIdeal_lift_independent`: Replacing `α̃_v` by a congruent representative leaves the ideal and its local factor unchanged.
- `auxMaxIdeal_residue`: In the residue field `U_v` acts by the chosen `α_v` and the away-from-Q operators by the fixed residual eigensystem.

**Checks.**

- `auxIdeal_empty`: When Q is empty the branch ideal is m.
- `auxIdeal_representative`: Changing `α̃_v` to `α̃_v+πc` adds an element already in `m^away` and gives the same ideal.
- `auxIdeal_other_root`: If `α_v≠β_v`, the two branch ideals cannot be identified: their `U_v` residues differ.
- `Q = ∅` gives back `𝔪`.
- Choosing `β_v` instead of `α_v` at one place gives a different maximal ideal: the residues of `U_v` differ.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) §7.4, pp. 64–65; Lemma 9.1, p. 80.)

*Needs:* §2.2; HilbertModularVarietiesAndShimuraCurves §R18.3.31; HilbertModularVarietiesAndShimuraCurves §R18.3.28.

### 2.4 Auxiliary deformation-to-Hecke map

There is a continuous local O-algebra map `π_Q:R̄_{S∪Q}^ψ→T_{ψ,Q}(U_Q)_{m_Q}` classifying the Hecke representation with the prescribed local conditions and labelled inertia character `γ_{α_v}`. The ring receives `O[Δ′_Q]`; its Hecke image factors through the module diamonds for `Δ_Q`.

The Hecke algebra `𝕋_{ψ,Q}(U_Q)_{𝔪_Q}` is finite, reduced and O-flat, and its characteristic-zero points satisfy the lifting data at S and are unramified-principal-series with a tame inertia character at each `v ∈ Q` (local–global compatibility, AutomorphicGaloisRepresentations §§6.10–6.12).

First use the closed subalgebra generated by the away-`S∪Q` traces, with the prescribed determinant scalars. Its characteristic-zero points, obtained by restricting the eigenform points, are jointly injective. GlobalGaloisDeformations §6.8’s `HeckeGaloisDatum.ofPoints` and `mem_of_points` give the representation and local-condition membership over this trace algebra. Compose the supplied classifying map with its inclusion into the selected auxiliary action image; this is `defToAuxHecke`. Check local–global compatibility at the point representations, including the selected tame inertia line at each `v∈Q`. The labelled line identifies the `Δ′_Q-character`; comparison with module diamonds is §2.6. Section 2.11 identifies the trace algebra with the entire selected action image.

Provide the following operations and compatibility statements.

- `defToAuxHecke`: The continuous local O-algebra homomorphism `π_Q`.
- `defToAuxHecke_trace: π_Q(tr ρ_univ(Frob_w))=T_w` for w outside `S∪Q`.
- `defToAuxHecke_universal`: Base change of the universal deformation along `π_Q` is isomorphic to the Hecke-valued representation, compatibly with its determinant and labelled local conditions.

**Checks.**

- `auxMap_empty`: For Q empty `π_Q` is `π`.
- `auxMap_trace`: Every unramified Frobenius trace has the specified `T_w` image.
- `auxMap_wrong_branch`: Labelling `γ` by `β_v` while retaining the `α_v` branch is incompatible with the selected residual line.
- `Q = ∅` recovers §1.5.
- At `p = 2` the map is also compatible with the twisting actions of `Hom(G_{Q_n,2}, O^×)` (§2.9).

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) Lemma 9.1 and proof, pp. 79–81.)

*Needs:* §2.3; §1.4; GlobalGaloisDeformations §§6.7–6.8; AutomorphicGaloisRepresentations §6.10.

### 2.5 Freeness at the arithmetic Taylor–Wiles levels

At the Taylor–Wiles data Q of GlobalGaloisDeformations Layer R04.5 and the selected branch `m_Q, S_{k,ψ}(U_Q,O)_{m_Q}` is finite free over `O[Δ_Q]` of `rank s = rank_O S_{k,ψ}(U,O)_m`, and its `Δ_Q-coinvariants` are `S_{k,ψ}(U,O)_m` through `ξ_v(f) = A_v f − (1 0; 0 π_v)f`. This is HilbertModularVarietiesAndShimuraCurves §R18.3.31 applied at these primes; what is checked here is that the GlobalGaloisDeformations §5.1 primes satisfy its hypotheses (`N(v) ≡ 1 mod p^n`, two distinct residual Frobenius eigenvalues, the isotropy quotient `Δ_Q` of §2.1).

The localized freeness and coinvariant control, with the Hensel root `A_v` and the Steinberg exclusion through local–global compatibility, are HilbertModularVarietiesAndShimuraCurves §R18.3.31 (KW II Corollary 7.5); geometric freeness is HilbertModularVarietiesAndShimuraCurves §R18.3.14, `TwFreeness` (Lemma 7.4).

The congruence `N(v) ≡ 1 mod p^n` alone does not give freeness: the isotropy quotient of §2.1 is used.

The GlobalGaloisDeformations Layer R04.5 Taylor–Wiles primes are prime to S, have `N(v) ≡ 1 mod p^n` and distinct residual Frobenius eigenvalues `α_v ≠ β_v`; the branch `m_Q` contains `U_v − α̃_v` (§2.3). With `Δ_Q = Δ′_Q/Δ′_Q[N]` as in §2.1, these are the hypotheses of HilbertModularVarietiesAndShimuraCurves §R18.3.31, which gives freeness of rank s and the coinvariant isomorphism through `ξ_v`.

**Checks.**

- `Q = ∅`: the statement is the tautology `S(U)_𝔪 = S(U)_𝔪`.
- The rank over `𝒪[Δ_Q]` does not depend on Q or n, which is what patching needs.
- Gee Proposition 5.9 is the same control statement, `∏_{v∈Q}(U_ϖ_v − B_v) : S_∅ ≅ S(U_{Q,0}, 𝒪)_{𝔪_Q}`, with the other eigenvalue `B_v`.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) Corollary 7.5 and its proof, pp. 65–66; [Gee, MLT](<https://arxiv.org/pdf/2202.05818v2>) Proposition 5.8(2) and Proposition 5.9, pp. 36–37.)

*Needs:* §2.1; §2.2; HilbertModularVarietiesAndShimuraCurves §§R18.3.1–R18.3.32; AutomorphicGaloisRepresentations §§6.10–6.12; `Module.Free; MonoidAlgebra`; §2.3; HilbertModularVarietiesAndShimuraCurves §R18.3.31; HilbertModularVarietiesAndShimuraCurves §R18.3.28; HilbertModularVarietiesAndShimuraCurves §R18.3.14.

### 2.6 Auxiliary eigencharacter compatibility

For `v∈Q`, the map `π_Q` sends `γ_{α_v}(π_v)` to `U_v` on the selected branch and sends its tame inertia character to the matching diamond operator. These are equalities in the complete local Hecke algebra. The arbitrary representative `α̃_v` is not asserted to equal `U_v`.

The Hecke algebra at level `U_Q` is reduced and O-flat, so an identity holds in it as soon as it holds at every characteristic-zero point; at each point local–global compatibility at `v ∈ Q` is available (AutomorphicGaloisRepresentations §§6.10–6.12).

At every characteristic-zero Hecke point, local–global compatibility identifies the selected inertia/Frobenius line with the `U_v` branch reducing to `α_v`. Compare the resulting `U_v` and tame-character functions in the finite reduced O-flat localized Hecke algebra. Its embedding in the product of characteristic-zero points gives equality in that algebra, not merely equality after reduction.

**Checks.**

- The operator `U_v` depends on the uniformiser `π_v`; the identity `γ_{α_v}(π_v)` ↦ `U_v` is stated for that same `π_v`.
- An arbitrary lift `α̃_v` of `α_v` is not `U_v`; only its reduction is fixed.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) proof of Lemma 9.1, pp. 80–81.)

*Needs:* §2.4; GlobalGaloisDeformations §5.5; AutomorphicGaloisRepresentations §6.10.

### 2.7 The diamond and Galois actions of Δ_Q agree

On `S_Q := S_{k,ψ}(U_Q, 𝒪)_{𝔪_Q}` the two actions of `Δ_Q` agree: the diamond action h ↦ ⟨h⟩ `=` (h̃ 0; 0 1), and the action through `Δ_Q → (R̄^ψ_{S∪Q})^× → 𝕋_{ψ,Q}(U_Q)_𝔪` given by `∏_v γ_{α_v}` (the character `χ_α` ∘ Art). Equivalently, ⟨h⟩ acts on the `U_v-eigenline` whose actual characteristic-zero eigenvalue reduces to `α_v` through the character of `π_v` lifting `α_v`.

The needed local–global compatibility at `v ∈ Q` (`π_v ≅ χ₁ × χ₂` tamely ramified principal series, with eigenvalues of `ρ_π(Frob_v)` equal to `#k(v)^{1/2}χ_i(ϖ_v)`) is AutomorphicGaloisRepresentations §§6.10–6.12.

The lift `α̃_v` defining `𝔪_Q` is arbitrary and is not asserted to equal the actual `U_v-eigenvalue` (KW II p. 65; Gee Proposition 5.8, p. 36).

A point `θ` of `𝕋_Q` gives `π` with `π_v^{U_{Q,v}} ≠ 0`, so `π_v` is a subquotient of `χ₁ × χ₂` with `χ_i` tamely ramified. `(χ₁ × χ₂)^{U_{Q,v}} = ℂφ₁` ⊕ `ℂφ_w`, with `U_ϖ φ_w = #k(v)^{1/2}χ₂(ϖ)φ_w` and `U_ϖ φ₁ = #k(v)^{1/2}χ₁(ϖ)φ₁ + Xφ_w. αv ≠ βv` forces `χ₁/χ₂ ≠ |·|^{±1}`, so `π_v = χ₁ × χ₂` is irreducible and one may take `χ₂(ϖ)` ↔ `α_v`. The `U_v-eigenline` with eigenvalue `#k(v)^{1/2}χ₂(π_v)` reducing to `α_v` is `ℂφ_w`, on which `(δ 0; 0 1)` acts by `χ₂(δ) = χ_α` ∘ Art (Gee Proposition 5.8(1)).

**Checks.**

- `Q = ∅`: nothing to check.
- If one used the `β_v-eigenvalue`, the diamond action would match `γ_{β_v} = γ_{α_v}^{−1}` on inertia instead.
- The agreement is what lets the patched Hecke module be a module over the patched deformation ring compatibly with `𝒪⟦y_1, …, y_h⟧`.

([Gee, MLT](<https://arxiv.org/pdf/2202.05818v2>) Proposition 5.8(1) and its proof, p. 36; [KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) Lemma 9.1 (compatibility with `𝒪[Δ′_{Q_n}]`), p. 80.)

*Needs:* §2.2; GlobalGaloisDeformations §5.5; AutomorphicGaloisRepresentations §§6.10–6.12; §2.6; HilbertModularVarietiesAndShimuraCurves §R18.3.31.

### 2.8 The system of Hecke modules at Taylor–Wiles levels

For the Taylor–Wiles data `Q_n` of GlobalGaloisDeformations §6.4, `M_n := S_{k,ψ}(U_{Q_n}, 𝒪)_𝔪 ⊗_{R̄^ψ_{S∪Q_n}} R̄^{□,ψ}_{S∪Q_n}` is an `𝒪[Δ_{Q_n}]⟦y_{h+1}, …, y_{h+j}⟧-module`. It is finite free, of rank equal to the `𝒪-rank s` of `S_{k,ψ}(U, 𝒪)_𝔪`, independent of n. Its (`Δ_{Q_n}`, y)-coinvariants are `S_{k,ψ}(U, 𝒪)_𝔪`, and the `R̄^{□,ψ}_{S∪Q_n}-action` is compatible with GlobalGaloisDeformations §6.4’s `𝒪⟦y_1, …, y_{h+j}⟧-structure`. This is the finite-level module input to arithmetic patching.

The patching of the system `(M_∞, R_∞)` is Layer 3, with DeformationAndDerivedPatchingAlgebra Layer 5 and DeformationAndDerivedPatchingAlgebra Layer 6.

Freeness over `𝒪[Δ_{Q_n}]` with the right rank and coinvariants is §2.5; tensoring with the framing variables keeps it free. Compatibility of the two `𝒪[Δ]-actions` is §2.7; the y-structure on the ring side is GlobalGaloisDeformations Layer R04.6.

Provide the following operations and compatibility statements.

- `twModule: M_n = S(U_{Q_n})_𝔪 ⊗ R̄^{□,ψ}_{S∪Q_n}`.
- `twModule_free`: Finite free over `𝒪[Δ_{Q_n}]⟦y⟧` of rank s.
- `twModule_coinv`: Coinvariants `≅ S(U)_𝔪`.

**Checks.**

- `twModule_empty: Q = ∅` gives the framed module at level U.
- `twModule_rank_const`: The rank does not depend on n.
- `twModule_not_free_without_isotropy`: With `Δ′` instead of `Δ` and p-torsion isotropy, freeness can fail.
- `Q_n = ∅`: the system is the framed module of §1.12.
- The annihilator `𝔟_n` of `M_n` in `𝒪⟦y⟧` lies in `((1 + y_i)^{p^{n−a}} − 1)_{i≤h}` (KW II §9.1.3, with `2^a > N` for `p = 2`).
- Without freeness over `𝒪[Δ]`, the patched module would not be finite free over `𝒪⟦y⟧`, and the depth argument of Layer 3 fails.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) proof of Proposition 9.2, p. 82.)

*Needs:* §2.5; §2.7; §1.12; GlobalGaloisDeformations §6.4; §1.14; §1.13; §2.6; HilbertModularVarietiesAndShimuraCurves §R18.3.31.

### 2.9 Dyadic Hecke twists agree with deformation twists

For `p=2` and the actual auxiliary levels, identify the quadratic class-field characters used in GlobalGaloisDeformations Layer R04.6 with finite-idelic characters trivial at infinity and on Nrd `U_Q`. Import the norm twist and its `T_v,U_v,S_v,diamond` formulas from HilbertModularVarietiesAndShimuraCurves §§R18.3.1–R18.3.32. The resulting semilinear action on the localized Hecke module agrees under `π_Q` with the deformation-ring twisting action: Frobenius traces acquire `χ(π_v)`, diamonds acquire `χ`, and framing variables are fixed. The character is quadratic, so it preserves the central character; `χ≡1` modulo the coefficient maximal ideal preserves `m_Q`.

The twist f ↦ `f_χ` and Proposition 7.6 on quaternionic forms are HilbertModularVarietiesAndShimuraCurves §R18.3.26 and §R18.3.27, `DyadicHeckeTwist`. This target is the compatibility with the deformation side used in KW II §9.

`χ` is split at the infinite places, so it defines a character of `(𝔸_F^∞)^×`.

Apply the order-two idele-character twist of HilbertModularVarietiesAndShimuraCurves §§R18.3.1–R18.3.32 and Hecke formulas (Proposition 7.6), after identifying the GlobalGaloisDeformations Layer R04.5 class-field-theory characters with the finite-idelic characters trivial at infinity and unramified outside Q. Their invariance and operator formulas are HilbertModularVarietiesAndShimuraCurves §§R18.3.25–R18.3.27. Since `χ ≡ 1 mod 𝔪`, the action preserves `𝔪`. Compatibility with the R-side twists holds because both sides multiply Frobenius traces by `χ(π_v)` and act on `Δ` by `χ` (Lemma 5.12).

**Checks.**

- `χ` trivial: the identity action.
- `(f|⟨h⟩)_χ = χ^{−1}(h)f_χ|⟨h⟩`: the diamond operators are twisted by `χ^{−1}`, matching `a_χ` ∘ `δ = χ(δ)`(`δ` ∘ `a_χ`).
- For p odd, order-2 characters are not residually trivial, so there is no such action on the localisation.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) §7.5, Proposition 7.6 and the following paragraph, pp. 66–67; [KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) proof of Lemma 9.1, p. 81.)

*Needs:* §2.2; GlobalGaloisDeformations §4.9; GlobalGaloisDeformations §5.5; GlobalGaloisDeformations §6.6; HilbertModularVarietiesAndShimuraCurves §§R18.3.1–R18.3.32; §2.4; §2.6; HilbertModularVarietiesAndShimuraCurves §R18.3.26; HilbertModularVarietiesAndShimuraCurves §R18.3.27; HilbertModularVarietiesAndShimuraCurves §R18.3.25.

### 2.10 Surjectivity at auxiliary level

The auxiliary deformation-to-Hecke map `π_Q` is surjective. Away-from-Q traces, the selected `U_v` and the diamond characters generate the localized Hecke algebra and all lie in its image.

The auxiliary Hecke algebra is generated over O by `T_w, S_w (w ∉ S ∪ Q), U_v` and the diamond operators `(v ∈ Q)`, and is complete local after localisation at `𝔪_Q`.

GlobalGaloisDeformations §6.7’s `HeckeGaloisDatum.classifying_surjective` gives surjectivity onto the trace algebra used in §2.4. Section 2.11 identifies that algebra with the full selected auxiliary action image, using the labelled eigencharacter comparisons. This gives the stated auxiliary-level surjectivity.

**Checks.**

- `Q = ∅`: this is §1.10.
- Without the identity `γ_{α_v}(π_v)` ↦ `U_v` the operators `U_v` need not lie in the image of the trace map.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) Lemma 9.1 and following remark, pp. 80–81.)

*Needs:* §§2.4, 2.6, 2.11; §2.2; GlobalGaloisDeformations §6.7.

### 2.11 Comparison with the trace-generated Hecke algebra

The natural inclusion `T_ψ(U_Q)_m→T_{ψ,Q}(U_Q)_{m_Q}` is an isomorphism. The chosen branch is understood on the right. The trace-generated algebra on the left contains the traces of the reconstructed representation; residual absolute irreducibility allows descent of that representation and forces the extra `U_v` and diamond operators into the image.

`ρ̄` is absolutely irreducible, so a representation whose traces lie in a closed subalgebra is defined over that subalgebra (Carayol, LocalGaloisDeformationRings §F.2.7).

Work in the selected local factor of the enlarged action image. Its Hecke representation has traces in the closed away-from-Q trace algebra and absolutely irreducible residual representation. Carayol trace descent gives a representation over that smaller algebra. Its labelled local eigenspaces recover `U_v` and the diamond characters there by the same distinct-root and inertia argument. Thus the inclusion contains every extra generator and is surjective as well as injective.

**Checks.**

- `Q = ∅`: both algebras are `𝕋_ψ(U)_𝔪`.
- The comparison is at the selected branch `𝔪_Q`; at the other branch (`β_v` instead of `α_v`) it is a different local factor.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) remark following Lemma 9.1, p. 81.)

*Needs:* §2.4; §2.6; GlobalGaloisDeformations §§6.7–6.8; LocalGaloisDeformationRings §F.2.7.

### 2.12 Freeness and specialization of the module system

Let `R_n` and `M_n` be the framed deformation and Hecke-module systems with one fixed framing choice. `M_n` is free of rank s over `O[Δ_{Q_n}][[y_{h+1},…,y_{h+j}]]`, its coefficient action is the restriction of `R_n→End(M_n)`, and `M_n/(y_1,…,y_h)≅M^□`. Killing all y variables gives M. The rank and every comparison are independent of n.

One framing presentation is fixed for all n; the `Δ_{Q_n}-module` structure comes from the diamond operators and agrees with the `Δ′_{Q_n}-action` on the ring side through §2.7.

Base change the finite free `O[Δ_Q]-module` along the fixed framing presentation. Finite presentation identifies this base change with power series in the j framing variables. Use §2.7 to identify the first h scalar variables with the chosen diamond generators. Their augmentation is the integral coinvariant isomorphism of HilbertModularVarietiesAndShimuraCurves §R18.3.31 (through §2.5). The remaining j variables are the framing variables, so their further augmentation gives M.

**Checks.**

- `Q_n = ∅: M_n = M^□` and killing the framing variables gives M.
- The rank s over `O[Δ_{Q_n}][[y_{h+1},…,y_{h+j}]]` does not depend on n, which the patching argument needs.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) Proposition 9.2, proof pp. 81–83.)

*Needs:* §2.8; HilbertModularVarietiesAndShimuraCurves §R18.3.31; §2.7; §1.14.

### Examples

At a Taylor–Wiles place v with `N(v) ≡ 1 mod p^n` and distinct eigenvalues of `ρ̄(Frob_v)`, put `Δ′_v=k(v)^×(p)` and `Δ_v=Δ′_v/Δ′_v[N]` for the isotropy exponent N of §2.1. The localized module at level `U_Q` is free over `𝒪[Δ_Q]` with `Δ_Q-coinvariants` the module at level U (§2.5, §2.12). When N is prime to p, `Δ_v=Δ′_v`; for `Δ′_v=ℤ/4` and N=2, the quotient is `ℤ/2`. For `p = 2` the quadratic character `χ ≡ 1` modulo `𝔪` preserves `𝔪` and multiplies Frobenius traces by `χ(π_v)` on both sides (§2.9).

### Dependencies

Layer 1 of this roadmap; AutomorphicGaloisRepresentations (§§6.10–6.12); LocalGaloisDeformationRings (§§F.2.5–F.2.11); GlobalGaloisDeformations (Layer R04.4; Layer R04.5; Layer R04.6); HilbertModularVarietiesAndShimuraCurves (§§R18.3.1–R18.3.32); Mathlib and Tau Ceti (`Module.Free, MonoidAlgebra`).

## Layer 3: Arithmetic patching

Feed the Taylor–Wiles systems into Kisin's patching datum of DeformationAndDerivedPatchingAlgebra Layer 5: the patching data of each level (§3.1–§3.3), the patched ring and module (§3.4), the support of the patched module on a union of components of the local deformation ring (§3.5), finiteness of the minimal deformation ring (§3.6) and the generic-fibre `R = T` statement (§3.7). Framing variables, their removal and the determinant are tracked through every specialisation.

### 3.1 Patching data of level m from the Taylor–Wiles systems

The arithmetic level-m patching datum is the ring-module datum of DeformationAndDerivedPatchingAlgebra §5.6 at cutoff m, with Kisin's parameters specialised to `S∞ = O[[y_1,…,y_{h+j}]], J = (y_1,…,y_h), B = R̄^{loc,ψ}_S` of dimension `d + 1, A = B[[x_1,…,x_{h+j−d}]], R = R̄_S^{□,ψ}, M = M^□` and `s = rank_O M > 0`, with `c_m =` (`π_O^m, (1+y_i)^{p^m}−1` for `i ≤ h, y_{h+i}^{p^m}` for `i ≤ j`) and bound `r_m = s·m·p^{m(h+j)}; m_C^{(r)}` is generated by r-th powers of elements of `m_C`, not the ideal power `m_C^r`. To the patching datum of DeformationAndDerivedPatchingAlgebra §5.6, `S∞/c_m → D_m ↠ R/(c_mR + m_R^{(r_m)}), A ↠ D_m, m_{D_m}^{(r_m)} = 0, L_m` free of rank s over `S∞/c_m` with `L_m ↠ M^□/c_m`, this target adds the arithmetic structure: `D_m/JD_m ≅ R/(c_mR + m_R^{(r_m)})` as B-algebras, the framing action of `y_{h+1},…,y_{h+j}` on R, and the Hecke action on `M^□` through `𝕋^□`. Morphisms preserve these maps. The same datum underlies `(D_m, L_m)` in the dyadic construction, whose extra determinant data are §6.1.

This ring-module construction is the domain case: O has finite residue field, B is complete Noetherian local, O-flat, a domain of dimension `d + 1` with B[1/p] formally smooth (KW II §9.1.1; LocalGaloisDeformationRings §8.17), and all maps are continuous local O-algebra maps. A fixed presentation and all framing choices are part of the datum. The avoidance pair, whose unprimed local ring can be reducible, uses the separate ambient-module construction of §3.4a. Kisin’s dyadic ambient system uses §6.7a; it retains the finite scalar, module and augmentation data without the domain hypothesis of this target.

For dyadic data replace A by `B[[x_1,…,x_{h+j+t−d}]]` before taking the determinant-one quotient; `m ≥ 3` in the action-chunk construction.

Instantiate DeformationAndDerivedPatchingAlgebra §5.6 with the displayed parameters; its cutoff ideal, element-power ideal and finite-free module condition are used unchanged. Add the arithmetic augmentation, framing and Hecke maps; reduction from level `m + 1` to m is the reduction of that patching datum together with the reduction of these maps. That the actual Taylor–Wiles system gives such data is §3.2.

Provide the following operations and compatibility statements.

- `PatchingDatum`: The displayed level-m rings, module, presentations, scalar maps and augmentation maps.
- `PatchingDatum.reduce`: The level-(m+1) datum reduces via `D/(c_m+m_D^{(r_m)})` and `L/c_m`, preserving every structure map.
- `PatchingDatum.isomorphism`: An isomorphism preserves both coefficient maps, the A-presentation, the R-augmentation, the module action and the augmentation to `M^□/c_m`.
- `patchingRadius: r_m = s·m·p^{m(h+j)}` as a function of natural numbers; it is monotone in m for `p ≥ 1 (patchingRadius_mono_level)`, equals s·m when `h + j = 0`, and is 18 at `s = 1, p = 3, m = 2, h + j = 1`.

**Checks.**

- `patchingDatum_rm`: For `s=1,p=3,m=2,h+j=1` one has `r_m=18`.
- `patchingDatum_power_ideal`: Over `F₂[[x,y]], m^{(2)}=(x²,y²)`, whereas m² also contains xy.
- `patchingDatum_scalars`: The identity of the underlying finite module is not a datum isomorphism unless it intertwines the specified `S∞` and `D_m` actions.
- For `h = 0`, choosing `Q_n` empty and fixed framings makes the chosen finite-level system constant.
- The rank s of `L_m` over `𝒪⟦y⟧/c_m` does not depend on m or n.
- Without the bound `𝔟_n ⊆ ((1 + y_i)^{p^n} − 1), L_m` would not be free over `𝒪⟦y⟧/c_m`.

([Kisin, finite flat](<https://people.math.harvard.edu/~kisin/dvifiles/bt.dvi>) Proposition (3.3.1), proof pp. 62–64, equations (3.3.2)–(3.3.3); [KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) proof of Proposition 9.3, pp. 84–86.)

*Needs:* §2.8; GlobalGaloisDeformations §6.4; GlobalGaloisDeformations §6.5; DeformationAndDerivedPatchingAlgebra §§5.6–5.7; §2.12; DeformationAndDerivedPatchingAlgebra §5.6.

### 3.2 Arithmetic realization of each finite patching level

Fix `a≥0` with `p^a>N` for the isotropy exponent; at `p=2` also require `a≥2`. For all sufficiently large `n≥m` (`m≥3` at `p=2`), put `D_{m,n}=R_{n+a}/(c_mR_{n+a}+m_{R_{n+a}}^{(r_m)})` and `L_{m,n}=M_{n+a}/c_mM_{n+a}`. These are level-m data. The annihilator `b_ℓ` of `M_ℓ` satisfies `b_ℓ⊂((1+y_i)^{p^{ℓ−a}}−1:i≤h)`, so `b_{n+a}⊂c_m`. If b is the number of generators of `m_A`, set `r′_m=b r_m; m_A^{r′_m}⊂m_A^{(r_m)}`, so every `D_{m,n}` is a quotient of the finite ring `A/m_A^{r′_m}`. The augmentation to `R/(c_m+m_R^{(r_m)})` is an isomorphism after J, and the corresponding module augmentation is equivariant.

N is the isotropy exponent of KW II §7.4 and a is fixed with `p^a > N` (`a ≥ 2` at `p = 2`); `M_ℓ` is finite free over `O[[y]]/𝔟_ℓ` of rank s with `𝔟_ℓ ⊂ ((1+y_i)^{p^{ℓ−a}} − 1)_{i≤h}` for ℓ `> a` (Corollary 7.5).

Use `Δ_Q=Δ′_Q/Δ′_Q[N]` and the fixed shift a, so that reduction of `M_{n+a}` modulo `c_m` is free of rank s. For DeformationAndDerivedPatchingAlgebra §5.7, reindex the whole system by `R̃_n=R_{n+a}`, `M̃_n=M_{n+a}`. Then `ann_{S∞} M̃_n⊆((1+y_i)^{p^n}−1:i≤h)`. Retain the exact augmentation kernels `ker(R̃_n→R)=JR̃_n` and `ker(M̃_n→M^□)=JM̃_n`, with the same `S₀=𝒪[[y_{h+1},…,y_{h+j}]]` action and framing at every n (§2.12 and GlobalGaloisDeformations §6.4). Freeness over the scalar quotient is §2.12. The unshifted level-n bound with `p^n` is not available for the isotropy quotient. A maximal-ideal element acts nilpotently on the s-dimensional residual augmentation of `M_n`. The nilpotence estimate in Kisin (3.3.1) gives its `r_m-th` power zero on `L_{m,n}`; thus the `D_{m,n}-action` is defined. Surjectivity of the global presentation gives `A↠D_{m,n}`. The pigeonhole bound on b maximal-ideal generators gives `m_A^{b r_m}⊂m_A^{(r_m)}`, yielding a finite ambient truncation. Quotient the known augmentation kernels and retain all scalar actions.

**Checks.**

- If the isotropy groups have order prime to p (Gee's case `p ≥ 5` unramified), `Δ_v = Δ′_v` and `𝔟_n ⊂ ((1+y_i)^{p^n} − 1)` without a shift, which is Kisin's unshifted `D_{m,n} = R_n/(c_mR_n + m^{(r_m)})`; the shift by a is needed only when the isotropy groups have p-torsion.
- For `b = 2` generators and `r_m = 3, m_A^6 ⊂ m_A^{(3)}: a` monomial of degree 6 in two generators has an exponent at least 3.
- With `h=1`, `p=2`, `a=2`, the unshifted level 3 may have annihilator `((1+y₁)²−1)`, whose reduction `(y₁²)` is not contained in the desired `(y₁⁸)`. Shifting to level 5 supplies the exponent 8 required for cutoff level 3.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) Proposition 9.2 proof, pp. 81–83; Proposition 9.3 proof, pp. 84–86.)

*Needs:* §3.1; §2.12; GlobalGaloisDeformations §6.4; DeformationAndDerivedPatchingAlgebra §5.6.

### 3.3 Finite stabilization with all comparison maps

At each fixed m there are finitely many isomorphism classes of the level-m arithmetic data, including every coefficient, presentation, augmentation and module-action map. There is a diagonal subsequence `n_i` and compatible identifications between the stabilized level-m data and the reductions of level-(m+1) data. The ring transition is the quotient by `c_m+m^{(r_m)}` and the module transition is quotient by `c_m`. Every coefficient, deformation and Hecke comparison square commutes. At `p=2` stabilize additionally the determinant map, action chunks, embeddings and the small-kernel determinant-one comparison.

Each level-m datum is a finite set of finite rings, modules and maps of bounded cardinality (a quotient of `A/m_A^{r′_m}` and a free `S∞/c_m-module` of rank s with chosen basis), so there are finitely many isomorphism classes.

`A/m_A^{r′_m}` and `S∞/c_m` are finite sets, so there are finitely many ring quotients, free-module action tables and structure maps of the required cardinalities. The same argument applies to the truncated dyadic action data. At successive m choose infinite subsequences and identifications of the complete structured data, not just their isomorphism classes after forgetting maps. Diagonalize and choose compatible reductions. Apply the cofinal open-quotient patching of DeformationAndDerivedPatchingAlgebra Layer 5 with scalar action through the deformation ring. The ideals contain powers of the full maximal ideal; no passage using only `π-power` truncations is made.

**Checks.**

- Stabilising isomorphism classes after forgetting the Hecke or augmentation maps would not give compatible transition maps on those structures in the limit.
- At `p = 2` the determinant map, the action chunk and the comparison `D″_m ↠ D_m` are stabilised together with the pair `(D_m, L_m)`.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) Proposition 9.3 proof, pp. 86–87.)

*Needs:* §3.2; DeformationAndDerivedPatchingAlgebra §§5.6–5.7; DeformationAndDerivedPatchingAlgebra §5.2; DeformationAndDerivedPatchingAlgebra §5.3.

### 3.4 The patched ring and module in the domain case

Under the domain hypotheses of §3.1 there are surjections of B-algebras `B⟦x_1, …, x_{h+j−d}⟧ ↠ R_∞ ↠ R̄^{□,ψ}_S`, with `R_∞` an `𝒪⟦y_1, …, y_{h+j}⟧-algebra` and `R_∞/(y_1, …, y_h) ≅ R̄^{□,ψ}_S`. There is an `R_∞-module M_∞`, finite free over `𝒪⟦y_1, …, y_{h+j}⟧`, with `M_∞/(y_1, …, y_h) ≅ M^□` (§1.12) as modules over the specialised deformation ring, with `M^□` faithful over `𝕋^□_𝔪`, and with `R_∞ → End(M_∞)` compatible with `𝒪⟦y⟧`. Moreover `R_∞/(y_1, …, y_{h+j}) ≅ R̄^ψ_S`.

Use the fixed presentations, positive constant rank s, scalar-compatible module actions and the full structured stabilization. The limit construction is DeformationAndDerivedPatchingAlgebra §5.6 (Kisin Proposition (3.3.1)); this theorem applies it to the arithmetic data and carries the augmentation, framing and Hecke maps through the limit.

Apply DeformationAndDerivedPatchingAlgebra §5.6 to the arithmetic data of §3.2, stabilised by §3.3: `R∞ =` lim `D_m` and `M∞ =` lim `L_m` along the transition maps, with `A ↠ R∞` from the A-presentations. Pass the augmentation identities and scalar action diagrams to the limit: `R∞/J≅R̄_S^{□,ψ}, M∞/J≅M^□`. Killing the framing variables recovers the unframed ring and module. Freeness over `S∞` follows from the compatible rank-s trivializations.

**Checks.**

- With `h = 0, R_∞ = R̄^{□,ψ}_S` and `M_∞ = M^□`.
- `M_∞/(y_1, …, y_{h+j}) ≅ S_{k,ψ}(U, 𝒪)_𝔪`.
- Integral and inverted-π assertions are kept separate: `M_∞` is free over `𝒪⟦y⟧` integrally.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) Proposition 9.2 (I), p. 81; [Gee, MLT](<https://arxiv.org/pdf/2202.05818v2>) §5.6, p. 40.)

*Needs:* §3.1; §1.12; DeformationAndDerivedPatchingAlgebra §§5.6–5.7; §1.14; §1.13; §3.2; §3.3; DeformationAndDerivedPatchingAlgebra §5.6.

### 3.4a Simultaneous module patching over the avoidance ambient rings

**Ambient avoidance patching.** For the two problems of §4.1 put `B=R^loc`, `B′=R^{loc,′}` and fix their equation-quotient identification `B/λ≅B′/λ`. Let `A=B[[x₁,…,x_g]]` and `A′=B′[[x₁,…,x_g]]` have the common dimension `N`, and let `S∞=𝒪[[z₁,…,z_{N−1}]]` be the regular scalar ring including the framing variables. B and B′ are complete Noetherian local rings with finite residue field; no domain hypothesis is imposed. Assume the finite-level Taylor–Wiles systems of Layer 2 for both problems, fixed surjections `A↠R_n^□`, `A′↠R_n′^□`, scalar-compatible module actions, and free scalar-quotient modules of the same positive rank s. Their annihilator bounds use the isotropy shift of §3.2. Supply augmentations to the fixed minimal modules and rings with the exact module augmentation kernels of §2.12, and their equivariant comparisons modulo λ with identical primes, framings and coefficient lattices.

Construct simultaneously continuous scalar maps `S∞→A`, `S∞→A′`, finite ambient modules `M∞`, `M∞′` free of rank s over S∞, and an equivariant identification `M∞/λ≅M∞′/λ` over `A/λ≅A′/λ`. The scalar maps agree modulo λ. For the ideal `I∞` generated by the Taylor–Wiles and framing variables, retain surjections `A/I∞A↠R_∅`, `A′/I∞A′↠R′_∅` and augmentation isomorphisms `M∞/I∞M∞≅M_∅`, `M∞′/I∞M∞′≅M′_∅`, with their Hecke actions. Here the rings `R_∅,R′_∅` are the unframed global equation-quotient problems of §4.1. No isomorphism between an ambient scalar quotient and the global ring is needed for the support argument.

Lift the finite-level scalar maps through the fixed presentations of A and A′ and retain their common reduction. At each cofinal maximal-ideal cutoff include these lifts, the ambient action matrices, module bases, augmentations and both mod-λ comparisons in the finite structured data. Finite jets of the fixed ambient rings and free modules give finite choices. The finite stabilization and complete-module inverse-limit results of DeformationAndDerivedPatchingAlgebra §§5.2–5.4 give compatible diagrams, scalar maps and free S∞-modules. The ambient actions and scalar factorization are retained throughout; an S∞-basis generates M∞ over A, and similarly on the primed side, so both ambient modules are finite. The compatible module augmentations give the stated specialization isomorphisms. This is the arithmetic module-patching variant, distinct from applying the domain criterion of §§5.6–5.7 of that supplier to B.

**Checks.**

- With `T_r=∅`, identical finite-level choices give the identity comparison between A and A′ and between the two modules.
- At a unipotent avoidance place B can have two components. The construction still gives an A-module, without replacing A by the quotient acting faithfully on that module.
- Changing a finite-level scalar lift or forgetting an augmentation changes the structured datum; its underlying free module alone does not determine the specialization action.
- In Gee’s Fontaine–Laffaille setting `N=4|T|+r`, so both ambient rings and the regular scalar ring have exactly the dimension needed for the depth argument.

Source: [Gee, MLT](https://arxiv.org/pdf/2202.05818v2), §5.6, pp.39–41.

*Needs:* §§2.8–2.12, 3.2–3.3 (the finite cutoff and stabilization arguments); §4.1 (the local pair); DeformationAndDerivedPatchingAlgebra §§1.1–1.5, 5.2–5.4; GlobalGaloisDeformations §§3.3–3.8; LocalGaloisDeformationRings §§2.15, 3.10.

### 3.5 Support of the patched module

For the ring-module limit of §3.4, `dim R_∞ ≤ 1 + h + j` and `depth_{R_∞}(M_∞) ≥ 1 + h + j`, so every minimal prime of `Supp_{R_∞}(M_∞)` is a minimal prime of `R_∞` of maximal dimension. `Supp M_∞` is a union of irreducible components of `Spec R_∞`. Under §3.1’s domain hypothesis (KW II: semistable conditions at the finite places of S not above p), B⟦x⟧ `→ R_∞ → End(M_∞)` is injective, `R_∞ ≅ B⟦x_1, …, x_{h+j−d}⟧`, and `Supp M_∞ = Spec R_∞`.

`R∞` is complete Noetherian local; `M∞≠0` is finite over `R∞` and finite free of positive rank over the regular local `S∞`. The `S∞` scalar action factors through `R∞`. The image of `R∞` in `End_{S∞}(M∞)` is finite over `S∞`.

Use the dimension upper bound `dim R∞≤1+h+j` of GlobalGaloisDeformations Layer R04.6. For the stronger isomorphism assume B is an O-flat domain of dimension d+1, so `A=B[[x]]` is a domain of dimension 1+h+j.

Use DeformationAndDerivedPatchingAlgebra §5.5 (regular-base depth and dimension), the DeformationAndDerivedPatchingAlgebra §3.3 finite-map depth comparison for the action image and the DeformationAndDerivedPatchingAlgebra Layer 6 maximal-CM component-support theorem. No full-support claim is inferred from maximal depth alone when A is reducible.

Pass to the finite action image to compare depth with `S∞`; this yields `depth_{R∞}M∞≥1+h+j`. The dimension inequality makes `M∞` maximal Cohen–Macaulay, so its support is a union of top-dimensional components. In the domain case the action image has dimension 1+h+j because it is finite over, and contains faithfully, `S∞`. A nonzero kernel in A would lower the dimension. Thus `A→R∞→End(M∞)` is injective and `A≅R∞` with faithful module. In the reducible case retain only the union-of-components conclusion until the separate component-matching or Ihara-avoidance target proves every component occurs.

**Checks.**

- For the ambient construction of §3.4a, Gee’s equality is `dim A=dim A′=dim S∞=4|T|+r`; the same depth argument runs over A and A′ in §4.4.
- A reducible ambient B belongs to §3.4a; maximal depth there gives a union of ambient components, with full support proved in §4.4.
- Maximal depth alone does not give full support: DeformationAndDerivedPatchingAlgebra Layer 6's example k⟦x, y⟧/(xy) with `M = A/(x)`.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) proof of Proposition 9.2 (II), p. 83; [Gee, MLT](<https://arxiv.org/pdf/2202.05818v2>) §5.6, pp. 40–41.)

*Needs:* §3.4; GlobalGaloisDeformations §6.5; DeformationAndDerivedPatchingAlgebra §§6.1–6.5; DeformationAndDerivedPatchingAlgebra §3.3; DeformationAndDerivedPatchingAlgebra §6.1; DeformationAndDerivedPatchingAlgebra §§3.1–3.3, 6.1; DeformationAndDerivedPatchingAlgebra §§5.5–5.7.

### 3.6 Finiteness of the minimal deformation ring

In the situation of §3.5 with B a domain, `R̄^{□,ψ}_S` is finite over `𝒪⟦y_{h+1}, …, y_{h+j}⟧` and `R̄^ψ_S` is finite over `𝒪`.

This is finiteness at the minimal level of a modular `ρ̄`, as a consequence of patching. The global finiteness used for arbitrary `ρ̄` (KW II Theorem 10.1, by base change) belongs to the downstream roadmap PotentialModularityAndCompatibleSystems and is not used here.

`R_∞ ≅` B⟦x⟧ acts faithfully on `M_∞`, which is finite over `𝒪⟦y⟧`, so `R_∞` is finite over `𝒪⟦y⟧` (DeformationAndDerivedPatchingAlgebra §§3.3, 4.1). Killing `y_1, …, y_h` gives `R̄^{□,ψ}_S` finite over `𝒪⟦y_{h+1}, …, y_{h+j}⟧`; killing the framing variables gives `R̄^ψ_S` finite over `𝒪`.

**Checks.**

- `R̄^{□,ψ}_S` itself is never finite over `𝒪` (it has `j = 4|S| − 1` framing variables).
- With finiteness and `dim ≥ 1` (GlobalGaloisDeformations §§3.3–3.8), `R̄^ψ_S` has characteristic-zero points.
- The statement is for the minimal-level ring of a modular `ρ̄` only.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) Proposition 9.2 (II), p. 81.)

*Needs:* §3.5; DeformationAndDerivedPatchingAlgebra §§3.3, 4.1.

### 3.7 R = T after inverting p

If B is a domain, the surjection `π^□ : R̄^{□,ψ}_S → 𝕋^□_𝔪` of Layer 1 has p-power torsion kernel. Equivalently, `R̄^{□,ψ}_S[1/p] ≅ 𝕋^□_𝔪[1/p]`, and likewise `R̄^ψ_S[1/p] ≅ 𝕋_ψ(U)_𝔪[1/p]`.

B is O-flat, a domain and has regular generic fibre; `R∞≅B[[x]]` is Noetherian and its generic fibre is regular. `M∞` is nonzero, finite over `R∞`, free of positive rank over `S∞=O[[y_1,…,y_{h+j}]]`, with the `S∞` action factoring through `R∞`.

For the characteristic-zero criterion require `GenericFormallySmooth E B π` of DeformationAndDerivedPatchingAlgebra §4.4: every generic local ring is formally smooth over E for its maximal-ideal topology. The local-condition geometry supplies this pointwise lifting condition, and `genericSeriesRegular` gives regularity after adjoining the patching variables.

Use the finite action image, localize at each prime and apply the finite-map depth comparison of DeformationAndDerivedPatchingAlgebra Layer 3 and Auslander–Buchsbaum. The dimension equality and regular scalar parameters are part of the patching numerology; regularity of the ring alone does not make every finite module projective.

`R∞≅B[[x]]` by the domain dimension argument. LocalGaloisDeformationRings gives regularity of `R∞[1/p]. M∞[1/p]` is finite projective and faithful over `R∞[1/p]`: this is the conclusion of DeformationAndDerivedPatchingAlgebra §5.7 for the arithmetic data, whose proof uses the DeformationAndDerivedPatchingAlgebra §3.3 finite-map depth comparison and Auslander–Buchsbaum at each point; its local rank is positive by §3.5. The augmentation `R∞ → R̄_S^{□,ψ}` is the quotient by J, and base change preserves a finite projective module of positive rank, hence faithfulness after inverting p. Its action factors through the framed Hecke image, so the kernel of `R̄_S^{□,ψ} → 𝕋^□` is p-power torsion (DeformationAndDerivedPatchingAlgebra §6.5); finite generation gives a single power, and unframing gives the unframed comparison.

**Checks.**

- Since T is O-flat and reduced, the comparison identifies the maximal O-flat quotient of `R̄_S^ψ` with T (DeformationAndDerivedPatchingAlgebra §6.5, “Reduced and torsion-free ring identification”).
- The integral isomorphism needs more: see §4.2 (Layer 4).
- If B is not a domain, one gets only a component-by-component statement (Layer 4).

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) Proposition 9.2 (III) and its proof, pp. 81 and 83.)

*Needs:* §3.5; §1.10; DeformationAndDerivedPatchingAlgebra §§6.4–6.5; DeformationAndDerivedPatchingAlgebra §6.3; DeformationAndDerivedPatchingAlgebra §§3.1–3.3; DeformationAndDerivedPatchingAlgebra §3.3; DeformationAndDerivedPatchingAlgebra §3.2; DeformationAndDerivedPatchingAlgebra §5.7; DeformationAndDerivedPatchingAlgebra §6.5.

### Examples

For `s = 1, p = 3, m = 2` and `h + j = 1` the patching rank is `r_m = s·m·p^{m(h+j)} =` 2·9 `= 18` (§3.1). When the local ring `R^loc[1/p]` is irreducible, support of the patched module on one component is support on all of `Spec R∞` (§3.5); with two components it is not.

### Dependencies

Layers 1, 2 of this roadmap; DeformationAndDerivedPatchingAlgebra (Layer 3; Layer 4; Layer 5; Layer 6); GlobalGaloisDeformations (Layer R04.6).

## Layer 4: Support, avoidance and integral R = T

Compare two deformation problems that agree modulo `λ` (Taylor's Ihara avoidance) to move full support across the special fibre (§4.1, §4.3, §4.4), deduce modularity of every point of full-support components (§4.5), and state when the generic-fibre statement strengthens to an integral `R ≅ 𝕋` (§4.2). A patched Cohen–Macaulay module supported on one component does not establish modularity on another.

### 4.1 Two deformation problems that agree modulo λ

Assume `p>2` in §§4.1 and 4.3–4.5. From the specified residual/global problem, construct the two arithmetic avoidance problems with the same primes `T_r` away from p, trivial residual local representations and `q_v≡1 mod p`. At `v∈T_r` impose respectively inertia characteristic polynomials (X−1)² and `(X−ζ)(X−ζ⁻¹)`, where `ζ` is a nontrivial p-th root of unity, so `ζ≠ζ⁻¹`. Use the two characteristic-polynomial equation quotients of the avoidance pair (LocalGaloisDeformationRings §2.15) and the corresponding quaternionic coefficient characters and levels (HilbertModularVarietiesAndShimuraCurves §§R18.3.1–R18.3.32), with the same framings and global determinant. Record the finite-level comparison data to be stabilized. The special-fibre isomorphisms and compatible patched comparisons are proved in §4.3, separately from constructing the pair.

At the avoidance places use exactly the equation quotients `R₁` and `R_ζ` imposing the inertia characteristic polynomials, with the same compatible unramified determinant, as in LocalGaloisDeformationRings §2.15 and Gee §§3.35–3.38. The p-power character extends to the local Galois group because its order divides `q_v−1`; in rank two the determinant-one pair is `ζ,ζ⁻¹` and `p>2`. These equation quotients satisfy `R₁/λ≅R_ζ/λ`. A reduced flat closure is a separate quotient and is not substituted into this identity.

For §§4.3–4.5 require that the remaining local factors and their completed tensor products have the following geometry: B and B′ are equidimensional of dimension `1+3|T|+[F:ℚ]`, B′ has a unique minimal prime, and every generic point of `Spec B/λ` has exactly one generic generalization in `Spec B`, with every component of B meeting the special fibre in a component. This is supplied by the avoidance theorem and geometric irreducibility of the other factors; in §5.8 those factors are formally smooth Fontaine–Laffaille rings (LocalGaloisDeformationRings §3.10). The same properties hold after adjoining the common formal variables. Construct the finite-level arithmetic systems with the matching dimension balance of §3.4a. These hypotheses concern the fixed ambient equation rings, before any module-action quotient.

This is Taylor's Ihara avoidance, which replaces Ihara's lemma in passing to nonminimal levels.

Use the avoidance rings of LocalGaloisDeformationRings Layer 2 with their specified residual identifications and the compatible global local-condition quotients. Choose corresponding coefficient lattices/levels and the same auxiliary primes and framings for the two problems. Include their comparison maps in the finite structured data. The special-fibre comparison theorem verifies that these maps induce the required equivariant isomorphisms; local generic component geometry is imported from LocalGaloisDeformationRings §2.15.

Provide the following operations and compatibility statements.

- `avoidancePair`: For `p>2`, the problems `𝒮_Q` and `𝒮′_Q` with their local rings and levels.
- `avoidancePair_mod_lambda`: For `p>2`, `R^loc/λ = R^{loc,′}/λ` and `S/λ = S′/λ`.
- `avoidancePair_irreducible`: For `p>2`, `(R^{loc,′})^red` is irreducible.

**Checks.**

- `avoidancePair_Tr_empty: T_r = ∅` gives equal problems.
- `avoidancePair_mod_lambda`: The local conditions agree modulo `λ`.
- `avoidancePair_types_differ`: The generic fibres carry different inertial types.
- `T_r = ∅`: the two problems coincide.
- Each ring's generic fibre sees a different inertial type (unipotent versus `(ζ, ζ^{−1})`), although the special fibres coincide.
- Without #k(v) `≡ 1 mod p` there is no nontrivial `ζ-type` at v.
- At `p=2`, `ζ=ζ⁻¹=−1`; this scalar type is a quadratic twist of the scalar 1 type and retains its unramified and Steinberg components, outside the distinct-character irreducibility used here.

([Gee, MLT](<https://arxiv.org/pdf/2202.05818v2>) §5.6, pp. 33–35.)

*Needs:* LocalGaloisDeformationRings §§2.15, 3.10; GlobalGaloisDeformations §§3.3–3.8; HilbertModularVarietiesAndShimuraCurves §§R18.3.1–R18.3.32.

### 4.2 When the R = T statement is integral

Suppose `B = R̄^{□,loc,ψ}_S` is formally smooth over `𝒪`, as when every local condition is formally smooth (Fontaine–Laffaille, ordinary with `ρ̄_v` ramified, odd archimedean for `p ≠ 2`). Then `R_∞ ≅` B⟦x⟧ is a power series ring over `𝒪, M_∞` is free over `R_∞, R̄^ψ_S ≅ 𝕋_ψ(U)_𝔪` integrally, `S_{k,ψ}(U, 𝒪)_𝔪` is free over `𝕋_ψ(U)_𝔪`, and `R̄^ψ_S` is a complete intersection. More generally, in the KW II Proposition 4.5/Lemma 4.6 presentation with its numerical relation bound and dimension comparison, if each `R̄^{□,ψ}_v` is Cohen–Macaulay (resp. Gorenstein, resp. a complete intersection), so is `R̄^ψ_S` provided it is finite over `𝒪`. The presentation bound, not finiteness alone, makes the displayed relations and framing variables part of a system of parameters.

For the formally smooth case apply DeformationAndDerivedPatchingAlgebra [§5.6, `patching_surjection_iso`](../DeformationAndDerivedPatchingAlgebra/README.md#patching-surjection-iso), using §5.5’s depth comparison. It supplies the isomorphism, module freeness and complete-intersection presentation together.

The Cohen–Macaulay/Gorenstein/complete-intersection clause is in the KW II global deformation presentation with its generator–relation dimension bound, not an arbitrary finite quotient of B⟦x⟧.

Here is the arithmetic input to that consumer theorem. Put `r=h+j`, identify the formally smooth presentation source `A=B[[x₁,…,x_{h+j−d}]]` with `𝒪[[x₁,…,x_r]]`, and use `S∞=𝒪[[y₁,…,y_r]]`. Its surjection is the unframed map `R̄^ψ_S↠𝕋` of §1.10 and its module is the nonzero finite `𝒪`-free M of §1.1, faithful over 𝕋. For each `n≥0` choose independently a Taylor–Wiles level large enough that §3.2’s shifted annihilator is contained in `J_n=((1+y_i)^(p^(n+1))−1)_(i≤r)`. Quotient its framed Hecke module by `J_n`; its scalar basis gives `N_n≃(S∞/J_n)^s`. Lift the scalar variables through the fixed presentation `A↠R_ℓ^□` to obtain `ι_n:S∞→A`. Compose the presentation with full augmentation to get `ψ_n:A↠R̄^ψ_S`; then `ψ_n(ι_n(y_i))=0`. Section 2.12 and removal of all framing variables give the required A-linear equivalence `N_n/(y₁,…,y_r)N_n≃M`. These are precisely the supplier’s inputs, with no transition maps between the original levels. Its conclusion gives integral `R≅𝕋`, M free and faithful over both, and `𝕋≃A/(f₁,…,f_r)` for an A-regular sequence in the maximal ideal. The general domain and avoidance constructions retain their separate support and generic-fibre conclusions.

For the additional CM/Gorenstein/CI clause, use the fixed-determinant presentation of GlobalGaloisDeformations §§3.3–3.8 and the explicit KW II Proposition 4.5/Lemma 4.6 bound. Let g be the number of added variables, r the number of displayed relations and j the framing dimension. Finiteness over O gives `dim R̄^□=j+1`. The dimension lower bound and the relation bound force `dim(B[[x]])=j+1+r`. The relations together with j framing parameters and `π` form a system of parameters. When B is CM they are a regular sequence; the regular-quotient and type and base-change facts of DeformationAndDerivedPatchingAlgebra Layer 3 transfer CM, Gorenstein and CI as applicable. Finiteness without that equality is insufficient. Complete intersection: a regular ring modulo a regular sequence.

**Checks.**

- Wiles and Taylor–Wiles minimal case: `R ≅ 𝕋` is a complete intersection.
- With a non-smooth local factor (for example Savitt's `𝒪⟦T₁, …, T₅⟧/(T₁T₂ − p)`), only the generic-fibre statement §3.7 is obtained without further input.
- Faithfulness of `S(U)_𝔪` over `R̄` is exactly equivalent to integral `R = T` (DeformationAndDerivedPatchingAlgebra §§6.4–6.5); freeness is stronger.
- For `r=0`, the supplier’s input `R=T=𝒪`, `N_n=M=𝒪^s` gives the empty regular sequence and the identity isomorphism.
- The surjection `𝒪[[x]]→𝒪` acting on `M=𝒪` has faithful target action but nonzero source kernel. It cannot satisfy the independent finite-level hypotheses; surjectivity and target faithfulness alone do not give integral `R=T`.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) §4.2, remarks after Lemma 4.6, p. 45.)

*Needs:* §§1.1, 1.10, 2.12, 3.2, 3.5; DeformationAndDerivedPatchingAlgebra §§5.5–5.6, `patching_surjection_iso`; DeformationAndDerivedPatchingAlgebra §§3.1–3.3; DeformationAndDerivedPatchingAlgebra §§6.4–6.5; LocalGaloisDeformationRings Layer 8; GlobalGaloisDeformations §3.7; GlobalGaloisDeformations §3.8; DeformationAndDerivedPatchingAlgebra §§3.4–3.5; DeformationAndDerivedPatchingAlgebra §3.3; DeformationAndDerivedPatchingAlgebra §3.9; DeformationAndDerivedPatchingAlgebra §3.9.

### 4.3 Special-fibre comparison for the avoidance pair

For the avoidance problems of §4.1 with `p>2` and `ζ≡1 mod λ`, their local deformation conditions and coefficient characters reduce to the same data. Using the same auxiliary primes, framings, coefficient lattices and branch labels gives identifications of the two global rings and Hecke modules modulo `λ`, equivariant for the common scalar action. The fixed ambient rings satisfy `A/λ≅A′/λ`. Stabilize these comparison maps together with the two module-patching systems of §3.4a, so `M∞/λ≅M∞′/λ` equivariantly over that common ambient ring and its scalar action.

At `v ∈ T_r, ρ̄|G_{F_v}` is trivial and #k(v) `≡ 1 mod p; ζ` is a fixed primitive p-th root of unity in L, so `ζ ≡ 1 mod λ`. The same auxiliary primes Q, framings and coefficient choices are used for both problems.

The chosen root `ζ` reduces to one; the specified local quotients therefore have the same special fibre by the local avoidance theorem. The chosen coefficient characters and their lattices also reduce compatibly. Apply the global quotient universal property and the equivariant finite-level coefficient comparison with identical primes and labels. Add these maps and their commuting squares to the finite structured isomorphism classes before passing to a common subsequence. The compatible inverse limit and finite-module quotient exactness identify the two patched modules modulo λ over the fixed common ambient special fibre, with their scalar and augmentation actions. Patching unrelated subsequences would not provide these comparisons.

**Checks.**

- `T_r = ∅`: the two problems coincide and the comparison is the identity.
- If the two module-patching systems were stabilized along unrelated subsequences, their equivariant mod-λ comparison would not follow.
- Equality modulo λ is used for the equation quotients. It is not inferred for their reduced flat closures.

([Gee, MLT](<https://arxiv.org/pdf/2202.05818v2>) §5.6, pp. 33–35 and 40–41.)

*Needs:* §4.1; §3.4a; LocalGaloisDeformationRings §2.15.

### 4.4 Transfer of full support across the special fibre

In the setting of §§4.1 and 3.4a, with `p>2`, `Supp_{A′}(M∞′)=Spec A′`. Hence `Supp_{A/λ}(M∞/λ)=Spec A/λ`, and the specified ambient component geometry gives `Supp_A(M∞)=Spec A`. Specializing along `I∞` gives `Supp_{R_∅}(M_∅)=Spec R_∅`.

Both ambient rings have dimension N. The modules are free of positive rank over the regular scalar ring S∞ of dimension N, with scalar actions factoring through A and A′, so they have depth N over their respective ambient rings. The finite action-image depth comparison gives this bound; the maximal-depth support theorem of DeformationAndDerivedPatchingAlgebra §6.1 makes each support a union of ambient components. The unique minimal prime of A′ gives full primed support. Finite-module support and Nakayama give full support after reduction modulo λ, and §4.3 transports it to A/λ.

For each component of A take a generic point of a special-fibre component below it. Full special-fibre support puts that point in the support of M∞. Since the support is a union of components and this special generic point has a unique generic generalization, that ambient component occurs. Thus every component occurs. Near faithfulness of a finite module descends to `A/I∞A`; its action on `M_∅` factors through the surjection onto `R_∅`. Support under this closed immersion gives near faithfulness over `R_∅` as well (DeformationAndDerivedPatchingAlgebra §§6.1–6.2). No component assertion for an arbitrary action-image quotient is used.

**Checks.**

- With `T_r=∅` and an irreducible ambient ring, the unique-component maximal-depth argument applies directly.
- The unprimed B can have several components; B′ has one, and the comparison uses their fixed common equation special fibre.
- For a complete DVR `𝒪`, let `C=𝒪[[x,y]]/(xy)`, `R=C/(x(x−π))` and `M=R/(x)≅𝒪[[y]]`. The ring R is reduced and flat, with minimal primes `(x)` and `(y,x−π)` of dimensions two and one; `depth_R M=2`. Its special fibre has just the minimal prime `(x)` and M/π has full support, although M misses the second component of R. Indeed `R↪𝒪[[y]]×𝒪` by `x↦(0,π),y↦(y,0)`. Thus component specialization for C cannot be transferred to its quotient R.
- The conclusion is full support, or near faithfulness. It does not assert integral `R=T` without reducedness and the separate quotient-identification hypotheses.

([Gee, MLT](https://arxiv.org/pdf/2202.05818v2) §5.6, pp.39–41.)

*Needs:* §4.1; §3.4a; §4.3; DeformationAndDerivedPatchingAlgebra §§3.3, 6.1–6.2, 6.7; LocalGaloisDeformationRings §2.15.

### 4.5 Modularity from full support

For `p>2` and the avoidance problems of §4.1, if `Supp_{R^univ_∅}(S_∅) = Spec R^univ_∅`, then `ker(R^univ_∅ → 𝕋_∅)` is nilpotent, `(R^univ_∅)^red ≅ 𝕋_∅`, and every lift `ρ` of type `𝒮_∅` over `𝒪` is modular: it corresponds to a homomorphism `𝕋_∅ → 𝒪`, hence to a cuspidal `π` of weight `(k, η)` with `ρ ≅ ρ_{π,ı}`.

`𝕋_∅` acts faithfully on `S_∅` by definition; the ring-theoretic step is DeformationAndDerivedPatchingAlgebra §6.5, “Reduced and torsion-free ring identification”.

Full support means `S_∅` is nearly faithful over `R^univ_∅` (DeformationAndDerivedPatchingAlgebra §6.1), so the kernel of `R^univ_∅ → 𝕋_∅ ⊆ End(S_∅)` is nil (§6.5). An `𝒪`-point of `R^univ_∅` factors through the reduced quotient, which is `𝕋_∅`, and `𝒪`-points of `𝕋_∅` are eigenforms (HilbertModularVarietiesAndShimuraCurves §§R18.3.1–R18.3.32, Jacquet–Langlands).

**Checks.**

- This is Gee Lemma 5.7.
- Only the reduced quotient is identified: nilpotents in `R^univ_∅` are not excluded.
- The conclusion is modularity of points of the given type, not of arbitrary lifts.

([Gee, MLT](<https://arxiv.org/pdf/2202.05818v2>) Lemma 5.7, p. 35.)

*Needs:* §4.4; DeformationAndDerivedPatchingAlgebra §§6.4–6.5; HilbertModularVarietiesAndShimuraCurves §§R18.3.1–R18.3.32; DeformationAndDerivedPatchingAlgebra §6.1.

### Examples

For `p>2`, the avoidance pair uses the unipotent ring `(X − 1)²` and the tame ring `(X − ζ)(X − ζ^{−1})` at places with #k(v) `≡ 1 mod p` and `ρ̄|G_{F_v}` trivial; the two agree modulo `λ`, and the second is irreducible, so full support transfers (§4.1, §4.4). Integral `R = T` needs the local rings formally smooth (§4.2).

### Dependencies

Layer 3 of this roadmap; DeformationAndDerivedPatchingAlgebra (Layer 3; Layer 6); GlobalGaloisDeformations (§§3.3–3.8); HilbertModularVarietiesAndShimuraCurves (§§R18.3.1–R18.3.32); LocalGaloisDeformationRings (Layer 2; Layer 8).

## Layer 5: Lifting theorems at odd primes

Combine the previous layers into the lifting theorems at odd p: Khare–Wintenberger II Theorem 9.7 after reduction to a solvable totally real extension (§5.3, §5.4), the passage from `"ρ̄` modular" over `ℚ` to the `α/β` hypotheses (§5.5), Kisin's patching on a chosen component and his potentially Barsotti–Tate theorems in the ordinary and nonordinary cases (§5.6, §5.7, §5.10, §5.11), Gee's Fontaine–Laffaille theorem (§5.8), the BCDT theorems for types and extended types with the corrected coefficient cohomology (§5.2, §5.12–§5.15), the imported Kisin crystalline theorem over `ℚ` and its nonordinary weight-`p+1` endpoint application (§5.16, §5.17), and Khare–Wintenberger I Theorem 4.1(2) (§5.18). The exact overlap with ordinary lifting is stated, not assumed (§5.9).

### 5.1 Strong residual modularity

For p>2, F totally real and `ρ:G_{F,S}→GL₂(E), StronglyResiduallyModular (ρ)` means: `ρ` is potentially Barsotti–Tate at every v|p, its determinant is cyclotomic times a finite-order character, and there exists a parallel-weight-two Hilbert eigenform f with `ρ̄_f≅ρ̄`, not special at any v|p, and potentially ordinary at v exactly when `ρ` is.

The potentially Barsotti–Tate and potentially ordinary predicates, and determinant convention, are those of Kisin (3.5.4).

Use actual Hilbert eigenform and local representation data; the predicate remembers existence of a witness, not a choice of component. Component matching requires the further character conditions of §5.6 and §5.7.

Provide the following operations and compatibility statements.

- `StronglyResiduallyModular`: The existential predicate with all the stated local and determinant conditions.
- `strongResidual_witness`: A proof supplies a weight-two residual modularity witness not special above p, with the specified ordinarity equivalence.
- `strongResidual_of_witness`: The pBT conditions, finite-order determinant factor and such an f yield the predicate.

**Checks.**

- `strongResidual_self_witness`: A weight-two Hilbert eigenform not special above p, whose representation is pBT with the required determinant, witnesses strong residual modularity of its own representation.
- `strongResidual_mismatched_ordinary_witness`: A witness ordinary at v cannot witness strong residual modularity of a nonordinary `ρ` there.
- `strongResidual_special_not_witness`: A form special at a place above p is excluded even if its residual representation matches.
- The witness must match ordinarity at every v|p, not merely somewhere above p.
- This definition alone does not choose between two ordinary components for split distinct residual characters.

([Kisin, finite flat](<https://people.math.harvard.edu/~kisin/dvifiles/bt.dvi>) (3.5.4)–Theorem (3.5.5), pp. 72–73.)

*Needs:* §1.1; LocalGaloisDeformationRings §4.14.

### 5.2 Corrected type-sensitive Hecke module

For the BCDT/CDT global deformation problem over ℚ, let `U_S,V_S` and `I′_S` be the type level, its type kernel and the chosen Hecke ideal; r is the auxiliary prime of CDT §5.3. With the integral type lattice `M_S` and `G_S=U_S/V_S`, define `L_S=Hom_{O[G_S]}(M_S,H¹(X_{V_S},O))[I′_S]` (insert r if necessary). For residual support use the modified levels `U′_{S,q}=V′_{S,q}=U_1(q^{c_q})` at `q∈T(ρ̄)`, unchanged elsewhere, and `L′_S=Hom_{O[U′_S/V′_S]}(M_ℓ,H¹(X_{V′_S},O))[I′_S]`. The coefficient local system is the dual of the type lattice. The Serre coefficient comparison uses `L_n⊗k` at the spherical level `K′=U′_S GL₂(ℤ_ℓ)`, replacing the ℓ-factor by `GL₂(ℤ_ℓ)`. For irreducible type, comparison with `U′_{S,ℓ}=U₀(ℓ)` uses the coefficient representation `Ind_{U₀(ℓ)}^{GL₂(ℤ_ℓ)} σ∨`. For an extended type enlarge `U_S` by `w_ℓ` and extend the type representation to that group, choose its invariant lattice, and form the analogous Hom-module for the finite quotient after dividing by `ℓ^{sZ}`. Its localized cohomological description is the `w_ℓ=1` direct summand of H¹, with the matching compactly supported summand.

ℓ>2; O is large enough to define every local type, lattice and pairing. The residual representation is modular and absolutely irreducible on `G_{Q(√ℓ*)}`; its local centralizer is k. Use the exact BCDT type and admission predicates of LocalGaloisDeformationRings Layer 3, with the admission data specified in the arithmetic refinements here.

The extended-type `w_ℓ` satisfies `w_ℓ²=1` on the relevant localized coefficient cohomology. Because 2 is a unit, the invariant summand is cut out by `(1+w_ℓ)/2`. The type extension and central power `ℓ^s` are part of the input.

Import the modular-curve local systems and compact-type lattice constructions from ModularCurvesPartII §§14.1–14.15 and R14.6. Form the displayed Hom action image and its Hecke-ideal submodule. Use the corrected away-ℓ auxiliary levels and the spherical ℓ-factor in the residual comparison. Construct the Hecke-equivariant coefficient-induction isomorphism between cohomology at `U′_S` with coefficient `σ∨` and at `K′` with its induced coefficient. Localized exactness transfers support along its admitting constituents. Descent of invariants along `V′⊂V` requires V′ normal in V; all coefficient actions are continuous for the ℓ-adic topology. For extended types use the extended compact group in every Hom and level comparison, and restrict duality, level-control and auxiliary-module maps to the `+` summand.

Provide the following operations and compatibility statements.

- `bcdtHeckeModule`: The type Hom-module with its Hecke action, corrected auxiliary level and residual-support comparison module.
- `bcdtHeckeModule_dual_coefficients`: The coefficient local system uses `Hom_O(M_ℓ,O)`, and the group-cohomology Serre coefficient is `L_n⊗k`.
- `bcdtExtendedHeckeModule_invariants`: For extended types the module is identified with the localized `w_ℓ=1` direct summand; its dual pairing is restricted to that same summand.

**Checks.**

- `bcdtModule_trivial_coeff`: For trivial rank-one type lattice the Hom construction gives the corresponding invariant cohomology with the specified Hecke ideal.
- `bcdtModule_involution`: For an involution on an O-module with ℓ odd, the projectors (1±w)/2 are complementary and the `+` projector gives the extended-type summand.
- `bcdtModule_level`: At a prime of `T(ρ̄)`, keeping the old `U_S` instead of `U_1(q^{c_q})` does not supply the congruence-subgroup hypotheses needed by the residual-support theorem.
- With `U′_{S,q}=V′_{S,q}=U_1(q^{c_q})` at `q∈T(ρ̄)`, the group `Γ=SL₂(ℤ)∩(U′_S GL₂(ℤ_ℓ))` satisfies CDT Theorem 6.1.1. Keeping `U₀(ℓ)` instead allows an integral determinant-one matrix congruent to `−I` modulo ℓ and to `I` at the away-ℓ level factors. Congruence reduction and CRT give such a matrix; its d-entry has order two modulo ℓ, violating the ℓ-power-order condition if ℓ divides the level integer N.
- For an extended type the `w_ℓ = 1` summand is a direct summand because `w_ℓ² = 1` on the localised H¹ and ℓ is odd.

([BCDT](<https://virtualmath1.stanford.edu/~conrad/papers/tswfinal.pdf>) Theorems 1.4.1–1.4.2 and their proofs, author pp. 12–15; §10, pp. 77–78.)

*Needs:* LocalGaloisDeformationRings §3.12; ModularCurvesPartII §§14.1–14.15; ModularCurvesPartII §§15.7–15.8, 17.8–17.10; AutomorphicGaloisRepresentations §§1.2–1.4; AlgebraicModularFormsAndSerreWeights Layer R15.2, “Hecke operators and the classical integral lattice”; LocalGaloisDeformationRings Layer 3.

### 5.3 Reduction to a solvable totally real extension

Let `ρ : G_F → GL_2(𝒪)` be continuous with F totally real, S a finite set of places of F, and `L_v/F_v` finite Galois for `v ∈ S` (real `L_v` at the infinite places). There is a finite solvable Galois totally real extension F′/F with `F′_w ≅ L_v` for every `w | v ∈ S`; it can be chosen linearly disjoint from any given finite extension, so that `ρ̄|G_{F′}` keeps a non-solvable image, and `ρ̄|G_{F′(ζ_p)}` stays absolutely irreducible when `ρ̄|G_{F(ζ_p)}` is. If `ρ|G_{F′}` is irreducible, then `ρ` is modular if and only if `ρ|G_{F′}` is modular. In particular one may assume: `[F′ : ℚ]` even, `ρ|G_{F′}` semistable with unipotent inertia at every place away from p where it ramifies, `ρ̄|G_{F′}` unramified away from p, and the prescribed splitting at p.

Existence of the field is not an automorphic statement: it is Clozel–Harris–Taylor's Lemma 4.1.2 (§1.7; Gee quotes it as Fact 4.27), and in the allowable case §1.8. For descent of modularity along soluble extensions use GL2AutomorphicRepresentationsAndTransfer §§R17.4.1–R17.4.11 and R17.6.19, with the irreducibility supplied by the residual-image hypotheses (Gee Proposition 4.25).

KW II call such extensions allowable base changes; Kisin calls them admissible extensions.

For the modularity equivalence impose that `ρ|G_{F′}` is irreducible, as in Gee Proposition 4.25 (automatic under the retained residual-image hypotheses used here). Local prescription and preservation of the residual image require separate finite splitting conditions.

Existence: Clozel–Harris–Taylor's Lemma 4.1.2 with the real places of F in the prescribed set `(E_v = ℝ)` gives a totally real soluble Galois F′/F with `F′_w ≅ L_v`, linearly disjoint from a given finite Galois extension; taking that extension to contain the field cut out by `ρ̄` and `μ_p` keeps the residual image and cyclotomic irreducibility, as in §1.8, which adds evenness and the conditions at p. Modularity descends: for a cyclic step E/F, if `ρ|G_E ≅ ρ_π` then `π` ∘ `σ ≅ π` by strong multiplicity one, so `π` is a base change from F, and `ρ ≅ ρ_{π′} ⊗ χ` for a character `χ` by Schur's lemma; induct along the solvable tower. Unipotent inertia: by Grothendieck's monodromy theorem `ρ|I_v` acts unipotently on an open subgroup of `I_v`, which a finite `L_v` cuts out.

**Checks.**

- `F = ℚ, L_3 = ℚ_3(√−3): F′ = ℚ(√6)` works, since `6/(−3) = −2` is a square in `ℚ_3; ℚ(√−3)` itself is not allowed, as F′ must be totally real.
- Modularity of `ρ|G_{F′}` descends to `ρ` only because F′/F is solvable: for a non-solvable F′/F descent is not available.
- Without linear disjointness the image hypothesis can fail over F′: if `ρ̄` is induced from a real quadratic K/F with `K ≠ F(√p*)`, then `ρ̄|G_{F(ζ_p)}` can be irreducible while `ρ̄|G_{F′}` is reducible for `F′ ⊇ K`.

([Gee, MLT](<https://arxiv.org/pdf/2202.05818v2>) Proposition 4.25 and Fact 4.27, p. 29.)

*Needs:* §1.1; §1.8; §1.7; GL2AutomorphicRepresentationsAndTransfer §§R17.4.1–R17.4.11, R17.6.19.

### 5.4 The Khare–Wintenberger lifting theorem for odd p

Let `p > 2`, F totally real and unramified at p, split at p if `ρ̄|_{D_p}` is irreducible or `k(ρ̄) = p + 1`, with `ρ̄_F = ρ̄|G_F` such that `ρ̄|G_{F(μ_p)}` is absolutely irreducible and `ρ̄_F` satisfies `(α)` and `(β)`. Let `ρ_F : G_F → GL_2(𝒪)` lift `ρ̄_F`, be ramified at finitely many places, totally odd, and at every place above p of one of the types (A) crystalline of weight k with `2 ≤ k ≤ p + 1` (when `k = p + 1`, with `k(ρ̄) = p + 1`), (B) of weight 2 and crystalline over `ℚ_p^{nr}(μ_p)`, or (C) semistable non-crystalline of weight 2 of the form `(γ_vχ_p ∗; 0 γ_v)` with `γ_v` unramified. Then `ρ_F` is modular. This formulation uses no finiteness of deformation rings from KW II §10 and no potential modularity.

F is totally real and `ρ̄ : G_F → GL_2(𝔽)` is as in KW II §8, with lifting data and determinant character `ψ` (GlobalGaloisDeformations §6.1; the local conditions are LocalGaloisDeformationRings §8.2).

The residual input is `(α)` and `(β)` of §1.2, not `'ρ̄` is modular'. KW I Theorem 4.1(2), stated with `'ρ̄` modular', is §5.18, derived from this theorem, the weight part of Serre's conjecture and the cited cases as in KW II §10.2.

Case (B) of weight two is only the part of the potentially Barsotti–Tate case that becomes semistable over `ℚ_p(μ_p)` (KW II §10.2, remark). The general potentially Barsotti–Tate case is §5.7.

After a solvable base change (§5.3; Taylor's Lemma 2.2), `ρ_F` is totally odd, uniform above p of type (A), (B) or (C), of the form `(γ_vχ_p ∗; 0 γ_v)` at the ramified places away from p, and `ρ̄` is trivial above p when `ρ̄` is unramified at p. Then `ρ_F` and `det ρ_F` prescribe lifting data and `ψ`, so `ρ_F` is an `𝒪`-point of `R̄^{□,ψ}_S`. After a further base change, SerreWeightAndLevelOptimisation §6.11 (KW II Theorem 8.4) gives a cuspidal `π′` of parallel weight fitting the same lifting data and `ψ. R̄^{□,loc,ψ}_S` is a domain (semistable conditions away from p; LocalGaloisDeformationRings §8.17), so §3.7 gives `R̄^{□,ψ}_S[1/p] ≅ 𝕋^□_𝔪[1/p]`; the point `ρ_F` factors through `𝕋` and is modular. Solvable base change descends modularity to F.

**Checks.**

- `F = ℚ, p = 3, ρ =` the 3-adic Tate module of 11a1: crystalline of weight 2 (case (A)), the mod-3 image is `GL_2(𝔽_3)`, so `ρ̄|G_{ℚ(ζ_3)}` (image `SL_2(𝔽_3)`) is absolutely irreducible, and `(α), (β)` hold with 11a1's own form; the theorem recovers its modularity.
- Weight `p + 2` is outside (A): the theorem says nothing about crystalline lifts of weight `> p + 1`.
- If `ρ̄|G_{F(μ_p)}` is reducible (for example `ρ̄` induced from `ℚ(√−3)` at `p = 3`), Taylor–Wiles primes are unavailable (GlobalGaloisDeformations §5.2) and the theorem does not apply.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) §9.2, Theorem 9.7 and its proof, pp. 89–90; [KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) §10.2, p. 92.)

*Needs:* §1.2; §5.3; §3.7; §3.5; §1.1; GlobalGaloisDeformations §6.1; GlobalGaloisDeformations §5.2; LocalGaloisDeformationRings §8.2; LocalGaloisDeformationRings §8.17; §1.3; SerreWeightAndLevelOptimisation §6.11.

### 5.5 From 'ρ̄ modular' over ℚ to the residual hypotheses (α) and (β)

Let `ρ̄ : G_ℚ → GL₂(𝔽)` be of S-type and modular, normalised by a twist so that `2 ≤ k(ρ̄) ≤ p + 1` when `p > 2`. (1) For `p > 2, ρ̄` arises from `S_{k(ρ̄)}(Γ₁(N))` for some N prime to p, and from `S₂(Γ₁(Np))`. For `p = 2, ρ̄` arises from `S₂(Γ₁(N))` with N odd when `k(ρ̄) = 2`, and from a weight-two form whose level has 2-adic valuation at most 1 in both cases `k(ρ̄) = 2`, 4. (2) Let F be a totally real field with a soluble tower over `ℚ`, unramified at p, with `ρ̄|_{G_F}` absolutely irreducible. Then `ρ̄|_{G_F}` satisfies `(α)` and `(β)` of KW II §8.2 if `p > 2`; if `p = 2` it satisfies `(β)`, and `(α)` when `k(ρ̄) = 2`.

The residual modularity hypothesis is the supplied `TauCeti.ResidualModularity.IsModular`. Use AlgebraicModularFormsAndSerreWeights Layer R15.6’s `ArisesFrom` comparison with integral models and its primitive-associate formulation, together with the weight-at-least-two reduction of Layer R15.5, to obtain the weight-`k≥2` newform witness of KW I §1. Absolute irreducibility, contained in S-type, identifies its residual representation with `ρ̄` after compatible coefficient extension. The optimized forms in (1) carry the same supplied `ArisesFrom` predicate at their actual weights and levels.

The optimal prime-to-p level `N(ρ̄)` is not needed, only some level prime to p; this is why Gross's hypothesis `N > 4` is harmless (KW II §10.2).

This is the weight part of Serre's conjecture, imported from SerreWeightAndLevelOptimisation: Edixhoven's theorem (weight `k(ρ̄)` at a level prime to p, from Gross's Theorem 13.10 and Coleman–Voloch), removal of the p-part of the level, and the passage to weight 2 at level Np (Gross's Propositions 8.13 and 8.18; Ribet). The SerreWeightAndLevelOptimisation statements for `p = 2` and `p = 3` have restrictions (ℓ `≥ 3` for the level step, ℓ `> 3` or `N > 3` for weight two); the cases they leave are arithmetic refinements proved here using SerreWeightAndLevelOptimisation §§6.6–6.11.

No potential modularity (KW II Theorem 6.1) and no finiteness of deformation rings (Theorem 10.1) enter.

Edixhoven's theorem produces a Katz form in characteristic p, while `(α)` and `(β)` ask for automorphic representations; the lift to characteristic zero in weight `≥ 2` is a step of the proof, not part of the weight theorem.

Level prime to `p: ρ̄` arises from `Γ₁(Np^a)` for some `a ≥ 0`, hence from `Γ₁(N)` in some weight (SerreWeightAndLevelOptimisation §4.2, for `p ≥ 3`; SerreWeightAndLevelOptimisation §§6.6–6.11 for `p = 2`). Weight `k(ρ̄)` at level N: Edixhoven's theorem (SerreWeightAndLevelOptimisation §3.7), with the normalisation `2 ≤ k(ρ̄) ≤ p + 1`, gives a Katz eigenform over `𝔽̄_p` of type `(N, k(ρ̄), ε)`. Lift it to characteristic zero: after enlarging N to a multiple `N ≥ 5` prime to p, the reduction map on cusp forms of weight `k(ρ̄) ≥ 2` is onto (AlgebraicModularFormsAndSerreWeights Layer R15.2, “Hecke operators and the classical integral lattice”; the cusp-sheaf H¹ has no torsion in weight `≥ 2`), and the Deligne–Serre lemma gives a characteristic-zero eigenform with the same eigenvalues modulo p, hence a newform of weight `k(ρ̄)` and level dividing N from which `ρ̄` arises (R15.5/reduction-to-weight-at-least-two-and-to-a-true-eigenform). This is where the hypothesis `N > 4` of KW II §10.2 enters. Weight 2 at level Np: SerreWeightAndLevelOptimisation §4.7 (`p > 3` or `N > 3`; enlarge N by an auxiliary prime if `N ≤ 3`). The p-component of the resulting newform has conductor exponent at most 1. Over F: take the cuspidal automorphic representations of `GL₂(𝔸_ℚ)` of these newforms and base-change them along the soluble tower (GL2AutomorphicRepresentationsAndTransfer §§R17.4.1–R17.4.11, R17.6.19); they stay cuspidal because `ρ̄|_{G_F}` is irreducible, their weights are parallel `k(ρ̄)`, resp. 2, and above p they are unramified, resp. of conductor exponent at most 1, because F is unramified at p. These are witnesses for `(α)` and `(β)`.

**Checks.**

- `ρ̄ = E[p]` for an elliptic curve `E/ℚ` of conductor prime to p, `p ≥ 5`, with E[p] irreducible: `k(ρ̄) = 2`, and the newform of E is at once the `(α)-` and the `(β)-witness` over `ℚ`.
- `k(ρ̄) = p + 1` (très ramifiée): the `(α)-witness` has weight `p + 1` and level prime to p, the `(β)-witness` has weight 2 and is Steinberg at p.
- For `p = 2` and `k(ρ̄) = 4` no `(α)` is asserted, as in KW II.
- A nonsplit unipotent residual representation and the direct sum of its characters have identical Frobenius polynomials. The supplied attachment comparison identifies only semisimplifications without the absolute irreducibility used here.
- Passing from a form of level N to its oldspace at a multiple M preserves attachment away from Mp; the primitive associate retains its own level dividing M.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) §10.2, p. 92; [KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) Proof of Theorem 6.1, solvable-image paragraph, p. 54.)

*Needs:* §1.2; §1.3; SerreWeightAndLevelOptimisation §3.7; SerreWeightAndLevelOptimisation §4.2; SerreWeightAndLevelOptimisation §4.7; SerreWeightAndLevelOptimisation §§6.6–6.11; AlgebraicModularFormsAndSerreWeights Layer R15.6, “Modularity predicates and their comparisons”; AlgebraicModularFormsAndSerreWeights Layer R15.2, “Hecke operators and the classical integral lattice”; AlgebraicModularFormsAndSerreWeights Layer R15.5, “Application to modular forms”; GL2AutomorphicRepresentationsAndTransfer §§R17.4.1–R17.4.11, R17.6.19.

### 5.6 Patching on a chosen local component

Let `B = ⊗̂_{v∈S} B_v`, where each `B_v` is a quotient of the framed local lifting ring `R^{□,ψ}_v` that is `𝒪`-flat with `B_v[1/p]` geometrically integral and formally smooth over E. Then B is `𝒪`-flat and B[1/p] is geometrically integral and formally smooth. Let `R_B = R^{□,ψ}_S ⊗̂_{R^{□,loc,ψ}_S} B`, and suppose a Hecke eigensystem `𝔪` of level U (Layer 1) whose framed module M is an `R_B-module`, with the Taylor–Wiles systems of Layer 2. Then `R_B → 𝕋^□` has p-power torsion kernel, `M ⊗ E` is finite projective and faithful over `R_B[1/p]`, and every `𝒪′-point` of `R_B` is modular. So a lift is modular as soon as, at every `v ∈ S`, it lies on the same irreducible component `B_v` of `Spec R^{□,ψ}_v[1/p]` as a modular point.

For KW II's rings `B_v` is the whole ring `R̄^{□,ψ}_v` (Layer 3). Kisin's refinement chooses `B_v` to be one irreducible component: the potentially Barsotti–Tate lifts of a fixed type, ordinary or not ordinary, whose geometry is an arithmetic refinement proved here using LocalGaloisDeformationRings Layer 4 (and at `p = 2` from LocalGaloisDeformationRings Layer 5).

Import the completed-tensor theorem for complete Noetherian O-flat local algebras with geometrically integral, formally smooth generic fibres and the stated common coefficient/residue field. Use the fixed quotient components and coefficient enlargements; integrality of individual generic fibres without geometric integrality is insufficient. The geometric formal smoothness hypotheses are used in the pointwise `GenericFormallySmooth E B π` sense of DeformationAndDerivedPatchingAlgebra §4.4. Keep the fixed `S₀` action, exact augmentation kernels and shifted annihilator bound of §3.2 for the chosen quotient system. Kisin Proposition (3.3.1) with this B: patching (§3.4, with `R^{□,loc}` replaced by B) gives B⟦x⟧ `↠ R_∞` and `M_∞` finite free over `𝒪⟦y⟧` of equal dimension; DeformationAndDerivedPatchingAlgebra §5.7 (Kisin Proposition (3.3.1) with Lemma (3.3.4), Auslander–Buchsbaum through DeformationAndDerivedPatchingAlgebra §3.3) makes `M_∞ ⊗ E` projective and faithful over B⟦x⟧[1/p], and B⟦x⟧ `≅ R_∞`. Reduce modulo (`y_1, …, y_h`) to obtain the faithfulness of `M ⊗ E` over `R_B[1/p]` (Kisin (3.4.11)); modular points are then all of `Spec R_B[1/p]`.

**Checks.**

- `B_v = R̄^{□,ψ}_v` for KW II's conditions recovers §3.7.
- If the modular point and `ρ` lie on different components (different ordinary quotient labels, or one ordinary and the other not), the lemma says nothing: this is why Kisin matches ordinarity.
- Geometric integrality matters: an integral but not geometrically integral B[1/p] can split into several components after enlarging E.

([Kisin, finite flat](<https://people.math.harvard.edu/~kisin/dvifiles/bt.dvi>) Proposition (3.3.1), p. 62; (3.4.11), p. 68; Lemma (3.4.12), pp. 69–70.)

*Needs:* §3.4; §3.5; §3.7; §2.8; LocalGaloisDeformationRings Layer 4; DeformationAndDerivedPatchingAlgebra §§3.1–3.3; LocalGaloisDeformationRings §4.14; DeformationAndDerivedPatchingAlgebra §4.6; DeformationAndDerivedPatchingAlgebra §5.7.

### 5.7 Kisin's potentially Barsotti–Tate lifting theorem

Let p>2, F totally real and `ρ:G_{F,S}→GL₂(E)` continuous with absolutely irreducible residual representation. If `ρ` is strongly residually modular, every v|p where `ρ` is not potentially ordinary has residue field `𝔽_p`, and `ρ̄|G_{F(ζ_p)}` is absolutely irreducible, then `ρ` is modular, subject when `p=5` and proj `ρ̄` has image `PGL₂(𝔽₅)` to the extra condition that its kernel does not fix `F(ζ₅)`.

The residue-field condition comes from the connectedness result Kisin (2.5.6); Kisin notes that Gee later removed it, but the statement here keeps it, as Kisin's theorem does.

Base change (§5.3; Kisin (3.5.2), (3.5.3)): arrange `[F : ℚ]` even, f and `ρ` with matching types at 𝔭 `| p`, unipotent ramification away from p on both sides with the same characters, and f unramified outside `Σ`. After the base changes in Kisin (3.5.5), arrange that an ordinary residual local representation is indecomposable or trivial (condition (iii), DVI p. 73). Then the ordinary component is unique in that setup. In general, matching ordinarity alone is insufficient: for split distinct unramified residual characters also match the ordinary quotient character (equivalently, with fixed determinant, the cyclotomic line). Choose each `B_v` by this refined condition and verify both `ρ` and `ρ_f` lie on it. §5.6 gives modularity of `ρ` over the base-changed field; descend.

**Checks.**

- An elliptic curve over `ℚ` that acquires good reduction over a wildly ramified extension of `ℚ_3`: its 3-adic Tate module is potentially Barsotti–Tate at 3, the case Kisin's abstract singles out.
- Matching ordinary components requires the residual-character refinement or the source's indecomposable/trivial condition.
- Potentially semistable non-crystalline lifts of weight two with an ordinary Steinberg component at p are outside the potentially Barsotti–Tate hypothesis; KW II's case (C) covers them (§5.4).

([Kisin, finite flat](<https://people.math.harvard.edu/~kisin/dvifiles/bt.dvi>) (3.5.4)–Theorem (3.5.5), pp. 72–73.)

*Needs:* §5.6; §5.3; §1.1; GlobalGaloisDeformations §5.2; LocalGaloisDeformationRings Layer 4; LocalGaloisDeformationRings §2.15; SerreWeightAndLevelOptimisation §§6.6–6.11; AutomorphicGaloisRepresentations §§6.10–6.12; LocalGaloisDeformationRings §4.14; §5.1.

### 5.8 Modularity lifting in the Fontaine–Laffaille range

Let `p > 3`, F a totally real number field with p unramified in F, and `ρ, ρ₀ : G_F → GL_2(𝒪)` with `ρ̄ = ρ̄₀, ρ₀` modular and `ρ` geometric. Suppose that for every `σ : F ↪ L, HT_σ(ρ) = HT_σ(ρ₀)` consists of two distinct integers differing by at most `p − 2`; that `ρ` and `ρ₀` are crystalline at every `v | p`; and that `ρ̄(G_F) ⊇ SL_2(𝔽_p)`. Then `ρ` is modular.

The residual hypothesis is Gee's big image, GlobalGaloisDeformations §5.2 (2), which is different from KW II's cyclotomic irreducibility.

Use LocalGaloisDeformationRings §3.10 for the general unramified Fontaine–Laffaille ring. At each `v|p`, fix the trivial inertial type, the regular labelled weights of width at most `p−2`, the residual Fontaine–Laffaille module obtained from the crystalline lattice of `ρ₀`, and the compatible fixed determinant after the determinant normalization in Gee §5.5. The modular crystalline witness makes this local problem nonempty. The supplied ring is formally smooth over `𝒪`, of relative dimension `3+[F_v:ℚ_p]`; the supplier’s general rank-d formula is `d²−1+[F_v:ℚ_p]d(d−1)/2`. Only its modularity-lifting application is proved here.

Base change as in Gee §5.5, preserving the residual image and remaining unramified above p, to arrange even `[F:ℚ]`, residual unramifiedness away from p, unipotent inertia for `ρ` and `ρ₀` away from p, equal determinants, and `ρ̄|G_{F_v}` trivial with `#k(v)≡1 mod p` at the ramified auxiliary places `v∈T_r`. These are not the Taylor–Wiles places Q: Q is disjoint from T and `ρ̄(Frob_v)` has distinct eigenvalues there (Gee §5.6, p. 33). Patch with Ihara avoidance: the pair of problems of §4.1, full support in the unipotent problem transferred from the irreducible 𝒮′ problem (§4.4). §4.5.

**Checks.**

- The p-adic Tate module of an elliptic curve over F with good reduction above `p ≥ 5`, p unramified in F and `ρ̄(G_F) ⊇ SL_2(𝔽_p)`, once some crystalline weight-two modular `ρ₀` lifts `ρ̄`: the Hodge–Tate weights {0, 1} differ by `1 ≤ p − 2`.
- An unramified local field of degree two gives rank-two relative dimension five by §3.10, including reducible residual Fontaine–Laffaille data. Weights differing by `p−1` are outside its width bound.
- `p = 3` is excluded even when the image is `GL_2(𝔽_3)`: the theorem needs `p > 3`.

([Gee, MLT](<https://arxiv.org/pdf/2202.05818v2>) Theorem 5.2, p. 29.)

*Needs:* §4.1; §4.4; §4.5; §4.2; §5.3; GlobalGaloisDeformations §5.2; LocalGaloisDeformationRings §3.10; LocalGaloisDeformationRings Layer 8.

### 5.9 The exact overlap with ordinary modularity lifting

Type (C) lifts and crystalline endpoint lifts with residual weight p+1 are ordinary, and the prescribed modular witness is ordinary with the matching quotient character. On the subfamily satisfying every hypothesis of OrdinaryAutomorphicFormsAndModularityLifting §5.6—odd p, determinant finite-order times a positive cyclotomic power, locally distinguished residual characters with the specified quotient, a compatible ordinary modular witness, and its exclusion of induction from a quadratic field with a complex place—the ordinary theorem and KW lifting give the same modularity conclusion. The local ordinary shape alone does not imply these additional hypotheses. The remaining ordinary cases use KW patching or the full rational ordinary export of ClassicalSerreModularity §I.1, with its compatible ordinary witness and imaginary-quadratic correction.

Preserve the stable ordinary line and its quotient character under base change; split distinct unramified residual characters can label different ordinary components.

Check residual distinguishedness and the non-CM-induction restriction individually. Cyclotomic absolute irreducibility alone does not imply the latter.

The finite-order determinant factor and ordinary witness must match the normalization of the ordinary theorem used.

Type (C) is by definition `(γ_vχ_p ∗; 0 γ_v)`: ordinary with sub-character `γ_vχ_p`. Weight `p + 1` crystalline lifts with `k(ρ̄) = p + 1` are ordinary (LocalGaloisDeformationRings §8.15), and Theorem `8.4's π` fitting these data is ordinary at `v | p. A π` Steinberg at `v | p` has `ρ_π|D_v` of type (C) by local–global compatibility at p (proved here using AutomorphicGaloisRepresentations §§6.10–6.12), hence ordinary. Apply the ordinary theorem only after the distinguishedness, labelled quotient and non-CM-induction conditions are verified. OrdinaryAutomorphicFormsAndModularityLifting §5.6 supplies this restricted overlap; its §5.8 requires `CMComponentSupport` for the full-scope totally real implication.

**Checks.**

- 11a1 at `p = 11` (split multiplicative reduction, a Tate curve): its 11-adic representation is `(γχ_11 ∗; 0 γ)` at 11 with `γ` unramified, of type (C), inside the overlap.
- A non-ordinary crystalline weight-2 lift (`a_p` divisible by p) is of type (A) but outside the overlap.
- A crystalline lift of weight `p + 1` with `k(ρ̄) = 2` is not treated by KW II's argument (their §10.2 remark) and is not in the overlap either.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) §10.2, p. 92.)

*Needs:* ClassicalSerreModularity §I.1; §5.4; LocalGaloisDeformationRings §8.15; LocalGaloisDeformationRings §8.13; AutomorphicGaloisRepresentations §§6.10–6.12; OrdinaryAutomorphicFormsAndModularityLifting §5.6.

### 5.10 Kisin's nonordinary potentially Barsotti–Tate theorem

Let p>2 and F be totally real. Let `ρ:G_{F,S}→GL₂(E)` be continuous, potentially Barsotti–Tate and not potentially ordinary at every v|p, each such v having residue field `𝔽_p`. Suppose `det ρ` is cyclotomic times finite order, `ρ̄` is the residual representation of a parallel-weight-two Hilbert eigenform, and `ρ̄|G_{F(ζ_p)}` is absolutely irreducible with the same `p=5` projective-image condition as §5.7. Then `ρ` is modular.

This is Kisin's Theorem (3.5.7). It uses local–global compatibility at p for the level-changed form ([Sa] in Kisin), proved here using AutomorphicGaloisRepresentations §§6.10–6.12.

It replaces 'strongly residually modular' by residual modularity in parallel weight 2, using a level change to a form cuspidal at p (Kisin (3.1.6)) and the fact that an irreducible Weil–Deligne type at p forces non-ordinarity.

After base change f may be taken unramified or special of conductor 1 at 𝔭 `| p`; Jacquet–Langlands and (3.1.6) give f′ cuspidal at every 𝔭 `| p`, whose `ρ_{f′}|G_{F_𝔭}` is not potentially ordinary, so `ρ` is strongly residually modular. Apply §5.7 to the resulting strongly residually modular representation and descend.

**Checks.**

- Every place above p must be nonordinary; one ordinary place is outside this statement.
- The residue-field condition `𝔽_p` remains imposed at every v|p.
- The modular witness need not initially have matching local types; the level-change input must construct one.

([Kisin, finite flat](<https://people.math.harvard.edu/~kisin/dvifiles/bt.dvi>) Theorem (3.5.7) and Corollary (3.5.8), pp. 74–75.)

*Needs:* §5.7; §5.3; SerreWeightAndLevelOptimisation §§6.6–6.11; AutomorphicGaloisRepresentations §§6.10–6.12.

### 5.11 Kisin's potentially Barsotti–Tate theorem over ℚ

Let p>2 and `ρ:G_{ℚ,S}→GL₂(E)` be continuous, potentially Barsotti–Tate at p, with determinant cyclotomic times finite order. If `ρ̄` is modular and its restriction to `G_{ℚ(√p*)}` is absolutely irreducible, then `ρ` is modular.

This is Kisin's Corollary (3.5.8). In the potentially ordinary case it uses Diamond's potentially ordinary modular lift ([Di 1, 6.4] in Kisin), which is proved here with the level and type changes from SerreWeightAndLevelOptimisation §§6.6–6.11.

If `ρ|G_{ℚ_p}` is irreducible use §5.10; otherwise `ρ` is potentially ordinary and Diamond's lift makes `ρ` strongly residually modular. The nonordinary case uses §5.10; the ordinary case uses Diamond's lift and §5.7.

**Checks.**

- At `p=3` the quadratic field in the irreducibility condition is `ℚ(√−3)`.
- A weight-two potentially semistable noncrystalline Steinberg lift is not potentially Barsotti–Tate.
- The residue-field condition is automatic over `ℚ`; the ordinary and nonordinary proof branches are distinct.

([Kisin, finite flat](<https://people.math.harvard.edu/~kisin/dvifiles/bt.dvi>) Theorem (3.5.7) and Corollary (3.5.8), pp. 74–75.)

*Needs:* §5.7; §5.10; SerreWeightAndLevelOptimisation §§6.6–6.11.

### 5.12 Residual support for an admitted type

Under the BCDT global hypotheses, if `τ` (or `τ′`) admits `ρ̄|G_{Qℓ}`, then the corrected localized Hecke module for that type is nonzero and the relevant characteristic-zero automorphic set `N_S` is nonempty. This conclusion uses admission via an integral type lattice and a Jordan–Hölder constituent, not merely nonvanishing of a local type ring. In the extended case the nonzero class lies in the `w_ℓ=1` summand; retain separately the distinct-character, irreducible/peu-ramified and très-ramified alternatives in the admission predicate.

ℓ is odd, `ρ̄` is modular and absolutely irreducible on `G_{ℚ(√ℓ*)}, ρ̄|G_ℓ` has centraliser k, and `τ` (resp. `τ′`) admits `ρ̄|G_ℓ` in BCDT's sense: it admits an irreducible representation `σ` of `GL₂(ℤ_ℓ), U₀(ℓ)` or `Ũ₀(ℓ)` over `𝔽̄_ℓ` which admits `ρ̄|G_ℓ`.

Use `Γ=SL₂(ℤ)∩K′` with `K′=U′_S GL₂(ℤ_ℓ)` and Serre’s coefficient module `L_n⊗k` to obtain nonzero residual localized cohomology at the spherical comparison level. Twisting gives support for every admitting irreducible `GL₂(ℤ_ℓ)` coefficient. In the irreducible-type branch, admission and localized exactness give nonzero cohomology at `K′` with coefficient `Ind_{U₀(ℓ)}^{GL₂(ℤ_ℓ)} σ∨`; the coefficient-induction isomorphism identifies it with cohomology at `U′_S` with coefficient `σ∨`. Transfer support from that admitting constituent to the dual integral type lattice using exactness after non-Eisenstein localization and the corrected normal-subgroup descent. The extended-type proof additionally projects by `w_ℓ` and uses the appropriate local admission alternative. Lift the nonzero residual support to `L′_S`, use the type-sensitive automorphic decomposition and the comparison with `L_S`, and deduce `N_S` nonempty. No conjectural equivalence between admission and existence of a local lift is used.

**Checks.**

- The conclusion is nonvanishing of the localised corrected module and nonemptiness of `N_S`; it is not an `R = T` statement.
- For irreducible type the ℓ-factor is `U₀(ℓ)`, so the order-two d-entry in §5.2 prevents applying CDT directly there. The spherical comparison and induced coefficient supply the support before returning to that level.
- In the extended case with `ρ̄|G_ℓ` reducible and très ramifié, BCDT use `ρ̄_{I_ℓ}(Frob_ℓ) = −a` in the `w_ℓ-eigenvalue` comparison; the peu ramifié/irreducible case uses ã `+ w_ℓ`.

([BCDT](<https://virtualmath1.stanford.edu/~conrad/papers/tswfinal.pdf>) Theorems 1.4.1–1.4.2 proofs, author pp. 12–15, and §10, pp. 77–78.)

*Needs:* §5.2; LocalGaloisDeformationRings §3.12; SerreWeightAndLevelOptimisation §3.7; SerreWeightAndLevelOptimisation §4.2; ModularCurvesPartII §§14.1–14.15.

### 5.13 Type-sensitive global comparison

In the BCDT global deformation problem, residual modularity, absolute irreducibility on `G_{Q(√ℓ*)}`, local scalar centralizer, and an admitted weakly acceptable (extended) type give the CDT type-sensitive comparison `R_S≅T_S, T_S a` complete intersection and `L_S` finite free over `T_S`, using the corrected module. A given potentially Barsotti–Tate lift supplies a nonzero type prime, so the zero branch of weak acceptability cannot occur. For extended types every pairing, auxiliary-level module and numerical comparison is taken on the `w_ℓ=1` summand.

The CDT global setup of §§1.3–5.3 with the BCDT changes on p. 12 (resp. pp. 13–14 for extended types): `U_{S,ℓ} = U_τ, V_{S,ℓ} = ker σ_τ, σ_{S,ℓ} = σ_τ` (resp. `U₀(ℓ), Ũ_S` generated with `w_ℓ`, and the finite quotient `G̃_S = Ũ_S/V_Sℓ^{sℤ}`).

Use the local weak-acceptability quotient and the actual lift to enter the nonzero acceptable branch, and use admission to obtain a nonempty automorphic set. Apply the classical Taylor–Wiles numerical/module criterion proved here using DeformationAndDerivedPatchingAlgebra Layer 5 to the corrected type module. Its hypotheses include the perfect pairing, residual injectivity of level change, congruence ideal factors and auxiliary diamond freeness, as in CDT Propositions 5.5.1/5.6.1. For an extended type use the enlarged groups in all Hom and level-change maps, take `w_ℓ=1` in compact and ordinary cohomology, identify invariants with coinvariants using ℓ odd, and retain the resulting direct summand in the freeness argument. Use the remaining BCDT §10 label/hypothesis corrections in the local-type and numerical setup: the real group, `η-character` labels and patched algebra `A∞`. The discarded `σ_n` semisimplicity assertion is not an input. Elliptic-curve j-invariant consequences are outside this target.

**Checks.**

- The existence of the potentially Barsotti–Tate lift `ρ` of type `τ` makes `τ` acceptable for `ρ̄`, so the `R^D = 0` branch of weak acceptability is excluded.
- For an extended type the self-duality `L_S ≅ Hom_O(L_S, O)` is taken on the `w_ℓ = 1` parts; using all of H¹ would compare the wrong modules.

([BCDT](<https://virtualmath1.stanford.edu/~conrad/papers/tswfinal.pdf>) Theorems 1.4.1–1.4.2 and their proofs, author pp. 12–15; §10, author pp. 77–78; [CDT](<https://math.stanford.edu/~conrad/papers/cdtmaster.pdf>) Theorem 5.4.2, author p. 22; §§5.5–6.4, author pp. 22–31.)

*Needs:* §5.12; §5.2; GlobalGaloisDeformations §3.7; DeformationAndDerivedPatchingAlgebra Layer 5; DeformationAndDerivedPatchingAlgebra §§3.4–3.5; ModularCurvesPartII §§15.7–15.8, 17.8–17.10.

### 5.14 BCDT modularity lifting for a type

Let ℓ be odd, `E/Q_ℓ` finite with residue k, and `ρ:G_Q→GL₂(E)` continuous, odd and unramified outside finitely many primes. Assume `ρ̄` is modular and `ρ̄|G_{Q(√((-1)^((ℓ−1)/2)ℓ))}` absolutely irreducible. Require `End_{k[G_{Qℓ}]}(ρ̄)=k`. If `ρ|G_{Qℓ}` is potentially Barsotti–Tate of ℓ-type `τ, τ` admits `ρ̄|G_{Qℓ}` and `τ` is weakly acceptable for that residual representation, then `ρ` is modular. Type includes the BCDT finite-order prime-to-ℓ determinant factor; these hypotheses do not assert lifting for every arbitrary type.

`K/ℚ_ℓ` finite with residue field k, ℓ odd; `ρ : G_ℚ → GL₂(K)` odd, continuous, ramified at finitely many primes; `ρ̄` modular and absolutely irreducible on `G_{ℚ(√((−1)^{(ℓ−1)/2}ℓ))}; ρ̄|G_ℓ` has centraliser k; `ρ|G_ℓ` potentially Barsotti–Tate of ℓ-type `τ`, which admits `ρ̄|G_ℓ` and is weakly acceptable for it.

Choose a stable integral lattice and apply the admitted-type residual support theorem to obtain a nonzero localized corrected coefficient module. Use weak acceptability to compare the prescribed local type ring with the weak ring in the numerical argument. The corrected coefficient module and CDT criterion identify the relevant deformation ring with its Hecke action image. The point defined by `ρ` therefore gives a characteristic-zero Hecke eigensystem. The automorphic Galois representation attached to it is `ρ` by its trace identities.

**Checks.**

- Admission is a hypothesis: BCDT Conjecture 1.3.1(1) predicts that `τ` admits `ρ̄|G_ℓ` whenever a lift of type `τ` exists, but the paper verifies it only in special cases (§2.1), and the theorem does not use it.
- Absolute irreducibility is required over `ℚ(√((−1)^{(ℓ−1)/2}ℓ))`, not merely over `ℚ`; for ℓ `= 3` this field is `ℚ(√−3)`.

([BCDT](<https://virtualmath1.stanford.edu/~conrad/papers/tswfinal.pdf>) Theorem 1.4.1 and proof, author pp. 12–13; §10, pp. 77–78.)

*Needs:* §5.13; LocalGaloisDeformationRings §3.12.

### 5.15 BCDT modularity lifting for an extended type

Let ℓ be odd, `E/Q_ℓ` finite with residue k, and `ρ:G_Q→GL₂(E)` continuous, odd and unramified outside finitely many primes. Assume `ρ̄` is modular and `ρ̄|G_{Q(√((-1)^((ℓ−1)/2)ℓ))}` absolutely irreducible. Require `End_{k[G_{Qℓ}]}(ρ̄)=k`. If `ρ|G_{Qℓ}` is potentially Barsotti–Tate of extended ℓ-type `τ′, τ′` admits `ρ̄|G_{Qℓ}` and `τ′` is weakly acceptable for that residual representation, then `ρ` is modular. Type includes the BCDT finite-order prime-to-ℓ determinant factor; these hypotheses do not assert lifting for every arbitrary type.

As for §5.14 with an extended ℓ-type `τ′` whose restriction to inertia is irreducible: `τ′` admits `ρ̄|G_ℓ` through an irreducible representation of `Ũ₀(ℓ)` and is weakly acceptable for it.

Use extended-type admission to select the appropriate normalizer action and corrected `w_ℓ-positive` coefficient module, with the distinct/peu/très residual cases retained. Apply weak acceptability and the extended-type version of the numerical module argument to that summand. Read the resulting point of the Hecke algebra as an eigenform and identify its representation using Frobenius traces.

**Checks.**

- Because `τ′` is acceptable, `det τ′` of a Frobenius lift is `ℓζ` for a root of unity `ζ`, so `σ_{τ′}(ℓ^s) = 1` for some `s > 0` and `σ̃_S` factors through a finite group.
- The `w_ℓ = 1` restriction is needed in CDT Lemma 6.1.3 and in the duality on p. 547; without it the self-duality of `L_S` fails.

([BCDT](<https://virtualmath1.stanford.edu/~conrad/papers/tswfinal.pdf>) Theorem 1.4.2 and proof, author pp. 13–15; §10, pp. 77–78.)

*Needs:* §5.13; LocalGaloisDeformationRings §3.12.

### 5.16 Kisin crystalline lifting over ℚ in the medium-weight range

Import ClassicalSerreModularity §I.2, `I.2/same-weight-crystalline-lifting`: let `p>2`, let `𝒪` be the integers of a finite extension of `ℚ_p` with residue field `𝔽`, and let `ρ:G_{ℚ,S}→GL₂(𝒪)` be continuous, finitely ramified and crystalline at p with Hodge–Tate weights `{0,k−1}`, `2≤k≤2p−1`. Suppose `ρ̄|G_{ℚ(ζ_p)}` is absolutely irreducible, `End_{𝔽[G_{ℚ_p}]}ρ̄=𝔽`, and a cuspidal modular eigenform of weight k has residual representation `ρ̄`. Then `ρ` is modular. Oddness of the lift follows from the odd modular residual witness and `p>2` by §7.10.

The supplier owns the rational matching-weight lifting theorem and its fixed-determinant crystalline-domain comparison of Durham Proposition (3.13). Its local deformation carriers are supplied by LocalGaloisDeformationRings §3.10 and Layer 5. Apply that named theorem with the displayed hypotheses; §5.17 supplies its matching-weight seed in the nonordinary endpoint application. The source’s higher-weight Hilbert level-lowering limitation leaves the import over ℚ.

**Checks.**

- Kisin’s proof of (3.14) establishes the rational case using level lowering over ℚ; the cited higher-weight totally real argument requires more than the weight-two level-lowering result.
- Weight `k=2p` is outside the imported range `2≤k≤2p−1`.
- A weight-two modular residual witness is not a weight-`p+1` witness; §5.17 uses Hasse multiplication and eigenvalue lifting to supply the required weight.
- Scalar local residual action has a larger endomorphism algebra and fails the scalar-centralizer hypothesis.

([Kisin, Durham](<https://people.math.harvard.edu/~kisin/dvifiles/dur.dvi>) Proposition (3.13), author pp.19–20; Theorem (3.14) and proof, pp.20–21; ClassicalSerreModularity §I.2, `I.2/same-weight-crystalline-lifting`.)

*Needs:* ClassicalSerreModularity §I.2, `I.2/same-weight-crystalline-lifting`; §7.10.

### 5.17 The nonordinary weight-p-plus-one endpoint

Let p>2, `ρ` crystalline of weights {0,p}, nonordinary at p, finitely ramified, with modular `ρ̄` and `ρ̄|G_{Q(ζ_p)}` absolutely irreducible. In the residual Serre-weight-two branch, the BLZ calculation makes `ρ̄|G_{Qp}` absolutely irreducible, hence its endomorphism ring is k after choosing a splitting coefficient field. The weight theorem gives a mod-p weight-two form of level prime to p; multiplication by the Hasse invariant followed by characteristic-zero eigenform lifting gives a weight-p+1 cuspidal modular witness for the same residual representation. Thus Kisin’s Q crystalline lifting theorem applies and `ρ` is modular.

`p > 2` and `ρ|G_{ℚ_p}` is crystalline with Hodge–Tate weights {0, p} and not ordinary; `ρ̄` is modular with `ρ̄|G_{ℚ(ζ_p)}` absolutely irreducible, and the residual Serre weight is 2.

Import the precise BLZ endpoint reduction, with the nonordinary assumption, from PadicHodgeTheory §6.4; this is distinct from the local endpoint ring for residual Serre weight p+1. Import weight-two realization, the weight-p−1 Hasse multiplication preserving the residual eigensystem, and the Deligne–Serre lifting of that weight-p+1 eigensystem from SerreWeightAndLevelOptimisation. Verify local scalar endomorphisms and the same-weight modularity hypothesis, then apply ClassicalSerreModularity’s `I.2/same-weight-crystalline-lifting` through §5.16.

**Checks.**

- After removing the unramified determinant factor by an unramified twist and enlarging coefficients, the nonordinary weight-`p+1` reduction is `Ind ω₂^p≅Ind ω₂` in Kisin’s normalization of the induced representation (Durham §§3.8–3.9). Before normalization the formula holds up to unramified twist; absolute irreducibility and residual Serre weight two are unchanged.
- At `p=5`, twisting by an unramified character ν of order three preserves weights and nonordinarity but multiplies the residual determinant by `ν̄²≠1`; the literal fixed induced representation cannot describe both reductions.
- The Hasse invariant has weight `p − 1`, so multiplying a weight-two form by it gives weight `p + 1` with the same q-expansion and the same Hecke eigenvalues away from p.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) §10.2, p. 92; Kisin Durham Theorem (3.14), author pp. 20–21.)

*Needs:* §5.16; PadicHodgeTheory §6.4; SerreWeightAndLevelOptimisation §3.7; SerreWeightAndLevelOptimisation §3.14; SerreWeightAndLevelOptimisation Layer 4.

### 5.18 KW I Theorem 4.1(2): modularity lifting over ℚ for odd p

Let `p > 2` and `ρ̄ : G_ℚ → GL₂(𝔽), 𝔽 a` finite field of characteristic p, with `ρ̄|_{ℚ(μ_p)}` absolutely irreducible, and assume that `ρ̄` is modular. Let `ρ` be a lift of `ρ̄` to a p-adic representation, unramified outside a finite set of primes, that is either (i) crystalline of weight k at p with `2 ≤ k ≤ p + 1`, or (ii) potentially semistable at p of weight 2. Then `ρ` is modular. This is KW I Theorem 4.1(2), assembled by the case division in KW II §10.2 without potential modularity or global deformation-ring finiteness.

Weight k means Hodge–Tate weights `(k − 1, 0)`. The lift is odd because `ρ̄` is and p is odd.

Cases given by Theorem 9.7 (KW II §10.2, Remark): (i) for `2 ≤ k ≤ p`, and for `k = p + 1` when `k(ρ̄) = p + 1` (type (A)); (ii) weight-two lifts semistable over `ℚ_p(μ_p)` reduce to type (B) or type (C) after the finite-order global twist described below. If monodromy is zero the lift is already crystalline over that extension and has type (B); if monodromy is nonzero the twist removes its scalar inertial character and gives type (C) over ℚ_p.

Cases KW II take from the literature: (i) with `k = p + 1` and `k(ρ̄) = 2` (Kisin's Durham paper when the lift is non-ordinary at p, Diamond's Annals paper when it is ordinary); (ii) potentially Barsotti–Tate (Kisin, §5.11); and the semistable weight-two case 'goes back to' Wiles, Taylor–Wiles and Diamond. For `k ≤ p − 1` they also cite Diamond–Flach–Guo, which Theorem 9.7 covers again.

Case (ii) is covered completely. A potentially semistable lift of weight 2 is either potentially crystalline, hence potentially Barsotti–Tate (Kisin's theorem), or its Weil–Deligne representation has `N ≠ 0`; then `ρ|_{D_p}` is the twist of a semistable non-crystalline representation by a character `η` of finite order on inertia, `η|_{I_p}` is the restriction of a Dirichlet character of p-power conductor, and twisting `ρ` and `ρ̄` by its inverse preserves the hypotheses and the conclusion and gives type (C). KW II do not print this reduction.

For the ordinary crystalline weight-p+1, residual-weight-two branch, import the full ordinary lifting theorem of ClassicalSerreModularity §I.1, retaining distinguishedness and the matching quotient and modular ordinary witness. OrdinaryAutomorphicFormsAndModularityLifting §5.7 identifies its non-imaginary-induced subfamily with the totally real theorem; the remaining CM-induced case uses the full-scope correction at the classical owner.

Residual input. `ρ̄` modular gives `(α)` and `(β)` over every soluble totally real F unramified at p on which `ρ̄` stays absolutely irreducible (§5.5). Base change. Choose an allowable `F/ℚ` (§1.8), split at p when `ρ̄|_{D_p}` is irreducible or `k(ρ̄) = p + 1`, over which `ρ|_{G_F}` has the uniform shape that the proof of Theorem 9.7 starts from (§5.3). Theorem 9.7 (§5.4) makes `ρ|_{G_F}` modular in the cases of types (A), (B), (C). Descent along the soluble tower returns to `ℚ` (GL2AutomorphicRepresentationsAndTransfer §§R17.4.1–R17.4.11, R17.6.19, through §5.3). For potentially crystalline weight two use the Q potentially Barsotti–Tate theorem. When monodromy is nonzero, use the finite-order global twist (proved here using AutomorphicGaloisRepresentations §§4.5–4.9) taking the local condition to type (C), with determinant and residual comparisons. For `k=p+1`, residual weight two, use §5.17 in the nonordinary branch and Diamond's ordinary endpoint theorem in the ordinary branch.

On the common crystalline, determinant and local hypotheses, this export agrees with the classical application contract of ClassicalSerreModularity §I.2; its independent matching-weight theorem is the import in §5.16. The comparison retains those hypotheses as well as residual modularity.

**Checks.**

- `p = 3, ρ` the 3-adic Tate module of 11a1: crystalline of weight 2, residual image `GL₂(𝔽₃)`, absolutely irreducible over `ℚ(μ₃)`; the theorem recovers its modularity through type (A).
- Crystalline of weight `p + 2` is outside (i).
- The Tate module of an elliptic curve with additive, potentially multiplicative reduction at `p ≥ 5`: potentially semistable with `N ≠ 0`, and its quadratic twist has multiplicative reduction, type (C).
- Tensor a local Tate-curve representation by a nontrivial tame finite character θ killed by `G_{ℚ_p(μ_p)}`. It is semistable over that extension, but its nontrivial scalar inertial type and `N≠0` give neither type (B) nor type (C) over ℚ_p. Extending θ to a Dirichlet character and twisting back gives type (C).

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) §10.2, p. 92; [KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) §10.2, Remark, p. 92; [KW I](<https://www.math.ucla.edu/~shekhar/papers/results.pdf>) Theorem 4.1, p. 7.)

*Needs:* ClassicalSerreModularity §I.1; §5.5; §5.4; §5.3; §1.8; §1.6; §5.11; GL2AutomorphicRepresentationsAndTransfer §§R17.4.1–R17.4.11, R17.6.19; §5.17; OrdinaryAutomorphicFormsAndModularityLifting Layer 5.

### Examples

The p-adic Tate module of an elliptic curve over `ℚ` with good ordinary reduction at `p ≥ 3` and modular, cyclotomically irreducible mod-p representation is a type (A) point of weight 2 (§5.4). For `k = p + 1` with `k(ρ̄) = 2` and `ρ` nonordinary, the residual local representation is an unramified twist of `Ind ω₂^p≅Ind ω₂`, irreducible of Serre weight 2, so §5.17 is the only nonordinary branch (§5.17). A different-component point (a potentially Barsotti–Tate lift whose local component carries no modular point) is not covered by §5.6.

### Dependencies

Layers 1, 2, 3, 4 of this roadmap; AlgebraicModularFormsAndSerreWeights (Layer R15.2; Layer R15.5; Layer R15.6); AutomorphicGaloisRepresentations (Layers 1–2; §§6.10–6.12); DeformationAndDerivedPatchingAlgebra (Layer 3; Layer 4; Layer 5); GL2AutomorphicRepresentationsAndTransfer (§§R17.4.1–R17.4.11, R17.6.19); GlobalGaloisDeformations (§§3.3–3.8; Layer R04.5; Layer R04.6); LocalGaloisDeformationRings (Layer 2; Layer 3; Layer 4; Layer 5; Layer 8); ModularCurvesPartII (§§14.1–14.15; §§15.7–15.8, 17.8–17.10); OrdinaryAutomorphicFormsAndModularityLifting (Layer 5); PadicHodgeTheory (§6.4); SerreWeightAndLevelOptimisation (Layer 3; Layer 4; §§6.6–6.11).

## Layer 6: Dyadic lifting and Hypothesis (H)

At `p = 2`: enhanced dyadic patching data with their action chunks (§6.1, §6.3), the patched ring and module with the free determinant torus action and its torsor structure (§6.4–§6.7, §6.11–§6.13), and `R = T` after inverting 2 (§6.14) give the 2-adic Khare–Wintenberger theorem (§6.15) and KW I Theorem 4.1(1) (§6.16). Kisin’s ambient dyadic patching and union-of-components support (§6.7a) give his component criterion and 2-adic Barsotti–Tate theorem (§6.8, §6.9), proving Hypothesis (H) (§6.10). Oddness at 2 is a hypothesis on the lift, not on its reduction (§6.2).

### 6.1 Enhanced dyadic patching data

For `m≥3` enhance a level-m pair `(D_m,L_m)` by `A′=B[[x_1,…,x_{h+j+t−d}]]↠D′_m` with `m_{D′_m}^{r′_m}=0, r′_m=b r_m` and b the number of generators of `m_{A′}`; a determinant morphism `d_m:Sp D′_m→T=Hom(Z^t,Ĝ_m)`; a closed immersion `Sp D_m→Sp D′_m`; and a free `T_{2^m}` action chunk on `Sp D′_m` in the category of local algebras C with `m_C^{r′_m}=0`. Require `d_m(ℓx)=ℓ²d_m(x)`. Its determinant-one ring `D″_m` surjects onto `D_m` with kernel contained in `m_{D″_m}^m`. Include all these maps in morphisms and reductions.

`p = 2, ρ̄` has non-solvable image, and the level-n inputs (`R′_n, d_n`, the free twisting action of `G*_n`) are GlobalGaloisDeformations §6.6; `m ≥ 3` and `r′_m = b r_m` with b the number of generators of `m_{A′}`.

Record the ambient finite quotient, determinant map and the free truncated twist action from the global dyadic datum. Its square on determinants gives the displayed equivariance identity. Keep the determinant-one comparison quotient and its kernel bound as part of the datum. Its kernel is allowed to be nonzero at finite level. Morphisms preserve these maps, in addition to all the ordinary patching maps.

Provide the following operations and compatibility statements.

- `DyadicPatchingDatum`: A pair `(D_m,L_m)` with its truncated ambient ring, determinant, free action chunk and small-kernel comparison.
- `DyadicPatchingDatum.determinantOne`: The closed determinant-one fibre `D″_m` with its specified quotient onto `D_m`.
- `DyadicPatchingDatum.reduce`: Reduction preserves the determinant, action chunk, embedding and all pair-data maps.

**Checks.**

- `dyadicDatum_t_zero`: For `t=0` the torus and determinant constraint are trivial.
- `dyadicDatum_small_kernel`: A surjection `C→C/(ε), C=k[ε]/(ε^{m+1})`, has kernel `(ε)` not contained in `m_C^m` for `m≥2` and fails the required comparison.
- `dyadicDatum_power: D′_m` is truncated by an ordinary maximal-ideal power, while `D_m` is killed by a power-generated ideal; exchanging these requirements changes the datum.
- For `t=0`, `D″_m=D′_m`, but the comparison `D′_m↠D_m` can have nonzero kernel in `𝔪^m`: `k[ε]/(ε^{m+1})↠k[ε]/(ε^m)` has kernel `(ε^m)`. The kernel disappears only in the compatible separated limit.
- A datum with `D″_m = D_m` imposed at finite level is not KW's: only the inclusion of the kernel in `m^m` is required.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) §2.6, pp. 13–14; Proposition 9.3 proof, pp. 84–87.)

*Needs:* §3.1; GlobalGaloisDeformations §4.7; GlobalGaloisDeformations §6.6.

### 6.2 Oddness in residue characteristic two

Let `p = 2`, c a complex conjugation and `ρ : G_F → GL_2(𝒪) a` lift of `ρ̄`. Residual oddness `det ρ̄(c) = −1 = 1` carries no information. The lift is odd at c, in the sense of KW II (`ρ(c)` has characteristic polynomial `X² − 1`), if and only if `det ρ(c) = −1`. If `ρ̄(c) ≠ 1` then every lift is odd at c, but an odd lift can have `ρ̄(c) = 1` (for example `ρ(c) =` diag(1, −1)). So oddness at `p = 2` is a condition on the lift, imposed by the archimedean local ring, and not a property of `ρ̄(c)`.

The archimedean ring of odd lifts is LocalGaloisDeformationRings §8.7: formally smooth when `ρ̄(c) ≠ 1`, and `𝒪⟦X₁, X₂, X₃⟧/(X₁² + X₂X₃ + 2X₁)` when `p = 2` and `ρ̄(c) = 1`.

`ρ(c)² = 1` in characteristic 0 gives eigenvalues in {±1}. `det ρ(c) = −1` forces {1, −1}, hence characteristic polynomial `X² − 1`; conversely `X² − 1` has determinant −1. If `ρ̄(c) ≠ 1` then `ρ(c) ≠` ±1 (both reduce to 1), so its eigenvalues are 1 and −1 and `det ρ(c) = −1`. diag(1, −1) and 1 both reduce to the identity mod 2, so `ρ̄(c) = 1` does not decide oddness.

**Checks.**

- `ρ(c) = (1 1; 0 −1)`: odd, with `ρ̄(c) = (1 1; 0 1) ≠ 1`.
- `ρ(c) =` diag(1, −1): odd, with `ρ̄(c) = 1`.
- `ρ(c) = −1`: even `(det = 1)`, with `ρ̄(c) = 1`; so `'ρ̄(c) = 1'` does not distinguish odd from even lifts.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) §3.1, Proposition 3.3 and the remark after its proof, pp. 19–21.)

*Needs:* LocalGaloisDeformationRings §8.7; GlobalGaloisDeformations §6.1.

### 6.3 Realizing the dyadic action chunks

Let `a≥2` and `2^a>N`. At level n+a, choose a compatible surjection `Z^t→G_{n+a}` inducing `G′_{n+a}≅(Z/2^{n+a−2})^t`. For `n≥m≥3`, put `D′_{m,n}=R′_{n+a}/m_{R′_{n+a}}^{r′_m}`, with its determinant map and restricted `T_{2^m}` action chunk. Together with `D_{m,n},L_{m,n}` from the shifted arithmetic construction this satisfies every enhanced level-m condition, including `D″_{m,n}↠D_{m,n}` with kernel in `m^m`. The inequality `a≥2` supplies `T_{2^n}⊂(G′_{n+a})*`. The quotient by the full determinant character is not replaced by a fixed-determinant equality before this comparison.

`p = 2, a ≥ 2` with `2^a > N`, and `n ≥ m ≥ 3` with `n ≥ n₀ + 1`; the generator count of `R′_n` over B is `2h + 1 = h + j + t − d` (GlobalGaloisDeformations §6.5).

The fixed shift a supplies enough cyclic 2-power quotients after both the isotropy loss and the two-power twist loss. Restrict the free G* action to the displayed action chunk. Use the ordinary maximal-ideal truncation `r′_m` to descend the action and determinant map. The global determinant comparison gives a quotient of the determinant-one fibre whose residual kernel lies in `m^m`. All module/scalar compatibilities are inherited from the shifted arithmetic construction.

**Checks.**

- The determinant map `d_{m,n}` is the reduction of `d_{R′_{n+a}} : ρ` ↦ `det ρ·(χ_pψ)^{−1}`, which lands in `G*_{n+a} ⊂ T`.
- Without `a ≥ 2` the `2^n-torsion` of T would not sit inside `(G′_{n+a})*`, and the `T_{2^m}` action chunk could not be restricted from the twisting action.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) Proposition 9.3 proof, pp. 85–87.)

*Needs:* §6.1; §3.2; GlobalGaloisDeformations §6.6; GlobalGaloisDeformations §4.10.

### 6.4 Dyadic patched rings

Stabilize the enhanced dyadic data with all maps. Their ring limits give B-algebra surjections `B[[x_1,…,x_{h+j+t−d}]]↠R′∞↠R∞↠R̄_S^{□,ψ}`, with an `S∞-structure` on `R∞` and `R∞/J≅R̄_S^{□,ψ}`. The determinant-one fibre of `Sp R′∞` is `Sp R∞`: the finite-level comparison kernels lie in `m^m` and hence vanish in the separated inverse limit. Here `d=3|S|, j=4|S|−1, h=|Q_n|` and t are the numerical data of the dyadic patching data of GlobalGaloisDeformations Layer R04.6. The module and free torus action are specified in separate targets.

The level-n inputs (`R′_n, R_n, d_n`, the free twisting action of `G*_n` and the `Δ′_{Q_n}-structure`) are GlobalGaloisDeformations §6.6; the Hecke side and its twist action are §2.9.

The patching is the diagonal-subsequence argument of §3.1 (DeformationAndDerivedPatchingAlgebra Layer 5), carried out with the extra data `D′_m` and the determinant maps.

Level-m data: `D′_m` with determinant morphism `d_m`, its determinant-one quotient `D″_m`, a surjection `D″_m ↠ D_m` with kernel contained in `𝔪_{D″_m}^m`, and the `D_m-module L_m`. The action chunks on `Sp D′_m` come from the finite twisting groups. Do not identify `D_m` with `D″_m` at finite level (KW II pp. 85–86). Finitely many isomorphism classes at each level; a compatible subsequence gives a projective system with limits `R′_∞, R_∞, M_∞`. The action chunks assemble to a free T-action (GlobalGaloisDeformations §4.7), and the `d_m` to d. The identification `X_∞ = d^{−1}(1)` holds because `D′′_m ↠ D_m` has kernel in `𝔪^m`.

Provide the following operations and compatibility statements.

- `dyadicPatchedRing`: The inverse-limit surjections `R′∞↠R∞↠R̄_S^{□,ψ}` with their B- and `S∞-maps`.
- `dyadicPatchedRing_augmentation: R∞/J≅R̄_S^{□,ψ}` preserving local deformation and framing maps.
- `dyadicPatchedRing_fibre: R∞` is the quotient of `R′∞` cut out by `d=1`, obtained from the vanishing small kernels in the limit.

**Checks.**

- `dyadicRing_t_zero`: For `t=0` there is no determinant torus parameter.
- `dyadicRing_framing`: Further quotient by the j framing variables gives the unframed fixed-determinant ring.
- `dyadicRing_finite_not_equal`: The datum permits a nonzero kernel `D″_m→D_m` in `m^m`; finite-level equality is not an axiom.
- For `t = 0` the torus and determinant constraint are trivial in the limiting construction. This recovers the shape of ordinary module patching, not an identification between rings in characteristics 2 and `p > 2`.
- `d(λx) = λ²d(x)`: twisting by a character multiplies the determinant by its square.
- The torus action is not free on the unframed rings without the non-solvable image hypothesis (GlobalGaloisDeformations §4.10).

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) §9.1.3, Proposition 9.3 (I) and its proof, pp. 83–87.)

*Needs:* GlobalGaloisDeformations §6.6; GlobalGaloisDeformations §4.7; GlobalGaloisDeformations §4.10; §2.9; §3.1; §1.12; DeformationAndDerivedPatchingAlgebra §§5.6–5.7; §1.14; §1.13; §6.3; §3.3.

### 6.5 Dyadic patched module

Let `M∞=lim L_m` for the enhanced dyadic patching system. This is an `R∞-module`, finite free of rank s>0 over `S∞=O[[y_1,…,y_{h+j}]]`, with scalar action through `S∞→R∞`. It has the specified equivariant isomorphism `M∞/J≅M^□` and, after all framing variables, `M∞/(y)≅M`. The faithful Hecke action asserted at this point is the action of `T^□` on `M^□`.

The enhanced dyadic data have been stabilised compatibly (§3.3); each `L_m` is free of rank s over `S∞/c_m` with chosen basis, and the transition maps are surjective.

Choose bases for the finite free scalar modules together with the other finite structured data. The stabilization and compatible reductions give `M∞≅S∞^s` and a continuous `R∞` action. Pass the equivariant augmentation maps to the inverse limit using the supplied finite-module exactness statement. Quotient first by J, then by the framing variables. Faithfulness over `R∞` is established in §6.13.

Provide the following operations and compatibility statements.

- `dyadicPatchedModule`: The inverse-limit module with its `R∞` and `S∞` actions.
- `dyadicPatchedModule_free`: It is finite free of rank s over `S∞`.
- `dyadicPatchedModule_aug`: Augmentation by J gives the framed Hecke module with both deformation and Hecke actions.

**Checks.**

- `dyadicModule_rank`: Rank `s=1` gives an `S∞-module` isomorphic to `S∞`.
- `dyadicModule_aug`: Quotient by J and then framing equals quotient by all y at once.
- `dyadicModule_zero`: The zero module is excluded by s>0; it cannot prove faithfulness or a dimension lower bound.
- `M∞/(y_1,…,y_h) ≅ M^□` and `M∞/(y_1,…,y_{h+j}) ≅ S_{k,ψ}(U,O)_𝔪`.
- Faithfulness of `M∞` over `R∞` is not part of this construction; it is §6.13.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) Proposition 9.3(I), pp. 83–87.)

*Needs:* §6.4; §3.3; §1.14.

### 6.6 Free patched determinant torus action

The compatible free `T_{2^m}` action chunks assemble to a free action of the formal torus T on `Sp R′∞`, with determinant morphism d:Sp `R′∞→T` satisfying `d(ℓx)=ℓ²d(x)`. Its determinant-one fibre is `Sp R∞`. The action itself is on `R′∞`; only T[2] preserves that fibre.

`T = Hom(ℤ^t, Ĝ_m)` is the formal torus of KW II §9.1.3; the stabilised action chunks of `T_{2^m}` on `Sp D′_m` are free and compatible under reduction.

The finite action laws and freeness are among the stabilized compatible maps. Any Artinian test algebra is seen by a sufficiently deep action chunk, so their limit gives the formal torus action and its freeness. The determinant-squaring identities hold at every finite level and hence in the limit. The determinant-one comparison kernels tend to zero. Thus the fibre is `Sp R∞`, and its preserving subgroup is the kernel T[2] of squaring.

Provide the following operations and compatibility statements.

- `dyadicTorusAction`: The free formal T-action on the ambient patched formal spectrum.
- `dyadicDet_smul`: The determinant morphism is equivariant for squaring on T.
- `dyadicTorusAction_two_torsion`: Restriction to T[2] preserves `d=1` and acts on `Sp R∞`.

**Checks.**

- `dyadicTorus_trivial`: At `t=0` the acting formal group is trivial.
- `dyadicTorus_square`: For `t=1`, multiplying by ℓ changes the determinant parameter by ℓ².
- `dyadicTorus_fibre`: An element with `ℓ²≠1` does not preserve the determinant-one fibre.
- For `t = 1` and `λ ∈ T(A), d(λx) = λ²d(x)`; so `λ = −1` preserves the fibre `d = 1` and `λ` with `λ² ≠ 1` does not.
- The action is on `Sp R′∞; R∞` is only stable under T[2].

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) Proposition 9.3(I)(3), pp. 84–87.)

*Needs:* §6.4; §6.3; GlobalGaloisDeformations §4.7; GlobalGaloisDeformations §4.6.

### 6.7 The torsor structure of the dyadic patched ring

In §6.4, let `R^inv_∞` represent the orbits of the free formal torus T-action on `X′_∞`. The natural map `R^inv_∞→R_∞` makes `Sp R_∞ a` T[2]-torsor over `Sp R^inv_∞`.

The free T-action and determinant-squaring map are the data of §6.4; `X∞` is its determinant-one fibre.

Lemma 9.4: the fibre product `X′_∞ ×_T T` of pairs `(x, λ)` with `d(x) = λ²` is a T × T[2]-torsor over `Sp R^inv_∞; (x, λ)` ↦ `(λ^{−1}x, λ)` identifies it with `X_∞ × T`, and quotienting by T gives the free T[2]-action on `X_∞` with quotient `Sp R^inv_∞` (GlobalGaloisDeformations §4.11).

**Checks.**

- `t = 0`: the torsor is trivial and `R_∞ = R^inv_∞`.
- `t = 1`: the torsor is finite flat of degree 2 over `R^inv_∞`.
- After inverting 2 the torsor is étale; component transitivity additionally uses the domain base and regularity of §§6.11–6.13.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) §9.1.3, Lemmas 9.4–9.6, pp. 87–88.)

*Needs:* §6.4; GlobalGaloisDeformations §4.11; GlobalGaloisDeformations §4.6; §6.5; §6.6.

### 6.7a Ambient dyadic module patching and component support

Under the arithmetic hypotheses of §6.8, let `A=⊗̂_{v∈S} R̄_v^{□,ψ}` be the completed tensor product of the full local condition rings: Barsotti–Tate above 2, the prescribed fixed-character extensions at Σ, unramified at the other finite places, and odd at infinity. Include every ordinary and nonordinary component allowed by those conditions. Every characteristic-zero eigensystem in the localized modules satisfies these full local conditions by local–global compatibility. Their eigenpoint factorizations give the integral factorization of the Hecke action through these local quotients because the modules are 𝒪-torsion-free. The local component and completed-tensor results give A equidimensional of dimension `d+1`, `d=3|S|`; A need not be a domain. Let `h=|Q_n|`, `j=4|S|−1`, `t=2−|S|+h` and `g=h+j+t−d=2h+1` be Kisin’s dyadic parameters, with `g≥t`.

Construct the ambient framed modules `M_n=R_{F,S_{Q_n}}^{□,ψ}⊗_{R_{F,S_{Q_n}}^ψ} S_{2,ψ}(U_{Q_n},𝒪)_{𝔪_{Q_n}}` and the minimal framed module `M₀`. They carry the full A-action, the diamond actions and specified augmentation isomorphisms. The auxiliary modules are finite free over `𝒪[Δ_{Q_n}]` with the framing variables adjoined; their coinvariants give `M₀`. Equip these modules with determinant-varying ambient rings, determinant-one comparison kernels, scalar maps and quadratic semilinear twists having the formulas of §§2.9 and 6.1–6.7. Construct these decorated data over A without the domain hypothesis of §3.1. These are the actual localized modules, without tensoring them with a local component quotient.

Apply finite decorated stabilization to these ambient data using DeformationAndDerivedPatchingAlgebra §§5.2–5.4, retaining the module actions, scalar maps, augmentations and all determinant and twist maps. This gives surjections `A[[x₁,…,x_g]]↠R′∞↠R∞`, a module `M∞≠0` finite free over `S∞=𝒪[[y₁,…,y_{h+j}]]`, and the equivariant identifications `R∞/JR∞≅R̄_{F,S}^{□,ψ}` and `M∞/JM∞≅M₀`, where `J=(y₁,…,y_h)`. The separated limit of the small comparison kernels identifies `Spf R∞` with the determinant-one fibre of `Spf R′∞`. The free T-action and determinant-squaring map give a T[2]-torsor over the invariant quotient `Spf R^inv∞`, with the T[2]-action lifting to `M∞`.

Construct the quotient presentation `C=A[[x₁,…,x_{g−t}]]↠R^inv∞` as in Kisin’s proof. The image `T∞` of `R∞` in `End_{S∞}(M∞)` is finite and torsion-free over S∞; each of its irreducible components has dimension `h+j+1`. Since `R∞` is finite over `R^inv∞`, this dimension comparison and the equidimensionality `dim C=d+1+g−t=h+j+1` imply that the C-support of `M∞` is a union of irreducible components. No faithfulness over the whole ambient ring follows. The generic support in `Spec R∞[1/2]` is stable under T[2]; the finite étale torsor makes it the inverse image of its support in `Spec R^inv∞[1/2]`.

The local generic-fibre regularity and completed-tensor comparisons make `C[1/2]` regular at the contracted seed point; in particular it lies on a unique component. For the augmented points of `ρ_f` and `ρ`, the same-component local criteria of §6.8, with geometric component comparisons after a common coefficient extension, place their contractions on that component of `Spec C[1/2]`. The seed point is supported by the augmentation to `M₀`; support on a union of C-components therefore contains that entire component and the contraction of `ρ`. The T[2]-stable support on the torsor contains the point of `ρ` itself. Finite-module specialization at J and then at the framing variables puts `ρ` in the support of the original Hecke module. This is a same-component modularity conclusion, without an `R=T` assertion for all ambient components.

**Checks.**

- Take `R=ℤ₂[[x]]/(x(x−2))`, `M=R/(x)⊕R/(x−2)` and `B=R/(x)≅ℤ₂`. The module M is faithful over R and free of rank two over ℤ₂, with a characteristic-zero point on B. Nevertheless `M⊗_R B≅ℤ₂⊕𝔽₂` has nonzero 2-torsion, so it is not ℤ₂-flat. Selecting B does not preserve the module contract.
- If A is a domain, a nonempty union of its power-series components is the whole spectrum; the domain argument of §§6.11–6.14 then applies when its other hypotheses hold. For reducible A, support can omit whole components.
- For `t=0` the torsor is trivial; support on components still follows from the ambient dimension comparison and need not be full support.
- Over `E×E`, a trivial order-two torsor has two separate base components. A stable support can contain both sheets over only one base component; the same-component comparison is necessary.
- Over `E[x,y]/(xy)`, the support of `A/(x)` contains the origin but omits `(1,0)`, although both points lie on the component `y=0`. Regularity at the seed rules out this intersection ambiguity in the arithmetic comparison.

([Kisin, 2-adic BT](<https://people.math.harvard.edu/~kisin/dvifiles/serre2.dvi>) proof of Proposition (3.2.9), author pp.40–41, properties (i)–(v), the invariant quotient and the ensuing support argument.)

*Needs:* §§1.4–1.5, 1.11–1.14; §§2.5, 2.8–2.9, 2.12; §§6.1–6.7; GlobalGaloisDeformations §6.6; HilbertModularVarietiesAndShimuraCurves §§R18.3.14, R18.3.26–R18.3.32; AutomorphicGaloisRepresentations §§6.10–6.12; LocalGaloisDeformationRings §§F.0.1, 4.14, 5.2, 5.12–5.13, 8.7–8.8; DeformationAndDerivedPatchingAlgebra §§5.2–5.4, 6.1–6.2.

### 6.8 Kisin's dyadic component criterion

Let `p=2` and `ρ̄` have nonsolvable image. Let f be an eigenform of parallel weight two on the definite quaternion algebra D (unramified above 2, ramified at Σ) at level U maximal above 2, with `ρ̄_f≅ρ̄`. Suppose `ρ:G_F→GL₂(𝒪)` lifts `ρ̄`, is totally odd, has the same determinant `ψε` as `ρ_f`, and is unramified outside S. Require both representations to satisfy the specified local deformation conditions: (1) at every `v∈Σ`, their restrictions are extensions of the prescribed unramified `γ_v` by `γ_v(1)`; (2) at `v∈S∖Σ`, `v∤2`, both are unramified; (3) at `v|2`, both are Barsotti–Tate and ordinary at exactly the same places, and at each ordinary place the residual characters of their unramified quotients agree. At each nonordinary place require `κ(v)=𝔽₂` or trivial residual local action. Then `ρ≅ρ_g` for a Hecke eigenform g of the same level.

The Barsotti–Tate local rings at `v | 2` and their ordinary and nonordinary components are LocalGaloisDeformationRings §§5.2, 5.12–5.13; the rings away from 2 are its §8.8. This target transports those components through the arithmetic patching maps.

Use the ambient module-patching and union-of-components support theorem of §6.7a. Its finite-level modules factor through the full local condition rings, retaining diamond freeness, augmentations and compatible twists. The fixed away-2 conditions and ordinary quotient labels put `ρ` and `ρ_f` on the same local components; nonordinary connectedness uses the residue-field or trivial-action hypothesis (LocalGaloisDeformationRings §§5.2, 4.14, 5.13). With the local geometric component comparisons after a common coefficient extension, their augmented points contract to one component of the ambient invariant presentation C. Regularity at the contracted modular seed makes this its unique component, so the union-of-components support contains it. T[2]-stable support on the determinant-one torsor then contains the point of `ρ`, and specialization gives its Hecke eigensystem. The domain-base faithfulness theorem of §§6.11–6.14 is not required for this ambient construction.

**Checks.**

- `ρ` and f both non-ordinary at every `v | 2` with `κ(v) = 𝔽_2`: covered.
- `ρ` ordinary and f non-ordinary at some `v | 2`: condition (3) fails, and the two points lie on different components.
- At a nonordinary place, `κ(v)=𝔽₄` with nontrivial residual action is excluded by the connectedness hypothesis.
- Over a disconnected base `A=E×E`, the trivial order-two torsor `A×A` has four components; its group exchanges only the two sheets over each base component. The torsor statement alone does not give transitivity.
- If χ is quadratic, ramified at a good prime q outside S and unramified above 2, `ρ_f⊗χ` has the same determinant and mod-2 reduction and remains Barsotti–Tate above 2, but is rejected by the away-2 ramification condition; its conductor at q increases.
- Over `ℚ₂`, let η be unramified with `η(Frob)=ζ₃`. The ordinary crystalline lifts `diag(εη,η⁻¹)` and `diag(η,εη⁻¹)` have determinant ε and identical residual semisimplifications, but residual unramified quotients `η̄⁻¹≠η̄`; the labelled-component hypothesis rejects this pair.

([Kisin, 2-adic BT](<https://people.math.harvard.edu/~kisin/dvifiles/serre2.dvi>) Proposition (3.2.9) and its proof, pp. 40–42.)

*Needs:* §6.7a; §6.7; LocalGaloisDeformationRings §F.0.1; LocalGaloisDeformationRings §5.12; LocalGaloisDeformationRings Layer 4; LocalGaloisDeformationRings §8.8; LocalGaloisDeformationRings §4.14; LocalGaloisDeformationRings §5.13; LocalGaloisDeformationRings §5.2; LocalGaloisDeformationRings §5.3.

### 6.9 Kisin's 2-adic Barsotti–Tate lifting theorem

Let F be totally real and `ρ : G_{F,S} → GL_2(𝒪), 𝒪` 2-adic, continuous with: `(1) ρ̄` modular with non-solvable image; `(2) ρ|G_{F_v}` potentially Barsotti–Tate for every `v | 2`, and `det ρ = χψ` with `ψ a` totally even character of finite order; `(3) F_v = ℚ_2` at every `v | 2` where `ρ` is potentially ordinary. Then `ρ ≅ ρ_g` for a Hilbert modular eigenform g of parallel weight 2 over F. For `F = ℚ`: if `ρ` is potentially Barsotti–Tate at 2, `det ρ` is the cyclotomic character times an even character of finite order, and `ρ̄` is modular with non-solvable image, then `ρ` arises from a holomorphic eigenform of weight 2.

The version read prints hypothesis (2) of Theorem (0.9) and Theorem (3.3.5) as 'Barsotti-Tate'; the proof treats potentially Barsotti–Tate `ρ`, and Theorem (0.1) over `ℚ` says 'potentially Barsotti–Tate' (Corrections to the sources, E1). The statement here is the potentially Barsotti–Tate one.

The type and level changes of quaternionic eigenforms (Kisin Lemmas (3.3.1)–(3.3.4)) are arithmetic refinements proved here using SerreWeightAndLevelOptimisation §§6.6–6.11.

Admissible extension F′/F (§5.3) and a definite quaternion algebra D over F′, unramified above 2, with: unipotent inertia away from 2, nontrivial exactly at `Σ`; potentially ordinary places `v | 2` split completely; and an eigenform f on D with `ρ̄_f ≅ ρ̄|G_{F′}`. Lemma (3.3.2): make the types of f cuspidal at the non-potentially-ordinary `v | 2`; Lemma (3.3.1): at the potentially ordinary v (where `F_v = ℚ_2`) make f potentially ordinary of type Ind `θ`. After a further admissible extension the types are trivial, and `ρ_f` is ordinary at `v | 2` exactly when `ρ` is; also `ρ̄|G_{F′_v}` is trivial for `v | 2`. At `v ∈ Σ`, the unramified characters of `ρ_f` and `ρ` agree after a composite of quadratic extensions. Lemma (3.3.4): make `π_f` unramified outside `Σ`; match `ψ`. §6.8 gives modularity over F′; descend. The case `F = ℚ` is Theorem (0.1).

**Checks.**

- The 2-adic Tate module of an elliptic curve `E/ℚ` with `ρ̄_{E,2}` of image `S_3` is excluded: the image is solvable.
- An elliptic curve over a totally real F with potentially good ordinary reduction at a prime `v | 2` with `F_v ≠ ℚ_2` is excluded by (3).
- `ψ` must be totally even: `det ρ = χψ` with `ψ` odd at some real place would make `ρ` even there.

([Kisin, 2-adic BT](<https://people.math.harvard.edu/~kisin/dvifiles/serre2.dvi>) Theorem (0.1), p. 2; [Kisin, 2-adic BT](<https://people.math.harvard.edu/~kisin/dvifiles/serre2.dvi>) Theorem (3.3.5) and its proof, pp. 45–46.)

*Needs:* §6.8; §5.3; §6.2; SerreWeightAndLevelOptimisation §§6.6–6.11.

### 6.10 Hypothesis (H) of Khare–Wintenberger

Hypothesis (H) holds for `p = 2`: let `ρ : G_ℚ → GL_2(𝒪), 𝒪` 2-adic, be continuous, odd `(det ρ(c) = −1)`, irreducible, unramified outside a finite set, of weight 2 and potentially crystalline at 2, with `ρ̄` modular of non-solvable image. Then `ρ` is modular. This is the only prime at which KW I §9 invokes (H): in the proof of Theorem 9.1 it is applied to 2-adic members of compatible systems.

Potentially crystalline of weight 2 (Hodge–Tate weights {0, 1}) is the same as potentially Barsotti–Tate: a crystalline representation of `G_K` with Hodge–Tate weights {0, 1} arises from a p-divisible group (Breuil for `p > 2`, Kisin for all p). This is FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.20.

Oddness here is `det ρ(c) = −1` (§6.2); irreducibility of `ρ` is implied by the non-solvable residual image and is not used.

`det ρ = χ_2·ψ` with `ψ` of finite order: `det ρ·χ_2^{−1}` is a character of `G_ℚ`, unramified outside a finite set and of Hodge–Tate weight 0 and potentially crystalline at 2, hence finite on an open subgroup of every inertia group; since `G_ℚ^{ab} ≅ ℤ̂^×` is generated by the inertia groups, `ψ` has finite order. `ψ` is even: `χ_2(c) = −1` and `det ρ(c) = −1`. Potentially crystalline of weight 2 gives potentially Barsotti–Tate (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4). §6.9 over `ℚ` applies.

**Checks.**

- The 2-adic Tate module of an elliptic curve `E/ℚ` whose mod-2 image is `GL_2(𝔽_2) ≅ S_3` is outside (H): the image is solvable (the mod-2 image of any elliptic curve over `ℚ` lies in `GL_2(𝔽_2) ≅ S_3`), so KW apply (H) to 2-adic members of compatible systems with non-solvable residual image.
- An even `ρ (det ρ(c) = 1)` is excluded, even though its residual `det ρ̄(c) = 1 = −1` looks odd.
- Weight 3 potentially crystalline `ρ` is outside (H): Hodge–Tate weights {0, 2} are not Barsotti–Tate.

([KW I](<https://www.math.ucla.edu/~shekhar/papers/results.pdf>) §9, Hypothesis (H) and the proof of Theorem 9.1, pp. 18–19.)

*Needs:* §6.9; §6.2; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.20.

### 6.11 The dyadic patched power-series presentation

The surjection `B[[x₁,…,x_{h+j+t−d}]]→R′∞` of §6.4 is an isomorphism. Hence `R′∞` and `R^inv_∞` are `𝒪`-flat domains and `M∞` is faithful over `R^inv_∞`.

B is a domain of dimension `d + 1` with regular generic fibre (semistable conditions away from 2; LocalGaloisDeformationRings §8.17).

Lemma 9.5: if B⟦x⟧ `→ R′_∞` were not injective, `dim R′_∞ < h + j + t + 1`, so `dim R^inv_∞ < h + j + 1` (free-action-quotient), and `dim R_∞ < h + j + 1` since `R_∞` is finite over `R^inv_∞`. This contradicts the faithful action of `𝒪⟦y_1, …, y_{h+j}⟧`, of dimension `h + j + 1`, on the finite module `M_∞` through `R_∞`. If the action of the domain `R^inv_∞` on `M∞` factored through a proper quotient, its dimension would fall, contradicting faithful action of `𝒪[[y₁,…,y_{h+j}]]` on a finite module. Retain all dimension and finiteness hypotheses of KW II Lemma 9.5.

**Checks.**

- Dimension count: `B⟦x₁, …, x_{h+j+t−d}⟧` has dimension `(d + 1) + (h + j + t − d) = h + j + t + 1`, which is the bound forced by the faithful action of `𝒪⟦y_1, …, y_{h+j}⟧` (dimension `h + j + 1`) after the t-dimensional torus is divided out.
- `t = 0`: the torus is trivial, `R′_∞ = R_∞ = R^inv_∞`, and the statement is the domain case of §3.5.
- If B were not a domain (for instance with an inertia-rigid place giving two components), injectivity of B⟦x⟧ `→ R′_∞` could fail on one component; this is why the hypothesis on B is kept.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) Lemma 9.5 and following paragraph, p.87.)

*Needs:* §6.4; §6.7; GlobalGaloisDeformations §4.6; LocalGaloisDeformationRings §8.17; §6.5; §6.6; DeformationAndDerivedPatchingAlgebra §3.3; DeformationAndDerivedPatchingAlgebra §§3.1–3.3.

### 6.12 Regularity of the dyadic patched generic fibres

In the dyadic patching setup `R∞[1/2]` and `R^inv_∞[1/2]` are regular.

B is a domain of dimension `d + 1` with regular generic fibre (semistable conditions away from 2; LocalGaloisDeformationRings §8.17).

Lemma `9.6(a): R^inv_∞ → R′_∞ ≅` B⟦x⟧ is formally smooth, so `R^inv_∞[1/2]` is regular, and `R^inv_∞[1/2] → R_∞[1/2]` is étale.

**Checks.**

- `t = 0: R^inv_∞ = R_∞ =` B⟦x⟧, and regularity after inverting 2 is that of B[1/2] (the semistable and odd archimedean factors), not formal smoothness of B.
- The archimedean factor `𝒪⟦X₁, X₂, X₃⟧/(X₁² + X₂X₃ + 2X₁)` of §6.2 is not formally smooth (modulo 2 it is `X₁² + X₂X₃`, singular at the origin) but is regular after inverting 2; so the conclusion is about generic fibres only.
- Étaleness of `R^inv_∞[1/2] → R_∞[1/2]` uses that T[2] is étale once 2 is inverted; over `𝒪` itself `μ₂` is not étale.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) Lemma 9.6, p. 88.)

*Needs:* §6.11; §6.7; LocalGaloisDeformationRings §8.17; §6.5; §6.6; DeformationAndDerivedPatchingAlgebra §3.2.

### 6.13 Faithfulness of the dyadic patched module

In the dyadic patching setup, with the compatible quadratic-twist actions on the finite-level modular forms, `M∞` is a faithful `R∞-module`.

B is a domain of dimension `d + 1` with regular generic fibre (semistable conditions away from 2; LocalGaloisDeformationRings §8.17).

Faithfulness over `R_∞` uses the action of T[2](𝒪) `≅ (±1)^t` by twists on the modular forms at every level (§2.9), compatible with its action on `𝒪⟦y⟧` by `χ·y_i = χ(δ_i)(1 + y_i) − 1` (KW II Lemma 5.12).

Lemma `9.6(b): Supp M_∞[1/2]` contains a component of `Spec R_∞[1/2]`; T[2](𝒪) acts transitively on these components (`R^inv_∞[1/2]` is a regular domain) and preserves the support (the twist compatibility at each level), so the support is everything (DeformationAndDerivedPatchingAlgebra §6.7). The algebra is DeformationAndDerivedPatchingAlgebra §6.1, applied to the reduced ring `R∞[1/2]` with the T[2](𝒪)-action. The T[2]-torsor is finite flat, and becomes étale after inverting 2 over the regular domain `R^inv∞[1/2]`. Its torsor group permutes components transitively: invariants of the nonempty stable union are a nonempty open-and-closed subset of the connected base. Twist-equivariance makes the support such a stable union. Reducedness gives generic faithfulness, then O-flatness of `R∞` makes the localization map injective and gives integral faithfulness.

**Checks.**

- `t = 0`: the torsor is trivial and `R_∞ = R^inv_∞`.
- `t = 1: R_∞` is finite flat of degree 2 over `R^inv_∞`, and `Spec R_∞[1/2]` has at most two components, exchanged by the nontrivial quadratic twist.
- Without the twist compatibility, full support on one component would not propagate to the others.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) Lemma 9.6, p. 88.)

*Needs:* §6.7; §6.11; §6.12; §2.9; DeformationAndDerivedPatchingAlgebra §6.7; §6.5; §6.6; DeformationAndDerivedPatchingAlgebra §§6.4–6.5; DeformationAndDerivedPatchingAlgebra §6.1.

### 6.14 R = T after inverting 2

In the situation of §6.4 (`p = 2, ρ̄` with non-solvable image), `R̄^{□,ψ}_S` is finite over `𝒪⟦y_{h+1}, …, y_{h+j}⟧, R̄^ψ_S` is finite over `𝒪`, and the surjection `π : R̄^{□,ψ}_S → 𝕋^□_ψ(U)_𝔪` has 2-power torsion kernel.

The Auslander–Buchsbaum step (Kisin's Lemma (3.3.4)) is DeformationAndDerivedPatchingAlgebra §§3.1–3.3, as in §3.7.

`R_∞` injects into `End_{𝒪⟦y⟧}(M_∞)`, which is finite over `𝒪⟦y⟧`; so `R_∞` is finite over `𝒪⟦y⟧` and its quotients `R̄^{□,ψ}_S = R_∞/`(`y_1, …, y_h`) and `R̄^ψ_S = R_∞/`(`y_1, …, y_{h+j}`) are finite over `𝒪⟦y_{h+1}`, …⟧ and `𝒪`. On each connected component of `Spec R_∞[1/2]` (regular, §6.12) the corresponding summand of `M_∞[1/2]` is finite projective, nonzero by faithfulness; so `M_∞[1/2]` is faithful and projective over `R_∞[1/2]`, and its reduction `mod` (`y_1, …, y_h`) is faithful over `R̄^{□,ψ}_S[1/2]`. Generic-fibre faithfulness makes the map to `𝕋^□` injective after inverting 2, so the integral kernel is contained in the 2-power torsion ideal. Conversely, DeformationAndDerivedPatchingAlgebra §6.5 puts that ideal in the kernel, since the Hecke module is 𝒪-torsion-free; DeformationAndDerivedPatchingAlgebra §6.5 then gives the statement. DeformationAndDerivedPatchingAlgebra §6.5 alone proves only the converse containment.

**Checks.**

- If `R̄^{□,ψ}_S` is `𝒪`-flat the kernel vanishes and `R̄^{□,ψ}_S ≅ 𝕋^□`; in general DeformationAndDerivedPatchingAlgebra §6.5 gives the torsion-free quotient version.
- The kernel may be nonzero integrally, but every element in it is killed by a power of 2; non-torsion kernel elements are excluded.
- The finiteness of `R̄^ψ_S` here is at the level of KW II's lifting data; the finiteness for arbitrary local rings (KW II Theorem 10.1) belongs to PotentialModularityAndCompatibleSystems.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) Proposition 9.3 (II)–(III) and the end of its proof, pp. 84 and 88–89.)

*Needs:* §6.7; §6.4; §1.12; DeformationAndDerivedPatchingAlgebra §6.5; DeformationAndDerivedPatchingAlgebra §6.5; DeformationAndDerivedPatchingAlgebra §§6.4–6.5; DeformationAndDerivedPatchingAlgebra §§3.1–3.3; DeformationAndDerivedPatchingAlgebra §6.3; §6.11; §6.12; §6.13; §6.5; §6.6.

### 6.15 The Khare–Wintenberger 2-adic lifting theorem

Let `p = 2` and F totally real, unramified at 2 and split at 2 if `ρ̄|D_2` is irreducible, with `ρ̄_F = ρ̄|G_F` of non-solvable image, satisfying `(α)` if `k(ρ̄) = 2`, and `(β)`. Let `ρ_F : G_F → GL_2(𝒪)` lift `ρ̄_F`, be ramified at finitely many places and totally odd, and at every place above 2 be either crystalline of weight 2, or semistable non-crystalline of weight 2 (the latter only when `ρ̄` is not finite at the places above 2). Then `ρ_F` is modular. This is the 2-adic lifting result KW I Theorem 4.1(1) needs, with residual input `(α), (β)` in place of `'ρ̄` modular'; Theorem 4.1(1) itself is §6.16.

F is totally real and `ρ̄ : G_F → GL_2(𝔽)` is as in KW II §8, with lifting data and determinant character `ψ` (GlobalGaloisDeformations §6.1; the local conditions are LocalGaloisDeformationRings §8.2).

Oddness is imposed on the lift, through the archimedean rings of odd lifts (§6.2); it cannot be read off `ρ̄(c)`.

The local rings at 2 and the twisting calculations are LocalGaloisDeformationRings Layer 8 (§§8.13, 8.16) and LocalGaloisDeformationRings Layer 5 (with the arithmetic refinements here).

Allowable base change (§5.3), as for odd p, so that `ρ_F` prescribes lifting data and `ψ` and is an `𝒪`-point of `R̄^{□,ψ}_S`; the non-solvable image survives by linear disjointness. SerreWeightAndLevelOptimisation §6.11 (KW II Theorem 8.4) gives `π′` fitting the same lifting data. §6.14: `R̄^{□,ψ}_S[1/2] ≅ 𝕋^□[1/2]`, so `ρ_F` is modular; descend along the solvable extension.

**Checks.**

- `ρ̄` with image `SL_2(𝔽_4) ≅ A_5` satisfying `(α)` and `(β)`, and a crystalline weight-two odd lift: covered.
- A lift with `ρ(c) = −1` at some real place is excluded: it is even, whatever `ρ̄(c)` is.
- Semistable non-crystalline lifts when `ρ̄` is finite at 2 are excluded by the theorem's hypothesis.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) §9.2, Theorem 9.7 and its proof, pp. 89–90; [KW I](<https://www.math.ucla.edu/~shekhar/papers/results.pdf>) Theorem 4.1(1), p. 7.)

*Needs:* §6.14; §6.2; §1.2; §5.3; §1.1; LocalGaloisDeformationRings §8.13; LocalGaloisDeformationRings §5.13; LocalGaloisDeformationRings §5.2; LocalGaloisDeformationRings §5.3; §1.3; SerreWeightAndLevelOptimisation §6.11.

### 6.16 KW I Theorem 4.1(1): 2-adic modularity lifting over ℚ

Let `ρ̄ : G_ℚ → GL₂(𝔽), 𝔽 a` finite field of characteristic 2, have non-solvable image, and assume that `ρ̄` is modular. Let `ρ` be an odd lift of `ρ̄` to a 2-adic representation, unramified outside a finite set of primes, that is either crystalline of weight 2 at 2, or semistable of weight 2 at 2, the latter case being considered only when `k(ρ̄) = 4`. Then `ρ` is modular. This is an output of Layer 6, proved as in KW II §10.2 from Theorem 9.7 at `p = 2` (§6.15) and the weight part of Serre's conjecture, with no use of potential modularity or of finiteness of deformation rings.

Oddness is a hypothesis on the lift: `det ρ(c) = −1`. It cannot be read off `ρ̄` in characteristic 2 (§6.2).

`k(ρ̄) = 4` exactly when `ρ̄` is not finite at 2; this matches the condition of Theorem 9.7 that the semistable non-crystalline case is considered only when the residual representation is not finite at the places above 2.

The residual input over `ℚ` is `'ρ̄` modular'; it gives `(β)`, and `(α)` when `k(ρ̄) = 2`, by §5.5.

KW II remark that some results towards this statement are due to Dickinson; they are not used.

`(β)`, and `(α)` if `k(ρ̄) = 2`, over every soluble totally real F unramified at 2 on which the image stays non-solvable (§5.5). An allowable `F/ℚ` (§1.8) over which `ρ|_{G_F}` has the shape required at the start of the proof of Theorem 9.7 (§5.3); the non-solvable image is preserved. Theorem 9.7 at `p = 2` (§6.15): `ρ|_{G_F}` is modular. Descent to `ℚ` along the soluble tower (GL2AutomorphicRepresentationsAndTransfer §§R17.4.1–R17.4.11, R17.6.19).

The dyadic application contract ClassicalSerreModularity §I.2 is the corresponding specialization, retaining its residual weight and oddness requirements.

**Checks.**

- `ρ̄` with image `SL₂(𝔽₄) ≅ A₅`, modular, and an odd crystalline lift of weight 2: covered.
- A semistable non-crystalline lift when `ρ̄` is finite at `2 (k(ρ̄) = 2)` is not covered.
- An even lift is not covered, whatever `ρ̄(c)` is.

([KW II](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>) §10.2, p. 92; [KW I](<https://www.math.ucla.edu/~shekhar/papers/results.pdf>) Theorem 4.1, p. 7.)

*Needs:* §5.5; §6.15; §6.2; §5.3; §1.8; §1.6; GL2AutomorphicRepresentationsAndTransfer §§R17.4.1–R17.4.11, R17.6.19.

### Examples

The identity matrix in `GL₂(𝔽₂)` has determinant `1 = −1`, so residual determinant cannot detect oddness at 2; an even 2-adic lift with `det ρ(c) = 1` is excluded from (H) (§6.2, §6.10). The archimedean ring of odd lifts is `𝒪⟦X₁, X₂, X₃⟧/(X₁² + X₂X₃ + 2X₁)` when `p = 2` and `ρ̄(c) = 1` (§6.2). A weight-three potentially crystalline 2-adic representation has weights {0, 2} and is outside (H) (§6.10).

### Dependencies

Layers 1, 2, 3, 5 of this roadmap; DeformationAndDerivedPatchingAlgebra (Layer 3; Layer 5; Layer 6); FiniteFlatGroupsAndIntegralPadicHodgeTheory (§R07.4.20); GL2AutomorphicRepresentationsAndTransfer (§§R17.4.1–R17.4.11, R17.6.19); GlobalGaloisDeformations (Layer R04.4; Layer R04.6); LocalGaloisDeformationRings (Layer 4; Layer 5; Layer 8); SerreWeightAndLevelOptimisation (§§6.6–6.11).

## Layer 7: Statement table and normalisations over ℚ

State the four lifting propositions of the modern strand separately, as statements (a)–(d): (a) the odd-prime proposition with cyclotomic irreducibility (§7.1), (b) the dyadic proposition with nonsolvable residual image (§7.2), (c) the residually reducible proposition (§7.3) and (d) the ordinary 3-adic proposition (§7.4). They are Dieulefait–Pacetti's Theorems 1.4–1.7, and each section names where it is proved. Fix the normalisations they share: nonsolvable image (§7.5), Hodge–Tate weights and oddness (§7.6, §7.10), the weight of a modular twist (§7.9) and the classification of geometric twists (§7.11). Record which printed forms assume residual modularity (§7.7) and which local cases each source excludes (§7.8).

### 7.1 The odd-prime modularity-lifting proposition

For an odd prime p, `OddPrimeLifting`(p) is the following proposition: every continuous odd `ρ:G_ℚ→GL₂(ℚ̄_p)`, ramified at finitely many primes, whose residual representation restricted to `G_{ℚ(√p*)}` is absolutely irreducible, whose restriction at p is de Rham with weights {0,k−1} for k>1, and whose residual representation is that of a cuspidal newform, is the representation of a weight-k cuspidal eigenform.

Only the forms that assume `ρ̄` modular are declared (§7.7); statements (c) and (d) need no residual modularity.

'de Rham', Hodge–Tate weights and p-adic Hodge types are LocalGaloisDeformationRings §3.1; `ρ_g` is de Rham at p with Hodge–Tate weights `{0, k − 1}` by AutomorphicGaloisRepresentations §§4.5–4.7, 4.9.

The residual hypothesis is `TauCeti.ResidualModularity.IsModular`, with the supplied `ArisesFrom` comparison giving the cuspidal newform and integral-model witness; the absolute irreducibility hypothesis identifies the actual residual representation. This is the convention used throughout Layers 7–12.

Define this proposition; its proof is §8.8, not an assumption inside the proposition.

Provide the following operations and compatibility statements.

- `OddPrimeLifting`: For an odd prime p, `OddPrimeLifting`(p) is the following proposition: every continuous odd `ρ:G_ℚ→GL₂(ℚ̄_p)`, ramified at finitely many primes, whose residual representation restricted to `G_{ℚ(√p*)}` is absolutely irreducible, whose restriction at p is de Rham with weights {0,k−1} for k>1, and whose residual representation is that of a cuspidal newform, is the representation of a weight-k cuspidal eigenform.
- `oddPrimeLifting_apply`: A proof of `OddPrimeLifting`(p) applied to a representation, k and every listed hypothesis produces a weight-k modularity witness.
- `oddPrimeLifting_iff`: The predicate is equivalent to its displayed universally quantified implication, with all the representation, local and residual hypotheses retained.

**Checks.**

- `oddPrimeLifting_includes_three`: The proposition at `p=3` uses `ℚ(√−3)=ℚ(ζ₃)` and has no `p≥5` restriction.
- `oddPrimeLifting_requires_residual_witness`: Residual oddness alone is not a witness for the residual modularity hypothesis.
- `oddPrimeLifting_weight_two`: At `k=2` the Hodge–Tate hypothesis is exactly the weight multiset {0,1}.
- Statement (c) is stated only for `p ≥ 5`. At `p = 3` the case `ρ̄^{ss} ≅ 1` ⊕ `χ̄₃` is statement (d); Pan's Theorem 1.0.2 excludes it (Layer 11).
- A statement that assumes only that `ρ̄` is odd, and takes its modularity from Khare–Wintenberger, is not in the table.

([DP](<https://arxiv.org/pdf/2108.07577v2>) Theorem 1.4, p. 4 (arXiv v2).)

*Needs:* AlgebraicModularFormsAndSerreWeights Layer R15.6, “S-type and modularity predicates”; hypotheses LL1–LL3 and CC4–CC5 for the proof (Conditional arithmetic hypotheses); LocalGaloisDeformationRings §3.1; AutomorphicGaloisRepresentations §§4.5–4.7, 4.9; §1.1; `TauCeti.Multiquadratic.oddPrimeDiscriminant`; ArithmeticGaloisRepresentations §1.5; ArithmeticGaloisRepresentations §1.6; ArithmeticGaloisRepresentations §§1.5–1.9.

### 7.2 The dyadic modularity-lifting proposition

`DyadicLifting` is the proposition that every continuous odd `ρ:G_ℚ→GL₂(ℚ̄₂)`, ramified at finitely many primes, de Rham at 2 with weights {0,k−1}, k>1, and with a modular residual representation of nonsolvable image, is the representation of a weight-k cuspidal eigenform.

Define this proposition; its proof is §9.3 (after descent to a finite coefficient field by ArithmeticGaloisRepresentations Layer 1, as in §8.8), with the twist normalised by §7.11 and §7.9.

Provide the following operations and compatibility statements.

- `DyadicLifting`: The stated dyadic proposition with oddness of the lift separate from its residual image.
- `dyadicLifting_apply`: A proof applied to the listed representation data gives a weight-k eigenform.
- `dyadicLifting_iff`: The predicate is equivalent to its displayed universally quantified implication, with all the representation, local and residual hypotheses retained.

**Checks.**

- `dyadicLifting_weight_two`: For `k=2` the weights are {0,1}.
- `dyadicLifting_oddness_not_residual`: Determinant −1 reduces to +1 in characteristic two; residual oddness cannot replace oddness of the lift.
- `dyadicLifting_rejects_solvable_image`: A modular residual representation with dihedral image does not meet the nonsolvable-image hypothesis.

([DP](<https://arxiv.org/pdf/2108.07577v2>) Theorem 1.5, p. 4 (arXiv v2).)

*Needs:* AlgebraicModularFormsAndSerreWeights Layer R15.6, “S-type and modularity predicates”; hypotheses CC1, CC4–CC5 for the proof (Conditional arithmetic hypotheses); LocalGaloisDeformationRings §3.1; AutomorphicGaloisRepresentations §§4.5–4.7, 4.9; §1.1; ArithmeticGaloisRepresentations §1.5; ArithmeticGaloisRepresentations §1.6; ArithmeticGaloisRepresentations §§1.5–1.9.

### 7.3 The residually reducible lifting proposition

For a prime `p≥5, ResiduallyReducibleLifting`(p) asserts: every continuous irreducible odd `ρ:G_ℚ→GL₂(ℚ̄_p)`, ramified at finitely many primes, de Rham at p with weights {0,k−1}, k>1, and residual semisimplification `χ₁⊕χ₂`, is the representation of a weight-k cuspidal eigenform. No cuspidal residual modularity witness is assumed.

Define this proposition; under hypothesis LC its proof is §10.15 (after passing from de Rham to potentially semistable by PadicHodgeTheory §§5.1–5.3 and descending to a finite coefficient field by ArithmeticGaloisRepresentations Layer 1), with the twist normalised by §7.11 and §7.9; §12.3 is its use along congruences.

Provide the following operations and compatibility statements.

- `ResiduallyReducibleLifting`: The stated proposition for prime `p≥5`.
- `residuallyReducibleLifting_apply`: A proof applied to all listed data yields a weight-k eigenform without a residual cuspidal modularity hypothesis.
- `residuallyReducibleLifting_iff`: The predicate is equivalent to its displayed universally quantified implication, with all the representation, local and residual hypotheses retained.

**Checks.**

- `residuallyReducible_not_at_three`: The proposition's range excludes `p=3`.
- `residuallyReducible_at_five`: The endpoint `p=5` is included.
- `residuallyReducible_not_reducible_lift`: A reducible characteristic-zero `ρ` cannot be substituted for the required irreducible lift merely because its residual semisimplification is `χ₁⊕χ₂`.

([DP](<https://arxiv.org/pdf/2108.07577v2>) Theorem 1.6, p. 4 (arXiv v2).)

*Needs:* hypotheses CC1–CC5 for the proof (Conditional arithmetic hypotheses); hypothesis LC for the proof (Conditional arithmetic hypotheses); LocalGaloisDeformationRings §3.1; AutomorphicGaloisRepresentations §§4.5–4.7, 4.9; §1.1; ArithmeticGaloisRepresentations §1.5; ArithmeticGaloisRepresentations §1.6; ArithmeticGaloisRepresentations §§1.5–1.9.

### 7.4 The ordinary residually reducible 3-adic proposition

`OrdinaryThreeLifting` asserts: a continuous irreducible odd `ρ:G_ℚ→GL₂(ℚ̄₃)`, ramified at finitely many primes, with residual semisimplification `1⊕χ̄₃`, inertia restriction at 3 of upper-triangular shape (∗ ∗;0 1), and determinant `ψχ₃^(k−1)` for finite-order `ψ` and `k≥2`, is the representation of a weight-k eigenform. The nontriviality of `χ̄₃` on `D₃` is automatic. The finite-order meaning of `ψ` must be retained from the cited ordinary theorem, not replaced by an unrestricted character.

Define this proposition; it holds by OrdinaryAutomorphicFormsAndModularityLifting §5.5 (Skinner–Wiles at `p = 3`), which is imported, not restated. The Baire coefficient-field descent, stable-lattice theorem and lattice-independent residual semisimplification of ArithmeticGaloisRepresentations Layer 1 transport the algebraic-closure formulation to the finite-coefficient formulation of the ordinary theorem.

Provide the following operations and compatibility statements.

- `OrdinaryThreeLifting`: The stated ordinary 3-adic proposition with finite-order `ψ`.
- `ordinaryThreeLifting_apply`: A proof applied to the inertia, determinant, irreducibility and residual data gives a weight-k eigenform.
- `ordinaryThreeLifting_iff`: The predicate is equivalent to its displayed universally quantified implication, with all the representation, local and residual hypotheses retained.

**Checks.**

- `ordinaryThree_cyclotomic_nontrivial: χ̄₃` has image containing `−1≠1` on the local decomposition group at 3.
- `ordinaryThree_weight_two`: At `k=2` the determinant has form `ψχ₃`.
- `ordinaryThree_nonordinary_not_input`: Residual semisimplification `1⊕χ̄₃` alone does not imply the required ordinary inertia condition for the characteristic-zero lift.

([DP](<https://arxiv.org/pdf/2108.07577v2>) Theorem 1.7, p. 4 (arXiv v2).)

*Needs:* LocalGaloisDeformationRings §3.1; AutomorphicGaloisRepresentations §§4.5–4.7, 4.9; OrdinaryAutomorphicFormsAndModularityLifting §5.5; ArithmeticGaloisRepresentations §1.5; ArithmeticGaloisRepresentations §1.6; ArithmeticGaloisRepresentations §§1.5–1.9.

### 7.5 Consequences of non-solvable residual image

Let `ρ̄ : G_ℚ → GL₂(𝔽̄_p)` be continuous with non-solvable image, for any prime p, including `p = 2`. Then: `(i) ρ̄` is absolutely irreducible; (ii) for every finite Galois extension `K/ℚ` with solvable Galois group, `ρ̄|G_K` has non-solvable image and is absolutely irreducible; (iii) in particular `ρ̄|G_{ℚ(ζ_{p^n})}` is absolutely irreducible for every n, and for odd p the residual hypothesis of statement (a) holds. So the dyadic hypothesis of statement (b) survives the solvable base changes of Kisin's and Paškūnas' proofs.

Solvability is Mathlib's `Group.IsSolvable`. Subgroups and extensions: `Group.isSolvable_of_isSolvable_injective` and `Group.isSolvable_of_ker_le_range`.

A reducible subgroup preserves a line; in an adapted basis it is contained in Tau Ceti’s upper-triangular subgroup, whose solvability is already proved by UpperTriangularGroup.instIsSolvable. Solvability passes to subgroups and conjugates, giving (i). `Im(ρ̄|G_K)` is normal in Im `ρ̄`, with quotient a quotient of `Gal(K/ℚ)`. If it were solvable, Im `ρ̄` would be solvable. Then apply (i) to `ρ̄|G_K`; this gives (ii). `ℚ(ζ_{p^n})/ℚ` is abelian, and `ℚ(√p*) ⊂ ℚ(ζ_p)` (`TauCeti.Multiquadratic.exists_mem_sq_eq_oddPrimeDiscriminant`); this gives (iii).

The algebraic statements hold for any group G and field k, using Mathlib’s [Representation.IsIrreducible](https://github.com/leanprover-community/mathlib4/blob/6b7abb3c7686292736be2955bd3eb9ebf63b456a/Mathlib/RepresentationTheory/Irreducible.lean):

- `irreducible_of_nonsolvable_image`: For `ρ : Representation k G (Fin 2 → k)`, nonsolvability of the range of `ρ.asGroupHom` implies irreducibility.
- `nonsolvable_image_restriction`: If N is normal in G and `G/N` is solvable, the restriction to N retains nonsolvable image and is irreducible. Specializing to `k = 𝔽̄_p` gives the absolute irreducibility in (i)–(ii).

**Checks.**

- `p = 2: GL₂(𝔽₂) ≅ S₃` is solvable, so statement (b) excludes it, while `SL₂(𝔽₄) ≅ A₅` is not solvable.
- The converse fails: an absolutely irreducible dihedral `ρ̄` has solvable image.
- For `N = G`, the quotient is trivial and restriction retains the original nonsolvable image; for `N = {1}`, a solvable quotient G would force every image of G to be solvable, contradicting the hypothesis.

([DP](<https://arxiv.org/pdf/2108.07577v2>) Theorem 1.5, p. 4 (arXiv v2); [DP](<https://arxiv.org/pdf/2108.07577v2>) Proof of Theorem 1.5, p. 4 (arXiv v2).)

*Needs:* `Group.IsSolvable; Group.isSolvable_of_ker_le_range; Group.isSolvable_of_isSolvable_injective; TauCeti.UpperTriangularGroup.instIsSolvable; TauCeti.Multiquadratic.exists_mem_sq_eq_oddPrimeDiscriminant`.

### 7.6 Normalisation of distinct Hodge–Tate weights

Use the convention `HT(ε)=1`. If `ρ|G_{ℚ_p}` is de Rham with distinct Hodge–Tate weights a<b, then `ρ⊗ε^(−a)` is de Rham with weights {0,k−1}, where `k=b−a+1≥2`.

Use the tensor-product and cyclotomic-twist formula of PadicHodgeTheory §3.3 and its sign dictionary in §3.2; the arithmetic normalisation here computes its effect on the form weight.

Hodge–Tate weights shift by −a under `⊗ ε^{−a}`, because `HT(ε^{−a}) = −a` and Hodge–Tate weights add under tensor products.

Provide the following operations and compatibility statements.

- `normalizedWeight: k = b − a + 1` for weights `a < b`; invariant under a common shift `(normalizedWeight_shift)`, at least 2 when `a < b (two_le_normalizedWeight)`, and 1 for equal weights.

**Checks.**

- Hodge–Tate weights {3, 7} normalise to {0, 4}, so `k = 5`; the definition `b − a` without the `+ 1` would give 4, the wrong weight.
- Weights {0, 1} (the Tate module of an elliptic curve) give `k = 2`.
- Equal weights {4, 4} give 1, a weight-one value excluded by the hypothesis `a < b`; every lifting theorem here needs `k ≥ 2`.
- Shifting both weights by n, as twisting by `ε^n` does, leaves k unchanged: `{3 + n, 7 + n}` still gives 5.

([Kisin, FM](<https://people.math.harvard.edu/~kisin/dvifiles/fmc.dvi>) Introduction, the main theorem, p. 2 (DVI).)

*Needs:* LocalGaloisDeformationRings §3.1; PadicHodgeTheory §§3.2–3.6.

### 7.7 Which forms of the lifting theorems assume residual modularity

Each modern odd-prime lifting theorem is printed in two forms. (i) Forms that assume `ρ̄` modular: Kisin's Theorem (2.2.17) (published (2.2.18)), Hu–Tan's Theorem 6.3, Tung's Theorem 4.7 and Dieulefait–Pacetti's Theorem 1.4. (ii) Forms that assume only `ρ̄` odd, and take its modularity from Khare–Wintenberger's proof of Serre's conjecture: Kisin's introduction theorem, Hu–Tan's Theorem 1.4, Tung's introduction theorem, and Emerton's Theorem 1.2.4. Emerton's Theorem 1.2.4 gets promodularity from his Theorem 1.2.3, whose proof (§7.3) invokes Serre's conjecture. Only form (i) can serve in a proof of Serre's conjecture, so the statement table declares only form (i). Dieulefait–Pacetti cite the form-(ii) theorems (Corrections to the sources, E8), but their Theorem 1.4 assumes `ρ̄` modular, and its proof runs through form (i).

§12.4 records which proofs rely on Serre's conjecture. This target fixes which statements are admissible.

For each paper, locate the theorem that assumes `ρ̄` modular, and the step that deduces the introduction theorem from it by Khare–Wintenberger. Kisin: (2.2.17) and the sentence of the introduction on Khare–Wintenberger. Hu–Tan: Theorem 6.3 and the last line of its proof. Tung: Theorem 4.7, obtained by the method of Kisin and Hu–Tan. Emerton: Theorem 1.2.3 and §7.3.

**Checks.**

- Hu–Tan's Theorem 1.4 is their Theorem 6.3 plus Khare–Wintenberger.
- Emerton's Corollary 1.2.2 assumes V promodular, and his route to promodularity uses Serre's conjecture, so his Fontaine–Mazur route is not used.
- Tung's Theorem 4.7 covers `p = 3`.

([Kisin, FM](<https://people.math.harvard.edu/~kisin/dvifiles/fmc.dvi>) Introduction, p. 2 (DVI); [Kisin, FM](<https://people.math.harvard.edu/~kisin/dvifiles/fmc.dvi>) Theorem (2.2.17) (2), p. 45 (DVI); [Hu–Tan](<https://arxiv.org/pdf/1309.1658v2>) Proof of Theorem 6.3, p. 35 (arXiv v2); [Tung, odd p](<https://arxiv.org/pdf/1803.07451v4>) Theorem 4.7, p. 15 (arXiv v4); [Emerton, LGC](<http://www.math.uchicago.edu/~emerton/pdffiles/lg.pdf>) §7.3, proof of Theorem 1.2.3, p. 96.)

*Needs:* §7.1; §1.3; §7.2; §7.3; §7.4.

### 7.8 The local exclusions at p in the odd-prime sources, and how they are removed

For odd p, write `ρ̄_p = ρ̄|G_{ℚ_p}`. The sources exclude, as printed: (i) Kisin, in the introduction theorem and in `(2.2.17)(3): ρ̄_p ≅ (ωχ ∗; 0 χ)` for some character `χ`, where ∗ may be zero; and, in the introduction theorem and (2.2.17)(1), any `ρ` that is not semistable over an abelian extension of `ℚ_p`. The latter is where his Hypothesis (1.2.6) is known (Theorem (1.2.8), from Colmez and Berger–Breuil). (ii) Kisin (1.2.7): the lattice `Π` of (1.2.6) is constructed for every V except, at `p = 3, ρ̄_p ≅ (ω ∗; 0 1) ⊗ χ` or Ind `ω₂² ⊗ χ`. (iii) Emerton, Theorem 1.2.1 and Corollary `1.2.2: ρ̄_p ≅ χ ⊗ (1 ∗; 0 ω)`, where ∗ may be zero. (iv) Paškūnas (Duke 2015): `p ≥ 5` and `End(ρ̄_p)` scalar; his result is new only for `ρ̄_p ≅ (ω ∗; 0 1) ⊗ χ`. (v) Hu–Tan: `p ≥ 5`; new only for `ρ̄_p ≅ χ ⊗` (`1` ⊕ `ω`). (vi) Tung: `p > 2` and every `ρ̄_p`; new for `p = 3` and `ρ̄_p a` twist of an extension of 1 by `ω`. Emerton's Theorem 3.3.22 gives the locally algebraic vectors of every de Rham V with distinct weights, which removes the abelian condition in (i). Tung's Theorem 1.2, the Breuil–Mézard conjecture for every `ρ̄_p` and every `p > 2`, removes the exclusions of (i) and (ii). Pan's `p = 3` exclusion, `χ̄₁χ̄₂^{−1}|G_{ℚ₃} = ω`, is of another kind: it is a residually reducible global case, covered by Layer 11.

The local theorems (Breuil–Mézard in cycle form, Colmez's functor, locally algebraic vectors) are inputs LL1–LL3 (Conditional arithmetic hypotheses).

Tabulate each source's exclusion with its locator. For each `ρ̄_p`, name a source that covers it: `p ≥ 5` by Kisin, Paškūnas and Hu–Tan; `p = 3` by Tung.

**Checks.**

- `p = 3, ρ̄_p = 1` ⊕ `ω`: excluded by (i) and (iii), covered only by (vi).
- `p ≥ 5, ρ̄_p = 1` ⊕ `ω`: excluded by (i) and (iii), covered by (v) and (vi).
- `p ≥ 5, ρ̄_p` absolutely irreducible: covered by Kisin together with Emerton's Theorem 3.3.22.

([Kisin, FM](<https://people.math.harvard.edu/~kisin/dvifiles/fmc.dvi>) Introduction, the main theorem (2)–(4), p. 2 (DVI); [Kisin, FM](<https://people.math.harvard.edu/~kisin/dvifiles/fmc.dvi>) (1.2.7), p. 9 (DVI); [Paškūnas, BM](<https://arxiv.org/pdf/1209.5205v3>) Abstract, p. 1 (arXiv v3); [Hu–Tan](<https://arxiv.org/pdf/1309.1658v2>) Introduction, after Theorem 1.4, p. 5 (arXiv v2); [Tung, odd p](<https://arxiv.org/pdf/1803.07451v4>) Remark 4.8, p. 15 (arXiv v4); [Emerton, LGC](<http://www.math.uchicago.edu/~emerton/pdffiles/lg.pdf>) Theorem 3.3.22, p. 28.)

*Needs:* §7.1; hypotheses LL1–LL3 (Conditional arithmetic hypotheses); §7.2; §7.3; §7.4.

### 7.9 The weight of a normalised modular twist

Suppose `k,k′≥2, ρ` has Hodge–Tate weights {0,k−1}, g is a cuspidal eigenform of weight k′, `χ=ε^m μ` with `μ` finite order, and `ρ≅ρ_g⊗χ`. Then `m=0, k′=k`, and `ρ≅ρ_{g⊗μ}`, where `g⊗μ` is an eigenform of weight k.

`ρ_g ⊗ ε^m μ` has Hodge–Tate weights `{m, m + k′ − 1}` (AutomorphicGaloisRepresentations §§4.5–4.7, 4.9).

Twisting an eigenform by a Dirichlet character gives an eigenform of the same weight.

The global finite-order Galois character corresponds to a Dirichlet character; `k,k′≥2` fix the order of the two weights.

Compare `{m, m + k′ − 1}` with `{0, k − 1}`: then `m = 0` and `k′ = k`. Twisting g by the Dirichlet character corresponding to `μ` gives the representation `ρ_g⊗μ`; this compatibility is the Dirichlet-twist and primitive-associate statement of TauCetiRoadmap ModularForms Layer 9, combined with Frobenius-polynomial recognition (ArithmeticGaloisRepresentations Layer 5).

**Checks.**

- Weights {0,4} of a twist of a weight-five form force cyclotomic exponent zero.
- Distinct weights exclude a weight-one witness.
- A general character twist is not automatically finite order times cyclotomic without §7.11.

(Weight comparison proved here from PadicHodgeTheory §§3.2–3.6 and AutomorphicGaloisRepresentations §§4.5–4.7, 4.9; newform twisting from ModularForms Layer 9 and Frobenius recognition from ArithmeticGaloisRepresentations §§5.3–5.7. The source conclusions normalized are [Tung, odd p](<https://arxiv.org/pdf/1803.07451v4>) Theorem 4.7, p.15; [Tung, dyadic](<https://arxiv.org/pdf/1908.06174v3>) Theorem 8.0.3; [Pan](<https://arxiv.org/pdf/1901.07166v2>) Theorem 1.0.2, p.3.)

*Needs:* §7.6; AutomorphicGaloisRepresentations §§4.5–4.7, 4.9; PadicHodgeTheory §§3.2–3.6; AutomorphicGaloisRepresentations §§3.10–3.14; TauCetiRoadmap ModularForms, Layer 9; ArithmeticGaloisRepresentations §§5.3–5.7.

### 7.10 Oddness of a lift at odd residue characteristic

Let `ρ:G_ℚ→GL₂(𝒪)` and c be complex conjugation, where `𝒪` has characteristic zero and residue characteristic p>2. If the reduction `ρ̄` is odd then `ρ` is odd.

`ρ` takes values in `GL₂` over a valuation ring with residue characteristic p>2; determinant commutes with reduction.

`c² = 1` gives `det ρ(c) ∈` {±1}, and its reduction `det ρ̄(c) = −1 ≠ 1` when p is odd.

Provide the following operations and compatibility statements.

- `odd_det_of_odd_reduction`: Over a domain R with `φ : R → k` to a field with `2 ≠ 0`, an involution c whose reduction has determinant −1 has determinant −1.

**Checks.**

- `p = 3: −1 ≠ 1` in `𝔽₃`.
- `p = 2`: diag(1, −1) is odd and reduces to the identity (§6.2).
- The domain hypothesis is needed: over `ℤ × ℤ` the involution `c =` diag((1, 1), (−1, 1)) has determinant (−1, 1), whose image under the first projection followed by reduction to `𝔽₃` is −1, although `det c ≠ −1`.

([Tung, odd p](<https://arxiv.org/pdf/1803.07451v4>) Theorem 4.7 (1), p. 15 (arXiv v4).)

*Needs:* `ZMod.neg_one_ne_one`; §6.2.

### 7.11 Geometric twists of modular representations

Let p be a prime, `ρ : G_ℚ → GL₂(ℚ̄_p)` continuous, finitely ramified and de Rham at p with distinct Hodge–Tate weights. Let h be a normalized cuspidal newform of weight `k_h ≥ 1` with p-adic representation `ρ_h` (for fixed embeddings of its coefficient field), and `χ : G_ℚ → ℚ̄_p^× a` continuous character with `ρ ≅ ρ_h ⊗ χ`. Then `k_h ≥ 2`, and `χ = ε^m μ` for an integer m and a character `μ` of finite order, which is the Galois character of a Dirichlet character under the fixed embeddings. After normalizing ρ by §7.6, §7.9 applies to the normalized representation and the adjusted twist `χε^{−a}`, where a is the smaller weight of ρ.

Hodge–Tate weights are normalized by `HT(ε) = 1`. Distinctness of the weights of `ρ` is used only to exclude weight one; for `k_h ≥ 2` the conclusion on `χ` needs only that `ρ` is de Rham.

`χ` is an arbitrary continuous character: no finite-order or algebraicity assumption is made on it.

In characteristic zero the trace splits the unit map, so the trivial representation is a direct summand of `ρ_h^∨ ⊗ ρ_h`; hence `χ` is a direct summand of `ρ_h^∨ ⊗ ρ ≅ ρ_h^∨ ⊗ ρ_h ⊗ χ. ρ_h|G_{ℚ_p}` is de Rham: for `k_h ≥ 2` with Hodge–Tate weights `{0, k_h − 1}` (AutomorphicGaloisRepresentations §§4.5–4.7, 4.9); for `k_h = 1` it has finite image (AutomorphicGaloisRepresentations §2.10), hence is potentially unramified, de Rham with weights {0, 0}. De Rham representations are stable under duals, tensor products and direct summands (PadicHodgeTheory §3.3 and admissible-category-tannakian), so `χ|G_{ℚ_p}` is de Rham. A de Rham character of `G_{ℚ_p}` is `ε^m` times a character that is finite on inertia (PadicHodgeTheory §3.6). Put `μ = χε^{−m}`. It is finite on `I_p`; at a prime ℓ `≠ p` of the ramification set its restriction to inertia factors through `ℤ_ℓ^×`, whose pro-ℓ part has finite image in `ℚ̄_p^×`; and it is unramified elsewhere. By Kronecker–Weber, `G_ℚ^{ab} ≅ ℤ̂^×` through the cyclotomic character, so `μ` is trivial on an open subgroup of `ℤ̂^×` and has finite order; it is the Galois character of a Dirichlet character (ArithmeticGaloisRepresentations §§1.2, 1.10). If `k_h = 1` then `ρ ≅ ρ_h ⊗ ε^m μ` has Hodge–Tate weights {m, m}, contradicting distinctness. Hence `k_h ≥ 2`.

**Checks.**

- Weight one is excluded: for an Artin representation `ρ_h`, every geometric twist `ρ_h ⊗ ε^m μ` has equal weights {m, m}.
- A character of `G_ℚ` factoring through `Gal(ℚ(μ_{p^∞})/ℚ) ≅ ℤ_p^×` and sending the generator `1+p` of `1 + pℤ_p` (`p` odd) to a unit u with u not of the form `(1+p)^m` times a root of unity is not de Rham; its twist of `ρ_h` is not de Rham, so it does not satisfy the hypothesis.
- For `ρ = ρ_f ⊗ ε^{−a}` with f of weight k, this theorem returns `m = −a` and `μ = 1`. Normalizing by the smaller weight `−a` gives `ρ_f`, with adjusted twist 1; §7.9 then fixes k.
- At `p=3`, `−2` also generates `1+3ℤ₃`. The cyclotomic character sends it to `−2` and is crystalline, although `−2` is not `4^m` times a root of unity for any integer m; the comparison must use the same generator on both sides.

(Geometric-character deduction proved here from PadicHodgeTheory §§3.3–3.6, ArithmeticGaloisRepresentations §§1.2, 1.10 and ClassFieldTheory Layer 13. The up-to-twist conclusions are [Tung, odd p](<https://arxiv.org/pdf/1803.07451v4>) Theorem 4.7, p.15; [Tung, dyadic](<https://arxiv.org/pdf/1908.06174v3>) Theorem 8.0.3; [Pan](<https://arxiv.org/pdf/1901.07166v2>) Theorem 1.0.2, p.3.)

*Needs:* AutomorphicGaloisRepresentations §§4.5–4.7, 4.9; AutomorphicGaloisRepresentations §2.10; PadicHodgeTheory §3.3; PadicHodgeTheory §§3.3–3.5; PadicHodgeTheory §3.6; ArithmeticGaloisRepresentations §§1.2, 1.10; TauCetiRoadmap ClassFieldTheory, Layer 13; §7.6.

### Examples

Weights {3, 7} normalise to {0, 4}, so `k = 5` (§7.6). Weights {0, 4} of a twist of a weight-five form force cyclotomic exponent zero (§7.9). At `p = 3` both residual conditions concern `ℚ(√−3) = ℚ(ζ₃)`.

### Dependencies

Layers 1, 6 of this roadmap; ArithmeticGaloisRepresentations (Layer 1; §§1.2, 1.10, 2.1–2.4, 4.1; Layer 5); AutomorphicGaloisRepresentations (Layers 1–2; §§3.10–3.14; §§4.5–4.9); LocalGaloisDeformationRings (Layer 3); Mathlib and Tau Ceti (`Group.IsSolvable, Group.isSolvable_of_isSolvable_injective, Group.isSolvable_of_ker_le_range, TauCeti.UpperTriangularGroup.instIsSolvable, TauCeti.Multiquadratic.oddPrimeDiscriminant, TauCeti.Multiquadratic.exists_mem_sq_eq_oddPrimeDiscriminant, ZMod.neg_one_ne_one`); OrdinaryAutomorphicFormsAndModularityLifting (Layer 5); PadicHodgeTheory (§§3.2–3.6); hypotheses LL1–LL3; TauCetiRoadmap ClassFieldTheory (Layer 13); TauCetiRoadmap ModularForms (Layer 9).

## Layer 8: Odd-prime de Rham lifting

In this layer only, put `Σ_p=Σ∪{v|p}`. The local tensor product in `R̄∞` runs over this union. The extra Iwahori places defining R lie in `S∖Σ_p`, disjoint from the prescribed Steinberg set Σ.

Prove regular de Rham lifting at every odd prime through Kisin's multiplicity method as Gee–Kisin's Appendix B corrects it: the patched Serre-weight filtration and the corrected generic `rank 2^{|R|}` (§8.1, §8.2), Kisin's multiplicity criterion (§8.3), support of the patched weight quotients and the multiplicity bound for graded pieces (§8.4, §8.5), Kisin's Fontaine–Mazur theorem over totally split fields (§8.6), and the de Rham lifting theorem with the Breuil–Mézard inputs of Paškūnas, Hu–Tan and Tung (§8.7). Over `ℚ` this gives Dieulefait–Pacetti's Theorem 1.4 at every odd prime, 3 included (§8.8), and the list of what an application must check (§8.9).

### 8.1 Patched Serre-weight filtration

Fix a stable integral lattice `σ°` in the tensor product of local algebraic types and a Jordan–Hölder filtration `0=σ^0⊂⋯⊂σ^q=σ°/π` with factors `σ_i=⊗_{v|p}σ_{n_{i,v},m_{i,v}}`. At the corrected non-Eisenstein levels, exactness of the coefficient-form functor gives a filtration of every auxiliary module modulo `π`. Stabilize these filtrations and their inclusions with the patching data. The limit is `0=M∞^0⊂⋯⊂M∞^q=M∞/πM∞`; its graded terms `N_i` are patched modules for `σ_i` with their compatible maps from the corresponding weight deformation rings `R̄^i_∞`.

`p > 2` is totally split in F, `ρ̄|G_{F(ζ_p)}` is absolutely irreducible, `𝔪` is non-Eisenstein and `S_{σ,ψ}(U,O)_𝔪 ≠ 0`; U satisfies Kisin's (2.1.2), under which `S_{σ,ψ}(U, A)` is finite projective and `W_σ` ↦ `S_{σ,ψ}(U, A)` is exact (p. 36).

Import exactness of the localized coefficient functor and the chosen integral type lattices. Apply it to the filtration at each finite auxiliary level. Include the finitely many filtration maps and their action compatibilities in structured stabilization. The finite module transition maps are surjective; use the exact inverse-limit criterion of the patching algebra to preserve each short exact sequence. Retain the factorization through the weight-specific deformation ring on each quotient; this is needed to state its support correctly.

Provide the following operations and compatibility statements.

- `patchedWeightFiltration`: The finite filtration of `M∞/πM∞` induced by the fixed type-lattice filtration, with all scalar actions.
- `patchedWeightFiltration_graded`: Its i-th quotient is the patched weight-σ_i module `N_i` over `R̄^i_∞`.
- `patchedWeightFiltration_specialise`: Augmentation specializes the filtration, inclusions and graded terms to the localized coefficient-form filtration.

**Checks.**

- `weightFiltration_single`: For an irreducible lattice reduction there is one term `N_1=M∞/πM∞`.
- `weightFiltration_repeated`: Repeated Jordan–Hölder factors retain their multiplicities; replacing the filtration by the set of distinct weights changes its additive multiplicity.
- `weightFiltration_exact`: At every step the inclusion and quotient maps form a short exact sequence of modules with the specified deformation action.
- If `σ°/π` is irreducible the filtration has one step, `N_1 = M∞/πM∞`.
- The filtration is of `M∞ ⊗ 𝔽`, not of `M∞`: its graded pieces are modules over `R̄∞/π`.

([Kisin, FM](<https://people.math.harvard.edu/~kisin/dvifiles/fmc.dvi>) §2.2, filtration of `M∞ ⊗ 𝔽`, pp. 40–41 (DVI); Proposition (2.2.14), pp. 44–45 (DVI).)

*Needs:* §3.3; §5.6; HilbertModularVarietiesAndShimuraCurves §§R18.3.1–R18.3.32; SerreWeightAndLevelOptimisation §§6.6–6.11; DeformationAndDerivedPatchingAlgebra §§5.3–5.4.

### 8.2 Corrected generic rank of a patched type module

In the corrected Kisin §2.2 setup, with p>2 completely split in F, residual absolute irreducibility on `G_{F(ζ_p)}`, a nonzero modular localization and trivial isotropy, impose at `v∈S∖Σ_p` that 1−N(v) is a unit and the residual eigenvalue ratio is not `N(v)^{±1}`. Equal eigenvalues are allowed. Let `R ⊂ S∖Σ_p` be the set of places at which `ρ̄(Frob_v)` has equal eigenvalues, and `r=2^{|R|}`. For every prime q of `R̄∞` in `Supp M∞, dim_{κ(q)}(M∞⊗κ(q))≥r`, with equality when q is a minimal prime of `R̄∞` in that support. `M∞` is free of rank r on the smooth locus of each supported component. Smoothness is required only at the relevant automorphic points, not at every potentially semistable point.

The places of S ∖ `Σ_p` are those where `U_v` is not maximal compact; `R ⊂ S` ∖ `Σ_p` is the set of those v at which the eigenvalues of `ρ̄(Frob_v)` are equal. Kisin's condition (2.1.2) on U is kept.

The patched module is free over the regular scalar power-series ring, so its support is a union of top-dimensional components, each surjecting to that scalar base. At augmentation points import local–global compatibility and the purity/monodromy–weight statement for principal-series and Steinberg local factors. The local deformation geometry then makes those points smooth. These precise arithmetic inputs are arithmetic refinements proved here using their suppliers (see the supplier contracts), not consequences of generic smoothness for potentially crystalline rings. On the smooth locus use the finite-level automorphic rank r and the patching specialization. Upper semicontinuity of fibre dimension gives the lower bound at all supported primes.

**Checks.**

- If `R = ∅` the rank is one, which is Kisin’s DVI Lemma (2.2.10), published Lemma (2.2.11).
- Gee–Kisin's footnote 4: omitting the `U_{π_w}` for `w ∈ S` ∖ `Σ_p` from the Hecke algebra gives `rank 2^{|R|}` with `R = S` ∖ `Σ_p`.
- A prescribed Steinberg place `v∈Σ`, `v∤p`, belongs to `Σ_p` and contributes its fixed-character local deformation factor; it cannot also be counted among the extra equal-root Iwahori places in R.

([Gee–Kisin](<https://arxiv.org/pdf/1208.3179v5>) Appendix B, Lemma B.5.1 and proof, pp. 39–40.)

*Needs:* §5.6; §3.5; LocalGaloisDeformationRings §3.9; AutomorphicGaloisRepresentations §§4.5–4.7, 4.9; HilbertModularVarietiesAndShimuraCurves §§R18.3.1–R18.3.32; LocalGaloisDeformationRings Layer 3; AutomorphicGaloisRepresentations §§4.5–4.9.

### 8.3 Kisin's multiplicity criterion for faithfulness of the patched module, as corrected by Gee–Kisin

Let p be odd and F totally real with p split completely. Let D/F be a totally definite quaternion algebra ramified at a set `Σ` of finite places prime to p, with N(v) ≢ −1 (mod p) for `v ∈ Σ`. Let `M∞` be the patched module over `R̄∞ = R̄^{□,ψ}_{Σ_p}`[[`x₁, …, x_g`]], built from `S_{σ,ψ}(U, 𝒪)_𝔪` with `σ = ⊗_{v|p} σ(k_v, τ_v) ⊗ det^{w_v}`. Here `R̄_v` is the ring of extensions of `γ_v` by `γ_v(1)` for `v ∈ Σ`, and the potentially semistable ring of type `(k_v, τ_v, ψ)` for `v | p`. Let R be the set of `v ∈ S` ∖ `Σ_p` at which `ρ̄(Frob_v)` has equal eigenvalues. Then `M∞` is faithful over `R̄∞` ⟺ `e(R̄∞/π) = 2^{−|R|} e(M∞/π, R̄∞/π)` ⟺ `e(R̄∞/π) ≤ 2^{−|R|} e(M∞/π, R̄∞/π)`. When these hold, every deformation `ρ` of `ρ̄` of the given local types (`ρ|I_v` an extension of `γ_v` by `γ_v(1)` at `v ∈ Σ`, potentially semistable of type `(k_v, τ_v, ψ)` at `v | p`) is modular.

Kisin's statements are used as Gee–Kisin Appendix B corrects them: N(v) ≢ −1 (mod p) at `v ∈ Σ` (`B.3`; Corrections to the sources, E4); `R̄_v/π` irreducible and generically reduced at `v ∈ Σ (B.4, E5)`; and the `rank 2^{|R|}` in place of rank one, with Lemma (2.2.1) withdrawn (B.5, E6).

The Breuil–Mézard multiplicities, and the Hilbert–Samuel and cycle formalism, are inputs LL1–LL3 (Conditional arithmetic hypotheses).

The patching itself is Layer 3 and §5.6, with the local rings of LocalGaloisDeformationRings Layer 3.

Use the corrected Kisin §2.2 setup in Gee–Kisin B.5: for `v∈S∖Σ_p`, 1−N(v) is a unit and the eigenvalue ratio is not `N(v)^{±1}`; equal eigenvalues are allowed. Retain absolute residual irreducibility on `G_{F(ζ_p)}`, nonzero modular Hecke localization, the isotropy condition and the full finite-level/filtration data.

Use the separately specified corrected generic-rank theorem, including purity and the `rank r=2^{|R|}`. The faithful action image is supported on a union of components. Apply Hilbert–Samuel additivity and associativity to that union, using local reducedness and the characteristic-zero rank calculation. The normalized multiplicity is bounded above by the ring multiplicity and equals it exactly when no component is missing. Full support and reducedness identify the action image with the deformation ring. Augment to recover the Hecke action and modularity of every point satisfying the displayed local types.

**Checks.**

- With `R = ∅` this is Kisin’s DVI Lemma (2.2.10), published Lemma (2.2.11), with rank one.
- A place `v ∈ Σ` with `N(v) ≡ −1 (mod p)` is excluded (B.3). Base change reduces to `N(v) ≡ 1`.
- The global argument alone gives only `e(𝕋∞/π) ≤ e(R̄∞/π)`; the reverse inequality is the local input.

([Kisin, FM](<https://people.math.harvard.edu/~kisin/dvifiles/fmc.dvi>) §2.2, before Lemma (2.2.10), p. 42 (DVI); [Kisin, FM](<https://people.math.harvard.edu/~kisin/dvifiles/fmc.dvi>) Corollary (2.2.16), p. 45 (DVI); [Gee–Kisin](<https://arxiv.org/pdf/1208.3179v5>) Appendix B, B.5, p. 39 (arXiv v5); [Gee–Kisin](<https://arxiv.org/pdf/1208.3179v5>) Appendix B, B.3, p. 38 (arXiv v5).)

*Needs:* §3.4; §3.5; §5.6; LocalGaloisDeformationRings §3.4; LocalGaloisDeformationRings §3.9; hypotheses LL1–LL3 (Conditional arithmetic hypotheses); §8.2; DeformationAndDerivedPatchingAlgebra §§3.11–3.13; DeformationAndDerivedPatchingAlgebra §§6.7–6.8.

### 8.4 Support of a patched weight quotient

For the filtration `N_i=M∞^i/M∞^{i−1}, N_i≠0` exactly when `μ_{n_{i,v},m_{i,v}}(ρ̄_v)≠0` at every v|p. When nonzero its support is all of `Spec R̄^i_∞`, the corresponding weight deformation ring, viewed inside `Spec R̄∞/π`. At every prime of that support its fibre dimension is at least `r=2^{|R|}`. This does not assert support on all components of `R̄∞/π`.

As for §8.1 and §8.2; `σ_i = ⊗_{v|p} σ_{n_{i,v},m_{i,v}}` are the graded pieces, and `R̄^i_∞` is the patched deformation ring of the corresponding weight (Kisin's Proposition (2.2.14), DVI; (2.2.15) in print).

Use the weight theorem and Kisin’s weight-specific support calculation, Proposition (2.2.14) of the DVI ((2.2.15) in print), with the B.5 correction, for nonvanishing and full support on `R̄^i_∞`. Use the auxiliary irreducible smooth characteristic-zero representation `σ̃_i` of `∏GL₂(κ(v))`, with `σ_i` in its reduction and `S_{σ̃_i,ψ}(U,O)_m⊗k≅S_{σ_i,ψ}(U,k)_m` as in Gee §§4.6.3–4.6.6. Keep the chosen lattice and localized comparison maps. Apply the corrected generic-rank theorem to `σ̃_i` and transport the lower bound through the coefficient comparison and patching.

**Checks.**

- If `μ_{n_{i,v},m_{i,v}}(ρ̄|G_{F_v}) = 0` for one `v | p` then `N_i = 0`.
- The support statement is for `Spec R̄^i_∞; N_i` need not be supported on the other components of `Spec R̄∞/π`.

([Gee–Kisin](<https://arxiv.org/pdf/1208.3179v5>) Appendix B, Lemma B.5.2 and proof, pp. 40–41.)

*Needs:* §8.1; §8.2; SerreWeightAndLevelOptimisation §§6.6–6.11; hypotheses LL1–LL3 (Conditional arithmetic hypotheses).

### 8.5 The corrected multiplicity bound for patched graded pieces

Use the corrected Kisin §2.2 patching setup of §8.3, and its patched weight filtration `M∞^i`. Write `N_i=M∞^i/M∞^{i−1}`. Then `N_i≠0` iff `μ_{n_{i,v},m_{i,v}}(ρ̄_v)≠0` for all v|p. If nonzero, every fibre on its support has dimension at least `2^{|R|}`. If, in addition, no `ρ̄_v` is a twist of (`ω` ∗;0 1), then `2^(−|R|)e(N_i,R̄∞/π)≥e_Σ∏_{v|p}μ_{n_{i,v},m_{i,v}}(ρ̄_v)`, where `e_Σ=∏_{v∈Σ}e(R̄_v/π)`.

The corrections of Gee–Kisin Appendix B (E4–E6), the inputs LL1–LL3 and the corrected Kisin §2.2 setup are as in §8.3. The stronger exclusion at `v | p` is needed for the displayed graded-piece bound.

Apply §8.4 to obtain exactly its weight-specific full-support conclusion and the fibre bound `r=2^{|R|}`. Under the additional local exclusion, apply the local Breuil–Mézard input and generic reducedness of the `Σ` factors to the multiplicity associativity formula. This gives `r⁻¹e(N_i)≥e_Σ∏μ`, with the same normalization for every filtration term. No equality is inferred.

**Checks.**

- The formula is an inequality, not equality.
- The bound carries the factor `2^(−|R|)`.
- The local excluded extension shape is needed for the multiplicity inequality, not for the two preceding statements.

([Gee–Kisin](<https://arxiv.org/pdf/1208.3179v5>) Appendix B, Lemma B.5.2 and final correction paragraph, pp. 40–41 (arXiv v5).)

*Needs:* §8.3; hypotheses LL1–LL3 (Conditional arithmetic hypotheses); SerreWeightAndLevelOptimisation §§6.6–6.11; §8.1; §8.4; DeformationAndDerivedPatchingAlgebra §§3.11–3.13; DeformationAndDerivedPatchingAlgebra §§6.7–6.8.

### 8.6 Kisin's Fontaine–Mazur theorem over totally split fields (Theorem (2.2.17))

Assume LL1–LL3 and CC4–CC5. Let `p > 2`, F totally real with p totally split, and `ρ : G_{F,S} → GL₂(𝒪)` continuous with: (1) for every `v | p, ρ|G_{F_v}` becomes semistable over an abelian extension of `F_v` and has distinct Hodge–Tate weights; `(2) ρ̄` is modular and `ρ̄|G_{F(ζ_p)}` is absolutely irreducible; (3) for every `v | p, ρ̄|G_{F_v}` ≇ `(ωχ ∗; 0 χ)` for all characters `χ`. Then `ρ` is modular up to a global character twist, with the Hilbert weight and central-character convention above. Over `ℚ`, weights `{0,k−1}` give an actual weight-k newform by §§7.11 and 7.9. This is Theorem (2.2.17) of the preprint, (2.2.18) in print. The abelian condition in (1) is where Kisin's Hypothesis (1.2.6) is known (Theorem (1.2.8)). Emerton's Theorem 3.3.22 establishes (1.2.6) for every de Rham type, which removes the condition (Emerton, Remark 1.2.5).

Gee’s Theorem 4.6.9 (the older citation is numbered 4.4.12) of 'Automorphic lifts of prescribed types' makes `ρ̄` modular of weight `σ` once `μ_Aut ≠ 0`. It is an arithmetic refinement proved here using SerreWeightAndLevelOptimisation §§6.6–6.11.

The choice of U and of the auxiliary primes follows Gee–Kisin B.5 (Corrections to the sources, E6), not Kisin's Lemma (2.2.1).

The local inequality `e(R̄_v/π) ≤ μ_Aut` (Kisin §§1.6–1.7, through Colmez's functor and (1.2.6)) is the explicit hypothesis LL2, with LL3 (Conditional arithmetic hypotheses).

Make a quadratic base change so that `[F : ℚ]` is even, and let D be the definite quaternion algebra split at all finite places. The existence of `ρ` gives `μ_Aut(k_v, τ_v, ρ̄ ⊗ ω^{−w_v}) ≠ 0` (Kisin (1.7.2), (1.7.8), (1.7.9)). Gee's theorem then makes `ρ̄` modular of weight `σ`. Kisin's local inequality `e(R̄_v/π) ≤ μ_Aut` and §8.3 give faithfulness for the normalized Hilbert weight and character, so `ρ` is modular up to the global twist at the auxiliary level (Corollary (2.2.16)). Level raising and lowering at v ∤ p, and descent by the base change arguments of Kisin's Annals §3.5 (§5.3).

**Checks.**

- At `F=ℚ`, `p=7`, take the conductor-32 curve `C:y²=x³−x` and `ρ=V₇(C)⊗ε₇⁶`. Counting gives `#C(𝔽₇)=8`, so C is supersingular; ρ is odd and crystalline with weights `{6,7}`. Since `ω₇⁶=1`, its modular residual witness is unchanged. Its inertia characters are `ω₂,ω₂⁷`; their ratio has order four on cyclotomic inertia and Frobenius exchanges the eigenlines, giving absolute irreducibility on `G_{ℚ₇(ζ₇)}`. Thus all residual hypotheses hold, but exact classical newform modularity fails until the twist is removed.
- Excluded: `ρ̄|G_{ℚ_p} ≅ 1` ⊕ `ω (χ = 1, ∗ = 0)`. Hu–Tan `(p ≥ 5)` and Tung `(p = 3)` cover it.
- Numbering: the published version is (2.2.18), the DVI's is (2.2.17).

([Kisin, FM](<https://people.math.harvard.edu/~kisin/dvifiles/fmc.dvi>) Theorem (2.2.17), p. 45 (DVI); [Kisin, FM](<https://people.math.harvard.edu/~kisin/dvifiles/fmc.dvi>) Proof of Theorem (2.2.17), p. 46 (DVI); [Kisin, FM](<https://people.math.harvard.edu/~kisin/dvifiles/fmc.dvi>) Hypothesis (1.2.6), p. 9 (DVI); [Emerton, LGC](<http://www.math.uchicago.edu/~emerton/pdffiles/lg.pdf>) Theorem 3.3.22, p. 28; [Gee, types](<https://www.ma.imperial.ac.uk/~tsg/Index_files/prescribedlifts.pdf>) Theorem 4.6.9 and Remark 3.1.6, author pp. 26 and 11.)

*Needs:* hypotheses CC4–CC5 (Conditional arithmetic hypotheses); §8.3; §5.3; §§7.8–7.9, 7.11; LocalGaloisDeformationRings §3.4; hypotheses LL1–LL3 (Conditional arithmetic hypotheses); SerreWeightAndLevelOptimisation §§6.6–6.11; §8.5.

### 8.7 Modularity lifting for de Rham representations at odd p (Kisin, Emerton, Paškūnas, Hu–Tan, Tung)

Let p be an odd prime, F a totally real field in which p splits completely, and `ρ : G_{F,S} → GL₂(𝒪)` continuous with: `(1) ρ̄` modular, so that `ρ` and `ρ̄` are odd; `(2) ρ̄|G_{F(ζ_p)}` absolutely irreducible; `(3) ρ|G_{F_v}` potentially semistable with distinct Hodge–Tate weights for every `v | p`. Then, up to twist, `ρ` comes from a Hilbert modular eigenform. This is Tung's Theorem 4.7, and for `p ≥ 5` Hu–Tan's Theorem 6.3. It has no local restriction at p, and it includes `p = 3`.

The local input is the Breuil–Mézard conjecture in cycle form for every `ρ̄_v` and every p-adic Hodge type, for `p > 2`. This is Tung's Theorem 1.2; for `p ≥ 5` it also follows from Kisin, Paškūnas' Theorem 1.1 and Hu–Tan. This is input LL1 (Conditional arithmetic hypotheses).

Tung's proof of Theorem 1.2 uses: the patched modules `M∞` of [CEG+16] on definite unitary groups; Emerton–Paškūnas' faithfulness of `R∞` on `M∞`; and, on the reducible locus, Barnet-Lamb–Gee–Geraghty's Theorem A.4.1. They are input CC4 (Conditional arithmetic hypotheses); the independence of their globalisations from Serre's conjecture is input CC5 (§12.4).

Breuil–Mézard for every `ρ̄_v, v | p` (Tung Theorem 1.2). For exceptional `ρ̄_v` one cannot apply the nonexceptional bound in §8.5. Hu–Tan §6 uses different local factors including semistable noncrystalline components, and proves full support in Lemma 6.1 before Proposition 6.2. The all-odd-prime conclusion is Tung Theorem 4.7 using his Breuil–Mézard/component results. These support and globalisation inputs are the conditional inputs CC4 and CC5. The general case follows by the base change arguments of Kisin's Theorem (2.2.18) (§8.6).

**Checks.**

- `p = 3, ρ̄|G_{ℚ₃} ≅ (ω ∗; 0 1) ⊗ χ`: covered (Tung, Remark 4.8).
- `p ≥ 5, ρ̄|G_{ℚ_p} ≅ χ ⊗` (`1` ⊕ `ω`): covered (Hu–Tan).
- Non-example: `ρ̄|G_{F(ζ_p)}` reducible (bad dihedral) is not covered.

([Tung, odd p](<https://arxiv.org/pdf/1803.07451v4>) Theorem 4.7, p. 15 (arXiv v4); [Tung, odd p](<https://arxiv.org/pdf/1803.07451v4>) Theorem 1.2, p. 4 (arXiv v4); [Hu–Tan](<https://arxiv.org/pdf/1309.1658v2>) Theorem 6.3, p. 35 (arXiv v2); [Hu–Tan](<https://arxiv.org/pdf/1309.1658v2>) §6, p. 33 (arXiv v2).)

*Needs:* §8.3; §8.6; §7.8; §7.7; hypotheses LL1–LL3 (Conditional arithmetic hypotheses); hypothesis CC4 (Conditional arithmetic hypotheses); §8.5; hypothesis CC5 (Conditional arithmetic hypotheses).

### 8.8 Dieulefait–Pacetti's Theorem 1.4 holds at every odd prime, including 3

Assume LL1–LL3 and CC4–CC5. `OddPrimeLifting`(p) (§7.1, statement (a)) holds for every odd prime p. Let `ρ : G_ℚ → GL₂(ℚ̄_p)` be continuous, odd and finitely ramified, with `ρ̄|G_{ℚ(√p*)}` absolutely irreducible, `ρ|G_{ℚ_p}` de Rham with Hodge–Tate weights `{0, k − 1}, k > 1`, and `ρ̄ ≅ ρ̄_f`. Then `ρ ≅ ρ_g` for an eigenform g of weight k. The case `p = 3` is proved, not assumed.

De Rham representations are potentially semistable (PadicHodgeTheory §§5.1–5.3).

Apply ArithmeticGaloisRepresentations §1.5 to the compact image (a statement about continuous representations of a profinite group, not a consequence of compactness for arbitrary subsets of `ℚ̄_p`), then ArithmeticGaloisRepresentations §1.6 and ArithmeticGaloisRepresentations §§1.5–1.9, to conjugate `ρ` into `GL₂(𝒪)` for a finite extension `E/ℚ_p` without changing the residual semisimplification after coefficient extension. The p-adic monodromy theorem of PadicHodgeTheory §§5.1–5.3 converts de Rham to potentially semistable. Apply §8.7 with `F = ℚ: ρ ≅ ρ_g ⊗ χ`. Normalise the twist by §7.11 and §7.9: `ρ ≅ ρ_{g′}` with g′ of weight k.

**Checks.**

- `p = 3`: the hypothesis is over `ℚ(√−3) = ℚ(ζ₃)`.
- `k = 2` with `ρ|G_{ℚ_p}` semistable and not crystalline, such as the p-adic Tate module of an elliptic curve with multiplicative reduction at p: covered. This is not a potentially Barsotti–Tate case, so Kisin's Annals theorem (§5.7) does not reach it.

([DP](<https://arxiv.org/pdf/2108.07577v2>) Theorem 1.4 and its proof, p. 4 (arXiv v2); [DP](<https://arxiv.org/pdf/2108.07577v2>) Proof of Theorem 1.4, p. 4 (arXiv v2).)

*Needs:* hypotheses LL1–LL3 and CC4–CC5 (Conditional arithmetic hypotheses); §8.7; ArithmeticGaloisRepresentations §§4.6–4.7; §7.6; §7.1; PadicHodgeTheory §§5.1–5.3; §7.9; §7.10; ArithmeticGaloisRepresentations §1.5; ArithmeticGaloisRepresentations §1.6; ArithmeticGaloisRepresentations §§1.5–1.9.

### 8.9 What an application of Theorem 1.4 must verify, and where Dieulefait–Pacetti's proof applies it

An application of Theorem 1.4 (§8.8) to a pair of congruent p-adic representations `ρ, ρ′` of `G_ℚ`, p odd, has to verify the following, and nothing else. (i) Residual image: `ρ̄|_{G_{ℚ(√p*)}}` is absolutely irreducible; ArithmeticGaloisRepresentations §§4.6–4.7 (b) with `F = ℚ` turns this into the `ℚ(ζ_p)` form, and non-solvable image implies it (§7.5). (ii) Weights: both are de Rham at p with Hodge–Tate weights `{0, k − 1}, k ≥ 2` (possibly different k); they need not be crystalline, and no bound on k in terms of p is required. (iii) Determinant: only oddness is needed; for `det ρ = ψε^{k−1}` this is `ψ(c) = (−1)^k` at complex conjugation c, and finite order of `ψ` alone does not give that parity. (iv) Ordinarity: no requirement, because the odd-prime theorem has no local restriction at p. (v) Residual modularity: one of the two is modular, or `ρ̄` has solvable image and Langlands–Tunnell applies (Theorem 1.3). Dieulefait–Pacetti apply Theorem 1.4 at w in Paso 1; at q in Paso 2; at each odd `p_i` of the ramification set in Paso 3, which may be 3; at 3 in Lemma 2.3; at N in Paso 5; at 5 in Paso 6; and in odd characteristic in the final step. For (i) the source supplies: in Paso 1, `w > 2k` and Lemma 1.14 (a bad dihedral `ρ̄_w` needs `w ∈ {2k(ρ̄) − 3, 2k(ρ̄) − 1}`); in Pasos 2–3 and Lemma 2.3, the good-dihedral prime N (Lemma 2.1); in Pasos 5–6, the case split 'irreducible and not bad dihedral'. In the residually reducible case at w, Theorem 1.6 applies, since `w > 2k ≥ 4` gives `w ≥ 5`. At `p = 3` (Paso 3, Lemma 2.3) the de Rham weight-two lifts need not be potentially Barsotti–Tate and `ρ̄|_{G_{ℚ₃}}` may be a twist of an extension of 1 by `ω`; this is where Tung's `p = 3` theorem is needed. The verification at each use belongs to the applications in ClassicalSerreModularity, which build on this target.

Compatible systems and their behaviour at the coefficient prime belong to the downstream roadmap PotentialModularityAndCompatibleSystems; the uses themselves are in ClassicalSerreModularity.

The list of uses is read from Dieulefait–Pacetti §2 and serves as a table of locators. The modern lifting proofs use no application of Serre’s conjecture. The separate ordinary branch imports ClassicalSerreModularity §I.1 through OrdinaryAutomorphicFormsAndModularityLifting §§5.4–5.5; its dependency is the standalone lifting theorem.

(i)–(v) are the hypotheses of §8.8, with the reformulations of Layer 7 (quadratic versus cyclotomic irreducibility, non-solvable image, the dyadic, residually reducible and ordinary-three propositions for the neighbouring Theorems 1.5–1.7). List every appeal to Theorem 1.4 in §2 (pp. 10–15) with the lemma or case split the source cites for (i).

**Checks.**

- `k = 3, w = 7: 7 ∉ {3, 5}`, so `ρ̄₇` is not bad dihedral.
- `w > 2k ≥ 4` gives `w ≥ 5`, the range of Theorem 1.6.
- Lemma 2.3 is an application of Theorem 1.4 at `p = 3`, so the `p ≥ 5` results alone would not suffice.

([DP](<https://arxiv.org/pdf/2108.07577v2>) §2, Paso 1, p. 10 (arXiv v2); [DP](<https://arxiv.org/pdf/2108.07577v2>) Proof of Lemma 2.3, p. 13 (arXiv v2).)

*Needs:* hypotheses LL1–LL3 and CC4–CC5 (Conditional arithmetic hypotheses); §8.8; ArithmeticGaloisRepresentations §§4.6–4.7; §7.5; §7.2; §7.3; §7.4.

### Examples

The p-adic Tate module of an elliptic curve with multiplicative reduction at p is semistable, not crystalline, of weight 2; §8.8 covers it, and it is not a potentially Barsotti–Tate case of §5.7 (§8.8). In Dieulefait–Pacetti's proof, `k = 3` and `w = 7` gives `7 ∉ {3, 5}`, so `ρ̄₇` is not bad dihedral (§8.9).

### Dependencies

Layers 3, 5, 7 of this roadmap; ArithmeticGaloisRepresentations (Layer 1; Layer 4); AutomorphicGaloisRepresentations (§§4.5–4.9); hypotheses CC1–CC5; DeformationAndDerivedPatchingAlgebra (§3.3, Layer 6 and §§5.3–5.4); HilbertModularVarietiesAndShimuraCurves (§§R18.3.1–R18.3.32); LocalGaloisDeformationRings (Layer 3); PadicHodgeTheory (§§5.1–5.3); hypotheses LL1–LL3; SerreWeightAndLevelOptimisation (§§6.6–6.11).

## Layer 9: Dyadic de Rham lifting

Prove Tung's 2-adic theorem: automorphy from support on every typed component (§9.1), the totally real dyadic lifting theorem for odd lifts with nonsolvable residual image (§9.2), and the de Rham theorem over `ℚ` (§9.3). It is distinct from the potentially Barsotti–Tate theorem of §6.9: a regular de Rham representation is not Barsotti–Tate after renaming its weights.

### 9.1 Automorphy from typed dyadic component support

In Tung §§4–5, with a modular nonsolvable residual representation over a totally real F in which 2 splits completely, fixed determinant `ψε` totally odd, odd deformation conditions at every real place, the specified Steinberg conditions away from 2, auxiliary place `v₁`, and a product `σ` of locally algebraic types, suppose the imported Theorem 8.0.1 gives support containing every irreducible component of `R∞(σ)[1/2]`. Then `Rˢ_ψ(σ)` is finite over `𝒪` and `M(σ)[1/2]` is faithful over `Rˢ_ψ(σ)[1/2]`. Every characteristic-zero point of this global deformation problem, including the point of a prescribed lift of type `σ`, therefore occurs in algebraic quaternionic forms and is automorphic after Jacquet–Langlands.

The characteristic-zero deformation points satisfy `det ρ(c_v)=−1` at every real place. Residual oddness in characteristic two cannot replace these odd local deformation conditions (Tung §3.2.5, Proposition 3.2.7, p.15).

Full component support is required: the type-specialized patched module is supported on the union of all irreducible components. A nonempty intersection with each component alone is not a general algebraic full-support criterion.

Use input CC4 for Tung Theorem 8.0.1, including both Theorem 6.3.7 (nonordinary components) and Theorem 7.3.1 (ordinary components); no finiteness assertion about the raw completed module is substituted. Apply Tung Lemma 5.3.2 (1)–(3), with its local–global type comparison and patching/augmentation comparison. The finite module, reduced generic fibre and faithful action imply nonzero fibre at every characteristic-zero point by localization and Nakayama. Identify that fibre with the finite-level algebraic `σ-space` using input CC1. Transfer the definite quaternionic eigenform to `GL₂/F` using GL2AutomorphicRepresentationsAndTransfer §§R17.3.1–R17.3.9.

**Checks.**

- Faithfulness of a nonfinite completed module alone is insufficient to justify nonzero fibres; the imported type-specialized finite-module argument must be used.
- Both ordinary and nonordinary components occur, including residual self-extensions at 2.

([Tung, dyadic](<https://arxiv.org/pdf/1908.06174v3>) §3.2.5, Proposition 3.2.7, p.15; §5.2, Proposition 5.2.2(3), p.28; §5.3, Lemma 5.3.2, p.28; §8, Theorems 8.0.1 and 8.0.3 with proof, pp.38–39 (arXiv v3).)

*Needs:* hypothesis CC4 (Conditional arithmetic hypotheses); hypothesis CC1 (Conditional arithmetic hypotheses); DeformationAndDerivedPatchingAlgebra §6.1; DeformationAndDerivedPatchingAlgebra §6.2; GL2AutomorphicRepresentationsAndTransfer §§R17.3.1–R17.3.9.

### 9.2 Tung’s totally real dyadic lifting theorem

Let F be totally real with every `F_v ≅ ℚ₂` for v|2. Let `ρ:G_F→GL₂(𝒪)` be continuous, totally odd and finitely ramified, with modular residual representation of nonsolvable image, and potentially semistable with distinct Hodge–Tate weights at every v|2. Then `ρ` is attached, up to twist, to a Hilbert modular form. There is no local exclusion of extensions of a character by itself (Tung Theorem 8.0.3).

Total oddness means `det ρ(c_v)=−1` for every real place v. The bar on `ρ` in arXiv v3 Theorem 8.0.3(3) is a misprint (Corrections to the sources, E11); use the odd characteristic-zero local deformation condition from §3.2.5, not residual determinant parity at two.

Choose a totally real solvable extension F′/F, disjoint from the residual fixed field with `ζ₂`, of even degree, split at 2, killing residual ramification away from 2 and making the remaining lift inertia unipotent. Preserve nonsolvable residual image using the general-field restriction statement proved here using GlobalGaloisDeformations Layer R04.4. Choose the definite quaternion algebra ramified at the real places and the even set `Σ` of remaining ramified finite places, an auxiliary `v₁` with distinct residual Frobenius eigenvalues, and the level of Tung §8. Total oddness of `ρ` puts its real-place points in `D_v^odd` (Proposition 3.2.7). The determinant, types and Steinberg local conditions put `ρ|G_F′` in the situation of §9.1. Apply that theorem and descend using solvable base change, with irreducibility guaranteed by nonsolvable residual image.

**Checks.**

- The local characteristic-two reductions of `I₂` and diag(1,−1) coincide, although their characteristic-zero determinants are +1 and −1. Thus residual determinant data alone does not verify the total-oddness premise.

([Tung, dyadic](<https://arxiv.org/pdf/1908.06174v3>) §3.2.5, Proposition 3.2.7, p.15; §8, Theorem 8.0.3 and proof, pp.38–39 (arXiv v3).)

*Needs:* §9.1; GlobalGaloisDeformations Layer R04.4; hypothesis CC5 (Conditional arithmetic hypotheses); GL2AutomorphicRepresentationsAndTransfer §§R17.4.1–R17.4.11, R17.6.19.

### 9.3 The 2-adic de Rham modularity lifting theorem (Kisin, Paškūnas, Tung)

Let `p = 2, E/ℚ₂` finite with ring `𝒪` and residue field k, and `ρ : G_ℚ → GL₂(𝒪)` continuous, irreducible, odd, unramified outside finitely many primes, with `ρ|_{G_{ℚ₂}}` de Rham of distinct Hodge–Tate weights. If `ρ̄` is modular and has non-solvable image, then `ρ` is modular: up to a twist, `ρ ≅ ρ_f` for a cuspidal eigenform f (Tung, Theorem A). Before Tung, Paškūnas proved this over totally real F in which 2 splits completely, for `ρ|_{G_{F_v}}` potentially semistable with distinct Hodge–Tate weights and `det ρ` totally odd, under the extra local hypothesis (iv) `ρ̄|_{G_{F_v}}` ≇ `(χ ∗; 0 χ)` for every `v | 2` (Theorem 1.1). Tung removes (iv), which was the only remaining local restriction at `p = 2` (`ω = 1` there), by proving that every component of the patched deformation ring lies in the support of the patched module (his Theorem B).

This is a de Rham theorem with arbitrary distinct Hodge–Tate weights; it is not the potentially Barsotti–Tate theorem of the classical proof (Kisin's (0.1), §6.9), and a regular de Rham representation is not Barsotti–Tate after renaming its weights.

Residual modularity is a hypothesis; Tung notes that over `ℚ` it follows from Khare–Wintenberger and Kisin, but his proof does not use that (see §12.4).

Non-solvable residual image replaces the cyclotomic irreducibility condition used for odd p.

With the twist normalised by §7.11 and §7.9 this proves `DyadicLifting` of §7.2. The totally real theorem uses the general-field nonsolvable-image preservation proved here using GlobalGaloisDeformations Layer R04.4, rather than the Q-only Layer 7 lemma.

Tung Theorem 8.0.1 combines an ordinary and a nonordinary component argument; Colmez finiteness and near faithfulness alone do not replace the ordinary input.

Apply p-adic monodromy to the de Rham regular local representation, preserving the Hodge–Tate weights. Apply §9.2 with `F=ℚ`. Its residual modularity remains an explicit hypothesis, not a use of the general Serre endpoint. For normalized weights {0,k−1}, translate the classical form’s weight through the imported global-character twist and algebraic-vector convention; do not identify this theorem with the weight-two potentially Barsotti–Tate theorem.

**Checks.**

- `A ρ` with `ρ̄|_{G_{ℚ₂}} ≅ (χ ∗; 0 χ)` (for instance `ρ̄` unipotent at 2) is covered by Tung's Theorem A but not by Paškūnas' Theorem 1.1.
- A potentially Barsotti–Tate `ρ` is the case already covered by Kisin's (0.1), used in the classical proof through Hypothesis (H).

([Tung, dyadic](<https://arxiv.org/pdf/1908.06174v3>) Introduction, Theorem A, p. 2 (arXiv v3); [Tung, dyadic](<https://arxiv.org/pdf/1908.06174v3>) Introduction, p. 3 (arXiv v3); [Paškūnas, 2-adic](<https://arxiv.org/pdf/1509.00332v2>) §1, Theorem 1.1, pp.1–2 (arXiv v2; hypothesis (iv) and conclusion on p.2).)

*Needs:* §9.2; PadicHodgeTheory §§5.1–5.3; ArithmeticGaloisRepresentations §§1.2, 1.10, 2.1–2.4, 4.1.

### Examples

A 2-adic representation with residual image containing `SL₂(𝔽₄) ≅ A₅` is in the nonsolvable branch; one with residual image `S₃` is not (§9.3). Total oddness of the lift is `det ρ(c_v) = −1` at every real place; the printed bar on `ρ` in Tung's Theorem 8.0.3(3) is a misprint (§9.2).

### Dependencies

ArithmeticGaloisRepresentations (§§1.2, 1.10, 2.1–2.4, 4.1); hypotheses CC1–CC5; DeformationAndDerivedPatchingAlgebra (Layer 6); GL2AutomorphicRepresentationsAndTransfer (§§R17.3.1–R17.3.9; §§R17.4.1–R17.4.11, R17.6.19); GlobalGaloisDeformations (Layer R04.4); PadicHodgeTheory (§§5.1–5.3).

## Layer 10: Pan's residually reducible theorem

In this layer `Σ_p={v|p}`, Pan’s convention; it does not include an additional Steinberg set.

Build Pan's proof of the Fontaine–Mazur conjecture for residually reducible representations: nice and potentially nice primes of the pseudodeformation ring (§10.1, §10.2), good components and the components detected by extension deformations (§10.3, §10.4), modularity along a component through a nice prime (§10.6), the large component at a regular point and its ordinary intersections (§10.7–§10.9), production of nice primes after solvable base change (§10.10), the geometry of nonsplit extension deformations and the propagation of goodness (§10.11–§10.13), Pan's nonordinary Hilbert modularity theorem (§10.14) and the theorem itself (§10.15). Pan's residually irreducible lifting theorem is stated with its residual-modularity hypothesis (§10.5). No residual modularity is assumed in §10.15.

### 10.1 Pan’s nice Hecke prime

Fix all data of Pan §4.1: p odd; F totally real of even degree with p completely split; `S⊇Σ_p` finite, p|N(v)−1 outside p; `χ:G_F,S→𝒪×` totally odd, unramified outside p with `χ(Frob_v)≡1` for `v∈S\Σ_p`; p-power tame characters `ξ_v`; the definite quaternionic completed Hecke algebra `T_m` and `R^{ps,{ξ_v}}↠T_m`. A prime q of `T_m` is nice if `p∈q, dim(T_m/q)=1`, and there exists a lattice `ρ(q)°` over the normalization A of `T_m/q` in k(q) such that: its generic fibre is irreducible; its reduction is a nonsplit extension of the two residual characters; if `ρ(q)` is induced from `G_L` for a quadratic L/F, then `L∩F(ζ_p)=F`; and at every `v∈S\Σ_p` the lattice representation is the constant lift of its residual representation. A prime of `R^{ps,{ξ_v}}` is nice when it is the contraction of such a Hecke prime.

Retain Pan §4.1.2 Assumption 1: the ideal generated by `ϖ` and `T_v−1−χ(Frob_v), v∉S`, is an actual maximal ideal m of the completed Hecke algebra. Its central character is `ψ=χε` and the quaternion algebra is ramified exactly at the infinite places.

Use LocalGaloisDeformationRings §§F.1.1–F.2.11 for the determinant-fixed pseudodeformation problem and input CC2 for the Hecke quotient; use §§0.1–0.3 and ArithmeticGaloisRepresentations Layer 1 for reconstruction and lattices. Define the predicate by the existence of the lattice with these four properties, keeping the characteristic-p dimension-one condition and the cyclotomic intersection condition. Record the contraction separately from a prime satisfying only the Galois properties.

Provide the following operations and compatibility statements.

- `PanNicePrime.char_p_dimension`: A nice Hecke prime contains p and has quotient dimension one.
- `PanNicePrime.lattice`: Extract a normalization lattice with irreducible generic fibre, nonsplit reduction and the stated away-p restrictions.
- `PanNicePrime.is_proModular`: The contraction of a nice Hecke prime is pro-modular for Pan’s direct pseudodeformation-to-Hecke quotient (input CC2), equivalently its prime contains the kernel of that quotient.
- `PanNicePrime.dihedral_disjoint`: If the associated representation is induced from a quadratic L, then `L∩F(ζ_p)=F`.
- `PanNicePrime.mk`: In the stated setup, `p∈q`, quotient dimension one and existence of a normalization lattice with all four properties in the definition imply the predicate. For a pseudo-ring nice prime, also supply its Hecke prime and contraction equality.
- `PanNicePrime.iff`: The predicate is equivalent to `p∈q`, quotient dimension one and existence of a normalization lattice with all four properties in the definition. Hecke and pseudo-ring primes are distinguished; the latter has an existential contracted Hecke witness.

**Checks.**

- `nice_prime_characteristic_zero_rejected`: A prime not containing p is not nice, even if it is a classical automorphic point.
- `nice_prime_split_lattice_rejected`: A proposed witness lattice with split residual reduction does not satisfy `PanNicePrime.lattice`; irreducible generic fibre alone does not validate that witness.
- Over `A=𝔽_p[[t]]`, an unramified local representation sending Frobenius to `!![1,t;0,1]` has finite image of order p and reduces to the identity, but is not the constant identity lift. It fails the nice-lattice away-p clause even though it meets the finite-image clause of potential niceness.

([Pan](<https://arxiv.org/pdf/1901.07166v2>) §4.1, Definition 4.1.4 and Remarks 4.1.5–4.1.6, p.39.)

*Needs:* LocalGaloisDeformationRings §§F.1.1–F.2.11; LocalGaloisDeformationRings §§F.2.5–F.2.11; hypothesis CC2 (Conditional arithmetic hypotheses); ArithmeticGaloisRepresentations Layer 1; §§0.1–0.3.

### 10.2 Potentially nice pseudodeformation primes

For Pan §7.1’s global determinant-fixed ring `R^{ps}` over a totally real abelian F split at p, a prime q is potentially nice in the sense of §7.2.4 if `p∈q, dim(R^{ps}/q)=1`, the associated semisimple representation `ρ(q)` is irreducible, and `ρ(q)|G_Fv` has finite image for every `v∈S\Σ_p`. This is a Galois condition: it does not assert Hecke occurrence, a nonsplit normalization lattice, or a constant away-p lift.

Use the supplied pseudodeformation ring and pointwise semisimple representation from LocalGaloisDeformationRings §§F.2.5–F.2.11 and §0.1. Conjoin the four stated properties; keep the passage from potentially nice to nice as the separate arithmetic theorem §10.10.

Provide the following operations and compatibility statements.

- `PanPotentiallyNicePrime.char_p_dimension`: Extract `p∈q` and `dim R^{ps}/q=1`.
- `PanPotentiallyNicePrime.finite_away`: Each away-p local restriction has finite image.
- `PanPotentiallyNicePrime.of_nice`: A contracted Pan nice prime, in the same §7 global problem with its finite residual away-p lift, is potentially nice.
- `PanPotentiallyNicePrime.coefficient_extension`: For a finite unramified coefficient extension and a prime above q, the predicate is preserved when the generic representation remains irreducible.
- `PanPotentiallyNicePrime.mk`: In the stated setup, `p∈q`, quotient dimension one, irreducible associated representation and finite image at every away-p place imply the predicate.
- `PanPotentiallyNicePrime.iff`: The predicate is equivalent to `p∈q`, quotient dimension one, irreducible associated representation and finite image at every away-p place; no Hecke-image premise is added.

**Checks.**

- `potentially_nice_reducible_rejected`: A dimension-one characteristic-p prime with a sum-of-characters generic representation is not potentially nice.
- `potentially_nice_no_away_places`: When `S=Σ_p`, the finite-away-p clause is vacuous; the other three clauses remain necessary.
- `potentially_nice_not_proModular_by_definition`: For fixed q and associated representation, changing the candidate Hecke quotient does not change the potentially-nice predicate; it changes whether q is a contracted nice Hecke prime.

([Pan](<https://arxiv.org/pdf/1901.07166v2>) §7.2.4, p.114.)

*Needs:* LocalGaloisDeformationRings §§F.2.5–F.2.11; §§0.1–0.3; ArithmeticGaloisRepresentations Layer 1.

### 10.3 Good components of the pseudodeformation space

Pan Definition 7.4.1: a component C of `Spec R^{ps}` is good if a finite chain `C₁,…,C_t=C` has potentially nice `q₁,…,q_t`, with `q_i∈C_{i−1}∩C_i` for `i≥2`, and `q₁∈C₁∩closure(A^{ord})`, where `A^{ord}` is the set of irreducible regular de Rham ordinary primes of Corollary 7.2.3. A chain of length one is allowed. Equivalently, on the component index set, take the reflexive transitive closure of adjacency by a potentially nice common point, starting at a component containing such a point in `closure(A^{ord})`. The prototype takes concrete component subsets, a potentially-nice point set and the seed-point set; its intended specialization is this spectrum.

Use §10.2 and the ordinary arithmetic locus constructed in §§10.8–10.9; goodness is an incidence predicate, with modularity of that locus used in the separate good-component-to-automorphy argument. Use Mathlib `Relation.ReflTransGen` for finite reachability. A starting component contains a point in the intersection of the potentially-nice and seed sets; adjacency requires a potentially nice point in both components. The reflexive case encodes `t=1`, not an empty unseeded chain.

Provide the following operations and compatibility statements.

- `panGoodComponent_iff`: Goodness is equivalent to a seeded component followed by `Relation.ReflTransGen` of potentially-nice-point adjacency.
- `panGoodComponent_seed`: A component containing a potentially nice seed point is good by a length-one chain.
- `panGoodComponent_step`: If C is good and C,C′ contain a common potentially nice point, then C′ is good.
- `panGoodComponent_mono`: Enlarging the potentially-nice point set and the seed-point set preserves goodness.
- `panGoodComponent_congr`: Pointwise equality of component subsets and equality of the nice and seed sets give equivalent goodness predicates.

**Checks.**

- `good_component_single_seed`: For a one-component, one-point incidence system with the point in both sets, the component is good.
- `good_component_empty_seed`: With empty seed-point set, no component is good, even when every pair is adjacent.
- `good_component_two_step_chain`: For components {0}, {0,1}, {1,2}, nice points {0,1}, and seed points {0}, all three are good; the third is reached through the middle component.
- `good_component_non_nice_intersection`: For components {0,1} and {1,2}, nice points {0}, seed points {0}, only the first is good: the common point 1 is not potentially nice.

([Pan](<https://arxiv.org/pdf/1901.07166v2>) §7.4, Definition 7.4.1, p.116.)

*Needs:* §10.2; the local-pseudodeformation carriers of LocalGaloisDeformationRings §F.2.11; `Relation.ReflTransGen; Relation.ReflTransGen.trans; Relation.reflTransGen_iff_eq`.

### 10.4 Components detected by an extension deformation

Pan Definition 7.4.21: for a nonzero extension class `B∈Ext¹_{E[G_F,S]}(ψ₁,ψ₂)`, let `R_B` be the determinant-fixed characteristic-zero deformation ring of the nonsplit extension `ρ_B`. Under its trace map `f_B:R^{ps}→R_B`, define `Z_B` to be the components of `Spec R^{ps}` whose generic points lie in the image of `Spec R_B→Spec R^{ps}`. For a general ring map `f:A→B` the underlying incidence construction is the set of prime points P with `P.asIdeal∈ minimalPrimes` A and P in range(Spec f). The arithmetic specialization uses `f_B`; scalar-equivalent extension classes have the same `Z_B` under the deformation comparison.

Use the supplied characteristic-zero deformation functor and construct its arithmetic trace map as in the Layer 10 refinements, not a new representation deformation functor. Identify components with minimal prime ideals using the pinned Mathlib order equivalence. Intersect those generic points with the image of `PrimeSpectrum.comap f_B`.

Provide the following operations and compatibility statements.

- `panExtensionComponents_mem_iff`: P lies in the set iff P is a minimal prime point of A and `P=comap f Q` for some Q in Spec B.
- `panExtensionComponents_minimal`: Every member indexes an actual irreducible component of Spec A.
- `panExtensionComponents_id`: For the identity map, this set is exactly the minimal-prime points of A.
- `panExtensionComponents_kernel_le`: The kernel of f is contained in every member P.asIdeal.
- `panExtensionComponents_comp_subset`: For ring maps `f:A→B` and `g:B→C`, panExtensionComponents (g.comp f) is a subset of panExtensionComponents f, by composition of spectrum comaps.

**Checks.**

- `extension_components_identity`: For `f=id_A` the result equals {`P∈Spec A | P.asIdeal∈ minimalPrimes` A}, via Mathlib’s component correspondence.
- `extension_components_zero_target`: If B is the zero ring, Spec B is empty and the component set is empty.
- `extension_components_kernel_obstruction`: If ker f is not contained in a minimal P, then P is not detected, so using all minimal primes instead of the image intersection fails.

([Pan](<https://arxiv.org/pdf/1901.07166v2>) §7.4, Definition 7.4.21, p.121.)

*Needs:* LocalGaloisDeformationRings §§F.2.5–F.2.11; §§0.1–0.3; `PrimeSpectrum.comap; minimalPrimes; minimalPrimes.equivIrreducibleComponents`.

### 10.5 Pan’s residually irreducible lifting theorem with residual modularity

The usable lifting form is Pan Theorem 8.0.1 at `F=ℚ: p` odd, `ρ` continuous irreducible odd finitely ramified, `ρ̄|G_ℚ(ζ_p)` absolutely irreducible and modular, and `ρ|G_ℚp` absolutely irreducible regular de Rham. At `p=3` exclude residual local extensions `η` by `ηω` in either orientation. Then `ρ` is modular up to a global character twist χ, with χ de Rham at p. If its weights are `{0,k−1}`, `k≥2`, §§7.11 and 7.9 give attachment to an actual weight-k classical newform. Pan Theorem 1.0.4 is a broader source consequence, combining earlier ordinary and residually dihedral cases and invoking full Serre modularity over `ℚ` through Remark 8.0.4; that unconditional consequence is not an input to an independent proof of Serre's conjecture (ClassicalSerreModularity).

Residual modularity is kept in the lifting statement.

This statement is outside the dependency cone of the modern residually reducible transfer; the source’s unconditional Theorem 1.0.4 is not used as an independent input towards Serre's conjecture.

Apply the exact completed-homology patching theorem of Pan §8 with its specified residual-modularity hypothesis and local exclusions; this is input CC4. Use the local block compatibility and nonordinary classicality of input CC3, retaining the algebraic central-character twist in the source’s regular algebraic automorphic conclusion. Over ℚ this gives a classical newform attachment up to a geometric global character twist; apply §§7.11 and 7.9 only for normalized weights. Record Remark 8.0.4 separately: replacing residual modularity by the already proved full Serre theorem proves the unconditional source consequence, but would be circular in an independent proof of Serre.

**Checks.**

- A merely residually irreducible representation is not admitted unless its cyclotomic restriction and residual modularity satisfy the theorem.
- At `p=7`, take `C:y²=x³−x` and `ρ=V₇(C)⊗ε₇⁶`, as in §8.6. One has `#C(𝔽₇)=8`, so the crystalline Frobenius slopes are half-integral even after this twist; no crystalline character over a finite coefficient extension can be a constituent, giving local absolute irreducibility. The residual inertia characters `ω₂,ω₂⁷` have ratio of order four on cyclotomic inertia, and a Frobenius lift in `G_{ℚ₇(ζ₇)}` exchanges their eigenlines. Thus the cyclotomic restriction is absolutely irreducible, the modular residual witness is unchanged by `ω₇⁶=1`, and all hypotheses hold. The weights `{6,7}` exclude an exact classical newform attachment.
- Removing `ε₇⁶` in that example gives normalized weights `{0,1}` and exact weight-two modularity; more generally `{0,k−1}` gives exact weight-k modularity by §§7.11 and 7.9.
- An independent proof of Serre's conjecture uses the residually reducible theorem as stated in the source, never the unconditional Theorem 1.0.4.

([Pan](<https://arxiv.org/pdf/1901.07166v2>) §8, Theorem 8.0.1 and Remark 8.0.4, pp.124–125.)

*Needs:* hypothesis CC4 (Conditional arithmetic hypotheses); hypothesis CC3 (Conditional arithmetic hypotheses); hypothesis CC5 (Conditional arithmetic hypotheses); §§7.9, 7.11.

### 10.6 Modularity along a component through a nice prime

In Pan §4.1’s setup, let x be a maximal ideal of `R^{ps,{ξ_v}}[1/p]` such that `ρ(x)|G_Fv` is irreducible and de Rham with distinct Hodge–Tate weights for every v|p. If an irreducible component contains x and a nice prime q, and if `p=3` the local residual ratio is not `ω^{±1}`, then `ρ(x)` is regular algebraic cuspidal automorphic over F (Corollary 4.1.8).

Import Theorem 4.1.7’s surjection `(R^{ps,{ξ_v}})_q→T_q` with nilpotent kernel (input CC4). A minimal prime on a component through q contains the kernel, so the component is in the closed Hecke image. The point x is therefore pro-modular. Over `F_v=Q_p`, an irreducible two-dimensional de Rham representation with distinct Hodge–Tate weights is absolutely irreducible: otherwise its character constituents after finite coefficient extension are conjugate and have equal integer weights. Use the coefficient and weight comparison proved here using PadicHodgeTheory §§3.2–3.6, then Pan Corollary 3.5.12 (input CC3) with its absolutely irreducible local hypothesis and Jacquet–Langlands.

**Checks.**

- The conclusion uses a common component, not just arbitrary connectedness of Spec R.
- Nilpotent kernel is sufficient; a literal global integral `R=T` assertion is not assumed.

([Pan](<https://arxiv.org/pdf/1901.07166v2>) §4.1, Corollary 4.1.8, pp.39–40.)

*Needs:* §10.1; hypothesis CC4 (Conditional arithmetic hypotheses); hypothesis CC3 (Conditional arithmetic hypotheses); GL2AutomorphicRepresentationsAndTransfer §§R17.3.1–R17.3.9; hypothesis CC2 (Conditional arithmetic hypotheses); PadicHodgeTheory §§3.2–3.6.

### 10.7 The large component through the geometric point

In Pan §7.1, let F be totally real abelian, p split, `χ=det ρ` totally odd, and `ρ:G_F,S→GL₂(𝒪)` irreducible with residual trace `1+χ̄`. Let x be the prime of its trace in the determinant-fixed `R^{ps}`. Then `dim (R^{ps})_x≥2[F:ℚ]`, and there is a component C through x with `dim C≥1+2[F:ℚ]`. After enlarging coefficients, inertia away from p on the generic point of C is a sum of two finite-order characters.

For the component used in this proof, retain Pan §7.1.1–7.1.2: `χ` is de Rham at the p-places, the odd residual ratio `χ̄` extends to `G_Q`, and the solvable field/coefficient enlargement has been performed with `d=[F:Q]>|S\Σ_p|+2`. These are the setup hypotheses used by the downstream ordinary-density and trace-cut arguments.

Use the characteristic-zero trace/deformation comparison of Pan Corollary 2.2.3, proved here using LocalGaloisDeformationRings §F.2.11, to present the completed local ring by h¹ variables and h² relations. Apply the global Euler characteristic formula to `ad⁰ρ`: irreducibility gives `h⁰=0` and total oddness gives one real-place invariant, hence `h¹−h²=2[F:ℚ]`. Use the dimension comparison to the integral component. Use Pan Lemma 5.7.3’s finite inertia characters at the generic point, proved here using GlobalGaloisDeformations §§3.3–3.8 and the finite-inertia analysis of Pan Lemma 5.7.3.

**Checks.**

- Euler characteristic: for odd `ρ` with `h⁰(ad⁰ρ) = 0, h¹ − h² =` [F : ℚ](3 − 1) `= 2d`, which is the source of `dim (R^{ps})_x ≥ 2d`; for `F = ℚ` this reads `dim ≥ 2` and `dim C ≥ 3`.
- The bounds are used only in the degree-enlarged setup `d > |S∖Σ_p| + 2`; nothing beyond the count is claimed for `d = 1`.

([Pan](<https://arxiv.org/pdf/1901.07166v2>) §7.1, Lemma 7.1.3 and §7.1.4, p.112.)

*Needs:* LocalGaloisDeformationRings §§F.2.5–F.2.11; GlobalGaloisDeformations §§3.3–3.8; ArithmeticGaloisDuality §§R02.4.3–R02.4.4, D8.1, R02.6.1–R02.6.2.

### 10.7a Baker–Brumer and abelian Leopoldt

**Abelian unit-rank and reducible-locus input.** Import qualitative p-adic Baker–Brumer from LinearFormsInLogarithms §8.10, `PadicBaker.eq_zero_of_add_sum_mul_eq_zero`. For a finite family of algebraic p-adic units `αᵢ` in `ℂ_p`, supply its logarithm normalization adapter: choose one positive integer N killing the residue-field torsion of every αᵢ and containing a sufficiently large p-power, so `αᵢ^N` lies in the logarithm/exponential inverse domain and `N log_p αᵢ` lies in the strict exponential disc. Then `exp(N log_p αᵢ)=αᵢ^N` is algebraic. If the original logarithms are linearly independent over `ℚ`, multiplication by N preserves that independence. Apply the imported theorem with zero constant term and divide by N to obtain their independence over the algebraic numbers in `ℂ_p`. The exponential-disc proof stays with that supplier. Use Dirichlet’s unit theorem and the character decomposition of the unit module for an abelian extension to prove `abelian_leopoldt`: for a totally real abelian number field F and every prime p, the diagonal logarithm map
`𝒪_Fˣ⊗_ℤ ℚ_p → ∏_{v|p} F_v`
has rank `[F:ℚ]−1`. Its kernel on units before tensoring is the torsion subgroup. Retain the embeddings, coefficient extension, and the local logarithm normalization `log_p(p)=0` of DirichletPadicLFunctions §0.6.

Prove the class-field-theory adapter: the maximal abelian pro-p quotient of `G_{F,S}`, for finite S containing the p-places, is a finitely generated `ℤ_p`-module of rank one. Its torsion need not vanish. At each p-place the image of local units has finite index in this quotient: the cyclotomic quotient is nonzero on those units and the global rank is one. For odd p, fixed totally odd determinant χ, residual trace `1+χ̄`, and the fixed tame conditions of Pan’s global pseudo-ring, the closed reducible locus has dimension at most two (and at most one after reduction modulo p). Construct this bound via the one-character deformation ring and the determinant relation determining the other character; this is the input used in §§10.8–10.10 and 10.13. Here Pan’s Leopoldt defect is zero; the rank-one Galois quotient is not a rank-zero quotient.

Source: LinearFormsInLogarithms §8.10; Brumer, On the units of algebraic number fields, Mathematika 14 (1967), pp.121–124; Pan §5.4.11, Corollary 7.2.3 and §§7.2.4, 7.4.11, pp.82–83, 113–114, 119. The abelian unit-character, Galois-rank and reducible-locus consequences are proved here from the shared transcendence theorem.

**Checks.**

- At `p=2`, the unit 3 need not itself lie in the strict exponential inverse disc, but `3^(2^m)` does for sufficiently large m. The same positive N works for the whole finite family, including its residue torsion.
- For `α₂=α₁²`, `log_p α₂=2 log_p α₁`, and no common power repairs the failed `ℚ`-independence hypothesis.
- For `F=ℚ`, the unit logarithm rank is zero, while the maximal abelian pro-p quotient has rank one from the cyclotomic direction.
- For `F=ℚ(√5)`, the unit `(1+√5)/2` has infinite order and nonzero logarithm at p; its unit logarithm rank is one and the global Galois rank remains one.
- For totally real abelian F of degree four, the logarithm rank is three, giving a dimension-two reducible locus. The component of dimension five in §10.8 cannot be filled by it; the weaker rank lower bound `(d−1)/2` would not give this dimension-two conclusion.

*Needs:* LinearFormsInLogarithms §8.10; DirichletPadicLFunctions §0.6; Mathlib `NumberField.Units.rank` and `NumberField.Units.finrank_modTorsion` (Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean); ClassFieldTheory Layers 7, 11–12; §§0.1–0.2; LocalGaloisDeformationRings §F.2.11.

### 10.8 The generic ordinary intersection

The ordinary arithmetic comparison in this target is stated over every totally real abelian `F/ℚ` unramified at odd p, without requiring p to split. Fix `S ⊇ Σ_p` and a totally odd continuous character `χ : G_{F,S} → 𝒪ˣ`, de Rham above p, whose reduction extends to `G_ℚ` and is nontrivial on every `G_{F_v}` above p. Construct the fixed-determinant pseudo-ring `R^{ps,ord}` by imposing local reducibility on the supplied `R^{ps}`. Its two local characters lift 1 and `χ̄` in that order. Local reciprocity applied to the first gives `Λ_F → R^{ps,ord}`, where `Λ_F = ⊗̂_{v|p,𝒪} 𝒪⟦𝒪_{F_v}ˣ(p)⟧`. Prove finiteness of this map. A characteristic-zero maximal point with irreducible global representation and an ordinary local subcharacter de Rham of strictly larger labelled weight than the quotient at every embedding is Hilbert modular up to twist. The weight inequality uses this roadmap's convention `HT(ε) = 1`; Pan uses the opposite sign. These assertions are the arithmetic comparison proved here from ordinary Hecke theory, not an assertion that the general pseudo-ring is finite over `𝒪`. (Pan §§5.1.1–5.1.2, p.71, with the weight convention on p.7.)

The API of this ordinary quotient includes the quotient map and its local-reducibility universal property, the two labelled local characters, the weight-algebra map, finite coefficient change, and the finite-map and arithmetic-point modularity theorems. Apply the Skinner–Wiles results of OrdinaryAutomorphicFormsAndModularityLifting §§5.4–5.7 only at their own distinguishedness, labelled-quotient and residual-image hypotheses. A use of its §5.8 also assumes `CMComponentSupport`; the arithmetic comparison here proves Pan's wider assertion.

**Checks.**

- For the local sum `1 + χ` with distinct residual characters, the label lifting 1 is fixed by reduction; exchanging the two changes the weight-algebra character.
- A globally reducible characteristic-zero point may belong to the quotient and satisfies local reducibility, but fails the irreducibility hypothesis of its modularity theorem.
- The ordinary local representation with subcharacter `ε` and quotient 1 has weights `1 > 0` here and `−1 < 0` in Pan; the reverse ordering does not meet the arithmetic-point hypothesis. Equal weights are excluded.

With C as in §10.7 and `χ̄|G_Fv≠1,ω^{±1}` at every v|p, form `C^{ord}=C∩Spec R^{ps,ord}` using the imported local reducibility quotients. Then `dim C^{ord}≥1+[F:ℚ]`. There is a component `C₁^{ord}` finite and surjective over `Spec Λ_F`, of that dimension, whose irreducible regular de Rham ordinary points are dense and modular.

The degree enlargement of §7.1.2 ensures `[F:ℚ]>|S\Σ_p|+2`.

The local ratio hypothesis excludes both cyclotomic ratios; that branch has a two-generator ideal and a separate proof.

The generic local reducibility ideal is principal (Paškūnas, The image of Colmez’s Montreal functor, Appendix B, Corollary B.20; see Pan Lemma 7.2.1, p.113; proved in this target from the local pseudodeformation ring of LocalGaloisDeformationRings §F.2.11), so imposing ordinarity loses at most `[F:ℚ]` dimensions. Prove Pan Theorem 5.1.2’s ordinary arithmetic comparison here; it gives finiteness over `Λ_F`. Equal dimension and the domain property give surjectivity on a chosen component. The abelian Leopoldt adapter of §10.7a bounds the global reducible locus by dimension two; since `[F:ℚ]>2` after the stated base change, it does not fill the component. Arithmetic weights with the appropriate local character ordering give the dense regular de Rham subset, and Theorem 5.1.2 makes it modular.

**Checks.**

- Each place above p costs at most one equation because the generic local reducibility ideal is principal, so `1 + 2d − d = 1 + d`; for `d = 4` the bound is `dim C^{ord} ≥ 5`.
- If `χ̄|G_{F_v} = ω^{±1}` at some `v | p` the local ideal needs two generators and this count fails; that is the cyclotomic branch of §10.13, not this statement.

([Pan](<https://arxiv.org/pdf/1901.07166v2>) §7.2, Lemma 7.2.1, Corollary 7.2.3 and proof, pp.113–114.)

*Needs:* §10.7a; §10.7; LocalGaloisDeformationRings Layer 8; OrdinaryAutomorphicFormsAndModularityLifting Layer 5.

### 10.9 The scalar local ordinary cover

At the same general unramified abelian scope, replace the residual local condition by `χ̄|G_{F_v} = 1` for all `v | p`. Construct the functor of pairs consisting of a fixed-determinant pseudocharacter and, at each `v | p`, a chosen character `ψ_{v,1}` lifting 1, with local trace `ψ_{v,1} + χψ_{v,1}^{−1}` and the following ordinary trace identity. Put `ψ₂ = χψ_{v,1}^{−1}` and require `T(στη) − ψ_{v,1}(σ)T(τη) − ψ₂(τ)T(ση) + ψ_{v,1}(σ)ψ₂(τ)T(η) = 0` for every `σ, τ ∈ G_{F_v}` and `η ∈ G_{F,S}` (Pan Definition 5.3.2, p.75). Its representing ring is `R₁^{ps,ord}`. Prove that the chosen characters induce a finite map `Λ_F → R₁^{ps,ord}` and prove modularity up to twist at irreducible characteristic-zero ordinary points with the same strict labelled-weight ordering as in §10.8. Retain the forgetful map, the universal property with chosen characters, coefficient change, and the compatibility of the weight-algebra maps. (Pan §§6.1.1–6.1.2, pp.95–96.)

**Checks.**

- When the residual characters coincide, reduction no longer chooses one local character; a point of the cover includes this choice as actual data.
- For two distinct characteristic-zero characters both reducing to 1, exchanging them changes the labelled point of the cover even though the trace remains their sum.
- A locally irreducible characteristic-zero representation cannot supply a chosen ordinary line and is outside this ordinary-point theorem; it is treated by §10.14 instead.

With the same global C, if `χ̄|G_Fv=1` at every v|p, use `R₁^{ps,ord}`, which remembers a chosen lifting `ψ_{v,1}` of the trivial local character with `T|G_Fv=ψ_{v,1}+χψ_{v,1}^{−1}` and `ψ_{v,1}-ordinarity`. Its pullback `C^{ord,1}` has dimension at least `1+[F:ℚ]`, and a component finite surjective over `Λ_F` with dense modular regular de Rham points, as in Pan Lemma 7.3.1 and Corollary 7.3.2.

Construct the chosen-character ordinary cover of Pan §6.1.1, distinguishing it from the unordered reducible pseudodeformation locus. The local pseudo ring is `𝒪[[t₁,t₂,t₃]]`, the chosen-character ring `𝒪[[x₁,x₂]]`, and the comparison after adjoining the latter has a three-generator kernel. Thus the dimension estimate is `1+2d+2d−3d=1+d`, not the generic principal-ideal estimate. Use Pan Theorem 6.1.2’s finiteness and modularity, proved as the ordinary arithmetic comparison in this target, to obtain the dense arithmetic points on the cover; project to the global component.

**Checks.**

- The scalar local case is covered although the original Skinner–Wiles distinguished-character theorem does not cover it.

([Pan](<https://arxiv.org/pdf/1901.07166v2>) §7.3, Lemma 7.3.1 and Corollary 7.3.2, pp.115–116.)

*Needs:* §10.7a; §10.7; OrdinaryAutomorphicFormsAndModularityLifting Layer 5; LocalGaloisDeformationRings Layer 8.

### 10.10 Producing a nice prime after solvable base change

In Pan §7.1–§7.2, suppose `C^{ord}` (or its chosen-character cover) has a component `C₁` finite surjective over `Λ_F`, with dense irreducible modular regular de Rham points, and `[F:ℚ]>|S\Σ_p|+2`. Then `C₁` contains a potentially nice q. A finite totally real solvable `F₁/F`, split at p and of even degree, can be chosen so that the contractions x′,q′ of x,q to the determinant-fixed problem `R^{ps,1}_{F₁}` lie on one component, q′ is nice, and that problem has a nonzero completed Hecke quotient.

Impose p and the away-p Frobenius trace conditions on `C₁`. The dimension bound and §10.7a exclude the reducible locus and leave a dimension-one irreducible prime. The local away-p deformation analysis proves finite local images, giving §10.2. Apply Taylor’s solvable field selection (Pan cites Taylor 2003 Lemma 2.2) to kill these finite images, force `N(w)≡1 mod p` and trivialize the generic inertia characters; the exact restriction of deformation problems is an arithmetic refinement proved here using GlobalGaloisDeformations Layer R04.4. Use the dense ordinary modular points and solvable automorphic base change to produce the Hecke maximal ideal and make the image of `C₁` pro-modular. The nonsplit-lattice and dihedral-disjointness checks are Pan §5.7.9’s argument, included in that addition. Contract along `R^{ps,1}_{F₁}→R^{ps}/P`. Since x and q lie on C, their images lie on one component; q′ satisfies all clauses of §10.1.

**Checks.**

- A potentially nice q (irreducible, finite away-p images) need not be nice over F; niceness, with Hecke occurrence and a nice lattice, is claimed only for q′ over `F₁`.
- `F₁/F` is split at p and of even degree: a field not split at p would change the local problems above p and lose the ordinary component.

([Pan](<https://arxiv.org/pdf/1901.07166v2>) §7.2.4–7.2.5, pp.114–115; §7.3 after Corollary 7.3.2, p.116.)

*Needs:* §10.7a; §10.2; §10.1; §10.7; GlobalGaloisDeformations Layer R04.4; GL2AutomorphicRepresentationsAndTransfer §§R17.4.1–R17.4.11, R17.6.19; hypothesis CC2 (Conditional arithmetic hypotheses); GlobalGaloisDeformations §§3.3–3.8.

### 10.11 Geometry of nonsplit extension deformations

Assume hypothesis LC (Conditional arithmetic hypotheses). In Pan §7.4.14–7.4.20, `p≥5`, F is abelian totally real, split at p, `d=[F:ℚ]>|S\Σ_p|+2`, and `ψ₁/ψ₂=εθ` with `θ` finite order and `εθ` totally odd. For nonzero B, the determinant-fixed `R_B` satisfies `dim R_B^{red}≤d+1`, every component has dimension `≥2d`, and its connectedness dimension is `≥2d−1`. If `Q∉Spec R_B^{red}`, then `dim R^{ps}/(Q∩R^{ps})≥1+dim R_B/Q`; minimal primes of `R_B` contract to minimal primes of `R^{ps}`. Here `R_B^{red}` denotes the reduced closed reducible locus, not the reduced ring `R_B` modulo its nilradical.

The cohomological restriction isomorphism of Pan Lemma 7.4.15 is proved here under LC using ArithmeticGaloisDuality §§R02.4.3–R02.4.4, D8.1, R02.6.1–R02.6.2: restriction `H¹(G_F,S,E(ψ₂/ψ₁))→⊕_{v|p}H¹(G_Fv,E(ψ₂/ψ₁))` is an isomorphism of dimension d, using Poitou–Tate and LC for the totally real field `F(θ)` with all places above S, including the extra away-p places. The coefficient module is `(E/𝒪)(2)`, not a finite torsion module; restriction–corestriction gives the needed vanishing for the rational dual of `H²(G_{F,S},(E/𝒪)(θε²))`. Use LocalGaloisDeformationRings §§F.2.5–F.2.11 and GlobalGaloisDeformations §§3.3–3.8 for Pan Lemmas 7.4.17–7.4.19: reducible-locus dimension, comparison of `R_B` with the completed integral deformation ring of a nonsplit residual lattice, and its Euler-characteristic presentation. Apply the connectedness-dimension bound proved here using DeformationAndDerivedPatchingAlgebra Layer 6 and Pan Corollary 2.3.7’s trace comparison to obtain all four conclusions of Corollary 7.4.20.

**Checks.**

- For `d=4`, every component has dimension at least 8, and every nonempty partition of all components into two unions has intersection dimension at least 7, exceeding the reducible-locus bound 5.
- In `k[[a,b,c,d,z₁,…,z₆]]/(ab,cd)`, the four components have dimension 8 and connectedness dimension 7, but the components `(a,c)` and `(b,d)` meet in dimension 6. A partition bound cannot be replaced by an arbitrary-pair bound.
- `R_B^{red}` is the reducible closed subscheme; reading it as `R_B` modulo its nilradical would make the dimension bound false, since that quotient has the dimension of `R_B`.

([Pan](<https://arxiv.org/pdf/1901.07166v2>) §7.4, Lemmas 7.4.15–7.4.19 and Corollary 7.4.20, pp.119–121.)

*Needs:* hypothesis LC (Conditional arithmetic hypotheses); §10.7a; §10.4; LocalGaloisDeformationRings §§F.2.5–F.2.11; GlobalGaloisDeformations §§3.3–3.8; ArithmeticGaloisDuality §§R02.4.3–R02.4.4, D8.1, R02.6.1–R02.6.2; DeformationAndDerivedPatchingAlgebra Layer 6.

### 10.12 Goodness within the extension component set

Assume hypothesis LC (Conditional arithmetic hypotheses). Under §10.11’s hypotheses, for each nonzero B, if one component in `Z_B` is good then all components in `Z_B` are good (Pan Corollary 7.4.22).

The degree is enlarged sufficiently for the strict dimension inequalities of the proof; they are not asserted for `d=1`.

Partition the union of components in `Z_B` into nonempty unions `Z₁,Z₂` and pull the partition back to `Spec R_B`. Connectedness dimension `≥2d−1` gives an intersection prime Q with `dim R_B/Q≥2d−1`. Since 2d−1>d+1 in the degree-enlarged setting, Q is outside the reducible locus. The trace-map dimension gain gives an intersection in the pseudodeformation space of dimension at least 2d. Use the trace-cut prime selection of GlobalGaloisDeformations §§3.3–3.8 (with the arithmetic refinements here) on this intersection, with the `|S\Σ_p|` equations, reducible-locus bound and finite-away-p-image check, to obtain a potentially nice common point. The step lemma `panGoodComponent_step` of §10.3 propagates goodness across the partition, ruling out a good/bad partition.

**Checks.**

- Every nonempty partition of all components of `Spec R_B` into two unions has intersection dimension at least `2d−1`. It meets the complement of the reducible locus since `2d−1>d+1` for `d>2`; at `d=4`, `7>5`, whereas the strict inequality fails at `d=1`.
- The ring `k[[a,b,c,d,z₁,…,z₆]]/(ab,cd)` satisfies the partition bound 7 although the pair `(a,c)`, `(b,d)` meets in dimension 6; the proof uses the entire partition pulled back from `Z_B`.
- Goodness propagates only inside `Z_B`; a minimal prime of `R^{ps}` not in the image of `Spec R_B` is not reached.

([Pan](<https://arxiv.org/pdf/1901.07166v2>) §7.4, Corollary 7.4.22 and proof, p.121.)

*Needs:* hypothesis LC (Conditional arithmetic hypotheses); §10.11; §10.3; §10.2; §10.10; GlobalGaloisDeformations §§3.3–3.8.

### 10.13 Goodness in the cyclotomic residual branch

Assume hypothesis LC (Conditional arithmetic hypotheses). In Pan §7.4, `p≥5` and after the coefficient, twist and degree enlargement of §7.1.2, suppose `χ̄|G_Fv=ω` at every v|p, with C the large component through the given irreducible regular de Rham point. Then C is good (Proposition 7.4.3). The inverse-cyclotomic orientation is obtained by relabelling and twisting; the `p=3` cyclotomic case is excluded.

Use the local ring `R_v^{ps}≅𝒪[[x₀,x₁,y₀,y₁]]/(x₀y₁−x₁y₀)`, with ordinary quotient by `(x₀,x₁)`, from LocalGaloisDeformationRings Layer 8. This initially gives only `dim C^{ord}≥1`. Choose a dimension-one ordinary q. If `ρ(q)` is irreducible, Pan Lemmas 7.4.8–7.4.10 use a deformation presentation to bound connectedness by 2d−1; the correctly oriented ordinary deformation component supplies a seed. A hypothetical good/bad partition then contains a potentially nice intersection point. If `ρ(q)=ψ₁⊕ψ₂` with ratio not `ε^{±1}` times finite order, Lemma 7.4.12 makes the local ordinary ideal principal after localization away from the singular cyclotomic point. The dimension and ordinary-density argument gives a seed component. In the remaining ratio `ψ₁/ψ₂=εθ` case, use §10.11 and §10.12. Choose `B₀` supported at one p-place via the cohomological restriction isomorphism, find a good component in `Z_B₀`, and realize C in `Z_B₁` via a normalized one-dimensional deformation lattice. Pan Lemma 7.4.23’s height-at-most-one off-diagonal ideal yields an intersection of a component of `Z_B₀` with one of `Z_B₁` of dimension at least d+2. Choose a potentially nice point there and propagate goodness. The generalized-matrix-algebra and height calculations use §0.2, with the comparisons proved here using LocalGaloisDeformationRings §F.2.11. The character-growth and reducible-locus estimates use §10.7a’s rank and local-unit image statements.

**Checks.**

- The local ordinary ideal has two generators globally in this branch; treating it as principal globally fails.
- The exceptional `p=3` branch is not included.

([Pan](<https://arxiv.org/pdf/1901.07166v2>) §7.4, Proposition 7.4.3 and proof, Lemmas 7.4.4–7.4.23, pp.117–124.)

*Needs:* hypothesis LC (Conditional arithmetic hypotheses); §10.7a; §10.7; §10.3; §10.8; §10.10; §10.4; §10.11; §10.12; LocalGaloisDeformationRings Layer 8; LocalGaloisDeformationRings §§F.2.5–F.2.11; GlobalGaloisDeformations §§3.3–3.8; §§0.1–0.3; OrdinaryAutomorphicFormsAndModularityLifting Layer 5; DeformationAndDerivedPatchingAlgebra Layer 6.

### 10.14 Pan’s nonordinary Hilbert modularity theorem

Assume hypothesis LC (Conditional arithmetic hypotheses). Let p>2, `F/ℚ` abelian totally real with p completely split, and `ρ:G_F→GL₂(𝒪)` continuous irreducible and finitely ramified. Assume `ρ̄^{ss}=χ̄₁⊕χ̄₂, χ̄₁/χ̄₂` extends to `G_ℚ` and takes value −1 at every complex conjugation. At every v|p, require `ρ|G_Fv` irreducible de Rham with distinct Hodge–Tate weights, and when `p=3` require the local residual ratio not `ω^{±1}`. Then `ρ` is a twist of a Hilbert modular representation (Pan Theorem 7.1.1).

Normalize `χ̄₁=1` by its finite-order lift. Use the solvable field and coefficient enlargements of §7.1.2, keeping total reality, p splitting and characteristic-zero irreducibility, then find the large component at `ρ`. The residual representation remains reducible. In the generic ratio branch use §10.8; in the scalar branch use §10.9. Produce a nice prime after base change and apply §10.6. For the cyclotomic branch at `p≥5` use §10.13. Lemma 7.4.2 chooses one solvable extension simultaneously for the finite component chain, starts from the ordinary modular seed, and repeatedly applies the nilpotent-kernel bridge. Apply nonordinary classicality and Jacquet–Langlands over the auxiliary field, then descend by solvable base change and untwist. No global residual modularity assumption is introduced.

**Checks.**

- At `p = 3 a` local residual ratio `ω` or `ω^{−1}` at some `v | 3` is excluded.
- An ordinary (locally reducible) `ρ|G_{F_v}` is outside this theorem; that case is the ordinary theorem of OrdinaryAutomorphicFormsAndModularityLifting with §10.8 and §10.9.

([Pan](<https://arxiv.org/pdf/1901.07166v2>) §7.1, Theorem 7.1.1; §7.4, Lemma 7.4.2, pp.111–116.)

*Needs:* hypothesis LC (Conditional arithmetic hypotheses); §10.7; §10.8; §10.9; §10.10; §10.3; §10.13; §10.6; ArithmeticGaloisRepresentations Layer 1; GL2AutomorphicRepresentationsAndTransfer §§R17.4.1–R17.4.11, R17.6.19; GlobalGaloisDeformations Layer R04.4.

### 10.15 Pan's theorem: the Fontaine–Mazur conjecture in the residually reducible case

Assume CC1–CC5 and LC (Conditional arithmetic hypotheses). Let p be odd and `ρ : G_ℚ → GL₂(E), E/ℚ_p` finite, continuous, irreducible, odd, unramified outside finitely many primes and potentially semistable at p, with `ρ|_{G_{ℚ_p}}` of distinct Hodge–Tate weights. Suppose `ρ̄^{ss} ≅ χ̄₁` ⊕ `χ̄₂` is a sum of two characters, and if `p = 3` that `χ̄₁χ̄₂^{−1}|_{G_{ℚ₃}} ≠ ω` (the mod-3 cyclotomic character). Then `ρ` comes from a cuspidal eigenform up to twist (Pan, Theorem 1.0.2). When `ρ|_{G_{ℚ_p}}` is reducible (ordinary) and `χ̄₁χ̄₂^{−1}|_{G_{ℚ_p}} ≠ 1` this is Skinner–Wiles; Pan supplies the missing ordinary case `χ̄₁χ̄₂^{−1}|_{G_{ℚ_p}} = 1` (his §6) and the non-ordinary case (his Theorem 7.1.1).

Irreducibility of `ρ` is kept: `ρ̄` being a sum of characters does not make `ρ a` sum of characters.

No residual modularity is assumed: residually reducible representations are handled with pseudo-representations.

At `p = 3` the case `χ̄₁χ̄₂^{−1}|_{G_{ℚ₃}} = ω` is excluded throughout the paper, for lack of p-adic local Langlands input (Pan's Theorems 3.4.5–3.4.6); Dieulefait–Pacetti quote the theorem only for `p ≥ 5`.

For `p ≥ 5`, with the twist normalised by §7.11 and §7.9, this proves `ResiduallyReducibleLifting`(p) of §7.3; §12.3 is its use along congruences.

Split by whether the local characteristic-zero representation at p is reducible. In the reducible local case apply the exact ordinary theorems of Pan 5.1.2 (distinguished) or 6.1.2 (scalar residual local ratio), proved in §§10.8–10.9 with their finite `Λ-algebra` comparisons. In the irreducible local case apply §10.14 with `F=ℚ`; the generic, scalar and cyclotomic components have separate proof paths. Untwist using the global geometric-character convention. At `p=3, ω=ω^{−1}`, so swapping residual characters leaves the excluded case unchanged.

**Checks.**

- `ρ̄^{ss} ≅ 1` ⊕ `χ̄₅` at `p = 5` with `ρ|_{G_{ℚ₅}}` irreducible and de Rham of distinct weights: covered (non-ordinary case).
- `p = 3` with `ρ̄^{ss} ≅ 1` ⊕ `χ̄₃`: excluded `(χ̄₃|_{G_{ℚ₃}} = ω)`; this is Dieulefait–Pacetti's `p = 3` branch, OrdinaryAutomorphicFormsAndModularityLifting §5.5 (Skinner–Wiles at `p = 3`).

([Pan](<https://arxiv.org/pdf/1901.07166v2>) Introduction, Theorem 1.0.2, p. 3 (arXiv v2); [Pan](<https://arxiv.org/pdf/1901.07166v2>) Introduction, after Theorem 1.0.2, p. 3 (arXiv v2).)

*Needs:* hypotheses CC1–CC5 (Conditional arithmetic hypotheses); hypothesis LC (Conditional arithmetic hypotheses); §10.14; OrdinaryAutomorphicFormsAndModularityLifting Layer 5; ArithmeticGaloisRepresentations §§1.2, 1.10, 2.1–2.4, 4.1; PadicHodgeTheory §§5.1–5.3.

### Examples

A one-component chain is good as soon as its component contains a potentially nice seed point; with an empty seed set no component is good; in a two-edge chain the middle component must share a potentially nice point with each neighbour (§10.3). With the identity map every minimal prime is an extension component; with a zero target there are none (§10.4). At `p = 3` the residual ratio `ω` on `G_{ℚ₃}` is excluded throughout (§10.15).

### Dependencies

ArithmeticGaloisDuality (§§R02.4.3–R02.4.4, D8.1, R02.6.1–R02.6.2); ArithmeticGaloisRepresentations (Layer 1; §§1.2, 1.10, 2.1–2.4, 4.1); hypotheses CC1–CC5 and LC; §10.7a; DeformationAndDerivedPatchingAlgebra (Layer 6); GL2AutomorphicRepresentationsAndTransfer (§§R17.3.1–R17.3.9; §§R17.4.1–R17.4.11, R17.6.19); LocalGaloisDeformationRings (§§F.1.1–F.2.11); GlobalGaloisDeformations (§§3.3–3.8; Layer R04.4); LocalGaloisDeformationRings (Layer 8); Mathlib and Tau Ceti (`PrimeSpectrum.comap, Relation.ReflTransGen.trans, Relation.ReflTransGen, Relation.reflTransGen_iff_eq, minimalPrimes.equivIrreducibleComponents, minimalPrimes`); OrdinaryAutomorphicFormsAndModularityLifting (Layer 5); PadicHodgeTheory (§§3.2–3.6; §§5.1–5.3); §§0.1–0.3.

## Layer 11: The ordinary 3-adic completion

Normalise a 3-adic representation by its ordinary quotient character (§11.1) and complete the crystalline weights two and four at 3 (§11.2), both through Skinner–Wiles at `p = 3`, which OrdinaryAutomorphicFormsAndModularityLifting §5.5 states. This branch is needed because Pan's theorem excludes the residual ratio `ω` at 3, which is exactly the residual 1 ⊕ `ω₃` case.

### 11.1 Normalization by the ordinary quotient character

Let `ρ` be a continuous irreducible odd finitely ramified 3-adic representation with an ordinary local quotient `β` unramified at 3, residual characters `ᾱ,β̄` globally with `β̄` restricting to the reduction of that quotient, and determinant `ψε^{k−1}` with `ψ` finite order and integer `k≥2`. Let `η` be the Teichmüller lift of the global character `β̄` and twist by `η^{−1}`. Then the residual characters become `ᾱβ̄^{−1},1`, the local quotient remains unramified (hence trivial on inertia), `det(ρ⊗η^{−1})=(ψη^{−2})ε^{k−1}`, and the Hodge–Tate weights and oddness are unchanged. If `ᾱβ̄^{−1}=ω₃` globally, this is exactly the imported Skinner–Wiles `p=3` interface; otherwise a nontrivial local ratio is sufficient for its more general distinguished theorem.

Import finite-order character lifts, twists, determinant and weight formulas from ArithmeticGaloisRepresentations §§1.2, 1.10. Choose `β̄` by the actual local ordinary quotient, rather than an arbitrary labelling of the two residual characters. Since `β` is unramified at 3, its reduction and Teichmüller lift are trivial on inertia; this preserves the quotient condition. Apply the imported distinguished Skinner–Wiles theorem. The source residual `1⊕ω₃` specialization requires the ratio globally, while the theorem over `ℚ` needs only its nontrivial local restriction.

**Checks.**

- A finite-order twist preserves weight k; an inverse cyclotomic twist generally shifts both weights and cannot be silently substituted.
- After twisting an arbitrarily chosen residual character, the inertia quotient need not be trivial.

([SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) Introduction, Theorem, printed p.6 (Numdam page image); [DP](<https://arxiv.org/pdf/2108.07577v2>) §1.2, Theorem 1.7, arXiv p.4; publisher PDF p.5.)

*Needs:* ClassicalSerreModularity §I.1; ArithmeticGaloisRepresentations Layer 1; ArithmeticGaloisRepresentations §§1.2, 1.10, 2.1–2.4, 4.1; OrdinaryAutomorphicFormsAndModularityLifting §5.4; OrdinaryAutomorphicFormsAndModularityLifting §5.5.

### 11.2 The crystalline p=3 completion in weights two and four

Let `ρ:G_ℚ→GL₂(E), E/ℚ₃` finite, be irreducible, odd, continuous, finitely ramified and crystalline at 3 with Hodge–Tate weights {0,k−1}, `k∈{2,4}`. If its residual semisimplification is a sum of two global characters, then `ρ` is modular of weight k. In the level-one branch of DP, normalization has residual characters `1,ω₃`; without level one the general distinguished Skinner–Wiles theorem still applies after quotient-character normalization.

Use the rank-two ordinarity criterion PadicHodgeTheory §6.4 in the interval `2≤k≤p+1` over `ℚ_p` (part (c), including its endpoint `k=p+1`). A nonordinary crystalline representation of `G_{ℚ_3}` with weights {0,k−1}, `2≤k≤4`, has irreducible reduction (Fontaine–Laffaille for `k≤3`, Berger–Li–Zhu at `k=4`, as in the proof of that criterion), so a reducible reduction, whose inertial constituents are then `ω^{k−1}` and 1, is residually ordinary for a suitable stable lattice and the representation is ordinary. Its two local characters are unramified times `ε^{k−1}` and an unramified quotient. At `p=3` and `k=2` or 4, k−1 is odd, so the residual ratio on inertia is `ω₃≠1`. Thus this is the distinguished ordinary case. The determinant of a global geometric character is finite order times `ε^{k−1}`, supplied by ArithmeticGaloisRepresentations §§1.2, 1.10, 2.1–2.4, 4.1. Apply §11.1 and the general Skinner–Wiles theorem. In DP’s level-one specialization, the normalized residual global ratio is `ω₃`, so apply OrdinaryAutomorphicFormsAndModularityLifting §5.5 (Skinner–Wiles at `p = 3`).

**Checks.**

- Weights 2 and 4 at 3 are covered even though they lie in Pan’s excluded local `ω` branch.
- The statement does not cover arbitrary crystalline weights, nor arbitrary noncrystalline de Rham representations with residual `1⊕ω₃`.

([DP](<https://arxiv.org/pdf/2108.07577v2>) §2, Paso 6, arXiv p.14 / publisher PDF p.14; §1.2, Theorem 1.7, arXiv p.4 / publisher PDF p.5.)

*Needs:* ClassicalSerreModularity §I.1; §11.1; PadicHodgeTheory §6.4; OrdinaryAutomorphicFormsAndModularityLifting §5.4; ArithmeticGaloisRepresentations §§1.2, 1.10, 2.1–2.4, 4.1; OrdinaryAutomorphicFormsAndModularityLifting §5.5.

### Examples

At `p = 3` and `k ∈ {2, 4}, k − 1` is odd, so the residual inertial ratio is `ω₃ ≠ 1` and the crystalline representation is ordinary and distinguished (§11.2). For either ordering of 1 ⊕ `ω₃`, the ratio restricted to `G_{ℚ₃}` is `ω`, since `ω² = 1 mod 3`.

### Dependencies

ArithmeticGaloisRepresentations (Layer 1; §§1.2, 1.10, 2.1–2.4, 4.1); OrdinaryAutomorphicFormsAndModularityLifting (Layer 5); PadicHodgeTheory (§6.4).

## Layer 12: Modularity transfer for congruence arguments

Deduce the transfer statements that congruence arguments use: along a congruence at an odd prime with cyclotomically irreducible residual representation (§12.1), at 2 with nonsolvable residual image (§12.2), for residually reducible members, also at a ramified coefficient prime (§12.3, §12.6), and for the ordinary 3-adic branch (§12.5). Along rank-two family data with all-member de Rham clauses, de Rham lifting suffices without a Weil–Deligne comparison at the coefficient prime (§12.7), and modularity transfers between families linked by one residual congruence (§12.8). §12.4 records which inputs of these statements are independent of Serre's conjecture.

### 12.1 Modularity transfer along a congruence at an odd prime with cyclotomically irreducible residual representation

Assume LL1–LL3 and CC4–CC5. Let p be odd and `ρ, ρ′ : G_ℚ → GL₂(ℚ̄_p)` continuous, odd, finitely ramified, with `ρ̄ ≅ ρ̄′, ρ̄|_{G_{ℚ(√p*)}}` absolutely irreducible, and `ρ|_{G_{ℚ_p}}, ρ′|_{G_{ℚ_p}}` de Rham with Hodge–Tate weights `{0, k − 1}, {0, k′ − 1} (k, k′ > 1)`. Then `ρ` is modular if and only if `ρ′` is. This is Dieulefait–Pacetti's Theorem 1.4 read as a transfer statement: if `ρ` is modular then `ρ̄ = ρ̄′` is modular and Theorem 1.4 applies to `ρ′`. Its proof is §8.8, for every odd p, 3 included: Kisin's Theorem (2.2.17), with Emerton's Theorem 3.3.22 removing his abelian hypothesis, and the Breuil–Mézard results of Paškūnas, Hu–Tan `(p ≥ 5)` and Tung (every `p > 2`) removing the local exclusion.

Absolute irreducibility over `ℚ(√p*)` is equivalent to that over `ℚ(ζ_p)` (Dieulefait–Pacetti Lemma 1.13; over `ℚ` this is ArithmeticGaloisRepresentations §§4.6–4.7 (b), since the quadratic subfield of `ℚ(ζ_p)` is `ℚ(√p*)`); it is the hypothesis in the combined theorem as Tung states it.

Residual modularity is the only global modularity input; Serre's conjecture is not used (§12.4).

Modularity is up to a global character twist, normalised by §7.11 and §7.9; with weights {0,k−1} this fixes the classical weight k.

Theorem 1.4 (Kisin, Emerton, Paškūnas, Hu–Tan, Tung) applied to `ρ′`, whose residual representation is that of the modular `ρ`.

**Checks.**

- A newform f and a congruent de Rham lift `ρ′` of `ρ̄_f` of a different Hodge–Tate weight: `ρ′` is modular.
- Non-example: `ρ̄` bad dihedral (`ρ̄|_{G_{ℚ(√p*)}}` reducible) is excluded; Dieulefait–Pacetti avoid it by their Lemma 1.14, which ClassicalSerreModularity applies.
- The two lifts may have different regular weights and local types; no same-component hypothesis is being imported into these Q-level modern lifting statements.

([DP](<https://arxiv.org/pdf/2108.07577v2>) Theorem 1.4 and its proof, p. 4 (arXiv v2); [Tung, dyadic](<https://arxiv.org/pdf/1908.06174v3>) Introduction, the theorem of Kisin, Paškūnas, Hu–Tan and Tung, pp. 1–2 (arXiv v3); [Tung, odd p](<https://arxiv.org/pdf/1803.07451v4>) Theorem 4.7, p. 15 (arXiv v4).)

*Needs:* hypotheses LL1–LL3 and CC4–CC5 (Conditional arithmetic hypotheses); §8.8; ArithmeticGaloisRepresentations §§4.6–4.7; ArithmeticGaloisRepresentations Layer 1; ArithmeticGaloisRepresentations §§1.2, 1.10, 2.1–2.4, 4.1; PadicHodgeTheory §§5.1–5.3.

### 12.2 Modularity transfer along a congruence at 2 with non-solvable residual image

Assume CC1 and CC4–CC5. Let `ρ, ρ′ : G_ℚ → GL₂(ℚ̄₂)` be continuous, odd, finitely ramified, de Rham at 2 with Hodge–Tate weights `{0,k−1}` and `{0,k′−1}`, respectively, where `k,k′≥2`, with `ρ̄ ≅ ρ̄′` of non-solvable image. Then `ρ` is modular if and only if `ρ′` is (Dieulefait–Pacetti Theorem 1.5, from §9.3).

Non-solvable residual image is needed at `p = 2`.

Irreducibility of `ρ, ρ′` follows from that of `ρ̄`.

Modularity is up to a global character twist, normalised by §7.11 and §7.9; with weights {0,k−1} this fixes the classical weight k.

§9.3 applied to `ρ′` with `ρ̄′ = ρ̄` modular.

**Checks.**

- Dieulefait–Pacetti §3: a weight-2 system through a dyadic lift of a non-solvable `ρ̄` transfers modularity from an odd member back to the 2-adic one.
- The two lifts may have different normalized weights `{0,k−1}` and `{0,k′−1}` and local types; no same-component hypothesis is being imported into these Q-level modern lifting statements.
- Twisting a normalized modular lift by ε gives distinct weights with minimum 1; it falls outside this exact-modularity statement until §7.6 normalizes it.

([DP](<https://arxiv.org/pdf/2108.07577v2>) Theorem 1.5 and its proof, p. 4 (arXiv v2).)

*Needs:* hypotheses CC1, CC4–CC5 (Conditional arithmetic hypotheses); §9.3; §§7.6, 7.9, 7.11; ArithmeticGaloisRepresentations Layer 1; ArithmeticGaloisRepresentations §§1.2, 1.10, 2.1–2.4, 4.1; PadicHodgeTheory §§5.1–5.3.

### 12.3 Modularity of residually reducible representations at a ramified coefficient prime

Assume CC1–CC5 and LC (Conditional arithmetic hypotheses). Let `p ≥ 5` (or `p = 3` outside Pan's exclusion) and `ρ : G_ℚ → GL₂(ℚ̄_p)` continuous, irreducible, odd and finitely ramified, de Rham at p with Hodge–Tate weights `{0,k−1}`, `k≥2`, with `ρ̄^{ss} a` sum of two characters. Then `ρ` is modular (Dieulefait–Pacetti Theorem 1.6, from Skinner–Wiles and §10.15). In a congruence argument this is used when a member of an almost strictly compatible system is residually reducible at its own prime p, possibly with p in the ramification set: no residual modularity and no ordinarity is needed.

Dieulefait–Pacetti state `p ≥ 5`; Pan's theorem also covers `p = 3` when `χ̄₁χ̄₂^{−1}|_{G_{ℚ₃}} ≠ ω`, and the `p = 3` case with `ω` is OrdinaryAutomorphicFormsAndModularityLifting §5.5 (Skinner–Wiles at `p = 3`) under its ordinary hypotheses (§12.5).

Modularity is up to a global character twist, normalised by §7.11 and §7.9; with weights {0,k−1} this fixes the classical weight k.

Ordinary case: Skinner–Wiles (OrdinaryAutomorphicFormsAndModularityLifting §5.4) and Pan §6; non-ordinary case: Pan's Theorem 7.1.1; both through §10.15.

**Checks.**

- A member `ρ_ℓ` of a compatible system with weights `{0,k−1}`, `k≥2`, and `ρ̄_ℓ` reducible at a prime ℓ `≥ 5` of the ramification set: modular without any local comparison at ℓ.
- At `p=5`, `V₅(11a1)⊗ε₅` is irreducible, odd and crystalline with residual semisimplification `ω₅⊕ω₅²`, but weights `{1,2}`. It is outside this normalized statement; §7.6 first removes its cyclotomic twist.
- A reducible `ρ` with the same residual semisimplification is outside the statement: irreducibility of the characteristic-zero `ρ` is a hypothesis.
- At `p = 3` with `χ̄₁χ̄₂^{−1}|_{G_{ℚ₃}} = ω` the statement does not apply; only the ordinary branch of §12.5 covers that case.

([DP](<https://arxiv.org/pdf/2108.07577v2>) Theorem 1.6 and its proof, p. 4 (arXiv v2).)

*Needs:* hypotheses CC1–CC5 (Conditional arithmetic hypotheses); hypothesis LC (Conditional arithmetic hypotheses); §10.15; §§7.6, 7.9, 7.11; OrdinaryAutomorphicFormsAndModularityLifting §5.4; ArithmeticGaloisRepresentations Layer 1; ArithmeticGaloisRepresentations §§1.2, 1.10, 2.1–2.4, 4.1; PadicHodgeTheory §§5.1–5.3.

### 12.4 Which inputs of the lifting theorems are independent of Serre’s conjecture

The transfer statements of this layer use the lifting theorems over `ℚ` only in the forms that keep residual modularity as a hypothesis (§7.7), and Pan’s residually reducible theorem (§10.15), which needs no residual modularity. Two printed consequences are excluded because their proofs invoke Serre’s conjecture: Pan’s Theorem 1.0.4, through his Remark 8.0.4, and Emerton’s unconditional promodularity (his Theorem 1.2.3, proved in §7.3). Separately from the residual modularity of the global lift, Tung’s proof of the local Breuil–Mézard input uses auxiliary globalisations: his Lemma 4.3.3 cites Calegari Proposition 3.2, Snowden Proposition 8.2.1 and, at `p = 2`, the construction of KW II Theorem 6.1; his Lemma 4.3.4 cites Paškūnas Lemma 3.29 and KW II Lemma 3.5. The independence of these globalisations from Serre’s conjecture is input (CC5) of the supplier contracts, and every statement of Layers 8–12 that rests on Tung’s or Paškūnas’s local theorems is proved conditionally on it.

Also conditional on (CC5): the patched modules of Caraiani–Emerton–Gee–Geraghty–Paškūnas–Shin, the faithfulness theorem of Emerton–Paškūnas, Barnet-Lamb–Gee–Geraghty Theorem A.4.1, and the weight-part theorem of Gee (Automorphic lifts of prescribed types, Theorem 4.4.12 in Kisin’s citation; Theorem 4.6.9 in the author PDF) that Kisin’s proof of (2.2.17) uses.

Classify each statement used by the transfer lemmas as a theorem with assumed residual modularity, a residually reducible theorem, or an auxiliary globalisation or weight-change input. Tung §4.3 separates the local Breuil–Mézard globalisations from the given modular residual representation of his Theorem 8.0.3: the globalisations are needed even when the final theorem starts from a modular residual representation. Emerton Theorem 3.3.22 uses a specially constructed CM-induced residual representation and a weight-part theorem for it; that restricted route is kept, and the full-Serre promodularity corollary is excluded.

**Checks.**

- A theorem whose displayed hypotheses include residual modularity may still use Serre’s conjecture inside an auxiliary globalisation; the display alone does not establish independence.
- Pan Theorem 1.0.4 and Emerton Theorem 1.2.3 do not appear among the inputs of Layers 8–12.
- The ordinary branch has ClassicalSerreModularity §I.1 as an ancestor via OrdinaryAutomorphicFormsAndModularityLifting §§5.4–5.5. That standalone theorem assumes its own residual and ordinary hypotheses; the assertion of Serre’s conjecture is not used.
- The general exports of §§5.18 and 6.16 retain the full KW local-type ranges. The narrower applications in ClassicalSerreModularity §I.2 identify their local weights and determinant separately; its R33.1 applications require the LL/CC/LC hypotheses of the modern branch they use.

([Tung, dyadic](<https://arxiv.org/pdf/1908.06174v3>) Introduction, p. 2 (arXiv v3); [Paškūnas, 2-adic](<https://arxiv.org/pdf/1509.00332v2>) §1.1.2 'Global part', p. 5 (arXiv v2); [Pan](<https://arxiv.org/pdf/1901.07166v2>) Remark 8.0.4, p. 125 (arXiv v2); [Emerton, LGC](<http://www.math.uchicago.edu/~emerton/pdffiles/lg.pdf>) §7.3, proof of Theorem 1.2.3, p. 96; [Emerton, LGC](<http://www.math.uchicago.edu/~emerton/pdffiles/lg.pdf>) §7.4, completion of the proof of Theorem 3.3.22, p. 97; [Hu–Tan](<https://arxiv.org/pdf/1309.1658v2>) Proof of Theorem 6.3, p. 35 (arXiv v2); [Tung, dyadic](<https://arxiv.org/pdf/1908.06174v3>) §4.3, Lemmas 4.3.3–4.3.4, pp.20–21.)

*Needs:* hypothesis CC5 (Conditional arithmetic hypotheses); SerreWeightAndLevelOptimisation §§6.6–6.11; ClassicalSerreModularity §I.1; OrdinaryAutomorphicFormsAndModularityLifting §§5.4–5.5.

### 12.5 Ordinary congruence transfer at three

Let `ρ,ρ′` be continuous irreducible odd finitely ramified 3-adic representations. Suppose each, after a specified finite-order quotient-character normalization, has residual semisimplification `1⊕ω₃`, is of inertia shape (∗ ∗;0 1), and has determinant finite order times `ε^{k−1}` for its own integer `k≥2`. Then each is modular, hence modularity is equivalent for the two lifts. Neither identical weights nor identical inertial types are required. Congruence alone does not imply the ordinary hypotheses on the second lift.

Apply §11.1 to each lift with its own designated quotient. Apply OrdinaryAutomorphicFormsAndModularityLifting §5.5 (Skinner–Wiles at `p = 3`) to each normalized lift and untwist; both conclusions give the equivalence.

**Checks.**

- Two lifts of weights 2 and 4, each with residual 1 ⊕ `ω₃` after normalisation and ordinary inertia shape at 3, are modular of weights 2 and 4 respectively; equal weights are not needed.
- A lift congruent to an ordinary one but nonordinary at 3 does not satisfy the inertia hypothesis, and the statement says nothing about it.

([DP](<https://arxiv.org/pdf/2108.07577v2>) §1.2, Theorem 1.7, arXiv pp.4–5 / published p.5.)

*Needs:* ClassicalSerreModularity §I.1; §11.1; OrdinaryAutomorphicFormsAndModularityLifting §5.5; ArithmeticGaloisRepresentations Layer 1.

### 12.6 Transfer at a ramified reducible coefficient prime

For the Pan alternatives assume CC1–CC5 and LC (Conditional arithmetic hypotheses). Let `𝓕 : RankTwoFamily` have retained data `(E,S,(ρ_λ),(P_q))` as in the Conventions with odd members, every member de Rham at its coefficient prime with Hodge–Tate weights `{0, k − 1}, k > 1`. Let `λ | p` with `p ∈ S` and `p ≥ 5`, and suppose `ρ_λ` is irreducible in characteristic zero while `ρ̄_λ^{ss}` is a sum of two characters. Then `ρ_λ` is modular by Pan’s theorem, without any comparison of `WD(ρ_λ|G_{ℚ_p})` with the family parameter at p, and its good Frobenius polynomials identify the whole family with the system of that newform. At `p = 3` the same conclusion holds when the residual ratio is not `ω` on `G_{ℚ₃}`, or under the normalized ordinary hypotheses of Layer 11.

The de Rham and fixed-weight clauses (Dieulefait–Pacetti Definition 1.10 (4)–(5)) are explicit hypotheses; the weakened clause (6) imposes no Weil–Deligne comparison at a ramified residually reducible coefficient prime.

Irreducibility and oddness of `ρ_λ` are hypotheses, not consequences of the congruences of the family.

Pass from de Rham to potentially semistable at p (PadicHodgeTheory §§5.1–5.3), where Pan’s hypothesis uses that word, and apply §12.3 at `p ≥ 5`, or the `p = 3` branch under its extra hypotheses (§12.3 outside the exclusion, §12.5 after normalization). The fixed-eigenform family over a common coefficient field with common good Frobenius polynomials (AutomorphicGaloisRepresentations §7.3), its absolute irreducibility (§4.8) and good-prime recognition (ArithmeticGaloisRepresentations Layer 5) identify every semisimple member after common coefficient extension. Only good primes are used, never the missing local comparison at p.

**Checks.**

- A member at `p ∈ S` with reducible residual representation is covered at `p ≥ 5` without assuming it crystalline.
- Family data lacking the de Rham clause at that member require it as an additional hypothesis before this applies.
- For a weight-two newform, every good polynomial is `X²−a_qX+ψ(q)q` in the common coefficient field (§7.3 of AutomorphicGaloisRepresentations); a proposed second member with a different trace at a good q cannot be recognized as that family.

([DP](<https://arxiv.org/pdf/2108.07577v2>) §1.4, Definition 1.10 and Remark 4, arXiv pp.6–7 / publisher PDF p.7.)

*Needs:* hypotheses CC1–CC5 and LC for the Pan alternatives (Conditional arithmetic hypotheses); §12.3; §12.5; PadicHodgeTheory §§5.1–5.3; ArithmeticGaloisRepresentations §§5.3–5.7; AutomorphicGaloisRepresentations §4.8; AutomorphicGaloisRepresentations §7.3.

### 12.7 De Rham lifting suffices along a family without coefficient-prime Weil–Deligne data

Assume LL1–LL3 and CC4–CC5 in the odd irreducible branch, CC1 and CC4–CC5 in the dyadic branch, and CC1–CC5 and LC in the Pan branch (Conditional arithmetic hypotheses). Let `𝓕 : RankTwoFamily` have retained data `(E,S,(ρ_λ),(P_q))` as in the Conventions whose members are odd, and suppose that every member is de Rham at its own coefficient prime with Hodge–Tate weights `{0, k − 1}` for one `k > 1` (clauses (4)–(5) of Dieulefait–Pacetti Definition 1.10). No comparison between the Weil–Deligne representation of `ρ_λ` at its coefficient prime and the family parameter is assumed there. Let `λ` be a place at which `ρ_λ` is irreducible over `ℚ̄_ℓ` and one of the following holds: ℓ `= 2`, the residual image is nonsolvable, and the selected residual representation has a cuspidal modularity witness (for example, a congruent modular lift); ℓ odd, the residual representation restricted to `G_{ℚ(ζ_ℓ)}` is absolutely irreducible and some congruent lift is known to be modular; ℓ `≥ 5` (or ℓ `= 3` outside Pan’s exclusion) and the residual semisimplification is a sum of two characters; ℓ `= 3` and the normalized ordinary hypotheses of Layer 11 hold. Then `ρ_λ` is modular, and every member of the family is attached to the same newform after common coefficient extension.

The de Rham and weight clauses are hypotheses on every member at its own coefficient prime. A family that is only almost strictly compatible in the sense of Khare–Wintenberger I §5 does not include them, and they are not consequences of the Khare–Wintenberger definition.

This consumes a given family; it does not assert that a family exists through every regular de Rham lift (Dieulefait–Pacetti Theorem 1.11 claims such existence; that claim is not used).

Irreducibility and oddness of the selected member are checked hypotheses, not consequences of the congruence.

Apply the branch-appropriate statement to the selected member: §9.3 at ℓ `= 2` with that residual modularity witness, §12.1 at odd ℓ with a modular congruent lift, §12.3 in the residually reducible case (with §12.6 when ℓ lies in S), and §12.5 for the normalized ordinary case at 3. The newform g so obtained has good Frobenius polynomials equal to the `P_q` outside S, the level of g and ℓ, after common coefficient extension. Since every member is semisimple and `ρ_g` is absolutely irreducible (AutomorphicGaloisRepresentations §4.8), Frobenius-polynomial recognition (ArithmeticGaloisRepresentations Layer 5) identifies every member with the corresponding realization of g, one residue characteristic at a time.

**Checks.**

- At a ramified coefficient prime ℓ `≥ 5` with reducible residual representation, de Rham plus Pan applies without a Weil–Deligne equality at ℓ.
- Family data missing the de Rham clause at some member do not satisfy the hypothesis at that member.
- A dyadic member with nonsolvable residual image but no cuspidal residual modularity witness does not satisfy the dyadic alternative; an equivalence between modularities cannot supply the first modular member.
- Recognition compares characteristic polynomials only at good primes, after common coefficient extension and semisimplification.

([DP](<https://arxiv.org/pdf/2108.07577v2>) §1.4, Definition 1.10 and the definition of almost strictly compatible systems, pp. 6–7 (arXiv v2); [DP](<https://arxiv.org/pdf/2108.07577v2>) Remark 4, p. 7 (arXiv v2).)

*Needs:* hypotheses LL1–LL3 and CC4–CC5 for the odd irreducible branch, CC1 and CC4–CC5 for the dyadic branch, CC1–CC5 and LC for the Pan branch (Conditional arithmetic hypotheses); §12.1; §12.2; §9.3; §12.3; §12.5; §12.6; ArithmeticGaloisRepresentations §§5.3–5.7; AutomorphicGaloisRepresentations §4.8; AutomorphicGaloisRepresentations §7.3.

### 12.8 Directed modularity transfer between families linked by one residual congruence

Assume LL1–LL3 and CC4–CC5 in the odd irreducible branch, CC1 and CC4–CC5 in the dyadic branch, and CC1–CC5 and LC in the Pan branch (Conditional arithmetic hypotheses). For `i=A,B` let `𝓕_i : RankTwoFamily` have coefficient field `E_i`, bad set `S_i`, members `ρ_i,λ` over their specified finite local realization fields, and common arithmetic good polynomials `P_i,q`. Choose `λ_A` and `λ_B` above the same rational prime p, coefficient embeddings into `Q̄_p`, and stable lattices with isomorphic residual semisimplifications over `F̄_p`. Both selected characteristic-zero representations are irreducible after extension to `Q̄_p`, odd, finitely ramified and de Rham, of weights `{0,k_A−1}` and `{0,k_B−1}`, with `k_A,k_B≥2`. If one A-member is attached to a normalized cuspidal newform of weight at least two, and the relevant branch hypothesis below holds, then every B-member is attached, after common coefficient extension with compatible algebraic embeddings, to one normalized cuspidal newform g of weight `k_B`. Under the reducible Pan or ordinary-three branch, the same conclusion follows from the B-family data alone, without a modular A-family or a residual congruence.

Odd irreducible branch: p is odd and the common residual representation restricted to `G_Q(ζ_p)` is absolutely irreducible. A known modular A-member is the modularity seed; congruence supplies residual modularity for B.

Dyadic branch: `p=2` and the common residual image is nonsolvable. Oddness is imposed on the characteristic-zero representations; reduction modulo two cannot detect its determinant sign.

Reducible Pan branch: `p≥5` and the selected B-residual semisimplification is `χ̄_1⊕χ̄_2`; also allow `p=3` if `(χ̄_1χ̄_2^−1)|G_Q3` differs from `ω_3`. Irreducibility over `Q̄_p` remains required, rather than irreducibility only over a finite coefficient field. No ordinarity, residual modularity or coefficient-prime Weil–Deligne comparison is assumed.

Exceptional ordinary-three branch: `p=3`; a specified finite-order character `η` gives `τ=ρ_B,λB⊗η^−1` with residual semisimplification `1⊕ω_3` globally, `τ|I_3` upper triangular with quotient 1, and `det τ=ψ ε_3^(k_B−1)` for `ψ` of finite order. The normalization is justified by the actual ordinary quotient. Congruence does not establish these hypotheses.

For all good-prime identities, enlarge coefficient number fields and local fields before comparing. No isomorphism between different-characteristic coefficient fields is asserted. Frobenius recognition is applied separately in each fixed residue characteristic.

The family hypotheses are ordinary indexed representation and polynomial data, not an invocation of a compatible-system carrier, existence theorem, strict compatibility or all-member de Rham predicate. Only the selected members need the stated de Rham condition.

If a modular A-member is supplied, identify its good Frobenius polynomials with those of its newform. Form a compositum of `E_A` and the newform coefficient field using the relative embeddings determined by that realization. Injectivity of the resulting local embedding makes these identities identities of algebraic numbers. Extend the chosen embedding of `E_A` at `λ_A` to this compositum; this does not require the seed and `λ_A` to have the same residue characteristic. Apply the ArithmeticGaloisRepresentations Layer 5 recognition theorem at `λ_A`. The A-member is semisimple after coefficient extension, the fixed-eigenform family is supplied by AutomorphicGaloisRepresentations §7.3, and its newform representations are absolutely irreducible by §4.8; hence recognition identifies the actual representations, not merely their semisimplifications. ArithmeticGaloisRepresentations §1.9 makes the newform residual class independent of the lattice and finite coefficient model. The specified congruence therefore supplies residual modularity for B. In the odd irreducible and dyadic cases apply §12.1 or §12.2 to the selected pair. In the Pan case apply §12.3 directly to B. In the exceptional ordinary-three case apply OrdinaryAutomorphicFormsAndModularityLifting §5.5 (Skinner–Wiles at `p = 3`) to `τ`. Preserve the distinction between an exact attached-newform conclusion and a source conclusion only up to a character twist. For an up-to-twist conclusion `ρ_{B,λ_B} ≅ ρ_h ⊗ χ`, apply §7.11: the actual `χ` has the form `ε_p^m μ` with `μ` of finite order, and h has weight at least two, because the selected B-member is de Rham with distinct weights. With that input, §7.9 gives `m=0` and the weight `k_B`. Import the Dirichlet twist and primitive-associate construction from TauCetiRoadmap ModularForms, Layer 9: its cuspidal twist has good eigenvalues multiplied by `μ(Frob_q)` and nebentypus multiplied by `μ²`, and its primitive associate g has the same weight and good eigenvalues. Combine the AutomorphicGaloisRepresentations Layers 1–2 polynomial formula, AutomorphicGaloisRepresentations §4.8 irreducibility and ArithmeticGaloisRepresentations Layer 5 recognition to identify `ρ_h ⊗ μ` with `ρ_g`. Apply the same finite-order twisting argument to undo `η` in the ordinary-three branch. This supplies the normalized newform witness. Compare `P_B,q` with the good polynomial of g in the relative compositum determined by the selected B-realization. For each B-place extend its specified embedding of `E_B` to that compositum and a common local coefficient field. Remove the finite ramification sets, g’s level primes and this member’s residue characteristic. Apply ArithmeticGaloisRepresentations Layer 5 separately in each fixed characteristic. Semisimplicity of the B-member and absolute irreducibility of the g-realization identify the actual representations. No coefficient-prime Weil–Deligne equality is used.

**Checks.**

- Under LC, a bridge at `p=5` may have p in `S_B` and reducible residual B-member. Given characteristic-zero irreducibility, oddness and de Rham weights {0,3}, Pan produces a weight-four witness without coefficient-prime WD data or a modular A-family.
- At `p=3 a` normalized residual sum `1⊕ω_3` has excluded Pan ratio `ω_3` in either ordering. The ordinary-three branch works only after the inertia-quotient and finite-order determinant hypotheses have been checked on B.
- At `p=2` an isomorphism of residual representations with solvable image does not enter the dyadic branch; nor does residual determinant 1 establish characteristic-zero oddness.
- A modular A-family and a residual congruence alone do not enter any branch when B is missing the required local or residual-image conditions.
- Within one family, modularity of a member propagates using only good polynomials and semisimplicity, without de Rham conditions at the other coefficient primes. A claimed equality of good polynomials must be checked after specified coefficient embeddings.
- A finite chain is handled edge by edge, recording the prime, embeddings, lattices, selected weights and the applicable branch for each directed edge. Reverse traversal requires hypotheses for its new target; a reducible branch can instead start modularity without a seed.
- Frobenius recognition alone returns semisimplifications on both sides. The actual newform realization is identified using its separate AutomorphicGaloisRepresentations §4.8 absolute-irreducibility statement; the AutomorphicGaloisRepresentations Layers 1–2 good-polynomial construction alone does not give it.
- A finite-order Dirichlet twist of a newform need not itself be new at the displayed twist level. Take its normalized primitive associate, preserving weight and the good-prime eigenvalues, before claiming the conclusion is a newform.
- An arbitrary up-to-twist modularity witness is first normalized by §7.11; §7.9 alone assumes the form `χ = ε_p^m μ`.

([DP](<https://arxiv.org/pdf/2108.07577v2>) Theorems 1.4–1.7, pp.4–5; Definition 1.10 and Remark 4, pp.6–7; §2, pp.9–14 (arXiv v2); [Pan](<https://arxiv.org/pdf/1901.07166v2>) Theorem 1.0.2, p.3 (arXiv v2); [SW99](<https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf>) Introduction main theorem, printed p.6 / PDF p.3.)

*Needs:* hypotheses LL1–LL3 and CC4–CC5 for the odd irreducible branch, CC1 and CC4–CC5 for the dyadic branch, CC1–CC5 and LC for the Pan branch (Conditional arithmetic hypotheses); §12.1; §12.2; §12.3; OrdinaryAutomorphicFormsAndModularityLifting §5.5; §11.1; §7.9; ArithmeticGaloisRepresentations §1.2; ArithmeticGaloisRepresentations §1.9; ArithmeticGaloisRepresentations §§5.3–5.7; AutomorphicGaloisRepresentations §1.5; ArithmeticGaloisRepresentations §1.9; AutomorphicGaloisRepresentations §4.8; AutomorphicGaloisRepresentations §7.3; §7.11; TauCetiRoadmap ModularForms, Layer 9.

### Examples

Under LC, at `p = 5` with `p ∈ S` and reducible residual representation, characteristic-zero irreducibility, oddness and de Rham weights {0, 3} give a weight-four witness by Pan without coefficient-prime Weil–Deligne data (§12.8). At `p = 2 a` residual isomorphism with solvable image does not enter the dyadic branch (§12.8). A modular family and a residual congruence alone do not enter any branch when the second family misses the local or residual-image conditions (§12.8).

### Dependencies

Layers 7, 8, 9, 10, 11 of this roadmap; ArithmeticGaloisRepresentations (Layer 1; §§1.2, 1.10, 2.1–2.4, 4.1; Layer 4; Layer 5); AutomorphicGaloisRepresentations (Layers 1–2; §§4.8, 7.3); hypotheses CC1–CC5; OrdinaryAutomorphicFormsAndModularityLifting (Layer 5); PadicHodgeTheory (§§5.1–5.3); SerreWeightAndLevelOptimisation (§§6.6–6.11); TauCetiRoadmap ModularForms (Layer 9); hypothesis LC for the Pan alternatives.

## Worked examples

- **A classical modular residual representation, ordinary and nonordinary points.** Let f be a weight-two newform with p ∤ level, `p ≥ 3`, and `ρ̄ = ρ̄_f` with cyclotomically irreducible restriction. A crystalline lift with weights {0, 1} is a type (A) point (§1.4) and is modular by §5.4 after the solvable base change of §5.3. If f is ordinary at p the lift lies on an ordinary Barsotti–Tate component and §5.6 applies with that component; if f is supersingular, the component is the nonordinary one and §5.10 is the relevant theorem. Both are within §5.11 over `ℚ`.
- **An inadmissible different-component point.** Suppose the local deformation ring at p has two Barsotti–Tate components and the patched module of §3.4 is supported on the component containing the modular point only. A lift on the other component is not covered: §3.5 gives support on a union of components and §4.5 applies only to points of full-support components. Ihara avoidance (§4.1, §4.4) or Kisin's connectedness (§5.6) must first put the second component in the support.
- **The real-place dimension count at `p = 2.**` At a real place with `ρ̄(c) = 1` the ring of odd framed lifts is `𝒪⟦X₁, X₂, X₃⟧/(X₁² + X₂X₃ + 2X₁)` (§6.2). It has relative dimension two, the dimension of the conjugacy class of diag(1, −1) in `GL₂`, as in the case `ρ̄(c) ≠ 1`, so the dimension d in §6.11 does not change; but it is not formally smooth, since modulo 2 the equation becomes `X₁² + X₂X₃`, singular at the origin. After inverting 2 it is `(X₁ + 1)² + X₂X₃ = 1`, which is regular. This is why §6.11 asks for B to be a domain with regular generic fibre rather than formally smooth. An even lift is excluded even though its reduction looks the same (§6.10).
- **An irreducible lift with reducible residual semisimplification.** Under LC, for `p ≥ 5` and `ρ` irreducible, odd, de Rham with weights `{0,k−1}`, `k≥2`, and `ρ̄^{ss} = χ̄₁` ⊕ `χ̄₂`, Pan's theorem gives modularity without a modular residual witness (§10.15, §12.3). The reduction being a sum of characters does not make `ρ a` sum of characters; a reducible `ρ` is outside every theorem of Layers 7–12.
- **A nonsolvable dyadic residual case.** A 2-adic member of a family whose residual image contains `SL₂(𝔽₄) ≅ A₅` satisfies the image hypothesis of §9.3 and §12.2; with `S₃` residual image it does not, and no other branch of Layer 12 covers it.
- **The `p = 3` ordinary terminal case.** A 3-adic crystalline representation of weight two or four with residual semisimplification 1 ⊕ `ω₃` is excluded from Pan's theorem by the ratio `ω` on `G_{ℚ₃}`; it is ordinary and distinguished, and §11.2 proves it modular through Skinner–Wiles at `p = 3`.

## Downstream consumers

PotentialModularityAndCompatibleSystems uses the `α/β` predicates (§1.2, §1.3), the minimal-level and patching layers (Layers 1–4), Khare–Wintenberger I Theorem 4.1 (§5.18, §6.16), Hypothesis (H) (§6.10) and the transfer statements (Layer 12). It imports `cht_soluble_prescribed_completions` from §1.7 for its §2.16 and retains its application adapters. Its uses of §12.3, including the Pan alternatives of its §§13.2–13.3, assume LC in addition to the applicable LL1–LL3 and CC1–CC5; its Khare–Wintenberger alternatives do not acquire LC. The rational-field application contracts of ClassicalSerreModularity §§I.2 and R33.1 are compared with §§5.18, 6.16 and the statement table and transfer statements of Layers 7–12. Its modern applications require the branch’s LL/CC hypotheses and LC for Pan, in addition to the checks of §8.9; the dyadic family alternative requires a cuspidal residual modularity witness. These conditional exports supply a conditional version of an application unless those hypotheses are separately proved. ClassicalSerreModularity §I.1 is also the upstream standalone ordinary supplier. ModularityAndLanglandsExtensions and EllipticCurveModularity use the lifting theorems of Layers 5 and 6.

## Corrections to the sources

These corrections are used in the statements above; each is stated in our own words with its place in the source.

- **E1** (Kisin, 2-adic Barsotti–Tate representations, author preprint, Theorems (0.9)(2) p. 4 and (3.3.5)(2) p. 45). The local condition at `v | p` should read potentially Barsotti–Tate, as in Theorem (0.1) and in the proof (§6.9).
- **E2** (Kisin, Fontaine–Mazur for `GL₂`, author DVI, Lemma (1.7.5) p. 31 and Corollary (1.7.14) p. 34). The map (1.7.6) is only a homeomorphism onto its image and an isomorphism at the generic points; the formal smoothness claim for the reduced ordinary ring is withdrawn, and the exception in (1.7.14) is corrected, as Gee–Kisin Appendix B.1 explains (§8.3).
- **E3** (same, proof of Lemma (1.7.4) p. 30). The line `L_A` needs `G_{ℚ_p}` acting on `L_A ⊗ 𝔽` through `ω₁`, not only inertia (Gee–Kisin B.2).
- **E4** (same, §2.2 pp. 38 and 41). Add N(v) ≢ −1 mod p for `v ∈ Σ` (Gee–Kisin B.3; §8.3, §8.5).
- **E5** (same, proof of Proposition (2.2.14) p. 45). Irreducibility and generic reducedness of the factors at `v ∈ Σ` need their own argument (Gee–Kisin B.4).
- **E6** (same, Lemma (2.2.1) pp. 38–39). The lemma fails for some small images; use Gee–Kisin B.5, with ranks `2^{|R|}` and Lemmas B.5.1–B.5.2 (§8.2, §8.6).
- **E7** (Dieulefait–Pacetti, proof of Theorem 1.4 p. 4). The result of Emerton that removes Kisin's Hypothesis (1.2.6) is his Theorem 3.3.22, not Theorem 1.2.1.
- **E8** (same place). The forms of Kisin, Hu–Tan and Tung that the proof needs are those assuming `ρ̄` modular: Kisin (2.2.17) of the DVI ((2.2.18) in print), Hu–Tan Theorem 6.3, Tung Theorem 4.7 (§7.7).
- **E9** (Dieulefait–Pacetti, Lemma 1.13, torus-normaliser case, p. 8). The group-theoretic step is false as printed (`H =` ⟨−I, W⟩ is normal in ⟨diag(1, −1), W⟩ but not diagonal); diagonalise H itself instead. The lemma is used through ArithmeticGaloisRepresentations Layer 4, whose proof avoids this step.
- **E10** (Dieulefait–Pacetti, Theorem 1.7, published p. 5). `ψ` must have finite order in `det ρ = ψε^{k−1}`, as in Skinner–Wiles (§7.4, Layer 11).
- **E11** (Tung, dyadic, arXiv v3, Theorem 8.0.3(3) p. 38). Total oddness is a condition on the characteristic-zero lift, `det ρ(c_v) = −1` (§9.2).
- **E12–E17** (Conrad–Diamond–Taylor, §§2 and 5–6, corrected in BCDT §10, author pp. 77–78). Use the levels `U′_{S,q} = V′_{S,q} = U₁(q^{c_q})` at `q ∈ T(ρ̄)` (and `U_{S,q}, V_{S,q}` elsewhere), the module `L′_S` with `M_ℓ` and the dual local system, Serre's coefficient `L_n ⊗ k`; require V′ normal in V in Lemma 6.1.2(4); use the ℓ-adic topology on `M_p`; use the level `U_r` at p and the quotient `V₀/V₁` in §6.4; delete the unused semisimplicity claim of §2; and correct the labels at pp. 537–541 (§5.2, §5.12–§5.13).
- **E18** (CDT pp. 552–554). The elliptic-curve consequences need j(E) ≢ 1728 mod ℓ for ℓ `≥ 5` and hold up to isogeny; they are not used here.

## References

- **KW I** — C. Khare and J.-P. Wintenberger, [Serre's modularity conjecture (I)](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Invent. Math. 178 (2009), 485–504. Authors' version; printed page numbers.
- **KW II** — C. Khare and J.-P. Wintenberger, [Serre's modularity conjecture (II)](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), Invent. Math. 178 (2009), 505–586. Authors' final version of 30 May 2009; printed page `=` PDF page.
- **Kisin, finite flat** — M. Kisin, [Moduli of finite flat group schemes, and modularity](https://people.math.harvard.edu/~kisin/dvifiles/bt.dvi), Ann. of Math. 170 (2009), 1085–1180. Author DVI.
- **Kisin, 2-adic BT** — M. Kisin, [Modularity of 2-adic Barsotti–Tate representations](https://people.math.harvard.edu/~kisin/dvifiles/serre2.dvi), Invent. Math. 178 (2009), 587–634. Author DVI of 21 October 2008.
- **Kisin, FM** — M. Kisin, [The Fontaine–Mazur conjecture for GL₂](https://people.math.harvard.edu/~kisin/dvifiles/fmc.dvi), J. Amer. Math. Soc. 22 (2009), 641–690. Author DVI; its (2.2.17) is (2.2.18) in print.
- **Kisin, Durham** — M. Kisin, [Modularity for some geometric Galois representations](https://people.math.harvard.edu/~kisin/dvifiles/dur.dvi), in L-functions and Galois representations (Durham 2004), LMS Lecture Note Ser. 320 (2007), 438–470. Author DVI.
- **Gee–Kisin** — T. Gee and M. Kisin, [The Breuil–Mézard conjecture for potentially Barsotti–Tate representations](https://arxiv.org/pdf/1208.3179v5), Forum Math. Pi 2 (2014), e1; Appendix B corrects Kisin, FM.
- **Gee, MLT** — T. Gee, [Modularity lifting theorems](https://arxiv.org/pdf/2202.05818v2), Essent. Number Theory 1 (2022), 73–126.
- **Gee, types** — T. Gee, [Automorphic lifts of prescribed types](https://www.ma.imperial.ac.uk/~tsg/Index_files/prescribedlifts.pdf), Math. Ann. 350 (2011), 107–144. Author PDF; its weight theorem is numbered 4.6.9.
- **CHT** — L. Clozel, M. Harris and R. Taylor, [Automorphy for some ℓ-adic lifts of automorphic mod ℓ Galois representations](https://www.numdam.org/item/10.1007/s10240-008-0016-1.pdf), Publ. Math. IHÉS 108 (2008), 1–181.
- **CDT** — B. Conrad, F. Diamond and R. Taylor, [Modularity of certain potentially Barsotti–Tate Galois representations](https://math.stanford.edu/~conrad/papers/cdtmaster.pdf), J. Amer. Math. Soc. 12 (1999), 521–567. Author copy.
- **BCDT** — C. Breuil, B. Conrad, F. Diamond and R. Taylor, [On the modularity of elliptic curves over Q: wild 3-adic exercises](https://virtualmath1.stanford.edu/~conrad/papers/tswfinal.pdf), J. Amer. Math. Soc. 14 (2001), 843–939. Author copy and pagination.
- **DP** — L. V. Dieulefait and A. M. Pacetti, [A simplified proof of Serre's conjecture](https://arxiv.org/pdf/2108.07577v2), arXiv:2108.07577v2; published as Rev. R. Acad. Cienc. Exactas Fís. Nat. Ser. A Mat. 117 (2023), article 153 ([publisher PDF](https://link.springer.com/content/pdf/10.1007/s13398-023-01478-8.pdf)).
- **Emerton, LGC** — M. Emerton, [Local-global compatibility in the p-adic Langlands programme for GL₂/ℚ](http://www.math.uchicago.edu/~emerton/pdffiles/lg.pdf), preprint, draft of 23 March 2011.
- **Paškūnas, BM** — V. Paškūnas, [On the Breuil–Mézard conjecture](https://arxiv.org/pdf/1209.5205v3), Duke Math. J. 164 (2015), 297–359.
- **Paškūnas, 2-adic** — V. Paškūnas, [On 2-dimensional 2-adic Galois representations of local and global fields](https://arxiv.org/pdf/1509.00332v2), Algebra Number Theory 10 (2016), 1301–1358.
- **Hu–Tan** — Y. Hu and F. Tan, [The Breuil–Mézard conjecture for non-scalar split residual representations](https://arxiv.org/pdf/1309.1658v2), Ann. Sci. Éc. Norm. Supér. 48 (2015), 1383–1421.
- **Tung, odd `p**` — S.-N. Tung, [On the automorphy of 2-dimensional potentially semi-stable deformation rings of `G_{ℚ_p}`](https://arxiv.org/pdf/1803.07451v4), Algebra Number Theory 15 (2021), 2173–2194.
- **Tung, dyadic** — S.-N. Tung, [On the modularity of 2-adic potentially semi-stable deformation rings](https://arxiv.org/pdf/1908.06174v3), Math. Z. 298 (2021), 107–159.
- **Brumer** — A. Brumer, [On the units of algebraic number fields](https://doi.org/10.1112/S0025579300003703), Mathematika 14 (1967), 121–124.
- **Lichtenbaum** — S. Lichtenbaum, [On the values of zeta and L-functions I](https://annals.math.princeton.edu/1972/96-2/p06), Ann. of Math. 96 (1972), 338–360.
- **Paškūnas, Montreal** — V. Paškūnas, [The image of Colmez’s Montreal functor](https://arxiv.org/abs/1005.2008), Publ. Math. IHÉS 118 (2013), 1–191.
- **Pan** — L. Pan, [The Fontaine–Mazur conjecture in the residually reducible case](https://arxiv.org/pdf/1901.07166v2), J. Amer. Math. Soc. 35 (2022), 1031–1169.
- **SW99** — C. M. Skinner and A. J. Wiles, [Residually reducible representations and modular forms](https://www.numdam.org/item/PMIHES_1999__89__5_0.pdf), Publ. Math. IHÉS 89 (1999), 5–126.
- **Calegari** — F. Calegari, [Even Galois representations and the Fontaine–Mazur conjecture II](https://arxiv.org/pdf/1012.4819v2), J. Amer. Math. Soc. 25 (2012), 533–554.
- **Snowden** — A. Snowden, [On two dimensional weight two odd representations of totally real fields](https://websites.umich.edu/~asnowden/papers/wt2-052609.pdf), preprint, 26 May 2009.
- **BLGG13** — T. Barnet-Lamb, T. Gee and D. Geraghty, [Serre weights for rank two unitary groups](https://www.ma.imperial.ac.uk/~tsg/Index_files/U2.pdf), Math. Ann. 356 (2013), 1551–1598.
- **CEGGPS** — A. Caraiani, M. Emerton, T. Gee, D. Geraghty, V. Paškūnas and S. W. Shin, [Patching and the p-adic local Langlands correspondence](https://www.ma.imperial.ac.uk/~tsg/Index_files/Gpatching.pdf), Camb. J. Math. 4 (2016), 197–287.
- **Emerton–Paškūnas** — M. Emerton and V. Paškūnas, [On the density of supercuspidal points of fixed regular weight in local deformation rings and global Hecke algebras](https://arxiv.org/pdf/1809.06598v3), J. Éc. polytech. Math. 7 (2020), 337–371.
