# Roadmap: formal Laurent fields, Puiseux expansions and continuous differential calculus

**Summary.** For a field `K`, the field of formal Laurent series `F = K((t))` is the fraction
field of the power series ring `K[[t]]`: a complete discretely valued field with valuation ring
`K[[t]]`, uniformizer `t` and residue field `K`. This roadmap develops the local calculus of `F`
and its algebraic closure. It builds formal substitutions `t ↦ φ(t)`, the group of formal
coordinate changes of `K[[t]]` and its jet groups; the derivative `d/dt`, continuous derivations
and continuous one-forms; residues, primitives and residue duality, for
`F` itself, for vector-valued Laurent series `V((t))` and for formal loop algebras `L((t))`; the
ramified fields `K((t^(1/n)))` and the field of Puiseux series, their union inside the Hahn series
with rational exponents; Newton polygons and Hensel factor lifting over `K[[t]]`; and the finite
extensions and the absolute Galois group of `F`. Layers 1 to 4 hold over every field `K` except
where characteristic zero is stated. The root theorem, the algebraic closure and the absolute
Galois group assume `K` algebraically closed of characteristic zero; each statement records what
it needs.

The headline theorems are these. Every continuous `K`-derivation of `F` is `a · d/dt` for a
unique `a ∈ F`, and the continuous one-forms `Ω¹_cont(F/K)` are free of rank one on `dt` and
universal for continuous derivations into Hausdorff `F`-modules with continuous scalar
multiplication. If `φ ∈ t K[[t]]` is nonzero of order `e`, then `Res(f(φ) dφ) = e · Res(f dt)` for
every `f ∈ F`, in every characteristic. If `K` is algebraically closed of characteristic zero, the
Puiseux field `⋃ₙ K((t^(1/n)))` is an algebraic closure of `F`, and every finite extension of `F`
of degree `e` is `F`-isomorphic to `K((t^(1/e)))`. For such `K`, a compatible choice of primitive
roots of unity `ζₙ` identifies the absolute Galois group of `F` with the profinite integers `ℤ̂` as
topological groups, the generator acting by `t^(1/n) ↦ ζₙ t^(1/n)` on every `n`-th root of `t`.

The roadmap rests on Mathlib's Laurent and Hahn series, power-series substitution, Kähler
differentials, Kummer theory and infinite Galois theory, and on Tau Ceti's profinite integers,
whose ring structure is the completed roadmap ProfiniteArithmetic's. It feeds
[AlgebraicCurves](../AlgebraicCurves/README.md), which carries the substitutions and the residue
formula of Layers 1 to 3 along its completions at places; [NewtonPolygons](../NewtonPolygons/README.md),
which compares its general polygon geometry with the Laurent specialization of Layer 5; and
[AffineLieAlgebras](../AffineLieAlgebras/README.md) and
[FormalConnectionsOpers](../FormalConnectionsOpers/README.md), which use the coordinate changes,
the formal loop algebras of Layer 3 and the Galois group of Layer 7.

The layers below build in order. Layer 1 sets up the carriers, substitution, formal coordinates
and their jet groups. Layer 2 differentiates: the derivative, continuous derivations and continuous
one-forms. Layer 3 integrates: residues, primitives and residue duality, scalar, vector-valued and
Lie-algebra-valued. Layers 1 to 3 use no Newton–Puiseux theory. Layer 4 builds the ramified levels
and the Puiseux field with its valuation and calculus; its embeddings and bases rest on Layer 1,
its calculus on Layers 2 and 3. Layer 5 proves the Newton–Puiseux theorem, Layer 6 classifies the
finite extensions of `F` and computes their Kummer theory, traces and residues, and Layer 7
identifies the absolute Galois group. Other roadmaps cite these layers by the labels L1, L2, L3, L4,
L5, L6 and L7, which resolve to Layers 1 to 7 below.

## Conventions

1. **Carriers.** `K` is a field. `F = K((t))` is Mathlib's `LaurentSeries K`, the Hahn series
   `HahnSeries ℤ K`, written `K⸨X⸩` in Lean, where the parameter `t` is `HahnSeries.single 1 1`.
   `K[[t]]` is `PowerSeries K`, `K[t, t⁻¹]` is `LaurentPolynomial K`, and series with rational
   exponents are `HahnSeries ℚ K`. Statements that hold over a commutative ring `R` are stated
   there, as recorded at each target.
2. **Order and valuation.** `ord = HahnSeries.orderTop`, with `ord 0 = ⊤` (written `∞`) and
   `ord t = 1`; for `f ≠ 0`, `ord f` is the integer `HahnSeries.order f`. The valuation of `F` is
   Mathlib's `LaurentSeries.valued`, multiplicative: `v(f) = exp(−ord f)` in `ℤᵐ⁰`, so
   `v(t) = exp(−1)`.
3. **Topology.** `F` carries its valuation topology: the lattices `U_a = t^a K[[t]]`, `a ∈ ℤ`, form
   a basis of neighbourhoods of zero. `K` carries no topology of its own. A `K`-linear map to `K`
   is called continuous for the discrete topology on `K`, which is the same as vanishing on some
   `U_a`. For `ℂ((t))` this is the topology used, never one built from the topology of `ℂ`.
4. **Power series topology.** `K[[t]]` carries the subspace topology from `F` only inside the
   scope `TauCeti.PowerSeries.WithValuationTopology`; there is no global topology instance on
   `K[[t]]`, and this scope is distinct from Mathlib's `PowerSeries.WithPiTopology`, which uses a
   topology on the coefficients.
5. **Algebra structures.** The `K`-algebra structure on `F` is the one inherited from `K[[t]]`
   through `HahnSeries.ofPowerSeries`. It agrees with the coefficientwise action, but not
   definitionally. Mathlib's `HahnSeries.embDomainAlgHom` is built for the coefficientwise
   structure, so the exponent embeddings of Layer 4 are assembled from `HahnSeries.embDomain` and
   its ring-level lemmas.
6. **Residues.** The residue of a form `f dt` is the coefficient of `t⁻¹` in `f`, the value of
   Mathlib's coefficient map `HahnSeries.coeff` at `−1`; no separate residue operation on `F` is
   introduced. On monomials `Res(tᵐ d(tⁿ)) = n` if `m + n = 0` and `0` otherwise, the convention of
   Mathlib's `LieAlgebra.LoopAlgebra.residuePairing`.
7. **Substitution.** Write `σ_φ(f) = f(φ)`. Then `σ_φ ∘ σ_ψ = σ_(ψ(φ))`: substituting `ψ` and then
   `φ` substitutes `ψ(φ)`. The group of formal coordinates multiplies by composition,
   `(φ · ψ)(t) = φ(ψ(t))`, so `φ ↦ σ_φ` reverses products: it is an anti-isomorphism onto the
   automorphism group of `K[[t]]`, whose multiplication is composition.
8. **Brackets.** On derivations `[δ₁, δ₂] = δ₁δ₂ − δ₂δ₁`, so `[aD, bD] = (a Db − b Da) D` with
   `D = d/dt`. In a group, the commutator of `g` and `h` is `g h g⁻¹ h⁻¹`.
9. **Ramification indices and levels.** Ramification indices are Tau Ceti's
   `TauCeti.RamificationIndex`: positive integers ordered by divisibility, `n ≤ m` meaning `n ∣ m`,
   wrapped in a structure so that the usual order of `ℕ+` does not apply. The level `n` is the
   field `K((t^(1/n)))`, either as the subfield `TauCeti.puiseuxField.level K n` of the Puiseux
   field or as the wrapped copy `TauCeti.LaurentSeries.Level K n` of `K((u))` with `F`-algebra
   structure `t ↦ uⁿ`.
10. **Roots of unity and `ℤ̂`.** `μₙ(K)` is Mathlib's `rootsOfUnity n K`, a finite group with the
    discrete topology. Their inverse limit along `ζ ↦ ζ^(m/n)` for `n ∣ m` is Tau Ceti's
    `TauCeti.PrimeToPTateModule 1 K`, with the inverse-limit topology. A compatible family `ζ` has
    `ζₘ^(m/n) = ζₙ` for `n ∣ m`; it is primitive when every `ζₙ` is a primitive `n`-th root of
    unity. `ℤ̂` is Tau Ceti's `TauCeti.zHat`, the profinite completion of `ℤ` written
    multiplicatively, with generator `TauCeti.zHat.gen`; its ring structure lives on
    `Additive TauCeti.zHat`.
11. **Vector-valued series.** For a `K`-vector space `V`, `V((t))` is Mathlib's `HahnModule ℤ K V`,
    on which `F` acts by convolution (the Cauchy product) and `K` coefficientwise; `HahnModule.of`
    identifies it coefficient by coefficient with `LaurentSeries V`. Its lattices are
    `U_a(V) = t^a V[[t]]`, the series with every coefficient below `a` zero. For a Lie algebra `L`
    over `K`, `L((t))` has the bracket given by convolution of coefficients.
12. **Standing rule.** Every object of this roadmap comes with extensionality, composition and
    transport lemmas and with its coefficient and topology formulas before it is used downstream.
    Hypotheses are written on the statements that use them; many statements of Layers 6 and 7 need
    only that `K` contain a primitive `n`-th root of unity for every `n` (Mathlib's
    `HasEnoughRootsOfUnity`), which holds for `K` algebraically closed of characteristic zero.

## Layer 1: formal substitutions and coordinate groups

### 1.1 Carriers, order and the valuation ring

The constant, polynomial, power-series and Laurent-series maps `K → K[t] → K[[t]] → F` form a
compatible tower of `K`-algebras: Mathlib supplies `K → K[t] → K[[t]]`, and Tau Ceti's
`TauCeti.hahnSeries_isScalarTower_powerSeries` makes `S → K[[t]] → F` a scalar tower for every `S`
over which `K[[t]]` is an algebra, in particular `S = K` and `S = K[t]`. The Laurent polynomials
embed by the finite sum of their monomials, `LaurentPolynomial.toLaurentSeries`, compatibly with
these maps (`LaurentPolynomial.toLaurentSeries_toLaurent`, `LaurentPolynomial.isScalarTower_laurentSeries`).
This embedding preserves coefficients (`LaurentPolynomial.coeff_toLaurentSeries`), so it is
injective (`LaurentPolynomial.toLaurentSeries_injective`); its image is the set of series with
finite support (`LaurentPolynomial.mem_range_toLaurentSeries_iff`); and the order of a nonzero
image is the least exponent of the Laurent polynomial (`LaurentPolynomial.order_toLaurentSeries`).

`K[[t]]` is the valuation ring of `F`: Mathlib's subring `LaurentSeries.powerSeries_as_subring K`
is the ring of integers (`TauCeti.Huber.LaurentSeries.powerSeries_as_subring_eq_integer`,
`TauCeti.Huber.LaurentSeries.integers_powerSeries_as_subring`), it is open
(`TauCeti.Huber.LaurentSeries.isOpen_powerSeries_as_subring`), and a series lies in it exactly
when it has no negative exponents, that is when `ord f ≥ 0`
(`TauCeti.LaurentSeries.mem_range_ofPowerSeries_iff`). Its maximal ideal is `(t)`, the series of
positive order (`TauCeti.LaurentSeries.maximalIdeal_eq_idealOfDefinition`,
`TauCeti.LaurentSeries.mem_maximalIdeal_iff_orderTop_pos`), and its residue field is `K`, the
residue of a power series being its constant coefficient
(`TauCeti.LaurentSeries.residueFieldEquiv`, `TauCeti.LaurentSeries.residueFieldEquiv_residue`). A
nonzero `f` has valuation `exp(−ord f)` (`TauCeti.LaurentSeries.valuation_eq_exp_neg_order`).
*Needs:* Mathlib `LaurentSeries`, `PowerSeries`, `LaurentPolynomial`, `LaurentSeries.valued`,
`LaurentSeries.powerSeries_as_subring`; Tau Ceti `TauCeti.hahnSeries_isScalarTower_powerSeries`,
`LaurentPolynomial.toLaurentSeries` and its API, the valuation-ring results named above.

**Checks.**
- The Laurent polynomial `T⁻¹ + 1` maps to `t⁻¹ + 1`, of order `−1`, its least exponent; an
  embedding through power series alone would have no image for it.

### 1.2 Convergence and Laurent polynomials

