# Roadmap: dirichlet p-adic L-functions, special values and Eisenstein measures

**Summary.** Identify integral smoothing series with the canonical Kubota–Leopoldt pseudomeasure and tame-character measures supplied by IntegralIwasawaTheory. Transport their moments and principal residue, obtain analytic branches with the correct conductor and Teichmüller shift, compute their logarithmic values with the Iwasawa logarithm constructed here, and assemble Eisenstein families including their localized constant coefficient. A second route through Morita's Gamma function supplies the Gross–Koblitz formula and the Ferrero–Greenberg derivative formula. Universal distributions organize the finite-level relations behind these constructions.

## Scope and ownership

This roadmap owns the integral smoothing-series comparisons, logarithmic special values, arithmetic branch comparisons, Morita Gamma, the Gamma–Gauss comparison, universal distribution presentations and arithmetic Eisenstein measures. IntegralIwasawaTheory §5.0 owns the canonical zeta pseudomeasure, tame Dirichlet measures, interpolation, coefficient descent, conductor comparisons and principal residue; the names here adapt those objects through its §6.3 normalization maps. It works for every prime, including 2, with the separate dyadic angular coordinate. Its finite-level distribution theory is stated on positive-dimensional rational tori; its L-functions are those of characters of GL₁.

The generic theory of nonarchimedean measures, completed group algebras, Mahler transforms, character evaluation, unit restriction, inverse-coordinate weighting and pseudomeasures belongs to **PadicMeasuresIwasawaAlgebras**, Layers 0–3 and §3a.1. Generic locally analytic distributions, their coefficient series and integration against analytic families belong to **LocallyAnalyticDistributions**, §§0.1–0.3, 1.1–1.4 and 3.1–3.2. Generic logarithm-series convergence, continuity and addition belong to **PadicFunctionalAnalysis**, §4.5, on Tau Ceti's `NormedSpace.logOneAdd` carrier. The normalized Iwasawa logarithm on C_p and on complete normed Q_p-fields with the Iwasawa decomposition is constructed here in §0.6. General branches of the logarithm, Coleman integration and polylogarithms belong to **ColemanIntegration**, a downstream consumer of this decomposition and normalized logarithm in L0 and of Layer 3 for special values. The present arithmetic comparisons use the measure and distribution interfaces above; they do not introduce alternative measure or distribution carriers.

