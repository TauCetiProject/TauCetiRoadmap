# Roadmap: overconvergent Hilbert modular forms and p-adic automorphic coefficients

**Summary.** Build analytic automorphic coefficient sheaves from actual differential-frame and period-map torsors, identify their Hilbert presentations, and compare their integral structures with the independently constructed Andreatta–Iovita–Pilloni coefficients. The resulting spaces carry normalized Hecke operators, family Fourier expansions, compact cuspidal restriction maps, and level-indexed maps to completed ordinary Igusa forms, including completion in the anticanonical wild level. Analytic induction for reductive Levi groups also gives coefficients on Siegel and Bruhat period domains, on general toroidal tower diamonds, and in the definite unitary Jacquet construction. Algebraic weights, the modular curve, and ordinary forms are tests of these constructions rather than restrictions on their scope.

## Scope and ownership

This roadmap owns analytic specializations of automorphic torsors and the comparisons between the resulting coefficient sheaves. It includes the Hilbert character map, analytic induced representations with their precise conventions, the four Hilbert coefficient presentations, the finite-character and integral comparison, analytic-family boundary and Fourier statements, normalized coefficient correspondences, and the ordinary completion comparison at each finite and infinite anticanonical wild level. In higher rank it owns the passage from a supplied analytic reduction to its coefficient sheaf and the convention dictionary between analytic induction and Hodge frames. The definite unitary application includes the specialization from completed functions with coefficients at the other places above (p), followed by the actual Jacquet coefficient sheaf and its arithmetic geometry.

The following are prerequisites and boundaries, not constructions of this roadmap.

- Mathlib supplies tensor products, determinant norms, continuous homomorphisms, representations, module duals, matrices, direct limits, and adic completion. Tau Ceti supplies the narrow class group and Lie-algebra highest-weight module theory. Algebraic group representations and their highest-weight conventions are consumed from AutomorphicBundles B2; Lie-algebra generation alone does not construct an algebraic group representation.
- `AlgebraicVectorBundles`, Layers L0A–L0C and L2B, supplies sheaves of modules, finite locally free sheaves, tensor and dual operations, and geometric vector bundles. `AutomorphicBundles`, B0–B4 and their general-data extensions, owns associated algebraic bundles, their canonical and subcanonical extensions, algebraic highest-weight conventions and classical coefficient realizations. Its B5 owns classical Fourier expansions and classical boundary statements. The targets below concern analytic families and the comparison with those objects.
- `HodgeTateAndCanonicalSubgroups`, Layers 3–5 and §§2.10, 7.29–7.30, owns canonical subgroups, the ordinary Igusa torsors with their finite étale formal models, the Hilbert period-coordinate estimates, the modified integral differential lattice and its frame torsor, and the logarithmic Hodge–Tate comparison. No alternative canonical subgroup or differential-frame torsor is introduced here. Its §3.12 and §§4.6–4.8 include the unsplit ramified generator and scalar kernel congruence; only the closed odd-prime endpoint extends its period range here.
- `PerfectoidShimuraVarieties`, Layers 1, 3, 5 and 6, owns perfectoid towers, their finite-level quotients, the Hilbert mixed-cover span and Weil pairing, general toroidal tower diamonds, and Bruhat reductions. Its general period-map theorem is a statement about diamonds; it does not assert that every general Shimura tower is a perfectoid space.
- `ShimuraCompactifications`, C3.6a, C3.10 and C6.20–C6.47, owns Hilbert toroidal/minimal models, semiabelian cusp charts, contractions, ordinary boundary loci and coherent formal functions. `AutomorphicBundles`, B3.Hilbert.1–3, supplies their ramified splitting-model and algebraic coefficient comparisons. Layer 7 applies the supplied boundary Igusa torsors to completed analytic coefficients on toroidal models and pushes those coefficients to minimal models, retaining cusp-unit invariants.
- `PerfectoidTowers`, P9.6–P9.13, owns profinite torsor function descent, its all-open smooth-weight extension, fixed module subsheaves and finite locally free effectivity with its stated hypotheses. `AdicSpacesPartII`, R0.5, supplies completed Banach tensors; `AdicSpacesPartIV`, R5.5–R5.7, supplies smooth-weight products and completed coefficient sheaves. The targets below apply these constructions to the actual analytic representations and compare their site-specific Gauss lattices.
- `LocallyAnalyticDistributions`, Layers 0 and 4 and §§3.3, 4.15, supplies analytic charts, completed tensors, compact-type duality, the compact Mellin equivalence and common-radius universal-character analyticity. Its §3.3 imports `PhiGammaModulesAndIwasawaCohomology` §4.0's rigid compact character spaces, finite-character charts and universal character. That supplier also owns `localMultiplicativeCharacterSpace K`, representing characters of Kˣ, with its uniformizer-change and coefficient-extension interfaces; §0.6's locally ℚₚ-analytic Kˣ specialization uses this carrier. `PadicMeasuresIwasawaAlgebras` §3a.1 supplies the one-dimensional unit-character input. This roadmap specializes the compact spaces to the number-field unit groups and constructs their inverse-norm pullback.
- `PadicLocalLanglandsForGL2Qp` §0.1 owns the shared locally analytic function and distribution carriers, convolution, Fréchet–Stein presentations, coadmissible modules, admissible analytic duality and Banach/Schikhof comparison, with a finite analytic field and complete discretely valued coefficient field. This roadmap owns the extension to general topologically finitely generated abelian locally L-analytic groups, the locally L-analytic equations and the adapters to that local multiplicative carrier, as well as essential admissibility, the finite-slope Jacquet construction and arithmetic coefficient applications.
- `CompletedCohomologyPartII`, F.1 and F.4 and Layers 1–3, supplies compact-open Banach admissibility, analytic vectors and their topology, ordered torsion colimits, completion, actions and coefficient tensors. Its §8.5 treats a definite rank-three specialization. It does not already provide the general-rank, one-varying-(p)-place coefficient space used here. `PadicFamilies` owns the generic Fredholm/eigenvariety machine, ordinary projectors and control theorems. The present roadmap supplies its geometric Banach modules and compact operator, not a second spectral machine.

## Conventions

The algebraic preliminaries permit any number field (F). Hilbert geometry assumes that (F) is totally real, of degree (d≥1), and that (p) is a rational prime, including (2) and primes ramified in (F). Write

```text
O_p = Z_p ⊗_Z O_F,       H_r = {u ∈ O_p^× : u−1 ∈ p^r O_p},
N_p(x) = det_Zp(multiplication by x).
```

Scalars are on the left in the tensor product. Its topology is the finite-module topology over (ℤₚ). Integral formulas do not replace (O_p⊗ O_C) by a product indexed by embeddings at a ramified prime. Generic-fibre splitting over a sufficiently large coefficient field is a separate operation.

Geometric weights are continuous characters of (O_p^×); arithmetic weights are pairs ((w,t)) on (O_p^××ℤₚ^×). The geometric weight associated to the pair is

```text
κ(x) = w(x)^2 t(N_p(x))^(−1).
```

For Hilbert geometry choose prime-to-(p) tame level (N≥4), sufficiently small for the stated moduli schemes, and a complete perfectoid extension (L/ℚₚ) containing the required embeddings and roots of unity. Arithmetic polarization and diagonal quotients are interpreted as quotient stacks, or on the action-free coarse loci supplied by the moduli and tower theorems. The numerical inequality N≥4 alone does not prove freeness of either action. A bounded family has smooth rigid base (U/L) and image contained in an affinoid weight chart. Hilbert weight-family and spectral-unit-ball assertions assume (U=Spa(A,A^+)), with (A) reduced, uniform and equipped with a compatible power-multiplicative nonarchimedean norm. The analytic induction and Bruhat families of §§0.4, 8.7 also allow nonreduced finite-type affinoid algebras, using a complete defining Banach norm rather than the spectral seminorm. Formal integral base change requires its own flatness and completion hypotheses. The sheaf (O^+) always means geometric power-bounded functions on the indicated site; a completed tensor of chosen integral lattices is not silently identified with it.

The Hilbert action on the period coordinate is the left fractional action with denominator (cz+d). Right-action descent uses the conversion in §1.1, including inversion of the factor. In the Siegel row chart the action is right multiplication on ([I,Z]), with factor (A+ZC). These two conventions are kept separate and explicitly related to their coefficient representations.

An anticanonical radius (ε=0) denotes the ordinary domain. Overconvergence means the filtered colimit over *positive* admitted radii tending to zero. Finite wild level, infinite wild level and tame level zero are distinct objects. Atkin–Lehner transport scales the Hasse radius. A compact operator means a completely continuous operator in the nonarchimedean Banach sense, with finite-rank approximations or the corresponding property-(Pr) formulation; it does not mean real topological compactness of a unit-ball image.

Unstarred Hilbert X denotes the open geometric variety; the star in Γ* specifies the group G*, not a compactification. Write X^tor_Σ for a toroidal model with its chosen admissible fan and X^min for the minimal model. In Layer 7, X^gr denotes the generic fibre of the formal completion of the open integral moduli scheme, so its points have good reduction. B_n is its ordinary anticanonical base; T_n and C_n are the full ordinary toroidal and minimal bases, including the boundary and its tubes. Universal semiabelian objects and finite étale Igusa torsors are used on the toroidal models or their stack charts; the minimal coefficient is a pushforward. The contraction fixes a minimal cusp even when its cusp units act nontrivially on Igusa generators (AIP-cusp §3.6, manuscript pp.19–20; aip-cusp line 785 and line 801).

## Exact supplier contracts

From Mathlib use `Algebra.TensorProduct.leftAlgebra`, `Module.Finite.base_change`, `Module.Free.tensor`, `Module.finrank_baseChange`, `moduleTopology`, `IsModuleTopology.continuous_of_linearMap`, and `IsModuleTopology.isTopologicalRing`. `PadicInt.compactSpace` and finite bases give compactness of (O_p). `Algebra.norm`, `Algebra.norm_apply`, `Algebra.norm_eq_prod_embeddings`, `LinearMap.det` and `LinearMap.det_baseChange` supply the determinant norm and its algebraic base change. `NumberField.RingOfIntegers.rank` and `NumberField.isUnit_iff_norm` give the integral rank and the unit-norm restriction. `Units.map`, `ContinuousMonoidHom.comp`, `fst` and `snd`, `Ideal.span` and quotient maps are sufficient for the light weight definitions. The number-field integral-to-generic-fibre norm comparison and the character-map sign are the additional assertions here.

For coefficients use `Representation`, its tensor and dual operations, `ContinuousLinearMap`, `Module.Projective` and `SheafOfModules`. These types by themselves provide neither analytic induced representations nor effective descent of Banach representations. For matrix identities use `Matrix.fromCols`, `fromBlocks`, their multiplication identities, `Matrix.isUnit_iff_isUnit_det`, `mul_nonsing_inv`, `nonsing_inv_mul`, `transpose_mul`, and `Matrix.GeneralLinearGroup.det`. General determinant multiplicativity is a library theorem; the target here is the identity for the *actual period-coordinate factors*. For scalar direct limits and completion use `Ring.DirectLimit.of`, `Ring.DirectLimit.lift` and `AdicCompletion`, with topology and sheaf comparison proved separately.

From Tau Ceti, `NumberField.NarrowClassGroup` and `NumberField.NarrowClassGroup.instFinite` supply the polarization-class index. Use `NumberField.NarrowClassGroup.exists_mk0_eq_and_isCoprime_absNorm` for prime-to-p integral representatives, with modulus p≠0. `TauCeti/Algebra/Lie/HighestWeight/Module.lean` supplies highest-weight module generation and weight-cone results; the algebraic representation entering analytic induction comes from AutomorphicBundles B2, with this Lie-algebra API as an input. Use `TauCeti.continuous_algebraNorm` from `TauCeti.Topology.Algebra.Algebra.Norm` and `TauCeti.Algebra.normUnits` from `TauCeti.RingTheory.Norm.Units`, specialized to ℤₚ⊗ℤ O_F with its finite-module topology; `Continuous.units_map` gives continuity on units. The finite free hypotheses hold at ramified primes as well. `AlgebraicVectorBundles` §L0B–L0C supplies finite locally free tensor/dual identities. Its relative-Spec convention has no bearing on the analytic coefficient equalizer.

The exact geometric contracts are as follows.

| Supplier | Data and theorem consumed | Additional obligation here |
| --- | --- | --- |
| `HodgeTateAndCanonicalSubgroups` §3.12, §§4.6–4.8 | Rank-one canonical O_F/pⁿ-module, `ramifiedPeriod_comparison`, `canonicalKernel_congruence`, period bounds and scaled Atkin–Lehner maps | Apply the unsplit inputs before evaluating weights; extend the closed odd-prime endpoint |
| Same, §§5.1, 5.8, 5.10–5.12 | Finite Igusa torsors and ordinary inverse tower with finite étale formal models on open ordinary loci and semiabelian/one-motive boundary charts; modified lattice, AIP torsor, `hodgeTate_aipLift`, `aip_automorphyFactor`, `aipTorsorHodgeTateComparison` | Apply the character, prove all-open invariant functions and compare integral eigenfunctions; minimal coefficients use toroidal pushforward rather than a minimal Igusa torsor |
| Same, §2.10 and §§7.29–7.30 | Open Hodge-type Levi comparison and Hodge-type logarithmic association with cyclotomic twist | Carry the twist through coefficients; arbitrary pure data use PerfectoidShimuraVarieties §6.1a |
| `PerfectoidShimuraVarieties` §§1.13–1.14, 3.4, 5.4–5.10 | Anticanonical Frobenius models and their completed limit, row graph, strict-Iwahori domain, Hilbert deck groups, mixed span, pairing and polarization maps | Coefficient equalizers, their four presentation comparisons, and ordinary Igusa completion after pullback to each wild level and its limit |
| Same, §§6.1a–6.3, 6.12–6.15 | Rank quotient Gʳ=G/Zᵣ(G), its parabolic and Levi torsors; toroidal diamonds, Bruhat reductions and common refinements | Coefficients trivial on Zᵣ(G), with quotient maps and twists; Gᶜ only under the supplied CM-split-centre identification |
| `PerfectoidTowers` P9.6–P9.13 | All-open smooth-weight function descent, invariant module subsheaves and finite-rank integral matrix-coboundary effectivity | Specialize to the actual coefficient torsors and compare the analytic/v/pro-Kummer-étale coefficient functions and Gauss lattices |
| `AutomorphicBundles` B0, B2, B3, B4, B5 | Algebraic associated bundles, highest-weight dictionary, canonical/subcanonical extensions, classical weights and expansions | Analytic-family comparison, boundary extension and coefficient-valued expansions |
| `ShimuraCompactifications` C3.6a, C3.10, C6.20–C6.47; `AutomorphicBundles` B3.Hilbert.1–3 | Proper toroidal contractions, cusp-unit charts, semiabelian objects, ordinary loci, ramified algebraic coefficient descent and coherent formal functions | Completed analytic ordinary coefficients, their toroidal extension and minimal pushforward, with comparison of the torsion-first limits in both tower indices |
| `LocallyAnalyticDistributions` Layers 0, 4, §§3.3, 4.15; `PhiGammaModulesAndIwasawaCohomology` §4.0 | Compact character geometry, `localMultiplicativeCharacterSpace K`, uniformizer and coefficient change, Mellin equivalence, universal characters and common-radius analyticity; analytic charts, compact restrictions and family Banach tools | Number-field unit charts, inverse-norm pullback, universal-character-preserving local multiplicative adapters, Borel equivariance and geometric Banach sheaves |
| `PadicLocalLanglandsForGL2Qp` §0.1 | `AnalyticSupport.functions`, `AnalyticSupport.distributions`, the coadmissible-module category of PadicLocalLanglandsForGL2Qp §0.1, `AnalyticSupport.vectors`; convolution, noetherian flat Banach stages, admissible strong-dual anti-equivalence and rational Schikhof duality | Use the same carriers for a finite analytic field L and finite coefficient extension E/L; extend the character functor to general abelian groups using the supplied local multiplicative carriers, and construct essential admissibility and finite-slope Jacquet coefficients |
| `CompletedCohomologyPartII` F.1, F.4, Layers 1–3 | Compact-open admissible Banach category, analytic orbit vectors and their topology, completed-function operations | Apply the shared Banach and analytic dualities to the arithmetic Π, retaining its other-place coefficients and Jacquet action |
| `PadicFamilies` §§2a.1–2a.14, 2a.17 | Fredholm slope charts, finite faithful Hecke algebras and coherent eigenmodules from linked property-(Pr) modules; global component-image theorem with its relatively factorial weight-cover hypothesis | Verify those inputs and the compact-weight cover, then establish arithmetic classical accumulation near algebraic weights and componentwise density |

The all-open scalar weight comparison is supplied by `PerfectoidTowers` P9.11, its rational and integral structure-sheaf equalizer statements. Its hypotheses are a mixed-characteristic perfectoid field K, an affinoid smooth rigid or affinoid perfectoid Y/K, an affinoid perfectoid pro-étale profinite Γ-torsor X→Y, and a smooth rigid weight space over a perfectoid extension of K. The invariant sections on the full preimage of every open of Y times the weight space are its O or O⁺ sections, naturally in restriction. The smoothoid analytic/v-site comparison there supplies the rational-open step, and surjectivity on valued points reflects integral bounds. P9.13 supplies the invariant module subsheaf and integral matrix-coboundary effectivity statements; the latter requires an actual integral matrix coboundary and its integral inverse. These assertions are consumed, not new targets here. The analytic AIP B_m-torsor in Layer 5 is not a profinite torsor and needs its separate invariant-function proof.

`AdicSpacesPartIV` R5.7, *affinoid-weight-coefficient-sheaf*, identifies rational completed affinoid coefficient functions with functions on the actual rigid product. Its *coefficient-sheaf-local-equalizer* and *coefficient-sheaf-kiehl* retain their distinct hypotheses; no integral Kiehl theorem or arbitrary global generation is inferred. `AdicSpacesPartIII` R3 supplies the associated module sheaf and rational affinoid Kiehl comparison.

Each use of effectivity below specifies a category and an actual torsor. Finite locally free descent does not imply infinite-rank Banach descent. Scalar extension does not commute with an integral finite-group equalizer merely because it commutes after inverting (p).

## How to read the build

Layer 0 fixes weights and analytic representations, including the unitary application. Layer 1 gives the automorphy and descent convention. Layers 2–3 construct geometric Hilbert coefficients and their integral and overconvergent forms. Layer 4 compares the four geometric/arithmetic presentations. Layer 5 gives the independent AIP construction and comparisons. Layer 6 adds cuspidality, expansions and normalized compact Hecke correspondences. Layer 7 identifies the ordinary completion on the open bases at each wild level and at the anticanonical limit, extends it on toroidal models, and compares its minimal pushforward, retaining Frobenius transitions and cusp-unit invariants. Layer 8 applies the same coefficient method to Siegel and general toroidal/Bruhat reductions. All layer targets, basic-theory bullets and Checks below are prose specifications. Suggested.lean inventories the headline theorems and their missing carriers; it contains no substitute scalar or matrix statements. Named assertions in the layers are targets to be formalized; a result whose proof needs a stronger geometric input is explicitly stated with that input rather than inferred from a weaker source.

## Layer 0: weights and analytic coefficient representations

### 0.1 The integral algebra at (p) and its norm

Define the integral p-adic algebra of F at p as the displayed tensor algebra, with its finite-module topology. Prove compactness of the integral algebra, its degree formula, and the compatibility of this topology with multiplication and every (ℤₚ)-linear endomorphism. Its rank is ([F:ℚ]), without an unramified or split hypothesis. Define the algebra norm by specializing `Algebra.norm` and the norm on units by `Units.map`. Define the tensor inclusion of global units by the right tensor inclusion. Prove compatibility of the norm with the right tensor inclusion on all integral elements and on global units, and the product-over-embeddings comparison after generic-fibre scalar extension to a splitting field. The last is not an integral decomposition theorem. These are determinant base-change applications to the algebra used in BHW §6.1, pp.1756–1757; the source of the general determinant identities is Mathlib's norm and determinant API.

The basic theory of these definitions has the following interfaces.

- For the integral tensor algebra of a number field, identify its finite ℤₚ-rank with [F:ℚ] and its module topology with the topology transported from any finite integral basis; multiplication and ℤₚ-linear maps are continuous.
- For the determinant norm and its unit restriction, identify their values on integral tensor inclusions with the global integral norm, and after generic splitting with the product of all embeddings. The tensor inclusion of global units preserves products and inverses.
- For H_r, identify membership with u−1∈pʳOₚ, prove H_s⊆H_r when r≤s, and prove openness and finite index for every r≥0, including H_0=Oₚˣ.

**Checks.**

- For integral p-adic algebra, (F=ℚ) gives (ℤₚ) with its usual topology and rank one. The rank for a quadratic field is two even when (p) ramifies; an integral product of two copies of (ℤₚ) would fail this ramified algebra comparison.
- For integral p-adic algebra, the sequence (p^n⊗1) tends to zero and is nonzero at each finite (n). The discrete topology fails this check. The unit (1) remains a unit after tensor inclusion.
- For integral p-adic algebra, at a split prime of (ℚ(i)), e.g. (p=5), the algebra is the product of its two local factors; this is a proved special case, not the definition at all primes.
- For algebra norm, the value on a scalar (a·1) is (a^d), so in degree two a scalar 2 has norm 4, including at p=2 before restricting to units.
- The algebra norm sends zero to zero since (d≥1), and sends 1 to 1. Defining it to be the constant unit character would fail the zero test.
- The algebra norm sends (−1) to ((−1)^d). In odd degree this is −1, detecting a sign or degree error even though the value on 1 does not.
- For norm on units, (F=ℚ) gives the identity on (ℤₚ^×); at p=5 the scalar unit 2 has norm 2.
- In degree two norm on units sends the scalar unit 2 at p=5 to 4. A product of only one embedding has the wrong value.
- The norm on units has unit-valued codomain: the nonunit (p·1) is excluded, although its algebra norm is (p^d). Identity units are included for every field and prime.
- The tensor inclusion of global units preserves the identity and products. In particular the image of η and the image of η⁻¹ multiply to 1, rather than merely to a scalar norm.
- A global unit of norm −1 still has norm −1 after tensor inclusion of global units; for example −1 over ℚ remains −1 when p=5.
- In a real quadratic field a totally positive nonrational unit has norm +1 but does not become the scalar 1 under tensor inclusion of global units. Replacing inclusion by the norm loses this test.

Define the principal unit subgroup H_r as the kernel of reduction on units modulo the ideal generated by (p^r). Prove the congruence membership criterion, antitonicity of the principal unit filtration, and openness and finite index at every depth. The definition permits (r=0), when the quotient ring is zero and the subgroup is the entire unit group. Its use for analytic characters is BHW §6.1 and AIP-adic §2.1–§2.2, pp.7–9.

**Checks.**

- (H_0=O_p^×), (H_2⊆ H_1), and (1+p^2a∈ H_2) whenever it is a unit; a reversed filtration fails.
- For (F=ℚ) and odd (p), a nontrivial Teichmüller unit lies outside (H_1). At (p=2), (H_1=ℤ₂^×) but (-1∉ H_2).
- The identity is in every (H_r), and the intersection over (r) is the identity by separatedness. The algebra element (p) is never an element of the unit-group carrier.

*Needs:* Mathlib finite integral bases, tensor base change, module topology and determinants; Tau Ceti norm continuity and unit norm.

### 0.2 Weight spaces and the inverse norm convention

Define geometric and arithmetic weights over R on any topological commutative ring (R) as continuous homomorphisms to (R^×) from (O_p^×) and (O_p^××ℤₚ^×), respectively. The arithmetic character constructor for (w,t) multiplies the two coordinate characters. Its API consists of recovery of the first character, recovery of the second character, uniqueness from both characters, and compatibility with continuous coefficient-ring maps. Define Hilbert geometric weight space and arithmetic weight space by specializing the compact rigid character-space functor to Oₚˣ and Oₚˣ×ℤₚˣ. Identify their number-field unit-group charts, point evaluations and completed-algebra universal characters using the supplied representability and finite-character charts. The new geometric map is the inverse-norm pullback below. Sources: BHW Definition 6.1, pp.1756–1757; AIP-adic §2, pp.6–9.

The basic theory of these definitions has the following interfaces.

- For geometric weights and arithmetic weights, evaluation preserves identity and multiplication and commutes with continuous coefficient-ring maps.
- For the arithmetic character constructor, restriction to (x,1) and (1,y) recovers w and t, and these two restrictions uniquely recover the original character.
- For the two rigid weight spaces, prove that their universal characters specialize to the characters they represent and that their finite-character charts cover their compact character functors.
- For the inverse norm map x↦(x²,Nₚ(x)⁻¹), prove the group law and continuity. Its weight pullback is continuous and evaluates to w(x)²t(Nₚ(x))⁻¹, with algebraic exponents 2a_τ−v.
- For every global unit congruent to 1 modulo N≥4, prove integral norm one and consequently cancellation of the central weight factor, without a total-positivity hypothesis.

**Checks.**

- The geometric weight contains the trivial character and every algebraic character `∏_τ τ(x)^(k_τ)` over a field containing the embeddings; a finite-order character can have conductor beyond (H_1).
- The arithmetic character constructor restricts to (w) on ((x,1)) and to (t) on ((1,y)). Taking (w=1,t≠1) distinguishes arithmetic and geometric character carriers.
- A pair is recovered uniquely from these restrictions, including the trivial pair. A character on a sum of coordinates rather than their product would fail multiplicativity and the restrictions.
- Hilbert geometric weight space for (F=ℚ) has the usual finite-character components and one open-disc direction. Its arithmetic counterpart has two disc directions; forgetting the second coordinate changes the dimension.
- In the dyadic case the sign character on (-1) distinguishes components. The universal character evaluated at a unit specializes to that unit's character value, not its inverse.
- An affinoid in one finite-character chart does not represent all characters of arbitrary conductor with a fixed analytic radius. The charts must cover rather than identify these loci.
- The geometric weight evaluation at a product xy is the product of the values at x and y, and evaluation at 1 is 1; a general continuous function to units fails this law.
- Under a continuous coefficient-ring map, geometric weight carries both algebraic and finite-order characters to their scalar extensions. A coefficient map killing a nonzero scalar cannot be treated as an injection of character values.
- For arithmetic weight, holding w fixed and changing t changes evaluation at (1,y); holding t fixed and changing w changes evaluation at (x,1). Either coordinate may be nontrivial with the other trivial.
- The arithmetic character constructor of two trivial characters is trivial. Reconstructing a character from its two restrictions gives its original value on (x,y), since (x,y)=(x,1)(1,y).
- The arithmetic weight space has a universal character on both compact coordinates; specializing it at (w,t) evaluates to w(x)t(y). Its projection to geometric weights has exponents 2a_τ−v and is not a coordinate projection.

**Coordinate-constructor checks.**

- The arithmetic character constructor for (w,1) at (x,y) is w(x), independent of y. A constructor interchanging the coordinates fails this check.
- The arithmetic character constructor for (1,t) at (x,y) is t(y), independent of x. At F=ℚ,p=5 and t=x, evaluation at (2,3) is 3, not 2.
- The arithmetic character constructor for (w,t) commutes with continuous coefficient change and is reconstructed from its coordinate restrictions; the trivial pair gives the trivial character. A product character w(x)t(y) with a missing factor fails whenever both factors are nontrivial.

Define the inverse norm group homomorphism by x↦(x²,Nₚ(x)⁻¹) and weight pullback by precomposition. Prove continuity of the inverse norm group map and continuity of weight pullback; these promote the underlying maps to continuous characters. Prove the two-character evaluation formula, the pure norm-character formula, and evaluation at totally positive units. The first formula is κ=w²(t∘Nₚ)⁻¹; hence at an algebraic pair with exponents (a_τ,v) the geometric exponents are (2a_τ-v). This fixes the group-map convention by the formula used in BHW Definition 6.1 and the paragraph after Definition 6.2, pp.1756–1757. A non-inverted norm coordinate would give the wrong exponents.

**Checks.**

- For inverse norm group map, the identity maps to ((1,1)), and (-1) maps to ((1,(-1)^d)). For (F=ℚ), a unit (x) maps to (x²,x⁻¹).
- For weight pullback, (t=1) gives (w^2); (w=1) gives (t∘Nₚ)⁻¹.
- At (p=5,F=ℚ,w(x)=x,t(x)=x), evaluating at (x=2) gives (2), whereas using (N_p) instead of its inverse would give (8). This is the numerical specialization of the two-coordinate tests.
- A global unit (η) of norm (1) has (κ(η)=w(η)^2). If (N(η)=-1), the additional factor is t(−1)⁻¹; total positivity cannot be dropped from the former assertion without a norm-one hypothesis.

Prove the norm-one theorem for congruence units: for a number field, (N≥4), and a global unit (η≡1 mod NO_F), its integral norm is (1). Indeed the norm is (±1) and is congruent to (1) modulo (N). Prove that the resulting weight factors cancel on these units. This concerns *all* congruence units, including mixed real signs, and is the input for the central closure in Layer 4. Neither a prime-to-(p) condition nor total positivity is needed for this algebraic norm assertion. The geometric level will separately assume both smallness and (p∤ N). Source: BHW §9.1, pp.1780–1782, with the determinant congruence argument made explicit.

**Checks.**

- For inverse norm group map, xy maps to the product of the two images, including the inverse norm coordinate. At F=ℚ,p=5, the values at 2 and 3 multiply to (36,1/6), the value at 6.
- For weight pullback, multiplying arithmetic characters adds their exponents. The pairs (a,v)=(1,0) and (0,1) give geometric exponents 2 and −1; their product has exponent 1, rather than 3.
- For the two rigid weight spaces, pullback of the universal character to an affinoid chart and then to a point gives that point's character. At p=2 the trivial and sign characters are distinct points even though their restrictions to H₃ agree. This checks both charts' finite components, not only their disc dimensions.

*Needs:* §0.1; continuous homomorphisms; PhiGammaModulesAndIwasawaCohomology §4.0; LocallyAnalyticDistributions §3.3; PadicMeasuresIwasawaAlgebras §3a.1.

