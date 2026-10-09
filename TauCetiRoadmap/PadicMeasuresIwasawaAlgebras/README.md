# p-adic measures, completed group algebras, and characteristic ideals

This roadmap builds the analytic and algebraic language that Iwasawa theory shares with the theory of p-adic L-functions: bounded measures on profinite spaces and their duals, completed group algebras and the comparison between measures and the Iwasawa algebra, the Mahler–Amice dictionary between measures on ℤ_p and power series with its operator calculus (weighting, translation, dilation, φ, ψ, restriction to residue classes and to the units), pseudo-measures and their evaluation at characters, the Weierstrass theory of O⟦T⟧ and the structure of finitely generated Λ-modules with their characteristic ideals and μ/λ-invariants, determinant lines and specialization, and the ring theory of coefficient orders (character group rings, Fitting ideals, exact duality) that integral Euler-system and Brumer–Stark arguments use. It continues the Tau Ceti roadmap ProfiniteProPGroups, whose layer 9 builds `completedGroupAlgebra p Γ`; everything here is stated on that carrier and on Mathlib's `AbstractMeasure`, `PowerSeries` and localization carriers.

The mathematical statements below are targets for formalisation. Every definition comes with the API it needs and with unit tests that a plausible wrong definition fails; every theorem carries its exact hypotheses, its source, and the earlier targets or library declarations it rests on. All new declarations live under the `TauCeti.` prefix; the namespaces named in each section are the proposed ones. The companion [Suggested.lean](Suggested.lean) proposes signatures and examples; it is not the roadmap and not exhaustive, and this document is definitive.

## Scope and shared foundations

| Input and owner | Interface used here |
| --- | --- |
| Mathlib measures | `AbstractMeasure`, written D(X,R): the continuous R-linear dual of C(X,R) for compact X and a normed commutative ring R, with `map`, `dirac`, `toCLMEquiv`, `amiceTransform`, `coeff_amiceTransform`, `WeakTopology`, `StrongTopology`, and the Mahler basis `mahler`, `PadicInt.mahlerEquiv`, `PadicInt.hasSum_mahler`. The operator calculus is built on this carrier. |
| Mathlib power series and polynomials | `PowerSeries` with `coeff`, `map`, `expand`, `subst`, `derivative`, `WithPiTopology`, `exists_isWeierstrassFactorization` and `IsWeierstrassFactorization.unique`, `Polynomial`, `MvPowerSeries`. The Mahler derivation, φ, ψ, residue averaging and the cyclotomic polynomials ω_n, ξ_n are defined on these. |
| Mathlib algebra, p-adics and topology | `MonoidAlgebra` with its Hopf structure, `LocalizedModule`, `IsFractionRing` (no domain hypothesis), `Module.length`, `PrimeSpectrum`, `IsRegularLocalRing`, `UniqueFactorizationMonoid`, `IsDiscreteValuationRing`, `Module.FinitePresentation`, `Matrix.adjugate`, `exteriorPower`, `HasEnoughRootsOfUnity`; `PadicInt`, `PadicInt.toZModPow`, `ZMod.unitsMap`, `LocallyConstant`, `WeakDual`, `DenseRange.equalizer`, `Topology.IsClosedEmbedding`. |
| Tau Ceti modules | `TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean` (`TauCeti.unitFiltration` and its open neighbourhood basis); `TauCeti/Topology/Algebra/Group/LocallyConstant.lean` (`TauCeti.rightTranslationStabilizer`: locally constant functions on a compact group are uniformly locally constant); `TauCeti.subgroupCharSum`, `TauCeti.MonoidAlgebra.augmentation`, `TauCeti.HopfAlgebra.antipodeAlgEquiv`, `TauCeti.DiagonalizableGroup.point`, `Representation.ofLinearCharacter`; `Matrix.pairMinor`, `exteriorPower.map_top_eq_det_smul`; `TauCeti.AuslanderReitenTranspose`. |
| Tau Ceti **ProfiniteProPGroups**, layer 9 (section "The completed group algebra of the orientation image") | `completedGroupAlgebra p Γ = lim_U ℤ_p[Γ/U]` over the open normal subgroups, a compact topological ℤ_p-algebra with `of`, `proj` (surjective; with separatedness this is the inverse-limit description), `map`, `completedGroupAlgebra_mul_comm` for abelian Γ, the procyclic coordinate `powerSeriesCoordinate` : ℤ_p⟦T⟧ ≅ `completedGroupAlgebra p Γ` for Γ ≅ ℤ_p (T ↦ γ − 1, `powerSeriesCoordinate_X`, `powerSeriesCoordinate_filtration`, generator change T ↦ (1 + T)^u − 1), `powerSeriesEval`, `powerSeries_sub_C_dvd_iff`, the dyadic coordinate `dyadicCoordinate`, and `IsCompactModule` with `TauCeti.exists_forall_map_succ_eq_and_forall_eq_of_surjective` (`TauCeti.Topology.Compactness.InverseSystem`). L1 identifies integral measures with this carrier (L1/measure-completed-algebra-equiv); L4 extends the coordinate to O-coefficients (L4/iwasawa-coordinate); L5 uses the compact-module exactness. |
| Tau Ceti **StableReduction**, layer 1 | Develops Fitting ideals of finitely presented quasi-coherent modules only as far as the relative singular subscheme Sing(f) needs them, with no ring-level interface stated. The initial Fitting ideal of a finitely presented module over a commutative ring, with presentation independence and base change, is therefore a target here (L4/initial-fitting-ideal), shared with that roadmap; L4 compares it with the characteristic ideal and L6 builds the higher Fitting ideals, quadratic presentations and transposes on it. |
| Tau Ceti library (a91d3aaf) | Used as carriers where named: `TauCeti.completedGroupAlgebra R Γ` for any commutative ring R (`Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean`: `proj`, `of`, `mk`, `lift`, `ext`, `of_injective`, `isClosedEmbedding_of`, the inverse-limit topology, compactness, `isMulCommutative_iff`; `Map.lean`, `Prod.lean` R⟦C × Γ⟧ ≅ R⟦Γ⟧[C], `Discrete.lean`, `PowerSeries.lean` `powerSeriesCoordinate` : ℤ_p⟦X⟧ ≃ₐ ℤ_p⟦Γ⟧ for procyclic pro-p Γ, `Filtration.lean` the kernels of the finite levels, `ProductCoordinate.lean`, `DyadicCoordinate.lean`, `CharacterDivision.lean`); `TauCeti.IsCompactModule` (`Topology/Algebra/Module/Compact.lean`); `TauCeti.fittingIdeal R M k` for every k on a finite module (`RingTheory/FittingIdeal/Basic.lean`: `fittingIdeal_eq_minorsIdeal_ker`, `fittingIdeal_monotone`, `fittingIdeal_congr`, `fittingIdeal_quotient_zero`, `fittingIdeal_eq_top_iff_finrank_le`, `fittingIdeal_eq_bot_of_lt_finrank`, `fittingIdeal_prod_add_finrank`; `BaseChange.lean`: `fittingIdeal_baseChange`; `Generators.lean`); `PadicInt.unitsToZModPow` (`NumberTheory/Padics/RingHoms.lean`). [Suggested.lean](Suggested.lean) is pinned at f790474, where none of these exists, and prototypes them by stand-ins named in its comments. |
| Already in the libraries (removed from this roadmap) | L1/right-convolution-function, L1/convolution-product, L1/convolution-algebra and L1/dirac-hom: Mathlib `AbstractMeasure.convolveFunRight`, the `Mul`, `One`, `Ring`, `Algebra` and `CommRing` instances on `D(G,R)` with `mul_def`, `mul_apply`, `dirac_mul_dirac`, `one_def`, `one_apply`, `diracHom` and `diracHom_apply` (`Mathlib.NumberTheory.Padics.Measure.Monoid`). L1/local-field-integers-comparison: Tau Ceti `Padic.integerRing_eq_subring` (`TauCeti.NumberTheory.LocalField.Padic`). The kernel lemmas of L1/unit-reduction: `TauCeti.mem_unitsPrincipal_iff`, `isOpen_unitsPrincipal`, `hasBasis_nhds_one_unitsPrincipal` (`TauCeti.NumberTheory.Padics.PrincipalUnits`). The stand-ins that Suggested.lean carried for `completedGroupAlgebra`, `fittingIdeal` and `unitsToZModPow` are replaced by the library declarations `TauCeti.completedGroupAlgebra R Γ`, `TauCeti.fittingIdeal R M k` and `PadicInt.unitsToZModPow n`. L4/reflexive-torsion-free: Mathlib `Module.IsReflexive.to_isTorsionFree`. L5/compact-limit-exact: Tau Ceti `TauCeti.exists_forall_map_succ_eq_and_forall_eq_of_surjective` (`TauCeti.Topology.Compactness.InverseSystem`). L6/transpose-stable-equivalence: Tau Ceti `TauCeti.AuslanderReitenTranspose.nonempty_linearEquiv_prod_dual` (`TauCeti.Algebra.Module.AuslanderReiten.StableTranspose`). |

Boundaries. This roadmap owns bounded measures and their operator calculus, completed group algebras and the measure comparison, pseudo-measures, the Λ-module theory and the coefficient-order algebra. It does not construct any p-adic L-function (no Bernoulli, Eisenstein or zeta arithmetic, no Kubota–Leopoldt measure), no Coleman norm or trace operator and no Coleman map, no locally analytic distributions beyond the bounded theory, no Galois cohomology, Selmer group or main conjecture, no Euler- or Kolyvagin-system contraction, and no eigenvariety. Those subjects consume the targets here through the interfaces named in each layer. The profinite integers ẑ, their units and the assembly of characters into ẑˣ belong to the Tau Ceti roadmap ProfiniteArithmetic (layer 0), and restricted products, adeles and Tamagawa measures to RestrictedProducts; neither is restated here, and no target of this roadmap is stated by either.

## Conventions

Write p for the prime, including p = 2 unless a target says otherwise; ℤ_p for `PadicInt`, k = 𝔽_p for `ZMod p`; O for the valuation ring of a finite extension K of ℚ_p, ϖ for a uniformizer, and 𝔽 for the residue field. D(X,R) is Mathlib's `AbstractMeasure` on a compact space X with coefficients in a normed commutative ring R; it carries two topologies, the weak topology of pointwise convergence on test functions and the operator-norm (strong) topology, and the two are never identified: integral measures are compact for the weak topology, while a field-valued unit ball on an infinite domain is not norm compact. Clopen restriction, extension by zero, pushforward and convolution are operators on D(X,R); none introduces a second measure carrier. Convolution is right-handed and written μ ⋆ ν; on a profinite abelian monoid it is commutative.

The Amice transform A_μ ∈ ℤ_p⟦T⟧ of a measure μ on ℤ_p has n-th coefficient μ(x ↦ binom(x,n)); Y = 1 + T, so that δ_a ↦ Y^a. The operators on power series are: the Mahler derivation ∂ = (1+T)·d/dT (multiplication of the measure by x), translation (multiplication by the character x ↦ ζ^x or by Y^a), dilation (pushforward along x ↦ ax), φ(F)(T) = F((1+T)^p − 1) (pushforward along multiplication by p), ψ with ψ∘φ = id and φ∘ψ = restriction to pℤ_p, and 1 − φψ = restriction to the units. Root-of-unity averages require the stated coefficient extension and descent hypotheses. The inclusion of measures on ℤ_pˣ into measures on ℤ_p is linear and not multiplicative for the two convolutions.

The completed group algebra of a profinite group over an adic coefficient ring carries the joint topology of coefficient-ideal powers and open normal subgroups. For a procyclic Γ with coordinate T = γ − 1, the kernel of the projection to level n is generated by ω_n = (1+T)^{p^n} − 1, not by a power of T. At p = 2 the units are {±1} × (1 + 4ℤ_2) and the integral theory keeps the order-two group-ring factor; no integral division by 2 occurs.

Pseudo-measures on a commutative completed group algebra R are the elements λ of the localization at the non-zero-divisors with ([g] − 1)λ ∈ R for every g. A character is evaluated on a pseudo-measure only after clearing a denominator [g] − 1 whose image under the character is a unit; there is no character map on the whole total quotient ring.

Λ = O⟦T⟧ with O a complete discrete valuation ring with finite residue field. Finitely generated Λ-modules carry an explicit Λ-action. Pseudo-null means finitely generated with zero localization at every prime of height at most one; for Λ it means finite. Pseudo-isomorphism is a map with pseudo-null kernel and cokernel; it is symmetric on finitely generated torsion modules and is not asserted to be an equivalence relation in general. The characteristic divisor of a finite torsion module is the finitely supported function on height-one primes giving the local lengths; the characteristic ideal is the corresponding product of primes, principal when the ring is factorial. μ is the length of the ϖ-primary part, F_{M,γ} the distinguished polynomial of the horizontal factors and λ its degree; the elementary factors are retained as a multiset. A finite Λ-module has characteristic ideal Λ and, in general, a nonunit initial Fitting ideal.