A family `fᵢ` converges to `f` in `F` exactly when, for every `a ∈ ℤ`, eventually
`ord(fᵢ − f) ≥ a` (`TauCeti.tendsto_laurentSeries_iff_orderTop_sub`); equivalently, the supports of
the `fᵢ` are eventually bounded below by one common integer and each coefficient of `fᵢ`
eventually equals the corresponding coefficient of `f` (`TauCeti.tendsto_laurentSeries_iff_coeff`).
The second form follows from the first by the stabilization of the finitely many coefficients
between the common lower bound and `a` (`TauCeti.hahnSeries_eventually_forall_lt_coeff_eq`). The
truncations of `f` below an exponent `N` are Laurent polynomials (`LaurentSeries.trunc`,
`LaurentSeries.trunc_eq_sum_Ico`) converging to `f` as `N → ∞`
(`LaurentSeries.tendsto_toLaurentSeries_trunc`), so Laurent polynomials are dense in `F`
(`LaurentPolynomial.denseRange_toLaurentSeries`); so are the rational functions `K(t)`, embedded by
Mathlib's coercion `RatFunc.coeToLaurentSeries` (`LaurentSeries.coe_range_dense`), and `F` is complete
(Mathlib's instance `LaurentSeries.instLaurentSeriesComplete`). The common lower bound cannot be dropped: the sequence
`t^(−j)`, `j ≥ 1`, has every coefficient eventually zero
(`TauCeti.laurentSeries_eventually_coeff_single_neg_succ_eq_zero`) but does not converge to zero
(`TauCeti.laurentSeries_not_tendsto_single_neg_succ`). Prove that it has no limit in `F` at all:
a limit would have every coefficient zero by the coefficient criterion, hence be zero.
*Needs:* Tau Ceti `TauCeti.tendsto_laurentSeries_iff_coeff`,
`TauCeti.laurentSeries_not_tendsto_single_neg_succ`; Mathlib `LaurentSeries.coe_range_dense`.

**Checks.**
- The partial sums of `∑_(j ≥ 0) tʲ` converge to `(1 − t)⁻¹`: supports are bounded below by `0`
  and each coefficient stabilizes at `1`.
- `t^(−j)` converges coefficientwise to `0` but has no limit in `F`; the topology of
  coefficientwise convergence would make it converge to `0`.

### 1.3 Substitution

For a nonzero `φ ∈ t K[[t]]`, Mathlib's `PowerSeries.subst φ` substitutes `φ` into power series.
Mathlib's `PowerSeries.heval` is the corresponding evaluation of power series at a Hahn series of
positive order. Substitution of `φ` is injective (`PowerSeries.subst_eq_zero_iff`), so it extends
uniquely to a `K`-algebra map
`f ↦ f(φ)` of `F` (Frenkel, §3.5.3, pp. 90–91, for changes of coordinate over `ℂ`), Tau Ceti's
`TauCeti.LaurentSeries.substAlgHom`, which on power series is
`PowerSeries.subst` (`TauCeti.LaurentSeries.substAlgHom_coe`). Writing `f = t^(−N) f₊` with
`f₊ ∈ K[[t]]`, it is `f(φ) = φ^(−N) f₊(φ)` for every such representation, so the extension does not
depend on `N` (`TauCeti.LaurentSeries.substAlgHom_single_mul_coe`). It satisfies:

- substitutions compose as power series do: substituting `φ` and then `ψ` is substituting `φ(ψ)`
  (`TauCeti.LaurentSeries.substAlgHom_comp_substAlgHom`), and substituting `t` is the identity
  (`TauCeti.LaurentSeries.substAlgHom_X`);
- for `e = ord φ ≥ 1`, `ord f(φ) = e · ord f` for every `f`, so `v(f(φ)) = v(f)^e`; hence the
  substitution is injective and continuous (`TauCeti.LaurentSeries.orderTop_substAlgHom`,
  `TauCeti.LaurentSeries.valuation_substAlgHom`, `TauCeti.LaurentSeries.substAlgHom_injective`,
  `TauCeti.LaurentSeries.continuous_substAlgHom`);
- the coefficient of `tⁿ` in `f(φ)` is the finite sum `∑_(ord f ≤ j ≤ ⌊n/e⌋) f_j · coeff_n(φ^j)`,
  with powers taken in `F`, and it depends only on the terms of `f` below any `N` with `n < e N`
  (`TauCeti.LaurentSeries.coeff_substAlgHom_eq_sum_Icc`,
  `TauCeti.LaurentSeries.coeff_substAlgHom_eq_of_coeff_eq`);
- the ramified substitution `t ↦ s^e`, `e > 0`, between two copies of `F` is the exponent
  expansion `LaurentSeries.expand K e`, `∑ fₙ tⁿ ↦ ∑ fₙ t^(en)`
  (`TauCeti.LaurentSeries.substAlgHom_X_pow_eq_expand`), with coefficients
  `LaurentSeries.coeff_expand_mul`, order `ord = e · ord f` (`LaurentSeries.orderTop_expand`),
  valuation `v^e` (`LaurentSeries.valuation_expand`), and image the series with every exponent
  divisible by `e` (`LaurentSeries.mem_range_expand_iff`).

*Needs:* Mathlib `PowerSeries.subst`, `PowerSeries.HasSubst`, `PowerSeries.subst_comp_subst`;
Tau Ceti `TauCeti.LaurentSeries.substAlgHom` and the results named above, `LaurentSeries.expand`.

**Checks.**
- `ord(t⁻¹(φ)) = −2` for `φ = t² + t³`: `t⁻¹(φ) = t⁻²(1 + t)⁻¹`. A substitution that kept the order
  of `f` would give `−1`.
- With `φ = t + t²` and `ψ = 2t`, substituting `ψ` and then `φ` sends `t` to `ψ(φ) = 2t + 2t²`; the
  other order `φ(ψ) = 2t + 4t²` is what substituting `φ` and then `ψ` gives.

### 1.4 Formal coordinates and automorphisms of `K[[t]]`

A formal coordinate over a commutative ring `R` is a power series `φ = u t + ⋯` with zero constant
coefficient and unit linear coefficient `u`; over a field, `φ ∈ t K[[t]]` with nonzero linear
coefficient. Under composition they form Tau Ceti's group `TauCeti.FormalCoordinate R`, with
identity `t` and inverse Mathlib's compositional inverse `PowerSeries.substInvOfIsUnit`, whose
coefficients are determined recursively: the degree-`n` coefficient of the composition equation is
solved for the `n`-th coefficient of the inverse because the linear coefficient is a unit
(`PowerSeries.substInvFun`), and the inverse is unique
(`PowerSeries.eq_substInvOfIsUnit_of_subst_eq_X`). The linear coefficient is a homomorphism to `Rˣ`
(`TauCeti.FormalCoordinate.linearCoeff`). Each coordinate gives the substitution automorphism
`σ_φ` of the `R`-algebra `R[[t]]` (`TauCeti.FormalCoordinate.substAlgEquiv`), and
`σ_(φ·ψ) = σ_ψ ∘ σ_φ` (`TauCeti.FormalCoordinate.substAlgEquiv_mul`), which is
`σ_φ ∘ σ_ψ = σ_(ψ(φ))` of Convention 7. Over a field the dictionary is complete: every
`K`-algebra automorphism `σ` of `K[[t]]` is the substitution of the coordinate `σ(t)`
(`TauCeti.FormalCoordinate.ofAlgEquiv`, `TauCeti.FormalCoordinate.substAlgEquiv_ofAlgEquiv`;
over `ℂ`, Frenkel, §3.5.3, pp. 90–91), and `φ ↦ σ_φ` is an isomorphism from the formal coordinates
over `K` onto the opposite of the automorphism group `K[[t]] ≃ₐ[K] K[[t]]`
(`TauCeti.FormalCoordinate.substAlgEquivMulEquiv`), whose
multiplication is composition (Mathlib `AlgEquiv.aut`). Such automorphisms preserve the maximal
ideal `(t)`, since they preserve constant coefficients
(`TauCeti.FormalCoordinate.constantCoeff_substAlgEquiv`). With the topology of Convention 4, under
which the inclusion `K[[t]] → F` is an embedding (`TauCeti.PowerSeries.WithValuationTopology.isInducing_coe`)
and convergence is eventual agreement of each coefficient
(`TauCeti.PowerSeries.WithValuationTopology.tendsto_iff_coeff`), every `K`-algebra endomorphism of
`K[[t]]` is continuous (`TauCeti.PowerSeries.WithValuationTopology.continuous_algHom`) and every
coordinate substitution is a homeomorphism (`TauCeti.FormalCoordinate.substHomeomorph`). On `F`,
a coordinate gives the automorphism `TauCeti.LaurentSeries.substAlgEquiv`.
*Needs:* §1.3; Mathlib `PowerSeries.substInvOfIsUnit`, `PowerSeries.substInvFun`, `AlgEquiv.aut`;
Tau Ceti `TauCeti.FormalCoordinate` and the results named above, the scope
`TauCeti.PowerSeries.WithValuationTopology`.

**Checks.**
- The inverse of `φ = t + t²` is `t − t² + 2t³ − 5t⁴ + 14t⁵ − ⋯`, with signed Catalan
  coefficients: `φ` of it is `t` through degree `5`. Dropping the recursion after the linear term
  would give `t`, and `φ(t) = t + t² ≠ t`.
- `1 + t` is not a coordinate: its constant coefficient is nonzero, so substituting it into
  `∑ tⁿ` does not converge, and a definition asking only for a nonzero linear coefficient would
  admit it.

### 1.5 Jet groups

For `N ≥ 0`, two coordinates have the same `N`-jet when they agree modulo `t^(N+1)`. This
congruence is compatible with composition, so the coordinates congruent to `t` form a normal
subgroup (`TauCeti.FormalCoordinate.jetKernel`) and the quotient is the group of `N`-jets
`TauCeti.FormalCoordinate.Jet R N`, with multiplication truncated composition and the discrete
topology. For `N ≤ M`, truncation `TauCeti.FormalCoordinate.Jet.truncate` is a surjective
homomorphism (`TauCeti.FormalCoordinate.Jet.truncate_surjective`). The coordinate group, with the
topology of agreement modulo each `t^(N+1)` (`TauCeti.FormalCoordinate.tendsto_iff_X_pow_dvd`), is
the inverse limit of its jet groups: the compatible families of jets form a closed subgroup of
their product (`TauCeti.FormalCoordinate.jetLimit`, `TauCeti.FormalCoordinate.isClosed_jetLimit`),
isomorphic to the coordinate group as a topological group
(`TauCeti.FormalCoordinate.jetLimitEquiv`). These jets are classes of parameter series; under
`φ ↦ σ_φ` the `N`-jet group is the opposite of the group of substitution automorphisms of
`K[t]/(t^(N+1))`.
*Needs:* §1.4; Tau Ceti `TauCeti.FormalCoordinate.Jet` and the results named above.

**Checks.**
- The `1`-jet group is `Rˣ`, through the linear coefficient. In jet coordinates
  `(a₁, a₂)(b₁, b₂) = (a₁b₁, a₁b₂ + a₂b₁²)`, so the `2`-jet group is commutative exactly when `1` is
  the only unit of `R`: a unit `a ≠ 1` gives `(a, 0)(1, 1) = (a, a)` and `(1, 1)(a, 0) = (a, a²)`.
  Over `ℚ`, `(t + t²)(2t) = 2t + 4t²` while `2(t + t²) = 2t + 2t²`; over `𝔽₂` the group is
  commutative.

### 1.6 Infinitesimal substitutions and derivations of `K[[t]]`

For a commutative ring `S` and `e ∈ S` with `e² = 0`, the substitution `t ↦ t + e a` is the
automorphism `f ↦ f + e a f′` of `S[[t]]`, written `1 + e a D`
(`TauCeti.infinitesimalSubstAlgEquiv`). Over the dual numbers `R[ε]`, the infinitesimal
substitutions are the `R[ε]`-algebra automorphisms of `R[ε][[t]]` that reduce to the identity
modulo `ε` and preserve `(t)` (`TauCeti.infinitesimalSubstitutions`); they are exactly the
`1 + ε a D` with `a ∈ t R[[t]]`, and `a ↦ 1 + ε a D` is an isomorphism from the additive group
`t R[[t]]` (`TauCeti.infinitesimalSubstitutionsEquiv`), whose `ε`-coefficient on `R[[t]]` is the
derivation `a D` (`TauCeti.infinitesimalSubstitutionsEquiv_apply_map`). This identifies them with
the vector fields `t K[[t]] D` (over `ℂ`, Frenkel, §3.5.4, p. 92). For two square-zero elements
`e₁, e₂`, for instance `ε₁, ε₂` in
`DualNumber (DualNumber K) = K[ε₁, ε₂]/(ε₁², ε₂²)`, the group commutator of `σ₁ = 1 + e₁ a D` and
`σ₂ = 1 + e₂ b D` is `σ₁σ₂σ₁⁻¹σ₂⁻¹ = 1 + e₁e₂ (a Db − b Da) D`
(`TauCeti.infinitesimalSubstAlgEquiv_commutator_apply`), which pins the sign relating composition
of substitutions to the bracket of vector fields.

Every derivation of a commutative ring `A` into an `A`-module is continuous for the `I`-adic
topologies, for every ideal `I`, since `δ(Iⁿ⁺¹) ⊆ Iⁿ M` by the Leibniz rule
(`Derivation.apply_mem_pow_smul_top_of_mem_pow_succ`, `Derivation.continuous_adic`). For
`A = K[[t]]` and `I = (t)` every `K`-derivation of `K[[t]]` is `t`-adically continuous, in every
characteristic, and is determined by its value at `t`: `δ f = f′ · δ(t)`
(`Derivation.apply_eq_derivative_smul`, `PowerSeries.derivation_ext`).
*Needs:* §1.4; Mathlib `DualNumber`, `PowerSeries.derivative`; Tau Ceti the results named above.

**Checks.**
- With `a = t` and `b = t²`, `a Db − b Da = 2t² − t² = t²`, so the commutator is
  `1 + e₁e₂ t² D`; the opposite convention for either the commutator or the bracket gives
  `1 − e₁e₂ t² D`.

### 1.7 Change of coefficient field

A field embedding `σ : K → K′`, applied to every coefficient, gives continuous maps of power series
and Laurent series that preserve valuations (`TauCeti.LaurentSeries.continuous_mapRingHom`,
`TauCeti.LaurentSeries.valuation_mapRingHom`) and commute with substitution: the image of `f(φ)`
is the substitution of the image of `φ` into the image of `f`
(`TauCeti.LaurentSeries.mapRingHom_substAlgHom`, `PowerSeries.map_subst`,
`TauCeti.FormalCoordinate.map_substAlgEquiv`), with compositional inverses
(`PowerSeries.map_substInvOfIsUnit`). Base change of coordinates is a continuous homomorphism
(`TauCeti.FormalCoordinate.map`, `TauCeti.FormalCoordinate.continuous_map`), and jet truncation is
natural in the coefficients (`TauCeti.FormalCoordinate.Jet.map`,
`TauCeti.FormalCoordinate.Jet.map_jet`, `TauCeti.FormalCoordinate.Jet.truncate_map`).
*Needs:* §§1.3–1.5; Mathlib `PowerSeries.map`, `PowerSeries.map_subst`; Tau Ceti the results named
above.

### Examples

- `φ = t + t²` is a coordinate; `σ_φ(t⁻¹) = t⁻¹(1 + t)⁻¹ = t⁻¹ − 1 + t − t² + ⋯`.
- `φ = t²` is not a coordinate; `σ_φ` is the expansion `LaurentSeries.expand K 2`, injective with
  image the even series.
- Over `ℂ`, `ℂ((t))` carries the valuation topology of Convention 3, in which `∑ n! tⁿ` converges
  although it has radius of convergence zero.

### Dependencies

Mathlib: Laurent series and Hahn series, power-series substitution and compositional inverses,
dual numbers, adic topologies. Tau Ceti: the Laurent-polynomial embedding, convergence in `F`, the
valuation ring of `F`, Laurent substitution, formal coordinates and their jets, infinitesimal
substitutions and the continuity of derivations, all named above.

## Layer 2: continuous derivations and one-forms

### 2.1 The derivative

The derivative `D = d/dt` of `F` is Mathlib's `LaurentSeries.derivative`, the first Hasse
derivative, `D(∑ aₙ tⁿ) = ∑ n aₙ tⁿ⁻¹`. Over a commutative ring it satisfies the product rule
(`LaurentSeries.derivative_mul`), so it is a derivation, Tau Ceti's
`TauCeti.laurentSeriesDerivation`; over a field also the inverse and quotient rules
(`LaurentSeries.derivative_inv`, `LaurentSeries.derivative_div`). It extends the derivative and
the Hasse derivatives of power series (`PowerSeries.coe_derivative`, `PowerSeries.coe_hasseDeriv`)
and of Laurent polynomials (`LaurentPolynomial.toLaurentSeries_derivative`), and it obeys the
chain rule `D(f(φ)) = (Df)(φ) · Dφ` for every substitution of §1.3, ramified substitutions and
coordinate automorphisms included (`TauCeti.LaurentSeries.derivative_substAlgHom`). Prove the
Leibniz rule for Hasse derivatives of Laurent series over a commutative ring `R`: for
`k ≥ 0` and `f, g ∈ R((t))`, the `k`-th Hasse derivative of `f g` is
`∑_(i + j = k) D⁽ⁱ⁾f · D⁽ʲ⁾g`, reducing to the power-series case
(`PowerSeries.hasseDeriv_mul`) by writing each series as a monomial times a power series.

Orders: `ord(Df) ≥ ord f − 1` (`LaurentSeries.orderTop_le_orderTop_derivative_add_one`), so `D` is
continuous (`LaurentSeries.continuous_derivative`). For `f ≠ 0` with leading exponent `r` and
leading coefficient `a_r`, the coefficient of `t^(r−1)` in `Df` is `r a_r`
(`LaurentSeries.coeff_derivative_order_sub_one`); if `r` is nonzero in `K`, then
`ord(Df) = r − 1` (`LaurentSeries.orderTop_derivative_eq_order_sub_one_of_cast_ne_zero`). In
general `ord(Df)` is one less than the first exponent `n` with `n aₙ ≠ 0`
(`LaurentSeries.orderTop_derivative_eq_sub_one`), and `Df = 0` exactly when there is no such
exponent (`LaurentSeries.derivative_eq_zero_iff`). In characteristic zero the kernel of `D` is `K`
(`LaurentSeries.derivative_eq_zero_iff_exists_C`).
*Needs:* Mathlib `LaurentSeries.derivative`, `LaurentSeries.hasseDeriv`; Tau Ceti the results
named above, `PowerSeries.hasseDeriv_mul`; §1.3 for the chain rule.

**Checks.**
- In characteristic `p`, `f = t^p + t^(p+1)` has `Df = (p + 1) t^p = t^p`, of order `p`, not
  `ord f − 1 = p − 1`: the leading exponent `p` vanishes in `K`. A formula `ord(Df) = ord f − 1`
  without the hypothesis on `r` would be wrong here.
- `D(t⁻¹) = −t⁻²`, and `D((1 − t)⁻¹) = (1 − t)⁻²` by the quotient rule.

### 2.2 Continuous derivations

The continuous `K`-derivations of `F` form an `F`-submodule of Mathlib's `Derivation K F F`
(`TauCeti.continuousDerivations`). A continuous derivation `δ` is `δ(t) · D`
(`Derivation.eq_smul_laurentSeriesDerivation`), every `a D` is continuous
(`TauCeti.continuous_smul_laurentSeriesDerivation`), and `a D = b D` only if `a = b`
(`TauCeti.smul_laurentSeriesDerivation_inj`): so `a ↦ a D` is an `F`-linear isomorphism from `F`
onto the continuous derivations (`TauCeti.continuousDerivationsEquiv`,
`Derivation.continuous_iff_exists_eq_smul_laurentSeriesDerivation`). More generally a continuous
derivation into a Hausdorff `F`-module with continuous scalar multiplication is `f ↦ Df · δ(t)`
(`Derivation.apply_eq_laurentSeriesDerivation_smul`). The proof compares `δ` with `Df · δ(t)` on
the dense subfield of rational functions. The continuous derivations are closed under the bracket
(`TauCeti.continuousDerivationsLieSubalgebra`), with `[aD, bD] = (a Db − b Da) D` over every
commutative ring (`LaurentSeries.lie_smul_laurentSeriesDerivation`). Among them, those preserving
`K[[t]]` are `K[[t]] D` and those preserving its maximal ideal are `t K[[t]] D`
(`TauCeti.powerSeriesPreservingDerivations`, `TauCeti.powerSeriesPreservingDerivationsEquiv`,
`TauCeti.maximalIdealPreservingDerivations`, `TauCeti.maximalIdealPreservingDerivationsEquiv`),
and the latter correspond to the infinitesimal substitutions of §1.6
(`TauCeti.infinitesimalSubstitutionsEquivDerivations`). These classifications hold in every
characteristic.
*Needs:* §§1.2, 1.6, 2.1; Mathlib `Derivation`, `LaurentSeries.coe_range_dense`; Tau Ceti the
results named above.

**Checks.**
- In characteristic zero, `F` is transcendental over `K(t)` (for instance `exp t ∈ F`), so there is
  a nonzero `K`-derivation of `F` vanishing on `K(t)`; it is not continuous, since a continuous
  derivation with `δ(t) = 0` is zero. A classification of all derivations as `F · D` would be false.
- `[D, tD] = D` and `[tD, t²D] = t² D`, as the bracket formula gives.

### 2.3 Continuous one-forms

Let `λ : Ω[F⁄K] → F` be the `F`-linear map induced by `D` through the universal property of
Kähler differentials, Mathlib's `Derivation.liftKaehlerDifferential` applied to
`TauCeti.laurentSeriesDerivation K`; it sends `f dg` to `f · Dg` and is surjective
(`TauCeti.laurentSeriesDerivation_liftKaehlerDifferential_surjective`). The continuous one-forms
`Ω¹_cont(F/K)` are the quotient `Ω[F⁄K] / ker λ`, Tau Ceti's `TauCeti.ContinuousKaehlerDifferential K`,
with derivation `d`, the image of the Kähler derivation (`TauCeti.ContinuousKaehlerDifferential.D`).
Then:

- `λ` induces an `F`-linear equivalence `Ω¹_cont(F/K) ≃ F` sending `dt` to `1`
  (`TauCeti.ContinuousKaehlerDifferential.equivLaurentSeries`), so every continuous one-form is
  `f dt` for a unique `f`, and `Ω¹_cont(F/K)` has rank one;
- `Ω¹_cont(F/K)` carries the module topology over `F`, for which this equivalence is a
  homeomorphism, that is the valuation topology of `F` transported along it; `d` is continuous
  (`TauCeti.ContinuousKaehlerDifferential.continuous_D`);
- for every Hausdorff `F`-module `M` with continuous scalar multiplication, in particular every
  finite-dimensional Hausdorff `M` with its module topology (Mathlib `IsModuleTopology`), every
  continuous `K`-derivation `δ : F → M` factors uniquely as `ℓ ∘ d` with `ℓ` an `F`-linear map
  (`TauCeti.ContinuousKaehlerDifferential.existsUnique_compDer_eq`), and `ℓ` is continuous
  (`TauCeti.ContinuousKaehlerDifferential.continuous_lift`); conversely every `ℓ ∘ d` is continuous
  (`TauCeti.ContinuousKaehlerDifferential.continuous_compDer`). So `d` is the universal continuous
  derivation;
- one-forms are covariant under change of parameter: for a nonzero `φ ∈ t K[[t]]`, substitution
  `f dt ↦ f(φ) dφ` is a continuous map of `Ω¹_cont(F/K)`, semilinear over `f ↦ f(φ)`, with
  `dφ = Dφ dt` (`TauCeti.ContinuousKaehlerDifferential.subst`,
  `TauCeti.ContinuousKaehlerDifferential.subst_D`,
  `TauCeti.ContinuousKaehlerDifferential.derivative_smul_D_single_one`); substitutions compose as
  power series do (`TauCeti.ContinuousKaehlerDifferential.subst_subst`), and a formal coordinate
  acts by an invertible semilinear map, inverse to that of its inverse coordinate
  (`TauCeti.ContinuousKaehlerDifferential.substEquiv`);
- a field embedding `σ : K → K′` sends `f dt` to `σ(f) dt`, a continuous semilinear injection
  commuting with `d` and with substitution (`TauCeti.ContinuousKaehlerDifferential.map`,
  `TauCeti.ContinuousKaehlerDifferential.map_D`,
  `TauCeti.ContinuousKaehlerDifferential.map_subst`).

*Needs:* §§2.1–2.2; Mathlib `KaehlerDifferential`, `Derivation.liftKaehlerDifferential`,
`IsModuleTopology`; Tau Ceti `TauCeti.ContinuousKaehlerDifferential` and the results named above.

**Checks.**
- `d(t⁻¹) = −t⁻² dt`; under `equivLaurentSeries` it is `−t⁻²`.
- In characteristic zero the quotient map `Ω[F⁄K] → Ω¹_cont(F/K)` is not injective: for the
  derivation `δ` of the Checks of §2.2 and `g = exp t`, the class `dg − Dg · dt` is nonzero in
  `Ω[F⁄K]`, since `δ` sends it to `δ(g) ≠ 0`, and it lies in `ker λ`. Defining the one-forms as
  all of `Ω[F⁄K]` would lose the rank-one statement.

### Examples

- `D(t^(−2) + t) = −2t^(−3) + 1`, and in characteristic `3` this is `t^(−3) + 1`.
- The derivation `t² D` preserves `t K[[t]]` and is the vector field of the infinitesimal
  substitution `t ↦ t + ε t²`.
- Under the coordinate `φ = t + t²`, the form `t⁻¹ dt` becomes `φ⁻¹ dφ = t⁻¹(1 + 2t)(1 + t)⁻¹ dt`.

### Dependencies

Layer 1 (§§1.2, 1.3, 1.6). Mathlib: Laurent derivative and Hasse derivatives, derivations, Kähler
differentials, module topologies. Tau Ceti: the Laurent derivation, continuous derivations and
continuous one-forms named above.

## Layer 3: residue, primitives and coefficient duality

### 3.1 Residues and the finite-map formula

The residue `Res(f dt)` is the coefficient of `t⁻¹` in `f` (Convention 6); it is `K`-linear
(Mathlib `HahnSeries.coeff.linearMap`) and vanishes on `U₀ dt = K[[t]] dt`
(`TauCeti.LaurentSeries.coeff_eq_zero_of_mem_lattice`). Exact forms have residue zero,
`Res(dg) = 0` (`LaurentSeries.coeff_neg_one_derivative`), and the pairing
`(f, g) ↦ Res(f dg)` (`LaurentSeries.residuePairing`) satisfies `Res(f dg) = −Res(g df)` over every
commutative ring (`LaurentSeries.residuePairing_eq_neg_swap`), being alternating
(`LaurentSeries.residuePairing_self`). The residue of the logarithmic derivative `f⁻¹ df` of a
nonzero `f` is `ord f` (`LaurentSeries.coeff_neg_one_derivative_mul_inv`). On Laurent polynomials
the derivative and the residue pairing are those of `K[t, t⁻¹]`
(`LaurentPolynomial.toLaurentSeries_derivative`, `LaurentSeries.residuePairing_toLaurentSeries`).

The finite-map formula holds in every characteristic: for every nonzero `φ ∈ t K[[t]]` of order
`e` and every `f ∈ F`, `Res(f(φ) Dφ dt) = e · Res(f dt)`
(`TauCeti.LaurentSeries.coeff_neg_one_substAlgHom_mul_derivative_eq_nsmul`), and on forms the
substitution of §2.3 multiplies residues by `e`
(`TauCeti.ContinuousKaehlerDifferential.coeff_neg_one_equivLaurentSeries_subst`). In particular a
coordinate change, `e = 1`, preserves residues
(`TauCeti.LaurentSeries.coeff_neg_one_substAlgHom_mul_derivative`; over `ℂ`, Frenkel, §3.5.2,
p. 90), and the pairing `Res(f dg)` is
multiplied by `e` under substitution of both arguments (`LaurentSeries.residuePairing_substAlgHom`).
The route writes `φ = t^e u` with `u` a unit of `K[[t]]`: the monomial `t⁻¹` gives `φ⁻¹ dφ`, of
residue `e`; the monomials `tⁿ`, `n ≥ 0`, give power series, of residue `0`; and the monomials
`tⁿ`, `n ≤ −2`, give residue `0` by the universal coefficient identity of §3.2
(`PowerSeries.coeff_neg_one_coe_zpow_mul_derivative_eq_ite`). The general `f` follows by
linearity, since only finitely many terms of `f` affect a coefficient of `f(φ) Dφ` (§1.3). This is
the coordinate-level formula that AlgebraicCurves §9.2 carries along its completions at places.
*Needs:* §§1.3, 2.1, 2.3, 3.2; Mathlib `HahnSeries.coeff`; Tau Ceti the results named above.

**Checks.**
- For `φ = t²` and `f = t⁻¹`, `f(φ) Dφ = t⁻² · 2t = 2t⁻¹`, of residue `2 = e · 1`. A formula
  without the factor `e` would give `1`.
- For `φ = t² + t³`: `f = t⁻¹` gives residue `2`, while `f = t⁻²` and `f = t⁻³` give `0`.
- In characteristic `p` with `φ = tᵖ`, `Dφ = 0`, so both sides vanish: `e = p` is zero in `K`.
- `Res(t d(t⁻¹)) = −1` and `Res(t⁻¹ d(t)) = 1`, as `Res(f dg) = −Res(g df)` requires.

### 3.2 The universal coefficient identity

For a commutative ring `R`, a unit `u ∈ R[[t]]ˣ` and integers `e, k ≥ 1`,

    e · coeff_(ek)(u^(−k)) + coeff_(ek−1)(u^(−k−1) u′) = 0

(`PowerSeries.mul_coeff_val_zpow_neg_add_coeff_val_zpow_neg_sub_one_mul_derivative_eq_zero`). For
`φ = t^e u` it says that `Res(φ^(−k−1) dφ) = 0` for `k ≥ 1`, in every characteristic. The proof
specializes an identity for the generic power series over a ring without additive torsion
(`PowerSeries.nsmul_coeff_mul_succ_pow_succ_eq_coeff_X_mul_pow_mul_derivative`); another route
proves it in `ℤ[x₀, …, x_(ek)][x₀⁻¹]` through its characteristic-zero fraction field and then
specializes `x_j` to the coefficients of `u`. The coefficients involved depend only on a finite jet
of `u`: if `u` and `v` agree modulo `t^m`, so do `u^k` and `v^k` for every `k ∈ ℤ`, and
`u^k u′` and `v^k v′` agree modulo `t^(m−1)`
(`PowerSeries.trunc_val_zpow_eq_of_trunc_eq`, `PowerSeries.trunc_val_zpow_mul_derivative_eq_of_trunc_eq`).
Inverses, products and derivatives commute with a coefficient map `PowerSeries.map`
(`PowerSeries.map_invOfUnit_ringHom`, `PowerSeries.derivative_map`), which is what the
specialization uses.
*Needs:* Mathlib `PowerSeries`, `PowerSeries.derivative`; Tau Ceti the results named above.

**Checks.**
- `u = 1 + t`, `e = k = 1`: `coeff₁((1 + t)⁻¹) = −1` and `coeff₀((1 + t)⁻²) = 1`, sum `0`.
- `u = 1 + t`, `e = 2`, `k = 1`: `2 · coeff₂((1 + t)⁻¹) = 2` and `coeff₁((1 + t)⁻²) = −2`, sum `0`.

### 3.3 Primitives

In characteristic zero, termwise integration `∑ aₙ tⁿ ↦ ∑_(n ≠ −1) aₙ tⁿ⁺¹/(n + 1)`, including
negative exponents, is Tau Ceti's `TauCeti.laurentSeriesPrimitive`; it is a primitive of every
form of residue zero (`TauCeti.derivative_laurentSeriesPrimitive_of_coeff_neg_one_eq_zero`), every
primitive differs from it by a constant (`TauCeti.existsUnique_laurentSeries_primitive`,
`TauCeti.derivative_eq_iff_eq_laurentSeriesPrimitive_add_single`), and the image of `D` is exactly
the series of residue zero (`TauCeti.range_laurentSeries_derivative`). The form `t⁻¹ dt` is not
exact, in every characteristic (`TauCeti.single_neg_one_not_mem_range_laurentSeries_derivative`).
*Needs:* §2.1; Mathlib `HahnSeries.ofSuppBddBelow`; Tau Ceti the results named above.

**Checks.**
- `t⁻² = D(−t⁻¹)` has residue `0`, and `t⁻¹` has no primitive.
- In characteristic `p`, `t^(p−1)` has residue `0` but is not a derivative: the coefficient of
  `t^(p−1)` in any `Dg` is `p g_p = 0`. The primitive criterion needs characteristic zero.

### 3.4 Residue duality on `F`

For a commutative ring `R`, the residue form `(f, g) ↦ Res(f g dt)` on `R((t))`
(`TauCeti.LaurentSeries.residueForm`) is symmetric and nondegenerate
(`TauCeti.LaurentSeries.residueForm_nondegenerate`), and the orthogonal of `U_a` is `U_(−a)`
(`TauCeti.LaurentSeries.residueForm_orthogonal_lattice`). For `a ≤ b` it induces a perfect pairing
`U_a/U_b × U_(−b)/U_(−a) → R` (`TauCeti.LaurentSeries.residueFormQuotientPairing`, which is perfect
by `TauCeti.LaurentSeries.residueFormQuotientPairing.instIsPerfPair`), matching the coefficient of
`tⁿ` with that of `t^(−1−n)`. Over the field `K` with its discrete topology, a `K`-linear functional
on `F` is continuous exactly when it vanishes on some `U_a`
(`LinearMap.continuous_iff_exists_lattice_le_ker`), and every continuous functional is
`f ↦ Res(g f dt)` for a unique `g ∈ F` (`TauCeti.LaurentSeries.residueDualEquiv`; over `ℂ`, the
residue pairing of `F/K[[t]]` with `K[[t]] dt` in Frenkel, §3.5.5, pp. 94–95).
*Needs:* §1.2; Tau Ceti the results named above, `TauCeti.LaurentSeries.lattice`.

**Checks.**
- The orthogonal of `U₀ = K[[t]]` is `U₀`: `t⁻¹` pairs with `1` to `1`, so it is not orthogonal to
  `U₀`. An orthogonal `U_(−a−1)` would contain it.
- `U₀/U₂` and `U_(−2)/U₀` both have dimension `2`, with `1, t` paired against `t⁻¹, t⁻²`.

### 3.5 Vector-valued Laurent series

For a `K`-vector space `V`, `V((t)) = HahnModule ℤ K V` (Convention 11) carries the lattice
topology in which the `U_a(V)` (`TauCeti.HahnModule.lattice`) form a basis of open neighbourhoods
of zero (for a Lie algebra over `ℂ`, the topology of Frenkel, §1.3.5, footnote 3, p. 27); it is
Hausdorff and linear, finite sums of monomials are dense, and a linear map to a
discrete module is continuous exactly when it vanishes on some lattice
(`TauCeti.HahnModule.hasBasis_nhds_zero_lattice`, `LinearMap.continuous_iff_exists_hahnModule_lattice_le_ker`).
The finite jets `U_a(V)/U_b(V)` are the coefficients on `[a, b)`, of dimension
`(b − a) · dim V` for finite-dimensional `V` (`TauCeti.HahnModule.latticeQuotientEquiv`). For `V`
finite-dimensional, the map `f ⊗ v ↦ f · v` is an `F`-linear equivalence
`F ⊗_K V ≃ V((t))` (`HahnModule.tensorProductEquiv`), defined without a basis and computed in any
basis by coordinates (`HahnModule.tensorProductEquiv_symm_apply`). Prove that:

- each lattice `U_a(V)` is a `K[[t]]`-submodule of `V((t))` for the convolution action, and
  `U_a · U_b(V) ⊆ U_(a+b)(V)`;
- `V((t))` is complete for the uniform structure of its lattice topology: a Cauchy family whose
  supports are eventually bounded below converges coefficientwise, as in §1.2;
- for `V` finite-dimensional, the equivalence `F ⊗_K V ≃ V((t))` restricts to
  `K[[t]] ⊗_K V ≃ U₀(V)`, maps `t^a K[[t]] ⊗_K V` onto `U_a(V)`, and induces
  `(U_a/U_b) ⊗_K V ≃ U_a(V)/U_b(V)` on finite jets.

The continuous `K`-linear dual of `V((t))` is `V*((t)) dt`: every continuous functional is
`f ↦ Res(g(f) dt)` for a unique `g ∈ V*((t))`, contracting coefficients
(`HahnModule.residueDualEquiv`), the functionals vanishing on `U_a(V)` being the `g ∈ U_(−a)(V*)`
(`HahnModule.lattice_le_ker_residueDual_iff`); no finiteness of `V` is needed. With the topology on
the dual whose neighbourhoods of zero are the annihilators of the `U_(−a)(V)` (the scope
`TauCeti.HahnModuleDualTopology`), this identification is a homeomorphism
(`HahnModule.residueDualContinuousLinearEquiv`), compatible with coefficientwise linear maps and
their transposes (`LinearMap.residueDual_hahnModuleMap`, `LinearMap.hahnModuleDualMap`). The `dt`
records how the pairing transforms under a change of parameter: for `V` finite-dimensional,
substituting both series and multiplying the dual one by `Dφ` multiplies the pairing by `ord φ`
(`HahnModule.residueDual_derivative_smul_subst_eq_nsmul`; for scalar series over `ℂ` and coordinate
changes, where `ord φ = 1`, Frenkel, §3.5.5, pp. 94–95).
*Needs:* §§1.2, 1.3, 3.1, 3.4; Mathlib `HahnModule`, `HahnModule.of`; Tau Ceti the results named
above.

**Checks.**
- For `V = K²`, `U₀(V)/U₃(V)` has dimension `6`, the coefficients of `1, t, t²` in each coordinate.
- For `g = v* t⁰` the functional is `f ↦ v*(f₋₁)`. It vanishes on `U_a(V)` exactly when `a ≥ 0`,
  as the criterion `g ∈ U_(−a)(V*)` predicts; pairing coefficient `n` with coefficient `n` instead
  of `−1 − n` would give `f ↦ v*(f₀)`, which does not vanish on `U₀(V)`.

### 3.6 Formal loop algebras

For a Lie algebra `L` over `K`, `L((t)) = HahnModule ℤ K L` is a Lie algebra under the convolution
of coefficients, `[x, y]ₙ = ∑_(i + j = n) [xᵢ, yⱼ]`, a finite sum since supports are bounded below,
with the support of `[x, y]` inside the sum of the supports, so again bounded below
(`HahnModule.coeff_lie`, `HahnModule.support_lie_subset`, `HahnModule.instLieRing`,
`HahnModule.instLieAlgebra`), over `K` and over `F`. The polynomial loop algebra `K[t, t⁻¹] ⊗_K L`, Mathlib's `LieAlgebra.loopAlgebra K ℤ L`,
embeds into it by `tʲ ⊗ v ↦ v tʲ` as a Lie algebra map (`LieAlgebra.LoopAlgebra.toHahnModule`),
with coefficients those of the loop and injective (`LieAlgebra.LoopAlgebra.coeff_toHahnModule`,
`LieAlgebra.LoopAlgebra.toHahnModule_injective`). For `L` finite-dimensional, the comparison
`F ⊗_K L ≃ L((t))` of §3.5 is an isomorphism of Lie algebras over `F`, where `F ⊗_K L` has the
scalar-extended bracket and `F` acts on `L((t))` by convolution (`HahnModule.tensorProductLieEquiv`).
The derivative `D` of `L((t))` is `LaurentSeries.derivative` transported through `HahnModule.of`
(`HahnModule.derivative`), with `D(v tⁿ) = n v tⁿ⁻¹` (`HahnModule.derivative_single`), the
Leibniz rule `D(f x) = Df · x + f · Dx` for `f ∈ F` (`HahnModule.derivative_smul`), the rule
`D[x, y] = [Dx, y] + [x, Dy]` (`HahnModule.derivative_lie`), the estimate `D U_a(V) ⊆ U_(a−1)(V)`
(`HahnModule.derivative_mem_lattice`) and compatibility with coefficientwise linear maps
(`HahnModule.derivative_map`). Prove that `D` is continuous for the lattice topology, and that a Lie
algebra map `L → L′` applied coefficientwise is a Lie algebra map `L((t)) → L′((t))` commuting with
`D` and with the polynomial-loop embeddings.

For a `K`-bilinear form `Φ` on `L`, extended coefficientwise, the residue pairing
`(x, y) ↦ Res(Φ(x, Dy) dt)` (`HahnModule.residuePairing`) restricts along the polynomial-loop
embedding to Mathlib's `LieAlgebra.LoopAlgebra.residuePairing Φ`
(`LieAlgebra.LoopAlgebra.residuePairing_toHahnModule`); on monomials it pairs `v tᵐ` with `w tⁿ` to
`n Φ(v, w)` when `m + n = 0` and to `0` otherwise (`HahnModule.residuePairing_single_single`).
These are the supplier identities for formal loop cocycles (for `ℂ((t))` and an invariant form on a
simple Lie algebra, the cocycle `Res(Φ(x, dy))` of Frenkel, §1.3.5, Lemma 1.3.2, equation (1.3-3),
p. 28).
*Needs:* §§2.1, 3.5; Mathlib `LieAlgebra.loopAlgebra`, `LieAlgebra.LoopAlgebra.residuePairing`;
Tau Ceti the results named above.

**Checks.**
- `Res(Φ(v t, D(w t⁻¹))) = −Φ(v, w)` and `Res(Φ(v t⁻¹, D(w t))) = Φ(v, w)`: the pairing is
  antisymmetric on these modes for symmetric `Φ`, as a 2-cocycle must be. Pairing `Φ(Dx, y)` instead
  would reverse both signs.
- `[x t, y t⁻¹] = [x, y] t⁰` in `L((t))`, the image of `[t ⊗ x, t⁻¹ ⊗ y] = 1 ⊗ [x, y]`.

### Examples

- `Res((1 + t)⁻¹ t⁻² dt) = −1`, the coefficient of `t` in `(1 + t)⁻¹`.
- Under `φ = t + t²`, `Res(t⁻¹ dt)` stays `1`: `φ⁻¹ dφ = t⁻¹(1 + 2t)(1 + t)⁻¹ dt` has residue `1`.
- In characteristic zero, `t⁻³ + 2t⁻² + t` has residue `0` and primitive
  `−t⁻²/2 − 2t⁻¹ + t²/2`.

### Dependencies

Layers 1 and 2 (§§1.2, 1.3, 2.1, 2.3). Mathlib: Hahn modules, polynomial loop algebras and their
residue pairing, linear algebra over fields. Tau Ceti: residues and the finite-map formula, the
universal coefficient identity, primitives, residue duality, the lattice topology on `V((t))`, the
tensor and Lie comparisons, and the derivative and residue pairing on `L((t))`, all named above.

## Layer 4: ramified levels and the Puiseux field

### 4.1 Ramified embeddings and transitions

For `n > 0` the map `ιₙ : K((u)) → HahnSeries ℚ K`, `u ↦ t^(1/n)`, sends the coefficient of `uᵏ` to
the coefficient of `t^(k/n)`; it is `HahnSeries.embDomain` along `k ↦ k/n`, Tau Ceti's
`LaurentSeries.ramifiedEmbedding K n`, a `K`-algebra map over every commutative semiring
(Convention 5). Its coefficients are `coeff_(k/n)(ιₙ f) = coeff_k f` and zero at exponents whose
denominator does not divide `n` (`LaurentSeries.coeff_ramifiedEmbedding_intCast_div`,
`LaurentSeries.coeff_ramifiedEmbedding_of_not_den_dvd`), its support is the image of that of `f`
(`LaurentSeries.support_ramifiedEmbedding`), and it is injective
(`LaurentSeries.ramifiedEmbedding_injective`). For `n ∣ m` the transition `uₙ ↦ uₘ^(m/n)` is the
expansion `LaurentSeries.expand K (m/n)`; transitions compose (`LaurentSeries.expand_expand`) and
`ιₘ ∘ expand (m/n) = ιₙ` (`LaurentSeries.ramifiedEmbedding_comp_expand`). The image of `ιₙ` consists
of the series all of whose exponents have denominator dividing `n`
(`LaurentSeries.mem_range_ramifiedEmbedding_iff`); the image of `ιₙ` lies in that of `ιₘ` exactly
when `n ∣ m` (`LaurentSeries.range_ramifiedEmbedding_le_iff`), and the images of `ιₙ` and `ιₘ` meet
in that of `ι_gcd(n,m)` (`LaurentSeries.range_ramifiedEmbedding_inf`). The exponent-congruence
components are `LaurentSeries.contract`: every Laurent series is `∑_(r < d) uʳ · expand d (contract d f r)`
(`LaurentSeries.sum_single_mul_expand_contract`), uniquely (`LaurentSeries.contract_eq_of_sum_eq`);
on the Hahn side a series lies in the image of an order embedding exactly when its support does
(`HahnSeries.mem_range_embDomain_iff`). The expansion `t ↦ uⁿ` is the substitution of `uⁿ` of §1.3
(`TauCeti.LaurentSeries.substAlgHom_X_pow_eq_expand`).
*Needs:* §1.3; Mathlib `HahnSeries.embDomain`; Tau Ceti the results named above.

**Checks.**
- `ι₂(u + u³) = t^(1/2) + t^(3/2)` and `ι₄(u² + u⁶) = t^(1/2) + t^(3/2)`, consistent with
  `ι₄ ∘ expand 2 = ι₂`.
- `t^(1/2)` lies in the image of `ι₄`, as `ι₄(u²)`: the image of `ιₙ` is characterized by
  denominators dividing `n`, and a characterization by denominator exactly `n` would exclude it.

### 4.2 Ramification indices and the level colimit

Ramification indices are `TauCeti.RamificationIndex` (Convention 9), a directed order with bottom
element `1` under divisibility (`TauCeti.RamificationIndex.le_iff_dvd`), with the transition degree
`m/n` attached to `n ∣ m` (`TauCeti.RamificationIndex.transitionDegree`). The levels and the
expansions form a diagram `TauCeti.puiseuxField.levelDiagram` in Mathlib's category `CommAlgCat K`
of commutative `K`-algebras, indexed by the thin category of this order, and the level embeddings
into the Puiseux field of §4.3 form a cocone on it (`TauCeti.puiseuxField.levelCocone`). That cocone
is a colimit (`TauCeti.puiseuxField.levelCoconeIsColimit`): every compatible family of `K`-algebra
maps from the levels into a commutative `K`-algebra in the universe of `K` factors uniquely through
the Puiseux field.
*Needs:* §§4.1, 4.3; Mathlib `CommAlgCat`, colimits; Tau Ceti the results named above.

### 4.3 The Puiseux field

The Puiseux field is the subfield of `HahnSeries ℚ K` of series with one common denominator: for
some `n > 0`, every exponent of the support is `k/n` with `k ∈ ℤ` (over `ℂ`, the inductive limit
of the `ℂ((t^(1/n)))` in Frenkel, §1.2.1, p. 9). It is Tau Ceti's
`TauCeti.puiseuxField K`, an intermediate field of `HahnSeries ℚ K` over `K`, so closed under
addition, multiplication and inverse
(`TauCeti.mem_puiseuxField_iff_exists_den_dvd`). It is the union of the images of the `ιₙ`
(`TauCeti.mem_puiseuxField_iff`), a directed union (`TauCeti.directed_fieldRange_ramifiedEmbedding`,
`TauCeti.puiseuxField_eq_iSup_fieldRange`). The level embeddings
`TauCeti.puiseuxField.levelEmbedding K n` are compatible along divisibility
(`TauCeti.puiseuxField.levelEmbedding_expand_divExact`), every finite family of Puiseux series lies
in a single common level (`TauCeti.puiseuxField.exists_forall_mem_range_levelEmbedding`), and every
polynomial over the Puiseux field is the image of a polynomial over one level
(`TauCeti.puiseuxField.exists_map_levelEmbedding_eq`). The field `F` acts through the level-one
embedding, with the tower `K → F → puiseuxField K` (its `IsScalarTower` instance), and every level
embedding is compatible with this action after the expansion `t ↦ tⁿ`
(`TauCeti.puiseuxField.levelEmbedding_expand_self`). The inclusion into `HahnSeries ℚ K` is strict
(`TauCeti.puiseuxField_lt_top`), witnessed by the series of §4.5.
*Needs:* §4.1; Mathlib `HahnSeries`, `IntermediateField`; Tau Ceti the results named above.

### 4.4 Levels as extensions of `F`

Over `F`, the level `n` has basis `1, u, …, u^(n−1)`: a series splits uniquely into its `n`
exponent-congruence classes (§4.1), which gives the power basis of the wrapped level
`TauCeti.LaurentSeries.Level.powerBasis` and of the actual level
`TauCeti.puiseuxField.levelPowerBasis`. So the level has degree `n`
(`TauCeti.puiseuxField.level_finrank`), and every Puiseux series is algebraic over `F`, in every
characteristic (`TauCeti.puiseuxField.isAlgebraic_laurentSeries`). The level is obtained by
adjoining a root of `Xⁿ − t`: the parameter has minimal polynomial `Xⁿ − t`
(`TauCeti.LaurentSeries.Level.minpoly_parameter`), which is irreducible over `F`
(`TauCeti.LaurentSeries.irreducible_X_pow_sub_C_single`; equally by Eisenstein's criterion at the
prime `t` of `K[[t]]`), and the level is `F(t^(1/n))` (`TauCeti.puiseuxField.level_eq_adjoin`). As
intermediate fields, level `n` lies in level `m` exactly when `n ∣ m`
(`TauCeti.puiseuxField.level_le_level_iff`), levels `n` and `m` meet in level `gcd(n, m)` and
generate level `lcm(n, m)` (`TauCeti.puiseuxField.level_inf_level`,
`TauCeti.puiseuxField.level_sup_level`), and the levels exhaust the Puiseux field
(`TauCeti.puiseuxField.iSup_level`).
*Needs:* §§4.1, 4.3; Mathlib `PowerBasis`, `minpoly`, `IntermediateField`; Tau Ceti the results
named above.

**Checks.**
- In level `2`, `t^(1/2) + t` has coordinates `(t, 1)` on the basis `1, t^(1/2)`.
- Level `4` ∩ level `6` = level `2`, and their compositum is level `12`, which contains
  `t^(5/12) = t^(1/4) t^(1/6)`.

### 4.5 Valuation and topology of the Puiseux field

The additive valuation of the Puiseux field is the restriction of Mathlib's `HahnSeries.addVal`,
valued in `WithTop ℚ` (`TauCeti.puiseuxField.addVal`); on level `n` it is the integer order of the
Laurent series divided by `n` (`TauCeti.puiseuxField.addVal_levelEmbedding`). The multiplicative
valuation sends a nonzero series of order `q` to `exp(−q)` in `ℚᵐ⁰` and zero to zero
(`TauCeti.puiseuxField.valuation`); its valuation topology has the order balls `{x | q ≤ ord x}` as
a basis at zero (`TauCeti.puiseuxField.hasBasis_nhds_zero`), and each level embedding is a
homeomorphism onto its image (`TauCeti.puiseuxField.isEmbedding_levelEmbedding`). The Puiseux field
is not complete (`TauCeti.puiseuxField.not_completeSpace`): the partial sums of
`∑_(j ≥ 1) t^(j + 1/(j+1))` are Puiseux series and form a Cauchy sequence, since the exponents
increase to infinity (`TauCeti.puiseuxField.cauchySeq_sum_single`), while a limit would have, by
uniqueness of coefficients, every exponent `j + 1/(j+1)` in its support, and these have unbounded
denominators `j + 1` (`TauCeti.puiseuxField.not_tendsto_sum_single`). The same series shows that
the inclusion into `HahnSeries ℚ K` is strict.
*Needs:* §§4.1, 4.3; Mathlib `HahnSeries.addVal`, `Valued`; Tau Ceti the results named above.

**Checks.**
- The exponents `3/2, 7/3, 13/4, …` of the non-completeness series are in lowest terms, since
  `gcd(j² + j + 1, j + 1) = 1`; truncating the series at any `j` gives a Puiseux series of level
  `lcm(2, …, j + 1)`.
- `ord(t^(1/2) + t) = 1/2`: it is `ι₂(u + u²)`, of `u`-order `1`, divided by `2`. An order not
  divided by the level would give `t^(1/2)` order `1`, hence `t = (t^(1/2))²` order `2`, against
  `ord t = 1` on `F`.

### 4.6 Calculus on Puiseux series

In characteristic zero, the derivative `D_t(t^q) = q t^(q−1)` of rational Hahn series preserves the
Puiseux field, and its restriction is a `K`-derivation of it, Tau Ceti's
`TauCeti.puiseuxField.derivation` (`TauCeti.puiseuxField.derivation_single`). It preserves every
level (`TauCeti.puiseuxField.derivation_mem_range_levelEmbedding`) and on level `n`, read in
`u = t^(1/n)`, it is `D_t(ιₙ f) = ιₙ((1/n) u^(1−n) D_u f)`
(`TauCeti.puiseuxField.derivation_levelEmbedding`); it extends the derivative of `F`
(`TauCeti.puiseuxField.derivation_algebraMap_laurentSeries`), it is continuous
(`TauCeti.puiseuxField.continuous_derivation`) and its kernel is `K`
(`TauCeti.puiseuxField.derivation_eq_zero_iff`). Every continuous derivation `δ` into a Hausdorff
module with continuous scalar multiplication is `x ↦ D_t x · δ(t)`
(`Derivation.apply_eq_puiseuxFieldDerivation_smul`), and for a continuous `K`-algebra endomorphism
`ρ` the chain rule `D_t(ρ x) = ρ(D_t x) · D_t(ρ t)` holds
(`TauCeti.puiseuxField.derivation_algHom_apply`).

The continuous one-forms of the Puiseux field are defined by the same quotient of Kähler
differentials as in §2.3, `TauCeti.puiseuxField.ContinuousKaehlerDifferential K`, free of rank one
on `dt` and universal for continuous derivations into Hausdorff modules with continuous scalar
multiplication
(`TauCeti.puiseuxField.ContinuousKaehlerDifferential.equivPuiseuxField`,
`TauCeti.puiseuxField.ContinuousKaehlerDifferential.existsUnique_compDer_eq`). Each level has its
one-forms `Ω¹_cont(K((u))/K)` of §2.3 read in `u`; they map to those of the Puiseux field compatibly
with `d` (`TauCeti.puiseuxField.ContinuousKaehlerDifferential.levelMap`,
`TauCeti.puiseuxField.ContinuousKaehlerDifferential.levelMap_D`), the transition from level `n` to
level `m` is the substitution `uₙ ↦ uₘ^(m/n)` of one-forms, with which the level maps are compatible
(`TauCeti.puiseuxField.ContinuousKaehlerDifferential.levelMap_subst_X_pow`), and every one-form comes
from some level (`TauCeti.puiseuxField.ContinuousKaehlerDifferential.exists_levelMap_eq`).

The residue `Res_t` of a Puiseux form `x dt` is the coefficient of `t⁻¹`, a rational-exponent
coefficient (`TauCeti.puiseuxField.residue`); it extends the residue of `F`
(`TauCeti.puiseuxField.residue_algebraMap_laurentSeries`). With `dt = n u^(n−1) du`,
`Res_u(f dt) = n Res_t(f dt)` on level `n`, in every characteristic
(`TauCeti.puiseuxField.coeff_neg_one_mul_derivative_single_eq_nsmul_residue`). In characteristic
zero a Puiseux series is a derivative `D_t y` exactly when its residue vanishes, and `y` is then
unique up to a constant (`TauCeti.puiseuxField.range_derivation`,
`TauCeti.puiseuxField.derivation_eq_iff_eq_primitive_add_algebraMap`); on level `n` integration in
`t` is integration in `u` after the substitution `t = uⁿ`
(`TauCeti.puiseuxField.primitive_levelEmbedding`); and for a continuous `K`-algebra endomorphism
`ρ` with `e` the order of `ρ t`, `Res(ρ(x) d(ρ t)) = e Res(x dt)`
(`TauCeti.puiseuxField.residue_map_mul_derivation_eq_mul`).
*Needs:* §§2.2–2.3, 3.1, 3.3, 4.1, 4.5; Tau Ceti the results named above.

**Checks.**
- `D_t(t^(1/2)) = (1/2) t^(−1/2)`; on level `2` with `f = u`, `(1/2) u⁻¹ D_u u = (1/2) u⁻¹`, the same
  series.
- `Res_u(t⁻¹ dt) = n`: in `u`, `t⁻¹ dt = u⁻ⁿ · n u^(n−1) du = n u⁻¹ du`, while `Res_t(t⁻¹ dt) = 1`.
  Reading the residue in `u` without the factor `n` would identify the two.

### Examples

- `t^(1/2)` and `t^(1/3)` lie in levels `2` and `3`; their sum lies in level `6` and in no smaller one.
- `(1 + t^(1/2))⁻¹ = ∑ (−1)ʲ t^(j/2)` is a Puiseux series of level `2`.
- `D_t(t^(1/3) + t^(−1/2)) = (1/3) t^(−2/3) − (1/2) t^(−3/2)`, of residue `0`, with primitive
  `t^(1/3) + t^(−1/2)`.

### Dependencies

Layer 1 (§§1.2, 1.3) for the embeddings and bases; Layers 2 and 3 (§§2.2, 2.3, 3.1, 3.3) for the
calculus, which also needs characteristic zero where stated. Mathlib: Hahn series with rational
exponents and their valuation, intermediate fields, power bases, commutative algebras as a category.
Tau Ceti: ramified embeddings, ramification indices and the level colimit, the Puiseux field, its
levels, valuation and calculus, all named above.

<a id="l5-newton-polygons-and-formal-newtonpuiseux"></a>

## Layer 5: Newton polygons and formal Newton–Puiseux

### 5.1 Newton polygons and initial polynomials over `F`

For a domain `R`, the order `ord` on `R((t))` is a real-valued additive valuation,
`LaurentSeries.realAddVal R`. The Newton polygon of a polynomial `P = ∑ aₙ Yⁿ` over `R((t))` is the
lower convex envelope of the points `(n, ord aₙ)`, `Polynomial.newtonPolygon P (LaurentSeries.realAddVal R)`,
with its finite faces (`TauCeti.IsFiniteFace`) and the multiset of its slopes, each counted with the
width of its face (`Polynomial.newtonSlopes`, `Polynomial.count_newtonSlopes_of_isFiniteFace`); these
are Tau Ceti's general polygon geometry, specialized here to `F` with real heights and slopes. The
polygon lies below the heights and is the greatest convex minorant of them
(`Polynomial.newtonPolygon_le`, `Polynomial.le_newtonPolygon`). For nonzero `P` and `Q` the polygon of
`P Q` is the Minkowski sum of those of `P` and `Q` (`Polynomial.newtonPolygon_mul`), equivalently the
slope multiset of `P Q` is the sum of those of `P` and `Q` (`Polynomial.newtonSlopes_mul`). Scaling
`Y ↦ cY` shears the polygon by `ord c` (`Polynomial.newtonPolygon_comp_C_mul_X`), multiplying `P` by
a constant translates the heights (`Polynomial.newtonPolygon_C_mul`), and the ramified substitution
`t ↦ t^q` in the coefficients multiplies the polygon and the slopes by `q`
(`Polynomial.newtonPolygon_map_expand`, `Polynomial.newtonSlopes_map_expand`).

For a real slope `σ`, the initial polynomial `Polynomial.initialPolynomial P σ ∈ R[Y]` collects the
leading coefficients of the `aₙ` at the indices on the supporting line of slope `σ`
(`Polynomial.coeff_initialPolynomial`). Initial polynomials are multiplicative
(`Polynomial.initialPolynomial_mul`); under `Y ↦ Y + c` the initial polynomial at `σ` is translated
by the leading coefficient of `c` when `ord c = −σ` and is unchanged when `ord c > −σ`
(`Polynomial.initialPolynomial_taylor_of_realAddVal_eq`,
`Polynomial.initialPolynomial_taylor_of_lt_realAddVal`); they follow scaling and ramification
(`Polynomial.initialPolynomial_comp_C_mul_X`, `Polynomial.initialPolynomial_map_expand`); and the
multiplicity of `σ` as a slope is the degree minus the order of vanishing at `0` of the initial
polynomial (`Polynomial.count_newtonSlopes_eq_natDegree_sub_natTrailingDegree_initialPolynomial`).
A face of slope `σ` accounts for the roots of order `−σ`.
*Needs:* §1.3; Tau Ceti `Polynomial.newtonPolygon`, `LaurentSeries.realAddVal` and the results
named above.

**Checks.**
- `Y² − t` has points `(0, 1)` and `(2, 0)` and one face, of slope `−1/2`, so its roots have order
  `1/2`; its initial polynomial at `−1/2` is `Y² − 1`, of degree `2` and order of vanishing `0`.
- `(Y − t)(Y − t²)` has slopes `−2` and `−1`, the sum of the slope multisets `{−1}` and `{−2}`.

### 5.2 Hensel factor lifting over `K[[t]]`

`K[[t]]` is complete for the ideal `(t)`, which is its maximal ideal (Mathlib's instance
`IsAdicComplete (Ideal.span {PowerSeries.X}) (PowerSeries K)`, `PowerSeries.maximalIdeal_eq_span_X`),
so it is henselian along `(t)` (`IsAdicComplete.henselianRing`). The coprime-factor form of
Hensel's lemma holds over every commutative ring `R`: if `P ∈ R[[t]][Y]` is monic and its reduction
modulo `t` is `g h` with `g, h ∈ R[Y]` monic and coprime, then `P = G H` with `G, H` monic over
`R[[t]]` reducing to `g` and `h` (`Polynomial.Monic.exists_monic_mul_eq_of_isCoprime`), and these
factors are unique (`Polynomial.Monic.eq_and_eq_of_mul_eq_mul_of_isCoprime`); being monic with
monic reductions, they have the degrees of `g` and `h` (`Polynomial.Monic.natDegree_map`). The
factors are built one power of `t` at a time: the correction in degree `k` solves
`g Hₖ + h Gₖ = Pₖ − ∑_(0 < i < k) Gᵢ H_(k−i)` with `deg Gₖ < deg g` and `deg Hₖ < deg h`, uniquely by
Bézout and polynomial division (`IsCoprime.exists_mem_degreeLT_mul_add_mul_eq`,
`IsCoprime.eq_zero_of_mul_add_mul_eq_zero`), and the solutions are compatible and converge
(Mannaa–Coquand, Lemma 1.7, pp. 4–5). The degree-one case is the simple-root form of Hensel's
lemma: over a field, `K[[t]]` is a henselian local ring (`PowerSeries.henselianLocalRing`), as
Mathlib's `IsAdicComplete.henselianRing` also gives. Over a field `K`, a monic polynomial over `K[[t]]` whose
reduction splits, has degree invertible in `K`, has zero coefficient in degree one below the top and
is not a power of `Y` factors into two monic factors of positive degree
(`Polynomial.Monic.exists_monic_mul_eq_of_nextCoeff_map_eq_zero`); this is the splitting step of
§5.3.
*Needs:* Mathlib `IsAdicComplete`, `IsAdicComplete.henselianRing`, `PowerSeries.maximalIdeal_eq_span_X`;
Tau Ceti the results named above.

**Checks.**
- In characteristic other than `2`, `Y² − (1 + t)` reduces to `(Y − 1)(Y + 1)`, coprime, and lifts to
  `(Y − s)(Y + s)` with `s = 1 + t/2 − t²/8 + t³/16 − ⋯`, the square root of `1 + t`.
- `Y² − t` reduces to `Y · Y`, not coprime, and is irreducible over `K[[t]]` (Eisenstein): the
  coprimality hypothesis cannot be dropped.

### 5.3 The Newton–Puiseux root theorem

Let `K` be algebraically closed of characteristic zero. Every polynomial `P` over `F` of positive
degree has a root after a finite ramification: there are `n > 0` and `y ∈ F` with
`P(tⁿ)(y) = 0`, where `P(tⁿ)` applies `LaurentSeries.expand K n` to the coefficients
(`TauCeti.LaurentSeries.exists_isRoot_map_expand`). Equivalently `P`, embedded at any level, has a
root lying in one level of the Puiseux field (`TauCeti.puiseuxField.exists_isRoot_map_levelEmbedding`).
The route is the Newton–Puiseux algorithm, by induction on the degree `m` (Mannaa–Coquand,
Lemma 1.8 and Theorem 1.9, pp. 5–7, for `P` monic over `K[[t]]` and separable over `F`; the descent
below needs no separability).
Normalize `P` to be monic. A Tschirnhaus shift `Y ↦ Y − a/m`, `a` the coefficient of `Y^(m−1)`,
removes that coefficient (`Polynomial.nextCoeff_taylor_neg_div_eq_zero`). Write the result as
`Y^m + ∑_(i=2)^m aᵢ Y^(m−i)`. If every `aᵢ` is zero, `0` is a root. Otherwise choose `i` minimizing
`ord(aᵢ)/i` over the nonzero `aᵢ` (`Polynomial.Monic.exists_coeff_ne_zero_slope_le`), ramify
`t = s^q` to clear the denominator of that slope, rescale `Y = s^p Z` and divide by `s^(pm)`; the
result is monic over `K[[s]]`, still has zero coefficient in degree `m − 1`, and its reduction has a
nonzero coefficient below the top, so it is not `Z^m`
(`Polynomial.Monic.exists_map_expand_eq_scaleRoots_of_nextCoeff_eq_zero`). This handles negative
slopes too, the exponent `p` being an integer. The reduction is not `(Z − a)^m` either: for `a ≠ 0`
its coefficient `−m a` in degree `m − 1` would be nonzero in characteristic zero, and for `a = 0` it
would be `Z^m`. So it has a nonzero root of multiplicity `r` with `0 < r < m` and a coprime
complement (`Polynomial.Monic.exists_isCoprime_mul_eq_of_nextCoeff_eq_zero`), the factor lifting
of §5.2 gives a monic factor of degree `r`, and the induction applies to it. The degree descends
strictly, and the final factor of degree one gives a root at one level, after undoing the
substitutions. Repeated roots and nonmonic polynomials are covered by the same statement.
*Needs:* §§1.3, 4.1, 4.3, 5.2; Mathlib `IsAlgClosed`, `CharZero`, `Polynomial.taylor`,
`Polynomial.scaleRoots`; Tau Ceti the results named above.

**Checks.**
- `Y² − t` is irreducible over `F` but has the root `u` after `t ↦ u²`, that is at level `2`.
- In characteristic `p`, the Artin–Schreier polynomial `Yᵖ − Y − t⁻¹` has the roots `y + c`,
  `c ∈ 𝔽_p`, with `y = ∑_(i ≥ 1) t^(−1/pⁱ)` in `HahnSeries ℚ K`, since `yᵖ = t⁻¹ + y`; their exponents
  have unbounded denominators, so no root lies in a level. The root theorem needs characteristic
  zero, which the proof uses where `−m a ≠ 0`.

### 5.4 The Puiseux field is an algebraic closure of `F`

Let `K` be algebraically closed of characteristic zero. A polynomial of positive degree over the
Puiseux field has its coefficients in one level `n` (§4.3), so it is the image of a polynomial over
`K((u))`; the root theorem of §5.3 over `K((u))`, after a further ramification `u ↦ u^m`, gives a root
at level `n m` (`TauCeti.puiseuxField.exists_isRoot_levelEmbedding`). Hence the Puiseux field is
algebraically closed (`TauCeti.puiseuxField.instIsAlgClosed`; Mannaa–Coquand, Corollary 1.10, p. 7,
separably closed, hence algebraically closed in characteristic zero), every polynomial over it
splits (Mathlib's `IsAlgClosed.splits`), and, being algebraic over `F` by §4.4, it is an algebraic
closure of `F` (`TauCeti.puiseuxField.instIsAlgClosure`).
*Needs:* §§4.3, 4.4, 5.3; Mathlib `IsAlgClosed`, `IsAlgClosure`; Tau Ceti the results named above.

### Examples

- `Yⁿ − t`, for `K` containing a primitive `n`-th root of unity `ζ`, has the roots `ζⁱ t^(1/n)`,
  `0 ≤ i < n`, of fractional leading order `1/n` (`TauCeti.puiseuxField.pow_eq_single_one_iff`);
  more generally, for `q ∈ ℚ` and `b ≠ 0`, the roots of `Yⁿ − bⁿ t^(nq)` are `ζⁱ b t^q`
  (`TauCeti.puiseuxField.pow_eq_single_iff`).
- `(Y − t)² − t³` has the two branches `t ± t^(3/2)`, which share the initial term `t`
  (`TauCeti.puiseuxField.sub_single_sq_eq_single_iff`); its Newton polygon has the single slope
  `−1`, and the next term appears after translating by `t`.
- `(Y² − t)²` has the repeated roots `± t^(1/2)`, each of multiplicity two.

### Dependencies

Layers 1 and 4 (§§1.3, 4.1, 4.3, 4.4). Mathlib: adic completeness and henselian rings, polynomial
Taylor shifts and root scaling, algebraically closed fields and algebraic closures. Tau Ceti: the
Newton-polygon geometry and its Laurent specialization, the real order valuation, depressed
polynomials, Hensel factor lifting over `K[[t]]`, slope normalization, the Newton–Puiseux theorem
and the algebraic closedness of the Puiseux field, all named above.

## Layer 6: finite extensions, trace and compatible roots

### 6.1 Kummer theory of the levels

Over every field `K`, each `n`-th root of unity `η ∈ K` gives the `F`-algebra automorphism
`u ↦ η u` of level `n`, multiplying the coefficient of `t^(k/n)` by `ηᵏ`
(`TauCeti.puiseuxField.levelKummer`, `TauCeti.puiseuxField.coeff_levelKummer`;
`TauCeti.LaurentSeries.Level.kummer` on the wrapped level), and these are all the automorphisms of
the level over `F`, since `σ(u)/u` is a root of unity of `K((u))`, hence a constant
(`TauCeti.LaurentSeries.Level.kummer_surjective`). For `n ∣ m`, the automorphism of level `m`
attached to `η` restricts on level `n` to the one attached to `η^(m/n)`
(`TauCeti.puiseuxField.levelKummer_inclusion`), and every embedding of level `n` into level `m` over
`F` is the transition of §4.1 after a Kummer automorphism
(`TauCeti.LaurentSeries.Level.exists_eq_transition_comp_kummer`). If `K` contains a primitive
`n`-th root of unity, level `n` is a splitting field of `Xⁿ − t` over `F`, hence Galois
(`TauCeti.LaurentSeries.Level.isSplittingField`, `TauCeti.puiseuxField.isGalois_level`), and its
Galois group is `μₙ(K)` through the Kummer automorphisms
(`TauCeti.puiseuxField.levelGalEquivRootsOfUnity`); the generic Kummer theory is Mathlib's
`isGalois_of_isSplittingField_X_pow_sub_C`, `autEquivRootsOfUnity` and `autEquivZmod` (Mathlib,
`FieldTheory/KummerExtension.lean`).
Prove the finite-level fixed fields: for `n ∣ m`, with `K` containing a primitive `m`-th root of
unity, the subfield of level `m` fixed by the Kummer automorphisms attached to `μ_(m/n)(K)` is
level `n`, so that by the Galois correspondence the intermediate fields of level `m` over `F` are the
levels `n`, `n ∣ m`.
*Needs:* §§4.1, 4.4; Mathlib Kummer theory and the Galois correspondence; Tau Ceti the results named
above.

**Checks.**
- On level `4` with `η = −1 ∈ μ₂(K)`, `t^(k/4) ↦ (−1)ᵏ t^(k/4)` fixes exactly the series in
  `t^(1/2)`, level `2`; with `η = i` of order `4` only `F` is fixed.
- The automorphism of level `4` attached to `i` restricts on level `2` to the one attached to
  `i² = −1`: `t^(1/2) = t^(2/4) ↦ i² t^(1/2)`. Restricting to the one attached to `i` itself would be
  wrong: `u ↦ i u` is not an automorphism of level `2` over `F`, since `(i u)² = −t`.

### 6.2 Finite extensions of `F`

Over every field `K`, a finite extension of `F` inside the Puiseux field lies in one level
(`IntermediateField.exists_le_level`). If `K` contains a primitive `n`-th root of unity for every
`n`, then by the cyclic Galois correspondence of §6.1 an intermediate field of degree `e` is level `e`
(`TauCeti.puiseuxField.eq_level_of_finrank_eq`); the finite-dimensional intermediate fields are
exactly the levels (`IntermediateField.finiteDimensional_iff_exists_eq_level`). A Puiseux series `x`
generates the level `[F(x) : F]` (`TauCeti.puiseuxField.adjoin_simple_eq_level`) and lies in level
`n` exactly when `[F(x) : F]` divides `n` (`TauCeti.puiseuxField.mem_level_iff_finrank_adjoin_dvd`);
so its minimal level is `[F(x) : F]`, at most the degree `d` of any nonzero polynomial over `F` that
`x` satisfies, and every root of such a polynomial lies in level `d!`
(`TauCeti.puiseuxField.mem_level_factorial_of_aeval_eq_zero`). For `K` algebraically closed of
characteristic zero, every finite extension `L` of `F` of degree `e` embeds in the Puiseux field by
§5.4, hence is isomorphic over `F` to level `e`; Tau Ceti chooses such an isomorphism
`TauCeti.LaurentSeries.Level.algEquivOfFinrankEq`, and `L` is isomorphic to level `e` exactly when
its degree is `e` (`TauCeti.LaurentSeries.Level.nonempty_algEquiv_iff`).
*Needs:* §§4.3, 4.4, 5.4, 6.1; Mathlib `IntermediateField`, `minpoly`; Tau Ceti the results named
above.

**Checks.**
- `t^(1/2) + t^(1/3)` has degree `6` over `F` and minimal level `6`; `t^(1/2)` has degree `2`.
- A root of `Y³ − t` lies in level `3`, which divides `3! = 6`.

### 6.3 Local invariants of finite extensions

Over every field `K`, level `d` with its `u`-adic valuation (`TauCeti.LaurentSeries.Level.valuation`)
extends the valuation of `F`, raised to the power `d` (`TauCeti.LaurentSeries.Level.valuation_algebraMap`,
`TauCeti.LaurentSeries.Level.hasExtension`); its integers `K[[u]]` are free over `K[[t]]` with basis
`1, u, …, u^(d−1)`, an element being integral exactly when its congruence components are
(`TauCeti.LaurentSeries.Level.integerBasis`, `TauCeti.LaurentSeries.Level.mem_valuationSubring_iff`);
the maximal ideal `(t)` generates `(u)^d`, so the ramification index is `d`
(`TauCeti.LaurentSeries.Level.ramificationIdx_maximalIdeal`); and both residue fields are `K`, the
residue of an integer being its constant coefficient, so the inertia degree is `1`
(`TauCeti.LaurentSeries.Level.residueFieldEquiv`, `TauCeti.LaurentSeries.Level.inertiaDeg_maximalIdeal`).
No hypothesis on the residue field `K` is used: it may be infinite, imperfect or of any
characteristic. For `K` algebraically closed of characteristic zero and `L` a finite extension of
degree `e`, the `u`-adic valuation transported to `L` does not depend on the chosen isomorphism with
level `e`, since two choices differ by a Kummer automorphism
(`TauCeti.LaurentSeries.Level.valuationOfFinrankEq`,
`TauCeti.LaurentSeries.Level.valuationOfFinrankEq_algEquiv_apply`); its integers are a discrete
valuation ring with ramification index `e` over `K[[t]]` and residue field `K`
(`TauCeti.LaurentSeries.Level.valuationSubringEquivOfFinrankEq`,
`TauCeti.LaurentSeries.Level.ramificationIdx_valuationOfFinrankEq`,
`TauCeti.LaurentSeries.Level.residueFieldEquivOfFinrankEq`).
*Needs:* §§4.4, 6.1, 6.2; Mathlib `Valuation`, `Ideal.ramificationIdx`, `Ideal.inertiaDeg`; Tau Ceti
the results named above.

### 6.4 One-forms, trace and residues on finite extensions

The continuous one-forms of level `d` are those of §2.3 read in `u`
(`TauCeti.LaurentSeries.Level.ContinuousKaehlerDifferential`), every one `g du` for a unique `g`;
pulling back along `t = u^d` gives an `F`-linear map from the one-forms of `F`, with
`dt = d u^(d−1) du` (`TauCeti.LaurentSeries.Level.ContinuousKaehlerDifferential.map`). When `d` is
nonzero in `K`, so that the level is separable over `F`, it extends to an isomorphism
`L ⊗_F Ω¹_cont(F/K) ≃ Ω¹_cont(L/K)` of `L`-modules
(`TauCeti.LaurentSeries.Level.ContinuousKaehlerDifferential.tensorEquiv`), and the trace of `L/F`
acting on the first factor gives the trace of one-forms `g dt ↦ Tr_(L/F)(g) dt`
(`TauCeti.LaurentSeries.Level.ContinuousKaehlerDifferential.trace`), continuous for the valuation
topologies (`TauCeti.LaurentSeries.Level.ContinuousKaehlerDifferential.continuous_trace`). It
preserves residues: `Res_F(Tr_(L/F) ω) = Res_L(ω)`
(`TauCeti.LaurentSeries.Level.ContinuousKaehlerDifferential.coeff_neg_one_equivLaurentSeries_trace`).
On coefficients `Tr_(L/F)(f) = d · contract d f 0`, keeping the exponents divisible by `d`
(`TauCeti.LaurentSeries.Level.trace_eq_nsmul_contract`); on monomials `Tr(uᵏ) = d t^(k/d)` when
`d ∣ k` and `0` otherwise (`TauCeti.LaurentSeries.Level.trace_parameter_zpow`); and in every
characteristic `Res_t(Tr_(L/F)(g) dt) = Res_u(g dt)` for forms `g dt`
(`TauCeti.LaurentSeries.Level.coeff_neg_one_trace`).

The residue `Res_u(x dt)` of a form `x dt` on level `d`, read in `u`, is `d` times the coefficient of
`u^(−d)` in `x` (`TauCeti.LaurentSeries.Level.residue`, `TauCeti.LaurentSeries.Level.residue_eq_nsmul_coeff`),
and on the Puiseux field it is `d` times the rational-exponent residue `Res_t^ℚ` of §4.6
(`TauCeti.LaurentSeries.Level.residue_eq_nsmul_residue_toPuiseux`): `Res_u` includes the factor `d`
when a form is written with `dt`, `Res_t^ℚ` does not. It is invariant under every automorphism of
the level over `F`, in every characteristic, so for a finite extension `L` the residue computed
through an `F`-isomorphism with level `e` does not depend on the isomorphism
(`TauCeti.LaurentSeries.Level.residue_apply_eq_of_algEquiv`,
`TauCeti.LaurentSeries.Level.residueOfFinrankEq`). In particular
`Res_F(Tr_(L_e/F)(x) dt) = e · Res_t^ℚ(x dt)` (`TauCeti.puiseuxField.coeff_trace_level`), and for
`n ∣ m`, `Res_(u_m) = (m/n) Res_(u_n)` along the transition (`TauCeti.LaurentSeries.Level.residue_transition`),
while `Res_t^ℚ` is compatible with the inclusions of levels (`TauCeti.puiseuxField.residue_levelEmbedding`).
*Needs:* §§2.3, 3.1, 4.6, 6.1, 6.2; Mathlib `Algebra.trace`, `TensorProduct`; Tau Ceti the results
named above.

**Checks.**
- On level `2` in characteristic other than `2`, `u⁻¹ du = (1/2) u⁻² dt = (1/2) t⁻¹ dt`, of `u`-residue
  `1`; its trace is `Tr((1/2) t⁻¹) dt = t⁻¹ dt`, of `t`-residue `1`. A normalization
  `Res_F ∘ Tr = d · Res_L` would give `2`.
- `Tr_(L/F)(u) = 0` and `Tr_(L/F)(1) = 2` on level `2`.

### 6.5 Compatible roots of unity and their limit

The groups `μₙ(K)`, each finite with the discrete topology whatever topology `K` might carry, form an
inverse system along `ζ ↦ ζ^(m/n)` for `n ∣ m`. Its limit in `ProfiniteGrp` is the closed subgroup of
compatible families in their product, Tau Ceti's `TauCeti.PrimeToPTateModule 1 K`
(`TauCeti.primeToPTateModuleSubgroup`), a compact Hausdorff totally disconnected group whose
topology is induced from the product (`TauCeti.PrimeToPTateModule.continuous_iff`); the limit cone
on the diagram `TauCeti.PrimeToPTateModule.rootsOfUnityDiagram` of finite discrete groups is
`TauCeti.PrimeToPTateModule.rootsOfUnityConeIsLimit`. When `K` has a primitive `n`-th root of unity
for every `n`, a compatible family of primitive roots `ζ = (ζₙ)` exists
(`TauCeti.PrimeToPTateModule.exists_forall_isPrimitiveRoot`); such a family is a choice, made once. For
`K = ℂ` the family `ζₙ = exp(2πi/n)` is compatible and primitive
(`TauCeti.PrimeToPTateModule.complexExp`, `TauCeti.PrimeToPTateModule.isPrimitiveRoot_proj_complexExp`).
A primitive family `ζ` identifies the limit with `ℤ̂` by `a ↦ ζ^a`
(`TauCeti.PrimeToPTateModule.continuousMulEquivZHat`), and two primitive families differ by a unit of
the ring `ℤ̂` (`TauCeti.PrimeToPTateModule.zHatUnit`).
*Needs:* Mathlib `rootsOfUnity`, `IsPrimitiveRoot`, `ProfiniteGrp`; Tau Ceti the results named above,
`TauCeti.zHat`.

**Checks.**
- `ζ₂ = −1`, `ζ₄ = i`, `ζ₈ = exp(2πi/8)` is compatible; replacing `ζ₈` by `exp(−2πi/8)` breaks
  compatibility, since its square is `−i ≠ ζ₄`.

### 6.6 The Kummer action on the Puiseux field

A compatible family `ζ ∈ lim μₙ(K)` acts on the Puiseux field by the `F`-algebra automorphism
`t^(k/n) ↦ ζₙᵏ t^(k/n)`, multiplying the coefficient of `t^q` by `ζ_(den q)^(num q)`
(`TauCeti.puiseuxField.kummer`, `TauCeti.puiseuxField.coeff_kummer`); on level `n` it restricts to the
Kummer automorphism attached to `ζₙ` (`TauCeti.puiseuxField.kummer_coe_level`), so the finite-level
actions of §6.1 are compatible with the transitions. The action of `lim μₙ(K)` on the Puiseux field
is faithful (`TauCeti.puiseuxField.kummer_injective`) and continuous for the Krull topology
(`TauCeti.puiseuxField.continuous_kummer`); on level `n` it factors through `μₙ(K)`. If `ζ` is
primitive, the series fixed by `ζⁿ` are exactly those of level `n`, and those fixed by `ζ` are the
series of `F` (`TauCeti.puiseuxField.fixedField_zpowers_kummer_pow`,
`TauCeti.puiseuxField.fixedField_zpowers_kummer`).
*Needs:* §§4.3, 6.1, 6.5; Tau Ceti the results named above.

### Examples

- Level `3` over `ℂ((t))`: the Kummer automorphism of `exp(2πi/3)` sends `t^(1/3) + t^(2/3)` to
  `exp(2πi/3) t^(1/3) + exp(4πi/3) t^(2/3)`, and its fixed field is `ℂ((t))`.
- `ℂ((t))(√(t + t²))` has degree `2` over `ℂ((t))` and is level `2`: `√(t + t²) = t^(1/2) (1 + t)^(1/2)`.

### Dependencies

Layers 2 to 5 (§§2.3, 3.1, 4.3, 4.4, 4.6, 5.4). Mathlib: Kummer theory, the Galois correspondence,
traces, roots of unity and profinite groups. Tau Ceti: Kummer automorphisms of the levels, the
classification of finite extensions, their valuations and local invariants, the one-forms, traces and
residues of the levels, the limit of the roots of unity and the Kummer action, all named above.

## Layer 7: absolute Galois topology and parameter independence

### 7.1 The Galois group of the Puiseux field

Assume `K` contains a primitive `n`-th root of unity for every `n`. The Puiseux field is Galois over
`F` (`TauCeti.puiseuxField.isGalois`), and Mathlib identifies its Galois group, with the Krull
topology, with the limit of the finite Galois groups over its finite Galois intermediate fields
(`InfiniteGalois.continuousMulEquivToLimit`; Mathlib, `FieldTheory/Galois/Profinite.lean`). The
levels are cofinal among those fields (`TauCeti.puiseuxField.exists_le_levelFiniteGalois`,
`TauCeti.puiseuxField.final_levelFunctor`), so through the Kummer isomorphisms of §6.1 Mathlib's limit
is the limit of the `μₙ(K)` of §6.5 (`TauCeti.puiseuxField.limitEquivTateModule`,
`TauCeti.puiseuxField.galoisRootsOfUnityConeIsLimit`). This gives the isomorphism of topological groups
`Gal(puiseuxField K / F) ≃ lim μₙ(K)`, inverse to the Kummer action of §6.6
(`TauCeti.puiseuxField.galEquivTateModule`), whose level-`n` component is the root of unity by which
an automorphism multiplies `t^(1/n)` (`TauCeti.puiseuxField.proj_galEquivTateModule`). The stabilizer
of level `n` is the kernel of the level-`n` projection (`TauCeti.puiseuxField.mem_fixingSubgroup_level_iff`).
For a primitive family `ζ` this becomes `Gal(puiseuxField K / F) ≃ ℤ̂`, the generator corresponding to
the Kummer automorphism `σ_ζ : t^(1/n) ↦ ζₙ t^(1/n)` (`TauCeti.puiseuxField.galEquivZHat`,
`TauCeti.puiseuxField.galEquivZHat_symm_gen`), and the stabilizer of level `n` is the set of
automorphisms with coordinate in `n ℤ̂` (`TauCeti.puiseuxField.mem_fixingSubgroup_level_iff_toZMod_eq_zero`).
*Needs:* §§4.3, 6.1, 6.5, 6.6; Mathlib `InfiniteGalois.continuousMulEquivToLimit`, the Krull
topology; Tau Ceti the results named above.

### 7.2 The absolute Galois group of `F`

Let `K` be algebraically closed of characteristic zero, so that the Puiseux field is an algebraic
closure of `F` (§5.4). For every field `L` isomorphic to the Puiseux field over `F`, in particular
Mathlib's `AlgebraicClosure F`, conjugating by an `F`-isomorphism `e` identifies `Gal(L/F)` with
`lim μₙ(K)` as topological groups (`TauCeti.puiseuxField.galEquivTateModuleOfAlgEquiv`), and the
result does not depend on `e`: two choices differ by an automorphism of the Puiseux field, and
conjugation is trivial in the commutative group `lim μₙ(K)`
(`TauCeti.puiseuxField.galEquivTateModuleOfAlgEquiv_eq`). The image of an intermediate field of degree
`n` is level `n`, and its stabilizer is the kernel of the level-`n` projection
(`TauCeti.puiseuxField.eq_map_level_of_finrank_eq`, `TauCeti.puiseuxField.mem_fixingSubgroup_iff_of_finrank_eq`).
This gives `Field.absoluteGaloisGroup F ≃ lim μₙ(K)` (`TauCeti.puiseuxField.absoluteGaloisGroupEquivTateModule`;
Mathlib's profinite Galois comparison, `FieldTheory/Galois/Profinite.lean`)
and, for a primitive family `ζ`, the isomorphism of topological groups
`Field.absoluteGaloisGroup F ≃ ℤ̂` (`TauCeti.puiseuxField.absoluteGaloisGroupEquivZHat`; over `ℂ`, with
`ζₙ = exp(2πi/n)`, Frenkel, §1.2.1, pp. 9–10). Its inverse
sends `a ∈ ℤ̂` to the automorphism multiplying every `n`-th root of every uniformizer of `F` by
`ζₙ^(a mod n)` (`TauCeti.puiseuxField.apply_eq_algebraMap_pow_toZMod_absoluteGaloisGroupEquivZHat_mul`),
so an automorphism has coordinate the generator of `ℤ̂` exactly when it multiplies every `n`-th root of
`t` by `ζₙ` (`TauCeti.puiseuxField.absoluteGaloisGroupEquivZHat_eq_gen_iff`); an automorphism fixes an
intermediate field of degree `n` exactly when its coordinate is divisible by `n`
(`TauCeti.puiseuxField.mem_fixingSubgroup_iff_toZMod_eq_zero_of_finrank_eq`). Replacing `ζ` by another
primitive family `ζ′ = ζ^u`, for a unit `u` of the ring `ℤ̂`, divides every coordinate by `u`
(`TauCeti.puiseuxField.absoluteGaloisGroupEquivZHat_apply_eq_zpowHat`,
`TauCeti.puiseuxField.absoluteGaloisGroupEquivZHat_symm_apply_eq_symm_zpowHat`). The identification
with `ℤ̂` is the only place where `ζ` enters. The comparison with `ℤ̂` runs through the profinite power
map `a ↦ ζ^a` built from the universal property `TauCeti.zHat.lift`, which is surjective because `ζ`
generates a dense subgroup and injective because the finite-level coordinates detect elements
(`TauCeti.PrimeToPTateModule.zHatLift_surjective`, `TauCeti.PrimeToPTateModule.zHatLift_injective`),
and whose inverse is continuous as a continuous bijection from a compact space to a Hausdorff one. A
route lifting `σ_ζ` directly into the Galois group by `TauCeti.zHat.lift` uses instead
`TauCeti.zHat.lift_surjective` and `TauCeti.zHat.lift_injective_of_finite_quotients`, with the
generator and detection hypotheses proved from the finite-level coordinates; the coordinate maps
`TauCeti.zHat.existsUnique_forall_toZMod_eq`, the exponent formula `TauCeti.zpowHat_eq_pow_val_toZMod`
and the units of `ℤ̂` (`TauCeti.zHat.unitsLift`) supply the finite-level formulas and the change of
`ζ`.
*Needs:* §§5.4, 6.5, 7.1; Mathlib `AlgebraicClosure`, `Field.absoluteGaloisGroup`; Tau Ceti the
results named above.

**Checks.**
- For `ζ₂ = −1`, the generator sends `t^(1/2)` to `−t^(1/2)` and fixes `t`; the automorphism with
  coordinate `2 ∈ ℤ̂` fixes level `2`, matching `2 ∣ 2`.
- Over `ℂ`, the automorphism `σ_ζ` of coordinate `1` for `ζₙ = exp(2πi/n)` has coordinate `−1` for
  the family `exp(−2πi/n)`, which is `ζ^u` with `u = −1`; coordinates divide by `u`.

### 7.3 Roots of uniformizers, parameter changes and inertia

Let `K` be algebraically closed of characteristic zero. Every unit of `K[[t]]` has an `n`-th root in
`K[[t]]` for every `n > 0`, by its constant coefficient and the simple-root Hensel lemma
(`PowerSeries.exists_pow_eq_of_isUnit`). Consequently, for `σ` in the Galois group, a uniformizer
`π` of `F` and an `n`-th root `α` of `π`, the root of unity `θₙ(σ) = σ(α)/α` does not depend on `π` or
on `α`: it is the level-`n` component of the image of `σ` in `lim μₙ(K)`
(`TauCeti.puiseuxField.apply_eq_algebraMap_proj_galEquivTateModule_mul`,
`TauCeti.puiseuxField.apply_eq_algebraMap_proj_absoluteGaloisGroupEquivTateModule_mul`). Prove that
the characters `θₙ` are compatible in `n`, `θₘ(σ)^(m/n) = θₙ(σ)` for `n ∣ m`, by the compatibility of
the components of a point of `lim μₙ(K)` (`TauCeti.PrimeToPTateModule.proj_pow_div`).

A `K`-algebra automorphism `τ` of `F` sending `t` to a uniformizer, for instance the substitution of a
formal coordinate, lifts to a `K`-algebra automorphism `ρ` of the algebraic closure
(`AlgEquiv.exists_algEquiv_apply_algebraMap`), and on the Puiseux field every such lift commutes with
every Galois automorphism, by comparing the characters `θₙ` of `σ` and of `ρ σ ρ⁻¹`
(`TauCeti.puiseuxField.commute_restrictScalars_of_apply_algebraMap`,
`TauCeti.puiseuxField.commute_restrictScalars_of_apply_algebraMap_substAlgEquiv`). Prove the same on
Mathlib's `AlgebraicClosure F`, transporting along an `F`-isomorphism with the Puiseux field: every lift
of `τ` to `AlgebraicClosure F` commutes with `Field.absoluteGaloisGroup F`, so any two lifts induce the
same conjugation on it, namely the identity.

Prove that the whole Galois group is inertia. Let `A` be the valuation subring of the Puiseux field
for its valuation of §4.5. Every `σ ∈ Gal(puiseuxField K / F)` preserves the valuation, since it
multiplies each coefficient by a root of unity and so preserves supports, and acts trivially on the
residue field `K`, since it fixes the constant coefficient. So Mathlib's decomposition subgroup
`ValuationSubring.decompositionSubgroup F A` and its inertia subgroup
`ValuationSubring.inertiaSubgroup F A` are the whole Galois group.
*Needs:* §§4.5, 5.2, 6.6, 7.1, 7.2; Mathlib `AlgebraicClosure`, `ValuationSubring.decompositionSubgroup`,
`ValuationSubring.inertiaSubgroup`; Tau Ceti the results named above,
`TauCeti.PrimeToPTateModule.proj_pow_div`.

**Checks.**
- With `π = t(1 + t)` and `α = t^(1/2) (1 + t)^(1/2)`, where `(1 + t)^(1/2) ∈ K[[t]]` is fixed by every
  `σ`, the generator sends `α` to `−α`, as it sends `t^(1/2)` to `−t^(1/2)`: `θ₂` does not see the
  choice of uniformizer.
- The coordinate change `t ↦ t + t²` lifts to the Puiseux field by
  `t^(1/n) ↦ t^(1/n) (1 + t)^(1/n)`, which commutes with `t^(1/n) ↦ ζₙ t^(1/n)`.

### Examples

- Over `ℂ((t))` with `ζₙ = exp(2πi/n)`, the absolute Galois group is `ℤ̂`, topologically generated by
  the monodromy `t^(1/n) ↦ exp(2πi/n) t^(1/n)` of all `n`-th roots of `t`.
- The open subgroup `n ℤ̂` corresponds to level `n`, the unique extension of `F` of degree `n` inside a
  fixed algebraic closure.

### Dependencies

Layers 4 to 6 (§§4.3, 4.5, 5.2, 5.4, 6.1, 6.5, 6.6). Mathlib: infinite Galois theory and the Krull
topology, algebraic closures, absolute Galois groups, decomposition and inertia subgroups. Tau Ceti:
the Galois group of the Puiseux field and its limit description, its transport to any algebraic closure,
the identification with `ℤ̂`, the roots of units of `K[[t]]`, the characters `θₙ`, parameter changes, and
Tau Ceti's profinite integers, all named above.

## Downstream consumers

- [AlgebraicCurves](../AlgebraicCurves/README.md) §9.2 carries the coordinate substitutions, the
  continuous derivations and the residue transformation of Layers 1 to 3 along its completions at
  places, in every characteristic; the residue-field trace and the separability of residue
  extensions are its own.
- [NewtonPolygons](../NewtonPolygons/README.md) §§1.2 and 2.1 compare the order valuation of §1.1
  and the coefficient polygons of §5.1 with its general valuation and polygon interface; its §3.2
  product and slope identities specialize to §5.1.
- [AffineLieAlgebras](../AffineLieAlgebras/README.md) uses Layers 1 to 3: the topology of `F`,
  substitution, the continuous calculus, and the formal loop algebras and their residue pairing of
  §3.6.
- [FormalConnectionsOpers](../FormalConnectionsOpers/README.md) uses substitution and the
  coefficient tower of Layer 1, the derivation and one-forms of Layer 2, the residue of Layer 3 and
  the identification of the absolute Galois group of `ℂ((t))` with `ℤ̂` of Layer 7.
- [PainleveEquations](../PainleveEquations/README.md) and
  [PadicDifferentialEquationsAndRigidCohomology](../PadicDifferentialEquationsAndRigidCohomology/README.md)
  use the scalar Laurent and Puiseux calculus of Layers 1 to 6, the latter also the residue and
  coefficient duality of Layer 3; [ClassicalArithmeticCompletion](../ClassicalArithmeticCompletion/README.md)
  uses the Laurent specialization of §5.1 through NewtonPolygons.

## Scope and ownership

**This roadmap owns** the formal local calculus of `F = K((t))` and its algebraic closure as
specified above: the carriers, convergence, substitution, formal coordinates, jet groups and
infinitesimal substitutions of Layer 1; the derivative, continuous derivations and continuous
one-forms of Layer 2; residues, the finite-map formula, the universal coefficient identity,
primitives, residue duality, vector-valued Laurent series and formal loop algebras of Layer 3; the
ramified levels, ramification indices, the level colimit, the Puiseux field and its valuation and
calculus of Layer 4; the Laurent specialization of Newton polygons, Hensel factor lifting over
`K[[t]]` and the Newton–Puiseux theorem of Layer 5; the Kummer theory, classification, local
invariants, traces and residues of finite extensions and the limit of the roots of unity of Layer 6;
and the absolute Galois group of `F`, the characters of roots of uniformizers, parameter
independence and inertia of Layer 7.

**In the library at the pins.** The pinned Tau Ceti proves every statement of Layers 1 to 7 under the
declarations named in the layers and listed under the supplier contracts below, all headline theorems
included; `Suggested.lean` therefore restates none of them and pins the declarations that carry them.
The targets that remain are: in §1.2, that `t^(−j)` has no limit in `F`; in §2.1, the Leibniz rule for
Hasse derivatives of Laurent series; in §3.5, the lattices of `V((t))` as `K[[t]]`-submodules, the
completeness of `V((t))`, and the power-series lattice and finite-jet comparisons for
finite-dimensional `V`; in §3.6, the continuity of the derivative of `L((t))` and the functoriality of
the loop constructions in Lie algebra maps; in §6.1, the fixed fields inside a finite level; and in
§7.3, the compatibility of the characters `θₙ` in `n`, the triviality of parameter changes on Mathlib's
`AlgebraicClosure F`, and that the whole Galois group is inertia.

**Owned elsewhere and consumed here.** Each object has one owner; this roadmap builds no second
carrier.

- Mathlib owns the carriers (Laurent series, power series, Laurent polynomials, Hahn series and Hahn
  modules), power-series substitution and compositional inverses, Kähler differentials, polynomial
  loop algebras and their residue pairing, general algebraic closures, separability, Kummer theory,
  infinite Galois theory with the Krull topology, henselian rings, and decomposition and inertia
  subgroups.
- The general polygon geometry of §5.1 (lower convex envelopes, faces, slope multisets and the
  Minkowski sum) is Tau Ceti's `Polynomial.newtonPolygon` API, specified by
  [NewtonPolygons](../NewtonPolygons/README.md) §§2.1 and 3.2; this roadmap owns its specialization to
  `F` with the order valuation, the initial polynomials and the ramified substitutions.
- The profinite integers `TauCeti.zHat` are Tau Ceti's, and their ring structure on
  `Additive TauCeti.zHat` is the subject of the completed roadmap ProfiniteArithmetic, Layer 0.
- [AlgebraicCurves](../AlgebraicCurves/README.md) owns the general complete discrete valuation ring
  constructions at places of function fields (§5.7) and the `k`-compatible expansions and geometric
  residues at places with finite separable residue extension (§9.2); it transports the
  coordinate-level identities of this roadmap, which hold over arbitrary fields `K`, along its
  completion isomorphisms, with its residue-field trace and its separability hypotheses.

The names and shapes of `LaurentSeries.expand`, `LaurentSeries.contract`,
`LaurentSeries.sum_single_mul_expand_contract`, `LaurentSeries.contract_eq_of_sum_eq`,
`HahnSeries.mem_range_embDomain_iff` and `LaurentSeries.derivative_mul`, and the Hasse–Leibniz rule
of §2.1, follow designs proposed for Mathlib in commutative-ring generality; when Mathlib adopts
them, Tau Ceti adopts Mathlib's.

**Outside this roadmap.** Descriptions of the algebraic closure of `F` in positive characteristic,
mixed-characteristic local fields, analytic convergence of branches, Stokes data, formal connections,
opers, central extensions of loop algebras and categorical Langlands statements. Tau Ceti's analytic
Puiseux results (`TauCeti/Analysis/Polynomial/Puiseux`) concern convergent branches and carry their
own analytic hypotheses; the formal theorems here are distinct from them (see the Zulip discussion in
the references). Dean Cureton's formal Puiseux development constructs the directed-union carrier of
§4.3 and proves its algebraicity and algebraic closedness (`PuiseuxSeries.isAlgClosure`); it is
independent prior work on Layers 4 and 5, and any reuse of its code follows this repository's porting
policy, beginning with agreement from its author.

## Exact supplier contracts

### From Mathlib

Each declaration is used as stated in the pinned Mathlib.

- Carriers: `LaurentSeries` (`HahnSeries ℤ`), `PowerSeries`, `LaurentPolynomial`, `HahnSeries`,
  `HahnModule` with `HahnModule.of`; `HahnSeries.orderTop`, `HahnSeries.order`, `HahnSeries.single`,
  `HahnSeries.coeff` and its linear map `HahnSeries.coeff.linearMap`, `HahnSeries.ofPowerSeries`,
  `HahnSeries.ofSuppBddBelow`, `HahnSeries.embDomain`, `HahnSeries.embDomainAlgHom` (an algebra map
  for the coefficientwise structure, Convention 5), `HahnSeries.addVal`
  (`Mathlib/RingTheory/HahnSeries/`).
- Laurent series: the valuation `LaurentSeries.valued`, `LaurentSeries.powerSeries_as_subring`,
  completeness `LaurentSeries.instLaurentSeriesComplete`, the embedding of rational functions
  `RatFunc.coeToLaurentSeries` and its density `LaurentSeries.coe_range_dense`, the derivative
  `LaurentSeries.derivative` and Hasse derivatives `LaurentSeries.hasseDeriv`
  (`Mathlib/RingTheory/LaurentSeries.lean`).
- Power series: `PowerSeries.subst`, `PowerSeries.HasSubst`, `PowerSeries.subst_comp_subst`
  (substituting `a` and then `b` is substituting `a(b)`), `PowerSeries.map_subst`,
  `PowerSeries.substInvOfIsUnit`, `PowerSeries.substInvFun` and
  `PowerSeries.eq_substInvOfIsUnit_of_subst_eq_X` (`Mathlib/RingTheory/PowerSeries/Substitution.lean`);
  `PowerSeries.heval`, evaluation of power series at a Hahn series of positive order
  (`Mathlib/RingTheory/HahnSeries/HEval.lean`); `PowerSeries.derivative` and
  `PowerSeries.derivative_subst`, the chain rule for `HasSubst g`; `PowerSeries.map`;
  `PowerSeries.maximalIdeal_eq_span_X`; the instance
  `IsAdicComplete (Ideal.span {PowerSeries.X}) (PowerSeries R)`
  (`Mathlib/RingTheory/AdicCompletion/Completeness.lean`); `IsAdicComplete.henselianRing`
  (`Mathlib/RingTheory/Henselian.lean`).
- Polynomials: `Polynomial.taylor`, `Polynomial.scaleRoots`, `Polynomial.Monic.natDegree_map`.
- Derivations and differentials: `Derivation`, `KaehlerDifferential`,
  `Derivation.liftKaehlerDifferential` (the `S`-linear map `Ω[S⁄R] → M` induced by a derivation),
  `IsModuleTopology`, `DualNumber`.
- Lie algebras: `LieAlgebra.loopAlgebra` (`K[t, t⁻¹] ⊗ L`) and its residue pairing
  `LieAlgebra.LoopAlgebra.residuePairing` (`Mathlib/Algebra/Lie/Loop.lean`).
- Field theory: `IntermediateField`, `PowerBasis`, `minpoly`, `Algebra.trace`, `IsAlgClosed` with
  `IsAlgClosed.splits`, `IsAlgClosure`, `AlgebraicClosure`, `Field.absoluteGaloisGroup`, `IsGalois`,
  `rootsOfUnity`, `IsPrimitiveRoot`, `HasEnoughRootsOfUnity`; Kummer theory:
  `autEquivRootsOfUnity`, `autEquivZmod` and `isGalois_of_isSplittingField_X_pow_sub_C`
  (`Mathlib/FieldTheory/KummerExtension.lean`); infinite Galois theory:
  `InfiniteGalois.continuousMulEquivToLimit`, the Krull topology on `L ≃ₐ[K] L`
  (`Mathlib/FieldTheory/Galois/Profinite.lean`); `ProfiniteGrp`; `CommAlgCat`.
- Valuations: `Valued`, `Valuation`, `Ideal.ramificationIdx`, `Ideal.inertiaDeg`,
  `ValuationSubring.decompositionSubgroup` (the stabilizer of a valuation subring) and
  `ValuationSubring.inertiaSubgroup` (the kernel of the action on its residue field)
  (`Mathlib/RingTheory/Valuation/RamificationGroup.lean`); `AlgEquiv.aut`.

### From Tau Ceti

Paths are under `TauCeti/`; each declaration is used as stated in the pinned Tau Ceti, with the
hypotheses recorded where the layers use it.

- Laurent series basics (`RingTheory/LaurentSeries/Basic.lean`): `TauCeti.LaurentSeries.mem_range_ofPowerSeries_iff`,
  `TauCeti.LaurentSeries.valuation_eq_exp_neg_order`, `TauCeti.LaurentSeries.valuation_mapRingHom`,
  `LaurentSeries.derivative_mul` (commutative ring), `PowerSeries.coe_derivative`,
  `PowerSeries.coe_hasseDeriv`, `LaurentSeries.coeff_neg_one_derivative_mul_inv`,
  `PowerSeries.coeff_neg_one_coe_zpow_mul_derivative_eq_ite`; the scalar tower
  `TauCeti.hahnSeries_isScalarTower_powerSeries` (`RingTheory/HahnSeries/PowerSeries.lean`).
- Valuation ring (`RingTheory/Huber/LaurentSeries.lean`, `RingTheory/LaurentSeries/Valuation/Ring.lean`):
  `TauCeti.Huber.LaurentSeries.powerSeries_as_subring_eq_integer`,
  `TauCeti.Huber.LaurentSeries.integers_powerSeries_as_subring`,
  `TauCeti.Huber.LaurentSeries.isOpen_powerSeries_as_subring`,
  `TauCeti.LaurentSeries.maximalIdeal_eq_idealOfDefinition`,
  `TauCeti.LaurentSeries.mem_maximalIdeal_iff_orderTop_pos`, `TauCeti.LaurentSeries.residueFieldEquiv`,
  `TauCeti.LaurentSeries.residueFieldEquiv_residue`.
- Laurent polynomials (`RingTheory/LaurentSeries/LaurentPolynomial.lean`):
  `LaurentPolynomial.toLaurentSeries`, `LaurentPolynomial.toLaurentSeries_toLaurent`,
  `LaurentPolynomial.isScalarTower_laurentSeries`, `LaurentPolynomial.coeff_toLaurentSeries`,
  `LaurentPolynomial.toLaurentSeries_injective`, `LaurentPolynomial.mem_range_toLaurentSeries_iff`,
  `LaurentPolynomial.order_toLaurentSeries`, `LaurentPolynomial.toLaurentSeries_derivative`,
  `LaurentPolynomial.denseRange_toLaurentSeries`, `LaurentSeries.trunc`,
  `LaurentSeries.trunc_eq_sum_Ico`, `LaurentSeries.tendsto_toLaurentSeries_trunc`.
- Convergence (`RingTheory/LaurentSeries/Convergence.lean`, `RingTheory/HahnSeries/EventualCoeff.lean`):
  `TauCeti.tendsto_laurentSeries_iff_orderTop_sub`, `TauCeti.tendsto_laurentSeries_iff_coeff` (any
  filter, no topology on `K`), `TauCeti.laurentSeries_eventually_coeff_single_neg_succ_eq_zero`,
  `TauCeti.laurentSeries_not_tendsto_single_neg_succ`, `TauCeti.LaurentSeries.continuous_mapRingHom`,
  `TauCeti.hahnSeries_eventually_forall_lt_coeff_eq`.
- Substitution (`RingTheory/LaurentSeries/Substitution/Basic.lean`,
  `RingTheory/LaurentSeries/Substitution/Coefficient.lean`, `RingTheory/PowerSeries/Substitution.lean`):
  `TauCeti.LaurentSeries.substAlgHom` (for `φ` with zero constant coefficient and `φ ≠ 0`, over a
  field), `TauCeti.LaurentSeries.substAlgHom_coe`, `TauCeti.LaurentSeries.substAlgHom_single_mul_coe`,
  `TauCeti.LaurentSeries.substAlgHom_comp_substAlgHom`, `TauCeti.LaurentSeries.substAlgHom_X`,
  `TauCeti.LaurentSeries.orderTop_substAlgHom`, `TauCeti.LaurentSeries.valuation_substAlgHom`,
  `TauCeti.LaurentSeries.substAlgHom_injective`, `TauCeti.LaurentSeries.continuous_substAlgHom`,
  `TauCeti.LaurentSeries.substAlgHom_X_pow_eq_expand`, `TauCeti.LaurentSeries.substAlgEquiv`,
  `TauCeti.LaurentSeries.mapRingHom_substAlgHom`, `TauCeti.LaurentSeries.derivative_substAlgHom`,
  `TauCeti.LaurentSeries.coeff_neg_one_substAlgHom_mul_derivative_eq_nsmul` (the finite-map formula,
  every characteristic), `TauCeti.LaurentSeries.coeff_neg_one_substAlgHom_mul_derivative`,
  `TauCeti.LaurentSeries.coeff_substAlgHom_eq_sum_Icc`,
  `TauCeti.LaurentSeries.coeff_substAlgHom_eq_of_coeff_eq`, `PowerSeries.subst_eq_zero_iff`.
- Formal coordinates and jets (`RingTheory/PowerSeries/Coordinate/Basic.lean`,
  `RingTheory/PowerSeries/Coordinate/Jet.lean`, `RingTheory/PowerSeries/Coordinate/Infinitesimal.lean`,
  `RingTheory/PowerSeries/ValuationTopology.lean`, `RingTheory/PowerSeries/SubstInv.lean`):
  `TauCeti.FormalCoordinate`, `TauCeti.FormalCoordinate.linearCoeff`,
  `TauCeti.FormalCoordinate.substAlgEquiv`, `TauCeti.FormalCoordinate.substAlgEquiv_mul`,
  `TauCeti.FormalCoordinate.ofAlgEquiv`, `TauCeti.FormalCoordinate.substAlgEquiv_ofAlgEquiv`,
  `TauCeti.FormalCoordinate.substAlgEquivMulEquiv` (over a field),
  `TauCeti.FormalCoordinate.constantCoeff_substAlgEquiv`, `TauCeti.FormalCoordinate.map`,
  `TauCeti.FormalCoordinate.map_substAlgEquiv`, `TauCeti.FormalCoordinate.continuous_map`,
  `TauCeti.FormalCoordinate.jetKernel`, `TauCeti.FormalCoordinate.Jet`,
  `TauCeti.FormalCoordinate.Jet.truncate`, `TauCeti.FormalCoordinate.Jet.truncate_surjective`,
  `TauCeti.FormalCoordinate.Jet.map`, `TauCeti.FormalCoordinate.Jet.map_jet`,
  `TauCeti.FormalCoordinate.Jet.truncate_map`, `TauCeti.FormalCoordinate.tendsto_iff_X_pow_dvd`,
  `TauCeti.FormalCoordinate.jetLimit`, `TauCeti.FormalCoordinate.isClosed_jetLimit`,
  `TauCeti.FormalCoordinate.jetLimitEquiv`, `TauCeti.infinitesimalSubstAlgEquiv`,
  `TauCeti.infinitesimalSubstitutions`, `TauCeti.infinitesimalSubstitutionsEquiv`,
  `TauCeti.infinitesimalSubstitutionsEquiv_apply_map`,
  `TauCeti.infinitesimalSubstAlgEquiv_commutator_apply` (any commutative ring, `e₁² = e₂² = 0`);
  the scope `TauCeti.PowerSeries.WithValuationTopology` with
  `TauCeti.PowerSeries.WithValuationTopology.isInducing_coe`,
  `TauCeti.PowerSeries.WithValuationTopology.tendsto_iff_coeff`,
  `TauCeti.PowerSeries.WithValuationTopology.continuous_algHom`,
  `TauCeti.FormalCoordinate.substHomeomorph`; `PowerSeries.map_substInvOfIsUnit`.
- Derivations of power series (`RingTheory/Derivation/Ideal.lean`, `RingTheory/Derivation/AdicTopology.lean`,
  `RingTheory/PowerSeries/Derivation.lean`, `RingTheory/PowerSeries/HasseDeriv/Basic.lean`):
  `Derivation.apply_mem_pow_smul_top_of_mem_pow_succ`, `Derivation.continuous_adic`,
  `Derivation.apply_eq_derivative_smul` and `PowerSeries.derivation_ext` (into an `(t)`-adically
  Hausdorff module), `PowerSeries.hasseDeriv_mul` (any semiring).
- The derivative and continuous derivations (`RingTheory/LaurentSeries/Derivative.lean`,
  `RingTheory/LaurentSeries/ContinuousDerivation.lean`): `TauCeti.laurentSeriesDerivation`,
  `LaurentSeries.derivative_inv`, `LaurentSeries.derivative_div`,
  `LaurentSeries.orderTop_le_orderTop_derivative_add_one`, `LaurentSeries.continuous_derivative`,
  `LaurentSeries.coeff_derivative_order_sub_one`,
  `LaurentSeries.orderTop_derivative_eq_order_sub_one_of_cast_ne_zero`,
  `LaurentSeries.orderTop_derivative_eq_sub_one`, `LaurentSeries.derivative_eq_zero_iff`,
  `LaurentSeries.derivative_eq_zero_iff_exists_C` (no additive torsion),
  `LaurentSeries.lie_smul_laurentSeriesDerivation`, `LaurentSeries.coeff_neg_one_derivative`,
  `TauCeti.continuousDerivations`, `Derivation.eq_smul_laurentSeriesDerivation`,
  `TauCeti.continuous_smul_laurentSeriesDerivation`, `TauCeti.smul_laurentSeriesDerivation_inj`,
  `TauCeti.continuousDerivationsEquiv`, `Derivation.continuous_iff_exists_eq_smul_laurentSeriesDerivation`,
  `Derivation.apply_eq_laurentSeriesDerivation_smul` (Hausdorff target, continuous scalar
  multiplication), `TauCeti.continuousDerivationsLieSubalgebra`,
  `TauCeti.powerSeriesPreservingDerivations`, `TauCeti.powerSeriesPreservingDerivationsEquiv`,
  `TauCeti.maximalIdealPreservingDerivations`, `TauCeti.maximalIdealPreservingDerivationsEquiv`,
  `TauCeti.infinitesimalSubstitutionsEquivDerivations`.
- Continuous one-forms (`RingTheory/LaurentSeries/KaehlerDifferential/Basic.lean`,
  `RingTheory/LaurentSeries/KaehlerDifferential/Map.lean`): `TauCeti.ContinuousKaehlerDifferential`
  (the quotient of `Ω[F⁄K]` by the kernel of the map induced by `D`),
  `TauCeti.laurentSeriesDerivation_liftKaehlerDifferential_surjective`,
  `TauCeti.ContinuousKaehlerDifferential.D`, `TauCeti.ContinuousKaehlerDifferential.equivLaurentSeries`
  (a continuous `F`-linear equivalence sending `dt` to `1`),
  `TauCeti.ContinuousKaehlerDifferential.continuous_D`,
  `TauCeti.ContinuousKaehlerDifferential.existsUnique_compDer_eq` (Hausdorff target with continuous
  scalar multiplication), `TauCeti.ContinuousKaehlerDifferential.continuous_lift`,
  `TauCeti.ContinuousKaehlerDifferential.continuous_compDer`,
  `TauCeti.ContinuousKaehlerDifferential.subst`, `TauCeti.ContinuousKaehlerDifferential.subst_D`,
  `TauCeti.ContinuousKaehlerDifferential.derivative_smul_D_single_one`,
  `TauCeti.ContinuousKaehlerDifferential.subst_subst`,
  `TauCeti.ContinuousKaehlerDifferential.substEquiv`,
  `TauCeti.ContinuousKaehlerDifferential.coeff_neg_one_equivLaurentSeries_subst`,
  `TauCeti.ContinuousKaehlerDifferential.map`, `TauCeti.ContinuousKaehlerDifferential.map_D`,
  `TauCeti.ContinuousKaehlerDifferential.map_subst`.
- Residues, primitives and duality (`RingTheory/LaurentSeries/ResiduePairing.lean`,
  `RingTheory/LaurentSeries/Primitive.lean`, `RingTheory/LaurentSeries/CoefficientDuality.lean`,
  `RingTheory/LaurentSeries/Lattice.lean`, `RingTheory/LaurentSeries/ContinuousDual/Basic.lean`,
  `RingTheory/PowerSeries/Derivative.lean`, `RingTheory/PowerSeries/Trunc.lean`,
  `RingTheory/MvPowerSeries/Inverse.lean`): `LaurentSeries.residuePairing`,
  `LaurentSeries.residuePairing_eq_neg_swap`, `LaurentSeries.residuePairing_self`,
  `LaurentSeries.residuePairing_substAlgHom`, `LaurentSeries.residuePairing_toLaurentSeries`,
  `PowerSeries.mul_coeff_val_zpow_neg_add_coeff_val_zpow_neg_sub_one_mul_derivative_eq_zero` (the
  universal coefficient identity over a commutative ring),
  `PowerSeries.nsmul_coeff_mul_succ_pow_succ_eq_coeff_X_mul_pow_mul_derivative`,
  `PowerSeries.derivative_map`, `PowerSeries.map_invOfUnit_ringHom`,
  `PowerSeries.trunc_val_zpow_eq_of_trunc_eq`, `PowerSeries.trunc_val_zpow_mul_derivative_eq_of_trunc_eq`,
  `TauCeti.laurentSeriesPrimitive`, `TauCeti.derivative_laurentSeriesPrimitive_of_coeff_neg_one_eq_zero`,
  `TauCeti.existsUnique_laurentSeries_primitive`,
  `TauCeti.derivative_eq_iff_eq_laurentSeriesPrimitive_add_single`,
  `TauCeti.range_laurentSeries_derivative` (characteristic zero),
  `TauCeti.single_neg_one_not_mem_range_laurentSeries_derivative`, `TauCeti.LaurentSeries.residueForm`,
  `TauCeti.LaurentSeries.residueForm_nondegenerate`, `TauCeti.LaurentSeries.residueForm_orthogonal_lattice`,
  `TauCeti.LaurentSeries.residueFormQuotientPairing`,
  `TauCeti.LaurentSeries.residueFormQuotientPairing.instIsPerfPair`, `TauCeti.LaurentSeries.lattice`,
  `TauCeti.LaurentSeries.coeff_eq_zero_of_mem_lattice`, `LinearMap.continuous_iff_exists_lattice_le_ker`
  (discrete `K`), `TauCeti.LaurentSeries.residueDualEquiv`.
- Vector-valued series and loop algebras (`RingTheory/LaurentSeries/Lattice.lean`,
  `RingTheory/HahnSeries/TensorProduct.lean`, `RingTheory/LaurentSeries/ContinuousDual/HahnModule.lean`,
  `RingTheory/LaurentSeries/ContinuousDual/AnnihilatorTopology.lean`,
  `RingTheory/LaurentSeries/Module/Substitution.lean`, `RingTheory/LaurentSeries/HahnModuleDerivative.lean`,
  `Algebra/Lie/HahnModule.lean`, `Algebra/Lie/BaseChange/HahnModule.lean`, `Algebra/Lie/Loop/HahnModule.lean`,
  `Algebra/Lie/Loop/Derivative.lean`): `TauCeti.HahnModule.lattice` with its topology instance,
  `TauCeti.HahnModule.hasBasis_nhds_zero_lattice`, `LinearMap.continuous_iff_exists_hahnModule_lattice_le_ker`,
  `TauCeti.HahnModule.latticeQuotientEquiv`, `HahnModule.tensorProductEquiv` and
  `HahnModule.tensorProductEquiv_symm_apply` (finite free `V`), `HahnModule.residueDualEquiv`,
  `HahnModule.lattice_le_ker_residueDual_iff`, `LinearMap.residueDual_hahnModuleMap`, the scope
  `TauCeti.HahnModuleDualTopology` with `HahnModule.residueDualContinuousLinearEquiv` and
  `LinearMap.hahnModuleDualMap`, `HahnModule.residueDual_derivative_smul_subst_eq_nsmul`,
  `HahnModule.coeff_lie`, `HahnModule.support_lie_subset`, `HahnModule.instLieRing`,
  `HahnModule.instLieAlgebra`, `HahnModule.tensorProductLieEquiv` (finite free `L`), `LieAlgebra.LoopAlgebra.toHahnModule`,
  `LieAlgebra.LoopAlgebra.coeff_toHahnModule`, `LieAlgebra.LoopAlgebra.toHahnModule_injective`,
  `HahnModule.derivative`, `HahnModule.derivative_single`, `HahnModule.derivative_smul`,
  `HahnModule.derivative_lie`, `HahnModule.derivative_mem_lattice`, `HahnModule.derivative_map`,
  `HahnModule.residuePairing`, `HahnModule.residuePairing_single_single`,
  `LieAlgebra.LoopAlgebra.residuePairing_toHahnModule`.
- Ramified levels (`RingTheory/LaurentSeries/Ramified.lean`, `RingTheory/HahnSeries/EmbDomain.lean`,
  `RingTheory/LaurentSeries/RamificationIndex.lean`, `RingTheory/LaurentSeries/Colimit.lean`):
  `LaurentSeries.expand` (commutative semiring), `LaurentSeries.coeff_expand_mul`,
  `LaurentSeries.orderTop_expand`, `LaurentSeries.valuation_expand`, `LaurentSeries.mem_range_expand_iff`,
  `LaurentSeries.expand_expand`, `LaurentSeries.contract`, `LaurentSeries.sum_single_mul_expand_contract`,
  `LaurentSeries.contract_eq_of_sum_eq`, `LaurentSeries.ramifiedEmbedding`,
  `LaurentSeries.coeff_ramifiedEmbedding_intCast_div`, `LaurentSeries.coeff_ramifiedEmbedding_of_not_den_dvd`,
  `LaurentSeries.support_ramifiedEmbedding`, `LaurentSeries.ramifiedEmbedding_injective`,
  `LaurentSeries.ramifiedEmbedding_comp_expand`, `LaurentSeries.mem_range_ramifiedEmbedding_iff`,
  `LaurentSeries.range_ramifiedEmbedding_le_iff`, `LaurentSeries.range_ramifiedEmbedding_inf`,
  `HahnSeries.mem_range_embDomain_iff`, `TauCeti.RamificationIndex`,
  `TauCeti.RamificationIndex.le_iff_dvd`, `TauCeti.RamificationIndex.transitionDegree`,
  `TauCeti.puiseuxField.levelDiagram`, `TauCeti.puiseuxField.levelCocone`,
  `TauCeti.puiseuxField.levelCoconeIsColimit` (algebras in the universe of `K`).
- The Puiseux field (`RingTheory/LaurentSeries/Puiseux/Basic.lean`, `RingTheory/LaurentSeries/Level/Basis.lean`,
  `RingTheory/LaurentSeries/Level/Adjoin.lean`, `RingTheory/LaurentSeries/Puiseux/Valuation.lean`):
  `TauCeti.puiseuxField`, `TauCeti.puiseuxField.level`, `TauCeti.mem_puiseuxField_iff_exists_den_dvd`,
  `TauCeti.mem_puiseuxField_iff`, `TauCeti.directed_fieldRange_ramifiedEmbedding`,
  `TauCeti.puiseuxField_eq_iSup_fieldRange`, `TauCeti.puiseuxField.levelEmbedding`,
  `TauCeti.puiseuxField.levelEmbedding_expand_divExact`,
  `TauCeti.puiseuxField.exists_forall_mem_range_levelEmbedding`,
  `TauCeti.puiseuxField.exists_map_levelEmbedding_eq`, `TauCeti.puiseuxField.levelEmbedding_expand_self`,
  `TauCeti.puiseuxField_lt_top`, `TauCeti.LaurentSeries.Level`, `TauCeti.LaurentSeries.Level.powerBasis`,
  `TauCeti.puiseuxField.levelPowerBasis`, `TauCeti.puiseuxField.level_finrank`,
  `TauCeti.puiseuxField.isAlgebraic_laurentSeries`, `TauCeti.LaurentSeries.Level.minpoly_parameter`,
  `TauCeti.LaurentSeries.irreducible_X_pow_sub_C_single`, `TauCeti.puiseuxField.level_eq_adjoin`,
  `TauCeti.puiseuxField.level_le_level_iff`, `TauCeti.puiseuxField.level_inf_level`,
  `TauCeti.puiseuxField.level_sup_level`, `TauCeti.puiseuxField.iSup_level`,
  `IntermediateField.exists_le_level`, `TauCeti.puiseuxField.addVal`,
  `TauCeti.puiseuxField.addVal_levelEmbedding`, `TauCeti.puiseuxField.valuation`,
  `TauCeti.puiseuxField.hasBasis_nhds_zero`, `TauCeti.puiseuxField.isEmbedding_levelEmbedding`,
  `TauCeti.puiseuxField.cauchySeq_sum_single`, `TauCeti.puiseuxField.not_tendsto_sum_single`,
  `TauCeti.puiseuxField.not_completeSpace`.
- Calculus on Puiseux series (`RingTheory/LaurentSeries/Puiseux/Derivative.lean`,
  `RingTheory/LaurentSeries/Puiseux/ContinuousDerivation.lean`,
  `RingTheory/LaurentSeries/Puiseux/KaehlerDifferential.lean`, `RingTheory/LaurentSeries/Puiseux/Residue.lean`;
  characteristic zero where the derivative appears): `TauCeti.puiseuxField.derivation`,
  `TauCeti.puiseuxField.derivation_single`, `TauCeti.puiseuxField.derivation_mem_range_levelEmbedding`,
  `TauCeti.puiseuxField.derivation_levelEmbedding`, `TauCeti.puiseuxField.derivation_algebraMap_laurentSeries`,
  `TauCeti.puiseuxField.continuous_derivation`, `TauCeti.puiseuxField.derivation_eq_zero_iff`,
  `Derivation.apply_eq_puiseuxFieldDerivation_smul`, `TauCeti.puiseuxField.derivation_algHom_apply`,
  `TauCeti.puiseuxField.ContinuousKaehlerDifferential`,
  `TauCeti.puiseuxField.ContinuousKaehlerDifferential.equivPuiseuxField`,
  `TauCeti.puiseuxField.ContinuousKaehlerDifferential.existsUnique_compDer_eq`,
  `TauCeti.puiseuxField.ContinuousKaehlerDifferential.levelMap`,
  `TauCeti.puiseuxField.ContinuousKaehlerDifferential.levelMap_D`,
  `TauCeti.puiseuxField.ContinuousKaehlerDifferential.levelMap_subst_X_pow`,
  `TauCeti.puiseuxField.ContinuousKaehlerDifferential.exists_levelMap_eq`, `TauCeti.puiseuxField.residue`,
  `TauCeti.puiseuxField.residue_algebraMap_laurentSeries`, `TauCeti.puiseuxField.residue_levelEmbedding`,
  `TauCeti.puiseuxField.coeff_neg_one_mul_derivative_single_eq_nsmul_residue` (every characteristic),
  `TauCeti.puiseuxField.range_derivation`, `TauCeti.puiseuxField.derivation_eq_iff_eq_primitive_add_algebraMap`,
  `TauCeti.puiseuxField.primitive_levelEmbedding`, `TauCeti.puiseuxField.residue_map_mul_derivation_eq_mul`.
- Newton polygons, Hensel lifting and Newton–Puiseux (`NumberTheory/NewtonPolygon/Basic.lean`,
  `NumberTheory/NewtonPolygon/Slopes.lean`, `NumberTheory/NewtonPolygon/Mul.lean`,
  `NumberTheory/NewtonPolygon/LaurentSeries.lean`, `Analysis/Convex/Sequence/Face.lean`,
  `RingTheory/LaurentSeries/Valuation/Basic.lean`, `RingTheory/PowerSeries/Hensel.lean`,
  `RingTheory/Polynomial/DegreeLT.lean`, `Algebra/Polynomial/Depressed.lean`,
  `RingTheory/LaurentSeries/SlopeNormalization.lean`, `RingTheory/LaurentSeries/NewtonPuiseux.lean`,
  `RingTheory/LaurentSeries/Puiseux/AlgClosure.lean`, `RingTheory/LaurentSeries/Puiseux/Binomial.lean`):
  `LaurentSeries.realAddVal` (a domain), `Polynomial.newtonPolygon`, `Polynomial.newtonPolygon_le`,
  `Polynomial.le_newtonPolygon`, `Polynomial.newtonPolygon_comp_C_mul_X`, `Polynomial.newtonPolygon_C_mul`,
  `Polynomial.newtonSlopes`, `Polynomial.count_newtonSlopes_of_isFiniteFace`, `TauCeti.IsFiniteFace`,
  `Polynomial.newtonPolygon_mul`, `Polynomial.newtonSlopes_mul`, `Polynomial.newtonPolygon_map_expand`,
  `Polynomial.newtonSlopes_map_expand`, `Polynomial.initialPolynomial`, `Polynomial.coeff_initialPolynomial`,
  `Polynomial.initialPolynomial_mul`, `Polynomial.initialPolynomial_taylor_of_realAddVal_eq`,
  `Polynomial.initialPolynomial_taylor_of_lt_realAddVal`, `Polynomial.initialPolynomial_comp_C_mul_X`,
  `Polynomial.initialPolynomial_map_expand`,
  `Polynomial.count_newtonSlopes_eq_natDegree_sub_natTrailingDegree_initialPolynomial`,
  `Polynomial.Monic.exists_monic_mul_eq_of_isCoprime` and
  `Polynomial.Monic.eq_and_eq_of_mul_eq_mul_of_isCoprime` (any commutative ring),
  `IsCoprime.exists_mem_degreeLT_mul_add_mul_eq`, `IsCoprime.eq_zero_of_mul_add_mul_eq_zero`,
  `PowerSeries.henselianLocalRing`, `Polynomial.Monic.exists_monic_mul_eq_of_nextCoeff_map_eq_zero`,
  `PowerSeries.exists_pow_eq_of_isUnit` (algebraically closed `K`, `n` nonzero in `K`),
  `Polynomial.nextCoeff_taylor_neg_div_eq_zero`, `Polynomial.Monic.exists_isCoprime_mul_eq_of_nextCoeff_eq_zero`,
  `Polynomial.Monic.exists_coeff_ne_zero_slope_le`,
  `Polynomial.Monic.exists_map_expand_eq_scaleRoots_of_nextCoeff_eq_zero`,
  `TauCeti.LaurentSeries.exists_isRoot_map_expand` and `TauCeti.puiseuxField.exists_isRoot_map_levelEmbedding`
  (algebraically closed `K` of characteristic zero), `TauCeti.puiseuxField.exists_isRoot_levelEmbedding`,
  `TauCeti.puiseuxField.instIsAlgClosed`, `TauCeti.puiseuxField.instIsAlgClosure`,
  `TauCeti.puiseuxField.pow_eq_single_one_iff`, `TauCeti.puiseuxField.pow_eq_single_iff`,
  `TauCeti.puiseuxField.sub_single_sq_eq_single_iff`.
- Kummer theory and finite extensions (`RingTheory/LaurentSeries/Level/Kummer.lean`,
  `RingTheory/LaurentSeries/Level/Transition.lean`, `RingTheory/LaurentSeries/Puiseux/FiniteExtension.lean`,
  `RingTheory/LaurentSeries/Level/Valuation.lean`, `RingTheory/LaurentSeries/Level/FiniteExtensionValuation.lean`;
  the finite-extension statements for `K` with all roots of unity or algebraically closed of
  characteristic zero, as stated in §§6.2–6.3): `TauCeti.puiseuxField.levelKummer`,
  `TauCeti.puiseuxField.coeff_levelKummer`, `TauCeti.LaurentSeries.Level.kummer`,
  `TauCeti.LaurentSeries.Level.kummer_surjective`, `TauCeti.puiseuxField.levelKummer_inclusion`,
  `TauCeti.LaurentSeries.Level.exists_eq_transition_comp_kummer`, `TauCeti.LaurentSeries.Level.isSplittingField`,
  `TauCeti.puiseuxField.isGalois_level`, `TauCeti.puiseuxField.levelGalEquivRootsOfUnity`,
  `TauCeti.puiseuxField.eq_level_of_finrank_eq`, `IntermediateField.finiteDimensional_iff_exists_eq_level`,
  `TauCeti.puiseuxField.adjoin_simple_eq_level`, `TauCeti.puiseuxField.mem_level_iff_finrank_adjoin_dvd`,
  `TauCeti.puiseuxField.mem_level_factorial_of_aeval_eq_zero`, `TauCeti.LaurentSeries.Level.algEquivOfFinrankEq`,
  `TauCeti.LaurentSeries.Level.nonempty_algEquiv_iff`, `TauCeti.LaurentSeries.Level.valuation`,
  `TauCeti.LaurentSeries.Level.valuation_algebraMap`, `TauCeti.LaurentSeries.Level.hasExtension`,
  `TauCeti.LaurentSeries.Level.integerBasis`, `TauCeti.LaurentSeries.Level.mem_valuationSubring_iff`,
  `TauCeti.LaurentSeries.Level.ramificationIdx_maximalIdeal`, `TauCeti.LaurentSeries.Level.residueFieldEquiv`,
  `TauCeti.LaurentSeries.Level.inertiaDeg_maximalIdeal`, `TauCeti.LaurentSeries.Level.valuationOfFinrankEq`,
  `TauCeti.LaurentSeries.Level.valuationOfFinrankEq_algEquiv_apply`,
  `TauCeti.LaurentSeries.Level.valuationSubringEquivOfFinrankEq`,
  `TauCeti.LaurentSeries.Level.ramificationIdx_valuationOfFinrankEq`,
  `TauCeti.LaurentSeries.Level.residueFieldEquivOfFinrankEq`.
- One-forms, traces and residues of levels (`RingTheory/LaurentSeries/Level/KaehlerDifferential.lean`,
  `RingTheory/LaurentSeries/Level/Topology.lean`, `RingTheory/LaurentSeries/Level/Trace.lean`,
  `RingTheory/LaurentSeries/Level/Residue.lean`; the tensor equivalence and the trace of one-forms for `d`
  nonzero in `K`): `TauCeti.LaurentSeries.Level.ContinuousKaehlerDifferential`,
  `TauCeti.LaurentSeries.Level.ContinuousKaehlerDifferential.map`,
  `TauCeti.LaurentSeries.Level.ContinuousKaehlerDifferential.tensorEquiv`,
  `TauCeti.LaurentSeries.Level.ContinuousKaehlerDifferential.trace`,
  `TauCeti.LaurentSeries.Level.ContinuousKaehlerDifferential.continuous_trace`,
  `TauCeti.LaurentSeries.Level.ContinuousKaehlerDifferential.coeff_neg_one_equivLaurentSeries_trace`,
  `TauCeti.LaurentSeries.Level.trace_eq_nsmul_contract`, `TauCeti.LaurentSeries.Level.trace_parameter_zpow`,
  `TauCeti.LaurentSeries.Level.coeff_neg_one_trace`, `TauCeti.puiseuxField.coeff_trace_level`,
  `TauCeti.LaurentSeries.Level.residue`, `TauCeti.LaurentSeries.Level.residue_eq_nsmul_coeff`,
  `TauCeti.LaurentSeries.Level.residue_eq_nsmul_residue_toPuiseux`,
  `TauCeti.LaurentSeries.Level.residue_apply_eq_of_algEquiv`, `TauCeti.LaurentSeries.Level.residueOfFinrankEq`,
  `TauCeti.LaurentSeries.Level.residue_transition`.
- Roots of unity and the profinite integers (`RingTheory/RootsOfUnity/TateModule.lean`,
  `RingTheory/RootsOfUnity/TateModule/Limit.lean`, `RingTheory/RootsOfUnity/TateModule/Complex.lean`,
  `Topology/Algebra/Group/Profinite/ZHat/`): `TauCeti.PrimeToPTateModule`,
  `TauCeti.primeToPTateModuleSubgroup`, `TauCeti.PrimeToPTateModule.continuous_iff`,
  `TauCeti.PrimeToPTateModule.rootsOfUnityDiagram`, `TauCeti.PrimeToPTateModule.rootsOfUnityConeIsLimit`,
  `TauCeti.PrimeToPTateModule.exists_forall_isPrimitiveRoot`, `TauCeti.PrimeToPTateModule.complexExp`,
  `TauCeti.PrimeToPTateModule.isPrimitiveRoot_proj_complexExp`,
  `TauCeti.PrimeToPTateModule.continuousMulEquivZHat`, `TauCeti.PrimeToPTateModule.zHatUnit`,
  `TauCeti.PrimeToPTateModule.zHatLift_surjective`, `TauCeti.PrimeToPTateModule.zHatLift_injective`,
  `TauCeti.PrimeToPTateModule.proj_pow_div`, `TauCeti.zHat`, `TauCeti.zHat.gen`, `TauCeti.zHat.lift`,
  `TauCeti.zHat.lift_surjective`, `TauCeti.zHat.lift_injective_of_finite_quotients`,
  `TauCeti.zHat.existsUnique_forall_toZMod_eq`, `TauCeti.zpowHat_eq_pow_val_toZMod`,
  `TauCeti.zHat.unitsLift`, and the ring structure `TauCeti.zHat.instCommRing` on `Additive TauCeti.zHat`.
- Galois groups (`RingTheory/LaurentSeries/Puiseux/Kummer.lean`, `RingTheory/LaurentSeries/Puiseux/Galois/Basic.lean`,
  `RingTheory/LaurentSeries/Puiseux/Galois/Limit.lean`, `RingTheory/LaurentSeries/Puiseux/Galois/RootsOfUnityLimit.lean`,
  `RingTheory/LaurentSeries/Puiseux/AbsoluteGalois.lean`, `RingTheory/LaurentSeries/Puiseux/Uniformizer.lean`,
  `RingTheory/LaurentSeries/Puiseux/ParameterChange.lean`, `FieldTheory/IsAlgClosed/Automorphism.lean`):
  `TauCeti.puiseuxField.kummer`, `TauCeti.puiseuxField.coeff_kummer`, `TauCeti.puiseuxField.kummer_coe_level`,
  `TauCeti.puiseuxField.kummer_injective`, `TauCeti.puiseuxField.continuous_kummer`,
  `TauCeti.puiseuxField.fixedField_zpowers_kummer_pow`, `TauCeti.puiseuxField.fixedField_zpowers_kummer`
  (primitive `ζ`), `TauCeti.puiseuxField.isGalois`, `TauCeti.puiseuxField.exists_le_levelFiniteGalois`,
  `TauCeti.puiseuxField.final_levelFunctor`, `TauCeti.puiseuxField.limitEquivTateModule`,
  `TauCeti.puiseuxField.galoisRootsOfUnityConeIsLimit`, `TauCeti.puiseuxField.galEquivTateModule`,
  `TauCeti.puiseuxField.proj_galEquivTateModule`, `TauCeti.puiseuxField.mem_fixingSubgroup_level_iff`,
  `TauCeti.puiseuxField.galEquivZHat`, `TauCeti.puiseuxField.galEquivZHat_symm_gen`,
  `TauCeti.puiseuxField.mem_fixingSubgroup_level_iff_toZMod_eq_zero` (these for `K` with all roots of
  unity); `TauCeti.puiseuxField.galEquivTateModuleOfAlgEquiv`, `TauCeti.puiseuxField.galEquivTateModuleOfAlgEquiv_eq`,
  `TauCeti.puiseuxField.eq_map_level_of_finrank_eq`, `TauCeti.puiseuxField.mem_fixingSubgroup_iff_of_finrank_eq`,
  `TauCeti.puiseuxField.absoluteGaloisGroupEquivTateModule`, `TauCeti.puiseuxField.absoluteGaloisGroupEquivZHat`,
  `TauCeti.puiseuxField.apply_eq_algebraMap_pow_toZMod_absoluteGaloisGroupEquivZHat_mul`,
  `TauCeti.puiseuxField.absoluteGaloisGroupEquivZHat_eq_gen_iff`,
  `TauCeti.puiseuxField.mem_fixingSubgroup_iff_toZMod_eq_zero_of_finrank_eq`,
  `TauCeti.puiseuxField.absoluteGaloisGroupEquivZHat_apply_eq_zpowHat`,
  `TauCeti.puiseuxField.absoluteGaloisGroupEquivZHat_symm_apply_eq_symm_zpowHat`,
  `TauCeti.puiseuxField.apply_eq_algebraMap_proj_absoluteGaloisGroupEquivTateModule_mul`,
  `TauCeti.puiseuxField.apply_eq_algebraMap_proj_galEquivTateModule_mul`,
  `TauCeti.puiseuxField.commute_restrictScalars_of_apply_algebraMap`,
  `TauCeti.puiseuxField.commute_restrictScalars_of_apply_algebraMap_substAlgEquiv` (these for `K`
  algebraically closed of characteristic zero), `AlgEquiv.exists_algEquiv_apply_algebraMap`.

## References

- [Frenkel, *Langlands Correspondence for Loop Groups*](https://math.berkeley.edu/~frenkel/loop.pdf),
  §1.2.1 (pp. 9–10) for the Galois group of `ℂ((t))`, §1.3.5 (footnote 3, p. 27, and Lemma 1.3.2,
  p. 28) for the topology of the loop algebra and its cocycle, and §§3.5.2–3.5.5 (pp. 89–95) for
  coordinate changes, their Lie algebra and the residue pairing; page numbers are those of the copy
  at this address.
- [Mannaa–Coquand, *Dynamic Newton–Puiseux Theorem*](https://arxiv.org/abs/1304.6770),
  arXiv version 2: Lemma 1.7 (pp. 4–5) for factor Hensel lifting, Lemma 1.8 and Theorem 1.9 (pp. 5–7)
  for the Newton–Puiseux route, Corollary 1.10 (p. 7) for algebraic closedness.
- [Mathlib Kummer theory](https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/FieldTheory/KummerExtension.lean)
  and [profinite Galois comparison](https://github.com/leanprover-community/mathlib4/blob/1b1ccf4b088b32fa3f23f2de1127433254a81e1e/Mathlib/FieldTheory/Galois/Profinite.lean).
- [Formal versus convergent Puiseux discussion](https://leanprover.zulipchat.com/#narrow/channel/287929-mathlib4/topic/Remaining.20100.20theorems/near/484400866)
  for the distinction from analytic branch convergence.
- [Dean Cureton's formal Puiseux development](https://github.com/deancureton/Puiseux), an
  independent formalization of the Puiseux carrier and its algebraic closedness.