### 0.3 Analytic radii and bounded families

For a continuous character into a uniform Banach (ℚₚ)-algebra with the norm fixed above, define principal character radius as

```text
T_principal(κ) = sup { ‖κ(u)−1‖ : u ∈ H_depth },
depth = 1 for odd p, and depth = 3 for p = 2.
```

Prove the strict principal-radius bound using compactness, continuity, a finite set of pro-(p) generators and the spectral norm. Prove invariance under finite characters trivial on H_depth, and functorial bounds under bounded coefficient maps. Specialize LocallyAnalyticDistributions §4.15's common-radius universal-character analyticity as eventual analyticity of continuous characters, giving a sufficiently small analytic unit neighborhood carrying an extension, compatible with restriction. The quantitative input is AIP-adic Proposition 2.8, pp.8–9, with (ε_char=1) at odd (p) and (3) at (p=2) in its character-neighborhood notation. Those (ε_char)'s are not Hasse radii. Do not assert a universal exact radius p^(−depth)T_principal; in particular the trivial character has T_principal=0 and still extends to a nonzero neighborhood.

The basic theory of these definitions has the following interfaces.

- For the principal character radius, prove T_principal(κ)<1 under the uniform spectral-norm hypotheses, invariance under finite characters trivial on H_depth, and the stated bounded-map estimate.
- For a continuous weight, obtain an analytic extension on some sufficiently small neighborhood; for a bounded family obtain a common such neighborhood on its chosen affinoid chart.
- For bounded weight families, restriction and pullback preserve the character map and chosen extension on the intersection of the admitted domains, with identity and composition laws.

**Checks.**

- The trivial character has T_principal=0. A Teichmüller character at odd (p) also has value zero here, even though the supremum over *all* units need not be less than one.
- For (F=ℚ), odd (p), and (κ(x)=x^k), (k≠0), the value is (|pk|_p); at (k=0) it is zero. This detects using the wrong principal subgroup.
- At (p=2), the sign character is trivial on (H_3), while it is nontrivial on (-1). A full-unit supremum and a principal-unit supremum therefore record different information.

Define bounded weight family to consist of the smooth rigid base, its morphism to the relevant weight space, containment of its image in an affinoid chart, and a chosen common analytic extension on a specified neighborhood whenever a construction uses one. Prove restriction for bounded weight family, pullback and radius change, with the obvious intersection of admitted domains. Smoothness is a property of the base, not a claim that its weight map is smooth. The supplied common-radius theorem gives a bounded family a sufficiently small extension after choosing a chart; the extension is not determined by the numerical supremum alone. Sources: BHW §6.1, p.1757; AIP-adic Proposition 2.8 and AIP-cusp §4.1, pp.24–28.

**Checks.**

- A point with any continuous weight is a bounded family and becomes analytic on some sufficiently small neighborhood. It need not be analytic on a neighborhood specified in advance.
- Restricting a family to a rational subdomain preserves its chosen extension, and pulling back to a smooth rigid base preserves the affinoid-image bound. A constant weight map can be bounded without being a smooth morphism.
- A family whose image traverses arbitrarily many conductor charts cannot be assigned one chart merely because each of its points individually has an analytic radius. Coefficient base change with a non-uniform norm is outside the norm assertion.

*Needs:* §§0.1–0.2; LocallyAnalyticDistributions §4.15; compact finite-generated principal units; the uniform spectral norm.

### 0.4 Finite analytic coefficients and analytic induction

Define a finite analytic coefficient of H over A as a finite projective A-module V, its canonical Banach-module topology, a continuous representation of the specified analytic group H, and analyticity of its orbit maps on the chosen group chart. An integral version additionally records a stable A⁺-lattice. Define coefficient tensor product, contragredient coefficient dual and completed coefficient extension using the completed finite-projective tensor product, the contragredient action (hφ)(v)=φ(h⁻¹v), and completed coefficient extension. Prove the diagonal tensor action, invariance of coefficient evaluation, equivariance of completed coefficient extension, multiplicativity of coefficient rank and the finite-projective evaluation isomorphisms. General module tensor and dual identities are supplied; the new assertions check analyticity, topology and specified lattices. Sources: BP §§6.1–6.2, pp.145–150, and the associated-coefficient convention of AutomorphicBundles B0.

The basic theory of these definitions has the following interfaces.

- For finite analytic coefficients, restrict the analytic action to smaller charts and preserve it under coefficient change; a stable integral lattice remains additional data.
- For coefficient tensor products and contragredient duals, prove diagonal action, invariant evaluation, rank multiplication and equivariant double duality. Completed coefficient extension preserves finite-projective summands and composes.
- For analytic induction, identify the opposite-unipotent chart, its Banach norm, left action, restriction maps and positive-torus radius improvement. The locally analytic colimit has its locally convex universal property, and is of compact type over a finite coefficient field.
- For bounded open-disc distributions, prove projective Banach structure in the specified model. Their inverse limit pairs continuously with the locally analytic induction, and the semigroup actions are contragredient.
- For arbitrary affinoid coefficients, prove topological norm and presentation independence, identity and composition for these identifications, and completed coefficient-change maps commuting with radius maps and the pairing.
- For algebraic restriction and the finite-character induction comparison, retain the dominant weight, extended finite character and positive-torus normalization in the injections and isomorphisms stated above.
- For induction multiplication, prove pointwise product equivariance, associativity and compatibility with algebraic restriction; no tensor-product isomorphism is claimed in positive unipotent dimension.

**Checks.**

- The finite analytic coefficient on the zero module has rank zero; on a trivial line it has rank one and trivial action. A rank-two diagonal action with characters χ₁,χ₂ retains both characters and is not replaced by their determinant.
- The coefficient tensor product of two character lines has character χ₁χ₂; tensoring by the trivial line preserves the representation; tensoring by zero gives zero. These distinguish tensor from direct sum.
- The contragredient coefficient dual of χ has character χ⁻¹, so evaluation is invariant. A unit acting as 2 at p=5 acts as 1/2 on the dual, not 2.
- The completed coefficient extension preserves a rank-two direct summand and intertwines its action. A nonflat map preserves finite projectivity after algebraic base change, but integral sheaf equalizers need not commute with it.
- A continuous character of high conductor is not a coefficient analytic on a previously fixed larger chart. A lattice is additional structure; a rational isomorphism need not preserve specified lattices.

For the induction model choose a finite extension E₀/ℚₚ, a split reductive O_E₀-model M, upper Borel B, torus T, and longest Weyl element w₀,M. As in BP §6.2, p.148, the generic-fibre torus has a specified ℚₚ-form, whose maximal compact subgroup is denoted T(ℤₚ). Use the closed subgroup M₁=N̄₁T₁N₁⊂M(O_E₀), with T₁=T(ℤₚ) and the stated normalization of N̄₁ by Tᴹ,⁻. General Shimura Levi applications choose their splitting field and this model; this does not require the original Shimura group to be split over ℚₚ. Over a uniform finite-type Tate E₀-algebra A, define the analytic induction of κ at (M₁,n) as analytic functions on the genuine adic neighborhood M₁Mₙ, satisfying

```text
f(mb) = (w₀,M κ)(b⁻¹) f(m),           (h·f)(m) = f(h⁻¹m).
```

Here κ after Weyl conjugation must be n-analytic on the torus neighborhood. M₁ is not assumed open or Zariski dense. Define locally analytic induction as the locally convex colimit over n. Its APIs for the Iwahori chart, left translation, restriction and positive torus action identify the coefficient with functions on the opposite-unipotent neighborhood and specify its norm and topology. Prove compact type for locally analytic induction over a finite coefficient field. For general affinoid A construct the locally convex A-module limit with relative completely continuous restriction maps in positive unipotent dimension; do not claim compact type over E₀. In zero unipotent dimension the stages are A with identity transitions. For t∈Tᴹ,⁺ extend the action using the Iwahori factors: if m=n̄ₘtₘnₘ, evaluate f at t⁻¹n̄ₘt·tₘnₘ. Strictly positive t improves the opposite-unipotent analytic radius and acts compactly at a compatible fixed stage. Over a coefficient field the finite-slope part is independent of a sufficiently small radius. Sources: BP §§6.2.4–6.2.10, pp.149–150. A family finite-slope construction requires the spectral supplier's slope-adapted affinoid hypotheses; no arbitrary family projector is asserted.

Define bounded open-disc distribution as BP's compact-open continuous dual of bounded analytic functions on the open-polydisc version M₁Mₙ°. Define locally analytic distribution as its inverse limit. Prove projective Banach structure for bounded open-disc distributions, transition maps, pairing for locally analytic distribution, and opposite-semigroup equivariance of the pairing. The ordinary strong Banach dual of the closed-polydisc induction is a separate object and is not asserted projective over an arbitrary affinoid algebra. Source: BP §6.2.20, pp.152–153.

Extend these induction and bounded-open-polydisc distribution models to every finite-type affinoid E₀-algebra A, including nonreduced A, using a complete submultiplicative defining Banach norm extending that of E₀ and completed tensor products. On a normalized chart, functions have A-valued power-series coefficients; bounded open-disc functions carry the topology determined by the inverse-limit topology on their coefficient unit ball and scalar dilations, as in BP §6.2.20; their compact-open continuous A-dual gives the distribution module. Prove independence, as topological A-modules with action and pairing, of the equivalent defining norm and of the affinoid presentation. Prove compatibility with the preceding uniform spectral-norm model, and completed coefficient change for the chart models under bounded affinoid maps. Spectral-unit-ball and geometric O⁺ assertions retain their uniform hypotheses; norm independence does not identify arbitrary chosen unit balls. This is the coefficient extension of BP §§6.2.4, 6.2.20, pp.149,152–153, needed for the general Tate-pair families of §6.3.1, p.154. *Needs:* the completed Banach tensor product of AdicSpacesPartII R0.5; the normalized Iwahori charts and bounded open-disc coefficient topology above.

Its API consists of norm-change and presentation-change topological isomorphisms, identity and composition for these maps, equivariance of the pairing, and completed coefficient-change maps compatible with radius restriction. The projective Banach assertion uses this bounded open-disc model, rather than the full strong dual of closed-disc functions.

**Checks.**

- With A=E₀[ε]/(ε²) and ‖a+bε‖=max(|a|,|b|), a torus gives A and its A-linear dual A, each of E₀-dimension two. The nonzero ε has norm 1 and spectral seminorm 0, so spectral reduction would incorrectly give dimension one.
- Replacing this norm by max(|a|,c|b|), c>0, gives equivalent norms and the same continuous pairing (a,b)↦ab. It can change the chosen unit ball; the norm-independence assertion does not claim an isometry.
- In one unipotent coordinate, εz is a nonzero bounded analytic function and evaluation at a nonzero admitted a sends it to aε≠0. The quotient A→E₀ kills it by coefficient change, while the identity coefficient map retains it. Thus neither scalar extension nor chart restriction silently reduces A.

**Checks.**

- For analytic induction, a torus has no unipotent variables: its functions satisfy f(t)=κ(t)⁻¹f(1), while the left action h·f(t)=f(h⁻¹t) has character κ(h). At κ(h)=2 the action is 2 and the function value f(h), when f(1)=1, is 1/2; forward translation exchanges these two values.
- For SL₂, the analytic unipotent coordinate admits all convergent power series on the specified disc. The algebraic highest-weight-k subspace has degree at most k, so z^(k+1) is an analytic nonexample to algebraicity.
- If M₁ is not Zariski dense, functions on its rational points do not determine arbitrary analytic functions on its thickening. That thickening is part of the definition.
- For locally analytic induction on a torus with A=E₀⟨T⟩ and trivial weight, the limit is A. The monomials Tⁿ remain distance one, so its identity transition is not compactoid over E₀; the affinoid family is not of fieldwise compact type.
- For locally analytic induction, a function analytic only at a deeper stage still represents a colimit element; two representatives agree after a common further restriction. The topology is the locally convex colimit topology, not an arbitrary topology on set functions.
- For bounded open-disc distribution, zero unipotent dimension gives A. In one variable evaluation at zero kills z but not 1, detecting its moments. Its projectivity concerns the bounded open-polydisc construction.
- For locally analytic distribution, moments must be compatible at every stage. Unrelated Banach functionals do not give a limit element. The action on the dual pairs with the inverse action on functions, not the same forward action.

Prove injectivity of algebraic restriction into induction: for dominant algebraic κ, restriction embeds the supplied algebraic representation Vκ into the analytic induction. Its positive-torus action satisfies ι(t·v)=(w₀,Mκ)(t)·(t·ι(v)). For locally algebraic characters retain the smooth factor with this normalization. For the finite character induction comparison, require an actual finite-order character w₀,Mχ:M₁→E₀^× trivial on M₁∩Mₙ, whose torus restriction defines χ. Give its one-dimensional factor the trivial Tᴹ,⁺-action. For κ analytic at stage n, multiplication by (w₀,Mχ)⁻¹ identifies the analytic induction of κ at (M₁,n)⊗E₀(w₀,Mχ) with the analytic induction of κχ at (M₁,n) as (M₁,Tᴹ,⁺)-modules. These are the analytic inductions, rather than the algebraic representation Vκ. A torus character without this extension to M₁ is not enough. Source: BP §§6.2.9–6.2.11, pp.150–151. Define induction multiplication by pointwise multiplication into the product-weight induction, and prove its equivariance, associativity and compatibility with algebraic restriction. This map is not generally a tensor-product isomorphism. Sources: BP §§6.2.11–6.2.19, pp.151–152, and multiplication in the displayed induced model.

**Checks.**

- The induction multiplication sends 1⊗z−z⊗1 to zero in a one-variable chart. Evaluating the tensor factors at two distinct points detects that this tensor was nonzero.
- Two trivial-weight constants give their scalar product; two character lines give the product character, not either input weight.
- For a torus, whose opposite unipotent has dimension zero, multiplication is multiplication of coefficient lines; with a unipotent variable the preceding kernel occurs. A finite character of conductor beyond the chosen stage requires a deeper stage before the comparison applies.
- For the finite-character comparison, choose a primitive cube root ζ in E₀ and m∈M₁ with (w₀,Mχ)(m)=ζ. A function with value 1 at m is sent to value ζ⁻¹=ζ², not ζ. The finite factor has Tᴹ,⁺-eigenvalue 1; assigning a nontrivial eigenvalue there breaks the stated positive-action intertwining.

**Checks.**

- A rank-two finite analytic coefficient restricts to the same action on a smaller chart; a representation with discontinuous orbit maps fails the defining condition. Over a DVR the lattices V⁺ and pV⁺ have the same rational representation but distinct inclusions.
- The coefficient tensor product of ranks two and three has rank six. Its diagonal group action acts on both factors; tensoring two nontrivial character vectors detects an action on only one factor.
- The coefficient tensor product commutes with finite-projective coefficient extension and carries an idempotent summand to that summand's extension. Replacing a direct summand by its ambient free module fails this test.
- The contragredient coefficient dual sends the zero coefficient to zero and the trivial line to itself. A two-character diagonal action gives χ₁⁻¹ and χ₂⁻¹ separately, not the inverse determinant repeated twice.
- The double contragredient evaluation isomorphism is equivariant: on a character χ it returns χ rather than χ⁻¹. Its pairing on a line with action 2 and dual action 1/2 is multiplication, invariant under the group.
- The completed coefficient extension along the identity recovers the action, and two complete extensions agree with their composite. On a nontrivial character vector the eigenvalue is its image in the new algebra.
- The completed coefficient extension sends zero to zero and a trivial line to the new algebra's trivial line; it preserves the scalar-extended idempotent projector. Rank functions on disconnected bases need not become constant.
- The locally analytic induction on a torus is the line with action κ and inverse-character dependence on its function argument. In a unipotent variable, it contains a germ analytic on a deeper disc without requiring extension to every larger disc.
- A locally analytic induction germ with nonzero value at a retained base point remains nonzero after restriction; the colimit relation does not collapse all representatives. The zero germ is zero at every stage.
- For bounded open-disc distribution, choose distinct points in the specified open chart: 0 and p^(n+1) in the standard depth-n disc. At p=3,n=1 their evaluations on 1 are both 1 and their evaluations on z are 0 and 9. Evaluation at 1 lies outside this chart; retaining only the zeroth moment would identify the two permitted distributions.
- For bounded open-disc distribution in zero unipotent dimension the pairing is (a,b)↦ab over A, and coefficient change carries it to the product over the new algebra. Its projective Banach assertion uses the bounded open-disc module, not the unrestricted strong dual.
- In locally analytic distribution, evaluation at a compatible base point defines a compatible family at every stage. Moving the point incompatibly from stage to stage does not.
- The locally analytic distribution on a torus is the dual of the κ-action line, so its action character is κ⁻¹. A nontrivial character and its dual do not have the same action in general.
- The induction multiplication sends z⊗z² to z³ in a compatible one-variable chart, with the product Borel character. Multiplication by the trivial-weight constant 1 is the identity; a fixed nontrivial weight space need not contain that constant.

*Needs:* finite projective modules and representations; AutomorphicBundles B0 and B2; AdicSpacesPartII R0.5; LocallyAnalyticDistributions Layers 0 and 4 for analytic charts and restriction; PadicFamilies §§2a.1–2a.14 for family finite-slope applications.

### 0.5 Normalized Siegel coefficients and the induction dictionary

For g≥1 let I⊂GL_g(ℤₚ) be the upper Iwahori and I⁺ its inverse image of the diagonal torus modulo p. Put M_s=1+{E:‖E‖≤p^(−s)}. For rational r>0, choose a diagonal-torus character κ with a multiplicative analytic extension to T(ℤₚ)(M_(r+1)∩T), and require κ and its inverse to have Gauss norm at most one there for the integral and isometric assertions. Such a stage is obtained by increasing r for a bounded family; continuity alone at a previously fixed r is insufficient. Define the normalized Siegel analytic coefficient at (κ,r) on G_(r+1)=IM_(r+1), by upper-Borel equivariance f(ℓb)=κ(b)f(ℓ), with κ trivial on upper unipotents. Its finite opposite-unipotent charts use coordinates u_ij/p of radius p^(−r). The norm is the chartwise Gauss norm; its integral lattice is its unit ball. Define the transpose pullback action of h for h∈I⁺M_(r+1) by (ρ_D(h)f)(ℓ)=f(hᵀℓ). Prove multiplicativity for transpose pullback action, isometry, integral stability and radius compatibility. Define Siegel coefficient multiplication into the product-weight coefficient by pointwise multiplication; prove equivariance of Siegel coefficient multiplication, the norm bound, associativity and integral stability. A chart trivialization can transport an algebra structure to the underlying function module, but translations of a nontrivial coefficient weight are not algebra automorphisms. Sources: DRW Remark 3.1.9, Definition 3.1.10, Remark 3.1.12 and Definition 3.1.13, pp.22–24; its algebraic comparison is §3.4, pp.37–38.

The basic theory of these definitions has the following interfaces.

- For the normalized Siegel coefficient, identify its finite opposite-unipotent chart module and Gauss unit ball on IM_(r+1), using the two-sided bound on the extended character for integral statements.
- For transpose pullback, prove the representation law, isometry, preservation of that unit ball and compatibility with admitted radius restriction.
- For Siegel coefficient multiplication, prove product weight, equivariance, associativity and the product norm bound, including integral stability.
- For the BP–Siegel dictionary at integer stages, prove the identity-on-functions isometry with inverse Weyl-conjugated weight and inverse-transpose group action, and its compatibility with the cofinal locally analytic limits.

**Checks.**

- The normalized Siegel analytic coefficient for g=1 is a line; for g=2 it has one unipotent variable and nonconstant analytic functions. The integral lattice uses Gauss coefficients.
- (T^p−T)/p is integral-valued on ℤₚ but has Gauss norm p on the unit disc. Checking only integral rational points gives the wrong lattice.
- The group is IM_(r+1). In normalized coordinate t=u/p, choose a pole a with vₚ(a)=r−1/2, r≥3. The function 1/(t−a) is analytic on the radius-p^(−r) disc but not on the larger radius-p^(−(r−1)) disc needed by IM_r.
- The transpose pullback action of a diagonal h on a line multiplies by κ(h). Using h⁻¹ would invert this value. The transpose reverses products, so successive left pullbacks have the stated representation order.
- Siegel coefficient multiplication of weights κ,λ has weight κλ; squaring gives κ². A constant function 1 belongs to a fixed nontrivial coefficient space only if it satisfies that space's Borel relation, which it generally does not.
- A finite character nontrivial on the rational principal-unit subgroup of a proposed connected torus disc cannot extend analytically over that disc: its finite-valued analytic extension would be constant. It needs a deeper stage. A multiplicative analytic extension without the two-sided Gauss bound does not give the asserted isometric integral action.

Prove the BP–Siegel induction dictionary at integer stages n=r+1≥2 on the same entrywise neighborhood, with κ_BP=w₀,M(κ_D⁻¹) and τ(h)=h^(−T). It is the identity on functions and an isometry, and ρ_D(h)=ρ_BP(τ(h)). Integer-stage cofinality compares locally analytic limits. Both the inverse character and the inverse transpose are necessary. Sources: BP §6.2.4 and DRW Definitions 3.1.10 and 3.1.13, by substitution in their equivariance laws. Use this dictionary before the algebraic specialization of Layer 8.

**Checks.**

- The transpose pullback action fixes every coefficient for h=I. In a genus-two chart an admissible nonzero translation changes the coordinate function, so the action is not only a scalar weight action.
- Two successive transpose pullback action pullbacks equal the action of h₁h₂ because (h₁h₂)ᵀ=h₂ᵀh₁ᵀ. Noncommuting admissible factors distinguish this from the reversed product.
- Siegel coefficient multiplication sends z⊗z² to z³ and sends a zero factor to zero. Its Gauss norm is bounded by the product of the input norms.
- Multiplication by the trivial-weight constant 1 is the identity for Siegel coefficient multiplication. Two integral coefficients have integral product, whereas this assertion supplies no algebra unit in each nontrivial weight space.

*Needs:* §0.4; matrix transpose and Iwahori factorization; the chosen analytic character extension and its two-sided Gauss bound.

### 0.6 General analytic vectors, coadmissibility and Jacquet coefficients

These constructions have their general representation-theoretic scope: L/ℚₚ is finite, E is a finite extension of L, and G is a locally L-analytic group. For Jacquet modules G is the L-points of a connected reductive L-group and P=MN is any parabolic. Taking L=ℚₚ and restriction of scalars includes the locally ℚₚ-analytic GL_n(K)-representations in §0.7. No compactness of G or splitness of its reductive group is assumed in the general definitions.

Use D_la(H,E) on `AnalyticSupport.distributions` and locally analytic functions on `AnalyticSupport.functions` for compact open H⊂G. Use that supplier’s coadmissible-module category with its noetherian Banach stages and right-flat transition maps; modules are left modules. The convolution order is δ_hδ_k=δ_hk. For all the arithmetic applications below retain the analytic field L and the strong topology. *Needs:* PadicLocalLanglandsForGL2Qp §0.1; the compact analytic charts of LocallyAnalyticDistributions Layer 0.

The basic theory of these definitions has the following interfaces.

- For the full locally analytic character space, prove representability, the compact-character-space times split-torus description, and independence and naturality of the auxiliary decomposition. The local multiplicative character adapter identifies its locally ℚₚ-analytic Kˣ specialization with the supplied carrier after coefficient extension, preserving universal evaluation.
- For the local multiplicative character adapter and its split-torus products, prove compatibility with uniformizer change, coefficient change and character inversion; these are comparisons of representing objects.
- For the Mellin map, prove continuity, injectivity and dense image; in the compact case identify the locally L-analytic quotient by the L-linearity relations.
- For essentially admissible representations, prove independence of the compact open subgroup, inclusion of admissible objects, the abelian category, and contravariant coherent duality when the group is abelian.
- For the finite-slope part, prove evaluation at 1, the stated exhaustion-based universal property, left exactness and identification of each character eigenspace.
- For normalized positive Jacquet operators, prove representative independence and the semigroup law on V^N₀, with the indicated compatibility on shrinking N₀.
- For the locally analytic Jacquet module, construct its locally analytic M-action, prove independence of N₀ and left exactness, and preserve essential admissibility. Prove the smooth and locally algebraic comparisons with their stated hypotheses and character labeling.

**Checks.**

- For the supplied distribution algebra, H={1} gives E with ordinary multiplication. For any H, δ_1 is the unit and δ_hδ_(h⁻¹)=δ_1; convolution is not pointwise multiplication of moments.
- For the supplied distribution algebra on additive ℤₚ, δ_aδ_b=δ_(a+b), so its evaluation on x is a+b. Pointwise multiplication of the two evaluations would give ab.
- For noncommuting h,k in a compact open of GL₂(L), the supplied distribution algebra has δ_hδ_k≠δ_kδ_h: a locally analytic function separates hk and kh. Commutativity of a compact weight algebra cannot be transferred to this group distribution algebra.
- For the supplied Fréchet–Stein structure, a single left-Noetherian Banach algebra repeated with identity maps is a structure; it need not be commutative. The identity transitions are right flat.
- The analytic functions on an open disc give a supplied Fréchet–Stein structure by a cofinal sequence of closed subdiscs. Their restriction maps are dense, and a function on only one small closed disc need not extend to the open disc.
- An inverse system of Banach algebras with a nonflat transition is not a supplied Fréchet–Stein structure, even if its set-theoretic limit is nonempty. Dropping the finite/Noetherian hypothesis would not justify the module-category assertions.
- For the constant algebra E, the supplied coadmissible module means a finite-dimensional E-space with its usual topology. Zero and E² qualify, while an infinite direct sum with no finite-dimensional stage system does not.
- A supplied coadmissible module with stage modules A_j has limit A; recovery at j gives A_j. Choosing incompatible transition modules is not additional freedom in the definition.
- A closed kernel between the supplied coadmissible module objects remains coadmissible and is recovered stagewise. An arbitrary dense proper submodule is not a substitute for a closed kernel or a Hausdorff quotient.

For the Banach and analytic representations used below, take the supplied analytic orbit vectors on `AnalyticSupport.vectors` and the compact-open admissible Banach category. Apply the shared Banach/Schikhof and admissible analytic strong-dual anti-equivalences, keeping the stable bounded lattice, compact topology and analytic field. A finite generating set of the measure dual gives the closed regular embedding into C(H,E)^a; its analytic vectors embed into C_la(H,E)^a with their supplied topology. These are applications of the imported dualities to the arithmetic coefficient space, rather than new representation categories. D_cont and D_la are distinct algebras. *Needs:* PadicLocalLanglandsForGL2Qp §0.1; CompletedCohomologyPartII F.1, F.4.

**Checks.**

- For the supplied locally analytic vectors (CompletedCohomologyPartII F.4), the trivial finite-dimensional representation is unchanged, with its usual topology. Every locally analytic finite-dimensional character is retained, including smooth finite-order characters after shrinking the subgroup.
- For the supplied locally analytic vectors (CompletedCohomologyPartII F.4) of C(ℤₚ,E) under translations, precisely the locally analytic functions occur. A continuous function whose orbit is not locally analytic is not inserted by the colimit; uniform approximation by locally constant functions alone does not make it locally analytic.
- The identity map on V induces the identity on the supplied locally analytic vectors (CompletedCohomologyPartII F.4), and analytic-vector maps commute with restriction to an open subgroup. An orbit analytic only on a smaller subgroup still defines a colimit vector; one fixed large analytic stage would miss it.
- For the supplied admissible Banach category (CompletedCohomologyPartII F.1), C(H,E) under the regular action has dual the free rank-one bounded-measure module. A finite direct sum has the corresponding finite rank.
- A finite-dimensional continuous representation of H belongs to the supplied admissible Banach category (CompletedCohomologyPartII F.1); for the trivial group the condition excludes an infinite-dimensional Banach space. Mere continuity is insufficient for admissibility.
- A closed H-stable subspace of C(H,E)^a passes the regular-embedding criterion for the supplied admissible Banach category (CompletedCohomologyPartII F.1). An arbitrary algebraic embedding with no closed-image or topology condition is not that criterion.
- For the supplied admissible analytic representation, C_la(H,E) corresponds to D_la(H,E), and the zero representation corresponds to the zero coadmissible module.
- For the trivial group, the supplied admissible analytic representation again means finite dimensional. An infinite-dimensional locally convex space with trivial action does not become admissible by declaring every orbit analytic.
- Closed kernels and Hausdorff quotients of the supplied admissible analytic representation correspond, with arrows reversed, to cokernels and kernels of coadmissible modules. Applying the same covariant arrow order on both sides fails even for E²→E.

For a topologically finitely generated abelian locally L-analytic group Z, define full locally analytic character space Ẑ by the affinoid-valued locally analytic character functor, and construct its strict quasi-Stein rigid representative. With Z≃Z₀×Λ, Z₀ compact and Λ≃ℤ^a, prove product for full locally analytic character space: its representative is the compact locally L-analytic character space times (G_m)^a. The decomposition is an auxiliary choice; prove independence and naturality. Construct the continuous injective Mellin map D_la(Z,E)→O(Ẑ) with dense image, and use the supplied compact locally ℚₚ-analytic Mellin equivalence when Z is compact and L=ℚₚ. For L≠ℚₚ identify the quotient by the L-linearity relations with the locally L-analytic character space and its Mellin equivalence. At noncompact Z it need not be surjective. Sources: Emerton-analytic Proposition 6.4.1, Definition 6.4.2 and Propositions 6.4.5–6.4.6, pp.124–127. The general abelian-group extension, L-analytic equations when L≠ℚₚ, and topology are the targets here.