For a finite abelian H of order invertible in O, e_ω = (1/#H)Σ_a ω(a)⁻¹[a] after adjoining the character values; for p-torsion in H nothing is divided by #H. In L6 characters are homomorphisms G →* Oˣ and the Pontryagin dual of a finite module uses the contragredient action.

## How to read the layers

Each layer lists its targets in dependency order, in sections named after the Tau Ceti module proposed for them, with the proposed namespace of the API names in the heading. A section opens with the standing assumptions every target in it uses, its sources (each target's locator unless the target states its own) and its main library inputs. A target's anchor is its identifier; *Uses* names the earlier targets it rests on by identifier (the layer prefix is omitted within a layer). *Supporting lemmas* lists by identifier the intermediate statements of the section, each a target of the layer proved from the targets before it; their statements are the signatures in the corresponding block of [Suggested.lean](Suggested.lean) (in L4–L6 the docstring carries the identifier; in L0–L3 the declaration is the one whose statement the identifier describes). An API item of a target is itself a target of the layer, with identifier `<target>-api-<n>` counting from 0 in the order listed. Nothing here is optional.

The library vocabulary is that of Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. A prerequisite on a Tau Ceti roadmap layer refers to that layer's stated development.

Standing assumptions shared by several layers: p is any prime, including p = 2, and the indices n, m, r range over all natural numbers, including 0. ℤ_p is `PadicInt p`, k = `ZMod p`, Z⟦T⟧ = `PowerSeries ℤ_p`, k⟦T⟧ = `PowerSeries k`, and Y = 1 + T. R is a normed commutative ring unless a target says more. U = ℤ_pˣ has the subspace topology of the units, A_n = (ℤ/p^nℤ)ˣ is finite and discrete (A_0 is the trivial group), red_n : U → A_n is the unit reduction of L1/unit-reduction, π_n(μ) = π_{red_n}(μ) is the finite projection of L1/finite-projection and π_{(r,n)}(μ) its reduction modulo p^r (L1/joint-finite-projection). Products of coordinates carry the product topology, p-adic on ℤ_p and discrete on each ZMod(p^r). M = D(U, ℤ_p). A topology on a measure carrier is never an instance: where one is used it is named, `AbstractMeasure.WeakTopology` or `AbstractMeasure.StrongTopology`. ψ on integral measures is the operator of L2/psi-measure, transported to power series through the Amice transform.

## L0 — Coefficients, continuous functions and duals

On a compact (profinite) space X and a normed commutative coefficient ring R, this layer develops the operators on D(X,R) that every later layer uses: restriction of test functions and measures to a clopen subset, extension by zero, the clopen projectors and the decomposition of a measure over a finite clopen partition, naturality of restriction under pushforward, the weak and strong topologies and their continuity, closed-embedding and contraction properties, the Dirac measures and their separation, and the failure of norm compactness of the unit ball on an infinite domain. Density of locally constant functions is taken from Mathlib (`LocallyConstant`, `ContinuousMap` density on totally disconnected compact spaces) and from Tau Ceti's uniform local constancy on compact groups. The integral lattices, orthonormal bases (RJW Remark 3.4, p. 118) and scalar extensions along isometric embeddings of p-adic fields are consumed by L2 in the ℤ_p-domain, ℚ_p-coefficient case stated there.

Standing assumptions for this layer: X is a compact topological space, s ⊆ X a clopen subset (possibly empty) and R a normed commutative ring; no field, completeness, ultrametricity, Hausdorffness of X or nonemptiness of s is assumed unless a target says so; K is a nontrivially normed field, not assumed complete or ultrametric. C(s,R) carries the subspace topology and supremum norm (s is compact). D(X,R) and D(s,R) are the `AbstractMeasure` carriers, with no topology installed; `WeakTopology` is selected explicitly where used. Write z_s for extension by zero of test functions on s, r_s for the clopen restriction of measures and j_s for pushforward along the inclusion s ↪ X. The norm of a measure is the operator norm of its image under `toCLMEquiv`, and the strong topology is `StrongTopology`; both are used only for field coefficients and neither installs a norm on integral ring-valued measures, whose lattice comparison is a separate target.

### Clopen restriction, extension and decomposition (`AbstractMeasure`, `ContinuousMap`)

Sources: [RJW](#ref-rjw), §3.5.3 and Remark 3.31, p. 127; §3.2, Definitions 3.7–3.8 and Remarks 3.9–3.12, pp. 119–121.

Library inputs: `AbstractMeasure.map_apply`, `ContinuousMap.liftCover_coe`, `LocallyConstant.coe_charFn`.

<a id="L0-clopen-zero-extension"></a>**Extension by zero of clopen test functions.** Define ContinuousMap.zeroExtendClopen s R : C(s,R) →L[R] C(X,R), denoted z_s, by z_s(f)(x)=f(x) on s and 0 off s.

API: `zeroExtendClopen_apply_mem`; `zeroExtendClopen_apply_not_mem`; `norm_zeroExtendClopen`: ‖z_s(f)‖=‖f‖, including s empty; `restrict_zeroExtendClopen`: Restriction of z_s(f) to s is f; `zeroExtendClopen_restrict`: z_s(f|s)=χ_s f, where χ_s is the continuous characteristic function; `AddHomClass.map_add`: Existing inherited API: The continuous linear map preserves addition, zero and R-scalars by its inherited structure.

Tests: For X=Fin 2 with its discrete topology, s={0} and R=ℤ, extension of the constant 7 on s has value 7 at 0. For the same data it has value 0 at 1, rather than 7. Extension of the unique zero test function on the empty clopen is zero.

Supporting lemmas: `clopen-zero-extension-inside`, `clopen-zero-extension-outside`, `clopen-zero-extension-norm`, `clopen-zero-extension-restriction`, `clopen-zero-extension-projector`.

<a id="L0-clopen-restriction"></a>**Measures restricted to a clopen subtype.** Define AbstractMeasure.restrictClopen s R : D(X,R) →ₗ[R] D(s,R), denoted r_s, by r_s(μ)(f)=μ(z_s(f)). Denote by j_s the already AbstractMeasure.map along ContinuousMap.subtypeVal s; it extends a measure on s to X.

API: `restrictClopen_apply`: r_s(μ)(f)=μ(z_s(f)); `restrictClopen_map_subtype`: r_s(j_sν)=ν; `restrictClopen_dirac_mem`; `restrictClopen_dirac_not_mem`; `AddHomClass.map_add`: Existing inherited API: Restriction preserves addition, zero and R-scalars by the inherited linear-map structure; `restrictClopen_map_preimage`: Restriction commutes with pushforward when the source subset is the preimage of the target clopen.

Tests: For X=Fin 2, s={0}, R=ℤ, restricting 2δ₀−3δ₁ gives 2δ₀ on s. For the same data restricting δ₁ gives zero. Every measure restricts to zero on the empty clopen.

Uses: clopen-zero-extension, clopen-zero-extension-inside, clopen-zero-extension-outside.

Supporting lemmas: `clopen-restriction-evaluation`, `clopen-restriction-section`, `clopen-projector-evaluation`.

<a id="L0-clopen-support-characterization"></a>**Supported measures come uniquely from the clopen subtype.** There exists a unique ν∈D(s,R) with j_sν=μ if and only if μ(f)=0 for every f∈C(X,R) vanishing on s. When it exists, ν=r_sμ.

Uses: clopen-projector-evaluation, clopen-restriction-section.

Supporting lemmas: `clopen-complement-decomposition`.

<a id="L0-clopen-decomposition-equivalence"></a>**Measure decomposition over complementary clopens.** Define AbstractMeasure.clopenDecomposition s R : D(X,R) ≃ₗ[R] D(s,R)×D(sᶜ,R) by μ↦(r_sμ,r_(sᶜ)μ), with inverse (ν,η)↦j_sν+j_(sᶜ)η.

API: `clopenDecomposition_apply`: The two components are exactly r_sμ and r_(sᶜ)μ; `clopenDecomposition_symm_apply`: The inverse is the sum of the inclusion pushforwards; `LinearEquiv.injective`: Existing inherited API: Two ambient measures agree if their two restrictions agree, by the inherited linear equivalence; `LinearEquiv.apply_symm_apply`: Existing inherited inverse API: Recombining and restricting recovers both input measures; the opposite round trip recovers the ambient measure.

Tests: For Fin 2, s={0}, R=ℤ, the pair for 2δ₀−3δ₁ is (2δ₀,−3δ₁) on the respective subtypes. Recombining the unit Dirac measures on {0} and {1} gives δ₀+δ₁ on Fin 2. For s=∅ the first component is the zero measure on the empty subtype and the second is μ carried to the subtype sᶜ=X, so the equivalence is the identity up to that transport.

Uses: clopen-complement-decomposition, clopen-restriction-section, clopen-restriction-evaluation, clopen-zero-extension-outside.

Supporting lemmas: `clopen-restriction-pushforward`.

### Weak and strong topologies on measures

Sources: [RJW](#ref-rjw), Definition 3.5 and Definitions 3.7-3.8, p. 119; Remark 3.31, p. 127; Corollary 3.32 and Remark 3.33, p. 129.

Library inputs: `AbstractMeasure.toCLMEquiv`, `AbstractMeasure.WeakTopology`, `ContinuousMap.norm_coe_le_norm`.

Supporting lemmas: `pushforward-weak-continuous`, `clopen-restriction-weak-continuous`.

<a id="L0-clopen-inclusion-weak-closed-embedding"></a>**Weak closed embedding of clopen measures.** Existing inclusion pushforward j_s:D(s,R) to D(X,R) is a closed embedding for the weak topologies. Its range is the already characterized subspace of measures annihilating all tests that vanish on s.

Uses: pushforward-weak-continuous, clopen-restriction-weak-continuous, clopen-restriction-section, clopen-support-characterization.

<a id="L0-clopen-decomposition-weak-homeomorphism"></a>**Weak topological clopen decomposition.** The linear equivalence clopenDecomposition from D(X,R) to D(s,R) times D(complement s,R) is a homeomorphism for the weak topologies and their product topology.

Uses: clopen-decomposition-equivalence, clopen-restriction-weak-continuous, pushforward-weak-continuous.

Supporting lemmas: `pushforward-operator-norm-bound`, `clopen-restriction-operator-norm-bound`, `clopen-inclusion-operator-norm`.

<a id="L0-clopen-inclusion-strong-closed-embedding"></a>**Strong closed embedding of clopen measures.** Existing inclusion j_s:D(s,K) to D(X,K) is a closed embedding for the strong topologies.

Uses: pushforward-operator-norm-bound, clopen-restriction-operator-norm-bound, clopen-restriction-section.

<a id="L0-clopen-decomposition-strong-homeomorphism"></a>**Strong topological clopen decomposition.** The clopenDecomposition is a homeomorphism for the strong topologies and the product topology.

Uses: clopen-decomposition-equivalence, pushforward-operator-norm-bound, clopen-restriction-operator-norm-bound.

Supporting lemmas: `dirac-weak-continuous`, `dirac-operator-norm`, `dirac-difference-operator-norm`.

<a id="L0-measure-unit-ball-not-norm-compact"></a>**Failure of norm compactness of the measure unit ball.** The unit ball {L in the continuous K-linear dual of C(X,K) : norm(L)≤1} is not compact for its operator-norm topology.

Assumptions: X is infinite, compact and totally separated; K is a nontrivially normed ultrametric field. No properness or completeness of K is needed for this negative result.

Uses: dirac-operator-norm, dirac-difference-operator-norm. Sources: [RJW](#ref-rjw), Definitions 3.5 and 3.8, p. 119; Example 3.10, p. 120; Remark 3.28(3), pp. 125–126.

Supporting lemmas: `rational-test-integral-scaling`.

### Local constancy of reduction

Sources: [RJW](#ref-rjw), Lemma 12.13 and its proof, pp. 182–183, for the reduction modulo p of power series; the local constancy of ℤ_p → 𝔽_p itself is Mathlib's `PadicInt.ker_toZMod`.

Library inputs: `PadicInt.norm_lt_one_iff_dvd`, `PadicInt.ker_toZMod`, `PadicInt.maximalIdeal_eq_span_p`.

Supporting lemmas: `residue-map-locally-constant`.

## L0a — Rigid character and weight spaces

The characters of a compact abelian p-adic analytic group with an open subgroup isomorphic to ℤ_p^d form a parameter space on which measures become bounded analytic functions and pseudo-measures become meromorphic functions with a simple pole at the trivial character. This layer fixes that space and its functions at the level of points and bounded functions, on the carriers of L1 and L2; the targets are stated below.

### The character space of ℤ_pˣ and its functions

Standing assumptions: p is prime. For odd p write ℤ_pˣ = μ_{p−1} × (1 + pℤ_p); for p = 2 write ℤ_2ˣ = {±1} × (1 + 4ℤ_2). C_p is Mathlib's `PadicComplex`. Measures and pseudo-measures on ℤ_pˣ are those of L1–L3 on the carrier D(ℤ_pˣ, O) and its localization.

Sources: [RJW](#ref-rjw), Remark 3.47, p. 135, which treats odd p (the decomposition at p = 2 is stated here without a source in this register); Remark 8.3(2) on O⁺(W) and Q(W), pp. 160–161.

<a id="L0a-character-space"></a>**Continuous characters of the units.** Define W(A) = Hom_cts(ℤ_pˣ, Aˣ) for a complete normed ℚ_p-algebra A, with its restriction maps to the torsion part and to the principal units, and the decomposition W(A) ≅ Hom(μ_{p−1}, Aˣ) × Hom_cts(1 + pℤ_p, Aˣ) for odd p, and W(A) ≅ Hom({±1}, Aˣ) × Hom_cts(1 + 4ℤ_2, Aˣ) for p = 2.

API: `W.restrictTorsion`; `W.restrictPrincipal`; `W.equivProd`: the displayed decomposition; `W.eval`: evaluation of a character at a unit; `W.map`: functoriality in A along continuous algebra maps.

Tests: For A = C_p and p odd, the p − 1 characters of μ_{p−1} index the fibres of `W.restrictTorsion`. The character x ↦ x^k lies in W(ℚ_p) for every integer k, and k ≡ k′ mod (p − 1) exactly when x^k and x^{k′} have the same torsion restriction. For p odd and A = ℚ_p, the Teichmüller character ω(x) = lim x^{p^n} has trivial principal restriction and torsion restriction the inclusion μ_{p−1} ⊂ ℚ_pˣ, so `W.equivProd`(ω) = (incl, 1) although ω ≠ 1.

Uses: L1/unit-reduction, `PadicComplex`, `ContinuousMonoidHom`.

<a id="L0a-principal-unit-disc"></a>**Characters of the principal units and the open unit disc.** Evaluation at a topological generator u of 1 + pℤ_p (of 1 + 4ℤ_2 for p = 2) identifies Hom_cts(1 + pℤ_p, Aˣ) with {z ∈ A : |z − 1| < 1} for A = C_p, so that W(C_p) is a disjoint union of p − 1 (two, for p = 2) copies of the open unit disc, indexed by the characters of the torsion part.

Assumptions: A = C_p; u a topological generator of the principal units; the inverse sends z to the character u^a ↦ z^a extended by continuity, which requires |z − 1| < 1.

Uses: L0a/character-space, L3/one-add-prime-unit, L3/one-add-prime-positive-powers, `PadicInt.hasSum_mahler`. Sources: [RJW](#ref-rjw), Remark 3.47, p. 135.

<a id="L0a-bounded-functions"></a>**Measures as bounded functions on the character space.** For a measure μ on ℤ_pˣ with O-coefficients, define F_μ : W(C_p) → C_p by F_μ(χ) = ∫ χ dμ. Then F_μ is bounded by the norm of μ, F_{μ⋆ν} = F_μ·F_ν for the multiplicative convolution, F_{δ_a}(χ) = χ(a), and μ ↦ F_μ is injective; on each disc of L0a/principal-unit-disc, F_μ is the evaluation of the Amice transform of the corresponding residue component, so it is a bounded analytic function of the disc coordinate.

Assumptions: μ ∈ D(ℤ_pˣ, O); the integral of a C_p-valued character against an O-valued measure is the scalar extension of L2.

API: `W.measureFun`; `W.measureFun_conv`; `W.measureFun_dirac`; `W.measureFun_injective`; `W.measureFun_eq_amice_eval`: the identification with the Amice transform on each disc.

Tests: F_{δ_a}(x ↦ x^k) = a^k, so F_{δ_1} = 1 and F_{δ_a ⋆ δ_b}(x ↦ x^k) = (ab)^k = F_{δ_a}(x ↦ x^k)·F_{δ_b}(x ↦ x^k), while F_{δ_a + δ_b}(x ↦ x) = a + b, which distinguishes the convolution rule from the sum. For a ≠ b in ℤ_pˣ, F_{δ_a − δ_b} vanishes at the trivial character but takes the value a − b ≠ 0 at x ↦ x, so a measure of total mass zero need not have F_μ = 0. The bound |F_μ(χ)| ≤ ‖μ‖ is attained by μ = δ_a: ‖δ_a‖ = 1 and |χ(a)| = 1 for every χ ∈ W(C_p), since χ(a)^{(p−1)p^n} → 1.

Uses: L0a/character-space, L0a/principal-unit-disc, L2/amice-dirac-natural, L2/series-unit-restriction, L3/actual-unit-character-evaluation. Sources: [RJW](#ref-rjw), Remark 3.47, p. 135; Remark 8.3(2), pp. 160–161.

<a id="L0a-meromorphic-functions"></a>**Pseudo-measures as functions with a simple pole at the trivial character.** For a pseudo-measure λ = μ/([a] − [1]) on ℤ_pˣ (a a topological generator of the principal units, μ a measure), F_λ(χ) = F_μ(χ)/(χ(a) − 1) is defined on every nontrivial character, independent of the presentation, and the only possible pole is at the trivial character, where χ(a) − 1 vanishes.

Assumptions: p odd, or p = 2 with the factor {±1} handled through the two torsion components; χ nontrivial.

Uses: L0a/bounded-functions, L3/admissible-evaluation, L3/independence-of-clearing-factor. Sources: [RJW](#ref-rjw), Remark 3.47, p. 135; Remark 8.3(2), pp. 160–161.

<a id="L0a-universal-character"></a>**The universal character and the generic fibre.** For Γ ≅ ℤ_p with completed group algebra Λ = `completedGroupAlgebra p Γ` ≅ ℤ_p⟦T⟧, the universal character is the group homomorphism Γ → Λˣ, γ ↦ 1 + T. Every continuous character χ : Γ → Aˣ with |χ(γ) − 1| < 1 is the composite of the universal character with the continuous ℤ_p-algebra map Λ → A sending T to χ(γ) − 1, uniquely; conversely every such algebra map arises. The rigid-analytic structure on the character space, the generic fibre of the formal spectrum of Λ, is built by its consumers on this universal property; this roadmap states the universal property and its extension to G = H × ℤ_p^d, componentwise over the characters of H and coordinatewise in d.

Assumptions: A a complete normed ℚ_p-algebra or a complete O-algebra with its adic topology; the algebra map is the evaluation of power series at an element of norm less than one (`PowerSeries.subst` with the convergence hypothesis).

Tests: For Γ = ℤ_p with generator γ, the universal character sends γ^n to (1+T)^n for n ∈ ℕ, whose coefficient of T is n, and sends γ^{−1} to (1+T)^{−1} = Σ_k (−T)^k, not to 1 − T. The trivial character corresponds to the algebra map T ↦ 0, the augmentation Λ → ℤ_p, and the character γ ↦ 1 + p into A = ℚ_p to T ↦ p, under which γ^n ↦ (1+p)^n. No continuous ℤ_p-algebra map Λ → ℚ_p sends T to p − 1, since T^k → 0 in Λ while (p − 1)^k does not tend to 0 in ℚ_p; accordingly n ↦ p^n is not the restriction to ℤ of a continuous character of ℤ_p, so the hypothesis |χ(γ) − 1| < 1 is not redundant.

Uses: L1/measure-completed-algebra-equiv, L2/amice-dirac-natural, L2/field-amice-range, Tau Ceti `completedGroupAlgebra.of`, Tau Ceti `completedGroupAlgebra.powerSeriesCoordinate`. Sources: [RJW](#ref-rjw), Proposition 3.16, pp. 121–122, and Theorem 3.25, p. 124, which give the identification of measures with Λ and with ℤ_p⟦T⟧ that the universal property restates.

## L1 — Completed group rings and convolution

For a profinite monoid or group G, this layer builds the finite projections of a measure (its coefficients on a finite quotient), the joint coefficient-and-level coordinates, convolution of measures by iterated integration with its algebra structure and its finite Dirac expansion, multiplicativity of the finite projections, and the concrete finite quotients of ℤ_pˣ with their coordinates. The layer ends with its endpoint: the comparison of integral measures on a profinite group Γ with `completedGroupAlgebra p Γ` of Tau Ceti ProfiniteProPGroups, layer 9, as topological ℤ_p-algebras, built directly from the compatible families of finite coefficients.

Standing assumptions for this layer: X is a topological space and R a topological commutative ring, with no field, nonzero, norm or completeness hypothesis for the algebraic constructions; the separation statements add theirs (X compact Hausdorff totally disconnected, R normed). Finite coefficients live in A →₀ R, with no multiplication or topology. A and B are finite discrete spaces (monoids where a product is used); q : X → A is continuous, not necessarily surjective; e_{(q,a)} is the characteristic function of q⁻¹{a}; π_q is the finite projection and Π_q(μ) = `MonoidAlgebra.ofCoeff` (π_q(μ)) (`MonoidAlgebra` is a structure with a coefficient field, not the Finsupp type). For the joint coordinates R = ℤ_p, ρ_r : ℤ_p → ZMod(p^r) is `PadicInt.toZModPow`, and r is any natural number: at r = 0 the coefficient ring is the zero ring. G and H are locally compact topological monoids with continuous multiplication; D(G,R) is `AbstractMeasure G R R`; convolution is the right-handed product (μ∗ν)(f) = μ(x ↦ ν(y ↦ f(xy))), built from `prodMk′`, with unit δ_1, the factors in the order xy also for noncommutative G. For the units: U = ℤ_pˣ, A_n = (ℤ/p^nℤ)ˣ, red_n : U → A_n is the homomorphism on units induced by ρ_n, t_{(m,n)} : A_n → A_m for m ≤ n is `ZMod.unitsMap`, the group depth n and the coefficient precision r are independent, and a compatible family is a family c_n : A_n →₀ ℤ_p with (t_{(m,n)})_* c_n = c_m, the pushforward being `Finsupp.mapDomain`, which sums the coefficients over each fibre. M = D(U, ℤ_p), with `WeakTopology` wherever a topology on it is used.

### Finite coefficients and joint coordinates (`AbstractMeasure`)

Sources: [RJW](#ref-rjw), §3.2–3.3, Propositions 3.15–3.16, Definition 3.17 and Example 3.19; pp. 119–123.

Library inputs: `ContinuousMap.equivFnOfDiscrete`, `Finsupp.linearEquivFunOnFinite`, `AbstractMeasure.dirac_apply`.

<a id="L1-finite-projection"></a>**Finite coefficients of a measure.** Construct the R-linear map π_q:D(X,R)→(A→₀R) with π_q(μ)(a)=μ(e_(q,a)).

API: `finiteProjection_zero`; `finiteProjection_add`: π_q(μ+ν)=π_q(μ)+π_q(ν); `finiteProjection_smul`: π_q(cμ)=cπ_q(μ) for c∈R.

Tests: On Fin2 with R=Z, π_id(δ_0) is the finitely supported atom at 0 with coefficient 1. For Fin2→Fin1 constant, R=Z and μ=2δ_0+3δ_1, its unique projected coefficient is 5, not an average. For q:Fin1→Fin2 constant0, π_q(δ_0) has coefficient 0 at 1.

Supporting lemmas: `finite-projection-coefficient`, `finite-projection-pairing`, `finite-projection-dirac`, `finite-projection-refinement`, `finite-projection-mass`, `finite-discrete-reconstruction`.

<a id="L1-finite-discrete-coefficient-bijection"></a>**Measures on a finite discrete space.** The linear map π_id:D(A,R)→(A→₀R) is bijective. Its inverse sends c to Σ_a c(a)δ_a.

Uses: finite-discrete-reconstruction, finite-projection-dirac.

Supporting lemmas: `finite-projection-weak-continuity`.

<a id="L1-finite-projections-separate"></a>**Finite coefficients determine a measure.** If π_q(μ)=π_q(ν) for every n≥0 and every continuous q:X→Fin n, then μ=ν.

Assumptions: For this separation assertion X is compact Hausdorff and totally disconnected, and R is a normed commutative ring.

Uses: finite-projection-pairing.

<a id="L1-joint-finite-projection"></a>**Joint finite and coefficient projections.** Construct the additive map π_(r,q):D(X,Z_p)→(A→₀ZMod(p^r)) by applying ρ_r to each coefficient of π_q.

API: `jointFiniteProjection_zero`; `jointFiniteProjection_add`: π_(r,q)(μ+ν)=π_(r,q)(μ)+π_(r,q)(ν); `jointFiniteProjection_zero_precision`.

Tests: At p=2,r=2 on Fin1, π_(2,id)(δ_0) is the atom with coefficient 1 in ZMod 4. At p=2,r=0, π_(0,id)(δ_0)=0. At p=2 on Fin1, 2δ_0 projects to 0 modulo 2 but to the nonzero coefficient 2 modulo 4.

Uses: finite-projection.

Supporting lemmas: `joint-finite-coefficient`, `joint-finite-precision`, `joint-finite-refinement`, `joint-finite-dirac`.

<a id="L1-joint-finite-separation"></a>**Joint coordinates determine an integral measure.** If π_(r,q)(μ)=π_(r,q)(ν) for all r,n≥0 and continuous q:X→Fin n, then μ=ν.

Assumptions: X is compact Hausdorff and totally disconnected.

Uses: joint-finite-coefficient, finite-projections-separate.

### Convolution and the finite measure algebras (`AbstractMeasure`)

Sources: [RJW](#ref-rjw), §3.3, Propositions 3.15–3.16, Remark 3.18 and Example 3.19, pp. 121–123; [Loeffler](#ref-loeffler), Measure/Monoid.lean: convolveFunRight, right-handed product, ring/algebra and commutative instances.

Library inputs: `AbstractMeasure.prodMk'`, `AbstractMeasure.map_apply`, `AbstractMeasure.map`.

<a id="L1-right-convolution-function"></a>**Convolving a function on the right** (removed). `AbstractMeasure.convolveFunRight` with `convolveFunRight_apply`, `convolveFunRight_dirac_apply`, `convolveFunRight_apply_one` and `convolveFunRight_one` is Mathlib (`Mathlib.NumberTheory.Padics.Measure.Monoid`); see the removed-targets row of the table above.

<a id="L1-convolution-product"></a>**Convolution of measures** (removed). The product `μ * ν = map (mul) (μ.prodMk' ν)` with `mul_def`, `mul_apply`, `dirac_mul_dirac` and `convolveFunRight_mul` is Mathlib (`Mathlib.NumberTheory.Padics.Measure.Monoid`).

<a id="L1-convolution-algebra"></a>**The algebra of measures** (removed). The `Ring` and `Algebra R` instances on `D(G,R)` with `one_def` and `one_apply`, and the `CommRing` instance for commutative `G` (the supporting lemma `commutative-convolution`), are Mathlib (`Mathlib.NumberTheory.Padics.Measure.Monoid`); `algebraMap_apply`, `convolution-pushforward`, `convolution-total-mass` and the finite-projection lemmas stay as stated in Suggested.lean.

<a id="L1-finite-projection-algebra-map"></a>**Finite algebra projections of measures.** Bundle Π_q as an R-algebra homomorphism D(G,R)→MonoidAlgebra R A.

API: `finiteProjectionAlgHom_apply`: The underlying element is ofCoeff(π_q(μ)); `finiteProjectionAlgHom_coeff`: The coefficient at a is π_q(μ)(a); `finiteProjectionAlgHom_dirac`.

Tests: For q=id on G=ℤ/2 over ℤ with g≠1, the image of 2δ_1+3δ_g is single(1,2)+single(g,3), with each coefficient at its own group element. The image of δ_x∗δ_y is single(q(x)q(y),1). For the constant homomorphism from a finite group to the trivial group over Z, the image of 2δ_x+3δ_y is single(1,5), with no averaging.

Uses: convolution-algebra, finite-projection, finite-convolution-multiplicativity, finite-projection-dirac.

<a id="L1-finite-discrete-algebra-equivalence"></a>**The finite measure algebra.** For finite discrete A, Π_id is an R-algebra equivalence D(A,R)≃MonoidAlgebra R A; its inverse is c↦Σ_a c.coeff(a)δ_a.

API: `finiteProjectionAlgEquiv_apply`: The forward map is finiteProjectionAlgHom(id); `finiteProjectionAlgEquiv_symm_apply`; `finiteProjectionAlgEquiv_symm_single`.

Tests: The equivalence sends δ_a to single(a,1). The inverse of single(a,2)+single(b,3) with a≠b is 2δ_a+3δ_b, which evaluates the constant function 1 to 5. The inverse of single(a,r)single(b,s) is (rs)δ_(ab).

Uses: finite-projection-algebra-map, finite-discrete-coefficient-bijection, finite-discrete-reconstruction.

<a id="L1-joint-projection-ring-map"></a>**Finite-precision algebra coordinates.** Bundle μ↦ofCoeff(π_(r,q)(μ)) as a unital ring homomorphism D(G,Z_p)→MonoidAlgebra (ZMod(p^r)) A.

Assumptions: Here R=Z_p and p is prime; r≥0.

API: `jointFiniteProjectionRingHom_apply`: The underlying element is ofCoeff(π_(r,q)(μ)); `jointFiniteProjectionRingHom_dirac`; `jointFiniteProjectionRingHom_zero_precision`.

Tests: At p=3,r=1 and q=id on G=ℤ/2 with g≠1, 3δ_g maps to zero while δ_g maps to single(g,1) over ZMod3. At p=2,r=0 the identity measure maps to zero. At p=2,r=3, the image of (2δ_1)∗(3δ_1) is single(1,6) over ZMod8.

Uses: finite-projection-algebra-map, joint-finite-coefficient.

### Finite quotients of the p-adic units (`PadicInt`)

Sources: [RJW](#ref-rjw), Definitions 3.7–3.8 and Remarks 3.11–3.12, pp. 119–121; Proposition 3.16 and its full proof, pp. 121–122; Tau Ceti `TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean`.

Library inputs: `ZMod.unitsMap`, `Continuous.units_map`, `PadicInt.toZModPow`.

<a id="L1-unit-reduction"></a>**Reduction of p-adic units.** Construct red_n:U→A_n by applying the units functor to the ring reduction ℤ_p→ℤ/p^nℤ. The underlying residue is exactly the reduction of the underlying p-adic integer. This map is `PadicInt.unitsToZModPow` of Tau Ceti a91d3aaf (`NumberTheory/Padics/RingHoms.lean`, a continuous monoid homomorphism with `coe_unitsToZModPow_apply`); the target is its API and tests below on that declaration.

API: `unitToZModPow_val`: The underlying residue of red_n(u) is the ring reduction of u; `unitToZModPow_one`; `unitToZModPow_mul`; `unitToZModPow_zero`.

Tests: At p=3,n=2, red_2(2) is the unit 2 of ℤ/9 and red_2(−1) is the unit 8. At p=2,n=0 every unit reduces to1. At p=2,n=1, −1 and1 have equal reductions.

Supporting lemmas: `unit-reduction-refinement`, `integer-reduction-norm`. Already in the libraries: `unit-reduction-surjective` is `PadicInt.surjective_units_map_toZModPow`, `integer-reduction-continuity` is `PadicInt.continuous_toZModPow`, `unit-reduction-continuity` is `(PadicInt.unitsToZModPow n).continuous` (`TauCeti.NumberTheory.Padics.RingHoms`); ker(red_n) is `TauCeti.unitsPrincipal p n` with `unit-reduction-kernel` = `TauCeti.mem_unitsPrincipal_iff`, `unit-reduction-kernel-open` = `TauCeti.isOpen_unitsPrincipal` and `unit-reduction-kernel-basis` = `TauCeti.hasBasis_nhds_one_unitsPrincipal` (`TauCeti.NumberTheory.Padics.PrincipalUnits`).

<a id="L1-local-field-integers-comparison"></a>**The local-field integer subring of Q_p** (removed). `𝒪[ℚ_p] = PadicInt.subring p` is Tau Ceti `Padic.integerRing_eq_subring` (`TauCeti.NumberTheory.LocalField.Padic`), with `Padic.integerRingEquiv`.

<a id="L1-unit-reduction-filtration"></a>**Unit reductions and the local-field filtration.** Let j:U→ℚ_pˣ be the units map of the integer inclusion. Then ker(red_n) is the pullback along j of the subgroup TauCeti.unitFiltration(ℚ_p,n), for every n≥0.

Uses: unit-reduction-kernel, local-field-integers-comparison.

Supporting lemmas: `unit-reduction-kernel-open`, `unit-reduction-kernel-basis`.

<a id="L1-unit-reduction-cofinality"></a>**Cofinality of unit congruence kernels.** Every open subgroup H of U contains ker(red_n) for some n≥0.

Uses: unit-reduction-kernel-basis.

Supporting lemmas: `unit-reduction-separation`.

<a id="L1-unit-reduction-quotient"></a>**The modular-unit quotient.** Construct e_n:U/ker(red_n)≃A_n as the group isomorphism induced by the surjective red_n. It sends the class of u to red_n(u).

API: `unitToZModPowQuotient_mk`; `unitToZModPowQuotient_symm_apply`; `unitToZModPowQuotient_eq_native`: e_n is exactly quotientKerEquivOfSurjective applied to red_n and its surjectivity.

Tests: At p=3,n=0 every represented class maps to1. At p=3,n=2 the represented class of 2 maps to the unit 2 of ℤ/9, and e_2⁻¹(2) is the class of 2, which also contains 11. At p=2,n=2, the represented classes of −1 and1 have different images.

Uses: unit-reduction, unit-reduction-surjective.

<a id="L1-unit-reduction-discrete-factorization"></a>**Discrete homomorphisms factor through a unit quotient.** For every discrete topological group A and continuous homomorphism q:U→A, there exist n and a homomorphism t:A_n→A such that t∘red_n=q.

Assumptions: A is a group with a discrete topology; q is a continuous group homomorphism.

Uses: unit-reduction-cofinality, unit-reduction-quotient.

Supporting lemmas: `unit-reduction-factor-uniqueness`, `unit-test-factor-criterion`.

<a id="L1-unit-locally-constant-factor"></a>**Descent of locally constant unit tests.** Every locally constant f:U→A, with A any set, factors as g∘red_n for some n and g:A_n→A.

Assumptions: A is any type and f:U→A is locally constant.

Uses: unit-test-factor-criterion, unit-reduction-cofinality. Sources: [RJW](#ref-rjw), Definitions 3.7–3.8 and Remarks 3.11–3.12, pp. 119–121; Proposition 3.16 and its complete proof, pp. 121–122; Tau Ceti `TauCeti/Topology/Algebra/Group/LocallyConstant.lean`.

Supporting lemmas: `unit-locally-constant-characterization`, `unit-test-factor-uniqueness`, `unit-test-factor-refinement`, `unit-continuous-discrete-factor`, `unit-test-zero-factor`, `unit-cylinder-density`.

<a id="L1-unit-measure-separation"></a>**Unit coordinates determine a measure.** For any normed commutative ring R, two R-valued measures μ,ν on U are equal if π_(red_n)(μ)=π_(red_n)(ν) for every n.

Assumptions: R is a normed commutative ring; measures mean AbstractMeasure U R R. No completeness or nonarchimedean assumption on R is needed.

Uses: unit-cylinder-density, finite-projection-pairing, unit-reduction-continuity. Sources: [RJW](#ref-rjw), Definitions 3.7–3.8 and Remarks 3.11–3.12, pp. 119–121; Proposition 3.16 and its complete proof, pp. 121–122; Tau Ceti `TauCeti/Topology/Algebra/Group/LocallyConstant.lean`.

<a id="L1-unit-joint-measure-separation"></a>**Joint unit coordinates determine an integral measure.** Two ℤ_p-valued measures on U are equal if their joint finite coordinates at every coefficient precision r and group depth n are equal.

Uses: unit-measure-separation, joint-finite-coefficient. Sources: [RJW](#ref-rjw), Definitions 3.7–3.8 and Remarks 3.11–3.12, pp. 119–121; Proposition 3.16 and its complete proof, pp. 121–122; Tau Ceti `TauCeti/Topology/Algebra/Group/LocallyConstant.lean`.

<a id="L1-unit-diagonal-measure-separation"></a>**Diagonal unit coordinates determine an integral measure.** It suffices to compare, for every n, the joint coordinate with coefficient precision n and unit-group depth n.

Uses: unit-joint-measure-separation, joint-finite-precision, joint-finite-refinement, unit-reduction-refinement. Sources: [RJW](#ref-rjw), Definitions 3.7–3.8 and Remarks 3.11–3.12, pp. 119–121; Proposition 3.16 and its complete proof, pp. 121–122; Tau Ceti `TauCeti/Topology/Algebra/Group/LocallyConstant.lean`.

### Coordinates of unit measures (`AbstractMeasure`)

Sources: [RJW](#ref-rjw), Remark 3.11 and Proposition 3.16 with its full proof and inverse construction, pp. 120–122.

Library inputs: `ZMod.unitsMap`, `IsLocallyConstant.of_discrete`, `IsLocallyConstant.comp_continuous`.

Supporting lemmas: `unit-coordinate-pairing-refinement`, `unit-coordinate-pairing-independent`.

<a id="L1-unit-coordinate-integral"></a>**Integration of locally constant unit tests.** Construct the ℤ_p-linear functional I_c:LocallyConstant(U,ℤ_p)→ℤ_p by I_c(f)=Σ_a g(a)c_n(a), where f=g∘red_n at any finite level.

API: `unitCoordinateIntegral_factor`: For every presentation f=g∘red_n, I_c(f)=Σ_a g(a)c_n(a); `unitCoordinateIntegral_zero`; `unitCoordinateIntegral_add`: I_c(f+h)=I_c(f)+I_c(h); `unitCoordinateIntegral_smul`: I_c(a f)=a I_c(f) for a∈ℤ_p; `unitCoordinateIntegral_norm_le`: ‖I_c(f)‖≤‖f.toContinuousMap‖.

Tests: At p=3, if c_n=2 single(red_n(1),1)+3 single(red_n(2),1) for all n, then I_c of the indicator of 1+3ℤ₃ on U is 2 and I_c of the constant 1 is 5. For a∈ℤ_p, I_c(constant a)=a c_0(1), since the group A_0 has one element. If c_n=single(red_n(u),a) for all n, then I_c(f)=a f(u) for every locally constant f.

Uses: unit-locally-constant-factor, unit-coordinate-pairing-independent, unit-test-factor-refinement.

Supporting lemmas: `unit-coordinate-integral-factor`, `unit-coordinate-integral-bound`.

<a id="L1-unit-coordinate-measure"></a>**The integral measure of finite unit coordinates.** Construct μ_c=ofUnitCoordinates(c):D(U,ℤ_p) as the unique continuous extension of I_c from locally constant tests.

API: `ofUnitCoordinates_locallyConstant`: μ_c(f.toContinuousMap)=I_c(f); `ofUnitCoordinates_norm_le`: ‖μ_c(f)‖≤‖f‖ for every continuous test; `finiteProjection_ofUnitCoordinates`: π_(red_n)(μ_c)=c_n for every n; `ofUnitCoordinates_mass`: μ_c(1)=c_0(1); `ofUnitCoordinates_zero`; `ofUnitCoordinates_add`: For compatible c,d, μ_(c+d)=μ_c+μ_d.

Tests: At p=3, if c_n=single(red_n(1),1)+single(red_n(2),1) for all n, then μ_c evaluates the indicator of 1+3ℤ₃ to 1 and the constant 1 to 2. If c_n=single(red_n(u),a) at every level, then μ_c=a δ_u on the measure carrier. If c_n=2 single(red_n(u),1)+3 single(red_n(v),1), then μ_c(1)=5, even when u and v reduce to the same unit.

Uses: unit-coordinate-integral, unit-coordinate-integral-bound, unit-cylinder-density, unit-reduction-continuity.

Supporting lemmas: `unit-coordinate-measure-locally-constant`, `unit-coordinate-measure-bound`, `unit-coordinate-recovery`, `unit-coordinate-compatibility`, `unit-coordinate-reconstruction`.

<a id="L1-unit-coordinate-existence-uniqueness"></a>**Existence and uniqueness from compatible unit coordinates.** For every compatible integral family c as above, there exists a unique μ∈D(U,ℤ_p) such that π_(red_n)(μ)=c_n for every n≥0.

Uses: unit-coordinate-recovery, unit-measure-separation.

### The weak topology in unit coordinates

Sources: [RJW](#ref-rjw), Definition 3.5, p. 119; Remark 3.11 and Proposition 3.16 with full proof, pp. 120–122; Remark 3.18, pp. 122–123.

Library inputs: `Topology.IsInducing.continuous_iff`, `continuous_pi`, `nhds_discrete`.

<a id="L1-unit-coordinates-range"></a>**The closed image of integral unit coordinates.** The image of μ↦(n,a↦π_n(μ)(a)) is exactly the set of families c_n:A_n→ℤ_p whose finite-support forms are compatible under transition pushforward t_(m,n):A_n→A_m for every m≤n. Equivalently, c_m(a) is the sum of c_n(b) over t_(m,n)(b)=a.

Uses: unit-coordinate-compatibility, unit-coordinate-measure, unit-coordinate-recovery, unit-coordinate-existence-uniqueness.

Supporting lemmas: `unit-coordinate-inverse-continuous`.

<a id="L1-unit-coordinates-weak-closed-embedding"></a>**The integral unit-coordinate embedding.** The map μ ↦ (n ↦ (a ↦ π_n(μ)(a))) is a closed embedding of M, with its weak topology, into ∏_n (A_n → ℤ_p) with the product topology: injective, continuous, with continuous inverse on its image, which is the closed set of compatible families of L1/unit-coordinates-range.

Uses: finite-projection-weak-continuity, unit-measure-separation, unit-coordinate-inverse-continuous, unit-coordinates-range, `Topology.IsClosedEmbedding`.

<a id="L1-unit-measures-weak-compact"></a>**Weak compactness of integral unit measures.** M with its weak topology is compact: it is homeomorphic to a closed subset of ∏_n (A_n → ℤ_p), which is compact because ℤ_p is.

Uses: unit-coordinates-weak-closed-embedding, `PadicInt.compactSpace`, `Pi.compactSpace`, `IsClosed.isCompact`.

<a id="L1-unit-joint-coordinates-weak-closed-embedding"></a>**The joint finite unit-coordinate embedding.** The map μ ↦ (r, n, a ↦ π_{(r,n)}(μ)(a)) is a closed embedding of M, with its weak topology, into the product of the discrete rings ZMod(p^r) indexed by r, n and a ∈ A_n (continuous, injective, from a compact space).

Uses: unit-measures-weak-compact, joint-finite-coefficient, integer-reduction-continuity, finite-projection-weak-continuity, unit-joint-measure-separation.

<a id="L1-unit-joint-weak-convergence"></a>**Weak convergence through joint unit coordinates.** For any filter l on any index type and family μ_i∈M, μ_i tends weakly to ν if and only if, for every r,n, π_(r,n)(μ_i)=π_(r,n)(ν) eventually along l.

Uses: unit-joint-coordinates-weak-closed-embedding.

Supporting lemmas: `unit-joint-zero-basis`, `unit-diagonal-zero-basis`, `unit-measures-weak-topological-ring`, `unit-measures-weak-linear-topology`.

### Moments and characters of unit measures (`AbstractMeasure`)

Sources: [RJW](#ref-rjw), §3.6 Definition 3.34, equation(3-11), Remark 3.35 and complete Lemma 3.36(i)–(iii), pp. 129–131.

Library inputs: `AbstractMeasure.dirac`, `AbstractMeasure.map_dirac`, `ContinuousMonoidHom`.

<a id="L1-dirac-hom"></a>**The Dirac monoid homomorphism** (removed). `AbstractMeasure.diracHom : G →* D(G,R)` with `diracHom_apply` is Mathlib (`Mathlib.NumberTheory.Padics.Measure.Monoid`); `diracHom_pow` is `map_pow` and `diracHom_map` is `map_dirac`.

<a id="L1-character-integral-algebra-hom"></a>**Continuous-character integration as an algebra map.** For a ContinuousMonoidHom κ:G→R, define the R-algebra homomorphism D(G,R)→R by μ↦μ(κ.toContinuousMap).

API: `characterIntegralAlgHom_apply`: The value is evaluation on κ.toContinuousMap; `characterIntegralAlgHom_dirac`; `characterIntegralAlgHom_one_character`: The trivial character gives μ(1), the total mass; `characterIntegralAlgHom_diracHom`: Composition with diracHom is κ.toMonoidHom.

Tests: For the trivial character the value is the total mass μ(1): over ℤ on G=ℤ/2, δ_1+δ_g evaluates to 2. For the sign character κ(g)=−1 of G=ℤ/2 over ℤ, δ_1+δ_g evaluates to 0 and δ_1−δ_g to 2. The value of cδ_g is cκ(g).

Uses: convolution-algebra, convolution-evaluation, right-convolution-evaluation, dirac-hom.

### Comparison with the completed group algebra (`AbstractMeasure`)

Standing assumptions: Γ is a profinite group with a countable basis of open normal subgroups, presented by a tower of finite quotients (L1/finite-quotient-tower); for Γ = ℤ_pˣ the tower is red_n with transition maps `ZMod.unitsMap`, for Γ = ℤ_p it is ρ_n. The completed group algebra is Tau Ceti's `TauCeti.completedGroupAlgebra ℤ_p Γ` (a91d3aaf; the carrier of ProfiniteProPGroups, layer 9), lim_U ℤ_p[Γ/U] with its inverse-limit topology, projections `proj`, group elements `of`, the constructor `mk` from a compatible family and the universal property `lift`; the algebra map of the second target is `lift` of the family of finite algebra projections Π_{q_U}, U open normal, and the tower presents the same limit cofinally, which is how the closed embedding into a countable product is stated. Suggested.lean, pinned at f790474 where the carrier is absent, prototypes the targets on the ring of compatible families in ∏_n ℤ_p[A_n].

Sources: [RJW](#ref-rjw), Proposition 3.16 and its proof, pp. 121–122, which builds the inverse directly from a compatible family (its values on the cosets of each level form an additive function on the open compact subsets, hence a measure by Remarks 3.11–3.12) without any compactness theorem.

<a id="L1-finite-quotient-tower"></a>**Towers of finite quotients.** Define a tower of finite quotients of a topological group Γ to be a family of continuous surjective homomorphisms q_n : Γ → A_n onto finite discrete groups with transition homomorphisms t_{(m,n)} : A_n → A_m for m ≤ n, t_{(m,n)} ∘ q_n = q_m, such that the kernels separate points: for every x ≠ 1 some q_n(x) ≠ 1. For compact Γ the kernels ker q_n are then cofinal among the open normal subgroups.

API: `FiniteQuotientTower`: the structure with fields `q`, `continuous_q`, `surjective_q`, `t`, `t_q`, `separates`; `FiniteQuotientTower.t_comp`: t_{(k,m)} ∘ t_{(m,n)} = t_{(k,n)} on the image of q_n; `FiniteQuotientTower.ker_cofinal`: for compact Γ every open normal subgroup contains some ker q_n; `FiniteQuotientTower.unitTower`: the tower red_n of ℤ_pˣ; `FiniteQuotientTower.padicTower`: the tower ρ_n of ℤ_p.

Tests: red_n with `ZMod.unitsMap` is a tower of ℤ_pˣ (surjectivity is L1/unit-reduction-surjective). A finite discrete group with the constant tower q_n = id is a tower whose compatible families are the constant ones. The trivial maps q_n = 1 on a nontrivial Γ fail separation, so they are not a tower.

Uses: unit-reduction, unit-reduction-surjective, `ZMod.unitsMap`, `PadicInt.toZModPow`.

<a id="L1-measure-completed-algebra-equiv"></a>**Integral measures are the completed group algebra.** For a profinite group Γ, construct the ℤ_p-algebra map toCompletedGroupAlgebra : D(Γ, ℤ_p) → `completedGroupAlgebra ℤ_p Γ` whose projection `completedGroupAlgebra.proj` to the level Γ/U, for every open normal subgroup U, is the finite algebra projection Π_{Γ → Γ/U} of L1/finite-projection-algebra-map, and prove: it carries δ_x to `completedGroupAlgebra.of x` and convolution to the product; it is injective; it is surjective, with inverse the limit of the finite Dirac expansions Σ_a c_U(a) δ_a of a compatible family (so along a tower (q_n, t) of L1/finite-quotient-tower the compatible families c_m = (t_{(m,n)})_* c_n are exactly the measures); it is a closed embedding for the weak topology on measures and the inverse-limit topology of the completed group algebra; and D(Γ, ℤ_p) is weakly compact. For Γ = ℤ_p and the tower ρ_n, composing with the coordinate γ ↦ 1 + T of L4/iwasawa-coordinate gives the Amice transform of L2.

API: `toCompletedGroupAlgebra`: the ℤ_p-algebra map into `completedGroupAlgebra ℤ_p Γ`; `toCompletedGroupAlgebra_apply`: the level U is Π_{Γ → Γ/U}; `toCompletedGroupAlgebra_dirac`; `toCompletedGroupAlgebra_injective`; `toCompletedGroupAlgebra_surjective`: every compatible family comes from a measure; `isClosedEmbedding_toCompletedGroupAlgebra`: closed embedding for the weak topology into the inverse-limit topology; `compactSpace_integralMeasures_weak_of_tower`: D(Γ, ℤ_p) is weakly compact.

Tests: δ_x ∗ δ_y projects to single(x̄ȳ, 1) at every level U. For x ≠ y the images of δ_x and δ_y differ. δ_1 maps to 1.

Uses: finite-quotient-tower, finite-projection-algebra-map, finite-convolution-multiplicativity, finite-projections-separate, finite-projection-weak-continuity, unit-coordinate-measure, unit-coordinates-weak-closed-embedding, unit-measures-weak-compact, Tau Ceti `completedGroupAlgebra.proj`, Tau Ceti `completedGroupAlgebra.of`, `completedGroupAlgebra.ext`, `completedGroupAlgebra.mk`.

<a id="L1-completed-algebra-coefficients"></a>**Coefficient extension of the completed group algebra.** For O a normed commutative ring that is a finite free ℤ_p-module (the valuation ring of a finite extension of ℚ_p, ramified or not), construct the O-linear equivalence O ⊗_{ℤ_p} D(Γ, ℤ_p) ≃ D(Γ, O), a ⊗ μ ↦ a·(μ with coefficients extended along ℤ_p → O), multiplicative for the convolutions, so that O ⊗_{ℤ_p} `completedGroupAlgebra p Γ` ≅ lim_U O[Γ/U] ≅ D(Γ, O) as O-algebras; with the topology of a finite free module over the algebra, independent of the basis, it is a complete topological O-algebra. Inverting p gives the bounded K-valued measures, which are not lim_U K[Γ/U].

API: `completedGroupAlgebraBaseChange`: the O-linear equivalence; `completedGroupAlgebraBaseChange_tmul_dirac`: a ⊗ δ_x ↦ a δ_x; `completedGroupAlgebraBaseChange_mul`: multiplicativity for the convolutions.

Tests: For O = ℤ_p the equivalence is the canonical ℤ_p ⊗ D ≅ D. 1 ⊗ δ_x maps to δ_x. For a ≠ b in O the images of a ⊗ δ_x and b ⊗ δ_x differ.

Uses: measure-completed-algebra-equiv, convolution-algebra, `Algebra.TensorProduct`, `Module.Free`. Sources: [RJW](#ref-rjw), Proposition 3.16, pp. 121–122, stated there for O_L-coefficients.

## L2 — Mahler–Amice theory for bounded measures

The Mahler–Amice dictionary on ℤ_p and its operator calculus: moments, the Mahler derivation, weighting, translation and dilation, root-of-unity averaging and the residue projections, φ and ψ with ψφ = 1 and φψ = restriction to pℤ_p, the bounded Amice norm and the rational integral lattice, the extension to field coefficients on the unit domain, inversion of multiplication by x on the units, and the reduction of ψ modulo p. The Cartier operators on power series that the residue theory uses are a target of this layer, stated for every commutative ring.

Standing assumptions for this layer: p is any prime, including 2. Z = ℤ_p, U = Zˣ with the subspace topology, B = Z⟦T⟧ with the coefficientwise p-adic topology (`PowerSeries.WithPiTopology`, not a coefficient-norm topology), B_0 = k⟦T⟧ with the coefficientwise discrete topology, ρ : B → B_0 the coefficient map induced by `PadicInt.toZMod`, Y = 1 + T and b = Y^p − 1, whose constant coefficient is 0, so that formal substitution at b (`PowerSeries.subst`) is defined; no analytic evaluation or inverse substitution is asserted in this layer. X is a compact space and R a normed commutative ring, possibly the zero ring, with μ ∈ D(X,R) and g ∈ C(X,R); where R must be a ℤ_p-algebra its scalar action is bounded, |a·r| ≤ |a||r|, and completeness and ultrametricity are added only where a target states them; K is a nontrivially normed field with the same bounded ℤ_p-action; the rational comparisons take R = ℚ_p. C_p is `PadicComplex`, O its valuation ring, j₀ : Z → C_p the canonical map; for the root-of-unity statements K has characteristic zero and ζ has exact order p. For the exponential, R is a commutative ℚ-algebra, E = `PowerSeries.exp` and h = E − 1. Notation: x is the identity function on Z, x_R = j ∘ x and M_{(R,n)} = j ∘ mahler_n for the algebra map j : ℤ_p → R; W = weight x; D is the formal derivative and ∂ (∂_R on R⟦T⟧) the Mahler derivation (1 + T)·d/dT; A is the Amice transform; φ is substitution by b and ψ = psiSeries its left inverse, φψ being the restriction to pZ; H = inverseMahler; b_a = binomialSeries(a) − 1, S_a(F) = `PowerSeries.subst` (b_a, F), d_a : x ↦ ax; E = E_R = unitRestriction, r = r_R the intrinsic unit restriction D(Z,R) → D(U,R), j_R the pushforward along `Units.val` (r_R j_R = id, j_R r_R = E_R); I_R is the extension of L2/integral-coefficient-extension; χ is the characteristic function of pZ, m_p(x) = px; C_{(n,a)} = ρ_n⁻¹{a}, χ_{(n,a)} its characteristic function, P_{(n,a)} = restrictResidue, π_n the finite projection of ρ_n. Measure norms are operator norms through `toCLMEquiv`, for field coefficients only, so D(Z,Z) receives no norm instance; additive convolution on Z and multiplicative convolution on U are never identified.

### Moments, the Mahler derivation and the Amice transform (`AbstractMeasure`, `PowerSeries`)

Sources: [RJW](#ref-rjw), §3.5.1, Lemma 3.29 and Corollary 3.30, p. 126.

Library inputs: `AbstractMeasure.coeff_amiceTransform`, `mahler_apply`, `Derivation.smul_apply`.

<a id="L2-weight"></a>**Weighted measures.** Define AbstractMeasure.weight g : D(X,R) →ₗ[R] D(X,R) by (weight g μ)(f)=μ(gf). This acts on the carrier, not a second definition of bounded measures.

API: `weight_apply`: (weight g μ)(f)=μ(gf); `weight_one`; `weight_zero`; `weight_mul`: weight (gh) μ=weight g (weight h μ); `weight_const`: weight (const r) μ=r • μ; `weight_dirac`.

Tests: Over ℤ₃, weight x δ₀=0 although δ₀≠0, as evaluation on 1 shows. Weighting by x is not injective. Over ℤ₃, weight x δ₁=δ₁. Over ℤ₃, weight x δ₂=2δ₂; this rejects ignoring g.

Sources: [RJW](#ref-rjw), §3.5.2, pp. 126–127.

Supporting lemmas: `weight-evaluation`, `weight-multiplication`, `weight-pushforward`, `weight-iteration`.

<a id="L2-mahler-derivation"></a>**Mahler derivation.** Define PowerSeries.mahlerDerivation R : Derivation R R⟦T⟧ R⟦T⟧ as (1+T) • PowerSeries.derivative R. Write ∂F=(1+T)DF.

API: `mahlerDerivation_apply`: ∂F=(1+T)DF; `coeff_mahlerDerivation`: coeff_n ∂F=(n+1)coeff_(n+1)F+n coeff_n F; `mahlerDerivation_C`; `mahlerDerivation_X`; `mahlerDerivation_mul`: ∂(FG)=F∂G+G∂F from the inherited derivation law; `map_mahlerDerivation`: map f (∂F)=∂(map f F).

Tests: Over ℤ, ∂(C 7)=0. Over ℤ, ∂T=1+T; D and TD both fail this test. Over ℤ, ∂((1+T)^2)=2(1+T)^2.

Supporting lemmas: `mahler-derivation-value`, `mahler-derivation-coefficients`, `mahler-derivation-map`, `mahler-derivation-iterate-map`, `mahler-recurrence`.

<a id="L2-amice-weight"></a>**Amice transform of multiplication by x.** A(weight x μ)=∂(Aμ) in ℤ_p⟦T⟧.

Uses: weight-evaluation, mahler-recurrence, mahler-derivation-coefficients.

Supporting lemmas: `amice-iterate-weight`.

<a id="L2-ordinary-moment"></a>**Ordinary moments from the Amice transform.** For k∈ℕ, μ(x^k)=constantCoeff(∂^[k](Aμ)) in ℤ_p.

Uses: amice-iterate-weight, weight-iteration.

Supporting lemmas: `exp-conjugacy`, `exp-iterate`, `exp-coefficient`.

<a id="L2-ordinary-moment-exp"></a>**Ordinary moments as exponential coefficients.** For μ : D(ℤ_p,ℤ_p) and k∈ℕ, (μ(x^k) : ℚ_p) = (k! : ℚ_p) * coeff_k(PowerSeries.subst (PowerSeries.exp ℚ_p−1) (PowerSeries.map (algebraMap ℤ_p ℚ_p) Aμ)).

Uses: ordinary-moment, mahler-derivation-iterate-map, exp-coefficient. Sources: [RJW](#ref-rjw), §3.5.1, Lemma 3.29 and Corollary 3.30, p. 126; [RJW](#ref-rjw), §4.1, Lemma 4.3 and its use in Proposition 4.6, pp. 136–137.

Supporting lemmas: `algebra-mahler-recurrence`, `algebra-amice-mass`.

<a id="L2-algebra-amice-weight"></a>**Amice weighting over a coefficient algebra.** A(weight(x_R) μ)=∂_R(Aμ) in R[[T]].

Uses: weight-evaluation, algebra-mahler-recurrence, mahler-derivation-coefficients. Sources: [RJW](#ref-rjw), §3.5.1, Lemma 3.29 with its full proof and Corollary 3.30, p. 126; coefficient-field context in Remark 3.28(1–2), p. 125.

Supporting lemmas: `algebra-amice-iterate-weight`.

<a id="L2-algebra-ordinary-moment"></a>**Ordinary moments over a coefficient algebra.** For every k≥0, μ(x_R^k)=constantCoeff(∂_R^[k](Aμ)).

Uses: algebra-amice-mass, algebra-amice-iterate-weight, weight-iteration. Sources: [RJW](#ref-rjw), §3.5.1, Lemma 3.29 with its full proof and Corollary 3.30, p. 126; coefficient-field context in Remark 3.28(1–2), p. 125.

<a id="L2-algebra-ordinary-moment-exp"></a>**Exponential moments over a coefficient algebra.** For every k≥0, μ(x_R^k)=k!·coeff_k(Aμ(exp(T)−1)) in R.

Assumptions: R additionally has a ℚ-algebra structure. This additional structure is used only for the formal exponential comparison; it is never imposed on ℤ_p.

Uses: algebra-ordinary-moment, exp-coefficient. Sources: [RJW](#ref-rjw), §3.5.1, Lemma 3.29 with its full proof and Corollary 3.30, p. 126; coefficient-field context in Remark 3.28(1–2), p. 125; [RJW](#ref-rjw), §4.1, Lemma 4.3 and the full proof of Proposition 4.6, pp. 136–137.

### Translation, dilation, φ and ψ on power series (`AbstractMeasure`)

Sources: [RJW](#ref-rjw), §3.5.5, p. 128 with the pZ_p restriction from §3.5.3, p. 127.

Library inputs: `LocallyConstant.coe_charFn`, `AbstractMeasure.dirac_apply`, `AbstractMeasure.map_apply`.

Supporting lemmas: `clopen-pmultiples`.

<a id="L2-divide-by-p"></a>**Exact division on pZ_p.** Define divideByP : C(Z,Z) by q(px)=x and q(y)=0 for y outside U.

API: `divideByP_mul`; `mul_divideByP`: For x∈U, pq(x)=x; `divideByP_of_not_dvd`.

Tests: q(0)=0 over ℤ₃. q(6)=2 over ℤ₃; rejects the identically-zero function. q(1)=0 over ℤ₃; it is not multiplication by a ring inverse of 3.

Uses: clopen-pmultiples.

Supporting lemmas: `divide-by-p-mul`, `mul-divide-by-p`.

<a id="L2-restriction-pmultiples"></a>**Restriction to pZ_p.** Define restrictMultiples : D(Z,R)→ₗ[R]D(Z,R) to be weight χ. It is restriction followed by extension by zero on the ambient Z carrier.

API: `restrictMultiples_eq_weight`: restrictMultiples=weight χ, using the weight carrier; `restrictMultiples_apply`: Pμ(f)=μ(χf); `restrictMultiples_dirac`; `restrictMultiples_idem`: P(Pμ)=Pμ.

Tests: Pδ₀=δ₀ over ℤ₃, since 0 belongs to 3ℤ₃. Pδ₁=0 over ℤ₃. Pδ₃=δ₃ over ℤ₃; restriction does not rescale the atom.

Uses: clopen-pmultiples, weight, weight-evaluation, weight-multiplication.

Supporting lemmas: `restriction-evaluation`.

<a id="L2-phi-measure"></a>**Frobenius on bounded measures.** Define phiMeasure=AbstractMeasure.map m_p as an R-linear endomorphism of D(Z,R). Denote it φ.

API: `phiMeasure_eq_map`: φ equals the pushforward along m_p; `phiMeasure_apply`: φμ(f)=μ(f∘m_p); `phiMeasure_dirac`; `phiMeasure_injective`: φ is injective; proof supplied by psi-phi.

Tests: φ(0)=0 over ℤ₃. φδ₂=δ₆ over ℤ₃. φμ(1)=μ(1) over ℤ₃; rejects an extra factor p.

Supporting lemmas: `phi-evaluation`.

<a id="L2-psi-measure"></a>**The left inverse of Frobenius.** Define psiMeasure=(AbstractMeasure.map q)∘restrictMultiples as an R-linear endomorphism of D(Z,R). Denote it ψ.

API: `psiMeasure_eq_map_restrict`: ψ=(map q)∘P, as linear maps; `psiMeasure_apply`: ψμ(f)=μ(χ(f∘q)); `psiMeasure_dirac`; `psiMeasure_phiMeasure`: ψφμ=μ; `phiMeasure_psiMeasure`: φψμ=Pμ.

Tests: ψδ₀=δ₀ over ℤ₃. ψδ₆=δ₂ over ℤ₃; no scalar 1/3 occurs. ψδ₁=0 over ℤ₃; bare pushforward by q would give δ₀.

Uses: divide-by-p, restriction-pmultiples, restriction-evaluation.

Supporting lemmas: `psi-evaluation`.

<a id="L2-psi-phi"></a>**The left inverse identity.** ψ(φμ)=μ for every μ∈D(Z,R).

Uses: psi-evaluation, phi-evaluation, divide-by-p-mul.

<a id="L2-phi-psi"></a>**Frobenius after its left inverse.** φ(ψμ)=Pμ for every μ∈D(Z,R).

Uses: phi-evaluation, psi-evaluation, mul-divide-by-p, restriction-evaluation.

<a id="L2-unit-restriction"></a>**Restriction to units.** Define unitRestriction=id−P as an R-linear endomorphism of D(Z,R), denoted E. Its test-function multiplier is 1−χ, the characteristic function of Z×.

API: `unitRestriction_eq_sub`: E=id−P as linear maps; `unitRestriction_apply`: Eμ(f)=μ((1−χ)f); `unitRestriction_dirac`; `unitRestriction_idem`: E²=E; `unitRestriction_eq_self_iff`: Eμ=μ iff μ(χf)=0 for every f; `unitRestriction_eq_self_iff_psi_eq_zero`: Eμ=μ iff ψμ=0.

Tests: Eδ₁=δ₁ over ℤ₃. Eδ₀=0 over ℤ₃. Eδ₃=0 over ℤ₃; a nonzero atom need not be on units.

Uses: restriction-pmultiples, restriction-evaluation, weight-multiplication, phi-psi, psi-phi.

Supporting lemmas: `unit-restriction-evaluation`.

<a id="L2-unit-restriction-support"></a>**Test-function support on units.** Eμ=μ iff μ(χf)=0 for every f∈C(Z,R). Equivalently, μ annihilates every continuous function vanishing outside U.

Uses: unit-restriction, restriction-evaluation.

<a id="L2-unit-support-psi"></a>**Unit support and the kernel of psi.** Eμ=μ iff ψμ=0.

Uses: unit-restriction, psi-measure, phi-psi. Sources: [RJW](#ref-rjw), Corollary 3.32, p. 129; equations (3-7)–(3-8), p. 128.

Supporting lemmas: `mahler-frobenius`.

<a id="L2-amice-phi"></a>**Frobenius and the Amice transform.** A(φμ)=PowerSeries.subst b (Aμ) for integral Z-valued μ.

Uses: phi-evaluation, mahler-frobenius.

<a id="L2-psi-series"></a>**Psi on integral power series.** Define psiSeries=A∘ψ∘A⁻¹ : B→ₗ[Z]B. This is a linear operator, not a ring homomorphism.

API: `psiSeries_eq_transport`: psiSeries=A∘ψ∘A⁻¹ as linear maps; `psiSeries_amiceTransform`: psiSeries(Aμ)=A(ψμ); `psiSeries_phi`: psiSeries(subst b F)=F; `psiSeries_one`; `psiSeries_one_add_X`.

Tests: psiSeries((1+T)³)=1+T for p=3, since (1+T)³=Aδ₃ and ψδ₃=δ₁. psiSeries(1)=1 for p=3; rejects a zero operator. psiSeries(1+T)=0 for p=3.

Uses: psi-measure.

<a id="L2-psi-series-intertwining"></a>**Psi and the Amice transform.** psiSeries(Aμ)=A(ψμ).

Uses: psi-series.

<a id="L2-psi-series-phi"></a>**The power-series left inverse.** psiSeries(PowerSeries.subst b F)=F for every F∈B.

Uses: amice-phi, psi-series-intertwining, psi-phi.

<a id="L2-series-unit-restriction"></a>**The Amice unit projector.** A(Eμ)=Aμ−PowerSeries.subst b (psiSeries(Aμ)).

Uses: unit-restriction, phi-psi, amice-phi, psi-series-intertwining.

Supporting lemmas: `psi-measure-dirac`.

### Inverting multiplication by x on the units (`AbstractMeasure`)

Sources: [RJW](#ref-rjw), Equation (4-3), p. 138; Proposition 12.5, equation (12-3), pp. 179–180.

Library inputs: `AbstractMeasure.amiceTransformEquiv`, `Ring.inverse_non_unit`, `PadicInt.not_isUnit_iff`.

Supporting lemmas: `padic-unit-inverse-identification`, `padic-unit-inverse-continuity`.

<a id="L2-inverse-weight"></a>**Division by x on unit-supported measures.** Define J=inverseWeight p : D→ₗ[Z]D by J=weight ι, where ι:C(Z,Z) bundles the PadicInt.inv using its continuity. Thus (Jμ)(f)=μ(ιf). The extension is zero on nonunits, including nonzero multiples of p.

API: `inverseWeight_eq_weight`: J is exactly weighting by the bundled PadicInt.inv; `inverseWeight_apply`: (Jμ)(f)=μ(ιf). see inverse-weight-evaluation; `inverseWeight_dirac`.

Tests: At p=3, Jδ₀=0. At p=3, Jδ₁=δ₁. At p=3, 2·Jδ₂=δ₂; the multiplier is 1/2, not 2.

Uses: padic-unit-inverse-continuity, weight, weight-evaluation.

Supporting lemmas: `inverse-weight-evaluation`, `inverse-weight-support`, `weight-inverse-weight`, `inverse-weight-weight`.

<a id="L2-inverse-weight-unique"></a>**Unique unit-supported division by x.** If μ∈D satisfies ψμ=0, there exists a unique ν∈D with ψν=0 and Wν=μ. Its value is Jμ.

Uses: inverse-weight-support, weight-inverse-weight, inverse-weight-weight, unit-support-psi.

Supporting lemmas: `inverse-weight-dilation`.

<a id="L2-inverse-mahler"></a>**Inverse Mahler derivative on unit support.** Define H=inverseMahler p : Z[[T]]→ₗ[Z]Z[[T]] by H=A∘J∘A⁻¹, using the integral Amice linear equivalence A. Then H(Aμ)=A(Jμ), and ψSeries(HF)=0 for every F.

API: `inverseMahler_eq_transport`: H equals the displayed composition of three linear maps; `inverseMahler_amiceTransform`: H(Aμ)=A(Jμ). see inverse-mahler-intertwining; `psiSeries_inverseMahler`: ψSeries(HF)=0. see inverse-mahler-support.

Tests: At p=3, H(1)=0; the constant series is Aδ₀. At p=3, H(1+T)=1+T. At p=3, 2H((1+T)²)=(1+T)².

Uses: inverse-weight.

<a id="L2-inverse-mahler-intertwining"></a>**Amice transform of division by x.** For every integral μ, H(Aμ)=A(Jμ).

Uses: inverse-mahler.

Supporting lemmas: `inverse-mahler-support`, `mahler-derivative-inverse`, `inverse-mahler-derivative`.

<a id="L2-inverse-mahler-unique"></a>**Unique unit-supported Mahler primitive.** If ψSeries F=0, there exists a unique integral formal series G with ψSeries G=0 and ∂G=F. It is G=HF.

Uses: inverse-mahler, mahler-derivative-inverse, inverse-mahler-derivative, inverse-mahler-support.

### Root-of-unity averaging and residue projections (`IwasawaAveraging`)

Sources: [RJW](#ref-rjw), §3.5.3–5, equations (3-5), (3-6), (3-9), pp. 127–129.

Library inputs: `PadicComplex.norm_extends'`, `PowerSeries.map_injective`, `Valued.integer`.

<a id="L2-integer-ring-linear-topology"></a>**The linear topology on the receiving integer ring.** The induced topology on O=Valued.integer(ℂ_p) is a linear ring topology: zero has a basis of open ideals.

<a id="L2-integral-coefficient-map"></a>**The integral coefficient embedding.** Let j₀:ℤ_p→ℂ_p be the composite ℤ_p→ℚ_p→ℂ_p. Define j:ℤ_p→O by lifting this ring map to the valuation integer ring, so the underlying ℂ_p value of j(x) is j₀(x).

API: `integralCoefficientMap_coe`: For every x∈ℤ_p, the image of j(x) in ℂ_p equals j₀(x). see integral-coefficient-map-coe; `integralCoefficientMap_continuous`: The canonical coefficient embedding j:ℤ_p→O is continuous for the induced p-adic topologies. see integral-coefficient-map-continuous; `integralCoefficientMap_injective`: The coefficient embedding j:ℤ_p→O is injective. see integral-coefficient-map-injective.

Tests: j(p) has absolute value p^{−1} in ℂ_p, so it is a nonunit of O; the constant map to 1 fails this test. j is injective. A square root of p lies in O but not in the image of j, since p is not a square in ℤ_p.

Supporting lemmas: `integral-coefficient-map-coe`, `integral-coefficient-map-continuous`, `integral-coefficient-map-injective`, `prime-root-sub-one-norm`, `integer-root-sub-one-nilpotent`, `inverse-amice-uniform-tail`, `inverse-amice-evaluation-continuous`, `psi-series-continuous`, `phi-psi-series-continuous`, `amice-dirac-natural`, `phi-psi-natural-powers`, `root-translation-convergence`.

<a id="L2-root-translation"></a>**Integral topological root translation.** For ζ∈O with ζ^p=1 and i∈ℕ, define τ_i:ℤ_p[[T]]→O[[T]] to be the continuous topological evaluation ring homomorphism with coefficient map C∘j and argument C(ζ^i)(1+T)−1.

API: `rootTranslation_eq_eval`: For integral F, τ_i(F)=eval₂(C∘j,C(ζ^i)(1+T)−1,F). see root-translation-evaluation; `rootTranslation_continuous`: For fixed ζ and i, τ_i:ℤ_p[[T]]→O[[T]] is continuous in the coefficientwise p-adic topologies. see root-translation-continuous; `rootTranslation_polynomial`: For P∈ℤ_p[T], τ_i(P)=P evaluated with coefficient map C∘j at C(ζ^i)(1+T)−1. see root-translation-polynomial; `rootTranslation_one_add_X_pow`; `rootTranslation_hasSum`: For integral F, the series Σ_n C(j(coeff_n F))·(C(ζ^i)(1+T)−1)^n has sum τ_i(F) in O[[T]]. see root-translation-sum; `rootTranslation_zeroth`.

Tests: For i=0 and every ζ, τ_0(T)=T and τ_0 is the coefficientwise map j. For p=2, ζ=−1 and i=1, τ_1(T)=−2−T; omitting the translated constant term fails this test. For p=2, ζ=−1 and i=1, τ_1((1+T)^3)=−(1+T)^3.

Uses: integral-coefficient-map-continuous, root-translation-convergence.

Supporting lemmas: `root-translation-evaluation`, `root-translation-continuous`, `root-translation-polynomial`, `root-translation-natural-powers`, `root-translation-sum`, `root-translation-zeroth`, `primitive-root-power-sum`, `root-average-polynomial`.

<a id="L2-root-average"></a>**Integral root averaging for bounded psi.** For ζ∈O primitive of order p and every F∈ℤ_p[[T]], p·map(j,φ(psiSeries F))=Σ_{i<p}τ_i(F) in O[[T]].

Uses: root-average-polynomial, phi-psi-series-continuous, root-translation-continuous, integral-coefficient-map-continuous.

<a id="L2-root-average-integral-descent"></a>**Unique integral descent of the root average.** For each integral F and primitive ζ∈O, there is a unique G∈ℤ_p[[T]] satisfying p·map(j,φ(G))=Σ_{i<p}τ_i(F). The unique G is psiSeries F.

Uses: root-average, integral-coefficient-map-injective, psi-series-phi.

Supporting lemmas: `translated-polynomial-nonzero`.

<a id="L2-root-translation-rational"></a>**Root translation of an integral rational series.** Let P,Q∈ℤ_p[T], Q(0) a unit, and F∈ℤ_p[[T]] with QF=P. After mapping τ_i(F) to Frac(ℂ_p[[T]]), its value is P(ζ^iY−1)/Q(ζ^iY−1).

Uses: root-translation-polynomial, translated-polynomial-nonzero, integral-coefficient-map-coe.

<a id="L2-rational-root-average"></a>**Rational-series averaging for the bounded operator.** For ζ∈ℂ_p primitive of order p, P,Q∈ℤ_p[T] with Q(0) a unit, and integral F satisfying QF=P, one has p·J(φ(psiSeries F))=Σ_{i<p}P(ζ^iY−1)/Q(ζ^iY−1) in Frac(ℂ_p[[T]]). Here J is the canonical coefficient/series inclusion and Y=1+T.

Uses: root-average, root-translation-rational, integral-coefficient-map-coe.

Supporting lemmas: `root-denominator-nonzero`.

<a id="L2-root-partial-fractions"></a>**The finite-root partial-fraction identity.** For a characteristic-zero field K, ζ primitive of order p and y^p≠1, Σ_{i<p}1/(ζ^i y−1)=p/(y^p−1).

Uses: root-denominator-nonzero, primitive-root-power-sum. Sources: [RJW](#ref-rjw), Lemma 4.7, p. 137.

Supporting lemmas: `translated-polynomial-descent-nonzero`.

<a id="L2-rational-root-average-descent"></a>**Rational averaging over the cyclotomic coefficient field.** For K,j_K,e as in translated-polynomial-descent-nonzero, ζ∈K primitive of order p, P,Q∈ℤ_p[T] with Q(0) a unit, and integral F with QF=P, the same identity p·J_K(φ(psiSeries F))=Σ_{i<p}P(ζ^iY−1)/Q(ζ^iY−1) holds in Frac(K[[T]]), with its canonical maps J_K and Y=1+T.

Uses: rational-root-average, translated-polynomial-descent-nonzero.

### Bounded Mahler coefficients and the Amice norm (`AbstractMeasure`)

Sources: [RJW](#ref-rjw), Theorem 3.25 and its proof, pp. 124–125.

Library inputs: `AbstractMeasure.injective_amiceTransform`, `PadicInt.mahlerEquiv`, `AbstractMeasure.coeff_amiceTransform`.

Supporting lemmas: `bounded-mahler-summable`.

<a id="L2-bounded-mahler-pairing"></a>**The bounded Mahler pairing.** For c in BoundedContinuousFunction(N,R), define the R-linear map I_c:C(Z_p,R)->R by I_c(f)=sum_n a_n(f)c_n. The space of test functions and the coefficient sequence are library objects.

API: `boundedMahlerPairing_apply`: I_c(f)=sum_n a_n(f)c_n; `boundedMahlerPairing_add`; `boundedMahlerPairing_smul`: I_c(r f)=r I_c(f) for r in R; `boundedMahlerPairing_bound`: |I_c(f)| <= ||c|| ||f||; `boundedMahlerPairing_integral`: For R=Z_p and c_n=coeff_n(F), I_c(f) equals the invTransform(F)(f).

Tests: Over Q_3, the constant sequence c_n=1/3 gives I_c(1)=1/3. Over ℤ_3, the sequence c with c_1=1 and c_n=0 otherwise gives I_c(f)=a_1(f)=f(1)−f(0), so I_c(x ↦ x)=1 and I_c(1)=0. For an integral formal series F and its bounded coefficient sequence, I_c(f)=AbstractMeasure.invTransform(F)(f).

Uses: bounded-mahler-summable.

Supporting lemmas: `bounded-mahler-pairing-bound`.

<a id="L2-bounded-inverse"></a>**The bounded-coefficient inverse Amice transform.** Define boundedInvTransform as the R-linear map from BoundedContinuousFunction(N,R) to the measure type D(Z_p,R), sending c to the continuous functional f->I_c(f). In particular its value is a measure, not a new carrier of formal power series.

API: `boundedInvTransform_apply`: boundedInvTransform(c)(f)=I_c(f); `boundedInvTransform_mahler`; `amiceTransform_boundedInvTransform`: Its Amice transform equals PowerSeries.mk(c); `boundedInvTransform_unique`: A measure with that Amice transform is boundedInvTransform(c); `boundedInvTransform_zero`; `boundedInvTransform_add`: The inverse preserves addition of bounded coefficient sequences.

Tests: Over Q_3 the constant bounded sequence 1/3 gives value 1/3 on the constant function 1; nonintegral bounded coefficients are allowed. The sequence c with c_1=1 and c_n=0 otherwise gives the measure δ_1−δ_0, whose Amice transform is T. For R=Z_p, coefficients of an integral formal series give exactly the invTransform, by the Amice injectivity.

Uses: bounded-mahler-pairing, bounded-mahler-pairing-bound, bounded-mahler-summable.

Supporting lemmas: `bounded-inverse-mahler`, `bounded-inverse-amice`, `bounded-inverse-unique`, `integral-coefficient-image-bound`.

<a id="L2-integral-coefficient-sequence"></a>**The bounded image coefficient sequence.** For an integral measure mu, integralAmiceCoefficients(mu) is the bounded sequence n->algebraMap(coeff_n(A_mu)) in R, with the uniform bound |1_R|.

API: `integralAmiceCoefficients_apply`: The nth value is algebraMap(coeff_n(A_mu)); `integralAmiceCoefficients_norm`: The supremum norm is at most |1_R|; `integralAmiceCoefficients_zero`; `integralAmiceCoefficients_add`: The coefficient sequence is additive in mu; `integralAmiceCoefficients_smul`: Multiplication of mu by a in Z_p multiplies the sequence by algebraMap(a); `integralAmiceCoefficients_self`: For R=Z_p this is the original Amice coefficient sequence.

Tests: For delta_0 the zeroth coefficient is 1 and the first coefficient is 0, including over Q_3. For delta_(−1) the nth image coefficient is (−1)^n, so the sequence is bounded but not eventually zero. For R=Z_p, the nth coefficient is exactly coeff_n(A_mu), using the standard identity algebra structure.

Uses: integral-coefficient-image-bound.

<a id="L2-integral-coefficient-extension"></a>**Extension of integral measures on Z_p.** Define extendIntegralCoefficients(mu) in D(Z_p,R) as boundedInvTransform(integralAmiceCoefficients(mu)). Its Amice transform is the coefficient image of A_mu, and its value on the R-valued image of an integral test f is algebraMap(mu(f)). This extends coefficients of the measure on Z_p.

API: `extendIntegralCoefficients_apply`: Evaluation on f is sum_n a_n(f) algebraMap(coeff_n(A_mu)); `amiceTransform_extendIntegralCoefficients`: The Amice transform is PowerSeries.map(algebraMap)(A_mu); `extendIntegralCoefficients_test`: On algebraMap composed with an integral test f the value is algebraMap(mu(f)); `extendIntegralCoefficients_unique`: Agreement on all these integral test functions uniquely characterizes the extended measure; `extendIntegralCoefficients_zero`; `extendIntegralCoefficients_add`: Extension is additive.

Tests: Over Q_3, extension of the integral delta_2 applied to x->x^2 is 4. Over Q_3, extension of the integral delta_1−delta_0 has Amice transform T and evaluates x->x to 1. Over Z_p this extension equals the original measure, with no alternate carrier.

Uses: bounded-inverse, bounded-mahler-pairing-bound, integral-coefficient-sequence.

Supporting lemmas: `coefficient-extension-amice`, `coefficient-extension-test-function`, `coefficient-extension-unique`, `coefficient-extension-dirac`, `coefficient-extension-pushforward`, `coefficient-extension-weight`, `field-amice-coefficient-bound`.

<a id="L2-field-amice-coefficient-sequence"></a>**Bounded Amice coefficient sequence.** Define boundedAmiceCoefficients:D(Z_p,K)→ₗ[K] BoundedContinuousFunction(N,K) by μ↦(n↦coeff_n(A_μ)). The sequence has its supremum norm.

API: `boundedAmiceCoefficients_apply`; `boundedAmiceCoefficients_zero`; `boundedAmiceCoefficients_add`: The bounded coefficient sequence of μ+ν is the sum of their bounded coefficient sequences; `boundedAmiceCoefficients_smul`: The bounded coefficient sequence of aμ is a times the bounded coefficient sequence of μ, for a∈K; `boundedAmiceCoefficients_norm_le`: The supremum norm of boundedAmiceCoefficients(μ) is at most the continuous-dual operator norm of μ.

Tests: For δ₀ over Q_3, bounded coefficient zero is one and coefficient one is zero. For (1/3)δ₀ over Q_3, bounded coefficient zero is 1/3; bounded measures need not be integral. For δ₋₁ over Q_2, bounded coefficient n is (−1)^n, so the sequence has supremum norm 1 and is not eventually zero.

Uses: field-amice-coefficient-bound. Sources: [RJW](#ref-rjw), Definitions 3.5,3.8,3.23; Theorem 3.21 and proof of Theorem 3.25; Remark 3.28(1),(3), p. 119,123–126.

Supporting lemmas: `bounded-inverse-norm`, `bounded-inverse-coefficient-retraction`.

<a id="L2-field-bounded-amice-isometry"></a>**Bounded Amice isometry.** There is a canonical K-linear isometric equivalence boundedAmiceEquiv:(C(Z_p,K)→L[K]K)≃ₗᵢ[K]BoundedContinuousFunction(N,K). Forward, transport the dual through toCLMEquiv inverse and take its Amice coefficients; inverse, take toCLMEquiv of boundedInvTransform.

API: `boundedAmiceEquiv_apply`: boundedAmiceEquiv(toCLMEquiv(μ))=boundedAmiceCoefficients(μ); `boundedAmiceEquiv_symm_apply`: The inverse of boundedAmiceEquiv sends c to toCLMEquiv(boundedInvTransform(c)); `boundedAmiceCoefficients_norm`: For every μ, ‖boundedAmiceCoefficients(μ)‖=‖toCLMEquiv(μ)‖.

Uses: field-amice-coefficient-sequence, bounded-inverse-coefficient-retraction, bounded-inverse-amice, bounded-inverse-norm. Sources: [RJW](#ref-rjw), Definitions 3.5,3.8,3.23; Theorem 3.21 and proof of Theorem 3.25; Remark 3.28(1),(3), p. 119,123–126.

<a id="L2-field-amice-range"></a>**The bounded-series range of Amice.** For F∈K[[T]], there exists a measure μ with A_μ=F if and only if there is C≥0 such that ‖coeff_n(F)‖≤C for every n.

Uses: field-amice-coefficient-bound, bounded-inverse-amice. Sources: [RJW](#ref-rjw), Definitions 3.5,3.8,3.23; Theorem 3.21 and proof of Theorem 3.25; Remark 3.28(1),(3), p. 119,123–126.

Supporting lemmas: `rational-integral-extension-injective`, `rational-integral-extension-norm`.

<a id="L2-rational-integral-image"></a>**Integral measures are the rational dual unit ball.** For ν∈D(Z_p,Q_p), there is a unique μ∈D(Z_p,Z_p) with extendIntegralCoefficients(μ)=ν if and only if ‖toCLMEquiv(ν)‖≤1.

Uses: rational-integral-extension-norm, integral-coefficient-sequence, field-amice-coefficient-bound, rational-integral-extension-injective, coefficient-extension-amice. Sources: [RJW](#ref-rjw), Definitions 3.5,3.8,3.23; Theorem 3.21 and proof of Theorem 3.25; Remark 3.28(1),(3), p. 119,123–126.

Supporting lemmas: `rational-integral-image-closed`.

<a id="L2-rational-measure-integral-scaling"></a>**Rational measures admit an integral power scaling.** For every ν∈D(Z_p,Q_p) there are n≥0 and μ∈D(Z_p,Z_p) such that ν=p^(−n)·extendIntegralCoefficients(μ).

Uses: rational-integral-image. Sources: [RJW](#ref-rjw), Definitions 3.5,3.8,3.23; Theorem 3.21 and proof of Theorem 3.25; Remark 3.28(1),(3), p. 119,123–126.

### Measures on the units inside measures on ℤ_p (`AbstractMeasure`, `PadicInt`)

Sources: [RJW](#ref-rjw), §3.5.3–5, Remark 3.31, Corollary 3.32 and Remark 3.33, pp. 127–129.

Library inputs: `AbstractMeasure.dirac_apply`, `AbstractMeasure.map_apply`, `PadicInt.not_isUnit_iff`.

Supporting lemmas: `clopen-unit-locus`.

<a id="L2-unit-domain-homeomorphism"></a>**Existing p-adic units and the unit locus.** Define PadicInt.unitsHomeomorphIsUnit p : (ℤ_p)ˣ ≃ₜ V, sending u to its underlying element with its unit proof; its inverse sends (x,hx) to hx.unit.

API: `unitsHomeomorphIsUnit_apply`: The underlying value of h(u) is u; `unitsHomeomorphIsUnit_symm_apply`: For x∈V, the value of h⁻¹(x) as a p-adic integer is x; `Homeomorph.apply_symm_apply`: Existing inherited inverse API: The two inverse identities come from the inherited homeomorphism; equality can be checked on underlying p-adic values.

Tests: At p=3, the value of h(2) is 2, whose residue modulo 9 is 2 rather than 5, the residue of 2⁻¹. At p=2, the value of h(−1) is −1. At p=2, h⁻¹ of the unit-subtype point 1 is the unit 1.

Supporting lemmas: `unit-domain-homeomorphism-evaluation`.

<a id="L2-intrinsic-unit-restriction"></a>**Restriction to the p-adic unit group.** Define AbstractMeasure.restrictUnits p R : D(ℤ_p,R) →ₗ[R] D((ℤ_p)ˣ,R) as arrowCongrLeft(h⁻¹)∘r_V, where h=unitsHomeomorphIsUnit p. Write j_U for pushforward along Units.val.

API: `restrictUnits_eq_transport`: r_Uμ=arrowCongrLeft(h⁻¹)(r_Vμ); `restrictUnits_apply`: r_Uμ(f)=μ(z_V(f∘h⁻¹)); `restrictUnits_map_val`: r_U(j_Uν)=ν; `map_val_restrictUnits`: j_U(r_Uμ)=unitRestriction p R μ; `restrictUnits_dirac`; `restrictUnits_dirac_nonunit`.

Tests: Over ℤ₃, restricting δ₁+2δ₃ gives δ₁ on ℤ₃ˣ. Over ℤ₃, restricting δ₀ gives zero. Over ℤ₃, restricting δ₃ gives zero although 3 is nonzero.

Uses: clopen-unit-locus, unit-domain-homeomorphism, unit-domain-homeomorphism-evaluation, L0/clopen-restriction, L0/clopen-restriction-evaluation, L0/clopen-zero-extension-inside, L0/clopen-zero-extension-outside.

Supporting lemmas: `intrinsic-unit-restriction-evaluation`, `intrinsic-unit-restriction-section`.

<a id="L2-intrinsic-unit-extension-projector"></a>**Intrinsic unit restriction gives the ambient unit projector.** For every μ∈D(Z,R), j_U(r_Uμ)=unitRestriction p R μ.

Uses: intrinsic-unit-restriction-evaluation, unit-domain-homeomorphism-evaluation, clopen-unit-locus, L0/clopen-zero-extension-projector, unit-restriction-evaluation.

<a id="L2-unit-measure-kernel-equivalence"></a>**Unit-group measures as the kernel of psi.** Define AbstractMeasure.unitsMeasureEquivKerPsi p R : D(U,R) ≃ₗ[R] ker(psiMeasure p R), with forward value j_Uν and inverse r_U on the ambient value of a kernel element.

API: `unitsMeasureEquivKerPsi_apply`: The underlying ambient measure is j_Uν; `unitsMeasureEquivKerPsi_symm_apply`: The inverse is restrictUnits applied to the ambient value; `LinearEquiv.injective`: Existing inherited API: Unit-group measures are equal if their ambient pushforwards are equal; `LinearEquiv.apply_symm_apply`: Existing inherited inverse API: Both round trips are the identities by the inherited linear equivalence.

Tests: At p=3, ambient δ₁−δ₂ lies in ker ψ, as ψδ₁=ψδ₂=0, and the inverse sends it to intrinsic δ₁−δ₂, while ambient δ₃ is not a kernel element since ψδ₃=δ₁. At p=3, the underlying measure of the image of intrinsic δ₁ is ambient δ₁. At p=2, intrinsic δ_(−1) maps to ambient δ_(−1).

Uses: intrinsic-unit-restriction-section, intrinsic-unit-extension-projector, unit-support-psi.

Supporting lemmas: `unit-measure-kernel-evaluation`, `unit-measure-kernel-inverse`.

<a id="L2-unit-measure-amice-kernel-equivalence"></a>**Integral unit measures as the kernel of series psi.** Define AbstractMeasure.unitsMeasureAmiceEquiv p : D((ℤ_p)ˣ,ℤ_p) ≃ₗ[ℤ_p] ker(psiSeries p) by ν↦A(j_Uν). Its inverse sends F∈ker(psiSeries p) to r_U(A⁻¹F).

Assumptions: For this comparison the coefficient ring is exactly ℤ_p; A is the integral Amice linear equivalence and ψSeries is its earlier transported bounded operator.

API: `unitsMeasureAmiceEquiv_apply`: The underlying series is A(j_Uν), with no additional scalar or derivative; `unitsMeasureAmiceEquiv_symm_apply`: The inverse is r_U(A⁻¹F) for a series in the kernel; `LinearEquiv.injective`: Existing inherited API: Two integral unit-group measures agree if their included Amice transforms agree; `LinearEquiv.apply_symm_apply`: Existing inherited inverse API: The kernel hypothesis makes the two inverse identities hold, by the inherited linear equivalence.

Tests: At p=3, the series for intrinsic δ₂ is (1+T)², while (1+T)³=Aδ₃ is not in ker(psiSeries) since psiSeries((1+T)³)=1+T. At p=3, the series for intrinsic δ₁ is 1+T. At p=2, the first coefficient for intrinsic δ_(−1) is −1.

Uses: unit-measure-kernel-equivalence, unit-measure-kernel-evaluation, unit-measure-kernel-inverse, psi-series-intertwining, amice-dirac-natural.

### Weak and strong topologies on measures

Sources: [RJW](#ref-rjw), Definition 3.5 and Definitions 3.7-3.8, p. 119; Remark 3.31, p. 127; Corollary 3.32 and Remark 3.33, p. 129.

Library inputs: `LinearEquiv.isHomeomorph_iff`, `AbstractMeasure.WeakTopology`, `AbstractMeasure.StrongTopology`.

Supporting lemmas: `intrinsic-unit-restriction-weak-continuous`.

<a id="L2-unit-measure-kernel-weak-homeomorphism"></a>**Weak topology on the unit-measure kernel.** The unitsMeasureEquivKerPsi p R is a homeomorphism from D(U,R) with its weak topology to the kernel of psiMeasure with the induced ambient weak topology.

Uses: unit-measure-kernel-equivalence, unit-measure-kernel-evaluation, unit-measure-kernel-inverse, intrinsic-unit-restriction-weak-continuous, L0/pushforward-weak-continuous.

<a id="L2-integral-amice-weak-homeomorphism"></a>**Weak topology and integral Amice coefficients.** The integral amiceTransformEquiv is a homeomorphism from D(Z_p,Z_p) with its weak topology to Z_p[[T]] with the coefficientwise p-adic topology.

Assumptions: p is any prime, including 2; coefficients are exactly Z_p. The measure topology is WeakTopology and the series topology is PowerSeries.WithPiTopology. The the integral Amice equivalence and previously specified inverse continuity are used.

Uses: inverse-amice-evaluation-continuous.

<a id="L2-unit-measure-amice-weak-homeomorphism"></a>**Weak topology on the unit Amice kernel.** The unitsMeasureAmiceEquiv p is a homeomorphism from D(U,Z_p) with its weak topology to the kernel of psiSeries with its induced coefficientwise topology.

Assumptions: For this comparison R=Z_p and the series kernel has the coefficientwise p-adic topology.

Uses: unit-measure-amice-kernel-equivalence, unit-measure-kernel-weak-homeomorphism, integral-amice-weak-homeomorphism, psi-series-intertwining.

Supporting lemmas: `unit-inclusion-operator-norm`.

<a id="L2-unit-measure-kernel-strong-homeomorphism"></a>**Strong topology on the unit-measure kernel.** For K a nontrivially normed field, the unitsMeasureEquivKerPsi p K is a homeomorphism from strongly topologized D(U,K) to the psiMeasure kernel with its induced ambient strong topology.

Assumptions: p is any prime, U=Z_p units, K is a nontrivially normed field, and the topologies on both ambient measure carriers are StrongTopology. The kernel has the induced subtype topology.

Uses: unit-measure-kernel-equivalence, unit-measure-kernel-evaluation, unit-measure-kernel-inverse, intrinsic-unit-restriction, unit-inclusion-operator-norm, L0/clopen-restriction-operator-norm-bound, L0/pushforward-operator-norm-bound.

Supporting lemmas: `dirac-prime-powers-weak-limit`, `dirac-prime-powers-norm-distance`.

<a id="L2-dirac-prime-powers-not-strong-limit"></a>**Weak and strong convergence differ.** The Q_p-valued sequence delta_(p^n) does not converge to delta_0 in the operator-norm topology, although it converges there weakly by dirac-prime-powers-weak-limit.

Assumptions: StrongTopology is exactly the field-valued continuous-dual norm topology; it is not the integral coefficientwise topology.

Uses: dirac-prime-powers-norm-distance, dirac-prime-powers-weak-limit. Sources: [RJW](#ref-rjw), Definitions 3.5 and 3.8, p. 119; Example 3.10, p. 120; Remark 3.28(3), pp. 125–126.

Supporting lemmas: `integral-coefficient-extension-weak-continuous`.

<a id="L2-integral-measures-weak-compact"></a>**Weak compactness of integral measures.** The space D(Z_p,Z_p), equipped with WeakTopology, is compact.

Assumptions: The topology is the weak topology of integral test evaluations; no norm is installed on this integral dual.

Uses: integral-amice-weak-homeomorphism. Sources: [RJW](#ref-rjw), Definitions 3.5 and 3.8, p. 119; Theorem 3.25 including proof, pp. 124–125; Remark 3.28(1),(3), pp. 125–126.

<a id="L2-integral-coefficient-extension-weak-closed-embedding"></a>**Weak topology on the integral unit ball.** The coefficient extension E:D(Z_p,Z_p)→D(Z_p,Q_p) is a closed embedding for the weak topologies. Thus the integral weak topology agrees with the weak subspace topology on the rational unit ball identified by rational-integral-image.

Assumptions: Use the canonical Z_p-algebra structure on Q_p and bounded scalar action. The unit ball means norm(toCLMEquiv(nu))≤1; its topology here is the weak subspace topology.

Uses: integral-measures-weak-compact, integral-coefficient-extension-weak-continuous, rational-integral-extension-injective, rational-integral-image. Sources: [RJW](#ref-rjw), Definitions 3.5 and 3.8, p. 119; Theorem 3.25 including proof, pp. 124–125; Remark 3.28(1),(3), pp. 125–126.

### Integral coefficient extension on the unit domain (`AbstractMeasure`)

Sources: [RJW](#ref-rjw), Definition 3.5 and Definitions 3.7–3.8, p. 119; §3.5.2–5, Remark 3.31, Corollary 3.32 and Remark 3.33, pp. 126–129.

Library inputs: `AbstractMeasure.map_apply`, `LocallyConstant.charFn`, `LocallyConstant.coe_charFn`.

Supporting lemmas: `integral-extension-unit-projector`.

<a id="L2-integral-unit-coefficient-extension"></a>**Integral coefficient extension on the unit domain.** For μ∈D(U,Z), define I_U,R(μ)=r_R(I_R(j_Z μ))∈D(U,R), on the unit-domain measure carrier.

API: `extendIntegralUnitCoefficients_eq`: I_U,R(μ)=r_R(I_R(j_Z μ)); `extendIntegralUnitCoefficients_zero`; `extendIntegralUnitCoefficients_add`: I_U,R(μ+ν)=I_U,R(μ)+I_U,R(ν); `extendIntegralUnitCoefficients_smul`: I_U,R(aμ)=algebraMap(a)I_U,R(μ) for a∈Z; `extendIntegralUnitCoefficients_self`: I_U,Z is the identity on D(U,Z); `extendIntegralUnitCoefficients_dirac`.

Tests: Over Q_3, the extension of the integral unit measure δ₁−δ₂ evaluates u ↦ u to −1 and the constant 1 to 0. The integral Dirac mass at the unit one extends to the rational Dirac mass at one. Extending an integral unit measure to Z coefficients gives that same measure.

Uses: integral-coefficient-extension, intrinsic-unit-restriction, intrinsic-unit-restriction-section, coefficient-extension-dirac.

Supporting lemmas: `integral-unit-extension-inclusion`, `integral-unit-extension-test-function`, `integral-unit-extension-unique`, `integral-unit-extension-restriction`, `rational-unit-extension-injective`, `rational-unit-extension-norm`.

<a id="L2-rational-unit-integral-image"></a>**Integral unit measures form the rational unit ball.** For ν∈D(U,Q_p), there is a unique μ∈D(U,Z) with I_U,Q_p μ=ν if and only if the operator norm of ν is at most one.

Uses: rational-unit-extension-injective, rational-unit-extension-norm, rational-integral-image, unit-inclusion-operator-norm, integral-unit-extension-restriction, intrinsic-unit-restriction-section, integral-coefficient-sequence.

Supporting lemmas: `rational-unit-integral-image-closed`.

<a id="L2-rational-unit-integral-scaling"></a>**A common denominator on the unit domain.** Every ν∈D(U,Q_p) has the form p^(−n) I_U,Q_p μ for some n≥0 and μ∈D(U,Z). The same n works for all continuous tests.

Uses: rational-measure-integral-scaling, integral-unit-extension-restriction, intrinsic-unit-restriction-section.

Supporting lemmas: `rational-integral-unit-restriction-bound`.

### Residue averaging modulo p (`IwasawaResidue`)

Sources: [RJW](#ref-rjw), §3.5.3–5, pp. 127–129; Lemma 12.13 and proof, pp. 182–183.

Library inputs: `PowerSeries.ext`, `PowerSeries.WithPiTopology.continuous_coeff`, `PowerSeries.WithPiTopology.tendsto_iff_coeff_tendsto`.

Supporting lemmas: `series-residue-continuous`, `psi-series-natural-powers`.

<a id="L2-residue-psi"></a>**Residue averaging operator.** Define the k-linear operator psi_0:B_0→B_0 to be the finite weighted sum of the Cartier power-series restrictions, psi_0(F)=sum_(0≤i<p) (−1)^i Lambda_i(F). Equivalently its nth coefficient is sum_(0≤i<p) (−1)^i coeff_(pn+i)(F).

API: `coeff_residuePsi`: coeff_n(psi_0 F)=sum_(0≤i<p) (−1)^i coeff_(pn+i)(F); `residuePsi_zero`; `residuePsi_add`: psi_0(F+G)=psi_0(F)+psi_0(G); `residuePsi_smul`: psi_0(aF)=a psi_0(F) for a in F_p; `residuePsi_monomial`; `residuePsi_one`.

Tests: At p=3, psi_0(T³)=T and psi_0(T²)=1. At p=3, psi_0(T)=−1, distinguishing the weighted operator from Lambda_0. At p=2, psi_0(T)=1; no odd-prime assumption is made.

Uses: cartier-power-series. Sources: [RJW](#ref-rjw), §3.5.3–5, pp. 127–129; Lemma 12.13 and proof, pp. 182–183; [Rowland–Stipulanti–Yassawi](#ref-rsy), Section 3, definition of the Cartier operators and Proposition 4, PDF p. 5.

Supporting lemmas: `residue-psi-coefficient`, `residue-psi-monomial`, `residue-psi-continuous`, `residue-psi-semilinear`, `residue-psi-small-translated-powers`, `residue-psi-natural-powers`.

<a id="L2-residue-psi-polynomial-comparison"></a>**Reduction of integral averaging on polynomials.** For every P in Z_p[T], rho(psi(P))=psi_0(rho(P)), where P is coerced to the integral power-series ring.

Uses: psi-series-natural-powers, residue-psi-natural-powers, psi-series, residue-psi.

<a id="L2-residue-psi-comparison"></a>**Reduction of the integral averaging operator.** For every integral power series F, rho(psi(F))=psi_0(rho(F)).

Uses: residue-psi-polynomial-comparison, psi-series-continuous, series-residue-continuous, residue-psi-continuous.

Supporting lemmas: `residue-psi-left-inverse`, `residue-psi-pole-basis`, `residue-psi-pole-cancelled`, `shifted-expand-fixed-zero`, `residue-psi-fixed-error-zero`.

### Cartier operators on power series (`PowerSeries`)

Sources: [Rowland–Stipulanti–Yassawi](#ref-rsy), Section 3, definition of the Cartier operators and Proposition 4, PDF p. 5 (v2); [RJW](#ref-rjw), Lemma 12.13 and proof, pp. 182–183.

Library inputs: `PowerSeries.mk`, `PowerSeries.coeff_mk`, `PowerSeries.ext`.

<a id="L2-cartier-power-series"></a>**Cartier operators on power series.** For a commutative ring k, a modulus q ≥ 1 and a residue r ∈ ℕ, the Cartier operator Λ_r on k[[T]] is the k-linear map with coeff_n(Λ_r F) = coeff_(qn+r)(F) for every n ≥ 0. It is the power-series restriction, for r < q, of the Cartier operator on Laurent series over a field. For every k one has Λ_r(F(T^q)·G) = F·Λ_r(G) and F = Σ_(r<q) T^r·(Λ_r F)(T^q); when k is a finite field with q elements this reads Λ_r(F^q·G) = F·Λ_r(G) and F = Σ_(r<q) T^r·(Λ_r F)^q.

Assumptions: k is a commutative ring; q ≥ 1 is the modulus and r ∈ ℕ the residue. The Frobenius relations need k a finite field with q elements. The residue operator of this layer uses k = ZMod p and q = p with 0 ≤ r < p.

API: `cartier`: For a commutative ring k and q, r ∈ ℕ, the k-linear map Λ_r : k[[T]] → k[[T]] with nth coefficient coeff_(qn+r); `coeff_cartier`; `cartier_monomial`; `cartier_one_zero`: With modulus 1, Λ_0 is the identity; `cartier_expand_mul`: For q ≠ 0 and every commutative ring k, Λ_r(F(T^q)·G) = F·Λ_r(G), with F(T^q) the expand map; `sum_X_pow_mul_expand_cartier`: For q ≠ 0, F = Σ_(r<q) T^r·(Λ_r F)(T^q): the residue-class decomposition of a series.

Tests: Over F_3 with q = 3: Λ_1(T^7) = T^2 and Λ_0(T^7) = 0. With modulus q = 1, Λ_0 is the identity on ℤ[[T]]. Over F_3 with q = 3, Λ_0(F^3) = F for every F.

### Dilation pushforward and binomial substitution

Sources: [RJW](#ref-rjw), Section 3.5.5, p. 128; Proposition 12.5, pp. 179–180.

Library inputs: `AbstractMeasure.amiceTransformEquiv`, `PowerSeries.binomialSeries_constantCoeff`, `PowerSeries.coeff_subst'`.

Supporting lemmas: `mahler-dilation-natural`, `mahler-dilation`.

<a id="L2-amice-dilation"></a>**Amice transform of dilation pushforward.** For every a in Z and integral measure mu in D(Z,Z), A(map(d_a,mu))=S_a(A(mu)).

Uses: mahler-dilation.

Supporting lemmas: `unit-restriction-dilation`, `unit-dilation-psi-kernel`.

<a id="L2-inverse-mahler-dilation"></a>**Inverse Mahler covariance under binomial substitution.** For a unit a in Z and every F in B, inverseMahler(S_a(F))=a inverse times S_a(inverseMahler(F)).

Uses: amice-dilation, inverse-weight-dilation, inverse-mahler-intertwining.

Supporting lemmas: `binomial-substitution-coefficient-continuity`.

### Restriction to residue classes (`AbstractMeasure`)

Sources: [RJW](#ref-rjw), Section 3.5.3, Remark 3.31 and equation (3-5), p. 127; Section 3.5.4–5, pp. 127–128.

Library inputs: `LocallyConstant.coe_charFn`, `IsClopen.preimage`, `PadicInt.ker_toZModPow`.

Supporting lemmas: `residue-fiber-clopen`, `residue-fiber-coset`.

<a id="L2-residue-restriction"></a>**Restriction to a residue class.** Define P_(n,a):D(Z,R)→ₗ[R]D(Z,R) to be the weight(χ_(n,a)).

API: `restrictResidue_apply`: For f∈C(Z,R), (P_(n,a)μ)(f)=μ(χ_(n,a)f). see L2/residue-restriction-evaluation; `restrictResidue_dirac`; `restrictResidue_comp`: P_(n,a)(P_(n,b)μ)=P_(n,a)μ when a=b, and zero when a≠b. see L2/residue-restriction-composition; `sum_restrictResidue`: For every n, the sum of P_(n,a)μ over all a∈ZMod(p^n) equals μ. see L2/residue-restriction-partition; `restrictResidue_zero_depth`; `restrictResidue_refinement`: For m≤n and a∈ZMod(p^m), P_(m,a)μ is the sum of P_(n,b)μ over exactly those b with t_(m,n)(b)=a, where t_(m,n) is ZMod.castHom. see L2/residue-restriction-refinement.

Tests: At p=2 and R=ℤ, depth 0 restriction is the identity on every measure. At p=2 and R=ℤ, the class 1 modulo 4 keeps δ_5. The same class kills δ_3; it does not keep every odd atom.

Uses: residue-fiber-clopen, weight.

Supporting lemmas: `residue-restriction-evaluation`, `residue-restriction-dirac`, `residue-restriction-composition`, `residue-restriction-partition`, `residue-restriction-zero-depth`, `residue-restriction-refinement`, `residue-restriction-mass`, `residue-restriction-finite-coordinate`, `residue-restriction-translation`.

<a id="L2-residue-restriction-intrinsic"></a>**Intrinsic and ambient residue restriction.** For the clopen s=C_(n,a), P_(n,a)μ equals inclusion pushforward of restrictClopen s R μ.

Uses: residue-restriction-evaluation, L0/clopen-projector-evaluation.

Supporting lemmas: `residue-restriction-weak-continuity`, `residue-restriction-prime-zero`.

<a id="L2-residue-restriction-amice-coefficient"></a>**Amice coefficients after residue restriction.** If R is also a ℤ_p-algebra with continuous scalar action, coeff_k(A(P_(n,a)μ))=μ(χ_(n,a)·M_(R,k)), where M_(R,k) is the R-valued Mahler test (mahler k) acting on the constant-one function.

Assumptions: For this Amice comparison only, R has an algebra structure over Z with continuous scalar action, as in the Amice transform.

Uses: residue-restriction-evaluation.

## L3 — Pseudo-measures and evaluation

Pseudo-measures on the commutative completed group algebra, with their module structure, their description through the augmentation ideal, and evaluation at a character after clearing an admissible denominator; the characters of ℤ_pˣ and their integrals against unit measures; and the evaluation of unit measures at varying characters in the form the Kubota–Leopoldt construction consumes. For procyclic Γ the augmentation ideal is principal and generated by [γ] − 1; Z_2ˣ is treated as {±1} × (1 + 4ℤ_2).

Standing assumptions for this layer: G is a group with no topology, R a commutative ring, δ : G →* R a homomorphism and c_g = δ(g) − 1; Q is the total quotient ring of R (`FractionRing R`, with `IsFractionRing R Q`; no domain or field structure is assumed) and ι = algebraMap R Q, which is injective; A is a commutative R-algebra with f = algebraMap R A, and hg : IsUnit (f(c_g)) is the admissibility hypothesis of an element g. For the unit measures: p is any prime, including 2; Z = ℤ_p, U = Zˣ and M = D(U,Z) with the multiplicative convolution of L1, commutative by L1/commutative-convolution; δ = diracHom : U →* M; Q = FractionRing M; P = pseudomeasures δ Q ⊆ Q is the M-submodule of pseudo-measures, i : M → P the inclusion and n_g(z) ∈ M the numerator c_g·z of a pseudo-measure z. Characters κ are `ContinuousMonoidHom U Z` (their values are units because U is a group), fκ(μ) ∈ ℚ_p is μ(κ), and t_k is the test u ↦ u^k. A family of characters κ : S → ContinuousMonoidHom U Z over a topological space S is continuous when s ↦ κ_s is continuous into C(U,Z) with the compact-open topology, that is uniformly, U being compact; pointwise continuity is not enough. No topology on P and no rigid-analytic parameter space is asserted, and no comparison with the completed group algebra is used.

### Pseudo-measures and admissible evaluation (`Iwasawa`)

Sources: [RJW](#ref-rjw), §3.6, Definition 3.34, p. 129.

Library inputs: `IsFractionRing.injective`, `IsUnit.mul_left_cancel`, `IsFractionRing`.

<a id="L3-pseudomeasures"></a>**Pseudomeasures.** Define Iwasawa.pseudomeasures δ Q : Submodule R Q to be (1 : Submodule R Q) / Submodule.span R (range (g ↦ ι(δ(g)−1))). This uses the submodule quotient. It is an R-module; it is not asserted to be a subring, a fractional ideal in the domain-specific sense, or a topological completion.

API: `mem_pseudomeasures_iff`: z belongs iff for every g there exists r ∈ R with ι(r)=ι(c_g)z. own lemma target; `pseudomeasure_ext`: Two pseudomeasures with equal underlying elements of Q are equal; `pseudomeasures_eq_top_of_trivial`: If δ(g)=1 for all g, pseudomeasures δ Q is the top submodule. This prevents the inverse-of-zero convention for FractionalIdeal from being substituted.

Tests: For G=PUnit, δ=1 : G →* ℤ and Q=ℚ, 1/2 is a pseudomeasure. For δ=Units.coeHom ℤ and Q=ℚ, 3 is a pseudomeasure. For δ=Units.coeHom ℤ and Q=ℚ, 1/2 belongs but 1/4 does not. Thus pseudomeasures need not be closed under multiplication.

Supporting lemmas: `pseudomeasure-membership`.

<a id="L3-integral-pseudomeasure"></a>**Integral inclusion.** Define Iwasawa.integral δ Q : R →ₗ[R] pseudomeasures δ Q by r ↦ ι(r).

API: `coe_integral`: The underlying element of integral δ Q r is ι(r). own lemma; `integral_zero`; `integral_injective`: The integral inclusion is injective.

Tests: For δ=Units.coeHom ℤ and Q=ℚ, the underlying value of integral 3 is 3. For G=PUnit, δ=1 and Q=ℚ, integral is the inclusion ℤ → ℚ and is not surjective: 1/2 is a pseudomeasure not of the form integral r. In the same example integral 1 ≠ integral 0.

Uses: pseudomeasure-membership.

Supporting lemmas: `integral-inclusion-value`.

<a id="L3-cleared-numerator"></a>**Cleared numerator.** For g ∈ G define Iwasawa.numerator δ Q g : pseudomeasures δ Q →ₗ[R] R by the unique n_g(z) satisfying ι(n_g(z))=ι(c_g)z.

API: `algebraMap_numerator`: ι(n_g(z))=ι(c_g)z. own lemma; `numerator_unique`: If ι(r)=ι(c_g)z then n_g(z)=r; `numerator_integral`; `numerator_one`.

Tests: For δ=Units.coeHom ℤ and any pseudomeasure z in ℚ, n_1(z)=0. For δ=Units.coeHom ℤ, n_{−1}(integral 2)=−4. For δ=Units.coeHom ℤ, the cleared numerator n_{−1}(1/2) is −1.

Uses: pseudomeasure-membership, integral-inclusion-value.

Supporting lemmas: `cleared-numerator-spec`, `cross-multiplied-numerators`.

<a id="L3-admissible-evaluation"></a>**Admissible pseudomeasure evaluation.** For g ∈ G with hg : IsUnit (f(c_g)), define Iwasawa.evalAt δ Q A g hg : pseudomeasures δ Q →ₗ[R] A by z ↦ u⁻¹ f(n_g(z)), where u is the unit represented by hg. The requirement is a unit in A, not merely a nonzero element.

API: `evalAt_spec`: f(c_g) evalAt_g(z)=f(n_g(z)). own lemma; `evalAt_eq`: Two admissible clearing elements give equal R-linear evaluation maps; promoted; `evalAt_integral`; `evalAt_unique`: Every R-linear extension of f along integral is evalAt_g; promoted; `evalAt_map`: For an R-algebra map A → B, the evaluation values commute with that map whenever the clearing factor is admissible; promoted. Identity and composition follow by function evaluation.

Tests: For δ=Units.coeHom ℤ, Q=ℚ, A=ℤ/3 and g=−1, where f(c_g)=f(−2)=1 is a unit, evaluation of 1/2 is 2, the inverse of 2 in ℤ/3, since n_{−1}(1/2)=−1. For δ=Units.coeHom ℤ, Q=A=ℚ, g=−1 and hg asserting the unit condition, evaluation of integral 3 is 3. With these data and the membership proof for 1/2, its evaluation is 1/2.

Uses: cleared-numerator. Sources: [RJW](#ref-rjw), Equation (3-11), pp. 129–130.

Supporting lemmas: `admissible-evaluation-spec`.

<a id="L3-independence-of-clearing-factor"></a>**Independence of clearing factor.** If f(c_g) and f(c_h) are units, evalAt δ Q A g hg = evalAt δ Q A h hh as R-linear maps.

Assumptions: hg : IsUnit (f(c_g)); hh : IsUnit (f(c_h)).

Uses: cross-multiplied-numerators, admissible-evaluation-spec. Sources: [RJW](#ref-rjw), Independence calculation following equation (3-11), p. 130.

Supporting lemmas: `evaluation-on-integral-elements`.

<a id="L3-uniqueness-of-evaluation"></a>**Uniqueness of admissible evaluation.** Let g be admissible. If L : pseudomeasures δ Q →ₗ[R] A satisfies L(integral r)=f(r) for every r, then L=evalAt_g.

Assumptions: hg : IsUnit (f(c_g)); L is R-linear and extends f on the integral inclusion.

Uses: integral-inclusion-value, cleared-numerator-spec, admissible-evaluation-spec. Sources: [RJW](#ref-rjw), Equation (3-11) and Remark 3.35, p. 130.

Supporting lemmas: `coefficient-change-evaluation`, `obstruction-to-fraction-extension`.

### Evaluation of unit measures at varying characters (`AbstractMeasure`)

Sources: [RJW](#ref-rjw), §3.6 Definition 3.34, equation(3-11), Remark 3.35 and complete Lemma 3.36(i)–(iii), pp. 129–131.

Library inputs: `mahler_apply`, `Polynomial.eval_eq_sum_range`, `descPochhammer_ne_zero_eval_zero`.

Supporting lemmas: `positive-polynomial-vanishing`, `positive-mahler-vanishing`.

<a id="L3-positive-moments-constant-amice"></a>**The constant Amice transform of positive-moment vanishing.** If μ∈D(Z,Z) kills every positive ordinary moment, its Amice transform equals the constant series with value μ(1).

Uses: positive-mahler-vanishing.

<a id="L3-unit-positive-moment-separation"></a>**Positive moments determine integral unit measures.** If μ∈M satisfies μ(t_k)=0 for every k>0, then μ=0.

Uses: positive-moments-constant-amice, L2/unit-measure-amice-kernel-equivalence, L2/psi-series.

Supporting lemmas: `unit-convolution-moments`.

<a id="L3-unit-moment-regularity"></a>**Nonvanishing positive moments imply regularity.** If μ∈M has μ(t_k)≠0 for every k>0, then μ belongs to nonZeroDivisors M.

Uses: unit-convolution-moments, unit-positive-moment-separation.

Supporting lemmas: `one-add-prime-unit`, `one-add-prime-positive-powers`.

<a id="L3-regular-dirac-difference"></a>**Regular Dirac differences from infinite-order units.** If a∈U satisfies (a:Z)^k≠1 for every k>0, then δ_a−1 is regular in M.

Uses: unit-moment-regularity, L1/convolution-algebra.

<a id="L3-regular-one-add-prime-difference"></a>**A concrete regular clearing factor.** For any a∈U with underlying value p+1, the measure δ_a−1 is regular.

Uses: one-add-prime-positive-powers, regular-dirac-difference.

<a id="L3-actual-positive-pseudomoment"></a>**Positive moments of unit pseudomeasures.** For k>0 define positivePseudoMoment(k):P→ℚ_p by the admissible evaluation for the power character u↦(u:Z)^k, included into ℚ_p.

API: `positivePseudoMoment_eq`: For any a with value p+1, the value is the kth numerator moment divided by (a^k−1), interpreted in ℚ_p; `positivePseudoMoment_integral`: On the integral inclusion of μ∈M, the value is μ(t_k) included into ℚ_p; `positivePseudoMoment_add`: Values add under addition in the pseudomeasure module; `positivePseudoMoment_smul`: For μ∈M and z∈P, the value on μ·z is μ(t_k) times the value on z.

Tests: At p=3, the integral atom at the unit 2 has kth positive pseudomoment 2^k: with a=4 its kth numerator moment is 2^k(4^k−1), and the division by 4^k−1 is not optional. The integral identity measure has all positive pseudomoments1. The integral atom at−1 has kth positive pseudomoment(−1)^k, including the dyadic case.

Uses: L1/dirac-hom, L1/character-integral-algebra-hom, L1/commutative-convolution, L2/unit-domain-homeomorphism, one-add-prime-unit, one-add-prime-positive-powers, admissible-evaluation, admissible-evaluation-spec, independence-of-clearing-factor, evaluation-on-integral-elements.

Supporting lemmas: `actual-pseudomoment-numerator`.

<a id="L3-actual-pseudomoment-separation"></a>**Positive moments determine unit pseudomeasures.** If z∈P has every positivePseudoMoment(k,z)=0 for k>0, then z=0.

Uses: actual-pseudomoment-numerator, unit-positive-moment-separation, regular-one-add-prime-difference, one-add-prime-unit, cleared-numerator-spec.

<a id="L3-actual-mass-fraction-obstruction"></a>**Total mass does not extend to the total quotient.** There is no ring homomorphism Q→Z whose restriction to M is the total-mass character integral.

Uses: L1/character-integral-algebra-hom, one-add-prime-unit, regular-one-add-prime-difference, obstruction-to-fraction-extension.

### Characters of the units and their integrals (`AbstractMeasure`)

Sources: [RJW](#ref-rjw), Definition 3.34, equation(3-11), its full independence argument and Remark 3.35, pp. 129–130.

Library inputs: `ContinuousMonoidHom`, `continuous_algebraMap`, `Continuous.eval_const`.

<a id="L3-actual-unit-character-evaluation"></a>**Actual nontrivial-character evaluation.** For κ≠1, define the additive homomorphism Eκ:P→ℚ_p by the generic admissible evaluation, using fκ as the scalar map. No homomorphism Q→ℚ_p is constructed.

API: `unitCharacterEval_eq`: For every g with κ(g)≠1, Eκ(z)=fκ(n_g(z))/(κ(g)−1). own lemma; `unitCharacterEval_integral`: Eκ(iμ)=fκ(μ). own lemma; `unitCharacterEval_smul`: Eκ(μ·z)=fκ(μ)Eκ(z), for the M-module structure on P; `unitCharacterEval_dirac`.

Tests: At p=3 with κ(u)=u², Eκ(iδ₂)=4: taking g=2, n_2(iδ₂)=δ₄−δ₂ has fκ-value 16−4=12 and κ(2)−1=3. Eκ(i1)=1 for the convolution identity. Eκ(i(cδ_g))=cκ(g) for c∈Z and g∈U.

Uses: L1/character-integral-algebra-hom, L1/dirac-hom, admissible-evaluation, independence-of-clearing-factor.

Supporting lemmas: `actual-unit-character-ratio`, `actual-unit-character-integral`, `actual-unit-character-numerator`.

<a id="L3-actual-unit-character-uniqueness"></a>**Uniqueness of the character extension.** Eκ is the unique additive map L:P→ℚ_p satisfying L(μ·z)=fκ(μ)L(z) and L(iμ)=fκ(μ).

Uses: actual-unit-character-evaluation, uniqueness-of-evaluation.

<a id="L3-actual-unit-character-positive-moment"></a>**Positive moments as character evaluations.** If κ(g)=g^k for every g∈U and k>0, then Eκ(z)=positivePseudoMoment_k(z).

Uses: actual-unit-character-evaluation, actual-positive-pseudomoment, one-add-prime-unit, one-add-prime-positive-powers, independence-of-clearing-factor.

<a id="L3-actual-unit-character-separation"></a>**Nontrivial characters separate pseudomeasures.** If Eκ(z)=Eκ(η) for every nontrivial Z-valued continuous character κ of U, then z=η.

Uses: actual-unit-character-positive-moment, actual-pseudomoment-separation, one-add-prime-unit, one-add-prime-positive-powers.

Supporting lemmas: `actual-unit-character-norm-bound`, `unit-character-integral-continuity`, `unit-character-clearing-open`, `unit-character-clearing-continuity`.

<a id="L3-unit-character-evaluation-continuity"></a>**Continuity away from the trivial character.** For fixed z∈P, the function s↦E_(κ_s)(z) is continuous on the subtype {s:S | κ_s≠1}.

Uses: unit-character-clearing-open, unit-character-clearing-continuity, actual-unit-character-ratio.

## L4 — Weierstrass theory and module structure

Weierstrass theory for Λ = O⟦T⟧ on Mathlib's Weierstrass factorization, the ring-theoretic consequences (noetherian, regular local of dimension two, factorial, finite free quotients by distinguished polynomials, the height-one primes), the structure theorem for finitely generated Λ-modules up to pseudo-isomorphism with vertical factors in powers of ϖ, pseudo-null modules, characteristic divisors and ideals with their multiplicativity, invariance, base change and change of generator, the invariants μ and λ, character idempotents and isotypic decomposition for a finite abelian H of order prime to p, the cyclotomic polynomials ω_n and ξ_n, and the growth formula for the orders of the finite quotients M/ω_nM. The identification O⟦Γ⟧ ≅ O⟦T⟧ over a complete noetherian local O with finite residue field of characteristic p, extending the integral coordinate of Tau Ceti ProfiniteProPGroups, is the first target of the layer (L4/iwasawa-coordinate), and the initial Fitting ideal that the characteristic ideal is compared with is its own target (L4/initial-fitting-ideal).

Standing assumptions for this layer: A is a commutative noetherian integrally closed domain with fraction field K, P(A) its set of height-one primes, at which A_𝔭 is a discrete valuation ring, with A = ⋂_{𝔭∈P(A)} A_𝔭; where A is regular local of dimension n, 2 ≤ n < ∞, it is integrally closed by the Auslander–Buchsbaum theorem (used, not restated); A is factorial wherever the ideal-valued characteristic invariant is used. O is a complete discrete valuation ring with uniformizer ϖ and finite residue field k of characteristic p, Λ = O⟦T⟧ (NSW specialises to O = ℤ_p from (5.3.6) on; over O the vertical factors are powers of ϖ, not of p), f ≠ 0. For analytic evaluations E is a complete nonarchimedean valued field with an injective valued inclusion Frac(O) → E, |ϖ| < 1, |O| ≤ 1, |Oˣ| = 1. Γ ≅ ℤ_p has a chosen topological generator γ, T = γ − 1, Γ_n is the subgroup of index p^n, ω_n = (1 + T)^{p^n} − 1 and ξ_n = ω_n/ω_{n−1} (ω_{−1} = 1). H is finite abelian with p ∤ #H, so #H is a unit in O; for individual-character components O contains every character value, and for nonsplit O Galois-orbit components with their unramified coefficient extensions are used; Γ′ ≅ ℤ_p, and O⟦Γ′ × H⟧ is identified with the product of the O⟦T⟧ over the characters of H through L4/iwasawa-coordinate and L4/character-decomposition. Modules are finitely generated Λ-modules; λ and F are defined through the torsion submodule T_Λ(M) of an arbitrary finitely generated module; statements about dimensions after inverting ϖ, exact-sequence additivity, the characteristic ideal and the Euler cardinality product assume the modules Λ-torsion, and the last assumes the invariant and coinvariant groups at depth n finite.

### Pseudo-null modules and pseudo-isomorphism (`TauCeti.Iwasawa`)

Sources: [NSW](#ref-nsw), (5.1.5)–(5.1.6), p. 269 ; Remark 1 after (5.1.7), p. 271; §3, Exercise 1, p. 300; [RJW](#ref-rjw), §13.1, p. 189.

Library inputs: `Module.Dual`, `LocalizedModule`, `Module.IsReflexive`.

Supporting lemmas: `bidual-intersection`.

<a id="L4-pseudo-null"></a>**Pseudo-null modules.** A finitely generated A-module M is pseudo-null if its localisation at every prime of height at most one is zero.

API: `IsPseudoNull`: Module.Finite A M and M_𝔭 = 0 for every prime of height ≤ 1; `isPseudoNull_iff_annihilator`: Every prime containing ann_A(M) has height ≥ 2; `IsPseudoNull.isTorsion`: Pseudo-null modules are torsion (Remark 2); `isPseudoNull_iff_eq_zero`: Over a Dedekind domain only 0 is pseudo-null (Remark 3); `isPseudoNull_iff_finite`: Over a two-dimensional noetherian integrally closed local domain with finite residue field, pseudo-null ⇔ finite (Remark 4); `IsPseudoNull.of_exact`: Submodules, quotients and extensions of pseudo-null modules are pseudo-null.

Tests: Over Λ = ℤ_p⟦T⟧, Λ/(p, T) = 𝔽_p is pseudo-null (finite). Λ/(p) is not pseudo-null: its support contains the height-one prime (p). Over A = ℤ_p, ℤ/p is not pseudo-null, since (p) has height one; only 0 is.

Sources: [NSW](#ref-nsw), (5.1.4) with Remarks 1–4, p. 269.

<a id="L4-pseudo-isomorphism"></a>**Pseudo-isomorphisms.** A linear map f:M→N between finitely generated A-modules is a pseudo-isomorphism if its kernel and cokernel are pseudo-null.

API: `IsPseudoIsomorphism`: ker f and coker f are pseudo-null; `isPseudoIsomorphism_iff_localization`: f_𝔭 is an isomorphism at every prime of height ≤ 1; `isPseudoIsomorphism_mul`: Lemma 5.1.6: multiplication by α with supp(A/α) ∩ supp(M) ∩ P(A) = ∅; `IsPseudoIsomorphism.comp`: Composites of pseudo-isomorphisms are pseudo-isomorphisms; `IsPseudoIsomorphism.exists_symm`: For finitely generated torsion modules a pseudo-isomorphism exists in the reverse direction; `isPseudoIsomorphism_iff_finite`: Over O⟦T⟧: finite kernel and cokernel.

Tests: M = Λ/(T) ≅ ℤ_p and α = p: multiplication by p is injective with cokernel 𝔽_p, a pseudo-isomorphism, since supp(Λ/p) ∩ supp(M) ∩ P(Λ) = {(p)} ∩ {(T)} = ∅. 𝔪 → Λ is a pseudo-isomorphism, but no pseudo-isomorphism Λ → 𝔪 exists (NSW §3, Exercise 1). Over a Dedekind domain pseudo-isomorphisms are isomorphisms.

Uses: pseudo-null.

<a id="L4-reflexive-torsion-free"></a>**reflexive_torsion_free** (removed). Reflexive modules are torsion-free over any commutative ring: Mathlib's instance `Module.IsReflexive.to_isTorsionFree` (`Mathlib.LinearAlgebra.Dual.Defs`).

### Structure of finitely generated Λ-modules

Sources: [NSW](#ref-nsw), (5.3.19)–(5.3.20), pp. 298–300.

Library inputs: `Submodule.eq_bot_of_le_smul_of_le_jacobson_bot`, `IsDedekindDomain`, `Submodule.torsion`.

<a id="L4-torsion-structure-normal-domain"></a>**Torsion modules over a normal domain up to pseudo-isomorphism.** For finitely generated M over A, there is a pseudo-isomorphism M→T_A(M)⊕(M/T_A(M)).

Uses: pseudo-isomorphism, pseudo-null, torsion-elementary-divisors. Sources: [NSW](#ref-nsw), (5.1.7) with Remarks 1–2, pp. 270–271.

Supporting lemmas: `reflexive-hull`, `reflexive-free-over-regular-local`.

<a id="L4-structure-theorem-regular-dimension-two"></a>**Structure theorem over a two-dimensional regular local ring.** Let A be a two-dimensional regular local ring and M a finitely generated A-module. There are finitely many height-one primes 𝔭_i, an integer r ≥ 0, integers n_i ≥ 1 and a pseudo-isomorphism M → A^r ⊕ ⊕_i A/𝔭_i^{n_i}. The data are determined by M: r = dim_K M ⊗_A K, {𝔭_i} = supp(T_A(M)) ∩ P(A), and the n_i are unique (Theorem 5.1.10).

Assumptions: A two-dimensional regular local ring, integrally closed (see reflexive-free-over-regular-local).

Uses: torsion-structure-normal-domain, reflexive-hull, reflexive-free-over-regular-local, torsion-elementary-divisors. Sources: [NSW](#ref-nsw), (5.1.10), p. 273.

<a id="L4-iwasawa-module-structure-theorem"></a>**Structure theorem for Iwasawa modules.** Let M be a finitely generated module over Λ = O⟦T⟧. There are r ≥ 0, integers m_i ≥ 1, irreducible distinguished polynomials F_j and integers n_j ≥ 1, and a homomorphism M → E = Λ^r ⊕ ⊕_i Λ/(ϖ^{m_i}) ⊕ ⊕_j Λ/(F_j^{n_j}) with finite kernel and cokernel. The number r, the multisets (m_i) and (n_j) and the ideals (F_j) are determined by M (Theorem 5.3.8 for O = ℤ_p). The μ-part is built from powers of the uniformizer ϖ, not of p: RJW Theorem 13.1 writes Λ/(p^{n_i}) over O_L⟦T⟧, which fails when L/ℚ_p is ramified (source finding E15).

Uses: structure-theorem-regular-dimension-two, iwasawa-algebra-regular-local, height-one-primes, pseudo-null, pseudo-isomorphism. Sources: [NSW](#ref-nsw), (5.3.8), p. 292; [RJW](#ref-rjw), Theorem 13.1, p. 189.

<a id="L4-projective-dimension-and-resolution"></a>**No finite submodules, freeness and the minimal resolution.** For finitely generated Λ-module M, a minimal exact resolution 0→Λ^d₂→Λ^d₁→Λ^d₀→M→0 has d₀=dim_Fp(H₀/p), d₁=dim_Fp(H₀[p])+dim_Fp(H₁/p), d₂=dim_Fp(H₁[p]), with continuous homology H₀=M_Γ and H₁=M^Γ.

Uses: delta-and-cyclotomic-submodules, iwasawa-free-criterion.

Supporting lemmas: `finite-quotient-criterion`, `iwasawa-invariants-free-criterion`.

### Weierstrass theory of O⟦T⟧

Sources: [NSW](#ref-nsw), (5.3.5), pp. 290–291, and (5.3.13), p. 294.

Library inputs: `PowerSeries.exists_isWeierstrassFactorization`, `PowerSeries.IsWeierstrassFactorization.unique`, `PowerSeries.isUnit_iff_constantCoeff`.

Supporting lemmas: `iwasawa-maximal-ideal`, `iwasawa-algebra-regular-local`.

<a id="L4-weierstrass-adapter"></a>**Mathlib's Weierstrass theory as NSW's division lemma and preparation theorem.** For a monic polynomial F over a commutative ring O, multiplication by the AdjoinRoot.root F has characteristic polynomial F in the monic power basis, including F=1. For a complete local coefficient ring and a series f with finite reduced degree, transport this identity through the Weierstrass quotient equivalence to identify multiplication by T on O[[T]]/(f) with its distinguished factor.

Assumptions: NSW allows any complete noetherian local O with finite residue field; Mathlib needs IsAdicComplete (maximalIdeal O) O.

Sources: [NSW](#ref-nsw), (5.3.1)–(5.3.4), pp. 289–290.

Supporting lemmas: `height-one-primes`, `nonzero-power-series-factorization`, `cyclotomic-weierstrass-polynomials`, `cyclotomic-product`, `iwasawa-residue-field`, `cyclotomic-distinguished`.

### The invariants μ and λ, projectors and components (`TauCeti.Iwasawa`)

Sources: [NSW](#ref-nsw), (5.3.9) with Remarks 1–3, pp. 292–293.

Library inputs: `Module.length`, `Module.length_eq_add_of_exact`, `LinearMap.charpoly`.

<a id="L4-iwasawa-invariants"></a>**Iwasawa invariants and the characteristic polynomial.** For a finitely generated Λ-module M define μ(M) as the finite length, over Λ_(ϖ), of the localisation of T_Λ(M) at (ϖ). For torsion M this is length M_(ϖ); on arbitrary M the torsion submodule is essential.

API: `muInvariant`: μ(M), the finite length of the localisation of T_Λ(M) at (ϖ); for torsion M this is length M_(ϖ); `lambdaInvariant`: λ(M) = Σ n_j deg F_j; `charPoly`: F_{M,γ} = ∏ F_j^{n_j}, a distinguished polynomial; `lambdaInvariant_eq_finrank`: λ(M) = dim_{Frac O} M ⊗_O Frac O for torsion M; `charPoly_eq_charpoly`: For finitely generated torsion M, F_M is LinearMap.charpoly of T on the finite-dimensional space M ⊗_O Frac O; `muInvariant_add`: μ is additive in short exact sequences of torsion modules; likewise lambdaInvariant_add.

Tests: M = Λ/(ϖ): μ = 1, λ = 0, F_M = 1 over every stated coefficient DVR; the ℤ_p control uses ϖ=p. For O=ℤ_p, M = Λ/(T² + pT + p): μ=0, λ=2 and F_M=T²+pT+p; the polynomial is Eisenstein. M = Λ/(p, T) = 𝔽_p: μ = λ = 0 and F_M = 1.

Uses: iwasawa-module-structure-theorem, weierstrass-adapter.

<a id="L4-iwasawa-invariants-api-1"></a>**lambdaInvariant.** For an arbitrary finitely generated Λ=O[[T]] module M, define λ(M) as the degree of the horizontal characteristic polynomial of its Λ-torsion submodule. An elementary decomposition gives λ(M)=Σ e_j deg F_j; free summands contribute zero.

API: `lambdaInvariant_spec`: λ(M)=degree F_M; the elementary formula follows by the product-degree formula and charPoly_elementary_spec; `lambdaInvariant_zero`; `lambdaInvariant_equiv`: A linear equivalence between the stated modules transports lambdaInvariant to the corresponding object, over the same ring and chosen generator.

Tests: M = Λ/(ϖ): μ = 1, λ = 0, F_M = 1 over every stated coefficient DVR; the ℤ_p control uses ϖ=p. For O=ℤ_p, M = Λ/(T² + pT + p): μ=0, λ=2 and F_M=T²+pT+p; the polynomial is Eisenstein. M = Λ/(p, T) = 𝔽_p: μ = λ = 0 and F_M = 1.

Uses: iwasawa-module-structure-theorem.

<a id="L4-iwasawa-invariants-api-2"></a>**charPoly.** For an arbitrary finitely generated Λ=O[[T]] module M, define F_M as the monic product of the horizontal distinguished irreducibles, with multiplicities, in an elementary decomposition of its Λ-torsion submodule. It is independent of that decomposition; free and vertical factors contribute one.

API: `charPoly_elementary_spec`: A pseudo-isomorphism from the torsion submodule to a product of vertical quotients Λ/(ϖ^m_i) and horizontal quotients Λ/(F_j^e_j), with each F_j distinguished and irreducible, gives F_M=∏F_j^e_j. Vertical factors contribute one; `charPoly_zero`; `charPoly_equiv`: A linear equivalence between the stated modules transports charPoly to the corresponding object, over the same ring and chosen generator.

Tests: M = Λ/(ϖ): μ = 1, λ = 0, F_M = 1 over every stated coefficient DVR; the ℤ_p control uses ϖ=p. For O=ℤ_p, M = Λ/(T² + pT + p): μ=0, λ=2 and F_M=T²+pT+p; the polynomial is Eisenstein. M = Λ/(p, T) = 𝔽_p: μ = λ = 0 and F_M = 1.

Uses: iwasawa-module-structure-theorem.

<a id="L4-iwasawa-invariants-api-4"></a>**charPoly_eq_charpoly.** For finitely generated torsion M, F_M is LinearMap.charpoly of T on the finite-dimensional space M ⊗_O Frac O.

Uses: iwasawa-invariants-api-2, weierstrass-adapter.

<a id="L4-iwasawa-invariants-api-8"></a>**invariants_generator_indep.** r, μ and λ do not depend on γ.

Uses: iwasawa-invariants.

### The Iwasawa coordinate and the initial Fitting ideal (`TauCeti.Iwasawa`, `TauCeti.Module`)

Sources: [NSW](#ref-nsw), (5.3.5), pp. 290–291, and (5.3.13), p. 294; [Stacks](#ref-stacks), Section 15.8 (Tag 07Z6): Lemma 15.8.2 (Tag 07Z8), Definition 15.8.3 (Tag 07Z9) and Lemma 15.8.4 (Tag 07ZA); [Dasgupta–Kakde](#ref-dk), Appendix B.2, first paragraph, p. 93, for the convention Fitt = Fitt^0.

<a id="L4-iwasawa-coordinate"></a>**The Iwasawa coordinate over O.** For a prime p and a local noetherian ring O, complete for its maximal ideal 𝔪 and of residue characteristic p (so p ∈ 𝔪 and O is p-adically complete; the source takes O to be the integers of a finite extension of ℚ_p), construct the level-n coordinate O⟦T⟧ → O[ℤ/p^nℤ], T ↦ [1] − 1, surjective with kernel (ω_n), ω_n = (1 + T)^{p^n} − 1, compatible with the transition maps, and assemble them into O⟦T⟧ → ∏_n O[ℤ/p^nℤ]. Under the same hypotheses prove ⋂_n (ω_n) = 0, so the map is injective, and that its image is the ring of compatible families, that is lim_n O[ℤ/p^nℤ] = O⟦Γ⟧ for Γ = ℤ_p with topological generator γ ↦ 1 + T; a change of generator is the substitution T ↦ (1 + T)^u − 1, u ∈ ℤ_pˣ. For O = ℤ_p this is `completedGroupAlgebra.powerSeriesCoordinate` of Tau Ceti ProfiniteProPGroups, layer 9, read through L1/measure-completed-algebra-equiv.

Assumptions: O is local, noetherian, 𝔪-adically complete, with residue characteristic p (`IsLocalRing`, `IsNoetherianRing`, `IsAdicComplete (maximalIdeal O) O`, `CharP (ResidueField O) p`); this makes p a non-unit in the Jacobson radical and O p-adically complete, which the level maps already need: for O = ℚ, p is a unit, ω_n generates (T) for every n, no ring map O⟦T⟧ → O[ℤ/p^nℤ] sends T to [1] − 1, and the intersection of the (ω_n) is not zero.

API: `levelCoordinate`; `levelCoordinate_X`; `levelCoordinate_surjective`; `ker_levelCoordinate`: the kernel is (ω_n); `levelCoordinate_transition`; `iwasawaCoordinate`, with `iwasawaCoordinate_injective`, `range_iwasawaCoordinate` and `iInf_span_cyclotomic_eq_bot`; all under the hypotheses above.

Tests: At level 0 the coordinate is the constant coefficient. (1 + T)^k maps to the group element [k] at every level. ω_n maps to 0 at level n but not at level n + 1, and T^{p^n} does not map to 0 at level n + 1, so the kernel at level n is (ω_n) and not (T^{p^n}).

Uses: `PowerSeries.X`, `ZMod.castHom`, `IsAdicComplete`. Sources: [NSW](#ref-nsw), (5.3.5), pp. 290–291, (5.3.13), p. 294.

<a id="L4-initial-fitting-ideal"></a>**The initial Fitting ideal.** For a commutative ring R and a finitely presented R-module M, Fitt⁰_R(M) is Tau Ceti's `TauCeti.fittingIdeal R M 0` (a91d3aaf, `RingTheory/FittingIdeal/Basic.lean`, defined for finite M through the minors ideal of the relations of any finite free presentation), which already carries independence of the presentation (`fittingIdeal_eq_minorsIdeal_ker`), base change (`fittingIdeal_baseChange`), Fitt⁰(R/I) = I (`fittingIdeal_quotient_zero`), invariance under isomorphism (`fittingIdeal_congr`), and for free modules, Fitt⁰ = R iff the rank is 0 (`fittingIdeal_eq_top_iff_finrank_le`; the general Fitt⁰ = R iff M = 0 is `fittingIdeal_eq_top_iff` below). The target is the remaining API on that declaration: Fitt⁰_R(M) ⊆ Ann_R(M), and Fitt⁰(M ⊕ N) = Fitt⁰(M)·Fitt⁰(N) for finite M, N; and the tests below. Tau Ceti StableReduction, layer 1, consumes the same declaration for the relative singular locus.

API: `fittingIdeal_le_annihilator`: Fitt⁰_R(M) ⊆ Ann_R(M); `fittingIdeal_prod`: Fitt⁰(M × N) = Fitt⁰(M)·Fitt⁰(N); the library lemmas named above are used, not restated.

Tests: Fitt⁰(R/(a)) = (a). Fitt⁰(R^n) = 0 for n ≥ 1 over a nonzero ring, and Fitt⁰(0) = R. Fitt⁰_ℤ(ℤ/2 ⊕ ℤ/2) = (4) while the annihilator is (2), so the Fitting ideal is not the annihilator.

Uses: `Module.FinitePresentation`, `Matrix.det`, `Module.annihilator`. Sources: [Stacks](#ref-stacks), Lemma 15.8.4 (Tag 07ZA), parts (2) and (6).

### Characteristic ideals (`TauCeti.Iwasawa`)

Sources: [RJW](#ref-rjw), Definition 13.3, p. 190; Lemma 13.6, p. 190; [NSW](#ref-nsw), (5.3.9) and Remark 2, pp. 292–293.

Library inputs: `Module.length`, `LocalizedModule`, `Module.length_eq_add_of_exact`.

<a id="L4-characteristic-ideal"></a>**The characteristic ideal.** For a finite torsion module over a noetherian normal UFD A, define charIdeal(M) as the finite product of the height-one prime ideals raised to their local-length multiplicities in charDivisor(M). This is an the ideal; unique factorisation makes it principal.

API: `charDivisor`: div_A(M) = Σ_𝔭 length_{A_𝔭}(M_𝔭)[𝔭] over height-one primes; `charIdeal`: The principal ideal ∏𝔭^{length} when A is factorial; `charIdeal_mul_of_exact`: Multiplicative in short exact sequences; `charIdeal_eq_of_pseudoIso`: Invariant under pseudo-isomorphism; `charIdeal_quotient_span`; `charIdeal_eq_top_iff`: char_A(M) = A iff M is pseudo-null.

Tests: char(Λ/(T² − p)) = (T² − p). char(Λ/(p, T)) = Λ, while Fitt₀(Λ/(p, T)) = (p, T). Λ/(T²) and Λ/(T) ⊕ Λ/(T) both have characteristic ideal (T²) but are not pseudo-isomorphic.

Uses: pseudo-null, pseudo-isomorphism, torsion-structure-normal-domain, iwasawa-invariants, initial-fitting-ideal.

<a id="L4-character-decomposition"></a>**Isotypic decomposition over Λ(H × ℤ_p) with #H prime to p.** For split O containing every character value of finite abelian H of order prime to p, define e_ω=(1/#H)Σ_a ω(a)⁻¹[a] in the O[H].

API: `charIdempotent`: e_ω = (1/#H)Σ ω^{−1}(a)[a]; `charIdempotent_mul`: e_ωe_ω′ = δ_{ωω′}e_ω; `sum_charIdempotent`; `isotypicComponent`: M^{(ω)} = e_ωM; `isotypicDecomposition`: M ≃ ⊕_ω M^{(ω)} as Λ(Γ)-modules; `charIdealProduct`: char_{Λ(Γ)}(M) = ⊕_ω char_Λ(M^{(ω)}).

Tests: H = {1, h}, p odd: e_± = (1 ± h)/2 are orthogonal idempotents summing to 1 (Suggested.lean). Γ = ℤ_p^× = μ_{p−1} × (1 + pℤ_p), p odd: the characters ω^i take values in μ_{p−1} ⊂ ℤ_p, so O = ℤ_p suffices. H = C_p: 1/p ∉ O and O[C_p] is local, with no nontrivial idempotents.

Uses: characteristic-ideal. Sources: [RJW](#ref-rjw), Lemma 13.4 and Definition 13.5, p. 190.

<a id="L4-characteristic-ideal-api-0"></a>**charDivisor.** div_A(M) = Σ_𝔭 length_{A_𝔭}(M_𝔭)[𝔭] over height-one primes.

API: `charDivisor_spec`: At a height-one prime, charDivisor(M) equals the finite A_𝔭-length of M_𝔭; at other primes it is zero. Its finitely supported carrier requires proofs of finite support and finite local length; `charDivisor_zero`; `charDivisor_equiv`: A linear equivalence between the stated modules transports charDivisor to the corresponding object, over the same ring and chosen generator.

Tests: div_A(0)=0. For Λ=ℤ_p[[T]], div(Λ/(T²)) has coefficient 2 at (T), zero elsewhere. For Λ=ℤ_p[[T]], div(Λ/(p,T))=0 even though the module is nonzero.

<a id="L4-characteristic-ideal-api-6"></a>**charIdeal_eq_span_mu_charPoly.** On Λ = O⟦T⟧: char_Λ(M) = (ϖ^μ F_{M,γ}).

Uses: characteristic-ideal.

<a id="L4-character-decomposition-api-3"></a>**isotypicComponent.** For a module over the finite group algebra O[H], with its compatible O-action, define the χ-isotypic component to be the range of the O-linear action of e_χ. With unit group order this range consists precisely of vectors on which h acts by χ(h).

API: `isotypicComponent_spec`: With #H a unit, m is in the projector range iff h·m=χ(h)m for every h in H; `isotypicComponent_zero`; `isotypicComponent_equiv`: A linear equivalence between the stated modules transports isotypicComponent to the corresponding object, over the same ring and chosen generator.

Tests: H=1 gives the entire module as its sole isotypic component. For a cyclic group generated by h of order two and unit group order, the trivial-character projector range is exactly the vectors fixed by h. For the same group and χ(h)=−1, the χ-projector range is exactly the vectors on which h acts by −1. These test the group-algebra module action.

Uses: character-decomposition. Sources: [RJW](#ref-rjw), Lemma 13.4 and Definition 13.5, p. 190.

<a id="L4-character-decomposition-api-5"></a>**charIdealProduct.** For a finite family of finite torsion A-modules M_i over a noetherian normal UFD A, define charIdealProduct in the product ring ∏_i A as the intersection of the inverse images of charIdeal_A(M_i) under the coordinate evaluations. The completed-algebra use requires the supplied split product equivalence and its module components.

API: `charIdealProduct_spec`: A tuple belongs to charIdealProduct exactly when its i-th coordinate belongs to charIdeal_A(M_i) for every i; `charIdealProduct_zero`; `charIdealProduct_equiv`: A linear equivalence between the stated modules transports charIdealProduct to the corresponding object, over the same ring and chosen generator.

Tests: The zero module has unit characteristic ideal in every component. For H=1 and M=Λ/(T²), charIdealProduct(M)=(T²). For split H=C₂ at odd p, put M=Λ/(T) in the plus component and zero in the minus component. Its product characteristic ideal is ((T),Λ), not the unit ideal.

Uses: character-decomposition-api-4, characteristic-ideal. Sources: [RJW](#ref-rjw), Lemma 13.4 and Definition 13.5, p. 190.

### Cyclotomic polynomials and growth (`TauCeti.Iwasawa`)

Sources: [NSW](#ref-nsw), (5.3.11)–(5.3.16), pp. 293–296.

Supporting lemmas: `delta-and-cyclotomic-submodules`.

<a id="L4-iwasawa-growth-formula"></a>**Iwasawa's growth formula.** Let M be a finitely generated torsion Λ-module and n₀ ≥ d(M). Then #(M/(ω_n/ω_{n₀})M) = p^{μp^n + λn + ν} for all sufficiently large n, where μ = μ(M), λ = λ(M) and ν does not depend on n (Proposition 5.3.17). Its separate proof input is cyclotomic-growth-step (Lemma5.3.18). When d(M) = −1, taking n₀ = −1 (ω_{−1} = 1) gives #M_{Γ_n} = #M/ω_nM = p^{μp^n+λn+ν}.

Uses: iwasawa-invariants, delta-and-cyclotomic-submodules, cyclotomic-weierstrass-polynomials, pseudo-isomorphism, cyclotomic-growth-step. Sources: [NSW](#ref-nsw), (5.3.17)–(5.3.18), pp. 296–298.

Supporting lemmas: `finite-coinvariants-euler-characteristic`.

<a id="L4-delta-submodule"></a>**delta_submodule.** Define M_δ=⋃_n ker(ω_n:M→M); this is a Λ-submodule.

API: `mem_delta`: x belongs iff ω_n x=0 for some n; `delta_map`: Λ-linear maps preserve this submodule; `delta_submodule_zero`; `delta_submodule_equiv`: A linear equivalence between the stated modules transports delta_submodule to the corresponding object, over the same ring and chosen generator; `delta_monotone`: A submodule inclusion carries the delta submodule into that of the ambient module.

Tests: M=0 gives M_δ=0. For M=Λ the delta submodule is zero. For M=Λ/(T), M_δ=M.

Uses: cyclotomic-weierstrass-polynomials.

<a id="L4-cyclotomic-primary-submodule"></a>**cyclotomic_primary_submodule.** On a ℤ_p[[T]]-module M set C₀=0 and C_(r+1) to the preimage in M of δ(M/C_r). Define M_cycl as the supremum of this increasing sequence. For finitely generated M, stabilization makes its quotient have zero delta submodule; M_cycl is finite over ℤ_p and has the cyclotomic primary elementary factors, including their higher powers, up to pseudo-isomorphism.

API: `mem_cyclotomic_primary_submodule`: An element belongs to M_cycl iff it belongs to one of the recursively defined preimages C_r; `cyclotomic_primary_submodule_finite`: For finitely generated M with its compatible coefficient action, M_cycl is finite over ℤ_p; `delta_quotient_cyclotomic_primary`: For finitely generated M, δ(M/M_cycl)=0.

Tests: The zero module has zero cyclotomic-primary submodule. A free rank-one Λ-module has zero cyclotomic-primary submodule. For Λ/(T²), M_cycl is the entire module whereas δ(M) is proper. This distinguishes saturation from a single union of cyclotomic kernels.

Uses: delta-finite-control, iwasawa-module-structure-theorem.

Supporting lemmas: `delta-maximal-finite-submodule`, `delta-cyclotomic-elementary-factors`, `quotient-delta-torsion-free`.

## L5 — Determinants, specialization and exactness

Determinant lines of perfect complexes, their specialization, and the exactness of the compact inverse systems that arithmetic uses. The targets are stated below at the level of the perfect complexes and compact modules of Mathlib; nothing is asserted for arbitrary modules over nonregular coefficient rings.

### Determinant lines of perfect complexes

Standing assumptions: A is a commutative ring; perfect complexes are bounded complexes of finite projective A-modules, Mathlib's `HomologicalComplex` over `ModuleCat A` with the projectivity and boundedness hypotheses stated; a determinant line is a graded invertible module, an invertible A-module `L` with a locally constant parity.

<a id="L5-determinant-line"></a>**The determinant of a perfect complex.** Define det_A(P) for a bounded complex P of finite projective A-modules as the alternating tensor product of the top exterior powers of its terms, with its parity, and prove: det is functorial in isomorphisms of complexes; a quasi-isomorphism P → Q of perfect complexes induces a canonical isomorphism det P ≅ det Q, compatible with composition; a short exact sequence of perfect complexes 0 → P′ → P → P″ → 0 (degreewise split) induces det P ≅ det P′ ⊗ det P″; det commutes with base change along any ring map A → A′; det(P^∨) ≅ (det P)^{−1} with the sign convention recorded in the API.

API: `detLine`; `detLine_of_iso`; `detLine_quasiIso`: the canonical isomorphism and its transitivity; `detLine_shortExact`; `detLine_baseChange`; `detLine_dual`; `detLine_shift`: det(P[1]) = (det P)^{−1} with parity shifted; `detLine_acyclic`: an acyclic perfect complex has a canonical trivialization det P ≅ A.

Tests: For P = A in degree 0, det P = A with even parity. For P = (A --a--> A) with a a non-zero-divisor, det P ≅ A and the canonical rational trivialization after inverting a is multiplication by a. For a finite projective module P of rank r, det(P[0]) = Λ^r P.

Uses: `exteriorPower`, `exteriorPower.map_top_eq_det_smul`, `HomologicalComplex`, `ModuleCat`, `Module.Projective`. Sources: [Knudsen–Mumford](#ref-km), Chapter I, Definition 1, pp. 23–24 (the determinant functor on perfect complexes with its short-exact-sequence isomorphisms, compatibility with base change and normalization) and Theorem 1, p. 25 (existence and uniqueness up to canonical isomorphism, and the trivialization f(0) : det H → 1 of an acyclic complex).

<a id="L5-rational-trivialization"></a>**Rational trivialization and the characteristic divisor.** For Λ = O⟦T⟧ and a perfect complex P of Λ-modules all of whose cohomology modules are Λ-torsion, P becomes acyclic after tensoring with the fraction field Q of Λ, so det_Λ(P) ⊗ Q ≅ Q canonically; the image of det_Λ(P) in Q is the fractional ideal ∏_i char_Λ(H^i(P))^{(−1)^i}.

Assumptions: O a complete discrete valuation ring with finite residue field; every H^i(P) finitely generated and torsion, so that its characteristic ideal of L4 is defined.

Uses: L5/determinant-line, L4/characteristic-ideal, L4/characteristic-ideal-api-2, `IsFractionRing`. Sources: [Knudsen–Mumford](#ref-km), Theorem 1, p. 25, for the trivialization of an acyclic complex; [RJW](#ref-rjw), Definition 13.3 and Lemma 13.6, p. 190, for the characteristic ideals that the divisor is built from; the identification of the image with the alternating product of characteristic ideals has no source in this roadmap's register and is stated as the specification.

<a id="L5-specialization"></a>**Specialization of determinants and the Tor correction.** For a perfect complex P over Λ and a quotient A′ = Λ/(f), det_{A′}(P ⊗^L_Λ A′) = det_Λ(P) ⊗_Λ A′ canonically; when f is a non-zero-divisor on every H^i(P), the cohomology of P ⊗^L A′ is H^i(P)/f and the specialized determinant is computed from these quotients alone; in general the cohomology sequence carries the terms Tor_1^Λ(H^{i+1}(P), A′), and the specialized determinant is the alternating product over both.

Assumptions: f ∈ Λ; P perfect; the derived tensor product is the ordinary tensor product of the complex of projectives.

Tests: P = Λ/(T) resolved by (Λ --T--> Λ) and f = T: the specialization has H^0 = H^{−1} = O and det is trivial, while the naive quotient H^0(P)/T = O alone is not. A finite Λ-module M has char_Λ(M) = Λ but M/TM ≠ 0 in general.

Uses: L5/determinant-line, L4/characteristic-ideal, `lTensor_exact`, `Module.FinitePresentation`. Sources: [Knudsen–Mumford](#ref-km), Definition 1(iii), p. 24, for the compatibility of det with base change; the Tor-correction description of the specialized cohomology has no source in this roadmap's register and is stated as the specification.

### Compact inverse systems and topological Nakayama

Standing assumptions: compact modules are compact Hausdorff topological abelian groups with a continuous action of a profinite ring; inverse systems are indexed by ℕ or by a directed set with countable cofinal subset.

Sources: [RJW](#ref-rjw), Proposition 13.13 and its proof, p. 193, where the inverse limit of the sequences 0 → E⁺_{n,1} → U⁺_{n,1} → Gal(M⁺_n/L⁺_n) → 0 is taken; RJW justifies its exactness by the terms being finitely generated ℤ_p-modules (Mittag-Leffler), whereas the targets below derive it from compactness of the terms, which is the statement arithmetic uses. The same exactness along a tower with surjective transition maps is `TauCeti.exists_forall_map_succ_eq_and_forall_eq_of_surjective` (`TauCeti.Topology.Compactness.InverseSystem`) of Tau Ceti ProfiniteProPGroups, layer 9.

<a id="L5-compact-limit-exact"></a>**Exactness of inverse limits of compact modules** (removed). The content, surjectivity of lim B_n → lim C_n for a tower of compact Hausdorff groups with continuous levelwise surjections commuting with the transition maps, is Tau Ceti `TauCeti.exists_forall_map_succ_eq_and_forall_eq_of_surjective` (`TauCeti.Topology.Compactness.InverseSystem`; the directed case is `TauCeti.exists_forall_map_eq_of_compact_t2`); exactness on the left is the closed-embedding formality.

<a id="L5-topological-nakayama"></a>**Topological Nakayama.** For Λ = O⟦T⟧ (more generally a compact local ring with finite residue field and maximal ideal 𝔪) and a compact Hausdorff topological Λ-module M with continuous action: M = 0 if M/𝔪M = 0; M is finitely generated over Λ if M/𝔪M is finite, by lifts of a finite spanning set; and a map of compact Λ-modules is surjective if it is surjective modulo 𝔪.

Assumptions: the action Λ × M → M is continuous; compactness of M replaces the finite-generation hypothesis of the algebraic Nakayama lemma.

Tests: M = Λ with its adic topology: M/𝔪M = 𝔽 is finite and M is generated by one element. M = ∏_{n} 𝔽 (a compact Λ-module with trivial T-action): M/𝔪M = M is infinite and M is not finitely generated. The lemma fails for the discrete module ℚ_p/ℤ_p, whose quotient by p is zero.

Uses: L4/iwasawa-maximal-ideal, L5/compact-limit-exact, `Submodule.eq_bot_of_le_smul_of_le_jacobson_bot`. Sources: none in this roadmap's register; the statement is the standard topological Nakayama lemma, and is stated here as the specification.

## L6 — Gorenstein coefficient orders and exact duality

The ring theory of coefficient orders used by integral Brumer–Stark and Euler-system arguments, in the setting of Dasgupta–Kakde: character group rings O[G] with their evaluation at characters, the lattice and unit theory, the sharp involution and the contragredient dual; quadratic presentations and the comparison of their Fitting ideals; higher Fitting ideals, their chain and their behaviour under extensions and fibre products; compound matrices and higher adjugates; exterior powers and the annihilator of a cokernel; and transposed presentations. The initial Fitting ideal itself is L4/initial-fitting-ideal.

Standing assumptions for this layer: the setting of Dasgupta–Kakde §2.2: p is an odd prime; G is a finite abelian group, G = G_p × G′ with G_p its p-Sylow subgroup and G′ of order prime to p; O is the valuation ring of a finite extension K of ℚ_p with finite residue field k, containing all values of all characters of G, that is `HasEnoughRootsOfUnity O (Monoid.exponent G)`; Ĝ = Hom(G, Oˣ) has order #G (`CommGroup.card_monoidHom_of_hasEnoughRootsOfUnity`). The idempotents e_ω and their relations are those of L4/character-decomposition, stated there for a complete discrete valuation ring O with finite residue field of characteristic p and a finite abelian H with p ∤ #H, here with H = G′. The hypothesis on Ψ enters only through the locality of R_Ψ (L6/character-group-ring-local): a statement holds for every Ψ for which R_Ψ is a local ring and a finite O-module. R is an arbitrary commutative ring with no noetherian or finiteness hypothesis beyond the stated ones; Fitt_R(M) = Fitt⁰_R(M) is the initial Fitting ideal of L4/initial-fitting-ideal of a finitely presented R-module M (the convention of Dasgupta–Kakde, Appendix B.2, p. 93), and Fitt^i_R(M) for i ≥ 1 is Tau Ceti's `fittingIdeal R M i`. For a ∈ R and an ideal J of R, a^# = σ^{−1}(a) ∈ R^# and J^# = σ^{−1}(J); for R = R_Ψ and σ = # this is the notation of L6/sharp-involution.

### Character group rings and their duals (`TauCeti`)

Sources: [Dasgupta–Kakde](#ref-dk), §2.2, p. 15.

Library inputs: `HasEnoughRootsOfUnity`, `Monoid.exponent`, `MonoidAlgebra.mapDomainAlgHom`.

<a id="L6-character-evaluation"></a>**Evaluation of the group ring at characters and the joint evaluation.** For a commutative ring O, a commutative group G and a character ψ : G → O^× (a group homomorphism), the character evaluation ev_ψ : O[G] → O is the O-algebra homomorphism Σ_g a_g g ↦ Σ_g a_g ψ(g), the lift of g ↦ ψ(g) through the universal property of the monoid algebra; it is the Tau Ceti declaration TauCeti.DiagonalizableGroup.point ψ with value algebra A = O and is not defined again; TauCeti.charEval is an abbreviation for it. For a set Ψ of characters the joint evaluation ev_Ψ : O[G] → ∏_{ψ∈Ψ} O is x ↦ (ev_ψ(x))_{ψ∈Ψ}; this is the new construction. Following Dasgupta–Kakde, ψ(x) means ev_ψ(x) for x ∈ O[G].

Assumptions: O is a commutative ring and G a commutative group; the maps need no finiteness. Row orthogonality assumes G finite and O a domain. A character is a group homomorphism ψ : G → O^×; the trivial character is 1. Injectivity of the joint evaluation at all characters is a separate lemma (API item TauCeti.jointEval_injective); it assumes G finite and O a domain with HasEnoughRootsOfUnity O (Monoid.exponent G).

API: `charEval`: ev_ψ : O[G] →ₐ[O] O, Σ a_g g ↦ Σ a_g ψ(g): abbreviation of TauCeti.DiagonalizableGroup.point ψ with R = A = O; `charEval_single`: ev_ψ(a·g) = a·ψ(g) for a ∈ O, g ∈ G: TauCeti.DiagonalizableGroup.point_single specialised to A = O; `charEval_of`: ev_ψ(g) = ψ(g): TauCeti.DiagonalizableGroup.point_single_one specialised to A = O; `charEval_one`: The trivial character evaluates by the augmentation: ev_1(a·g) = a; `charEval_one_eq_augmentation`: As a ring homomorphism, ev_1 is the coefficient-sum augmentation TauCeti.MonoidAlgebra.augmentation O G : O[G] → O; `charEval_sum_eq_zero`: For G finite, O a domain and ψ ≠ 1: ev_ψ(Σ_{g∈G} g) = 0 (row orthogonality).

Tests: G with an element h ≠ 1, h² = 1, and ψ(h) = −1: ev_ψ(1 + h) = 0 and ev_ψ(1 − h) = 2. G trivial: ev_1 : O[G] → O is bijective. If G has an element h ≠ 1 and O ≠ 0, no single ev_ψ is injective: it kills h − ψ(h)·1 ≠ 0.

Supporting lemmas: `joint-evaluation-injective`.

<a id="L6-character-group-ring"></a>**Character group rings.** In the Dasgupta–Kakde setting, for a subset Ψ ⊆ Ĝ the character group ring R_Ψ is the image of the joint evaluation ev_Ψ : O[G] → ∏_{ψ∈Ψ} O, an O-subalgebra of the product, together with the canonical surjection α_Ψ : O[G] ↠ R_Ψ; equivalently R_Ψ = O[G]/⋂_{ψ∈Ψ} ker ev_ψ. Quotients of O[G] of this form are the character group rings. R_Ψ is in general a proper, non-maximal O-order in ∏_{ψ∈Ψ} O and is never replaced by that product; it is not Gorenstein in general.

Assumptions: Ψ ⊆ Ĝ is arbitrary: Ψ = ∅ gives the zero ring, Ψ = {1} gives O through the augmentation, Ψ = Ĝ gives O[G]. No Gorenstein property is part of the definition. L6's Gorenstein-order and exact-duality results apply to an R_Ψ only after it has been proved Gorenstein (test charGroupRing_not_gorenstein). R_Ψ, α_Ψ, the evaluations, the restriction maps and the items R_∅ = 0 and R_{1} ≅ O make sense for every commutative ring O, every commutative group G and every set Ψ of characters; the items that need G finite or O a domain say so.

API: `charGroupRing`: R_Ψ := range(ev_Ψ), an O-subalgebra of ∏_{ψ∈Ψ} O; `charGroupRing.proj`: α_Ψ : O[G] →ₐ[O] R_Ψ; `charGroupRing.proj_surjective`: α_Ψ is surjective (AlgHom.rangeRestrict_surjective); `charGroupRing.ker_proj`: α_Ψ(x) = 0 iff ψ(x) = 0 for every ψ ∈ Ψ; `charGroupRing.coord_proj`; `charGroupRing.ext`: Two elements of R_Ψ are equal iff all their ψ-coordinates are equal.

Tests: O a domain, G of prime order p with p not a unit in O and HasEnoughRootsOfUnity O p (e.g. O = Z_p[ζ_p]): for every character ψ the idempotent δ_ψ of ∏_{Ĝ} O is not in R_Ĝ ≅ O[G]; R_Ĝ is a proper suborder of the product. G generated by g, h, O a local domain with a primitive p-th root of unity ζ and maximal ideal (ζ − 1), Ψ = {1, ψ_1, ψ_2} with ψ_1(g) = ζ, ψ_1(h) = 1, ψ_2(g) = 1, ψ_2(h) = ζ: R_Ψ = {(a, b, c) : a ≡ b ≡ c mod (ζ − 1)}, and R_Ψ/(ζ − 1) is a local ring whose maximal ideal squares to zero and is not principal, so its socle is two-dimensional and R_Ψ is not Gorenstein. Ψ = ∅: R_∅ is the zero ring.

Uses: character-evaluation, joint-evaluation-injective.

Supporting lemmas: `character-group-ring-scaled-idempotent`.

<a id="L6-character-group-ring-lattice"></a>**Character group rings are free O-modules of rank #Ψ.** In the Dasgupta–Kakde setting, for Ψ ⊆ Ĝ the character group ring R_Ψ is a free O-module of rank #Ψ: it is a full-rank O-lattice in ∏_{ψ∈Ψ} O.

Assumptions: What is used: O is a principal ideal domain (for freeness, as proved here), G is finite and #G ≠ 0 in O (for the rank). No hypothesis on roots of unity or on the residue field is needed.

Uses: character-group-ring, character-group-ring-scaled-idempotent.

Supporting lemmas: `character-group-ring-finite-index`, `character-group-ring-nonzerodivisor`.

<a id="L6-norm-element-kernel"></a>**Quotients by subgroup norms are character group rings.** (Dasgupta–Kakde Lemma 2.2.) Let I ⊆ G be a subgroup and N_I = Σ_{σ∈I} σ ∈ O[G], the element TauCeti.subgroupCharSum of the trivial character over I. For Ψ = {ψ ∈ Ĝ : ψ(I) ≠ 1}, the kernel of α_Ψ : O[G] ↠ R_Ψ is exactly the principal ideal N_I·O[G]; hence O[G]/N_I ≅ R_Ψ is a character group ring.

Assumptions: ψ(I) ≠ 1 means that ψ is not trivial on I. What is used: G is finite and O is a domain with HasEnoughRootsOfUnity O (Monoid.exponent G), through the injectivity of the joint evaluation.

Uses: character-group-ring, joint-evaluation-injective. Sources: [Dasgupta–Kakde](#ref-dk), Lemma 2.2 and proof, p. 16.

Supporting lemmas: `character-idempotent-evaluation`.

<a id="L6-component-character-group-ring"></a>**The kernel of the projection to the characters belonging to χ.** Write G = G_p × G′. For χ ∈ Ĝ′ = Hom(G′, O^×) let e_χ = (#G′)^{-1} Σ_{a∈G′} χ(a)^{-1} a ∈ O[G′] ⊆ O[G] be its idempotent, the character idempotent of L4/character-decomposition for H = G′ transported along O[G′] → O[G], and let Ψ_χ = {ψ ∈ Ĝ : ψ|_{G′} = χ} be the set of characters belonging to χ. Then ker α_{Ψ_χ} = (1 − e_χ)O[G]; the reason is that ψ(e_χ) = 1 for ψ ∈ Ψ_χ and ψ(e_χ) = 0 for ψ ∈ Ĝ ∖ Ψ_χ. Hence R_{Ψ_χ} ≅ O[G]/(1 − e_χ) ≅ e_χO[G] =: R_χ, the connected component of O[G] attached to χ.

Assumptions: #G′ is a unit of O because p ∤ #G′, and O contains the values of χ because the exponent of G′ divides that of G. The kernel statement holds for every subgroup G′ of G whose order is a unit of O; the complement G_p plays no part in it.

Uses: character-group-ring, joint-evaluation-injective, L4/character-decomposition, L4/character-decomposition-api-1, character-idempotent-evaluation.

<a id="L6-component-group-ring-equiv"></a>**The component R_χ is the twisted group ring O[G_p]_χ.** Write G = G_p × G′ and let χ ∈ Ĝ′. The O-algebra homomorphism π_χ : O[G] → O[G_p], g′g_p ↦ χ(g′)g_p for g′ ∈ G′ and g_p ∈ G_p, is surjective with kernel (1 − e_χ)O[G] = ker α_{Ψ_χ}. Hence there is a unique isomorphism of O-algebras R_{Ψ_χ} → O[G_p] sending α_{Ψ_χ}(g′g_p) to χ(g′)g_p. With G acting on O[G_p] through π_χ this is the source's O[G_p]_χ, so R_χ ≅ O[G_p]_χ.

Assumptions: #G′ is a unit of O. The statement holds for every decomposition G = G_p × G′ into complementary subgroups with #G′ a unit of O; that G_p is the p-Sylow subgroup is not used.

API: `charGroupRing.componentProj`: π_χ : O[G] →ₐ[O] O[G_p], the lift (MonoidAlgebra.lift) of the monoid homomorphism G → O[G_p], g′g_p ↦ χ(g′)·g_p for g′ ∈ G′ and g_p ∈ G_p; `charGroupRing.componentProj_single`; `charGroupRing.componentProj_surjective`: π_χ is surjective; it restricts to the identity on O[G_p] ⊆ O[G]; `charGroupRing.componentProj_charIdempotent`: π_χ(e_χ) = 1, and π_χ(e_ω) = 0 for ω ∈ Ĝ′ with ω ≠ χ; `charGroupRing.ker_componentProj`: ker π_χ = (1 − e_χ)O[G] = ker α_{Ψ_χ}; `charGroupRing.componentEquiv`: R_{Ψ_χ} ≃ₐ[O] O[G_p], induced by the two surjections α_{Ψ_χ} and π_χ from O[G], which have the same kernel.

Tests: G′ = C_2 = {1, h}, p odd, χ the sign character: π_χ(h·g_p) = −g_p for g_p ∈ G_p, π_χ((1 − h)/2) = 1 and π_χ((1 + h)/2) = 0. G′ trivial (G′ = 1, G_p = G, χ = 1): componentEquiv applied to the restriction of α_Ĝ(x) to R_{Ψ_1} is the image of x under the identification O[G] ≅ O[G_p], for every x ∈ O[G]. G_p trivial (G′ = G, G_p = 1): componentEquiv(α_{Ψ_χ}(g′)) = χ(g′)·1 in O[G_p], which is O through its structure map.

Uses: component-character-group-ring, character-group-ring, L4/character-decomposition.

<a id="L6-group-ring-component-decomposition"></a>**O[G] is the product of its components R_χ.** Write G = G_p × G′. The idempotents e_χ ∈ O[G], χ ∈ Ĝ′, are pairwise orthogonal with sum 1, and the O-algebra homomorphism O[G] → ∏_{χ∈Ĝ′} R_{Ψ_χ}, x ↦ (α_{Ψ_χ}(x))_χ, is an isomorphism. The sets Ψ_χ, χ ∈ Ĝ′, partition Ĝ.

Assumptions: #G′ is a unit of O, and O contains the values of the characters of G′ because the exponent of G′ divides that of G.

Uses: component-character-group-ring, character-group-ring, L4/character-decomposition, L4/character-decomposition-api-1, L4/character-decomposition-api-2.

<a id="L6-component-norm-quotient"></a>**Norm quotients of a component.** (Dasgupta–Kakde Corollary 2.3.) For χ ∈ Ĝ′ and a subgroup I ⊆ G (the source takes I ⊆ G_p), R_χ/N_I R_χ ≅ R_Ψ with Ψ = {ψ ∈ Ĝ : ψ|_{G′} = χ, ψ(I) ≠ 1}; precisely, ker α_Ψ is generated by 1 − e_χ and N_I. In particular R_χ/N_I is a finite-index subring of a finite product of copies of O.

Assumptions: The kernel description holds for any subgroup I; the source states I ⊆ G_p.

Uses: norm-element-kernel, component-character-group-ring, character-group-ring-finite-index, character-idempotent-evaluation. Sources: [Dasgupta–Kakde](#ref-dk), Corollary 2.3, p. 16.

<a id="L6-character-group-ring-unit-criterion"></a>**Units of character group rings.** For Ψ ⊆ Ĝ and x ∈ R_Ψ: x is a unit of R_Ψ iff ψ(x) ∈ O^× for every ψ ∈ Ψ, and this holds iff ∏_{ψ∈Ψ} ψ(x) ∈ O^×. No locality of R_Ψ is assumed.

Assumptions: Only that O is a commutative ring and that Ψ is finite is used.

Uses: character-group-ring. Sources: [Dasgupta–Kakde](#ref-dk), §2.3, p. 18; [Dasgupta–Kakde](#ref-dk), §5.1, p. 34.

Supporting lemmas: `character-group-ring-unit-one-character`.

<a id="L6-character-group-ring-local"></a>**Character group rings of one component are local.** For χ ∈ Ĝ′ and nonempty Ψ ⊆ Ψ_χ (for instance R_χ itself, or R_χ/N_I for a nontrivial subgroup I ⊆ G_p), R_Ψ is a local ring, and its maximal ideal is 𝔪_Ψ = {x ∈ R_Ψ : ψ(x) ∈ 𝔪_O}, for any ψ ∈ Ψ.

Assumptions: The two instances are nonempty. The character g′g_p ↦ χ(g′) of G = G_p × G′ lies in Ψ_χ. For a nontrivial subgroup I ⊆ G_p some character ψ_p of G_p is nontrivial on I (CommGroup.exists_apply_ne_one_of_hasEnoughRootsOfUnity for G_p, whose exponent divides that of G), and g′g_p ↦ χ(g′)ψ_p(g_p) lies in Ψ_χ and is nontrivial on I.

Uses: character-group-ring-unit-one-character, character-group-ring. Sources: [Dasgupta–Kakde](#ref-dk), §2.2, p. 15; [Dasgupta–Kakde](#ref-dk), §5.1, p. 34; [Dasgupta–Kakde](#ref-dk), §7.2.9, p. 49; [Dasgupta–Kakde](#ref-dk), §7.1, p. 43.

Supporting lemmas: `character-group-ring-maximal-ideal-power`, `character-group-ring-eval-local-hom`, `character-group-ring-residue-field`.

<a id="L6-character-group-ring-adic-complete"></a>**Character group rings of one component are complete noetherian local rings.** For χ ∈ Ĝ′ and nonempty Ψ ⊆ Ψ_χ, the local ring R_Ψ is noetherian, and it is complete and separated for the 𝔪_Ψ-adic topology, which coincides with its 𝔪_O-adic topology because 𝔪_Ψ^N ⊆ 𝔪_O R_Ψ ⊆ 𝔪_Ψ for some N ≥ 1 (L6/character-group-ring-maximal-ideal-power). So R_Ψ is a complete noetherian local O-algebra.

Assumptions: What is used beyond locality: O is a noetherian local ring that is 𝔪_O-adically complete and separated, and R_Ψ is a finite O-module.

Uses: character-group-ring-local, character-group-ring-maximal-ideal-power, character-group-ring-lattice, character-group-ring. Sources: [Dasgupta–Kakde](#ref-dk), §7.2.9, p. 49; [Dasgupta–Kakde](#ref-dk), §7.1, p. 43.

<a id="L6-character-group-ring-index"></a>**The order of a principal quotient of a character group ring.** (Dasgupta–Kakde Lemma 2.5.) For Ψ ⊆ Ĝ and a non-zerodivisor x ∈ R_Ψ, the quotient R_Ψ/xR_Ψ is finite and #(R_Ψ/xR_Ψ) = #(O/(∏_{ψ∈Ψ} ψ(x))).

Assumptions: What is used: O is a Dedekind domain (a discrete valuation ring) that is infinite (characteristic zero), #G ≠ 0 in O, and O/(a) is finite for every a ≠ 0; G is finite. The last condition is Ring.HasFiniteQuotients O. That class has no instance for a discrete valuation ring with finite residue field in the Mathlib (only for finite rings, ℤ and rings of integers of number fields), so in the Dasgupta–Kakde setting it is derived as in the second proof step.

Uses: character-group-ring, character-group-ring-finite-index, character-group-ring-nonzerodivisor. Sources: [Dasgupta–Kakde](#ref-dk), Lemma 2.5, p. 17.

<a id="L6-sharp-involution"></a>**The involution # and the rings R^#.** The involution # of O[G] is the O-algebra automorphism g ↦ g^{-1} (the antipode of the commutative Hopf algebra O[G]); (x^#)^# = x and ψ(x^#) = ψ^{-1}(x) for every character ψ. For Ψ ⊆ Ĝ put Ψ^# = Ψ^{-1} = {ψ^{-1} : ψ ∈ Ψ} and R^# = R_{Ψ^#} for R = R_Ψ. Then # maps ker α_Ψ onto ker α_{Ψ^#} and induces mutually inverse O-algebra isomorphisms # : R_Ψ → R_{Ψ^#} and # : R_{Ψ^#} → R_Ψ, with #(α_Ψ(x)) = α_{Ψ^#}(x^#) and (#y)(ψ^{-1}) = y(ψ). It is an endomorphism of R_Ψ only when Ψ^# = Ψ. For R = O[G] (and Z_p[G], Z[G]) R^# = R. Ideals transport as I^# = #(I) ⊆ R^#; in particular (xR)^# = x^#R^#.

Assumptions: The construction of # on O[G] needs only O commutative and G commutative.

API: `sharp`: # : O[G] →ₐ[O] O[G], a·g ↦ a·g^{-1}: abbreviation of HopfAlgebra.antipodeAlgHom O O[G]; `sharp_single`; `sharp_of`; `sharp_sharp`: (x^#)^# = x: TauCeti.HopfAlgebra.antipode_antipode specialised to O[G]; `sharpAlgEquiv`: # as a self-inverse O-algebra automorphism of O[G]: abbreviation of TauCeti.HopfAlgebra.antipodeAlgEquiv for A = O[G]; `charEval_sharp`: ψ(x^#) = ψ^{-1}(x).

Tests: τ ∈ G, ψ(τ) = ζ a primitive cube root of unity: ψ(τ^#) = ζ². O a characteristic-zero domain, ψ(τ) = ζ a primitive cube root of unity, Ψ = {ψ}: τ − ζ ∈ ker α_Ψ but #(τ − ζ) = τ^{-1} − ζ ∉ ker α_Ψ (ψ-value ζ² − ζ ≠ 0), so # does not induce an endomorphism of R_Ψ. G trivial: # is the identity.

Uses: character-group-ring, character-evaluation, character-group-ring-scaled-idempotent. Sources: [Dasgupta–Kakde](#ref-dk), §6.1, p. 40; [Dasgupta–Kakde](#ref-dk), §1.1, p. 6.

### Transposed presentations (`TauCeti.ContragredientDual`, `TauCeti.PresentationTranspose`)

Sources: [Dasgupta–Kakde](#ref-dk), §6.1, equation (80), p. 40; [Dasgupta–Kakde](#ref-dk), Appendix A.4, proof of Lemma A.8, p. 86.

Library inputs: `Module.dualProdDualEquivDual`, `Module.dual_projective`, `Module.dual_finite`.

<a id="L6-contragredient-dual"></a>**The contragredient dual.** For a ring isomorphism σ : S → R of commutative rings (σ = # : R^# → R for R = R_Ψ, or # : R → R for R = O[G], Z_p[G], Z[G]) and an R-module M, the contragredient dual M^* = Hom_R(M, R) is the S-module with (s·φ)(x) = φ(σ(s)·x); for R = R_Ψ this is Dasgupta–Kakde's rule (r·φ)(x) = φ(r^#·x). A linear map f : M → N induces the S-linear f^* : N^* → M^*, φ ↦ φ∘f, functorially; for M = R^m, M^* is free over S on the dual basis.

Assumptions: R and S are commutative rings and σ is a ring isomorphism; the module structure is Module.compHom along σ. The source states the rule for Z[G]-modules, with M^* = Hom_{Z[G]}(M, Z[G]), and applies it to modules over a character group ring R = R_Ψ. For an R-module the dual is Hom_R(M, R), the reading that Lemma 6.1 requires. The general form, with a ring isomorphism σ : S → R, covers both.

API: `TauCeti.ContragredientDual`: Hom_R(M, R) with the S-module structure along σ; `toDual`: The underlying functional in Module.Dual R M; `smul_apply`; `ofDual`: The element of M^* with underlying functional φ ∈ Module.Dual R M; ofDual and toDual are mutually inverse additive bijections between Module.Dual R M and M^*; `ext`: Two elements of M^* are equal iff their underlying functionals take the same value at every x ∈ M; `toDual_smul`: toDual(s·φ) = σ(s)·toDual(φ) in Module.Dual R M: toDual is a σ-semilinear bijection from M^* onto Mathlib's dual, the identity on functionals.

Tests: R = S = O[G], σ = #, φ = id ∈ Hom_R(R, R): (g·φ)(1) = g^{-1}. σ = id: (s·φ)(x) = s·φ(x), the ordinary dual. R = O[G] with O ≠ 0, σ = #, g ∈ G with g^{-1} ≠ g: (g·id)(1) = g^{-1} ≠ g in O[G], so the contragredient structure differs from the ordinary one.

Uses: sharp-involution.

<a id="L6-presentation-transpose"></a>**The transpose of a finite projective presentation.** For a commutative ring R, a ring isomorphism σ : S → R, and a presentation P_1 →f P_0 → M → 0 by finitely generated projective R-modules, the transpose attached to it is M^tr = coker(f^* : P_0^* → P_1^*), an S-module through the contragredient structure (for R = R_Ψ, S = R^# and σ = #). Its carrier is the Tau Ceti cokernel TauCeti.AuslanderReitenTranspose f (any ring, any presentation map), with scalars restricted along σ. The transpose depends on the presentation, not on M alone: for a square presentation with matrix (a_ij) it is quadratically presented over S by (σ^{-1}(a_ji)). Dasgupta–Kakde write the presentation as P_0 → P_1 → M with the indices swapped.

Assumptions: Minimal presentations, the stable category and the translate D Tr (Tau Ceti QuiverRepresentations Layer 6) are not used or rebuilt here. The uniqueness theorem (TauCeti.IsMinimalProjectivePresentation.nonempty_linearEquiv_auslanderReitenTranspose) compares two minimal projective presentations, over any ring; the presentations of Dasgupta–Kakde are not assumed minimal, and over Z[G] minimal presentations need not exist (Z/2 has no projective cover over Z).

API: `TauCeti.PresentationTranspose`: coker(f^*) with the S-module structure along σ; carrier TauCeti.AuslanderReitenTranspose f; `mk`: The quotient map P_1^* →ₗ[S] M^tr: the function TauCeti.AuslanderReitenTranspose.mk on the underlying functional; it is S-linear for the contragredient structure on P_1^* because the map is R^op-linear and s ∈ S acts on both sides as op(σ(s)); `mk_eq_zero_iff`: mk φ = 0 iff φ factors through f: an abbreviation of TauCeti.AuslanderReitenTranspose.mk_eq_zero_iff; `mk_surjective`: The quotient map mk is surjective: an abbreviation of TauCeti.AuslanderReitenTranspose.mk_surjective; `lift`: An S-linear map g : P_1^* → N to an S-module N with g(φ ∘ f) = 0 for every φ ∈ P_0^* factors through mk by a unique S-linear map lift g : M^tr → N, and lift g (mk φ) = g φ. It is TauCeti.AuslanderReitenTranspose.lift, with lift_mk and hom_ext, applied after regarding N as an R^op-module through op(r) ↦ σ^{-1}(r); `toARTranspose`: The underlying additive group is TauCeti.AuslanderReitenTranspose f.

Tests: The transpose of id : R → R is 0. The presentation R² → R, (a, b) ↦ a, of the zero module has transpose ≅ S, not 0: a transpose belongs to a presentation, not to M. The transpose of R →(a) R is ≅ S/(σ^{-1}(a)).

Uses: contragredient-dual, quadratic-presentation. Sources: [Dasgupta–Kakde](#ref-dk), §6.1, (81), p. 40.

<a id="L6-transpose-stable-equivalence"></a>**Transposes are unique up to projective summands** (removed). For any ring and any two projective presentations, `tr(f) ⊕ (Q_1 ⊕ P_0)^* ≅ tr(g) ⊕ (P_1 ⊕ Q_0)^*` is Tau Ceti `TauCeti.AuslanderReitenTranspose.nonempty_linearEquiv_prod_dual` (`TauCeti.Algebra.Module.AuslanderReiten.StableTranspose`), with the converse `nonempty_linearEquiv_prod_of_linearEquiv`; L6/presentation-transpose restricts scalars along σ.

<a id="L6-transpose-fitting"></a>**The Fitting ideal of the transpose.** (Dasgupta–Kakde Lemma 6.1.) Let R be a character group ring (more generally a commutative ring with a ring isomorphism σ : R^# → R) and M a quadratically presented R-module with square matrix (a_ij). The transpose M^tr attached to that presentation is quadratically presented over R^# with matrix (a_ji^#); this is the construction quadraticPresentation of L6/presentation-transpose. The target asserts Fitt_{R^#}(M^tr) = Fitt_R(M)^#. The identity concerns the transpose of the stated quadratic presentation: adding a nonzero free relation summand makes the zeroth Fitting ideal of the transpose 0.

Uses: presentation-transpose, fitting-quadratic, sharp-involution, L4/initial-fitting-ideal. Sources: [Dasgupta–Kakde](#ref-dk), Lemma 6.1, p. 40.

Supporting lemmas: `transpose-higher-fitting-free`.

<a id="L6-transpose-higher-fitting"></a>**Higher Fitting ideals and transposes with excess generators.** (Dasgupta–Kakde (171), proof of Lemma B.4.) Let R be a commutative ring with a ring isomorphism σ : R^# → R, and let P_1 →f P_0 → M → 0 be an exact sequence of R-modules with P_1 and P_0 finitely generated projective of constant ranks t and t + s (locally t relations and t + s generators). Then the zeroth Fitting ideal over R^# of the transpose M^tr attached to f is Fitt^s_R(M)^#: Fitt^0_{R^#}(M^tr) = Fitt^s_R(M)^#. The identity concerns the transpose of this presentation. In Dasgupta–Kakde the presentation is V^θ → B^θ → ∇ → 0 over Z[G], with B^θ free of rank t + s and V^θ projective of constant rank t.

Assumptions: A finitely generated projective module has constant rank t when its localisation at every prime ideal is free of rank t (Module.rankAtStalk). No freeness is assumed: over Z[G] a projective module of constant rank need not be free, and Z[G] is not a finite product of local rings. M and M^tr are finitely presented, being cokernels of maps between finitely generated projective modules: such a module is finitely presented (Module.finitePresentation_of_projective), its dual is again finitely generated projective (Module.dual_finite, Module.dual_projective), and the quotient of a finitely presented module by a finitely generated submodule is finitely presented (Module.finitePresentation_of_surjective); the R^#-structure of M^tr is a transport along the ring isomorphism σ.

Uses: presentation-transpose, transpose-higher-fitting-free, sharp-involution, Tau Ceti `fittingIdeal`, `fittingIdeal_baseChange`, L4/initial-fitting-ideal. Sources: [Dasgupta–Kakde](#ref-dk), Proof of Lemma B.4, equation (171), p. 93.

### Quadratic presentations and the initial Fitting ideal (`TauCeti`, `TauCeti.QuadraticPresentation`)

Sources: [Dasgupta–Kakde](#ref-dk), §2.3, p. 16.

Library inputs: `Matrix.adjugate_mul`, `lTensor_exact`, `mem_nonZeroDivisors_iff`.

<a id="L6-quadratic-presentation"></a>**Quadratically presented modules.** Let R be a commutative ring. A quadratic presentation of an R-module N consists of an integer m ≥ 1, an m×m matrix φ over R and a surjection π : R^m → N whose kernel is the image of φ : R^m → R^m; N is quadratically presented over R if it has one, equivalently N ≅ coker(φ) for a square matrix φ of size m ≥ 1.

Assumptions: m ≥ 1 is part of the definition (the zero module is presented by R →(1) R).

API: `TauCeti.QuadraticPresentation`: Data (m ≥ 1, φ ∈ M_m(R), π : R^m ↠ N) with range(φ) = ker(π); `size`: The size m ≥ 1; `rel`: The square relation matrix φ; `gen`: The surjection π : R^m → N; `ext`: Two quadratic presentations of N with the same size m, the same matrix φ and the same map π are equal; `TauCeti.IsQuadraticallyPresented`: N has a quadratic presentation over R.

Tests: R/(a) has a quadratic presentation of size 1 with determinant a. The zero module is quadratically presented (m = 1, φ = (1)); m = 0 is excluded. R^m (m ≥ 1) has a quadratic presentation with φ = 0.

<a id="L6-fitting-quadratic"></a>**The Fitting ideal of a quadratic presentation.** If N has a quadratic presentation R^m →φ R^m → N → 0, then Fitt_R(N) = (det φ); in particular Fitt_R(N) is principal.

Uses: quadratic-presentation, L4/initial-fitting-ideal.

<a id="L6-locally-quadratic-presentation"></a>**Locally quadratic presentations.** A locally quadratic presentation of an R-module M is an exact sequence P_1 →f P_0 →π M → 0 with P_0, P_1 finitely generated projective R-modules of the same constant rank r (rank of (P_i)_𝔭 equal to r at every prime 𝔭). Every quadratic presentation is locally quadratic. Over a ring with finitely many maximal ideals — for instance a local ring, or a finite product of local rings such as Z_p[G], O[G] and the character group rings R_Ψ — a module with a locally quadratic presentation is quadratically presented, because finitely generated projective modules of constant rank over such a ring are free (Dasgupta–Kakde Remark A.7, for Z_p[G]): for r ≥ 1 the presentation becomes R^r → R^r → M → 0 after a choice of bases, and for r = 0 the module M is 0, presented by R →(1) R. An arbitrary Z_p[G]-algebra is not a finite product of local rings (Z_p[G][X] has infinitely many maximal ideals), and over a general ring a locally quadratic presentation need not be quadratic: for a non-principal ideal I of a Dedekind domain R, I ↪ R ↠ R/I is locally quadratic of rank 1, but R/I is not quadratically presented. For the Z_p[G]-algebras R of Remark A.7 the presentation is the base change of the locally quadratic presentation over Z_p[G]; that one is quadratic, and its base change to R is quadratic by QuadraticPresentation.baseChange.

Assumptions: Constant rank r means Module.rankAtStalk P 𝔭 = r for every prime 𝔭 of R, the rank of the free R_𝔭-module P_𝔭.

API: `IsLocallyQuadraticPresentation`: P_1 →f P_0 →π M → 0 exact with P_i finitely generated projective of the same constant rank; `QuadraticPresentation.isLocallyQuadraticPresentation`: A quadratic presentation is locally quadratic; `IsLocallyQuadraticPresentation.isQuadraticallyPresented`: Over a local ring a locally quadratic presentation gives a quadratic presentation; `IsLocallyQuadraticPresentation.isQuadraticallyPresented_pi`: Over a finite product of local rings a locally quadratic presentation gives a quadratic presentation; `IsLocallyQuadraticPresentation.isQuadraticallyPresented_of_finite_maximalSpectrum`: Over a ring with finitely many maximal ideals a locally quadratic presentation gives a quadratic presentation; the local case and the case of a finite product of local rings are instances; `IsLocallyQuadraticPresentation.baseChange`: For a ring map R → R′, the base change P_1 ⊗_R R′ → P_0 ⊗_R R′ → M ⊗_R R′ → 0 of a locally quadratic presentation is a locally quadratic presentation of the same rank.

Tests: A quadratic presentation (φ, π) is a locally quadratic presentation. R = Z_p × Z_p, I = Z_p × 0: the presentation I ↪ R ↠ R/I is not locally quadratic (ranks of I are 1 and 0). 0 → 0 → 0 → 0 is locally quadratic of rank 0.

Uses: quadratic-presentation. Sources: [Dasgupta–Kakde](#ref-dk), Remark A.7, p. 86.

Supporting lemmas: `pid-cokernel-cardinality`, `finite-index-cokernel-descent`, `cokernel-modulo-finite-ideal`, `finite-index-subring-nonzerodivisor`.

<a id="L6-quadratic-cardinality"></a>**The order of a quadratically presented module over a finite-index order.** (Dasgupta–Kakde Lemma 2.4.) Let B be a subring of finite index of a finite product B′ = ∏_i D_i of principal ideal domains (fields are allowed; for instance B is a character group ring R_Ψ ⊆ ∏_{ψ∈Ψ} O). Let N be a quadratically presented B-module with Fitt_B(N) = (x) for a non-zerodivisor x of B such that B/(x) is finite. Then N is finite and #N = #(B/(x)).

Assumptions: B ⊆ B′ = ∏_i D_i has finite additive index; each D_i is a principal ideal domain, possibly a field, finite or infinite, of any characteristic. This is the source's generality. When every D_i is infinite, in particular in characteristic zero, which covers every use (R_Ψ ⊆ ∏ O), the ideal K of the proof is 0 and x is already a non-zerodivisor of B′.

Uses: quadratic-presentation, fitting-quadratic, cokernel-modulo-finite-ideal, finite-index-subring-nonzerodivisor, finite-index-cokernel-descent, pid-cokernel-cardinality, L4/initial-fitting-ideal. Sources: [Dasgupta–Kakde](#ref-dk), Lemma 2.4, p. 16–17.

### Compound matrices and higher adjugates (`Matrix`)

Sources: [Dasgupta–Kakde](#ref-dk), Proof of Lemma 3.9, p. 26.

Library inputs: `Matrix.det_transpose`, `Set.powersetCard.compl`, `Module.Basis.exteriorPower`.

<a id="L6-compound-matrix"></a>**Compound matrices.** For a commutative ring R, finite linearly ordered index types and an ι×κ matrix A over R, the r-th compound matrix C_r(A) is the matrix indexed by r-subsets S ⊆ ι and T ⊆ κ whose (S, T) entry is the minor det A[S, T] (rows S and columns T in increasing order). It is the matrix of ⋀^r A : ⋀^r R^κ → ⋀^r R^ι in the bases e_T = e_{t_1} ∧ … ∧ e_{t_r} (t_1 < … < t_r) of Mathlib's exterior-power bases.

Assumptions: Index types are finite and linearly ordered; r-subsets are Set.powersetCard, enumerated increasingly by the inverse of Set.powersetCard.ofFinEmbEquiv.

API: `compound`: C_r(A)_{S,T} = det A[S, T]; `compound_eq_toMatrix`: C_r(A) is the matrix of exteriorPower.map r (toLin' A) in the bases Module.Basis.exteriorPower r of the standard bases; `compound_mul`: C_r(AB) = C_r(A)C_r(B) (Cauchy–Binet); `compound_one`: C_r(1) = 1; `compound_one_eq`; `compound_two_eq_pairMinor`: For i < j in ι and k < l in κ, C_2(A)_{{i,j},{k,l}} = Matrix.pairMinor A (i, j) (k, l), the 2×2 minor; for r = 2, Matrix.compound_mul is its Cauchy–Binet formula Matrix.pairMinor_mul.

Tests: C_1(A)_{{i},{k}} = A_{ik} for a 2×3 matrix. C_2 of the 2×2 matrix (a b; c d) is (ad − bc). For r larger than the number of rows there are no r-subsets: C_3 of a 2×3 matrix is empty.

Supporting lemmas: `complement-shuffle-sign`, `generalised-laplace-expansion`.

<a id="L6-higher-adjugate"></a>**Higher adjugates.** For a square m×m matrix A over a commutative ring and 0 ≤ r ≤ m, the r-th higher adjugate adj_r(A) is the matrix indexed by r-subsets with entry adj_r(A)_{T,S} = (−1)^{ΣS+ΣT} det A[Sᶜ, Tᶜ] (complementary minor; ΣS the sum of the elements of S). It satisfies C_r(A)·adj_r(A) = det(A)·I and adj_r(A)·C_r(A) = det(A)·I (generalized Laplace expansion); adj_1 is the adjugate and adj_m = (1).

Assumptions: Indices are Fin m; with 0-based or 1-based element sums the sign is the same, since both change by 2r.

API: `higherAdjugate`: adj_r(A)_{T,S} = (−1)^{ΣS+ΣT} det A[Sᶜ, Tᶜ]; `sum_compound_mul_compound_compl`: (Generalised Laplace expansion.) For r-subsets S, S′ of Fin m: Σ_T (−1)^{ΣS′+ΣT} det A[S, T] det A[S′ᶜ, Tᶜ] is det A if S′ = S and 0 if S′ ≠ S, the sum over the r-subsets T; `det_eq_sum_compound_mul_compound_compl`: (Generalised Laplace expansion along the rows S: the case S′ = S of Matrix.sum_compound_mul_compound_compl.) For an r-subset S of Fin m: det A = Σ_T (−1)^{ΣS+ΣT} det A[S, T] det A[Sᶜ, Tᶜ], the sum over the r-subsets T; `sum_compound_mul_compound_compl_eq_zero`: (The case S′ ≠ S of Matrix.sum_compound_mul_compound_compl.) For r-subsets S ≠ S′ of Fin m: Σ_T (−1)^{ΣS′+ΣT} det A[S, T] det A[S′ᶜ, Tᶜ] = 0; `Set.powersetCard.sign_permOfDisjoint_compl`: For an r-subset T of Fin m, the shuffle that sorts T followed by Tᶜ (Set.powersetCard.permOfDisjoint) has sign (−1)^{ΣT − r(r−1)/2}, ΣT the sum of the elements of T as natural numbers; `compound_mul_higherAdjugate`: C_r(A)·adj_r(A) = det(A)·I.

Tests: For a 3×3 matrix, adj_1 agrees with Matrix.adjugate. For a 3×3 matrix, adj_3(A) = (1). adj_r(1_3) = 1 for every r ≤ 3.

Uses: compound-matrix, generalised-laplace-expansion.

Supporting lemmas: `compound-image-determinant`.

### Higher Fitting ideals (`TauCeti`)

Sources: [Dasgupta–Kakde](#ref-dk), Appendix B.2, first paragraph, p. 93.

Library inputs: Tau Ceti `TauCeti.fittingIdeal`, `fittingIdeal_eq_minorsIdeal_ker`, `fittingIdeal_monotone`, `fittingIdeal_baseChange`; `Matrix.det_succ_row`.

The higher Fitting ideals Fitt^i_R(M), i ≥ 0, are Tau Ceti's `TauCeti.fittingIdeal R M i` (a91d3aaf, `RingTheory/FittingIdeal/Basic.lean`), the ideal of the (n − i)×(n − i) minors of the relations of any surjection R^n → M, with independence of the presentation (`fittingIdeal_eq_minorsIdeal_ker`, `Generators.lean`: `fittingIdeal_eq_minorsIdealOfSet`), the chain Fitt^i ⊆ Fitt^{i+1} (`fittingIdeal_monotone`), Fitt^i(M ⊕ R^r) = Fitt^{i−r}(M) (`fittingIdeal_prod_add_finrank`), the jumps of a free module (`fittingIdeal_eq_bot_of_lt_finrank`, `fittingIdeal_eq_top_iff_finrank_le`) and base change (`fittingIdeal_baseChange`); Fitt^0 is the initial Fitting ideal of L4/initial-fitting-ideal. They are not restated here; the targets of this section and the next are stated on that declaration, and Suggested.lean, pinned before it existed, prototypes it as `Module.higherFittingIdeal`.

### Fitting ideals of extensions and fibre products

Sources: [Dasgupta–Kakde](#ref-dk), Lemma 2.6, p. 18.

Library inputs: `Matrix.det_fromBlocks_zero₂₁`, `Module.finitePresentation_of_ker`.

Supporting lemmas: `extension-relation-matrix`.

<a id="L6-quadratic-presentation-extension"></a>**An extension of quadratically presented modules is quadratically presented.** (Dasgupta–Kakde Lemma 2.6, second assertion.) Let R be a commutative ring and 0 → A → B → C → 0 an exact sequence of R-modules with A quadratically presented by (n, ψ_A, π_A) and C quadratically presented by (m, φ_C, π_C). Then B is quadratically presented, of size n + m, by the block upper-triangular matrix [[ψ_A, −X], [0, φ_C]] and the generators a_1, …, a_n, c̃_1, …, c̃_m, where a_i = π_A(e_i), the c̃_j ∈ B are lifts of the π_C(e_j), and X is an n×m matrix with Σ_j (φ_C)_{jk}·c̃_j = Σ_i X_{ik}·a_i for every k. The determinant of this matrix is det ψ_A·det φ_C.

Assumptions: A is identified with its image in B. The presentation of B depends on the choice of the lifts c̃_j and of X; its size n + m and its determinant det ψ_A·det φ_C do not. The sign of X comes from moving the lifted relation to the other side; it does not affect the determinant, and replacing each a_i by −a_i turns −X into X.

Uses: quadratic-presentation, extension-relation-matrix.

<a id="L6-fitting-extension"></a>**Fitting ideals of extensions with a quadratically presented quotient.** (Dasgupta–Kakde Lemma 2.6, first assertion.) Let R be a commutative ring and 0 → A → B → C → 0 an exact sequence of R-modules with C quadratically presented and A finitely presented. Then B is finitely presented and Fitt_R(B) = Fitt_R(A)·Fitt_R(C).

Assumptions: A finitely presented is needed for Fitt_R(A); then B is finitely presented, as an extension of finitely presented modules (Module.finitePresentation_of_ker). The source states the lemma for an arbitrary commutative ring and an arbitrary module A and leaves this implicit (in its applications the modules are finitely generated over noetherian rings) and fixes the convention at the start of Appendix B.2 (arXiv v3 PDF p. 93).

Uses: quadratic-presentation, fitting-quadratic, extension-relation-matrix, L4/initial-fitting-ideal.

<a id="L6-fitting-fibre-product"></a>**Fitting ideals of two extensions of a common quotient.** (Dasgupta–Kakde Lemma 2.7.) Let B, B′ be quadratically presented R-modules with exact sequences 0 → A → B → C → 0 and 0 → A′ → B′ → C → 0, A and A′ finitely presented. Then Fitt_R(A)·Fitt_R(B′) = Fitt_R(A′)·Fitt_R(B).

Assumptions: A and A′ are finitely presented; then the fibre product B ×_C B′ is finitely presented, as an extension of B by A′. The source leaves this implicit (its modules are finitely generated over noetherian rings, where A and A′ are automatically finitely presented) and fixes the convention in Appendix B.2.

Uses: quadratic-presentation, fitting-extension, L4/initial-fitting-ideal. Sources: [Dasgupta–Kakde](#ref-dk), Lemma 2.7 and proof, p. 18.

### Exterior powers and annihilators

Sources: [Dasgupta–Kakde](#ref-dk), Lemma 3.9, p. 25–26.

Library inputs: `exteriorPower.map_surjective`, `exteriorPower.map_comp`, `Module.annihilator`.

<a id="L6-exterior-cokernel-annihilator"></a>**Fitting ideals annihilate exterior-power cokernels.** (Dasgupta–Kakde Lemma 3.9.) Let R be a commutative ring and N ⊆ M R-modules with N finitely generated and M finitely presented. For every r ≥ 1, Fitt_R(M/N) annihilates the cokernel of ⋀^r_R N → ⋀^r_R M.

Assumptions: M/N is finitely presented, because M is finitely presented and N is finitely generated; so Fitt_R(M/N) is defined.

Uses: compound-matrix, compound-image-determinant, L4/initial-fitting-ideal.

## References

<a id="ref-rjw"></a>

**RJW** — Joaquín Rodrigues Jacinto and Chris Williams. [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf). Essential Number Theory 4 (2025), no. 1, 101–216. Page numbers are the printed ones.

<a id="ref-nsw"></a>

**NSW** — Jürgen Neukirch, Alexander Schmidt and Kay Wingberg. Cohomology of Number Fields, second edition, corrected electronic version 2.3 (May 2020), Grundlehren der mathematischen Wissenschaften 323. Statements are cited by their numbers (5.x.y) and printed pages.

<a id="ref-dk"></a>

**Dasgupta–Kakde** — Samit Dasgupta and Mahesh Kakde. [On the Brumer–Stark conjecture](https://arxiv.org/pdf/2010.00657v3). arXiv:2010.00657v3 (5 September 2022); page numbers are those of the arXiv PDF.

<a id="ref-rsy"></a>

**Rowland–Stipulanti–Yassawi** — Eric Rowland, Manon Stipulanti and Reem Yassawi. [An elementary proof of Bridy's theorem](https://arxiv.org/abs/2308.10977v2). arXiv:2308.10977v2 (27 March 2025).

<a id="ref-km"></a>

**Knudsen–Mumford** — Finn F. Knudsen and David Mumford. [The projectivity of the moduli space of stable curves. I: Preliminaries on "det" and "Div"](https://doi.org/10.7146/math.scand.a-11642). Mathematica Scandinavica 39 (1976), 19–55. Page numbers are the printed ones.

<a id="ref-stacks"></a>

**Stacks** — The Stacks Project authors. [The Stacks Project](https://stacks.math.columbia.edu), Section 15.8, Fitting ideals, [Tag 07Z6](https://stacks.math.columbia.edu/tag/07Z6).

<a id="ref-loeffler"></a>

**Loeffler** — David Loeffler. [Ring structure on nonarchimedean measures](https://github.com/leanprover-community/mathlib4/pull/41961), Mathlib pull request 41961, file `Mathlib/NumberTheory/Padics/Measure/Monoid.lean`: the right-handed convolution `convolveFunRight` and the ring and algebra instances whose shape the convolution targets of L1 follow.

