# Roadmap: p-adic measures, completed group algebras, and characteristic ideals

This roadmap builds the analytic and algebraic language that Iwasawa theory shares with the theory of p-adic L-functions: bounded measures on profinite spaces and their duals, completed group algebras and the comparison between measures and the Iwasawa algebra, the Mahler–Amice dictionary between measures on ℤ_p and power series with its operator calculus (weighting, translation, dilation, φ, ψ, restriction to residue classes and to the units), pseudo-measures and their evaluation at characters, the Weierstrass theory of O⟦T⟧ and the structure of finitely generated Λ-modules with their characteristic ideals and μ/λ-invariants, determinant lines and specialization, and the ring theory of coefficient orders (character group rings, quadratic presentations, Fitting ideals of all indices, transposes) that integral Euler-system and Brumer–Stark arguments use. It continues the Tau Ceti roadmap ProfiniteProPGroups, whose layer 9 builds the completed group algebra `TauCeti.completedGroupAlgebra ℤ_p Γ` with its power-series coordinate; everything here is stated on that carrier and on Mathlib's `AbstractMeasure`, `PowerSeries` and localization carriers. Its end theorems are the comparison of integral measures with the completed group algebra (§1.7) and its reading in the power-series coordinate (§4.5), the Mahler–Amice calculus with ψφ = 1 and φψ the restriction to pℤ_p (§2.2), the evaluation of pseudo-measures at characters and its continuity (§3.3, §3a.1), the structure theorem for Iwasawa modules with the growth formula over any mixed-characteristic coefficient ring (§4.2, §4.7), the rational trivialization of the determinant of a perfect complex by the alternating product of characteristic ideals (§5.1), and the Fitting-ideal identities for character group rings and transposes (§6.2, §6.6).

`README.md` is normative. `Suggested.lean` records the definitions and theorem signatures that can be stated against the pinned libraries, together with the `example` checks named below; it is not exhaustive, and the docstrings there cite the subsections of this file as §k.n. All new declarations live under the `TauCeti.` prefix; the namespaces named in each subsection are the proposed ones. Every definition comes with the API it needs and with checks that a plausible wrong definition fails; every theorem carries its exact hypotheses, its source, and the earlier statements or library declarations it rests on. Nothing here is optional.

## Scope and ownership

The roadmap owns:

- bounded measures on compact spaces and their operator calculus: clopen restriction, extension by zero, the weak and strong topologies, the Dirac measures (Layer 0), the Mahler–Amice dictionary on ℤ_p with weighting, translation, dilation, φ, ψ, root-of-unity averaging, residue projections, the bounded Amice norm, the rational integral lattice and the Cartier operators (Layer 2);
- finite coefficients and joint coordinates of measures, the finite measure algebras, the finite quotients and coordinates of ℤ_pˣ, and the comparison of integral measures on a profinite group with `TauCeti.completedGroupAlgebra ℤ_p Γ`, with coefficient extension (Layer 1);
- pseudo-measures on a commutative completed group algebra, admissible evaluation at characters, the characters of ℤ_pˣ and their integrals, and the evaluation at varying characters (Layer 3), together with the character space of ℤ_pˣ as a set of points with its bounded and meromorphic functions and the universal character (Layer 3a);
- Weierstrass theory of O⟦T⟧ on Mathlib's factorization, pseudo-null modules and pseudo-isomorphisms, the structure theorem for finitely generated Λ-modules, the invariants μ and λ, the Iwasawa coordinate over O, characteristic divisors and ideals with their base change and change of generator, isotypic decompositions and Galois-orbit components, the cyclotomic polynomials and the growth formulas (Layer 4);
- line modules and determinant lines of perfect complexes, their rational trivialization and specialization, and topological Nakayama (Layer 5);
- the coefficient-order algebra of Dasgupta–Kakde: character group rings with their lattices, units, locality and completeness, the sharp involution, the contragredient dual and the transpose of a presentation, quadratic presentations, compound matrices and higher adjugates, the Fitting ideals of extensions and fibre products, and the exterior-power annihilation lemma (Layer 6).