For a finite extension K/ℚₚ and L=ℚₚ, define the local multiplicative character adapter from Ẑ for Z=Kˣ to the E-base change of `localMultiplicativeCharacterSpace K` by the identity on affinoid-valued characters. Prove that it is the unique rigid equivalence preserving the universal character at every x∈Kˣ. In coordinates δ↦(δ|_(O_Kˣ),a=δ(ϖ)), changing ϖ to uϖ sends a to δ(u)a; inversion sends (δ|_(O_Kˣ),a) to (δ⁻¹|_(O_Kˣ),a⁻¹). Prove compatibility with finite coefficient extension, evaluation and products, so for a split torus T(K)≃(Kˣ)^n the adapter is the product of these equivalences. Use that product carrier for the Jacquet sheaf in §0.7, with the same contragredient inversion on coherent-dual labels. These maps are determined by the representing property, rather than by a chosen uniformizer. *Needs:* PhiGammaModulesAndIwasawaCohomology §4.0 for the carrier, universal evaluation, uniformizer change and finite coefficient compatibility; the representing property above.

When G has topologically finitely generated centre Z, define essentially admissible representation by a compact-type locally analytic representation V, an extension of the central action to a separately continuous O(Ẑ)-action, and a coadmissible strong dual over O(Ẑ)⊗̂_E D_la(H,E). Record the agreement of the two actions of D_la(Z∩H,E), and the contragredient convention on the dual. Prove essentially admissible independent h, admissible implies essentially admissible, and essentially admissible abelian. For an abelian G=Z, prove abelian coherent duality, the contravariant equivalence with coherent sheaves on Ẑ. The tensor algebra's Fréchet–Stein structure uses the good integral models for the character-space exhaustion, not a claim about arbitrary completed tensor products. Sources: Emerton-analytic Proposition 5.3.22, pp.109–110, Proposition 6.4.7 and Definition 6.4.9, pp.127–129, and Proposition 6.4.10 and the abelian example following it, pp.129–130.

**Checks.**

- For full locally analytic character space of the trivial group the representative is a point. For Z=ℤ it is G_m, with every nonzero E-valued image of 1 allowed, not just unit-valued images.
- For the local multiplicative character adapter with K=ℚ₅, take δ(5)=3 and δ(2)=2, with the unit restriction δ(u)=u. Changing uniformizer to 10 gives δ(10)=6 on both carriers; retaining 3 would violate universal evaluation. Inversion gives δ⁻¹(10)=1/6 and δ⁻¹(5)=1/3.
- Two characters with the same unit restriction and uniformizer values 3 and 4 remain distinct under the adapter, including after finite coefficient extension. Zero is excluded as a uniformizer value.
- For the product adapter on (ℚ₅ˣ)², the unramified coordinates (3,4) invert to (1/3,1/4); swapping the factors changes evaluation at (5,1) from 3 to 4. At n=0 the product is a point and its universal character is 1.
- For a split torus T(K)≃(K^×)^n, full locally analytic character space retains n unramified coordinates. If characters are locally ℚₚ-analytic, its dimension is n([K:ℚₚ]+1), whereas a locally K-analytic character space has a different compact-disc dimension. The choice of analytic field must be stated.
- For essentially admissible representation, an admissible locally analytic representation qualifies, but the converse need not hold for noncompact centre. With G=ℤ, coherent O(G_m) corresponds to an essential representation and is not a finite-length punctual sheaf.
- For G=ℤ, a length-one skyscraper at an E-valued χ corresponds to its character line, with the support label transported through the fixed contragredient inversion. Support at χ alone permits multiplicities and generalized eigenvectors: E[T,T⁻¹]/(T−χ(1))² is the nonsplit negative control. Support at two distinct characters retains both.
- For compact abelian G, essentially admissible representation recovers coadmissible distribution modules and coherent sheaves on its character space. An unrelated second central action on the tensor algebra is excluded by the agreement condition.

Let Z⁺⊂Z contain a compact open subgroup and generate Z, and let V be a compact-type continuous Z⁺-representation. Define the finite-slope part of V for Z⁺ as the continuous Z⁺-equivariant linear maps O(Ẑ)→V, with the bounded-convergence topology; Z acts on O(Ẑ) through its universal character. Prove evaluation for finite-slope part, its universal property for locally analytic Z-representations with a Z-stable Banach-subspace exhaustion, left exact for finite-slope part, and character eigenspace for finite-slope part: evaluation at 1 identifies its χ-eigenspace with V^χ. This construction is not the union of arbitrary slope projectors on a Banach space. Sources: Emerton-Jacquet Definition 3.2.1 and Propositions 3.2.4, 3.2.6 and 3.2.12, pp.796–799.

For G reductive, P=MN, choose the compact open N₀ and positive semigroup M⁺ from a good compact subgroup in the source. Its centre Z_M⁺ contracts N₀ and generates Z_M. Define the normalized positive Jacquet operator of m on V^N₀ for m∈M⁺ by

```text
  v ↦ [N₀:mN₀m⁻¹]⁻¹ ∑_(n∈N₀/mN₀m⁻¹) n m v.
```

The displayed quotient denotes coset representatives, not a quotient group if the subgroup is not normal. Prove independence of representatives, the semigroup action law and compatibility with shrinking N₀. Define the locally analytic Jacquet module of V for P as the Z_M⁺ finite-slope part of V^N₀, and prove the locally analytic M-action, independence of N₀, left exactness and essential admissibility of the Jacquet module for essentially admissible V. The construction is for any parabolic, including P=G and anisotropic groups. Prove Jacquet smooth comparison with V_N for admissible smooth V, and Jacquet locally algebraic comparison: J_P(X⊗_B W)≃X_N⊗_B W^N, with W a finite algebraic representation and B=End_G(W), under the source's smooth admissibility hypotheses on X. Sources: Emerton-Jacquet Definitions 3.4.1–3.4.5 and Proposition 3.4.6, pp.806–807; Theorem 4.2.32, p.828; Propositions 4.3.4 and 4.3.6, p.834. On general locally analytic V this is left exact, not an asserted exact unipotent-coinvariant functor. When P is a Borel of a split group, M=T and the preceding abelian duality gives a coherent character-space sheaf. Label its character δ by pulling the contragredient dual's support through character inversion, so its δ-fibre is dual to the δ-eigenspace of J_B(V); an unmentioned inversion would relabel arithmetic points.

**Checks.**

- For finite-slope part of a one-dimensional representation on which a generator of ℤ≥0 acts by a nonzero a, the result is the same character line, even when ℤ≥0 is a proper submonoid of ℤ.
- If the generator acts by zero on E, finite-slope part is zero. If it acts as diag(0,2) on E², the result is the second line; retaining the zero-eigenvalue direction fails this finite-dimensional Fitting test.
- For finite-slope part at Z={1}, the result is V. In general its χ-eigenspace has the same dimension as V^χ, so a nonzero χ-eigenvector survives every compatible radius convention.
- The normalized positive Jacquet operator of the identity is the identity. On a trivial representation every term equals v and the normalized operator is v; an unnormalized sum would multiply by the index.
- For normalized positive Jacquet operator on GL₂ over K with N₀ upper unipotent O_K and m=diag(ϖ,1), the index is |O_K/ϖ|. On constants the operator is still 1, including when p=2.
- For normalized positive Jacquet operator, replacing a coset representative by n h, h∈mN₀m⁻¹, fixes its term on V^N₀. An arbitrary vector outside V^N₀ need not have this independence. The inverse index exists over E but need not in O_E.
- For locally analytic Jacquet module at P=G, N={1} and the admitted Z_M-action gives back V for essentially admissible V. For a torus this retains the entire noncompact character, including uniformizers.
- For a smooth admissible representation, locally analytic Jacquet module agrees with unipotent coinvariants. For a finite algebraic W it instead gives W^N; for the standard GL₂ representation with upper N, this is its first-coordinate highest-weight line, whereas W_N is its last-coordinate quotient. Their T-characters are different.
- The locally analytic Jacquet module takes zero to zero and a closed equivariant injection to an injection. Applying unipotent coinvariants to every analytic representation as its definition would not justify this left exactness or the preceding algebraic-weight test.

*Needs:* PadicLocalLanglandsForGL2Qp §0.1; CompletedCohomologyPartII F.1 and F.4; PhiGammaModulesAndIwasawaCohomology §4.0 through LocallyAnalyticDistributions §3.3; the noncompact character construction and finite-slope construction in this subsection in that order.

### 0.7 Definite unitary completed coefficients and Jacquet geometry

Let F/F⁺ be CM and G/F⁺ be definite at infinity and split as GL_n over F, with n≥2. Suppose every place above p splits in F, choose one varying place wp, and put K=F⁺_wp. Over a sufficiently large coefficient field E, fix algebraic/inertial coefficients ξ⊗τ at the other p-places with a stable O_E-lattice. Choose small U^wp, maximal compact level at the other p-places, hyperspecial level at inert finite places, and unramified split tame level at the places defining the Hecke algebra. Define completed unitary coefficient space from the actual automorphic functions

```text
S(U_wp U^wp, ξ⊗τ, O_E/ϖ^k):
  f : G(F⁺)\G(A_F⁺^∞) → (ξ⊗τ)_(O_E/ϖ^k),     f(gu)=u⁻¹f(g),
Π = (lim_k colim_U_wp S(U_wp U^wp, ξ⊗τ, O_E/ϖ^k)) ⊗_(O_E) E.
```

Its API the local action on the completed unitary coefficient space, tame Hecke action, the integral lattice and local regularity preserves the GL_n(K)-action and the other p-place coefficients. For a sufficiently small compact open H at wp, prove Π|_H≃C(H,E)^s with s≥1 under the nonempty small-level hypotheses of this arithmetic construction. Prove the integral version first: sufficiently small tame level kills finite stabilizers, the definite double quotient is a finite disjoint union of free H-orbits, and the fixed coefficients at the other p-places give the finite free multiplicity module. This is the general-rank specialization of the completed-function methods. Sources: Ding §4.2.2, pp.66–67, before Proposition 4.14; Breuil–Ding Lemma 6.1 and its proof, arXiv v2 pp.81–82, which treats general n despite the paper's rank-three main application.

The basic theory of these definitions has the following interfaces.

- For the completed unitary coefficient space, retain the integral lattice, commuting local and tame-Hecke actions, and the general-rank local regular model with its positive finite multiplicity.
- For the unitary Jacquet sheaf, prove coherence on the full torus character space, the tame-Hecke action and the character-fibre identification with the fixed dual inversion convention.
- For the relative Hecke spectrum, prove the Jacquet eigenspace point criterion and compatibility with its coherent coefficient module. For classical refined points, retain the algebraic vector, smooth refinement, and the global-twist or fixed-space intertwiner hypothesis.
- For this arithmetic spectrum, establish the linked analytic stages, projective slope charts, the global component-image application, local noncritical classical accumulation near algebraic weights and classical Hecke semisimplicity specified above, then prove equidimensionality, Cohen–Macaulay coefficients and reducedness.

**Checks.**

- Trivial coefficients at the other p-places recover scalar completed functions. Nontrivial coefficients there survive the limit and are not absorbed into the varying local-group action.
- The order is lim_k colim_U_wp before inverting ϖ. Reversing it can omit continuous functions not fixed at any single finite level, as in §7.1.
- The local model has s≥1; the zero representation is not an example of the nonempty arithmetic construction. Rank n=2 is allowed; a rank-three-only specialization does not suffice.

Construct unitary Jacquet coefficient sheaf from the actual locally ℚₚ-analytic vectors of Π: take N₀-invariants, then finite slope for the normalized positive-torus Hecke action, and form the locally analytic Jacquet module. The average includes the inverse of the finite index over E; no integral averaging at a p-power index is used. Its strong dual gives a coherent sheaf on the product of the supplied local multiplicative character spaces for T(K), identified by §0.6's universal-character-preserving product adapter, including the unramified (G_m)^n-coordinates. Prove coherence of the unitary Jacquet coefficient sheaf, its tame-Hecke action and character-fibre identification. Apply §0.6 with L=ℚₚ to the restriction-of-scalars group, using admissibility from local regularity and the Borel Jacquet theorem. Label the coherent dual by the character-inversion convention fixed there. This does not identify completed functions with their Jacquet module. Source: Ding §4.2.2, p.66, and the proof of Proposition 4.14, p.67. The general analytic-vector, finite-slope, Jacquet and coherent-duality arguments are those of §0.6; the arithmetic coefficient realization and its Hecke action are the additional targets here.

Define unitary coefficient eigenvariety as the relative tame-Hecke spectral algebra acting on this coherent sheaf, using the supplied spectral construction. Prove the Jacquet eigenspace point criterion: (δ,ω) occurs precisely when Hom_T(δ,J_B(Π_(ℚₚ-an)[m_ω]))≠0, with Hecke eigenspaces interpreted as in that construction. Define classical refined unitary point by using the locally algebraic vectors inside the same Π and retaining the refinement character. Prove the eigenvector criterion for classical refined unitary points, locally algebraic weights and global unramified twists by identifying the locally algebraic vectors with the finite-level algebraic automorphic functions in the displayed construction. The twisting theorem requires an actual global automorphic twist with its resulting tame level and other-place coefficients specified, or a proved intertwiner into the fixed Π. A local unramified character calculation alone makes no closure assertion for this eigenvariety. Prove the unitary dimension theorem, the Cohen–Macaulay theorem for the unitary Jacquet sheaf, and the unitary reducedness theorem: for this arithmetic eigenvariety, the dimension is n[K:ℚₚ], it is equidimensional, its coefficient sheaf is Cohen–Macaulay, and it is reduced. Source: Ding Proposition 4.14 and its proof, p.67, with the construction on p.66. Establish the following arithmetic inputs to the supplied spectral and commutative-algebra arguments.

- The Jacquet Fredholm normalization: choose an Iwahori-factorized uniform H and a strictly positive central torus element z contracting N₀. Local regularity gives the analytic stages used by Breuil–Hellmann–Schraen, *Une interprétation modulaire*, Proposition 5.3, pp.46–48: property-(Pr) modules V_h over an exhausting family of compact-weight affinoids, completely continuous operators, and continuous maps α_h,β_h whose two composites are the operators at adjacent stages. Their displayed Hecke action is the unnormalized sum. If c_z=[N₀:zN₀z⁻¹], its operator is c_z times §0.6's normalized operator. Transport the Fredholm eigenvalue coordinate by λ↦c_zλ, and more generally transport the positive-semigroup character by its multiplicative index character before comparing point labels. This is an invertible rational rescaling; it preserves support dimension and finite-projective slope modules. It is not an integral unit rescaling at p-power index.
- The finite projective Jacquet charts: on a slope-adapted affinoid cover, the coefficient module M_i is finite projective over a regular compact-weight algebra A_i, and the faithful Hecke image B_i⊂End_(A_i)(M_i) is finite over A_i. Each nonempty irreducible component maps finitely and surjectively onto an open compact-weight affinoid. Obtain this for the actual Π from the preceding factorization, using the supplied Fredholm machine; the local argument is Breuil–Hellmann–Schraen, *Une interprétation modulaire*, Lemma 3.10, Proposition 3.11 and Corollary 3.12, pp.24–27. The compact-weight dimension is n[K:ℚₚ]. No deformation or patching variables from that paper enter the present arithmetic space. These finite-projective charts give equidimensionality and no embedded components of B_i; the finite-module depth argument gives the Cohen–Macaulay property of M_i over B_i, as in *Smoothness and classicality*, Lemma 3.8, p.22.
- The global component-image application: for the actual linked Jacquet Fredholm construction, verify the hypotheses of PadicFamilies §2a.14. After a finite coefficient extension splitting the finite unit-character components, identify the compact locally ℚₚ-analytic weight space W with a finite union of open polydiscs of dimension n[K:ℚₚ], and verify a relatively factorial affinoid cover by the weight-coordinate polydiscs. Check that the linked Fredholm series glue on this cover and that the finite faithful Hecke charts describe this arithmetic spectrum and its map to the global spectral variety. Apply the supplied prime-Fredholm component theorem: every global eigenvariety component maps finitely and surjectively onto a global spectral component, whose image is a nonempty Zariski open in a component of W. Dominant algebraic weights, retaining the finite torsion character, are Zariski dense in each such component; hence every global component has a point over an algebraic weight. This application is distinct from the preceding local finite-surjectivity statement. Source: *Une interprétation modulaire*, Corollary 3.13 and proof, p.27, and the concluding paragraph of Theorem 3.19, p.33; the generic component theorem remains in PadicFamilies §2a.14.
- The componentwise accumulation of classical points: start on each component at a point over an algebraic weight, and take an irreducible adapted neighbourhood mapping finitely and surjectively to an irreducible compact-weight affinoid containing that weight. For β_i(a)=diag(a,…,a,1,…,1) with i copies of a and a uniformizer ϖ_K, bound |v_K((δδ_B⁻¹)(β_i(ϖ_K)))| by C on this neighbourhood, for 1≤i≤n, with v_K(ϖ_K)=1 and §0.6's index-character normalization transported to the source coordinates. For a bound C≥0 chosen after the neighbourhood and before the weights, establish the explicit sufficient dominance cone of *Une interprétation modulaire*, (3.11): writing d_(τ,i)=k_(τ,i)−k_(τ,i+1), require d_(τ,1)>2(C+1) and d_(τ,i)>d_(τ,i−1)+(C+1) for 2≤i<n, at each embedding τ. Prove bounded-slope classicality, regularity and noncriticality there by the root-operator slope shifts, carrying ξ⊗τ at the other p-places. These algebraic weights accumulate at every algebraic weight in the fixed torsion component; their intersection with an irreducible neighbourhood of such a weight is Zariski dense. Finite surjectivity transfers this local density to each component neighbourhood, and the identity principle on the global irreducible component gives componentwise Zariski density. No accumulation assertion is made for an arbitrary affinoid containing no algebraic weight. Source: Theorem 3.19 and proof, pp.31–33, especially (3.10)–(3.11) and its last paragraph.
- The classical Hecke semisimplicity: on those noncritical classical slope pieces, identify the Hecke action with its classical automorphic realization and prove the required semisimplicity over a sufficiently large characteristic-zero coefficient field. Together with the faithful finite-projective model, this kills a nilpotent Hecke endomorphism on a Zariski-dense family of fibres, and hence on the whole model. Use the no-embedded-component conclusion to pass from generic reducedness on each component to reducedness. Sources: *Une interprétation modulaire*, Corollary 3.20 and its proof, pp.33–34; Chenevier's arXiv version, Proposition 6.4 and Lemma 6.5, pp.20–21, for the reducedness criterion. The latter is numbered Proposition 3.9 in the published version cited by Ding. Semisimplicity, noncritical classicality and componentwise accumulation are arithmetic proof targets here; coherence alone supplies none of them.

**Checks of the arithmetic inputs.**

- For GL₂(ℚ₂), z=diag(2,1) has c_z=2. On a trivial coefficient the normalized operator is 1 and the unnormalized sum is 2. A nonzero eigenvalue a becomes 2a; omitting this change corrupts the refinement label. The scalar is invertible over E and is not a unit of O_E.
- A finite projective M_i of positive rank over a regular A_i has the required weight dimension. Rank zero has empty support. A coherent module A_i/(f) for nonzero f is a counterexample to inferring the same dimension from coherence alone.
- For odd p and unramified quadratic E/ℚₚ, choose α∈O_E with residue outside 𝔽ₚ. In the exponent coordinate s of κ_s((1+p)^z)=exp(sz log(1+p)), the affinoid |s−α|≤|p| has no algebraic exponent k∈ℤ: |k−α|=1>|p| for every k. Its identity map is finite and surjective. This chart cannot replace the global component-image step.
- Near an integral exponent k₀ at p=5 with fixed torsion character, k=k₀+4·5^r M tends to k₀ for fixed integer M as r tends to infinity, while positive choices of M give arbitrarily large exponents inside each congruence ball. For n=3, C=2, gaps (8,12) satisfy 8>6 and 12>8+3; gaps (8,9) fail the second inequality. Choosing such gaps with prescribed p-adic congruences in each coordinate gives the local accumulation cone.
- A nonempty Zariski open in a whole weight component meets the dense algebraic-weight set even though the preceding residue disc does not. A classical point on one eigenvariety component gives no density or reducedness on another; the global component-image application is made for every component.
- The algebra A_i[ε]/(ε²) acting faithfully on its regular module has the same underlying character set as A_i but a nonzero nilpotent. Its fibres are not semisimple, so it fails the arithmetic semisimplicity input. Removing embedded components is also essential to a generic-reducedness argument.

**Checks.**

- The unitary Jacquet coefficient sheaf remembers a character's value on a uniformizer. Characters equal on O_K^× but different there give different weights.
- The unitary coefficient eigenvariety omits an eigensystem with zero Jacquet eigenspace; changing the tame eigenvalue changes the point even at fixed δ. Its point set is not just a compact weight space.
- The classical refined unitary point requires locally algebraic vectors and a refinement. A locally analytic nonalgebraic vector does not suffice; a local smooth unramified twist changes refinement without changing algebraic exponents, but gives another arithmetic point only under the stated global-twist or intertwiner hypothesis.
- At n=2,K=ℚₚ the dimension is two, and for [K:ℚₚ]=2 it is four. Coherence alone does not make a nonreduced spectral algebra reduced. The zero representation lacks the positive local multiplicity used in these conclusions.

**Further coefficient checks.**

- The locally analytic Jacquet module for a torus has no unipotent invariant operation but still retains the full locally analytic character, including uniformizers. For a trivial N₀ action the invariant step preserves the space; the finite-slope step still removes vectors outside its defining finite-slope universal property.
- The unitary Jacquet coefficient sheaf is formed from Π's locally analytic vectors, not from all continuous functions. A continuous vector outside those vectors cannot define a Jacquet eigenvector by decree.
- At n=2,K=ℚₚ, unitary coefficient eigenvariety has dimension two. Passing to [K:ℚₚ]=2 gives four, while adding the dimension of the full noncompact torus character space as an extra term would give the wrong result.
- The unitary coefficient eigenvariety retains generalized Hecke spectral support and its coherent module; a nonreduced abstract Hecke quotient is not reduced merely because its set of characters is unchanged.
- For classical refined unitary point, an algebraic vector tensored with a smooth refined vector has the stated locally algebraic weight and refinement. The zero vector supplies no eigensystem, even though it is locally algebraic.
- An actual global unramified smooth twist of a classical refined unitary point changes the character on a uniformizer while retaining its algebraic exponents, in the arithmetic space with the resulting level and coefficients. At fixed weight and fixed finite level there are only finitely many classical refinements, whereas local unramified twists vary through Eˣ; those twists cannot all belong to the fixed classical space. A locally analytic weight with a nonintegral infinitesimal exponent is not classical by the definition.

*Needs:* §0.6; the displayed finite-level automorphic function spaces and their completed integral lattice; CompletedCohomologyPartII Layers 1–3 for completion and actions; PadicFamilies §§2a.1–2a.14 and 2a.17 for slope charts, coherent Hecke spectra and the global component-image theorem under its relatively factorial cover hypothesis; the local regularity, weight-cover verification, quantitative classicality and semisimplicity targets in this subsection.

### Examples

For F=ℚ, the pair w=x^a,t=x^v gives geometric exponent 2a−v. For a split quadratic field there are exponents 2a₁−v,2a₂−v and the norm is the product of the two coordinates. The determinant definition works at ramified primes before generic splitting. In higher rank, opposite-unipotent variables explain why analytic induction is usually infinite dimensional despite its finite-dimensional algebraic subrepresentation. The unitary application starts from completed functions; the Siegel application starts from an analytic induction on a period-domain reduction.

### Dependencies

Tensor, determinant, continuous-character, representation and matrix APIs; analytic charts and Banach-family tools; completed limits and actions. The unitary arithmetic geometry also needs the local regularity, Jacquet specialization and density targets in §0.7, using the general foundations of §0.6. Hilbert canonical subgroups are not prerequisites for these representation constructions.


## Layer 1: automorphy and effective coefficient descent

### 1.1 Right cocycles, inversion and change of frame

Define the inverted left cocycle J_γ(x)=K_(γ⁻¹)(x)⁻¹ on group-valued functions; the right cocycle law after inversion below gives its cocycle law when K is a left cocycle.

For a right Γ-action on X and a possibly noncommutative coefficient group C, define right automorphy cocycle by a unit-valued function with

```text
J_(γδ)(x) = J_γ(x) J_δ(xγ),       J_1(x)=1,
f(xγ) = ρ(J_γ(x)⁻¹) f(x).
```

Its API comprises the identity law, the inverse law, the right cocycle law after inversion and change of frame. For a left action with K_(γδ)(x)=K_γ(δx)K_δ(x), put xγ=γ⁻¹x and J_γ(x)=K_(γ⁻¹)(x)⁻¹. For a frame change b:X→C put J′_γ=b(x)⁻¹J_γb(xγ) and f′=ρ(b⁻¹)f. Inversion and product order both matter. This translates BHW Definition 6.5, p.1758, and BP §6.3.1, p.154, into one descent convention; algebraic associated bundles are supplied by AutomorphicBundles B0.

The basic theory of these definitions has the following interfaces.

- For a right automorphy cocycle, prove the identity and inverse laws in the specified product order; for a left cocycle prove that inversion of both the action and factor gives this right cocycle.
- For change of frame by b, prove that J′ is a cocycle and that f↦ρ(b⁻¹)f intertwines the two equivariance conditions.
- For two changes of frame, identify their composite with the corresponding product gauge; the identity gauge fixes both the factor and coefficient.

**Checks.**

- For inverted left cocycle of the identity left cocycle K_γ=γ on a trivial action, J_γ=γ; the scalar 2 gives 2, while omitting coefficient inversion gives 1/2. For the trivial group there is only the identity factor, and all coefficient functions are allowed. For a trivial action a constant group homomorphism Γ→C is a cocycle; an arbitrary nonmultiplicative function is not.
- For inverted left cocycle of that identity left cocycle, take A=[1,1;0,1], B=[1,0;1,1]. Then J_(AB)=AB=[2,1;1,1], different from BA=[1,1;1,2]. The inverse two-step factor is B⁻¹A⁻¹=[1,−1;−1,2], whereas A⁻¹B⁻¹=[2,−1;−1,1]. This detects a reversed noncommutative cocycle or omitted coefficient inversion.
- For inverted left cocycle of the trivial left cocycle, J=1 at every argument; a nontrivial arbitrary function is not asserted to satisfy a cocycle law. A constant frame change conjugates the factor and multiplies vectors by ρ(b⁻¹). For a line and b=2 over ℚ₅, this halves the coordinate; the inverse frame change recovers it.

*Needs:* §0.4 representations; group actions and inversion; AutomorphicBundles B0 for the associated-bundle convention.

### 1.2 Analytic coefficient equalizers and functoriality

Define analytic coefficient equalizer q ρ J on a specified analytic, pro-étale, pro-Kummer-étale or diamond v-site as the equalizer of the actual two pullbacks on q_*F_V. Here F_V is the supplied completed coefficient-function sheaf on the actual torsor q:Y→X. Record the site, completion convention and, integrally, the geometric O_Y⁺-lattice. The API is the section criterion for analytic coefficient equalizer, restriction, intertwiner functoriality, change of frame and pullback functoriality. This specializes the supplied invariant-module-subsheaf construction to the analytic coefficient action. Prove the site comparison of coefficient functions for the actual Siegel and toroidal coefficient torsors: compare the completed coefficient functions, chart restrictions and Gauss lattices on their analytic, pro-Kummer-étale and v-sites. For finite coefficients reduce this comparison to the supplied finite locally free site equivalences; for infinite analytic coefficients use the actual normalized chart module and its proved Banach descent setting. Product-affinoid scalar formulas alone give no general Banach comparison. Sources: BHW Proposition 6.6, pp.1758–1759; Heuer Corollary 1.5, p.3, and Proposition 3.8, p.15, for the line applications.

For finite coefficients with effective finite locally free descent, prove rank preservation under coefficient descent, tensor compatibility of effective descent and dual compatibility of effective descent. Intertwiners, gauges and restrictions give maps of equalizers without an effectivity assertion; tensor and dual isomorphisms use finite locally free effectivity. For analytic induction, construct the associated Banach sheaf only in the locally trivial analytic-torsor setting or with a specifically established Banach-descent theorem. No automatic coherence or exactness is claimed. A coarse quotient requires trivial stabilizer actions on coefficient fibres; otherwise use the quotient stack. Integral finite-group descent is effective descent, not averaging unless its order is a unit. Needs: Layer 0 and the site-specific supplier contracts.

The basic theory of these definitions has the following interfaces.

- For the analytic coefficient equalizer, prove the section criterion on the specified site and compatibility with restrictions, coefficient intertwiners, gauge change and compatible torsor pullback.
- For finite effective coefficient descent, preserve rank and identify descended tensor products and duals with the corresponding operations downstairs.
- For normalized analytic chart coefficients, compare coefficient functions, restrictions and Gauss lattices between the specified sites under their actual finite or Banach effectivity hypotheses.

**Checks.**

- The identity torsor gives the supplied coefficient sheaf. A trivial rank-r representation on a genuine torsor gives O_X^r after function descent; rank zero gives zero.
- On a trivial torsor, evaluation at the identity section recovers the coefficient. A nontrivial character changes the value at a second torsor point by its inverse, so it is not invariant scalar descent.
- A stabilizer acting by −1 on a line in characteristic zero obstructs unrestricted line descent to the coarse point; a trivial stabilizer action does not. At residue characteristic 2, averaging over a group of order 2 is unavailable.
- A rational finite-group splitting does not prove that its integral equalizer commutes with nonflat base change. Similarly, an infinite-rank coefficient has no finite-coherence conclusion merely from its equalizer definition.

*Needs:* §1.1; §§0.4–0.5; PerfectoidTowers P9.11–P9.13; AdicSpacesPartIV R5.7; AlgebraicVectorBundles L0B–L0C for tensor and dual operations; PerfectoidTowers P9.13 for finite locally free effectivity; the actual normalized coefficient chart and Banach effectivity setting for infinite coefficients.

### 1.3 Analytic effectivity of line coefficients

Prove analyticity from a dense open: on a smooth rigid X, a v-line bundle analytic on a Zariski-dense analytic open is analytic on X. This is Heuer Corollary 1.5, p.3, applied to the coefficient line already constructed on the v-site. An infinite-level perfectoid base is not a smooth rigid base: its line is obtained by pullback and the tower equalizer.