Classical modular forms and character spaces use **ModularForms**, Layer 0 and “What Mathlib already has (consume)”, and Tau Ceti’s character Eisenstein series. Classical Dirichlet continuation, character conductors, Euler products and generalized Bernoulli numbers are used through the libraries. Tau Ceti supplies the Dedekind continuation near 1; the standard GL₁ comparison uses **AutomorphicLFunctionsAndLocalFactors**, Layer AL.1, [“Hecke continuation and functional equation”](../AutomorphicLFunctionsAndLocalFactors/README.md#hecke-l-functional-equation), the n=1 specialization of its global Godement–Jacquet theorem. Arithmetic-series normalization uses **ArithmeticDirichletSeries**, Layers 1 and 3, archived under `Completed/ArithmeticDirichletSeries/`. The number-field invariants in the residue are Mathlib’s class number, regulator, torsion order and discriminant; the global-character carrier is **GlobalNumberFields**, Layer 9. The universal distribution presentations below concern quotients of free abelian groups; they do not reconstruct profinite completion, Witt vectors, finite fields or general group cohomology.

PadicFamilies §0.12 is a downstream consumer of `kubotaLeopoldtPseudomeasure`, `integralTwistedPositiveEisensteinMeasure`, `fullEisensteinAwaySeries` and the character interpolation of §5.9; it owns the ordinary modular-form and Hecke-family comparison. Its `eisensteinConstantTerm`, `eisensteinCoefficientMeasure` and `eisensteinFamily` are adapters to §§1.6 and 5.6–5.9 here, which supply the arithmetic Eisenstein construction, bounded smoothing, cross-multiplication, parameter independence and moments using the canonical objects of IntegralIwasawaTheory §5.0. The normalization has first positive coefficient 1 and constant factor 1/2.

For its angular coefficient `Σ ψ(d)d⁻¹[⟨d⟩]`, take `integralTwistedPositiveEisensteinMeasure` with left character 1 and right character ψ, weight by the continuous inverse coordinate x⁻¹, and push forward along the angular projection. Apply the same operations coefficientwise to the full character families of §§5.7–5.9 after clearing their constant denominators, then use the chosen Iwasawa coordinate. For ψ=1, use `fullEisensteinAwaySeries` with its `clearedEisensteinSeries` numerator; the operation transports `A₀=Tw_x(ζ_p)/2` to the angular image of ζ_p/2. Its shifted clearing factor `2(uδ_u−1)` becomes `2([⟨u⟩]−1)`; transport the numerator and every cross-multiplication identity before dividing. Localization requires a regular transported denominator, and weight evaluation requires its nonzero image. For a nonprincipal right character use the normalized tame family of §5.7 when 2 is a unit; a principal character at a higher tame level uses §5.8 with its Euler deletions. At an arithmetic test ⟨x⟩^k the inducing finite character is ψω^(−k). The tame weights ψ(d) belong to the finite divisor sum, not to a presumed continuous function ψ on U. The ordinary p≥5 comparison is a specialization of these all-prime arithmetic constructions.

The following existing objects are inputs, rather than constructions of this roadmap:

* Mathlib's `DirichletCharacter`, its `conductor`, `primitiveCharacter`, `changeLevel`, `LFunction`, `gaussSum`, Bernoulli numbers and polynomials, and `riemannZeta` at nonpositive integers.
* Tau Ceti's `DirichletCharacter.generalizedBernoulli`, including its coefficient-map and modulus-one comparisons. Its convention uses representatives in `(0,N]`; at level one it is `bernoulli'`, so its first value is `+1/2`. The Mellin kernel below uses `bernoulli`, whose first value is `−1/2`. These two conventions agree in degrees other than one and are never silently interchanged.
* Tau Ceti's low-degree Tate comparisons `TauCeti.TateCohomology.H0IsoNormQuotient` and `HNegOneIsoNormKernelQuotient`, with their representative maps and equality criteria, in `TauCeti.RepresentationTheory.Homological.TateCohomology.LowDegree`. Mathlib's `Rep.FiniteCyclicGroup.groupCohomologyIsoOdd` and `groupCohomologyπOdd` supply the ordinary H¹ comparison through the same norm-kernel quotient. The targets below identify the operators on the actual distribution quotient and its parity torsion.
* Tau Ceti's primitive composite-modulus Gauss-sum product theorem. Primitivity is a hypothesis on both the multiplicative and additive characters; the theorem is not restricted to a prime modulus.
* Tau Ceti's local-field logarithm convergence on the first unit filtration, its deeper injectivity theorem and its exponential inverse on deep units, and its power-series evaluation and division API. The Iwasawa logarithm on all of `C_pˣ` and on the nonzero elements of each finite extension of Q_p, with its addition law, is constructed in §0.6.
* Tau Ceti's `EisensteinSeries.normalizedCharEisensteinSeriesMF`, its character space and positive Fourier coefficients, and its actual level-raising form and q-expansion. The arithmetic constant comparison, deletion of the Euler factor at p, and interpolation by measures remain the targets here.
* **ProfiniteArithmetic**, §§0.1–0.4, supplies the profinite ring, its units and finite residue comparisons. **LocalFieldsRamification**, Layers 0–2, supplies local fields, unit filtrations, unramified extensions and their residue correspondence for the Cartan groups.

## Conventions

Fix a prime `p`, put `Z = ℤ_p`, `Q = ℚ_p`, and write `U = Zˣ`. An analytic coefficient field `K` is a complete finite extension of `Q` with its normalized extending absolute value. Its ring of integers `O` is the native norm-valuation subring, with its inclusion into `K` and compatible continuous `Z`-algebra structure. Integral measure statements are statements about `O`-valued continuous tests and their sup norm; they do not give `O` a field normed-space structure. For formal tame coefficient bounds and scalar-integrality statements, the more general coefficient hypotheses are a normed ultrametric field K with a bounded Z-algebra action, complete and nontrivially normed for actual measure comparisons; characteristic zero is imposed exactly where indicated. In those statements O is the native norm-valuation integer subring; no isometric embedding of Q is presumed. Pure finite algebra is stated over a commutative ring or an additive commutative group when that suffices. Arguments using factorial inverses, logarithms, limits of normalized means or division by an orbit period explicitly use characteristic zero. No equal-characteristic DVR version is inferred.

Write `D(X,R)` for the existing continuous `R`-linear functional carrier on continuous `R`-valued functions on a compact space `X`. Its integral version has the all-test bound `‖μ(f)‖ ≤ ‖f‖`. Write `Λ_O(U)` for the existing completed group algebra, identified with integral measures by its supplier's canonical comparison. The product is convolution, `δ_u * δ_v = δ_(uv)`, and the identity is `δ_1`. Scalar multiplication of measures and weighting by a function are different operations: `(g μ)(f) = μ(gf)`. In particular, `x μ` means coordinate weighting. Pushforward by multiplication by a unit `a` is `σ_a`, so `(σ_a μ)(x^k) = a^k μ(x^k)`.

For additive measures, the Amice transform is `A_μ(T) = ∫(1+T)^x dμ(x)`. Its nth coefficient is the binomial moment, not the ordinary nth moment. Put `∂ = (1+T)d/dT`; then the kth ordinary moment is `(∂^k A_μ)(0)`. The operator `φ` is pushforward by multiplication by p, `ψφ = 1`, and the unit projector is `E = 1−φψ`. The inverse coordinate `I` on `Z` is `x⁻¹` on the units and zero on the nonunits; `Jμ = I Eμ`. Restriction `r_U` and extension by zero identify measures supported on `U` with intrinsic unit-group measures. These normalizations include the center of the additive disc and the trivial residue level.

Bernoulli numbers in the smoothing formulas have `B₀=1`, `B₁=−1/2`, `B₂=1/6`. For a character of positive conductor N, its generalized Bernoulli value is the library value, with the representative convention just described. The formula `L(χ,1−k)=−B_(k,χ)/k`, `k≥1`, uses that convention also for the primitive trivial character of conductor 1. Thus `L(1,0)=−1/2`; substituting the smoothing convention's `B₁` in that formula would be wrong.

A finite character is always accompanied by its actual positive level and, where needed, its primitive inducing character. The product of primitive characters is not assumed primitive. A character at modulus `p⁰=1` lifts to the constant function 1 on Z; the principal character at a positive p-power level lifts to the indicator of U. They agree on U and differ at 0. Euler factors use the primitive inducing character's value at p, including its zero extension at primes dividing its conductor.

For odd p, write `u = ω(u)⟨u⟩`, where ω is the Teichmüller coordinate and `⟨u⟩∈1+pZ`; take `γ=1+p`. At p=2 use the conductor-four sign `ω₂(u)∈{±1}`, `⟨u⟩₂∈1+4Z₂`, and `γ=5`. Let `h:U→Z` be the continuous additive coordinate with `γ^h(u)=⟨u⟩`. Powers by Z are first defined by the supplier's binomial character. Their exponential description is used only inside the convergence ball. In the analytic means put `q=p` for odd p and `q=4` for p=2. For a congruence estimate for Gamma at p=2 use exponent at least 3 when necessary; q=4 does not by itself give the false modulus-four Gamma congruence.

For a chosen primitive Nth root ε, the Gauss sum convention is `G(χ,ε)=Σ_(a mod N) χ(a) ε^a`. The Gross–Koblitz sum has an additional leading minus sign, stated separately. The scalar logarithm is the Iwasawa branch `log_p(p)=0`, compatible with the local series, additive on nonzero products and zero on finite-order roots of unity. It is constructed in §0.6. A complex formula uses the principal complex logarithm and the canonical root `exp(2πi/N)` when its phase matters. Algebraic special values are compared through separate embeddings of one number field into ℂ and K; no map from arbitrary complex values to K is used.

A localized expression is evaluated at a character only when its displayed denominator has nonzero image. A totalized field quotient at `0/0` is not a meromorphic value. A regular denominator in a completed group algebra need not remain nonzero under a particular character. All references below give printed page numbers; PDF page offsets are unnecessary once the edition is fixed in the references.

## Exact supplier contracts

### From Mathlib and Tau Ceti

Use Mathlib at `6b7abb3` and Tau Ceti at `a91d3aa`. The measure carrier is `AbstractMeasure X R E = C(X,R) →L[R] E`; use `AbstractMeasure.dirac`, `dirac_apply`, `AbstractMeasure.amiceTransform`, `coeff_amiceTransform` and `injective_amiceTransform`. For Z-valued coefficients, `AbstractMeasure.invTransform` and `amiceTransformEquiv` already provide inverse Mahler integration; use them directly. The finite-extension and integral O-coefficient comparisons needed below are the supplier extensions of that existing interface. Also use `PowerSeries.mk`, coefficient extensionality, coefficient maps, formal exponential and Bernoulli identities, `Polynomial.bernoulli`, `Nat.choose`, `PadicInt.toZModPow`, `ContinuousMap`, `ContinuousMonoidHom`, `FreeAbelianGroup`, additive subgroup quotients, `AddCircle (1 : ℚ)`, `Function.minimalPeriod`, `MonoidAlgebra`, finite fields, Witt vectors and native limits. The analytic base consists of `Complex.Gamma`, `mellin`, ordinary and iterated derivatives, analytic functions, power-series convergence and the identity theorem. For the logarithm of §0.6 use `PadicComplex` (written C_p) with `PadicAlgCl`, `spectralNorm_eq_norm_coeff_zero_rpow`, `spectralNorm_unique_field_norm_ext` and `IsUltrametricDist.of_normedAlgebra`, and the pinned Tau Ceti series `NormedSpace.logOneAdd` with `logOneAdd_eq_tsum` and `logOneAdd_zero` in `TauCeti.Analysis.Normed.Algebra.LogOneAdd.Basic`. Its radius bound `one_le_logOneAddSeries_radius` assumes `ContinuousSMul ℚ≥0`, which fails for p-adic fields; PadicFunctionalAnalysis §4.5 supplies the ultrametric convergence and addition theory with the exact field specialization below. In particular `riemannZeta_neg_nat_eq_bernoulli` states

```text
ζ(−k) = (−1)^k B_(k+1)/(k+1),        k≥0.
```

Do not replace it by the formula with an unqualified negative B₁. Use `DirichletCharacter.conductor_changeLevel`, `conductor_inv`, `conductor_mul_dvd_lcm_conductor`, `primitiveCharacter`, the Dirichlet L-function continuation and its change-level Euler-factor identities. Tau Ceti's `DirichletCharacter.exists_alt_unit_in_coset_with_char_separation` supplies an actual witness in a reduction fiber when a character does not factor through the smaller modulus. Finite-character Fourier proofs use this witness rather than assuming a primitive character is nontrivial on every nonidentity element.

The following pinned declarations are also suppliers:

| Object used | Exact declaration or module and mathematical contract |
|---|---|
| Dedekind continuation and residue | `TauCeti.exists_differentiableOn_eq_dedekindZeta_sub` in `TauCeti.NumberTheory.NumberField.DedekindZeta` supplies a holomorphic remainder G on `Re(s)>1−1/[F:ℚ]` with `ζ_F(s)=G(s)+ρ/(s−1)` on `Re(s)>1`; Mathlib’s `NumberField.dedekindZeta_residue_def`, `dedekindZeta_residue_pos` and `tendsto_sub_one_mul_dedekindZeta_nhdsGT` in `Mathlib.NumberTheory.NumberField.DedekindZeta` supply the class-number expression, positivity and right-hand residue limit. The germ `ρ+(s−1)G(s)` is the supplied pole-cleared Dedekind germ. |
| arithmetic-series normalization | `TauCeti.dedekindZeta_eq_LSeries_normCoeff_one` in `TauCeti.NumberTheory.ArithmeticDirichletSeries.Trivial` and `TauCeti.IdealArithmeticFunction.normCoeff_eq_eulerProduct` in `TauCeti.NumberTheory.ArithmeticDirichletSeries.EulerProduct.Basic`, with the multiplicativity hypotheses of the latter; these realize ArithmeticDirichletSeries Layers 1 and 3 on the native ideal-function carrier. |
| low-degree cohomology | `TauCeti.TateCohomology.H0IsoNormQuotient` and `TauCeti.TateCohomology.HNegOneIsoNormKernelQuotient` in `TauCeti.RepresentationTheory.Homological.TateCohomology.LowDegree`; Mathlib’s `Rep.FiniteCyclicGroup.groupCohomologyIsoOdd` and `Rep.FiniteCyclicGroup.groupCohomologyπOdd` in `Mathlib.RepresentationTheory.Homological.GroupCohomology.FiniteCyclic` give ordinary odd-degree cohomology. Their norm and generator operators are identified on the distribution module in §4.12. |
| generalized Bernoulli values | `DirichletCharacter.generalizedBernoulli`, `generalizedBernoulli_def`, `map_generalizedBernoulli`, `generalizedBernoulli_modOne`, `generalizedBernoulli_zero` in `TauCeti.NumberTheory.DirichletCharacter.GeneralizedBernoulli`; `N^(k−1)Σ χ(a)B_k(ã/N)` with `ã∈(0,N]` |
| composite primitive Gauss product | `DirichletCharacter.gaussSum_mul_gaussSum_inv_eq_card_of_isPrimitive` in `TauCeti.NumberTheory.DirichletCharacter.GaussSum`; over a domain, primitive χ and primitive additive e give `G(χ,e)G(χ⁻¹,e⁻¹)=N`; characteristic zero implies nonvanishing |
| local logarithm estimates | `TauCeti.hasSum_log_of_mem_unitFiltration_one`, `continuous_log_unitFiltration`, `valuation_log`, `log_unitFiltration_injective` in `TauCeti.NumberTheory.LocalField.Logarithm`; the injectivity range is `e<(p−1)i` |
| local exponential and its inverse | `TauCeti.hasSum_exp_of_mem_maximalIdeal_pow`, `exp_add_of_mem_maximalIdeal_pow` in `TauCeti.NumberTheory.LocalField.Exponential`; `valuation_exp_sub_one`, `exists_mem_unitFiltration_eq_exp`, `log_exp_of_mem_maximalIdeal_pow`, `exp_log_of_mem_unitFiltration` in `TauCeti.NumberTheory.LocalField.ExpLog`; finite extensions of Q_p at depth `e<(p−1)i`; the addition law of the logarithm is not among them and is proved in §0.6 |
| scalar series evaluation | `PadicInt.X_sub_C_mul_divXSubC_add_C_aeval`, `X_sub_C_mul_divXSubC`, `X_sub_C_dvd_iff_aeval_eq_zero` in `TauCeti.NumberTheory.Padics.PowerSeries`, at a topologically nilpotent scalar |
| completed algebra and character division | `TauCeti.completedGroupAlgebra`, `of`, its power-series comparison, and `TauCeti.completedGroupAlgebra.of_sub_algebraMap_dvd_algebraMap_add_of_mem`; the latter requires a commutative pro-p group and membership in the closed cyclic subgroup, and is not a regularity theorem for every element of Λ |
| character Eisenstein forms | `TauCeti.EisensteinSeries.normalizedCharEisensteinSeriesMF`, `TauCeti.EisensteinSeries.qExpansion_normalizedCharEisensteinSeriesMF_coeff`, `qExpansion_normalizedCharEisensteinSeriesMF_coeff_one`, `normalizedCharEisensteinSeriesMF_mem_modFormCharSpace`, and `normalizedCharEisensteinSeriesMFRaise` with `qExpansion_normalizedCharEisensteinSeriesMFRaise` in `TauCeti.NumberTheory.ModularForms.EisensteinSeries.Normalized`; weight at least 3, primitive right character, parity and level divisibility as in that module |

### From PadicFunctionalAnalysis

Its §4.5 owns logarithm and exponential convergence, continuity, addition, inverse identities and bounded Cauchy products for commutative Banach Q_p-algebras with bounded scalar action. Use the native `NormedSpace.logOneAdd` series. Its field specialization needed by §0.6 is the following: for every prime p and complete normed field E with `NormedAlgebra ℚ_[p] E`, the series `Σ_(n≥1)(−1)^(n−1)z^n/n` has sum `NormedSpace.logOneAdd E E z` whenever `‖z‖<1`. It converges uniformly on each closed disc `‖z‖≤r` with `0≤r<1`, is continuous on the open disc, and satisfies

```text
logOneAdd(z+w+zw) = logOneAdd(z)+logOneAdd(w),       ‖z‖<1, ‖w‖<1.
```

This specialization identifies `NormedSpace.logOneAdd ℚ_[p] E` with `NormedSpace.logOneAdd E E`: coefficient inclusion preserves the rational coefficients termwise. It also identifies the sum on finite-extension principal units with Tau Ceti's `NormedSpace.log` via `TauCeti.hasSum_log_of_mem_unitFiltration_one`. For n≥1 the field estimate is `‖z^n/n‖≤n‖z‖^n`; ultrametric summability and bounded regrouping give the convergence and product law without `ContinuousSMul ℚ≥0`. The Banach-algebra contract retains its generality; these field identities specify its arithmetic use. (PadicFunctionalAnalysis §4.5; Washington, §5.1; Tau Ceti, `LogOneAdd.Basic` and `LocalField.Logarithm`.)

**Checks.**

* For E=Q₂ and z=−2, the convergent series has sum 0 because `(1+z)²=1`; the open disc includes this torsion unit.
* For E=Q₃(i), i²=−1, the product law at z=3i and w=−3i gives `log(1+3i)+log(1−3i)=log 10`.
* At z=p−1 for odd p the norm is 1 and the terms do not tend to zero. The open-disc theorem excludes this boundary.

### From PadicMeasuresIwasawaAlgebras

Use its §0.1 for clopen restriction and extension by zero, §§1.1–1.5 for finite coefficients and finite coordinates of integral measures, and §1.7 for the canonical measure/completed-algebra comparison and coefficient extension. The comparison must preserve δ, convolution, coefficient maps and every finite clopen mass. Its §§2.1–2.6, 2.8 and 2.11–2.12 supply Mahler inversion, coefficient norm equality, the binomial character, ∂, φ, ψ and σ, the unit projector and inverse weighting; §3.2 supplies positive-moment separation for Z-valued measures on U. Here prove `unitMeasure_eq_zero_of_positive_moments` for K-valued and O-valued measures: vanishing of every positive ordinary moment implies that the measure is zero. Use coefficient-general Mahler injectivity, extension by zero from U and the invertibility of its coordinate; record compatibility with the inclusion O→K. Equivalently, the extended Amice transform is constant, while its unit support forces that constant to vanish. This applies to the complete finite extension K and its integer ring O of the Conventions, both characteristic-zero domains with bounded Z-action. (RJW, Lemma 3.36(i), pp.130–131; the same Mahler argument with K/O coefficients.)

**Checks.**

* A Dirac measure at 1 has every positive moment 1, so it fails the vanishing hypothesis over K and O.
* The difference of the Dirac measures at 1 and −1 has even moments zero but first moment 2, including at p=2; even moments alone do not separate measures.
* The Dirac measure at additive 0 kills every positive power but has mass 1; it is excluded by support on U. Inclusion O→K preserves all moments and detects the zero integral measure.

Its §3a.1 consumes the odd-prime and dyadic product decompositions from PadicFunctionalAnalysis §5.1, whose principal generator is exp(q), and the change-of-generator law of PadicFunctionalAnalysis §5.2. The transport to γ=1+p or γ=5 and its continuous h coordinate is the arithmetic comparison in §0.6 here. Its §1.6 character algebra map must satisfy `ev_κ(δ_u)=κ(u)` and `ev_κ(μ*ν)=ev_κ(μ)ev_κ(ν)` and commute with coefficient inclusion. Its §§3.1–3.3 supply the native submodule of the total quotient ring whose products by every `δ_u−1` are integral, cross-multiplication and uniqueness, regularity of an infinite-order smoothing denominator on the actual finite-by-procyclic unit group, and evaluation on the localization at a denominator with nonzero character image. No evaluation on the whole total quotient ring is requested.

Finite projections and their refinement maps are supplied by §§1.1 and 2.12. The arithmetic cyclic recurrence, its uniqueness from the total mass and its explicit solution are targets of §1.5 here; they identify the existing inverse-Mahler measure.

### From IntegralIwasawaTheory

Use §5.0, `kubotaLeopoldtPseudomeasure` and `kubotaLeopoldt_interpolation`, for the canonical pseudomeasure, its tame measure components, integral smoothing, coefficient descent, conductor Euler deletions and principal residue. Use §6.3, `bernoulliStickelberger_dictionary`, for inverse arithmetic reciprocity, coordinate weighting, the Teichmüller projection and the Bernoulli sign. Sections 1.6, 2.6–2.8 and 3.1–3.2 here identify the series and analytic adapters with those supplied objects on all tests, not just at one weight. Section 3.7 transports the supplied pole and residue to the smoothing quotient; §§5.4–5.9 use the same transported object for the Eisenstein constant. The finite tame kernels also exist for principal characters, but their principal boundary is distinct from the canonical pseudomeasure.

Write `ι(x)=σ_x⁻¹` for the inverse-reciprocity coordinate, `Tw_x` for coordinate weighting, and β_U for the unit restriction of the supplier's Bernoulli distribution. In the localized measure algebras the normalization equations are

```text
ι_* Tw_x(ζ_p)=−β_U,
ι_*(μ_c|_U)=(1−cσ_c⁻¹)β_U,
Tw_x((δ_c−1)ζ_p)=μ_c|_U.
```

For a nonprincipal tame η, its coefficient-valued Bernoulli kernel β_(η,U), obtained by tame character projection before restriction to U, similarly satisfies `ι_* Tw_x(ζ_η^U)=−β_(η,U)` and `ι_*(μ_η|_U)=−β_(η,U)`. The tame weights belong to that coefficient-valued distribution; they are not a continuous function η on U. For a finite continuous character χ of U, put `w_(χ,s)(x)=χ(x)ω(x)⁻¹⟨x⟩^(−s)` and `ρ_(χ,s)(σ_x)=χ(x)⁻¹ω(x)⟨x⟩^s`. Then

```text
ρ_(χ,s)(σ_x⁻¹)=w_(χ,s)(x),
x⁻¹κ_(χ,s)(x)=w_(χ,s)(x),
ρ_(χ,s)(1−cσ_c⁻¹)=1−χ(c)⟨c⟩^(1−s).
```

Evaluation of the smoothed principal Bernoulli distribution divided by this last factor is the negative of the principal analytic branch. The tame branch is the negative of β_(η,U) evaluated at ρ_(χ,s). These equations hold on admissible character loci, with the actual conductor Euler deletions. The ω in them includes the conductor-four sign at 2. (IntegralIwasawaTheory §§5.0 and 6.3, cited targets; RJW, equation (4-3), Definitions 5.13 and 5.18, Remark 5.19 and Theorem 5.20, pp.138,146–148.)

**Checks.**

* At N=3 the odd quadratic character evaluates the Bernoulli element to −1/3, while its complex L-value at 0 is 1/3. The minus sign persists under coefficient embeddings.
* At s=1−r, `w_(χ,s)=χω^(−r)x^(r−1)`; on χ=ω^k the Galois torsion projection is ω^(1−k). Omitting inverse weighting changes the interpolated character.
* At p=2, x=−1 has ω₂(x)=−1 and angular coordinate 1. A character modulo 2 cannot replace this sign.
* If `P(S)=(1+S−γ)Lp_1(s)` with `S=γ^s−1`, then `P(γ−1)=γ log_p(γ)(1−p⁻¹)`. This has valuation 0 at odd p and 1 at 2; multiplying the clearing factor by p changes the normalization.

### From LocallyAnalyticDistributions

LocallyAnalyticDistributions §1.1 supplies the unbounded Amice coefficient-series equivalence on the additive disc; §§1.3–1.4 supply multiplication by x corresponding to ∂, scalar extension, unit restriction and finite root averages. Its §1.2 supplies evaluation on strict subdiscs, analytic evaluation, coefficient transport and “Uniform geometric tails on a smaller disc”. Its §§3.1–3.2 supply component Mellin series, analytic arithmetic branches and clearing-factor comparisons. These interfaces identify primitive series with actual distributions. Mathlib’s native analytic series and continuous-linear-map summation laws supply differentiation and interchange for convergent series; the larger-radius Taylor estimates for the arithmetic samples and their normalized means are proved in §§4.2–4.3 here. The continuous normalized Mahler antidifference is constructed in §4.13 from Mathlib’s Mahler basis.

The logarithm used with these analytic statements is the Iwasawa logarithm of §0.6. Its local series law

```text
log(b(1+z)) = log(b) + Σ_(n≥1) (−1)^(n−1) z^n/n,   ‖z‖<1, b≠0,
```

follows from the addition law there, as do its finite product and norm laws; the exponential inverse on deep principal units comes from Tau Ceti through §0.6. These are used with the concrete cyclotomic functions below, including pure wild conductor, rather than postulated as identities for an unspecified function.

### From arithmetic, modular and profinite roadmaps

AutomorphicLFunctionsAndLocalFactors Layer AL.1, [“Hecke continuation and functional equation”](../AutomorphicLFunctionsAndLocalFactors/README.md#hecke-l-functional-equation), supplies the standard GL₁ L-function, its Euler factorization, specified archimedean factors and meromorphic continuation. This is the n=1 specialization of its [global Godement–Jacquet theorem](../AutomorphicLFunctionsAndLocalFactors/README.md#global-godement-jacquet). ArithmeticDirichletSeries Layers 1 and 3, archived under `Completed/ArithmeticDirichletSeries/`, supplies the native Dirichlet-series and Euler-product normalization through the Tau Ceti declarations above. The class-number expression and near-1 Dedekind germ are the pinned Mathlib and Tau Ceti suppliers in the table. For GL₁ over ℚ use GlobalNumberFields Layer 9, “Hecke and ray class characters”, for the global character carrier. Its comparison with a finite-unit character, an infinity sign and a norm power, including uniformizer value `χ(ℓ)⁻¹ℓ^(−s)`, is the arithmetic target of §0.5 here.

ModularForms Layer 0 supplies the character spaces; its “What Mathlib already has (consume)” section names the native holomorphic forms, q-expansions and level-one Eisenstein series. Tau Ceti’s `EisensteinSeries.Normalized` module supplies the primitive-pair forms and their actual level raising as specified in the table. The Tau Ceti primitive-pair construction is used for weight at least 3. A low-weight comparison below has an explicit existence and q-expansion hypothesis on the form, so it does not infer a weight-one or exceptional weight-two form from the generic theorem.

DiophantineApproximationAndTranscendence Layer 3, §3.5, “Baker’s theorem / linearIndependent_cons_one_of_linearIndependent_rat” and “E19 Theorem 4.19 / transcendental_sum_mul_of_linearIndependent”, supplies the affine logarithm-independence and nonzero-linear-form contracts: Q-independent logarithms of nonzero algebraic numbers remain independent together with 1 over the algebraic numbers. For an arbitrary finite logarithm family, first choose a Q-basis of its span; a nonzero algebraic linear combination is then transcendental. This is the exact input to the complex application in §3.4, not a p-adic logarithm-independence assertion.

ProfiniteArithmetic §§0.1–0.4 supplies the native profinite ring, inverse-limit description, units and finite residue comparisons. LocalFieldsRamification Layers 0–2, especially Layer 2 “Existence and uniqueness, stated precisely”, supplies unramified degree-d local extensions, their integer rings and residue correspondence; finite fields and truncated Witt rings are the existing native carriers. Generic finite-group representations and group cohomology use the corresponding existing algebra/cohomology interfaces. The C₂ calculations below explicitly distinguish ordinary H¹ from degree-zero Tate cohomology.

## How to read the build

Layer 0 fixes the complex analytic and algebraic normalizations and constructs the Iwasawa logarithm. Layer 1 constructs smoothing-series measures and identifies their inverse-weight numerators with the supplied arithmetic pseudomeasure; Layer 2 adds character-series and integral descent comparisons. Layer 3 turns those objects into analytic branches, computes logarithmic values and transports the supplied principal residue. Layer 4 develops Gamma, Gauss sums, universal distributions and the derivative formula, independently of the Eisenstein construction after its indicated inputs. Layer 5 assembles the full Eisenstein q-expansion. Each layer's examples distinguish the arithmetic normalization from another formally type-correct choice.

Suggested.lean states headline results on the pinned native carriers. Names elsewhere in the layer descriptions specify construction targets; the module docstring identifies the arithmetic objects needed for the canonical-object comparisons.

* `exists_normalizedMellinContinuation`, `bernoulliKernel_normalizedMellin` and `smoothedMellinKernel_normalizedMellin` give the entire continuations (§§0.1–0.3); `algebraicDirichletValue_complex` gives the common algebraic special value (§0.4).
* `existsUnique_isIwasawaLog`, `existsUnique_isIwasawaLog_padicComplex` and `existsUnique_isIwasawaLog_of_finiteDimensional` construct the normalized logarithm (§0.6).
* `smoothedMeasure_moment` identifies the binomial smoothing measure's ordinary moments (§1.2); `existsUnique_tameMeasure` constructs the bounded finite-kernel measure and identifies all its ordinary moments, including imprimitive nonprincipal characters (§2.4).
* `complexGaussLogValue_eq_LValue` and `complexDirichletValue_one_transcendental` give the complex logarithmic value and its transcendence (§3.4). `leopoldt_value_one` gives the p-adic logarithmic value for tame, mixed and wild conductors (§3.6); `principalNumerator_mass` and `bernoulliQuotient_tendsto` give the smoothing mass and Bernoulli residue limit (§3.7).
* `existsUnique_moritaGamma`, `moritaGamma_locallyAnalytic`, `grossKoblitz_formula` and `ferreroGreenberg_derivative` give the continuous and analytic Gamma function and its two arithmetic comparisons (§§4.1, 4.3, 4.5 and 4.14). `universalWeightedDistribution_finiteBasis` gives freeness and primitive-point rank for every positive-dimensional finite torus level and every nonnegative weight (§§4.8 and 4.11).
* `existsUnique_fullEisensteinAwaySeries` gives the full localized Eisenstein family at every infinite-order smoothing unit, including its integral cleared constant and all nonnegative moments (§5.5). `characterEisenstein_stabilized_qExpansion` gives the classical character expansion with its Bernoulli constant (§5.9).

## Layer 0: complex special values, common algebraic data and the Iwasawa logarithm

### 0.1 Normalized Mellin continuation

Let J be `[0,∞)`. For `f:ℝ→ℂ`, assume smoothness within J of every order, compatibility of the within derivatives, and for each n an eventual bound `‖Dⁿf(t)‖≤C_n exp(−c_n t)` with `C_n≥0` and `c_n>0`. Define `normalizedMellinContinuation f` by choosing any N with `Re(s)+N>0` and using `(-1)^N M(D^N f,s+N)/Γ(s+N)`, where the derivative order is N. This is a construction by coherent half-plane formulas, not the totalized quotient `M(f,s)/Γ(s)` everywhere. Prove `normalizedMellin_coherent`, `normalizedMellin_eq_integral` on `Re(s)>0`, `normalizedMellin_entire`, `normalizedMellin_neg_nat`, and uniqueness among entire functions agreeing there. The last formula is `L_f(−n)=(-1)^n Dⁿf(0)`. Add `normalizedMellin_congr` for agreement on J, additivity and scalar multiplication. Integration by parts first on a compact interval, followed by the endpoint bounds, gives the shifted formulas; Γ's recurrence identifies their overlaps. (RJW, Theorem 2.4 and proof, pp.110–111.)

The compact existence signature is `exists_normalizedMellinContinuation`; its smoothness is `ContDiffOn` on the closed half-line and its decay uses every iterated within derivative. These hypotheses provide the compatible endpoint derivatives in the construction.

**Checks.**

* `f(t)=exp(−t)` gives `L_f(s)=1`; in particular its value at 0 is 1, whereas a totalized raw quotient at the Γ pole gives 0.
* `f(t)=t exp(−t)` gives `L_f(s)=s`, with values 0 at 0 and −1 at −1.
* `f(t)=exp(−2t)` gives `L_f(−3)=8`, detecting both the derivative sign and the scale.
* The constant function 1 violates the decay hypothesis and is excluded; extending the theorem to every smooth function would fail at the integral's upper endpoint.

### 0.2 The Bernoulli kernel at its removable point

Define `bernoulliKernel t` as the inverse of the divided difference of exp at 0, so `β(0)=1` and `β(t)=t/(exp(t)−1)` for `t≠0`. The denominator divided difference is positive on ℝ. Prove its value at zero, its displayed formula away from zero, real analyticity, `((exp t−1)β(t)=t)`, the derivative formula `Dⁿβ(0)=B_n`, and uniqueness of the analytic extension. All derivatives have an exponential bound with, for instance, rate 1/2 at positive infinity. The polynomial prefactor prevents claiming the sharp rate 1 without a further polynomial factor. On `Re(s)>0`, `M(β,s)=Γ(s+1)ζ(s+1)`; its normalized continuation equals `sζ(s+1)` away from 0 and has value 1 at 0. The identity theorem supplies the full comparison. (RJW, Lemmas 2.6–2.7, pp.111–112; the derivative normalization is its Bernoulli generating series.)

The signature `bernoulliKernel_normalizedMellin` states the entire continuation and its zeta comparison. The removable divided-difference description and the piecewise value at zero define the same function.

**Checks.**

* The first two derivatives are `−1/2` and `1/6`, not `+1/2` and `1/3`.
* `β(log 2)=log 2` and `β(−log 2)=2 log 2`, so the extension is not an even function.
* The raw expression at 0 is `0/0=0` in a totalized field and fails `β(0)=1`.
* The continued normalized value at −2 is `1/6`; the constant value 1 would pass the origin check and fail this one.

### 0.3 Smoothing the pole

For real a define `smoothedMellinKernel a` by the divided difference at 0 of `β(t)−β(at)`. Thus

```text
h_a(0)=(a−1)/2,
h_a(t)=1/(exp t−1)−a/(exp(at)−1)       if a≠0 and t≠0,
Dⁿh_a(0)=(1−a^(n+1))B_(n+1)/(n+1).
```

Prove these equations, analyticity, dependence on a, `h_1=0`, and `h_(ab)(t)=h_a(t)+a h_b(at)` for all real a,b, including a=0. For `a>0` all derivatives decay exponentially with a positive rate less than `min(1,a)`. Their normalized Mellin continuation is `(1−a^(1−s))ζ(s)` away from s=1, with removable value `log a` at 1. Its value at −n is `(-1)^n(1−a^(n+1))B_(n+1)/(n+1)`. The Mellin cocycle uses `a^(1−s)`, while the nth derivative cocycle uses `a^(n+1)`; these factors serve different operations. (RJW, Lemmas 4.2–4.3, p.136, after the normalization of Theorem 2.4.)

The signature `smoothedMellinKernel_normalizedMellin` states the entire continuation for a>0 and its removable value at 1. Analyticity, the derivative formula and the algebraic cocycle are part of the kernel construction.

**Checks.**

* `h_2(0)=1/2`, `h_1=0`, and `h_0(0)=−1/2`; the formula with a denominator `exp(at)−1` is not used at a=0.
* `h_2(log 2)=1/3`, from `1−2/3`, detecting the order of the two summands.
* At a=2, the derivative of order 3 is `1/8`, while `L_(h_2)(−3)=−1/8`.
* With a=2,b=3, the third derivative cocycle gives `259/24 = 1/8 + 16·2/3`. Its normalized continued value is `−259/24`.
* Negative a remains valid for the divided-difference definition and algebraic cocycle; its positive-infinity decay is not asserted.

### 0.4 Generalized Bernoulli comparison and conductors

Use the existing generalized Bernoulli value for a character over a characteristic-zero field F. For a primitive character χ of conductor N and k≥1, prove the common-value comparison `algebraicDirichletValue χ k = −B_(k,χ)/k`, whose images under `F→ℂ` and `F→K` are respectively `L(χ,1−k)` and the algebraic scalar used by interpolation. Here `algebraicDirichletValue` is just a name for this scalar expression, not a new Bernoulli object. For an imprimitive character, multiply the primitive value by `∏_(ℓ|N, ℓ∤f)(1−χ₀(ℓ)ℓ^(k−1))`, where f is its primitive conductor and each new prime occurs once. Prove coefficient-map naturality, complex embedding independence in the algebraic formulation, parity vanishing for `χ(−1)≠(-1)^k` except the primitive trivial boundary k=1, and compatibility with the existing change-level theorem. The parity comparison retains the level-one, degree-one exception. (RJW, §2.4.1, pp.113–114, §5.1–5.2, pp.139–146; Bernoulli polynomials and the finite Hurwitz-zeta expression give the comparison.)

The signature `algebraicDirichletValue_complex` compares the complex image with the L-value. Coefficient-map naturality, change of level and parity are part of the comparison; the scalar expression remains the existing generalized Bernoulli value divided by −k.

**Checks.**

* The primitive trivial character at conductor 1 and k=1 gives `−1/2`, using the supplier's `B_(1,1)=+1/2`.
* For the odd quadratic character modulo 3, `B_(1,χ)=−1/3`, hence `L(χ,0)=1/3`.
* The principal character at level 3 has `L(χ,0)=(1−1)ζ(0)=0`; it is not the primitive trivial character at conductor 1.
* Raising level from 3 to 9 introduces no new Euler factor. A product of characters that becomes principal is reduced to its actual inducing conductor before its p factor is evaluated.

### 0.5 The Dedekind and GL₁ global normalization

For a number field F, prove `tateTrivial_dedekind_comparison`: the completed trivial-character standard GL₁ L-function of AutomorphicLFunctionsAndLocalFactors Layer AL.1, after division by its specified archimedean factor, agrees with `NumberField.dedekindZeta F` on `Re(s)>1` and with the supplied Dedekind meromorphic germ near 1. Use the holomorphic remainder G of `TauCeti.exists_differentiableOn_eq_dedekindZeta_sub`; its pole-cleared germ is `ρ+(s−1)G(s)`, where Mathlib’s `NumberField.dedekindZeta_residue_def` gives

```text
ρ = 2^r₁ (2π)^r₂ h_F R_F / (w_F sqrt(|disc F|)).
```

The residue formula, its positivity and the Dedekind continuation near 1 are consumed through the exact supplier contracts. Prove that the standard GL₁ comparison preserves this pole-cleared germ, its value at 1 and the resulting order −1; agreement on the open half-plane and uniqueness of analytic continuation fix the germ. The comparison is attached to the actual completed standard GL₁ L-function and its archimedean factor, whose nonvanishing near 1 is part of the AL.1 normalization. (RJW, Theorem 2.2, p.108; the global-character normalization in §2.4.2, pp.114–116.)

For ℚ, identify a continuous GL₁ arithmetic character with finite-unit character χ, the compatible infinity sign and its norm exponent. Here χ is the finite-unit restriction, and at an unramified prime ℓ its uniformizer value is `χ(ℓ)⁻¹ℓ^(−s)`. Thus its standard GL₁ Euler factor has Dirichlet coefficient χ⁻¹(ℓ). To obtain the Dirichlet L-function with coefficients χ, use the idele-class character whose finite-unit restriction is χ⁻¹. Prove this conversion, the compatibility at −1, and the local Euler-factor comparison; do not infer this normal form for an arbitrary discontinuous function on ideles. (RJW, Propositions 2.9 and 2.11, pp.113–115; the local comparison follows by expanding the unramified geometric series.)

Use `tateTrivial_dedekind_comparison`, `_poleCleared`, `_residue` and `_unique` for the global-to-Dedekind comparison, and `glOneCharacter_uniformizer` and `_parity` for the global character normalization.

**Checks.**

* F=ℚ has `r₁=1,r₂=0,h=1,R=1,w=2,disc=1`, so the displayed residue is 1.
* The first two terms of an unramified GL₁ Euler factor are `1+χ(ℓ)⁻¹ℓ^(−s)`, fixing the inverse-character convention.
* For the quartic character modulo 5 with χ(2)=i, the finite-unit convention gives coefficient −i at ℓ=2. Inverting that finite-unit character gives coefficient i. A quadratic character would not distinguish the two choices.
* A trivial finite character has trivial infinity sign; an odd finite character requires the sign at the real place.
* Positivity rules out residue 0. The theorem makes no simple-pole conclusion from an arbitrary proposed pole-cleared function that vanishes at 1.

### 0.6 The Iwasawa logarithm

This subsection constructs the normalized global p-adic logarithm used in Layers 3–5. Let E be a field whose absolute value makes it a normed Q_p-algebra (`NormedField E`, `NormedAlgebra ℚ_[p] E`). It has characteristic zero and is ultrametric by Mathlib's `IsUltrametricDist.of_normedAlgebra`. For complete E import the field specialization of PadicFunctionalAnalysis §4.5 from the exact supplier contract: `log(1+z)=NormedSpace.logOneAdd E E z` for `‖z‖<1`, with convergence, continuity and the product law on principal units. Thus `u↦log u` is a continuous homomorphism from `1+m_E` to `(E,+)` and kills its roots of unity. The decomposition, normalization at p, global uniqueness, norm–trace comparison and arithmetic chart normalization are the targets here.

Say that E has the Iwasawa decomposition, `HasIwasawaDecomposition p E`, when every nonzero x has an admissible pair: `N≥1` and `m∈ℤ` with `‖x^N p^(−m)−1‖<1`. Taking norms gives `m/N=v_p(x)=−log_p‖x‖`. Thus the property says that the value group lies in `p^ℚ` and that the residue units are torsion. Prove this decomposition for finite-dimensional extensions and for C_p. On a finite extension of Q_p the norm is the spectral norm, by Mathlib's `spectralNorm_unique_field_norm_ext`. Mathlib's `spectralNorm_eq_norm_coeff_zero_rpow` then gives `‖x‖^d=‖a_0‖∈p^ℤ`, where `a_0` is the constant coefficient of the minimal polynomial of x and d is its degree. The residue field is finite of some order q, so the (q−1)st power of a unit lies in the principal units. For C_p use Mathlib's `PadicAlgCl` with its spectral norm, the density of the algebraic closure in its completion, and the ultrametric equality `‖x‖=‖y‖` whenever `‖x−y‖<‖x‖`; together they give the value group. For a unit u choose an algebraic y with `‖u−y‖<1`. Then y is a unit of the finite extension `Q_p(y)`, so `y^(q−1)`, and hence `u^(q−1)`, is a principal unit. The completion of any algebraic extension of Q_p has the property by the same argument. The completion of `Q_p(T)` for the Gauss norm does not: `‖T‖=1`, but the residue of T is transcendental over `F_p`, so no power of T is a principal unit.

Define the light predicate `IsIwasawaLog p L` for `L:E→E` by four conditions: `L(0)=0`, `L(p)=0`, `L(xy)=L(x)+L(y)` for nonzero x and y, and `L(1+z)=log(1+z)` for `‖z‖<1`. For complete E with the Iwasawa decomposition there is exactly one such L, `existsUnique_isIwasawaLog`. Put `L(x)=N⁻¹log(x^N p^(−m))` for any admissible pair. Two pairs give the same value, because `m/N=m'/N'` and `(x^N p^(−m))^(N')=(x^(N') p^(−m'))^N`, so the addition law settles the comparison. For x and y take a common N; the product of their principal units is then admissible for xy. The pair (1,0) at a principal unit and the pair (1,1) at p give the series and `L(p)=0`. Conversely, every L satisfying the predicate has `N·L(x)=L(x^N p^(−m))+m·L(p)=log(x^N p^(−m))`, and N is invertible in characteristic zero. The value at 0 is the junk value 0, and every statement using the homomorphism law assumes nonzero arguments. Write `iwasawaLog p` for the resulting function on C_p, and `localIwasawaLog E` for that of a complete field with the decomposition. The two cases used below are `existsUnique_isIwasawaLog_padicComplex` and `existsUnique_isIwasawaLog_of_finiteDimensional`, the second for the coefficient fields K of the Conventions. (Furusho, §2.1, p.7, characterizes each branch of the logarithm on `C_pˣ` by its value at p; the Iwasawa branch is the one with value 0. RJW, Theorem 6.1(ii), p.149, is stated with this branch, and its proof uses `log_p(−x)=log_p(x)` on `C_pˣ`, p.153. Coleman, §I, p.171, names it as an example of a locally analytic homomorphism `C_pˣ→C_p` with derivative 1 at 1.)

For an Iwasawa logarithm L prove its value at 1, the power law `L(x^n)=n·L(x)` for nonzero x, the inverse law, vanishing on roots of unity of positive order, invariance under negation, and the finite-product law. The trace computations of §§3.5–3.7 and the Gamma orbit sums of §4.6 use this finite product law. The branch comparison is `natCast_mul_eq_of_map_mul`. If `ℓ:E→E` is additive on nonzero products and equals the series on the open disc, then `N·ℓ(x)=N·L(x)+m·ℓ(p)` for every admissible pair. Hence `ℓ=L+ℓ(p)·v_p` on `Eˣ`, so a change of branch has exactly the form used in §3.5. Equivariance is `map_algHom`. Let σ be an isometric Q_p-algebra map from a complete field E with the decomposition to a field E' with an Iwasawa logarithm `L'`. Then `L'(σx)=σ(L x)`, because σ preserves admissible pairs and, being continuous and additive, commutes with the series. Every Q_p-algebra map from a finite extension of Q_p to a normed field over Q_p is isometric, by uniqueness of the extended norm. A continuous field automorphism of C_p fixes ℚ, hence Q_p, and preserves `PadicAlgCl`, on which the norm is the unique extension; by density it is isometric, which gives equivariance under continuous field automorphisms. For a finite extension F of Q_p inside C_p, `iwasawaLog` maps F into F (preservation of intermediate fields): admissible pairs exist inside F, and F is complete, hence closed. Its restriction to F is therefore the intrinsic logarithm of F. The norm law is `localIwasawaLog_norm_eq_trace`. The norm–trace comparison takes the two Iwasawa logarithms on a tower of finite extensions explicitly. For finite extensions `F⊂F'` of Q_p and nonzero x in `F'`, it states `L_F(N_(F'/F)x)=Tr_(F'/F)(L_(F')x)`. To prove it, embed `F'` into C_p. In characteristic zero the norm is the product of the conjugates σx over the F-embeddings σ, and the trace is the sum of the `σ(L_(F')x)`; the product law and equivariance then give the identity.

For a finite extension K of Q_p with absolute ramification index e and an integral depth i with `e<(p−1)i`, Tau Ceti supplies the exponential on `m_K^i`. It proves that the series converges (`TauCeti.hasSum_exp_of_mem_maximalIdeal_pow`) and is additive-to-multiplicative (`exp_add_of_mem_maximalIdeal_pow`). It proves `v(exp x−1)=v(x)` and `exp x∈U(K,i)` (`valuation_exp_sub_one`, `exists_mem_unitFiltration_eq_exp`). It proves that the two compositions are identities (`log_exp_of_mem_maximalIdeal_pow`, `exp_log_of_mem_unitFiltration`) and that `v(log u)=v(u−1)` on `U(K,i)` (`valuation_log`). Its logarithm is Mathlib's `NormedSpace.log`, which on `U(K,1)` is the series `log(1+(u−1))` above (`TauCeti.hasSum_log_of_mem_unitFiltration_one`), so it agrees with `localIwasawaLog K` there. Prove `localIwasawaLog_exp`: the Iwasawa logarithm inverts the exponential on `m_K^i`. With the addition law, exp and `log_p` are inverse isomorphisms of topological groups `m_K^i≅U(K,i)`. For `K=Q_p` the admissible depth is 1 at odd p and 2 at p=2. These are the balls `pZ` and `4Z₂` of the Conventions, and the chart generators `γ=1+p` and `γ=5` satisfy `‖log_p γ‖=‖γ−1‖`. (Tau Ceti's local exponential and logarithm modules, after Neukirch, Chapter II, §5.)

Transport the product decomposition of PadicFunctionalAnalysis §5.1, consumed through PadicMeasuresIwasawaAlgebras §3a.1, from its generator exp(q) to the chosen γ=1+p or γ=5. If h₀ is its additive coordinate, define `arithmeticAngularCoordinate h` by `h(u)=(q/log_p γ)h₀(u)`. The norm equality just proved shows that q/log_p γ is a unit of Z. Prove continuity, `h(uv)=h(u)+h(v)`, `h(γ)=1`, `h(Ω(u))=0`, and `γ^h(u)=α(u)` using the binomial power, together with uniqueness and the inverse coordinate. This identifies the chart used in §3.1 with the supplier’s chart, including its change-of-generator law in §5.2. (RJW, Remark 3.47, p.135, at odd p; at p=2 use the same transport on 1+4Z₂.)

The light Lean definitions are `HasIwasawaDecomposition` and `IsIwasawaLog`. The functions `iwasawaLog`, `localIwasawaLog` and `arithmeticAngularCoordinate` are README targets. The exponential comparison states the exponential comparison on the convergence ball `‖x‖<p^(−1/(p−1))`; the depth condition above places each specified integral ball inside it.

**Checks.**

* `log_p(1)=0` and `log_p(p^k)=0`. In Q_3, `log_3 63=log_3 7` because `63=3²·7`. A branch with value a at p gives `2a+log_3 7` instead, so the normalization at p is detected.
* At p=2 the root of unity −1 lies in the open disc around 1, so the series itself must vanish there: `log(1+(−2))=−Σ_(n≥1) 2^n/n=0` in Q₂. A logarithm set to zero on roots of unity by convention, without the addition law on the disc, cannot pass this test.
* Let i be an element of a field over Q_3 with `i²=−1`. Then `1±3i` are principal units with product 10, so `log(1+3i)+log(1−3i)=log 10`. In the unramified quadratic extension `Q_3(i)` this is the norm law, and equivariance gives `log(1−3i)=σ(log(1+3i))`.
* In Q_3, `‖log(1+3)‖=1/3`. In Q₂, `‖log 3‖=1/4`: the first two terms of the series cancel, and the term `2^4/4` is then the unique term of largest norm. At p=2 the depth condition `e<(p−1)i` excludes i=1, and indeed `log 3` and `3−1` have different norms.
* The hypothesis `n>0` in `eq_zero_of_pow_eq_one` is needed: `2^0=1`, while `log_3 2=log_3(4)/2≠0`. The pair `N=2,m=0` is admissible for 2 in Q_3, since `‖2²−1‖=1/3`.
* The series diverges at `z=p−1` for odd p, where `‖z‖=1`, so `log_p` is not one power series on `Eˣ`. The Gauss-norm completion of `Q_p(T)` fails the decomposition, and there a homomorphism agreeing with the series may send T to any value: the uniqueness theorem needs its hypothesis.
* A function with `L(p)=1` fails `IsIwasawaLog`, although `ℓ=log_p+v_p` agrees with `log_p` on units. The branch comparison at `x=p`, with `N=1,m=1`, reads `ℓ(p)=0+1·ℓ(p)`.
* A branch on C_p with the principal-unit series, value 0 at p and value 0 at zero equals `iwasawaLog p` on all of C_p by `existsUnique_isIwasawaLog_padicComplex`. Prescribing a different value at zero preserves the branch on C_pˣ but fails `IsIwasawaLog`.
* The transported angular coordinate has h(1)=0, h(γ)=1 and h(γ⁻¹)=−1. Every torsion unit has coordinate 0; in particular h(−1)=0 at p=2 although the sign coordinate of −1 is nontrivial. Keeping h₀ unchanged would give h₀(γ)=log_p(γ)/q in place of 1.

### Examples

The Mellin test `exp(−t)` and the smoothing test a=2 jointly fix analytic continuation at the Γ poles and the sign of the arithmetic moments. A common algebraic field handles rational and cyclotomic special values uniformly. Degree zero of an unrelated vector space, a zero coefficient ring or characteristic p do not satisfy the characteristic-zero embedding hypotheses of the comparison; the divided-difference construction itself is a real analytic statement. At p=2 the root of unity −1 lies in the logarithm's disc, so `log_2(−1)=0` is a consequence of the addition law for the series, not a convention; in Q_3 the normalization at p makes `log_3 63=log_3 7`.

### Dependencies

Mathlib’s Mellin, Γ, zeta, Bernoulli and Dirichlet-character theory; ArithmeticDirichletSeries Layers 1 and 3 (under `Completed/`); AutomorphicLFunctionsAndLocalFactors Layer AL.1, `hecke-l-functional-equation`, for the standard GL₁ comparison, with the Dedekind continuation and residue supplied by the pinned declarations in Exact supplier contracts. No p-adic measure or later analytic branch is needed here. The Iwasawa logarithm of §0.6 uses Mathlib's `PadicComplex`, `PadicAlgCl` and spectral norm, PadicFunctionalAnalysis §4.5 for the local `NormedSpace.logOneAdd` theory and §§5.1–5.2 for the unit chart, and Tau Ceti's local logarithm and exponential on deep principal units.

## Layer 1: integral smoothing and the zeta pseudomeasure

### 1.1 Binomial cancellation without inverting T

For a commutative ring R and a natural number a, define `smoothingDenominator R a` and `smoothingTail R a` coefficientwise by `q_a[n]=choose(a,n+1)` and `b_a[n]=choose(a,n+2)`. Prove the coefficient equations, `q_a[0]=a`, `Tq_a=(1+T)^a−1`, `q_a=a+Tb_a`, and naturality under every coefficient ring map. Their exponential-substitution identities are over a ℚ-algebra and use formal composition only with a zero-constant series. These statements include a=0 and rings of positive characteristic. (RJW, Proposition 4.4, p.137; the coefficientwise division is the integral algebra in its proof.)

If a is a unit of R, define `smoothedSeries a = b_a q_a⁻¹`, using the supplied unit inverse of q_a. Its full specification is `q_a F_a=b_a`, equivalently `Tq_a F_a=q_a−a`; uniqueness follows from the unit witness. Prove coefficient-map compatibility, independence of the unit witness, and the recurrence

```text
a f_n = choose(a,n+2) − Σ_(i<n) choose(a,n−i+1) f_i.
```

In a Laurent-series extension this agrees with `1/T−a/((1+T)^a−1)`, but the integral definition uses neither inverse of T. Over a ℚ-algebra, composition with `exp(t)−1` agrees with the formal smoothing kernel of Layer 0. Multiplying by q_a first proves the comparison without manipulating a nonexistent formal inverse of T.

The coefficient identities, unit-denominator equation, coefficient-map compatibility and uniqueness form the basic series interface.

**Checks.**

* `q_0=0`, `q_1=1`, `q_2=2+T`; the companion tails are respectively 0,0,1.
* If 2 is invertible, `F_2=1/(2+T)` has first coefficients `1/2,−1/4,1/8,−1/16`. Reversing the geometric-series sign changes the linear coefficient.
* `F_1=0`; a=0 does not have the required unit witness in a nonzero ring.
* Over `𝔽₂`, q₂ is T and is not invertible. The natural-number constructor q₂ is still defined; its smoothed-series constructor is excluded.
* In `F_2(exp(t)−1)` the cubic coefficient is `1/48`, hence its third derivative is `1/8`. Using the ordinary cubic coefficient of F₂ would give the wrong moment.

### 1.2 The arithmetic smoothing measure

For p∤a, define `smoothedMeasure p a` to be the existing integral inverse Amice transform of `F_a∈Z[[T]]`. Prove `amice_smoothedMeasure`, mass `(a−1)/2`, the all-test norm bound, uniqueness from its transform, and compatibility with every bounded coefficient extension. The rational mass formula is interpreted in Q and shown to be in Z; when p=2 the hypothesis forces a odd. Establish

```text
μ_a(x^k) = (1−a^(k+1))B_(k+1)/(k+1),        k≥0.
```

The proof compares ∂ with ordinary differentiation after the exponential substitution and uses the common rational scalar. Define the light rational abbreviation `smoothingMoment a k` by the right side. Its API includes a=1, k=0, scalar inclusion, and the derivative/ordinary-moment comparison. There is no assertion that every rational Bernoulli quotient is integral without its smoothing factor. (RJW, Definition 4.5 and Proposition 4.6, p.137; Lemmas 4.2–4.3, p.136.)

The signature `smoothedMeasure_moment` identifies the ordinary moments of the actual inverse-Amice smoothing measure. Its transform, all-test bound, natural-parameter cocycle and uniqueness are part of the construction; the cocycle is the natural specialization of §1.4.

**Checks.**

* At p=3,a=2, mass is `1/2`, first moment `−1/4` and third moment `1/8`.
* At p=2,a=3, mass is 1 and first moment `−2/3`, both in Z₂.
* At every prime a=1 gives the zero measure, not the Dirac measure at 1.
* `∂³F(0)=f₁+6f₂+6f₃`; with F₂ this is `−1/4+6/8−6/16=1/8`. This two-cancellation witness fixes the ordinary/binomial moment distinction.

### 1.3 Restriction and the inverse-weight numerator

Prove `psi_smoothedMeasure : ψμ_a=μ_a` on the actual integral measure. The coefficient calculation uses a finite root trace or the integral coefficient recurrence; a Laurent rational expression is only a comparison on its domain. Define `unitSmoothedMeasure a = ρ_a = Eμ_a`. Prove support on U, `ρ_a=μ_a−φμ_a`, `ψρ_a=0`, the coefficient-projector formula, zero total mass and

```text
ρ_a(x^k)=(1−p^k)(1−a^(k+1))B_(k+1)/(k+1).
```

Define `smoothedNumerator a = ν_a = Jμ_a` on Z, and `intrinsicNumerator a = λ_a = r_Uν_a` on U. Their API gives all-test evaluation, extension by zero, support, `xν_a=ρ_a`, `ψν_a=0`, norm at most 1, and for k≥1

```text
λ_a(x^k) = (1−p^(k−1))(1−a^k)B_k/k.
```

The formula does not extend to k=0 by interpreting a negative exponent in natural-number arithmetic. The zero-th numerator moment is computed in Layer 3. The light abbreviation `clearingMoment p a k`, for k>0, denotes the displayed rational value. (RJW, Lemma 4.7, Proposition 4.8 and equation (4-3), pp.137–138.)

Use `unitSmoothedMeasure_apply`, `_moment`, `_support`, `smoothedNumerator_coordinate`, `intrinsicNumerator_extend` and `intrinsicNumerator_moment` for the restriction and weighting interfaces. The intrinsic numerator is characterized the intrinsic numerator by its coordinate-weighted pushforward and its positive moments on the native integral measure carrier.

**Checks.**

* At p=3,a=2, `ρ_a(1)=0` and `ρ_a(x)=1/2`; it is neither μ_a nor a measure supported on the nonunits.
* The same data give `λ_a(x)=0` and `λ_a(x²)=1/2`. The extra inverse coordinate changes the moment index.
* At p=2,a=3, `λ_a(x²)=2/3`; omitting the p Euler factor gives `−2/3`.
* For any continuous f vanishing on U, `ν_a(f)=0`; for the test x, `ν_a(x)=ρ_a(1)=0` even though ν_a need not be zero.
* Extension of λ_a by zero is ν_a on every continuous test, not merely on powers.

### 1.4 Smoothing by every p-adic unit

For u∈U, use the existing integral binomial coefficients `binom(u,n)` to define `padicSmoothingDenominator` and its tail with the same coefficient shifts. Define `padicSmoothedSeries u = b_u q_u⁻¹`, and its inverse-Amice measure `padicSmoothedMeasure u`. Apply E, J and intrinsic restriction to define `padicSmoothedNumerator u` and `padicIntrinsicNumerator u`. These are extensions of the natural-a constructions, proved by equality of binomial coefficients. Their API consists of coefficient recurrence, mass `(u−1)/2`, coefficient-map naturality, uniqueness, agreement at natural units, all-test continuity in u, and the same positive-moment formula with u^k. Continuity first on binomial/polynomial tests and then on all continuous tests uses a uniform norm bound and Mahler approximation. At p=2 the displayed half is interpreted in Q and proved integral for u odd. (Extension of the algebra in RJW, Proposition 4.4 and §4.3, pp.137–139, using its §3 binomial calculus; continuity in a is obtained by that calculus.)

Prove the cocycles

```text
μ_(uv)=μ_u + u σ_u μ_v,
ν_(uv)=ν_u + σ_u ν_v,
λ_(uv)=λ_u + δ_u*λ_v,
(δ_v−1)λ_u=(δ_u−1)λ_v.
```

In the first line the extra scalar u is essential; in the numerator line inverse weighting cancels it. Verify the finite-exponent identity before using continuity. Commutativity of U then gives the cross-relation. These statements include u=1 and u=−1 and involve the actual constructed measures.

Name the parameter identities `padicSmoothedMeasure_mul`, `padicSmoothedNumerator_mul`, `padicIntrinsicNumerator_mul`, `padicIntrinsicNumerator_cross` and `padicSmoothedMeasure_continuous_apply`; the binomial coefficient definitions have `_coeff`, `_natCast` and `_map` equations. The p-adic parameter construction gives the unique native integral measure family with the binomial Amice transforms, its all-test cocycle and parameter continuity.

**Checks.**

* u=1 gives zero for each series and measure; its denominator is the constant series 1.
* u=−1 gives `q_u=−(1+T)⁻¹`, `F_u=−1`, `μ_u=−δ_0`, and `ν_u=λ_u=0`. Extending the numerator formula to the original smoothing measure would fail.
* At p=3,u=1/2, the first two coefficients of F_u are `−1/4,1/16`, and `λ_u(x²)=−1/8`.
* At p=3,u=2,v=4, the first-moment cocycle is `μ_8(x)=−21/4 = −1/4 + 4·(−5/4)`; the scalar in the measure cocycle is u² at this test.
* For u=−1 the numerator cocycle gives `λ_(−v)=δ_(−1)*λ_v`; the vanishing of λ_(−1) does not identify δ_(−1) with δ_1.

### 1.5 Finite residue masses and the carry identity

For a natural unit a and m≥0 let `q_m=p^m`, let c_m(r) be the actual finite projection of μ_a at `r∈ZMod q_m`, and put `v_r=(a⁻¹r).val`. Define the rational expression `smoothingResidueCandidate a q_m r v_r = (a−1)/2+(r.val−a v_r)/q_m`. The residue API proves that c_m is this candidate, that its sum is `(a−1)/2`, and that projection to a lower m sums over all lifts. In particular the q_m in the denominator is a positive natural integer, even at m=0. It is inverted in the characteristic-zero coefficient field, not declared to be a unit of Z.

With `N_a(r)=#{0≤i<a : i≡r mod q_m}`, prove