It does not construct any p-adic L-function (no Bernoulli, Eisenstein or zeta arithmetic, no Kubota–Leopoldt measure), no Coleman norm or trace operator and no Coleman map, no locally analytic distributions beyond the bounded theory, no Galois cohomology, Selmer group or main conjecture, no Euler- or Kolyvagin-system contraction, and no eigenvariety. It states no Gorenstein property and no duality for the character group rings: the Gorenstein-order theory of Dasgupta–Kakde and the exact duality it feeds (the lattice dual Hom_R(M, R) of a module over an order R, and the finite-module dual Hom_O(M, K/O), which differ already for M = O/ϖ, whose lattice dual is 0 and whose finite dual is O/ϖ again; the dualizing object, exactness, biduality and the compatibility with the involution #) are left to the roadmap that proves the Brumer–Stark integrality statements, which will state them with the generic order/trace-dual lemmas shared with GlobalNumberFields. Those subjects consume the statements here through the interfaces named in each layer.

It leaves to named roadmaps:

- the completed group algebra itself, its inverse-limit topology, the ℤ_p power-series coordinate for a procyclic group, the continuity of that coordinate and the change of generator, to Tau Ceti **ProfiniteProPGroups**, layer 9 (section "The completed group algebra of the orientation image"); they are consumed, never restated;
- the Fitting ideals of finitely presented quasi-coherent modules as far as the relative singular subscheme Sing(f) needs them, to Tau Ceti **StableReduction**, layer 1; the ring-level carrier shared by both roadmaps is Tau Ceti's `TauCeti.fittingIdeal R M k`, which §4.5 and Layer 6 extend and never re-plan;
- the determinant of a finite locally free sheaf and its pullback comparisons on schemes, to Tau Ceti **AlgebraicVectorBundles**, layer 0C; the ring-level foundation both need (invertible modules, the top exterior power of a finite projective module of constant rank, its base change and functoriality) is stated once in §5.1 and used by both, §5.1 imports nothing geometric, and the determinant of a perfect complex is the new work of Layer 5;
- orders in number fields, their trace duals and the Gorenstein property for those orders, to Tau Ceti **GlobalNumberFields**; the character group rings R_Ψ of Layer 6 are orders in products of copies of O and may have zero divisors (R_∅ = 0, R_Ψ with Ψ a proper subset of a component), so they are never identified with a number-field order, and nothing here depends on that roadmap;
- the profinite integers ẑ, their units and the assembly of characters into ẑˣ, to Tau Ceti **ProfiniteArithmetic**, layer 0, and restricted products, adeles and Tamagawa measures to **RestrictedProducts**; neither is restated here, and no statement of this roadmap is made by either.

Already stated or built elsewhere, and therefore cited rather than stated here:

- Convolution of a function on the right, the convolution product of measures and the algebra of measures: Mathlib `Mathlib/NumberTheory/Padics/Measure/Monoid.lean`, which is in the pinned Mathlib, has `AbstractMeasure.convolveFunRight` with `convolveFunRight_apply`, `convolveFunRight_dirac_apply`, `convolveFunRight_apply_one`, `convolveFunRight_one` and `convolveFunRight_mul`, the `Mul` instance on `D(G,R)` with `mul_def`, `mul_apply` and `dirac_mul_dirac`, the `Ring` and `Algebra R` instances with `one_def` and `one_apply`, and the `CommRing` instance for commutative G; only `algebraMap_apply` is new to Layer 1, and it is immediate.
- The Dirac monoid homomorphism: Mathlib `AbstractMeasure.diracHom : G →* D(G,R)` with `diracHom_apply`; its power rule is `map_pow` and its pushforward rule is `map_dirac`.
- The local-field integer subring of ℚ_p, 𝒪[ℚ_p] = `PadicInt.subring p`: Tau Ceti `Padic.integerRing_eq_subring` with `Padic.integerRingEquiv` (`TauCeti/NumberTheory/LocalField/Padic.lean`).
- The reduction of p-adic units and its kernels: red_n is Tau Ceti `PadicInt.unitsToZModPow n` with `PadicInt.coe_unitsToZModPow_apply`, surjective by `PadicInt.surjective_units_map_toZModPow`, continuous by `PadicInt.continuous_toZModPow` and `(PadicInt.unitsToZModPow n).continuous`; its kernel is `TauCeti.unitsPrincipal p n` with `TauCeti.mem_unitsPrincipal_iff`, `TauCeti.isOpen_unitsPrincipal`, `TauCeti.hasBasis_nhds_one_unitsPrincipal` and `TauCeti.iInf_unitsPrincipal_eq_bot` (`TauCeti/NumberTheory/Padics/PrincipalUnits.lean`); the total disconnectedness of ℤ_pˣ is Tau Ceti `PadicInt.totallyDisconnectedSpace_units`.
- Reflexive modules are torsion-free over any commutative ring: Mathlib's instance `Module.IsReflexive.to_isTorsionFree` (`Mathlib.LinearAlgebra.Dual.Defs`).
- Exactness of inverse limits of compact modules, that is surjectivity of lim B_n → lim C_n for a tower of compact Hausdorff groups with continuous levelwise surjections commuting with the transition maps: Tau Ceti `TauCeti.exists_forall_map_succ_eq_and_forall_eq_of_surjective` (`TauCeti.Topology.Compactness.InverseSystem`; the directed case is `TauCeti.exists_forall_map_eq_of_compact_t2`), exactness on the left being the closed-embedding formality.
- Transposes are unique up to projective summands, tr(f) ⊕ (Q_1 ⊕ P_0)^* ≅ tr(g) ⊕ (P_1 ⊕ Q_0)^* for any ring and any two projective presentations: Tau Ceti `TauCeti.AuslanderReitenTranspose.nonempty_linearEquiv_prod_dual` (`TauCeti.Algebra.Module.AuslanderReiten.StableTranspose`), with the converse `nonempty_linearEquiv_prod_of_linearEquiv`; §6.2 only restricts scalars along σ.
- The higher Fitting ideals and their calculus: Tau Ceti `TauCeti.fittingIdeal R M k` (`TauCeti/RingTheory/FittingIdeal/{Basic,Generators,BaseChange}.lean`), defined for every finite module with our indexing, with presentation independence `fittingIdeal_eq_minorsIdeal_ker` and `fittingIdeal_eq_minorsIdealOfSet`, invariance `fittingIdeal_congr`, monotonicity under surjections `fittingIdeal_le_of_surjective`, the chain `fittingIdeal_monotone`, `fittingIdeal_eq_top_of_surjective` (Fitt^i = R once M is generated by i elements), `fittingIdeal_quotient_zero` (Fitt⁰(R/I) = I), the free-module jumps `fittingIdeal_eq_bot_of_lt_finrank` and `fittingIdeal_eq_top_iff_finrank_le`, the free-summand shift `fittingIdeal_prod_add_finrank`, the fibre criterion `fittingIdeal_le_iff_lt_finrank`, base change `fittingIdeal_baseChange` without flatness and its localisation form `fittingIdeal_eq_map` with `IsLocalizedModule.isBaseChange`; §6.5 keeps only the translation to the matrix form, and §4.5 only the genuinely new identities (Fitt⁰ ≤ annihilator, Fitt⁰ of a product, Fitt⁰ = R iff M = 0 as a corollary).
- The cyclotomic polynomial ω_n = (1 + T)^{p^n} − 1 is distinguished of degree p^n at the ideal (p): Tau Ceti `TauCeti.Polynomial.isDistinguishedAt_one_add_X_pow_sub_one` with `natDegree_one_add_X_pow_sub_one`; §4.3 keeps only the corollary at 𝔪_O, which follows since p ∈ 𝔪_O. The quotient Λ/(F) ≅ O[X]/(F) by a distinguished F is free of rank deg F: Mathlib `Polynomial.IsDistinguishedAt.algEquivQuotient` with `Polynomial.Monic.free_quotient` and `Polynomial.Monic.finite_quotient`. Weierstrass preparation in the unit-reduction case: Mathlib `PowerSeries.exists_isWeierstrassFactorization`, `weierstrassDistinguished`, `weierstrassUnit` and `IsWeierstrassFactorization.unique`; the ϖ^μ form of §4.3 reduces to it after dividing by ϖ^μ.

## Conventions

Write p for the prime, including p = 2 unless a statement says otherwise; ℤ_p for `PadicInt`, k = 𝔽_p for `ZMod p`; O for the valuation ring of a finite extension K of ℚ_p, ϖ for a uniformizer, and 𝔽 for the residue field. D(X,R) is Mathlib's `AbstractMeasure` on a compact space X with coefficients in a normed commutative ring R; it carries two topologies, the weak topology of pointwise convergence on test functions and the operator-norm (strong) topology, and the two are never identified: integral measures are compact for the weak topology, while a field-valued unit ball on an infinite domain is not norm compact. Clopen restriction, extension by zero, pushforward and convolution are operators on D(X,R); none introduces a second measure carrier. Convolution is right-handed and written μ ⋆ ν; on a profinite abelian monoid it is commutative.

The Amice transform A_μ ∈ ℤ_p⟦T⟧ of a measure μ on ℤ_p has n-th coefficient μ(x ↦ binom(x,n)); Y = 1 + T, so that δ_a ↦ Y^a. The operators on power series are: the Mahler derivation ∂ = (1+T)·d/dT (multiplication of the measure by x), translation (multiplication by the character x ↦ ζ^x or by Y^a), dilation (pushforward along x ↦ ax), φ(F)(T) = F((1+T)^p − 1) (pushforward along multiplication by p), ψ with ψ∘φ = id and φ∘ψ = restriction to pℤ_p, and 1 − φψ = restriction to the units. Root-of-unity averages require the stated coefficient extension and descent hypotheses. The inclusion of measures on ℤ_pˣ into measures on ℤ_p is linear and not multiplicative for the two convolutions.

The completed group algebra of a profinite group over an adic coefficient ring carries the joint topology of coefficient-ideal powers and open normal subgroups. For a procyclic Γ with coordinate T = γ − 1, the kernel of the projection to level n is generated by ω_n = (1+T)^{p^n} − 1, not by a power of T. At p = 2 the units are {±1} × (1 + 4ℤ_2) and the integral theory keeps the order-two group-ring factor; no integral division by 2 occurs.

Pseudo-measures on a commutative completed group algebra R are the elements λ of the localization at the non-zero-divisors with ([g] − 1)λ ∈ R for every g. A character is evaluated on a pseudo-measure only after clearing a denominator [g] − 1 whose image under the character is a unit; there is no character map on the whole total quotient ring.

Λ = O⟦T⟧ with O a complete discrete valuation ring with finite residue field. Finitely generated Λ-modules carry an explicit Λ-action. Pseudo-null means finitely generated with zero localization at every prime of height at most one; for Λ it means finite. Pseudo-isomorphism is a map with pseudo-null kernel and cokernel; it is symmetric on finitely generated torsion modules and is not asserted to be an equivalence relation in general. The characteristic divisor of a finite torsion module is the finitely supported function on height-one primes giving the local lengths; the characteristic ideal is the corresponding product of primes, principal when the ring is factorial. μ is the length of the ϖ-primary part, F_{M,γ} the distinguished polynomial of the horizontal factors and λ its degree; the elementary factors are retained as a multiset. A finite Λ-module has characteristic ideal Λ and, in general, a nonunit initial Fitting ideal.

Coefficient scope. The generality of every statement is that of its Lean signature. Where a statement is made for O = ℤ_p (Iwasawa's growth formula, the minimal resolution with 𝔽_p-dimensions) the form over a general O is registered separately, with k and ϖ in place of 𝔽_p and p, and its residue degree f and ramification index e in the exponents; the two are not conflated, because the ℤ_p formulas are false over a ramified or unramified O ≠ ℤ_p (§4.2, §4.7). Vertical invariants are normalised by ϖ, never by p: the μ-part of the structure theorem is built from powers of ϖ, μ is the length at (ϖ), and restriction of scalars from Λ_O to ℤ_p⟦T⟧ multiplies μ by the residue degree f = [k : 𝔽_p] and λ by [O : ℤ_p] (Λ_O/(ϖ) = k⟦T⟧ is f copies of 𝔽_p⟦T⟧ over ℤ_p⟦T⟧, and Λ_O/(F) has ℤ_p-rank [O : ℤ_p]·deg F), while base change along an extension multiplies μ by its ramification index e (§4.6). The equal-characteristic case O = k⟦ϖ⟧ is excluded from the growth formula, where it is false.

For a finite abelian H of order invertible in O, e_ω = (1/#H)Σ_a ω(a)⁻¹[a] after adjoining the character values, where 1/#H is `Ring.inverse (#H)`; every statement about e_ω carries the hypothesis that #H is invertible in O, and for p-torsion in H nothing is divided by #H. In Layer 6 characters are homomorphisms G →* Oˣ and the Pontryagin dual of a finite module uses the contragredient action.

Determinants. The determinant of a finite projective module P of constant rank r placed in degree 0 is (⋀^r P, r mod 2), so a rank-one module in degree 0 has odd parity; the determinant of a perfect complex is the alternating tensor product ⊗_i det(P^i)^{⊗(−1)^i} with parity Σ_i (−1)^i rank(P^i) mod 2; the symmetry of graded lines carries the Koszul sign (−1)^{|L||L′|}, so that exchanging two rank-one summands of a module acts by −1 on its determinant; shifting by one inverts the line and negates the integer degree, which does not change the parity. The two-term witness fixing every sign and direction: for the complex [Λ --a--> Λ] in degrees −1, 0 with a a non-zero-divisor, det is Λ with even parity, H⁰ = Λ/(a), the trivialization det(P)[a^{−1}] → Λ[a^{−1}] sends 1 to a^{−1} and the canonical section of Stacks 0FJI sends 1 to a, so the image of det P in the fraction field is a^{−1}Λ = char(H⁰)^{−1}, not aΛ; the same complex in degrees 0, 1 has image aΛ (§5.1).

Standing assumptions shared by several layers: p is any prime, including p = 2, and the indices n, m, r range over all natural numbers, including 0. ℤ_p is `PadicInt p`, k = `ZMod p`, Z⟦T⟧ = `PowerSeries ℤ_p`, k⟦T⟧ = `PowerSeries k`, and Y = 1 + T. R is a normed commutative ring unless a statement says more. U = ℤ_pˣ has the subspace topology of the units, A_n = (ℤ/p^nℤ)ˣ is finite and discrete (A_0 is the trivial group), red_n : U → A_n is the unit reduction `PadicInt.unitsToZModPow n` (§1.3), π_n(μ) = π_{red_n}(μ) is the finite projection of §1.1 and π_{(r,n)}(μ) its reduction modulo p^r (the joint projection of §1.1). Products of coordinates carry the product topology, p-adic on ℤ_p and discrete on each ZMod(p^r). M = D(U, ℤ_p). A topology on a measure carrier is never an instance: where one is used it is named, `AbstractMeasure.WeakTopology` or `AbstractMeasure.StrongTopology`. ψ on integral measures is the operator `psiMeasure` of §2.2, transported to power series through the Amice transform.

## Exact supplier contracts

The library vocabulary is that of Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`; `Suggested.lean` imports the modules named here and states the targets on these declarations. A prerequisite on a Tau Ceti roadmap layer refers to that layer's stated development.

### From Mathlib

| Use here | Exact declarations |
|---|---|
| measures | `AbstractMeasure`, written D(X,R): the continuous R-linear dual of C(X,R) for compact X and a normed commutative ring R, with `map`, `dirac`, `toCLMEquiv`, `amiceTransform`, `coeff_amiceTransform`, `amiceTransformEquiv`, `injective_amiceTransform`, `monoidAlgebraHom`, `WeakTopology`, `StrongTopology`, and the Mahler basis `mahler`, `PadicInt.mahlerEquiv`, `PadicInt.hasSum_mahler`; the operator calculus of Layers 0 and 2 is built on this carrier |
| the measure algebra (`Mathlib/NumberTheory/Padics/Measure/Monoid.lean`, in the pinned Mathlib) | `AbstractMeasure.convolveFunRight` and its five lemmas, the `Mul`, `One`, `Ring`, `Algebra R` and `CommRing` instances on `D(G,R)` with `mul_def`, `mul_apply`, `dirac_mul_dirac`, `one_def`, `one_apply`, `prodMk'`, and `diracHom` with `diracHom_apply`; the right-handed orientation (μ ⋆ ν)(f) = μ(x ↦ ν(y ↦ f(xy))) is the library's |
| power series and polynomials | `PowerSeries` with `coeff`, `map`, `expand`, `subst`, `derivative`, `exp`, `binomialSeries`, `HasEval`, `aeval`, `aeval_unique`, `WithPiTopology`, `exists_isWeierstrassFactorization`, `weierstrassDistinguished`, `weierstrassUnit` and `IsWeierstrassFactorization.unique`; `Polynomial`, `Polynomial.IsDistinguishedAt.algEquivQuotient`, `Polynomial.Monic.free_quotient`, `Polynomial.Monic.finite_quotient`, `MvPowerSeries`; the Mahler derivation, φ, ψ, residue averaging and the cyclotomic polynomials ω_n, ξ_n are defined on these |
| algebra, p-adics and topology | `MonoidAlgebra` with its Hopf structure, `LocalizedModule`, `IsFractionRing` (no domain hypothesis), `Submodule.div`, `Module.length`, `PrimeSpectrum`, `IsRegularLocalRing`, `UniqueFactorizationMonoid`, `IsDiscreteValuationRing`, `Module.FinitePresentation`, `Module.rankAtStalk`, `Matrix.adjugate`, `exteriorPower`, `HasEnoughRootsOfUnity`, `HomologicalComplex`, `ModuleCat`; `PadicInt`, `PadicInt.toZModPow`, `PadicInt.toZMod`, `PadicInt.continuous_toZMod`, `PadicInt.ker_toZMod`, `PadicInt.norm_le_pow_iff_mem_span_pow`, `PadicInt.isUnit_one_add_of_dvd`, `PadicComplex`, `ZMod.unitsMap`, `QuotientGroup.quotientKerEquivOfSurjective`, `LocallyConstant`, `WeakDual`, `DenseRange.equalizer`, `Topology.IsClosedEmbedding`, `IsLocalizedModule.isBaseChange` |

### From Tau Ceti

| Use here | Exact declarations |
|---|---|
| the completed group algebra carrier (`Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/`) | `TauCeti.completedGroupAlgebra R Γ` for any commutative ring R, with `proj`, `of`, `mk`, `lift`, `ext`, `of_injective`, `isClosedEmbedding_of`, the inverse-limit topology, compactness, `isMulCommutative_iff` (`Basic.lean`); `Map.lean`; `Prod.lean` (R⟦C × Γ⟧ ≅ R⟦Γ⟧[C]); `Discrete.lean`; `PowerSeries.lean` (`powerSeriesCoordinate` : ℤ_p⟦X⟧ ≃ₐ ℤ_p⟦Γ⟧ for procyclic pro-p Γ, `powerSeriesCoordinate_X`, `powerSeriesCoordinate_padicPow_apply` for the generator change); `Filtration.lean` (the kernels of the finite levels); `ProductCoordinate.lean`, `DyadicCoordinate.lean`, `CharacterDivision.lean` |
| compact modules and inverse systems | `TauCeti.IsCompactModule` (`Topology/Algebra/Module/Compact.lean`); `TauCeti.exists_forall_map_succ_eq_and_forall_eq_of_surjective`, `TauCeti.exists_forall_map_eq_of_compact_t2` (`Topology/Compactness/InverseSystem.lean`); `TauCeti.hasAntitoneBasis_nhds_one_of_iInf_eq_bot` |
| Fitting ideals (`RingTheory/FittingIdeal/{Basic,Generators,BaseChange}.lean`) | `TauCeti.fittingIdeal R M k` for every k on a finite module, with `fittingIdeal_eq_minorsIdeal_ker`, `fittingIdeal_eq_minorsIdealOfSet`, `fittingIdeal_congr`, `fittingIdeal_le_of_surjective`, `fittingIdeal_monotone`, `fittingIdeal_eq_top_of_surjective`, `fittingIdeal_quotient_zero`, `fittingIdeal_eq_top_iff_finrank_le`, `fittingIdeal_eq_bot_of_lt_finrank`, `fittingIdeal_prod_add_finrank`, `fittingIdeal_le_iff_lt_finrank`, `fittingIdeal_baseChange`, `fittingIdeal_eq_map` |
| p-adic units (`NumberTheory/Padics/RingHoms.lean`, `PrincipalUnits.lean`, `NumberTheory/LocalField/Padic.lean`, `UnitFiltration/Basic.lean`) | `PadicInt.unitsToZModPow` with `coe_unitsToZModPow_apply`, `surjective_units_map_toZModPow`, `continuous_toZModPow`; `TauCeti.unitsPrincipal` with `mem_unitsPrincipal_iff`, `mem_unitsPrincipal_iff_norm`, `isOpen_unitsPrincipal`, `hasBasis_nhds_one_unitsPrincipal`, `iInf_unitsPrincipal_eq_bot`; `PadicInt.totallyDisconnectedSpace_units`; `TauCeti.padicIntUnitsEquivProd` (ℤ_pˣ ≅ μ_{p−1} × (1 + pℤ_p), p odd), `TauCeti.unitsPlusMinus` (the subgroup {±1} at p = 2); `TauCeti.exists_topologicalClosure_zpowers_eq_unitsPrincipal` (a topological generator of the principal units); `TauCeti.not_isOfFinOrder_of_mem_unitsPrincipal` (odd p); `Padic.integerRing_eq_subring`, `Padic.integerRingEquiv`; `TauCeti.unitFiltration` and its open neighbourhood basis |
| locally constant functions and power series | `TauCeti.rightTranslationStabilizer` (`Topology/Algebra/Group/LocallyConstant.lean`: locally constant functions on a compact group are uniformly locally constant); `TauCeti.hasSubst_binomialSeries_sub_one`; `TauCeti.Polynomial.isDistinguishedAt_one_add_X_pow_sub_one` with `natDegree_one_add_X_pow_sub_one` |
| group rings, Hopf algebras and transposes | `TauCeti.subgroupCharSum`, `TauCeti.MonoidAlgebra.augmentation`, `TauCeti.HopfAlgebra.antipodeAlgHom`, `TauCeti.HopfAlgebra.antipodeAlgEquiv`, `TauCeti.HopfAlgebra.antipode_antipode`, `TauCeti.DiagonalizableGroup.point` with `point_single` and `point_single_one`, `Representation.ofLinearCharacter`; `Matrix.pairMinor`, `Matrix.pairMinor_mul`, `exteriorPower.map_top_eq_det_smul`; `TauCeti.AuslanderReitenTranspose` with `mk`, `mk_eq_zero_iff`, `mk_surjective`, `lift`, `lift_mk`, `hom_ext`, `nonempty_linearEquiv_prod_dual`, `nonempty_linearEquiv_prod_of_linearEquiv`, and `TauCeti.IsMinimalProjectivePresentation.nonempty_linearEquiv_auslanderReitenTranspose` |

### From TauCetiRoadmap.ProfiniteProPGroups, layer 9

`completedGroupAlgebra ℤ_p Γ = lim_U ℤ_p[Γ/U]` over the open normal subgroups, a compact topological ℤ_p-algebra with `of`, `proj` (surjective; with separatedness this is the inverse-limit description), `map`, `completedGroupAlgebra_mul_comm` for abelian Γ, the procyclic coordinate `powerSeriesCoordinate` : ℤ_p⟦T⟧ ≅ `completedGroupAlgebra ℤ_p Γ` for Γ ≅ ℤ_p (T ↦ γ − 1, `powerSeriesCoordinate_X`, `powerSeriesCoordinate_filtration`, its continuity, and the generator change T ↦ (1 + T)^u − 1), `powerSeriesEval`, `powerSeries_sub_C_dvd_iff`, the dyadic coordinate `dyadicCoordinate`, and `IsCompactModule` with the compact inverse-limit exactness. These stay canonical: the carrier, the ℤ_p power-series coordinate, its continuity and the change of generator are consumed, never restated. This roadmap adds only what is missing there: the comparison of integral measures with the carrier (§1.7), the compatibility of that comparison with the coordinate (§4.5), the O-coefficient level maps of the coordinate (§4.5, which for O = ℤ_p is the Tau Ceti coordinate read through §1.7), and the compact-module statements of §5.2.

### From TauCetiRoadmap.StableReduction, layer 1

StableReduction develops Fitting ideals of finitely presented quasi-coherent modules only as far as the relative singular subscheme Sing(f) needs them, with no ring-level interface stated. The ring-level carrier for both roadmaps is Tau Ceti's `TauCeti.fittingIdeal R M k`, which already handles every index k with presentation independence, base change and the basic formulas; §4.5 and Layer 6 extend that one API (annihilator containment, products, quadratic presentations, extensions, transposes) and never re-plan it.

### Shared with TauCetiRoadmap.AlgebraicVectorBundles, layer 0C, and TauCetiRoadmap.GlobalNumberFields

AlgebraicVectorBundles owns the determinant of a finite locally free sheaf and its pullback comparisons on schemes; the ring-level foundation both roadmaps need is stated once in §5.1 at the level of commutative rings and modules, on Mathlib's `exteriorPower` and Tau Ceti's `exteriorPower.map_top_eq_det_smul`, and neither roadmap imports the other. GlobalNumberFields has orders in number fields, their trace duals and the Gorenstein property for those orders; the algebra shared with it is the generic order/trace-dual lemmas over a Dedekind base, and nothing here depends on it.

## How to read the build

The layers are built in the order Layer 0 → 1 → 2 → 3 → 3a → 4 → 5 → 6, and each `### k.n` subsection lists its statements in dependency order; `*Needs:*` at the end of a statement names the earlier statements, by Lean name or by subsection, and the library declarations it rests on. Layer 0 delivers the operators on D(X,R) for a compact X: clopen restriction and extension, the weak and strong topologies and the Dirac measures. Layer 1 delivers the finite coordinates of measures, the finite measure algebras, the coordinates of ℤ_pˣ, and the comparison D(Γ, ℤ_p) ≅ `completedGroupAlgebra ℤ_p Γ` with its coefficient extensions. Layer 2 delivers the Mahler–Amice calculus on ℤ_p: moments, φ and ψ, root-of-unity averaging, the bounded Amice norm, the unit domain, the Cartier operators and the residue projections. Layer 3 delivers pseudo-measures and their admissible evaluation at characters, and Layer 3a the character space of ℤ_pˣ with its bounded and meromorphic functions and the universal character. Layer 4 delivers the Weierstrass theory of O⟦T⟧, the structure theorem for Iwasawa modules, the Iwasawa coordinate over O, the characteristic ideals and the growth formulas. Layer 5 delivers determinant lines of perfect complexes with their rational trivialization and specialization, and topological Nakayama. Layer 6 delivers the coefficient-order algebra of Dasgupta–Kakde. Each subsection opens with its references and the library declarations it is built on; each definition gives its API as named lemmas and its checks as a `**Checks.**` list, whose items are the `example`s of `Suggested.lean`; every layer ends with its examples and its dependencies.

## Layer 0: coefficients, continuous functions and duals

On a compact (profinite) space X and a normed commutative coefficient ring R, this layer develops the operators on D(X,R) that every later layer uses: restriction of test functions and measures to a clopen subset, extension by zero, the clopen projectors and the decomposition of a measure over a finite clopen partition, naturality of restriction under pushforward, the weak and strong topologies and their continuity, closed-embedding and contraction properties, the Dirac measures and their separation, and the failure of norm compactness of the unit ball on an infinite domain. Density of locally constant functions is taken from Mathlib (`LocallyConstant`, `ContinuousMap` density on totally disconnected compact spaces) and from Tau Ceti's uniform local constancy on compact groups. The integral lattices, orthonormal bases (RJW Remark 3.4, p. 118) and scalar extensions along isometric embeddings of p-adic fields are consumed by Layer 2 in the ℤ_p-domain, ℚ_p-coefficient case stated there.

Standing assumptions for this layer: X is a compact topological space, s ⊆ X a clopen subset (possibly empty) and R a normed commutative ring; no field, completeness, ultrametricity, Hausdorffness of X or nonemptiness of s is assumed unless a statement says so; K is a nontrivially normed field, not assumed complete or ultrametric. C(s,R) carries the subspace topology and supremum norm (s is compact). D(X,R) and D(s,R) are the `AbstractMeasure` carriers, with no topology installed; `WeakTopology` is selected explicitly where used. Write z_s for extension by zero of test functions on s, r_s for the clopen restriction of measures and j_s for pushforward along the inclusion s ↪ X. The norm of a measure is the operator norm of its image under `toCLMEquiv`, and the strong topology is `StrongTopology`; both are used only for field coefficients and neither installs a norm on integral ring-valued measures, whose lattice comparison is a separate statement of Layer 2.

### 0.1 Clopen restriction, extension and decomposition

References: RJW §3.5.3 and Remark 3.31, p. 127; §3.2, Definitions 3.7–3.8 and Remarks 3.9–3.12, pp. 119–121. Built on Mathlib `AbstractMeasure.map_apply`, `ContinuousMap.liftCover_coe` and `LocallyConstant.coe_charFn`. The proposed namespaces are `AbstractMeasure` and `ContinuousMap`.

**Extension by zero of clopen test functions.** Define `ContinuousMap.zeroExtendClopen s R : C(s,R) →L[R] C(X,R)`, denoted z_s, by z_s(f)(x) = f(x) on s and 0 off s. Its API is `zeroExtendClopen_apply_mem` and `zeroExtendClopen_apply_not_mem` (the two values), `norm_zeroExtendClopen` (‖z_s(f)‖ = ‖f‖, including s empty), `restrict_zeroExtendClopen` (the restriction of z_s(f) to s is f), `zeroExtendClopen_restrict` (z_s(f|s) = χ_s f, where χ_s is the continuous characteristic function), and the inherited `AddHomClass.map_add`: the continuous linear map preserves addition, zero and R-scalars by its inherited structure. The five named identities are the intermediate results of this definition: the value inside s, the value outside s, the norm, the restriction back to s and the projector identity z_s(f|s) = χ_s f.

**Checks.**
- For X = Fin 2 with its discrete topology, s = {0} and R = ℤ, the extension of the constant 7 on s has value 7 at 0.
- For the same data it has value 0 at 1, rather than 7: a definition that extended by the boundary value would fail here.
- The extension of the unique zero test function on the empty clopen is zero.

**Measures restricted to a clopen subtype.** Define `AbstractMeasure.restrictClopen s R : D(X,R) →ₗ[R] D(s,R)`, denoted r_s, by r_s(μ)(f) = μ(z_s(f)). Denote by j_s the existing `AbstractMeasure.map` along `ContinuousMap.subtypeVal s`; it extends a measure on s to X. Its API is `restrictClopen_apply` (r_s(μ)(f) = μ(z_s(f))), `restrictClopen_map_subtype` (r_s(j_s ν) = ν), `restrictClopen_dirac_mem` and `restrictClopen_dirac_not_mem`, the inherited `AddHomClass.map_add` (restriction preserves addition, zero and R-scalars by the inherited linear-map structure), and `restrictClopen_map_preimage`: restriction commutes with pushforward when the source subset is the preimage of the target clopen. The intermediate results are the evaluation formula r_s(μ)(f) = μ(z_s f), the section identity r_s ∘ j_s = id, and the projector evaluation (j_s r_s μ)(f) = μ(χ_s f). *Needs:* `zeroExtendClopen` with its inside and outside evaluation lemmas.

**Checks.**
- For X = Fin 2, s = {0}, R = ℤ, restricting 2δ₀ − 3δ₁ gives 2δ₀ on s.
- For the same data, restricting δ₁ gives zero.
- Every measure restricts to zero on the empty clopen.

**Supported measures come uniquely from the clopen subtype.** Prove that there exists a unique ν ∈ D(s,R) with j_s ν = μ if and only if μ(f) = 0 for every f ∈ C(X,R) vanishing on s, and that when it exists, ν = r_s μ. Along the way prove the decomposition of a test function over s and its complement, χ_s f + χ_{sᶜ} f = f. *Needs:* the projector evaluation and the section identity of `restrictClopen`.

**Measure decomposition over complementary clopens.** Define `AbstractMeasure.clopenDecomposition s R : D(X,R) ≃ₗ[R] D(s,R) × D(sᶜ,R)` by μ ↦ (r_s μ, r_{sᶜ} μ), with inverse (ν,η) ↦ j_s ν + j_{sᶜ} η. Its API is `clopenDecomposition_apply` (the two components are exactly r_s μ and r_{sᶜ} μ), `clopenDecomposition_symm_apply` (the inverse is the sum of the inclusion pushforwards), the inherited `LinearEquiv.injective` (two ambient measures agree if their two restrictions agree) and the inherited `LinearEquiv.apply_symm_apply` (recombining and restricting recovers both input measures; the opposite round trip recovers the ambient measure). Prove also that restriction commutes with pushforward along a map whose preimage of the target clopen is the source clopen. *Needs:* the complement decomposition of test functions, the section identity, the evaluation formula of `restrictClopen`, and the outside evaluation of `zeroExtendClopen`.

**Checks.**
- For Fin 2, s = {0}, R = ℤ, the pair for 2δ₀ − 3δ₁ is (2δ₀, −3δ₁) on the respective subtypes.
- Recombining the unit Dirac measures on {0} and {1} gives δ₀ + δ₁ on Fin 2.
- For s = ∅ the first component is the zero measure on the empty subtype and the second is μ carried to the subtype sᶜ = X, so the equivalence is the identity up to that transport.

### 0.2 Weak and strong topologies on measures

References: RJW Definition 3.5 and Definitions 3.7–3.8, p. 119; Remark 3.31, p. 127; Corollary 3.32 and Remark 3.33, p. 129. Built on Mathlib `AbstractMeasure.toCLMEquiv`, `AbstractMeasure.WeakTopology` and `ContinuousMap.norm_coe_le_norm`.

First prove that pushforward along a continuous map and clopen restriction are continuous for the weak topologies.

**Weak closed embedding of clopen measures.** Prove that the existing inclusion pushforward j_s : D(s,R) → D(X,R) is a closed embedding for the weak topologies, and that its range is the subspace of measures annihilating all tests that vanish on s, characterised in §0.1. *Needs:* weak continuity of pushforward and of clopen restriction, the section identity r_s ∘ j_s = id, and the support characterisation of §0.1.

**Weak topological clopen decomposition.** Prove that the linear equivalence `clopenDecomposition` from D(X,R) to D(s,R) × D(sᶜ,R) is a homeomorphism for the weak topologies and their product topology. *Needs:* `clopenDecomposition`, weak continuity of clopen restriction and of pushforward.

Next prove the operator-norm bound of pushforward, the operator-norm bound of clopen restriction, and the exact operator norm of the clopen inclusion (for field coefficients, through `toCLMEquiv`).

**Strong closed embedding of clopen measures.** Prove that the existing inclusion j_s : D(s,K) → D(X,K) is a closed embedding for the strong topologies. *Needs:* the operator-norm bounds of pushforward and of clopen restriction, and the section identity.

**Strong topological clopen decomposition.** Prove that `clopenDecomposition` is a homeomorphism for the strong topologies and the product topology. *Needs:* `clopenDecomposition`, the operator-norm bounds of pushforward and of clopen restriction.

Then prove that the Dirac measure x ↦ δ_x is weakly continuous, that δ_x has operator norm one (`norm_dirac`), and that δ_x − δ_y has operator norm one for x ≠ y when X is totally separated and K is ultrametric (`norm_dirac_sub`).

**Failure of norm compactness of the measure unit ball.** For X infinite, compact and totally separated and K a nontrivially normed ultrametric field, prove that the unit ball {L in the continuous K-linear dual of C(X,K) : ‖L‖ ≤ 1} is not compact for its operator-norm topology. No properness or completeness of K is needed for this negative result (RJW Definitions 3.5 and 3.8, p. 119; Example 3.10, p. 120; Remark 3.28(3), pp. 125–126). *Needs:* the operator norm of a Dirac measure and of a Dirac difference.

Finally prove the scaling lemma for rational-valued tests: every f ∈ C(X,ℚ_p) becomes ℤ_p-valued after multiplication by a suitable power p^n, and the integral of f against a measure is p^{−n} times the integral of p^n f; this is the input of the rational unit-ball description of §2.5.

### 0.3 Local constancy of reduction

References: RJW Lemma 12.13 and its proof, pp. 182–183, for the reduction modulo p of power series; the local constancy of ℤ_p → 𝔽_p itself is Mathlib's `PadicInt.ker_toZMod`. Built on Mathlib `PadicInt.norm_lt_one_iff_dvd`, `PadicInt.ker_toZMod` and `PadicInt.maximalIdeal_eq_span_p`.

Prove that the residue map ℤ_p → 𝔽_p is locally constant: its kernel is the open ideal (p) = {x : ‖x‖ < 1}, so each fibre is a clopen coset. Local constancy itself is Mathlib's `PadicInt.continuous_toZMod` into the discrete 𝔽_p; what is stated is the clopen description of the fibres through `PadicInt.ker_toZMod` and `PadicInt.norm_lt_one_iff_dvd`. This is the only statement of the subsection; the reduction modulo p of power series and the residue operator built on it are §2.9 and §2.10.

### Examples

- On X = Fin 2 with s = {0} and R = ℤ, the decomposition of 2δ₀ − 3δ₁ is (2δ₀, −3δ₁), and recombining the two unit Dirac measures gives δ₀ + δ₁.
- On an infinite profinite X with K = ℚ_p, the unit ball of the dual of C(X,K) is not norm compact, because the Dirac measures are at mutual distance one; the same sequence converges weakly (§2.7).
- The residue map ℤ_p → 𝔽_p is locally constant with fibres the cosets of pℤ_p.

### Dependencies

Mathlib only: `AbstractMeasure` with `map_apply`, `toCLMEquiv`, `WeakTopology` and `StrongTopology`; `ContinuousMap.liftCover_coe`, `ContinuousMap.norm_coe_le_norm`; `LocallyConstant.coe_charFn`; `PadicInt.norm_lt_one_iff_dvd`, `PadicInt.ker_toZMod`, `PadicInt.maximalIdeal_eq_span_p`; and Tau Ceti's uniform local constancy on compact groups (`TauCeti.rightTranslationStabilizer`). No earlier layer and no other roadmap.

## Layer 1: completed group rings and convolution

For a profinite monoid or group G, this layer builds the finite projections of a measure (its coefficients on a finite quotient), the joint coefficient-and-level coordinates, convolution of measures by iterated integration with its algebra structure and its finite Dirac expansion, multiplicativity of the finite projections, and the concrete finite quotients of ℤ_pˣ with their coordinates. The layer ends with its endpoint: the comparison of integral measures on a profinite group Γ with `completedGroupAlgebra p Γ` of Tau Ceti ProfiniteProPGroups, layer 9, as topological ℤ_p-algebras, built directly from the compatible families of finite coefficients.

Standing assumptions for this layer: X is a topological space and R a topological commutative ring, with no field, nonzero, norm or completeness hypothesis for the algebraic constructions; the separation statements add theirs (X compact Hausdorff totally disconnected, R normed). Finite coefficients live in A →₀ R, with no multiplication or topology. A and B are finite discrete spaces (monoids where a product is used); q : X → A is continuous, not necessarily surjective; e_{(q,a)} is the characteristic function of q⁻¹{a}; π_q is the finite projection and Π_q(μ) = `MonoidAlgebra.ofCoeff` (π_q(μ)) (`MonoidAlgebra` is a structure with a coefficient field, not the Finsupp type). For the joint coordinates R = ℤ_p, ρ_r : ℤ_p → ZMod(p^r) is `PadicInt.toZModPow`, and r is any natural number: at r = 0 the coefficient ring is the zero ring. G and H are locally compact topological monoids with continuous multiplication; D(G,R) is `AbstractMeasure G R R`; convolution is the right-handed product (μ∗ν)(f) = μ(x ↦ ν(y ↦ f(xy))), built from `prodMk′`, with unit δ_1, the factors in the order xy also for noncommutative G. For the units: U = ℤ_pˣ, A_n = (ℤ/p^nℤ)ˣ, red_n : U → A_n is the homomorphism on units induced by ρ_n, t_{(m,n)} : A_n → A_m for m ≤ n is `ZMod.unitsMap`, the group depth n and the coefficient precision r are independent, and a compatible family is a family c_n : A_n →₀ ℤ_p with (t_{(m,n)})_* c_n = c_m, the pushforward being `Finsupp.mapDomain`, which sums the coefficients over each fibre. M = D(U, ℤ_p), with `WeakTopology` wherever a topology on it is used.

The convolution structure itself is Mathlib's: `AbstractMeasure.convolveFunRight` (with `convolveFunRight_apply`, `convolveFunRight_dirac_apply`, `convolveFunRight_apply_one`, `convolveFunRight_one`), the product `μ * ν = map (mul) (μ.prodMk' ν)` (with `mul_def`, `mul_apply`, `dirac_mul_dirac`, `convolveFunRight_mul`), the `Ring` and `Algebra R` instances on `D(G,R)` with `one_def` and `one_apply`, the `CommRing` instance for commutative G, and the Dirac monoid homomorphism `AbstractMeasure.diracHom : G →* D(G,R)` with `diracHom_apply` (`Mathlib.NumberTheory.Padics.Measure.Monoid`; the power rule `diracHom_pow` is `map_pow` and the pushforward rule `diracHom_map` is `map_dirac`). This layer adds to that structure only `algebraMap_apply`, the pushforward of a convolution along a continuous monoid homomorphism, the total mass of a convolution, and the finite-projection lemmas below.

### 1.1 Finite coefficients and joint coordinates

References: RJW §3.2–3.3, Propositions 3.15–3.16, Definition 3.17 and Example 3.19; pp. 119–123. Built on Mathlib `ContinuousMap.equivFnOfDiscrete`, `Finsupp.linearEquivFunOnFinite` and `AbstractMeasure.dirac_apply`. The proposed namespace is `AbstractMeasure`.

**Finite coefficients of a measure.** Construct the R-linear map `finiteProjection q`, written π_q : D(X,R) → (A →₀ R), with π_q(μ)(a) = μ(e_{(q,a)}). Its API is `finiteProjection_zero`, `finiteProjection_add` (π_q(μ+ν) = π_q(μ) + π_q(ν)) and `finiteProjection_smul` (π_q(cμ) = c π_q(μ) for c ∈ R). The intermediate results are the coefficient formula π_q(μ)(a) = μ(e_{(q,a)}), the pairing formula μ(g ∘ q) = Σ_a g(a) π_q(μ)(a) for every g : A → R, the value on a Dirac measure (π_q(δ_x) is the atom at q(x)), the refinement rule (for a map t : A → B, π_{t∘q}(μ) = t_* π_q(μ)), the total mass (the sum of the coefficients is μ(1)), and the reconstruction of a measure on a finite discrete space from its coefficients.

**Checks.**
- On Fin 2 with R = ℤ, π_id(δ_0) is the finitely supported atom at 0 with coefficient 1.
- For Fin 2 → Fin 1 constant, R = ℤ and μ = 2δ_0 + 3δ_1, its unique projected coefficient is 5, not an average.
- For q : Fin 1 → Fin 2 constant 0, π_q(δ_0) has coefficient 0 at 1.

**Measures on a finite discrete space.** Prove that the linear map π_id : D(A,R) → (A →₀ R) is bijective, with inverse sending c to Σ_a c(a) δ_a; the map itself is the coefficient map underlying Mathlib's `AbstractMeasure.monoidAlgebraHom`, and only the bijectivity is new. Prove along the way that each finite projection is continuous for the weak topology. *Needs:* the finite-discrete reconstruction and the Dirac value of `finiteProjection`.

**Finite coefficients determine a measure.** For X compact Hausdorff and totally disconnected and R a normed commutative ring, prove `finiteProjection_ext`: if π_q(μ) = π_q(ν) for every n ≥ 0 and every continuous q : X → Fin n, then μ = ν. *Needs:* the pairing formula of `finiteProjection`.

**Joint finite and coefficient projections.** Construct the additive map `jointFiniteProjection r q`, written π_{(r,q)} : D(X,ℤ_p) → (A →₀ ZMod(p^r)), by applying ρ_r to each coefficient of π_q. Its API is `jointFiniteProjection_zero`, `jointFiniteProjection_add` (π_{(r,q)}(μ+ν) = π_{(r,q)}(μ) + π_{(r,q)}(ν)) and `jointFiniteProjection_zero_precision`. The intermediate results are the coefficient formula (the coefficient at a is ρ_r(μ(e_{(q,a)}))), the precision rule (reducing π_{(r,q)} modulo p^{r′} for r′ ≤ r gives π_{(r′,q)}), the refinement rule along a map t : A → B, and the value on a Dirac measure. *Needs:* `finiteProjection`.

**Checks.**
- At p = 2, r = 2 on Fin 1, π_{(2,id)}(δ_0) is the atom with coefficient 1 in ZMod 4.
- At p = 2, r = 0, π_{(0,id)}(δ_0) = 0.
- At p = 2 on Fin 1, 2δ_0 projects to 0 modulo 2 but to the nonzero coefficient 2 modulo 4.

**Joint coordinates determine an integral measure.** For X compact Hausdorff and totally disconnected, prove `jointFiniteProjection_ext`: if π_{(r,q)}(μ) = π_{(r,q)}(ν) for all r, n ≥ 0 and continuous q : X → Fin n, then μ = ν. *Needs:* the coefficient formula of `jointFiniteProjection` and `finiteProjection_ext`.

### 1.2 Convolution and the finite measure algebras

References: RJW §3.3, Propositions 3.15–3.16, Remark 3.18 and Example 3.19, pp. 121–123; Loeffler, Measure/Monoid.lean: convolveFunRight, right-handed product, ring/algebra and commutative instances. Built on Mathlib `AbstractMeasure.prodMk'`, `AbstractMeasure.map_apply` and `AbstractMeasure.map`. The convolution product, its ring and algebra instances and its commutativity for commutative G are Mathlib's (see the opening of this layer); the subsection states what is built on them.

**Finite algebra projections of measures.** Bundle Π_q as an R-algebra homomorphism `finiteProjectionAlgHom q : D(G,R) → MonoidAlgebra R A`, for a continuous monoid homomorphism q. Its API is `finiteProjectionAlgHom_apply` (the underlying element is ofCoeff(π_q(μ))), `finiteProjectionAlgHom_coeff` (the coefficient at a is π_q(μ)(a)) and `finiteProjectionAlgHom_dirac`. The multiplicativity Π_q(μ ∗ ν) = Π_q(μ) Π_q(ν) of the finite projection is the intermediate result that makes the bundling possible. *Needs:* Mathlib's convolution ring structure on `D(G,R)` (`mul_apply`, `dirac_mul_dirac`), `finiteProjection` and its Dirac value.

**Checks.**
- For q = id on G = ℤ/2 over ℤ with g ≠ 1, the image of 2δ_1 + 3δ_g is single(1,2) + single(g,3), with each coefficient at its own group element.
- The image of δ_x ∗ δ_y is single(q(x)q(y), 1).
- For the constant homomorphism from a finite group to the trivial group over ℤ, the image of 2δ_x + 3δ_y is single(1,5), with no averaging.

**The finite measure algebra.** For finite discrete A, prove that Π_id, which is Mathlib's `AbstractMeasure.monoidAlgebraHom` for the identity of A, is an R-algebra equivalence `finiteProjectionAlgEquiv : D(A,R) ≃ MonoidAlgebra R A`, with inverse c ↦ Σ_a c.coeff(a) δ_a; the algebra map is the library's and only its bijectivity is new. Its API is `finiteProjectionAlgEquiv_apply` (the forward map is finiteProjectionAlgHom(id)), `finiteProjectionAlgEquiv_symm_apply` and `finiteProjectionAlgEquiv_symm_single`. *Needs:* `finiteProjectionAlgHom`, the bijectivity of π_id (§1.1) and the finite-discrete reconstruction.

**Checks.**
- The equivalence sends δ_a to single(a,1).
- The inverse of single(a,2) + single(b,3) with a ≠ b is 2δ_a + 3δ_b, which evaluates the constant function 1 to 5.
- The inverse of single(a,r)·single(b,s) is (rs) δ_{ab}.

**Finite-precision algebra coordinates.** For R = ℤ_p, p prime and r ≥ 0, bundle μ ↦ ofCoeff(π_{(r,q)}(μ)) as a unital ring homomorphism `jointFiniteProjectionRingHom r q : D(G,ℤ_p) → MonoidAlgebra (ZMod(p^r)) A`. Its API is `jointFiniteProjectionRingHom_apply` (the underlying element is ofCoeff(π_{(r,q)}(μ))), `jointFiniteProjectionRingHom_dirac` and `jointFiniteProjectionRingHom_zero_precision`. *Needs:* `finiteProjectionAlgHom` and the coefficient formula of `jointFiniteProjection`.

**Checks.**
- At p = 3, r = 1 and q = id on G = ℤ/2 with g ≠ 1, 3δ_g maps to zero while δ_g maps to single(g,1) over ZMod 3.
- At p = 2, r = 0 the identity measure maps to zero.
- At p = 2, r = 3, the image of (2δ_1) ∗ (3δ_1) is single(1,6) over ZMod 8.

### 1.3 Finite quotients of the p-adic units

References: RJW Definitions 3.7–3.8 and Remarks 3.11–3.12, pp. 119–121; Proposition 3.16 and its full proof, pp. 121–122; Tau Ceti `TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean`. Built on Mathlib `ZMod.unitsMap`, `Continuous.units_map` and `PadicInt.toZModPow`. The proposed namespace is `PadicInt`.

The reduction red_n : U → A_n, the units functor applied to the ring reduction ℤ_p → ℤ/p^nℤ, is Tau Ceti's `PadicInt.unitsToZModPow` (`NumberTheory/Padics/RingHoms.lean`), a continuous monoid homomorphism, and everything about it that the layer uses is already in the libraries: the underlying residue of red_n(u) is the ring reduction of u (`PadicInt.coe_unitsToZModPow_apply`), red_n is multiplicative and unital as a monoid homomorphism, it is surjective (`PadicInt.surjective_units_map_toZModPow`), ρ_n and red_n are continuous (`PadicInt.continuous_toZModPow`, `(PadicInt.unitsToZModPow n).continuous`); ker(red_n) is `TauCeti.unitsPrincipal p n` (`TauCeti.NumberTheory.Padics.PrincipalUnits`), with the membership description `TauCeti.mem_unitsPrincipal_iff`, its openness `TauCeti.isOpen_unitsPrincipal`, the neighbourhood basis of 1 these kernels form `TauCeti.hasBasis_nhds_one_unitsPrincipal`, and their trivial intersection `TauCeti.iInf_unitsPrincipal_eq_bot`, which is the separation of points by the red_n. What remains to prove here is the refinement rule t_{(m,n)} ∘ red_n = red_m for m ≤ n, the value red_0 = 1, and the norm description of the kernel of the integer reduction ρ_n, ‖x‖ ≤ p^{−n} iff ρ_n(x) = 0, which is Mathlib's `PadicInt.norm_le_pow_iff_mem_span_pow` read on the units through `TauCeti.mem_unitsPrincipal_iff_norm`. The checks on the library map are kept as examples.

**Checks.**
- At p = 3, n = 2, red_2(2) is the unit 2 of ℤ/9 and red_2(−1) is the unit 8.
- At p = 2, n = 0 every unit reduces to 1.
- At p = 2, n = 1, −1 and 1 have equal reductions.

**Unit reductions and the local-field filtration.** Let j : U → ℚ_pˣ be the units map of the integer inclusion. Prove that ker(red_n) is the pullback along j of the subgroup `TauCeti.unitFiltration`(ℚ_p, n), for every n ≥ 0. *Needs:* `TauCeti.mem_unitsPrincipal_iff` and Tau Ceti `Padic.integerRing_eq_subring` (`TauCeti.NumberTheory.LocalField.Padic`, with `Padic.integerRingEquiv`), which identifies 𝒪[ℚ_p] with `PadicInt.subring p`. The openness of the kernel and the neighbourhood basis it forms are the library lemmas just named.

**Cofinality of unit congruence kernels.** Prove that every open subgroup H of U contains ker(red_n) for some n ≥ 0; this is read off `TauCeti.hasBasis_nhds_one_unitsPrincipal`, and the separation of points by the kernels is `TauCeti.iInf_unitsPrincipal_eq_bot`. *Needs:* `TauCeti.hasBasis_nhds_one_unitsPrincipal`, `TauCeti.iInf_unitsPrincipal_eq_bot`.

**The modular-unit quotient.** Construct e_n : U/ker(red_n) ≃ A_n as the group isomorphism induced by the surjective red_n, a wrapper on Mathlib's `QuotientGroup.quotientKerEquivOfSurjective` whose only content is the two computation rules; it sends the class of u to red_n(u). Its API is `unitToZModPowQuotient_mk`, `unitToZModPowQuotient_symm_apply` and `unitToZModPowQuotient_eq_native` (e_n is exactly quotientKerEquivOfSurjective applied to red_n and its surjectivity). *Needs:* `PadicInt.unitsToZModPow` and `PadicInt.surjective_units_map_toZModPow`.

**Checks.**
- At p = 3, n = 0 every represented class maps to 1.
- At p = 3, n = 2 the represented class of 2 maps to the unit 2 of ℤ/9, and e_2⁻¹(2) is the class of 2, which also contains 11.
- At p = 2, n = 2, the represented classes of −1 and 1 have different images.

**Discrete homomorphisms factor through a unit quotient.** For every group A with a discrete topology and every continuous group homomorphism q : U → A, prove that there exist n and a homomorphism t : A_n → A such that t ∘ red_n = q. Prove along the way that such a factorisation is unique once n is fixed, and the criterion for a function on U to factor through red_n (constancy on the cosets of ker(red_n)). *Needs:* the cofinality of the kernels and `unitToZModPowQuotient`.

**Descent of locally constant unit tests.** For A any type and f : U → A locally constant, prove that f factors as g ∘ red_n for some n and g : A_n → A (RJW Definitions 3.7–3.8 and Remarks 3.11–3.12, pp. 119–121; Proposition 3.16 and its complete proof, pp. 121–122; Tau Ceti `TauCeti/Topology/Algebra/Group/LocallyConstant.lean`). The intermediate results are the characterisation of the locally constant functions on U as those factoring through some red_n, the uniqueness of the factor g, the refinement of a factor from level n to level n′ ≥ n, the factorisation of a continuous map to a discrete space, the factorisation of the zero function at every level, and the density of the cylinder functions g ∘ red_n in C(U,R). *Needs:* the factorisation criterion and the cofinality of the kernels.

**Unit coordinates determine a measure.** For any normed commutative ring R, with measures meaning AbstractMeasure U R R and no completeness or nonarchimedean assumption on R, prove that two R-valued measures μ, ν on U are equal if π_{red_n}(μ) = π_{red_n}(ν) for every n (RJW Definitions 3.7–3.8 and Remarks 3.11–3.12, pp. 119–121; Proposition 3.16 and its complete proof, pp. 121–122; Tau Ceti `TauCeti/Topology/Algebra/Group/LocallyConstant.lean`). *Needs:* the density of cylinder functions, the pairing formula of `finiteProjection` (§1.1) and the continuity of red_n.

**Joint unit coordinates determine an integral measure.** Prove that two ℤ_p-valued measures on U are equal if their joint finite coordinates at every coefficient precision r and group depth n are equal (RJW Definitions 3.7–3.8 and Remarks 3.11–3.12, pp. 119–121; Proposition 3.16 and its complete proof, pp. 121–122; Tau Ceti `TauCeti/Topology/Algebra/Group/LocallyConstant.lean`). *Needs:* the separation by unit coordinates above and the coefficient formula of `jointFiniteProjection` (§1.1).

**Diagonal unit coordinates determine an integral measure.** Prove that it suffices to compare, for every n, the joint coordinate with coefficient precision n and unit-group depth n (RJW Definitions 3.7–3.8 and Remarks 3.11–3.12, pp. 119–121; Proposition 3.16 and its complete proof, pp. 121–122; Tau Ceti `TauCeti/Topology/Algebra/Group/LocallyConstant.lean`). *Needs:* the joint separation above, the precision and refinement rules of `jointFiniteProjection` (§1.1) and the refinement rule of red_n.

### 1.4 Coordinates of unit measures

References: RJW Remark 3.11 and Proposition 3.16 with its full proof and inverse construction, pp. 120–122. Built on Mathlib `ZMod.unitsMap`, `IsLocallyConstant.of_discrete` and `IsLocallyConstant.comp_continuous`. The proposed namespace is `AbstractMeasure`.

First prove, for a compatible family c, that the pairing Σ_a g(a) c_n(a) is unchanged when a cylinder function g ∘ red_n is rewritten at a deeper level, and hence is independent of the presentation f = g ∘ red_n of a locally constant f.

**Integration of locally constant unit tests.** Construct the ℤ_p-linear functional `unitCoordinateIntegral c`, written I_c : LocallyConstant(U,ℤ_p) → ℤ_p, by I_c(f) = Σ_a g(a) c_n(a), where f = g ∘ red_n at any finite level. Its API is `unitCoordinateIntegral_factor` (for every presentation f = g ∘ red_n, I_c(f) = Σ_a g(a) c_n(a)), `unitCoordinateIntegral_zero`, `unitCoordinateIntegral_add` (I_c(f+h) = I_c(f) + I_c(h)), `unitCoordinateIntegral_smul` (I_c(a f) = a I_c(f) for a ∈ ℤ_p) and `unitCoordinateIntegral_norm_le` (‖I_c(f)‖ ≤ ‖f.toContinuousMap‖); the factor formula and the norm bound are the two intermediate results. *Needs:* the descent of locally constant unit tests (§1.3), the independence of the pairing from the presentation, and the refinement of a factor.

**Checks.**
- At p = 3, if c_n = 2 single(red_n(1),1) + 3 single(red_n(2),1) for all n, then I_c of the indicator of 1 + 3ℤ₃ on U is 2 and I_c of the constant 1 is 5.
- For a ∈ ℤ_p, I_c(constant a) = a c_0(1), since the group A_0 has one element.
- If c_n = single(red_n(u), a) for all n, then I_c(f) = a f(u) for every locally constant f.

**The integral measure of finite unit coordinates.** Construct μ_c = `ofUnitCoordinates c` ∈ D(U,ℤ_p) as the unique continuous extension of I_c from locally constant tests. Its API is `ofUnitCoordinates_locallyConstant` (μ_c(f.toContinuousMap) = I_c(f)), `ofUnitCoordinates_norm_le` (‖μ_c(f)‖ ≤ ‖f‖ for every continuous test), `finiteProjection_ofUnitCoordinates` (π_{red_n}(μ_c) = c_n for every n), `ofUnitCoordinates_mass` (μ_c(1) = c_0(1)), `ofUnitCoordinates_zero` and `ofUnitCoordinates_add` (for compatible c, d, μ_{c+d} = μ_c + μ_d). The intermediate results are the value on locally constant tests, the norm bound, the recovery of the coordinates c_n from μ_c, the compatibility of the coordinates (n ↦ π_{red_n}(μ)) of any measure under the transition pushforwards, and the reconstruction μ = μ_{(π_{red_n}(μ))_n} of a measure from its own coordinates. *Needs:* `unitCoordinateIntegral` and its norm bound, the density of cylinder functions and the continuity of red_n.

**Checks.**
- At p = 3, if c_n = single(red_n(1),1) + single(red_n(2),1) for all n, then μ_c evaluates the indicator of 1 + 3ℤ₃ to 1 and the constant 1 to 2.
- If c_n = single(red_n(u), a) at every level, then μ_c = a δ_u on the measure carrier.
- If c_n = 2 single(red_n(u),1) + 3 single(red_n(v),1), then μ_c(1) = 5, even when u and v reduce to the same unit.

**Existence and uniqueness from compatible unit coordinates.** Prove `existsUnique_ofUnitCoordinates`: for every compatible integral family c as above, there exists a unique μ ∈ D(U,ℤ_p) such that π_{red_n}(μ) = c_n for every n ≥ 0. *Needs:* the recovery of the coordinates from `ofUnitCoordinates` and the separation by unit coordinates (§1.3).

### 1.5 The weak topology in unit coordinates

References: RJW Definition 3.5, p. 119; Remark 3.11 and Proposition 3.16 with full proof, pp. 120–122; Remark 3.18, pp. 122–123. Built on Mathlib `Topology.IsInducing.continuous_iff`, `continuous_pi` and `nhds_discrete`.

**The closed image of integral unit coordinates.** Prove `range_unitCoordinates`: the image of μ ↦ (n, a ↦ π_n(μ)(a)) is exactly the set of families c_n : A_n → ℤ_p whose finite-support forms are compatible under transition pushforward t_{(m,n)} : A_n → A_m for every m ≤ n; equivalently, c_m(a) is the sum of c_n(b) over t_{(m,n)}(b) = a. Prove along the way that the inverse c ↦ μ_c is continuous from the product topology on the compatible families to the weak topology (`continuous_ofUnitCoordinates`). *Needs:* the compatibility of coordinates, `ofUnitCoordinates`, the recovery of coordinates, and `existsUnique_ofUnitCoordinates` (§1.4).

**The integral unit-coordinate embedding.** Prove `isClosedEmbedding_unitCoordinates_weak`: the map μ ↦ (n ↦ (a ↦ π_n(μ)(a))) is a closed embedding of M, with its weak topology, into ∏_n (A_n → ℤ_p) with the product topology: injective, continuous, with continuous inverse on its image, which is the closed set of compatible families of `range_unitCoordinates`. *Needs:* the weak continuity of finite projections (§1.1), the separation by unit coordinates (§1.3), `continuous_ofUnitCoordinates`, `range_unitCoordinates`, Mathlib `Topology.IsClosedEmbedding`.

**Weak compactness of integral unit measures.** Prove `compactSpace_unitMeasures_weak`: M with its weak topology is compact, being homeomorphic to a closed subset of ∏_n (A_n → ℤ_p), which is compact because ℤ_p is. *Needs:* `isClosedEmbedding_unitCoordinates_weak`, Mathlib `PadicInt.compactSpace`, `Pi.compactSpace`, `IsClosed.isCompact`.

**The joint finite unit-coordinate embedding.** Prove `isClosedEmbedding_jointUnitCoordinates_weak`: the map μ ↦ (r, n, a ↦ π_{(r,n)}(μ)(a)) is a closed embedding of M, with its weak topology, into the product of the discrete rings ZMod(p^r) indexed by r, n and a ∈ A_n (continuous, injective, from a compact space). *Needs:* `compactSpace_unitMeasures_weak`, the coefficient formula of `jointFiniteProjection` (§1.1), `PadicInt.continuous_toZModPow`, the weak continuity of finite projections, and the joint separation of §1.3.

**Weak convergence through joint unit coordinates.** Prove that for any filter l on any index type and family μ_i ∈ M, μ_i tends weakly to ν if and only if, for every r, n, π_{(r,n)}(μ_i) = π_{(r,n)}(ν) eventually along l. Prove along the way that the sets {μ : π_{(r,n)}(μ) = 0} form a neighbourhood basis of 0 in M, that the diagonal sets {μ : π_{(n,n)}(μ) = 0} already do, that M with the weak topology is a topological ring for the convolution, and that its topology is linear (a basis of open ℤ_p-submodules at 0). *Needs:* `isClosedEmbedding_jointUnitCoordinates_weak`.

### 1.6 Moments and characters of unit measures

References: RJW §3.6 Definition 3.34, equation (3-11), Remark 3.35 and complete Lemma 3.36(i)–(iii), pp. 129–131. Built on Mathlib `AbstractMeasure.dirac`, `AbstractMeasure.map_dirac` and `ContinuousMonoidHom`. The Dirac monoid homomorphism `AbstractMeasure.diracHom` is Mathlib's (see the opening of this layer).

**Continuous-character integration as an algebra map.** For a ContinuousMonoidHom κ : G → R, define the R-algebra homomorphism `characterIntegralAlgHom κ : D(G,R) → R` by μ ↦ μ(κ.toContinuousMap). Its API is `characterIntegralAlgHom_apply` (the value is evaluation on κ.toContinuousMap), `characterIntegralAlgHom_dirac`, `characterIntegralAlgHom_one_character` (the trivial character gives μ(1), the total mass) and `characterIntegralAlgHom_diracHom` (composition with diracHom is κ.toMonoidHom). *Needs:* Mathlib's convolution algebra on `D(G,R)` with the evaluation formulas `mul_apply` and `convolveFunRight_apply`, and `AbstractMeasure.diracHom`.

**Checks.**
- For the trivial character the value is the total mass μ(1): over ℤ on G = ℤ/2, δ_1 + δ_g evaluates to 2.
- For the sign character κ(g) = −1 of G = ℤ/2 over ℤ, δ_1 + δ_g evaluates to 0 and δ_1 − δ_g to 2.
- The value of cδ_g is cκ(g).

### 1.7 Comparison with the completed group algebra

Standing assumptions: Γ is a profinite group with a countable basis of open normal subgroups, presented by a tower of finite quotients (`FiniteQuotientTower` below); for Γ = ℤ_pˣ the tower is red_n with transition maps `ZMod.unitsMap`, for Γ = ℤ_p it is ρ_n. The completed group algebra is Tau Ceti's `TauCeti.completedGroupAlgebra ℤ_p Γ` (a91d3aaf; the carrier of ProfiniteProPGroups, layer 9), lim_U ℤ_p[Γ/U] with its inverse-limit topology, projections `proj`, group elements `of`, the constructor `mk` from a compatible family and the universal property `lift`; the algebra map `toCompletedGroupAlgebra` below is `lift` of the family of finite algebra projections Π_{q_U}, U open normal, and the tower presents the same limit cofinally, which is how the closed embedding into a countable product is stated. This subsection is the measure side only: the carrier, its topology, its ℤ_p power-series coordinate for Γ ≅ ℤ_p, the continuity of that coordinate and the change of generator are Tau Ceti's and are consumed as such; the compatibility of the comparison below with the coordinate is stated in §4.5, after the coordinate, so that it is never an input of the comparison.

References: RJW Proposition 3.16 and its proof, pp. 121–122, which builds the inverse directly from a compatible family (its values on the cosets of each level form an additive function on the open compact subsets, hence a measure by Remarks 3.11–3.12) without any compactness theorem.

**Towers of finite quotients.** Define a tower of finite quotients of a topological group Γ, `FiniteQuotientTower Γ`, to be a family of continuous surjective homomorphisms q_n : Γ → A_n onto finite discrete groups with transition homomorphisms t_{(m,n)} : A_n → A_m for m ≤ n, t_{(m,n)} ∘ q_n = q_m, such that the kernels separate points: for every x ≠ 1 some q_n(x) ≠ 1. For compact Γ the kernels ker q_n are then cofinal among the open normal subgroups. Its API is `FiniteQuotientTower` (the structure with fields `q`, `continuous_q`, `surjective_q`, `t`, `t_q`, `separates`), `FiniteQuotientTower.t_comp` (t_{(k,m)} ∘ t_{(m,n)} = t_{(k,n)} on the image of q_n), `FiniteQuotientTower.ker_cofinal` (for compact Γ every open normal subgroup contains some ker q_n, from Tau Ceti's `TauCeti.hasAntitoneBasis_nhds_one_of_iInf_eq_bot` applied to the decreasing kernels with trivial intersection), `FiniteQuotientTower.unitTower` (the tower red_n of ℤ_pˣ) and `FiniteQuotientTower.padicTower` (the tower ρ_n of ℤ_p). *Needs:* `PadicInt.unitsToZModPow` and `PadicInt.surjective_units_map_toZModPow` (§1.3), Mathlib `ZMod.unitsMap`, `PadicInt.toZModPow`.

**Checks.**
- red_n with `ZMod.unitsMap` is a tower of ℤ_pˣ (surjectivity is `PadicInt.surjective_units_map_toZModPow`).
- A finite discrete group with the constant tower q_n = id is a tower whose compatible families are the constant ones.
- The trivial maps q_n = 1 on a nontrivial Γ fail separation, so they are not a tower.

**Integral measures are the completed group algebra.** For a profinite group Γ, construct the ℤ_p-algebra map `toCompletedGroupAlgebra : D(Γ, ℤ_p) → completedGroupAlgebra ℤ_p Γ` whose projection `completedGroupAlgebra.proj` to the level Γ/U, for every open normal subgroup U, is the finite algebra projection Π_{Γ → Γ/U} of `finiteProjectionAlgHom` (§1.2), and prove: it carries δ_x to `completedGroupAlgebra.of x` and convolution to the product; it is injective; it is surjective, with inverse the limit of the finite Dirac expansions Σ_a c_U(a) δ_a of a compatible family (so along a tower (q_n, t) the compatible families c_m = (t_{(m,n)})_* c_n are exactly the measures); it is a closed embedding for the weak topology on measures and the inverse-limit topology of the completed group algebra; and D(Γ, ℤ_p) is weakly compact. The comparison uses only the finite projections of this layer; its compatibility with the power-series coordinate (for Γ = ℤ_p the composite is the Amice transform) is §4.5, a consequence stated after the coordinate. Its API is `toCompletedGroupAlgebra` (the ℤ_p-algebra map into `completedGroupAlgebra ℤ_p Γ`), `toCompletedGroupAlgebra_apply` (the level U is Π_{Γ → Γ/U}), `toCompletedGroupAlgebra_dirac`, `toCompletedGroupAlgebra_injective`, `toCompletedGroupAlgebra_surjective` (every compatible family comes from a measure), `isClosedEmbedding_toCompletedGroupAlgebra` (closed embedding for the weak topology into the inverse-limit topology) and `compactSpace_integralMeasures_weak_of_tower` (D(Γ, ℤ_p) is weakly compact). *Needs:* `FiniteQuotientTower`, `finiteProjectionAlgHom` and the multiplicativity of finite projections (§1.2), `finiteProjection_ext` and the weak continuity of finite projections (§1.1), `ofUnitCoordinates` (§1.4), `isClosedEmbedding_unitCoordinates_weak` and `compactSpace_unitMeasures_weak` (§1.5), Tau Ceti `completedGroupAlgebra.proj`, `completedGroupAlgebra.of`, `completedGroupAlgebra.ext`, `completedGroupAlgebra.mk`.

**Checks.**
- δ_x ∗ δ_y projects to single(x̄ȳ, 1) at every level U.
- For x ≠ y the images of δ_x and δ_y differ.
- δ_1 maps to 1.

**Coefficient extension of the completed group algebra.** For O a normed commutative ring that is a finite free ℤ_p-module (the valuation ring of a finite extension of ℚ_p, ramified or not), construct the O-linear equivalence `completedGroupAlgebraBaseChange O : O ⊗_{ℤ_p} D(Γ, ℤ_p) ≃ D(Γ, O)`, a ⊗ μ ↦ a·(μ with coefficients extended along ℤ_p → O), multiplicative for the convolutions, so that O ⊗_{ℤ_p} `completedGroupAlgebra p Γ` ≅ lim_U O[Γ/U] ≅ D(Γ, O) as O-algebras; with the topology of a finite free module over the algebra, independent of the basis, it is a complete topological O-algebra. Inverting p gives the bounded K-valued measures, which are not lim_U K[Γ/U] (RJW Proposition 3.16, pp. 121–122, stated there for O_L-coefficients). Its API is `completedGroupAlgebraBaseChange` (the O-linear equivalence), `completedGroupAlgebraBaseChange_tmul_dirac` (a ⊗ δ_x ↦ a δ_x) and `completedGroupAlgebraBaseChange_mul` (multiplicativity for the convolutions). *Needs:* `toCompletedGroupAlgebra`, Mathlib's convolution algebra on `D(G,R)`, `Algebra.TensorProduct`, `Module.Free`.

**Checks.**
- For O = ℤ_p the equivalence is the canonical ℤ_p ⊗ D ≅ D.
- 1 ⊗ δ_x maps to δ_x.
- For a ≠ b in O the images of a ⊗ δ_x and b ⊗ δ_x differ.

**Extension of coefficients along a bounded ring map.** For a profinite space X (compact Hausdorff totally disconnected), a normed commutative ring O, a nontrivially normed field K and a continuous ring homomorphism j : O → K with ‖j(a)‖ ≤ ‖a‖ (the case of use is j the inclusion O ⊂ C_p of the valuation ring of a finite extension of ℚ_p, an isometry), construct the additive map `extendCoefficients`, written ι_j : D(X, O) → D(X, K), determined by ι_j(μ)(j ∘ f) = j(μ(f)) for every f ∈ C(X, O): on a locally constant K-valued test function Σ_i c_i·1_{U_i} (U_i a finite clopen partition, c_i ∈ K) its value is Σ_i c_i·j(μ(1_{U_i})), and it extends to C(X, K) by continuity because the locally constant functions are dense and |Σ c_i j(μ(1_{U_i}))| ≤ max|c_i|·sup_U |j(μ(1_U))|, which uses that K is ultrametric. Prove: ι_j is j-semilinear, ι_j(a·μ) = j(a)·ι_j(μ); it commutes with pushforward along continuous maps and with clopen restriction (`restrictClopen`, §0.1); for a profinite monoid G, with X a commutative profinite monoid for the convolution statements, it is a ring homomorphism D(G, O) → D(G, K) for the convolutions, with ι_j(δ_x) = δ_x; it is injective when j is injective with closed image (an isometry into a complete field K); its operator norm is bounded by sup over clopens of |j(μ(1_U))|, so ‖ι_j(μ)‖ ≤ 1 when ‖j(a)‖ ≤ 1 on O; and the admissible evaluation of §3.1 commutes with it: for a pseudo-measure z of D(G, O) and an admissible g, ι_j of the cleared numerator is the cleared numerator of the extended pseudo-measure (`evalAt_map` for the ring map ι_j). For O finite free over ℤ_p and j the inclusion, ι_j agrees with the composite of `completedGroupAlgebraBaseChange` and the extension along ℤ_p → K of `extendIntegralCoefficients` (§2.5) on the ℤ_p-domain. This is an extension map; it is not asserted that every K-valued measure is in its image (§2.5 characterises the image for O = ℤ_p, K = ℚ_p as the unit ball). Its API is `extendCoefficients` (ι_j : D(X, O) →+ D(X, K)), `extendCoefficients_apply_comp` (ι_j(μ)(j ∘ f) = j(μ(f))), `extendCoefficients_smul` (ι_j(a·μ) = j(a)·ι_j(μ)), `extendCoefficients_map` (ι_j(φ_*μ) = φ_*(ι_j μ)), `extendCoefficients_dirac`, `extendCoefficients_mul` (ι_j(μ ⋆ ν) = ι_j(μ) ⋆ ι_j(ν) on a profinite monoid), `extendCoefficients_injective` (for j an isometry into a complete field), `norm_toCLMEquiv_extendCoefficients_le` (‖ι_j(μ)‖ ≤ 1 when ‖j‖ ≤ 1, K ultrametric), `extendCoefficientsRingHom` with `coe_extendCoefficientsRingHom` (ι_j as a ring homomorphism for a profinite commutative monoid) and `extendCoefficients_numerator_evalAt` (compatibility with the admissible evaluation of §3.1). (RJW Remark 3.28(1)–(2), p. 125, and Proposition 3.16, pp. 121–122, for O_L-valued measures as the L-valued ones bounded by one; the extension along an isometry has no separate statement in the sources and is stated here as the specification.) *Needs:* `finiteProjection` and `finiteProjection_ext` (§1.1), `toCompletedGroupAlgebra`, `completedGroupAlgebraBaseChange`, `restrictClopen` (§0.1), the density of `LocallyConstant` functions, Mathlib `ContinuousLinearMap.extend`.

**Checks.**
- For O = K and j = id, ι_j is the identity.
- ι_j(δ_x)(f) = f(x) for every f ∈ C(X, K), in particular ι_j(δ_x) ≠ 0.
- For O = ℤ_p, K = ℚ_p and μ = δ_1 − δ_0 on ℤ_p, ι_j(μ) is the measure with Amice transform T of `boundedInvTransform` (§2.5).
- ι_j(2δ_x) = 2·ι_j(δ_x) ≠ ι_j(δ_x) over K of characteristic zero, which rejects a map forgetting the coefficient.

### Examples

- On G = ℤ/2 over ℤ with g ≠ 1, the finite algebra projection sends 2δ_1 + 3δ_g to single(1,2) + single(g,3) and δ_x ∗ δ_y to single(q(x)q(y),1); the same measure projects under the constant map to single(1,5), with no averaging.
- At p = 3, the compatible family c_n = 2 single(red_n(1),1) + 3 single(red_n(2),1) integrates the indicator of 1 + 3ℤ₃ to 2 and the constant 1 to 5, and `ofUnitCoordinates c` is the measure 2δ₁ + 3δ₂ up to the identification of coordinates.
- The tower red_n of ℤ_pˣ (`FiniteQuotientTower.unitTower`) presents M as the closed set of compatible families in ∏_n (A_n → ℤ_p), hence as a compact space; the trivial maps q_n = 1 on a nontrivial Γ are not a tower.
- Under `toCompletedGroupAlgebra`, δ_x ∗ δ_y projects to single(x̄ȳ,1) at every level, δ_1 maps to 1, and distinct points give distinct images.
- For O = ℤ_p, K = ℚ_p the coefficient extension of δ_1 − δ_0 is the measure with Amice transform T, and ι_j(2δ_x) ≠ ι_j(δ_x).

### Dependencies

Layer 0 (`restrictClopen`, the weak topology). Mathlib: `AbstractMeasure` with `dirac_apply`, `map_apply`, `map`, `map_dirac`, `prodMk'`, `monoidAlgebraHom`, `QuotientGroup.quotientKerEquivOfSurjective`, the convolution ring and algebra structure of `Mathlib.NumberTheory.Padics.Measure.Monoid` (`convolveFunRight`, `mul_apply`, `dirac_mul_dirac`, `one_apply`, `diracHom`), `ContinuousMap.equivFnOfDiscrete`, `Finsupp.linearEquivFunOnFinite`, `Finsupp.mapDomain`, `MonoidAlgebra.ofCoeff`, `ZMod.unitsMap`, `Continuous.units_map`, `PadicInt.toZModPow`, `PadicInt.compactSpace`, `Pi.compactSpace`, `IsClosed.isCompact`, `Topology.IsClosedEmbedding`, `Topology.IsInducing.continuous_iff`, `continuous_pi`, `nhds_discrete`, `IsLocallyConstant.of_discrete`, `IsLocallyConstant.comp_continuous`, `ContinuousMonoidHom`, `Algebra.TensorProduct`, `Module.Free`, `ContinuousLinearMap.extend`. Tau Ceti: `PadicInt.unitsToZModPow` with `PadicInt.coe_unitsToZModPow_apply`, `PadicInt.surjective_units_map_toZModPow`, `PadicInt.continuous_toZModPow`, `PadicInt.norm_le_pow_iff_mem_span_pow`, `TauCeti.unitsPrincipal` with `mem_unitsPrincipal_iff`, `mem_unitsPrincipal_iff_norm`, `isOpen_unitsPrincipal`, `hasBasis_nhds_one_unitsPrincipal`, `iInf_unitsPrincipal_eq_bot`, `TauCeti.hasAntitoneBasis_nhds_one_of_iInf_eq_bot`, `Padic.integerRing_eq_subring`, `TauCeti.unitFiltration`, `TauCeti.rightTranslationStabilizer`, and `TauCeti.completedGroupAlgebra` with `proj`, `of`, `mk`, `lift`, `ext` (ProfiniteProPGroups, layer 9). The admissible evaluation of §3.1 and the Amice-side statements of §2.5 and §4.5 are consumers of this layer, not inputs.

## Layer 2: Mahler–Amice theory for bounded measures

The Mahler–Amice dictionary on ℤ_p and its operator calculus: moments, the Mahler derivation, weighting, translation and dilation, root-of-unity averaging and the residue projections, φ and ψ with ψφ = 1 and φψ = restriction to pℤ_p, the bounded Amice norm and the rational integral lattice, the extension to field coefficients on the unit domain, inversion of multiplication by x on the units, and the reduction of ψ modulo p. The Cartier operators on power series that the residue theory uses are a statement of this layer, made for every commutative ring.

Standing assumptions for this layer: p is any prime, including 2. Z = ℤ_p, U = Zˣ with the subspace topology, B = Z⟦T⟧ with the coefficientwise p-adic topology (`PowerSeries.WithPiTopology`, not a coefficient-norm topology), B_0 = k⟦T⟧ with the coefficientwise discrete topology, ρ : B → B_0 the coefficient map induced by `PadicInt.toZMod`, Y = 1 + T and b = Y^p − 1, whose constant coefficient is 0, so that formal substitution at b (`PowerSeries.subst`) is defined; no analytic evaluation or inverse substitution is asserted in this layer. X is a compact space and R a normed commutative ring, possibly the zero ring, with μ ∈ D(X,R) and g ∈ C(X,R); where R must be a ℤ_p-algebra its scalar action is bounded, |a·r| ≤ |a||r|, and completeness and ultrametricity are added only where a statement says so; K is a nontrivially normed field with the same bounded ℤ_p-action; the rational comparisons take R = ℚ_p. C_p is `PadicComplex`, O its valuation ring, j₀ : Z → C_p the canonical map; for the root-of-unity statements K has characteristic zero and ζ has exact order p. For the exponential, R is a commutative ℚ-algebra, E = `PowerSeries.exp` and h = E − 1. Notation: x is the identity function on Z, x_R = j ∘ x and M_{(R,n)} = j ∘ mahler_n for the algebra map j : ℤ_p → R; W = weight x; D is the formal derivative and ∂ (∂_R on R⟦T⟧) the Mahler derivation (1 + T)·d/dT; A is the Amice transform; φ is substitution by b and ψ = psiSeries its left inverse, φψ being the restriction to pZ; H = inverseMahler; b_a = binomialSeries(a) − 1, S_a(F) = `PowerSeries.subst` (b_a, F), d_a : x ↦ ax; E = E_R = unitRestriction, r = r_R the intrinsic unit restriction D(Z,R) → D(U,R), j_R the pushforward along `Units.val` (r_R j_R = id, j_R r_R = E_R); I_R is the extension `extendIntegralCoefficients` of §2.5; χ is the characteristic function of pZ, m_p(x) = px; C_{(n,a)} = ρ_n⁻¹{a}, χ_{(n,a)} its characteristic function, P_{(n,a)} = restrictResidue, π_n the finite projection of ρ_n. Measure norms are operator norms through `toCLMEquiv`, for field coefficients only, so D(Z,Z) receives no norm instance; additive convolution on Z and multiplicative convolution on U are never identified.

### 2.1 Moments, the Mahler derivation and the Amice transform

References: RJW §3.5.1, Lemma 3.29 and Corollary 3.30, p. 126. Built on Mathlib `AbstractMeasure.coeff_amiceTransform`, `mahler_apply` and `Derivation.smul_apply`. The proposed namespaces are `AbstractMeasure` and `PowerSeries`.

**Weighted measures.** Define `AbstractMeasure.weight g : D(X,R) →ₗ[R] D(X,R)` by (weight g μ)(f) = μ(gf). This acts on the carrier; it is not a second definition of bounded measures (RJW §3.5.2, pp. 126–127). Its API is `weight_apply` ((weight g μ)(f) = μ(gf)), `weight_one`, `weight_zero`, `weight_mul` (weight (gh) μ = weight g (weight h μ)), `weight_const` (weight (const r) μ = r • μ) and `weight_dirac`. The intermediate results are the evaluation formula, the multiplicativity in g, the naturality under pushforward (`map_weight`: map h (weight (g ∘ h) μ) = weight g (map h μ)) and the iteration formula (`iterate_weight_apply`: ((weight g)^[k] μ)(f) = μ(g^k f)).

**Checks.**
- Over ℤ₃, weight x δ₀ = 0 although δ₀ ≠ 0, as evaluation on 1 shows; weighting by x is not injective.
- Over ℤ₃, weight x δ₁ = δ₁.
- Over ℤ₃, weight x δ₂ = 2δ₂; this rejects a definition that ignores g.

**Mahler derivation.** Define `PowerSeries.mahlerDerivation R : Derivation R R⟦T⟧ R⟦T⟧` as (1+T) • `PowerSeries.derivative R`, and write ∂F = (1+T)DF. Its API is `mahlerDerivation_apply` (∂F = (1+T)DF), `coeff_mahlerDerivation` (coeff_n ∂F = (n+1) coeff_{n+1} F + n coeff_n F), `mahlerDerivation_C`, `mahlerDerivation_X`, `mahlerDerivation_mul` (∂(FG) = F∂G + G∂F, from the inherited derivation law) and `map_mahlerDerivation` (map f (∂F) = ∂(map f F)). The intermediate results are the value formula, the coefficient formula, compatibility with coefficient maps and with their iterates (`map_iterate_mahlerDerivation`), and the Mahler recurrence x·mahler_n = (n+1)·mahler_{n+1} + n·mahler_n (`id_mul_mahler`) on which the next statement rests.

**Checks.**
- Over ℤ, ∂(C 7) = 0.
- Over ℤ, ∂T = 1 + T; both D and TD fail this test.
- Over ℤ, ∂((1+T)²) = 2(1+T)².

**Amice transform of multiplication by x.** Prove `amiceTransform_weight_id`: A(weight x μ) = ∂(Aμ) in ℤ_p⟦T⟧, and its iterate `amiceTransform_iterate_weight_id`: A((weight x)^[k] μ) = ∂^[k](Aμ). *Needs:* the evaluation formula of `weight`, the Mahler recurrence and the coefficient formula of `mahlerDerivation`.

**Ordinary moments from the Amice transform.** Prove `ordinaryMoment_eq_constantCoeff`: for k ∈ ℕ, μ(x^k) = constantCoeff(∂^[k](Aμ)) in ℤ_p. *Needs:* the iterated Amice weighting identity and the iteration formula of `weight`.

Prove next the three formal facts about the exponential over a commutative ℚ-algebra R: the conjugacy `derivative_subst_exp_sub_one` (D(F(E − 1)) = (∂F)(E − 1)), its iterate `iterate_derivative_subst_exp_sub_one`, and the coefficient formula `constantCoeff_iterate_mahlerDerivation` (constantCoeff(∂^[k] F) = k!·coeff_k(F(E − 1))).

**Ordinary moments as exponential coefficients.** Prove `ordinaryMoment_eq_factorial_coeff`: for μ : D(ℤ_p,ℤ_p) and k ∈ ℕ, (μ(x^k) : ℚ_p) = (k! : ℚ_p) * coeff_k(`PowerSeries.subst` (`PowerSeries.exp` ℚ_p − 1) (`PowerSeries.map` (algebraMap ℤ_p ℚ_p) Aμ)); the evaluated integral is embedded, not the measure, and exp is purely formal over ℚ_p (RJW §3.5.1, Lemma 3.29 and Corollary 3.30, p. 126; §4.1, Lemma 4.3 and its use in Proposition 4.6, pp. 136–137). *Needs:* `ordinaryMoment_eq_constantCoeff`, `map_iterate_mahlerDerivation`, the exponential coefficient formula.

Over a coefficient algebra R with bounded ℤ_p-action, first prove the algebra form of the Mahler recurrence x_R·M_{(R,n)} = (n+1)·M_{(R,n+1)} + n·M_{(R,n)}, and that the constant coefficient of Aμ is the total mass μ(1).

**Amice weighting over a coefficient algebra.** Prove A(weight(x_R) μ) = ∂_R(Aμ) in R⟦T⟧ (RJW §3.5.1, Lemma 3.29 with its full proof and Corollary 3.30, p. 126; coefficient-field context in Remark 3.28(1–2), p. 125). Prove along the way its iterate A((weight x_R)^[k] μ) = ∂_R^[k](Aμ). *Needs:* the evaluation formula of `weight`, the algebra Mahler recurrence, the coefficient formula of `mahlerDerivation`.

**Ordinary moments over a coefficient algebra.** Prove that for every k ≥ 0, μ(x_R^k) = constantCoeff(∂_R^[k](Aμ)) (RJW §3.5.1, Lemma 3.29 with its full proof and Corollary 3.30, p. 126; coefficient-field context in Remark 3.28(1–2), p. 125). *Needs:* the algebra mass identity, the iterated algebra weighting identity, the iteration formula of `weight`.

**Exponential moments over a coefficient algebra.** For R additionally carrying a ℚ-algebra structure, used only for the formal exponential comparison and never imposed on ℤ_p, prove that for every k ≥ 0, μ(x_R^k) = k!·coeff_k(Aμ(exp(T) − 1)) in R (RJW §3.5.1, Lemma 3.29 with its full proof and Corollary 3.30, p. 126; coefficient-field context in Remark 3.28(1–2), p. 125; §4.1, Lemma 4.3 and the full proof of Proposition 4.6, pp. 136–137). *Needs:* the algebra ordinary-moment formula, the exponential coefficient formula.

### 2.2 Translation, dilation, φ and ψ on power series

References: RJW §3.5.5, p. 128, with the pℤ_p restriction from §3.5.3, p. 127. Built on Mathlib `LocallyConstant.coe_charFn`, `AbstractMeasure.dirac_apply` and `AbstractMeasure.map_apply`.

First prove that pZ is clopen in Z, so that its characteristic function χ is continuous.

**Exact division on pℤ_p.** Define `divideByP : C(Z,Z)`, written q, by q(px) = x for every x ∈ Z and q(y) = 0 for y ∈ U (the units, the complement of pZ). So q is the inverse of multiplication by p on pZ and vanishes on U; it is continuous because pZ and U are complementary clopens. Its API is `divideByP_mul` (q(px) = x for every x ∈ Z), `mul_divideByP` (for y ∈ pZ, p·q(y) = y) and `divideByP_of_not_dvd` (for y ∈ U, that is p ∤ y, q(y) = 0); the first two are the intermediate results the ψ-identities below use. *Needs:* the clopenness of pZ.

**Checks.**
- q(0) = 0 over ℤ₃.
- q(6) = 2 over ℤ₃; rejects the identically-zero function.
- q(1) = 0 over ℤ₃; it is not multiplication by a ring inverse of 3.
- The two clauses are consistent at y = p: p ∈ pZ, so q(p) = 1 by the first and the second does not apply; a definition with q = 0 outside U would give both q(p) = 1 and q(p) = 0.

**Restriction to pℤ_p.** Define `restrictMultiples : D(Z,R) →ₗ[R] D(Z,R)` to be weight χ. It is restriction followed by extension by zero on the ambient Z carrier. Its API is `restrictMultiples_eq_weight` (restrictMultiples = weight χ, using the weight carrier), `restrictMultiples_apply` (Pμ(f) = μ(χf), the evaluation formula), `restrictMultiples_dirac` and `restrictMultiples_idem` (P(Pμ) = Pμ). *Needs:* the clopenness of pZ, `weight` with its evaluation formula and multiplicativity.

**Checks.**
- Pδ₀ = δ₀ over ℤ₃, since 0 belongs to 3ℤ₃.
- Pδ₁ = 0 over ℤ₃.
- Pδ₃ = δ₃ over ℤ₃; restriction does not rescale the atom.

**Frobenius on bounded measures.** Define `phiMeasure` = `AbstractMeasure.map` m_p as an R-linear endomorphism of D(Z,R), denoted φ. Its API is `phiMeasure_eq_map` (φ equals the pushforward along m_p), `phiMeasure_apply` (φμ(f) = μ(f ∘ m_p), the evaluation formula), `phiMeasure_dirac` and `phiMeasure_injective` (φ is injective; the proof is supplied by the left-inverse identity below).

**Checks.**
- φ(0) = 0 over ℤ₃.
- φδ₂ = δ₆ over ℤ₃.
- φμ(1) = μ(1) over ℤ₃; rejects an extra factor p.

**The left inverse of Frobenius.** Define `psiMeasure` = (`AbstractMeasure.map` q) ∘ `restrictMultiples` as an R-linear endomorphism of D(Z,R), denoted ψ. Its API is `psiMeasure_eq_map_restrict` (ψ = (map q) ∘ P, as linear maps), `psiMeasure_apply` (ψμ(f) = μ(χ(f ∘ q)), the evaluation formula), `psiMeasure_dirac`, `psiMeasure_phiMeasure` (ψφμ = μ) and `phiMeasure_psiMeasure` (φψμ = Pμ). *Needs:* `divideByP`, `restrictMultiples` and its evaluation formula.

**Checks.**
- ψδ₀ = δ₀ over ℤ₃.
- ψδ₆ = δ₂ over ℤ₃; no scalar 1/3 occurs.
- ψδ₁ = 0 over ℤ₃; bare pushforward by q would give δ₀.

**The left inverse identity.** Prove ψ(φμ) = μ for every μ ∈ D(Z,R). *Needs:* the evaluation formulas of ψ and φ, `divideByP_mul`.

**Frobenius after its left inverse.** Prove φ(ψμ) = Pμ for every μ ∈ D(Z,R). *Needs:* the evaluation formulas of φ and ψ, `mul_divideByP`, the evaluation formula of P.

**Restriction to units.** Define `unitRestriction` = id − P as an R-linear endomorphism of D(Z,R), denoted E. Its test-function multiplier is 1 − χ, the characteristic function of Zˣ. Its API is `unitRestriction_eq_sub` (E = id − P as linear maps), `unitRestriction_apply` (Eμ(f) = μ((1−χ)f), the evaluation formula), `unitRestriction_dirac`, `unitRestriction_idem` (E² = E), `unitRestriction_eq_self_iff` (Eμ = μ iff μ(χf) = 0 for every f) and `unitRestriction_eq_self_iff_psi_eq_zero` (Eμ = μ iff ψμ = 0). *Needs:* `restrictMultiples` and its evaluation formula, the multiplicativity of `weight`, the two identities φψ = P and ψφ = id.

**Checks.**
- Eδ₁ = δ₁ over ℤ₃.
- Eδ₀ = 0 over ℤ₃.
- Eδ₃ = 0 over ℤ₃; a nonzero atom need not be on units.

**Test-function support on units.** Prove that Eμ = μ iff μ(χf) = 0 for every f ∈ C(Z,R); equivalently, μ annihilates every continuous function vanishing on U, such a function being χf for f its own restriction to pZ (χ is the characteristic function of pZ). A measure supported on U does not annihilate the functions vanishing outside U: δ₁ is supported on U, and 1_U vanishes outside U with δ₁(1_U) = 1. *Needs:* `unitRestriction`, the evaluation formula of P.

**Unit support and the kernel of psi.** Prove that Eμ = μ iff ψμ = 0 (RJW Corollary 3.32, p. 129; equations (3-7)–(3-8), p. 128). *Needs:* `unitRestriction`, `psiMeasure`, φψ = P.

Then prove the Mahler Frobenius identity (`mahler_mul_prime`): the Mahler function mahler_n composed with m_p has the finite Mahler expansion mahler_n ∘ m_p = Σ_{k ≤ n} coeff_n(b^k)·mahler_k with b = Y^p − 1, read off from (1+T)^{px} = (1 + b)^x = Σ_k binom(x,k) b^k by taking the coefficient of T^n; at p = 2, n = 1 it says binom(2x,1) = 2·binom(x,1), the T-coefficient of b = 2T + T² (an expansion in the coefficients of (Y^p)^n = (1+T)^{pn} would give 1 + 2x + binom(x,2) instead). This is the identity behind the next statement.

**Frobenius and the Amice transform.** Prove A(φμ) = `PowerSeries.subst` b (Aμ) for integral Z-valued μ. *Needs:* the evaluation formula of φ, the Mahler Frobenius identity.

**Psi on integral power series.** Define `psiSeries` = A ∘ ψ ∘ A⁻¹ : B →ₗ[Z] B. This is a linear operator, not a ring homomorphism. Its API is `psiSeries_eq_transport` (psiSeries = A ∘ ψ ∘ A⁻¹ as linear maps), `psiSeries_amiceTransform` (psiSeries(Aμ) = A(ψμ)), `psiSeries_phi` (psiSeries(subst b F) = F), `psiSeries_one` and `psiSeries_one_add_X`. *Needs:* `psiMeasure`.

**Checks.**
- psiSeries((1+T)³) = 1 + T for p = 3, since (1+T)³ = Aδ₃ and ψδ₃ = δ₁.
- psiSeries(1) = 1 for p = 3; rejects a zero operator.
- psiSeries(1+T) = 0 for p = 3.

**Psi and the Amice transform.** Prove psiSeries(Aμ) = A(ψμ). *Needs:* `psiSeries`.

**The power-series left inverse.** Prove psiSeries(`PowerSeries.subst` b F) = F for every F ∈ B. *Needs:* A(φμ) = subst b (Aμ), the intertwining psiSeries(Aμ) = A(ψμ), ψφ = id.

**The Amice unit projector.** Prove A(Eμ) = Aμ − `PowerSeries.subst` b (psiSeries(Aμ)). *Needs:* `unitRestriction`, φψ = P, A(φμ) = subst b (Aμ), the intertwining identity. Record also the value of ψ on a Dirac measure, ψδ_a = δ_{a/p} for a ∈ pZ and 0 otherwise, which §2.6 uses.

### 2.3 Inverting multiplication by x on the units

References: RJW Equation (4-3), p. 138; Proposition 12.5, equation (12-3), pp. 179–180. Built on Mathlib `AbstractMeasure.amiceTransformEquiv`, `Ring.inverse_non_unit` and `PadicInt.not_isUnit_iff`.

First prove that `PadicInt.inv` agrees with the unit inverse on units and is zero on nonunits (`Ring.inverse_non_unit`, `PadicInt.not_isUnit_iff`), and that it is continuous on Z, since U and pZ are complementary clopens and the inverse is continuous on U.

**Division by x on unit-supported measures.** Define J = `inverseWeight p : D →ₗ[Z] D` by J = weight ι, where ι : C(Z,Z) bundles `PadicInt.inv` using its continuity; thus (Jμ)(f) = μ(ιf). The extension is zero on nonunits, including nonzero multiples of p. Its API is `inverseWeight_eq_weight` (J is exactly weighting by the bundled `PadicInt.inv`), `inverseWeight_apply` ((Jμ)(f) = μ(ιf), the evaluation formula) and `inverseWeight_dirac`. The intermediate results are the evaluation formula, the support statement (Jμ is annihilated by ψ, that is, J lands in the unit-supported measures), and the two composition identities W(Jμ) = Eμ and J(Wμ) = Eμ. *Needs:* the continuity of the p-adic unit inverse, `weight` and its evaluation formula.

**Checks.**
- At p = 3, Jδ₀ = 0.
- At p = 3, Jδ₁ = δ₁.
- At p = 3, 2·Jδ₂ = δ₂; the multiplier is 1/2, not 2.

**Unique unit-supported division by x.** Prove that if μ ∈ D satisfies ψμ = 0, there exists a unique ν ∈ D with ψν = 0 and Wν = μ, and that its value is Jμ. Prove along the way that J commutes with dilation by a unit up to the factor a⁻¹: J(map d_a μ) = a⁻¹·map d_a (Jμ), which §2.11 uses. *Needs:* the support statement and the two composition identities of J, the kernel description Eμ = μ iff ψμ = 0 (§2.2).

**Inverse Mahler derivative on unit support.** Define H = `inverseMahler p : Z⟦T⟧ →ₗ[Z] Z⟦T⟧` by H = A ∘ J ∘ A⁻¹, using the integral Amice linear equivalence A. Then H(Aμ) = A(Jμ), and ψSeries(HF) = 0 for every F. Its API is `inverseMahler_eq_transport` (H equals the displayed composition of three linear maps), `inverseMahler_amiceTransform` (H(Aμ) = A(Jμ)) and `psiSeries_inverseMahler` (ψSeries(HF) = 0). *Needs:* `inverseWeight`.

**Checks.**
- At p = 3, H(1) = 0; the constant series is Aδ₀.
- At p = 3, H(1+T) = 1 + T.
- At p = 3, 2H((1+T)²) = (1+T)².

**Amice transform of division by x.** Prove that for every integral μ, H(Aμ) = A(Jμ). *Needs:* `inverseMahler`. Prove along the way the support statement ψSeries(HF) = 0, and the two derivative identities ∂(HF) = F − subst b (psiSeries F) (the Mahler derivative of the inverse is the unit projection of F) and H(∂G) = G for G with ψSeries G = 0.

**Unique unit-supported Mahler primitive.** Prove that if ψSeries F = 0, there exists a unique integral formal series G with ψSeries G = 0 and ∂G = F, namely G = HF. *Needs:* `inverseMahler`, the two derivative identities and the support statement.

### 2.4 Root-of-unity averaging and residue projections

References: RJW §3.5.3–5, equations (3-5), (3-6), (3-9), pp. 127–129. Built on Mathlib `PadicComplex.norm_extends'`, `PowerSeries.map_injective` and `Valued.integer`. The proposed namespace is `IwasawaAveraging`.

**The linear topology on the receiving integer ring.** Prove that the induced topology on O = `Valued.integer`(ℂ_p) is a linear ring topology: zero has a basis of open ideals.

**The integral coefficient embedding.** Let j₀ : ℤ_p → ℂ_p be the composite ℤ_p → ℚ_p → ℂ_p. Define j : ℤ_p → O by lifting this ring map to the valuation integer ring, so the underlying ℂ_p value of j(x) is j₀(x). Its API is `integralCoefficientMap_coe` (for every x ∈ ℤ_p, the image of j(x) in ℂ_p equals j₀(x)), `integralCoefficientMap_continuous` (j is continuous for the induced p-adic topologies) and `integralCoefficientMap_injective` (j is injective). The intermediate results of this subsection, proved from here on, are: the three API identities; the norm of ζ − 1 for a primitive p-th root of unity ζ (|ζ − 1| = p^{−1/(p−1)} < 1); the topological nilpotence of ζ − 1 in O for ζ^p = 1; the uniform tail estimate for the inverse Amice transform (the coefficients of the image of a bounded family are uniformly small beyond a bound); the continuity of evaluation of the inverse Amice transform; the continuity of psiSeries and of φ ∘ psiSeries for the coefficientwise topologies; the naturality A(δ_a) = (1+T)^a of the Dirac transform under coefficient maps; the compatibility of φψ with natural powers (1+T)^n; and the convergence of the root-translation series.

**Checks.**
- j(p) has absolute value p^{−1} in ℂ_p, so it is a nonunit of O; the constant map to 1 fails this test.
- j is injective.
- A square root of p lies in O but not in the image of j, since p is not a square in ℤ_p.

**Integral topological root translation.** For ζ ∈ O with ζ^p = 1 and i ∈ ℕ, define τ_i : ℤ_p⟦T⟧ → O⟦T⟧ to be the continuous topological evaluation ring homomorphism with coefficient map C ∘ j and argument C(ζ^i)(1+T) − 1. Its API is `rootTranslation_eq_eval` (for integral F, τ_i(F) = eval₂(C ∘ j, C(ζ^i)(1+T) − 1, F)), `rootTranslation_continuous` (for fixed ζ and i, τ_i is continuous in the coefficientwise p-adic topologies), `rootTranslation_polynomial` (for P ∈ ℤ_p[T], τ_i(P) = P evaluated with coefficient map C ∘ j at C(ζ^i)(1+T) − 1), `rootTranslation_one_add_X_pow`, `rootTranslation_hasSum` (for integral F, the series Σ_n C(j(coeff_n F))·(C(ζ^i)(1+T) − 1)^n has sum τ_i(F) in O⟦T⟧) and `rootTranslation_zeroth`. The intermediate results are the evaluation description, the continuity, the polynomial case, the natural powers τ_i((1+T)^n) = (ζ^i(1+T))^n, the convergent-sum description, the value for i = 0, the power sum Σ_{i<p} ζ^{ik} = p·[p ∣ k] for ζ primitive, and the root-average identity on polynomials. *Needs:* the continuity of j, the convergence of the root-translation series.

**Checks.**
- For i = 0 and every ζ, τ_0(T) = T and τ_0 is the coefficientwise map j.
- For p = 2, ζ = −1 and i = 1, τ_1(T) = −2 − T; omitting the translated constant term fails this test.
- For p = 2, ζ = −1 and i = 1, τ_1((1+T)³) = −(1+T)³.

**Integral root averaging for bounded psi.** Prove that for ζ ∈ O primitive of order p and every F ∈ ℤ_p⟦T⟧, p·map(j, φ(psiSeries F)) = Σ_{i<p} τ_i(F) in O⟦T⟧. *Needs:* the root-average identity on polynomials, the continuity of φ ∘ psiSeries, of τ_i and of j.

**Unique integral descent of the root average.** Prove that for each integral F and primitive ζ ∈ O there is a unique G ∈ ℤ_p⟦T⟧ satisfying p·map(j, φ(G)) = Σ_{i<p} τ_i(F), namely G = psiSeries F. *Needs:* the integral root average, the injectivity of j, `psiSeries_phi`.

Prove next that a translated polynomial Q(ζ^iY − 1) with Q(0) a unit is nonzero in ℂ_p⟦T⟧ (its constant term is a unit).

**Root translation of an integral rational series.** Let P, Q ∈ ℤ_p[T], Q(0) a unit, and F ∈ ℤ_p⟦T⟧ with QF = P. Prove that after mapping τ_i(F) to Frac(ℂ_p⟦T⟧), its value is P(ζ^iY − 1)/Q(ζ^iY − 1). *Needs:* the polynomial case of τ_i, the nonvanishing of the translated denominator, `integralCoefficientMap_coe`.

**Rational-series averaging for the bounded operator.** Prove that for ζ ∈ ℂ_p primitive of order p, P, Q ∈ ℤ_p[T] with Q(0) a unit, and integral F satisfying QF = P, one has p·J(φ(psiSeries F)) = Σ_{i<p} P(ζ^iY − 1)/Q(ζ^iY − 1) in Frac(ℂ_p⟦T⟧); here J is the canonical coefficient/series inclusion and Y = 1 + T. *Needs:* the integral root average, the rational root translation, `integralCoefficientMap_coe`. Prove along the way that the denominators ζ^i y − 1 are nonzero when y^p ≠ 1.

**The finite-root partial-fraction identity.** Prove that for a characteristic-zero field K, ζ primitive of order p and y^p ≠ 1, Σ_{i<p} 1/(ζ^i y − 1) = p/(y^p − 1) (RJW Lemma 4.7, p. 137). *Needs:* the nonvanishing of the denominators, the primitive-root power sum.

Prove next the descent form of the nonvanishing: for a field K of characteristic zero with a ring map j_K : ℤ_p → K and an embedding e : K → ℂ_p compatible with j₀, a translated polynomial Q(ζ^iY − 1) with Q(0) a unit is nonzero in K⟦T⟧.

**Rational averaging over the cyclotomic coefficient field.** For K, j_K, e as just stated, ζ ∈ K primitive of order p, P, Q ∈ ℤ_p[T] with Q(0) a unit, and integral F with QF = P, prove the same identity p·J_K(φ(psiSeries F)) = Σ_{i<p} P(ζ^iY − 1)/Q(ζ^iY − 1) in Frac(K⟦T⟧), with its canonical maps J_K and Y = 1 + T. *Needs:* the rational root average over ℂ_p, the descent form of the nonvanishing.

### 2.5 Bounded Mahler coefficients and the Amice norm

References: RJW Theorem 3.25 and its proof, pp. 124–125. Built on Mathlib `AbstractMeasure.injective_amiceTransform`, `PadicInt.mahlerEquiv` and `AbstractMeasure.coeff_amiceTransform`.

First prove that for a bounded coefficient sequence c and a continuous test f the series Σ_n a_n(f)c_n is summable, because the Mahler coefficients a_n(f) tend to zero (`PadicInt.hasSum_mahler`).

**The bounded Mahler pairing.** For c in BoundedContinuousFunction(ℕ,R), define the R-linear map I_c : C(ℤ_p,R) → R by I_c(f) = Σ_n a_n(f)c_n. The space of test functions and the coefficient sequence are library objects. Its API is `boundedMahlerPairing_apply` (I_c(f) = Σ_n a_n(f)c_n), `boundedMahlerPairing_add`, `boundedMahlerPairing_smul` (I_c(rf) = r I_c(f) for r in R), `boundedMahlerPairing_bound` (|I_c(f)| ≤ ‖c‖‖f‖) and `boundedMahlerPairing_integral` (for R = ℤ_p and c_n = coeff_n(F), I_c(f) equals invTransform(F)(f)). *Needs:* the summability. The bound |I_c(f)| ≤ ‖c‖‖f‖ is the intermediate result the inverse transform below rests on.

**Checks.**
- Over ℚ_3, the constant sequence c_n = 1/3 gives I_c(1) = 1/3.
- Over ℤ_3, the sequence c with c_1 = 1 and c_n = 0 otherwise gives I_c(f) = a_1(f) = f(1) − f(0), so I_c(x ↦ x) = 1 and I_c(1) = 0.
- For an integral formal series F and its bounded coefficient sequence, I_c(f) = AbstractMeasure.invTransform(F)(f).

**The bounded-coefficient inverse Amice transform.** Define `boundedInvTransform` as the R-linear map from BoundedContinuousFunction(ℕ,R) to the measure type D(ℤ_p,R), sending c to the continuous functional f ↦ I_c(f). Its value is a measure, not a new carrier of formal power series. Its API is `boundedInvTransform_apply` (boundedInvTransform(c)(f) = I_c(f)), `boundedInvTransform_mahler`, `amiceTransform_boundedInvTransform` (its Amice transform equals `PowerSeries.mk`(c)), `boundedInvTransform_unique` (a measure with that Amice transform is boundedInvTransform(c)), `boundedInvTransform_zero` and `boundedInvTransform_add` (the inverse preserves addition of bounded coefficient sequences). The intermediate results are the value on Mahler functions, the Amice identity, the uniqueness, and the bound on the image of an integral coefficient sequence (its coefficients are bounded by |1_R|). *Needs:* `boundedMahlerPairing`, its bound, the summability.

**Checks.**
- Over ℚ_3 the constant bounded sequence 1/3 gives value 1/3 on the constant function 1; nonintegral bounded coefficients are allowed.
- The sequence c with c_1 = 1 and c_n = 0 otherwise gives the measure δ_1 − δ_0, whose Amice transform is T.
- For R = ℤ_p, coefficients of an integral formal series give exactly the invTransform, by the Amice injectivity.

**The bounded image coefficient sequence.** For an integral measure μ, define `integralAmiceCoefficients`(μ) as the bounded sequence n ↦ algebraMap(coeff_n(A_μ)) in R, with the uniform bound |1_R|. Its API is `integralAmiceCoefficients_apply` (the n-th value is algebraMap(coeff_n(A_μ))), `integralAmiceCoefficients_norm` (the supremum norm is at most |1_R|), `integralAmiceCoefficients_zero`, `integralAmiceCoefficients_add` (the coefficient sequence is additive in μ), `integralAmiceCoefficients_smul` (multiplication of μ by a in ℤ_p multiplies the sequence by algebraMap(a)) and `integralAmiceCoefficients_self` (for R = ℤ_p this is the original Amice coefficient sequence). *Needs:* the bound on the image of an integral coefficient sequence.

**Checks.**
- For δ_0 the zeroth coefficient is 1 and the first coefficient is 0, including over ℚ_3.
- For δ_{−1} the n-th image coefficient is (−1)^n, so the sequence is bounded but not eventually zero.
- For R = ℤ_p, the n-th coefficient is exactly coeff_n(A_μ), using the standard identity algebra structure.

**Extension of integral measures on ℤ_p.** Define `extendIntegralCoefficients`(μ) in D(ℤ_p,R) as boundedInvTransform(integralAmiceCoefficients(μ)). Its Amice transform is the coefficient image of A_μ, and its value on the R-valued image of an integral test f is algebraMap(μ(f)); this extends coefficients of the measure on ℤ_p. Its API is `extendIntegralCoefficients_apply` (evaluation on f is Σ_n a_n(f) algebraMap(coeff_n(A_μ))), `amiceTransform_extendIntegralCoefficients` (the Amice transform is `PowerSeries.map`(algebraMap)(A_μ)), `extendIntegralCoefficients_test` (on algebraMap composed with an integral test f the value is algebraMap(μ(f))), `extendIntegralCoefficients_unique` (agreement on all these integral test functions uniquely characterizes the extended measure), `extendIntegralCoefficients_zero` and `extendIntegralCoefficients_add` (extension is additive). The intermediate results are the Amice identity, the value on integral test functions, the uniqueness, the value on Dirac measures (the extension of δ_a is δ_a), compatibility with pushforward along continuous maps, compatibility with weighting by an integral test, and the bound on the Amice coefficients of a field-valued measure (|coeff_n(A_ν)| ≤ ‖ν‖). *Needs:* `boundedInvTransform`, the bound of the pairing, `integralAmiceCoefficients`.

**Checks.**
- Over ℚ_3, the extension of the integral δ_2 applied to x ↦ x² is 4.
- Over ℚ_3, the extension of the integral δ_1 − δ_0 has Amice transform T and evaluates x ↦ x to 1.
- Over ℤ_p this extension equals the original measure, with no alternate carrier.

**Bounded Amice coefficient sequence.** Define `boundedAmiceCoefficients : D(ℤ_p,K) →ₗ[K] BoundedContinuousFunction(ℕ,K)` by μ ↦ (n ↦ coeff_n(A_μ)); the sequence has its supremum norm (RJW Definitions 3.5, 3.8, 3.23; Theorem 3.21 and proof of Theorem 3.25; Remark 3.28(1),(3), p. 119, 123–126). Its API is `boundedAmiceCoefficients_apply`, `boundedAmiceCoefficients_zero`, `boundedAmiceCoefficients_add` (the bounded coefficient sequence of μ + ν is the sum of their bounded coefficient sequences), `boundedAmiceCoefficients_smul` (the bounded coefficient sequence of aμ is a times the bounded coefficient sequence of μ, for a ∈ K) and `boundedAmiceCoefficients_norm_le` (the supremum norm of boundedAmiceCoefficients(μ) is at most the continuous-dual operator norm of μ). *Needs:* the coefficient bound of a field-valued measure. Prove along the way that boundedInvTransform does not increase the norm (‖boundedInvTransform(c)‖ ≤ ‖c‖) and that it is a retraction of the coefficient map: boundedAmiceCoefficients(boundedInvTransform(c)) = c.

**Checks.**
- For δ₀ over ℚ_3, bounded coefficient zero is one and coefficient one is zero.
- For (1/3)δ₀ over ℚ_3, bounded coefficient zero is 1/3; bounded measures need not be integral.
- For δ₋₁ over ℚ_2, bounded coefficient n is (−1)^n, so the sequence has supremum norm 1 and is not eventually zero.

**Bounded Amice isometry.** Construct the canonical K-linear isometric equivalence `boundedAmiceEquiv : (C(ℤ_p,K) →L[K] K) ≃ₗᵢ[K] BoundedContinuousFunction(ℕ,K)`: forward, transport the dual through the inverse of `toCLMEquiv` and take its Amice coefficients; inverse, take `toCLMEquiv` of boundedInvTransform (RJW Definitions 3.5, 3.8, 3.23; Theorem 3.21 and proof of Theorem 3.25; Remark 3.28(1),(3), p. 119, 123–126). Its API is `boundedAmiceEquiv_apply` (boundedAmiceEquiv(toCLMEquiv(μ)) = boundedAmiceCoefficients(μ)), `boundedAmiceEquiv_symm_apply` (the inverse sends c to toCLMEquiv(boundedInvTransform(c))) and `boundedAmiceCoefficients_norm` (for every μ, ‖boundedAmiceCoefficients(μ)‖ = ‖toCLMEquiv(μ)‖). *Needs:* `boundedAmiceCoefficients`, the retraction identity, the Amice identity of boundedInvTransform and its norm bound.

**The bounded-series range of Amice.** Prove that for F ∈ K⟦T⟧ there exists a measure μ with A_μ = F if and only if there is C ≥ 0 such that ‖coeff_n(F)‖ ≤ C for every n (RJW Definitions 3.5, 3.8, 3.23; Theorem 3.21 and proof of Theorem 3.25; Remark 3.28(1),(3), p. 119, 123–126). *Needs:* the coefficient bound of a field-valued measure, the Amice identity of boundedInvTransform.

Prove next that the rational extension E = extendIntegralCoefficients : D(ℤ_p,ℤ_p) → D(ℤ_p,ℚ_p) is injective and that ‖toCLMEquiv(E μ)‖ ≤ 1.

**Integral measures are the rational dual unit ball.** Prove that for ν ∈ D(ℤ_p,ℚ_p) there is a unique μ ∈ D(ℤ_p,ℤ_p) with extendIntegralCoefficients(μ) = ν if and only if ‖toCLMEquiv(ν)‖ ≤ 1 (RJW Definitions 3.5, 3.8, 3.23; Theorem 3.21 and proof of Theorem 3.25; Remark 3.28(1),(3), p. 119, 123–126). *Needs:* the norm bound and the injectivity of the rational extension, `integralAmiceCoefficients`, the coefficient bound of a field-valued measure, the Amice identity of the extension. Prove along the way that this image, the unit ball, is weakly closed.

**Rational measures admit an integral power scaling.** Prove that for every ν ∈ D(ℤ_p,ℚ_p) there are n ≥ 0 and μ ∈ D(ℤ_p,ℤ_p) such that ν = p^{−n}·extendIntegralCoefficients(μ) (RJW Definitions 3.5, 3.8, 3.23; Theorem 3.21 and proof of Theorem 3.25; Remark 3.28(1),(3), p. 119, 123–126). *Needs:* the unit-ball description.

### 2.6 Measures on the units inside measures on ℤ_p

References: RJW §3.5.3–5, Remark 3.31, Corollary 3.32 and Remark 3.33, pp. 127–129. Built on Mathlib `AbstractMeasure.dirac_apply`, `AbstractMeasure.map_apply` and `PadicInt.not_isUnit_iff`. The proposed namespaces are `AbstractMeasure` and `PadicInt`.

First prove that the unit locus V = {x ∈ ℤ_p : IsUnit x} is clopen (it is the complement of pℤ_p, §2.2).

**Existing p-adic units and the unit locus.** Define `PadicInt.unitsHomeomorphIsUnit p : (ℤ_p)ˣ ≃ₜ V`, sending u to its underlying element with its unit proof; its inverse sends (x,hx) to hx.unit. Its API is `unitsHomeomorphIsUnit_apply` (the underlying value of h(u) is u), `unitsHomeomorphIsUnit_symm_apply` (for x ∈ V, the value of h⁻¹(x) as a p-adic integer is x) and the inherited `Homeomorph.apply_symm_apply`: the two inverse identities come from the inherited homeomorphism, and equality can be checked on underlying p-adic values. The evaluation of a test function through h is the intermediate result the next definition uses.

**Checks.**
- At p = 3, the value of h(2) is 2, whose residue modulo 9 is 2 rather than 5, the residue of 2⁻¹.
- At p = 2, the value of h(−1) is −1.
- At p = 2, h⁻¹ of the unit-subtype point 1 is the unit 1.

**Restriction to the p-adic unit group.** Define `AbstractMeasure.restrictUnits p R : D(ℤ_p,R) →ₗ[R] D((ℤ_p)ˣ,R)` as arrowCongrLeft(h⁻¹) ∘ r_V, where h = unitsHomeomorphIsUnit p; write j_U for pushforward along `Units.val`. Its API is `restrictUnits_eq_transport` (r_U μ = arrowCongrLeft(h⁻¹)(r_V μ)), `restrictUnits_apply` (r_U μ(f) = μ(z_V(f ∘ h⁻¹)), the evaluation formula), `restrictUnits_map_val` (r_U(j_U ν) = ν, the section identity), `map_val_restrictUnits` (j_U(r_U μ) = unitRestriction p R μ), `restrictUnits_dirac` and `restrictUnits_dirac_nonunit`. *Needs:* the clopen unit locus, `unitsHomeomorphIsUnit` and its evaluation, `restrictClopen` with its evaluation formula (§0.1), and the inside and outside evaluation of `zeroExtendClopen` (§0.1).

**Checks.**
- Over ℤ₃, restricting δ₁ + 2δ₃ gives δ₁ on ℤ₃ˣ.
- Over ℤ₃, restricting δ₀ gives zero.
- Over ℤ₃, restricting δ₃ gives zero although 3 is nonzero.

**Intrinsic unit restriction gives the ambient unit projector.** Prove that for every μ ∈ D(Z,R), j_U(r_U μ) = unitRestriction p R μ. *Needs:* the evaluation formula of r_U, the evaluation through h, the clopen unit locus, the projector identity of `zeroExtendClopen` (§0.1), the evaluation formula of `unitRestriction` (§2.2).

**Unit-group measures as the kernel of psi.** Define `AbstractMeasure.unitsMeasureEquivKerPsi p R : D(U,R) ≃ₗ[R] ker(psiMeasure p R)`, with forward value j_U ν and inverse r_U on the ambient value of a kernel element. Its API is `unitsMeasureEquivKerPsi_apply` (the underlying ambient measure is j_U ν), `unitsMeasureEquivKerPsi_symm_apply` (the inverse is restrictUnits applied to the ambient value), the inherited `LinearEquiv.injective` (unit-group measures are equal if their ambient pushforwards are equal) and the inherited `LinearEquiv.apply_symm_apply` (both round trips are the identities by the inherited linear equivalence). The intermediate results are the evaluation of a kernel element through j_U and the inverse formula through r_U. *Needs:* the section identity r_U j_U = id, the projector identity j_U r_U = E, and Eμ = μ iff ψμ = 0 (§2.2).

**Checks.**
- At p = 3, ambient δ₁ − δ₂ lies in ker ψ, as ψδ₁ = ψδ₂ = 0, and the inverse sends it to intrinsic δ₁ − δ₂, while ambient δ₃ is not a kernel element since ψδ₃ = δ₁.
- At p = 3, the underlying measure of the image of intrinsic δ₁ is ambient δ₁.
- At p = 2, intrinsic δ_{−1} maps to ambient δ_{−1}.

**Integral unit measures as the kernel of series psi.** For the coefficient ring exactly ℤ_p, with A the integral Amice linear equivalence and ψSeries its transported bounded operator of §2.2, define `AbstractMeasure.unitsMeasureAmiceEquiv p : D((ℤ_p)ˣ,ℤ_p) ≃ₗ[ℤ_p] ker(psiSeries p)` by ν ↦ A(j_U ν); its inverse sends F ∈ ker(psiSeries p) to r_U(A⁻¹F). Its API is `unitsMeasureAmiceEquiv_apply` (the underlying series is A(j_U ν), with no additional scalar or derivative), `unitsMeasureAmiceEquiv_symm_apply` (the inverse is r_U(A⁻¹F) for a series in the kernel), the inherited `LinearEquiv.injective` (two integral unit-group measures agree if their included Amice transforms agree) and the inherited `LinearEquiv.apply_symm_apply` (the kernel hypothesis makes the two inverse identities hold, by the inherited linear equivalence). *Needs:* `unitsMeasureEquivKerPsi` with its evaluation and inverse formulas, the intertwining psiSeries(Aμ) = A(ψμ) (§2.2), the naturality A(δ_a) = (1+T)^a (§2.4).

**Checks.**
- At p = 3, the series for intrinsic δ₂ is (1+T)², while (1+T)³ = Aδ₃ is not in ker(psiSeries) since psiSeries((1+T)³) = 1 + T.
- At p = 3, the series for intrinsic δ₁ is 1 + T.
- At p = 2, the first coefficient for intrinsic δ_{−1} is −1.

### 2.7 Weak and strong topologies on unit measures

References: RJW Definition 3.5 and Definitions 3.7–3.8, p. 119; Remark 3.31, p. 127; Corollary 3.32 and Remark 3.33, p. 129. Built on Mathlib `LinearEquiv.isHomeomorph_iff`, `AbstractMeasure.WeakTopology` and `AbstractMeasure.StrongTopology`.

First prove that the intrinsic unit restriction r_U is continuous for the weak topologies.

**Weak topology on the unit-measure kernel.** Prove that `unitsMeasureEquivKerPsi p R` is a homeomorphism from D(U,R) with its weak topology to the kernel of psiMeasure with the induced ambient weak topology. *Needs:* `unitsMeasureEquivKerPsi` with its evaluation and inverse formulas, the weak continuity of r_U, the weak continuity of pushforward (§0.2).

**Weak topology and integral Amice coefficients.** For p any prime, including 2, and coefficients exactly ℤ_p, the measure topology being `WeakTopology` and the series topology `PowerSeries.WithPiTopology`, prove that the integral `amiceTransformEquiv` is a homeomorphism from D(ℤ_p,ℤ_p) with its weak topology to ℤ_p⟦T⟧ with the coefficientwise p-adic topology; the integral Amice equivalence and the continuity of its inverse established in §2.4 are used. *Needs:* the continuity of evaluation of the inverse Amice transform (§2.4).

**Weak topology on the unit Amice kernel.** For R = ℤ_p and the series kernel with the coefficientwise p-adic topology, prove that `unitsMeasureAmiceEquiv p` is a homeomorphism from D(U,ℤ_p) with its weak topology to the kernel of psiSeries with its induced coefficientwise topology. *Needs:* `unitsMeasureAmiceEquiv`, the weak homeomorphism of the unit-measure kernel, the weak homeomorphism of the integral Amice transform, the intertwining identity (§2.2).

Prove next the operator norm of the unit inclusion: j_U does not change the operator norm of a field-valued measure.

**Strong topology on the unit-measure kernel.** For p any prime, U = ℤ_pˣ, K a nontrivially normed field, the topologies on both ambient measure carriers `StrongTopology` and the kernel carrying the induced subtype topology, prove that `unitsMeasureEquivKerPsi p K` is a homeomorphism from strongly topologized D(U,K) to the psiMeasure kernel with its induced ambient strong topology. *Needs:* `unitsMeasureEquivKerPsi` with its evaluation and inverse formulas, `restrictUnits`, the operator norm of the unit inclusion, the operator-norm bounds of clopen restriction and of pushforward (§0.2).

Then prove that the ℚ_p-valued sequence δ_{p^n} converges weakly to δ_0, and that ‖toCLMEquiv(δ_{p^n} − δ_0)‖ = 1 for every n (`norm_dirac_prime_powers_sub_zero`).

**Weak and strong convergence differ.** With `StrongTopology` exactly the field-valued continuous-dual norm topology, not the integral coefficientwise topology, prove that the ℚ_p-valued sequence δ_{p^n} does not converge to δ_0 in the operator-norm topology, although it converges there weakly (RJW Definitions 3.5 and 3.8, p. 119; Example 3.10, p. 120; Remark 3.28(3), pp. 125–126). *Needs:* the norm distance ‖δ_{p^n} − δ_0‖ = 1 and the weak limit.

Prove next that the integral coefficient extension `extendIntegralCoefficients` : D(ℤ_p,ℤ_p) → D(ℤ_p,ℚ_p) is continuous for the weak topologies.

**Weak compactness of integral measures.** With the topology the weak topology of integral test evaluations and no norm installed on this integral dual, prove that D(ℤ_p,ℤ_p), equipped with `WeakTopology`, is compact (RJW Definitions 3.5 and 3.8, p. 119; Theorem 3.25 including proof, pp. 124–125; Remark 3.28(1),(3), pp. 125–126). *Needs:* the weak homeomorphism of the integral Amice transform.

**Weak topology on the integral unit ball.** Using the canonical ℤ_p-algebra structure on ℚ_p and the bounded scalar action, with the unit ball meaning ‖toCLMEquiv(ν)‖ ≤ 1 and its topology the weak subspace topology, prove `isClosedEmbedding_extendIntegralCoefficients_weak`: the coefficient extension E : D(ℤ_p,ℤ_p) → D(ℤ_p,ℚ_p) is a closed embedding for the weak topologies; thus the integral weak topology agrees with the weak subspace topology on the rational unit ball identified in §2.5 (RJW Definitions 3.5 and 3.8, p. 119; Theorem 3.25 including proof, pp. 124–125; Remark 3.28(1),(3), pp. 125–126). *Needs:* the weak compactness of integral measures, the weak continuity of the extension, the injectivity of the rational extension and the unit-ball description (§2.5).

### 2.8 Integral coefficient extension on the unit domain

References: RJW Definition 3.5 and Definitions 3.7–3.8, p. 119; §3.5.2–5, Remark 3.31, Corollary 3.32 and Remark 3.33, pp. 126–129. Built on Mathlib `AbstractMeasure.map_apply`, `LocallyConstant.charFn` and `LocallyConstant.coe_charFn`.

First prove that the integral extension I_R commutes with the unit projector: I_R(E_Z μ) = E_R(I_R μ).

**Integral coefficient extension on the unit domain.** For μ ∈ D(U,Z), define I_{U,R}(μ) = r_R(I_R(j_Z μ)) ∈ D(U,R), on the unit-domain measure carrier (`extendIntegralUnitCoefficients`). Its API is `extendIntegralUnitCoefficients_eq` (I_{U,R}(μ) = r_R(I_R(j_Z μ))), `extendIntegralUnitCoefficients_zero`, `extendIntegralUnitCoefficients_add` (I_{U,R}(μ+ν) = I_{U,R}(μ) + I_{U,R}(ν)), `extendIntegralUnitCoefficients_smul` (I_{U,R}(aμ) = algebraMap(a) I_{U,R}(μ) for a ∈ Z), `extendIntegralUnitCoefficients_self` (I_{U,Z} is the identity on D(U,Z)) and `extendIntegralUnitCoefficients_dirac`. The intermediate results are the compatibility with the inclusion (j_R(I_{U,R} μ) = I_R(j_Z μ)), the value on the R-valued image of an integral unit test, the uniqueness through those values, the compatibility with restriction (I_{U,R}(r_Z μ) = r_R(I_R μ)), and, for R = ℚ_p, the injectivity of I_{U,ℚ_p} and the bound ‖I_{U,ℚ_p} μ‖ ≤ 1. *Needs:* `extendIntegralCoefficients` with its value on Dirac measures (§2.5), `restrictUnits` and its section identity (§2.6).

**Checks.**
- Over ℚ_3, the extension of the integral unit measure δ₁ − δ₂ evaluates u ↦ u to −1 and the constant 1 to 0.
- The integral Dirac mass at the unit one extends to the rational Dirac mass at one.
- Extending an integral unit measure to Z coefficients gives that same measure.

**Integral unit measures form the rational unit ball.** Prove that for ν ∈ D(U,ℚ_p) there is a unique μ ∈ D(U,Z) with I_{U,ℚ_p} μ = ν if and only if the operator norm of ν is at most one. *Needs:* the injectivity and the norm bound of I_{U,ℚ_p}, the unit-ball description on ℤ_p (§2.5), the operator norm of the unit inclusion (§2.7), the compatibility of the extension with restriction, the section identity of r_U, `integralAmiceCoefficients` (§2.5). Prove along the way that this unit ball is weakly closed.

**A common denominator on the unit domain.** Prove that every ν ∈ D(U,ℚ_p) has the form p^{−n} I_{U,ℚ_p} μ for some n ≥ 0 and μ ∈ D(U,Z), the same n working for all continuous tests. *Needs:* the integral power scaling on ℤ_p (§2.5), the compatibility of the extension with restriction, the section identity of r_U. Prove along the way the bound ‖r_U ν‖ ≤ ‖ν‖ for the restriction of a rational measure to the units.

### 2.9 Cartier operators on power series

References: Rowland–Stipulanti–Yassawi, Section 3, definition of the Cartier operators and Proposition 4, PDF p. 5 (v2); RJW Lemma 12.13 and proof, pp. 182–183. Built on Mathlib `PowerSeries.mk`, `PowerSeries.coeff_mk` and `PowerSeries.ext`. The proposed namespace is `PowerSeries`.

**Cartier operators on power series.** For a commutative ring k, a modulus q ≥ 1 and a residue r ∈ ℕ, define the Cartier operator Λ_r on k⟦T⟧ as the k-linear map `cartier` with coeff_n(Λ_r F) = coeff_{qn+r}(F) for every n ≥ 0. The definition accepts every r ∈ ℕ, but the identities below hold only for an actual residue, 0 ≤ r < q: for such r, Λ_r is the power-series restriction of the Cartier operator on Laurent series over a field, and for every k one has Λ_r(F(T^q)·G) = F·Λ_r(G) and F = Σ_{r<q} T^r·(Λ_r F)(T^q); when k is a finite field with q elements these read Λ_r(F^q·G) = F·Λ_r(G) and F = Σ_{r<q} T^r·(Λ_r F)^q. For r ≥ q the first identity is false: with q = 1, r = 1, F = T and G = 1 over ℤ, Λ_1(T·1) is the constant 1 while T·Λ_1(1) = 0; with k = 𝔽_3, q = 3, r = 3, F = T and G = 1, Λ_3(T³) = 1 while T·Λ_3(1) = 0 (the operator Λ_q is Λ_0 followed by dropping the constant term and dividing by T, which is not F-semilinear). The hypotheses are: k a commutative ring, q ≥ 1 the modulus, the identities assume r < q, the Frobenius relations need k a finite field with q elements; the residue operator of §2.10 uses k = ZMod p and q = p with 0 ≤ r < p. Its API is `cartier` (for a commutative ring k and q, r ∈ ℕ, the k-linear map Λ_r : k⟦T⟧ → k⟦T⟧ with n-th coefficient coeff_{qn+r}), `coeff_cartier`, `cartier_monomial`, `cartier_one_zero` (with modulus 1, Λ_0 is the identity), `cartier_expand_mul` (for q ≠ 0, r < q and every commutative ring k, Λ_r(F(T^q)·G) = F·Λ_r(G), with F(T^q) the expand map), `sum_X_pow_mul_expand_cartier` (for q ≠ 0, F = Σ_{r<q} T^r·(Λ_r F)(T^q): the residue-class decomposition of a series), `cartier_pow_card_mul` (over a finite field K with q elements and r < q, Λ_r(F^q·G) = F·Λ_r(G)) and `eq_sum_X_pow_mul_cartier_pow` (F = Σ_{r<q} T^r·(Λ_r F)^q over K).

**Checks.**
- Over 𝔽_3 with q = 3: Λ_1(T⁷) = T² and Λ_0(T⁷) = 0.
- With modulus q = 1, Λ_0 is the identity on ℤ⟦T⟧.
- Over 𝔽_3 with q = 3, Λ_0(F³) = F for every F.
- Negative control for the residue range: over ℤ with q = 1 and r = 1 (so F(T^q) = F = T), Λ_1(T·1) = 1 ≠ 0 = T·Λ_1(1), so `cartier_expand_mul` without r < q would assert 1 = 0.
- Over 𝔽_3 with q = 3 and r = 3, Λ_3(T³·1) = 1 ≠ 0 = T·Λ_3(1), the same negative control for `cartier_pow_card_mul`.

### 2.10 Residue averaging modulo p

References: RJW §3.5.3–5, pp. 127–129; Lemma 12.13 and proof, pp. 182–183. Built on Mathlib `PowerSeries.ext`, `PowerSeries.WithPiTopology.continuous_coeff` and `PowerSeries.WithPiTopology.tendsto_iff_coeff_tendsto`. The proposed namespace is `IwasawaResidue`.

First prove that the coefficient reduction ρ : B → B_0 is continuous for the coefficientwise topologies, and compute psiSeries on the natural powers (1+T)^n: it is (1+T)^{n/p} when p ∣ n and 0 otherwise.

**Residue averaging operator.** Define the k-linear operator psi_0 : B_0 → B_0 (`residuePsi`) to be the finite weighted sum of the Cartier power-series restrictions, psi_0(F) = Σ_{0≤i<p} (−1)^i Λ_i(F); equivalently its n-th coefficient is Σ_{0≤i<p} (−1)^i coeff_{pn+i}(F) (RJW §3.5.3–5, pp. 127–129; Lemma 12.13 and proof, pp. 182–183; Rowland–Stipulanti–Yassawi, Section 3, definition of the Cartier operators and Proposition 4, PDF p. 5). Its API is `coeff_residuePsi` (coeff_n(psi_0 F) = Σ_{0≤i<p} (−1)^i coeff_{pn+i}(F)), `residuePsi_zero`, `residuePsi_add` (psi_0(F+G) = psi_0(F) + psi_0(G)), `residuePsi_smul` (psi_0(aF) = a psi_0(F) for a in 𝔽_p), `residuePsi_monomial` and `residuePsi_one`. The intermediate results are the coefficient formula, the value on monomials, the continuity of psi_0, its semilinearity psi_0(F(T^p)·G) = F·psi_0(G) over 𝔽_p, its values on the small translated powers (1+T)^i for i < p and on all natural powers (1+T)^n. *Needs:* `cartier` (§2.9).

**Checks.**
- At p = 3, psi_0(T³) = T and psi_0(T²) = 1.
- At p = 3, psi_0(T) = −1, distinguishing the weighted operator from Λ_0.
- At p = 2, psi_0(T) = 1; no odd-prime assumption is made.

**Reduction of integral averaging on polynomials.** Prove that for every P in ℤ_p[T], ρ(psi(P)) = psi_0(ρ(P)), where P is coerced to the integral power-series ring. *Needs:* the values of psiSeries and of psi_0 on natural powers, `psiSeries` (§2.2), `residuePsi`.

**Reduction of the integral averaging operator.** Prove that for every integral power series F, ρ(psi(F)) = psi_0(ρ(F)). *Needs:* the polynomial comparison, the continuity of psiSeries (§2.4), of ρ and of psi_0. Prove along the way the residue facts the comparison and §2.11 rest on: psi_0 is a left inverse of F ↦ F(T^p) = F^p over 𝔽_p; the pole basis T^{−i}, i < p, of the residue decomposition; the pole terms cancel in the weighted sum; the shifted expansion fixed points are zero (a series with F(T^p)·T^i = F for 0 < i < p is zero); and the fixed-point error of psi_0 vanishes.

### 2.11 Dilation pushforward and binomial substitution

References: RJW Section 3.5.5, p. 128; Proposition 12.5, pp. 179–180. Built on Mathlib `AbstractMeasure.amiceTransformEquiv`, `PowerSeries.binomialSeries_constantCoeff` and `PowerSeries.coeff_subst'`.

First prove the naturality of the Mahler basis under dilation (mahler_n ∘ d_a is the composite of the Mahler expansion of x ↦ binom(ax, n)) and the dilation identity for Mahler functions.

**Amice transform of dilation pushforward.** Prove that for every a in Z and integral measure μ in D(Z,Z), A(map(d_a, μ)) = S_a(A(μ)); the side condition that the substitution S_a is defined, b_a = binomialSeries(a) − 1 having zero constant coefficient, is Tau Ceti's `TauCeti.hasSubst_binomialSeries_sub_one`. *Needs:* the Mahler dilation identity, `TauCeti.hasSubst_binomialSeries_sub_one`. Prove along the way that unit restriction commutes with dilation by a unit, and that dilation by a unit preserves the kernel of ψ.

**Inverse Mahler covariance under binomial substitution.** Prove that for a unit a in Z and every F in B, inverseMahler(S_a(F)) = a⁻¹·S_a(inverseMahler(F)). *Needs:* the Amice dilation identity, the dilation covariance of J (§2.3), H(Aμ) = A(Jμ) (§2.3). Prove along the way that the coefficients of S_a(F) depend continuously on a.

### 2.12 Restriction to residue classes

References: RJW Section 3.5.3, Remark 3.31 and equation (3-5), p. 127; Section 3.5.4–5, pp. 127–128. Built on Mathlib `LocallyConstant.coe_charFn`, `IsClopen.preimage` and `PadicInt.ker_toZModPow`.

First prove that the residue fibre C_{(n,a)} = ρ_n⁻¹{a} is clopen and is the coset a + p^nℤ_p.

**Restriction to a residue class.** Define P_{(n,a)} : D(Z,R) →ₗ[R] D(Z,R) to be weight(χ_{(n,a)}) (`restrictResidue`). Its API is `restrictResidue_apply` (for f ∈ C(Z,R), (P_{(n,a)} μ)(f) = μ(χ_{(n,a)} f)), `restrictResidue_dirac`, `restrictResidue_comp` (P_{(n,a)}(P_{(n,b)} μ) = P_{(n,a)} μ when a = b, and zero when a ≠ b), `sum_restrictResidue` (for every n, the sum of P_{(n,a)} μ over all a ∈ ZMod(p^n) equals μ), `restrictResidue_zero_depth` and `restrictResidue_refinement` (for m ≤ n and a ∈ ZMod(p^m), P_{(m,a)} μ is the sum of P_{(n,b)} μ over exactly those b with t_{(m,n)}(b) = a, where t_{(m,n)} is `ZMod.castHom`). The intermediate results are the evaluation formula, the value on Dirac measures, the composition rule, the partition identity, the depth-zero case, the refinement rule, the mass of a residue restriction (P_{(n,a)} μ(1) = μ(χ_{(n,a)}) = π_n(μ)(a)), the finite coordinate reading (the residue restrictions at depth n are the finite projection of §1.1 along ρ_n), and the behaviour under translation by a (P_{(n,a)} is the translate of P_{(n,0)} along x ↦ x + a). *Needs:* the clopen residue fibres, `weight` (§2.1).

**Checks.**
- At p = 2 and R = ℤ, depth 0 restriction is the identity on every measure.
- At p = 2 and R = ℤ, the class 1 modulo 4 keeps δ_5.
- The same class kills δ_3; it does not keep every odd atom.

**Intrinsic and ambient residue restriction.** Prove that for the clopen s = C_{(n,a)}, P_{(n,a)} μ equals the inclusion pushforward of restrictClopen s R μ. *Needs:* the evaluation formula of P_{(n,a)}, the projector evaluation of §0.1. Prove along the way that P_{(n,a)} is weakly continuous and that at p the restriction to the class 0 modulo p is P of §2.2.

**Amice coefficients after residue restriction.** For this Amice comparison only, let R have an algebra structure over Z with continuous scalar action, as in the Amice transform; prove that coeff_k(A(P_{(n,a)} μ)) = μ(χ_{(n,a)}·M_{(R,k)}), where M_{(R,k)} is the R-valued Mahler test (mahler k) acting on the constant-one function. *Needs:* the evaluation formula of P_{(n,a)}.

### Examples

- Over ℤ₃, weight x δ₀ = 0 while weight x δ₂ = 2δ₂, and ∂T = 1 + T over ℤ: the Mahler derivation, not the plain derivative, is the Amice image of multiplication by x.
- At p = 3, psiSeries((1+T)³) = 1 + T and psiSeries(1+T) = 0, since (1+T)³ = Aδ₃, ψδ₃ = δ₁ and ψδ₁ = 0; the unit projector sends (1+T)³ to 0 and 1 + T to itself.
- At p = 3, H(1+T) = 1 + T and 2H((1+T)²) = (1+T)²: division by x on unit-supported measures multiplies δ_a by a⁻¹.
- For p = 2, ζ = −1 and i = 1, τ_1(T) = −2 − T, so that p·φ(psiSeries F) = τ_0(F) + τ_1(F) can be checked on F = T: both sides are −2.
- Over ℚ_3 the constant sequence 1/3 is a bounded Amice coefficient sequence of a non-integral measure, while δ_1 − δ_0 has Amice transform T; the integral measures are exactly the measures of operator norm at most one.
- At p = 3, ambient δ₁ − δ₂ lies in ker ψ and ambient δ₃ does not; the ℚ_p-valued sequence δ_{3^n} converges weakly to δ_0 at norm distance 1.
- Over 𝔽_3 with q = 3, Λ_1(T⁷) = T², and the Cartier identity Λ_r(F(T^q)G) = FΛ_r(G) fails for r = q, as the Lean examples `CartierTests.out_of_range` and `CartierTests.out_of_range_finite_field` record.

### Dependencies

Layers 0 and 1 (clopen restriction and extension by zero of §0.1, the weak and strong topology lemmas of §0.2, the finite projections of §1.1). Mathlib: `AbstractMeasure` with `coeff_amiceTransform`, `amiceTransformEquiv`, `injective_amiceTransform`, `dirac_apply`, `map_apply`, `WeakTopology`, `StrongTopology`; `mahler_apply`, `PadicInt.mahlerEquiv`, `PadicInt.hasSum_mahler`; `Derivation.smul_apply`; `PowerSeries.mk`, `PowerSeries.coeff_mk`, `PowerSeries.ext`, `PowerSeries.map_injective`, `PowerSeries.binomialSeries_constantCoeff`, `PowerSeries.coeff_subst'`, `PowerSeries.WithPiTopology.continuous_coeff`, `PowerSeries.WithPiTopology.tendsto_iff_coeff_tendsto`; `LocallyConstant.charFn`, `LocallyConstant.coe_charFn`; `IsClopen.preimage`; `PadicInt.ker_toZModPow`, `PadicInt.not_isUnit_iff`; `Ring.inverse_non_unit`; `PadicComplex.norm_extends'`, `Valued.integer`; `LinearEquiv.isHomeomorph_iff`. No other roadmap.

## Layer 3: pseudo-measures and evaluation

Pseudo-measures on the commutative completed group algebra, with their module structure, their description through the augmentation ideal, and evaluation at a character after clearing an admissible denominator; the characters of ℤ_pˣ and their integrals against unit measures; and the evaluation of unit measures at varying characters in the form the Kubota–Leopoldt construction consumes. For procyclic Γ the augmentation ideal is principal and generated by [γ] − 1; ℤ_2ˣ is treated as {±1} × (1 + 4ℤ_2).

Standing assumptions for this layer: G is a group with no topology, R a commutative ring, δ : G →* R a homomorphism and c_g = δ(g) − 1; Q is the total quotient ring of R (`FractionRing R`, with `IsFractionRing R Q`; no domain or field structure is assumed) and ι = algebraMap R Q, which is injective; A is a commutative R-algebra with f = algebraMap R A, and hg : IsUnit (f(c_g)) is the admissibility hypothesis of an element g. For the unit measures: p is any prime, including 2; Z = ℤ_p, U = Zˣ and M = D(U,Z) with the multiplicative convolution of Layer 1, commutative by Mathlib's `CommRing` instance on measures over a commutative monoid (§1.2); δ = `diracHom` : U →* M; Q = FractionRing M; P = `pseudomeasures δ Q` ⊆ Q is the M-submodule of pseudo-measures, i : M → P the inclusion and n_g(z) ∈ M the numerator c_g·z of a pseudo-measure z. Characters κ are `ContinuousMonoidHom U Z` (their values are units because U is a group), fκ(μ) ∈ ℚ_p is μ(κ), and t_k is the test u ↦ u^k. A family of characters κ : S → ContinuousMonoidHom U Z over a topological space S is continuous when s ↦ κ_s is continuous into C(U,Z) with the compact-open topology, that is uniformly, U being compact; pointwise continuity is not enough. No topology on P and no rigid-analytic parameter space is asserted, and no comparison with the completed group algebra is used.

### 3.1 Pseudo-measures and admissible evaluation

References: RJW §3.6, Definition 3.34, p. 129. Built on Mathlib `IsFractionRing.injective`, `IsUnit.mul_left_cancel` and `IsFractionRing`. The proposed namespace is `Iwasawa`.

**Pseudomeasures.** Define `Iwasawa.pseudomeasures δ Q : Submodule R Q` to be (1 : Submodule R Q) / Submodule.span R (range (g ↦ ι(δ(g) − 1))). This uses the submodule quotient. It is an R-module; it is not asserted to be a subring, a fractional ideal in the domain-specific sense, or a topological completion. Its API is `mem_pseudomeasures_iff` (z belongs iff for every g there exists r ∈ R with ι(r) = ι(c_g)z), `pseudomeasure_ext` (two pseudomeasures with equal underlying elements of Q are equal) and `pseudomeasures_eq_top_of_trivial` (if δ(g) = 1 for all g, `pseudomeasures δ Q` is the top submodule; this prevents the inverse-of-zero convention for `FractionalIdeal` from being substituted). The membership criterion is the intermediate result on which the rest of the subsection rests.

**Checks.**
- For G = PUnit, δ = 1 : G →* ℤ and Q = ℚ, 1/2 is a pseudomeasure.
- For δ = Units.coeHom ℤ and Q = ℚ, 3 is a pseudomeasure.
- For δ = Units.coeHom ℤ and Q = ℚ, 1/2 belongs but 1/4 does not.
- Thus pseudomeasures need not be closed under multiplication: a definition making them a subring would be wrong.

**Integral inclusion.** Define `Iwasawa.integral δ Q : R →ₗ[R] pseudomeasures δ Q` by r ↦ ι(r). Its API is `coe_integral` (the underlying element of `integral δ Q r` is ι(r)), `integral_zero` and `integral_injective` (the integral inclusion is injective). The value of the inclusion, `coe_integral`, is the intermediate result used by the numerator below. *Needs:* `mem_pseudomeasures_iff`.

**Checks.**
- For δ = Units.coeHom ℤ and Q = ℚ, the underlying value of `integral 3` is 3.
- For G = PUnit, δ = 1 and Q = ℚ, `integral` is the inclusion ℤ → ℚ and is not surjective: 1/2 is a pseudomeasure not of the form `integral r`.
- In the same example `integral 1 ≠ integral 0`.

**Cleared numerator.** For g ∈ G define `Iwasawa.numerator δ Q g : pseudomeasures δ Q →ₗ[R] R` by the unique n_g(z) satisfying ι(n_g(z)) = ι(c_g)z. Its API is `algebraMap_numerator` (ι(n_g(z)) = ι(c_g)z), `numerator_unique` (if ι(r) = ι(c_g)z then n_g(z) = r), `numerator_integral` and `numerator_one`. The intermediate results are the defining identity of the numerator and the cross-multiplication identity `numerator_cross`: c_h·n_g(z) = c_g·n_h(z) in R for all g, h. *Needs:* `mem_pseudomeasures_iff`, `coe_integral`.

**Checks.**
- For δ = Units.coeHom ℤ and any pseudomeasure z in ℚ, n_1(z) = 0.
- For δ = Units.coeHom ℤ, n_{−1}(`integral 2`) = −4.
- For δ = Units.coeHom ℤ, the cleared numerator n_{−1}(1/2) is −1.

**Admissible pseudomeasure evaluation.** For g ∈ G with hg : IsUnit (f(c_g)), define `Iwasawa.evalAt δ Q A g hg : pseudomeasures δ Q →ₗ[R] A` by z ↦ u⁻¹ f(n_g(z)), where u is the unit represented by hg. The requirement is a unit in A, not merely a nonzero element (RJW, Equation (3-11), pp. 129–130). Its API is `evalAt_spec` (f(c_g)·evalAt_g(z) = f(n_g(z))), `evalAt_eq` (two admissible clearing elements give equal R-linear evaluation maps), `evalAt_integral`, `evalAt_unique` (every R-linear extension of f along `integral` is evalAt_g) and `evalAt_map` (for an R-algebra map A → B, the evaluation values commute with that map whenever the clearing factor is admissible); identity and composition follow by function evaluation. The defining identity `evalAt_spec` is the intermediate result the next two statements use. *Needs:* `numerator`.

**Checks.**
- For δ = Units.coeHom ℤ, Q = ℚ, A = ℤ/3 and g = −1, where f(c_g) = f(−2) = 1 is a unit, the evaluation of 1/2 is 2, the inverse of 2 in ℤ/3, since n_{−1}(1/2) = −1.
- For δ = Units.coeHom ℤ, Q = A = ℚ, g = −1 and hg asserting the unit condition, the evaluation of `integral 3` is 3.
- With these data and the membership proof for 1/2, its evaluation is 1/2.

**Independence of clearing factor.** For g, h ∈ G with hg : IsUnit (f(c_g)) and hh : IsUnit (f(c_h)), prove that `evalAt δ Q A g hg = evalAt δ Q A h hh` as R-linear maps (RJW, the independence calculation following equation (3-11), p. 130). Along the way prove that every admissible evaluation restricts to f on the integral elements. *Needs:* `numerator_cross`, `evalAt_spec`.

**Uniqueness of admissible evaluation.** For g admissible (hg : IsUnit (f(c_g))) and an R-linear L : pseudomeasures δ Q →ₗ[R] A that extends f on the integral inclusion, L(integral r) = f(r) for every r, prove that L = evalAt_g (RJW, Equation (3-11) and Remark 3.35, p. 130). The two further intermediate results of the subsection are the behaviour of the evaluation under a change of coefficient algebra A → B (the content of `evalAt_map`) and the obstruction to extending a character from R to its total quotient ring, which §3.2 turns into the total-mass obstruction. *Needs:* `coe_integral`, the defining identity of `numerator`, `evalAt_spec`.

### 3.2 Evaluation of unit measures at varying characters

References: RJW §3.6, Definition 3.34, equation (3-11), Remark 3.35 and complete Lemma 3.36(i)–(iii), pp. 129–131. Built on Mathlib `mahler_apply`, `Polynomial.eval_eq_sum_range` and `descPochhammer_ne_zero_eval_zero`. The proposed namespace is `AbstractMeasure`.

First prove that a measure μ ∈ D(Z,Z) killing every positive ordinary moment kills every polynomial test without constant term (`polynomial_apply_eq_zero_of_positive_moments`) and every Mahler basis function of positive index (`mahler_apply_eq_zero_of_positive_moments`).

**The constant Amice transform of positive-moment vanishing.** Prove `amice_eq_constant_of_positive_moments`: if μ ∈ D(Z,Z) kills every positive ordinary moment, its Amice transform equals the constant series with value μ(1). *Needs:* the vanishing on positive Mahler functions.

**Positive moments determine integral unit measures.** Prove `units_eq_zero_of_positive_moments`: if μ ∈ M satisfies μ(t_k) = 0 for every k > 0, then μ = 0. Along the way prove the moment formula for a convolution of unit measures, `units_mul_moment`: (μ ∗ ν)(t_k) = μ(t_k)·ν(t_k). *Needs:* `amice_eq_constant_of_positive_moments`, `unitsMeasureAmiceEquiv` (§2.6), `psiSeries` (§2.2).

**Nonvanishing positive moments imply regularity.** Prove `units_regular_of_positive_moments`: if μ ∈ M has μ(t_k) ≠ 0 for every k > 0, then μ belongs to nonZeroDivisors M. Then record that p + 1 is a unit of ℤ_p (Mathlib's `PadicInt.isUnit_one_add_of_dvd`) and prove that (p + 1)^k ≠ 1 for every k > 0: for odd p this is Tau Ceti's `TauCeti.not_isOfFinOrder_of_mem_unitsPrincipal`, since p + 1 ∈ 1 + pℤ_p; for p = 2 it is a separate sentence, since 3 ∉ 1 + 4ℤ_2: if 3^k = 1 then 9^k = 1 with 9 ∈ 1 + 4ℤ_2, contradicting the same lemma at the level of 1 + 4ℤ_2. *Needs:* `units_mul_moment`, `units_eq_zero_of_positive_moments`, `PadicInt.isUnit_one_add_of_dvd`, `TauCeti.not_isOfFinOrder_of_mem_unitsPrincipal`.

**Regular Dirac differences from infinite-order units.** Prove `dirac_sub_one_regular`: if a ∈ U satisfies (a : Z)^k ≠ 1 for every k > 0, then δ_a − 1 is regular in M. *Needs:* `units_regular_of_positive_moments`, Mathlib's convolution ring structure on D(U,Z) (§1.2).

**A concrete regular clearing factor.** Prove `one_add_prime_dirac_sub_one_regular`: for any a ∈ U with underlying value p + 1, the measure δ_a − 1 is regular. *Needs:* the positive powers of p + 1, `dirac_sub_one_regular`.

**Positive moments of unit pseudomeasures.** For k > 0 define `positivePseudoMoment k : P → ℚ_p` by the admissible evaluation for the power character u ↦ (u : Z)^k, included into ℚ_p. Its API is `positivePseudoMoment_eq` (for any a with value p + 1, the value is the kth numerator moment divided by (a^k − 1), interpreted in ℚ_p), `positivePseudoMoment_integral` (on the integral inclusion of μ ∈ M, the value is μ(t_k) included into ℚ_p), `positivePseudoMoment_add` (values add under addition in the pseudomeasure module) and `positivePseudoMoment_smul` (for μ ∈ M and z ∈ P, the value on μ·z is μ(t_k) times the value on z). The intermediate result is the numerator identity `positivePseudoMoment_numerator`: n_g(z)(t_k) = (g^k − 1)·positivePseudoMoment_k(z) in ℚ_p for every g ∈ U. *Needs:* `AbstractMeasure.diracHom`, `characterIntegralAlgHom` (§1.6), the commutativity of the convolution (§1.2), `unitsHomeomorphIsUnit` (§2.6), the unit p + 1 and its positive powers, `evalAt` and `evalAt_spec`, the independence of the clearing factor, and the evaluation on integral elements (§3.1).

**Checks.**
- At p = 3, the integral atom at the unit 2 has kth positive pseudomoment 2^k: with a = 4 its kth numerator moment is 2^k(4^k − 1), and the division by 4^k − 1 is not optional.
- The integral identity measure has all positive pseudomoments 1.
- The integral atom at −1 has kth positive pseudomoment (−1)^k, including the dyadic case.

**Positive moments determine unit pseudomeasures.** Prove `pseudomeasure_eq_zero_of_positive_moments`: if z ∈ P has every positivePseudoMoment(k, z) = 0 for k > 0, then z = 0. *Needs:* `positivePseudoMoment_numerator`, `units_eq_zero_of_positive_moments`, `one_add_prime_dirac_sub_one_regular`, the unit p + 1, the defining identity of `numerator` (§3.1).

**Total mass does not extend to the total quotient.** Prove `no_totalMass_fraction_extension`: there is no ring homomorphism Q → Z whose restriction to M is the total-mass character integral. *Needs:* `characterIntegralAlgHom` (§1.6), the unit p + 1, `one_add_prime_dirac_sub_one_regular`, the fraction-extension obstruction of §3.1.

### 3.3 Characters of the units and their integrals

References: RJW Definition 3.34, equation (3-11), its full independence argument and Remark 3.35, pp. 129–130. Built on Mathlib `ContinuousMonoidHom`, `continuous_algebraMap` and `Continuous.eval_const`. The proposed namespace is `AbstractMeasure`.

**Actual nontrivial-character evaluation.** For κ ≠ 1, define the additive homomorphism `unitCharacterEval κ hκ : P →+ ℚ_p`, written Eκ, by the generic admissible evaluation of §3.1, using fκ as the scalar map. No homomorphism Q → ℚ_p is constructed. Its API is `unitCharacterEval_eq` (for every g with κ(g) ≠ 1, Eκ(z) = fκ(n_g(z))/(κ(g) − 1)), `unitCharacterEval_integral` (Eκ(iμ) = fκ(μ)), `unitCharacterEval_smul` (Eκ(μ·z) = fκ(μ)Eκ(z), for the M-module structure on P) and `unitCharacterEval_dirac`. The intermediate results are the ratio formula at any admissible g, the value on integral elements, and the numerator identity fκ(n_g(z)) = (κ(g) − 1)·Eκ(z). *Needs:* `characterIntegralAlgHom` (§1.6), `AbstractMeasure.diracHom`, `evalAt` and the independence of the clearing factor (§3.1).

**Checks.**
- At p = 3 with κ(u) = u², Eκ(iδ₂) = 4: taking g = 2, n_2(iδ₂) = δ₄ − δ₂ has fκ-value 16 − 4 = 12 and κ(2) − 1 = 3.
- Eκ(i1) = 1 for the convolution identity.
- Eκ(i(cδ_g)) = cκ(g) for c ∈ Z and g ∈ U.

**Uniqueness of the character extension.** Prove `unitCharacterEval_unique`: Eκ is the unique additive map L : P → ℚ_p satisfying L(μ·z) = fκ(μ)L(z) and L(iμ) = fκ(μ). *Needs:* `unitCharacterEval`, the uniqueness of admissible evaluation (§3.1).

**Positive moments as character evaluations.** Prove that if κ(g) = g^k for every g ∈ U and k > 0, then Eκ(z) = positivePseudoMoment_k(z). *Needs:* `unitCharacterEval`, `positivePseudoMoment` (§3.2), the unit p + 1 and its positive powers, the independence of the clearing factor (§3.1).

**Nontrivial characters separate pseudomeasures.** Prove `unitCharacterEval_ext`: if Eκ(z) = Eκ(η) for every nontrivial Z-valued continuous character κ of U, then z = η. *Needs:* the previous statement, `pseudomeasure_eq_zero_of_positive_moments` (§3.2), the unit p + 1 and its positive powers.

Then prove the four continuity inputs: the norm bound |Eκ(z)| ≤ ‖n_g(z)‖/|κ(g) − 1| for an admissible g, the continuity of κ ↦ fκ(μ) for fixed μ in the compact-open topology, the openness of the set of parameters s at which a fixed g is admissible for κ_s (κ_s(g) ≠ 1 is an open condition), and the continuity of s ↦ 1/(κ_s(g) − 1) on that open set.

**Continuity away from the trivial character.** Prove `continuous_unitCharacterEval`: for a continuous family κ : S → ContinuousMonoidHom U Z and fixed z ∈ P, the function s ↦ E_{κ_s}(z) is continuous on the subtype {s : S | κ_s ≠ 1}. *Needs:* the openness and continuity of the clearing factor, the ratio formula of `unitCharacterEval`.

### Examples

- For δ = Units.coeHom ℤ and Q = ℚ the pseudomeasures are the rationals r with 2r ∈ ℤ: 1/2 belongs and 1/4 does not, so they are not a subring; the cleared numerator n_{−1}(1/2) = −1 and the evaluation into ℤ/3 at g = −1 gives 2.
- At p = 3 the integral atom at the unit 2 has kth positive pseudomoment 2^k, computed with the clearing factor a = 4 as 2^k(4^k − 1)/(4^k − 1); the division by 4^k − 1 is forced.
- At p = 3 with κ(u) = u², the character evaluation of the integral atom at 2 is 4 = κ(2), computed through g = 2 as 12/3.
- No ring homomorphism FractionRing M → ℤ_p restricts to the total mass on M (`no_totalMass_fraction_extension`): the total mass of δ_{p+1} − 1 is 0 while δ_{p+1} − 1 is regular.

### Dependencies

Layer 1 (the convolution algebra of unit measures with Mathlib's `CommRing` instance, `diracHom`, `characterIntegralAlgHom`) and Layer 2 (`unitsMeasureAmiceEquiv`, `psiSeries`, `unitsHomeomorphIsUnit`); Mathlib `IsFractionRing`, `IsFractionRing.injective`, `IsUnit.mul_left_cancel`, `Submodule.div`, `mahler_apply`, `Polynomial.eval_eq_sum_range`, `descPochhammer_ne_zero_eval_zero`, `ContinuousMonoidHom`, `continuous_algebraMap`, `Continuous.eval_const`. No other roadmap.

## Layer 3a: rigid character and weight spaces

The characters of a compact abelian p-adic analytic group with an open subgroup isomorphic to ℤ_p^d form a parameter space on which measures become bounded analytic functions and pseudo-measures become meromorphic functions with at most a simple pole at the trivial character. This layer fixes that space and its functions at the level of points and bounded functions, on the carriers of Layers 1–3; it comes after Layer 3 because every function it defines is an evaluation of the admissible evaluation of §3.1 composed with the coefficient extension of §1.7. Nothing rigid-analytic is built: the consumers build the rigid structure on the universal property of the universal character below.

### 3a.1 The character space of ℤ_pˣ and its functions

Standing assumptions: p is prime. For odd p write ℤ_pˣ = μ_{p−1} × (1 + pℤ_p); for p = 2 write ℤ_2ˣ = {±1} × (1 + 4ℤ_2). C_p is Mathlib's `PadicComplex`, with valuation ring O_{C_p}. O is the valuation ring of a finite extension of ℚ_p inside C_p and j : O → C_p the inclusion, an isometry. Measures on ℤ_pˣ with O-coefficients are the elements of D(ℤ_pˣ, O) of Layer 1, pseudo-measures those of Layer 3 on the localization of D(ℤ_pˣ, O) (Layer 3 is stated for ℤ_p-coefficients and transports to O-coefficients along `completedGroupAlgebraBaseChange` of §1.7); ι_j : D(ℤ_pˣ, O) → D(ℤ_pˣ, C_p) is the coefficient extension `extendCoefficients` of §1.7, a ring homomorphism for the multiplicative convolutions. The norm of an O-valued measure is never a norm on D(ℤ_pˣ, O) (Layers 0 and 2 install none): wherever ‖μ‖ appears below it means the operator norm of ι_j(μ) through `toCLMEquiv` on the field-valued carrier, and ‖ι_j(μ)‖ ≤ 1 for every μ ∈ D(ℤ_pˣ, O) because j is an isometry into the closed unit ball.

References: RJW Remark 3.47, p. 135, which treats odd p (the decomposition at p = 2 is stated here without a source in this register); Remark 8.3(2) on O⁺(W) and Q(W), pp. 160–161.

**Continuous characters of the units.** Define W(A) = Hom_cts(ℤ_pˣ, Aˣ) for a complete normed ℚ_p-algebra A, with its restriction maps to the torsion part and to the principal units, and the decomposition of its points W(A) ≅ Hom(μ_{p−1}, Aˣ) × Hom_cts(1 + pℤ_p, Aˣ) for odd p, and W(A) ≅ Hom({±1}, Aˣ) × Hom_cts(1 + 4ℤ_2, Aˣ) for p = 2. The decomposition is the decomposition of the group ℤ_pˣ as a direct product; it is a bijection of sets of characters for every A, including p = 2, and says nothing about the integral measure algebra: for odd p the idempotents of `charIdempotent` (§4.6) split D(ℤ_pˣ, O) = O⟦ℤ_pˣ⟧ into p − 1 copies of O⟦1 + pℤ_p⟧ ≅ O⟦T⟧ (#μ_{p−1} is a unit of O), whereas for p = 2 the ring ℤ_2[{±1}] is local and D(ℤ_2ˣ, ℤ_2) ≅ ℤ_2[{±1}]⟦T⟧ does not split; the two torsion components of W(A) at p = 2 are split only after inverting 2, that is on the generic fibre, where (1 ± [−1])/2 are idempotents. The product decomposition of the group itself is Tau Ceti's: `TauCeti.padicIntUnitsEquivProd` gives ℤ_pˣ ≅ μ_{p−1} × (1 + pℤ_p) for odd p, while for p = 2 the library has only the subgroup `TauCeti.unitsPlusMinus` and the decomposition {±1} × (1 + 4ℤ_2) is stated here. Its API is `W.restrictTorsion`, `W.restrictPrincipal`, `W.equivProd` (the displayed decomposition of points), `W.eval` (evaluation of a character at a unit) and `W.map` (functoriality in A along continuous algebra maps). *Needs:* `PadicInt.unitsToZModPow` (§1.3), Tau Ceti `TauCeti.padicIntUnitsEquivProd` (p odd) and `TauCeti.unitsPlusMinus` (p = 2), Mathlib `PadicComplex`, `ContinuousMonoidHom`.

**Checks.**
- For A = C_p and p odd, the p − 1 characters of μ_{p−1} index the fibres of `W.restrictTorsion`.
- The character x ↦ x^k lies in W(ℚ_p) for every integer k, and k ≡ k′ mod (p − 1) exactly when x^k and x^{k′} have the same torsion restriction.
- For p odd and A = ℚ_p, the Teichmüller character ω(x) = lim x^{p^n} has trivial principal restriction and torsion restriction the inclusion μ_{p−1} ⊂ ℚ_pˣ, so `W.equivProd`(ω) = (incl, 1) although ω ≠ 1.
- At p = 2, A = ℚ_2: the sign character sgn, the projection ℤ_2ˣ = {±1} × (1 + 4ℤ_2) → {±1} ⊂ ℚ_2ˣ, so sgn(−1) = −1 and sgn = 1 on 1 + 4ℤ_2, has `W.equivProd`(sgn) = (sgn|_{±1}, 1), and the element e = (1 − [−1])/2 of ℚ_2[{±1}] is not in ℤ_2[{±1}], so the splitting of the two components is generic and not integral.

**Characters of the principal units and the open unit disc.** For A = C_p and u a topological generator of 1 + pℤ_p (of 1 + 4ℤ_2 for p = 2), prove that evaluation at u identifies Hom_cts(1 + pℤ_p, Aˣ) with {z ∈ A : |z − 1| < 1}, so that W(C_p) is a disjoint union of p − 1 (two, for p = 2) copies of the open unit disc, indexed by the characters of the torsion part; the inverse sends z to the character u^a ↦ z^a extended by continuity, which requires |z − 1| < 1 (RJW Remark 3.47, p. 135). That a topological generator exists, and that the closure of its powers is the whole principal unit group, is Tau Ceti's `TauCeti.exists_topologicalClosure_zpowers_eq_unitsPrincipal`. *Needs:* W and its decomposition, the unit p + 1 and its positive powers (§3.2), Tau Ceti `TauCeti.exists_topologicalClosure_zpowers_eq_unitsPrincipal`, Mathlib `PadicInt.hasSum_mahler`.

**Measures as bounded functions on the character space.** For a measure μ ∈ D(ℤ_pˣ, O), define F_μ : W(C_p) → C_p by F_μ(χ) = ι_j(μ)(χ), the value of the extended measure on the C_p-valued test function χ; the integral of a C_p-valued character against an O-valued measure is ι_j(μ)(χ) with ι_j the extension map of §1.7, not an assertion that every C_p-valued measure is an extended integral one. Prove that |F_μ(χ)| ≤ ‖ι_j(μ)‖ ≤ 1, F_{μ⋆ν} = F_μ·F_ν for the multiplicative convolution (ι_j is a ring homomorphism and χ is multiplicative: `extendCoefficients_mul` and `characterIntegralAlgHom` of §1.6 over C_p), F_{δ_a}(χ) = χ(a), and μ ↦ F_μ is injective (the characters span a dense subspace of C(ℤ_pˣ, C_p), and ι_j is injective); on each disc of the previous statement, F_μ is the evaluation of the Amice transform of the corresponding residue component, so it is a bounded analytic function of the disc coordinate (RJW Remark 3.47, p. 135; Remark 8.3(2), pp. 160–161). Its API is `W.measureFun`, `W.measureFun_conv`, `W.measureFun_dirac`, `W.measureFun_injective`, `W.measureFun_norm_le` (|F_μ(χ)| ≤ ‖ι_j(μ)‖) and `W.measureFun_eq_amice_eval` (the identification with the Amice transform on each disc). *Needs:* W and its decomposition, the disc description of the principal characters, `extendCoefficients` (§1.7), the naturality of the Amice transform on Dirac measures and the Amice unit projector (§2.2), `unitCharacterEval` (§3.3).

**Checks.**
- F_{δ_a}(x ↦ x^k) = a^k, so F_{δ_1} = 1 and F_{δ_a ⋆ δ_b}(x ↦ x^k) = (ab)^k = F_{δ_a}(x ↦ x^k)·F_{δ_b}(x ↦ x^k), while F_{δ_a + δ_b}(x ↦ x) = a + b, which distinguishes the convolution rule from the sum.
- For a ≠ b in ℤ_pˣ, F_{δ_a − δ_b} vanishes at the trivial character but takes the value a − b ≠ 0 at x ↦ x, so a measure of total mass zero need not have F_μ = 0.
- The bound |F_μ(χ)| ≤ ‖ι_j(μ)‖ is attained by μ = δ_a: ‖ι_j(δ_a)‖ = 1 and |χ(a)| = 1 for every χ ∈ W(C_p), since χ(a)^{(p−1)p^n} → 1.

**Pseudo-measures as functions with at most a simple pole at the trivial character.** For a pseudo-measure λ on ℤ_pˣ with O-coefficients (`pseudomeasures` of §3.1: ([g] − 1)λ is a measure for every g ∈ ℤ_pˣ) and a nontrivial χ ∈ W(C_p), choose g ∈ ℤ_pˣ with χ(g) ≠ 1 and put F_λ(χ) = F_{([g]−1)λ}(χ)/(χ(g) − 1). Prove that the value does not depend on g: for g, h with χ(g), χ(h) ≠ 1 the cross-multiplication identity ([h] − 1)·(([g] − 1)λ) = ([g] − 1)·(([h] − 1)λ) in D(ℤ_pˣ, O) (`numerator_cross` of §3.1) gives (χ(h) − 1)F_{([g]−1)λ}(χ) = (χ(g) − 1)F_{([h]−1)λ}(χ). So F_λ is defined on every nontrivial character, with F_λ = F_μ when λ = μ is a measure, F_{μ⋆λ} = F_μ·F_λ, and the only possible pole is at the trivial character, where every χ(g) − 1 vanishes; the pole is at most simple because ([u] − 1)λ is a measure for a topological generator u of the principal units and χ(u) − 1 is the disc coordinate of the principal-unit disc above. A fixed clearing element does not work: for p = 2, u = 5 and χ the sign character, χ(5) = 1, so F_μ(χ)/(χ(5) − 1) is 0/0 for every μ; with λ = 1 and μ = [5] − 1 the formula would give 0/0 where F_λ(χ) = 1. For odd p a Teichmüller character ω^i ≠ 1 is trivial on 1 + pℤ_p, so χ(u) = 1 for every principal unit u and the same failure occurs; it is the nontrivial torsion components that force the character-dependent choice of g. Hypotheses: χ nontrivial; g chosen with χ(g) ≠ 1, which exists because χ ≠ 1 (for p = 2 one may take g = −1 on the components where χ(−1) = −1 and g = 5 on the others). If the construction is routed through a localization API, the denominator hypotheses of that API (χ(g) − 1 a unit of C_p, which holds since C_p is a field and χ(g) ≠ 1) are discharged separately, as in `evalAt` of §3.1 (RJW Remark 3.47, p. 135; Remark 8.3(2), pp. 160–161). Its API is `W.pseudoMeasureFun`, `W.pseudoMeasureFun_eq` (F_λ(χ) = F_{([g]−1)λ}(χ)/(χ(g) − 1) for every g with χ(g) ≠ 1), `W.pseudoMeasureFun_integral` (F_λ = F_μ when λ = μ) and `W.pseudoMeasureFun_smul` (F_{μ⋆λ} = F_μ·F_λ). *Needs:* `W.measureFun`, `pseudomeasures`, `numerator`, `numerator_cross`, `evalAt` and the independence of the clearing factor (§3.1).

**Checks.**
- For λ = 1 (the unit measure), F_λ(χ) = 1 at every nontrivial χ: with g such that χ(g) ≠ 1, F_{[g]−1}(χ) = χ(g) − 1.
- For p odd, u = 1 + p and e_1 = (1/(p−1))Σ_{g∈μ_{p−1}}[g] the trivial-torsion idempotent (§4.6; p − 1 is a unit of O), λ = e_1/([u] − 1) is a pseudo-measure: ([g] − 1)λ = 0 for g ∈ μ_{p−1} and ([u] − 1)λ = e_1 are measures. F_λ(χ) = F_{e_1}(χ)/(χ(u) − 1) on the trivial-torsion component, a simple pole at the trivial character, and F_λ(ω^i) = 0 at every nontrivial Teichmüller character ω^i, computed with g a generator of μ_{p−1}, where ([g] − 1)λ = 0: the pole of λ is only on the trivial-torsion component.
- Negative control: 1/([u] − 1) alone is not a pseudo-measure on ℤ_pˣ, since ([g] − 1)/([u] − 1) for g ∈ μ_{p−1} nontrivial has the component (ζ(g) − 1)/T on every nontrivial torsion component, which is not integral; the trivial-torsion idempotent is what makes λ admissible.
- At p = 2, λ = (1 + [−1])/([5] − 1) is a pseudo-measure (([−1] − 1)λ = 0 and ([5] − 1)λ = 1 + [−1], while 1/([5] − 1) is not, since ([−1] − 1)/([5] − 1) ∉ ℤ_2[{±1}]⟦T⟧); at the sign character χ the formula with g = −1 gives F_{([−1]−1)λ}(χ)/(−2) = 0, a finite value, where the formula with g = 5 is 0/0, and on the trivial-sign component F_λ(χ) = 2/(χ(5) − 1), a simple pole.

**The universal character and the generic fibre.** For Γ = ℤ_p (written additively, with generator 1) and Λ = ℤ_p⟦T⟧ ≅ `completedGroupAlgebra ℤ_p Γ` through `powerSeriesCoordinate`, define the universal character `universalCharacter : Multiplicative ℤ_p →* Λˣ`, κ : Γ → Λˣ, a ↦ (1 + T)^a = `binomialSeries` ℤ_p a (`PowerSeries.binomialSeries`, the series with coefficients binom(a, n), a unit with inverse (1 + T)^{−a}), so that κ(n) = (1 + T)^n for n ∈ ℕ and κ(1) = 1 + T. Prove the universal property in the adic case: for a commutative ring S that is a complete Hausdorff topological ℤ_p-algebra with a linear topology (`IsLinearTopology S S`, `CompleteSpace S`, `T2Space S`; for instance O with its 𝔪-adic topology, or O⟦T⟧) and a topologically nilpotent z ∈ S (`PowerSeries.HasEval z`), `PowerSeries.aeval` z is the unique continuous ℤ_p-algebra map Λ → S with T ↦ z, and the composite of κ with it is the continuous character a ↦ (1 + z)^a; conversely, a character χ : Γ → Sˣ, continuous for the topology of Sˣ, with χ(1) − 1 topologically nilpotent, is the composite of κ with `aeval` (χ(1) − 1): χ(a) = `aeval` (χ(1) − 1) (κ a) for every a. Prove the normed case: for a complete normed ℚ_p-algebra A (whose topology is not linear, so `aeval` does not apply) and z ∈ A with ‖z‖ < 1, the evaluation Λ → A, F ↦ Σ_n coeff_n(F) z^n, converges (`HasSum`, as in `rootTranslation` of §2.4), is a continuous ℤ_p-algebra map, the unique one with T ↦ z, and the composite of κ with it is a ↦ (1 + z)^a; every continuous χ : Γ → Aˣ with ‖χ(1) − 1‖ < 1 arises this way, uniquely. Extension to G = H × ℤ_p^d, H finite abelian: the universal character G → (O⟦T_1, ⋯, T_d⟧[H])ˣ sends (h, a) to [h]·∏_i (1 + T_i)^{a_i}; a continuous character of G into Aˣ is a character of H times a d-tuple of characters of ℤ_p, and it corresponds to a point of the d-fold product of discs (z_1, ⋯, z_d), ‖z_i − 1‖ < 1, on the component indexed by its restriction to H; the comparison with the torsion components of W(A) is coordinatewise, with the integral/generic distinction of the first statement of this subsection when p divides #H. Hypotheses: adic case, S a complete Hausdorff linearly topologized commutative ring with a continuous ℤ_p-action and z topologically nilpotent; normed case, A a complete normed ℚ_p-algebra and ‖z‖ < 1, which implies topological nilpotency, the converse failing in general (the condition is on the norm, not on the spectral radius). The two cases are stated separately; neither is a special case of the other (RJW Proposition 3.16, pp. 121–122, and Theorem 3.25, p. 124, which give the identification of measures with Λ and with ℤ_p⟦T⟧ that the universal property restates). Its API is `universalCharacter` (Multiplicative ℤ_p →* Λˣ, a ↦ binomialSeries ℤ_p a), `universalCharacter_apply_coe`, `universalCharacter_natCast` (κ(n) = (1 + T)^n), `universalCharacter_one` (κ(1) = 1 + T), `characterOfHasEval` (for z topologically nilpotent in S, the character a ↦ aeval z (κ a)), `characterOfHasEval_eq` (a continuous character χ with χ(1) − 1 topologically nilpotent equals characterOfHasEval (χ(1) − 1)), `continuous_characterOfHasEval`, `aeval_unique` (the continuous ℤ_p-algebra map with T ↦ z is unique; Mathlib `PowerSeries.aeval_unique`) and `characterOfNorm` (the normed-case character for ‖z‖ < 1 with its `HasSum` description). *Needs:* `toCompletedGroupAlgebra` (§1.7), the naturality of the Amice transform on Dirac measures and the bounded-series range of the Amice transform (§2.2, §2.5), Tau Ceti `completedGroupAlgebra.of`, Tau Ceti `completedGroupAlgebra.powerSeriesCoordinate`, Mathlib `PowerSeries.binomialSeries`, `PowerSeries.HasEval`, `PowerSeries.aeval`, `PowerSeries.aeval_unique`.

**Checks.**
- κ(n) = (1 + T)^n for n ∈ ℕ, whose coefficient of T is n, and κ(−1) = (1 + T)^{−1} = Σ_k (−T)^k, not 1 − T.
- The trivial character corresponds to z = 0, `aeval` 0 being the augmentation Λ → ℤ_p (constant coefficient), and the character 1 ↦ 1 + p into S = ℤ_p corresponds to z = p, under which κ(n) ↦ (1 + p)^n.
- No continuous ℤ_p-algebra map Λ → ℚ_p sends T to p − 1, since T^k → 0 in Λ while (p − 1)^k does not tend to 0 in ℚ_p, so p − 1 is not topologically nilpotent and ‖p − 1‖ = 1; accordingly n ↦ p^n is not the restriction to ℕ of a continuous character of ℤ_p, and the hypothesis on χ(1) − 1 is not redundant.
- The map Λ → ℚ_p, T ↦ p, exists in the normed case (‖p‖ < 1) but not through `aeval`, since the topology of ℚ_p is not linear.

### Examples

- At p = 2 the sign character has `W.equivProd`(sgn) = (sgn|_{±1}, 1), and (1 − [−1])/2 ∉ ℤ_2[{±1}]: the two components of W(ℚ_2) split only generically.
- For λ = e_1/([u] − 1), u = 1 + p, p odd, F_λ has a simple pole at the trivial character on the trivial-torsion component and vanishes at every nontrivial Teichmüller character, while 1/([u] − 1) itself is not a pseudo-measure on ℤ_pˣ; at p = 2 the pseudo-measure (1 + [−1])/([5] − 1) needs the clearing element g = −1 at the sign character, where g = 5 gives 0/0.
- κ(−1) = (1 + T)^{−1} = Σ_k (−T)^k, and T ↦ p − 1 extends to no continuous ℤ_p-algebra map Λ → ℚ_p.

### Dependencies

Layers 1–3: `PadicInt.unitsToZModPow`, `extendCoefficients`, `completedGroupAlgebraBaseChange`, `toCompletedGroupAlgebra` (Layer 1); the Amice transform on Dirac measures, the Amice unit projector, the bounded-series range, `rootTranslation` (Layer 2); `pseudomeasures`, `numerator`, `numerator_cross`, `evalAt`, `unitCharacterEval`, the unit p + 1 and its powers (Layer 3); `charIdempotent` of §4.6 is cited only to explain which splittings are integral. Tau Ceti `completedGroupAlgebra.of` and `completedGroupAlgebra.powerSeriesCoordinate` (ProfiniteProPGroups, layer 9), `TauCeti.padicIntUnitsEquivProd`, `TauCeti.unitsPlusMinus`, `TauCeti.exists_topologicalClosure_zpowers_eq_unitsPrincipal`, `TauCeti.not_isOfFinOrder_of_mem_unitsPrincipal`; Mathlib `PadicInt.isUnit_one_add_of_dvd`, `PadicComplex`, `ContinuousMonoidHom`, `PadicInt.hasSum_mahler`, `PowerSeries.binomialSeries`, `PowerSeries.HasEval`, `PowerSeries.aeval`, `PowerSeries.aeval_unique`.

## Layer 4: Weierstrass theory and module structure

Weierstrass theory for Λ = O⟦T⟧ on Mathlib's Weierstrass factorization, the ring-theoretic consequences (noetherian, regular local of dimension two, factorial, finite free quotients by distinguished polynomials, the height-one primes), the structure theorem for finitely generated Λ-modules up to pseudo-isomorphism with vertical factors in powers of ϖ, pseudo-null modules, characteristic divisors and ideals with their multiplicativity, invariance, base change and change of generator, the invariants μ and λ, character idempotents and isotypic decomposition for a finite abelian H of order prime to p, the cyclotomic polynomials ω_n and ξ_n, and the growth formula for the orders of the finite quotients M/ω_nM. The identification O⟦Γ⟧ ≅ O⟦T⟧ over a complete noetherian local O with finite residue field of characteristic p, extending the integral coordinate of Tau Ceti ProfiniteProPGroups, is stated in this layer (§4.5), and the initial Fitting ideal that the characteristic ideal is compared with is its own statement there.

Standing assumptions for this layer: A is a commutative noetherian integrally closed domain with fraction field K, P(A) its set of height-one primes, at which A_𝔭 is a discrete valuation ring, with A = ⋂_{𝔭∈P(A)} A_𝔭; where A is regular local of dimension n, 2 ≤ n < ∞, it is integrally closed by the Auslander–Buchsbaum theorem (used, not restated); A is factorial wherever the ideal-valued characteristic invariant is used. O is a complete discrete valuation ring with uniformizer ϖ and finite residue field k of characteristic p, Λ = O⟦T⟧ (NSW specialises to O = ℤ_p from (5.3.6) on; over O the vertical factors are powers of ϖ, not of p), f ≠ 0. For analytic evaluations E is a complete nonarchimedean valued field with an injective valued inclusion Frac(O) → E, |ϖ| < 1, |O| ≤ 1, |Oˣ| = 1. Γ ≅ ℤ_p has a chosen topological generator γ, T = γ − 1, Γ_n is the subgroup of index p^n, ω_n = (1 + T)^{p^n} − 1 and ξ_n = ω_n/ω_{n−1} (ω_{−1} = 1). H is finite abelian with p ∤ #H, so #H is a unit in O; for individual-character components O contains every character value, and for nonsplit O Galois-orbit components with their unramified coefficient extensions are used; Γ′ ≅ ℤ_p, and O⟦Γ′ × H⟧ is identified with the product of the O⟦T⟧ over the characters of H through the Iwasawa coordinate (§4.5) and the isotypic decomposition (§4.6). Modules are finitely generated Λ-modules; λ and F are defined through the torsion submodule T_Λ(M) of an arbitrary finitely generated module; statements about dimensions after inverting ϖ, exact-sequence additivity, the characteristic ideal and the Euler cardinality product assume the modules Λ-torsion, and the last assumes the invariant and coinvariant groups at depth n finite.

### 4.1 Pseudo-null modules and pseudo-isomorphism

References: NSW (5.1.5)–(5.1.6), p. 269; Remark 1 after (5.1.7), p. 271; §3, Exercise 1, p. 300; RJW §13.1, p. 189. Built on Mathlib `Module.Dual`, `LocalizedModule` and `Module.IsReflexive`. The proposed namespace is `TauCeti.Iwasawa`. First prove the bidual intersection formula: for a finitely generated torsion-free A-module M, the image of M in its bidual is the intersection over the height-one primes 𝔭 of the lattices M_𝔭 inside M ⊗_A K.

**Pseudo-null modules.** Define a finitely generated A-module M to be pseudo-null, `IsPseudoNull`, if `Module.Finite A M` holds and M_𝔭 = 0 for every prime 𝔭 of height at most one. Its API is `isPseudoNull_iff_annihilator` (every prime containing ann_A(M) has height ≥ 2), `IsPseudoNull.isTorsion` (pseudo-null modules are torsion; NSW Remark 2), `isPseudoNull_iff_eq_zero` (over a Dedekind domain only 0 is pseudo-null; Remark 3), `isPseudoNull_iff_finite` (over a two-dimensional noetherian integrally closed local domain with finite residue field, pseudo-null is equivalent to finite; Remark 4) and `IsPseudoNull.of_exact` (submodules, quotients and extensions of pseudo-null modules are pseudo-null) (NSW (5.1.4) with Remarks 1–4, p. 269).

**Checks.**
- Over Λ = ℤ_p⟦T⟧, Λ/(p, T) = 𝔽_p is pseudo-null (finite).
- Λ/(p) is not pseudo-null: its support contains the height-one prime (p).
- Over A = ℤ_p, ℤ/p is not pseudo-null, since (p) has height one; only 0 is.

**Pseudo-isomorphisms.** Define a linear map f : M → N between finitely generated A-modules to be a pseudo-isomorphism, `IsPseudoIsomorphism`, if ker f and coker f are pseudo-null. Its API is `isPseudoIsomorphism_iff_localization` (f_𝔭 is an isomorphism at every prime of height ≤ 1), `isPseudoIsomorphism_mul` (NSW Lemma 5.1.6: multiplication by α with supp(A/α) ∩ supp(M) ∩ P(A) = ∅ is a pseudo-isomorphism), `IsPseudoIsomorphism.comp` (composites of pseudo-isomorphisms are pseudo-isomorphisms), `IsPseudoIsomorphism.exists_symm` (for finitely generated torsion modules a pseudo-isomorphism exists in the reverse direction) and `isPseudoIsomorphism_iff_finite` (over O⟦T⟧: finite kernel and cokernel). *Needs:* `IsPseudoNull`.

**Checks.**
- M = Λ/(T) ≅ ℤ_p and α = p: multiplication by p is injective with cokernel 𝔽_p, a pseudo-isomorphism, since supp(Λ/p) ∩ supp(M) ∩ P(Λ) = {(p)} ∩ {(T)} = ∅.
- 𝔪 → Λ is a pseudo-isomorphism, but no pseudo-isomorphism Λ → 𝔪 exists (NSW §3, Exercise 1); the relation is not symmetric on non-torsion modules.
- Over a Dedekind domain pseudo-isomorphisms are isomorphisms.

That reflexive modules are torsion-free over any commutative ring is Mathlib's instance `Module.IsReflexive.to_isTorsionFree` and is consumed, not restated.

### 4.2 Structure of finitely generated Λ-modules

References: NSW (5.3.19)–(5.3.20), pp. 298–300. Built on Mathlib `Submodule.eq_bot_of_le_smul_of_le_jacobson_bot`, `IsDedekindDomain` and `Submodule.torsion`.

**Torsion modules over a normal domain up to pseudo-isomorphism.** Prove that for finitely generated M over A there is a pseudo-isomorphism M → T_A(M) ⊕ (M/T_A(M)) (NSW (5.1.7) with Remarks 1–2, pp. 270–271). *Needs:* `IsPseudoIsomorphism`, `IsPseudoNull` (§4.1), and the elementary-divisor decomposition of a finitely generated torsion module at its height-one primes.

Along the way prove that the reflexive hull M^{**} of a finitely generated torsion-free module receives a pseudo-isomorphism from M, and that over a regular local ring of dimension two a finitely generated reflexive module is free.

**Structure theorem over a two-dimensional regular local ring.** Let A be a two-dimensional regular local ring, integrally closed (by the freeness of reflexive modules just stated), and M a finitely generated A-module. Prove that there are finitely many height-one primes 𝔭_i, an integer r ≥ 0, integers n_i ≥ 1 and a pseudo-isomorphism M → A^r ⊕ ⊕_i A/𝔭_i^{n_i}, and that the data are determined by M: r = dim_K M ⊗_A K, {𝔭_i} = supp(T_A(M)) ∩ P(A), and the n_i are unique (NSW Theorem 5.1.10, (5.1.10), p. 273). *Needs:* the torsion splitting above, the reflexive hull, freeness of reflexive modules over a regular local ring of dimension two, and the elementary-divisor decomposition.

**Structure theorem for Iwasawa modules.** Let M be a finitely generated module over Λ = O⟦T⟧. Prove that there are r ≥ 0, integers m_i ≥ 1, irreducible distinguished polynomials F_j and integers n_j ≥ 1, and a homomorphism M → E = Λ^r ⊕ ⊕_i Λ/(ϖ^{m_i}) ⊕ ⊕_j Λ/(F_j^{n_j}) with finite kernel and cokernel, and that the number r, the multisets (m_i) and (n_j) and the ideals (F_j) are determined by M (NSW Theorem 5.3.8 for O = ℤ_p; (5.3.8), p. 292; RJW Theorem 13.1, p. 189). The μ-part is built from powers of the uniformizer ϖ, not of p: RJW Theorem 13.1 writes Λ/(p^{n_i}) over O_L⟦T⟧, which fails when L/ℚ_p is ramified. *Needs:* the structure theorem over a two-dimensional regular local ring, the regular-local structure of Λ and its height-one primes (§4.3), `IsPseudoNull`, `IsPseudoIsomorphism`.

**No finite submodules, freeness and the minimal resolution.** This statement is for O = ℤ_p, Λ = ℤ_p⟦T⟧, as in NSW (5.3.19)–(5.3.20). For a finitely generated Λ-module M write H₀ = M_Γ = M/TM for the coinvariants and H₁ = M^Γ = M[T] for the invariants (the T-torsion); both are finitely generated ℤ_p-modules. Prove that M has projective dimension ≤ 1 iff it has no nonzero finite submodule, iff M[ω_n] is ℤ_p-free for some n; that M is Λ-free iff M[T] = 0 and M/TM is ℤ_p-free; and that a minimal exact resolution 0 → Λ^{d₂} → Λ^{d₁} → Λ^{d₀} → M → 0 (differentials with entries in the maximal ideal) has d₀ = dim_{𝔽_p}(H₀/p), d₁ = dim_{𝔽_p}(H₀[p]) + dim_{𝔽_p}(H₁/p), d₂ = dim_{𝔽_p}(H₁[p]), together with rank_Λ(M) + rank_{ℤ_p}(M[T]) = rank_{ℤ_p}(M/TM) (NSW (5.3.19)–(5.3.20), pp. 298–300). Over a general coefficient ring O with residue field k = O/(ϖ) the same statements hold with k, ϖ in place of 𝔽_p, p: d₀ = dim_k(H₀/ϖH₀), d₁ = dim_k(H₀[ϖ]) + dim_k(H₁/ϖH₁), d₂ = dim_k(H₁[ϖ]); this is the next statement, registered separately as `exists_minimal_resolution_general`. The 𝔽_p-formula is false over a ramified or unramified O ≠ ℤ_p: for M = Λ = O⟦T⟧ the minimal resolution has d₀ = 1, whereas dim_{𝔽_p}(O/pO) = [Frac(O) : ℚ_p] = ef > 1, which is why the general form uses k and ϖ. *Needs:* the submodules M_δ and M_cycl of §4.7, and the freeness criterion for Iwasawa modules.

**Checks.**
- M = Λ: (d₀, d₁, d₂) = (1, 0, 0), with H₀ = ℤ_p and H₁ = 0.
- M = Λ/(p, T) = 𝔽_p: H₀ = H₁ = 𝔽_p and (d₀, d₁, d₂) = (1, 2, 1), the Koszul resolution.
- Negative control for the coefficient scope: over O = ℤ_p[√p] (e = 2, f = 1) and M = Λ_O, the formula with k = O/(√p) = 𝔽_p and ϖ = √p gives d₀ = dim_k(O/√p) = 1, while dim_{𝔽_p}(O/pO) = 2 would be wrong.

**The minimal resolution over a general coefficient ring.** For O a complete discrete valuation ring with uniformizer ϖ and finite residue field k, Λ = O⟦T⟧ and a finitely generated Λ-module M, prove that a minimal resolution 0 → Λ^{d₂} → Λ^{d₁} → Λ^{d₀} → M → 0 has d₀ = dim_k(H₀/ϖH₀), d₁ = dim_k(H₀[ϖ]) + dim_k(H₁/ϖH₁), d₂ = dim_k(H₁[ϖ]), with H₀ = M/TM and H₁ = M[T]; the dimensions are the O-lengths of the ϖ-torsion modules, finite because the H_i are finitely generated over O (NSW (5.3.19)–(5.3.20), pp. 298–300, whose proof uses only that Λ is regular local of dimension two with regular parameters ϖ, T). *Needs:* the ℤ_p statement above, the regular-local structure of Λ (§4.3).

**Checks.**
- O = ℤ_p recovers the ℤ_p statement above.
- M = Λ_O: (1, 0, 0) for every O.
- M = Λ_O/(ϖ, T) = k: (1, 2, 1) for every O, and not (f, 2f, f), which reading the k-dimensions as 𝔽_p-dimensions would give.

The intermediate results of this subsection are the criterion for a quotient of a finitely generated Λ-module to be finite, and the freeness criterion for Iwasawa modules in terms of their invariants and coinvariants.

### 4.3 Weierstrass theory of O⟦T⟧

References: NSW (5.3.5), pp. 290–291, and (5.3.13), p. 294. Built on Mathlib `PowerSeries.exists_isWeierstrassFactorization`, `PowerSeries.IsWeierstrassFactorization.unique` and `PowerSeries.isUnit_iff_constantCoeff`.

First prove that the maximal ideal of Λ is (ϖ, T) and that Λ is a regular local ring of dimension two with regular parameters ϖ, T.

**Mathlib's Weierstrass theory as NSW's division lemma and preparation theorem.** For a monic polynomial F over a commutative ring O, prove that multiplication by `AdjoinRoot.root F` has characteristic polynomial F in the monic power basis, including F = 1. For a complete local coefficient ring and a series f with finite reduced degree, transport this identity through the Weierstrass quotient equivalence to identify multiplication by T on O⟦T⟧/(f) with its distinguished factor (NSW (5.3.1)–(5.3.4), pp. 289–290). NSW allows any complete noetherian local O with finite residue field; Mathlib needs `IsAdicComplete (maximalIdeal O) O`.

Then prove the remaining ring theory of Λ: the height-one primes are (ϖ) and the (F) for F irreducible distinguished; every nonzero power series factors as a unit times a power ϖ^μ times a distinguished polynomial, which reduces to Mathlib's unit-reduction case `PowerSeries.exists_isWeierstrassFactorization` (with `weierstrassDistinguished`, `weierstrassUnit` and the uniqueness `IsWeierstrassFactorization.unique`) after dividing by ϖ^μ, μ the smallest ϖ-valuation of a coefficient; the quotient Λ/(F) ≅ O[X]/(F) by a distinguished F is free of rank deg F, by Mathlib's `Polynomial.IsDistinguishedAt.algEquivQuotient` with `Polynomial.Monic.free_quotient` and `Polynomial.Monic.finite_quotient`; the cyclotomic series ω_n are distinguished polynomials of degree p^n, which is Tau Ceti's `TauCeti.Polynomial.isDistinguishedAt_one_add_X_pow_sub_one` at the ideal (p) with `natDegree_one_add_X_pow_sub_one`, and only the corollary at 𝔪_O, which follows since p ∈ 𝔪_O, is stated here; ω_n = ∏_{m ≤ n} ξ_m with each ξ_m distinguished and irreducible; and the residue field of Λ is k.

### 4.4 The invariants μ and λ, projectors and components

References: NSW (5.3.9) with Remarks 1–3, pp. 292–293. Built on Mathlib `Module.length`, `Module.length_eq_add_of_exact` and `LinearMap.charpoly`. The proposed namespace is `TauCeti.Iwasawa`.

**Iwasawa invariants and the characteristic polynomial.** For a finitely generated Λ-module M define `muInvariant`, μ(M), as the finite length, over Λ_{(ϖ)}, of the localisation of T_Λ(M) at (ϖ); for torsion M this is length M_{(ϖ)}, and on arbitrary M the torsion submodule is essential. Its API, together with the two definitions that follow, is `lambdaInvariant` (λ(M) = Σ n_j deg F_j), `charPoly` (F_{M,γ} = ∏ F_j^{n_j}, a distinguished polynomial), `lambdaInvariant_eq_finrank` (λ(M) = dim_{Frac O} M ⊗_O Frac O for torsion M), `charPoly_eq_charpoly` (for finitely generated torsion M, F_M is `LinearMap.charpoly` of T on the finite-dimensional space M ⊗_O Frac O), `muInvariant_add` (μ is additive in short exact sequences of torsion modules), `lambdaInvariant_add` (λ is additive in short exact sequences of torsion modules) with `charPoly_mul` (F_N = F_M·F_P), `finite_iff_mu_lambda` (a torsion M is finite iff μ(M) = λ(M) = 0) and `invariants_generator_indep` (r, μ and λ do not depend on γ, stated below). *Needs:* the structure theorem for Iwasawa modules (§4.2), the Weierstrass adapter (§4.3).

**Checks.**
- M = Λ/(ϖ): μ = 1, λ = 0, F_M = 1 over every stated coefficient DVR; the ℤ_p control uses ϖ = p.
- For O = ℤ_p, M = Λ/(T² + pT + p): μ = 0, λ = 2 and F_M = T² + pT + p; the polynomial is Eisenstein.
- M = Λ/(p, T) = 𝔽_p: μ = λ = 0 and F_M = 1.

**`lambdaInvariant`.** For an arbitrary finitely generated Λ = O⟦T⟧-module M, define λ(M) as the degree of the horizontal characteristic polynomial of its Λ-torsion submodule; an elementary decomposition gives λ(M) = Σ e_j deg F_j, and free summands contribute zero. Its API is `lambdaInvariant_spec` (λ(M) = degree F_M; the elementary formula follows by the product-degree formula and `charPoly_elementary_spec`), `lambdaInvariant_zero`, and `lambdaInvariant_equiv` (a linear equivalence between the stated modules transports `lambdaInvariant` to the corresponding object, over the same ring and chosen generator). *Needs:* the structure theorem for Iwasawa modules (§4.2).

**Checks.**
- λ(Λ/(ϖ)) = 0 over every stated coefficient DVR, with ϖ = p as the ℤ_p control.
- For O = ℤ_p, λ(Λ/(T² + pT + p)) = 2, the degree of the Eisenstein polynomial.
- λ(Λ/(p, T)) = 0 for the finite module 𝔽_p.

**`charPoly`.** For an arbitrary finitely generated Λ = O⟦T⟧-module M, define F_M as the monic product of the horizontal distinguished irreducibles, with multiplicities, in an elementary decomposition of its Λ-torsion submodule; it is independent of that decomposition, and free and vertical factors contribute one. Its API is `charPoly_elementary_spec` (a pseudo-isomorphism from the torsion submodule to a product of vertical quotients Λ/(ϖ^{m_i}) and horizontal quotients Λ/(F_j^{e_j}), with each F_j distinguished and irreducible, gives F_M = ∏ F_j^{e_j}; vertical factors contribute one), `charPoly_zero`, and `charPoly_equiv` (a linear equivalence between the stated modules transports `charPoly` to the corresponding object, over the same ring and chosen generator). *Needs:* the structure theorem for Iwasawa modules (§4.2).

**Checks.**
- F_{Λ/(ϖ)} = 1 over every stated coefficient DVR, with ϖ = p as the ℤ_p control: the vertical factor contributes one.
- For O = ℤ_p, F_{Λ/(T² + pT + p)} = T² + pT + p, the Eisenstein polynomial itself.
- F_{Λ/(p, T)} = 1 for the finite module 𝔽_p.

**`charPoly_eq_charpoly`.** Prove that for finitely generated torsion M, F_M is `LinearMap.charpoly` of T on the finite-dimensional space M ⊗_O Frac O. *Needs:* `charPoly`, the Weierstrass adapter (§4.3).

**`invariants_generator_indep`.** Prove that r, μ and λ do not depend on γ: a change of generator γ ↦ γ^u, u ∈ ℤ_pˣ, is the ℤ_p-algebra automorphism σ of Λ with σ(T) = (1 + T)^u − 1 (Tau Ceti's generator change), and the module for the new generator is M with scalars restricted along σ; for every σ-semilinear equivalence N ≃ M the two modules have the same μ, λ and Λ-rank, while F_{M,γ} itself changes (the generator-dependence non-example of the invariants above). *Needs:* `muInvariant`, `lambdaInvariant`, `charIdeal_comap_ringEquiv` (§4.6), Tau Ceti's generator change `completedGroupAlgebra.powerSeriesCoordinate_padicPow_apply` (the coordinate of γ^u for a unit u is (1 + T)^u).

### 4.5 The Iwasawa coordinate and the initial Fitting ideal

References: NSW (5.3.5), pp. 290–291, and (5.3.13), p. 294; Stacks, Section 15.8 (Tag 07Z6): Lemma 15.8.2 (Tag 07Z8), Definition 15.8.3 (Tag 07Z9) and Lemma 15.8.4 (Tag 07ZA); Dasgupta–Kakde, Appendix B.2, first paragraph, p. 93, for the convention Fitt = Fitt^0. The proposed namespaces are `TauCeti.Iwasawa` and `TauCeti.Module`.

**The Iwasawa coordinate over O.** For a prime p and a local noetherian ring O, complete for its maximal ideal 𝔪 and of residue characteristic p (`IsLocalRing`, `IsNoetherianRing`, `IsAdicComplete (maximalIdeal O) O`, `CharP (ResidueField O) p`; so p ∈ 𝔪 and O is p-adically complete; the source takes O to be the integers of a finite extension of ℚ_p), construct the level-n coordinate `levelCoordinate` : O⟦T⟧ → O[ℤ/p^nℤ], T ↦ [1] − 1, surjective with kernel (ω_n), ω_n = (1 + T)^{p^n} − 1, compatible with the transition maps, and assemble them into `iwasawaCoordinate` : O⟦T⟧ → ∏_n O[ℤ/p^nℤ]. Under the same hypotheses prove ⋂_n (ω_n) = 0, so the map is injective, and that its image is the ring of compatible families, that is lim_n O[ℤ/p^nℤ] = O⟦Γ⟧ for Γ = ℤ_p with topological generator γ ↦ 1 + T; a change of generator is the substitution T ↦ (1 + T)^u − 1, u ∈ ℤ_pˣ (NSW (5.3.5), pp. 290–291, (5.3.13), p. 294). For O = ℤ_p this is `completedGroupAlgebra.powerSeriesCoordinate` of Tau Ceti ProfiniteProPGroups, layer 9, read through the measure comparison of §1.7. The hypotheses make p a non-unit in the Jacobson radical and O p-adically complete, which the level maps already need: for O = ℚ, p is a unit, ω_n generates (T) for every n, no ring map O⟦T⟧ → O[ℤ/p^nℤ] sends T to [1] − 1, and the intersection of the (ω_n) is not zero. Its API is `levelCoordinate`, `levelCoordinate_X`, `levelCoordinate_surjective`, `ker_levelCoordinate` (the kernel is (ω_n)), `levelCoordinate_transition`, `iwasawaCoordinate` with `iwasawaCoordinate_injective`, `range_iwasawaCoordinate` and `iInf_span_cyclotomic_eq_bot`, all under the hypotheses above. *Needs:* Mathlib `PowerSeries.X`, `ZMod.castHom`, `IsAdicComplete`; Tau Ceti `completedGroupAlgebra.powerSeriesCoordinate` (the case O = ℤ_p, whose generator change T ↦ (1 + T)^u − 1, `completedGroupAlgebra.powerSeriesCoordinate_padicPow_apply` for a unit u, is also consumed, not restated).

**Checks.**
- At level 0 the coordinate is the constant coefficient.
- (1 + T)^k maps to the group element [k] at every level.
- ω_n maps to 0 at level n but not at level n + 1, and T^{p^n} does not map to 0 at level n + 1, so the kernel at level n is (ω_n) and not (T^{p^n}).

**The measure comparison in the power-series coordinate.** For Γ = ℤ_p with generator 1, prove that the composite of the comparison D(ℤ_p, ℤ_p) → `completedGroupAlgebra ℤ_p ℤ_p` of §1.7 (`toCompletedGroupAlgebra`) with the inverse of Tau Ceti's `powerSeriesCoordinate` : ℤ_p⟦T⟧ ≅ `completedGroupAlgebra ℤ_p ℤ_p` (T ↦ [1] − 1) is the Amice transform of Layer 2: δ_a ↦ (1 + T)^a on both sides (the naturality of the Amice transform on Dirac measures, §2.4, and `powerSeriesCoordinate_X`), both are continuous ℤ_p-algebra maps for the weak topology and the coefficientwise topology (the weak homeomorphism of the integral Amice transform, §2.7, and Tau Ceti's continuity of the coordinate), and the Dirac measures span a weakly dense subspace; at level n the composite with `levelCoordinate` is the finite projection π_{ρ_n} of `finiteProjectionAlgHom` (§1.2) (RJW Proposition 3.16 and Theorem 3.25, pp. 121–125). This is a consequence of the two earlier constructions and is stated here, after both, so that neither is defined through it. *Needs:* `iwasawaCoordinate`, `toCompletedGroupAlgebra` (§1.7), `finiteProjectionAlgHom` (§1.2), the Dirac naturality of the Amice transform (§2.4), the integral Amice weak homeomorphism (§2.7), Tau Ceti `completedGroupAlgebra.powerSeriesCoordinate`, `powerSeriesCoordinate_X`.

**Checks.**
- δ_1 ↦ 1 + T.
- δ_0 ↦ 1.
- δ_{−1} ↦ (1 + T)^{−1}, whose coefficient of T is −1 (a comparison through T ↦ [1] instead of [1] − 1 would send δ_1 to T and fail δ_0 ↦ 1).

**The initial Fitting ideal.** For a commutative ring R and a finite R-module M (Tau Ceti needs only `Module.Finite`, not finite presentation), Fitt⁰_R(M) is Tau Ceti's `TauCeti.fittingIdeal R M 0` (a91d3aaf, `RingTheory/FittingIdeal/Basic.lean`, defined through the minors ideal `Submodule.minorsIdeal` of the kernel of any surjection from a finite free module), which already carries independence of the presentation (`fittingIdeal_eq_minorsIdeal_ker`, and `fittingIdeal_eq_minorsIdealOfSet` from any generating set of the kernel), base change (`fittingIdeal_baseChange`), Fitt⁰(R/I) = I (`fittingIdeal_quotient_zero`), invariance under isomorphism (`fittingIdeal_congr`), monotonicity under surjections (`fittingIdeal_le_of_surjective`), Fitt⁰ = R once M is generated by zero elements and in general Fitt^i = R once M is generated by i elements (`fittingIdeal_eq_top_of_surjective`), for free modules Fitt⁰ = R iff the rank is 0 (`fittingIdeal_eq_top_iff_finrank_le`, `fittingIdeal_eq_bot_of_lt_finrank`), and the fibre criterion `fittingIdeal_le_iff_lt_finrank` (Fitt_k ≤ 𝔭 iff k < the dimension of the fibre at 𝔭), of which the general Fitt⁰ = R iff M = 0, `fittingIdeal_eq_top_iff`, is a corollary. Prove the genuinely new API on that declaration: `fittingIdeal_le_annihilator` (Fitt⁰_R(M) ⊆ Ann_R(M)), `fittingIdeal_prod` (Fitt⁰(M × N) = Fitt⁰(M)·Fitt⁰(N) for finite M, N) and the corollary `fittingIdeal_eq_top_iff` (Stacks Lemma 15.8.4 (Tag 07ZA), parts (2) and (6)); the library lemmas named above are used, not restated. Tau Ceti StableReduction, layer 1, consumes the same declaration for the relative singular locus. *Needs:* Mathlib `Module.FinitePresentation`, `Matrix.det`, `Module.annihilator`.

**Checks.**
- Fitt⁰(R/(a)) = (a).
- Fitt⁰(R^n) = 0 for n ≥ 1 over a nonzero ring, and Fitt⁰(0) = R.
- Fitt⁰_ℤ(ℤ/2 ⊕ ℤ/2) = (4) while the annihilator is (2), so the Fitting ideal is not the annihilator.

### 4.6 Characteristic ideals

References: RJW Definition 13.3, p. 190; Lemma 13.6, p. 190; NSW (5.3.9) and Remark 2, pp. 292–293. Built on Mathlib `Module.length`, `LocalizedModule` and `Module.length_eq_add_of_exact`. The proposed namespace is `TauCeti.Iwasawa`.

**The characteristic ideal.** For a finite torsion module over a noetherian normal UFD A, define `charIdeal`, charIdeal(M), as the finite product of the height-one prime ideals raised to their local-length multiplicities in charDivisor(M); this is an ideal, and unique factorisation makes it principal. Its API is `charDivisor` (div_A(M) = Σ_𝔭 length_{A_𝔭}(M_𝔭)[𝔭] over height-one primes), `charIdeal` (the principal ideal ∏ 𝔭^{length} when A is factorial), `charIdeal_mul_of_exact` (multiplicative in short exact sequences), `charIdeal_eq_of_pseudoIso` (invariant under pseudo-isomorphism), `charIdeal_quotient_span`, `charIdeal_eq_top_iff` (char_A(M) = A iff M is pseudo-null), `charIdeal_eq_span_mu_charPoly` (on Λ = O⟦T⟧, char_Λ(M) = (ϖ^μ F_{M,γ}); below), `charIdeal_comap_ringEquiv` (transport along a ring automorphism σ of A: for a σ-semilinear equivalence N ≃ M, char(N) = σ^{−1}(char(M)); below), `charIdeal_baseChange` (below) and `charIdeal_restrictScalars` (below). *Needs:* `IsPseudoNull`, `IsPseudoIsomorphism` (§4.1), the torsion splitting over a normal domain (§4.2), `muInvariant` and `charPoly` (§4.4), `TauCeti.fittingIdeal` (§4.5).

**Checks.**
- char(Λ/(T² − p)) = (T² − p).
- char(Λ/(p, T)) = Λ, while Fitt₀(Λ/(p, T)) = (p, T).
- Λ/(T²) and Λ/(T) ⊕ Λ/(T) both have characteristic ideal (T²) but are not pseudo-isomorphic: no Λ-linear map in either direction has finite kernel and cokernel (the Lean test states this for pseudo-isomorphisms in both directions, not only for the absence of a linear equivalence), since any map Λ/(T²) → Λ/(T) ⊕ Λ/(T) kills T·Λ/(T²) ≅ ℤ_p, and any map in the other direction has image killed by T, hence of infinite index.

**Isotypic decomposition over Λ(H × ℤ_p) with #H prime to p.** For split O containing every character value of finite abelian H of order prime to p, so that #H is invertible in O, define `charIdempotent`, e_ω = (1/#H) Σ_a ω(a)⁻¹[a] in O[H], where 1/#H is `Ring.inverse (#H)`; the definition is meaningful, and every statement about e_ω below is made, only under the hypothesis that #H is invertible in O (the hypothesis `hH` of `charIdempotent`). Its API is `charIdempotent_mul` (e_ω e_{ω′} = δ_{ωω′} e_ω), `sum_charIdempotent`, `isotypicComponent` (M^{(ω)} = e_ω M, the vectors on which every h ∈ H acts by ω(h)), `isotypicDecomposition` (M ≃ ∏_ω M^{(ω)} as Λ(Γ)-modules) and `charIdealProduct` (the ideal of the product ring ∏_ω Λ whose ω-th component is char_Λ(M^{(ω)}), the characteristic ideal of M over Λ(Γ × H) ≅ ∏_ω Λ). It is not the characteristic ideal of M over the single ring Λ = Λ(Γ) by restriction of scalars, which is the product ∏_ω char_Λ(M^{(ω)}) (multiplicativity of `charIdeal`): for H = C₂, p odd, and M^{(+)} = M^{(−)} = Λ/(T), the ideal in Λ × Λ is ((T), (T)) while char_Λ(M) = (T²) (RJW Lemma 13.4 and Definition 13.5, p. 190). *Needs:* `charIdeal`.

**Checks.**
- H = {1, h}, p odd: e_± = (1 ± h)/2 are orthogonal idempotents summing to 1.
- Γ = ℤ_pˣ = μ_{p−1} × (1 + pℤ_p), p odd: the characters ω^i take values in μ_{p−1} ⊂ ℤ_p, so O = ℤ_p suffices.
- H = C_p: 1/p ∉ O and O[C_p] is local, with no nontrivial idempotents.

**`charDivisor`.** Define div_A(M) = Σ_𝔭 length_{A_𝔭}(M_𝔭)[𝔭] over height-one primes. Its API is `charDivisor_spec` (at a height-one prime, charDivisor(M) equals the finite A_𝔭-length of M_𝔭; at other primes it is zero; its finitely supported carrier requires proofs of finite support and finite local length), `charDivisor_zero`, and `charDivisor_equiv` (a linear equivalence between the stated modules transports `charDivisor` to the corresponding object, over the same ring and chosen generator).

**Checks.**
- div_A(0) = 0.
- For Λ = ℤ_p⟦T⟧, div(Λ/(T²)) has coefficient 2 at (T), zero elsewhere.
- For Λ = ℤ_p⟦T⟧, div(Λ/(p, T)) = 0 even though the module is nonzero.

**`charIdeal_eq_span_mu_charPoly`.** Prove that on Λ = O⟦T⟧, char_Λ(M) = (ϖ^μ F_{M,γ}). *Needs:* `charIdeal`.

**`charIdeal_comap_ringEquiv`.** Prove that for a ring automorphism σ of A and a σ-semilinear equivalence N ≃ M of finite torsion modules, char_A(N) = σ^{−1}(char_A(M)); applied to the generator change of Λ it gives the transport of the characteristic ideal under γ ↦ γ^u. *Needs:* `charIdeal`, `invariants_generator_indep` (§4.4).

**`charIdeal_baseChange`.** Prove that for a finite free extension O → O′ of complete discrete valuation rings with finite residue fields (ramified or not) and a finite torsion Λ_O-module M, char_{Λ_{O′}}(Λ_{O′} ⊗_{Λ_O} M) = char_{Λ_O}(M)·Λ_{O′}, the extended ideal (NSW (5.3.9) Remark 3, p. 293). *Needs:* `charIdeal`, Mathlib `Algebra.TensorProduct`.

**Checks.**
- M = Λ_O/(ϖ) and O′ ramified of index e over O: char_{Λ_{O′}}(M′) = (ϖ) = (ϖ′^e), so μ′ = e·μ; for O′ unramified μ′ = μ.
- M = Λ_O/(F) with F distinguished: char = (F) on both sides, λ′ = λ.

**`charIdeal_restrictScalars`.** Prove that for O finite free over ℤ_p and a finite torsion Λ_O-module M with char_{Λ_O}(M) = (f), the characteristic ideal of M regarded as a ℤ_p⟦T⟧-module (restriction of scalars along ℤ_p⟦T⟧ → O⟦T⟧) is generated by the norm N(f) = det(multiplication by f on the finite free ℤ_p⟦T⟧-module O⟦T⟧) (NSW (5.3.9) Remark 3, p. 293). *Needs:* `charIdeal`, `charIdeal_baseChange`, Mathlib `LinearMap.det`.

**Checks.**
- p ≡ 3 mod 4, O = ℤ_p[i], M = O⟦T⟧/(T − ip): as a ℤ_p⟦T⟧-module char(M) = (T² + p²) = N(T − ip).
- O = ℤ_p recovers char(M) = (f).
- M = O⟦T⟧/(p) with [O : ℤ_p] = d = ef: as a ℤ_p⟦T⟧-module char = (p^d) = N(p), so μ_{ℤ_p}(M) = d while μ_O(M) = e (the ϖ-normalisation); μ is not preserved by restriction of scalars.

**`isotypicComponent`.** For a module over the finite group algebra O[H], with its compatible O-action, define the χ-isotypic component to be the range of the O-linear action of e_χ; with #H invertible in O (the hypothesis `hH` under which e_χ is defined) this range consists precisely of vectors on which h acts by χ(h). Its API is `isotypicComponent_spec` (with #H a unit, m is in the projector range iff h·m = χ(h)m for every h in H, the eigencharacter criterion; the weaker fixed-point form e_χ·m = m is `mem_isotypicComponent_iff_smul_eq`, equivalent to it because h·e_χ = χ(h)e_χ), `isotypicComponent_zero`, and `isotypicComponent_equiv` (a linear equivalence between the stated modules transports `isotypicComponent` to the corresponding object, over the same ring and chosen generator) (RJW Lemma 13.4 and Definition 13.5, p. 190). *Needs:* `charIdempotent`.

**Checks.**
- H = 1 gives the entire module as its sole isotypic component.
- For a cyclic group generated by h of order two and unit group order, the trivial-character projector range is exactly the vectors fixed by h.
- For the same group and χ(h) = −1, the χ-projector range is exactly the vectors on which h acts by −1; these three test the group-algebra module action.

**`charIdealProduct`.** For a finite family of finite torsion A-modules M_i over a noetherian normal UFD A, define `charIdealProduct` in the product ring ∏_i A as the intersection of the inverse images of charIdeal_A(M_i) under the coordinate evaluations; the completed-algebra use requires the supplied split product equivalence and its module components. Its API is `charIdealProduct_spec` (a tuple belongs to `charIdealProduct` exactly when its i-th coordinate belongs to charIdeal_A(M_i) for every i), `charIdealProduct_zero`, and `charIdealProduct_equiv` (a linear equivalence between the stated modules transports `charIdealProduct` to the corresponding object, over the same ring and chosen generator) (RJW Lemma 13.4 and Definition 13.5, p. 190). *Needs:* `isotypicDecomposition`, `charIdeal`.

**Checks.**
- The zero module has unit characteristic ideal in every component.
- For H = 1 and M = Λ/(T²), charIdealProduct(M) = (T²).
- For split H = C₂ at odd p, put M = Λ/(T) in the plus component and zero in the minus component: its product characteristic ideal is ((T), Λ), not the unit ideal.
- Two components Λ/(T), Λ/(T): charIdealProduct = ((T), (T)) in Λ × Λ, the ideal containing (T, T) but not (T², 1), while the characteristic ideal of Λ/(T) ⊕ Λ/(T) over the single Λ is (T²); the two notions differ.

**Nonsplit coefficients: components indexed by Galois orbits of characters.** Let O be a complete discrete valuation ring with finite residue field, H finite abelian with #H a unit of O, and O′ an O-algebra that is a domain containing the values of all characters of H (`HasEnoughRootsOfUnity O′ (exponent H)`; for instance the valuation ring of a splitting field). Two characters χ, χ′ : H → O′ˣ are Galois-conjugate when χ′ = σ ∘ χ for an O-algebra automorphism σ of O′; write [χ] for the orbit and O[χ] = O[χ(H)] ⊆ O′ for the O-subalgebra generated by the values of χ, which depends only on [χ] up to the isomorphism induced by σ. Prove that the map x ↦ (ev_{χ_{[χ]}}(x))_{[χ]} from O[H] to ∏_{[χ]} O′, with one chosen representative χ_{[χ]} per orbit, is injective with image exactly ∏_{[χ]} O[χ]; that each O[χ] is a discrete valuation ring, finite free over O, with finite residue field, and unramified over O (a uniformizer of O stays irreducible), because O[χ] = O[ζ_m] for m the order of χ, prime to the residue characteristic; so O[H] ≅ ∏_{[χ]} O[χ] as O-algebras, with the index set and the factors determined by the characters, not merely some product decomposition, and for split O every orbit is a singleton and this is the isotypic decomposition above (RJW Lemma 13.4, p. 190, for the split case; the Galois-orbit form is the standard unramified decomposition of a group algebra of order prime to p and is stated here as the specification). The orbit relation is the orbit relation of the group of O-algebra automorphisms of O′ acting on Hom(H, O′ˣ) by composition; the image description does not depend on the choice of representatives. Its API is `characterGaloisOrbit` (the orbit equivalence on H →* O′ˣ) and `character_orbit_coefficients` (the injectivity, the image ∏ O[χ], and the properties of the O[χ]). *Needs:* `charIdempotent`, `charIdealProduct`, the character evaluation `charEval` (§6.1).

**Checks.**
- O = ℤ_p, H = C₂, p odd: two singleton orbits, O[H] ≅ ℤ_p × ℤ_p (the split decomposition).
- O = ℤ_p, H = C₃, p ≡ 2 mod 3: the trivial character is one orbit and the two faithful characters form one orbit (Frobenius sends ζ₃ to ζ₃² = ζ₃^p), O[H] ≅ ℤ_p × ℤ_p[ζ₃] with ℤ_p[ζ₃] the unramified quadratic extension: two factors, not three.
- O = ℤ_p, H = C_p: #H is not a unit, and ℤ_p[C_p] is local (the C_p check of the split decomposition), so the hypothesis is not redundant.

### 4.7 Cyclotomic polynomials and growth

References: NSW (5.3.11)–(5.3.16), pp. 293–296. First prove the relation between the submodule M_δ and the kernels of the cyclotomic elements: M[ω_n] ⊆ M_δ for every n, and M_δ is the increasing union of them.

**Iwasawa's growth formula over ℤ_p.** This statement is for O = ℤ_p, Λ = ℤ_p⟦T⟧, the normalisation of NSW and of the Lean statement `card_quotient_omega_eq`. Let M be a finitely generated torsion Λ-module and n₀ ≥ d(M). Prove that #(M/(ω_n/ω_{n₀})M) = p^{μp^n + λn + ν} for all sufficiently large n, where μ = μ(M), λ = λ(M) and ν does not depend on n (NSW Proposition 5.3.17; (5.3.17)–(5.3.18), pp. 296–298). Its separate proof input is the cyclotomic growth step (NSW Lemma 5.3.18): for a distinguished polynomial F of degree d and n large, the valuation of ω_n/ω_{n₀} on Λ/(F) grows by d at each step. When d(M) = −1, taking n₀ = −1 (ω_{−1} = 1) gives #M_{Γ_n} = #M/ω_nM = p^{μp^n + λn + ν}. The exponent p^{μp^n + λn + ν} is specific to ℤ_p: over a larger O the residue degree and the ramification index enter (next statement). *Needs:* `muInvariant`, `lambdaInvariant` (§4.4), the relation between M_δ and the cyclotomic kernels, the cyclotomic Weierstrass polynomials (§4.3), `IsPseudoIsomorphism` (§4.1), the cyclotomic growth step.

**Checks.**
- M = Λ/(p): #M/ω_nM = #𝔽_p[T]/(T^{p^n}) = p^{p^n}, μ = 1, λ = 0, ν = 0.
- M = Λ/(T − p) (γ acting by 1 + p, p odd): ω_n acts on ℤ_p by (1 + p)^{p^n} − 1, of valuation n + 1, so #M/ω_nM = p^{n+1}: μ = 0, λ = 1, ν = 1.
- M = Λ/(p, T) = 𝔽_p: #M/ω_nM = p for every n, μ = λ = 0, ν = 1.

**The growth formula over a mixed-characteristic coefficient ring.** Let O be a complete discrete valuation ring of characteristic zero with uniformizer ϖ, residue field of cardinality p^f and ramification index e, that is p = u·ϖ^e with u a unit and e ≥ 1 (so O is the valuation ring of a finite extension of ℚ_p), Λ = O⟦T⟧, M a finitely generated torsion Λ-module with the ϖ-normalised μ = μ(M) of §4.4 and λ = λ(M), and n₀ with ω_{n₀−1} carrying M_δ into its coefficient torsion (d(M) ≤ n₀ − 1). Prove that #(M/(ω_n/ω_{n₀−1})M) = p^{fμp^n + efλn + ν} for all sufficiently large n, with ν independent of n. The proof is NSW's with the elementary module Λ^0 ⊕ ⊕ Λ/(ϖ^{m_i}) ⊕ ⊕ Λ/(F_j^{n_j}): #Λ/(ϖ^m, ω_n) = (p^f)^{m p^n}, and for a distinguished F of degree d, ω_n acts on the O-lattice Λ/(F) ≅ O^d with determinant of valuation v_ϖ(ω_n on O^d) = e·d·n + constant for n large, contributing (p^f)^{edn + c} (NSW (5.3.17)–(5.3.18), pp. 296–298, whose argument is written for ℤ_p; the residue-degree and ramification factors are the specification stated here). It is registered separately from the ℤ_p statement because the exponents differ; it specialises to it for O = ℤ_p (e = f = 1). The hypotheses are O of characteristic zero (mixed characteristic) with p = u·ϖ^e, e ≥ 1, and the finiteness/cyclotomic-control hypothesis on n₀ as in the ℤ_p statement. The equal-characteristic case is excluded, and the formula is false there: for O = k⟦ϖ⟧ with #k = p^f and M = O⟦T⟧/(T − ϖ) ≅ O with T acting by ϖ, one has μ = 0, λ = 1, but ω_n = (1 + ϖ)^{p^n} − 1 = ϖ^{p^n} in characteristic p, so #M/ω_nM = (p^f)^{p^n}, which grows like p^{f p^n} and not like p^{efn + ν}. *Needs:* the ℤ_p growth formula, `muInvariant`, `lambdaInvariant` (§4.4), the structure theorem for Iwasawa modules (§4.2), `charIdeal_eq_span_mu_charPoly` (§4.6).

**Checks.**
- O the unramified quadratic extension of ℤ_p (f = 2, e = 1), M = O⟦T⟧/(p): μ = 1, λ = 0 and #M/ω_nM = #𝔽_{p²}[T]/(T^{p^n}) = p^{2p^n}, which the ℤ_p formula p^{p^n} misses.
- O = ℤ_p[√p] (e = 2, f = 1), M = O⟦T⟧/(T − √p): ω_n acts on O by (1 + √p)^{p^n} − 1, of ϖ-valuation 2n + 1 for n ≥ 1 (odd p), so #M/ω_nM = p^{2n+1} = p^{efλn + ν} with λ = 1, ν = 1.
- The equal-characteristic non-example above, recorded as the Lean example `growth_formula_fails_equal_characteristic`.

Then prove the Euler characteristic formula for finite coinvariants: when M^{Γ_n} and M_{Γ_n} are both finite, their orders have a quotient determined by the invariants of M.

**`delta_submodule`.** Define M_δ = ⋃_n ker(ω_n : M → M); this is a Λ-submodule. Its API is `mem_delta` (x belongs iff ω_n x = 0 for some n), `delta_map` (Λ-linear maps preserve this submodule), `delta_submodule_zero`, `delta_submodule_equiv` (a linear equivalence between the stated modules transports `delta_submodule` to the corresponding object, over the same ring and chosen generator) and `delta_monotone` (a submodule inclusion carries the delta submodule into that of the ambient module). *Needs:* the cyclotomic Weierstrass polynomials (§4.3).

**Checks.**
- M = 0 gives M_δ = 0.
- For M = Λ the delta submodule is zero.
- For M = Λ/(T), M_δ = M.

**`cyclotomic_primary_submodule`.** On a ℤ_p⟦T⟧-module M set C₀ = 0 and C_{r+1} to the preimage in M of δ(M/C_r), and define M_cycl as the supremum of this increasing sequence. For finitely generated M, stabilization makes its quotient have zero delta submodule; M_cycl is finite over ℤ_p and has the cyclotomic primary elementary factors, including their higher powers, up to pseudo-isomorphism. Its API is `mem_cyclotomic_primary_submodule` (an element belongs to M_cycl iff it belongs to one of the recursively defined preimages C_r), `cyclotomic_primary_submodule_finite` (for finitely generated M with its compatible coefficient action, M_cycl is finite over ℤ_p) and `delta_quotient_cyclotomic_primary` (for finitely generated M, δ(M/M_cycl) = 0). *Needs:* the finiteness control of M_δ for finitely generated M, the structure theorem for Iwasawa modules (§4.2).

**Checks.**
- The zero module has zero cyclotomic-primary submodule.
- A free rank-one Λ-module has zero cyclotomic-primary submodule.
- For Λ/(T²), M_cycl is the entire module whereas δ(M) is proper; this distinguishes saturation from a single union of cyclotomic kernels.

The remaining intermediate results of the subsection are that M_δ of a finitely generated torsion module is its maximal finite submodule once the cyclotomic factors are set aside, that the elementary factors of M_δ are the cyclotomic-primary ones, and that the δ-torsion of M/M_δ is ℤ_p-torsion-free (`quotient_delta_torsion_free`); it need not vanish: for M = Λ/(T²), M_δ = TΛ/(T²) and M/M_δ = Λ/(T) is all δ-torsion, and ℤ_p-free.

### Examples

- Λ/(T²) and Λ/(T) ⊕ Λ/(T) have the same characteristic ideal (T²) and are not pseudo-isomorphic in either direction.
- The minimal resolution of 𝔽_p = Λ/(p, T) is the Koszul complex with (d₀, d₁, d₂) = (1, 2, 1), over every coefficient ring O with k, ϖ in place of 𝔽_p, p.
- Over O = ℤ_p[√p], M = O⟦T⟧/(T − √p) has #M/ω_nM = p^{2n+1}: the ramification index doubles the λ-term of the growth formula.
- For O = k⟦ϖ⟧ the growth formula fails (`growth_formula_fails_equal_characteristic`).
- ω_n maps to 0 at level n of the Iwasawa coordinate and not at level n + 1, so the level-n kernel is (ω_n), not (T^{p^n}).
- H = C₃ over ℤ_p with p ≡ 2 mod 3: ℤ_p[C₃] ≅ ℤ_p × ℤ_p[ζ₃], two factors indexed by Galois orbits.

### Dependencies

Layer 1 (§1.2, §1.7) and Layer 2 (§2.4, §2.7) for the measure comparison in the coordinate; §6.1 for the character evaluation used by the Galois-orbit decomposition. Mathlib: `Module.Dual`, `LocalizedModule`, `Module.IsReflexive`, `Module.IsReflexive.to_isTorsionFree`, `Submodule.eq_bot_of_le_smul_of_le_jacobson_bot`, `IsDedekindDomain`, `Submodule.torsion`, `PowerSeries.exists_isWeierstrassFactorization`, `PowerSeries.IsWeierstrassFactorization.unique`, `PowerSeries.isUnit_iff_constantCoeff`, `Module.length`, `Module.length_eq_add_of_exact`, `LinearMap.charpoly`, `LinearMap.det`, `Algebra.TensorProduct`, `Module.FinitePresentation`, `Matrix.det`, `Module.annihilator`, `PowerSeries.X`, `ZMod.castHom`, `IsAdicComplete`. Tau Ceti: `completedGroupAlgebra.powerSeriesCoordinate` with `powerSeriesCoordinate_X` and its generator change `powerSeriesCoordinate_padicPow_apply` (ProfiniteProPGroups, layer 9), `TauCeti.Polynomial.isDistinguishedAt_one_add_X_pow_sub_one` with `natDegree_one_add_X_pow_sub_one`, `TauCeti.fittingIdeal` with `fittingIdeal_eq_minorsIdeal_ker`, `fittingIdeal_eq_minorsIdealOfSet`, `fittingIdeal_baseChange`, `fittingIdeal_quotient_zero`, `fittingIdeal_congr`, `fittingIdeal_le_of_surjective`, `fittingIdeal_eq_top_of_surjective`, `fittingIdeal_eq_top_iff_finrank_le`, `fittingIdeal_eq_bot_of_lt_finrank`, `fittingIdeal_le_iff_lt_finrank` (shared with StableReduction, layer 1); Mathlib `Polynomial.IsDistinguishedAt.algEquivQuotient`, `Polynomial.Monic.free_quotient`, `Polynomial.Monic.finite_quotient`, `PowerSeries.weierstrassDistinguished`, `PowerSeries.weierstrassUnit`.

## Layer 5: determinants, specialization and exactness

Determinant lines of perfect complexes, their specialization, and the exactness of the compact inverse systems that arithmetic uses. The statements are made at the level of the perfect complexes and compact modules of Mathlib; nothing is asserted for arbitrary modules over nonregular coefficient rings.

### 5.1 Determinant lines of perfect complexes

Standing assumptions: A is a commutative ring; perfect complexes are bounded complexes of finite projective A-modules, Mathlib's `HomologicalComplex` over `ModuleCat A` with the projectivity and boundedness hypotheses stated; a determinant line is a graded invertible module, an invertible A-module `L` with a locally constant parity in ℤ/2. Conventions, fixed by the two-term example below: the determinant of a finite projective module P of constant rank r placed in degree 0 is (⋀^r P, r mod 2), so a rank-one module in degree 0 has odd parity; the determinant of a complex is the alternating tensor product ⊗_i det(P^i)^{⊗(−1)^i} with parity Σ_i (−1)^i rank(P^i) mod 2; the symmetry isomorphism of graded lines L ⊗ L′ ≅ L′ ⊗ L carries the Koszul sign (−1)^{|L||L′|}, so that exchanging two rank-one summands of a module acts by −1 on its determinant (the determinant of a swap matrix); shifting a complex by one inverts its determinant line and negates its integer degree, which does not change the parity. The ring-level foundation (invertible modules, top exterior powers of finite projective modules, their base change) is the first statement below, shared with AlgebraicVectorBundles at the level of rings; nothing geometric is imported.

References: Knudsen–Mumford, Chapter I, pp. 19–25; Stacks, Tag 0FJI; RJW Definition 13.3 and Lemma 13.6, p. 190. Built on Mathlib `exteriorPower`, `HomologicalComplex`, `ModuleCat`, `Module.Projective`, `Module.rankAtStalk`, `IsFractionRing`, `lTensor_exact`, `Module.FinitePresentation`, and Tau Ceti `exteriorPower.map_top_eq_det_smul`.

**Line modules and top exterior powers.** For a commutative ring A, prove that the top exterior power ⋀^r P of a finite projective module P of constant rank r is an invertible A-module (finite projective of constant rank one), with ⋀^r P ⊗ ⋀^s Q ≅ ⋀^{r+s}(P ⊕ Q) (the Koszul sign convention above), functoriality in isomorphisms, ⋀^r(f) = det(f) for an endomorphism f of P (Tau Ceti `exteriorPower.map_top_eq_det_smul`), and base change ⋀^r(P ⊗_A A′) ≅ (⋀^r P) ⊗_A A′ along any ring map; define graded lines (L, ε), ε ∈ ℤ/2, with the signed symmetry, their tensor product, their inverses L^{−1} = Hom_A(L, A), and prove the rules (L, ε)^{−1} = (L^{−1}, ε), (L, ε)[1] = (L^{−1}, ε) (Knudsen–Mumford, Chapter I, pp. 19–23, graded invertible modules and their signed symmetry). This is the ring-level layer that AlgebraicVectorBundles layer 0C sheafifies; it is stated once here, on Mathlib's `exteriorPower`, and neither roadmap restates the other's part. *Needs:* Mathlib `exteriorPower`, `Module.Projective`, `Module.rankAtStalk`; Tau Ceti `exteriorPower.map_top_eq_det_smul`.

**Checks.**
- ⋀^1 A = A, odd parity.
- For P = A², the swap (e₁, e₂) ↦ (e₂, e₁) acts on ⋀² A² = A·(e₁ ∧ e₂) by −1.
- ⋀^0 P = A with even parity, for every P.

**The determinant of a perfect complex.** Define det_A(P) for a bounded complex P of finite projective A-modules as the alternating tensor product of the top exterior powers of its terms, with its parity, and prove: det is functorial in isomorphisms of complexes; a quasi-isomorphism P → Q of perfect complexes induces a canonical isomorphism det P ≅ det Q, compatible with composition; a short exact sequence of perfect complexes 0 → P′ → P → P″ → 0 (degreewise split) induces det P ≅ det P′ ⊗ det P″; det commutes with base change along any ring map A → A′; det(P^∨) ≅ (det P)^{−1} with the sign convention of the standing assumptions (Knudsen–Mumford, Chapter I, Definition 1, pp. 23–24, and Theorem 1, p. 25, for existence and uniqueness up to canonical isomorphism and the trivialization f(0) : det H → 1 of an acyclic complex; Stacks, Tag 0FJI, for the two-term determinant and its canonical section, the determinant functor on perfect complexes with its short-exact-sequence isomorphisms, compatibility with base change and normalization). Its API is `detLine`, `detLine_of_iso`, `detLine_quasiIso` (the canonical isomorphism and its transitivity), `detLine_shortExact`, `detLine_baseChange`, `detLine_dual`, `detLine_shift` (det(P[1]) = (det P)^{−1} with the same parity; the integer degree is negated) and `detLine_acyclic`: an acyclic perfect complex has a canonical trivialization det P ≅ A, for a two-term complex [M --f--> N] with f an isomorphism the map det(M)^{−1} ⊗ det(N) → A, m^∨ ⊗ n ↦ m^∨(det(f)^{−1} n), that is 1 ↦ det(f)^{−1} after identifying both lines with A by bases m, f(m) (Stacks 0FJI gives the inverse, the canonical section 1 ↦ det f of A → det P). *Needs:* the line-module foundation above, Mathlib `exteriorPower`, `HomologicalComplex`, `ModuleCat`, `Module.Projective`; Tau Ceti `exteriorPower.map_top_eq_det_smul`.

**Checks.**
- For P = A in degree 0, det P = A with odd parity (rank one); the complex P ⊕ P[1] has even parity.
- For P = A² in degree 0, the swap of the two summands acts by −1 on det P = ⋀² A².
- For P = [A --a--> A] in degrees −1, 0 with a a non-zero-divisor: det P ≅ A with even parity, H⁰(P) = A/(a), the complex is acyclic after inverting a, the trivialization det(P)[a^{−1}] → A[a^{−1}] sends 1 to a^{−1} and the canonical section A[a^{−1}] → det(P)[a^{−1}] sends 1 to a; so the image of det P in A[a^{−1}] is a^{−1}A, not aA.
- For a finite projective module P of rank r, det(P[0]) = (⋀^r P, r mod 2).

**Rational trivialization and the characteristic divisor.** For Λ = O⟦T⟧ with O a complete discrete valuation ring with finite residue field, and a perfect complex P of Λ-modules all of whose cohomology modules are finitely generated and Λ-torsion (so that their characteristic ideals of §4.6 are defined), prove that P becomes acyclic after tensoring with the fraction field Q of Λ, so det_Λ(P) ⊗ Q ≅ Q canonically, and that the image of det_Λ(P) under the trivialization det_Λ(P) ⊗ Q → Q of `detLine_acyclic` is the fractional ideal ∏_i char_Λ(H^i(P))^{(−1)^{i+1}}: the two-term complex P = [Λ --a--> Λ] in degrees −1, 0 has H⁰ = Λ/(a), char(H⁰) = (a), and image a^{−1}Λ = char(H⁰)^{(−1)^{0+1}}. With the inverse trivialization (the canonical section Q → det_Λ(P) ⊗ Q of Stacks 0FJI) the exponent would be (−1)^i; the alternating-determinant convention of this roadmap is the one stated here and is used consistently in the specialization statement below (Knudsen–Mumford, Theorem 1, p. 25, for the trivialization of an acyclic complex; Stacks, Tag 0FJI; RJW Definition 13.3 and Lemma 13.6, p. 190, for the characteristic ideals that the divisor is built from; the identification of the image with the alternating product of characteristic ideals has no source in this roadmap's register and is stated as the specification). *Needs:* `detLine`, the line-module foundation, `charIdeal` and `charPoly` (§4.6, §4.4), Mathlib `IsFractionRing`.

**Checks.**
- P = [Λ --a--> Λ] in degrees −1, 0: image a^{−1}Λ.
- P = Λ/(a) placed in degree 0 is not perfect as a complex of projectives, but its resolution above is; the quasi-isomorphism invariance makes the image a^{−1}Λ depend on H⁰ = Λ/(a) only.
- P = [Λ --a--> Λ] in degrees 0, 1 (H¹ = Λ/(a)): image aΛ = char(H¹)^{(−1)^{1+1}}, so the degree matters.

**Specialization of determinants and the Tor correction.** For a perfect complex P over Λ and a quotient A′ = Λ/(f), prove det_{A′}(P ⊗^L_Λ A′) = det_Λ(P) ⊗_Λ A′ canonically (base change of `detLine`); this is the primary statement and needs nothing about the cohomology, the derived tensor product being the ordinary tensor product of the complex of projectives. For f ≠ 0 (a non-zero-divisor of the domain Λ) prove that the cohomology of P ⊗^L A′ = P ⊗ A′ sits in short exact sequences 0 → H^i(P)/f → H^i(P ⊗ A′) → H^{i+1}(P)[f] → 0 (the universal-coefficient sequences, from 0 → Λ --f--> Λ → A′ → 0; H^{i+1}(P)[f] = Tor_1^Λ(H^{i+1}(P), A′)); when f is a non-zero-divisor on every H^i(P) the torsion terms vanish and H^i(P ⊗ A′) = H^i(P)/f. The specialized determinant det_{A′}(P ⊗ A′) is expressed through determinants of these cohomology modules only under an additional hypothesis: that each H^i(P ⊗ A′) (equivalently each H^i(P)/f and H^{i+1}(P)[f]) is perfect over A′, or that perfect A′-representatives are specified; without it the individual determinants do not exist. Perfectness over A′ of the specialized cohomology is a hypothesis, not a consequence: for f = T² and P = [Λ --T--> Λ] both H^{−1}(P ⊗ A′) and H⁰(P ⊗ A′) are O = Λ/(T), which has infinite projective dimension over A′ = Λ/(T²) (its minimal resolution ⋯ → A′ --T--> A′ --T--> A′ never stops), so no determinant of either module over A′ is available, although det_{A′}(P ⊗ A′) = det_Λ(P) ⊗ A′ ≅ A′ is (Knudsen–Mumford, Definition 1(iii), p. 24, for the compatibility of det with base change; Stacks, Tag 0FJI, for the two-term determinant and its canonical section; the universal-coefficient description of the specialized cohomology has no source in this roadmap's register and is stated as the specification). *Needs:* `detLine`, the line-module foundation, `charIdeal` (§4.6), Mathlib `lTensor_exact`, `Module.FinitePresentation`.

**Checks.**
- P = [Λ --T--> Λ] in degrees −1, 0 (a resolution of Λ/(T)) and f = T: P ⊗ A′ = [O --0--> O], H^{−1} = H⁰ = O, and det_{A′}(P ⊗ A′) = det(O)^{−1} ⊗ det(O) ≅ O with even parity; the naive quotient H⁰(P)/T = O placed in degree 0 has determinant (O, odd): the underlying lines agree, the graded determinants do not, which is what the Tor term H⁰(P)[T] = O corrects.
- The same P with f = T²: det_{A′}(P ⊗ A′) ≅ A′ exists while the two cohomology modules O are not perfect over A′ (the non-example of the hypotheses).
- A finite Λ-module M has char_Λ(M) = Λ but M/TM ≠ 0 in general, so the specialization of the characteristic ideal is not the characteristic ideal of the specialization.

### 5.2 Compact inverse systems and topological Nakayama

Standing assumptions: compact modules are compact Hausdorff topological abelian groups with a continuous action of a profinite ring; inverse systems are indexed by ℕ or by a directed set with countable cofinal subset.

References: RJW Proposition 13.13 and its proof, p. 193, where the inverse limit of the sequences 0 → E⁺_{n,1} → U⁺_{n,1} → Gal(M⁺_n/L⁺_n) → 0 is taken; RJW justifies its exactness by the terms being finitely generated ℤ_p-modules (Mittag-Leffler), whereas the statement below derives it from compactness of the terms, which is the statement arithmetic uses. The same exactness along a tower with surjective transition maps is `TauCeti.exists_forall_map_succ_eq_and_forall_eq_of_surjective` (`TauCeti.Topology.Compactness.InverseSystem`) of Tau Ceti ProfiniteProPGroups, layer 9; its directed case is `TauCeti.exists_forall_map_eq_of_compact_t2`, and exactness on the left is the closed-embedding formality. Built on Mathlib `Submodule.eq_bot_of_le_smul_of_le_jacobson_bot`.

**Topological Nakayama.** For Λ = O⟦T⟧ (more generally a compact local ring with finite residue field and maximal ideal 𝔪) and a compact Hausdorff topological Λ-module M with continuous action Λ × M → M, prove: M = 0 if M/𝔪M = 0; M is finitely generated over Λ if M/𝔪M is finite, by lifts of a finite spanning set; and a map of compact Λ-modules is surjective if it is surjective modulo 𝔪. Compactness of M replaces the finite-generation hypothesis of the algebraic Nakayama lemma (no source in this roadmap's register; the statement is the standard topological Nakayama lemma, and is stated here as the specification). *Needs:* the maximal ideal (ϖ, T) of Λ (§4.3), Tau Ceti `TauCeti.exists_forall_map_succ_eq_and_forall_eq_of_surjective`, Mathlib `Submodule.eq_bot_of_le_smul_of_le_jacobson_bot`.

**Checks.**
- M = Λ with its adic topology: M/𝔪M = 𝔽 is finite and M is generated by one element.
- M = ∏_n 𝔽 (a compact Λ-module with trivial T-action): M/𝔪M = M is infinite and M is not finitely generated.
- The lemma fails for the discrete module ℚ_p/ℤ_p, whose quotient by p is zero.

### Examples

- The two-term complex [Λ --a--> Λ] in degrees −1, 0 has even parity, H⁰ = Λ/(a), and its determinant line sits in Q as a^{−1}Λ = char(Λ/(a))^{−1}; placed in degrees 0, 1 the image is aΛ.
- The swap of the two summands of A² acts by −1 on ⋀² A², the witness of the Koszul sign.
- Specializing [Λ --T--> Λ] along f = T gives [O --0--> O] with determinant (O, even), while the naive quotient O in degree 0 has (O, odd); along f = T² the specialized determinant exists but the cohomology modules are not perfect over Λ/(T²).
- ∏_n 𝔽 is compact with M/𝔪M infinite and is not finitely generated; ℚ_p/ℤ_p is killed modulo p without being zero.

### Dependencies

Layer 4 (`charIdeal`, `charPoly`, the maximal ideal of Λ). Mathlib `exteriorPower`, `HomologicalComplex`, `ModuleCat`, `Module.Projective`, `Module.rankAtStalk`, `IsFractionRing`, `lTensor_exact`, `Module.FinitePresentation`, `Submodule.eq_bot_of_le_smul_of_le_jacobson_bot`; Tau Ceti `exteriorPower.map_top_eq_det_smul`, `TauCeti.exists_forall_map_succ_eq_and_forall_eq_of_surjective` and `TauCeti.exists_forall_map_eq_of_compact_t2` (ProfiniteProPGroups, layer 9). The line-module foundation is shared with AlgebraicVectorBundles layer 0C at the level of rings; neither roadmap imports the other.

## Layer 6: coefficient orders, Fitting ideals and transposes

The ring theory of coefficient orders used by integral Brumer–Stark and Euler-system arguments, in the setting of Dasgupta–Kakde: character group rings O[G] with their evaluation at characters, the lattice and unit theory, the sharp involution and the contragredient dual; quadratic presentations and the comparison of their Fitting ideals; higher Fitting ideals, their chain and their behaviour under extensions and fibre products; compound matrices and higher adjugates; exterior powers and the annihilator of a cokernel; and transposed presentations. The initial Fitting ideal itself is §4.5. The layer states no Gorenstein property and no duality theorem (see Scope and ownership): the contragredient dual below is a module structure on Hom_R(M, R), and nothing is asserted about its exactness or about biduality. The generic compound-matrix and higher-adjugate algebra is stated in the `Matrix` namespace, shared with every consumer of minors, not under this roadmap's prefix.

Standing assumptions for this layer: the setting of Dasgupta–Kakde §2.2: p is an odd prime; G is a finite abelian group, G = G_p × G′ with G_p its p-Sylow subgroup and G′ of order prime to p; O is the valuation ring of a finite extension K of ℚ_p with finite residue field k, containing all values of all characters of G, that is `HasEnoughRootsOfUnity O (Monoid.exponent G)`; Ĝ = Hom(G, Oˣ) has order #G (`CommGroup.card_monoidHom_of_hasEnoughRootsOfUnity`). The idempotents e_ω and their relations are those of `charIdempotent` (§4.6), stated there for a complete discrete valuation ring O with finite residue field of characteristic p and a finite abelian H with p ∤ #H, here with H = G′. The hypothesis on Ψ enters only through the locality of R_Ψ (§6.1): a statement holds for every Ψ for which R_Ψ is a local ring and a finite O-module. R is an arbitrary commutative ring with no noetherian or finiteness hypothesis beyond the stated ones; Fitt_R(M) = Fitt⁰_R(M) is the initial Fitting ideal of §4.5 of a finitely presented R-module M (the convention of Dasgupta–Kakde, Appendix B.2, p. 93), and Fitt^i_R(M) for i ≥ 1 is Tau Ceti's `fittingIdeal R M i`. For a ∈ R and an ideal J of R, a^# = σ^{−1}(a) ∈ R^# and J^# = σ^{−1}(J); for R = R_Ψ and σ = # this is the notation of the sharp involution of §6.1.

### 6.1 Character group rings and their duals

References: Dasgupta–Kakde §2.2, p. 15. Built on Mathlib `HasEnoughRootsOfUnity`, `Monoid.exponent` and `MonoidAlgebra.mapDomainAlgHom`. The proposed namespace is `TauCeti`.

**Evaluation of the group ring at characters and the joint evaluation.** For a commutative ring O, a commutative group G and a character ψ : G → O^× (a group homomorphism; the trivial character is 1; the maps need no finiteness), the character evaluation ev_ψ : O[G] → O is the O-algebra homomorphism Σ_g a_g g ↦ Σ_g a_g ψ(g), the lift of g ↦ ψ(g) through the universal property of the monoid algebra; it is the Tau Ceti declaration `TauCeti.DiagonalizableGroup.point` ψ with value algebra A = O and is not defined again; define `TauCeti.charEval` as an abbreviation for it. For a set Ψ of characters define the joint evaluation ev_Ψ : O[G] → ∏_{ψ∈Ψ} O, x ↦ (ev_ψ(x))_{ψ∈Ψ}; this is the new construction. Following Dasgupta–Kakde, ψ(x) means ev_ψ(x) for x ∈ O[G]. Its API is `charEval` (ev_ψ : O[G] →ₐ[O] O, Σ a_g g ↦ Σ a_g ψ(g): abbreviation of `TauCeti.DiagonalizableGroup.point` ψ with R = A = O), `charEval_single` (ev_ψ(a·g) = a·ψ(g) for a ∈ O, g ∈ G: `TauCeti.DiagonalizableGroup.point_single` specialised to A = O), `charEval_of` (ev_ψ(g) = ψ(g): `TauCeti.DiagonalizableGroup.point_single_one` specialised to A = O), `charEval_one` (the trivial character evaluates by the augmentation: ev_1(a·g) = a), `charEval_one_eq_augmentation` (as a ring homomorphism, ev_1 is the coefficient-sum augmentation `TauCeti.MonoidAlgebra.augmentation` O G : O[G] → O) and `charEval_sum_eq_zero` (for G finite, O a domain and ψ ≠ 1: ev_ψ(Σ_{g∈G} g) = 0, row orthogonality; this item assumes G finite and O a domain). Prove separately `TauCeti.jointEval_injective`: the joint evaluation at all characters is injective, for G finite and O a domain with `HasEnoughRootsOfUnity O (Monoid.exponent G)`.

**Checks.**
- G with an element h ≠ 1, h² = 1, and ψ(h) = −1: ev_ψ(1 + h) = 0 and ev_ψ(1 − h) = 2.
- G trivial: ev_1 : O[G] → O is bijective.
- If G has an element h ≠ 1 and O ≠ 0, no single ev_ψ is injective: it kills h − ψ(h)·1 ≠ 0.

**Character group rings.** In the Dasgupta–Kakde setting, for a subset Ψ ⊆ Ĝ define the character group ring R_Ψ as the image of the joint evaluation ev_Ψ : O[G] → ∏_{ψ∈Ψ} O, an O-subalgebra of the product, together with the canonical surjection α_Ψ : O[G] ↠ R_Ψ; equivalently R_Ψ = O[G]/⋂_{ψ∈Ψ} ker ev_ψ. Quotients of O[G] of this form are the character group rings. R_Ψ is in general a proper, non-maximal O-order in ∏_{ψ∈Ψ} O and is never replaced by that product; it is not Gorenstein in general. Ψ ⊆ Ĝ is arbitrary: Ψ = ∅ gives the zero ring, Ψ = {1} gives O through the augmentation, Ψ = Ĝ gives O[G]. No Gorenstein property is part of the definition, and none is asserted anywhere in this roadmap; the check `charGroupRing_not_gorenstein` records that R_Ψ need not be Gorenstein, so that a consumer stating a duality for R_Ψ must prove the property for its Ψ. R_Ψ, α_Ψ, the evaluations, the restriction maps and the items R_∅ = 0 and R_{1} ≅ O make sense for every commutative ring O, every commutative group G and every set Ψ of characters; the items that need G finite or O a domain say so. Its API is `charGroupRing` (R_Ψ := range(ev_Ψ), an O-subalgebra of ∏_{ψ∈Ψ} O), `charGroupRing.proj` (α_Ψ : O[G] →ₐ[O] R_Ψ), `charGroupRing.proj_surjective` (α_Ψ is surjective, `AlgHom.rangeRestrict_surjective`), `charGroupRing.ker_proj` (α_Ψ(x) = 0 iff ψ(x) = 0 for every ψ ∈ Ψ), `charGroupRing.coord_proj` and `charGroupRing.ext` (two elements of R_Ψ are equal iff all their ψ-coordinates are equal). Prove along the way that a scaled character idempotent (#G)·e_ψ = Σ_g ψ(g)^{−1} g lies in O[G] and evaluates to #G·δ_{ψ,ψ′} under ev_{ψ′}, the input of the lattice statement and of the sharp involution below. *Needs:* `charEval`, `TauCeti.jointEval_injective`.

**Checks.**
- O a domain, G of prime order p with p not a unit in O and `HasEnoughRootsOfUnity O p` (e.g. O = ℤ_p[ζ_p]): for every character ψ the idempotent δ_ψ of ∏_{Ĝ} O is not in R_Ĝ ≅ O[G]; R_Ĝ is a proper suborder of the product.
- G generated by g, h, O a local domain with a primitive p-th root of unity ζ and maximal ideal (ζ − 1), Ψ = {1, ψ_1, ψ_2} with ψ_1(g) = ζ, ψ_1(h) = 1, ψ_2(g) = 1, ψ_2(h) = ζ: R_Ψ = {(a, b, c) : a ≡ b ≡ c mod (ζ − 1)}, and R_Ψ/(ζ − 1) is a local ring whose maximal ideal squares to zero and is not principal, so its socle is two-dimensional and R_Ψ is not Gorenstein.
- Ψ = ∅: R_∅ is the zero ring.

**Character group rings are free O-modules of rank #Ψ.** In the Dasgupta–Kakde setting, for Ψ ⊆ Ĝ prove that the character group ring R_Ψ is a free O-module of rank #Ψ: it is a full-rank O-lattice in ∏_{ψ∈Ψ} O. What is used: O is a principal ideal domain (for freeness, as proved here), G is finite and #G ≠ 0 in O (for the rank); no hypothesis on roots of unity or on the residue field is needed. Prove along the way that R_Ψ has finite additive index in ∏_{ψ∈Ψ} O (the scaled idempotents bound the index by a power of #G) and that a non-zerodivisor of ∏_{ψ∈Ψ} O lying in R_Ψ is a non-zerodivisor of R_Ψ, and conversely for elements whose coordinates are nonzero. *Needs:* `charGroupRing`, the scaled character idempotent.

**Quotients by subgroup norms are character group rings.** (Dasgupta–Kakde Lemma 2.2.) Let I ⊆ G be a subgroup and N_I = Σ_{σ∈I} σ ∈ O[G], the element `TauCeti.subgroupCharSum` of the trivial character over I. For Ψ = {ψ ∈ Ĝ : ψ(I) ≠ 1}, where ψ(I) ≠ 1 means that ψ is not trivial on I, prove that the kernel of α_Ψ : O[G] ↠ R_Ψ is exactly the principal ideal N_I·O[G]; hence O[G]/N_I ≅ R_Ψ is a character group ring. What is used: G is finite and O is a domain with `HasEnoughRootsOfUnity O (Monoid.exponent G)`, through the injectivity of the joint evaluation (Dasgupta–Kakde, Lemma 2.2 and proof, p. 16). Prove along the way the evaluation of the character idempotents: ψ(e_χ) = 1 if ψ restricts to χ and 0 otherwise. *Needs:* `charGroupRing`, `TauCeti.jointEval_injective`.

**The kernel of the projection to the characters belonging to χ.** Write G = G_p × G′. For χ ∈ Ĝ′ = Hom(G′, O^×) let e_χ = (#G′)^{−1} Σ_{a∈G′} χ(a)^{−1} a ∈ O[G′] ⊆ O[G] be its idempotent, the character idempotent `charIdempotent` of §4.6 for H = G′ transported along O[G′] → O[G], and let Ψ_χ = {ψ ∈ Ĝ : ψ|_{G′} = χ} be the set of characters belonging to χ. Prove that ker α_{Ψ_χ} = (1 − e_χ)O[G]; the reason is that ψ(e_χ) = 1 for ψ ∈ Ψ_χ and ψ(e_χ) = 0 for ψ ∈ Ĝ ∖ Ψ_χ. Hence R_{Ψ_χ} ≅ O[G]/(1 − e_χ) ≅ e_χO[G] =: R_χ, the connected component of O[G] attached to χ. Here #G′ is a unit of O because p ∤ #G′, and O contains the values of χ because the exponent of G′ divides that of G; the kernel statement holds for every subgroup G′ of G whose order is a unit of O, and the complement G_p plays no part in it. *Needs:* `charGroupRing`, `TauCeti.jointEval_injective`, `charIdempotent` and `charIdempotent_mul` (§4.6), the evaluation of the character idempotents.

**The component R_χ is the twisted group ring O[G_p]_χ.** Write G = G_p × G′ and let χ ∈ Ĝ′. Prove that the O-algebra homomorphism π_χ : O[G] → O[G_p], g′g_p ↦ χ(g′)g_p for g′ ∈ G′ and g_p ∈ G_p, is surjective with kernel (1 − e_χ)O[G] = ker α_{Ψ_χ}; hence there is a unique isomorphism of O-algebras R_{Ψ_χ} → O[G_p] sending α_{Ψ_χ}(g′g_p) to χ(g′)g_p. With G acting on O[G_p] through π_χ this is the source's O[G_p]_χ, so R_χ ≅ O[G_p]_χ. The statement holds for every decomposition G = G_p × G′ into complementary subgroups with #G′ a unit of O; that G_p is the p-Sylow subgroup is not used. Its API is `charGroupRing.componentProj` (π_χ : O[G] →ₐ[O] O[G_p], the lift `MonoidAlgebra.lift` of the monoid homomorphism G → O[G_p], g′g_p ↦ χ(g′)·g_p for g′ ∈ G′ and g_p ∈ G_p), `charGroupRing.componentProj_single`, `charGroupRing.componentProj_surjective` (π_χ is surjective; it restricts to the identity on O[G_p] ⊆ O[G]), `charGroupRing.componentProj_charIdempotent` (π_χ(e_χ) = 1, and π_χ(e_ω) = 0 for ω ∈ Ĝ′ with ω ≠ χ), `charGroupRing.ker_componentProj` (ker π_χ = (1 − e_χ)O[G] = ker α_{Ψ_χ}) and `charGroupRing.componentEquiv` (R_{Ψ_χ} ≃ₐ[O] O[G_p], induced by the two surjections α_{Ψ_χ} and π_χ from O[G], which have the same kernel). *Needs:* the kernel description of α_{Ψ_χ}, `charGroupRing`, `charIdempotent` (§4.6).

**Checks.**
- G′ = C_2 = {1, h}, p odd, χ the sign character: π_χ(h·g_p) = −g_p for g_p ∈ G_p, π_χ((1 − h)/2) = 1 and π_χ((1 + h)/2) = 0.
- G′ trivial (G′ = 1, G_p = G, χ = 1): `componentEquiv` applied to the restriction of α_Ĝ(x) to R_{Ψ_1} is the image of x under the identification O[G] ≅ O[G_p], for every x ∈ O[G].
- G_p trivial (G′ = G, G_p = 1): `componentEquiv`(α_{Ψ_χ}(g′)) = χ(g′)·1 in O[G_p], which is O through its structure map.

**O[G] is the product of its components R_χ.** Write G = G_p × G′, with #G′ a unit of O and O containing the values of the characters of G′ because the exponent of G′ divides that of G. Prove that the idempotents e_χ ∈ O[G], χ ∈ Ĝ′, are pairwise orthogonal with sum 1, and that the O-algebra homomorphism O[G] → ∏_{χ∈Ĝ′} R_{Ψ_χ}, x ↦ (α_{Ψ_χ}(x))_χ, is an isomorphism; the sets Ψ_χ, χ ∈ Ĝ′, partition Ĝ. *Needs:* the kernel description of α_{Ψ_χ}, `charGroupRing`, `charIdempotent`, `charIdempotent_mul` and `sum_charIdempotent` (§4.6).

**Norm quotients of a component.** (Dasgupta–Kakde Corollary 2.3.) For χ ∈ Ĝ′ and a subgroup I ⊆ G (the source takes I ⊆ G_p; the kernel description holds for any subgroup I), prove R_χ/N_I R_χ ≅ R_Ψ with Ψ = {ψ ∈ Ĝ : ψ|_{G′} = χ, ψ(I) ≠ 1}; precisely, ker α_Ψ is generated by 1 − e_χ and N_I. In particular R_χ/N_I is a finite-index subring of a finite product of copies of O (Dasgupta–Kakde, Corollary 2.3, p. 16). *Needs:* the norm-element kernel, the kernel description of α_{Ψ_χ}, the finite-index statement, the evaluation of the character idempotents.

**Units of character group rings.** For Ψ ⊆ Ĝ and x ∈ R_Ψ, prove that x is a unit of R_Ψ iff ψ(x) ∈ O^× for every ψ ∈ Ψ, and that this holds iff ∏_{ψ∈Ψ} ψ(x) ∈ O^×. No locality of R_Ψ is assumed; only that O is a commutative ring and that Ψ is finite is used (Dasgupta–Kakde §2.3, p. 18; §5.1, p. 34). Prove along the way the one-character form: x ∈ R_Ψ is a unit as soon as ψ(x) ∈ O^× for one ψ ∈ Ψ, when R_Ψ is local. *Needs:* `charGroupRing`.

**Character group rings of one component are local.** For χ ∈ Ĝ′ and nonempty Ψ ⊆ Ψ_χ (for instance R_χ itself, or R_χ/N_I for a nontrivial subgroup I ⊆ G_p), prove that R_Ψ is a local ring, and that its maximal ideal is 𝔪_Ψ = {x ∈ R_Ψ : ψ(x) ∈ 𝔪_O}, for any ψ ∈ Ψ. The two instances are nonempty: the character g′g_p ↦ χ(g′) of G = G_p × G′ lies in Ψ_χ; for a nontrivial subgroup I ⊆ G_p some character ψ_p of G_p is nontrivial on I (`CommGroup.exists_apply_ne_one_of_hasEnoughRootsOfUnity` for G_p, whose exponent divides that of G), and g′g_p ↦ χ(g′)ψ_p(g_p) lies in Ψ_χ and is nontrivial on I (Dasgupta–Kakde §2.2, p. 15; §5.1, p. 34; §7.2.9, p. 49; §7.1, p. 43). Prove along the way that 𝔪_Ψ^N ⊆ 𝔪_O R_Ψ for some N ≥ 1, that every ev_ψ, ψ ∈ Ψ, is a local homomorphism R_Ψ → O, and that the residue field of R_Ψ is the residue field k of O. *Needs:* the one-character unit criterion, `charGroupRing`.

**Character group rings of one component are complete noetherian local rings.** For χ ∈ Ĝ′ and nonempty Ψ ⊆ Ψ_χ, prove that the local ring R_Ψ is noetherian, and that it is complete and separated for the 𝔪_Ψ-adic topology, which coincides with its 𝔪_O-adic topology because 𝔪_Ψ^N ⊆ 𝔪_O R_Ψ ⊆ 𝔪_Ψ for some N ≥ 1 (the power statement above). So R_Ψ is a complete noetherian local O-algebra. What is used beyond locality: O is a noetherian local ring that is 𝔪_O-adically complete and separated, and R_Ψ is a finite O-module (Dasgupta–Kakde §7.2.9, p. 49; §7.1, p. 43). *Needs:* the locality statement, the maximal-ideal power statement, the lattice statement, `charGroupRing`.

**The order of a principal quotient of a character group ring.** (Dasgupta–Kakde Lemma 2.5.) For Ψ ⊆ Ĝ and a non-zerodivisor x ∈ R_Ψ, prove that the quotient R_Ψ/xR_Ψ is finite and #(R_Ψ/xR_Ψ) = #(O/(∏_{ψ∈Ψ} ψ(x))). What is used: O is a Dedekind domain (a discrete valuation ring) that is infinite (characteristic zero), #G ≠ 0 in O, and O/(a) is finite for every a ≠ 0; G is finite. The last condition is `Ring.HasFiniteQuotients O`; that class has no instance for a discrete valuation ring with finite residue field in Mathlib (only for finite rings, ℤ and rings of integers of number fields), so in the Dasgupta–Kakde setting it is derived as in the second proof step (Dasgupta–Kakde, Lemma 2.5, p. 17). *Needs:* `charGroupRing`, the finite-index statement, the non-zerodivisor comparison.

**The involution # and the rings R^#.** Define the involution # of O[G] as the O-algebra automorphism g ↦ g^{−1} (the antipode of the commutative Hopf algebra O[G]); its construction needs only O commutative and G commutative. Prove (x^#)^# = x and ψ(x^#) = ψ^{−1}(x) for every character ψ. For Ψ ⊆ Ĝ put Ψ^# = Ψ^{−1} = {ψ^{−1} : ψ ∈ Ψ} and R^# = R_{Ψ^#} for R = R_Ψ. Prove that # maps ker α_Ψ onto ker α_{Ψ^#} and induces mutually inverse O-algebra isomorphisms # : R_Ψ → R_{Ψ^#} and # : R_{Ψ^#} → R_Ψ, with #(α_Ψ(x)) = α_{Ψ^#}(x^#) and (#y)(ψ^{−1}) = y(ψ). It is an endomorphism of R_Ψ only when Ψ^# = Ψ. For R = O[G] (and ℤ_p[G], ℤ[G]) R^# = R. Ideals transport as I^# = #(I) ⊆ R^#; in particular (xR)^# = x^#R^# (Dasgupta–Kakde §6.1, p. 40; §1.1, p. 6). Its API is `sharp` (# : O[G] →ₐ[O] O[G], a·g ↦ a·g^{−1}: abbreviation of `HopfAlgebra.antipodeAlgHom` O O[G]), `sharp_single`, `sharp_of`, `sharp_sharp` ((x^#)^# = x: `TauCeti.HopfAlgebra.antipode_antipode` specialised to O[G]), `sharpAlgEquiv` (# as a self-inverse O-algebra automorphism of O[G]: abbreviation of `TauCeti.HopfAlgebra.antipodeAlgEquiv` for A = O[G]) and `charEval_sharp` (ψ(x^#) = ψ^{−1}(x)). *Needs:* `charGroupRing`, `charEval`, the scaled character idempotent.

**Checks.**
- τ ∈ G, ψ(τ) = ζ a primitive cube root of unity: ψ(τ^#) = ζ².
- O a characteristic-zero domain, ψ(τ) = ζ a primitive cube root of unity, Ψ = {ψ}: τ − ζ ∈ ker α_Ψ but #(τ − ζ) = τ^{−1} − ζ ∉ ker α_Ψ (ψ-value ζ² − ζ ≠ 0), so # does not induce an endomorphism of R_Ψ.
- G trivial: # is the identity.

### 6.2 Transposed presentations

References: Dasgupta–Kakde §6.1, equation (80), p. 40; Appendix A.4, proof of Lemma A.8, p. 86. Built on Mathlib `Module.dualProdDualEquivDual`, `Module.dual_projective` and `Module.dual_finite`. The proposed namespaces are `TauCeti.ContragredientDual` and `TauCeti.PresentationTranspose`.

**The contragredient dual.** For a ring isomorphism σ : S → R of commutative rings (σ = # : R^# → R for R = R_Ψ, or # : R → R for R = O[G], ℤ_p[G], ℤ[G]) and an R-module M, define the contragredient dual M^* = Hom_R(M, R) as the S-module with (s·φ)(x) = φ(σ(s)·x), the module structure `Module.compHom` along σ; for R = R_Ψ this is Dasgupta–Kakde's rule (r·φ)(x) = φ(r^#·x). Prove that a linear map f : M → N induces the S-linear f^* : N^* → M^*, φ ↦ φ∘f, functorially, and that for M = R^m, M^* is free over S on the dual basis. The source states the rule for ℤ[G]-modules, with M^* = Hom_{ℤ[G]}(M, ℤ[G]), and applies it to modules over a character group ring R = R_Ψ; for an R-module the dual is Hom_R(M, R), the reading that Lemma 6.1 requires, and the general form with a ring isomorphism σ : S → R covers both. Its API is `TauCeti.ContragredientDual` (Hom_R(M, R) with the S-module structure along σ), `toDual` (the underlying functional in `Module.Dual` R M), `smul_apply`, `ofDual` (the element of M^* with underlying functional φ ∈ `Module.Dual` R M; `ofDual` and `toDual` are mutually inverse additive bijections between `Module.Dual` R M and M^*), `ext` (two elements of M^* are equal iff their underlying functionals take the same value at every x ∈ M) and `toDual_smul` (toDual(s·φ) = σ(s)·toDual(φ) in `Module.Dual` R M: `toDual` is a σ-semilinear bijection from M^* onto Mathlib's dual, the identity on functionals). *Needs:* `sharp` (§6.1).

**Checks.**
- R = S = O[G], σ = #, φ = id ∈ Hom_R(R, R): (g·φ)(1) = g^{−1}.
- σ = id: (s·φ)(x) = s·φ(x), the ordinary dual.
- R = O[G] with O ≠ 0, σ = #, g ∈ G with g^{−1} ≠ g: (g·id)(1) = g^{−1} ≠ g in O[G], so the contragredient structure differs from the ordinary one.

**The transpose of a finite projective presentation.** For a commutative ring R, a ring isomorphism σ : S → R, and a presentation P_1 →f P_0 → M → 0 by finitely generated projective R-modules, define the transpose attached to it as M^tr = coker(f^* : P_0^* → P_1^*), an S-module through the contragredient structure (for R = R_Ψ, S = R^# and σ = #). Its carrier is the Tau Ceti cokernel `TauCeti.AuslanderReitenTranspose` f (any ring, any presentation map), with scalars restricted along σ. The transpose depends on the presentation, not on M alone: for a square presentation with matrix (a_ij) it is quadratically presented over S by (σ^{−1}(a_ji)). Dasgupta–Kakde write the presentation as P_0 → P_1 → M with the indices swapped (Dasgupta–Kakde §6.1, (81), p. 40). Minimal presentations, the stable category and the translate D Tr (Tau Ceti QuiverRepresentations Layer 6) are not used or rebuilt here; the uniqueness theorem `TauCeti.IsMinimalProjectivePresentation.nonempty_linearEquiv_auslanderReitenTranspose` compares two minimal projective presentations, over any ring, whereas the presentations of Dasgupta–Kakde are not assumed minimal, and over ℤ[G] minimal presentations need not exist (ℤ/2 has no projective cover over ℤ). That the transpose is unique up to projective summands, tr(f) ⊕ (Q_1 ⊕ P_0)^* ≅ tr(g) ⊕ (P_1 ⊕ Q_0)^* for any two projective presentations, is Tau Ceti `TauCeti.AuslanderReitenTranspose.nonempty_linearEquiv_prod_dual` (`TauCeti.Algebra.Module.AuslanderReiten.StableTranspose`), with the converse `nonempty_linearEquiv_prod_of_linearEquiv`; this construction only restricts scalars along σ. Its API is `TauCeti.PresentationTranspose` (coker(f^*) with the S-module structure along σ; carrier `TauCeti.AuslanderReitenTranspose` f), `mk` (the quotient map P_1^* →ₗ[S] M^tr: the function `TauCeti.AuslanderReitenTranspose.mk` on the underlying functional; it is S-linear for the contragredient structure on P_1^* because the map is R^op-linear and s ∈ S acts on both sides as op(σ(s))), `mk_eq_zero_iff` (mk φ = 0 iff φ factors through f: an abbreviation of `TauCeti.AuslanderReitenTranspose.mk_eq_zero_iff`), `mk_surjective` (the quotient map mk is surjective: an abbreviation of `TauCeti.AuslanderReitenTranspose.mk_surjective`), `lift` (an S-linear map g : P_1^* → N to an S-module N with g(φ ∘ f) = 0 for every φ ∈ P_0^* factors through mk by a unique S-linear map lift g : M^tr → N, and lift g (mk φ) = g φ; it is `TauCeti.AuslanderReitenTranspose.lift`, with `lift_mk` and `hom_ext`, applied after regarding N as an R^op-module through op(r) ↦ σ^{−1}(r)) and `toARTranspose` (the underlying additive group is `TauCeti.AuslanderReitenTranspose` f). *Needs:* `TauCeti.ContragredientDual`, `TauCeti.QuadraticPresentation` (§6.3).

**Checks.**
- The transpose of id : R → R is 0.
- The presentation R² → R, (a, b) ↦ a, of the zero module has transpose ≅ S, not 0: a transpose belongs to a presentation, not to M.
- The transpose of R →(a) R is ≅ S/(σ^{−1}(a)).

**The Fitting ideal of the transpose.** (Dasgupta–Kakde Lemma 6.1.) Let R be a character group ring (more generally a commutative ring with a ring isomorphism σ : R^# → R) and M a quadratically presented R-module with square matrix (a_ij). The transpose M^tr attached to that presentation is quadratically presented over R^# with matrix (a_ji^#); this is the construction `quadraticPresentation` of `TauCeti.PresentationTranspose`. Prove Fitt_{R^#}(M^tr) = Fitt_R(M)^#. The identity concerns the transpose of the stated quadratic presentation: adding a nonzero free relation summand makes the zeroth Fitting ideal of the transpose 0 (Dasgupta–Kakde, Lemma 6.1, p. 40). *Needs:* `TauCeti.PresentationTranspose`, the Fitting ideal of a quadratic presentation (§6.3), `sharp` (§6.1), `TauCeti.fittingIdeal` (§4.5).

Prove next the free form of the next statement: for a presentation P_1 → P_0 → M → 0 with P_1 and P_0 free of ranks t and t + s, the zeroth Fitting ideal of the transpose is the ideal of the t × t minors of the transposed matrix, which is Fitt^s_R(M)^#.

**Higher Fitting ideals and transposes with excess generators.** (Dasgupta–Kakde (171), proof of Lemma B.4.) Let R be a commutative ring with a ring isomorphism σ : R^# → R, and let P_1 →f P_0 → M → 0 be an exact sequence of R-modules with P_1 and P_0 finitely generated projective of constant ranks t and t + s (locally t relations and t + s generators), where a finitely generated projective module has constant rank t when its localisation at every prime ideal is free of rank t (`Module.rankAtStalk`). Prove that the zeroth Fitting ideal over R^# of the transpose M^tr attached to f is Fitt^s_R(M)^#: Fitt^0_{R^#}(M^tr) = Fitt^s_R(M)^#. The identity concerns the transpose of this presentation; in Dasgupta–Kakde the presentation is V^θ → B^θ → ∇ → 0 over ℤ[G], with B^θ free of rank t + s and V^θ projective of constant rank t. No freeness is assumed: over ℤ[G] a projective module of constant rank need not be free, and ℤ[G] is not a finite product of local rings. M and M^tr are finitely presented, being cokernels of maps between finitely generated projective modules: such a module is finitely presented (`Module.finitePresentation_of_projective`), its dual is again finitely generated projective (`Module.dual_finite`, `Module.dual_projective`), and the quotient of a finitely presented module by a finitely generated submodule is finitely presented (`Module.finitePresentation_of_surjective`); the R^#-structure of M^tr is a transport along the ring isomorphism σ (Dasgupta–Kakde, proof of Lemma B.4, equation (171), p. 93). *Needs:* `TauCeti.PresentationTranspose`, the free form above, `sharp`, Tau Ceti `fittingIdeal`, `fittingIdeal_baseChange`, the initial Fitting ideal (§4.5).

### 6.3 Quadratic presentations and the initial Fitting ideal

References: Dasgupta–Kakde §2.3, p. 16. Built on Mathlib `Matrix.adjugate_mul`, `lTensor_exact` and `mem_nonZeroDivisors_iff`. The proposed namespaces are `TauCeti` and `TauCeti.QuadraticPresentation`.

**Quadratically presented modules.** Let R be a commutative ring. Define a quadratic presentation of an R-module N to consist of an integer m ≥ 1, an m×m matrix φ over R and a surjection π : R^m → N whose kernel is the image of φ : R^m → R^m; N is quadratically presented over R if it has one, equivalently N ≅ coker(φ) for a square matrix φ of size m ≥ 1. m ≥ 1 is part of the definition (the zero module is presented by R →(1) R). Its API is `TauCeti.QuadraticPresentation` (the data (m ≥ 1, φ ∈ M_m(R), π : R^m ↠ N) with range(φ) = ker(π)), `size` (the size m ≥ 1), `rel` (the square relation matrix φ), `gen` (the surjection π : R^m → N), `ext` (two quadratic presentations of N with the same size m, the same matrix φ and the same map π are equal) and `TauCeti.IsQuadraticallyPresented` (N has a quadratic presentation over R).

**Checks.**
- R/(a) has a quadratic presentation of size 1 with determinant a.
- The zero module is quadratically presented (m = 1, φ = (1)); m = 0 is excluded.
- R^m (m ≥ 1) has a quadratic presentation with φ = 0.

**The Fitting ideal of a quadratic presentation.** Prove that if N has a quadratic presentation R^m →φ R^m → N → 0, then Fitt_R(N) = (det φ); in particular Fitt_R(N) is principal. *Needs:* `TauCeti.QuadraticPresentation`, the initial Fitting ideal (§4.5).

**Locally quadratic presentations.** Define a locally quadratic presentation of an R-module M to be an exact sequence P_1 →f P_0 →π M → 0 with P_0, P_1 finitely generated projective R-modules of the same constant rank r (rank of (P_i)_𝔭 equal to r at every prime 𝔭, that is `Module.rankAtStalk` P 𝔭 = r for every prime 𝔭 of R, the rank of the free R_𝔭-module P_𝔭). Prove that every quadratic presentation is locally quadratic, and that over a ring with finitely many maximal ideals — for instance a local ring, or a finite product of local rings such as ℤ_p[G], O[G] and the character group rings R_Ψ — a module with a locally quadratic presentation is quadratically presented, because finitely generated projective modules of constant rank over such a ring are free (Dasgupta–Kakde Remark A.7, for ℤ_p[G]): for r ≥ 1 the presentation becomes R^r → R^r → M → 0 after a choice of bases, and for r = 0 the module M is 0, presented by R →(1) R. An arbitrary ℤ_p[G]-algebra is not a finite product of local rings (ℤ_p[G][X] has infinitely many maximal ideals), and over a general ring a locally quadratic presentation need not be quadratic: for a non-principal ideal I of a Dedekind domain R, I ↪ R ↠ R/I is locally quadratic of rank 1, but R/I is not quadratically presented. For the ℤ_p[G]-algebras R of Remark A.7 the presentation is the base change of the locally quadratic presentation over ℤ_p[G]; that one is quadratic, and its base change to R is quadratic by `QuadraticPresentation.baseChange` (Dasgupta–Kakde, Remark A.7, p. 86). Its API is `IsLocallyQuadraticPresentation` (P_1 →f P_0 →π M → 0 exact with P_i finitely generated projective of the same constant rank), `QuadraticPresentation.isLocallyQuadraticPresentation` (a quadratic presentation is locally quadratic), `IsLocallyQuadraticPresentation.isQuadraticallyPresented` (over a local ring a locally quadratic presentation gives a quadratic presentation), `IsLocallyQuadraticPresentation.isQuadraticallyPresented_pi` (over a finite product of local rings a locally quadratic presentation gives a quadratic presentation), `IsLocallyQuadraticPresentation.isQuadraticallyPresented_of_finite_maximalSpectrum` (over a ring with finitely many maximal ideals a locally quadratic presentation gives a quadratic presentation; the local case and the case of a finite product of local rings are instances) and `IsLocallyQuadraticPresentation.baseChange` (for a ring map R → R′, the base change P_1 ⊗_R R′ → P_0 ⊗_R R′ → M ⊗_R R′ → 0 of a locally quadratic presentation is a locally quadratic presentation of the same rank). *Needs:* `TauCeti.QuadraticPresentation`.

**Checks.**
- A quadratic presentation (φ, π) is a locally quadratic presentation.
- R = ℤ_p × ℤ_p, I = ℤ_p × 0: the presentation I ↪ R ↠ R/I is not locally quadratic (ranks of I are 1 and 0).
- 0 → 0 → 0 → 0 is locally quadratic of rank 0.

Prove next the four inputs of the cardinality statement: over a principal ideal domain D the cokernel of a square matrix with non-zerodivisor determinant d has order #(D/(d)); for a finite-index subring B ⊆ B′ the order of a cokernel over B is read off the cokernel over B′ (the two cokernels differ by a finite group of bounded order on both sides, and agree when the ideal K = {b ∈ B : bB′ ⊆ B} is used to compare them); the cokernel of φ modulo an ideal of finite index; and a non-zerodivisor of a finite-index subring B of B′ stays a non-zerodivisor of B′ when every factor of B′ is infinite.

**The order of a quadratically presented module over a finite-index order.** (Dasgupta–Kakde Lemma 2.4.) Let B be a subring of finite additive index of a finite product B′ = ∏_i D_i of principal ideal domains, each possibly a field, finite or infinite, of any characteristic (for instance B is a character group ring R_Ψ ⊆ ∏_{ψ∈Ψ} O). Let N be a quadratically presented B-module with Fitt_B(N) = (x) for a non-zerodivisor x of B such that B/(x) is finite. Prove that N is finite and #N = #(B/(x)). This is the source's generality; when every D_i is infinite, in particular in characteristic zero, which covers every use (R_Ψ ⊆ ∏ O), the ideal K of the proof is 0 and x is already a non-zerodivisor of B′ (Dasgupta–Kakde, Lemma 2.4, p. 16–17). *Needs:* `TauCeti.QuadraticPresentation`, the Fitting ideal of a quadratic presentation, the four inputs above, the initial Fitting ideal (§4.5).

### 6.4 Compound matrices and higher adjugates

References: Dasgupta–Kakde, proof of Lemma 3.9, p. 26. Built on Mathlib `Matrix.det_transpose`, `Set.powersetCard.compl` and `Module.Basis.exteriorPower`. The namespace is `Matrix`.

**Compound matrices.** For a commutative ring R, finite linearly ordered index types and an ι×κ matrix A over R, define the r-th compound matrix C_r(A) as the matrix indexed by r-subsets S ⊆ ι and T ⊆ κ whose (S, T) entry is the minor det A[S, T] (rows S and columns T in increasing order); r-subsets are `Set.powersetCard`, enumerated increasingly by the inverse of `Set.powersetCard.ofFinEmbEquiv`. Prove that it is the matrix of ⋀^r A : ⋀^r R^κ → ⋀^r R^ι in the bases e_T = e_{t_1} ∧ ⋯ ∧ e_{t_r} (t_1 < ⋯ < t_r) of Mathlib's exterior-power bases. Its API is `compound` (C_r(A)_{S,T} = det A[S, T]), `compound_eq_toMatrix` (C_r(A) is the matrix of `exteriorPower.map` r (`toLin'` A) in the bases `Module.Basis.exteriorPower` r of the standard bases), `compound_mul` (C_r(AB) = C_r(A)C_r(B), Cauchy–Binet), `compound_one` (C_r(1) = 1), `compound_one_eq` and `compound_two_eq_pairMinor` (for i < j in ι and k < l in κ, C_2(A)_{{i,j},{k,l}} = `Matrix.pairMinor` A (i, j) (k, l), the 2×2 minor; for r = 2, `Matrix.compound_mul` is its Cauchy–Binet formula `Matrix.pairMinor_mul`). Prove along the way the sign of the complement shuffle (stated as `Set.powersetCard.sign_permOfDisjoint_compl` below) and the generalised Laplace expansion.

**Checks.**
- C_1(A)_{{i},{k}} = A_{ik} for a 2×3 matrix.
- C_2 of the 2×2 matrix (a b; c d) is (ad − bc).
- For r larger than the number of rows there are no r-subsets: C_3 of a 2×3 matrix is empty.

**Higher adjugates.** For a square m×m matrix A over a commutative ring and 0 ≤ r ≤ m, with indices Fin m, define the r-th higher adjugate adj_r(A) as the matrix indexed by r-subsets with entry adj_r(A)_{T,S} = (−1)^{ΣS+ΣT} det A[Sᶜ, Tᶜ] (complementary minor; ΣS the sum of the elements of S; with 0-based or 1-based element sums the sign is the same, since both change by 2r). Prove C_r(A)·adj_r(A) = det(A)·I and adj_r(A)·C_r(A) = det(A)·I (generalized Laplace expansion), and that adj_1 is the adjugate and adj_m = (1). Its API is `higherAdjugate` (adj_r(A)_{T,S} = (−1)^{ΣS+ΣT} det A[Sᶜ, Tᶜ]), `sum_compound_mul_compound_compl` (generalised Laplace expansion: for r-subsets S, S′ of Fin m, Σ_T (−1)^{ΣS′+ΣT} det A[S, T] det A[S′ᶜ, Tᶜ] is det A if S′ = S and 0 if S′ ≠ S, the sum over the r-subsets T), `det_eq_sum_compound_mul_compound_compl` (generalised Laplace expansion along the rows S, the case S′ = S of `Matrix.sum_compound_mul_compound_compl`: for an r-subset S of Fin m, det A = Σ_T (−1)^{ΣS+ΣT} det A[S, T] det A[Sᶜ, Tᶜ], the sum over the r-subsets T), `sum_compound_mul_compound_compl_eq_zero` (the case S′ ≠ S of `Matrix.sum_compound_mul_compound_compl`: for r-subsets S ≠ S′ of Fin m, Σ_T (−1)^{ΣS′+ΣT} det A[S, T] det A[S′ᶜ, Tᶜ] = 0), `Set.powersetCard.sign_permOfDisjoint_compl` (for an r-subset T of Fin m, the shuffle that sorts T followed by Tᶜ (`Set.powersetCard.permOfDisjoint`) has sign (−1)^{ΣT − r(r−1)/2}, ΣT the sum of the elements of T as natural numbers) and `compound_mul_higherAdjugate` (C_r(A)·adj_r(A) = det(A)·I). *Needs:* `compound`, the generalised Laplace expansion. Prove along the way that the image of ⋀^r f, for f with matrix A, is controlled by the r×r minors: det(A) times ⋀^r R^m lies in the span of the image of the compound matrix (the input of §6.7).

**Checks.**
- For a 3×3 matrix, adj_1 agrees with `Matrix.adjugate`.
- For a 3×3 matrix, adj_3(A) = (1).
- adj_r(1_3) = 1 for every r ≤ 3.

### 6.5 Higher Fitting ideals

References: Dasgupta–Kakde, Appendix B.2, first paragraph, p. 93. Built on Tau Ceti `TauCeti.fittingIdeal`, `fittingIdeal_eq_minorsIdeal_ker`, `fittingIdeal_monotone`, `fittingIdeal_baseChange`, and Mathlib `Matrix.det_succ_row`.

The higher Fitting ideals Fitt^i_R(M), i ≥ 0, are Tau Ceti's `TauCeti.fittingIdeal R M i` (a91d3aaf, `RingTheory/FittingIdeal/{Basic,Generators,BaseChange}.lean`), defined for every finite module M through the minors ideal `Submodule.minorsIdeal` (determinants of dual functionals) of the kernel of any surjection from a finite free module, with our indexing. Everything this layer needs about them is in that library and is consumed, not restated: independence of the presentation (`fittingIdeal_eq_minorsIdeal_ker` for any surjection from a finite free module, `fittingIdeal_eq_minorsIdealOfSet` from any generating set of the kernel, with no finiteness of the generating set), invariance under linear equivalence (`fittingIdeal_congr`), monotonicity under surjections (`fittingIdeal_le_of_surjective`), the chain Fitt^i ⊆ Fitt^{i+1} (`fittingIdeal_monotone`), Fitt^i = R once M is generated by i elements (`fittingIdeal_eq_top_of_surjective`), Fitt⁰(R/I) = I (`fittingIdeal_quotient_zero`), Fitt^i(M ⊕ R^r) = Fitt^{i−r}(M) (`fittingIdeal_prod_add_finrank`), the jumps of a free module, Fitt^i(R^n) = 0 for i < n and R for i ≥ n (`fittingIdeal_eq_bot_of_lt_finrank`, `fittingIdeal_eq_top_iff_finrank_le`), the fibre criterion `fittingIdeal_le_iff_lt_finrank` (Fitt_k ≤ 𝔭 iff k < the dimension of the fibre at 𝔭), base change along any ring map (`fittingIdeal_baseChange`, with no flatness hypothesis) and its localisation form (`fittingIdeal_eq_map` with `IsLocalizedModule.isBaseChange`); Fitt^0 is the initial Fitting ideal of §4.5. The statements of §6.2 and §6.6 are made on that declaration. The one statement of this subsection is the translation to matrices that Dasgupta–Kakde's arguments read off.

**Fitting ideals in matrix form.** For a presentation R^m →A R^n → M → 0 with relation matrix A (the columns of A generate the kernel of the surjection R^n → M), prove that Fitt^i_R(M) is the ideal generated by the (n − i)×(n − i) minors of A, which is R for i ≥ n and 0 for i < n − m. This is a translation of `TauCeti.fittingIdeal_eq_minorsIdeal_ker` and `TauCeti.fittingIdeal_eq_minorsIdealOfSet`, whose minors ideal is stated with dual functionals rather than matrix entries, and nothing else (Dasgupta–Kakde, Appendix B.2, first paragraph, p. 93). *Needs:* `TauCeti.fittingIdeal_eq_minorsIdeal_ker`, `TauCeti.fittingIdeal_eq_minorsIdealOfSet`, Mathlib `Matrix.det_succ_row`.

**Checks.**
- Fitt^i(R^n) = 0 for i < n and R for i ≥ n, read off the zero relation matrix.
- Fitt⁰(R/(a)) = (a) and Fitt^i(R/(a)) = R for i ≥ 1, read off the 1×1 matrix (a).
- R/(a) ⊕ R/(b) has Fitt⁰ = (ab), Fitt¹ = (a, b) and Fitt² = R, read off the diagonal matrix diag(a, b); a definition taking the (n − i)×(n − i) minors of the wrong index would give Fitt¹ = (ab).

### 6.6 Fitting ideals of extensions and fibre products

References: Dasgupta–Kakde Lemma 2.6, p. 18. Built on Mathlib `Matrix.det_fromBlocks_zero₂₁` and `Module.finitePresentation_of_ker`.

First prove the relation matrix of an extension: for 0 → A → B → C → 0 with A and C presented by relation matrices ψ_A and φ_C, lifts c̃_j of the generators of C satisfy relations Σ_j (φ_C)_{jk}·c̃_j = Σ_i X_{ik}·a_i for some matrix X, and the kernel of the combined generator map is generated by the columns of the block matrix [[ψ_A, −X], [0, φ_C]].

**An extension of quadratically presented modules is quadratically presented.** (Dasgupta–Kakde Lemma 2.6, second assertion.) Let R be a commutative ring and 0 → A → B → C → 0 an exact sequence of R-modules, A identified with its image in B, with A quadratically presented by (n, ψ_A, π_A) and C quadratically presented by (m, φ_C, π_C). Prove that B is quadratically presented, of size n + m, by the block upper-triangular matrix [[ψ_A, −X], [0, φ_C]] and the generators a_1, ⋯, a_n, c̃_1, ⋯, c̃_m, where a_i = π_A(e_i), the c̃_j ∈ B are lifts of the π_C(e_j), and X is an n×m matrix with Σ_j (φ_C)_{jk}·c̃_j = Σ_i X_{ik}·a_i for every k; the determinant of this matrix is det ψ_A·det φ_C. The presentation of B depends on the choice of the lifts c̃_j and of X; its size n + m and its determinant det ψ_A·det φ_C do not. The sign of X comes from moving the lifted relation to the other side; it does not affect the determinant, and replacing each a_i by −a_i turns −X into X. *Needs:* `TauCeti.QuadraticPresentation`, the relation matrix of an extension.

**Fitting ideals of extensions with a quadratically presented quotient.** (Dasgupta–Kakde Lemma 2.6, first assertion.) Let R be a commutative ring and 0 → A → B → C → 0 an exact sequence of R-modules with C quadratically presented and A finitely presented. Prove that B is finitely presented and Fitt_R(B) = Fitt_R(A)·Fitt_R(C). A finitely presented is needed for Fitt_R(A); then B is finitely presented, as an extension of finitely presented modules (`Module.finitePresentation_of_ker`). The source states the lemma for an arbitrary commutative ring and an arbitrary module A and leaves this implicit (in its applications the modules are finitely generated over noetherian rings) and fixes the convention at the start of Appendix B.2 (arXiv v3 PDF p. 93). *Needs:* `TauCeti.QuadraticPresentation`, the Fitting ideal of a quadratic presentation, the relation matrix of an extension, the initial Fitting ideal (§4.5).

**Fitting ideals of two extensions of a common quotient.** (Dasgupta–Kakde Lemma 2.7.) Let B, B′ be quadratically presented R-modules with exact sequences 0 → A → B → C → 0 and 0 → A′ → B′ → C → 0, A and A′ finitely presented. Prove Fitt_R(A)·Fitt_R(B′) = Fitt_R(A′)·Fitt_R(B). A and A′ finitely presented makes the fibre product B ×_C B′ finitely presented, as an extension of B by A′; the source leaves this implicit (its modules are finitely generated over noetherian rings, where A and A′ are automatically finitely presented) and fixes the convention in Appendix B.2 (Dasgupta–Kakde, Lemma 2.7 and proof, p. 18). *Needs:* `TauCeti.QuadraticPresentation`, the extension formula above, the initial Fitting ideal (§4.5).

### 6.7 Exterior powers and annihilators

References: Dasgupta–Kakde Lemma 3.9, p. 25–26. Built on Mathlib `exteriorPower.map_surjective`, `exteriorPower.map_comp` and `Module.annihilator`.

**Fitting ideals annihilate exterior-power cokernels.** (Dasgupta–Kakde Lemma 3.9.) Let R be a commutative ring and N ⊆ M R-modules with N finitely generated and M finitely presented, so that M/N is finitely presented and Fitt_R(M/N) is defined. Prove that for every r ≥ 1, Fitt_R(M/N) annihilates the cokernel of ⋀^r_R N → ⋀^r_R M. *Needs:* `compound`, the determinant control of the image of ⋀^r (§6.4), the initial Fitting ideal (§4.5).

### Examples

- O a domain, G of prime order p with p not a unit in O: R_Ĝ ≅ O[G] contains no coordinate idempotent δ_ψ of ∏_{Ĝ} O, so it is a proper suborder; and for G = ⟨g, h⟩ with Ψ = {1, ψ_1, ψ_2} as in §6.1, R_Ψ/(ζ − 1) has a two-dimensional socle, the witness that character group rings need not be Gorenstein (`charGroupRing_not_gorenstein`).
- Ψ = {ψ} with ψ(τ) = ζ a primitive cube root of unity: τ − ζ ∈ ker α_Ψ but τ^{−1} − ζ ∉ ker α_Ψ, so # is an isomorphism R_Ψ → R_{Ψ^#} and not an endomorphism of R_Ψ.
- The presentation R² → R, (a, b) ↦ a, of the zero module has transpose S ≠ 0: the transpose belongs to the presentation.
- Over R = ℤ_p × ℤ_p the presentation ℤ_p × 0 ↪ R ↠ R/(ℤ_p × 0) is not locally quadratic (ranks 1 and 0), and over a Dedekind domain a non-principal ideal gives a locally quadratic presentation of rank 1 of a module that is not quadratically presented.
- C_2 of (a b; c d) is (ad − bc); adj_1 of a 3×3 matrix is `Matrix.adjugate` and adj_3 = (1).

### Dependencies

Layer 4 (`charIdempotent`, `charIdempotent_mul`, `sum_charIdempotent` of §4.6; the initial Fitting ideal `TauCeti.fittingIdeal R M 0` of §4.5). Mathlib `HasEnoughRootsOfUnity`, `Monoid.exponent`, `MonoidAlgebra.mapDomainAlgHom`, `CommGroup.card_monoidHom_of_hasEnoughRootsOfUnity`, `CommGroup.exists_apply_ne_one_of_hasEnoughRootsOfUnity`, `AlgHom.rangeRestrict_surjective`, `HopfAlgebra.antipodeAlgHom`, `Module.compHom`, `Module.Dual`, `Module.dualProdDualEquivDual`, `Module.dual_projective`, `Module.dual_finite`, `Module.finitePresentation_of_projective`, `Module.finitePresentation_of_surjective`, `Module.finitePresentation_of_ker`, `Module.rankAtStalk`, `Matrix.adjugate_mul`, `Matrix.det_transpose`, `Matrix.det_fromBlocks_zero₂₁`, `Matrix.det_succ_row`, `Set.powersetCard.compl`, `Module.Basis.exteriorPower`, `exteriorPower.map_surjective`, `exteriorPower.map_comp`, `Module.annihilator`, `lTensor_exact`, `mem_nonZeroDivisors_iff`, `Ring.HasFiniteQuotients`; Tau Ceti `TauCeti.DiagonalizableGroup.point` (with `point_single`, `point_single_one`), `TauCeti.MonoidAlgebra.augmentation`, `TauCeti.subgroupCharSum`, `TauCeti.HopfAlgebra.antipodeAlgEquiv`, `TauCeti.HopfAlgebra.antipode_antipode`, `TauCeti.AuslanderReitenTranspose` (with `mk`, `mk_eq_zero_iff`, `mk_surjective`, `lift`, `lift_mk`, `hom_ext`, `nonempty_linearEquiv_prod_dual`, `nonempty_linearEquiv_prod_of_linearEquiv`), `TauCeti.IsMinimalProjectivePresentation.nonempty_linearEquiv_auslanderReitenTranspose`, `Matrix.pairMinor`, `Matrix.pairMinor_mul`, `TauCeti.fittingIdeal` with `fittingIdeal_eq_minorsIdeal_ker`, `fittingIdeal_eq_minorsIdealOfSet`, `fittingIdeal_congr`, `fittingIdeal_le_of_surjective`, `fittingIdeal_monotone`, `fittingIdeal_eq_top_of_surjective`, `fittingIdeal_quotient_zero`, `fittingIdeal_prod_add_finrank`, `fittingIdeal_eq_bot_of_lt_finrank`, `fittingIdeal_eq_top_iff_finrank_le`, `fittingIdeal_le_iff_lt_finrank`, `fittingIdeal_baseChange`, `fittingIdeal_eq_map` (with Mathlib `IsLocalizedModule.isBaseChange`). The Fitting-ideal carrier is shared with StableReduction layer 1; the compound-matrix algebra lives in the `Matrix` namespace for every consumer of minors.

## Downstream consumers

- The construction of the Kubota–Leopoldt measure and of p-adic L-functions consumes the Mahler–Amice calculus of Layer 2 (φ, ψ, the unit projector and root-of-unity averaging), the pseudo-measures and their evaluation at characters of Layer 3, and the character space with its meromorphic functions of Layer 3a; nothing arithmetic is built here.
- The roadmap proving the Brumer–Stark integrality statements of Dasgupta–Kakde consumes the character group rings, the sharp involution, the contragredient dual and the transpose, the quadratic presentations and the Fitting-ideal identities of Layer 6, together with the Gorenstein and duality statements it must supply itself (Scope and ownership).
- Euler-system and Iwasawa-main-conjecture arguments consume the structure theorem, the characteristic ideals, the invariants μ and λ and the growth formulas of Layer 4, the determinant lines with their rational trivialization and specialization of Layer 5, and topological Nakayama.
- Tau Ceti StableReduction, layer 1, consumes `TauCeti.fittingIdeal` with the identities of §4.5; Tau Ceti AlgebraicVectorBundles, layer 0C, consumes the line-module foundation of §5.1 at the level of rings.

## References

- **RJW** — Joaquín Rodrigues Jacinto and Chris Williams. [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf). Essential Number Theory 4 (2025), no. 1, 101–216. Page numbers are the printed ones.
- **NSW** — Jürgen Neukirch, Alexander Schmidt and Kay Wingberg. Cohomology of Number Fields, second edition, corrected electronic version 2.3 (May 2020), Grundlehren der mathematischen Wissenschaften 323. Statements are cited by their numbers (5.x.y) and printed pages.
- **Dasgupta–Kakde** — Samit Dasgupta and Mahesh Kakde. [On the Brumer–Stark conjecture](https://arxiv.org/pdf/2010.00657v3). arXiv:2010.00657v3 (5 September 2022); page numbers are those of the arXiv PDF.
- **Rowland–Stipulanti–Yassawi** — Eric Rowland, Manon Stipulanti and Reem Yassawi. [An elementary proof of Bridy's theorem](https://arxiv.org/abs/2308.10977v2). arXiv:2308.10977v2 (27 March 2025).
- **Knudsen–Mumford** — Finn F. Knudsen and David Mumford. [The projectivity of the moduli space of stable curves. I: Preliminaries on "det" and "Div"](https://doi.org/10.7146/math.scand.a-11642). Mathematica Scandinavica 39 (1976), 19–55. Page numbers are the printed ones.
- **Stacks** — The Stacks Project authors. [The Stacks Project](https://stacks.math.columbia.edu), Section 15.8, Fitting ideals, [Tag 07Z6](https://stacks.math.columbia.edu/tag/07Z6); and [Tag 0FJI](https://stacks.math.columbia.edu/tag/0FJI), the determinant of a two-term complex and its canonical section.
- **Loeffler** — David Loeffler. Ring structure on nonarchimedean measures, Mathlib file `Mathlib/NumberTheory/Padics/Measure/Monoid.lean` (in the pinned Mathlib `6b7abb3c`): the right-handed convolution `convolveFunRight` and the ring and algebra instances whose shape the convolution statements of Layer 1 follow.