Prove formal unit-cocycle effectivity: let 𝔛 be a formal scheme topologically of finite type over O_K, for a complete perfectoid extension K/ℚₚ, and let 𝔛∞→𝔛 be an inverse system of finite étale Galois torsors with profinite group Γ. For a continuous line cocycle in units of the completed formal structural ring, assume its reduction modulo every p^m factors through a finite quotient and gives compatible effective formal lines. The resulting analytic generic-fibre line is the equalizer line. Source: Heuer Definition 3.7 and Proposition 3.8, p.15. Formal units, the finite-type formal base and effective finite-quotient reductions are required; an arbitrary bounded geometric cocycle does not supply these hypotheses.

*Needs:* §1.2; a smooth rigid base for the dense-open criterion; the finite-type formal base, finite étale torsors and effective formal-unit reductions for formal effectivity.

### Examples

A scalar character can hide a wrong product order. The two unipotent matrices in §1.1 distinguish it before taking determinants. Rational triviality also hides integral information: ℤₚ and pℤₚ both rationalize to ℚₚ, while their inclusions and unit balls differ.

### Dependencies

Layer 0, associated-bundle and finite locally free descent contracts, completed functions on the specified sites, and the two line-effectivity theorems. General Banach effectivity does not follow from finite-rank descent.

## Layer 2: geometric Hilbert coefficient sheaves

### 2.1 Admitted coefficient domains

Define the admitted Hilbert coefficient domain for (κ,n,ε) as the supplied anticanonical domain together with the period-coordinate and weight-extension data required to evaluate κ(cz+d). Choose an actual analytic extension of κ on B_r(Oₚ^×:1) and m≥1 with p^(−m)≤r<1. For the established geometric-position estimate use

```text
0 ≤ ε < 1/(2p^m)       if p≥5,
0 ≤ ε < 1/(3p^m)       if p=3,
0 ≤ ε ≤ 1/(4·2^m)      if p=2.
```

Intersect this range with the canonical-subgroup and coefficient admissibility ranges. The period and canonical generators are supplied by HodgeTateAndCanonicalSubgroups §§4.6–4.8; the strict inequalities for odd p are part of that contract. Define restriction for Hilbert domain, level forgetting and Atkin–Lehner transport. At finite level n≥1 the latter is AL_n:X_(Γ₀*(p^n))(p^nε)_a→X(ε), with p^nε<1/2 and every canonical quotient used in the map admitted. The same symbol ε on both sides without scaling would describe a different map. At n=0 define the coefficient on X(ε) by AL₁ from X_(Γ₀*(p))(pε)_a. Infinite level uses the structural tower maps. Sources: BHW §5.3, Definitions 5.17 and 6.4, pp.1751–1752,1757–1758; HodgeTateAndCanonicalSubgroups §§4.6–4.8.

Name the closed endpoint period extension for the additional closed-endpoint assertion at ε=1/(c_pp^m), p≥3, c_p=2 or 3. It requires the boundary period estimate beyond the supplied strict-range theorem. Apply the supplied unsplit O_F/pⁿ-linear canonical generator, `ramifiedPeriod_comparison` and `canonicalKernel_congruence` before evaluating the coefficient character; an embeddingwise integral product decomposition cannot replace these inputs. Source for the endpoint: BHW Proposition 5.18 and its proof, pp.1751–1753.

The basic theory of these definitions has the following interfaces.

- For admitted Hilbert domains, restriction and level forgetting preserve all character, canonical-subgroup and period bounds on their common domain.
- For Atkin–Lehner transport, identify the source radius as pⁿε and retain pⁿε<1/2 and every intermediate quotient hypothesis; at n=0 use the specified AL₁ construction.
- For the closed odd-prime endpoint extension, prove the additional boundary period bound before evaluating the character, using the supplied unsplit generator and scalar congruence.

**Checks.**

- For admitted Hilbert coefficient domain, ε=0 is the ordinary domain and satisfies the displayed estimates; the overconvergent colimit later excludes this radius as an index.
- At p=3,m=1, ε=1/12 satisfies the strict bound, ε=1/9 is the endpoint-extension target, and ε=1/3 lies outside both the established and requested closed bounds. At p=2,m=1 the included endpoint is 1/8.
- At n=1,p=5, target ε=1/100 corresponds to source radius 1/20. At n=0 the same AL₁ scaling is still used. Full GL₂(ℤₚ) does not stabilize an anticanonical branch: its Weyl element sends z=0 to infinity.

*Needs:* §0.3; HodgeTateAndCanonicalSubgroups §§3.12 and 4.6–4.8; PerfectoidShimuraVarieties §§5.4–5.10; the boundary period estimate in this subsection for the closed odd-prime endpoint.

### 2.2 The Hilbert factor and rational coefficient line

On the infinite cover of an admitted domain define the Hilbert denominator j_γ(x)=cz(x)+d for γ=(a,b;c,d) in the appropriate Γ₀(p)-group. Prove invertibility of the Hilbert denominator, analyticity of the Hilbert denominator and its left cocycle identity, namely j_(γδ)(x)=j_γ(δx)j_δ(x). The period-coordinate estimate places this factor in the chosen analytic character neighborhood, rather than merely in an abstract fraction field. Define the inverse character factor κ(j_γ(x))⁻¹. It acts by inverse multiplication on the coefficient function. Apply the conversion of §1.1 if right descent is used. Sources: BHW Definition 6.5 and Proposition 6.6, pp.1758–1759; the period transformation itself is supplied by HodgeTateAndCanonicalSubgroups §§4.6–4.8.

The basic theory of these definitions has the following interfaces.

- For the Hilbert denominator, prove analytic unit-valuedness on the admitted domain and the left cocycle identity with its actual transformed coordinate.
- For the inverse character factor, prove the corresponding automorphy multiplier law and its conversion to the right-action convention of §1.1.
- For the geometric Hilbert coefficient, prove the section criterion, finite-level rational rank-one effectivity, and level/radius pullbacks with identity and composition. Infinite-level effectivity is its tower pullback, and level zero uses AL₁.

**Checks.**

- For Hilbert denominator, an upper-unipotent matrix has j=1. For diag(a,d), j=d; diag(a,1) has factor 1, even though its determinant may be a≠1.
- At z=0 a lower-unipotent matrix (1,0;c,1) has j=1, but its first-order dependence on z is c. Replacing j by a determinant loses this dependence.
- For inverse character factor with F=ℚ,p=5,κ(x)=x and γ=diag(1,2), the value is 1/2. With κ=1 it is 1. Two diagonal lower entries 2,3 give coefficient factor 1/6, not 6.
- A matrix outside the admitted subgroup can have denominator zero at a point of the chart. Its character value is not defined by declaring zero a unit; the unit theorem has a domain hypothesis.

Define the geometric Hilbert coefficient line at (κ,n,ε) independently as the O-valued automorphy equalizer on the small geometric infinite cover over the level-n domain. Its APIs are the section criterion for geometric Hilbert coefficient line, local freeness of rank one, level pullback, radius pullback, and their identity/composition laws. At finite n prove rational invertibility by the supplied dense-open line-effectivity criterion on the smooth rigid weight product, using the ordinary differential trivialization. At infinite n identify the equalizer with the pullback of the finite-level line by sheafwise tower descent; do not apply the smooth-rigid criterion to a perfectoid base. Treat n=0 by the preceding AL₁ transport. Sources: BHW Definition 6.5, Proposition 6.6 and Remark 6.7, pp.1758–1759; Heuer Corollary 1.5, p.3.

**Checks.**

- The literal trivial character κ=1 gives O on its own finite-level base; this checks the structural-function descent input.
- An algebraic κ(x)=∏_σ σ(x)^kσ gives the corresponding tensor of Hodge differential lines; the parallel norm character Nₚ^k gives (det ω)^k. It is not the trivial character when k≠0.
- Radius restrictions compose, and forgetting from level n+2 to n factors through n+1. The n=0 map includes AL transport, so it is not an unscaled forgetful map from an anticanonical branch.

**Further factor checks.**

- The inverse character factor for the trivial character is identically 1. For κ=x and lower diagonal entries 2 and 3 over ℚ₅, the factors are 1/2 and 1/3, giving 1/6 under composition.
- For κ=x⁻¹, inverse character factor at denominator 2 is 2, detecting the dual convention. If a denominator is zero outside the admitted domain, no character value is assigned to it.

*Needs:* §§1.1–1.3 and 2.1; the supplied Hilbert period transformation; PerfectoidTowers P9.11 for function descent.

### 2.3 Algebraic specialization

Prove Hilbert algebraic specialization: after generic splitting, the line of algebraic geometric weight κ=∏σ σ^kσ is canonically the analytification of ⊗σ ωσ^kσ on the admitted domain. Negative integers use dual lines. The proof compares the actual Hodge–Tate differential frame with the supplied classical frame and its factor j, rather than declaring the two lines equal because both have rank one. Retain any finite-order nebentype when κ is locally algebraic. Sources: BHW Remark 6.7, p.1758; AIP-adic §4.1 and Proposition 4.3, pp.15–16; AutomorphicBundles B4 supplies the classical line. In the notation ω^1, distinguish the literal character 1 from parallel weight one, which is the norm character.

*Needs:* §2.2; HodgeTateAndCanonicalSubgroups §§5.8 and 5.10–5.12 for the actual differential frame; AutomorphicBundles B4 for the classical line; generic splitting of §0.1.

### Examples

For F=ℚ and κ=x^k, a frame with denominator 2 changes the coefficient by 2^(−k). Multiplying by the kth tensor of the frame cancels the factor. With k=−1 the coefficient instead changes by 2, exactly the dual-line rule. For d>1 a tuple of distinct exponents cannot be represented by a determinant power; the full split torus character is retained.

### Dependencies

Layers 0–1 and the HodgeTateAndCanonicalSubgroups §§4.6–4.8 domains and estimates. Algebraic specialization also uses HodgeTateAndCanonicalSubgroups Layer 5's Hodge–Tate differential lift and the classical coefficient line. The equality endpoint is an additional target; ramified comparison uses the supplied unsplit generator and scalar kernel congruence.

## Layer 3: integral structures, weights and overconvergence

### 3.1 Geometric integral coefficients and rationalization

Define the geometric integral Hilbert coefficient at (κ,n,ε) by the same automorphy equalizer inside geometric O⁺ on the actual infinite cover times U. Prove injectivity of geometric integral Hilbert coefficient, restriction for geometric integral Hilbert coefficient, and stability under the action when both κ(j) and its inverse are integral at all valued points. Define its rationalization map to the rational line. Prove rationalization of geometric integral Hilbert coefficient: this is an isomorphism of sheaves after inverting p, using a local common denominator on quasi-compact inverse images and the all-open coefficient-function descent theorem. It is a sheaf statement, not a claim that inverting p commutes with global sections over every non-quasi-compact open. Source: BHW Definition 6.5, p.1758, with the integral comparison in Theorem 7.14, pp.1764–1765.

The stronger local freeness of rank one for geometric integral Hilbert coefficient is asserted only with base-local unit eigenfunctions trivializing the relevant full-character torsor descent. Rational invertibility alone does not provide them. Layer 5 specifies the full-character unit-coboundary condition on the analytic open site and the separate formal-to-analytic comparison on the formal Zariski site. This distinction also applies to an infinite-level pullback of an integral lattice.

The basic theory of these definitions has the following interfaces.

- For the geometric integral coefficient, prove its inclusion in the rational coefficient, radius and level restrictions, and action stability under the two-sided power-boundedness hypothesis.
- For rationalization, prove the sheaf isomorphism after inverting p using local common denominators; do not replace it by an unrestricted global-sections identity.
- For integral local freeness, prove the rank-one conclusion on the full-character analytic unit-coboundary opens of §5.3 and retain the separate formal comparison there.

**Checks.**

- For geometric integral Hilbert coefficient, κ=1 gives O⁺ once geometric integral function descent is proved. Over a point the lattice is the valuation ring inside its fraction field.
- ℤₚ and pℤₚ are different integral submodules with the same rationalization. A rational comparison cannot select between them.
- On a disjoint union of affinoids, sections p^(−i) on the ith component are locally rationalized integral sections but need no common global denominator. This disproves an unrestricted global-sections rationalization identity.
- A factor equal to p is a rational unit but its inverse is not power bounded. Such a factor does not preserve the O⁺ equalizer lattice and fails the required two-sided unit condition.

*Needs:* §2.2; §1.2 integral function descent; quasi-compact local common denominators; the unit-coboundary hypothesis for any conditional integral-local-freeness assertion; the full AIP application is constructed in §5.3.

### 3.2 Weight pullback and fixed-radius forms

Define rational weight pullback for a morphism of bounded weight families and the compatible admitted domain, by pullback of the rational coefficient line. Prove its character specialization, identity, composition and compatibility with radius/level pullbacks. For integral coefficients define integral weight pullback under a flat formal coefficient change with compatible completed integral function descent, or on an actual AIP formal chart map satisfying its integral base-change theorem. Prove the integral comparison under those hypotheses. A rational base-change isomorphism does not imply arbitrary integral base change. Source: BHW §6.1–§6.2; AIP-cusp Proposition 3.14 and Remark 3.15, pp.17–18, explicitly separate rational base change from the integral finite-group obstruction.

The basic theory of these definitions has the following interfaces.

- For rational weight pullback, prove specialization to the pulled-back character, identity and composition, and commutation with level and radius maps.
- For integral weight pullback, prove the analogous comparison only under the stated flat formal and completion hypotheses or the actual AIP integral chart theorem.
- For rational and integral fixed-radius form modules, prove sectionwise radius, level and weight maps, integral inclusion, and identity and composition. Arithmetic variants use the independently defined presentations of Layer 4.

**Checks.**

- The rational weight pullback along a point recovers the line for that point's character; along the identity it is the same line; two successive changes agree with their composite.
- At the trivial weight it gives the structure sheaf of the new base. A character and its inverse specialize to different coefficient actions at a denominator 2.
- The integral weight pullback along a flat compatible formal chart preserves a unit frame. Reduction modulo p is not flat over ℤₚ and cannot be substituted into this assertion without a separate integral comparison.

For an actual polarization component c and admitted finite or infinite level, define the fixed-radius Hilbert form module at (κ,n,ε,c) as H⁰ of the specified coefficient sheaf on that domain times U, and integral fixed-radius Hilbert form module using the integral lattice. Define the arithmetic versions only after the independent arithmetic presentations of Layer 4. Their APIs are restrict radius for fixed-radius Hilbert form module, level change, weight pullback and integral inclusion. These are section modules; projective Banach assertions are later cuspidal theorems with substantially stronger hypotheses. Source: BHW Definition 6.8, p.1758, and §9.1, pp.1780–1781.

**Checks.**

- At trivial weight, the geometric section module is H⁰ of O on that domain, not automatically A; the integral one is H⁰ of O⁺.
- The zero section belongs to every weight, while a constant 1 on the cover fails a nontrivial automorphy relation unless its multiplier is trivial.
- Restricting twice in radius gives the same section as direct restriction, and a section killed by an integral inclusion is zero. Infinite wild level is permitted as a section object but has no automatic finite-level Banach theorem.

**Further section and pullback checks.**

- The integral weight pullback along the identity preserves the specified integral frame. Two flat compatible formal changes agree with their composite, including their integral inclusions.
- The integral weight pullback of the trivial weight on a torsor with integral function descent gives the new base's O⁺; multiplying a rational frame by p changes the lattice and cannot be an integral unit trivialization.
- The integral fixed-radius Hilbert form module for the trivial weight on an affinoid is its actual bounded-function ring; a function with norm greater than 1 is a rational section outside this lattice.
- The integral fixed-radius Hilbert form module is closed under admitted radius restriction and contains zero; an equality after rational inclusion is already an equality in the lattice in the torsion-free setting. For a nontrivial character, a nonzero constant on the cover need not be a section.
- The arithmetic fixed-radius versions remember polarization transport: a pure determinant element acts by κ(d)⁻¹w(d), rather than just κ(d)⁻¹. At w=t=x,F=ℚ,d=2 the former is 1 and the latter 1/2.

*Needs:* §§2.2 and 3.1; AdicSpacesPartIV R5.7 for product coefficient functions; the stated formal flatness and completion hypotheses for integral weight maps. The arithmetic variants are constructed after Layer 4’s independent presentations.

### 3.3 The positive-radius colimit

Define the overconvergent Hilbert form module at (κ,n,c) as the filtered colimit of the fixed-radius modules over positive admitted ε with transition maps restriction toward zero. Define integral overconvergent Hilbert form module separately from the integral modules. Prove representative for overconvergent Hilbert form module, eventual equality, the colimit universal property, cofinal-radius independence and compatibility with level and bounded weight maps. A colimit element has a representative at one positive radius; two representatives agree after shrinking to a common positive radius. Its equality relation does not demand agreement at the larger radius. Source: AIP-cusp §3.5 and Theorem 3.16, pp.16–18.

The basic theory of these definitions has the following interfaces.

- For each rational or integral positive-radius colimit, give a representative at one positive radius and characterize equality by agreement after a common positive restriction.
- For these colimits, prove the universal property and invariance under a cofinal admitted system of positive radii.
- For level and bounded-weight maps, prove the induced colimit maps and their compatibility with fixed-radius representatives, retaining the integral base-change hypotheses.

**Checks.**

- A fixed-radius form defines a colimit element; its restrictions define the same element. Two forms with the same restriction at a smaller positive radius are identified.
- Replacing all positive radii by a cofinal sequence gives the same module. Adjoining ε=0 as a terminal restriction target can change the colimit and is not its definition.
- For a constant system A with identity maps the colimit is A, including A=0. A form defined only on the ordinary locus has no positive-radius representative by definition and is not automatically overconvergent.

**Integral colimit checks.**

- The integral overconvergent Hilbert form module of a constant integral system R⁺ with identity restrictions is R⁺, whose rationalization is R⁺[1/p]. It is not defined to be the latter rational module.
- Two integral representatives agreeing after an admitted smaller positive radius define the same integral colimit class. Representatives need not agree on the larger domain.
- A bounded ordinary section lacking every positive-radius representative is absent from integral overconvergent Hilbert form module. Allowing ε=0 as a terminal index would fail this test.

*Needs:* §3.2 section modules and restriction maps; filtered module colimits; cofinal positive admitted radii.

### 3.4 The ramified differential-lattice application

Construct modified Hilbert coefficient by applying the coefficient character to the supplied modified differential frame rather than to the naive differential lattice. Its API for coefficient frames, the Hodge inclusion and ordinary comparison records that the lattice has O⁺-rank d, rank one over Oₚ⊗O⁺, and cokernel controlled by Hdg^(1/(p−1)) in the precise integral ideal interpretation of HodgeTateAndCanonicalSubgroups §§5.8, 5.10–5.12. It agrees with the ordinary Rapoport differential module where Hdg is a unit. The same operation gives finite analytic coefficients on the frame torsor. Source: AIP-adic Proposition 4.1, p.15; HodgeTateAndCanonicalSubgroups Layer 5 (§§5.1, 5.8, 5.10–5.12) supplies the lattice and its properties. At a ramified prime, the coefficient construction must use that supplied unsplit module; it does not add a second lattice theorem.

The basic theory of these definitions has the following interfaces.

- For the modified coefficient, apply the chosen analytic representation to the supplied unsplit modified frame torsor and prove its local frame criterion.
- For its comparison with the Hodge coefficient, retain the supplied differential-lattice inclusion and the precise Hdg ideal bound on its cokernel.
- For ordinary comparison, identify the coefficients where Hdg is a unit, preserving rank one over Oₚ⊗O⁺ and rank d over O⁺ before generic splitting.

**Checks.**

- At an ordinary point the modified and original differential lattices agree. Away from it their generic fibres can agree while integral lattices differ.
- An Oₚ-linear frame has rank one over Oₚ⊗O⁺ and rank d over O⁺. Treating it as an O⁺-line for d>1 loses components of the character.
- In the unramified split generic fibre the algebraic tuple weights agree with the split Hodge lines. At a ramified integral point this computation does not license an integral product decomposition.

*Needs:* §§0.4 and 1.2; HodgeTateAndCanonicalSubgroups §§5.1, 5.8 and 5.10–5.12 for the unsplit lattice, ideal bound and frame torsor.

### Examples

The integral comparison is sensitive to a factor p even on a point. Over a positive-radius domain, both the integral function bound and the admissible analytic extension must be checked; shrinking the radius can improve the latter but does not turn every rational isomorphism into a lattice isomorphism. The ordinary restriction in Layer 7 is constructed from these positive-radius modules, not built into their colimit.

### Dependencies

Layers 0–2, all-open geometric coefficient descent, the supplied modified lattice, and formal flat base change when an integral weight map is used. Banach properties, cuspidal vanishing and ordinary completion are separate later targets.

## Layer 4: the four Hilbert presentations and arithmetic descent

### 4.1 Four independently defined equalizers

Fix an arithmetic weight (w,t) and its geometric weight κ. Use the actual towers and groups of PerfectoidShimuraVarieties §§5.4–5.10. Let U_N be all global units congruent to 1 modulo N, without a total-positivity restriction. Let Z∞ be its closure in the central action, embedded by z↦(zI,z²). Write Δ(p^∞N) for the profinite polarization group in the infinite tower, Δ(N) for its finite connected-component quotient, E(p^n)=(Γ₀(p^n)×Δ(p^∞N))/Z∞, and PΓ₀(p^n)=Γ₀(p^n)/Z∞ with the prescribed central interpretation. These are supplied groups and actions, not redefined as convenient abstract quotients. Their distinction is essential when a finite group has p-power order.

Define the following coefficient equalizers independently, first inside O⁺ and then inside O. The table specifies the cover, acting group and multiplier in the equivariance relation. The factors are written in the left-pullback convention of BHW; conversion to right descent is exactly §1.1.

| Coefficient | Infinite cover | Group | Multiplier |
| --- | --- | --- | --- |
| small geometric coefficient of κ at level n | X_(Γ*(p^∞)) | Γ₀*(p^n) | κ(j_γ)⁻¹ |
| full geometric coefficient of κ at level n | X_(Γ(p^∞)) | Γ₀(p^n) | κ(j_γ)⁻¹ |
| intermediate arithmetic coefficient of (w,t) at level n | X_(Γ(p^∞)) | E(p^n) | κ(j_γ)⁻¹ w(x̄) |
| full arithmetic coefficient of (w,t) at level n | X_(G,Γ(p^∞)) | PΓ₀(p^n) | κ(j_γ)⁻¹ w(det γ) |

Here x̄ is the actual polarization coordinate in E(p^n). Every equalizer is on its own admitted level/radius domain times U. For each define the section criterion, integral inclusion, radius maps, level maps and weight pullback. Rationalization and integral base change have the hypotheses of Layer 3. No coefficient is defined to be the pullback of another one in the table; the subsequent comparisons are theorems. Sources: BHW Definition 9.1, pp.1780–1781, and Lemma 9.2, pp.1781–1782.

The basic theory of these definitions has the following interfaces.

- For each of the four independently defined coefficients, prove exactly its tabled section criterion on its own cover, with integral inclusion and rationalization as in Layer 3.
- For all four coefficients, prove radius and level maps and weight pullback with identity and composition, under the same integral base-change hypotheses.
- For the two arithmetic multipliers, prove central representative independence, the cocycle law and composition on the actual supplied quotient groups using the norm-one congruence-unit closure.

**Checks.**

- For small geometric coefficient, κ=1 gives O⁺ or O on the small geometric base. A denominator d=2 at p=5 acts by κ(2)⁻¹. The action of diag(a,1) has no j contribution; replacing it with det γ would change this test.
- For full geometric coefficient, κ=1 gives the structural sheaf on the full geometric base, which is not asserted to be the same cover. The mixed-cover comparison of §4.2 must identify its pullback. A scalar zI contributes κ(z)⁻¹, not κ(z²)⁻¹.
- For intermediate arithmetic coefficient, w=t=1 gives its own structural sheaf. For a pure polarization element (1,x̄), the multiplier is w(x̄); for (γ,1) it is κ(j_γ)⁻¹. Dropping w loses the first action even when the period coordinate is unchanged.
- For full arithmetic coefficient, w=t=1 gives its own structural sheaf. On diag(1,d) the multiplier is κ(d)⁻¹w(d), and on a scalar zI it is κ(z)⁻¹w(z²). At p=5,F=ℚ,w=x,t=x, d=2 gives 1, whereas the geometric multiplier is 1/2.
- All four equalizers contain zero and have identity/composition maps in level and radius. Each trivial-weight structural-sheaf conclusion uses actual function descent; it is not a definition by expected rank.

Prove central invariance of the arithmetic multiplier: the last two multipliers are independent of the chosen central representative. On zI the weight factor is

```text
κ(z)⁻¹ w(z²) = t(Nₚ(z)).
```

It is 1 on U_N by the norm-one theorem for congruence units, and on its closure by continuity. It is therefore valid for all congruence units, including those with mixed real signs; the total-positive subgroup need not be dense in that full closure. Prove independence of the central representative and its cocycle/composition laws on the actual quotients. Source: BHW Lemma 9.2, pp.1781–1782, with the norm argument of §0.2. The statement does not require κ to be trivial on all global units, which would discard legitimate weights.

**Separate presentation checks.**

- The small geometric coefficient at κ=x⁻¹ sends a denominator 2 to the multiplier 2; full geometric coefficient has the same local multiplier on its different cover. Both zero sections satisfy all relations.
- The small geometric coefficient and full geometric coefficient restrict to the specified equalizers after a radius change. Pullback along the mixed span compares them; identifying their function carriers before pullback is not a valid definition.
- The intermediate arithmetic coefficient on (1,x̄) has factor w(x̄). For w=1 the polarization coordinate disappears while a nontrivial t still changes κ through the norm.
- The intermediate arithmetic coefficient is independent of a central change z from the full congruence-unit closure, including mixed-sign global units. Dropping the closure continuity step proves only the assertion on global points.
- The full arithmetic coefficient on diag(a,1) has factor w(a), although the geometric j-factor is 1. On a scalar zI its factor is t(Nₚ(z)), which is trivial on the central congruence-unit closure.
- The full arithmetic coefficient at the trivial pair has its own structural function equalizer and maps compatibly through every radius restriction. It need not have the same underlying base as a geometric presentation.

*Needs:* §§0.2 and 1.1–1.2; Layers 2–3; PerfectoidShimuraVarieties §§5.4–5.10 for the covers, groups and central quotient.

### 4.2 Geometric comparison and finite polarization descent

Prove the mixed-cover coefficient comparison using the supplied span

```text
X_(Γ*(p^∞)) ← X_(Γ*(p^∞)) × Oₚ^× → X_(Γ(p^∞)).
```

The right map is the actual ℤₚ^×-torsor map. Its additional diagonal factor has j_diag(ε,1)=1. All-open O and O⁺ function descent therefore identifies the two geometric coefficient lines after the corresponding base maps, compatibly with radius and level. Source: BHW Lemma 9.3, pp.1782–1783. Do not assert a direct equality of functions on two different covers.

Define the twisted polarization action of ε on geometric coefficients by ε·_w f=w(ε)(ε⁻¹)*f, for a totally positive global unit in the supplied polarization action. Prove its identity, multiplication and coefficient-stability laws, and factorization of the twisted action through finite Δ(N) after the indicated geometric quotient. Define finite polarization descent as the invariant subsheaf of the pulled-back full geometric coefficient under this actual finite action. Prove the intermediate coefficient comparison, identifying it with the independently defined intermediate equalizer. Sources: BHW Definition 9.4 and Lemmas 9.5–9.6, pp.1783–1784. The action uses inverse pullback; the finite quotient Δ(N) is distinct from Δ(p^∞N). Integrally, use the effective finite torsor and the section equalizer, not a Reynolds projector when p divides |Δ(N)|.

The basic theory of these definitions has the following interfaces.

- For the mixed-cover span, prove the geometric coefficient comparison after the corresponding base maps, using all-open rational and integral function descent.
- For the twisted polarization action, prove identity, multiplication and coefficient stability, and its factorization through Δ(N) after the specified quotient.
- For finite polarization descent, prove its sectionwise invariant criterion and its identification with the independent intermediate coefficient, retaining integral effective torsor descent at p-power group order.

**Checks.**

- The twisted polarization action at ε=1 is the identity. Two units ε,η act as w(εη)((εη)⁻¹)*, fixing the inverse-pullback order.
- For trivial w it is inverse geometric pullback. For a scalar eigenfunction of geometric pullback, its eigenvalue is multiplied by w(ε), not w(ε)⁻¹.
- A unit in the kernel of Δ(N) acts trivially only after the supplied level/descent identifications. An arbitrary local unit has no global polarization transport on a fixed moduli component.
- The finite polarization descent for a trivial group is the pulled-back sheaf; for trivial coefficient weight it is structural-function descent. When the finite group has p-power order the invariant equalizer still makes sense, but division by the group order does not.

**Finite descent checks.**

- The finite polarization descent on a split finite torsor is recovered by evaluation at its identity section and its actual twisted action. A coefficient with nontrivial polarization character is not a scalar invariant function on the cover.
- The finite polarization descent in residue characteristic 2 still uses an equalizer for a group of order 2; the formula (1+g)/2 is undefined. A trivial group gives the original sheaf, and the zero coefficient gives zero.

*Needs:* §4.1; PerfectoidShimuraVarieties §§5.4–5.10 for the mixed span and finite polarization torsor; PerfectoidTowers P9.11–P9.13 for all-open descent.

### 4.3 Weil pairing and the arithmetic coefficient

Use the supplied pairing function e_β on the intermediate tower. It is genuinely Oₚ^×-valued there, whereas on the arithmetic quotient only its class modulo the positive-unit closure is intrinsic. Prove the pairing character transformation on the intermediate cover:

```text
(γ,x)* w(e_β) = w(x⁻¹) w(det γ) w(e_β).
```

Then prove the Weil-pairing coefficient comparison: the map from full arithmetic coefficients to the intermediate presentation is f↦w(e_β)⁻¹π*f, with inverse given after descent by multiplication by w(e_β). Retain the inverse in this map, and prove compatibility with O⁺ whenever the pairing character and its inverse are valuation units, as they are on the admitted compact unit-valued pairing. Source: BHW Lemma 9.7, pp.1784–1785. The use of a raw pairing on the intermediate cover does not define a raw Oₚ^×-valued function on the arithmetic quotient.