```text
(r−a).val−r.val = −a+q_m N_a(r),
(a⁻¹(r−a)).val−v_r = −1+q_m [r=0],
c_m(r−a)−c_m(r) = N_a(r)−a[r=0].
```

Translation of the actual measure proves the last recurrence. Prove `smoothingResidue_unique`: for q>0, a unit a in `ZMod q` and functions c,c′ from `ZMod q` into a characteristic-zero field, equality of the differences `c(r−a)−c(r)=c′(r−a)−c′(r)` for every r and equality of the total sums imply c=c′. Their difference is constant along the orbit of the additive generator a, and summing gives q times that constant equal to zero. Apply this to the candidate and the actual masses. State the unit witness in `ZMod q_m` explicitly. These are arithmetic consequences of the integral smoothing identity and finite projection, rather than a claim that the source separately names this formula. (RJW, Proposition 3.16, pp.121–122, and Proposition 4.4–4.6, p.137.)

Use `smoothingResidueCandidate_eq_mass`, `_sum`, `_refine` and `_difference`; `smoothingResidue_carry` records the two least-residue carries used in the proof.

**Checks.**

* At p=3,a=2,m=1, the masses at 0,1,2 are `1/2,−1/2,1/2`; they sum to `1/2`.
* At m=0 there is one residue, v=0, q_m=1, and its mass is `(a−1)/2`; the recurrence has right side `a−a=0`.
* At p=2,a=3,m=1, the two masses are 1 and 0. They are integral without requiring 2 to be a unit.
* At a=1 every candidate mass is zero. Changing the numerator to `a v_r−r.val` reverses the nonconstant masses and fails the p=3 example.
* In the uniqueness theorem q=1 reduces to equality of the single mass. The unit hypothesis is essential: with a=0 at q=2, all cyclic differences vanish but functions (0,0) and (1,−1) have the same sum and differ. In characteristic dividing q, different constant functions can have the same total sum, so characteristic zero cannot simply be omitted.

### 1.6 Removing the smoothing parameter

Let `kubotaLeopoldtPseudomeasure ζ_p` be the unit-measure adapter of IntegralIwasawaTheory §5.0, normalized by `bernoulliStickelberger_dictionary` in its §6.3 and the equations in Exact supplier contracts. Take the natural unit a=p+1. Its infinite-order group element has `δ_a−1` regular by the precise generic supplier contract for the actual unit group. Identify the local smoothing numerator on every continuous test by `(δ_u−1)ζ_p=λ_u`, for every u∈U. Thus the adapter satisfies `ζ_p=λ_a/(δ_a−1)` and agrees with every other regular smoothing presentation. Uniqueness and parameter independence are transported from the canonical object. This includes dyadic U, which is not procyclic; no “choose a topological generator of all of U₂” argument is used. For any nontrivial continuous K-valued unit character κ, an admissible smoothing unit u gives

```text
ev_κ(ζ_p) = λ_u(κ)/(κ(u)−1).
```

Transport the canonical cross-relation before dividing. For k≥1 the supplied interpolation gives

```text
ev_(x^k)(ζ_p)=(1−p^(k−1))ζ(1−k).
```

Both sides are the p-adic image of a rational scalar. At k=1 the Euler factor is zero; the possible Bernoulli convention discrepancy is therefore harmless only after proving that boundary separately. For k>1, parity removes the sign from Layer 0. Prove `zeta_reflection : δ_(−1)*ζ_p=ζ_p`, vanishing on odd test characters, and uniqueness from its positive moments. Transport this same object through the canonical measure/completed-algebra equivalence and its localization extension. At odd p it lies in the plus corner with `e⁺=(1+δ_(−1))/2`; the quotient comparison uses that normalized projector. At p=2 retain the integral sign relation without dividing by 2. (RJW, Theorem 4.1 and Definitions 4.9–4.10, Proposition 4.11, pp.136,138–139; Lemma 3.36, Definition 3.37 and Lemma 3.38, pp.130–132.)

The arithmetic pseudomeasure interface consists of clearing, uniqueness, admissible evaluation, moments, reflection and the plus-corner comparison, the last restricted to odd p. The all-test comparison identifies the supplied integral numerator at every unit with inverse-coordinate restriction of the binomial smoothing measure. Positive-moment separation identifies any integral numerator family with those supplied clearing numerators, giving the clearing equation for the same supplied pseudomeasure.

**Checks.**

* At p=3,k=2 the value is `1/6`; numerator `λ_2(x²)=1/2` divided by `2²−1=3` gives that value.
* At p=2,k=2 it is `1/12`; numerator `λ_3(x²)=2/3` divided by 8 gives that value.
* At k=1 the value is 0, including p=2; at odd k>1 the Bernoulli value vanishes.
* At u=−1, the clearing product is zero. This does not permit division by `δ_(−1)−1`, which is a zero divisor.
* At odd p the unscaled orbit sum `1+δ_(−1)` sends a plus element to twice itself. It is not the identity of the plus corner.

### 1.7 Bounded congruences and the nonmeasure obstruction

For finitely many positive exponents k_i and coefficients c_i in Q, prove the generalized smoothed Kummer bound

```text
sup_(u∈U) ‖Σ c_i u^k_i‖ ≤ p^(−r)
    ⇒ ‖Σ c_i clearingMoment(p,a,k_i)‖ ≤ p^(−r),     r≥0.
```

The proof is evaluation of the actual integral λ_a. For r≥1 and `k≡l mod p^(r−1)(p−1)`, deduce the corresponding congruence of the cleared moments. Divide out the smoothing factors only with their exact norm loss. In particular the usual unsmoothed precision is valid when both `1−a^k` and `1−a^l` are units. More generally, for nontrivial characters κ_i and a common smoothing g with `d_i=κ_i(g)−1≠0`, a pointwise bound on `Σ(c_i/d_i)κ_i` bounds `Σc_i ev_(κ_i)(ζ_p)`. Do not drop the d_i from that pointwise hypothesis. (Arithmetic consequence of RJW, §4, pp.136–139 and the bounded dual of §3.2, pp.119–120; compare the scope of Remark 2.18, p.117.)

Prove `zeta_positive_moments_unbounded` and `zeta_not_bounded_field_measure`. With `n_r=2(p−1)p^r`, von Staudt–Clausen gives `v_p(B_(n_r))=−1`; the p Euler factor is a unit, and division by n_r makes the norms grow as `p^(r+1+v_p(2))`. Every bounded K-valued measure on compact U has all monomial moments bounded by its operator norm since the monomials have sup norm 1. Thus there is no bounded field-valued measure with these positive moments. The obstruction concerns the actual continuous dual, not a norm arbitrarily placed on a weak measure carrier.

Use `clearingMoment_kummer`, `zetaMoment_kummer_with_denominators`, `zeta_positive_moments_unbounded` and `zeta_not_bounded_field_measure` for these arithmetic consequences of bounded evaluation.

**Checks.**

* At p=3 the k=2 zeta value `1/6` is not integral, although `λ_2(x²)=1/2` is integral. This defeats an unconditional unsmoothed integrality assertion.
* At p=2 the sequence n_r=`2^(r+1)` has moment norm `2^(r+2)`, so even allowing a fixed field-valued measure bound cannot repair it.
* The zero linear combination satisfies every bound; the a=1 numerator is zero but gives no nonzero smoothing denominator.
* A finite coefficient extension preserves the all-test integral bound when its scalar inclusion is bounded; an arbitrary algebra map without that condition is not an analytic coefficient extension.

### Examples

At p=3,a=2 one construction yields simultaneously Amice coefficients `(1/2,−1/4,1/8,−1/16)`, ordinary third moment `1/8`, finite masses `(1/2,−1/2,1/2)`, unit first moment `1/2` and zeta second moment `1/6`. These are different projections of the same measure. Agreement of only a few moments is not used as a definition or a uniqueness theorem.

### Dependencies

Layer 0; IntegralIwasawaTheory §5.0, `kubotaLeopoldtPseudomeasure` and `kubotaLeopoldt_interpolation`, and §6.3, `bernoulliStickelberger_dictionary`; PadicMeasuresIwasawaAlgebras §§0.1, 1.1–1.7, 2.1–2.6, 2.8, 2.11–2.12, 3.1–3.3 and 3a.1 for measures, unit charts, coefficient extension, regularity and localization comparisons; existing Bernoulli denominator arithmetic. The finite residue recurrence uses no locally analytic distribution or logarithmic primitive.

## Layer 2: finite characters, tame measures and coefficient descent

### 2.1 Continuous lifts at p-power levels

For `χ : DirichletCharacter R (p^n)` define `primePowerCharacter χ` as the continuous function `z↦χ(red_n z)`. Its API gives evaluation, natural-number comparison, multiplicativity, character products, principal values on units, nonunit vanishing for n≥1, and change of positive p-power level. At n=0 the lift is the constant 1, including at z=0. Define `primePowerArithmeticCharacter χ k` on U by `χ(red_n u)x(u)^k`; bundle it as a native continuous monoid homomorphism. Prove its values at 1 and −1, its product and level-change laws, and its level-zero and weight-zero specializations. (RJW, §5.1, equation (5-1), pp.139–140; the level-zero distinction is the native character convention.)

Define `twistedSmoothedMeasure χ a = weight(primePowerCharacter χ)(μ_a)` after the stated bounded coefficient extension. Also define the additive twist at any c and any additive character e by weighting with `z↦e(c red_n z)`. These are actual measures with the all-test evaluation formula. Prove a=1 vanishing, zero additive index, trivial additive character, successive multiplicative twisting, principal positive-level projection Eμ_a, and compatibility under coefficient maps and positive-level change. The additive construction needs no Gauss denominator or primitive multiplicative character.

Use `primePowerCharacter_apply`, `_zeroLevel`, `_principal_positiveLevel`, `_raiseLevel`, `_mul`, `_map`, `twistedSmoothedMeasure_apply` and `_map` for the finite lifts and their actual measure weights.

**Checks.**

* At p=3,n=0, the lift takes value 1 at 0; at n=1 the principal lift takes value 0 there and value 1 at 1.
* At p=3,a=2, the first moment of the positive-level principal twist is `1/2`, while that of the level-zero twist is `−1/4`.
* At p=2,a=3 the positive-level principal first moment is `2/3`.
* Twisting χ and then χ⁻¹ recovers Eμ_a on Z, not μ_a; it recovers the starting measure on U.
* At p=2,n=1,a=3, the additive sign twist has first moment `−2`, whereas μ_a has first moment `−2/3`.
* At p=3, quadratic χ modulo 3 and k=1 give value +1 at −1; with k=0 they give −1. At p=2,n=1,k=2 the arithmetic character at 5 is 25.

### 2.2 Fourier comparison and smoothing interpolation

For primitive χ of conductor p^n, n≥1, and primitive additive root ε, prove the actual twisting identity

```text
A_(χμ)(T) = G(χ⁻¹,ε)⁻¹ Σ_(c mod p^n) χ⁻¹(c) A_μ(ε^c(1+T)−1).
```

The sum is over every residue, with zero character values at nonunits. Prove the Fourier orthogonality identity at all z∈Z, including nonunits, before integrating. Its Gauss denominator is nonzero by the library primitive product theorem. The formula is a convergent evaluation/rotation statement on strict discs or an equality in the supplier's correct coefficient space, not an unrestricted formal composition at a nonzero constant. For the integral smoothing measure it agrees with the finite complex kernel `g_(χ,a)(t)=−f_χ(t)+aχ(a)f_χ(at)` below. Derivative comparison gives

```text
∫_U χ(x)x^k dλ_a = (χ(a)a^k−1)L(χ,1−k),      k≥1.
```

The common algebraic field is explicit. Cancelling an admissible denominator yields `ev_(χx^k)(ζ_p)=L(χ,1−k)` for primitive nontrivial p-power χ. The p Euler factor is 1 because χ(p)=0. With an imprimitive positive-level principal character, use its inducing conductor and retain `1−p^(k−1)` instead. (RJW, Theorem 5.1, Lemmas 5.4–5.5, pp.139–143.)

Name the finite identities `smoothedAdditiveTwist_transform`, `smoothedFourierTwist_eq`, `smoothedCharacterKernel_moment` and `twistedSmoothedMeasure_interpolation`; each uses the specified character orientation and level.

**Checks.**

* The two terms of the quadratic character modulo 3 have weights `+1,−1`; inverse Fourier weighting agrees with it, while a quartic character modulo 5 distinguishes χ from χ⁻¹.
* At z=0 a nontrivial primitive character gives zero on both sides by character-sum cancellation. Dropping the primitive hypothesis and retaining the same denominator is invalid.
* Modulus 1 is excluded from this nontrivial Fourier proof; its character lift and twist remain defined by §2.1.
* At p=2 there is no nontrivial primitive character of conductor 2; conductor 4 is the first nontrivial dyadic test.

### 2.3 The finite tame kernel

Let D>0, let η be an R-valued character modulo D, and suppose D is a unit of the commutative coefficient ring R. Define

```text
Q_η(T)=−Σ_(a mod D) η(a)q_(a.val)(T),
F_η(T)=Q_η(T)/q_D(T).
```

The definitions make sense for principal η as algebraic expressions, but their L-function interpretation below requires η nonprincipal. Prove `coeff_tameNumerator`, coefficient-map compatibility, the unit-denominator identity and unique solution property. The recurrence is

```text
D f_n=−Σ_a η(a)choose(a.val,n+1)
          −Σ_(i<n) choose(D,n−i+1)f_i.
```

In particular `F_η(0)=−D⁻¹Ση(a)a.val`. If η is nonprincipal over a domain, `Ση=0`, so with Y=1+T, `(1−Y^D)F_η=Ση(a)Y^a.val`. For a primitive η this also equals `−G(η⁻¹,ε)⁻¹Ση⁻¹(c)/(Yε^c−1)` after extension to a splitting field. The finite q_D formula avoids adjoining ε and makes descent visible. (RJW, §5.2, equation (5-3) and Lemma 5.9, pp.143–144; finite numerator obtained by canceling the character sum.)

The light series adapter is named `tameSeries`. Its unit-denominator equation over a commutative ring needs no nonprincipality, while its identification with the tame L-series kernel does. Prove coefficient formulas, coefficient-map compatibility and uniqueness for the finite numerator and quotient.

**Checks.**

* For quadratic η modulo 3, `Q_η=1+T` and `F_η=(1+T)/(3+3T+T²)`, with coefficients `1/3,0,−1/9,1/9`.
* For the principal character modulo 3, `Q_η=−3−T`; the unsimplified Dirichlet numerator has value 2 at Y=1. The identity obtained using `Ση=0` fails.
* At D=1 both Q_η and F_η are zero; this is not the zeta pseudomeasure.
* At p=3 the quadratic-modulo-3 scalar series can be formed over Q₃, but `‖F_η(0)‖=3`. The tame integral claim requires p∤D.

### 2.4 Integral tame coefficients and measures

Now take p∤D and η valued in O. The recurrence and the unit D show `‖F_η[n]‖≤1` by induction. Bundle the coefficient sequence as the supplier's bounded sequence `tameCoefficientSequence`, with pointwise specification, norm bound and uniqueness. Its inverse Amice transform is `tameMeasure μ_η`. Prove `A_(μ_η)=F_η`, the mass formula, norm at most 1, uniqueness and coefficient extension. Define `integralTameSeries` in O[[T]] by the same unit-denominator expression and `integralTameMeasure μ_η^O` by integral inverse Amice. Equivalently its evaluation is the unique O-valued lift of `μ_η^K(ι∘f)`. Prove all-test inclusion, bound, O-linearity, coefficientwise Amice inclusion and uniqueness; do not define the integral object solely by equality of its first moments. (RJW, §5.2, p.144, and its finite-extension conventions in §3.5, pp.124–128.)

For primitive nonprincipal η, compare its ordinary moments with the common algebraic values `L(η,−k)`, k≥0, and prove `ψμ_η=η(p)μ_η`. Therefore

```text
Eμ_η=μ_η−η(p)φμ_η,
(Eμ_η)(x^k)=(1−η(p)p^k)L(η,−k).
```

For imprimitive nonprincipal η the finite series still exists; its comparison uses the character's actual level Euler factors as in §0.4, not an assertion of primitivity. For principal η the finite adapter still exists, but the removed nonzero character sum changes its kernel; no unsmoothed principal L-value comparison is asserted for that adapter. The principal arithmetic family is §5.8. The integral measure and its O version remain equal after every specified coefficient extension. The coefficient bound holds over an ultrametric normed field with unit-norm level and bounded character values. The signature `existsUnique_tameMeasure` constructs the measure with its full Amice transform, all-test bound and every ordinary generalized-Bernoulli moment. It retains nonprincipality and allows imprimitive characters over a complete ultrametric characteristic-zero field with bounded continuous Z-action. The O-valued lift is the integral construction specified above.

Prove the coefficient sequence specification and bound, the transform and ordinary moments of the measure, its ψ equation and coefficient-map compatibility, and the all-test inclusion of the integral lift.

**Checks.**

* At p=2, quadratic η modulo 3 gives mass `1/3`, second ordinary moment `−2/9`, and unit mass `2/3` because η(2)=−1.
* At the same data its first Amice coefficient is zero; that does not imply the second ordinary moment vanishes.
* D=1 gives the zero coefficient sequence and zero tame measure, even over a nonzero coefficient ring.
* The integral measure sends 0 to 0 and satisfies `μ_η^O(rf)=rμ_η^O(f)` for every r∈O; this is an all-test integral statement.
* At p=3 the constant `1/3` fails membership in O, exposing the missing coprimality hypothesis.

### 2.5 Smooth complex tame kernels

For a complex character η modulo D define `tameComplexKernel η` by

```text
f_η(t)=−D⁻¹ β(Dt) Σ_(a mod D) η(a) dslope(exp(a.val·−),0,t).
```

This defines the removable value at 0 explicitly. Prove smoothness, `f_η(0)=−D⁻¹Ση(a)a.val`, the divided-difference product identity, coefficient-map interpretation over a common algebraic field, and, for nonprincipal η, agreement with `Ση(a)exp(at)/(1−exp(Dt))` away from 0. For primitive nonprincipal η its derivatives decay exponentially, its normalized Mellin continuation is `−η(−1)L(η,s)`, and its kth derivative at 0 is `L(η,−k)` by the parity identity. Define `smoothedCharacterKernel χ a = −f_χ(t)+aχ(a)f_χ(at)`; prove its origin value, a=1 vanishing, the a=0 formula and the Fourier comparison of §2.2. (RJW, Lemmas 5.5 and 5.9, pp.141–144, interpreted using Theorem 2.4.)

Use `tameComplexKernel_zero`, `_of_nonprincipal`, `_derivative_zero`, `_decay` and `_normalizedMellin`, and `smoothedCharacterKernel_zero`, `_one`, `_zero_parameter` and `_fourier` for the two smooth kernels.

**Checks.**

* Quadratic η modulo 3 has `f_η(0)=1/3` and `f_η(log 2)=2/7`.
* The principal character modulo 3 has `f_η(0)=−1`; its subtracted divided-difference kernel is not the unsmoothed principal L-series kernel.
* The unique character modulo 1 gives the zero function. This boundary cannot prove a classical zeta comparison.
* A quartic character modulo 5 with η(2)=i has origin value `(3+i)/5`; replacing η by its inverse changes the imaginary term.
* For quadratic χ modulo 3, a=4 gives `g_(χ,4)(0)=1`; for quadratic χ modulo 4, a=3 gives `−2`. These distinguish the smoothing factor aχ(a) from χ(a) alone.

### 2.6 Tame zeta on units

For nonprincipal η, let `intrinsicTameZetaMeasure ζ_η^U` be the tame measure of IntegralIwasawaTheory §5.0 in the inverse-weight normalization of its §6.3. Identify it on all tests with `r_U Jμ_η` for the finite kernel of §2.4. Its extension by zero is `tameZetaMeasure ζ_η = Jμ_η`. Identify their O-valued versions by the same all-test inclusion. Transport support, `xζ_η=Eμ_η`, ψ-annihilation, restriction/extension inverse laws, coefficient inclusion, norm at most 1 and uniqueness. The finite-kernel adapters at principal η retain these restriction and weighting definitions without a canonical principal-measure comparison. For nonprincipal η, the supplied positive moments are

```text
ζ_η^U(x^k)=(1−η(p)p^(k−1))L(η,1−k),       k≥1.
```

Only the actual intrinsic object is used for multiplicative convolution and character evaluation. For a p-power χ, define `twistedTameMeasure χ η = weight(w_χ)μ_η` on Z and `integralTameCharacterMeasure χ η = weight(χ|_U)ζ_η^U` on U. Their API gives evaluation, successive twists, inverse-character cancellation on U, principal invariance on U at every level, positive-level principal unit projection on Z, coefficient extension and norm bounds. The canonical-object comparison takes the supplied unit measure and its positive Euler-deleted generalized-Bernoulli moments, identifies the unique integral adapter with it, and gives its all-test bound over a complete ultrametric characteristic-zero coefficient field with bounded continuous `ℤ_p`-action, unit-norm tame level and bounded character values. It includes imprimitive nonprincipal characters; the finite-kernel comparison retains this coefficient generality. For nonprincipal η, let ψ₀ denote the primitive inducing character of χη. The interpolation theorem reads

```text
ζ_η^U(χx^k)=(1−ψ₀(p)p^(k−1))L(ψ₀,1−k),
```

with any additional level Euler factors stated when η or χ is intentionally imprimitive. For primitive nonprincipal tame η and primitive p-part χ this is the source's product-character formula, including the trivial p-part. The proof compares the actual Fourier-twisted series, its common algebraic value and the unit projector. (RJW, Theorem 5.7, Lemmas 5.10–5.12 and Definition 5.13, pp.143–146.)

Name the interfaces `tameZetaMeasure_apply`, `_support`, `_coordinate`, `intrinsicTameZetaMeasure_extend`, `_moment`, `integralTameCharacterMeasure_apply`, `_inverse_twist` and `_include_apply`. The positive-moment comparison uses the coordinate-weighted pushforward comparison with the actual tame Amice measure. The twisted intrinsic integral obeys `tameCharacterValue_norm_le_one` and `tameCharacterValue_sub_le`: the latter bounds the difference of two values by the sup norm of the difference of their actual continuous tests.

**Checks.**