**Checks.**

- With w=1 the comparison is ordinary pullback/descent. With F=ℚ,p=5,w=x and e_β=2, it multiplies a coefficient by 1/2; its inverse multiplies by 2.
- For a pure determinant change det γ=3 and x=1, the pairing weight changes by 3. For x=3 and γ=1 it changes by 1/3. These two tests distinguish the two coordinates in the formula.
- Changing the intermediate lift by an element of the positive-unit closure changes the raw pairing, but the combined equivariant expression descends by the stated action. Evaluating the raw pairing on a quotient point without a lift is not defined.

*Needs:* §§4.1–4.2; PerfectoidShimuraVarieties §§5.4–5.10 for the actual pairing and its transformation; two-sided valuation-unit bounds for integral comparison.

### 4.4 Forms across polarization classes

Define arithmetic class form module by the direct sum of the arithmetic section modules over prime-to-p fractional polarization ideals, modulo the transport relations P_x f−f for global x∈F^×,+∩Oₚ^×. Define its integral and positive-radius versions with the same relations and maps. Prove composition of polarization transport, principal-ideal transport, and reduction to finitely many class representatives, expressing the module using chosen representatives of the supplied finite narrow class group with its prime-to-p representative lemma. Prove independence of class representatives: changing representatives gives a canonical arithmetic transport isomorphism, coherent under further changes and respecting coefficient correspondences. Stabilizers act trivially by the arithmetic cancellation already established. Source: BHW Definitions 9.8 and 9.10 and the intervening discussion, pp.1785–1787. The geometric G* presentation retains conjugate choice-dependent operators where no canonical arithmetic transport is present.

The basic theory of these definitions has the following interfaces.

- For arithmetic class forms and their integral and positive-radius versions, impose exactly the global positive principal transport relations in the definition.
- For polarization transports, prove identity and composition, and reduce the quotient to prime-to-p representatives of the finite narrow class group.
- For a change of representatives, construct the canonical transport isomorphism, prove coherence under a second change and compatibility with coefficient correspondences; stabilizers act trivially.

**Checks.**

- For arithmetic class form module, a principal change by x=1 is the identity, and successive global positive x,y give P_xy. An arbitrary element of Oₚ^× with no global positive representative is not a permitted relation.
- For F=ℚ, the narrow class group is trivial and one component suffices. For a field with several narrow classes, dropping every but one component does not give the direct-sum quotient.
- Two choices of representatives of the same class are identified by the supplied positive principal transport. A residual stabilizer must give the identity; an arbitrary unspecified scalar cannot be introduced as a choice isomorphism.

*Needs:* §§4.1–4.3; Tau Ceti narrow class group finiteness and prime-to-p representatives; the supplied positive principal polarization transports.

### Examples

At F=ℚ,w=t=x, geometric κ=x, the geometric denominator d contributes d⁻¹, but the arithmetic determinant contributes d. Their product is 1 on diag(1,d). This does not make the geometric coefficient trivial: the two presentations have different groups and comparison pairing. The central cancellation uses z² from det(zI), not z, and uses the norm-one theorem on the full congruence-unit group.

### Dependencies

Layers 0–3, the supplied mixed span, pairing and arithmetic deck groups, all-open integral function descent, and the narrow class group. No finite-group averaging assumption is hidden in the integral comparisons.

## Layer 5: independent AIP coefficients and comparison

### 5.1 AIP analytic eigenfunctions and the formal universal line

Apply the weight character to the actual modified differential-frame torsor of HodgeTateAndCanonicalSubgroups §§5.8, 5.10–5.12. On a normal formal chart, write Hdg_T^(p−1)=Hdg and use the genuine fractional ideal I′_m=p^m Hdg_T^(−p^m), integral on that chart. Its analytic structure group is B_m=Oₚ^×(1+I′_m Res_(O_F/ℤ) G_a). This is a positive-dimensional analytic group, not a profinite group. Define the AIP analytic coefficient of κ and the AIP integral coefficient of κ independently as the κ⁻¹-eigenfunctions in the direct images of O and O⁺ on that actual torsor. Their APIs eigencondition for AIP coefficient, integral inclusion, chart restriction, weight change and translation by units retain the torsor, coefficient chart and finite-character factor. Source: AIP-adic §4.1–§4.2, pp.15–16; BHW Definition 7.9, p.1761.

For the formal construction use the AIP universal-character chart over W_F⁰, interval I=[p^k,p^k′], 0≤k≤k′, and r_AIP≥3 with r_AIP+k≥n_AIP≥k′+2 at odd p, and ≥k′+4 at p=2. Put n′=n_AIP−k′−2 or n_AIP−k′−4, respectively. Define universal AIP formal line from its actual formal eigenfunctions; prove its invertibility and transition/gluing maps. These are AIP-adic Propositions 4.3 and 4.7, pp.16,18, and §6.1, pp.25–27. The AIP universal-coordinate parameter is not silently set equal to principal character radius. In the HodgeTateAndCanonicalSubgroups §5.12 comparison, the analytic character index is m=k+r−1 in its notation; use that index and its one-way containment B_m⊂the ambient character ball, rather than the reverse inclusion.

Prove valuation-unit stability under AIP translation: at every complete algebraically closed valued point of an admitted torsor, κ(b) and κ(b)⁻¹ belong to the valuation ring, including finite-character values. For the small factor this is the topologically nilpotent congruence of AIP-adic Lemma 4.4, p.16; for the finite factor it follows from finite order. Consequently translation preserves both directions of the integral bound. This does not yet construct a unit eigenfunction on the base.

The basic theory of these definitions has the following interfaces.

- For the rational and integral AIP analytic coefficients, prove the full-character eigencondition, integral inclusion, chart restriction, weight maps and unit translations on the actual frame torsor.
- For the universal AIP formal line, prove invertibility and transition/gluing maps under the exact interval and depth inequalities above.
- For AIP translations, prove both the character and its inverse are valuation units at every complete algebraically closed valued point, preserving both integral bounds without claiming a base-local generator.

**Checks.**

- AIP analytic coefficient at κ=1 is invariant functions, hence O after the invariant-function theorem below; AIP integral coefficient gives O⁺ with its separate bound theorem.
- For F=ℚ,κ=x, scaling a differential frame s by λ gives f(λs)=λ⁻¹f(s). A constant nonzero function is not an eigenfunction for all λ.
- For universal AIP formal line, a local universal eigenframe generates a formal line and specializes to algebraic modified coefficients. The full dyadic sign character is not a W_F⁰ character and is not supplied merely by this universal line.
- A finite p-power root of unity and its inverse have valuation zero, even in a ramified coefficient field. A nonunit scalar p does not satisfy the translation-unit theorem.
- A rational eigengenerator need not be an integral unit eigengenerator. The universal formal line theorem cannot simply be applied to every finite-character twist on every positive formal neighborhood.

**Separate AIP coefficient checks.**

- AIP analytic coefficient at an algebraic character xᵏ evaluates a differential frame to its homogeneous inverse kth power; k=−1 gives the dual action. A nontrivial finite character remains visible even when the universal small character is trivial.
- AIP analytic coefficient on a split torsor is recovered from its value at the identity frame. Restricting that frame to a smaller admitted chart preserves the section, rather than introducing an unrelated basis.
- AIP integral coefficient contains the trivial-character constant 1 and excludes p⁻¹ at a point. Its bound is tested on every valued point, rather than only on rational points of a selected field.
- Translating AIP integral coefficient by a finite-character value ζ or ζ⁻¹ preserves its bound because both are units; multiplying by p⁻¹ does not preserve the unit ball. An integral lattice rescaled by p is a distinct lattice with the same rationalization.
- The universal AIP formal line has a local basis and its transition units satisfy the cocycle law. Changing a local basis by an integral unit preserves the formal line; changing it by p gives only a rational basis change.
- Specializing universal AIP formal line at the trivial universal character gives the formal structural line. Twisting by the dyadic sign character requires the independent finite factor, so that twist is not silently another universal-coordinate specialization.

*Needs:* §§0.2–0.4 and 1.2; HodgeTateAndCanonicalSubgroups §§5.8 and 5.10–5.12 for the AIP torsor and modified lattice; the stated AIP weight chart and formal ideal inequalities.

### 5.2 Structure invariants on the analytic frame torsor

Prove the AIP torsor invariant-function theorem: for the actual analytic B_m-torsor f_U over the full weight product, (f_U*O)^(B_m)=O and (f_U*O⁺)^(B_m)=O⁺ as sheaves on every open. Prove valued-point lifting for the AIP torsor and reflection of integral bounds by the AIP torsor: after the torsor's local trivialization, a complete valued point of the base lifts after a finite separable extension of its completed residue field, and evaluation upstairs detects the base integral bound. Triviality over a separable extension follows from the étale-locally trivial smooth analytic torsor; it is not inferred from a profinite-torsor theorem. The proof uses the identity section locally, descent across the actual Čech relation, all valued points, and the all-open compatibility of Layer 1. Source: AIP-adic §4.1, pp.15–16, the formal torsor constructed following Proposition 4.1 and its analytic generic fibre, and the comparison argument of BHW §7.2, pp.1762–1765. The all-open and geometric O⁺ conclusion is an explicit extension of that argument, not an invocation of a finite-group averaging result.

*Needs:* §§1.2 and 5.1; the actual smooth analytic torsor and its étale trivializations; valued-point lifting after finite separable extension; full Čech descent and all-valued-point integral bounds.

### 5.3 The finite character and integral generators

Let H be the torsion part in the AIP unit decomposition, using q=p for odd p and q=4 for p=2. Retain its projection through G=(O_F/p²O_F)^×, as in AIP-adic Lemma 2.4, pp.7–8. For the normalized finite Igusa cover h:IG₂→X, define the finite AIP character factor of χ as the coherent χ⁻¹-eigencomponent of h_*O, with its independent integral intersection inside h_*O⁺. Define full AIP formal coefficient as the universal formal line tensored with that finite-character factor, with coherent completion as in the actual model. The APIs are the finite-character eigencondition, its ordinary-line property and rational pullback, and restriction, weight specialization and gluing for the full formal coefficient. The rational factor is invertible; the full formal factor is coherent and invertible on the ordinary locus. Its integral formal invertibility on an entire positive neighborhood is not stated without an additional theorem. Source: AIP-adic §6.4 and Theorem 6.7, p.29. If the actual level-two Igusa construction requires ε≤p^(−3), impose that extra bound as well as the period bound.

On a cover where a chosen section σ splits IG₂, define the split finite character generator for (χ,σ) by e_(χ,σ)(σa)=χ(a)⁻¹. Prove unit for split finite character generator, evaluation at the chosen section, and change of section: e_(χ,σa)=χ(a)e_(χ,σ). These are assertions on the split finite cover and its unit-valued functions. For a function g on a further cover whose chosen Igusa section changes by a(y₁,y₂) on the full Čech relation, prove the descent criterion g(y₂)=χ(a(y₁,y₂))⁻¹g(y₁). The simplified factor d_γ mod p² describes only the specified Γ₀* intermediate action, not the whole Čech relation. A unit generator after pullback is not automatically a generator descending on the base.

Fix an admitted normal AIP formal chart 𝔛 over the §5.1 weight interval, with its normalized level-two Igusa model, a finite character χ, and the universal character on that interval. Impose the §5.1 inequalities, the common comparison bound ε≤p^(−(m+1)), and the Igusa bound ε≤p^(−3) whenever required by this level-two model. Let X be its analytic generic fibre and q:T→X the actual full differential-frame torsor after weight extension. The geometric integral coefficient E⁺ is the full-character eigenfunction equalizer in q_*O_T⁺ on X_an, the analytic open site. Define the analytic unit-coboundary condition on an analytic open V⊂X as follows: on an étale torsor-trivializing cover V_i→V, the full character descent cocycle is the Čech coboundary of functions b_i with b_i,b_i⁻¹∈O⁺(V_i), compatible with the entire torsor relation, not merely its Γ₀* subgroup. The coboundary is required over that fixed analytic open V; merely having a splitting after replacing V by a covering space does not satisfy it. Prove the conditional integral-generator theorem: on every such V, these functions descend to an O⁺-unit eigenframe e and give the isomorphism O_V⁺→E⁺|V, a↦ae. Its inverse divides by e and descends the resulting invariant function; both sheaves are on V_an. It makes no analytic-local existence claim without the stated coboundary hypothesis. Its proof is descent and evaluation at a unit eigenframe, using §5.2's structure invariants.

For the formal-to-geometric integral comparison let M⁺ be the coherent full formal coefficient on 𝔛_Zar. Write sp:X_an→𝔛_Zar for specialization and define its integral analytic pullback as the p-adic completion of sp⁻¹M⁺⊗_(sp⁻¹O_𝔛)O_X⁺. On formal Zariski opens admitting a formal étale torsor-trivializing cover on which the full formal descent cocycle is a coboundary in formal units, with analytic image and inverse power bounded, prove that evaluation induces an isomorphism from this pullback to E⁺. Keep the actual weight specialization and completion hypotheses of §§3.2, 5.1; a flat compatible formal weight change preserves the comparison. Both sides then have the same unit eigenframe, so the map and its inverse are fixed by evaluation, not by an arbitrary rational rescaling. Outside these opens the full formal coefficient remains coherent; no positive-radius integral invertibility or identification with geometric O⁺ is asserted from rational splitting. Sources: AIP-adic §6.4 and Theorem 6.7, p.29, for the coherent full formal coefficient and ordinary invertibility; BHW §7.2, pp.1762–1765, for the separate geometric eigenfunction comparison. *Needs:* §§1.2, 3.2, 5.1–5.2 and the stated unit coboundaries.

The basic theory of these definitions has the following interfaces.

- For the finite AIP character factor, prove its inverse-character eigencondition, rational invertibility, ordinary integral invertibility and rational pullback to a split Igusa cover.
- For the full AIP formal coefficient, prove coherence, ordinary invertibility, restriction, specialization and gluing, retaining both universal and finite factors.
- For the split finite-character generator, prove unit-valuedness, value 1 on its chosen section, the change-of-section formula, and the full Čech descent criterion.
- For the analytic unit-coboundary condition on a fixed open V, construct the integral eigenframe and inverse trivialization there by invariant-function descent.
- For the completed specialization pullback from the formal Zariski site to the analytic open site, prove its comparison with the geometric integral equalizer on the formal unit-coboundary opens, naturally under the stated flat completed weight changes.

**Checks.**

- The finite AIP character factor for χ=1 contains invariant structural functions; a nontrivial χ has nonconstant equivariance on a split fibre. At p=2, χ(−1)=−1 is retained even though it is invisible to the W_F⁰ universal factor.
- The split finite character generator is 1 along σ. At a with χ(a)=−1 its value is −1; replacing σ by σa multiplies the generator by −1. A generator with χ rather than χ⁻¹ has the wrong general character relation.
- A finite-character eigenfunction upstairs can be a unit without being invariant or descending as a base scalar. Under a nontrivial change of section its transition unit is χ(a), not 1.
- The full AIP formal coefficient specializes rationally to the product of the universal and finite-character lines. On the ordinary formal locus the finite factor is invertible; the same conclusion on a positive formal annulus requires a formal unit coboundary on that formal neighborhood.
- Integrality of χ(a) and its inverse supplies translation stability but no averaging idempotent when the finite group has p-power order. This separates valuation-unit multipliers from base-local unit eigenfunctions.

**Finite-factor checks.**

- The finite AIP character factor has integral constant 1 for χ=1 and the nontrivial sign relation for χ(−1)=−1. A rational character projector with a p-denominator is excluded from the integral construction.
- The rational finite AIP character factor pulls back to a line on a split analytic Igusa torsor. Its integral intersection is formed using geometric O⁺; no nonflat integral tensor interchange is part of this test.
- The split finite character generator takes value 1 at σ and χ(a)⁻¹ at σa. For a third root ζ≠ζ⁻¹ this distinguishes the inverse character, unlike a sign-only test.
- Changing σ to σa multiplies split finite character generator by χ(a), and changing back multiplies by χ(a)⁻¹. The full overlap relation, rather than only one subgroup's d-entry formula, is required for descent.
- The full AIP formal coefficient at trivial finite character recovers the universal formal line. At trivial universal character it retains the finite formal factor; rationally both products are invertible.
- On the ordinary locus full AIP formal coefficient is formally invertible. On a positive formal annulus its coherence and rational invertibility do not by themselves imply integral freeness: that conclusion requires the stated unit coboundary in that topology.
- On an analytically split full-character torsor the character eigenfunction and its inverse both have norm 1, so the analytic unit-coboundary condition holds and the conditional conclusion is E⁺=O⁺. Multiplying this frame by p gives inverse norm |p|⁻¹>1 and does not satisfy that condition.
- On a formal split chart with a unit character eigenframe, completed specialization pullback carries its free formal line O_𝔛 to O_X⁺. At the trivial character it carries 1 to 1; a rational frame rescaled by p cannot replace this integral comparison map.
- Model countercheck for the base-generator claim: on |p|≤|T|≤1 the cover y²=T with its sign character splits after pullback to itself and has a unit-valued eigenfunction on the split fibre. Its descended integral sign line requires the bound |a|·|T|^(1/2)≤1 on sections ay. Near a point of irrational radius, invertible base functions have local norm |c||T|ᵏ, k integral, so none is a unit eigengenerator of exactly this bound. Freeness after a splitting cover does not give the needed base-local O⁺ generator.

*Needs:* §§1.2, 3.2 and 5.1–5.2; the normalized finite Igusa cover; the analytic or formal unit coboundary on its specified base open; completed specialization pullback for the formal comparison.

### 5.4 Perfectoid–AIP coefficient comparisons

Prove the geometric AIP comparison: evaluation on the supplied Hodge–Tate lift gives an isomorphism from the independently constructed AIP analytic coefficient to the geometric Hilbert coefficient. Prove the geometric integral AIP comparison for their geometric O⁺ eigenfunction lattices by reflecting bounds on every valued point of the actual frame torsor and using full Čech descent. Both directions must preserve the pointwise bound; a rational line isomorphism alone is insufficient. This integral equalizer comparison does not assert formal-model local freeness outside the unit-coboundary opens of §5.3.

Require the actual HodgeTateAndCanonicalSubgroups §§5.10–5.12 common range ε≤p^(−(m+1)) and all the other character/canonical bounds, with scaled AL_n at finite level, AL₁ at n=0 and structural pullback at infinite level. For example, at p=5,m=1 the comparison bound 1/25 is stronger than the period bound 1/10. Identify the ratio of actual lifts through the open embedding into the modified differential bundle; its factor is cz+d. Source: BHW Theorem 7.14, pp.1764–1765, with the integral proof's torsor and valuation inputs spelled out; HodgeTateAndCanonicalSubgroups §§5.8, 5.10–5.12 supply the torsor, lift, factor and torsor comparison with the corrected character index.

Prove the arithmetic AIP comparison by the independent finite Δ(N)-descent and the Weil-pairing comparison of Layer 4, rather than defining arithmetic AIP coefficients by the desired isomorphism. In the AIP arithmetic notation use ν_AIP=w and its norm variable w_AIP=t⁻¹, so its geometric weight is exactly κ. Prove naturality of the AIP comparisons: all comparisons commute with admissible radius, finite/infinite level and bounded weight pullback, with integral pullback only under its stated conditions. Prove uniqueness among coefficient maps compatible with the actual frame evaluation and descent. Sources: BHW Definition 9.11 and Theorem 9.12, pp.1787–1788.

*Needs:* §§2.2, 3.1–3.2 and 5.1–5.3; HodgeTateAndCanonicalSubgroups §§5.8 and 5.10–5.12 for the actual lift and its ratio; §§4.1–4.3 for the arithmetic comparison.

### 5.5 Frobenius and restriction

Prove the AIP Frobenius–restriction comparison on the actual formal models: if i:M_(r+1)→M_r is the inclusion and φ is the canonical-subgroup quotient Frobenius map, there is an isomorphism i*ω^κ_un≃φ*ω^κ_un, compatible with the specified model, weights and iterates. This is AIP-adic Theorem 6.7(3), p.29, constructed in §6.2, p.27, from Proposition 4.8, p.19. The map on modified differential frames is induced by the quotient isogeny and sends the source frame to p times its image in the quotient differential module, in the source's convention. It is not an identification by the literal identity on differentials, nor a statement equating two numerical radii. Prove compatibility with iterated Frobenius, weight compatibility of Frobenius and compatibility with the analytic coefficient comparison in their common admitted range. Integral compatibility is relative to the modified lattices and actual isogeny map.

*Needs:* §§3.4 and 5.1–5.4; the canonical-subgroup quotient isogeny from HodgeTateAndCanonicalSubgroups Layers 3–5; the stated formal Frobenius frame map.

### Examples

At an algebraic weight the comparison evaluates a homogeneous function on a genuine differential frame, giving the expected Hodge tensor. At a finite torsion weight, a split Igusa generator takes root-of-unity values and is a unit upstairs, but its changes of section must still be descended. The full-character comparison and full-character integral local freeness therefore have different proof requirements. Frobenius compatibility tracks the isogeny frame map; it does not remove this distinction.

### Dependencies

Layers 0–4; HodgeTateAndCanonicalSubgroups Layer 5's actual modified lattice, torsor and Hodge–Tate lift; AIP character charts and finite normalized Igusa cover; all-open descent and valued-point bounds. Positive-radius integral local freeness is conditional on the analytic unit coboundary of §5.3; comparison with the coherent formal coefficient uses its separate formal unit-coboundary hypothesis and completed specialization pullback.

## Layer 6: cusps, expansions and compact Hecke operators

### 6.1 Cuspidality and analytic-family Koecher extension

On the toroidal admitted domain with boundary D, define the Hilbert cusp coefficient of κ as ω^κ⊗I_D, with the supplied subcanonical interpretation when D is an effective Cartier divisor. Define fixed-radius cusp form module as its H⁰ and overconvergent cusp form module as its positive-radius colimit. Define integral variants using the actual integral coefficient lattice and its boundary ideal. The API inclusion for Hilbert cusp coefficient, the boundary-kernel description of cusp forms, radius compatibility of cusp forms, weight compatibility of cusp forms and class descent of cusp forms must retain the domain and arithmetic transport. At a boundary divisor the cusp condition is vanishing, rather than merely extension across the boundary. Sources: AIP-cusp §§3.5–3.6, pp.16–21; AIP-adic §8.3, pp.35–36. The classical subcanonical bundle itself is supplied by AutomorphicBundles B3.

The basic theory of these definitions has the following interfaces.

- For the Hilbert cusp coefficient and its integral version, prove inclusion in full coefficients, the boundary-kernel criterion, and compatibility with radius, weight and arithmetic class descent.
- For fixed-radius cusp forms, identify sections with the kernel of the actual coefficient-valued boundary restriction.
- For overconvergent cusp forms, including the integral variant, prove the positive-radius representative and eventual-equality descriptions and induced restriction maps.

**Checks.**

- Hilbert cusp coefficient at trivial weight is I_D, not O. If D is nonempty, the constant section 1 is not cuspidal; if D is empty, cusp and ordinary coefficient sheaves agree.
- The fixed-radius cusp form module is the kernel of boundary restriction, contains zero, and maps into the corresponding full form module. For a local boundary parameter q, q is cuspidal whereas 1+q is not.
- The overconvergent cusp form module has positive-radius representatives and identifies eventual equalities. A section only on the ordinary locus is not a colimit representative. Integral cuspidality is preserved by admitted restriction without first dividing by p.

Prove the family Koecher theorem for d>1: on the admitted Hilbert family, deleting the cusps from the toroidal model does not change the full coefficient sections. Reduce near the boundary to ordinary finite Igusa structural functions, use the normal arithmetic minimal model and its codimension-at-least-two missing locus, then pass through torsion levels, formal completion and the coefficient equalizer. This supplies the analytic-weight and p-level adapter; the classical B5 Koecher principle by itself is not that adapter. Source: AIP-adic Proposition 8.4 and proof, pp.36–37. The proof requires normality of the actual finite Igusa rings and the correct codimension after their finite map, not only a codimension statement on the base. At d=1, punctured-disc functions can have poles and no such unrestricted extension is asserted. Koecher extension does not say that the extended section vanishes at the cusps.

**Further cuspidal checks.**

- For Hilbert cusp coefficient, changing the boundary ideal from (q) to (q²) changes the local sheaf: q is in the first and not the second. Omitting the boundary ideal gives the full coefficient sheaf instead.
- A local algebraic coefficient frame identifies Hilbert cusp coefficient with that frame times I_D. Rescaling the frame by a unit preserves the vanishing condition, while a meromorphic boundary factor changes it.
- For fixed-radius cusp form module, at empty boundary its module equals the full section module; at nonempty boundary the constant section at trivial weight is excluded. Boundary restriction detects the constant term on the Tate chart.
- Restriction of fixed-radius cusp form module to a smaller admitted radius preserves the boundary kernel and its weight action. At a nontrivial coefficient the boundary value lies in its coefficient line, rather than in an arbitrarily identified scalar ring.
- For overconvergent cusp form module, restrictions of q times a local frame have the same colimit class. Representatives becoming equal after further positive-radius restriction are identified without requiring equality on the larger domain.
- A compatible ordinary cuspidal section without any positive-radius extension is not in overconvergent cusp form module by definition. On a constant zero system the colimit is zero; the colimit condition adds no ordinary-only representatives.
- The integral Hilbert cusp coefficient is the intersection of rational cuspidality with the specified lattice. On a trivial frame q is integral, whereas p⁻¹q need not be; integral vanishing alone does not bound coefficients.
- The integral fixed-radius cusp form module contains zero and maps injectively to rational forms on a torsion-free model. Reduction modulo p may kill a nonzero p-multiple, so reduction is not this injection.
- The integral overconvergent cusp form module is formed before rationalization; q and its positive-radius restrictions agree in it. A rational section with no integral representative is not inserted merely because it is cuspidal.

*Needs:* Layers 2–5; AutomorphicBundles B3 and B5; HodgeTateAndCanonicalSubgroups §5.1 for ordinary finite Igusa torsors on toroidal semiabelian charts; ShimuraCompactifications C6.23–C6.47 for the normal minimal contraction and cusp-unit charts, with the specified codimension condition.

### 6.2 Integral boundary vanishing and its coefficient consequence

Prove higher direct-image vanishing for torsion boundary lines: for the arithmetic Hilbert toroidal-to-minimal map ρ, boundary D and a torsion invertible sheaf L on the arithmetic toroidal model, R^iρ_*(L(−D))=0 for all i>0. Here torsion means L^e≃O for some positive e; e need not be prime to p. Include the formal completions and admissible models used near ordinary cusps. Away from the cusps the map is an isomorphism, so the issue is precisely the arithmetic toric boundary quotient. Source: AIP-adic proof of Theorem 8.2, p.35, which explicitly extends the trivial-line toric vanishing of AIP-cusp Proposition 6.4, pp.32–33, to torsion invertible sheaves.

The proof is not generic acyclicity of a positive-unit group. On the toric chart choose the positive U-invariant support function h, with ample divisor D_h=−Σa_ρD_ρ. For an integer ℓ larger than all a_ρ, floor(D_h/ℓ)=−D. The finite flat power map has a U-equivariant monomial splitting, independent of division by ℓ, which injects boundary-twisted cohomology as a direct summand of cohomology with an ample twist. Descend the splitting to the formal quotient and increase the ample twist to apply Serre vanishing. For torsion L choose a power compatible with its finite order and carry its transition data through this splitting. The monomial splitting, rather than a trace divided by ℓ, is essential in characteristic p. Sources: AIP-cusp Proposition 6.2, Lemma 6.3 and Proposition 6.4, pp.32–33; AIP-adic Theorem 8.2, pp.35–36.

Prove higher direct-image vanishing for cuspidal coefficients on the actual AIP formal map and finite Igusa level: for the small character, reduce modulo p where the admitted small analytic character is trivial, apply structural boundary vanishing, and use p-torsion-freeness, compatible completion and formal functions to obtain R^qρ_*Ω^κ(−D)=0 for q>0. For a full universal arithmetic weight use the semi-local completed weight algebra and reduction at its maximal ideals, where the residual character gives a torsion line, as in AIP-adic Theorem 8.2. This retains every cohomological degree. Finite component descent after inverting p is exact, while an integral argument must use the actual finite torsor/model; it cannot divide by a p-power group order. Sources: AIP-cusp Theorem 3.17, pp.18–19, Corollary 3.20 and Lemma 3.21, p.21, and the proof of Proposition 3.22, pp.21–22; AIP-adic Theorem 8.2, pp.35–36.

**Checks.**

- For the identity toroidal-to-minimal map, e.g. the smooth genus-one boundary model, higher direct images vanish for the elementary reason that the map is the identity. This is compatible with, but does not prove, the higher-dimensional target.
- The trivial line L=O is included, as is a torsion line of order p. A proof using division by that order fails the latter case.
- In residue characteristic 2, a toric power map of even degree still has the monomial direct-summand map; a normalized trace by its degree does not exist. No equal-characteristic analytic Q_p-family theorem is claimed: the characteristic-p calculation is an input on the special fibre.

*Needs:* §6.1; the actual toroidal-to-minimal formal map; toric support functions, power maps and their monomial splitting; formal functions, compatible completion and the stated torsion-line transition data.

### 6.3 Tame Hecke correspondences with their actual degrees

For an integral ideal a prime to pN, use the actual cyclic a-isogeny correspondence from polarization ca to c. Define the tame Hilbert Hecke operator at a by

```text
H⁰(X_ca,ω^κ) --π₂*--> H⁰(C_a,π₂*ω^κ)
  --θ_a--> H⁰(C_a,π₁*ω^κ) --(1/q_a)Tr_π₁--> H⁰(X_c,ω^κ),
q_a = |O_F/a|.
```

The coefficient map θ_a is in the displayed direction, supplied by the actual prime-to-p isogeny and Hodge–Tate diagram. Prove integral stability of the tame Hilbert Hecke operator, cuspidal stability, radius compatibility, weight compatibility, level compatibility and class transport. The integer q_a is a p-adic unit, so this normalization preserves the integral lattice. Source: BHW Lemma 10.1 and Definition 10.2, pp.1788–1789. Compatibility across class representatives uses Layer 4 rather than an arbitrary identification of polarization modules.

Prove the tame Hecke constant-section formula: at trivial weight the constant 1 is multiplied by deg(π₁)/q_a. For a prime ideal l this degree is q_l+1. For general a, count primitive rank-one direct summands of (O_F/a)²; its degree is |P¹(O_F/a)|. For a=∏l^e this is ∏q_l^(e−1)(q_l+1), with empty product 1 at a=O_F. The counting statement is an elementary finite-local-ring calculation attached to this correspondence. Thus the prime-ideal formula is not asserted for composite ideals. The normalization remains 1/q_a in all cases.

The basic theory of these definitions has the following interfaces.

- For the tame Hecke operator, construct the coefficient map in the displayed direction and prove stability of the integral lattice and cusp ideal.
- For radius, weight, level and arithmetic class transport, prove commutation with the correspondence and its normalized trace.
- For the constant section at trivial weight, prove multiplication by |P¹(O_F/a)|/|O_F/a|, with its local-prime-power product and unit-ideal value.

**Checks.**

- The tame Hilbert Hecke operator at the unit ideal is the identity: degree and q are both 1. Substituting q+1 here would incorrectly multiply by 2.
- At a prime of norm q=2 away from p, the trivial-weight constant goes to 3/2. Normalizing by the degree would instead give 1.
- At a=l² of residue norm q, degree is q²+q and q_a=q²; the constant becomes 1+1/q, not 1+1/q². This retains the general-ideal definition while testing its actual correspondence.
- The coefficient is pulled from ca to the correspondence, then transported toward π₁ and traced to c. Reversing θ_a changes the type and does not give this operator.

*Needs:* §§2.2, 3.1 and 4.4; the actual prime-to-p cyclic isogeny correspondence, coefficient map and trace; §6.1 for cusp stability.

### 6.4 Wild Hecke correspondences and diamonds

For a prime ideal pfr above p, put q_pfr=|O_F/pfr|, e_pfr=v_pfr(p), and n≥1. Use the actual level l=ne_pfr+1 correspondence recording an anticanonical D with D[pfr^(ne_pfr)]=C[pfr^(ne_pfr)]. Define the partial wild Hecke operator at pfr by q_pfr⁻¹Tr_π₁ θ_pfr π₂*, where π₁ has degree q_pfr and θ_pfr:π₂*ω^κ→π₁*ω^κ is induced by u_ϖ=diag(ϖ,1) in the tower action. Prove integrality of the wild coefficient map, independence of the uniformizer, and compatibility with the actual conjugation j(γ)=u_ϖγu_ϖ⁻¹ and coordinate z↦ϖz. For γ=[a,b;c,d], this is j(γ)=[a,ϖb;ϖ⁻¹c,d], so its denominator at ϖz is again cz+d. Compute this conjugation after inverting p; its restriction lands in the stated integral level group because c is divisible by ϖ. Sources: BHW Lemma 10.3 and Definition 10.4, pp.1789–1790.

For the algebraic denominator used by Hilbert denominator, define the lower-row denominator j(γ,z)=γ₁₀z+γ₁₁ on two-by-two matrices over a commutative ring R. Its APIs the identity denominator, the diagonal denominator and the wild denominator conjugation identity retain the coordinate and the lower row. For the last identity let ϖ∈Rˣ: j(diag(ϖ,1) γ diag(ϖ⁻¹,1),ϖz)=j(γ,z). In the geometric application R is the generic-fibre coefficient algebra, in which a local uniformizer is invertible; it is not a unit in the integral local ring. This polynomial-coordinate identity is the normalization in the proof of BHW Lemma 10.3, p.1790, before applying κ.

The basic theory of these definitions has the following interfaces.

- For the partial wild correspondence, prove integrality of the coefficient map before normalization, independence of the local uniformizer after transport, and the displayed conjugation and denominator identity.
- For the lower-row denominator on arbitrary commutative rings, prove its identity and diagonal values and its wild conjugation identity for a unit uniformizer.
- For the partial operator, prove improvement in its own Hasse direction and compatibility with radius, weight, class transport and cusps. Construct level-zero and infinite-level coefficient maps in their specified separate settings.
- For tame diamond operators, prove identity, multiplication, inverse, cusp stability and coefficient comparison on the actual level moduli.
- For the AIP comparison, prove equivariance for all three types of correspondence, preserving boundary ideals and the integral renormalized operators.

**Denominator checks.**

- The identity and every upper unipotent have lower-row denominator equal to 1; diag(a,d) gives d for every z. Substituting the determinant would give ad instead.
- A lower unipotent [1,0;c,1] gives 1+cz. At c=25,z=5 it gives 126, detecting loss of the coordinate term.
- Over ℚ₅, with ϖ=5 and γ=[1,0;25,1], the correct conjugation gives [1,0;5,1] and the new coordinate 25, hence 126. Reversing the conjugation gives [1,0;125,1] and denominator 3126. The original and transformed denominators are units, so this discrepancy persists on integral coefficient eigenfunctions.

Prove partial radius improvement for partial wild Hecke operator: π₂ improves the relevant partial Hasse bounds in the source's permitted range. It need not improve every p-place's bound. Prove compatibility with radius, weight, arithmetic class transport and cusps. At tame level n=0 construct the corresponding map only via the admitted AL transport; it is not the above n≥1 correspondence with n deleted. At infinite level construct the functorial coefficient correspondence, without claiming the finite-level Banach compactness theorem. Sources: BHW §10.2–§10.4, pp.1789–1792; AIP-cusp Lemma 3.25 and Corollary 3.26, pp.22–23.

Define tame diamond operator from the actual tame-level automorphism and its inverse coefficient pullback in the supplied classical Hecke convention. Prove the identity law for tame diamond operators, multiplicativity, the inverse law, cuspidal stability and coefficient comparison. This is distinct from multiplying a polarization by a totally positive global unit and distinct from central representative cancellation. Sources: the level/Hecke functoriality of AutomorphicBundles B5; AIP-cusp §§3.7–4.1, pp.21–24, applies that functoriality to these coefficients. The action is specified on the actual level moduli, not on an arbitrary abstract group named a diamond group.

**Checks.**

- The partial wild Hecke operator sends 1 to 1 at trivial coefficient weight, because π₁ has degree q_pfr and the coefficient map is the identity on constants. The integral map before dividing by q_pfr is not the normalized rational operator.
- For F=ℚ the quotient correspondence takes radius ε to ε/p. For several p-places, one partial operator need not improve the other coordinates.
- At a totally ramified p-place, the extra level is ne+1, not n+1 unless e=1. A unit multiple of ϖ gives the same descended coefficient map after its specified transport.
- The tame diamond operator at the identity is the identity, a unit followed by its inverse gives the identity, and a nontrivial nebentype section has its prescribed character value. A pure global polarization change is not declared the same tame-level automorphism.

Prove Hecke equivariance of the AIP comparison for tame, wild and tame-level automorphism correspondences, using the independently defined operators and the same coefficient-map directions and trace constants. Prove that it preserves integral renormalized operators and boundary ideals. Source: BHW Proposition 10.8, pp.1791–1792. Rational equivariance is not a proof that unnormalized wild U preserves the lattice.

**Further diamond checks.**

- For tame diamond operator, the coefficient multiplier is the inverse pullback prescribed by the actual level automorphism. A primitive nebentype of order three distinguishes a character value from its inverse, whereas a sign-only example does not.
- Composing two tame diamond operator maps gives the map for the product of the actual tame-level automorphisms, preserving both the coefficient lattice and boundary ideal. A global polarization unit has a different moduli action and cannot be substituted for such an automorphism.

*Needs:* §§2.1–2.2, 4.4, 5.4 and 6.1; the actual wild and tame-level correspondences and isogeny frame maps; the displayed unit-uniformizer conjugation calculation.

### 6.5 Family Fourier expansions and their comparison

For each admitted unramified cusp c, choose a toroidal/Tate uniformization, an Igusa generator and the finite-character trivialization on the cover where it exists. Define the family Hilbert q-expansion at c by evaluation of the actual coefficient section on that Tate object. Its values lie in the completed positive-exponent series module with cusp exponent lattice M_c and coefficient line D_c^κ; a scalar series is obtained only after trivializing this line. Impose the usual support condition relative to a cone, and the positive-unit equivariance on exponents and on D_c^κ. Prove the expansion change-of-frame formula, radius compatibility, level compatibility, weight compatibility, and algebraic specialization, and independence of the fan after common refinement. The algebraic specialization agrees with the supplied classical expansion, with arithmetic parameters ν=w and w_AIP=t⁻¹. Source: AIP-adic §8.4, pp.36–37, ordinary Katz–Hida restriction and expansions, together with the classical expansion of AutomorphicBundles B5. The construction on the p-level analytic family is a target here; an assertion about algebraic weights alone does not supply it.

Prove injectivity of family expansions under the following explicit coverage hypotheses: chosen cusp lifts meet every connected ordinary component at the actual finite Igusa level, the relevant analytic coefficient components are normal, and their ordinary loci are dense. Vanishing of all these expansions forces the section to vanish. The proof uses the finite Igusa componentwise expansion theorem, completed character descent, and analytic continuation from the dense ordinary locus. Prove the constant-term cuspidality criterion: with the same component coverage and all relevant boundary cusps, all constant terms vanish precisely for cusp forms. Prove expansion compatibility of the AIP comparison: evaluation under the independent comparison gives the same coefficient-line-valued expansion, including the finite character and pairing twist. Source: AIP-adic Proposition 8.4 and the following paragraph, p.37, supplemented by the stated componentwise extension of the classical principle. Counting connected components only on the base is not sufficient to assert coverage at an Igusa cover.

The basic theory of these definitions has the following interfaces.

- For family q-expansions, retain the exponent lattice, support cone and coefficient line, and prove the inverse-character frame transformation and positive-unit equivariance.
- For expansion maps, prove compatibility with radius, level, weight, algebraic specialization and common fan refinement.
- For covered normal components with dense ordinary loci, prove expansion injectivity and constant-term cuspidality, and compare expansions under the independent AIP coefficient isomorphism.

**Checks.**

- The family Hilbert q-expansion of 1 at trivial weight is 1; of a local q-parameter is q. Their constant terms distinguish full and cusp forms.
- Replacing a chosen frame by λ changes the coefficient coordinate by κ(λ)⁻¹. At κ=x,p=5,λ=2 this is 1/2. An intrinsic scalar-valued expansion without a coefficient-line choice would fail this transformation.
- At an algebraic weight the expansion specializes to the classical one, while a finite-character twist changes its Igusa transformation. Omitting that finite factor gives the wrong family even if the algebraic powers agree.
- If cusp lifts miss a connected Igusa component, the stated injectivity proof cannot detect functions supported on that component. This identifies a missing coverage hypothesis; it is not a claim that every such function is automatically a section of the chosen weight equalizer.

*Needs:* §§4.3, 5.4 and 6.1; AutomorphicBundles B5 for Tate charts and classical coefficient-line expansions; the stated finite Igusa component coverage, normality and density for injectivity.

### 6.6 Cuspidal Banach modules and compact restrictions

For an admissible open affinoid U in arithmetic weight space, a common analytic character stage n_an, finite wild level, and sufficiently small positive partial Hasse radii 0<v_i<1/p^(n_an), construct the cuspidal Hilbert Banach module over U at radii v. Use cofinal global-Hasse minimal affinoid neighborhoods inside the partial-Hasse region, with the actual toroidal pushforward of the cuspidal coefficient. Prove property (Pr) for the cuspidal Hilbert Banach module and surjectivity of field-point specialization at coefficient-field points. Property (Pr) means a continuous direct summand of an orthonormalizable Banach module, not finite projectivity as an algebraic module. Sources: AIP-cusp Lemma 3.21, p.21, Propositions 3.22–3.23, pp.21–22, Corollary 3.24, p.22, and Theorem 4.4, p.28; AIP-adic Corollary 8.3, p.36. The use of a global-Hasse affinoid neighborhood is essential: the footnote to the proof of Proposition 3.22 does not establish that every partial-Hasse region is affinoid.

Prove weight base change for cuspidal Banach modules for a bounded family obtained by completed extension from such a weight affinoid, under flatness or the specific cohomology/base-change hypotheses guaranteeing that the Čech resolution and cuspidal pushforward commute with that extension. This is the additional adapter needed for an arbitrary smooth bounded weight map; pointwise specialisation or property (Pr) alone does not give all base changes.

Define cuspidal radius restriction from the wider positive neighborhood to a strictly contained cofinal neighborhood, retaining relative compactness over U. Prove complete continuity of strict cuspidal restriction by local analytic restriction, finite-rank approximation and the finite coherent pushforward, then by passing to its Banach direct summand. Its API has identity/composition maps, coefficient specialization and compatibility with cuspidal Hecke maps. Sources: AIP-cusp Corollary 3.24, p.22, and Lemma 3.27, p.24; the local analytic restriction theorem is supplied by LocallyAnalyticDistributions. Source and target must both be the finite-level positive-radius Banach modules just constructed.

The basic theory of these definitions has the following interfaces.

- For the finite-level cuspidal Banach module over the admitted open weight affinoid, prove property (Pr) and the stated field-point specialization surjectivity.
- For bounded smooth family base change, prove the completed-extension comparison under the stated flatness or cohomology/base-change hypotheses.
- For cuspidal radius restriction, prove identity and composition, coefficient specialization and Hecke compatibility; under strict relative containment prove complete continuity by finite-rank approximation.

**Checks.**

- The cuspidal Hilbert Banach module over a point is the usual cuspidal Banach space, and its zero subspace is allowed. Property (Pr) permits infinitely many orthonormal coordinates; it is not the assertion of finite dimension.
- A field-point specialization is surjective under the cohomological hypotheses. A nonflat integral specialization is not covered by this rational Banach assertion.
- The cuspidal radius restriction in a normalized analytic coordinate sends Σa_nT^n to Σa_nρ^nT^n for a strict contraction |ρ|<1; truncations tend to it in operator norm. At |ρ|=1, coefficient tails need not tend uniformly to zero, so the same compactness proof fails.
- Infinite wild level, ε=0 and a noncompact inclusion outside the cofinal affinoid system are not inputs to this theorem. Taking the identity radius map does not make it completely continuous on an infinite-dimensional module.

**Further Banach and restriction checks.**

- For cuspidal Hilbert Banach module, an orthonormalizable free module satisfies (Pr), as does its continuous direct summand. This does not mean a Banach module with a countable orthonormal basis is finite projective as an algebraic module.
- At a field-valued point of an admitted open weight affinoid, cuspidal Hilbert Banach module specializes onto the cusp space of that weight. An arbitrary closed weight subspace or nonflat integral reduction does not meet the stated specialization theorem.
- The zero coefficient gives zero cuspidal Hilbert Banach module, and the trivial coefficient with nonempty boundary still imposes the cusp condition. Replacing it by all bounded functions would admit the constant 1 and fail this test.
- For cuspidal radius restriction, an identity radius change gives the identity map, but it is not asserted completely continuous on an infinite-dimensional Banach module. The compactness theorem requires strict relative containment.
- For cuspidal radius restriction on a local one-variable analytic chart from radius R to r<R, the degree-j monomial has restriction bound (r/R)^j. The tail tends to zero, giving the finite-rank approximation; at r=R it does not.
- Two cuspidal radius restriction maps compose to the direct restriction, preserving vanishing of the boundary constant term. The map on the full infinite wild-level section module is not covered by the finite-level Banach theorem.

*Needs:* §§5.4 and 6.1–6.2; cofinal global-Hasse minimal affinoids; LocallyAnalyticDistributions Layers 0 and 4 for strict analytic restriction; the stated cohomology/base-change conditions for smooth family extension.

### 6.7 A controlling operator and integral renormalization

Define Hilbert controlling operator on arithmetic class forms as the commuting product ∏_(pfr|p)U_pfr^(e_pfr), including the supplied polarization transports. Prove the controlling-operator factorization through restriction from the v-neighborhood to the cofinal v/p-neighborhood followed by bounded correspondences, in the actual partial-radius order; this is the map S(v)→S(v/p)→S(v). Prove complete continuity of the controlling operator on the cusp Banach modules. Individual U_pfr need not be compact in all p-directions. Sources: AIP-cusp Lemma 3.27, p.24, and Theorem 4.4, p.28, with polarization transport in Lemma 4.5, p.28; BHW §10.4, pp.1791–1792. Since ∑e_pfr f_pfr=d, the product trace normalization is p^(−d). This finite-slope input is available regardless of whether an eigenvalue is ordinary.

Prove integrality of the renormalized partial operator: q_pfr U_pfr preserves the integral cusp lattice, and integrality of the renormalized controlling operator: p^d times the controlling operator preserves it, on the stated admitted domains. This is a sufficient denominator bound obtained from the integral coefficient maps and traces; no optimal bound or unrenormalized integral stability is asserted. Source: BHW Lemma 10.3 and §10.4. Ordinary projectors and slope decompositions are consumers of this input, as specified in the ownership section.

The basic theory of these definitions has the following interfaces.

- For the controlling product, prove compatibility of all partial operators and polarization transports and its factorization through the cofinal v/p-neighborhood.
- On the finite-level cusp Banach modules, prove complete continuity of that product using strict restriction in every p-direction.
- For integral cusp lattices, prove that q_pfr times each partial operator and pᵈ times the controlling product preserve the lattice, with ∑e_pfr f_pfr=d giving the denominator.

**Checks.**

- For Hilbert controlling operator, F=ℚ gives the usual U_p with normalization p⁻¹. A split quadratic field gives the product of its two partial operators and normalization p⁻².
- For a totally ramified extension of degree d, the product is U_pfr^d, not one copy of U_pfr, and has normalization p⁻ᵈ. This detects omitting ramification exponents.
- At weight zero the product sends 1 to 1 on full forms; on cusp forms the constant 1 is absent when the boundary is nonempty. The compactness statement uses cusp modules and a strict radius improvement, not this constant calculation.
- q_pfr U_pfr and p^d U are integral even when dividing the trace by q_pfr is not. In characteristic p the normalized division is unavailable; only the special-fibre integral maps before division can be considered.

*Needs:* §§4.4 and 6.3–6.6; the commuting partial correspondences and integral traces; the ramification identity ∑e_pfr f_pfr=d.

### Examples

For a prime tame ideal of norm 2 away from p, the normalized operator on constants is 3/2. For a wild prime the corresponding degree equals the denominator, and the constant is 1. For a tame prime-square ideal the degree and norm are different again. These computations fix the normalizations before invoking compactness. The compact controlling operator uses every p-direction, while partial operators remain useful as bounded correspondences and in finite-slope data.

### Dependencies

Layers 0–5, toroidal boundary and minimal models, actual isogeny correspondences and trace maps, family cohomological vanishing and analytic restriction. The all-degree vanishing theorem, Igusa-component coverage and global-Hasse affinoid choice are required inputs to the Banach and expansion results.

## Layer 7: completed ordinary Igusa forms at each wild level

### 7.1 Complete the torsion-level functions before inverting p

On each actual tame ordinary formal affine patch with finite Igusa levels IG_i, define integral completed tame ordinary functions by the p-adically complete ring

```text
V_tame⁺ = lim_m colim_i H⁰(IG_i, O/p^m),       V_tame = V_tame⁺[1/p].
```

Define rational completed ordinary functions by the second expression, and sheafify the affine construction on the ordinary formal site. Prove projection for integral completed ordinary functions, completeness, separatedness, torsion freeness in the torsion-free model setting, and action for rational completed ordinary functions. The action and restriction maps are obtained compatibly at torsion levels before taking the limit. For a nonaffine open, use the sheaf or a compatible Čech construction; do not replace it with a global colimit identity that would require a separate acyclicity theorem. Sources: BHW Proposition 6.6 and its proof, p.1758, for the Igusa formal-model argument, and AIP-adic §8.4, p.37, on the ordinary Katz–Hida interpretation. The required algebraic limit operations are supplied, but this geometric sheaf/completion identification is a target here.

Define the ordinary wild-level Igusa completion on the geometric ordinary good-reduction bases B_n=X^gr_(Γ₀*(p^n))(0)_a for finite n≥1, and on B_∞, their open anticanonical tilde-limit. Here B_0=X^gr(0) is the generic fibre of the ordinary formal open moduli scheme; it is distinguished from the whole ordinary locus in the analytified open variety. Write s_n:B_n→B_0 for the structural map forgetting the subgroup, and g_n:B_(n+1)→B_n for the forgetful transition; s_n g_n=s_(n+1). Pull the supplied finite Igusa torsors back by s_n, writing IG_(n,i)=B_n×_(B_0)IG_i, with their pulled-back formal models. At infinite level put IG_(∞,i)=B_∞×_(B_1)IG_(1,i). These are torsors of the dual canonical subgroup of the universal abelian object on the open bases. Their toroidal extensions and minimal coefficient pushforwards are specified separately in §7.5. Prove the Cartesian transition squares, their group equivariance and the identity/composition laws. The underlying anticanonical limit and its Frobenius models are supplied by PerfectoidShimuraVarieties §§1.13–1.14 and 5.4–5.10, and the Igusa torsors by HodgeTateAndCanonicalSubgroups §5.1. The ordinary coefficient completion on these supplied objects is the target here.

On compatible formal affine charts set R_(n,i)=H⁰(IG_(n,i),O). Define the level-indexed integral and rational ordinary function sheaves, sheafifying as above, by

```text
V_n⁺ = lim_m colim_i R_(n,i)/p^m,                 V_n = V_n⁺[1/p],
V_∞⁺ = lim_m colim_(n≥1,i) R_(n,i)/p^m,           V_∞ = V_∞⁺[1/p].
```

All direct-limit arrows are pullbacks along the actual Igusa and wild-level maps. The infinite-level definition completes in both indices before inverting p. Prove that it agrees with first completing the wild-level rings on IG_(∞,i), then the Igusa torsion colimit, under the finite étale approximation and integral-model comparisons of §7.3. At level zero use B_0=X^gr(0) and define V_0 by transporting V_1 along AL₁:B_1≃B_0, including its integral version. This restricts the level-zero convention of §2.1 to the good-reduction locus. The level-zero definition retains the transported coefficient torsor and its actual differential-frame maps for the ordinary AIP comparison of §7.4; equality of base spaces alone does not identify coefficient trivializations.

Use the supplied ordinary Atkin–Lehner transition diagram

```text
AL_n ∘ g_n = F ∘ AL_(n+1) : B_(n+1) → B_0       (n≥1),
```

where F is quotient by the level-one canonical subgroup, with the supplied polarization and pairing transports. Thus transporting all B_n to the tame base retains Frobenius transitions. Transport IG_(n,i) and its coefficient frames along the same AL_n; do not replace those transported torsors by a fixed tame torsor with identity transitions. At infinity the ordinary target is over B_∞; the finite AL_n do not give an AL_∞ isomorphism to the fixed tame base. Sources: HodgeTateAndCanonicalSubgroups §4.6; PerfectoidShimuraVarieties §§1.13–1.14; BHW §5.2, Theorem 5.11 and Lemma 5.12 with their proofs, pp.1746–1748, for the anticanonical Frobenius models, and the cusp calculation in Lemma 3.8, pp.1726–1727.

The basic theory of these definitions has the following interfaces.

- For integral completed ordinary functions on an actual formal affine patch, prove compatible torsion projections, p-adic completeness and separatedness, and torsion freeness in the stated torsion-free setting.
- For rational completed ordinary functions at each level, localize the completed integral object at p and construct its continuous local-group action from the torsion stages.
- For the ordinary wild-level Igusa completion, construct its structural pullbacks and Cartesian Igusa transitions, prove compatibility with the supplied AL_n/Frobenius diagram, and compare the double-index completion with the actual torsor over B_∞ under §7.3's hypotheses.
- For both sheaves, prove restriction and action composition through the affine construction and its sheafification, using a Čech description on nonaffine opens.

**Checks.**

- For integral completed ordinary functions, a constant tower of a p-adically complete ring R gives R. Before inverting p, a tower of integral lattices is not the same object as its rational function ring.
- For the finite sets ℤ/p^iℤ, lim_m colim_i Maps(ℤ/p^iℤ,ℤ/p^mℤ) is C(ℤₚ,ℤₚ). The function x↦x is included: modulo p^m it factors through level m.
- That function does not belong to colim_i Maps(ℤ/p^iℤ,ℤₚ), since it is not locally constant. This computes the failure of interchanging the two limits.
- On a non-quasi-compact disjoint union, functions can require levels increasing from component to component. Sheafification handles this; one uniform global level need not exist.
- The rational completed ordinary functions of ℤₚ is ℚₚ, while its plus part remains ℤₚ. For a zero ring the constructions give the zero ring; no nonempty-tower multiplicity theorem is inferred in that case.

**Further completed-function checks.**

- The integral completed ordinary functions for a constant complete torsion-free ring R_i=R is R. For the tower of locally constant functions on ℤ/p^iℤ, the identity function x↦x is present after the prescribed torsion-level completion although no single integral finite stage contains it.
- Projections of integral completed ordinary functions modulo p^m are compatible in m. An unrelated function at each precision does not define an inverse-limit element, and p-adic separatedness discards a putative element zero at every precision.
- On a nonzero torsion-free ordinary patch, integral completed ordinary functions contains p as a nonzero element, and p is not invertible in the power-bounded ring. Starting with the rational rings would make the quotients by p^m zero and fail this check.
- The rational completed ordinary functions for a constant R is R[1/p]; p has an inverse there. This distinguishes the rational object from its integral lattice, including on a one-point patch over a DVR.
- For rational completed ordinary functions, an element has a uniformly bounded denominator p^a across its compatible completed integral data. Allowing denominators to grow with m is not its definition by localization after the inverse limit.
- The local action on rational completed ordinary functions carries x↦x on the additive test tower to its translated function, rather than fixing every completed function as though it factored through the trivial quotient. Zero and constants transform as prescribed by that tower action.

**Wild-level checks.**

- On the split modular toroidal extension in §7.5, write q_n=q^(1/p^n) relative to the structural tame parameter q. The transition pulls q_n back to q_(n+1)^p. For p=2 this is q_1=q_2² and q=q_1²; for p=3 it is q_1=q_2³. The double-index completion contains every q_n, while the fixed tame split-Igusa invariant ring has integral q-exponents.
- In the latter tame ring, a nonzero f with f^p=q would have p·ord_q(f)=1, impossible for ord_q(f)∈ℤ. At infinity q_1^p=q holds with ord_q(q_1)=1/p. Completing only the Igusa index fails this check even at κ=1.
- In AL coordinates r_n on B_n, g_n pulls r_n back to r_(n+1)^p, so AL_n g_n and F AL_(n+1) both pull the tame coordinate r back to r_(n+1)^p. Replacing F by the identity gives r_(n+1), which differs. At ε=0 the radius scaling p^nε is still 0.
- For a constant wild system R_(n,i)=R_i with identity maps, V_∞⁺ is the original Igusa completion. For the genuine root tower at p=2 it contains q^(1/4) as well as q^(1/2); adjoining only one root fails at the next level. Constants 0 and 1 persist under all pullbacks.

*Needs:* the actual finite ordinary Igusa covers and finite étale formal models of HodgeTateAndCanonicalSubgroups §5.1; its §4.6 for AL_n and canonical-quotient transitions; PerfectoidShimuraVarieties §§1.13–1.14 and 5.4–5.10 for the supplied anticanonical limit and models; CompletedCohomologyPartII Layers 1–3 for ordered torsion colimits, completion and actions; formal affine and Čech sheafification.

### 7.2 Weighted ordinary equalizers

For n≥1 and n=∞, define the integral weighted ordinary form sheaf V_(n,κ)⁺ as the κ⁻¹-equalizer for the Oₚ^× action on V_n⁺ with the stated completed weight coefficients, and define V_(n,κ) using V_n. Its ordinary form module is H⁰ on the level-n ordinary base times the bounded weight space. At n=0 transport the weighted sheaf at n=1 by AL₁, as in §7.1; its coefficient torsor is the transported one. Construct wild-level pullbacks V_(n,κ)→(g_n)_*V_(n+1,κ) and maps to level ∞ from the Cartesian Igusa diagrams, with integral maps under the actual model comparison. Thus the codomain of an infinite wild-level form is V_(∞,κ) on B_∞. Define arithmetic ordinary forms by the same independent intermediate/full arithmetic relations, finite Δ(N)-descent and Weil-pairing twist as Layer 4. Their APIs are the section criterion for rational weighted ordinary form module, integral inclusion, weight pullback, level maps and arithmetic comparison. Weight extension and completed coefficient tensors use the actual site and integral base-change hypotheses, not an interchange of infinite equalizers with arbitrary tensor products. Sources: BHW Proposition 6.6 and its proof, p.1758, for the Igusa formal-model argument, and §9.1; AIP-adic §8.4, p.37.

The basic theory of these definitions has the following interfaces.

- For integral and rational weighted ordinary forms, prove their inverse-character section criteria, the integral inclusion and the actual completed coefficient construction.
- For weight and wild-level maps, prove naturality, identity and composition under the stated coefficient and integral base-change hypotheses; retain the transported Frobenius transitions under AL_n.
- For arithmetic ordinary forms, prove the independent arithmetic presentation comparisons using finite polarization descent and the Weil-pairing twist after completion.

**Checks.**

- The integral weighted ordinary form module at κ=1 is the invariant completed integral ring, not all functions on the Igusa torsor. For a trivial torsor, evaluation at a section gives its base ring.
- For a character line, translating a chosen generator by u multiplies its coordinate by κ(u)⁻¹. At κ=x,u=2,p=5 the value is 1/2; this is the same inverse as in the positive-radius coefficient.
- A finite-character weight of conductor p^a cannot be forced into a shallower finite Igusa level before completion. The completed sheaf can realize the character through sufficiently deep stages.
- The arithmetic pairing twist survives completion. Replacing arithmetic ordinary forms by the untwisted geometric invariant ring loses the determinant character when w is nontrivial.