* At p=2, quadratic η modulo 3 gives `ζ_η^U(x)=2/3`, whereas `(Eμ_η)(x)=0`. Inverse weighting is indispensable.
* For that η and quadratic χ modulo 4, the twisted zeta second moment is `−2`; the untwisted second moment is 0.
* The principal lifts at modulus 1 and modulus 4 give the same twist on U, though their functions on Z differ at 0.
* The integral inverse twist recovers ζ_η^U, and its extension by zero is killed by ψ.
* At D=1 all these tame constructors are zero; the principal zeta object is instead §1.6.

### 2.7 The character field and descent

Define `tameCharacterField η` as the native subfield of a chosen finite extension K generated by the image of Q_p and the finite set of values of η. Prove finite dimensionality, completeness, the induced norm and compatibility of its integer ring. Define `tameCharacterInField` by taking the same values with membership proofs. Its API gives inclusion equality, unchanged conductor/primitivity, zero and unit values, uniqueness under the inclusion, and generation minimality. Construct F_η and its finite-kernel measures over this field. Identify their nonprincipal intrinsic adapter with the character-field measure supplied by IntegralIwasawaTheory §5.0. The finite numerator recurrence identifies extension into K on all tests. Transport transitivity of coefficient extension, descent of every finite projection and of the intrinsic zeta measure, and uniqueness from all-test inclusion. A splitting field for ε is only needed for the Fourier proof, not for the resulting coefficient field. (RJW, Remark 5.8(2), p.143; finite formula (5-3), p.144.)

Prove inclusion, preservation of conductor and primitivity, generation minimality, and descent of the finite series, its measure and its intrinsic zeta adapter.

**Checks.**

* A quadratic η has values in Q, so its local generated field is Q_p even if K contains extra roots of unity.
* A quartic η with value i needs Q_p(i) unless i already lies in Q_p; the definition does not force the larger cyclotomic field Q_p(ε_D).
* At D=1 the field generated by the values is Q_p and the tame measure remains zero.
* Inclusion sends every finite residue mass to the corresponding K mass; checking only the mass at the whole space would not characterize descent.

### 2.8 Level raising and arithmetic Euler deletion