**Further weighted ordinary checks.**

- For integral weighted ordinary form module, κ=1 on a split torsor is the base bounded-function ring; the constant p⁻¹ is outside it on a nonzero bounded patch. The zero section is present at every weight.
- A translation by u with κ(u)=ζ of order three multiplies integral weighted ordinary form module coordinates by ζ⁻¹, detecting the inverse even when a sign test would not. Both ζ and its inverse preserve the lattice.
- For rational weighted ordinary form module, a split torsor and a unit character identify the rational module with the base rational functions by evaluation at the chosen section. Choosing a different section changes this trivialization by κ(u)⁻¹.
- The rational weighted ordinary form module at κ=1 consists of descended invariant functions, whereas a nontrivial finite character requires its actual deeper Igusa-level relation. Completion does not erase that character.
- The rational weighted ordinary form module allows p⁻¹ times an integral weighted section, but its lattice integral weighted ordinary form module need not contain that multiple. An arithmetic determinant twist remains in the relation on both modules after rationalization.

*Needs:* §§0.2–0.3 and 7.1, including its level-indexed torsors and structural/AL_n transitions; §§4.1–4.3 for arithmetic descent; the stated completed coefficient and integral base-change hypotheses.

### 7.3 The analytic completion comparison

Prove the ordinary Igusa completion comparison on each open ordinary patch of B_n under explicit model hypotheses. The toroidal and minimal boundary comparisons are the separate targets of §7.5; no smoothness or torsor assertion on C_n is an input here. On B_n at each finite wild level start with the genuine open ordinary Rapoport formal model, the pulled-back finite étale surjective Igusa covers and torsion-free complete rings R_(n,i). Use the formally smooth model over a discrete valuation base for the discrete-base unit-ball argument. After extension to a nondiscrete perfectoid base, prove the ordinary power-bounded model comparison R_(n,i)=A_(n,i)° for these actual charts, and verify that both Igusa and wild-level inclusions are isometric. The integral comparison is an obligation on the chosen models, not an automatic consequence of finite étaleness after arbitrary base change. For fixed finite n let A_(n,Ig∞) be the separated spectral completion of colim_i A_(n,i); let A_(∞,Ig∞) be the separated spectral completion of colim_(n,i) A_(n,i). Identify them with functions on the actual analytic Igusa torsors over B_n and B_∞, respectively, using the supplied anticanonical tilde-limit and finite étale base change. Then prove

```text
V_n⁺ ≃ A_(n,Ig∞)°,          V_n ≃ A_(n,Ig∞)             (finite n≥1),
V_∞⁺ ≃ A_(∞,Ig∞)°,          V_∞ ≃ A_(∞,Ig∞).
```

Prove isometry of these ordinary Igusa completion comparisons, restriction naturality and local-group equivariance, then sheafify. In particular, at each torsion precision m prove that functions on IG_(∞,i) descend to some finite wild stage locally after increasing that stage, and identify their completed integral rings with lim_m colim_n R_(n,i)/p^m. This supplies the comparison between the double-index construction and completion of the pulled-back Igusa tower on B_∞; it does not assert that every analytic function at infinite wild level descends before completion. Use §7.1's AL₁ transport for n=0. The proof compares the p^m neighborhoods with the spectral unit balls and proves density before completion. Neither an assertion that IG∞ is automatically perfectoid nor the generic fibre of an unspecified formal limit suffices. Sources: BHW Proposition 6.6 and its proof, p.1758, for the Igusa formal-model argument; AIP-adic §8.4, p.37, for the Katz–Hida ordinary interpretation; Heuer Proposition 3.8, p.15, for descent from a formal unit cocycle. The exact integral-model comparison after nondiscrete base extension is a named additional target the ordinary power-bounded model comparison; it is not a consequence of reducedness of a special fibre.

In particular O_(C_p)/p is not reduced: an element with valuation strictly between 0 and 1 can be nonzero modulo p and nilpotent. Thus the discrete-base criterion using a reduced special fibre cannot be applied without change after extension to O_(C_p). Prove the weighted ordinary lattice comparison separately at every n, including ∞, for the weighted integral equalizer and any completed tensor lattice claimed to model it. This includes compatibility with finite-character generators and formal cocycle reduction modulo each p^m. Source: the hypotheses and method of Heuer Proposition 3.8, not a blanket equality between geometric O⁺ and a completed lattice tensor.

**Completion comparison checks.**

- On a constant compatible chart R_(n,i)=O_L, the integral and rational comparisons are O_L≃O_L and L≃L. The element p⁻¹ has norm p>1 and occurs only on the rational side.
- On a split modular toroidal cusp as in §7.5, q_1 has q-order 1/p on both sides of the infinite-level comparison and satisfies q_1^p=q. Mapping it to the tame ring would require the impossible integer order 1/p; hence that ring is not this comparison's codomain.
- On that toroidal cusp let q_0=q and f=∑_(j≥0)p^j q_j. Its reduction modulo p^m is represented by ∑_(j<m)p^j q_j at a finite wild level, whereas f has unbounded p-power denominators in its exponents and belongs to no finite wild-level function ring. Both completions contain f; the comparison and ordinary restriction at ∞ retain it without finite-level descent before reduction.
- For x∈O_(C_p) with v_p(x)=1/2, its class modulo p is nonzero and has square zero. Thus reduced-special-fibre reasoning after this base extension fails, whereas the specified power-bounded model comparison must be proved on the actual rings. No reducedness of O_(C_p)/p is used.

*Needs:* §7.1; the formally smooth discrete-base ordinary model and isometric analytic inclusions in both indices; PerfectoidShimuraVarieties §§1.13–1.14 and 5.4–5.10 for the supplied limit and its integral charts; the power-bounded model comparison after nondiscrete base change proved in this subsection; §1.3 for formal-unit descent and §5.3 for finite-character frames.

### 7.4 Restriction from positive radii

Define level-indexed ordinary restriction res_(n,ε):M_(κ,n,ε)→H⁰(B_n×U,V_(n,κ)) for every admitted positive radius and n∈ℕ∪{∞}, by restricting to the open ordinary locus of that same wild level, evaluating on its actual Igusa torsor and using §7.3's completion comparison. At n=0 use AL₁ transport on both source and target. At n=∞ use the torsor over B_∞ and the double-index completion, so arbitrary sections at infinite wild level are included without a finite-stage descent assumption. Prove independence of the positive-radius representative, giving the map from overconvergent to ordinary forms, and its integral, cuspidal, finite/infinite-level and bounded-weight compatibility. Prove the ordinary AIP comparison by the independent ordinary AIP formal construction, formal unit-cocycle effectivity, the ordinary power-bounded model comparison and the weighted ordinary lattice comparison. Retain the arithmetic finite-group descent and pairing throughout. Boundary restriction and the compactified cuspidal map use §7.5, rather than a torsor on a minimal cusp. Sources: BHW Proposition 6.6 and its proof, p.1758, for the Igusa formal-model argument; AIP-adic §8.4, p.37; Heuer Proposition 3.8, p.15. No surjectivity from all ordinary forms to positive-radius forms, no ordinary control theorem and no finite-slope classicality assertion is part of this comparison.

Prove Hecke compatibility of ordinary restriction and expansion compatibility of ordinary restriction for the actual normalized correspondences and coefficient-line-valued expansions of Layer 6. Include diamond and polarization transport compatibility. Evaluation and trace commute on finite correspondences, then the maps are passed through completion and the weight equalizer with their stated continuity hypotheses. For each wild transition g_n and common admitted radius, prove the diagram g_n^* res_(n,ε)=res_(n+1,ε) g_n^*, and the corresponding identity with the projection from B_∞. Under AL_n the base diagram is AL_n g_n=F AL_(n+1), with the transported coefficient-torsor maps of §7.1. For an integral correspondence C with projections a:C→B_n and b:C→B_n′, prove res a^*=a_ord^* res and res Tr_b=Tr_(b_ord) res on the pulled-back torsors modulo every p^m, whenever the integral trace exists; then complete and apply the weight equalizer. For the normalized operators b_!a^* of Layer 6, retain their specified rational trace factors, and use integral renormalization only with §6.7's lattice theorem. These diagrams identify geometric restriction, including at ∞; they define no trace from arbitrary infinite-level forms into fixed tame-level functions. Sources: BHW Proposition 10.8, pp.1791–1792, and Proposition 6.6, p.1758; AIP-adic §§8.4–8.5, pp.37–38.

The basic theory of these definitions has the following interfaces.

- For ordinary restriction at each positive radius and each wild level, preserve the weight equalizer and integral lattice under the actual model comparisons, with codomain on that same open ordinary base; the boundary-kernel map is the toroidal map of §7.5.
- For the induced overconvergent-to-ordinary map, prove independence of representatives and finite/infinite-level and bounded-weight compatibility.
- For ordinary restriction and the independent ordinary AIP comparison, prove compatibility with normalized Hecke operators, expansions, diamonds and polarization transports through the specified torsion-level diagrams.

**Ordinary restriction checks.**

- The ordinary restriction at trivial weight is actual evaluation/restriction of functions on the ordinary tower and fixes the constant 1. At a nontrivial weight it retains the inverse character and does not become the untwisted restriction of base scalars.
- An integral section of norm at most one has ordinary restriction in the bounded weighted lattice under the stated model comparisons. Multiplication by p⁻¹ gives a rational section and need not preserve that lattice.
- Two positive-radius representatives equal after further positive restriction have the same ordinary restriction; thus the map factors through the colimit. A bounded ordinary function without a positive-radius extension has no preimage supplied by this assertion.
- On the modular toroidal cusp of §7.5 at κ=1, the toroidal extension of res_(∞,ε) sends q_1 to q_1 and its p-th power is the image q in V_(∞,1)^tor. For a finite transition, both routes send q_n to q_(n+1)^p; a map into the fixed tame equalizer would fail the first equality.
- For a two-sheet split finite correspondence, trace of (1,1) is 2, and restricting before or after tracing gives 2. If the normalization divides by 2 at p=2, the rational normalized value is 1; that division is not multiplication by an integral unit. This distinguishes geometric restriction from normalized trace and tests the torsion diagram before rational normalization.

*Needs:* §§3.2–3.3 and 7.1–7.3; §§4.1–4.3 for arithmetic transport; §§5.1–5.4 and 1.3 for the independent ordinary AIP comparison; §§6.3–6.5 for correspondence and expansion compatibility.

### 7.5 Toroidal extension and ordinary minimal coefficients

At finite n use compatible ordinary toroidal models T_n and normal minimal models C_n, with the formal-interior inclusion j_n:B_n→T_n and proper contraction γ_n:T_n→C_n, restricting to the identity on B_n. The generic fibre of a formal open is smaller than the complement of the analytic boundary: the latter also contains boundary-specializing abelian points. T_n retains those points as well as the boundary. Choose admissible fans compatible with the level maps, and use common refinements for correspondences and Atkin–Lehner transport. At n=0 use §7.1’s AL₁ transport of the bases and coefficient frames. At n=∞ use the supplied toroidal tower diamond T_∞, minimal anticanonical limit C_∞ and their induced contraction; no smooth formal model of C_∞ is asserted. The toroidal semiabelian family, its one-motive boundary charts and the finite ordinary Igusa torsors f_(n,i):IG^tor_(n,i)→T_n are the geometric inputs. Restricting them along j_n recovers §7.1's open data; at infinity pull the finite Igusa torsors to T_∞. They are not asserted to descend to finite étale torsors on C_n. Sources: BHW Remark 6.9, p.1759 (bhw line 1933); AIP-cusp §3.6, manuscript pp.19–20 (aip-cusp line 785 and line 801).

Define toroidal completed ordinary functions V_n^tor,+ and V_n^tor by the torsion-first formulas of §7.1 on these actual toroidal Igusa covers. At ∞ retain colim_(n,i) before p-adic completion and rationalization. Define the toroidal weighted sheaves V_(n,κ)^tor,+ and V_(n,κ)^tor by §7.2's inverse-character relation on the semiabelian differential frames. Define the toroidal cuspidal subsheaf K_(n,κ)^tor as the kernel of restriction to the reduced toroidal boundary D_n, and its integral version inside V_(n,κ)^tor,+. Prove their open restrictions agree with §§7.1–7.4, their coefficient-frame identifications with the ordinary AIP construction, and their integral spectral-unit-ball comparisons on actual toroidal charts. The discrete-base argument is used only on charts verified formally smooth; ramified primes and p=2 retain the supplied unsplit one-motive and ordinary lattice comparisons. None of these arguments applies a smooth-model criterion to a contracted minimal cusp. Sources: BHW Proposition 6.6 and Remark 6.9, pp.1758–1759 (bhw line 1915); AIP-adic §8.4, p.37 (aip-adic line 1515 and line 1524).

In weighted formulas the contraction means γ_n×id_U on the product with the bounded weight space. Define minimal weighted ordinary coefficients by W_(n,κ)=γ_(n,*)V_(n,κ)^tor and W_(n,κ)⁺=γ_(n,*)V_(n,κ)^tor,+; define their cuspidal subsheaves by pushing forward the corresponding K_(n,κ)^tor. These definitions apply also at ∞ on the tower sites. On a minimal formal open W, sections mean sections over γ_n⁻¹(W), using its compatible toroidal Čech description. At finite n, define the torsion structural algebras E_(n,i,m)=γ_(n,*)f_(n,i,*)(O_(IG^tor_(n,i))/p^m), where the quotient is taken on the Igusa source before either pushforward. Construct their restriction, Igusa and wild-level maps before taking limits; for ∞ use the compatible finite-level opens of the minimal tower. No Cartesian base-change identity for a completed minimal pushforward is implicit in this construction.

Prove the ordinary boundary completion comparison: the sheafified lim_m colim_i E_(n,i,m), and its double-index version at ∞, agree with γ_(n,*)V_n^tor,+ and γ_(∞,*)V_∞^tor,+ respectively. Prove their rational and weighted versions, including comparison of the independently formed weighted integral lattices, under §§1.3, 3.1 and 7.3's formal-cocycle and completed-coefficient hypotheses. On finite noetherian models use coherent formal functions for γ_n and the finite Igusa structural modules; prove continuity of sections for the filtered torsion systems on quasi-compact quasi-separated inverse images, and compatibility at every p^m in both indices, before identifying the completed sheaves. Any cohomological limit identification also requires the degreewise Mittag-Leffler hypotheses, rather than completeness of sections alone. This is a comparison target, not an assumption that proper pushforward commutes with completion or with the wild-level limit. Sources: AIP-adic Proposition 8.4 and its proof, p.37 (aip-adic line 1524); AIP-cusp §3.6, manuscript p.20 (aip-cusp line 809 and line 821).

Identify the completed minimal cusp coefficients with the coefficient-valued cusp-unit invariant series on the toroidal covering charts, retaining the actual finite Igusa level, wild cusp lattice, polarization action and character on the constant coefficient. A finite normalization of an Igusa cover at a minimal cusp is used only through its structural algebra, not as a torsor or as a carrier of a universal semiabelian family. For d>1 prove that restriction of these full ordinary coefficients to B_n induces the section comparison of §6.1. On finite noetherian models use normal finite Igusa structural algebras and the codimension-two argument modulo p, then dévissage through the actual torsion exact sequences to each p^m. Prove the nondiscrete base-extension comparison separately as in §7.3; no normality of O_L/p is assumed. Pass to n=∞ by the preceding boundary completion comparison. At d=1 retain the boundary regularity condition. The minimal weighted sheaf is not asserted invertible at a cusp with nontrivial residual coefficient character. Sources: AIP-adic Proposition 8.4, p.37 (aip-adic line 1529); AIP-cusp §3.6, manuscript p.20 (aip-cusp line 805 and line 812).

Extend §7.4's ordinary restriction from the toroidal positive-radius coefficient to V_(n,κ)^tor, and from its boundary kernel to K_(n,κ)^tor, integrally under the model comparisons, for every finite n and n=∞. Push these maps to the minimal coefficients W_(n,κ), preserving the cuspidal subsheaves. Prove naturality in weights, Igusa and wild levels, independence of positive-radius representatives and compatibility with expansions, finite Δ(N)-descent and the pairing twist. On common fan refinements prove the AL_n g_n=F AL_(n+1) diagram with its actual frame maps; prove the pullback and trace diagrams of §7.4 modulo every p^m before completion, retaining Layer 6's rational normalization factors. Carry the reduced boundary ideals through the diagrams by their actual maps and §6.2's formal-function comparison; do not replace them by pullbacks of the minimal cusp ideal. Integral trace statements require that trace to exist, with integral renormalization only under §6.7. Sources: BHW Proposition 10.8, pp.1791–1792; AIP-adic §§8.3–8.5, pp.35–38 (aip-adic line 1500 and line 1536).

The basic theory of these definitions has the following interfaces.

- For toroidal completed and weighted ordinary coefficients, prove the open restriction, torsion projections, completeness, continuous action and integral/rational comparisons in both tower indices, with the actual semiabelian frames.
- For toroidal cuspidal coefficients, prove the boundary-kernel criterion, integral inclusion and compatibility with positive-radius restriction and coefficient transport.
- For the torsion structural algebras and minimal weighted coefficients, prove restriction and transition composition, the boundary completion comparison, cusp-unit invariant expansions and the stated Koecher comparison, without asserting a minimal Igusa torsor.
- For the toroidal and minimal ordinary restriction maps, prove all level, lattice, cuspidal, expansion and normalized Hecke diagrams through the torsion systems and common refinements.

**Checks.**

- At finite n when γ_n is the identity on a split modular toroidal cusp, W_(n,1)⁺ is its completed bounded-function ring. Its constant 1 remains 1, its cuspidal ideal is (q_n), and the constant term of 1+q_n is 1. Thus 1+q_n is regular but not cuspidal. With empty boundary the boundary kernel is the whole coefficient; the zero ring gives zero throughout.
- On that chart at p=2, q_1²=q and g_1^*q_1=q_2²; both restriction routes preserve these values. The section ∑_(j≥0)p^j q_j reduces modulo p^m to ∑_(j<m)p^j q_j and has no finite wild-level representative before reduction. Both toroidal and minimal completed descriptions retain it.
- At ∞ on this root chart the boundary kernel contains every q_j and is the closure of their ideal. It is not the principal ideal (q_1): at p=2, q_2/q_1=q^(−1/4) is not regular at the cusp. The boundary-kernel definition includes q_2, whereas tensoring only the level-one cusp ideal with the infinite ring misses it.
- For F=ℚ(√5), p=3 and tame level 4, η=9+4√5 has norm 81−80=1, is totally positive and η−1=4(2+√5). In 𝔽₉=𝔽₃[s]/(s²−2), η reduces to s, with s²=−1 and s⁴=1. The corresponding diagonal cusp unit fixes the minimal cusp but multiplies a dual-canonical Igusa generator by s or s⁻¹, both different from 1. The minimal finite cover therefore fails the free-action test for a torsor (inference from aip-cusp line 785 and line 801–812).
- In the same residue chart, a constant coefficient in a line with this character would satisfy a=sa; since 1−s≠0 in 𝔽₉, it is 0. The trivial-character constant 1 survives. Retaining cusp-unit invariants distinguishes these two minimal coefficients. For η≠1 and a fixed tame level, η−1 cannot lie in every p^iO_F: the intersection is 0. Smallness at a single Igusa depth is not smallness for the whole tower.
- For the torsion structural algebras with identity contraction and a split two-point cover, E_(n,i,m)=(O_L/p^m)²; a deck swap interchanges (1,0) and (0,1), while invariants are (a,a). At p=2 this calculation still holds although division by the group order is unavailable. A constant complete one-point system gives O_L after completion and L after inverting p.
- At d=1, q⁻¹ is regular on the toric open where q is invertible and has order −1 at the toroidal cusp; it is excluded from W_(n,1). For d>1 the §6.1 hypotheses, not an unrestricted punctured-disc assertion, give the full-section extension.
- On the blow-up of the quadrant at the origin, with x=u and y=uv, the pullback of the reduced boundary ideal (xy) is (u²v), whereas the reduced total toroidal boundary has ideal (uv). Their exceptional orders are 2 and 1, detecting naive boundary-ideal pullback through a refinement. The contracted origin's ideal (x,y) pulls back to (u), also different from (uv); a minimal cusp ideal does not define the toroidal boundary kernel.
- The normalized two-sheet correspondence at p=2 has trace 2 on 1 and rational normalization 2/2=1 on both toroidal and minimal descriptions. Its unnormalized torsion trace is computed before completion; multiplication by 1/2 is not an integral-unit operation. For κ=x, p=5 and frame change u=2, both weighted descriptions multiply the coordinate by 1/2, retaining the inverse character.

*Needs:* §§1.3, 3.1–3.4, 4.1–4.3, 5.1–5.4, 6.1–6.7 and 7.1–7.4 for coefficient, lattice, boundary and Hecke comparisons; HodgeTateAndCanonicalSubgroups §§4.6 and 5.1 for the canonical quotient and ordinary Igusa torsors on semiabelian/one-motive charts; ShimuraCompactifications C3.1–C3.4, C3.6a, C3.10 and C6.20–C6.47 for common refinements, proper contractions, coherent formal functions and cusp-unit geometry; AutomorphicBundles B3.Hilbert.1–3 for the ramified boundary and algebraic coefficient models; PerfectoidShimuraVarieties §0.general.1, §§1.13–1.14 and 5.4–5.10 for the tower limits and their compatible maps.

### Examples

The function x↦x on ℤₚ records information at every torsion precision but never factors through a single finite quotient as an ℤₚ-valued function. It is the basic reason to complete the torsion colimits in the displayed order. The analogous geometric statement compares the actual ordinary tower's completed functions with analytic bounded functions only after its integral models and spectral unit balls have been identified.

### Dependencies

Layers 0–6, finite ordinary Igusa covers on the open and toroidal bases and their wild-level limits, formal affine and Čech descent, the spectral completion in both tower indices, and formal unit-cocycle effectivity. Minimal coefficients use the proper toroidal pushforward and the boundary completion comparison, retaining cusp-unit invariants. The power-bounded-model and weighted-lattice comparison targets are required at each level for integral ordinary claims; the AL_n/Frobenius diagram is retained in level and Hecke compatibility on common refinements.

## Layer 8: Siegel and general toroidal analytic coefficients

### 8.1 Applying the supplied row chart and changing symplectic basis

Use the supplied row-graph chart over a commutative ring R, indexed by any finite set, including the empty set. For γ=[A,B;C,D], its factor and coordinate are J_γ(Z)=A+ZC and Zγ=J_γ(Z)⁻¹(B+ZD), on the unit-determinant locus. The row normalization, coordinate composition and ordered factor identity are the supplied row-graph action and quotient Hodge-frame transformation contracts of PerfectoidShimuraVarieties §3.4. They are prerequisites rather than new graph-geometry targets. The identity is [I,Z]γ=J_γ(Z)[I,Zγ], and for δ=[E,F;G,H] the factor for γδ is J_γ(Z)(E+(Zγ)G), in that order. All inverse-denominator uses require unit determinants. Matrix identities over a general commutative ring use units, not a division-ring convention that treats a singular matrix as invertible.

Define the antidiagonal dual factor as W(A+ZC)ᵀW over every commutative ring and finite matrix index. Prove additivity of the antidiagonal dual factor by expanding the sum, basis change for the antidiagonal dual factor under the stated reversal-basis conversion, and the ordered antidiagonal dual-factor identity, the additional convention identity for the reversal matrix W with W²=I and WZᵀW=Z:

```text
W(A+ZC)ᵀW = WAᵀW + (WCᵀW)Z.
```

The transposed lower block is before Z. It is the dual-factor dictionary, not a replacement of J by a scalar determinant. For the standard-to-antidiagonal basis change P=diag(I,W), use Z=Z_std W and (A,B,C,D)_DRW=(A,BW,WC,WDW)_std. Its factor is exactly A_std+Z_std C_std. Sources: DRW §2.3–§2.4, pp.15–17, for its form and chart convention; the corrected quotient-frame convention is supplied by PerfectoidShimuraVarieties §3.4.

The basic theory of these definitions has the following interfaces.

- For the antidiagonal dual factor, prove the expanded-sum identity over every commutative ring and finite matrix index.
- Under W²=I and WZᵀW=Z, prove the displayed ordered identity with WCᵀW before Z.
- For the standard-to-antidiagonal basis conversion, prove preservation of the actual factor A_std+Z_std C_std under the specified block changes.

**Checks.**

- At rank one W=1 and the formula is the ordinary scalar transpose identity. At rank zero all matrices and determinants have the unique empty-index values; the determinant is 1, not 0.
- With W=[0,1;1,0], Z=[0,1;0,0] and C=[0,0;3,0], WZᵀW=Z. The left side for A=I is diag(1,4), while I+Z(WCᵀW)=diag(4,1). The wrong factor order is visibly false.
- For antidiagonal dual factor, W=0 gives zero for every A,C,Z, although W=0 is not an admissible dual-frame change unless the index is empty. For the basis conversion, (ZW)(WC)=ZC since W²=I. Omitting either W changes the factor for a noncommuting pair of matrices.

*Needs:* Mathlib block matrices, transpose and determinants; PerfectoidShimuraVarieties §3.4 for the row chart, factor and quotient frame; the stated reversal-basis identities.

### 8.2 The coefficient action on a Siegel period domain

Assume g≥1, any rational prime p including 2, and fine tame level N≥3 prime to p. At p=2 choose sufficiently deep principal character neighborhoods and retain the sign component; the coefficient construction of §§8.2–8.5 uses the full tower and quotient frame at every prime. Work over C_p, retaining all Weil-pairing components of the full infinite tower. Let K be the full inverse image of the diagonal torus of GSp_(2g)(𝔽_p), so its similitude image is ℤₚ^×. This is broader than the named strict subgroup with c≡1 modulo p; a fixed-pairing fibre has only K∩ker(c) as deck group. Use the actual full-tower quotient of the supplier to form Y_w=π_HT⁻¹(Fl_w^×) and X_w=Y_w/K, w>0 rational, where each period coordinate is within p^(−w) of ℤₚ. This is a period-domain definition, independent of a canonical-subgroup theorem. A quantitative canonical/anticanonical interpretation additionally requires the quantitative Siegel canonical-range theorem, a target of this layer. For p>2g, n≥1, and a w-ordinary semiabelian scheme over O_C of dimension g with constant toric rank, if c_g+n−1<w≤n with c_g=(2g−1)p/(2g(p−1)), prove that the pseudocanonical level-n subgroup is canonical and its Hodge height is less than 1/(2p^(n−1)); This is a statement on the canonical chart, with rows [Z′,I] and coordinates near pℤₚ; the Hasse-height conclusion uses its forgetful map to the underlying abelian moduli. For the first-chart domain X_u above, use §8.5’s actual Atkin–Lehner correspondence: right multiplication by a=[0,I;−pI,0] sends [I,Z] to [−pZ,I], changes the level from K to a⁻¹Ka, and sends radius index u to the canonical index w=u+1. Apply the criterion there only when c_g+n−1<u+1≤n. Sources: DRW Remark 3.6.2, p.43, Proposition 3.6.12 and Corollary 3.6.13, pp.46–47. Use the supplied Hasse-height canonical-subgroup theorems, rather than assuming they already give this period-coordinate criterion. No uniform strict inequality follows just by replacing pointwise bounds on a non-quasi-compact domain by their supremum. Sources: DRW Definition 2.5.3, p.19; PerfectoidShimuraVarieties §§1.30, 3.4; HodgeTateAndCanonicalSubgroups §§3.6–3.8.

Prove the Siegel factor-neighborhood bound: for Z=Z₀+E, Z₀ integral, ‖E‖≤p^(−w), and γ∈K, put J₀=A+Z₀C. Then J₀∈I⁺_GLg, C∈p Mat_g(ℤₚ), and

```text
‖J−J₀‖ ≤ p^(−(w+1)),         J ∈ I⁺_GLg M_(w+1).
```

Both the factor and its transpose inverse lie in the acting neighborhood of the normalized coefficient module. Prove the corresponding analytic bound on each chart and integral determinant unit property. The estimate follows from J−J₀=EC and the strict-Iwahori block congruences, and is stronger than merely saying det J is a unit. Sources: DRW §2.1, pp.7–9, Definition 2.5.3, p.19, and Remark 3.1.15, p.25. The approximation Z₀ need not itself be a Lagrangian point: it is only used for this norm estimate.

Use the supplier's quotient Hodge frame s of O^(2g)/W_std≃ω_(A∨)≃ω_A, with γ*s=sJ. Its natural transport to W_std∨ is instead a frame of ω_A(−1) with factor c(γ)⁻¹J. The variable pairing generator transforms by c(γ) and restores the untwisted quotient-frame law only when it is included. Fixing a system of roots of unity in the coefficient field does not make the full tower action preserve that pairing generator. The frame itself, its transform and the distinction between these two linearizations are supplied by §3.4, not reproved here.

**Checks.**

- At g=1,p=2, γ=[1,0;2,1] has J=1+2Z, a unit for integral Z; at Z=1 it is 3. Omitting the dyadic coefficient branch would lose this valid denominator.
- For the quantitative Siegel canonical-range theorem at g=1,p=3,n=1, c_g=3/4: w=7/8 is admitted, while w=3/4 is excluded by the strict lower bound.
- At n=2 the same constant gives 7/4<w≤2; w=15/8 is admitted. Its first-chart source index is u=7/8, and at Z=0 the row [1,0] goes to the distinct canonical row [0,1]. At p=2,g=1 the numerical canonical-range theorem has no instance since p>2g fails, although the coefficient sheaf still exists.

*Needs:* §0.5; PerfectoidShimuraVarieties §§1.30 and 3.4 for the full tower, quotient frame and period domain; HodgeTateAndCanonicalSubgroups §§3.6–3.8 for Hasse-height canonical subgroups; §8.5 for transport between the two geometric charts.

### 8.3 Scalar and finite algebraic coefficients

Define the Siegel scalar coefficient of χ on X_w as the equalizer of analytic scalar functions on Y_w with γ*f=χ(det J_γ)⁻¹f, where χ has a specified local analytic extension on all occurring determinant factors. Define its geometric O⁺ equalizer with the two-sided valuation-unit condition. The API for the section criterion, radius maps, weight pullback and integral inclusion follows Layer 1 with the actual determinant factor. Prove determinant Hodge specialization: at χ=x^m, m∈ℤ, the rational line is (det ω)^m on X_w, with negative m interpreted by the dual line. Indeed det s transforms by det J and f(det s)^m is invariant. This applies the supplied Hodge frame; it does not introduce a second frame transformation theorem. Sources: DRW equation (5), p.20, and §3.1, pp.23–25; the quotient-frame correction is in the supplier contract.

Define the finite Siegel algebraic coefficient of ρ on X_w using an actual finite algebraic representation ρ of the Hodge Levi and its right frame torsor, with relation (qg,v)∼(q,ρ(g)v) and f(qg)=ρ(g)⁻¹f(q). Prove the finite Siegel algebraic comparison with the supplied classical automorphic bundle, retaining every extra Levi/similitude character. Tensor, dual and restriction compatibility are comparison theorems for these two constructions, not new general vector-bundle operations. Sources: AutomorphicBundles B2–B4 and DRW §3.1, pp.23–25; the factor convention is the displayed relation.

The basic theory of these definitions has the following interfaces.

- For the scalar Siegel coefficient and its geometric integral equalizer, prove the section criterion, radius and weight maps and integral inclusion on their admitted determinant-character domains.
- For every integer determinant weight, prove the Hodge determinant-line comparison with duals at negative weight.
- For finite Siegel algebraic coefficients, prove the associated-bundle comparison preserving all Levi/similitude characters and compatibility with tensor products, duals and restriction.

**Checks.**

- Siegel scalar coefficient at χ=1 is structural-function descent. At χ=x and det J=6, the coefficient multiplier is 1/6; the determinant frame multiplies by 6 and their product is invariant.
- At m=−1 the coefficient multiplier is det J, and its bundle is (det ω)⁻¹. Replacing m by −m would exchange this check with the previous one.
- The finite Siegel algebraic coefficient at rank zero is the zero bundle; at the trivial line it is O. A rank-two diagonal representation keeps two characters, while its determinant line keeps only their product.
- For γ=diag(I,uI), c(γ)=u and J=I. The quotient frame is fixed, but the naturally linearized W∨ frame changes by u⁻¹. Treating a fixed Tate trivialization as equivariant under all K fails when u≠1.

**Further finite algebraic coefficient checks.**

- For finite Siegel algebraic coefficient, a character χ of the determinant gives its determinant line, while a representation with an additional similitude character also keeps that character. The element diag(I,uI) distinguishes the extra character although J=I.
- For finite Siegel algebraic coefficient, tensoring a character line and its dual gives the trivial line. The standard rank-g Levi representation remains rank g; replacing it by its determinant would fail this rank test for g≥2.
- A finite Siegel algebraic coefficient has no unbounded collection of unipotent power-series basis vectors. The larger induced analytic representation does; confusing the finite bundle with the full induced sheaf fails the algebraic comparison.

*Needs:* §§1.1–1.2 and 8.2; AutomorphicBundles B2–B4; the actual quotient frame and the supplied similitude/Tate linearization.

### 8.4 The determinant eigenline and induced analytic sheaf

For the algebraic matrix carriers define the determinant eigenline map of χ by the S-linear map S→(GL_g(R)→S), a↦[ℓ↦aχ(det ℓ)], for commutative rings R,S and a character R^×→S^×. Prove injectivity of the determinant eigenline map by evaluation at I, and the determinant eigenline translation identity by evaluating at hᵀℓ: it multiplies this line by χ(det h). The global algebraic formula is valid only when χ is defined on R^×; the analytic geometric use evaluates the same formula on the actual Iwahori neighborhood with its local χ extension. It does not assume every local weight extends to all GL_g(C_p). Sources: DRW §3.1, pp.23–25, and the determinant/Borel relation; determinant multiplicativity itself is supplied by Mathlib.

The basic theory of these definitions has the following interfaces.

- For the determinant eigenline map on algebraic carriers, prove S-linearity, injectivity by evaluation at I, and the transpose-translation character identity.
- For rational and integral analytic Siegel sheaves, prove radius restriction, weight change, coefficient maps and integral inclusion using the normalized action and Gauss lattice.
- For determinant weights, identify the scalar coefficient as a rank-one subobject; for dominant polynomial weights prove the finite algebraic induction injection using the BP–Siegel dictionary on the same domain.

**Checks.**

- The trivial χ gives the constant function a. Evaluation at I returns a for every χ, including the zero scalar a=0, and proves injectivity without any nonvanishing hypothesis on a.
- With R=S=ℚ and χ the identity, diag(2,3) gives determinant-line value 6 at a=1. A product of diagonal characters with the wrong exponent gives a different value.
- An upper-unipotent matrix [1,7;0,1] has determinant 1 and value a. This distinguishes the determinant character from an individual matrix entry.

For a bounded smooth family of r-analytic diagonal-torus characters κ, rational w>1+r, define the Siegel analytic coefficient sheaf of κ on X_w from the normalized coefficient Cκ,w on IM_(w+1), its transpose action, the actual cover Y_w→X_w, and γ*F=ρ_D(J_γ)⁻¹F. Define integral Siegel analytic coefficient sheaf with the chartwise Gauss lattice. The APIs radius restriction for the Siegel analytic coefficient sheaf, weight change, coefficient maps and integral inclusion use the all-open completed coefficient descent from Layer 1. The quantitative factor bound of §8.2 places every J_γ in the required acting group; there is no arbitrary shrink to an unrelated smaller coefficient module. Sources: DRW Definition 3.1.10, Definition 3.1.13 and Definition 3.1.14, pp.23–25.

Prove the determinant-line sheaf injection: for κ=χ∘det, the determinant formula gives a rank-one subobject identified with Siegel scalar coefficient, not the entire induced sheaf in genus at least two. Prove the algebraic Siegel induction injection for dominant polynomial k₁≥⋯≥k_g≥0 by the supplied algebraic representation and the dictionary κ_BP=w₀(κ_D⁻¹), ρ_D(h)=ρ_BP(h^(−T)). This embeds the finite classical coefficient in the analytic coefficient on the same admitted domain. Determinant powers (m,…,m), m≥0, are special cases; negative determinant powers already belong to the finite line comparison and are not asserted polynomial. Sources: DRW §3.1 and BP §6.2.11, pp.150–151; finite algebraic coefficient conventions are supplied by AutomorphicBundles B2.

**Checks.**

- Siegel analytic coefficient sheaf at g=1 is the corresponding character line. At g=2 its coefficient has a nonconstant unipotent variable, so the determinant eigenline cannot exhaust it.
- The integral Siegel analytic coefficient sheaf uses the Gauss unit ball; a rational-point integral-valued polynomial such as (T^p−T)/p is not automatically in it. The transpose action preserves this lattice by the exact neighborhood theorem.
- The trivial-weight induced sheaf still has analytic unipotent functions in higher rank; it is not identified with O merely because its Borel weight is trivial. Its determinant-line subobject is O.
- At an algebraic polynomial weight, the finite-dimensional subrepresentation has bounded polynomial degree; a higher-degree analytic monomial lies outside it. A negative determinant exponent uses a dual line instead of the polynomial-injection theorem.

**Further analytic-sheaf lattice checks.**

- The integral Siegel analytic coefficient sheaf contains the Gauss-integral monomials in a normalized opposite-unipotent coordinate. On a unit normalized disc it excludes p⁻¹ and (T^p−T)/p; testing only ℤₚ-valued rational points would admit the latter incorrectly.
- Under restriction to a strictly smaller admitted normalized disc, integral Siegel analytic coefficient sheaf preserves its Gauss unit ball. An action outside the proved factor neighborhood is not granted lattice stability merely from a unit determinant.
- The determinant line in integral Siegel analytic coefficient sheaf is integral when its character and inverse take unit values on every acting factor. A rational determinant eigenfunction multiplied by p⁻¹ is not an integral unit frame.

*Needs:* §§0.4–0.5, 1.2 and 8.2–8.3; Mathlib determinant multiplicativity and evaluation at I; the same admitted coefficient action neighborhood.

### 8.5 Atkin–Lehner and the other graph chart

Define the Atkin–Lehner block matrix as [0,I;−qI,0] over every commutative ring R and finite matrix index. Its API is the signed block formula and the second-chart Atkin–Lehner identity. Prove the second-chart Atkin–Lehner identity over every commutative ring R, for a scalar q and a finite matrix index:

```text
[I,Z] [0,I;−qI,0] = [−qZ,I].
```

This is an identity into the second row-graph chart. It does not require Z to be invertible and does not introduce Z⁻¹. The block matrix is invertible when q is a unit; at q=p it is invertible over ℚₚ but not over ℤₚ. Construct Siegel Atkin–Lehner coefficient transport only after the actual tower correspondence and both chart domains have been supplied, using this chart change and the relevant torsor frame map. Source: DRW Remark 3.6.2, p.43; the displayed block multiplication fixes the sign and domain. A matrix identity alone is not a geometric domain or canonical-subgroup comparison.

The basic theory of these definitions has the following interfaces.

- For the Atkin–Lehner block, prove its signed block formula and [I,Z]a=[−qZ,I] for all commutative rings and finite indices.
- When q is a unit, prove invertibility of the block matrix; singular Z remains allowed because the target is the second chart.
- For the supplied geometric tower correspondence, construct coefficient transport on its actual source and second-chart target using the torsor frame map and level change.

**Checks.**

- For Atkin–Lehner block matrix, at g=1,q=2,Z=3, the row is [−6,1], fixing both the sign and the second-chart orientation.
- For Atkin–Lehner block matrix, at Z=0 the row is [0,I], a valid second-chart point even though Z has no inverse. At q=0 the algebraic identity still holds, but it gives no invertible tower action.
- For Atkin–Lehner block matrix, in characteristic 2 the minus sign equals plus, while over ℚ it is distinguished by the preceding computation. At rank zero the formula has the unique empty row-matrix interpretation.

*Needs:* Mathlib block multiplication; PerfectoidShimuraVarieties §§1.30 and 3.4 for the actual tower action and two charts; §1.2 for coefficient transport. The matrix identity itself uses no geometric or canonical-range theorem.

### 8.6 General toroidal and datum-specific analytic coefficients

For a general Shimura datum (G,X), neat level, smooth admissible cone decomposition Σ and a finite splitting field containing the reflex field, use the toroidal tower diamond and the Gʳ=G/Zᵣ(G)-torsor and its parabolic and Levi Mᵣ_μ-torsors supplied in PerfectoidShimuraVarieties §§6.1a–6.3. Define toroidal analytic coefficient on a specified v/pro-Kummer-étale coefficient site by pulling the actual Hodge–Tate torsor to its supplied analytic reduction and applying an analytic representation of that reduction. Its section-criterion API for toroidal coefficient, coefficient maps, radius restriction, level pullback and common refinement retains q_G:G→Gʳ, the quotient parabolics and Levi, and the site. All representations are trivial on Zᵣ(G). Use Gᶜ and Mᶜ_μ only after the supplied CM-split-centre identification Gʳ≃Gᶜ, retaining its quotient morphism. At finite level assert descent only in the effectivity category actually established: finite locally free coefficients, a locally trivial analytic Banach torsor, or an explicitly proved Banach-descent setting. A general infinite-rank equalizer is not asserted coherent. Sources: BP Theorem 4.4.40, pp.79–80, and §6.3.1, p.154; the geometric torsors are supplied, while their analytic representation sheaves are the target here.

Prove the toroidal algebraic comparison for a finite algebraic representation of Mᵣ_μ by comparing with the supplied canonical toroidal bundle through the Hodge–Tate/de Rham torsor identification. On the μ-central weight-j summand retain the cyclotomic factor ℚₚ(j) in the supplier's orientation: the comparison of graded local-system and de Rham pieces is Gr_j(W_p⊗Ô)(j)≃Gr^j(W_dR)⊗Ô. Apply that convention to associated bundles, rather than delete the factor after choosing roots of unity. Prove compatibility with tensor products, duals, canonical extension and level/common-cone-refinement correspondences. General G(ℚₚ) Hecke maps compare levels and cone refinements; they do not act on every fixed toroidal Σ. Sources: BP Theorem 4.4.40 and its preceding comparison, pp.79–80; PerfectoidShimuraVarieties §6.1a supplies the arbitrary-pure-data torsor comparison; HodgeTateAndCanonicalSubgroups §2.10 and §§7.29–7.30 supply its Hodge-type open and logarithmic inputs, and AutomorphicBundles supplies the canonical bundles in the stated centre regime.

Define a coefficient on a reduced period domain for any supplied datum-specific period domain with an actual analytic reduction H of the quotient Levi Mᵣ_μ and representation V by this same coefficient construction. Retain the quotient maps and central twists in every change of reduction and coefficient comparison. Prove the section criterion for this reduced-domain coefficient, change of representation, pullback, change of reduction and algebraic comparison on compatible torsor diagrams. Prove its identification with the finite algebraic automorphic bundle whenever V extends to the Levi representation and the Hodge–Tate/de Rham twist is supplied. This gives, for example, unitary period-domain coefficients when their actual reduction and domain have been constructed. It does not assert a canonical ordinary neighborhood or canonical subgroup for every Shimura datum. Sources: BP §4.4.38–§4.4.40, pp.79–80, and §6.3.1, p.154.

The basic theory of these definitions has the following interfaces.

- For toroidal analytic coefficients, prove the section criterion, coefficient maps, radius and level pullbacks and common-refinement compatibility on the specified site, retaining the Gʳ quotient and actual effectivity category.
- For finite algebraic coefficients, prove the toroidal canonical-bundle comparison with each μ-central Tate twist, respecting tensor, dual, extension and Hecke/refinement maps.
- For coefficients on a reduced period domain, prove the section criterion, change of representation, pullback and change of reduction on compatible torsor diagrams, and algebraic comparison when the representation extends with the supplied twist.

**Checks.**

- The toroidal analytic coefficient of a trivial finite line is O on the specified site; of the zero representation it is zero. A nontrivial μ-central character retains its Tate twist in the algebraic comparison.
- The coefficient on a reduced period domain on an identity torsor is the supplied coefficient-function sheaf, and on a split H-torsor is recovered by evaluation at the identity section. An arbitrary Banach representation without a stated analytic action/effectivity theorem does not supply a coherent finite-level bundle.
- For the cubic norm-one torus T=Res¹_(ℚ(∛2)/ℚ)Gₘ with trivial h, Z_s(T)=1 but Zᵣ(T)=T. Infinite-order norm-one congruence units act nontrivially on the multiplication representation of Tᶜ=T, so it cannot descend to the effective tower. Only representations of Tʳ=1 are admissible here.
- A general Shimura datum without a known perfectoid representative still has the supplied tower diamond. Replacing the diamond by an assumed perfectoid space would make this general instance unavailable.
- A Hecke element requiring a new cone decomposition is handled after common refinement, not by an asserted automorphism of the original fixed toroidal compactification.

**Further toroidal coefficient checks.**

- The toroidal analytic coefficient of a rank-two diagonal algebraic representation retains its two character lines and their separate central weights. Its determinant is only a rank-one coefficient and cannot replace it.
- Pulling toroidal analytic coefficient through two admissible cone refinements agrees with pulling through their composite. A Hecke map whose cones do not match requires the supplied common refinement before this test can be formed.
- The coefficient on a reduced period domain of zero is zero and of a finite trivial line is the structural sheaf. With a nontrivial analytic character its equivariance is inverse frame action, even on a domain lacking an ordinary interpretation.
- A change of analytic reduction induces the stated coefficient on a reduced period domain comparison only when it intertwines the actual representations and torsor maps. A datum with no chosen reduction supplies no such coefficient by fiat.
- At central weight j=1, the algebraic comparison for coefficient on a reduced period domain retains ℚₚ(1); at j=0 the factor is trivial. Choosing a basis of roots of unity does not make the first Galois-equivariant factor trivial.

*Needs:* §§0.4 and 1.1–1.2; PerfectoidShimuraVarieties §§6.1a–6.3 for quotient torsors, twists and common refinements; AutomorphicBundles B2–B3 for canonical bundles; HodgeTateAndCanonicalSubgroups §2.10 and §§7.29–7.30 for the Hodge-type inputs.

### 8.7 Bruhat-domain families in all cohomological degrees

In the quasi-split abelian-type setting, choose a finite splitting field F with a compatible reductive O_F-model, rational Borel and torus, neat tame level and toroidal Σ. For K_p=K_(p,m′,0), m′>0, w∈ᵐW and n≥0, use the supplied étale de Rham reduction M_(dR,n,Kp) on U_(w,n)=(π_HT,Kp^tor)⁻¹(]C_(w,k)[_(n,n)K_p). Its group is H=K_(p,w,Mμ)^r M_(μ,n)^r, the image under the supplied quotient maps. In the CM-split-centre regime identify this with BP's superscript-c group using Gʳ≃Gᶜ; no rank removal is performed anew over the Levi's splitting field. The precursor reduction requires 0≤m−n≤m′−1; the family uses its m=n pushout. Enlarge F so the μ-cyclotomic image lies in the reduction group, as the supplier requires. These are the actual groups and torsor of BP Propositions 4.6.9, 4.6.12 and 4.6.14, pp.92–95, rather than a guessed congruence subgroup.

For a complete finite-type Tate pair (A,A⁺)/(F,O_F) and n-analytic ν_A:Tʳ(ℤₚ)→A^×, define Bruhat coefficient family by analytic functions on that reduced de Rham torsor times Spa(A,A⁺), with

```text
κ_A = −w₀,M wν_A − (w₀,M wρ + ρ),
f(mb) = (w₀,M κ_A)(b⁻¹) f(m).
```

The weights use BP additive notation and the same positive roots. Define Bruhat distribution family using the extension to arbitrary affinoid coefficients of the bounded-open-polydisc distributions of §0.4 and the shift κ_A+2ρ_nc; equivalently retain the dual coefficient with its −2ρ_nc bundle twist as in BP §6.3.1. Prove radius maps for Bruhat coefficient family, level maps, coefficient change and radius maps for Bruhat distribution family, level maps, coefficient change, with their identity and composition laws. Prove the Bruhat algebraic coefficient injection when the resulting algebraic κ is M_μ-dominant, and the distribution comparison to V_(κ+2ρ_nc)∨ with its corresponding convention. A finite character χ of conductor b≤m′,n gives the étale twist the finite character Bruhat twist. Sources: BP §6.3.1 and Propositions 6.3.6–6.3.7, pp.154–155.

Prove local projective Banach structure for Bruhat coefficients and its distribution analogue under the actual finite-flat trivializing-cover hypotheses. In the Hodge-type pregood affinoid setting with perfect Σ, these covers are supplied by BP Proposition 4.6.15, p.95; beyond that setting they must be supplied or proved for the chosen affinoid. The rational finite group descent in the proof uses invertible group order. Then prove the Bruhat coefficient cohomology comparison: on an open that is a finite union of quasi-Stein opens, RΓ_et equals RΓ_an for both coefficient and distribution families, in all degrees, with the projective Banach derived model specified in BP Corollary 6.3.4. Sources: BP Proposition 6.3.3 and Corollary 6.3.4, p.154. No integral projectivity theorem is inferred by the same finite-group averaging argument.

The basic theory of these definitions has the following interfaces.

- For Bruhat coefficient and distribution families, construct the indicated analytic induction and shifted bounded-open-disc dual on the supplied reduction, retaining the Weyl/root correction and the arbitrary affinoid Banach norm.
- For both families, prove radius, level and coefficient-change maps with identity and composition; prove the finite-character twist under b≤min(m′,n).
- For algebraic dominant κ, prove the finite coefficient injection and the distribution comparison with V_(κ+2ρ_nc)∨ in the stated convention.
- On the actual finite-flat trivializing covers, prove local projective Banach structure; on a finite union of quasi-Stein opens prove the derived analytic/étale comparison in every degree for both families.

**Checks.**

- Over A=F[ε]/(ε²), with the quotient Banach norm and M=T, both the coefficient and distribution stages retain A of F-dimension two; ε is not killed by passage to analytic functions. Spectral reduction to F would give the wrong dimension one.
- Bruhat coefficient family at M=T has no unipotent variables but still has the full Weyl/root character shift. Setting ν=0 need not make κ=0 when the root correction is nonzero.
- At m′=1 the precursor range forces m=n; the pair m=0,n=1 is outside it. At n=0 only a genuinely 0-analytic character is admitted, rather than every continuous weight.
- Bruhat distribution family in zero unipotent dimension is the corresponding dual line with its stated shift. Removing 2ρ_nc changes the algebraic comparison when the noncompact roots are present.
- At an algebraic dominant κ the finite canonical coefficient injects, but nonalgebraic analytic functions remain in the larger family. A finite-character twist beyond min(m′,n) needs a deeper level/stage.
- The cohomology comparison includes H⁰ as well as every H^i for i>0. Local projectivity on the chosen affinoids and the finite quasi-Stein-union condition are hypotheses of the derived statement, not consequences of merely having a coefficient equalizer.

**Further Bruhat coefficient checks.**

- Bruhat coefficient family on a trivialized reduction is the analytic induction with its displayed inverse Weyl-conjugated Borel character. A nontrivial torus character therefore changes the line even when there are no unipotent variables.
- At a dominant algebraic κ, Bruhat coefficient family contains the supplied finite algebraic coefficient and also higher analytic monomials in positive unipotent dimension. Equating the whole analytic family with that finite coefficient fails this test.
- Bruhat distribution family pairs with the bounded open-polydisc analytic coefficient and has compatible moments under radius change. Independently chosen moments at successive radii do not give a locally analytic distribution.
- For Bruhat distribution family, the weight κ_A+2ρ_nc is retained under scalar extension. If ρ_nc≠0, replacing that weight by κ_A gives a different algebraic dual; if there are no noncompact roots the shift vanishes, as it should.
- For the rank-one root datum of GL₂ with its noncentral Hodge cocharacter, M=T and w₀,M=1. At ν=0, w=1 gives κ=−2ρ, whereas w=s gives κ=0. Each distribution weight adds 2ρ_nc. Substituting the full-group longest element s for w₀,M reverses these values and fails this test.

*Needs:* §0.4 including its arbitrary-affinoid norm extension; §1.2; PerfectoidShimuraVarieties §§6.12–6.15 for the actual Bruhat reductions and finite trivializing covers; §8.6 for quotient and twist conventions; the stated finite quasi-Stein-union hypothesis for derived comparison.

### Examples

The empty matrix index tests the algebraic identities but is not a genus-zero Siegel moduli claim. In genus one the inverse denominator recovers a line coefficient; in higher genus a determinant eigenline is only one subrepresentation of the induced analytic coefficient. For a general Shimura variety, the μ-central Tate twist and the change of cone decomposition remain visible even when a particular local frame makes a formula look scalar. The Bruhat family uses an explicit reduced de Rham torsor and interpolates higher-degree as well as degree-zero coefficient cohomology.

### Dependencies

Layers 0–1; supplied row-graph and quotient Hodge-frame identities, period-domain quotients and reduced torsors; classical automorphic bundles and the general Hodge–Tate/de Rham twist. The Bruhat family first uses §0.4’s defining-Banach-norm extension for nonreduced affinoid coefficients. Local projective Banach assertions also use the actual finite trivializing covers. A canonical-domain interpretation needs the quantitative Siegel canonical-range theorem of §8.2.

## Downstream consumers

The Hilbert Banach modules and completely continuous controlling operator are inputs to finite-slope spectral varieties and classicality/control results in PadicFamilies. The arithmetic and ordinary comparisons identify the coefficients used in Katz–Hida and perfectoid constructions without identifying all ordinary forms with overconvergent forms. Fourier and boundary maps provide the interfaces needed for congruences, eigenform comparison and integral Hecke actions. The general Levi inductions, reduced toroidal coefficient sheaves and derived cohomology comparison are inputs to higher Coleman theory in all degrees. The definite unitary coefficient construction supplies its own arithmetic Jacquet eigenvariety with the full local torus character and the proven dimension/depth/density requirements.

## References

- **BHW.** Christopher Birkbeck, Ben Heuer and Chris Williams, *Overconvergent Hilbert modular forms via perfectoid modular varieties*, Annales de l'Institut Fourier 73 (2023), 1709–1794. [Published article](https://aif.centre-mersenne.org/articles/10.5802/aif.3560/). The locators above use printed journal pages: §§6–7, pp.1756–1765; §9, pp.1780–1788; §10, pp.1788–1792.
- **AIP-adic.** Fabrizio Andreatta, Adrian Iovita and Vincent Pilloni, *The adic, cuspidal, Hilbert eigenvarieties*, Research in the Mathematical Sciences 3 (2016), article 34. [Author manuscript](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Hilbert_adicfinal.pdf). Locators use manuscript pages, especially §2, pp.6–9; §4, pp.15–19; §6, pp.25–29; §8, pp.34–38.
- **AIP-cusp.** Fabrizio Andreatta, Adrian Iovita and Vincent Pilloni, *On overconvergent Hilbert modular cusp forms*, Astérisque 382 (2016), 163–193. [Author manuscript](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/AIP2.pdf). Locators use the manuscript's 1–35 numbering: family constructions in §§3.5–4, pp.16–29, and Appendix §6, pp.31–33.
- **BP.** George Boxer and Vincent Pilloni, *Higher Coleman theory*. [Author manuscript](https://www.ma.imperial.ac.uk/~gboxer/HigherColeman.pdf). Locators refer to the 181-page version: general toroidal comparison §§4.4.38–4.4.40, pp.79–80; reduced torsors §§4.6.8–4.6.15, pp.92–95; analytic induction §6.2, pp.148–153; coefficient families §6.3, pp.154–155.
- **DRW.** Hansheng Diao, Giovanni Rosso and Ju-Feng Wu, *Perfectoid overconvergent Siegel modular forms and the overconvergent Eichler–Shimura morphism*, [arXiv:2106.00094v3](https://arxiv.org/abs/2106.00094v3), 9 April 2026. Chart/frame locators are §§2.3–2.5, pp.15–20; normalized analytic coefficients and their sheaves are §3.1, pp.23–25; the algebraic comparison is §3.4, pp.37–38. The quotient-frame and Tate-linearization convention here is the explicit supplier convention, not an unqualified identification of a fixed dual-Lagrangian frame.
- **Ding.** Yiwen Ding, *p-adic Hodge parameters in the crystabelline representations of GL_n*, Publications mathématiques de l'IHÉS (2025). [Published article](https://pmihes.centre-mersenne.org/articles/10.1007/s10240-025-00156-2/). The definite unitary construction and Proposition 4.14 are §4.2.2, pp.66–67 in the article PDF.
- **Heuer.** Ben Heuer, *Line bundles on rigid spaces in the v-topology*, [arXiv:2012.07918v2](https://arxiv.org/abs/2012.07918v2). Corollary 1.5, p.3, and Proposition 3.8, p.15, are used with their smooth-rigid and formal-unit hypotheses, respectively.

- **Emerton-analytic.** Matthew Emerton, *Locally analytic vectors in representations of locally p-adic analytic groups*, [author manuscript](https://www.math.uchicago.edu/~emerton/pdffiles/analytic.pdf), draft dated 19 September 2011, 146 pages. Locators use its printed pages: Fréchet–Stein structures and coadmissibility §1.2, pp.22–27; analytic vectors Definition 3.5.3, p.64; distribution algebras §5.3, pp.101–110; admissibility and duality §6.1–§6.2, pp.110–119; full character spaces and essential admissibility §6.4, pp.124–130.
- **Emerton-Jacquet.** Matthew Emerton, *Jacquet modules of locally analytic representations of p-adic reductive groups I. Construction and first properties*, Annales scientifiques de l'École normale supérieure 39 (2006), 775–839. [Published article](https://www.numdam.org/articles/10.1016/j.ansens.2006.08.001/). Finite slope is §3.2, pp.796–799; the general parabolic construction is §3.4, pp.806–808; essential admissibility is Theorem 4.2.32, p.828; smooth and locally algebraic comparisons are Propositions 4.3.4 and 4.3.6, p.834.
- **Breuil–Ding.** Christophe Breuil and Yiwen Ding, *Higher ℒ-invariants for GL₃(ℚₚ) and local-global compatibility*, Cambridge Journal of Mathematics 8 (2020), 775–951. [arXiv:1803.10498v2](https://arxiv.org/abs/1803.10498v2). Lemma 6.1, pp.81–82 in this version, gives the general-rank integral local regularity used above.
- **Breuil–Hellmann–Schraen, Une interprétation modulaire.** *Une interprétation modulaire de la variété trianguline*, Math. Ann. 367 (2017), 1587–1645. [Author final manuscript](https://www.imo.universite-paris-saclay.fr/~christophe.breuil/PUBLICATIONS/eigenvariete.pdf). The local projective models are §§3.4–3.5, pp.24–27; the global component-image statement is Corollary 3.13, p.27; density and reducedness are Theorem 3.19 and Corollary 3.20, pp.31–34; the analytic-stage construction is Proposition 5.3, pp.46–48. Only the specified local arguments are specialized here, without their patching variables.
- **Breuil–Hellmann–Schraen, Smoothness and classicality.** *Smoothness and classicality on eigenvarieties*, Invent. Math. 209 (2017), 197–274. [Author manuscript](https://preprints.ihes.fr/storage/finalBHS_.pdf). Lemma 3.8, p.22 in this version, is the finite-projective Cohen–Macaulay argument.
- **Chenevier.** Gaëtan Chenevier, *Une correspondance de Jacquet–Langlands p-adique*, [arXiv:math/0301032v1](https://arxiv.org/abs/math/0301032v1), 5 January 2003. Proposition 6.4 and Lemma 6.5, pp.20–21, give the semisimple-fibre and no-embedded-component reducedness criterion. These locators are for this version; Ding cites the published Duke Math. J. 126 (2005), 161–194, with different numbering.