For a nonprincipal tame η at positive level D and a prime ℓ prime to p, identify IntegralIwasawaTheory §5.0’s conductor comparison with the finite tame series of its level-raised character and the native pushforward operator. At ordinary moment degree r the multiplier is `1−η(ℓ)ℓ^r`; equivalently the additive measure operator is `1−η(ℓ)σ_ℓ`. For the inverse-weighted intrinsic zeta the operator becomes `1−η(ℓ)ℓ⁻¹δ_ℓ*`, since `Jσ_ℓ=ℓ⁻¹σ_ℓJ`. Prove the identity on actual transforms and all tests, then its finite-product version for D dividing a positive tame level N. A prime already in the original level introduces no further deletion, and repeated exponents do not repeat a factor. Coefficient extension and finite twists commute with this comparison when their character factors are included. Nonprincipality is retained under level raising. (RJW, §5.2, pp.143–146, together with Mathlib's `DirichletCharacter.LFunction_changeLevel`; the finite-series identity follows from character-sum cancellation and deletion of multiples of ℓ.)

Use `tameZetaMeasure_raiseLevel_prime`, `_raiseLevel`, `_same_prime_support` and `_map` for this comparison, each with the nonprincipal hypothesis on η. The prime-level and same-prime-support finite-series comparisons carry `η ≠ 1` explicitly over a field in which both levels are units. Primitivity is unnecessary for these finite identities: the cancellation `Ση=0` holds for every nonprincipal character over a field. The prime substitution is `T↦(1+T)^ℓ−1`, whose constant coefficient is zero.

For principal arithmetic Euler deletion at tame level D, apply `∏_(ℓ|D)(1−ℓ⁻¹δ_ℓ*)` to `kubotaLeopoldtPseudomeasure` from §1.6. Its positive x^k value acquires `∏_(ℓ|D)(1−ℓ^(k−1))`. Coordinate weighting transports this product to `∏_(ℓ|D)(1−δ_ℓ*)` on `Tw_x(ζ_p)`, giving the localized constant of `principalTameEisensteinSeries` in §5.8. Principal arithmetic deletion therefore depends only on the deleted prime set; the finite principal tame-kernel adapters remain the separate objects of §§2.3–2.4. (RJW, §4, pp.136–139, §5.2, pp.143–146, and §8, pp.159–161; finite Euler deletion by inclusion-exclusion.)

**Checks.**

* At ζ moment x^k, the factor is `1−η(ℓ)ℓ^(k−1)`, not `1−η(ℓ)ℓ^k`.
* At p=2 the primitive principal character at D=1 gives `F_η=0` and `μ_η=0`. Its level-three finite adapter has `Q_η=−3−T`, `q_3=3+3T+T²` and mass −1; the denominator's constant 3 is a unit in Z₂. Thus this adapter is not the Euler operator applied to the level-one zero measure.
* The principal finite additive adapters at levels 3 and 9 have masses −1 and −3. Their arithmetic pseudomeasures and the §5.8 principal families do agree, since both delete only 3.
* For quadratic η modulo 3 at p=2, raising the level to 9 preserves the finite series and its mass 1/3. This is the nonprincipal same-prime-support identity.
* A character already zero at ℓ gives factor 1. Deleting a prime not dividing the new level is not permitted.
* The finite-product identity is independent of the order of new primes, by commuting pushforwards on the actual unit group.

### Examples

For η quadratic modulo 3 at p=2, the rational finite kernel gives an integral measure without choosing a cubic root in the coefficient field. A cubic root can be adjoined to verify the Gauss expression, and coefficient descent brings the result back to Q₂. Weighting by the quadratic conductor-four character then gives a mixed conductor-12 interpolation value; the primitive product, rather than its chosen containing level, controls the p Euler factor.

### Dependencies

Layers 0–1; IntegralIwasawaTheory §5.0 for the canonical tame measures, descent and conductor comparisons, with §6.3’s normalization; Mathlib and Tau Ceti character, conductor, Gauss and generalized-Bernoulli interfaces; PadicMeasuresIwasawaAlgebras §§0.1, 1.1–1.7 and 2.1–2.12 for coefficient extension, weighting, unit restriction and finite projections. Analytic root rotations use LocallyAnalyticDistributions §§1.2 and 1.4 for strict-disc evaluation and root averages.

## Layer 3: analytic branches, logarithmic values and the principal pole

### 3.1 Arithmetic tests and analytic coordinates

For a finite continuous character `ν:U→Oˣ` and `s∈Z`, define the existing continuous multiplicative test

```text
κ_(ν,s)(u)=ν(u)⟨u⟩^(1−s).
```

For any actual integral unit measure μ put `N_(μ,ν)(s)=μ(κ_(ν,s))`. Its API includes evaluation at 1, additivity in μ, coefficient extension, the sup-norm bound, continuity and analytic dependence on s on each specified chart. The coordinate description is `κ_(ν,s)(u)=ν(u)κ_(γ−1)((1−s)h(u))`, using the supplied binomial character and the transported coordinate h of §0.6. If `F_(μ,ν)` is the actual component Mellin series, identify the numerator with

```text
N_(μ,ν)(s)=F_(μ,ν)(exp((1−s)L)−1),       L=log_p γ.
```

Prove this equality first on integer parameters by the transform comparison, then on the full chart by continuity. Prove its analytic version on the actual exponential ball; neither evaluation of a formal series at a nonzero constant nor a radius-free exponential identity is intended. Constant coefficient extraction gives `N(1)=μ(ν)`. A finite-order wild factor is retained in ν, rather than discarded by replacing ν with its torsion restriction. (RJW, Definitions 5.16 and 5.18, pp.146–147; the numerator version is their Mellin transform in the unit chart.)

Name the actual character test `arithmeticBranchTest`, its integral `arithmeticBranchNumerator`, and their equations `_apply`, `_one`, `_mul`, `_map` and `_analytic`; `arithmeticBranchNumerator_chart` identifies that integral with the scalar-series adapter.

**Checks.**

* At s=1 the test is ν and the numerator is its actual character integral; for ν=1 this is total mass.
* A Dirac measure at u gives `ν(u)⟨u⟩^(1−s)`. At `h(u)=1,s=0` its angular factor is γ, not 1.
* For the component series `F=X`, the analytic numerator is `exp((1−s)L)−1`, although its constant coefficient is zero.
* If an abstract chart has h=0, its tests are constant in s; no arithmetic chart comparison or pole theorem follows from that degenerate datum.
* At p=2, ν may contain the conductor-four sign. Replacing it by a character modulo 2 loses a component.

### 3.2 Cleared branches and interpolation

For the principal object supplied by IntegralIwasawaTheory §5.0 and identified in §1.6, use `λ_a=(δ_a−1)ζ_p`. Define its branch at an admissible parameter by

```text
Lp_(ν)(s)=N_(λ_a,ν)(s)/(κ_(ν,s)(a)−1),       κ_(ν,s)(a)≠1.
```

For a nonprincipal tame η define the branch everywhere by `ζ_η^U(κ_(ν,s))`; the same cleared quotient holds whenever its denominator is nonzero. The API gives independence of a on overlaps, a clearing identity, agreement with the intrinsic measure, compatibility with finite coefficient extension, and analyticity where the denominator is nonzero. Cross-smoothing is an equality of actual measures and gives the overlap identity before division. For a general local analytic numerator F and denominator data c,A, the scalar adapter has

```text
N_F(s)=F(exp((1−s)L)−1),
d_(c,A)(s)=c exp((1−s)A)−1,
Q_(F,L,c,A)(s)=N_F(s)/d_(c,A)(s).
```

Here `c=ν(a)` and `A=log_p⟨a⟩`; A is not automatically L. Give the three adapters evaluation at 1, zero and constant formulas, congruence, their clearing equation, and analytic germ statements on the nonvanishing locus. If c=1, then `d(1)=0` and `d'(1)=−A`. If c≠1, Q is analytic at 1. If c=1, A≠0 and F(0)≠0, Q has a simple pole there with residue `−F(0)/A`. The arithmetic principal branch is the latter case, proved in §3.7; a totalized central quotient is not its value.

Write θ for the primitive character inducing the product of η and ν at their specified levels. At an integer `k≥1`, the branch at `s=1−k` uses the primitive inducing character ψ of `ηνω^(−k)` and satisfies

```text
Lp_(ην)(1−k)=(1−ψ(p)p^(k−1))L(ψ,1−k),
```

with the extra level-deletion factors when the chosen finite test is imprimitive. Identify this branch with IntegralIwasawaTheory §5.0’s canonical character disc by the inverse-coordinate, Teichmüller and sign equations of its §6.3 in Exact supplier contracts. In its procyclic s-coordinate `S=γ^s−1` and this roadmap’s moment coordinate `T=γ^(1−s)−1`, the relation is `S=γ(1+T)⁻¹−1`. It sends the principal pole to T=0. This is an identity between embeddings of the common algebraic Bernoulli value, not an evaluation of a complex analytic function inside K. For the principal pseudomeasure k>0 gives an admissible smoothing parameter. The equivalent additive-measure test is `ν ω⁻¹⟨x⟩^(−s)` after inverse-coordinate weighting. Keeping only `ν⟨x⟩^(−s)` changes the character by ω. Prove parity: an odd test for the even zeta pseudomeasure is zero, and a branch whose finite factor is odd vanishes identically. (RJW, Definition 5.15 and Theorems 5.17 and 5.20, pp.145–148, read with the inverse-coordinate factor of Remark 5.19.)

The scalar numerator, denominator and quotient have the displayed formulas over any normed field; the arithmetic interpretation uses the complete characteristic-zero field, actual summability and exponential balls already specified. Prove the denominator derivative from the derivative of exp at zero. For a continuous numerator and a denominator with a simple zero, prove the quotient residue formula; a pole requires a nonzero central numerator. For native continuous tests agreeing near s₀ with `ν(u)exp((1−s)H(u))`, assume `‖1−s₀‖‖H‖<p^(−1/(p−1))` and the corresponding bound for A, and prove analyticity of the measure quotient when the denominator is nonzero. Arithmetic charts use `H(u)=log_p⟨u⟩`; the native continuous-test formulation also applies to arbitrary continuous coefficient factors ν.

**Checks.**

* For `F=C 1,c=2`, the value at 1 is 1. For `F=C 1,c=1,A≠0`, the central scalar formula is 0 while the germ has a pole; treating that scalar as the analytic value fails.
* `c=−1` gives central denominator −2, also in Q₂. `c=1,A=0` gives an identically zero denominator and supplies no pole conclusion.
* With `F=X,c=0`, Q is `1−exp((1−s)L)`, detecting the full numerator rather than its constant coefficient.
* At s=0 the primitive character in the interpolation formula is `ηνω⁻¹`. At s=−1 it is `ηνω⁻²`; using one fixed primitive character for every k fails.
* The principal and positive-level principal tests agree on U, so their intrinsic branch agrees; their additive lifts need not agree at 0.
* If ν(a)=1, choosing a different parameter that separates ν can remove a spurious denominator zero. It cannot remove the principal pole established below.

### 3.3 Negative moments and finite approximation

For a finite p-power-level χ and `r≥0`, define the inverse arithmetic character `κ⁻_(χ,r)(u)=χ(u)u^(−r)` as a native continuous monoid homomorphism, using inversion on U before the power. Define its tame value by the actual integral of `ζ_η^U`; define its principal value only through an admissible smoothing numerator. Prove agreement with inverse weighting of the original additive measure, the all-test norm bound, parity, cross-smoothing and coefficient extension. A parameter separating the inverse character exists exactly when that character is nontrivial. Among the arithmetic inverse characters this excludes precisely r=0 with trivial χ; finite χ cannot cancel a positive inverse power on the infinite-order angular subgroup. Thus the principal inverse moments for r>0 are legitimate, but the principal zeroth moment is not.

At finite group level n, replace the inverse character by its locally constant approximant. If its pointwise difference is in `p^t O`, its integral against an integral numerator differs by `p^t O`. After division by an admissible scalar d the precision loss is exactly bounded by `v_p(d)`. State this as an inequality in K and, when d is integral, as ideal membership after multiplication by d. Prove independence of representatives modulo the stated precision, compatibility with refinements, and convergence of the actual finite residue sums. These are congruence and convergence theorems for the constructed measure, with explicit hypotheses on precision and d. (RJW, Remark 5.19 and the unit-restriction construction, pp.146–148.)

Use `inverseArithmeticCharacter_apply`, `_principal`, `negativeMoment_cross`, `_quotient_independent`, `_finiteApproximation` and `_quotient_precision` for inverse tests and finite precision.

**Checks.**

* For χ=1,r=1 the test is the genuine continuous inverse coordinate on U and has norm 1, at every prime.
* For χ=1,r=0 no smoothing parameter is admissible. Returning 0 from a totalized quotient does not produce a zeroth principal moment.
* For odd χ with `χ(−1)(−1)^r=−1`, the principal inverse moment vanishes by parity.
* A quotient by a scalar of valuation t loses t digits of a numerator congruence. Claiming the same precision before and after division fails when t>0.
* Twisting twice by inverse finite characters recovers the original measure on U, including when one chosen level is positive and another is level 1.

### 3.4 Complex logarithmic values and their parity

Let θ be a nontrivial primitive character of conductor `N>1`. For the canonical complex root `ε=exp(2πi/N)`, define

```text
C_θ^C=−G(θ⁻¹,ε)⁻¹ Σ_(a mod N) θ⁻¹(a) Log(1−ε^a).
```

Terms with θ⁻¹(a)=0 are omitted, so Log is applied only to nonzero arguments. Its API gives root-choice covariance with the simultaneous Gauss normalization, coefficient-character conjugation, inverse-root pairing, and agreement `L(θ,1)=C_θ^C`. The proof integrates the finite Gauss kernel from Layer 2 on the positive real axis. On that axis the factors `1−ε^a e^(−t)` have positive real part, their logarithms have an exponentially decaying derivative and tend to 0. This controls the principal branch and both improper endpoints. It proves absolute integrability before exchanging the finite sum and integral. (RJW, Theorem 6.1(i) and proof, pp.148–150.)

For even θ, conjugate roots pair and the sum equals `Σ θ⁻¹(a)log|1−ε^a|`. For odd θ, use the actual principal phase

```text
Log(1−exp(2πi a/N))−Log(1−exp(−2πi a/N))
       = 2πi(a/N−1/2),                  0<a<N.
```

Consequently `C_θ^C=−πi B_(1,θ⁻¹)/G(θ⁻¹,ε)` for odd θ, with the Bernoulli convention of §0.4. The complex nonvanishing at 1 uses the existing Dirichlet nonvanishing theorem. Apply the lower-tier Baker interface to the actual finite sum: each nonzero `α_a=1−ε^a` is algebraic, every `β_a=−G⁻¹θ⁻¹(a)` is algebraic, and `exp(Log α_a)=α_a`. Prove algebraicity of these inputs and transcendence of the logarithm sum when nonzero. For transcendence, choose a Q-basis of the span of these logarithms, rewrite the sum with algebraic coefficients and use Baker independence of 1 and that basis. Repeated or Q-dependent logarithms are allowed; nonzero of the resulting sum, rather than independence of the original indexed family, is the required hypothesis. Dirichlet nonvanishing supplies it for this primitive nontrivial θ. Thus `complexDirichletValue_one_transcendental` follows. The Baker theorem is supplied by DiophantineApproximationAndTranscendence Layer 3, §3.5; it is not reproved by Mellin continuation. (RJW, p.149, footnote 10.)

Use `cyclotomicComplexKernel_integral`, `complexGaussLogValue`, `complexGaussLogValue_eq_LValue`, `_even_realLog` and `_odd_phase` for the complex logarithmic comparison.

**Checks.**

* For quadratic θ modulo 3, `G(θ,ε)=i√3` and the log difference is `−πi/3`; the result is `π/(3√3)>0`. Reversing either the leading sign or the phase reverses this value.
* For even θ, replacing each logarithm by its real part preserves the weighted sum; for the odd quadratic character modulo 3 that replacement gives zero and loses the value.
* In a quartic-character sum the coefficients are inverse-character values. Changing θ to θ⁻¹ without also changing the Gauss denominator does not preserve the formula.
* At N=1 the nontrivial-character hypothesis fails, and the excluded argument `1−ε^0=0` demonstrates why this constructor is not a principal value formula.
* The logarithm combination `Log 2−Log 2=0` fails the nonzero hypothesis. The dependent combination `Log 2+Log 4=3 Log 2` satisfies it and is covered after choosing a one-element Q-basis.
* The odd quadratic level-three value `π/(3√3)` is a nonzero algebraic multiple of π and is transcendental, agreeing with the Baker consequence; no transcendence conclusion is made for a zero parity projection.

### 3.5 Tame logarithmic primitives, traces and inversion

Take nonprincipal primitive tame η of conductor `D>1`, with `p∤D`, and enlarge the finite coefficient field only when needed to contain ε_D and the character values. Set `G=G(η⁻¹,ε)`, `w_a=η⁻¹(a)` and `z_a=ε^a`. Define the normalized formal primitive and its logarithm constant by

```text
H_η(T)=−G⁻¹ Σ_a w_a log_formal(1+z_a T/(z_a−1)),
C_η=−G⁻¹ Σ_a w_a log_p(z_a−1),
V_η(T)=C_η+H_η(T).
```

The sum is over units modulo D. Prove `H(0)=0`, `∂H=F_η`, uniqueness among primitives with constant 0, the coefficient formula

```text
[T^n]H = −G⁻¹(−1)^(n−1)/n · Σ_a w_a (z_a/(z_a−1))^n,    n≥1,
```

and covariance under changing ε. Every formal primitive differs from H by a scalar constant: ∂ is invertible on the formal derivative up to constants in characteristic zero. The chosen C supplies the arithmetic integration constant. On the strict unit disc `‖t‖<1`, the coefficient series has sum

```text
V_η(t)=−G⁻¹ Σ_a w_a log_p(z_a(1+t)−1).
```

Prove that every logarithm argument is a unit, the coefficient bound `‖[T^n]H‖≤‖G⁻¹‖·‖1/n‖`, summability on each smaller closed disc and equality of coefficient evaluation with the finite logarithm expression. In particular its coefficients need not be bounded, but they have at most the inverse-integer growth required for a locally analytic distribution. Multiplication by x identifies that distribution with μ_η, and its unit restriction with `ζ_η^U`. This comparison uses the native analytic-distribution equivalence, not an assertion that V is a measure on all Z. (RJW, Lemmas 6.4–6.5, pp.151–152.)

For any scalar logarithm with the stated multiplicative law, the constructors C, H and V have additive/coefficient-map and root-transport APIs. By the branch comparison of §0.6, every change of logarithm branch has the form `ℓ'(b)−ℓ(b)=c·v_p(b)`, and such a change alters C by the displayed weighted valuation sum. In the tame case all these valuations are zero, so C and V are independent of c. In the nonprincipal conductor case the same comparison follows by the weighted valuation cancellation at the specific cyclotomic arguments; it is not inferred from the condition that ℓ vanishes on roots of unity alone. Define the powered constant `C^[m]=−G⁻¹Σ w_a log_p(ε^(ma)−1)` with the explicit domain hypothesis `ε^(ma)≠1` for every unit a modulo D. The finite scalar adapter `cyclotomicLogConstant` is the displayed unit sum. Its arithmetic comparisons and those of the powered constant use the Iwasawa logarithm, primitive root and character hypotheses, and the nonzero-argument domain above. If m is coprime to D, `C^[m]=η(m)C`. The finite coprime reindexing identity holds for any scalar function L under the displayed root and argument-domain hypotheses. `tameZetaMeasure_logarithmic_mass` gives the reciprocal-Euler-factor logarithm formula for the intrinsic measure characterized by its positive moments. If a conductor prime divides m, first use character cancellation in its reduction fibers to prove the appropriate weighted powered sum is zero, with the zero arguments omitted only after the zero-character fiber has been treated.

For a primitive pth root ξ define the actual normalized trace and complement on the disc:

```text
Tr_p V(t)=p⁻¹ Σ_(0≤j<p) V(ξ^j(1+t)−1),
U_η(t)=V(t)−Tr_p V(t).
```

All shifted points remain in the strict unit disc. Prove these formulas, their coefficient-series counterparts and convergence, the constant identity, and

```text
Tr_p V_η(t)=η(p)/p · V_η((1+t)^p−1),
U_η(0)=(1−η(p)/p)C_η.
```

The proof multiplies the actual p logarithm arguments before using the logarithm law and reindexes a by pa; it never composes a formal series at a root-minus-one without convergence. It follows that U has trace zero. The additive integration constant cancels from V−Tr V because the normalized trace preserves constants. Prove inversion on the actual domain: for nonprincipal η,

```text
V_η((1+t)⁻¹−1)=η(−1)V_η(t).
```

For a finite coefficient weight satisfying the explicit inversion symmetry `w_(−a)=e w_a`, `e∈{±1}`, rather than a nonprincipal character, record the additional term `G⁻¹ log_p(1+t)Σ_a w_a` with the orientation obtained by factoring the inverted argument. It cancels in U even when it does not vanish in V. Thus U has that inversion parity under the same weight symmetry, without requiring the sum of the weights to vanish. Arbitrary weights without this symmetry have no asserted parity. At the inversion fixed points 0 and −2, an odd complement is zero whenever that point and all logarithm arguments belong to the declared domain; −2 lies in the strict disc only at p=2. (RJW, finite trace calculation in the proof of Theorem 6.1(ii), pp.152–153.)

Name the formal objects `normalizedTameLogPrimitive`, `cyclotomicLogConstant`, `tameLogPrimitive`, `cyclotomicPoweredLogConstant`, `cyclotomicLogDiscTrace` and `cyclotomicLogDiscComplement`. Their API has `_coeff`, `_constant`, `_derivative`, `_hasSum`, `_root_transport`, `_trace`, `_inversion` and `_branch_independent`, with the hypotheses and defects specified above rather than a parity assertion for arbitrary weights.

**Checks.**

* At p=3, for the even quadratic character η modulo 5, `cyclotomicPoweredLogConstant` at m=1 equals C and at m=2 equals −C, since η(2)=−1. At m=5 every argument is zero, so the nonzero-argument domain excludes this powered constant.
* For the finite adapters over Q, take η modulo 3 with η(1)=1, η(2)=−1 and ε=2. With L(x)=x, `cyclotomicPoweredLogConstant` at m=1,2,3 gives −1,−6,−28. For these m the exponents on units are m and 2m, so every argument is nonzero.
* With the same η and ε, `cyclotomicLogConstant` gives −1,−4,−13 for L(x)=x,x²,x³ respectively. These rational tests fix the finite-adapter normalization; arithmetic comparisons still require a primitive root and the Iwasawa logarithm.
* H has zero constant while V has C. A formal primitive equation alone leaves this constant undetermined.
* The nth coefficient costs `v_p(n)` in valuation, with no uniform bound asserted. At n prime to p it has bound `‖G⁻¹‖`.
* At t=0 the trace is `η(p)C/p`, not `η(p)C`; the complement has the reciprocal Euler factor.
* With η odd, C=0 by inverse-root pairing and `log_p(−1)=0`. The complex odd-character value of §3.4 need not vanish.
* At p=2, t=−2 is an allowed inversion fixed point, so an odd U there is zero; at odd p the strict-disc theorem does not assert a value there.
* Root transport must change G and the finite coefficients together. Transport of only ε in the logarithms changes the expression.
* For inversion-symmetric weights with nonzero sum, omitting the `log_p(1+t)` defect makes the inversion equation false; subtracting the normalized trace removes it.

### 3.6 Wild characters and the logarithmic value at one

For a primitive nontrivial character θ of conductor `N=Dp^n`, first construct its logarithmic primitive by finite Fourier twisting from a tame primitive when `D>1`. If `D=1`, start with the actual smoothed principal distribution and its primitive, twist by the primitive wild character, and use its cancellation on reduction fibers to remove the smoothing dependence and integration-constant ambiguity. Prove convergence of these analytic rotations and the derivative comparison before making any point evaluation. A formal substitution into `log T` at zero is not a construction. At positive wild conductor the primitive-character Fourier trace on the full set of p translates is zero. This includes conductor p, when it exists, and conductor 4 at p=2; a proof that assumes n>1 and leaves conductor p out is insufficient. The tame case is the trace formula of §3.5. (RJW, Lemmas 5.4 and 5.12, pp.140–141 and 144–145, Lemmas 6.4–6.5 and the two cases in the proof of Theorem 6.1(ii), pp.151–153.)

Identify the actual unit-restricted primitive and obtain Leopoldt's formula for every nontrivial primitive θ:

```text
Lp_θ(1)=−(1−θ(p)/p)G(θ⁻¹,ε_N)⁻¹
                    Σ_(a mod N)^× θ⁻¹(a)log_p(1−ε_N^a).
```

The reciprocal Euler factor is nonzero: if θ(p)=0 it is 1; otherwise θ(p) is a root of unity whereas p has positive valuation. Prove conductor descent and the imprimitive Euler deletions separately, all-test agreement with the character value of §3.2, branch invariance for the displayed cyclotomic logarithms, and compatibility under finite coefficient embeddings. The odd-character value is zero. The result identifies this finite logarithm expression with the analytic L-value; defining the latter to be that finite expression would not prove it. The corresponding formulas at higher positive integers are not targets here: the downstream roadmap ColemanIntegration proves them from its polylogarithms and its Frobenius-normalized comparison, on top of this weight-one comparison. (RJW, Theorem 6.1(ii), p.149 and proof pp.151–153; the higher-weight comparison is Theorem 6.7, p.154.)

Use `wildSmoothedLogPrimitive_value`, `wildCharacterTrace_zero`, `mixedCyclotomicLogConstant` and `leopoldt_value_one` for the three conductor cases and their common logarithmic comparison.

**Checks.**

* When p divides the conductor, θ(p)=0 and there is no reciprocal Euler subtraction. An artificial factor `1−1/p` is wrong.
* For tame θ, dropping `1−θ(p)/p` changes the unit-restricted value, even if the primitive constant is correct.
* A primitive wild odd character has zero value by parity, not because one declares every wild logarithm constant zero.
* The principal character is excluded; its s=1 behavior is a pole, treated next.
* A change of primitive root accompanied by the exact Fourier and Gauss transport leaves the value unchanged. Multiplying just the Gauss sum by a character factor changes it.

### 3.7 Principal numerator, residue and Bernoulli limits

Take the smoothing unit `a=p+1`, including at p=2, and the canonical principal branch `F₁(s)` supplied by IntegralIwasawaTheory §5.0. Use the all-test comparison of §1.6 and the branch dictionary of §3.2 to identify the actual smoothing numerator `N_a(s)=λ_a(⟨x⟩^(1−s))` on the punctured neighborhood of 1:

```text
N_a(s)=(⟨a⟩^(1−s)−1)F₁(s),
lim_(s→1, s≠1) (s−1)F₁(s)=1−p⁻¹,
λ_a(1)=N_a(1)=−(1−p⁻¹)log_p a.
```

The last equation follows from continuity of the actual numerator, the supplied residue and the derivative `−log_p a` of this same denominator. For the canonical s-coordinate numerator `P(S)=(1+S−γ)F₁(s)`, `S=γ^s−1`, this is the equivalent normalization `P(γ−1)=γ log_p(γ)(1−p⁻¹)`. The moment-coordinate substitution `S=γ(1+T)⁻¹−1` gives `1+S−γ=−γT/(1+T)`, retaining both its sign and its unit factor. No central value is assigned to the totalized quotient.

The mass is nonzero, of norm 1 at odd p and 1/2 at p=2: `v_p(log(1+p))=1` at odd p, while `v_2(log 3)=2`. Prove that truncation of the actual logarithm series at M≥1 has error at most `sup_(n≥M)‖p^n/n‖`, and prove the sharp norm after cancellation of terms of equal minimal valuation at p=2. For log 3 the n=1 and n=2 terms cancel; using the first term alone gives the wrong valuation. Transport the canonical simple pole, Laurent coefficient and uniqueness through the displayed branch equality. Analyticity of the nonprincipal components at 1 also agrees with §5.0 through a separating smoothing unit. The logarithmic norm and finite-series estimates are local analytic targets here; construction of the canonical pole belongs to IntegralIwasawaTheory. (IntegralIwasawaTheory §5.0, `kubotaLeopoldt_interpolation`, and §6.3, `bernoulliStickelberger_dictionary`; RJW, Theorem 7.1 and Lemmas 7.2–7.5, pp.154–158.)

As a ring-theoretic consequence there is no ring map from any Λ-subalgebra of its total quotient containing ζ_p to K that agrees with total mass on every included integral measure. Indeed `(δ_a−1)ζ_p=λ_a` would give `0=λ_a(1)`. This is stronger than merely saying the chosen denominator vanishes, and does not incorrectly assert that no character evaluation exists on any useful localization.

For the positive even integers `w_r=2(p−1)p^r`, prove directly from the moment and logarithm estimates

```text
(1−p^(w_r−1))B_(w_r) → 1−p⁻¹,
B_(w_r) → 1−p⁻¹                  in Q_p.
```

Give explicit precision estimates from `((1+p)^w−1)/w→log_p(1+p)` and the moment approximation; quantify the separate error from removing the Euler factor by `v_p(p^(w_r−1)B_(w_r))`. The estimate must use the actual Bernoulli valuation bound rather than presume all B_n integral. These limits recover the residue along `s=1−w_r`, since the interpolation value is `−(1−p^(w_r−1))B_(w_r)/w_r`. (RJW, §7, pp.155–158, together with the integral moment bound of §1.7.)

The signature `principalNumerator_mass` states the resulting mass equation for the actual smoothing measure on the continuous zero-extended inverse coordinate, with its test equation explicit.

Use `principalNumerator_mass`, `principalSmoothingLog_norm`, `principalBranch_simplePole`, `principalBranch_residue`, `principalBranch_residue_changeCoordinate` and `bernoulliQuotient_tendsto` for the canonical pole and limit API. Transport the supplied principal branch and residue through the clearing equation with a continuous actual numerator on a punctured neighborhood. This gives the central mass and the residue of the local smoothing quotient with the logarithm of the same unit.

**Checks.**

* For p=3,a=4, `λ_a(1)=−(2/3)log_3 4` has norm 1; the normalized branch residue is 2/3.
* For p=2,a=3 the mass has norm 1/2, although `‖log_2 3‖=1/4`; replacing a by the chart generator 5 inside only the denominator changes the calculation.
* A zero numerator cannot satisfy the clearing comparison with the supplied nonzero residue. The pole conclusion needs that comparison.
* At p=2, γ=5 gives `v₂(P(4))=1`, while a=3 gives `‖N_a(1)‖=1/2`. Replacing the canonical clearing factor by twice itself changes the numerator normalization.
* If augmentation extended to a subalgebra containing ζ_p, the displayed clearing relation would send a nonzero scalar to zero. Agreement on all integral coefficients is essential to this contradiction.
* Along w_r the minus sign in `s−1=−w_r` cancels the negative Bernoulli interpolation sign; the residue is `1−p⁻¹`, not its negative.
* The logarithm series for p=2 has its first two terms cancel. A sharp norm argument that regards them as a unique minimal term fails this check.

### Examples

At p=2, the sign component and the angular component are distinct. The canonical numerator uses a=3, while the analytic coordinate uses γ=5; both logarithms converge and have valuation 2, but they enter different functions. The intrinsic principal branch has residue 1/2. For an odd character the logarithmic finite sum instead vanishes, in agreement with the parity of the actual unit measure. For a nonprincipal tame character, the strict-disc primitive produces the reciprocal Euler factor by a finite normalized trace, without requiring that the primitive itself be a bounded measure on Z.

### Dependencies

Layers 0–2; IntegralIwasawaTheory §5.0 for canonical character discs and the principal pole and residue, with §6.3’s dictionary; the exact measure/chart/localization interface; locally analytic distribution evaluation, differentiation and strict-disc summation; the Iwasawa logarithm of §0.6 with its finite product and norm laws. No general rigid-space or p-adic-Hodge-theoretic construction is needed to interpret these scalar analytic branches.

## Layer 4: Gamma, Gauss sums and universal distributions

### 4.1 Signed Morita Gamma on the native integers

For `n∈ℕ` define the integer

```text
G_p(n)=(-1)^n ∏_(0≤j<n, p∤j) j.
```

Its API gives G(0), the unit/nonunit recurrence, its unit image in Z, and integer-step congruences. For an exponent `r>0`, if `m≡n mod p^r`, then `G(m)≡G(n) mod p^r`, with the necessary exception `p=2,r=2`. Use the cofinal sequence of exponents `r=n+3` in the continuous construction, rather than assuming the exceptional congruence. Define the approximant `a_n(x)` as the least residue of x modulo `p^(n+3)`, and define `GammaValue x` as the limit in Z of `G_p(a_n(x))`. Prove the Cauchy property, uniform congruence control, continuity, independence of the cofinal approximation, and unit-valuedness by the nonzero residue modulo p. Then lift this very continuous function to `Γ_p:C(Z,Zˣ)`. There is no additional Gamma carrier or separately chosen unit lift. Its API includes uniqueness from natural interpolation, coefficient inclusion, congruences, and

```text
Γ_p(0)=1,
Γ_p(x+1)=−x Γ_p(x)       for x∈U,
Γ_p(x+1)=−Γ_p(x)         for x∈pZ.
```

Morita's original Γ is the unsigned product; this roadmap uses his signed `(-1)^x Γ` convention where the sign is defined on integers and then extended as the complete signed function. At odd p the standalone expression `(-1)^x` is not a continuous function on Z and is not used to define the extension. Define `gammaDisc r` by `x↦Γ_p(p^r x)` (with the continuous interpolation Γ as input), with restriction, rescaling, continuity and natural-value equations. (Morita, Theorem 1 and its proof, pp.255–256; Robert, §2, pp.158–160.)

The finite signed product is `moritaNaturalValue`; its admissible-precision congruence is part of the construction, and `existsUnique_moritaGamma` is the continuous interpolation milestone. Use `moritaGamma_nat`, `moritaGamma_unit_step`, `moritaGamma_nonunit_step`, `moritaGamma_zero` and `moritaGamma_continuous` for its arithmetic API. `moritaGamma_step` combines the unit and nonunit recurrences for the same continuous interpolation.

**Checks.**

* `G_p(0)=1`, `G_p(1)=−1`, `G_p(2)=1` for every prime, and `Γ_p(0)=1` rather than Γ_p(1).
* At p=2, `G_2(5)=−3`, while `G_2(1)=−1`; 5≡1 modulo 4 but the values differ modulo 4. The unrestricted modulus-four assertion is false.
* At p=3, `G_3(4)=2`, because the factor 3 is omitted and the sign is positive.
* At x=0 the nonunit recurrence gives Γ(1)=−Γ(0). Applying the unit recurrence there would give zero, contradicting unit-valuedness.
* The approximants at x=0 are all 0 and give limit 1. Replacing least residues by their successor changes the interpolated function.
* `gammaDisc 0` is Γ itself; its value at 0 is 1 at every r. At p=3,x=1, the values for r=0,1,2 are −1,−2,−2240, from the signed products at 1,3,9.

### 4.2 Common-level angular means

Reuse the torsion coordinate Ω and angular coordinate α from the measure supplier: Ω=ω and α=⟨·⟩ at odd p, while Ω=ω₂ and α=⟨·⟩₂ at p=2. Their concrete residue and Teichmüller-limit comparisons are arithmetic transport theorems, not new definitions of those coordinates. Define `q(p)=p` at odd p and `q(2)=4`. For a character χ of positive level f put `b=lcm(f,q)` and `N_n=bq^n`. Define the finite K-linear mean on actual sequences by

```text
M_χ^n(F)=N_n⁻¹ Σ_(0≤a<N_n, p∤a) χ(a)F(a).
```

The angular sample is `S(A)(a)=A(α(a))` at unit a and zero otherwise. The shifted sample is `S_z(A)(a)=A(α(a)+Ω(a)⁻¹z)` at units and zero otherwise. Define the angular and shifted finite means by composition with M, and define the torsion character θ at level q by the native Teichmüller lift at odd p and χ₄ at p=2. Its coefficient transport uses `ringHomComp`. The mth derivative twist is the native character `χ_m=χθ^(−m)` at the common level b. Their API includes linearity, exact finite sums, natural and residue-level equations, unchanged support, independence of zero-valued omitted samples, compatibility under character level raising to b, and arbitrary ring-homomorphism transport in characteristic zero. Limits commute with coefficient change only for continuous coefficient maps. (Morita, §2, pp.257–260.)

The block power sum is `s_m=Σ_(0≤j<q)j^m`, including `0^0=1`. Prove the exact q-block Taylor formula from the decomposition of the next-level interval into q translates by N_n. The normalized next-level difference is

```text
M_χ^(n+1)(S(A))−M_χ^n(S(A))
   = Σ_(m≥1) N_n^m (s_m/q) M_(χ_m)^n(S(D_m A)).
```

The expansion is used only when `‖N_n‖` lies inside the actual Taylor radius; this is not automatically true at n=0. Establish the finite-sum and HasSum interchanges at the surviving unit indices, with the exact inverse torsion power in χ_m. Prove power-sum bounds, the telescoping identity, and the finite polynomial controls independently of the analytic hypotheses.

For convergence use a genuine Taylor expansion on a radius `R>r=‖q‖`, with divided derivatives D_m and a common bound B. Require value bounds `‖D_m(x)‖≤B/R^m` and Lipschitz bounds `‖D_m(x)−D_m(y)‖≤B‖x−y‖/(R^m r)` on `‖x−1‖≤r`, together with the actual Taylor HasSum. Define the useful finite bound `C_f=max(‖b⁻¹‖,‖q⁻¹‖²)`. The block recursion yields uniform mean bounds and a geometric bound on successive differences; in particular `‖M_χ^n(S(D_m))‖≤C_f B/R^m`, convergence to actual coefficients v_m, and the corresponding limit bound. The power-sum factor must remain in the quantitative difference estimate; it is not estimated by an archimedean sum of q unit norms and then discarded. An equivalent theorem with explicit value/Lipschitz constants for each D_m is useful when no analytic carrier is packaged. Completeness supplies the limits, not the finite identities. (Morita, §2, especially the estimates on pp.257–259 and Theorem 2, pp.259–260; the larger-radius hypothesis makes the closed-disc boundary convergence explicit.)

Name the averaging modulus `moritaModulus`, the tower `moritaMeanLevel` and the linear finite sample `moritaFiniteMean`. Use `moritaFiniteMean_add`, `moritaFiniteMean_smul`, `moritaFiniteMean_map`, `moritaFiniteMean_raiseLevel`, `moritaFiniteMean_block` and `moritaFiniteMean_tendsto` for the stated interfaces. The convergence theorem applies to samples analytic near every point of Z_p; the angular and shifted samples satisfy this after their local analytic chart comparisons. The quantitative larger-radius bounds remain the estimates specified above. The scalar bound is the displayed real maximum. Name the sample operators `moritaAngularSample` and `moritaShiftedSample`, the twist `moritaDerivativeTwist`, the block sum `moritaBlockPowerSum` and the explicit bound `moritaMeanBound`.

**Checks.**

* At p=2 the levels are multiples of 4, not merely 2. For f=3, N₀=12 and N₁=48.
* For the principal character at a p-power level, including level 1, the constant mean is `1−1/p`. At arbitrary positive level f it is `∏_(ℓ|pf)(1−1/ℓ)`. For p=2,f=3,n=0, the mean is 1/3: four of the twelve residues survive both unit conditions. With nonprincipal χ at level f, the constant mean is zero.
* The zero sample gives zero mean; the excluded indices require no analytic values of A. At p=2,f=3,n=0, the quadratic character has constant-sample mean zero: its values on 1,5,7,11 are 1,−1,1,−1.
* `s_0=q`. At p=2, q=4, `s_1=6`, so `s_1/q=3/2` is not integral; a proof that treats every normalized block power sum as integral fails.
* The coefficient at order m uses χΩ^(−m). A direct factor `Ω^m` fails even for a unit with nontrivial torsion part.
* Finite means commute with a field embedding without a topological hypothesis, but passing their limits through that embedding requires continuity.
* For a finite polynomial sample the block expansion terminates and is an algebraic equality, including at levels where an infinite Taylor expansion was not yet licensed.
* For every unit a, `S_0(A)(a)=S(A)(a)`; for A=1 both samples are 1 on the units, and for A(x)=x the shifted sample is `α(a)+Ω(a)⁻¹z`. At a nonunit all three are zero.
* The torsion character θ has values 1 at 1, −1 at −1 for odd p as well as p=2, and zero at p. The twists at orders 0,1,2 are χ, χθ⁻¹, χθ⁻², all at the same common level b.
* At q=4, the block power sums at orders 0,1,2 are 4,6,14. At q=3 they are 3,3,5; neither family is uniformly divisible by q.
* Over K=Q_p, `moritaMeanBound` is 16 for (p,f)=(2,1), 9 for (3,1), and 27 for (3,27). The maximum with `‖lcm(f,q)⁻¹‖` detects the larger p-power level; this is not a uniform level-free constant.

### 4.3 Shifted limits, boundary sums and analytic Gamma

For the actual coefficients `v_m=lim_n M_(χ_m)^n(S(D_m A))`, define the translated difference function

```text
F_v(z)=Σ_(m≥0)z^m v_m−v_0.
```

Define its K-valued scalar-series extension by the native formal multilinear-series sum. Prove convergence and agreement with the limit of shifted means on `‖z‖≤r`, zero constant, additivity, coefficient transport, the analytic radius bound, and derivative identities `D^mF_v(0)=m!v_m` for m>0. The limit statement is obtained by a uniform larger-radius majorant; a bare pointwise Taylor assertion does not justify an interchange of two infinite limits.

For a nonnegative integer z divisible by b prove the exact finite boundary formula

```text
M_χ^n(a↦F(a+z))−M_χ^n(F)
 = N_n⁻¹ Σ_(0≤a<z,p∤a) χ(a)(F(a+N_n)−F(a)).
```

Its analytic limit is the finite sum of inverse-torsion-twisted first derivatives at the actual angular centers. Prove also the negative oriented boundary identity by signed reindexing and character periodicity, with no substitution of a nonnegative interval for a negative shift. The resulting formulas for F_v at positive and negative b-multiples are the integer boundary API needed for Gamma. Prove the exact finite positive-shift identity before taking limits. They use χ(a)Ω(a)⁻¹D₁A(α(a)), not an untwisted derivative. (Morita, Theorem 2, pp.259–260.)

Specialize to `A(x)=x(log_p x−1)`, χ=θ. On the principal disc,

```text
D_0 A=A,
D_1 A=log_p x,
D_m A=(-1)^m x^(1−m)/(m(m−1))          for m≥2.
```

Prove the divided-derivative recurrence and the actual Taylor series using the local logarithm. The inverse torsion factor cancels exactly against the coefficient character in the higher samples. The finite mean limits now supply the genuine inverse-power coefficients of log Gamma. Identify `F_v(z)=log_p(−Γ_p(z+1))` on the shift disc by the natural boundary formula and continuity, then by density at all scaled p-adic points. Exponentiation on the safe small disc `z∈2qZ` gives `Γ_p(z)=exp(F_v(z))`, using the nonunit recurrence and Γ_p(0)=1. Prove the principal-unit membership needed for exp/log inversion rather than inferring it solely from the logarithm equality. (Morita, §3 and Theorem 3, pp.260–261.)

Define the finite translation factor on a disc centered at y∈2qZ by

```text
P_a(y)=(-1)^a ∏_(0≤j<a,p∤j)(y+j),         a∈ℕ.
```

Because the unit support of y+j is constant on this disc, `Γ_p(y+a)=P_a(y)Γ_p(y)`. Its API gives P₀=1, finite-step and coefficient formulas, analyticity and nonvanishing on the specified translated disc. Choose the least residue representative modulo 2q to transport the analytic model to every point of Z. Prove independence on overlaps by agreement with the already continuous Gamma function. This constructs local analytic extensions of that function; it does not posit an abstract analytic-Gamma carrier.

For the higher logarithmic coefficients, the inverse-power kernels have norm 1 and a uniform Lipschitz bound on the principal disc. Their finite means have one bound independent of the inverse exponent. The factors `1/(m(m−1))` then give quadratic real growth in m, hence radius at least 1 for the scalar logarithm model. Prove its first derivative at zero, the higher factorial coefficients, and the HasSum after removing constant and linear terms. Differentiate twice on a strict smaller disc and identify the second derivative with the limit of the actual shifted reciprocal means. For example the reciprocal identity follows by summing the genuine geometric series `1/(x+z)=Σ_(n≥0)(−z)^n/x^(n+1)` at a norm-one x and `‖z‖<1`; it is not a formal statement about an unspecified inverse operator. (Morita, §3, pp.260–261, and §4, pp.261–264, for the reciprocal-mean comparison.)

Name the scalar difference series `moritaTranslatedDifference` and its field extension `moritaDifferenceExtension`. Use `_hasSum`, `_zero`, `_deriv`, `_boundary`, `_negative_boundary` and `_logGamma` for the limit comparison. The translation polynomial is `moritaGammaShiftFactor`, with `_zero`, `_step`, `_analytic` and `_gamma`; `moritaLogDividedDerivative` has `_zero`, `_one`, `_succ` and `_hasSum` equations. `moritaGamma_locallyAnalytic` states the resulting local extension into Q_p for the continuous interpolation, at every point of Z_p.

**Checks.**

* F_v(0)=0 even when v₀≠0; leaving v₀ in the translated difference changes the Gamma normalization.
* For m=2, the divided derivative is `1/(2x)`; for m=3 it is `−1/(6x²)`. Replacing divided derivatives by ordinary derivatives changes these coefficients.
* For χ=θ and a unit a, the mth sample simplifies to the exact inverse-power scalar, because `θ(a)Ω(a)^(−m)α(a)^(1−m)=a^(1−m)`. The twist cannot be dropped before this cancellation.
* P₀=1, P₁=−1, and P₂(y)=y+1, since the j=0 factor is omitted. The constant `P₂(0)=1` agrees with Γ_p(2).
* At p=2 the safe exponential disc is 8Z₂. The averaging modulus is still 4; conflating the two radii loses an exp/log hypothesis.
* The reciprocal series at z=0 is 1/x. Its linear coefficient is `−1/x²`, detecting the geometric-series sign.
* A radius bound of exactly r without boundary coefficient decay does not prove convergence on the closed disc `‖z‖≤r`; the larger radius is part of this theorem's assumptions.
* A constant coefficient sequence with v₀=b and all higher coefficients zero gives both difference models identically zero. With only v₁=c nonzero they give cz; with only v₂=c they give cz² and second derivative 2c.
* The logarithmic divided derivatives at x=1 are −1,0,1/2 at orders 0,1,2. At order 3 the value is −1/6. Replacing the first derivative by A itself fails already at x=1.
* On the specified translated disc, the factors at a=0,1,2 are 1,−1,y+1; their values at y=0 are 1,−1,1. No j=0 factor is introduced in the last two products.

### 4.4 Reflection, negative arguments and digit orbits

Let R(x) be the representative in `{1,…,p}` of x modulo p. At odd p prove

```text
Γ_p(x)Γ_p(1−x)=(-1)^R(x).
```

At p=2, if `x=x₀+2x₁ mod 4`, with bits x₀,x₁∈{0,1}, prove instead

```text
Γ_2(x)Γ_2(1−x)=(-1)^(1+x₁).
```

Derive the negative-argument recurrence and reflection variants by applying the exact unit/nonunit functional equation. In particular

```text
Γ_p(−x)Γ_p(x+1)=(-1)^(1+x₀+(p−1)x₁),
```

where x₀ is the least residue modulo p and x₁ the next digit; for odd p the x₁ contribution is even, and at p=2 it is essential. Give continuity of each finite-residue sign and prove reflection first at natural arguments, then by density. (Gross–Koblitz, Lemma 2.3, p.572, for odd p; Robert, Appendix 1, p.169, for all primes.)

For `f>0`, `M=p^f−1` and `0≤a<M`, define `a_j=p^j a mod M` and `S_p(a)=Σ_(i<f)((a/p^i) mod p)`. Prove the cyclic digit-rotation theorem, `a_f=a`, the exact carry equation `p a_j=a_(j+1)+M c_j` and the digit/fraction identity

```text
Σ_(j<f) a_j/M = S_p(a)/(p−1).
```

For nonzero a all rational representatives a_j/M lie in (0,1). At zero use the actual representative 0 in the digit and Gamma product formulas; the positive-fractional-part convention of a separate source instead chooses 1 and must be translated with Γ_p(1)=−1. Prove parity of S_p(a), the orbit reflection sign, and finite coefficient transport. (Gross–Koblitz, Lemmas 2.4 and 2.11, pp.572 and 575; Robert, Theorem 4, p.168.)

The finite digit sum is `grossKoblitzDigitSum p a f`, using exactly f digits. Prove the rational orbit identity for `f>0` and `a<p^f−1`, together with digit reconstruction, rotation and the carry sum. The Gamma reflection identity retains the second binary digit.

**Checks.**

* At x=0 the reflection product is Γ(0)Γ(1)=−1. R(0)=p, not 0.
* At p=2,x=2 the reflection sign is +1; the odd-prime formula using only x modulo 2 would give −1.
* At p=3,f=2,a=5 the digits are 2,1, so S=3; the orbit numerators are 5,7 and `(5+7)/8=3/2`.
* At p=2,f=4,a=13 the digit sum is 3. The four orbit numerators sum to 45, so their fractions sum to 3.
* At a=0 every digit is zero and every a_j/M is zero. Inserting the positive representative 1 gives a spurious f and f Gamma signs.
* The positive residue of x=0,1,−1 is respectively p,1,p−1 for odd p. At p=2 the last two both have positive residue 1. A least-nonnegative residue would change the reflection at zero.
* At p=3,f=2,a=5, the orbit numerators are 5,7 and the carries are 1,2; the digit sum is 3 and the fractional sum is 3/2. At p=2,f=4,a=13, the digit sum is 3. At a=0 all orbit numerators and carries vanish.

### 4.5 The Gross–Koblitz formula and its arithmetic analytic inputs

Fix f≥1 and q=p^f. Work in a complete extension K/Q_p containing a primitive pth root ζ and a specified unramified degree-f extension E_f/Q_p. Identify the residue field of E_f with F_q and use its Teichmüller lift `F_qˣ→O_(E_f)ˣ→Kˣ`. In K choose the unique π with

```text
π^(p−1)=−p,          π≡ζ−1 mod (ζ−1)².
```

Prove existence and uniqueness with the local-field/Hensel interface; for p=2 the value is π=−2. Let ω be this specified Teichmüller lift on `F_qˣ`, and let Tr be the native trace to F_p. Define the negative Gauss sum

```text
g_q(a)=−Σ_(x∈F_qˣ)ω(x)^(−a)ζ^(Tr x),        0≤a<q−1.
```

Use the actual native finite field, its cardinality, trace and multiplicative lift; no abstract table of presumed Gauss values replaces the sum. Give its root/additive-character transport, coefficient extension, reduction, nonvanishing, and the trivial-character value `g_q(0)=1`. The target is

```text
g_q(a)=π^S_p(a) ∏_(0≤j<f)Γ_p(a_j/(q−1)).
```

The proof route uses Robert's arithmetic power-series method, including its dyadic estimates, rather than importing the unproved Gamma–Gauss equality as a hypothesis. Prove the following named prerequisites here: the factorial-quotient limit extending Γ_p (Robert, Theorem 1, p.160); the coefficient identity for the Dwork exponential `Θ_q(T)=exp(π(T−T^q))`, whose q=p case gives the single Frobenius factor and the Gamma finite-difference transform (Theorem 2, p.162); the convergent telescoping comparison between those coefficients, Teichmüller-root sums and Gamma products (Theorem 3, pp.165–166); and the estimates that make the boundary evaluations legitimate (pp.167–168). Interpret these as scalar analytic series on their proved radii using LocallyAnalyticDistributions §§1.1–1.2 for coefficient series and strict-disc evaluation. The Frobenius product is the actual splitting function, and its value on a Teichmüller lift is `ζ^(Tr x)`, with the root ζ identified by its linear term (Robert, Appendix 2, p.169). These are arithmetic targets of this section, not requests to a higher rigid-cohomology roadmap.

For clarity, the splitting-function API must prove: constant coefficient 1; coefficient of T equal to π; convergence at every Teichmüller argument used in the finite field sum; the f-fold Frobenius product law; its pth power equal to 1 there; and identification of the resulting pth root by its first-order congruence. For p=2 the estimate `k/2−S_2(k)≥−1/2` is used instead of a false nonnegative lower bound; k=1 and k=3 are the exceptional minima. This controls the actual tail, not just the values of a formal exponential. The f-fold splitting function is never defined as the ordinary exponential of an argument outside the ordinary exponential convergence ball.

Deduce `‖g_q(a)‖=‖p‖^(S_p(a)/(p−1))`, the leading factorial residue `g_q(a)/π^S≡(∏ digit_i(a)!)⁻¹` modulo the maximal ideal, the finite-field Gauss product and Jacobi quotient comparisons, and algebraicity of `Γ_p(m/n)` when `n>0,n|(p−1)`. Natural translations extend the latter from `0≤m<n` to every integral rational m/n. The original odd-prime source has the positive-fraction convention and omits the trivial character; Robert's version supplies the all-prime zero-inclusive formula above. (Gross–Koblitz, Theorem 1.7, p.571 and Lemma 2.11, p.575; Robert, Theorem 4 and Corollaries 1–2, pp.168–169.)

Use `dworkSplittingSeries`, `robertFactorialQuotient` and `robertCoefficientSeries` for the arithmetic scalar series, and `robert_factorial_limit`, `robert_finiteDifference`, `robert_telescope`, `dworkSplittingSeries_frobenius`, `_traceCharacter`, `grossKoblitz_formula`, `_valuation`, `_leading_residue` and `moritaGamma_rational_algebraic` for its milestones. The coefficient recurrence is an identity on native power series; the factorial-quotient limit is identified with the continuous Gamma product along every natural approximation. The trace-character comparison evaluates at the canonical `TauCeti.teichmullerLift` of the native local-field residue field, with the specified additive root.

The signature `grossKoblitz_formula` uses the native residue field `𝓀[E]`, its trace and `TauCeti.teichmullerLift E`, followed by an embedding E→K. The denominator unit represents q−1. The local field E may be ramified; only its residue cardinality is fixed. The canonical integer ring, residue field and lift are supplied by `TauCeti.NumberTheory.LocalField.Teichmuller`.

For an exact scalar construction, let `A_n=[T^n]Θ_q`. For `0≤a<q` and `0≤i<f` put `n_i(x)=⌊a/p^i⌋+p^(f−i)x` and define the continuous factorial-quotient extension

```text
G_a(x)=(-p)^(−v_p(a!)) ∏_(i<f)Γ_p(−n_i(x)).
```

The negative exponent is taken in Q_p. Prove `G_a(m)=(-p)^(((q−1)/(p−1))m)m!/(a+qm)!` for natural m, and the convergent Mahler identity `G_a(x)=Σ_(k≥0) A_(a+qk) k! binom(x,k)/π^(a+k)`. Name the affine path `robertAffinePath`, the Gamma product `robertFactorialQuotient`, and the all-a scaled extension

```text
robertCoefficientSeries(a,x)=Σ_(k≥0) A_(a+qk) (x)_k/π^k,
(x)_k=x(x−1)…(x−k+1).
```

For a<q it equals π^a G_a; for a≥q its series is the definition, without an assumed Gamma-product formula. Prove `A_0=1`, `nA_n=πA_(n−1)` for `1≤n<q`, and `nA_n=π(A_(n−1)−qA_(n−q))` for n≥q. At `a*=a/(1−q)`, the finite telescope is

```text
(1−q)Σ_(0≤k<N)A_(a+k(q−1))
 = robertCoefficientSeries(a,a*)
   −robertCoefficientSeries(a+N(q−1),a*−N),       N≥1.
```

With `r_p=p^(−1/(p−1))`, the sup norm of the scaled all-a function is at most `r_p^(a/q)` for odd p and `r_p^((a−q)/(2q))` for p=2. It therefore tends to zero with a. This proves the limiting telescope and evaluates the Gauss–Dwork sum at the actual Gamma orbit; it supplies the needed arithmetic comparison rather than an abstract summability placeholder. (Robert, Theorem 1, pp.160–161; Theorem 2, p.162; coefficient recurrence, p.164; Theorem 3 and tail bound, pp.165–168.)

**Checks.**

* For p=3,f=2, Q₃(ζ₃) has residue field F₃ and contains no element of order 8. The specified unramified quadratic extension supplies the F₉ˣ lift; ζ₃ alone does not.

* At a=0 the sum is 1, the digit sum is 0 and every Gamma factor is Γ(0)=1. A positive Gauss sum or Γ(1) at zero gives a wrong sign.
* At p=2,f=1 there is only a=0 and π=−2; this is a legitimate boundary case.
* For p=3,f=1,a=1, the formula is `g_3(1)=πΓ_3(1/2)`, with norm `3^(−1/2)` and leading residue 1.
* At p=2,f=4,a=13, the exponent of π is 3, not the integer a and not f.
* `k/2−S_2(k)` is −1/2 at k=1 and k=3. Any estimate claiming it is always nonnegative fails these finite checks.
* Changing ζ changes π by the matching root of unity and changes the additive Gauss character coherently; fixing only one of the two does not preserve the equality.

* The first three scalar coefficients of Θ_q are `A_0=1`, `A_1=π`, and `A_2=π²/2` if q>2; at q=2 the last is `π²/2−π`. The q=2 correction cannot be copied from odd q.
* For every a<q, `G_a(0)=1/a!`; at x=1 the value is `(-p)^((q−1)/(p−1))/(a+q)!`, while x=2 gives `2(-p)^(2(q−1)/(p−1))/(a+2q)!`. These pin the inverse quotient and its power.
* For the all-a scaled series, the values at x=0,1,2 are respectively `A_a`, `A_a+A_(a+q)/π`, and `A_a+2A_(a+q)/π+2A_(a+2q)/π²`. Falling powers rather than ordinary powers are essential.
* At N=1 the finite telescope has the single term `(1−q)A_a`; at N=2 it has `(1−q)(A_a+A_(a+q−1))`. At N=0 its two terms cancel but it supplies no positive-length Gauss approximation.

### 4.6 Multiplication formulas and period-normalized Gamma logarithms

For `m>0,p∤m` define on Z

```text
F_m(x)=∏_(0≤h<m)Γ_p((x+h)/m),       C_m=F_m(0).
```

The inverse of m is the inverse of its actual native unit. Prove unit-valuedness, independence of the unit witness, C₁=1, the finite product formula `C_m=∏_(1≤h<m)Γ_p(h/m)`, and

```text
F_m(x+1)=−(if x∈U then x/m else 1)F_m(x).
```

For a natural n let `U_p(n)=#{0≤j<n:p∤j}`; it is `n−1−⌊(n−1)/p⌋` for n>0 and 0 at n=0. Prove the cleared product `F_m(n)m^U_p(n)=Γ_p(n)C_m`, the finite-precision version at every admissible Gamma exponent, and the corresponding orbit product for x_j=a_j/(p^f−1). Summing the exact carries controls the unit-count exponent. Passing to cofinal precision proves the orbit quotient is a `(p−1)`st root of unity, whose reduction is `m^a`; hence it is `ω(m^a)`. Equivalently, for positive rational x with `(p^f−1)x=a`, the full Gamma product over the preimages `(x+h)/m`, divided by the product at x and by the m-normalizers, is `ω(m^a)` after taking the common f-fold Frobenius product. The preimages are actual integral rationals; cyclic reindexing and positive-fraction representatives must be proved, including the endpoint 1. At p=2 the quotient is 1. This is an elementary extension of the odd-prime multiplication formula, not an attribution of a binary theorem to the odd-prime source. (Gross–Koblitz, Theorem 3.1(2) and its congruence (3.2), pp.575–576.)

Taking Iwasawa logarithms eliminates that root of unity and the normalizer, whose logarithm is zero by reflection. For a rational a of denominator prime to p, let d(a)>0 be the least period of multiplication by p on its native rational-circle class. Define

```text
Φ(a)=Σ_(0≤j<d(a))log_p Γ_p(⟨p^j a⟩_+),
Mean(a)=Φ(a)/d(a),
```

where `⟨·⟩_+∈(0,1]`. Prove existence of the periods, least-period divisibility, period preservation by integer translation, negation and multiplication by p, and the common positive period for finitely many preimages. Φ and Mean descend to the prime-to-p torsion subgroup of `Q/Z`. Their API includes evaluation on any representative, uniqueness of descent, oddness, Frobenius invariance, zero at integer classes, and exact repetition: an f-period sum is `(f/d(a))Φ(a)`. For `m>0,p∤m` and one common period f for a and all `(a+h)/m`, prove

```text
Σ_(h<m) (f/d((a+h)/m)) Φ((a+h)/m) = (f/d(a)) Φ(a),
Σ_(h<m) Mean((a+h)/m)=Mean(a).
```

Thus Mean is the ordinary distribution. The unnormalized least-period Φ has the displayed period-weighted law, not an unweighted one. The quotient by d(a) is taken in Q_p: it need not lie in pZ even if Φ does. These precise statements replace an invalid inference from a common-period product to a sum of varying least-period logarithms. They also explain why neither a universality assertion for the scalar logarithm image nor integrality of every period average follows just from the multiplication formula. (Gross–Koblitz, §3, equations (3.4)–(3.6), pp.576–577, with periods kept explicit.)

Name the finite product `moritaMultiplicationProduct`, the raw orbit sum `gammaOrbitLogSum`, the least-period function `gammaOrbitPhi` and its normalized value `gammaOrbitMean`. Use `_nat`, `_congruence`, `_orbit`, `_teichmuller`, `_repeat`, `_representative`, `_odd`, `_frobenius`, `_weighted_distribution` and `_distribution` for the indicated identities; the unweighted distribution theorem is for Mean. The natural-argument multiplication formula includes the unit-count exponent and the same finite Gamma normalizer.

**Checks.**

* m=1 gives F₁=Γ and C₁=1; its cleared natural product has no extra normalizer.
* F_m(1)=−C_m because x=0 is a nonunit. A formula containing x/m on every branch would give zero.
* At a=0 the Gamma orbit may use Γ(0) in the cleared product, while Φ uses Γ(1); its logarithm is zero in either case. Equality of logs does not erase the sign distinction in products.
* Replacing a period d by 2d doubles the raw sum and leaves the mean unchanged. A definition taking a raw sum over an arbitrary period is not intrinsic.
* The zero class has least period 1 and Φ=Mean=0. The case d divisible by p is allowed for nonzero classes and division can lose p-adic integrality.
* For a preimage with period d_h different from d(a), the coefficient in the common-period Φ identity is f/d_h, not f/d(a). The unweighted Φ law is not used as a theorem.
* For the zero class the orbit sum, Φ and Mean all vanish. On a constant period-d scalar sequence with value c, the raw sum is dc, the length-2d sum is 2dc and their means both equal c; these finite sequence checks isolate the normalization independently of Gamma nonvanishing.
* On an orbit of period 1, a length-f sum is f times the least-period sum. On a period-2 orbit with values b,c, lengths 2 and 4 give b+c and 2b+2c. A common-period identity cannot simply replace both coefficients by 1 when the preimage periods differ.

### 4.7 Universal weighted division relations

For an additive commutative group X with finite fibers of multiplication by every multiplier under consideration, an allowed set `S⊆ℕ_{>0}` and a weight `w≥0`, define the relation subgroup of `FreeAbelianGroup X` generated by

```text
m^w · Σ_(b∈X, m•b=a)[b] − [a],        m∈S, a∈X.
```

Define `U_(S,w)(X)` as its native additive quotient. The full finite fiber is essential; a chosen root is not enough. The universal point map is a↦[a]. Its API gives the relation equation, generation, the exact kernel criterion for a homomorphism out of the free group, the unique lift of every function `f:X→A` satisfying `m^wΣ_(mb=a)f(b)=f(a)`, and uniqueness on point classes. Add functoriality for additive equivalences preserving the allowed multipliers, explicit root-fiber equivalences, identity and composition laws, and compatibility with coefficient extension. The m=1 relation is zero. When S grows the quotient map is canonical; when S is empty the quotient is the original free group. The ordinary case is w=0. No relation `[0]=0` is included. (Kubert, §1, definitions (1.1)–(1.4), pp.179–181; positive weights in the Appendix, pp.200–202.)

Define the odd quotient by the additional relations `[−a]+[a]`, and the even quotient by `[−a]−[a]`. Their APIs are the corresponding universal lift criteria, natural quotient maps and generation, not projectors `(1±j)/2` over Z. For an endomorphism t preserving S-relations, define the further orbit quotient by `[t(a)]−[a]`. Define the normalized odd orbit quotient by adding `[0]`, the odd relations and the orbit relations to the distribution subgroup. Give exact kernel/lift criteria and functoriality for every stage, including maps into arbitrary additive groups. On the prime-to-p rational circle, Mean from §4.6 lifts to this quotient with t=p. The existence of this lift is not a claim that its kernel is precisely those relations.

The full-fiber expression is `divisionRelator`. Its finite-set input is required to contain exactly all roots in the definition of `universalWeightedDistribution`, the native free-abelian-group quotient by the subgroup closure of these relations. On groups with finite positive-multiplication fibers, every such fiber contributes a relation. Prove the unique universal lift for exactly the functions obeying the weighted root law, its point-class equation and uniqueness, functoriality, and the separate zero normalization. The ordinary case is weight zero.

**Checks.**

* For S empty, the class of 0 is a free generator. Defining the quotient so that it vanishes would already fail this case.
* In the one-element group with w=0 every ordinary relation is zero, so the ordinary quotient is Z. With w>0 the relation for m is `(m^w−1)[0]` and can create torsion.
* For m=1 the actual full fiber is the singleton a and the relation is zero for every w.
* In an odd quotient the class of 0 is killed by 2 and need not be zero. Adding its vanishing is a separate normalization.
* For X=Q/Z,m=2,a=0, the ordinary relation is `[0]+[1/2]−[0]=[1/2]`; omitting one root changes it.
* An orbit lift for t=p requires `f(pa)=f(a)`. Oddness alone does not imply this extra relation.
* On the trivial group, the weight-w relator is `(m^w−1)[0]`: at w=0 it is zero; at w=1,m=2 it is [0]; at w=2,m=2 it is 3[0]. With multiplier set S={2}, the ordinary quotient is Z, whereas these two positive-weight quotients are zero and Z/3 respectively. Allowing both 2 and 3 at weight 2 adds the relator 8[0]; since 3·3−8=1, that quotient is zero. The answer depends on S.
* With no allowed multipliers the quotient is the original free group. Allowing only m=1 adds zero relations. Allowing m=2 on Z/2 at weight zero kills [1] but leaves [0].
* The parity quotient on X={0}, w=0 is Z for even sign and Z/2 for odd sign; further normalization killing [0] makes either zero. Frobenius equal to the identity adds no orbit relation, whereas explicit normalization still changes this example.

### 4.8 Finite torus levels and the free basis

Fix `d>0` and `T_d=(Q/Z)^d`. For `N>0`, let `T_d[N]` be its native N-torsion kernel and F(N) the free abelian group on that finite carrier. Distinguish the internal subgroup generated by the ordinary relations with `m|N` and centers in `T_d[N/m]` from the intersection of F(N) with the global relation subgroup. Their equality is a theorem below, not a definition. Define primitive points by exact additive order N and prove their cardinality `N^d∏_(p|N)(1−p^(−d))`. Give the level embeddings, full root-fiber equivalence between ambient roots and roots in the correct upper level, reduction and CRT maps, and their commuting diagrams.

For a prime power `p^e`, the distinguished primitive point is `(1/p^e,0,…,0)`. At level N let M range over admissible divisors, those with `gcd(M,N/M)=1`. Define `T*(M)` as primitive points at M whose every primary component differs from its distinguished point, and `T*(1)={0}`. Define `T(N)` as the union of these actual point sets over admissible M. Its primary-coordinate description has at each prime the choices 0 or a nondistinguished primitive point of the full primary exponent. Prove disjointness, the cardinality equality with primitive N-points, generation by T(N), and the integral basis theorem

```text
U_d(N) ≃ ⨁_(t∈T(N)) Z,
rank U_d(N)=#primitive(T_d[N]),
```

where U_d(N) is the actual image in the global ordinary quotient. First prove the internal generation: split an exceptional primary component by its full root relation, reduce the support of exceptional components by induction, and control admissible sublevel spans and their intersections. The rational realization of §4.11 proves independence and equality of internal and global relation subgroups. Give the basis coordinate maps, reconstruction, level compatibility, torsion-freeness and the actual GL_d(Z/NZ) action. A finite invertible matrix acts directly on T_d[N]; no claim that every such matrix lifts to GL_d(Z) is needed. (Kubert, Theorem 1.8, Proposition 1.9 and Lemmas 1.10 and 1.12, pp.183–185; Theorem 4.14, p.199.)

For a positive weight w, prove the weighted version with rank equal to the same primitive count. The weighted basis is obtained from the specified root-lift combinations in Kubert's Appendix, not by declaring the unweighted set of point classes T(N) a basis again. Primitive point classes are a rational basis when w>0. At w=0 they need not be a rational basis. (Kubert, Appendix, pp.200–202.)

Name the exact-order subset `distributionPrimitivePoints`, the distinguished vector `distributionDistinguishedPoint`, the admissible divisors `distributionAdmissibleDivisors` and the source set `ordinaryDistributionBasisSet`. Prove finiteness of every positive-multiplication fiber of the native rational torus. Their API gives `_mem`, `_card`, `_primaryCoordinates`, `_generates` and `_basis`, with the internal/global subgroup equality and the positive-weight root-lift basis theorem. The signature `universalWeightedDistribution_finiteBasis` states freeness and primitive-point rank for all nonnegative weights.

**Checks.**

* At N=1 the quotient has the single basis element [0] and rank 1.
* At d=1,N=2 the distinguished nonzero point is excluded and T(2)={0}; the relation forces [1/2]=0, while [0] remains a generator.
* At d=1,N=3, T(3) consists of 0 and the nondistinguished primitive point 2/3, giving rank 2.
* At d=2,N=2 the rank is `4−1=3`, not φ(2)=1; the dimension must remain in the primitive count.
* A point at a nonadmissible proper divisor is not added to T(N) by the defining union. Adding every proper level overcounts the basis.
* For w=0,N=2 the sole primitive point class is zero. It cannot be a rational basis of the nonzero ordinary quotient.
* The primary-coordinate basis set at N=1 has one empty tuple, at d=1,N=2 has one zero-coordinate choice, and at d=1,N=3 has the two choices 0 and 2/3. The distinguished primitive vectors at these last levels are 1/2 and 1/3; they are excluded from the local replacement subsets.
* The admissible divisors at N=1,4,6 are respectively {1}, {1,4}, {1,2,3,6}. Inserting 2 into the N=4 union would violate the full-primary-exponent condition.

### 4.9 Primitive transfer, Cartan groups and the norm limit

For `M|N`, define the primitive transfer on coefficient functions by sending a primitive M-point x to the full sum of primitive N-points y satisfying `(N/M)y=x`. Prove that every such fiber is nonempty, distinct fibers are disjoint, its coefficients are 0 or 1 and its mass is the actual fiber cardinality. Over any semiring the resulting linear map is injective, including the zero-ring boundary where injectivity is tautological. Prove identity, transitivity, equivariance under compatible torus actions and compatibility with full root transfer. These are additive/linear maps; no artificial ring structure on the primitive set is needed. (Kubert, §2, pp.186–189.)

For each prime p, form the actual unramified degree-d extension of Q_p and its integer ring, or its canonically equivalent Witt-vector model. Define the finite Cartan group at `p^e` as the unit group of its quotient by p^e, and define `C_d(N)` as the product over prime powers exactly dividing N. The API identifies its faithful action on `(Z/NZ)^d` after a specified integral basis, simple transitivity on primitive N-points, its order, the reduction maps, surjectivity and multiplicative compatibility. At d=1 prove the canonical comparison `C_1(N)≃(Z/NZ)ˣ`, with its primary and CRT formulas; at N=1 both groups are trivial. The unramified field and Witt ring are supplier objects. This section proves the Cartan action and the finite arithmetic comparisons, rather than replacing those rings by abstract groups of the desired size. (Kubert, §2, pp.186–189.)

Define the global Cartan group as the compatible product of all the actual local units. Show that its finite projections have the stated kernels, are surjective, and identify it continuously with the native inverse limit of the C_d(N). A countable factorial tower `(n+1)!` is cofinal; prove that extraction and lifting on this tower are inverse and agree at every positive modulus. Use the induced native profinite topology with its universal property. At d=1 the comparison is the actual product `∏_p Z_pˣ`, retaining the prime-coordinate values and finite residue maps. Do not reconstruct the general inverse-limit or profinite-completion theory.

On `R[C_d(M)]`, define the full norm to level N by `[c]↦Σ_(c'↦c)[c']`. Prove its coefficients, injectivity, composition and compatibility with primitive transfer. The source's word norm here denotes an additive R-linear map. In general it does not preserve 1 or multiplication: for a reduction with kernel of size h,

```text
Norm(x)Norm(y)=h·Norm(xy).
```

Define `L_d(R)` as the native module direct limit along those norms, using the factorial tower and its cofinal comparison. Give the all-level insertion `I_N`, its injectivity, identity and divisor compatibility, the lift of every compatible linear family, uniqueness, and finite/global Cartan representations with actual intertwining maps. Prove equality of two representatives after passage to a common level. (Kubert, §2 and the construction preceding Theorem 3.10, pp.186–193.)

For every d>0 and a scalar function `φ:(Q/Z)^d→R`, define the finite Cartan value of x∈T_d[N] by the group-ring coefficients `φ(c⁻¹x)` at c∈C_d(N). Prove linearity in φ, finite-action covariance and full-root compatibility, then insert at the actual order of x to define its global value in L_d(R). For a fixed lower-level point x, finite-value norm compatibility follows directly from reduction of the action, for every scalar φ. The full root-distribution law for the resulting global point map additionally requires that φ satisfy the corresponding full root-sum law. Descend the resulting point map through the universal quotient of §4.7. Give its uniqueness, independence from the chosen containing level, and global Cartan equivariance. This construction and the independent rational correction below have separate purposes.

Use `primitiveTransfer`, `finiteCartanGroup`, `globalCartanGroup`, `cartanFullNorm`, `cartanNormLimit`, `finiteCartanValue` and `globalCartanValue` for the constructions. Give `_coeff`, `_id`, `_comp`, `_injective`, `_equivariant`, `_degreeOne` and `_continuousEquiv` at their appropriate carriers; `globalCartanValue_distribution` and `_lift_unique` carry the actual scalar root-law hypothesis.

**Checks.**

* At d=1,M=1,N=2, the primitive fiber of 0 is {1/2}, and primitive transfer sends its unique basis element to that basis element.
* At d=1,N=3 the Cartan group has two elements and acts transitively on {1/3,2/3}. At d=2,N=3 its order is 8.
* At level 1 the finite Cartan group is trivial, but its group ring over R is R, not the zero module.
* A full norm with kernel size h sends the identity basis vector to a sum of h basis vectors; for h>1 this is not the target ring's identity.
* In the direct limit, inserting x at M agrees with inserting its full norm at N. Replacing that norm by a normalized average loses integral compatibility.
* For the constant scalar φ=1 on the circle, the level-2 ordinary relation at zero gives two equal nonzero values on the root side and one on the center side over Z. Fixed-point level compatibility still holds, but the global point map does not descend through ordinary relations. The universal lift requires the actual scalar root law.
* A primitive transfer over a zero coefficient semiring is injective as a map of singleton modules; over Z at M=N it is the identity, and at M=1,N=3 it sends the sole primitive label to the sum of the two primitive labels. These are full fibers, not choices of one lift.
* In degree one, C₁(1), C₁(2), C₁(3) have cardinalities 1,1,2. In degree two their cardinalities are 1,3,8. The degree-one residue comparison specializes correctly and cannot define the degree-two group.
* The full norm at equal levels fixes every basis vector; with a two-element kernel its identity image has two coefficients 1; over F₂ its square is zero although that image is nonzero. Calling it a unital algebra map would fail this last calculation.
* The all-level limit insertion at N=1 uses the same coefficient element as its norm insertion at N=2; changing the containing factorial from 2! to 3! retains that class. For R=0 the limit is zero. These controls pin the equivalence relation without asserting a ring limit.

### 4.10 Scalar Bernoulli and Fourier distributions

For `k≥1`, define the scalar weighted distribution `b_k(t)=B_k({t})`, using the periodic representative and recording the endpoint convention at integers. The multiplication identity is

```text
N^(k−1) Σ_(0≤j<N)b_k((t+j)/N)=b_k(t).
```

For k=1 choose the source endpoint convention explicitly; the odd Fourier representative has value 0 at integers, whereas the right-continuous Bernoulli representative has B₁(0)=−1/2. Both their endpoint values and their distribution laws must be stated with the compatible convention; they are not identified by an almost-everywhere assertion. Give periodicity, parity away from the jump, coefficient extension, endpoint values, and transport to the quotient of §4.7. (Kubert, §3, pp.189–191.)

The smooth classification needs an endpoint bound. A sufficient precise statement is: a periodic function satisfying the weight `k−1` relation, smooth on (0,1), with a bounded `(k+1)`st derivative there and whose value at the integer class is its right limit (for the right-continuous Bernoulli convention), or the average of its two one-sided limits (for the symmetric convention), is a scalar multiple of the compatible Bernoulli function. Prove this by differentiating the relation, reducing the higher derivative to zero through the Riemann-sum bounds, then determining the polynomial and its constant. Do not assert the printed classification under only `C^∞(0,1)`; that hypothesis gives no control near the endpoints. For the L² version, compute Fourier coefficients: `a_0=0` and, separately for positive and negative n,

```text
a_n=A/n^k       (n>0),
a_(−n)=B/n^k    (n>0).
```

The L² distribution space is two-dimensional over C before imposing parity; A and B are independent, and its classification is up to almost-everywhere equality. For k>1 construct `positiveFourierDistribution k` from `G_k(t)=Σ_(n≥1)exp(2πint)/n^k` with uniform absolute convergence. Give the positive/negative Fourier parameters, parity projections over C, the exact weighted law and the corresponding Cartan realization. (Kubert, Proposition 3.3 and Lemma 3.4, pp.189–191.)

For k=1 retain `G₁(t)=−Log(1−exp(2πit))` only away from integer classes. For each N>1 its defect at zero is `Σ_(1≤j<N)G₁(j/N)=−log N`, so no choice of G₁(0) makes it an ordinary distribution. Fix a profinite unit τ∈Ẑˣ, acting on each rational-circle point through its residue at that point's order. Define `regularizedLogDistribution τ(0)=0` and `regularizedLogDistribution τ(t)=G₁(τt)−G₁(t)` for t≠0. Prove periodicity, the ordinary distribution law on the rational circle, descent to the quotient of §4.7, and compatibility with the profinite-unit action. The unit action permutes every full division fiber; at zero the two logarithmic defects cancel. (Kubert, equations (3.8)–(3.9), pp.191–192.)

The injectivity target for the Cartan realization must prove that its primitive-character projections are nonzero. Compute those projections by Gauss sums, the nonzero Dirichlet value and the exact Euler factors at deleted primes, and then use character separation and the primary basis. This is the arithmetic content of the character criterion, not a blanket assertion that every nonzero distribution gives an injective realization. For k>1, state the resulting injective Cartan map for the constructed G_k and its full complex linear span. (Kubert, Theorem 3.10 and proof, pp.192–193.)

Name the scalar functions `periodicBernoulliDistribution`, `positiveFourierDistribution` (k>1) and `regularizedLogDistribution`. Use `_endpoint`, `_parity`, `_weightedLaw`, `_fourier`, `smoothWeightedDistribution_classification_with_bounds`, `l2WeightedDistribution_twoParameters` and `positiveFourierDistribution_cartan_injective` for the analytic and arithmetic APIs. The Bernoulli division theorem gives the division law for the right-continuous representative at every real point, including integers, using the native Bernoulli polynomial. Retain the k>1 hypothesis on the positive Fourier construction and its injective Cartan map.

**Checks.**

* `b_2(0)=1/6` and `2(b_2(0)+b_2(1/2))=1/6`; omitting the weight N changes the relation.
* The positive-frequency G_k and its negative-frequency conjugate have separate Fourier supports. A one-dimensional complex classification would identify two independent distributions.
* For k=1 the sine/odd Fourier representative is zero at integers, while B₁(0)=−1/2. Equality in L² cannot determine that point value.
* The raw G₁ has G₁(1/2)=−log 2. At N=2,t=0 the ordinary law would require G₁(0)+G₁(1/2)=G₁(0), independently of the assigned endpoint.
* `regularizedLogDistribution` at τ=1 is identically zero, so a fixed regularization need not give an injective realization.
* At τ=−1 the regularized values at 0 and 1/2 are zero; these points are fixed by negation.
* At τ=−1 the regularized value at 1/3 is −πi/3. This fixes the orientation of the logarithm difference.
* The imaginary part of `Li_2(exp(2πit))` is smooth on (0,1) and satisfies the weight-one relation, but is not a scalar multiple of B₂. Its unbounded endpoint derivatives show why the extra hypothesis is needed.
* A primitive-character projection with a zero Euler factor cannot establish injectivity; the actual nonzero-factor argument is required for the stated realization.
* The right-continuous B₁ distribution has values −1/2,0,−1/6 at t=0,1/2,1/3; the symmetric odd version changes only the integer value to 0. The B₂ values at those three points are 1/6,−1/12,−1/18.
* The positive Fourier function has nth coefficient n^(−k) at n>0, zero coefficient at n<0, and zero constant coefficient. Reflection exchanges its positive and negative supports; the even and odd projections are distinct.

### 4.11 The corrected rational Cartan realization

Fix a dimension `d>0` and a positive level N. State the rational correction with the native finite Cartan group `C_N=C_d(N)` from §4.9. Choose the established Z/N-basis of the product of the unramified degree-d integer rings modulo the primary powers, giving the simply transitive action of C_N on primitive N-points of `(ℚ/ℤ)^d` and the resulting primitive-point coefficient equivalence. All fiber equations below are vector equations in this actual torus; the translating p⁻¹ is the scalar unit in every off-prime unramified factor. For a level-N point a of order f, define X_N(a) as the primitive N-points y satisfying `(N/f)y=a`, and let `s(X_N(a))` be their full basis sum in Q[C_N]. Define K_p(N) as the subgroup whose coordinates at every prime other than p are 1. Define the translating unit λ_(N,p) to have coordinate 1 at p and coordinate p⁻¹ at every other primary factor. The source coset is `X_p(N)=λ_(N,p)K_p(N)`; the inverse at every off-prime coordinate is essential. Put

```text
ε_p(N)=1−s(X_p(N))/#X_p(N),
r_N(a)=s(X_N(a)) · ∏_(p|order(a)) ε_p(N).
```

These sums and products are in the actual rational group ring. The product is over the prime divisors of the order of a, not a sum over primes and not automatically all primes of N. The API gives exact coefficients of each fiber and coset sum, nonemptiness and mass, the primary-unit equivalence, coset cardinality, denominator clearing, `ε+s(X)/#X=1`, and invariance under the specified Cartan action. In particular r_N(0) is the full primitive sum, while for a primitive point its fiber sum is its basis vector before multiplication by the correction factors. (Kubert, equations (4.1)–(4.5), pp.193–194.)

Prove level compatibility `Norm_(M,N)(r_M(a))=r_N(a)` for every `M|N` and a at level M. Prove the full ordinary distribution law in two explicit local cases: adjoining a prime already in the support and adjoining a new prime. The coset translation, off-prime inverse, kernel reduction and the full norm cardinality enter these identities. Descend r_N to the actual internal ordinary quotient; prove finite Cartan equivariance, then global well-definedness, the all-level insertion formulas and uniqueness. The global map uses the actual point order and the full norm direct limit. (Kubert, Propositions 4.6, 4.8 and 4.10, pp.194–197.)

Define the local integral lattice

```text
V_p(N)=s(K_p(N)) Z[C_N]+ε_p(N) Z[C_N] ⊆ Q[C_N].
```

The notation is the Z-span of every translate of the two displayed elements; it is neither a rational span nor a direct sum. Prove it has full rational span and the actual corrected image equals the product of these lattices over p|N, where product means the Z-span of convolution products. Prove both inclusions using a primary distinguished point `(p^v_p(N)/N,0,…,0)` after the chosen basis identification, primitive root fibers, translated local generators and full norm compatibility. At N=1 the empty lattice product is Z[C₁]. This identifies the image integrally and yields an injection of the internal quotient, its rank `N^d ∏_(p|N)(1−p^(−d))`, equality of internal and global relations, and an isomorphism with the actual global-image finite-level quotient. (Kubert, Theorem 4.11, Proposition 4.13 and Theorem 4.14, pp.197–199.)

The weight-zero instance of `universalWeightedDistribution_finiteBasis` states freeness and rank for the actual finite-level image inside the global quotient, with positive dimension and level.

The API names are `rationalCartanValue`, `rationalCartanValue_equivariant`, `rationalCartanValue_norm`, `rationalCartanValue_distribution`, `rationalCartanValue_integralImage` and the finite-basis theorem. At d=1 the rank specializes to φ(N); at N=1 it is 1 for every positive d. The unramified ring and chosen basis supply the higher-dimensional action explicitly: the group is C_d(N), rather than GL_d itself. The same formulas and the local lattice proof therefore give the general positive-dimensional theorem, with the degree-one residue calculation as a specialization.

**Checks.**

* At d=2,N=2 the rank is 3; at d=1,N=2 it is 1. Dimension zero is excluded: the primitive-point and Cartan hypotheses used by the proof are positive-dimensional.
* At N=1, r₁(0)=1 and the corrected image is Z. Killing the zero point would make this realization impossible.
* At N=6, the p=2 coset has off-prime coordinate `2⁻¹ mod 3=2`; at p=3 the off-prime coordinate is `3⁻¹ mod 2=1`. Using a fixed identity coset at every prime changes the correction.
* A primitive a at a level with two distinct primes receives the product of the two ε factors. Their sum omits the cross term and does not satisfy the full root relation.
* At a=0 the correction product is empty, even if N has many prime factors. Multiplying by every ε_p(N) would change r_N(0).
* V_p is generated over Z inside a Q-space. Defining it to be its full rational span makes the integral-image assertion vacuous and loses the lattice index.
* The finite-to-global comparison requires the internal/global relation equality. Declaring these subgroups equal by notation would assume the injectivity being proved.
* At N=1 the primitive-fiber sum, the empty correction product and the corrected value are all 1. At d=1,N=2, the fiber sum at zero is the sole primitive label and the correction factor at the nonzero point is 0, so r₂(0)=1 and r₂(1/2)=0. At d=1,N=3 the correction is `1−([1]+[2])/2`; the values at 1/3 and 2/3 are opposite half-differences.
* For N=3 the local kernel is the whole two-element Cartan group, its coset has size 2, and V₃ is generated over Z by the full sum and the half-difference. Its Q-span is two-dimensional while it is not defined by that span. For N=1 the empty lattice product is Z; for a zero rational coefficient space all these spans are zero.

### 4.12 Parity, Tate cohomology and the integral torsion

On any quotient Q=U_(S,w)(X) let j be the actual point-negation involution. Define `d_even=j−1` and `d_odd=j+1`; their composites are zero. Define the C₂ representation on the native Z-module Q by the identity and j, and prove its native group norm is d_odd and generator difference is d_even. The API includes uniqueness of this representation from the actual generator action, transport along additive equivalences, intertwining, invariants `ker d_even` and augmentation image `im d_even`. These operator identities specialize the cohomology interfaces listed under Scope and ownership to Q. Unlike the generic norm-quotient comparisons, the targets here construct embeddings into the actual odd quotient `Q/im d_odd` and even quotient `Q/im d_even`, preserving point representatives. Prove their zero/equality criteria, naturality and that both images are killed by 2. Define the parity descent maps induced by d_even from the odd quotient to Q and by d_odd from the even quotient to Q; their kernels are precisely these images, and their images are the corresponding operator images.

If Q is torsion-free, those kernels are exactly the torsion subgroups of the two parity quotients. Construct both Z-linear and F₂-linear equivalences, retaining the original representative maps, inverses and functoriality. Compose the supplied ordinary degree-one and negative Tate interfaces to obtain the torsion comparison with the actual even distribution quotient, under the same torsion-free hypothesis. This target retains point representatives and does not identify ordinary H¹ with degree-zero Tate. (Kubert, Corollary 4.15, pp.199–200; Kubert, *The Z/2Z cohomology of the universal ordinary distribution*, §1, pp.203–207, for the involution and parity conventions.)

Apply this to the torsion-free ordinary torus quotient. For `N>2`, both rational parity ranks are half the primitive count. At N=1, the even rank is 1 and the odd rank 0. At N=2, every point is fixed by negation, so the even rank is `2^d−1` and the odd rank 0. These are ranks; the odd quotient can still contain 2-torsion. State the GL_d action on the rationalized representation and the finite-level compatibility from the basis theorem, not an integral decomposition by half-idempotents.

Use `distributionNegation`, `distributionParityOperator`, `distributionSignRepresentation`, `distributionTateZeroParityEmbedding`, `distributionTateNegOneParityEmbedding`, `distributionHOneParityTorsionEquiv`, `distributionParityTorsionEquiv` and `ordinaryDistribution_parityRank` for the point involution, embeddings and torsion comparisons. Each map keeps the original point representatives. Prove the torsion criterion and annihilation by 2 on the native linear-map parity quotients of a torsion-free module.

**Checks.**

* For Q=Z with trivial involution, `Hhat^0=Z/2`, `Hhat^(−1)=0` and ordinary H¹=0. Interchanging the two Tate degrees fails this test.
* Its even quotient is Z and its odd quotient is Z/2; odd parity need not be torsion-free.
* For the sign involution on Z the two roles reverse: degree-zero Tate is 0, negative Tate and ordinary H¹ are Z/2.
* At d=1,N=2 the ordinary rank is 1, the even rank 1 and odd rank 0. A universal half-rank assertion fails.
* The map from a Tate representative to its parity class retains that representative, and its vanishing is membership in the appropriate operator image. Merely comparing dimensions would not construct these maps.
* For Q=Z and j=1, `d_even=0`, `d_odd=2`, so Hhat⁰=Z/2 and Hhat⁻¹=H¹=0; the odd parity quotient is Z/2 and the even one Z. For Q=Z and j=−1, Hhat⁰=0 and Hhat⁻¹=H¹=Z/2, exchanging the two parity quotients. For Q=0 every displayed map and cohomology group is zero.
* For Q=Z/3 with j=1, the odd quotient is zero but the even quotient has 3-torsion; its negative Tate group is zero. This violates the torsion identification without torsion-freeness of Q and pins that hypothesis.

### 4.13 Gamma counts, residue permutation and normalized antidifferences

On Z define `V(x)=(x−a₀(x))/p`, using the least residue `a₀(x)` modulo p, and

```text
C_p(x)=x−1−V(x−1).
```

Prove continuity, C_p(0)=0, the positive-natural count `C_p(n)=#{1≤m<n:p∤m}`, and `C_p(x+1)−C_p(x)=1_U(x)`. This V is a residue-carry function, not a new Witt-vector construction. For `B=p^(fn)>1` with `B≡1 mod N`, define the permutation of `M={1≤m<B:p∤m}` by

```text
a=m_N^sharp∈{1,…,N},       m=a+hN,
ι(m)=h+1+(N−a)(B−1)/N.
```

Prove the integer range, `Nι(m)≡m mod B`, invertibility on M, unit support and the exact filtration equivalence `a>c ↔ Nι(m)<(N−c)B` for `0≤c≤N`. The N=1 case is the identity. For an odd Dirichlet character χ of positive level N prime to p, prove `ferreroGreenberg_weighted_carry`:

```text
Σ_(1≤a<N)χ(a)V(a/N−1)=χ(p)Σ_(1≤a<N)χ(a)a/N.
```

The coefficient inclusion is into the characteristic-zero p-adic field, and V is the carry function above. These are finite reindexing tools for the derivative formula, not a model of the whole measure. (Zhao, Lemma 4.2, p.472; Appendix A, Proposition A.1, pp.473–474; Appendix B, Example B.1, p.474.)

For a complete ultrametric coefficient field K as in the Conventions and a continuous K-valued f on Z, construct `normalizedMahlerAntidifference f = Λ_f` from Mathlib’s `PadicInt.mahlerEquiv`: if f has Mahler coefficients c_n→0, set the coefficient at 0 of Λ_f to zero and its coefficient at n+1 to c_n. The identity `binom(x+1,n+1)−binom(x,n+1)=binom(x,n)` proves `Λ_f(x+1)−Λ_f(x)=f(x)`. Prove continuity, K-linearity, uniqueness with value zero at 0, coefficient inclusion and the bound `‖Λ_f‖≤‖f‖`; uniqueness follows from constancy on the dense natural integers of a continuous function invariant under translation by 1. This constructs the normalized antidifference used in the arithmetic comparison. (Zhao, Appendix B, p.474, before Example B.1; the construction uses the native Mahler basis.) If f is extended by zero off U, then `Λ_f(1)=0`, and at positive n it sums f over `1≤m<n,p∤m`. For `f=log_p` on U, that sum is `log_p Γ_p(n)`. Thus the continuous identity is

```text
Λ_(1_U log_p)(x)=log_p Γ_p(x),
```

with Γ_p(x), not Γ_p(x+1). Prove normalization and the recurrence on both branches and use density for equality. The shifted sum including the endpoint x instead corresponds to Γ_p(x+1). (Zhao, Appendix B, Example B.2, p.474, with the interval endpoint made explicit.)

Name the finite natural count `gammaUnitCount` and the explicit permutation formula `ferreroGreenbergPermutationValue`. Their arithmetic interpretations have the positive-level and prime hypotheses above; the natural formulas themselves are total. Use `gammaUnitCount_eq`, `gammaUnitCount_step`, `ferreroGreenbergPermutationValue_congruence`, `_mem`, `_bijective` and `_filtration` for the finite API. The finite congruence `N·ι(m)≡m mod B` holds more generally for any B>1 with p∣B and B≡1 mod N, N>0 prime to p, and 0<m<B with p∤m; the prime-power tower is needed for the limiting analytic application, not for this algebraic congruence. The continuous count is `gammaContinuousUnitCount`, with `_nat`, `_zero` and `_difference`; the normalized primitive is `unitLogAntidifference`, with `_zero`, `_difference` and `_eq_logGamma`. Prove existence, uniqueness and the norm bound for the normalized antidifference on native continuous maps. Its log-Gamma comparison retains the zero normalization and both recurrence branches explicitly.

**Checks.**

* At p=2,N=3, the principal character gives carry sum −1 and right side 1, so oddness cannot be omitted. For the odd quadratic character the two sides are both 1/3.
* C_p(0)=0 and C_p(1)=0, while C_p(p+1)=p−1.
* At p=5,N=3,B=25, the permutation values are `ι(1)=17`, `ι(3)=1`, `ι(24)=8`; the zero residue is represented by N, not 0.
* N=1 gives `ι(m)=m`. The arithmetic permutation is never asserted for B=1 or for N divisible by p.
* At n=3, p=5, the sum over `1≤m<3` is log_p 2 and equals log Γ_p(3). Log Γ_p(4) adds log_p 3 and is generally different.
* The unit-log antidifference at 0 and 1 is zero; an arbitrary additive integration constant is excluded.
* For the generic normalized Mahler antidifference, f=0 gives Λ_f=0, f=1 gives Λ_f(x)=x, and f(x)=x gives Λ_f(x)=x(x−1)/2. These pin the coefficient shift and the value at 0 independently of the Gamma comparison. A nonzero constant added to Λ_f preserves the difference equation and violates the normalization.
* At p=5, the continuous count takes values C(0)=0, C(3)=2 and C(6)=4; the finite positive-natural count gives the same latter values. The recurrence at x=0 has increment 0, at x=1 increment 1, and at x=5 increment 0.
* The normalized unit-log antidifference has values 0 at 0 and 1, log_p(2) at 3 for p=5, and log_p(2)+log_p(3) at 4. A shift by one or an added constant fails these separate tests.

### 4.14 Ferrero–Greenberg and the derivative at zero

Let χ be primitive odd of conductor `N>1`, `p∤N`. In a finite coefficient field containing its values, define the actual finite Gamma-log sum

```text
S_(χ,N)=Σ_(0≤a<N)χ(a)log_p Γ_p(a/N).
```

Use the actual integral point a/N, the signed native Gamma unit and the coefficient inclusion. Its API gives finite-sum evaluation, character-linear and coefficient-map laws, the vanishing a=0 term, root-of-unity sign invariance under the logarithm, and no inverse-character or 1/N normalization. Identify the derivative of the branch from §3.2 by differentiating its actual measure integral and applying the reindexing and antidifference formulas of §4.13, including `ferreroGreenberg_weighted_carry` with this odd χ:

```text
Lp_(χω)(0)=−(1−χ(p))B_(1,χ),
Lp_(χω)'(0)=S_(χ,N)+(1−χ(p))B_(1,χ)log_p N.
```

The signature `ferreroGreenberg_derivative` takes the actual unit measure through its positive-moment characterization and continuous tests agreeing near zero with `u exp(−s log_p u)`. These are the `χω` branch tests, since the torsion factor cancels at s=0. It states the derivative as the displayed finite Gamma sum and correction.

The first formula is already the k=1 interpolation. The second is an identification with the derivative, not its definition. Prove the analytic differentiation-under-integral theorem on its valid chart, finite precision comparison with the integral measure, the Zhao residue-permutation limit, the normalized antidifference/Gamma replacement and the limiting equality. Character fields and conductor descent use §2.7. (Gross–Dasgupta, §2, pp.3–5; Zhao, Theorem 4.1 and equations (4.5)–(4.6), pp.470–473.)

When χ(p)=1, the value at zero is zero and the derivative is S. Group the Gamma-log sum into actual Frobenius orbits and apply Gross–Koblitz with the matching Gauss convention. This gives its expression in logarithms of the corresponding finite-field Gauss products, with the orbit length explicitly accounted for. To conclude that the zero is simple, the exact nonvanishing of that χ-projection of the logarithm sum is an additional arithmetic theorem. State it as an explicit nonvanishing input, or prove it using a supplied p-adic linear-forms theorem and the required multiplicative independence. The finite sum formula alone, or the nonzero values of its separate summands, does not establish it. No unconditional simple-zero claim is made from a zero-logarithm adapter. (Gross–Dasgupta, §2, pp.4–5, discussion of Ferrero–Greenberg and its nonvanishing.)

Name the finite scalar adapter `ferreroGreenbergGammaSum`, with `_apply`, `_map`, `_zero_log` and `_congr`; name the arithmetic statements `ferreroGreenberg_derivative`, `ferreroGreenberg_exceptional_zero`, `_gauss_projection`, `_nonzero_of_projection_nonzero` and `_simple_zero_of_projection_nonzero`.

**Checks.**

* If χ(p)=1 the correction involving log N disappears. If χ(p)≠1 it remains, with the positive Bernoulli sign displayed above.
* At quartic level 5, with `χ(2)=i`, the finite adapter is `A(1)+iA(2)−iA(3)−A(4)`. An inverse character or division by N fails this identity.
* A formal zero logarithm makes S=0, demonstrating that a simple-zero theorem needs a nonvanishing input.
* The modulus-zero finite adapter would have an empty sum, but is not an arithmetic conductor case. N=1 is also excluded by the nontrivial odd-character hypotheses.
* Replacing Γ(a/N) by Γ(a/N+1) contributes the finite logarithmic recurrence terms and changes the formula unless those terms are explicitly compensated.
* For χ quadratic modulo 3, the finite adapter is `A(1)−A(2)`; for the quartic modulo 5 it is the four-term expression above; for the zero scalar logarithm it is zero at every level. Replacing χ by χ⁻¹ preserves the quadratic case but fails the quartic case.

### Examples

The p=2 Gamma function is continuous and locally analytic even though the naive modulus-four congruence fails. Its cofinal exponent-three-and-higher construction and its safe 8Z₂ exponential disc address different issues. On the distribution side, at degree one and level 2 the ordinary quotient is generated by [0], while the primitive class [1/2] vanishes; this is why its integral free basis is not simply the primitive point set. The rational Cartan correction realizes that same nonzero class as the full primitive sum. The Gamma period mean descends to an odd Frobenius-orbit quotient, but a scalar realization's existence does not identify that quotient's kernel or prove a p-adic logarithm independence theorem.

### Dependencies

Layers 1–3 for arithmetic interpolation, character integrals and logarithm values; the native p-adic integer, residue, finite-field, Witt, free-group, quotient, representation, cohomology and module-limit carriers; LocalFieldsRamification Layers 0–2 and ProfiniteArithmetic §§0.1–0.4 for unramified fields and profinite comparisons; LocallyAnalyticDistributions §§1.1–1.4 for analytic coefficient series, strict-disc evaluation and unit restriction; Mathlib’s Mahler basis for the normalized antidifference of §4.13; §0.6 for the Iwasawa logarithm and its exponential inverse on deep principal units. The arithmetic Dwork comparison, universal distribution relations and Gamma product identities are proved in this layer.

## Layer 5: Eisenstein families and their localized constant

### 5.1 Positive divisor measures and finite coordinates

For each `n>0` define the integral unit measure

```text
A_n=Σ_(d|n,p∤d)δ_(u(d)),
```

where u(d) is the actual unit of Z with underlying value d. Its API specifies evaluation on every continuous integral test, the ordinary moments and total mass,

```text
A_n(f)=Σ_(d|n,p∤d)f(u(d)),
A_n(x^e)=Σ_(d|n,p∤d)d^e,               e≥0,
A_n(1)=#{d|n:p∤d}.
```

Prove `A_1=δ_1`, `A_(p^r)=δ_1`, `A_(pn)=A_n`, the Euler-divisor formula `σ_e(n)−p^eσ_e(n/p)` when p|n, and its version without the second summand when p∤n. In the latter formula n/p is not a totalized index for the former summand: the divisibility guard is explicit. Prove the bound `‖A_n(f)‖≤‖f‖`, all-test congruences, coefficient extension and naturality under unit-group finite projections. The index n=0 is not a divisor-measure constant; the series constant is a different object below. (RJW, §8, pp.159–160, proof of Theorem 8.2.)

At group level r and coefficient precision s define the actual coordinate

```text
E_(n;r,s)=Σ_(d|n,p∤d)[red_r(u(d))] ∈ (Z/p^s Z)[U_r].
```

Its coefficient at a is the number of retained divisors reducing to a, with multiplicity and then coefficient reduction. Give the exact projection comparison with A_n, simultaneous group/coefficient refinement, locally constant test evaluation, and moments modulo p^s when s≤r. At r=0 it is the total mass at the trivial group basis element; at s=0 the coefficient ring is zero. Prove the prime-power and multiplication-by-p formulas before reducing. Uniformly in n, if `e≡e' mod p^(s−1)(p−1)` with s≥1, the moments agree modulo p^s. This sufficient congruence also applies at p=2, without claiming the cyclic structure of `(Z/2^sZ)ˣ` is the odd-prime one.

For the native continuous unit-power tests `j_e(u)=u^e` with values in Q, prove `unitPowerSequence_uniform` and `unitPowerSequence_tendsto`:

```text
‖j_(k+(p−1)p^r)−j_k‖ ≤ p^(−(r+1)),       k,r≥0,
j_(k+(p−1)p^r) → j_k in C(U,Q).
```

Reduce each unit modulo p^(r+1), use the finite unit group's exponent `(p−1)p^r`, and apply the existing p-adic ideal/norm comparison pointwise and then in the supremum norm. This works at p=2 as well as at odd primes. It implies `not_exists_primePower_moments`: there is no `μ:AbstractMeasure U Q Q` with `μ(j_e)=p^e` for all e≥0. Continuity at k=0 would give values tending to μ(1)=1, whereas the alleged values `p^((p−1)p^r)` tend to 0. This explains why a missing unit atom at p cannot repair the undeleted divisor moments. It is a uniform-topology argument, not an assertion that arbitrary p-adically convergent exponent sequences stay in one character component. (RJW, §8, p.159, interpolation obstruction preceding Theorem 8.2, with the explicit fixed-component sequence.)

The native continuous test is `unitPowerTest`, with its zero, unit and power equations; `unitPowerSequence_uniform` and `not_exists_primePower_moments` use this same test. The light integer moment is `eisensteinPositiveMoment`; Prove its prime-index invariance and Euler-deletion formula at every positive index. The native divisor convention makes the coefficient at n=0 zero. Use `eisensteinPositiveMeasure_apply`, `_support`, `_map` and `_moment` for the finite Dirac-measure API. `existsUnique_eisensteinPositiveMeasure` states the integral measure characterized by its retained divisor moments over complete characteristic-zero coefficient domains with bounded Z-action.

**Checks.**

* At p=2,n=6, `A_6=δ_1+δ_3`, mass 2 and third moment 28. At p=3,n=6 the retained divisors are 1,2 and the first moment is 3.
* A coefficient at n=p survives: `A_p=δ_1`, not zero. Stabilization removes p-divisible divisors, not every index divisible by p.
* At p=2,n=6,r=2,s=3 the coordinate is `[1]+[3]`; at r=1 it is `2[1]`, and at r=1,s=1 it vanishes. A set of distinct residues with coefficient 1 loses multiplicity.
* At p=2,n=6,r=0,s=3 it is `2[1]`, whereas s=0 gives zero at every group level.
* At p=2,n=3, exponents 1 and 5 give moments 4 and 244, whose difference is 240∈8Z₂.
* At p=2, k=0, the first two sequence exponents are 1 and 2. The test u=−1 gives differences −2 and 0, respecting the bounds 1/2 and 1/4; the first test is not identically zero. At p=3,r=0,u=2, `2²−1=3` has norm 1/3. A putative prime-power measure would have mass 1 but its values along the converging sequence tend to 0.
* For the infinite-order unit u∈Z₃ˣ with underlying value 2, `unitPowerTest 3` at exponents 0,1,2 has values 1,2,4. The difference of the exponent-two and exponent-zero tests at this u has norm 1/3.
* At p=5,n=2, exponents 3 and 7 give 9 and 129. Their difference 120 lies in 5Z₅ and not in 25Z₅; congruence only modulo p−1 gives one digit, not arbitrarily many.

### 5.2 The positive-series-valued measure

Define `E^+:C(U,O)→O[[q]]` coefficientwise by constant zero and nth coefficient `A_n(f)` for n>0. This is a native continuous O-linear, power-series-valued measure, with the coefficientwise topology on the power-series target. Its API gives all coefficients, uniqueness, linearity, continuity, the uniform coefficient norm bound, coefficient extension and recovery of each finite group-ring projection. For `b∈O`, if `g(u)−f(u)∈bO` for every u, prove `E^+(g)−E^+(f)∈C(b)O[[q]]`. This coefficientwise divisibility includes b=0 and the unit-ideal case. State the corresponding uniform weight congruence and finite-coordinate moment congruence. These are assertions about every coefficient at once; no sup norm on arbitrary formal power series is needed. (RJW, Theorem 8.2, pp.159–160, for its positive coefficients; the continuity follows from the existing coefficientwise topology.)

Name the positive-series measure `positiveEisensteinSeriesMeasure`; use `_coeff_zero`, `_coeff_succ`, `_continuous`, `_map` and `_unique` for its coefficient specification and evaluation API.

**Checks.**

* E⁺(0)=0, and its constant coefficient is zero for every test, even when the test has nonzero mass.
* The coefficients at q and q^p are both f(1); at p=2 the coefficient at q⁶ for f=x³ is 28.
* At p=2, `C(8)` divides `E⁺(x⁵)−E⁺(x)`. At p=5, `C(25)` does not divide `E⁺(x⁷)−E⁺(x³)`, detected by coefficient 2.
* The stabilized weight-four form at p=2 has constant −7/240, while E⁺(x³) has constant zero. The positive-series construction alone is not its full q-expansion.

### 5.3 Classical arithmetic normalization and stabilization

For even `k≥4`, define the arithmetic level-one form as the scalar multiple of the existing constant-one Eisenstein form

```text
E_k^a=(−B_k/(2k)) E_k^lib.
```

It has constant `−B_k/(2k)=ζ(1−k)/2` and positive coefficients σ_(k−1)(n). Every form and coefficient comparison in this subsection retains this even-weight hypothesis. Its API gives the bundled ModularForm equality, pointwise equation, native q-expansion and both coefficient formulas. The constructor is a scalar normalization of an existing form; it does not rebuild holomorphy or modular invariance. For a prime p define the actual level-Γ₀(p) form

```text
E_(k,p)^a(z)=E_k^a(z)−p^(k−1)E_k^a(pz),
```

using restriction and the library level-raising map. Prove the full q-expansion including degree 0,

```text
a_0(E_(k,p)^a)=(1−p^(k−1))ζ(1−k)/2,
a_n(E_(k,p)^a)=Σ_(d|n,p∤d)d^(k−1)          n>0.
```

This is the arithmetic q-expansion over Q, compared to the complex bundled form through its coefficient embedding. The p-adic interpolation compares that same rational expansion through Q→Q_p. Prove independence of the larger modular level under restriction. No theorem here equates a complex form directly with a p-adic-valued function. (RJW, Definition 8.1, p.159, and Theorem 8.2, p.160.)

Name the arithmetic form `arithmeticEisensteinForm` and its stabilization `stabilizedArithmeticEisensteinForm`; use `_coeff_zero`, `_coeff_pos`, `_apply`, `_qExpansion` and `_divisor_moment` for the comparison.

**Checks.**

* E₄^a has constant 1/240 and coefficient at q equal to 1; E₆^a has constant −1/504 and coefficient at q² equal to 33.
* At p=2,k=4, the stabilized constant is −7/240 and coefficient at q² is 1.
* At p=3,k=4, both coefficients at q² and q⁶ are 9; setting every p-divisible index to zero fails.
* The constant-one library E₄ cannot be used without the scalar factor, even though its modular weight is correct.
* At k=5 the Bernoulli scalar is zero, so that scalar multiple has q coefficient 0, while σ₄(1)=1. Extending the positive coefficient formula to odd weights is false.

### 5.4 Shifted denominators and the full constant coefficient

Write M=Λ_Z(U) and Q(M) for its native total quotient. Coordinate weighting `Tw_x(μ)(f)=μ(xf)` is an algebra automorphism of M with inverse Tw_(x⁻¹); prove its convolution compatibility from x(uv)=x(u)x(v), and extend it to Q(M). For each u∈U define

```text
d_u=u δ_u−1,
n_u=Tw_x(λ_u),
Δ_u=2d_u.
```

Give exact all-test equations, coefficient inclusion, `d_1=n_1=0`, `n_(−1)=0`, character evaluations and

```text
d_u(x^e)=u^(e+1)−1,
n_u(x^e)=λ_u(x^(e+1)).
```

For canonical a=p+1, Tw_x transports regularity of δ_a−1 to d_a, and multiplication by 2 remains regular, even at p=2. Define

```text
A_0=n_a/Δ_a=Tw_x(ζ_p)/2             in Q(M).
```

Here ζ_p is the adapter of IntegralIwasawaTheory §5.0 fixed in §1.6. Its §6.3 Bernoulli dictionary gives `ι_*(A_0)=−β_U/2` and `Δ_u A_0=n_u`. These equations retain the sign and the factor 1/2, including at p=2; they identify the Eisenstein constant with the same canonical object as the analytic branch.

Its API gives the displayed clearing identity, uniqueness, equality for every canonical unit representative, and `Δ_u A_0=n_u` for every u. The latter follows from the actual cross-smoothing identity after applying Tw_x. For every u with Δ_u regular it also identifies the fraction n_u/Δ_u with A₀. A zero denominator at u=1 does not determine A₀ by that equation alone.

For each u define the native localization `S_u=M[Δ_u⁻¹]` and `A_(0,u)^away=n_u/Δ_u` there. Its API gives the integral inclusion, clearing and uniqueness. For any explicit regularity hypothesis on Δ_u construct the injective map `J_u:S_u→Q(M)`, prove its included-measure equation and `J_u(A_(0,u)^away)=A_0`. The canonical a gives the default injective comparison. At u=1 the localization is the zero ring; no field-valued specialization follows. The formal construction is allowed, its arithmetic use is not. (RJW, Theorem 8.2, p.160, with the coordinate twist retained in the denominator.)

This constant is a shifted pseudomeasure. It is not, in general, an ordinary pseudomeasure whose products by all δ_u−1 are measures. To prove the distinction, use the actual inverse character `κ⁻(u)=u⁻¹`. Every shifted denominator has value zero there, while `n_a(κ⁻)=λ_a(1)≠0`. If A₀ were an ordinary pseudomeasure, `(δ_a−1)A₀` would be integral; evaluating its cleared relation at κ⁻ would give the nonzero factor `a⁻¹−1` times λ_a(1), a contradiction. More generally there is no compatible inverse-character evaluation on a subalgebra of Q(M) containing A₀. Thus the pole occurs at the inverse coordinate character. Calling A₀ an ordinary pseudomeasure with a possible pole only at the trivial character loses the twist. (RJW, Theorem 8.2 and Remark 8.3(2), pp.160–161, interpreted with `A₀=xζ_p/2`.)

The light arithmetic value of the doubled denominator is `shiftedClearingValue u e = 2(u^(e+1)−1)`. Its field inverse-character test is `shiftedClearingValue_inverse`, requiring u nonzero. Use `shiftedDenominator_evaluate`, `shiftedNumerator_evaluate`, `shiftedDenominator_regular` and `shiftedConstant_spec` for the actual completed-algebra objects; the scalar test alone proves no regularity theorem.

**Checks.**

* d₁=0 and n₁=0. At canonical a=p+1, `d_a(1)=p`, not zero; the shifted denominator is not δ_a−1.
* At `u=−1`, n_u=0 but d_u need not be zero. A vanishing numerator for this parameter does not imply A₀=0 in a localization where the denominator is not regular.
* At p=2,u=3,e=3, `Δ_u(x³)=160`, while d_u(x³)=80. Division by 2 is not an integral unit operation.
* At κ⁻ every Δ_u evaluates to zero, whereas `n_a(κ⁻)=λ_a(1)` is the nonzero principal mass from §3.7.
* At p=3,a=4, the ordinary difference δ_a−1 has inverse-character value −3/4, which is nonzero. Its product with A₀ still cannot become an integral measure, detecting the shifted pole.
* The map J_u is asserted injective only with a regularity hypothesis. The degenerate localization at u=1 cannot embed as a unital ring in the nonzero total quotient.

### 5.5 Admissible specialization and the full family

Define the moment homomorphism `f_e:M→Q_p`, e≥0, by the existing character-integral algebra map at x^e followed by coefficient inclusion. Its API evaluates Dirac elements, agrees with all actual measure moments, preserves products and has `f_0(μ)=μ(1)`. For every pair (u,e) with

```text
D(u,e)=2(u^(e+1)−1)≠0,
```

construct the unique native Away-lift `ev_(u,e):S_u→Q_p`. Prove agreement on every included measure, its value on A_(0,u)^away, independence of a regular denominator on overlaps and

```text
ev_(u,e)(A_(0,u)^away)
   =(1−p^e)ζ(−e)/2               when e+1 is even and positive.
```

For other nonnegative e use the full Bernoulli formula from the clearing numerator, with its parity zeros; the displayed classical comparison only needs e=k−1 at even k≥4. The canonical u=a=p+1 is admissible for every e≥0. Do not extend f_e to all of Q(M): a regular element elsewhere can still vanish under f_e.

Define the full series `E∈Q(M)[[q]]` by constant A₀ and positive coefficients A_n included in Q(M), and define its Away version E_u by constant A_(0,u)^away and the included positive coefficients. Their APIs are all coefficients, uniqueness, the regular J_u comparison and admissible coefficientwise specialization. The latter recovers the rational q-expansion of `E_(k,p)^a` at e=k−1. This is the exact Eisenstein interpolation theorem, including its constant. (RJW, Theorem 8.2, p.160.)

Define the integral cleared series and its actual series-valued evaluation by

```text
[q^0]N_u=n_u,              [q^n]N_u=Δ_u A_n     (n>0),
[q^n]N_u^eval(f)=([q^n]N_u)(f).
```

Prove uniqueness, native continuity and Z-linearity of N_u^eval, coefficient inclusion, `N_u^eval(x^e)=PowerSeries.map(f_e)(N_u)` with the integral scalar map before inclusion, and the coefficientwise clearing relation `Δ_u E=N_u` in Q(M)[[q]]. The first positive coefficient after moment specialization is `2(u^(e+1)−1)`. The constant is the actual `(e+1)`st numerator moment and is integral, even when the normalized classical constant is not. The construction works for all u, including u=1; only the subsequent division needs admissibility. Extend the same statements to any integral continuous multiplicative character κ, with admissibility `2uκ(u)−2≠0`, rather than limiting the algebraic localization interface to arithmetic weights.

Use `eisensteinMomentHom`, `eisensteinAwayEvaluation`, `fullEisensteinSeries`, `fullEisensteinAwaySeries`, `clearedEisensteinSeries` and `clearedEisensteinEvaluation`. Their API includes `_dirac`, `_coeff_zero`, `_coeff_pos`, `_clear`, `_include`, `_admissible`, `_map` and `_unique` with each nonvanishing or regularity hypothesis retained. The signature `existsUnique_fullEisensteinAwaySeries` constructs the unique localized series directly from the prime and any infinite-order smoothing unit, with integral positive coefficients, an integral cleared constant and all nonnegative-moment specializations. It includes every integer smoothing parameter a>1 prime to p. The specialization identifies all coefficients, including the shifted constant.

**Checks.**

* f₀ is total mass, `f_e(δ_1)=1` and `f_e(δ_(−1))=(−1)^e`; the dyadic sign remains visible.
* At p=2,u=3,e=3, the integral constant of N_u^eval(x³) is −14/3 and its first coefficient is 160. Both lie in Z₂; the first coefficient is not 80.
* At the same p and e, the full normalized constant is −7/240, agreeing with §5.3 after division by 160.
* N₁=0 as a series, but E is nonzero with first coefficient 1. Clearing by a zero parameter does not characterize the family.
* The localized evaluation agrees with every integral coefficient before division. A scalar formula at only A₀ is not a ring map on S_u.
* κ=x⁻¹ is excluded for every u, although it is a valid continuous multiplicative test for each integral coefficient. The missing evaluation is specifically the localized constant's pole.

### 5.6 Ordered character pairs and integral positive families

Let ψ,φ be finite Dirichlet characters of positive tame levels, with values in O⊆K, extended by zero on nonunits at their actual levels. Define for n>0

```text
A_(ψ,φ,n)=Σ_(d|n,p∤d)ψ(n/d)φ(d)δ_(u(d)).
```

The order of the characters is fixed: the right character is evaluated on the divisor d and the left on n/d. Construct both the K-valued and the integral O-valued measure using the native finite weights; the root-of-unity/zero norm bound proves the latter is integral. Their API includes the all-test sum, norm bound, uniqueness under coefficient inclusion, finite residue projection and refinement, moments, test congruences, coefficient embeddings and

```text
A_(ψ,φ,1)=δ_1,
A_(ψ,φ,p^r)=ψ(p)^rδ_1,
A_(ψ,φ,pn)=ψ(p)A_(ψ,φ,n).
```

These scaling equations use p prime to both tame levels; no claim of the same equation is inferred after arbitrarily extending ψ to a level divisible by p. The p-divisible-divisor deletion is already present in the sum. Define its finite O[U_r] coordinate by the actual projection, with coefficient equal to the sum of all corresponding weights. Give level-zero mass, the coefficient inclusion law, finite moment precision modulo `(p:O)^s` when s≤r, and independence of representatives. Define the positive-series-valued O-measure by those coefficients and constant zero; prove continuity, uniqueness, uniform coefficient norm bound, coefficient inclusion, test divisibility and the uniform exponent congruence of §5.1. Its q^(pn) coefficient is ψ(p) times its q^n coefficient. For the level-one pair it recovers the old positive family. (The classical divisor order is Stein, §5, equation (4); Tau Ceti's character Eisenstein q-expansion uses the same ordered twisted divisor sum.)

Name the finite and intrinsic objects `twistedPositiveEisensteinMeasure`, `integralTwistedPositiveEisensteinMeasure`, `twistedPositiveEisensteinFinite` and `twistedPositiveEisensteinSeriesMeasure`. Use `_apply`, `_include_apply`, `_moment`, `_one`, `_mul_p`, `_refine` and `_map` for the ordered-pair interface.

**Checks.**

* With p=2, ψ quadratic modulo 3 and φ=1, the measures at n=2,4,5 are `−δ_1`, `δ_1`, `−δ_1+δ_5`.
* Switching that character to the right position changes n=5 to `δ_1−δ_5`. The ordered pair cannot be treated as symmetric.
* The coefficient at q is f(1) for every pair. Its coefficient at q² in the preceding left-quadratic example is −f(1).
* For both characters at level one the finite sums recover exactly A_n, including all multiplicities after residue reduction.
* At group level zero the finite coordinate is the weighted total mass times [1], not automatically zero.
* At precision s=0 the coefficient quotient is zero; at r=0,s>0 the group is trivial but the coefficient need not vanish.

### 5.7 Tame constants, doubling and the dyadic condition

First take left character 1 and a nonprincipal tame right character η. Its intrinsic ζ_η^U is the actual integral O-measure from Layer 2. Define the doubled family by

```text
G_η(f)=C(ζ_η^U(xf))+2E^+_(1,η)(f).
```

This is an O[[q]]-valued O-measure for every prime. Its API gives all-test evaluation, constant and positive coefficient formulas, linearity, continuity, uniqueness, coefficient inclusion, bound by ‖f‖ at every coefficient, arithmetic constant comparison with the common Euler–Bernoulli value, and the exact relation with twice the normalized K-valued family. The level-one *finite tame-kernel adapter* gives zero ζ and hence twice the positive series; it is not the principal zeta family, whose constant is localized. This distinction must survive any shared notation.

The finite tame-kernel construction and G_η itself also make sense for a principal character at its given level. This does not turn its constant into the principal zeta pseudomeasure. Keep the two constructions distinct. For all results in the rest of this subsection allow the general bounded Z-algebra coefficient field of the conventions, with its native integer subring O. Actual measures require completeness and a nontrivial norm; assume `‖D:K‖=1` (as follows from the tame bounded Z-action and the integral inverse of D).

For n≥1 and a unit residue a modulo p^n, let e_(n,a) be the native continuous O-valued indicator of that residue on U. For nonprincipal η in characteristic zero, prove `doubledTameEisensteinSeriesMeasure_residue`:

```text
ι([q⁰]G_η(e_(n,a)))=−D⁻¹ Σ_(0≤j<D)η(ã+p^n j)j.
```

Here ã is the canonical residue representative. The ambient additive measure has this finite mass by §2.4; at a positive unit residue its fiber is entirely in U, so restriction and coordinate weighting cancel exactly. At level zero the unit fiber and the ambient fiber differ, and a nonunit residue on U gives the zero test. For `q=p^n≥2D`, put `b₀=(1+q) mod D` and choose b=b₀ if p∤b₀, otherwise b=b₀+D. Then b<2D≤q, p∤b and b≡1+q mod D. The finite sum's cyclic shift gives

```text
[q⁰]G_η(e_(n,b)−e_(n,1)) = −1.
```

Prove `doubledTameEisensteinSeriesMeasure_unit_constant` with this actual test. Its construction uses neither primitivity nor a Gauss-sum nonvanishing assumption. The shift is of canonical representatives modulo D; adding p^n inside ZMod(p^n) is the identity and is not this argument. The finite formula and the shift are derived from RJW's finite distribution/Amice comparison (§3.5.3, pp.127–129, and §5.1, pp.141–145), rather than attributed to a named theorem there.

Define an integral scalar lift of sG_η to mean an actual continuous O-linear `M:C(U,O)→O[[q]]` with `map_ι(M(f))=s·map_ι(G_η(f))` for every integral continuous test f. In characteristic zero with η nonprincipal, prove `doubledTameEisensteinSeriesMeasure_scalar_integral_iff`: such a lift exists exactly when `‖s‖≤1`. Sufficiency multiplies G by the native integer-subring element s. Necessity extracts the constant at the displayed difference of two indicators, whose included value is −s. This criterion is stronger than a congruence only at arithmetic characters. In particular, at p=2 no nonprincipal tame character, primitive or imprimitive, has an integral all-test half; boundedness of the Z₂ action gives `0<‖2‖≤1/2`, so `‖1/2‖>1`.

Retain the character-variation interface at its full generality. For η₀,η₁ at the same positive tame level D, suppose B≥0 and `‖η₀(a)−η₁(a)‖≤B` for every residue a. Prove the coefficient-series, operator-norm and doubled-family character-variation bounds:

```text
‖[T^m](F_η₀−F_η₁)‖≤B,
‖μ_η₀−μ_η₁‖op≤B,
‖ι([q^m]G_η₀(f))−ι([q^m]G_η₁(f))‖≤B‖f‖,       m≥0.
```

The first bound follows from the common unit-denominator recurrence; no primitivity or characteristic-zero hypothesis is needed. The second uses native inverse Amice integration and its operator norm comparison; the third uses the common zero-extended test for the constant and the finite weighted divisor sum for positive coefficients. The factor 2 has norm at most one. Norms here are of coefficients and native continuous linear functionals, never a norm on arbitrary formal series. If η₁ is nonprincipal in characteristic zero and B<1, its unit-constant witness still has constant of norm one for η₀ by the ultrametric strict-triangle law. Thus `doubledTameEisensteinSeriesMeasure_near_character_scalar_integral_iff` gives the same criterion for η₀, even if η₀ is principal. The strict bound is essential: 0 and −1 have distance 1 and unequal norms.

At p=2 and every odd D>1 construct `dyadicTameQuadraticReference`: choose an odd prime ℓ|D and pull back its nonprincipal quadratic character along the native unit reduction. Its values on units are ±1 and its zero extension has the same nonunit zeros as the principal level-D character. An actual nonsquare modulo ℓ lifts to a unit modulo D, proving nonprincipality in characteristic zero. The difference from the principal level-D character has norm at most 1/2 by the bounded Z₂ action. Its API is `_square_one`, `_nonprincipal`, `_principal_distance` and `_changeLevel`. This finite construction and the preceding stability theorem prove `dyadicTame_scalar_integral_iff` for every character at D>1: an integral scalar lift exists exactly when `‖s‖≤1`. This includes principal characters, composite levels and imprimitive characters; the level is never silently replaced by the conductor.

At D=1 the tame kernel vanishes and `G_η=2E⁺`. The exact criterion is instead `‖2s‖≤1`, since the coefficient at q on the constant test 1 is 2; sufficiency is multiplication of E⁺ by the integer element 2s. Name this `levelOneTame_scalar_integral_iff`. It does not require characteristic zero, given the stated coefficient action and constructors. At every odd prime, 2 is a unit in O and has norm 1; the same q coefficient proves the criterion `‖s‖≤1` for every η and D. Combining the cases, in characteristic zero prove the scalar-integrality classification for the doubled tame family and `tame_integral_half_iff`, using the actual continuous O-linear lift of the full series-valued measure:

```text
integral lift of sG_η exists ↔ (if D=1 then ‖2s‖≤1 else ‖s‖≤1),
integral lift of (1/2)G_η exists ↔ (p≠2 or D=1).
```

For `IsUnit(2:O)`, define `normalizedTameEisensteinSeriesMeasure` as `N_η=2⁻¹G_η` using that unit. Give `_coeff_zero`, `_coeff_pos`, `_two_mul`, `_map`, `_unique`, continuity, and the normalized coefficient bound `‖[q^m]N_η(f)‖≤‖f‖`. Prove `normalizedTame_scalar_integral_iff` at every positive tame level: an integral scalar lift of sN exists exactly when `‖s‖≤1`, detected by its coefficient 1 at q on the test 1. This normalized criterion needs no characteristic-zero hypothesis beyond the constructors and the unit witness. For an arbitrary integral constant functional, half-normalization is equivalently all-test divisibility by 2; `normalizedTameEisensteinSeriesMeasure_exists_iff_divisible` records this general criterion. For the actual characteristic-zero dyadic tame families above, that divisibility condition fails at every D>1. It holds for the zero constant at D=1. (The doubled arithmetic family is the integral tame specialization of RJW, §8, pp.159–161; the exact scalar classifications are consequences of the explicit finite-residue witness, variation bounds and positive coefficient 1, not an assertion of a dyadic unit in O.)

All-test congruences for G follow coefficientwise without loss. For N with 2 a unit they have the same precision. Halving a field-valued congruence at p=2 loses the valuation of 2, regardless of whether its particular value happens to be integral. These statements concern formal q-expansions and their actual measures; modularity remains the comparison of §5.9.

**Checks.**

* G_η(0)=0 and its first positive coefficient on f is 2f(1), at every prime. For odd p the normalized first coefficient is f(1).
* For p=2,D=3 and η(2)=−1, the three terms at n=2,a=1 have weighted sum −1, giving doubled constant 1/3. The half has constant 1/6 of norm 2 in Q₂ and first positive coefficient 1: it is the constant, not the positive coefficients, that obstructs integrality.
* At the same data the level-zero unit mass is 2/3 whereas the ambient mass is 1/3. At the nonunit residue 0 modulo 4 the unit test vanishes but the ambient mass is 1/3. These fail the proposed residue formula without its two support hypotheses.
* For p=2,D=3,q=8 the choice b=3 gives doubled constants −1/3 and 2/3 at residues b and 1; their difference is −1. For p=2,D=5,q=16 and the quadratic character, b=7 gives the same difference −1. No assertion b=1+p^n in the residue ring is used.
* The witness at D=3 excludes s=1/2 and allows s=0 and s=1. At D=1, s=1/2 is allowed and s=1/4 is excluded over Q₂. The surviving integral half at D=1 is E⁺, with zero constant; it is not the principal localized family with constant A₀.
* For character variation B=0 all coefficients and measures agree. Principal and quadratic characters at D=3 differ by at most 1/2 over Q₂. Their doubled constants on any integral test differ by at most 1/2; this transfers a unit norm but need not transfer the exact value −1.
* The quadratic reference at D=3 has value −1 at 2; at D=5 it has value −1 at 2; the lifted reference at D=9 has value −1 at 2 and zero at 3. These distinguish nonprincipality, composite level and zero extension. At D=1 there is no nonprincipal reference.
* At p=2 the principal characters at D=3 and D=9 have no integral half, just as the nonprincipal characters do. Arbitrary characters at D=15 satisfy the same obstruction. At odd p=3, s=1/3 is excluded for the normalized principal level-four family by its first coefficient.
* In O=Z₂, multiplication by 2 is injective but 2 is not a unit. An unrelated zero constant functional is divisible by 2, while a functional taking value 1 on one integral test is not; neither observation overrides the explicit actual-family obstruction.

### 5.8 Principal tame levels and Euler deletion

For a positive tame level D with `gcd(D,p)=1`, let P be its set of prime divisors. For a subset T⊆P put `d_T=∏_(ℓ∈T)ℓ`. Define in S_a[[q]], for canonical a,

```text
E_(a,D)=Σ_(T⊆P)(−1)^#T C(δ_(u(d_T))) expand_(d_T)(E_a).
```

The coefficient-ring inclusion into S_a is understood. Its API gives D=1 recovery, dependence only on the prime-factor set, coefficient inclusion, first coefficient, finite Euler-operator commutation and

```text
[q^n]E_(a,D)=Σ_(d|n,gcd(d,pD)=1)δ_(u(d))        n>0,
[q^0]E_(a,D)=(∏_(ℓ∈P)(1−δ_(u(ℓ)))) A_(0,a)^away.
```

Prove coefficientwise specialization, giving the factor `∏_(ℓ|D)(1−ℓ^e)` in the constant at weight e. The exponent is e, not e−1: the factor ℓ⁻¹ in the principal pseudomeasure Euler operator of §2.8 is canceled by Tw_x before the Eisenstein constant is formed. Clear the constant with the actual shifted Δ_a and prove the analogous integral-series and finite-coordinate comparisons. Repeated exponents in D introduce no repeated deletion. This construction handles the principal character at its actual tame level, including the case omitted by the nonprincipal finite kernel. (RJW, §5.2 and §8, pp.143–146 and 159–161; the finite Euler deletion is inclusion-exclusion applied to their divisor coefficients.)

Name the finite Euler-deleted series `principalTameEisensteinSeries`; use `_one`, `_coeff_pos`, `_coeff_zero`, `_same_prime_support`, `_specialize` and `_clear` for its actual localized coefficients.

**Checks.**

* D=1 gives the full E_a with its localized constant, not the level-one zero finite tame kernel.
* At p=2, D=3 and D=9 give the same family. At n=3 its positive coefficient is δ₁.
* At any D the coefficient at q is 1. An expansion-only deletion without the δ_ℓ multiplier gives the wrong divisor weight.
* The constant factor at a new ℓ is `1−δ_ℓ`; at x^e it is `1−ℓ^e`. Using the additive zeta factor `1−ℓ^(e−1)` forgets the coordinate twist.

### 5.9 Full character interpolation and the modular comparison

Use the native complex character Eisenstein form supplied by `TauCeti.EisensteinSeries.normalizedCharEisensteinSeriesMF` and the character spaces of ModularForms Layer 0, with weight `k≥3`, primitive right character φ, the stated finite levels for ψ and φ, and parity `ψ(−1)φ(−1)=(-1)^k`. Its arithmetic normalization has positive coefficient

```text
a_n=Σ_(d|n)ψ(n/d)φ(d)d^(k−1),
```

and constant 0 when the actual left level u is greater than 1, and `−B_(k,φ)/(2k)` when the left level is one. The vanishing at u>1 includes a principal character at that level: its zero extension at the first lattice coordinate is still zero. The formula does not replace the left character by its primitive inducer without the associated level operators. The constant comparison from the supplied normalized form to this arithmetic normalization is a named target here; positive coefficients are consumed from the pinned library. Define its p-stabilization by subtracting `φ(p)p^(k−1)` times its p-level raise. Prove its positive coefficient is the moment of `A_(ψ,φ,n)` and its constant is multiplied by `1−φ(p)p^(k−1)`. The coefficient at pn then scales by ψ(p), as in §5.6. Distinguish these two character roles in both the form and the measure proofs.

For every left character at actual level u>1, the full interpolating family is simply the positive integral family, because the classical constant is zero. In particular, for the principal left character at a higher tame level, the finite operator `∏_(ℓ|u)(1−expand_ℓ)` on the left-level-one family deletes the quotient factors ℓ|(n/d) and kills its constant. These operators commute with coefficient extension and the p-deletion operator. For left 1 and nonprincipal tame right η it is the K-valued family of §5.7, with an integral normalized version under the precise normalization hypotheses there. For principal right character at a positive tame level use the localized Euler-deleted family of §5.8. For an extra finite wild arithmetic test, multiply it into the right character, take its actual primitive inducing character and account for every omitted tame Euler factor. Prove the resulting coefficient and constant comparisons through the common algebraic coefficient field; do not assume a product of primitive characters is primitive. Give finite coefficient extension, q-expansion equality under the stated parity hypothesis, vanishing of the incompatible constant branch, and independence of the auxiliary containing level. The nonconstant comparison follows by finite divisors; the constant uses the actual primitive interpolation theorem, including its conductor conventions.

For k=1 or k=2, retain a conditional comparison with an actual supplied holomorphic modular form and its complete specified q-expansion. The exceptional pair k=2,ψ=φ=1 requires its usual stabilized difference rather than a holomorphic level-one E₂. The k≥3 library construction is not extended to those weights by a missing hypothesis. (Tau Ceti, `EisensteinSeries.Normalized`; Stein, Theorem 5.8, §5, for the constant and low-weight exception; RJW, Theorem 8.2, p.160, for the level-one arithmetic interpolation.)

The signature `characterEisenstein_stabilized_qExpansion` states the full stabilized classical expansion, including the Bernoulli constant. Prove the arithmetic-family interpolation and the conditional low-weight comparison with the supplied form and its complete q-expansion.

**Checks.**

* For p=2, left quadratic ψ modulo 3 and φ=1, the retained coefficient at q² is −1, independent of k. If the right character is quadratic instead, it is +1.
* The stabilizing coefficient is φ(p)p^(k−1), while the surviving q^(pn)/q^n ratio is ψ(p). Interchanging the characters changes these two formulas.
* With both characters level one and k=4, the construction agrees with §5.3 including the constant.
* With left level u>1, including its principal character, the constant is zero; importing the right-character Bernoulli value as a constant would be wrong.
* Opposite parity forces every form in the stated character space to be zero, while the positive divisor family still has first arithmetic coefficient 1. The modular comparison therefore requires the parity hypothesis; it cannot extend to opposite-parity moments.
* The level-one weight-two series is not a holomorphic modular form before correction. The low-weight comparison must supply the corrected form and its constant.
* For the downstream angular adapter with p=5, ψ=1 and k=4, the q² coefficient is `1+2³=9` and the constant is `(1−5³)ζ(−3)/2=−31/60`. Its coefficients at q and q⁵ are both 1, fixing the ordinary normalization.
* At k=2 the same adapter has inducing character `ω^(−2)`; at p=5 it is nontrivial. The x⁻¹ weight changes the exponent from k to k−1 and cannot be dropped.
* For ψ=1 the angular weight-zero test is the pole of the transported ζ_p/2. The cleared identities persist there, but the uncleared family has no value.

### Examples

At p=2 and weight 4, the positive divisor family evaluates at x³ to `q+q²+28q³+q⁴+…`, and its full localized version has constant −7/240. Clearing with u=3 gives first positive coefficient 160 and constant −14/3, both integral in Z₂. This checks the factor 2, the weight shift and the p Euler factor simultaneously. For character pairs, the left quadratic character modulo 3 produces the alternating p-power coefficients at p=2; the right character instead controls the coefficient of the removed level-raised form. These distinctions persist under finite residue projections and coefficient extension.

### Dependencies

Layers 0–3 for the common algebraic special values, the arithmetic pseudomeasure, tame measures and analytic evaluation; native scalar localization and power-series maps; the exact measure algebra and finite-coordinate interfaces; ModularForms Layer 0 and “What Mathlib already has (consume)”, and `TauCeti.NumberTheory.ModularForms.EisensteinSeries.Normalized`, for the actual forms and level raising. Layer 4 is not required to assemble the Eisenstein series, although its Gamma formula computes derivatives of their constant characters.

## Downstream consumers

ColemanIntegration is a downstream consumer of §0.6 in L0.14–L0.18: it uses the decomposition on C_p, `existsUnique_isIwasawaLog_padicComplex` and `iwasawaLog p`, together with finite-extension restriction, equivariance under algebra maps and continuous field automorphisms, preservation of intermediate fields, and the normalized branch comparison. Its zero branch is this same function on C_p, including its value 0 at zero. For a general branch parameter a its adapter is `log_a(x)=iwasawaLog p x+a v_p(x)` for x≠0, with value 0 at zero; the decomposition identifies `v_p(x)=m/N`. General-branch uniqueness, restriction and equivariance follow from these imported identities and the valuation laws. Local analytic expansions and Coleman applications belong to ColemanIntegration. Layer 3 supplies its weight-one cyclotomic logarithm comparison and actual unit-restricted primitive for higher polylogarithms. (Furusho, §2.1, p.7, for the branch parameter.)

IntegralIwasawaTheory §5.0 supplies the canonical arithmetic objects and residue; §§1.6, 2.6–2.8 and 3.1–3.2 here identify their smoothing-series and analytic adapters, and §3.7 identifies the principal numerator normalization. Arithmetic consumers of these adapters use the same pseudomeasure, coefficient field, Kummer congruences, finite projections and residue. PadicFamilies §0.12 is a downstream consumer of the arithmetic Eisenstein exports and angular adapters specified in Scope and ownership; ordinary modularity and Hecke comparisons belong there. Eisenstein-family consumers use the localized constant, integral cleared q-expansions and the ordered character-pair specialization. Universal-distribution consumers use the native quotient and finite integral basis; Gamma and cyclotomic-unit consumers use the period-normalized logarithmic distribution with its exact domain. No claim about a higher-rank automorphic L-function, a general Shimura variety or a nonabelian Iwasawa algebra is a prerequisite of these GL₁ arithmetic constructions.

## References

* Joaquín Rodrigues Jacinto and Chris Williams, *An introduction to p-adic L-functions*, Essential Number Theory **4** (2025), no.1, 101–216, [published PDF](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf). The locators above use the printed pages of this edition: §2, Theorem 2.4 and Lemmas 2.6–2.7; §§4–5 for the arithmetic measures; §6, Theorems 6.1 and 6.7 for logarithmic values; §7 for the residue; §8 for Eisenstein interpolation. The coordinate twist and finite-level conductor conventions are stated explicitly in the formulas here.
* Yasuo Morita, *A p-adic analogue of the Γ-function*, Journal of the Faculty of Science, University of Tokyo, Section IA, Mathematics **22** (1975), 255–266, [repository PDF](https://repository.dl.itc.u-tokyo.ac.jp/record/39763/files/jfs220209.pdf). Theorem 1 constructs the continuous function; §2 treats normalized analytic means; Theorem 3 and §3 give its local analytic expression; §4 gives reciprocal mean comparisons. The signed normalization is fixed in §4.1 above.
* Benedict H. Gross and Neal Koblitz, *Gauss sums and the p-adic Γ-function*, Annals of Mathematics **109** (1979), 569–581, [author-hosted scan](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/gross_koblitz.pdf). Theorem 1.7 and Lemma 2.11 identify the Gauss product; Theorem 3.1 gives the multiplication formula. In the logarithmic use of §3, pp.576–577, common periods and least periods are kept distinct as in §4.6 above.
* Alain M. Robert, *The Gross–Koblitz formula revisited*, Rendiconti del Seminario Matematico della Università di Padova **105** (2001), 157–170, [Numdam PDF](https://www.numdam.org/item/RSMUP_2001__105__157_0.pdf). Theorems 1–4 provide the scalar power-series proof, with the all-prime digit estimate on pp.167–168 and the reflection and splitting-function comparisons in the appendices, p.169.
* Daniel S. Kubert, *The universal ordinary distribution*, Bulletin de la Société Mathématique de France **107** (1979), 179–202, [Numdam PDF](https://www.numdam.org/item/10.24033/bsmf.1891.pdf). Theorem 1.8 gives the basis, §2 the Cartan models, §3 the analytic distributions and injective realizations, §4 the rational realization and integral image, and the Appendix the weighted version. The smooth classification is used with the endpoint bound made explicit in §4.10 above.
* Daniel S. Kubert, *The Z/2Z cohomology of the universal ordinary distribution*, Bulletin de la Société Mathématique de France **107** (1979), 203–224, [Numdam PDF](https://www.numdam.org/item/10.24033/bsmf.1892.pdf). The initial definitions and §1, pp.203–207, fix the involution and parity conventions; the concrete two-periodic comparison in §4.12 uses native group cohomology.
* Luochen Zhao, *Sum expressions for Kubota–Leopoldt p-adic L-functions*, Proceedings of the Edinburgh Mathematical Society **65** (2022), 460–479, [published PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1DF77ECEC0EE657089F2E26C0F8AA351/S0013091522000177a.pdf/sum_expressions_for_kubotaleopoldt_padic_lfunctions.pdf). §4, pp.470–473, gives the derivative route; Appendix A gives the residue permutation; Appendix B gives the count and Gamma antidifference. The interval `1≤m<n` is used with Γ_p(n), as in §4.13 above.
* Benedict H. Gross and Samit Dasgupta, *Two encounters with the p-adic Stark conjecture*, 2022, [author-hosted PDF](https://services.math.duke.edu/~dasgupta/papers/Gross.pdf), §2, pp.3–5. This gives the Ferrero–Greenberg formula and explains the additional arithmetic nonvanishing argument for simplicity of the exceptional zero.
* Hidekazu Furusho, *p-adic multiple zeta values I: p-adic multiple polylogarithms and the p-adic KZ equation*, Inventiones Mathematicae **155** (2004), [arXiv:math/0304085v2](https://arxiv.org/abs/math/0304085v2). §2.1, p.7 of the arXiv version, describes the branches of the p-adic logarithm on `C_pˣ` by their value at p; §0.6 uses the branch with value 0.
* Robert F. Coleman, *Dilogarithms, regulators and p-adic L-functions*, Inventiones Mathematicae **69** (1982), 171–208, [GDZ scan](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0069/LOG_0029.pdf). §I, p.171, names the Iwasawa logarithm as an example of a locally analytic homomorphism `C_pˣ→C_p` with derivative 1 at 1, which it calls a branch of the logarithm.
* Lawrence C. Washington, *Introduction to Cyclotomic Fields*, 2nd edition, Graduate Texts in Mathematics 83, Springer, 1997, §5.1, for the classical local p-adic logarithm. The complete convergence, decomposition and branch-comparison targets used here are stated in §0.6.
* William Stein, *Modular Forms: A Computational Approach*, §5, [author's online chapter](https://wstein.org/books/modform/modform/eisenstein.html), Definition 5.1, equation (4) and Theorem 5.8. The online locators have no printed-page offset; the finite character sum, arithmetic constant and exceptional weight-two case are the comparisons used here. Actual forms and character spaces use ModularForms Layer 0 and “What Mathlib already has (consume)”; the ordered-pair constructors and positive coefficients are the pinned Tau Ceti suppliers in Exact supplier contracts.
