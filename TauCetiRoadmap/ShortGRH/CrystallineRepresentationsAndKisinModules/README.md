# Crystalline representations and Kisin modules

The argument proves the Riemann hypothesis for Dirichlet L-functions through a one-sided bound for a sum over primes:
such a bound at arbitrarily large scales gives a zero-free half-plane. At each scale the bound comes from comparing an
upper and a lower bound for the covolume of a lattice of theta lifts. The lower bound rests on congruences between theta
lifts, which are bounded by Selmer groups of anticyclotomic twists; at the primes above `ℓ` these Selmer groups carry
local conditions defined and computed by `p`-adic Hodge theory. The Galois representations of eigenforms that carry the
congruences are themselves pinned down at the places above `ℓ` by `p`-adic Hodge theory: they are crystalline there,
with prescribed Hodge–Tate jumps and a prescribed action of Weil elements, properties that the route obtains by passing
to limits of traces.

This roadmap states the `p`-adic Hodge theory the route uses, in the forms in which it uses it. All statements are
over `ℂ_p` and concern groups `Γ` mapping to `G_p = Gal(ℚ̄_p/ℚ_p)` with open image. Crystalline and potentially
crystalline representations are defined with Colmez's ring `B_max` alone, by asking that the invariant elements of
`B_max ⊗ T` span it; Fontaine's ring `B_cris` does not occur. That the two definitions of "crystalline" agree is
published, but the route does not use it and no roadmap section cited here states it; so "crystalline" in this roadmap
always means `B_max`-crystalline, and the sections are stated for `B_max`. Three further substitutions shape the
roadmap: the Weil–Deligne representation of `D_pst` gives way to `B_max`-linear operators `β_{s,m}`, one for each Weil
element, of which only the annihilating polynomials are recorded; the Bloch–Kato group `H¹_f` gives way to the group
`Z_f(T)` of crystalline cocycles of a lattice; and Kisin's equivalence of categories gives way to "Kummer charts"
`Λ⟦z⟧ ⊂ A_inf` together with an existence theorem for frames of crystalline lattices, with explicit clauses on periods,
Frobenius and the Galois action.

Layer 1 builds the period rings: `A_inf`, `A_max`, `B⁺`, `B_max`, `B_dR⁺` and `B_dR`, the period `t`, the fundamental
exact sequence for `B_max`, and Tate's vanishing theorem with its consequences. Layer 2 studies charts in `A_inf` and
their rings, the extension of linear maps to `B⁺`, the existence of Kummer charts, and ratios of periods fixed near `1`.
Layer 3 defines admissible, crystalline and potentially crystalline representations, Hodge–Tate jumps and the linear
Frobenius, and proves the parts of Fontaine's theory the route needs. Layer 4 treats the local conditions: the rank of
the crystalline cocycles, the Artin–Schreier sequence over the tilt, characters trivial on inertia near `1`, and twists.
Layer 5 is the theory of period matrices, frames and Kisin modules over a Kummer chart, with the radius lemma. Layer 6
proves that crystallinity, Hodge–Tate jumps and killing polynomials pass to limits of traces.

## Conventions and notation

Throughout, `p` is a prime (every prime, `p = 2` included). `ℚ̄_p` is Mathlib's algebraic closure of `ℚ_p`, `ℂ_p` its
completion, `O_C` the valuation ring of `ℂ_p`. The group `G_p = Gal(ℚ̄_p/ℚ_p)` acts on `ℂ_p` by the continuous extensions
of its elements; `χ : G_p → ℤ_p^×` is the cyclotomic character. Tensor products without subscript are over `ℤ_p`.

**Groups over `G_p`.** A *group over `G_p`* is a group `Γ` with a homomorphism `j : Γ → G_p` whose image is open; `K_Γ ⊆ ℚ̄_p`
is the field fixed by `j(Γ)`, a finite extension of `ℚ_p`, and `[G_p : j(Γ)] = [K_Γ : ℚ_p]`. A property holds *for `g`
near `1`* if it holds for all `g` with `j(g)` in some neighbourhood of `1` in `G_p`; this filter on `Γ` replaces the
passage to a finite extension. Examples: `G_K` for `K/ℚ_p` finite inside `ℚ̄_p`; the decomposition group of a place of a
fixed algebraic closure `Ω` of a number field above `p`, through an embedding `Ω → ℚ̄_p` inducing the place. Representations
are linear actions `ρ` of `Γ` on modules `T` over a commutative `ℤ_p`-algebra `R`; no topology on `Γ` and no continuity
of `ρ` is assumed unless a statement says so.

**Hodge–Tate convention.** A Hodge–Tate jump `u` of `T` at `γ : R → ℂ_p` counts the `γ`-semilinear `f : T → ℂ_p` with
`f(ρ(g)x) = χ(g)^{−u}·j(g)(f(x))` for `g` near `1` (3.1). So `ℤ_p(1)` has the single jump `−1`: the jumps are the
Hodge–Tate weights in the convention where `ℚ_p(1)` has weight `−1`, the convention of WachLatticesOverTheCyclotomicTower
(Conventions). A representation `ρ` on `T` over `R` *has jumps in `[a, b]`* if, for every `ℤ_p`-algebra map
`γ : R → ℂ_p`, `jump_γ(T, u) ≠ 0` implies `a ≤ u ≤ b` (for `R = ℤ_p` the only `γ` is the inclusion `ℤ_p ⊂ ℂ_p`).

**Matrices and the prime `ℓ`.** For a basis `e` of a free module `T` and `g ∈ Γ`, `M_e(ρ(g))` is the matrix of `ρ(g)` in `e`, its
entries read in the ring in which the formula is written (`B_dR` in 4.1, `A_max` in 6.1). In 4.5 and 6.4 the prime is called `ℓ`,
and `G_ℓ`, `ℚ̄_ℓ`, `ℂ_ℓ` are `G_p`, `ℚ̄_p`, `ℂ_p` for `p = ℓ`.

| Symbol | Meaning | Defined |
|---|---|---|
| `O♭, C♭, x ↦ x^♯` | the tilt of `O_C`, its fraction field, the untilt | 1.1 |
| `A_inf, W(C♭), θ, θ_n` | `W(O♭) ⊂ W(C♭)`, Fontaine's map `A_inf → O_C`, and `θ_n = θ∘φ^{−n}` | 1.1 |
| `φ` | the Frobenius of `A_inf`, `W(C♭)` and of every period ring built from them | 1.1, 1.3 |
| `ε, μ, τ, ξ` | a compatible system of `p`-power roots of unity in `O♭`; `[ε] − 1`, `[ε^{1/p}] − 1`, `μ/τ` | 1.1 |
| `W(𝔪♭)` | the Witt vectors over `O♭` none of whose coordinates is a unit | 1.1 |
| `A_max, B⁺, B_max, B_dR⁺` | the period rings | 1.3 |
| `t, B_dR, Fil^n` | the period with `φ(t) = pt`, `g(t) = χ(g)t`; `Frac(B_dR⁺)`; `t^n B_dR⁺` | 1.5 |
| `(Γ, j), K_Γ` | a group over `G_p` and its field | above |
| `M_e(ρ(g))` | the matrix of `ρ(g)` in a basis `e` | above |
| Frobenius for `q`, Weil pair `(s, m)` | `g(x) ≡ x^q` on the integers of `ℚ̄_p`; `s^{−1}` a Frobenius for `p^m` | 1.1, 3.1 |
| `f, 𝔽_{p^f}, Λ, z, e, E, S` | the data of a chart: `Λ = W(𝔽_{p^f}) ⊂ A_inf`, `z = [ϖ♭]`, `E = z^e A(z) + p`, `S = Λ⟦z⟧` | 2.1 |
| `S_B` | the closure of `S[E/p]` in `B⁺`, with `p` inverted | 2.1 |
| `Γ', d` | the subgroup of a Kummer chart; its different bound | 2.1 |
| `Fix_F(B ⊗ T), D_pcris(T), Z_f(T)` | periods fixed along a filter `F`; along "near `1`"; crystalline cocycles | 3.1 |
| `HT_γ(T, u), jump_γ(T, u)` | Hodge–Tate maps of weight `u` at `γ` and their number | 3.1 |
| `β_{s,m}` | the linear Frobenius of a Weil pair | 3.1 |
| `ι_a, 𝒦_a` | `r ↦ φ^{−a}(r)` from `A_inf` to `B_dR`; the value field of a Kummer chart | 5.1 |
| `(O, ζ), L, M(L), N(L), a(L)` | coefficients, a jump lattice, its `A_inf`-module and Kisin module, its jump bound | 5.6 |

Some objects are defined after a choice; only the properties stated are used. The data of the shorter proof's
argument (fields, places, sizes) do not occur in this roadmap: its statements are local, apart from the global forms
of 4.5 and 6.4.

**Origin and method.** Every section that states something carries `*Origin:*` (`published:`, `adapted from`,
`particular to this proof:`, `this roadmap's own formulation:`, or `definitions and conventions`) and
`*Method of the formal proof:*`, which says how the shorter formal proof proves it; `[ShortProof]` names the file and
declaration of that proof. A contribution may state a result more generally or prove it otherwise.

## Layer 1: Period rings over `ℂ_p`

### 1.1 The tilt of `O_C`, the ring `A_inf` and its elements

*Origin:* definitions and conventions.

- **Tilts.** For a commutative ring `R` in which `p` is not a unit, `R♭` is the inverse limit of `R/p` along `x ↦ x^p`
  (Mathlib's `PreTilt`), with the multiplicative untilt `x ↦ x^♯`; a ring map `R → R'` induces a ring map `R♭ → R'♭`,
  compatible with composition. Put `O♭ = O_C♭` and `C♭ = Frac(O♭)`; `G_p` acts on both through this functoriality.
- **`A_inf`.** `A_inf = W(O♭) ⊂ W(C♭)` (`p`-typical Witt vectors), `θ : A_inf → O_C` Fontaine's map, the ring map with
  `θ([x]) = x^♯` for Teichmüller lifts. `φ` is the Witt vector Frobenius of `A_inf` and of `W(C♭)`; `G_p` acts on both
  through its action on `O♭`, commuting with `φ`, and the monoid `ℕ × G_p` acts by `(n, g) ↦ φ^n∘g`. For `n ≥ 0`,
  `θ_n = θ∘φ^{−n}`.
- **Roots of unity.** Fix a homomorphism `s ↦ ε^s` from `(ℚ, +)` to the units of `O♭` such that `(ε^s)^♯` is a primitive
  root of unity of order the denominator of `s`, and put `ε = ε^1`. Then `μ = [ε] − 1`, `τ = [ε^{1/p}] − 1` and
  `ξ = Σ_{0≤i<p} [ε^{1/p}]^i`, so that `ξτ = μ`.
- **`W(𝔪♭)`.** With `k♭` the residue field of `O♭`, `W(𝔪♭)` is the kernel of `A_inf → W(k♭)`: the Witt vectors none of
  whose coordinates is a unit.
- **Frobenius elements.** An element `g ∈ G_p` is a *Frobenius for `q`* if `g(x) ≡ x^q` modulo the maximal ideal for every
  integral `x ∈ ℚ̄_p`, so that the Frobenius elements for `q = 1` form the inertia group, as in
  IdelicReciprocityCountsAndCyclotomicClassGroups §1.1 for the valuation ring of `ℚ̄_p`.

*Needs:* IdelicReciprocityCountsAndCyclotomicClassGroups §1.1; PadicPeriodRings §1.1

[ShortProof], `Lib/PadicHodge/PeriodRings/AxTheorem.lean` (`New.Variety.tiltMap`, `New.Gp`, `New.OC`,
`New.completionAction`, `New.cyclotomicGp`); `Lib/PadicHodge/PeriodRings/Ainf.lean` (`New.Period.OFlat`,
`New.Period.CFlat`, `New.Period.Ainf`, `New.Period.WittCFlat`, `New.Period.theta`, `New.Period.FrobGal`,
`New.Period.frobEnd`, `New.Period.epsPow`, `New.Period.mu`, `New.Period.tau`, `New.Period.xi`,
`New.Period.toWittResidue`); `Lib/PadicHodge/ArtinSchreierSequence.lean` (`New.Lift.wittOfMaxIdeal`);
`Lib/PadicHodge/Kisin/Charts.lean` (`New.Lift.thetaPhiInv`); `Lib/PadicHodge/Crystalline/Basic.lean`
(`New.Period.OverGp`, `New.Period.nearOne`, `New.Period.localFieldOf`)

### 1.2 Structure of `A_inf`

*Origin:* adapted from Fontaine, *Le corps des périodes p-adiques* (1994), and Caruso, *An introduction to p-adic
period rings* (2019), on the ring `A_inf`: here for `O_C`, with divisibility by `μ` and `τ` detected by the maps
`θ∘φ^j`, completeness of `A_inf` with respect to the ideal generated by any two of its non-units, and the
Artin–Schreier–Witt equations over perfect rings in which every monic polynomial has a root.

*Method of the formal proof:* (a) is proved on the coordinates of an element of the tilt: divisibility between
`p^n`-th powers in an integrally closed domain descends to the elements themselves, and the untilt is onto because
compatible systems of `p`-th roots can be chosen, monic polynomials having roots. (c) is reduced to the image in `O♭`,
using that the elements killed by every `θ∘φ^j` form an ideal that contains `μ` and is saturated for `p`. In (d),
completeness comes from the surjectivity of the difference operators `(x_j) ↦ (x_j − a·x_{j+1})` on sequences, which
produce the limits, and separatedness from factoring out the largest power of `p`. (e) is solved coordinate by
coordinate in the Witt vectors: modulo `p` it is a monic equation of degree `p` over `k`, which has a root by
hypothesis.

(a) (*tilts*) Let `R` be `p`-adically complete with `p` not a unit. If `R` is an integrally closed domain, then
`x^♯ | y^♯` in `R` if and only if `x | y` in `R♭`, and `x^♯ = 0` only for `x = 0`. If every monic polynomial of positive
degree over `R` has a root in `R`, the untilt `R♭ → R` and `θ : W(R♭) → R` are onto. If `R` is a valuation ring, so is
`R♭`. The ring `O_C` is `p`-adically complete with `O_C[1/p] = ℂ_p`, and every monic polynomial of positive degree over
`O_C`, or over `O♭`, has a root there; `C♭` is algebraically closed.

(b) `θ` is onto and `G_p`-equivariant with kernel `ξA_inf`; `φ` is bijective on `A_inf`; `φ(τ) = μ`; `θ(φ^j μ) = 0` and
`θ(φ^{j+1} ξ) = p` for all `j ≥ 0`; `θ(τ) ≠ 0` and `p ∤ τ`; for `g ∈ G_p`, `g(τ)` is a unit multiple of `τ`, and `μ²` divides
`g(μ) − χ(g)μ`.

(c) If `a ∈ A_inf` has `θ(φ^j a) = 0` for every `j ≥ 0`, then `μ | a`; if this holds for every `j ≥ 1`, then `τ | a`.

(d) `p` and `ξ` are prime elements of `A_inf`. For any two non-units `a, c` of `A_inf`, `A_inf` is complete and separated
for the `(a, c)`-adic topology. If `p ∤ δ`, every non-unit lies in the radical of `(p, δ)`.

(e) (*Artin–Schreier–Witt*) Let `k` be a nonzero perfect ring of characteristic `p` in which every monic polynomial of
positive degree has a root. For all `s, a ∈ W(k)` there is `y ∈ W(k)` with `φ(y) − s·y = a`. In particular, for `n ≥ 0`
and `x ∈ A_inf` there is `c ∈ A_inf` with `φ(c) − ξ^n c = x`.

(f) If `g^{−1}` is a Frobenius for `p^n`, then `φ^n∘g` acts trivially on the image of `A_inf` in `W(k♭)`.

Mathlib has the surjectivity of `θ` (`surjective_fontaineTheta`); Tau Ceti's main branch, later than the revision
pinned here, has the kernel of `θ` for the integers of a complete algebraically closed field, with its own `ε`, `μ`, `ξ`
(see "What the library already provides"). A contribution builds (b) on these and chooses one `ξ`.

*Needs:* 1.1

[ShortProof], `Lib/PadicHodge/PeriodRings/AxTheorem.lean` (`New.Variety.untilt_dvd_iff`,
`New.Variety.untilt_eq_zero_iff`, `New.Variety.untilt_surjective_of_isAbsIntegrallyClosed`,
`New.Variety.fontaineTheta_surjective_of_isAbsIntegrallyClosed`); `Lib/PadicHodge/PeriodRings/Ainf.lean`
(`New.Period.OFlat.isAbsIntegrallyClosed`, `New.Period.theta_surjective`, `New.Period.theta_smul`,
`New.Period.theta_eq_zero_iff_xi_dvd`, `New.Period.frobEnd_bijective`, `New.Period.frobEnd_tau`,
`New.Period.theta_iterate_frobEnd_mu`, `New.Period.theta_iterate_frobEnd_xi`, `New.Period.theta_tau_ne_zero`,
`New.Period.not_p_dvd_tau`, `New.Period.associated_smul_tau`, `New.Period.mu_dvd_of_theta_frobEnd`,
`New.Period.tau_dvd_of_theta_frobEnd`, `New.Period.Ainf.prime_p`, `New.Period.Ainf.prime_xi`,
`New.Period.Ainf.isAdicComplete_span_pair`, `New.Period.Ainf.mem_radical_of_not_isUnit`,
`New.Period.Witt.artin_schreier_witt`, `New.Period.Ainf.exists_frobEnd_sub_xi_pow_mul_eq`,
`New.Period.toWittResidue_smul_of_isFrob`); `Lib/PadicHodge/PeriodRings/DeRhamPeriods.lean`
(`New.Lift.mu_sq_dvd_smul_mu_sub`)

### 1.3 The rings `A_max`, `B⁺`, `B_max` and `B_dR⁺`

*Origin:* definitions and conventions.

- `A_max` is the `p`-adic completion of `A_inf[X]/(pX − ξ)`; write `ξ/p` for the class of `X`. `B⁺ = A_max[1/p]`,
  `B_max = B⁺[1/μ]`, and `B_dR⁺` is the `ξ`-adic completion of `B⁺`.
- The monoid `ℕ × G_p` acts on `A_max` and on `B⁺` by ring endomorphisms extending its action on `A_inf`, `(n, g)`
  acting as `φ^n∘g`; it acts on `B_max` as well, since the images there of the elements `φ^n g(μ)` are units (1.4 (b)).
  `G_p` acts on `B_dR⁺` by continuity.
- `θ` extends to a ring map `A_max → O_C` with `ξ/p ↦ 0`, to a `ℚ_p`-algebra map `B⁺ → ℂ_p` and to `B_dR⁺ → ℂ_p`.

These are the rings `A_max`, `B⁺_max` and `B_max` of PadicHodgeTheory §0.5, where `B_max` is `B⁺_max[1/t]` for Fontaine's
`t = log[ε]`. The period `t` of 1.5 (a) is a unit multiple of `pμ` in `A_max`, and Fontaine's `t` is a multiple of it by
an element of `ℚ_p^×` (the quotient lies in `B_max`, is fixed by `φ`, and lies in `B_dR⁺` because `θ` kills Fontaine's
`t`, so 1.5 (b), (c) apply); so the two localisations agree. `B_max` stands in for Fontaine's `B_cris`, and
`B_dR⁺` for the ring `B_dR⁺` of PadicPeriodRings §1.5, built there from Mathlib's `BDeRhamPlus`; no comparison of `B_max`
with `B_cris`, nor of the two constructions of `B_dR⁺`, is used.

*Needs:* 1.1

[ShortProof], `Lib/PadicHodge/PeriodRings/CrystallineRings.lean` (`New.Period.Amax`, `New.Period.Amax.xiDivP`,
`New.Period.BPlus`, `New.Period.Bmax`, `New.Period.BdRPlus`, `New.Period.actAmax`, `New.Period.actBPlus`,
`New.Period.actBmax`, `New.Period.thetaAmax`, `New.Period.thetaBPlus`, `New.Period.thetaBdR`);
`Lib/PadicHodge/PeriodRings/DeRhamPeriods.lean` (`New.Period.actBdRPlus`)

### 1.4 Structure of the period rings

*Origin:* adapted from Colmez, *Théorie d'Iwasawa des représentations de de Rham d'un corps local* (1998), on the ring
`A_max`: here with the kernel of `θ` on `B⁺`, the discrete valuation ring `B_dR⁺` built as the `ξ`-adic completion of
`B⁺`, and a contraction principle for Frobenius-stable subsets of `B⁺`.

*Method of the formal proof:* (b) splits `ξ` into a Teichmüller part and `p` times a unit; the Teichmüller part lies in
`pA_max`, so after Frobenius it contributes a multiple of `p^p`, and `φ(ξ)` is `p` times a unit. (c) is reduced to
divisibility in `A_inf` (for the kernel of `θ`, to 1.2 (b)): after scaling by a power of `p`, an element of `B⁺`
agrees with an element of `A_inf` up to a term in `p^n μ A_max`, and `μ` is annihilated by all the maps `θ∘φ^j`.
(d) uses that `B_dR⁺` is complete for the `ξ`-adic topology with residue field `ℂ_p`: an element with `θ(x) ≠ 0` is
therefore invertible, so that dividing out the largest power of `ξ` leaves a unit. (e) is an iteration: the
hypothesis on `V` lets each application of Frobenius gain one power of `p` in the approximation of `p^{n+1}v` by
elements of `A_inf`, up to an error in `τ^{n+1}p^k A_max`, and the approximations converge for the `(p, ξ)`-adic
topology of 1.2 (d).

(a) `p` is a non-zero-divisor on `A_max`, which is `p`-adically complete; the maps `A_max → B⁺ → B_max` and
`B⁺ → B_dR⁺` are injective, and `A_max`, `B⁺`, `B_max`, `B_dR⁺` are domains of characteristic `0`. A ring map
`f : A_inf → R` to a `p`-adically complete ring with `f(ξ) = p·x` extends to `A_max` with `ξ/p ↦ x`. If `a ∈ (p, ξ)^n`,
then `p^n | a` in `A_max`.

(b) `φ(ξ)` is `p` times a unit of `A_max`. If `a ∈ A_inf` divides `μ`, the image of `φ^n g(a)` in `B_max` is a unit for
every `(n, g) ∈ ℕ × G_p`.

(c) `θ : B⁺ → ℂ_p` is onto, with kernel `ξB⁺`. More generally, let `(s_j)` be a sequence of natural numbers and `ν ∈ A_inf`
an element dividing every `a ∈ A_inf` with `θ(φ^{s_j} a) = 0` for all `j`; then `ν` divides in `B⁺` every `y ∈ B⁺` with
`θ(φ^{s_j} y) = 0` for all `j`. For `a ∈ A_inf`, `ξ^n | a` in `B⁺` implies `ξ^n | a` in `A_inf`. An element of `B⁺` divisible
by every power of `ξ − pa` (`a ∈ A_inf`) is `0`.

(d) `B_dR⁺` is a discrete valuation ring with uniformiser `ξ`; `θ : B_dR⁺ → ℂ_p` is onto with kernel `ξB_dR⁺`, and `x` is a
unit exactly when `θ(x) ≠ 0`.

(e) (*contraction*) Let `V ⊆ B⁺` lie in the image of `A_max`, and let `n ≥ 0` and `u ∈ A_inf` be such that every `v ∈ V`
satisfies `ξ^n v = u·φ(w)` for some `w ∈ V`. Then `p^{n+1} v` lies in the image of `A_inf` for every `v ∈ V`. If `e ∈ A_inf`
divides `μ` and `e^n y` lies in the image of `A_max` (`y ∈ B⁺`), then so does `p^{2n} y`.

*Needs:* 1.2, 1.3

[ShortProof], `Lib/PadicHodge/PeriodRings/CrystallineRings.lean` (`New.Period.Amax.p_mem_nonZeroDivisors`,
`New.Period.Amax.exists_lift`, `New.Period.Amax.p_pow_dvd_of_mem_pow`, `New.Period.injective_Amax_BPlus`,
`New.Period.injective_BPlus_Bmax`, `New.Period.associated_p_frobEnd_xi`, `New.Period.isUnit_smul_of_dvd_mu`,
`New.Period.thetaBPlus_surjective`, `New.Period.thetaBPlus_eq_zero_iff`,
`New.Period.BPlus.dvd_of_thetaBPlus_frobEnd_eq_zero`, `New.Period.BPlus.eq_zero_of_forall_pow_dvd`,
`New.Period.xi_pow_dvd_of_algebraMap_BPlus_dvd`, `New.Period.thetaBdR_eq_zero_iff`, `New.Period.BdRPlus.isUnit_iff`,
`New.Period.BdRPlus.prime_xi`, `New.Period.exists_Ainf_eq_of_contraction`,
`New.Period.amaxImage.p_pow_mul_mem_of_dvd_mu`)

### 1.5 The period `t`, the field `B_dR` and the fundamental exact sequence for `B_max`

*Origin:* adapted from Fontaine, *Le corps des périodes p-adiques* (1994), Colmez, *Théorie d'Iwasawa des
représentations de de Rham d'un corps local* (1998), and Caruso, *An introduction to p-adic period rings* (2019), on the
period `t`, the field `B_dR` and the exact sequence linking the `φ`-fixed crystalline periods to `B_dR/B_dR⁺`: here for
`B_max` instead of `B_cris`, over `ℂ_p`, with `t` obtained by solving a Frobenius equation rather than as a logarithm,
with `y ↦ (φ(y) − y, y mod B_dR⁺)` mapping all of `B_max` onto `B_max × B_dR/B_dR⁺`, and with a bound for the power of
`μ` that clears the poles of an element whose Frobenius translates have bounded poles.

*Method of the formal proof:* (a) looks for `t` of the form `μ(p + μc)` with `c ∈ A_max`. By 1.4 (b) the condition
`φ(t) = pt` becomes a linear equation `c − (unit)·p·φ(c) = (known element)`, which `p`-adic completeness of `A_max`
solves, and the rule `g(t) = χ(g)t` follows from the congruence for `g(μ)` in 1.2 (b). The embedding of `ℚ̄_p` in (b)
lifts the inclusion into `ℂ_p` along `θ`, which formal étaleness of `ℚ̄_p` over `ℚ_p` allows. In (c), since every class
of `B_dR/B_dR⁺` is represented by an element of `B_max`, surjectivity comes down to solving `φ(y) − y = a`, for
`a ∈ B_max`, by some `y ∈ B_max` that also lies in `B_dR⁺`; after clearing powers of `p` and `μ` this splits into an
equation over `A_inf`, solved by 1.2 (e), and an equation over `A_max`, solved by completeness, and the denominators
of the solution, powers of `p` and `τ`, are units of `B_dR⁺`. For the second statement of (c), a `φ`-fixed element of
`B_max ∩ B_dR⁺` lies in `B⁺`, and a multiple of it in the image of `A_max`; contraction (1.4 (e)) then moves a `p`-power
multiple of it into `A_inf`, where `φ` fixes only `ℤ_p`.

(a) There is `t ∈ A_max`, a unit multiple of `pμ`, with `φ(t) = pt` and `g(t) = χ(g)t` for all `g ∈ G_p`. In `B_dR⁺`, `t` is
a unit multiple of `ξ`, hence a uniformiser.

(b) Let `B_dR = Frac(B_dR⁺)`, with the action of `G_p`. Then `B_max` embeds `G_p`-equivariantly in `B_dR`. For `n ∈ ℤ` put
`Fil^n = t^n B_dR⁺`: these are `G_p`-stable, decreasing, `Fil^m·Fil^n ⊆ Fil^{m+n}`, and for `y ∈ B_dR⁺` one has `y ∈ Fil^1`
exactly when `θ(y) = 0`. There is a `G_p`-equivariant embedding of `ℚ̄_p` in `B_dR⁺` that is a section of `θ`; a nonzero
element of `ℚ̄_p` lies in `Fil^0` and not in `Fil^1`.

(c) (*fundamental exact sequence*) For every `a ∈ B_max` and `β ∈ B_dR` there is `y ∈ B_max` with `φ(y) − y = a` and
`y − β ∈ B_dR⁺`. An element `y ∈ B_max` with `φ(y) = y` and `y ∈ B_dR⁺` lies in `ℚ_p`.

(d) (*bounded poles*) If `y ∈ B_max`, `a ≥ 0` and `φ^n(y) ∈ Fil^{−a}` for every `n ≥ 0`, then `ν^a y ∈ B⁺` for every `ν ∈ A_inf`
divisible by `μ`.

PadicPeriodRings §4.3 states the sequence `0 → ℚ_p → B_cris^{φ=1} → B_dR/Fil⁰ → 0` for `B_cris`; the surjectivity of
`φ − 1` contained in (c) is not part of it.

*Needs:* 1.2, 1.4

[ShortProof], `Lib/PadicHodge/PeriodRings/DeRhamPeriods.lean` (`New.Period.exists_tPeriod`, `New.Period.tPeriod`,
`New.Period.BdRPlus.associated_xi_tPeriod`, `New.Period.BdR`, `New.Period.thetaBdR_algebraMap_padicAlgCl`,
`New.Period.BdR.smul_algebraMap_padicAlgCl`, `New.Period.Bmax.exists_coe_eq_sub`,
`New.Period.Bmax.fundamental_sequence_surjective`); `Lib/PadicHodge/TateSen.lean` (`New.Period.hodgeFil`,
`New.Period.mul_mem_hodgeFil`, `New.Period.algebraMap_mem_hodgeFil_one_iff`, `New.Period.coe_mem_hodgeFil_iff`,
`New.Period.smul_tUnit_zpow`); `Lib/PadicHodge/Crystalline/FixedRatios.lean`
(`New.Period.Bmax.exists_padic_eq_of_frobEnd_fixed`, `New.Period.pow_smul_mem_range_BPlus`)

### 1.6 Tate's vanishing theorem, Hodge–Tate elimination and the invariants of `B_dR`

*Origin:* adapted from Tate, *p-divisible groups* (1967), §3, `H⁰(K, ℂ_p(j)) = 0` for `j ≠ 0`: here for every open
subgroup of `G_p`, with an elimination lemma for subspaces of `ℂ_p^ι` stable under a twisted action, and the invariants
of `B_dR` modulo a `B_dR⁺`-submodule.

*Method of the formal proof:* (a) starts from the boundedness of the normalised trace on `ℚ_p(μ_{p^∞})`, obtained by
expanding an element of `ℚ_p(ζ)` in powers of the uniformiser `ζ − 1` and bounding the trace of each power through the
traces of roots of unity. Ax's theorem (PadicPeriodRings §1.2) extends the bounded trace to the closure, and applying it
to a nonzero solution of `g(x) = χ(g)^n x`, `n ≠ 0`, gives a contradiction. (b) is an argument on vectors of `W` of
minimal support: after scaling, such a vector and its twisted translates differ by a vector of smaller support, which
forces its coordinates to be invariant near `1` up to the twist, hence algebraic by Ax's theorem, or zero by (a) when
the weights differ. (c) argues by contradiction: if no `x − a` with `a ∈ K_Γ` lay in `S`, the leading coefficient of
`x − a` in powers of `t` would be invariant, hence in `K_Γ`, and a second choice of `a` that cancels it gives the
contradiction.

(a) (*Tate*) There is `C` with `|Tr(z)| ≤ C·|z|` for every `z ∈ ℚ_p(μ_{p^∞})`, `Tr` the normalised trace to `ℚ_p`. If `u ≠ v` are
integers and `x ∈ ℂ_p` satisfies `χ(g)^u·g(x) = χ(g)^v·x` for every `g` in some open subgroup of `G_p`, then `x = 0`.

(b) (*Hodge–Tate elimination*) Let `ι` be finite, `u : ι → ℤ`, and `F` a filter on `G_p` each of whose members is a
neighbourhood of `1` (for instance all of `G_p`, or the neighbourhoods of `1`). Let `W ⊆ ℂ_p^ι` be a `ℂ_p`-subspace such
that for every `a ∈ W` the vector `(χ(g)^{u_i}·g(a_i))_i` lies in `W` for `F`-almost all `g`. Then `W` is spanned over
`ℂ_p` by its vectors `a` with coordinates in `ℚ̄_p` such that, for some `k ∈ ι`: `|a_i| ≤ 1` for all `i`, `a_i = 0` unless
`u_i = u_k`, `a_k = 1`, and every `a_i` is fixed by `F`-almost all `g`.

(c) Let `(Γ, j)` be a group over `G_p`, `S ⊆ B_dR` a `B_dR⁺`-submodule and `x ∈ B_dR` with `j(g)(x) − x ∈ S` for every
`g ∈ Γ`. Then `x − a ∈ S` for some `a ∈ K_Γ`. In particular the elements of `B_dR` fixed by `j(Γ)` are those of `K_Γ`.

PadicPeriodRings §1.3 (`tate_normalizedTrace`, the bounded normalised traces of the cyclotomic tower) and §1.4
(`tateSen_H0`, `tateSen_H1`) also imply (a): §1.4 computes `H⁰` and `H¹` of `ℂ_p(i)` for `G_K`, `K/ℚ_p` finite, through
these traces; the route uses only the vanishing of `H⁰` for `i ≠ 0`.

*Needs:* 1.5; PadicPeriodRings §1.2

[ShortProof], `Lib/PadicHodge/TateSen.lean` (`New.Period.exists_norm_normalizedTrace_le`,
`New.Period.eq_zero_of_smul_eq_cyclotomicGp_zpow_smul`, `New.Period.tate_eq_zero_of_cyclotomicGp_twist`,
`New.Period.le_of_hodgeTate_stable`, `New.Period.BdR.exists_sub_mem_of_smul_sub_mem`)

## Layer 2: Charts in `A_inf`

### 2.1 Charts, Kummer charts and the ring `S_B`

*Origin:* definitions and conventions.

A Kummer chart stands in for the embedding `W(k)⟦u⟧ → A_inf`, `u ↦ [π♭]`, attached to a uniformiser `π` of a `p`-adic
field and compatible `p`-power roots of it; here `θ(z)` is a uniformiser of the field of the chart (2.4), and no
comparison with the published constructions is used.

- **Constants.** For `f ≥ 1`, `𝔽_{p^f} ⊆ O♭` is the set of fixed points of `x ↦ x^{p^f}`, a field with `p^f` elements, and
  `Λ = W(𝔽_{p^f}) ⊆ A_inf`.
- **Charts.** A *chart* consists of `f ≥ 1`, a `Λ`-algebra map `Λ⟦X⟧ → A_inf`, an element `ϖ♭ ∈ O♭` and an integer `e ≥ 0`,
  and a unit `A(X)` of `Λ⟦X⟧`, such that `X ↦ z = [ϖ♭]`, `z` is not a unit of `A_inf`, and `X^e A(X) + p` is sent to a unit
  multiple of `ξ`. Its ring `S ⊆ A_inf` is the image of `Λ⟦X⟧`, and `E = z^e A(z) + p ∈ S`. An element `g ∈ G_p` *fixes the
  chart* if it fixes `Λ` pointwise and fixes `θ(z)`. The chart *belongs to* `j : Γ → G_p` if every element of `G_p` fixing
  the chart lies in `j(Γ)`.
- **The ring `S_B`.** `S[E/p]` is the `S`-subalgebra of `B⁺` generated by `E/p`, and `S_B` is the set of `y ∈ B⁺` for which
  some `m` has the following property: for every `n`, `p^m y` is an element of `S[E/p]` plus `p^n` times an element of the
  image of `A_max`.
- **Kummer charts.** For a group `(Γ, j)` over `G_p`, a *Kummer chart for `Γ`* is a chart together with a subgroup
  `Γ' ⊆ Γ` of index prime to `p` such that: `j(Γ')` fixes the chart; every element of `G_p` fixing the chart lies in
  `j(Γ')`; `Γ'` contains every `g` near `1`; and for every `l ≥ 0` some `g ∈ Γ'` has `j(g)(z) = [ε]^l z`. It is *unramified*
  if `E = z + p` and `e = 1`. Its *different bound* is `d = 0` if `e = 1` and `d = v_p(e) + 1` otherwise.

*Needs:* 1.1, 1.3

[ShortProof], `Lib/PadicHodge/Kisin/Charts.lean` (`New.Lift.flatFq`, `New.Lift.WittFq`, `New.Lift.Chart`,
`New.Lift.Chart.S`, `New.Lift.Chart.z`, `New.Lift.Chart.E`, `New.Lift.Chart.FixesThetaZ`, `New.Lift.Chart.IsChartOf`);
`Lib/PadicHodge/Kisin/Bicommutant.lean` (`New.Lift.Chart.adjoinEDivP`, `New.Lift.Chart.adjoinEDivPClosure`,
`New.Lift.Chart.bicommutant`); `Lib/PadicHodge/Kisin/KummerChartExistence.lean` (`New.Lift.KummerChart`,
`New.Lift.KummerChart.IsUnramified`, `New.Lift.KummerChart.differentBound`)

### 2.2 The ring of a chart

*Origin:* adapted from Kisin, *Crystalline representations and F-crystals* (2006), and Bhatt–Morrow–Scholze, *Integral
p-adic Hodge theory* (2018), on the Breuil–Kisin rings `W(k)⟦u⟧ ⊂ A_inf`: here for a chart, with a linear retraction of
`A_inf` onto `S`, Weierstrass division by `φ^n(E)`, and the approximation of fixed elements of the tilt by elements of
`S`.

*Method of the formal proof:* (a) evaluates power series at an element of an ideal for which `A_inf` is complete
(1.2 (d)). (b) rests on two facts: `z` is not a unit, so `1` stays nonzero modulo `(p, z)`, and `p, z` form a regular
sequence on `A_inf`; together they allow a family containing `1` to be completed to a topological basis. (c) transports
Weierstrass division from `Λ⟦X⟧`. (d) reads `θ_n` modulo `p` as a coordinate of the image of `a` in `O♭`. For (f), Ax's
theorem gives an algebraic element close to `θ_n([y])` with the same invariance, Galois theory puts it in the algebra
generated by the values `θ_n(s)`, and the retraction of (b) divides inside `S`.

(a) (*existence*) Let `f ≥ 1`, `e ≥ 0`, `x ∈ O_C` and a unit `v` of `O_C` with `x^e v = −p`. There is a `Λ`-algebra map
`Λ⟦X⟧ → A_inf` such that `θ` sends the image of `X` to `x`, and every unit `A(X)` of `Λ⟦X⟧` whose image `a` has `θ(a) = v`
completes it to a chart with these `f`, `e`, `A` and with `(ϖ♭)^♯ = x`.

(b) `Λ⟦X⟧ → S` is an isomorphism; `(p, z)` is a maximal ideal of `S`, and `S` is complete for it. `A_inf` is separated for the
`(p, z)`-adic topology and has a topological basis over `S` for it containing `1`, whose coordinate at `1` is an `S`-linear
retraction `A_inf → S`.

(c) `φ(S) ⊆ S`, with `φ^n(z) = z^{p^n}` and `z | φ^n(E) − p`. (*Weierstrass division*) For `n ≥ 0`, `N = p^n e` and `s ∈ S`
there is exactly one polynomial `r` over `Λ` of degree `< N` with `φ^n(E) | s − r(z)` in `S`.

(d) For `a ∈ A_inf`: `φ^n(E) | a` exactly when `θ_n(a) = 0`; if `θ_n(a) = 0` for every `n`, then `a = 0`. The maps `θ_n` are
`G_p`-equivariant, and modulo `p` the value `θ_n(a)` is the `n`-th component of the image of `a` in `O♭`.

(e) If `g ∈ G_p` fixes `Λ` pointwise and `δ ∈ A_inf` divides `g(z) − z`, then `δ | g(s) − s` for every `s ∈ S`. If `g` fixes the
chart, then `g` fixes `θ(s)` for every `s ∈ S`.

(f) (*approximation*) If `y ∈ O♭` is fixed by every `g ∈ G_p` that fixes `S` pointwise, then for every `N` and all large `n`
there is `s ∈ S` such that the `N`-th component of `y` in `O_C/p` equals the `n`-th component of the image of `s` in `O♭`.

*Needs:* 1.2, 2.1; PadicPeriodRings §1.2

[ShortProof], `Lib/PadicHodge/Kisin/Charts.lean` (`New.Lift.exists_chart_of_pow_mul_eq_neg`,
`New.Lift.Chart.seriesMap_injective`, `New.Lift.Chart.seriesEquiv`, `New.Lift.Chart.exists_adicBasis_coord_eq_self`, `New.Lift.Chart.coord₀_coe`, `New.Lift.Chart.frobEnd_mem`,
`New.Lift.Chart.phi_pow_z`, `New.Lift.Chart.z_dvd_frobE_sub_p`, `New.Lift.Chart.weierstrass_division`,
`New.Lift.frobE_dvd_iff`, `New.Lift.eq_zero_of_forall_thetaPhiInv_eq_zero`, `New.Lift.mk_thetaPhiInv_eq_coeff`,
`New.Lift.thetaPhiInv_smul`, `New.Lift.Chart.dvd_smul_sub_of_fixesLambda`, `New.Lift.Chart.smul_theta_of_fixesThetaZ`,
`New.Lift.Chart.mem_of_fixed_thetaPhiInvS`, `New.Lift.Chart.eventually_exists_coeff_eq_of_fixed`)

### 2.3 Extension of `S`-linear maps to `B⁺`, and the ring `S_B`

*Origin:* particular to this proof: `S`-linear endomorphisms of `A_inf` extend to `B⁺` preserving the image of `A_max`; the
ring `S_B` is the set of elements whose multiplication commutes with all such extensions, and it has the units and
divisibility properties used by period matrices.

*Method of the formal proof:* the extension in (a) is defined on the elements of `A_max` that have a multiple in `A_inf`
by a power of `p`, carried to all of `A_max` by continuity for the `p`-adic topology, and to `B⁺ = A_max[1/p]` by
linearity; its uniqueness, and every identity between such extensions, is verified on `A_inf` through the second
clause of (a). The formal proof takes the commutant of (b) as the definition of `S_B` and shows that it coincides with
the closure of 2.1. The divisibilities of (d) come from the decomposition of `p^k y` into a constant of `Λ`, which `g`
fixes, plus `z` times an element of `S_B`, together with `z | g(z)`.

(a) Every `S`-linear map `f : A_inf → A_inf` extends to an `S`-linear map `B⁺ → B⁺` that maps the image of `A_max` into
itself; an additive map of `B⁺` that maps the image of `A_max` into itself and kills the image of `A_inf` is zero.

(b) `S_B` is the set of `y ∈ B⁺` whose multiplication commutes with every `S`-linear endomorphism of `B⁺` that maps the image
of `A_max` into itself. It is an `S`-subalgebra containing `S[E/p]`; the extensions of (a) are `S_B`-linear, and the
extension of the retraction of 2.2 (b) is the identity on `S_B`.

(c) `S_B` contains `1/p` and `1/φ(E)`, and `φ(S_B) ⊆ S_B`.

(d) Every `y ∈ S_B` satisfies, for all large `k`, `p^k y = w + zx` with `w ∈ Λ` and `x ∈ S_B`. If `g ∈ G_p` fixes `Λ` pointwise
and `y ∈ S_B`, then `z | g(y) − y` in `B⁺`; if `g` fixes the chart, then `τz | g(y) − y`. An element of `B⁺` divisible by every
power of `z` is `0`.

(e) Let `y ∈ A_inf` with `p ∤ y`, `θ(y) ≠ 0` and `y | ξ − pb` for some `b ∈ A_inf`. If `y | E^k a` in `B⁺` (`a ∈ A_inf`), then
`y | a` in `A_inf`. This applies to `y = z`.

(f) For `a ∈ A_inf` and `m ≥ 0`: `E^h a = τ^m y` in `B⁺` for some `h` and some `y ∈ S_B` if and only if `a = τ^m s` with `s ∈ S`.

*Needs:* 1.4, 2.2

[ShortProof], `Lib/PadicHodge/Kisin/Bicommutant.lean` (`New.Lift.Chart.exists_extendToBPlus`,
`New.Lift.Chart.extendToBPlus`, `New.Lift.Chart.eq_zero_of_map_ainfToBPlus_eq_zero`,
`New.Lift.Chart.mem_bicommutant_iff`, `New.Lift.Chart.adjoinEDivP_le_bicommutant`,
`New.Lift.Chart.adjoinEDivPClosure_eq_bicommutant`, `New.Lift.Chart.extendToBPlus_mul`,
`New.Lift.Chart.extendedCoord_oneIndex_eq_self`, `New.Lift.Chart.exists_bicommutant_mul_p_eq_one`,
`New.Lift.Chart.exists_bicommutant_mul_phi_E_eq_one`, `New.Lift.Chart.frobEnd_mem_bicommutant`,
`New.Lift.Chart.eventually_exists_pow_mul_eq_add_z_mul`, `New.Lift.Chart.z_dvd_sub`, `New.Lift.Chart.eq_zero_of_z_pow_dvd`,
`New.Lift.Chart.dvd_of_dvd_E_pow_mul`, `New.Lift.Chart.z_dvd_of_dvd_E_pow_mul`); `Lib/PadicHodge/RadiusLemma.lean`
(`New.Lift.Chart.tau_mul_z_dvd_smul_sub`, `New.Lift.Chart.exists_E_pow_mul_eq_tau_pow_mul_iff`)

### 2.4 Existence of Kummer charts

*Origin:* adapted from the published theory of uniformisers of `p`-adic fields and their Kummer towers, as used in
Kisin, *Crystalline representations and F-crystals* (2006), for the embedding `W(k)⟦u⟧ → A_inf` recalled in 2.1: here
a Kummer chart for every group over `G_p`, with `ef` the index of its image.

*Method of the formal proof:* the chart is the one of 2.2 (a) for a uniformiser `π` of `K_Γ`, with `e` and `f` the
ramification index and the residue degree of `K_Γ` and `v = −p/π^e`. As `θ` carries `Λ⟦X⟧` onto the ring of integers
of `K_Γ`, the unit `v` is the value of a unit series `A(X)`, and an element of `G_p` that fixes the chart fixes `Λ` and
`π`, hence `K_Γ`. The elements with `j(g)(z) = [ε]^l z` come from a closed subgroup that permutes the compatible
`p`-power roots of `π` transitively.

(a) `θ` restricted to `Λ` is an injective ring map into `ℚ̄_p`, and `g ∈ G_p` fixes `Λ` pointwise if and only if it fixes the
`(p^f − 1)`-th roots of unity of `ℚ̄_p`.

(b) For every group `(Γ, j)` over `G_p` there is a Kummer chart for `Γ` such that every `j(g)`, `g ∈ Γ`, fixes the chart,
`ef = [G_p : j(Γ)]`, the chart is unramified if `j(Γ)` contains the inertia group, and `j(Γ)` contains a Frobenius for
`p^f`.

*Needs:* 2.2

[ShortProof], `Lib/PadicHodge/Kisin/KummerChartExistence.lean` (`New.Lift.wittToQpBar`,
`New.Lift.wittToQpBar_injective`, `New.Lift.fixes_roots_iff_fixesLambda`, `New.Lift.exists_smul_teichmuller_eq`,
`New.Lift.Chart.exists_smul_z_eq_of_transitive`, `New.Lift.KummerChart.IsChartFor`, `New.Lift.exists_kummerChart`)

### 2.5 Ratios of periods fixed near `1`

*Origin:* adapted from Fontaine, *Représentations p-adiques semi-stables* (1994), and Brinon–Conrad, *CMI Summer School
notes on p-adic Hodge theory* (2009), where the Galois invariants of `Frac(B_cris)` are found (their statement is in
PadicHodgeTheory §0.5): here for `B_max` and without forming fractions: a ratio `a/b` invariant near `1` becomes, after
multiplication by a power of `p`, a Witt vector over a finite field whose size is not controlled.

*Method of the formal proof:* in (b) the ratio `b/b'`, formed in the field `B_dR`, is invariant under `j(Γ)` and is
therefore an element of `K_Γ` by 1.6 (c). Applying the extended coordinate maps of the chart (2.3 (a)) to the relation
between `b` and `b'` gives a relation over `S_B`, and its constant term modulo `z` (2.3 (d)) is the element `w` of `Λ`.
Part (a) is (b) for an open subgroup on which the invariance holds, with the Kummer chart of 2.4.

(a) Let `a, b ∈ B_max` with `b ≠ 0` and `b·g(a) = g(b)·a` for all `g` near `1` in `G_p`. Then `p^n a = w·b` for some `n ≥ 0`,
`f ≥ 1` and `w ∈ W(𝔽_{p^f})`.

(b) Let `(Γ, j)` be a group over `G_p` and `c` a chart belonging to `j`. If `b, b' ∈ B_max`, `b' ≠ 0`, and
`b'·j(g)(b) = j(g)(b')·b` for every `g ∈ Γ`, then `p^m b = w·b'` with `w ∈ Λ`. If `a_l ∈ K_Γ`, `y_l ∈ B⁺` (finitely many) and
`F` is the extension (2.3 (a)) of an `S`-linear endomorphism of `A_inf`, then `Σ_l a_l y_l` divides `Σ_l a_l F(y_l)` in
`B_dR⁺`.

*Needs:* 1.6, 2.3, 2.4

[ShortProof], `Lib/PadicHodge/Crystalline/FixedRatios.lean` (`New.Lift.Chart.IsChartOf.dvd_extendToBPlus`,
`New.Period.exists_pow_mul_eq_wittFq_mul_of_isChartOf`, `New.Period.Bmax.exists_witt_ratio`)

## Layer 3: Crystalline representations defined through `B_max`

### 3.1 Admissible representations, Hodge–Tate jumps and the linear Frobenius

*Origin:* definitions and conventions.

Let `(Γ, j)` be a group over `G_p` and `ρ` an `R`-linear representation of `Γ` on `T` (`T` also a `ℤ_p`-module, compatibly).
For a `ℤ_p`-algebra `B` with an action of `G_p` (or of `ℕ × G_p`), `Γ` acts on `B ⊗ T` by `g ↦ j(g) ⊗ ρ(g)`.

- **Admissibility.** For a filter `F` on `Γ`, `Fix_F(B ⊗ T)` is the set of elements fixed by `j(g) ⊗ ρ(g)` for `F`-almost all
  `g`. `ρ` is *admissible along `F`* if `Fix_F(B_max ⊗ T)` spans `B_max ⊗ T` over `B_max`; *crystalline* if this holds for
  `F = {Γ}` (fixed by every `g`), *potentially crystalline* if it holds for `F` = "near `1`". `D_pcris(T)` is the set of
  elements of `B_max ⊗ T` fixed for `g` near `1`.
- **Crystalline cocycles.** `Z_f(T)` is the `R`-module of maps `c : Γ → T` such that some `y ∈ B_max ⊗ T` has
  `1 ⊗ c(g) = (j(g) ⊗ ρ(g))(y) − y` for every `g ∈ Γ`.
- **Hodge–Tate vectors and jumps.** `y ∈ ℂ_p ⊗ T` has *weight `u`* if `(j(g) ⊗ ρ(g))(y) = χ(j(g))^{−u} y` for every `g`. For a
  `ℤ_p`-algebra map `γ : R → ℂ_p` and `u ∈ ℤ`, `HT_γ(T, u)` is the `ℚ̄_p`-space of `γ`-semilinear maps `f : T → ℂ_p` such that
  for every `x ∈ T`, `f(ρ(g)x) = χ(j(g))^{−u}·j(g)(f(x))` for `g` near `1`; `jump_γ(T, u)` is its dimension over `ℚ̄_p` (`0` if
  infinite). A multiset `J` of integers *is the multiset of jumps of `T` at `γ`* if `jump_γ(T, u)` is the multiplicity of `u`
  in `J` for every `u`.
- **Weil pairs.** `(s, m)`, with `s ∈ G_p` and `m ≥ 0`, is a *Weil pair* if `s^{−1}` is a Frobenius for `p^m`: `s` acts on the
  residue field of `ℚ̄_p` as `x ↦ x^{p^{−m}}`. `(s, 0)` is a Weil pair exactly when `s` lies in the inertia group. For `s ∈ Γ`,
  "`(s, m)` is a Weil pair" means that `(j(s), m)` is.
- **The linear Frobenius.** `β_{s,m}` is a `B_max`-linear endomorphism of `B_max ⊗ T` that agrees with `φ^m j(s) ⊗ ρ(s)` on
  `D_pcris(T)`, chosen when one exists (3.7 (a): it exists for Weil pairs and is unique when `T` is potentially
  crystalline). A polynomial `P ∈ R[X]` *kills `(s, m)` on `T`* if `T` is potentially crystalline and `P(β_{s,m}) = 0`, the
  coefficients acting on `B_max ⊗ T` through `T`.

Admissibility for `B_max` stands in for Fontaine's admissibility for `B_cris`; `β_{s,m}` stands in for the Weil–Deligne
representation of `D_pst`, in the form `s ↦ s̄∘φ^m`, and "`P` kills `(s, m)`" for the vanishing of `P` at the Weil–Deligne
operator of `s`. No comparison with these objects is used.

*Needs:* 1.5

[ShortProof], `Lib/PadicHodge/Crystalline/Basic.lean` (`New.Period.tensorAction`, `New.Period.fixedPeriods`,
`New.Period.IsAdmissible`, `New.Period.IsCrystalline`, `New.Period.IsPotentiallyCrystalline`, `New.Period.Dpcris`,
`New.Period.crysCocycles`, `New.HasHodgeTateWeight`, `New.Period.hodgeTateMaps`, `New.Period.jump`,
`New.Period.HasJumps`, `New.Period.IsWeilPair`, `New.Period.isWeilPair_zero_iff`, `New.Period.linearFrob`,
`New.Period.coeffEnd`, `New.Period.IsKilledBy`)

### 3.2 Tate twists, characters and restriction

*Origin:* adapted from Fontaine, *Représentations p-adiques semi-stables* (1994), and Brinon–Conrad (2009), on
crystalline representations: here for admissibility along a filter, with the period `t` of 1.5 as the twisting unit.

*Method of the formal proof:* for (a), `t_c` is the power `t^{−c}` of the period of 1.5 (a), and the displayed identity
is its behaviour under `φ` and `G_p`; multiplying fixed periods by it gives fixed periods of the twist. A representation
through `χ^c` is then treated as a twist of a trivial action, for which all the vectors `1 ⊗ x` are fixed. (b) and (c)
compare the filters involved.

(a) For every `c ∈ ℤ` there is a unit `t_c` of `B_max` such that, for `σ(g) = χ(j(g))^c ρ(g)`, every `n ≥ 0`, `g ∈ Γ` and
`y ∈ B_max ⊗ T`: `(φ^n j(g) ⊗ σ(g))(t_c y) = p^{−nc}·t_c·(φ^n j(g) ⊗ ρ(g))(y)`. Hence admissibility along any filter passes
from `ρ` to its twists by powers of `χ`, and a representation on which `Γ` acts through `χ^c` is admissible along every
filter.

(b) Admissibility along `F` implies admissibility along every filter `F'` in which each member of `F` is large; in
particular crystalline representations are potentially crystalline.

(c) Let `ψ : Γ' → Γ` be a homomorphism with `j∘ψ` of open image. Then `ρ∘ψ` is admissible along a filter `F` on `Γ'` exactly
when `ρ` is admissible along the image filter `ψ_*F`; if `ρ` is potentially crystalline, so is `ρ∘ψ` (restriction to the Galois
group of a finite extension).

*Needs:* 1.5, 3.1

[ShortProof], `Lib/PadicHodge/Crystalline/Basic.lean` (`New.Period.exists_tate_twist_unit`,
`New.Period.IsAdmissible.tate_twist`, `New.Period.isAdmissible_of_cyclotomicGp_zpow`, `New.Period.IsAdmissible.mono`,
`New.Period.IsCrystalline.isPotentiallyCrystalline`, `New.Period.isAdmissible_comp_iff`, `New.Period.map_nearOne`,
`New.Period.IsPotentiallyCrystalline.comp`)

### 3.3 Hodge frames

*Origin:* adapted from Fontaine, *Représentations p-adiques semi-stables* (1994), and Brinon–Conrad (2009), on de Rham
representations (bases adapted to the Hodge filtration): here for an invertible matrix of `B_dR`-periods fixed along a
filter, with an algebraic, integral change of basis of determinant one.

*Method of the formal proof:* (a) is a minimality argument in the discrete valuation ring `B_dR⁺`, whose uniformiser is
`t` (1.5 (a)): among the admissible changes of basis `Y`, one is chosen for which the valuation of `det W` is least. If
`θ(W)` had a nontrivial kernel, Hodge–Tate elimination (1.6 (b)) would provide an algebraic, integral, invariant vector
in it, and an elementary column operation built from that vector would lower the valuation. For (b), the vectors of
periods fixed near `1` (3.1), written in coordinates for `e` and read in `B_dR` through 1.5 (b), span `B_dR^ι` over
`B_dR`; an invertible `U` whose columns are chosen among them satisfies the hypothesis of (a) for the filter "near `1`",
and `θ` of the resulting `W` is `P`.

(a) Let `ι` be finite, `F` a filter on `Γ` each of whose members contains every `g` near `1`, `A` a ring mapping compatibly to
`ℚ̄_p` and `B_dR`, `N : Γ → M_ι(A)`, and `U` invertible over `B_dR` with `N(g)·j(g)(U) = U` for `F`-almost all `g`. Then there are
`Y ∈ SL_ι(ℚ̄_p)` with integral entries fixed by `j(g)` for `F`-almost all `g`, `W` invertible over `B_dR⁺` and `k : ι → ℤ` with
`UY = W·diag(t^{k_i})` and `N(g)·j(g)(W·diag(t^{k_i})) = W·diag(t^{k_i})` for `F`-almost all `g`. For such `g` the columns of
`θ(W)` are Hodge–Tate vectors: `N(g)·j(g)(θ(W)_i) = χ(j(g))^{−k_i} θ(W)_i`, `θ(W)_i` the `i`-th column.

(b) Let every element of `R` be algebraic over `ℤ_p`, `T` finite free over `R` with basis `e`, and `T` potentially crystalline.
For each `γ : R → ℂ_p` there are `P ∈ GL_ι(ℂ_p)` and `k : ι → ℤ` such that: for `g` near `1` the columns of `P` are Hodge–Tate
vectors of weights `k_i` for the matrices `γ(ρ(g))` in `e`; the `k_i` form the multiset of jumps of `T` at `γ`; and the
`γ`-semilinear maps whose values on `e` are the rows of `P^{−1}` form a `ℂ_p`-basis of all `γ`-semilinear maps `T → ℂ_p`, the
`i`-th lying in `HT_γ(T, k_i)`. In particular the multiset of jumps at `γ` exists and has `rk_R T` elements.

*Needs:* 1.5, 1.6, 3.1

[ShortProof], `Lib/PadicHodge/Crystalline/HodgeTateJumps.lean` (`New.Period.hodgeMatrix`,
`New.Period.IsHodgeTateFrame`, `New.Period.IsHodgeFrame`, `New.Period.exists_isHodgeFrame`,
`New.Period.isHodgeTateFrame_of_hodgeMatrix`, `New.Period.IsPotentiallyCrystalline.top_le_span_fixed`,
`New.Period.IsPotentiallyCrystalline.exists_isHodgeTateFrame`, `New.Period.IsPotentiallyCrystalline.exists_hasJumps`)

### 3.4 Hodge–Tate jumps under operations

*Origin:* adapted from Fontaine, *Représentations p-adiques semi-stables* (1994), and Brinon–Conrad (2009), on
Hodge–Tate weights of de Rham representations: here as dimensions of spaces of semilinear forms fixed near `1`, with
inequalities in place of the published equalities where the route needs only these.

*Method of the formal proof:* for (a), `φ` is expanded in a linearly independent subfamily of the `f_i`. As `φ` and the
`f_i` transform by known powers of `χ`, each coefficient satisfies a twisted invariance near `1`; it is therefore
algebraic by Ax–Sen–Tate (PadicPeriodRings §1.2) when the weights agree, and `0` by 1.6 (a) when they differ. The
other clauses are computed in the Hodge–Tate frames of 3.3 (b), which behave simply under composition with a semilinear
isomorphism, multiplication by a period, passage to the transposed inverse, and pull-back of coordinate forms along
jointly injective maps.

Let `T` be finite over `R` and `γ : R → ℂ_p` a `ℤ_p`-algebra map.

(a) If `f_i ∈ HT_γ(T, k_i)` and `φ ∈ HT_γ(T, u)` lies in the `ℂ_p`-span of the `f_i`, then `φ` lies in the `ℚ̄_p`-span of the `f_i`
with `k_i = u`. Hence every `HT_γ(T, u)` is finite-dimensional, only finitely many `u` have `jump_γ(T, u) ≠ 0`, and if a
`ℂ_p`-basis of the `γ`-semilinear maps consists of elements of `HT_γ(T, u_i)`, the `u_i` form the multiset of jumps.

(b) (*extension of scalars*) Let `R'` be algebraic over `ℤ_p`, `ψ : R → R'` a `ℤ_p`-algebra map, `γ' : R' → ℂ_p`, and `h : T → T'` a
`ψ`-semilinear map carrying an `R`-basis to an `R'`-basis and equivariant for `g` near `1`. Then
`jump_{γ'}(T', u) = jump_{γ'∘ψ}(T, u)` for all `u`.

(c) (*restriction of scalars*) Let `R` be a domain, finite free over `ℤ_p`, and `T` finite free over `R` and potentially
crystalline. Then `Σ_γ jump_γ(T, u) = jump(T|_{ℤ_p}, u)` for every `u`, the sum over all `γ : R → ℂ_p` and the right side for
`T` as a `ℤ_p`-representation at the inclusion `ℤ_p ⊂ ℂ_p`. For `ζ ∈ R` and `w ∈ ℂ_p`, a set of `ℤ_p`-linear forms of weight `u`
with `f(ζx) = w·f(x)` spans over `ℂ_p` a space of dimension at most `Σ_{γ(ζ)=w} jump_γ(T, u)`.

(d) (*twists*) If `ρ'(g) = a(g)·ρ(g)` with `a(g) ∈ R`, and some nonzero `y ∈ ℂ_p` has `γ(a(g))·y = χ(j(g))^{−v}·j(g)(y)` for `g`
near `1`, then `jump_γ(ρ', u + v) = jump_γ(ρ, u)`. For `ρ' = χ^c ρ`, `jump_γ(ρ', u − c) = jump_γ(ρ, u)`. If `R` is algebraic over
`ℤ_p`, `T` is free and `Γ` acts on `T` through `χ^c`, the only jump at `γ` is `−c`, with multiplicity `rk_R T`.

(e) (*twisted duals*) Let `R` be algebraic over `ℤ_p`, `T` free and potentially crystalline, and `b : T' ≅ Hom_R(T, R)` with
`b(σ(g)x)(ρ(g)y) = χ(j(g))^c·b(x)(y)`. Then `jump_γ(T', u) = jump_γ(T, −u − c)`.

(f) (*subobjects*) Let `R` be a domain algebraic over `ℤ_p`, `T` free, and `h_i : T → S_i` finitely many jointly injective
equivariant `R`-linear maps to finite free potentially crystalline representations. Every `u` with `jump_γ(T, u) ≠ 0` has
`jump_γ(S_i, u) ≠ 0` for some `i`.

PadicHodgeTheory §3.3 and FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.1 state labelled Hodge–Tate weights for de
Rham representations; the statements above are on the spaces `HT_γ(T, u)` of 3.1. The signs are opposite: there the
cyclotomic character has weight `+1` (a weight `h` counts `ℂ_p(h)`, and the filtration jump of a de Rham object is `−h`:
PadicHodgeTheory, Conventions and §3.2), while by (d) it has the single jump `−1` here; so a jump `u` of 3.1 is a
weight `−u` there, and has the sign of the filtration jump.

*Needs:* 1.6, 3.1, 3.3; PadicPeriodRings §1.2

[ShortProof], `Lib/PadicHodge/Crystalline/HodgeTateForms.lean` (`New.Period.exists_algHom_lift`,
`New.Period.hodgeTateMaps.mem_span_same_weight`, `New.Period.finite_hodgeTateMaps`, `New.Period.hasJumps_of_basis`);
`Lib/PadicHodge/Crystalline/HodgeTateJumps.lean` (`New.Period.jump_eq_zero_iff`, `New.Period.exists_jump_bound`,
`New.Period.jump_baseChange`, `New.Period.IsPotentiallyCrystalline.sum_jump_eq_jump_overZp`,
`New.Period.jump_twist_of_period`, `New.Period.jump_twist_cyclotomicGp`, `New.Period.hasJumps_of_cyclotomicGp_zpow`,
`New.Period.jump_eq_of_pairing`, `New.Period.exists_jump_of_jointly_injective`)

### 3.5 Regularity of `B_max` and bases of fixed periods

*Origin:* adapted from Fontaine, *Représentations p-adiques semi-stables* (1994), and Brinon–Conrad (2009), on regular
period rings: here for `B_max`, for invariants along a filter, and only the part of regularity the route uses (a fixed
fraction lies in `B_max`).

*Method of the formal proof:* for (a), 2.5 (a) applied to each coordinate of `w` against `b` shows that `b` divides it,
`p` being a unit of `B_max`; the quotient is then fixed. For (b), a family of fixed elements that is maximal among the
`B_max`-independent ones already spans: one more fixed element enters a dependence relation whose coefficients, taken
relative to the coefficient of that element, form a fraction invariant in the sense of (a), and (a) turns the relation
into an expression of the element over `B_max`. Admissibility then gives all of `B_max ⊗ T`.

Let `F` be a filter on `Γ` each of whose members contains every `g` near `1` (for instance `{Γ}`, or "near `1`").

(a) If `w ∈ B_max^{(ι)}` (finitely supported), `b ∈ B_max ∖ {0}` and `b·j(g)(w) = j(g)(b)·w` for `F`-almost all `g`, then
`w = b·a` with `a ∈ B_max^{(ι)}` fixed by `j(g)` for `F`-almost all `g`.

(b) If `ρ` is admissible along `F`, then `B_max ⊗ T` has a `B_max`-basis consisting of elements of `Fix_F(B_max ⊗ T)`.

With `B_cris` in place of `B_max`, PadicHodgeTheory §3.1 (Fontaine's formalism for a regular period ring) together with
PadicPeriodRings §4.3 (regularity of `B_cris`) implies (a) and (b); the route proves only this part, for `B_max`.

*Needs:* 2.5, 3.1

[ShortProof], `Lib/PadicHodge/Crystalline/Regularity.lean` (`New.Period.fontaine_regularity`,
`New.Period.le_of_fixed_mem_of_saturated`, `New.Period.IsAdmissible.exists_basis`)

### 3.6 Closure of admissibility under subobjects, tensor products and twisted duals

*Origin:* adapted from Fontaine, *Représentations p-adiques semi-stables* (1994), and Brinon–Conrad (2009), on
admissible representations: here for `B_max`-admissibility along a filter, for modules over any `ℤ_p`-algebra.

*Method of the formal proof:* a jointly injective family has a `B_max`-linear left inverse after base change, and 3.5 (b)
gives bases of fixed elements, through which the fixed periods of the target pull back; products of fixed periods are
fixed; for the dual, pairing with fixed periods of `T` maps equivariantly to copies of `χ^c`.

Let `F` be as in 3.5.

(a) (*subobjects of finite sums*) Let `τ_i` on `S_i` (finitely many) be admissible along `F`, and `h_i : T' → S_i` jointly
injective `ℤ_p`-linear maps equivariant for `F`-almost all `g` (`T'` a representation over a `ℤ_p`-algebra `R'`). Then `T'` is
admissible along `F`.

(b) (*quotients of tensor products*) Let `B : T'' × T → T'` be `ℤ_p`-bilinear with `B(σ(g)x, ρ(g)y) = ρ'(g)B(x, y)` for all `g`,
whose values span `T'` over `ℤ_p`. If `σ` and `ρ` are admissible along a filter, so is `ρ'`.

(c) (*twisted duals*) Let `T` be finite free over `R` and admissible along `F`, and `b : T'' ≅ Hom_R(T, R)` with
`b(σ(g)x)(ρ(g)y) = χ(j(g))^c·b(x)(y)`. Then `T''` is admissible along `F`.

With `B_cris` in place of `B_max`, PadicHodgeTheory §3.1 implies (a)–(c).

*Needs:* 3.2, 3.5

[ShortProof], `Lib/PadicHodge/Crystalline/Regularity.lean` (`New.Period.IsAdmissible.of_retraction`,
`New.Period.IsAdmissible.of_jointly_injective`, `New.Period.IsAdmissible.of_bilinear`, `New.Period.IsAdmissible.of_pairing`)

### 3.7 The linear Frobenius

*Origin:* adapted from Fontaine, *Représentations ℓ-adiques potentiellement semi-stables* (1994), and Brinon–Conrad
(2009), on the Weil–Deligne representation of a potentially semistable representation (Fontaine's recipe): here as
`B_max`-linear operators `β_{s,m}`, with polynomials killing them in place of the representation, and crystalline descent
from inertia.

*Method of the formal proof:* in a basis of fixed elements (3.5 (b)) the coordinates of an element of `D_pcris(T)` are
fixed near `1`, so by 2.5 (a) they are Witt vectors over a finite field up to a power of `p`, and `φ^m j(s)` fixes them
because a Weil pair acts trivially on `W(k♭)` (1.2 (f)); this gives existence, and spanning gives uniqueness and the
identities. The converse in (f) is a descent: inertia together with a small open subgroup cuts out an unramified
extension of `ℚ_p`, whose ring of integers, a ring of Witt vectors over a finite field, sits inside `B_max`; descending
along it turns periods fixed near `1` into periods fixed by all of `Γ`.

Let `T` be potentially crystalline and `(s, m)`, `(s', m')` Weil pairs.

(a) If `b ∈ B_max` is fixed by `j(g)` for `g` near `1`, then `φ^m j(s)(b) = b`. A `B_max`-linear endomorphism agreeing with
`φ^m j(s) ⊗ ρ(s)` on `D_pcris(T)` exists and is unique, so `β_{s,m}` is defined; for `m = 0` it agrees with `j(s) ⊗ ρ(s)` on
`D_pcris(T)`.

(b) `β_{ss', m+m'} = β_{s,m}·β_{s',m'}`, `β_{s^n, nm} = (β_{s,m})^n`, and `β_{s,m}` commutes with the action of `R`.

(c) (*compatibilities*) If `h : T → T'` is `ℤ_p`-linear, equivariant for `g` near `1` and for `g = s`, and `T'` is potentially
crystalline, then `h ⊗ 1` intertwines the operators `β_{s,m}` of `T` and `T'`. If `B : T'' × T → T'` is `ℤ_p`-bilinear and
equivariant for all `g`, with `T''`, `T`, `T'` potentially crystalline, then `B(β_{s,m}x, β_{s,m}y) = β_{s,m}B(x, y)` after base
change. If `σ = χ^{−d}ρ` with `d ≥ 0`, then `β_{s,m}(σ) = p^{md}·β_{s,m}(ρ)`.

(d) (*subobjects*) Let `h_i : T' → S_i` be finitely many jointly injective maps, semilinear along a ring map `ψ : R' → R`,
equivariant for `g` near `1` and for `g = s`. If `ψ(Q)` kills `(s, m)` on every `S_i`, then `Q` kills `(s, m)` on `T'`.

(e) (*duals*) In the situation of 3.6 (c) with `F` = "near `1`", if `(s, 0)` is a Weil pair and `Q` kills `(s, 0)` on `T`, then
`Q` kills `(s^{−1}, 0)` on `T''`.

(f) (*inertia*) If `T` is crystalline and `(s, 0)` is a Weil pair, `β_{s,0} = 1`. If `T` is finite free over `R`, then
`β_{g,0} = 1` for every `g` near `1` with `(g, 0)` a Weil pair. Conversely, if `β_{s,0} = 1` for every Weil pair `(s, 0)`, then `T`
is crystalline.

PadicHodgeTheory §5.3 treats the corresponding objects for `B_cris`: it takes `D_pst` and its Weil–Deligne realization
from NoncommutativeAndEquivariantIwasawa §F.6, writes the operators as `s̄∘φ^m` by Fontaine's recipe, and states that a
potentially semistable representation is semistable over `K` exactly when inertia acts trivially on `D_pst`, and
crystalline when moreover `N = 0`. With `B_cris` in place of `B_max` these give (a)–(f) for the operators `s̄∘φ^m`;
the route proves (a)–(f) directly and uses nothing more.

*Needs:* 1.2, 2.5, 3.2, 3.5, 3.6

[ShortProof], `Lib/PadicHodge/Crystalline/Basic.lean` (`New.Period.linearFrob_eq_tensorAction_of_exists`,
`New.Period.IsPotentiallyCrystalline.linearFrob_eq`); `Lib/PadicHodge/Crystalline/Regularity.lean`
(`New.Period.IsWeilPair.smul_eq_of_fixed_nearOne`, `New.Period.linearFrob_apply`, `New.Period.linearFrob_zero_apply`,
`New.Period.linearFrob_mul`, `New.Period.linearFrob_pow`, `New.Period.commute_coeffEnd_linearFrob`,
`New.Period.baseChange_linearFrob`, `New.Period.linearFrob_baseChangePairing`, `New.Period.linearFrob_twist_cyclotomicGp`,
`New.Period.IsKilledBy.of_jointly_injective`, `New.Period.IsAdmissible.of_pairing`,
`New.Period.IsCrystalline.linearFrob_eq_one`, `New.Period.IsPotentiallyCrystalline.eventually_linearFrob_eq_one`,
`New.Period.IsPotentiallyCrystalline.isCrystalline_of_inertia_fixes`)

## Layer 4: Crystalline cocycles, the Artin–Schreier sequence and characters

### 4.1 Crystalline cocycles: coboundaries, extensions and reduction modulo `p^m`

*Origin:* adapted from Bloch and Kato, *L-functions and Tamagawa numbers of motives* (1990), on the finite local
condition: here as the group of cocycles of a lattice that become coboundaries in `B_max ⊗ T`, with the extensions they
define, Hodge coordinates (b), and their reductions modulo `p^m`.

*Method of the formal proof:* (b) applies 3.3 (a) with `F = {Γ}` to a matrix of `Γ`-invariant periods, which Galois
descent produces from the periods fixed near `1`. (c): `1 ⊗ (x, c)` is `(1 ⊗ x, 0)` plus the image of `(y, c)`, `y` the
primitive of `a(c)`; a form of weight `u ≠ 0` vanishing on `T` is fixed after a twist, hence zero (1.6 (a)). (d) reads
the extension of `ℤ_p` by `T` attached to `c` (as in (c)) in a Hodge–Tate frame (3.3 (b)), where the elements near `1`
act by matrices close to the identity.

Let `(Γ, j)` be a group over `G_p` and `ρ` a representation on `T`.

(a) `Z_f(T)` contains every coboundary `g ↦ ρ(g)x − x`; if `a ∈ ℤ_p` is nonzero and `a·c ∈ Z_f(T)`, then `c ∈ Z_f(T)`; an
equivariant `ℤ_p`-linear map `T → T'` carries `Z_f(T)` into `Z_f(T')`; if `T` is free over `ℤ_p`, every element of `Z_f(T)` is a
`1`-cocycle.

(b) (*Hodge basis*) Let `T` be finite free over `ℤ_p` with basis `e` (indexed by `ι`) and potentially crystalline. There are
`k : ι → ℤ` and a `ℤ_p`-linear automorphism `N` of `B_dR^ι` such that: the `k_i` form the multiset of jumps of `T` over `ℤ_p` at
`ℤ_p ⊂ ℂ_p`; for every `g ∈ Γ`, `N` carries the action `y ↦ M_e(ρ(g))·j(g)(y)` to the entrywise action of `j(g)`; `N` maps
`(B_dR⁺)^ι` onto `Π_i Fil^{−k_i}`; and some `W` invertible over `B_dR⁺` has `M_e(ρ(g))·j(g)(W·diag(t^{k_i})) = W·diag(t^{k_i})` for
every `g ∈ Γ`.

(c) (*extensions*) Let `T` be free over `ℤ_p`, `C` an `R`-module and `a : C → Z_f(T)` `R`-linear. The representation
`g(y, c) = (ρ(g)y + a(c)(g), c)` on `T × C` is admissible along every filter along which `T` is. If `T` is finite over `R`, then
`jump_γ(T × C, u) ≤ jump_γ(T, u)` for every `u ≠ 0`.

(d) (*reduction modulo `p^m`*) Let `T` be finite free over `ℤ_p` and potentially crystalline, and `c ∈ Z_f(T)`. For every `m`,
`c(g) ∈ p^m T` for `g` near `1`. Let `Γ` be a topological group with `j` an open embedding, `V` a discrete `Γ`-module and
`q : T → V` additive, equivariant, with kernel `p^m T`. Then `q∘c` is a continuous `1`-cocycle for every `c ∈ Z_f(T)`, and the map
`c ↦ q∘c` from `Z_f(T)` to the continuous cocycles has kernel `p^m Z_f(T)`. If moreover `Γ` is compact and `q` is onto, the
group of the `q∘c` contains every coboundary of `V`, and for every open subgroup `U` (with `j|_U` an open embedding) and every
crystalline cocycle `c'` of `U`, `q∘c'` is the image under Shapiro's map of a continuous cocycle of `Γ` with values in the
functions `Γ/U → V` whose sum over `Γ/U` is `q∘c` for some `c ∈ Z_f(T)`: the reductions are stable under corestriction.

*Needs:* 1.5, 1.6, 3.2, 3.3, 3.4; ProfiniteCohomology §§6.2, 7.2

[ShortProof], `Lib/PadicHodge/BlochKato.lean` (`New.Period.crysCocycles.coboundary_mem`,
`New.Period.crysCocycles.mem_of_smul_mem`, `New.Period.crysCocycles.comp_mem`, `New.Period.crysCocycles.apply_mul`,
`New.Period.IsPotentiallyCrystalline.exists_hodge_basis`, `New.Period.extensionRep`,
`New.Period.isAdmissible_extensionRep`, `New.Period.jump_extensionRep_le`,
`New.Period.crysCocycles.eventually_eq_pow_smul`, `New.Period.IsPotentiallyCrystalline.comp_mem_Z1`,
`New.Period.IsPotentiallyCrystalline.reducedCocycle`, `New.Period.IsPotentiallyCrystalline.ker_reducedCocycle`,
`New.Period.IsPotentiallyCrystalline.holdsCorestrictions`)

### 4.2 The rank of the crystalline cocycles

*Origin:* adapted from Bloch and Kato, *L-functions and Tamagawa numbers of motives* (1990), Corollary 3.8.4: here a
rank count for `Z_f(T)` when `T` is a potentially crystalline `ℤ_p`-lattice, with `B_max` instead of `B_cris`, over a
group whose image in `G_p` is open of index `n`.

*Method of the formal proof:* in the Hodge coordinates of 4.1 (b) the map `y ↦ (φ(y) − y, y modulo the lattice)` and the
fundamental exact sequence (1.5 (c)) compute the rank of the preimage of the coboundaries: `rk T` plus `n` times the number
of negative jumps. Without negative jumps the coboundary map is injective (no jump `0`, so no invariants) and has full rank,
which gives (b). For (c) with `a = 0`: `φ(y) − y` is fixed, so by 2.5 (a) a Witt vector over a finite field, which is
`φ(x) − x` with `x ∈ A_inf`; `y` is fixed modulo `B_dR⁺` (1.6 (c)), the kernel in 1.5 (c) puts `p^n y − x` in `ℚ_p`, and an
inertia element acts trivially on the image of `A_inf` in `W(k♭)` (1.2 (f)).

Let `T` be finite free over `ℤ_p` (with a compatible `R`-module structure) and potentially crystalline, `n = [G_p : j(Γ)]`, and
`J` the multiset of jumps of `T` over `ℤ_p` at `ℤ_p ⊂ ℂ_p`.

(a) `Z_f(T)` is a finitely generated `ℤ_p`-module (and `R`-module) of rank `rk_{ℤ_p} T + n·#{u ∈ J : u < 0}`, counted with
multiplicity.

(b) If every jump of `T` over `ℤ_p` is positive, then for each `c ∈ Z_f(T)` there are `a ∈ ℤ_p ∖ {0}` and `x ∈ T` with
`ρ(g)x − x = a·c(g)` for every `g`.

(c) If `Γ` acts on `T` through `χ^{−a}` with `a ≥ 0`, `c ∈ Z_f(T)` and `s ∈ Γ` with `ρ(s) = 1`, and if `(s, 0)` is a Weil pair in
case `a = 0`, then `c(s) = 0`.

With `B_cris` in place of `B_max`, PadicHodgeRegulators §1.5 (`dim H¹_f(K, V) = dim D_dR(V)/Fil⁰ + dim H⁰(K, V)` for de Rham
`V`) implies (a) and (b), and, with §1.8 (i) of the same roadmap (`H¹_f(K, ℚ_p)` is the unramified line), also (c):
`Z_f(T)` is then the preimage of `H¹_f(K, T[1/p])` in the continuous cocycles, of rank `(rk T − dim H⁰) + dim H¹_f`; the
route proves only this count. SelmerIwasawaCohomology §4.9 defines `H¹_f(K, V)` through
`B_cris` and the condition on a lattice `T` by inverse image, and states the same dimension formula for crystalline `V`.

*Needs:* 1.5, 1.6, 2.5, 3.4, 4.1

[ShortProof], `Lib/PadicHodge/BlochKato.lean` (`New.Period.crysCocycles.finrank_eq`, `New.Period.crysCocycles.fg`,
`New.Period.IsPotentiallyCrystalline.exists_coboundary_eq_smul`, `New.Period.crysCocycles.apply_eq_zero_of_cyclotomicGp`)

### 4.3 The Artin–Schreier sequence over the tilt

*Origin:* adapted from Herr, *Sur la cohomologie galoisienne des corps p-adiques* (1998), on Artin–Schreier–Witt
sequences over the tilt of `ℂ_p`: here only the step `φ − 1`, on `W(C♭) ⊗ ℤ/p^m(1)`, and modulo `W(𝔪♭)`.

*Method of the formal proof:* (a) is 1.2 (e) with `s = 1` for `k = C♭`. For (b), an element whose image under `φ − 1` lies in
`W(𝔪♭) + p^m W(C♭)` is congruent to a constant: modulo the maximal ideal the first `m` coordinates satisfy `x^p = x`, so they
lie in `𝔽_p`. (c) holds because the coordinates of `g(a) − a` depend continuously on `g` and vanish at `g = 1`.

Let `Γ` be a group over `G_p`; `ℤ × Γ` acts on `W(C♭) ⊗ T` by `(n, g) ↦ φ^n j(g) ⊗ ρ(g)`. Let `M = W(C♭) ⊗ ℤ/p^m(1)`, `Γ` acting on
`ℤ/p^m` through `χ`, and `S_m = W(𝔪♭)·(1 ⊗ 1) ⊆ M`.

(a) `p^m M = 0`, and `φ − 1` is onto `M`.

(b) If `φ(x) − x ∈ S_m`, then `x − 1 ⊗ k ∈ S_m` for some `k ∈ ℤ/p^m`; and `1 ⊗ k ∈ S_m` only for `k = 0`.

(c) For `a, d ∈ W(C♭)` and `m ≥ 0`, `(g(a) − a)·d ∈ W(𝔪♭) + p^m W(C♭)` for all `g` near `1` in `G_p`.

(d) Let `ρ` be a representation of `Γ` on a `ℤ_p`-module `T` such that for each `y`, `ρ(g)y − y ∈ p^m T` for `g` near `1`, and
`L : W(C♭) ⊗ T → M` a `W(C♭)`-linear map. For every `v`, `L(g·v − v) ∈ S_m` for `g` near `1`.

PrismaticCohomologyPartIII §6.3 states the étale comparison for perfectoid rings through `F − 1` on Witt vectors of the
tilt; the refinement modulo `W(𝔪♭)` and clauses (c), (d) do not follow from it.

*Needs:* 1.2

[ShortProof], `Lib/PadicHodge/ArtinSchreierSequence.lean` (`New.Lift.mem_wittOfMaxIdeal`,
`New.Lift.WittCFlat.eventually_smul_sub_mem`, `New.Lift.DiagTensor`, `New.Lift.smallPart`,
`New.Lift.TateTwist.pow_smul_eq_zero`, `New.Lift.TateTwist.exists_eq_phi_smul_sub`,
`New.Lift.TateTwist.exists_sub_mk_one_mem_smallPart_of_phi_smul_sub_mem`, `New.Lift.TateTwist.eq_zero_of_mk_one_mem_smallPart`,
`New.Lift.TateTwist.eventually_map_smul_sub_mem_smallPart`, `New.Lift.TateTwist.smallPart_spec`)

### 4.4 Characters trivial on inertia near `1`

*Origin:* adapted from Conrad, *Lifting global representations with local properties* (preprint, 2011), Appendix B,
and Serre, *Abelian ℓ-adic representations and elliptic curves* (1968), III, Appendix, on characters with finite image
on inertia, which are potentially crystalline of weight `0`: here with periods in `B_max`, `ℚ̄_p`-valued characters
acting on any commutative `ℚ̄_p`-algebra, and the action of Weil pairs through the character.

*Method of the formal proof:* (a) solves the equation `(1 ⊗ a)·φ(y) = y` for a unit `y` of `A_inf ⊗ T` by successive
approximation, which converges because `1 − a` is nilpotent modulo `p` and `A_inf` is complete (1.2 (d)). For
`m ∈ ℕ × G_p` the ratio `m(y)/y` is then fixed by `φ`, hence a constant of `T`, and its value at a Weil pair is found by
reducing Witt coordinates. For (b), `a` is an `f`-th root close to `1` of the value of `ν` at a Frobenius element of a small open
subgroup; both sides of the required identity depend continuously on `g`, and they agree on the dense subgroup
generated by that Frobenius element and inertia.

Let `Γ` be a topological group with `j` an open embedding.

(a) (*Lang's equation*) Let `T` be a finite free `ℤ_p`-algebra and `a ∈ T` with `(1 − a)^e ∈ pT` for some `e`. There is a unit `y` of
`A_inf ⊗ T` such that every `(n, g) ∈ ℕ × G_p` maps `y` to `(1 ⊗ o)·y` for some `o ∈ T`, and `φ^k s(y) = y`, `s(y) = (1 ⊗ a^k)·y` for
every Weil pair `(s, k)`.

(b) Let `ν : Γ → ℚ̄_p^×` be a continuous character with `ν(g) = 1` for all `g` near `1` such that `(g, 0)` is a Weil pair. There
are the integers `O` of a finite Galois extension of `ℚ_p` in `ℚ̄_p` and a unit `y` of `A_inf ⊗ O` with `φ^k s(y) = y` for every
Weil pair `(s, k)` and `j(g)(y) = (1 ⊗ ν(g)^{−1})·y` for `g` near `1`.

(c) For `ν` as in (b), let `Γ` act on a commutative `ℚ̄_p`-algebra `T` by `ρ(g)x = ν(g)x`. Then `ρ` is potentially crystalline;
`jump_γ(ρ, u)` equals the corresponding number for the trivial action on `T`, for all `γ` and `u`; and for every Weil pair
`(s, k)`, `X − ν(s)` kills `(s, k)` on `T`, that is, `β_{s,k}` is multiplication by `ν(s)`.

PadicHodgeTheory §3.3 states that representations with finite image on inertia are de Rham of weight zero; the action of
Weil pairs in (c), which the route uses for `ℚ̄_p`-valued characters, is not part of it.

*Needs:* 1.2, 3.1, 3.4, 3.7

[ShortProof], `Lib/PadicHodge/Characters.lean` (`New.Period.exists_unramified_period`,
`New.Period.exists_period_of_character`, `New.Period.IsPotentiallyCrystalline.of_unramified_char`,
`New.Period.jump_eq_jump_one_of_unramified_char`, `New.Period.isKilledBy_X_sub_C_of_unramified_char`,
`New.Period.isPotentiallyCrystalline_of_unramified_char`)

### 4.5 Twists by characters

*Origin:* adapted from Fontaine, *Représentations ℓ-adiques potentiellement semi-stables* (1994), and Brinon–Conrad
(2009), on the behaviour of Hodge–Tate weights and of Weil–Deligne representations under tensor products: here only for
the product of a representation with a character, stated with `B_max`-admissibility, jumps and killing polynomials.

*Method of the formal proof:* the pairing `(u, x) ↦ u·x` of the character with the representation is equivariant and onto,
so 3.6 (b) and 3.7 (c) apply; a nonzero form of weight `u` on the character provides a period for 3.4 (d).

Let `(Γ, j)` be a group over `G_ℓ`, `r : Γ → GL_m(ℚ̄_ℓ)`, `ν : Γ → ℚ̄_ℓ^×` a character and `r' = ν·r`.

(a) If `r` and `ν` are admissible along a filter `F`, so is `r'`.

(b) If `ν` has the jump `u` with multiplicity one at `γ : ℚ̄_ℓ → ℂ_ℓ`, then `jump_γ(r', w + u) = jump_γ(r, w)` for every `w`.

(c) If `(s, k)` is a Weil pair, `c ∈ ℚ̄_ℓ`, `Q(cX)` kills `(s, k)` on `r` and `X − c` kills `(s, k)` on `ν`, then `Q` kills `(s, k)` on
`r'`; indeed `β_{s,k}(r') = c·β_{s,k}(r)`.

The formal proof proves the case in which `Γ` is the decomposition group `D_A` of a place `A` of a fixed algebraic closure `Ω` of a
number field `E`, and `r`, `r'` and `ν` are defined on `Gal(Ω/E)`, with `r' = ν·r` there; it states (c) for all Weil pairs `(s, k)`
with `s ∈ D_A` at once, together with the clause away from `ℓ` (if `Q(c·r(s)) = 0` and `ν(s) = c`, then `Q(r'(s)) = 0`), as the local
conditions of GaloisRepresentationsOfUnitaryEigenforms §1.3 are defined; the identity `β_{s,k}(r') = c·β_{s,k}(r)` is a step
of that proof. The statements above follow by the same argument, since 3.4 (d),
3.6 (b) and 3.7 (c) hold for every group over `G_ℓ` and the argument for (c) uses one Weil pair at a time.

*Needs:* 3.4, 3.6, 3.7

[ShortProof], `Lib/PadicHodge/Characters.lean` (`New.GaloisRep.twistPairing_decompRep`, `New.GaloisRep.isAdmissible_twist`,
`New.GaloisRep.jump_twist`, `New.GaloisRep.PolyKillsAt.twist`, `New.GaloisRep.localConditions_twist`)

## Layer 5: Period matrices, frames and Kisin modules over Kummer charts

### 5.1 The different and the value fields of a Kummer chart

*Origin:* particular to this proof: a bound for the different of a Kummer chart, the maps `φ^{−a} : A_inf → B_dR` and the
subfields `𝒦_a` of `B_dR` in which the values of forms on Kisin modules lie, with the transfer of linear relations along
`S`-linear maps.

*Method of the formal proof:* for (a), Weierstrass division (2.2 (c)) gives a monic `P` of degree `e` with `E | P(z)`;
comparing valuations on the coefficients of `P'`, whose leading coefficient is `e`, shows that `θ(P'(z))` divides
`p^d`. (b) is 2.2 (d) read through `ι_a`, `E` being `t` times a unit in `B_dR⁺`. For (d), a relation with coefficients
`ι_a(r_l)` is read as a relation over the algebra generated by the products `b·ι_a(s)`, and the retraction is applied to
the coefficients. (e) approximates `x` modulo `Fil^1` by an element of `A_inf` and applies (d).

Let `k` be a Kummer chart for `Γ`, with subgroup `Γ'`, and `K' = K_{Γ'}`, embedded in `B_dR⁺` by 1.5 (b).

(a) (*different*) There is a polynomial `P` over `Λ` with `E | P(z)` in `S` and `θ(P'(z)) | p^d` in `O_C`.

(b) For `a ≥ 0`, `ι_a : A_inf → B_dR` sends `r` to the image of `φ^{−a}(r)`. Then `ι_a(r) ∈ Fil^1` exactly when `φ^a(E) | r` in
`A_inf`; `ι_a(φ^a E)^m ∈ Fil^m` for every `m ∈ ℤ`; and if `φ^a(E) ∤ r`, multiplication by `ι_a(r)^m` preserves every `Fil^n`.
`φ^a(E) | φ^b(τ)` for `a < b`, `φ^a(E) ∤ p`, `φ^a(E) ∤ zτ`, and `φ^a(E) ∤ φ^b(E)` for `a ≠ b`. For `g ∈ Γ'` and `s ∈ S`,
`zτ·E | g(s) − s`.

(c) `𝒦_a` is the subfield of `B_dR` generated over `K'` by the products `b·ι_a(s)` with `b ∈ S_B` and `s ∈ S`; it is generated by
the images of `S_B` and of `ι_a(S)`, and `𝒦_0 ⊆ 𝒦_a`.

(d) Let `h : A_inf → S` be `S`-linear, `v_l ∈ 𝒦_a`, `r_l ∈ A_inf` (finitely many) and `W ⊆ B_dR` a `B_dR⁺`-submodule. If
`Σ_l ι_a(r_l)·v_l ∈ W`, then `Σ_l ι_a(h(r_l))·v_l ∈ W`.

(e) Let `g, t_1, …, t_n ∈ Γ'`, and `x ∈ 𝒦_a ∩ Fil^0`. If `φ^a(E)` divides `g(Σ_l t_l(s)) − Σ_l t_l(s)` in `A_inf` for every `s ∈ S`,
then `g(Σ_l t_l(x)) − Σ_l t_l(x) ∈ Fil^1`.

*Needs:* 1.5, 2.2, 2.3, 2.4

[ShortProof], `Lib/PadicHodge/Kisin/KummerChartDeRham.lean` (`New.Lift.KummerChart.exists_derivative_dvd_p_pow`,
`New.Lift.KummerChart.zTau_mul_E_dvd_smul_sub`, `New.Lift.KummerChart.frobE_dvd_phi_pow_tau`,
`New.Lift.KummerChart.not_frobE_dvd_frobE_of_ne`, `New.Lift.KummerChart.not_frobE_dvd_zTau`, `New.Lift.phiInvToBdR`,
`New.Lift.KummerChart.valueField`, `New.Lift.KummerChart.phiInvToBdR_mem_hodgeFil_one_iff`,
`New.Lift.KummerChart.mul_mem_hodgeFil_iff_of_not_frobE_dvd`, `New.Lift.KummerChart.phiInvToBdR_frobE_zpow_mem_hodgeFil`,
`New.Lift.KummerChart.valueField_eq_adjoin_union`, `New.Lift.KummerChart.valueField_zero_le`,
`New.Lift.KummerChart.sum_phiInvToBdR_map_mul_mem_of_mem_valueField`,
`New.Lift.KummerChart.smul_sub_mem_hodgeFil_of_valueField`)

### 5.2 Period matrices over a chart and their bases

*Origin:* particular to this proof: matrices over `B⁺` that divide a power of `Eτ`, have a Frobenius matrix over `S_B` and a
Galois action through `A_inf`, and the existence for them of a nonsingular matrix over `A_inf` spanning the solutions of
`Uy = E^h x`.

*Method of the formal proof:* the solutions of `Uy ∈ E^h(B⁺)^d` have denominators bounded independently of the
solution: Frobenius, through condition (ii), together with the contraction principle (1.4 (e)) brings them into the
image of `A_max` and then into `A_inf`. The matrix `Q` is assembled from solutions using the `S`-coordinates of 2.3, and
`det Q ≠ 0` because a row vector annihilating `Q` would make `τ^h l·x` divisible by all powers of `z`.

Let `c` be a chart, `d` a finite index set, `h ≥ 0` and `v` a unit of `A_inf`. `U ∈ M_d(B⁺)` is a *period matrix of height `h` with
Frobenius factor `v`* if: (i) `UW = (Eτ)^h·1` for some `W ∈ M_d(B⁺)`; (ii) `φ(U) = v·U·F` with `F` over `S_B` having a left inverse
over `B⁺`; (iii) for every `g` fixing the chart, `U = R_g·g(U)` for some `R_g ∈ M_d(A_inf)`; (iv) if `Uy ∈ E^h(B⁺)^d`, then also
`U·G(y) ∈ E^h(B⁺)^d`, where `G` is the extension (2.3 (a)) of any `S`-linear endomorphism of `A_inf`, applied to each
coordinate.

(a) `Eτ` is a unit multiple of `μ`, and `E` is a unit multiple of `g(E)` for `g ∈ G_p`.

(b) Every period matrix `U` of height `h` has a *basis*: `Q ∈ M_d(A_inf)` with `det Q ≠ 0` and `Z ∈ M_d(S_B)` with `UZ = E^h Q`, such
that every `x ∈ A_inf^d` with `Uy = E^h x` for some `y ∈ S_B^d` is `Qs` for some `s ∈ S^d`, and such that whenever `Uy = E^h x` with
`y ∈ (B⁺)^d`, `δ ∈ A_inf`, `p ∤ δ`, and `lQ = δ·g` for rows `l, g` over `A_inf`, then `δ | l·x`.

*Needs:* 1.4, 2.3

[ShortProof], `Lib/PadicHodge/Kisin/PeriodMatrixBasis.lean` (`New.Lift.Chart.associated_E_mul_tau_mu`,
`New.Lift.Chart.associated_smul_E`, `New.Lift.Chart.IsPeriodMatrix`, `New.Lift.Chart.IsPeriodBasis`,
`New.Lift.Chart.IsPeriodMatrix.exists_spanning_matrix`, `New.Lift.Chart.IsPeriodMatrix.exists_basis`)

### 5.3 Period matrices of crystalline lattices

*Origin:* particular to this proof: a crystalline `ℤ_p`-lattice with jumps in `[−a, b]` has, over a chart belonging to its
group, the period matrix `(Eτ)^a M` of height `a + b`, `M` a matrix of invariant periods.

*Method of the formal proof:* `M` comes from a basis of invariant periods (3.5 (b)); the Hodge frame (3.3) bounds the poles
of `M` and `M^{−1}` along `t`, so `(Eτ)^a M` and `(Eτ)^b M^{−1}` lie over `B⁺` (1.5 (d)); the transition matrices of (a) are fixed,
so they lie in `S_B` by 2.5 (b) and `1/p ∈ S_B`; the four conditions of 5.2 follow.

Let `(Γ, j)` be a group over `G_p`, `c` a chart belonging to `j`, and `T` a free `ℤ_p`-module of finite rank with basis `e` and a
crystalline action `ρ`.

(a) There is `M ∈ GL_d(B_max)` whose columns are the coordinates in `e` of `Γ`-invariant elements of `B_max ⊗ T`. For two such
`M`, `N` the matrix `M^{−1}N` is the image of a matrix over `S_B`. An element of `B_max` fixed by `j(Γ)` is the image of an
element of `S_B`.

(b) If the jumps of `T` at `ℤ_p ⊂ ℂ_p` lie in `[−a, b]` (`a, b ≥ 0`), there are such an `M`, a unit `v` of `A_inf` with `Eτv = μ`,
and `U ∈ M_d(B⁺)` whose image in `M_d(B_max)` is `(Eτ)^a M`, such that `U` is a period matrix of height `a + b` with Frobenius
factor `v^a`.

*Needs:* 1.5, 2.5, 3.3, 3.5, 5.2

[ShortProof], `Lib/PadicHodge/Kisin/PeriodMatrixBasis.lean` (`New.Period.HasInvariantColumns`,
`New.Lift.Chart.IsPeriodMatrixOf`, `New.Period.IsCrystalline.exists_hasInvariantColumns`,
`New.Lift.Chart.IsChartOf.exists_mem_bicommutant_of_fixed`, `New.Lift.Chart.IsChartOf.exists_transition_matrix`,
`New.Lift.Chart.IsChartOf.exists_isPeriodMatrixOf`)

### 5.4 The frame theorem for a period matrix

*Origin:* particular to this proof: for a period matrix over a chart, a frame over `A_inf` with Frobenius matrix over `S` and
control of the Galois action; the nearest published result is the theorem of Kisin, *Crystalline representations and
F-crystals* (2006), attaching a Breuil–Kisin module to a crystalline lattice, of which this is an existence statement for
matrices, without finite height.

*Method of the formal proof:* `Q` and `Z` are those of 5.2 (b), and the other clauses come from three sources. `B` is
given by condition (ii) of 5.2 together with the spanning clause of 5.2 (b). `L`, `Z'` and the clause on `g(Z)` hold as
soon as `X ∈ Q·M_d(A_inf)` for every solution of `UY = E^h X`, which the divisibility clause of 5.2 (b) yields once
`p ∤ det Q`. That `p ∤ det Q` is shown by contradiction with linear algebra over `S` and over the valuation ring `O♭`:
a matrix over `S` with determinant prime to `p`, whose rows are coordinates over `S` of rows of `Q`; a vector of
minimal support in the kernel of `Q` modulo `p` (Artin's argument), which every element fixing `S` must fix, so that
2.2 (f) approximates it from `S`; and `B`, whose determinant is prime to `p` because `det Q ≠ 0`.

Let `U` be a period matrix of height `h` with Frobenius factor `v`. There are `Q, L ∈ M_d(A_inf)`, `Z, Z' ∈ M_d(B⁺)` and
`B ∈ M_d(S)` with: `QL = τ^h·1`; `Z` has entries in `S_B`; `UZ = E^h Q`; `Z'Z = E^h·1`; `φ(Q) = v·Q·B`; and for every `g` fixing
the chart, `g(Z) = Z·G` for some `G ∈ M_d(A_inf)`.

FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.16 states Kisin's fully faithful functor on crystalline lattices; it does
not give the clauses above on `S_B`, on the divisibility by `E^h` and on the Galois action, and the route does not use full
faithfulness or finite height.

*Needs:* 5.2

[ShortProof], `Lib/PadicHodge/Kisin/PeriodMatrixFrame.lean` (`New.Lift.Chart.exists_det_ne_zero`,
`New.exists_mulVec_eq_zero_and_forall_comp_eq`, `New.Lift.Chart.not_dvd_det_of_frobenius`,
`New.Lift.Chart.IsPeriodMatrix.exists_frame`)

### 5.5 The radius lemma

*Origin:* adapted from Dwork's trick for Frobenius modules, as in Kisin, *Crystalline representations and F-crystals*
(2006), Lemma 1.2.6, Kisin, *Potentially semi-stable deformation rings* (2008), Lemma 2.2, and Bhatt–Scholze, *Prismatic
F-crystals and crystalline Galois representations* (2023), proof of Theorem 5.6: here, after `l` Frobenius steps with
`3e ≤ p^l`, a matrix over `S_B` with a Galois action through `A_inf` becomes a power of `φ^l(E)` times a constant matrix
times an invertible matrix over `A_max`.

*Method of the formal proof:* after `Z` is multiplied by a constant matrix that makes it congruent to `1` modulo `z`, the
element `t`, which fixes the chart and multiplies `z` by `[ε]`, moves it only by multiples of `τz` (2.3 (d)). The
condition `3e ≤ p^l` then allows `φ^l` of the corrected matrix, and `φ^l(E)/p`, to be written as values at
`φ^l(z)/p²` of unit power series over `S`, which gives `V`; `C` is the inverse of `p^b` times `φ^l` of the constant
correction.

Let `c` be a chart and `t ∈ G_p` fix the chart with `t(z) = [ε]z`. Let `Z ∈ M_d(S_B)` and `Z' ∈ M_d(B⁺)` with `Z'Z = E^h·1`, and
`t(Z) = Z·G` for some `G ∈ M_d(A_inf)`; let `l ≥ 0` with `3e ≤ p^l`, and `b ≥ 0`. There are `V ∈ GL_d(A_max)` and `C ∈ M_d(B⁺)` with:
`g(C) = C` for every `g ∈ G_p` fixing `Λ` pointwise; `φ^l(Z) = φ^l(E)^b·C·V`; and whenever `eA ≤ p^l δ`, `p^{4δ}·S^d` lies in the
`S`-span of the `y ∈ S^d` for which `Vy` is congruent modulo `E^A` (in `(B⁺)^d`) to a vector of natural numbers.

*Needs:* 1.4, 2.2, 2.3

[ShortProof], `Lib/PadicHodge/RadiusLemma.lean` (`New.Lift.Chart.natCongruentSet`,
`New.Lift.Chart.pow_smul_mem_span_of_unit`, `New.Lift.Chart.exists_ev_eq_frobEnd_pow`, `New.Lift.Chart.IsRadiusFactorization`,
`New.Lift.Chart.radius_lemma`)

### 5.6 Jump lattices, forms and Kisin modules

*Origin:* definitions and conventions.

The modules `M(L)` and `N(L)` below stand in for the Breuil–Kisin–Fargues module and the Breuil–Kisin module of a
crystalline lattice; no comparison with them is used. Let `Γ` be a group over `G_p` and `k` a Kummer chart for `Γ` with
subgroup `Γ'`.

- **Letters.** A *letter* is a unit `i` of `𝔽_{p^f}`; `[i] ∈ S` is its Teichmüller lift; there are `p^f − 1` letters, permuted by
  `i ↦ i^p`.
- **Coefficients.** `(O, ζ)`: a `ℤ_p`-algebra `O` that is a discrete valuation ring of characteristic `0`, free of finite rank over
  `ℤ_p`, with `ζ ∈ O`, `ζ^{p^f − 1} = 1`.
- **Jump lattices.** A *jump lattice* `L` over `k` with coefficients `(O, ζ)` is a Galois lattice over `O` (a finite free `O`-module
  with an `O`-linear action `ρ` of `Γ`) in the class `(F, ∅, U)` of IdelicReciprocityCountsAndCyclotomicClassGroups §5.1, for `F` the
  filter of subsets of `Γ` containing `Γ'` and finite sets `U_γ ⊆ ℤ`, one for each `ℤ_p`-algebra map `γ : O → ℂ_p`: the elements of
  `B_max ⊗ L` fixed by all of `Γ'` span it (crystalline over `Γ'`, as `Γ'` contains every `g` near `1`), and `U_γ` contains the jumps
  of `L` at `γ`; together with finite sets `J_i ⊆ ℤ`, one for each letter, with `U_γ ⊆ J_i` whenever `γ(ζ) = θ([i])`.
- **The ambient module.** `W(C♭) ⊗ L`, on which `ℤ × Γ` acts by `(n, g) ↦ φ^n j(g) ⊗ ρ(g)`; `A_inf ⊗ L` is the `A_inf`-span of the
  vectors `1 ⊗ x`, and `(A_inf ⊗ L)^sat` the set of `x` with `rx ∈ A_inf ⊗ L` for some non-zero-divisor `r` of `A_inf`.
- **Forms.** A *form* is an `A_inf`-linear map `λ : W(C♭) ⊗ L → B_dR` with `λ(1 ⊗ ρ(g)x) = j(g)(λ(1 ⊗ x))` for `g ∈ Γ'` and `x ∈ L`. It is
  *crystalline* if its restriction to the vectors `1 ⊗ x` comes from a `ℤ_p`-linear map `L → B_max`.
- **The modules.** `M(L)` is the `A_inf`-module of the `x` with `τ^N x ∈ A_inf ⊗ L` for some `N` and `λ(φ^{n+1}x) ∈ B_dR⁺` for all `n ≥ 0`
  and all forms `λ`. For an `A_inf`-submodule `Q`, `Q^𝒦` is the `S`-module of the `x ∈ Q` with `λ(x) ∈ 𝒦_0` for every form `λ`
  (5.1 (c)). The *Kisin module* is `N(L) = M(L)^𝒦`. `φ^l M(L)` is the set of `x` with `φ^{−l}x ∈ M(L)`.
- **Letter projectors and types.** `e_i = (p^f − 1)^{−1} Σ_{0≤n<p^f−1} ([i]^{−1}ζ)^n` on `W(C♭) ⊗ L` (`ζ` acting through `L`). A form `λ`
  has *type `u` at `i`* if `λ(e_i(1 ⊗ x)) ∈ Fil^{−u}` for every `x ∈ L`. The *jump multiplicity* of `u` at `i` is
  `Σ_{γ(ζ)=θ([i])} jump_γ(L, u)`.
- **Jump bound.** `a(L)` is the least `a ≥ 0` such that every jump of `L` as a `ℤ_p`-representation of `Γ'` at `ℤ_p ⊂ ℂ_p` lies in
  `[−a, a]`.

*Needs:* 2.1, 3.1, 5.1; IdelicReciprocityCountsAndCyclotomicClassGroups §5.1

[ShortProof], `Lib/PadicHodge/Kisin/Modules.lean` (`New.Lift.KummerChart.Letter`, `New.Lift.KummerChart.letterTeich`,
`New.Lift.KummerChart.Coeffs`, `New.Lift.KummerChart.JumpLattice`, `New.Lift.KummerChart.JumpLattice.ainfLattice`,
`New.Lift.KummerChart.JumpLattice.fracSpan`, `New.Lift.KummerChart.JumpLattice.forms`,
`New.Lift.KummerChart.JumpLattice.crysForms`, `New.Lift.KummerChart.JumpLattice.kisinAinf`,
`New.Lift.KummerChart.JumpLattice.valueFieldPoints`, `New.Lift.KummerChart.JumpLattice.kisinModule`,
`New.Lift.KummerChart.JumpLattice.frobKisinAinf`, `New.Lift.KummerChart.JumpLattice.letterProj`, `New.Lift.KummerChart.JumpLattice.formsOfType`,
`New.Lift.KummerChart.JumpLattice.jumpMultiplicity`, `New.Lift.KummerChart.JumpLattice.jumpBound`)

### 5.7 Letter projectors and forms of given type

*Origin:* adapted from Berger, *Limites de représentations cristallines* (2004), and Wach, *Représentations p-adiques
potentiellement cristallines* (1996), the heights of Wach lattices labelled by embeddings: here for the Kisin module of a
Kummer chart inside `A_inf` in place of the Wach lattice over the cyclotomic tower, with upper bounds, letter by letter,
on the spaces of `B_dR`-valued forms of a given type by the jump multiplicities.

*Method of the formal proof:* for (c), a form `λ` of type `u` at `i` is sent to the function
`x ↦ θ(t^u λ(e_i(1 ⊗ x)))` on `L`, its leading coefficient. Each of these functions has Hodge–Tate weight `u`, and `ζ`
multiplies it by `θ([i])`; so by 3.4 (c) they span a space of dimension at most the jump multiplicity. Expressed in a
basis of that space, the leading coefficient of any form has coordinates invariant under `Γ'`, which therefore lie in
`K'` (PadicPeriodRings §1.2); subtracting the corresponding combination of forms leaves a form of type `u − 1`.

Let `L, L'` be jump lattices over `k` with coefficients `(O, ζ)`.

(a) An equivariant `O`-linear map `L → L'` maps, after extension of scalars, `M(L)` into `M(L')`, `N(L)` into `N(L')` and `φ^l M(L)` into
`φ^l M(L')`; composing a form of `L'` with it gives a form of `L`.

(b) `e_i` projects onto the part of `W(C♭) ⊗ L` on which `ζ` acts as `[i]`, `Σ_i e_i = 1`, and composing a form with `e_i` gives a
form. If `m ∈ ℤ × Γ` sends `[i]^{−1}` to `[i']^{−1}`, then `m∘e_i = e_{i'}∘m`; in particular `e_i` commutes with the action of
`Γ'`, whose elements fix `Λ` pointwise.

(c) For every letter `i` and `u ∈ ℤ` there are at most the jump multiplicity of `u` at `i` many forms `ν_1, …, ν_r` of type `u` at `i` such
that every form of type `u` at `i` is a `ℚ̄_p`-linear combination of the `ν_l` plus a form of type `u − 1` at `i`.

(d) If `n ∉ J_i`, every form of type `n` at `i` has type `n − 1` at `i`.

*Needs:* 1.6, 3.4, 5.6; PadicPeriodRings §1.2

[ShortProof], `Lib/PadicHodge/Kisin/Modules.lean` (`New.Lift.KummerChart.JumpLattice.Hom.comp_wittMap_mem_forms`,
`New.Lift.KummerChart.JumpLattice.Hom.wittMap_mem_kisinAinf`, `New.Lift.KummerChart.JumpLattice.Hom.wittMap_mem_kisinModule`,
`New.Lift.KummerChart.JumpLattice.Hom.wittMap_mem_frobKisinAinf`,
`New.Lift.KummerChart.JumpLattice.mem_letterPart_iff_letterProj`, `New.Lift.KummerChart.JumpLattice.sum_letterProj`,
`New.Lift.KummerChart.JumpLattice.smul_letterProj`, `New.Lift.KummerChart.JumpLattice.gal_smul_letterProj`, `New.Lift.KummerChart.JumpLattice.comp_letterProj_mem_forms`,
`New.Lift.KummerChart.JumpLattice.exists_span_formsOfType_mod_pred`,
`New.Lift.KummerChart.JumpLattice.formsOfType_subset_pred_of_notMem`)

### 5.8 The frame theorem for Kisin modules

*Origin:* particular to this proof: nine properties of `M(L)` and `N(L)` for a jump lattice over a Kummer chart; the nearest
published results are the theorem of Kisin (2006) on the Breuil–Kisin module of a crystalline lattice and the comparison
of Breuil–Kisin–Fargues modules over `A_inf[1/μ]` in Bhatt–Morrow–Scholze (2018), of which (c), (f)–(i) are a part;
this section states neither finite height, the inclusion `E^n N(L) ⊆ S·φ(N(L))`, nor an equivalence of categories.

*Method of the formal proof:* a frame of `L`: the period matrix of 5.3 for jumps in `[−a, a]` over the Kummer chart, its frame
(5.4), and the columns `n_i` of `τ^{−a}Q` in `W(C♭) ⊗ L`. The `n_i` span `M(L)` over `A_inf` and `N(L)` over `S`, and the `φ^l n_i` span
`φ^l M(L)^𝒦` over `S`; (a) uses 5.1 (d), (b) the radius lemma (5.5), (d) the matrix `Z` over `S_B`, (e) the divisibility clause
of 5.2 (b), (h) the Frobenius matrix `B` over `S` with `φ(τ) = Eτv`.

Let `L` be a jump lattice over the Kummer chart `k`, `a = a(L)`.

(a) If `h : A_inf → S` is `S`-linear and `Σ_l c_l v_l = 0` with `c_l ∈ A_inf` and `v_l ∈ ((A_inf ⊗ L)^sat)^𝒦`, then `Σ_l h(c_l) v_l = 0`.

(b) If `3e ≤ p^l` and `eA ≤ p^l δ`, then for every `x ∈ (φ^l M(L))^𝒦`, `p^{4δ}x` lies in the `S`-span of the `y ∈ (φ^l M(L))^𝒦` with
`j(g)(λ(y)) − λ(y) ∈ Fil^A` for every form `λ` and every `g ∈ Γ'`.

(c) `M(L)` is the `A_inf`-span of `N(L)`.

(d) For every crystalline form `λ` and `y ∈ N(L)`, `E^a λ(y)` is the image of an element of `S_B`.

(e) Let `δ ∈ A_inf` be such that `δ | E^m r` in `B⁺` implies `δ | r` in `A_inf` (for all `m ≥ 0`, `r ∈ A_inf`). If `x ∈ M(L)` and for one `n`
`E^n λ(x) ∈ δB⁺` for every crystalline form `λ`, then `x ∈ δM(L)`.

(f) `τ^a M(L) ⊆ A_inf ⊗ L` and (g) `τ^a (A_inf ⊗ L) ⊆ M(L)`.

(h) `E^a φ(N(L)) ⊆ N(L)`, `E` acting as a unit of `W(C♭)`.

(i) There are `rk_{ℤ_p} L` vectors that span `N(L)` over `S` and `M(L)` over `A_inf` and are linearly independent over `A_inf`. Hence
`N(L)` is free over `S` of rank `rk_{ℤ_p} L`; `(φ^l M(L))^𝒦` is the `S`-span of `φ^l(N(L))`; and the saturations of `A_inf·N(L)` and of
`A_inf ⊗ L` under the powers of `τ` coincide.

FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.16 and PrismaticCohomologyPartIII §7.21 state stronger theorems in other
terms (a fully faithful functor, the prismatic `F`-crystal of a crystalline lattice); they do not give (a), (b), (d) and (e).

*Needs:* 2.3, 5.1, 5.3, 5.4, 5.5, 5.6

[ShortProof], `Lib/PadicHodge/Kisin/FrameTheorem.lean` (`New.Lift.KummerChart.JumpLattice.FrameProperties`,
`New.Lift.KummerChart.JumpLattice.frame_theorem`, `New.Lift.KummerChart.JumpLattice.kisinAinf_eq_span_kisinModule`,
`New.Lift.KummerChart.JumpLattice.exists_span_eq_kisinModule_linearIndependent`,
`New.Lift.KummerChart.JumpLattice.free_kisinModule`, `New.Lift.KummerChart.JumpLattice.valueFieldPoints_frobKisinAinf_eq_span`,
`New.Lift.KummerChart.JumpLattice.saturateBy_tau_span_kisinModule`)

### 5.9 Kisin modules through crystalline forms, and normalising elements

*Origin:* particular to this proof: membership in `M(L)` and in `N(L)` tested by crystalline forms, and stability of `M(L)` under
the elements of `Γ` that normalise `Γ'`.

*Method of the formal proof:* (b) is proved with the vectors of 5.8 (i). In one direction `x` is written in terms of
them, and the values of crystalline forms on each vector are bounded. In the other, for `N(L)`, the coefficients of `x`
are replaced by their coordinates at `1` for the retraction of 2.2 (b); the difference is annihilated by every
crystalline form, hence `0` by the divisibility clause 5.8 (e) with `δ = 0`; for `M(L)`, a power of `τ` brings `x` into
`M(L)`, and the values of the crystalline forms allow that power to be divided out there (5.8 (e)). For (c), an element
normalising `Γ'` carries `Γ'`-equivariant forms to `Γ'`-equivariant forms, and it moves `τ` by a unit factor.

(a) Every `ℤ_p`-linear map `L → B_dR` is the restriction to the vectors `1 ⊗ x` of an `A_inf`-linear map `W(C♭) ⊗ L → B_dR`.

(b) `x ∈ M(L)` if and only if `τ^N x ∈ A_inf ⊗ L` for some `N` and there is `n` such that `E^n λ(x)` is the image of an element of `B⁺` for
every crystalline form `λ`. `x ∈ N(L)` if and only if `τ^N x ∈ A_inf ⊗ L` for some `N` and there is `n` such that `E^n λ(x)` is the image of
an element of `S_B` for every crystalline form `λ`.

(c) If `g ∈ Γ` satisfies `gΓ'g^{−1} ⊆ Γ'`, then `y ↦ j(g)^{−1}λ(g·y)` is a form for every form `λ`, and `g` maps `M(L)` into itself.

*Needs:* 2.2, 5.8

[ShortProof], `Lib/PadicHodge/Kisin/FrameTheorem.lean` (`New.Lift.KummerChart.JumpLattice.exists_functional_extend`,
`New.Lift.KummerChart.JumpLattice.equivariant_iff_basisValues`, `New.Lift.KummerChart.JumpLattice.mem_kisinAinf_iff_crysForms`,
`New.Lift.KummerChart.JumpLattice.mem_kisinModule_iff_crysForms`, `New.Lift.KummerChart.JumpLattice.conjForm_mem_forms`,
`New.Lift.KummerChart.JumpLattice.smul_mem_kisinAinf`)

## Layer 6: Limits of crystalline representations

### 6.1 A uniform bound for the periods of crystalline lattices

*Origin:* adapted from Dwork's trick as used in Kisin (2006), Kisin (2008) and Bhatt–Scholze (2023) (see 5.5): here a
single element of `A_max`, depending only on the group and on `h`, is a common denominator for the periods of every
crystalline `ℤ_p`-lattice with jumps in `[0, h]`.

*Method of the formal proof:* a period matrix (5.3) over the Kummer chart of `Γ` (2.4) has entries in `B⁺`; its frame (5.4)
and the radius lemma (5.5) after a number of Frobenius steps depending only on the chart bring it, after a change of basis
fixed by `j(Γ)`, into `A_max`, with a denominator depending only on `h` and the chart.

Let `(Γ, j)` be a group over `G_p` and `h ≥ 0`. There is `a ∈ A_max`, a unit in `B_max`, such that for every free `ℤ_p`-module `T` of finite
rank with basis `e` and every crystalline action `ρ` on `T` whose jumps at `ℤ_p ⊂ ℂ_p` lie in `[0, h]`: (a) `a ⊗ x` lies in the
`A_max`-span of the `Γ`-invariant elements of `A_max ⊗ T` for every `x ∈ T`; (b) there are `U, U' ∈ M_d(A_max)` with `UU' = a·1` and
`M_e(ρ(g))·j(g)(U) = U` for every `g ∈ Γ`.

*Needs:* 2.4, 5.3, 5.4, 5.5

[ShortProof], `Lib/PadicHodge/Limit/CrystallineLimit.lean` (`New.Period.periodTensorMap_injective`,
`New.Period.IsCrystallineUpTo`, `New.Lift.uniform_period_bound`)

### 6.2 Limits of crystalline lattices with bounded jumps

*Origin:* adapted from Berger, *Limites de représentations cristallines* (2004), and Liu, *Torsion p-adic Galois
representations and a conjecture of Fontaine* (2007), on limits of crystalline representations whose Hodge–Tate weights
lie in a fixed interval, and from Wake–Wang-Erickson, *Deformation conditions for pseudorepresentations* (2019), for
going over from traces to quotients of the group ring: here for a limit through the images of the group ring, with a
non-degenerate trace form, and for `B_max`.

*Method of the formal proof:* (c) compares the image `T` of `ℤ_p[G]` under `R` with its images `T_k` under finitely many
of the families: by (b) these can be chosen so that `T/p^k T` is a quotient of `T_k`, and by (a) each `T_k` is a
crystalline lattice with jumps in `[0, h]`. The element of 6.1 is then a common denominator for the invariant periods of
all the `T_k`. Since these invariants are finite free over the constants of a chart (2.4), separation and completeness
of free `A_max`-modules carry the spanning property to `A_max ⊗ T`, so `T` is crystalline.

Let `G` be a compact topological group, `(Δ, j)` a group over `G_p` and `w : Δ → ℤ_p[G]` a monoid homomorphism (multiplicative, with
`w(1) = 1`); a representation `σ` of `G` over `ℚ̄_p`, extended linearly to `ℤ_p[G]`, gives the representation `σ∘w` of `Δ`.

(a) (*finite quotients of the group ring*) For finitely many continuous representations `τ_s` of `G` over `ℚ̄_p`, the image `T` of
`ℤ_p[G]` in `Π_s M_{m_s}(ℚ̄_p)`, `m_s` the size of `τ_s`, is a free `ℤ_p`-module of finite rank, the kernel of `ℤ_p[G] → T` is the
common kernel of the `τ_s`, and if every `τ_s∘w` is crystalline with jumps in `[0, h]`, so is `Δ` acting on `T` by left
multiplication through `w`.

(b) (*traces define the topology*) Let `R : G → GL_m(ℚ̄_p)` be continuous with non-degenerate trace form: an element `x` of the
`ℚ̄_p`-span of the `R(g)` with `tr(x·R(g)) = 0` for all `g` is `0`. Let `T` be a free `ℤ_p`-algebra of finite rank, a quotient of
`ℤ_p[G]` whose kernel contains that of `R`, with `u : T → M_m(ℚ̄_p)` such that `R` factors as `u` after the quotient. For every `k` there is `ε > 0` with
`t ∈ p^k T` whenever `|tr(u(t)·R(g))| ≤ ε` for all `g`.

(c) (*the limit theorem*) Let `R` be as in (b) and `(X_η)` families, each finite, of continuous representations of `G` over `ℚ̄_p`
with every `X_{η,x}∘w` crystalline with jumps in `[0, h]`. Suppose that for every `ε > 0` there is `η` with `|tr R(y)| ≤ ε` for every
`y ∈ ℤ_p[G]` that acts as `0` in all members of `X_η`. Then `R∘w` is crystalline.

LocalGaloisDeformationRings §3.5 (potentially semistable quotients of a family over a complete local base) does not state
this limit theorem.

*Needs:* 2.4, 3.4, 3.6, 6.1

[ShortProof], `Lib/PadicHodge/Limit/CrystallineLimit.lean` (`New.Period.PadicRep`, `New.Period.groupRingHom`,
`New.Period.viaGroupRing`, `New.Period.IsFiniteGroupRingQuotient`, `New.Period.exists_finite_groupRing_quotient`,
`New.Period.exists_pos_mem_pow_of_norm_trace_le`, `New.Period.finite_free_of_fixed_periods`,
`New.Period.isCrystalline_of_trace_limit`)

### 6.3 Hodge–Tate projectors with bounded denominators

*Origin:* particular to this proof: for the crystalline lattices of a fixed group with jumps in `[0, n]`, the
multiplicity of a jump `w` of a representation `r` that they map to is read off from traces, as a constant `t`
depending only on the group, `n` and `w`, times a sum of traces with coefficients in the closed unit disc.

*Method of the formal proof:* (b) conjugates the diagonal idempotent of the jump `w` by the Hodge frame of `T` (3.3) to
obtain a projector; the coordinates of its value at `x` have denominators controlled, uniformly in `T`, by the period
bound of 6.1 together with (a). Applying `θ` and then `u` turns this projector into the projector of `r` onto its jump
`w`, and taking traces gives the multiplicity.

(a) Let `O` be the integers of a finite Galois extension of `ℚ_p` in `ℚ̄_p`, and `e ∈ A_max` with nonzero image in `B_dR`. There is
`κ ∈ B_dR⁺` with `θ(κ) ≠ 0` and `|θ(κz)| ≤ 1` for every `z ∈ B_dR⁺` such that `e·z` is the image of an element of `A_max ⊗ O`.

(b) Let `(Γ, j)` be a group over `G_p`, `n ≥ 0` and `w ∈ ℤ`. There is `t ∈ ℂ_p` such that for every free `ℤ_p`-module `T` of finite rank with
basis `(ε_s)`, every crystalline action `ρ` on `T` with jumps in `[0, n]` and every `x ∈ T`, there are `z_s ∈ ℂ_p` with `|z_s| ≤ 1` such
that: for every `γ : ℚ̄_p → ℂ_p`, every potentially crystalline `r : Γ → GL_m(ℚ̄_p)` and every `ℤ_p`-linear `u : T → M_m(ℚ̄_p)` with
`u(ρ(g)y) = r(g)·u(y)` and `u(x) = 1`, one has `t·Σ_s z_s·γ(tr u(ε_s)) = jump_γ(r, w)`.

*Needs:* 1.4, 1.5, 3.3, 6.1

[ShortProof], `Lib/PadicHodge/Limit/TraceLimit.lean` (`New.Period.exists_norm_thetaBdR_mul_le`,
`New.Period.exists_uniform_trace_sum_eq_jump`)

### 6.4 Local conditions at limits of traces

*Origin:* adapted from Berger (2004), Liu (2007) and Wake–Wang-Erickson (2019), as in 6.2: here at a place of a number
field, for a representation whose trace is approximated uniformly by linear combinations of traces of good
representations, with no bound on the coefficients or the ranks, and with limit formulas for the Hodge–Tate jumps and
for polynomials killing a Weil element.

*Method of the formal proof:* above `ℓ`, a twist (3.2) by a power `χ^{−d}` of the cyclotomic character, with `d` larger
than all the jumps involved, places every `ρ_{η,i}` among the crystalline representations with jumps in `[0, 2d]`,
and 6.2 (c), applied through the monoid map `g ↦ χ(g)^{−d}[g]` into the group ring, shows that the twist of `r` is
crystalline, hence `r` (3.2). The limit formula (b) for the jumps comes from 6.3 (b), whose constant does not depend on
the lattice and whose coefficients have norm at most `1`. For (c), the operators `β` of the powers of a Weil element are
controlled on all the twisted lattices with one common denominator (6.1); evaluating linear forms on `A_max` expresses
the vanishing of a polynomial in `β` through elements of the group ring, and these expressions survive the limit. Away
from `ℓ`, the non-degenerate trace form of `r` carries the corresponding relations in the group ring to `r`.

Let `E` be a number field in a fixed algebraic closure `Ω` of `ℚ`, `ℓ` a prime, `ι : ℂ ≃ ℚ̄_ℓ` a fixed field isomorphism, and `A` a
place of `Ω` above a finite place of `E`. If `A` lies above `ℓ`, each embedding `e : Ω → ℚ̄_ℓ` inducing `A` makes the decomposition
group `D_A` a group over `G_ℓ`; every condition below on `σ|_{D_A}` is asked, and every conclusion on `r|_{D_A}` holds, for each such
`e`. For such `e` and `g ∈ G_ℓ`, let `γ_g : ℚ̄_ℓ → ℂ_ℓ` be `g` followed by the inclusion and `τ_{e,g} = ι^{−1}∘g^{−1}∘e|_E`, an embedding
`E → ℂ`. For a representation `σ : Gal(Ω/E) → GL(ℚ̄_ℓ)` and a polynomial `P` over `ℚ̄_ℓ`, *`σ` is good at `A`*, *`P` kills `s` at `A`*
on `σ` and *the jumps of `σ` at `A` are `J`* are as in GaloisRepresentationsOfUnitaryEigenforms §1.3 (good; kills; has the jumps).
For a relation `R` on `ℕ` and a family `J` of multisets `J_τ` of integers, one for each embedding `τ : E → ℂ`, the jumps of `σ` at `A`
are *`R`-related to `J`* if `R(mult_u(J_{τ_{e,g}}), jump_{γ_g}(σ|_{D_A}, u))` holds for every `e` inducing `A`, every `g ∈ G_ℓ` and every
`u ∈ ℤ`, `mult_u` being the multiplicity of `u`; for `R` the equality this says that the jumps of `σ` at `A` are `J`. (When `A ∤ ℓ` there
is no such `e`, and these conditions on jumps hold for every `σ`.)

Let `r : Gal(Ω/E) → GL_m(ℚ̄_ℓ)`, let `F` be a filter on a set `I` all of whose members are nonempty, and for `η ∈ I` let
`ρ_{η,i}` (`i` in a finite set `N_η`) be representations over `ℚ̄_ℓ` and `a_{η,i} ∈ ℚ̄_ℓ`. Assume: `r` is continuous with
non-degenerate trace form; every `ρ_{η,i}` is continuous and good at `A`; `I` is finite, or there is one family `J` of multisets,
indexed by the embeddings `E → ℂ`, such that the jumps of every `ρ_{η,i}` at `A` are `J`; and `Σ_i a_{η,i}·tr ρ_{η,i} → tr r`
uniformly on `Gal(Ω/E)` along `F`. Then:

(a) `r` is good at `A`.

(b) If `A | ℓ`, then for every `γ : ℚ̄_ℓ → ℂ_ℓ` and `w ∈ ℤ`, `Σ_i a_{η,i}·jump_γ(ρ_{η,i}|_{D_A}, w) → jump_γ(r|_{D_A}, w)` along `F`.
Consequently: let `R`, `R'` be relations on `ℕ`, and `J`, `J'_{η,i}` families of multisets of integers indexed by the embeddings
`τ : E → ℂ`, such that the jumps of each `ρ_{η,i}` at `A` are `R'`-related to `J'_{η,i}`, and such that `R(mult_u(J_τ), n)` holds
for every `τ`, every `u ∈ ℤ`, every `n ∈ ℕ` and all natural numbers `x_{η,i}` with `R'(mult_u(J'_{η,i,τ}), x_{η,i})` for all `η`, `i`
and `Σ_i a_{η,i}·x_{η,i} → n` along `F`. Then the jumps of `r` at `A` are `R`-related to `J`.

(c) Let `s ∈ Gal(Ω/E)`, `n ≥ 1`, and `P`, `Q_{η,i}` polynomials over `ℚ̄_ℓ` of degree `< n` such that `Q_{η,i}` kills `s` at `A` on `ρ_{η,i}` and,
for every `l`, `Σ_i a_{η,i}·coeff_l(Q_{η,i})·tr ρ_{η,i} → coeff_l(P)·tr r` uniformly along `F`. Then `P` kills `s` at `A` on `r`.

*Needs:* 3.2, 3.4, 3.7, 6.1, 6.2, 6.3; GaloisRepresentationsOfUnitaryEigenforms §1.3

[ShortProof], `Lib/PadicHodge/Limit/TraceLimit.lean` (`New.GaloisRep.tateTwistHom`,
`New.GaloisRep.finite_setOf_jump_ne_zero`, `New.GaloisRep.isCrystallineUpTo_tateTwistHom`, `New.GaloisRep.IsTraceLimit`,
`New.GaloisRep.IsTraceLimit.exists_isCrystallineUpTo_tateTwistHom`, `New.GaloisRep.IsTraceLimit.isCrystalline`,
`New.GaloisRep.IsTraceLimit.isGoodAt`, `New.GaloisRep.IsTraceLimit.tendsto_jump`, `New.GaloisRep.IsTraceLimit.jumpsRelAt`,
`New.GaloisRep.IsTraceLimit.isKilledBy`, `New.GaloisRep.IsTraceLimit.polyKillsAt`, `New.GaloisRep.local_clauses_of_trace_limit`)

## What the library already provides

- Fontaine's map `θ : W(R♭) → R` and its surjectivity: Mathlib `WittVector.fontaineTheta`, `surjective_fontaineTheta`.
- Definitions of a ring `B_dR⁺` and its localisation `B_dR` by another construction (completion of `W(O♭)[1/p]` along the
  kernel of `θ`): Mathlib `BDeRhamPlus`, `BDeRham`; the properties of 1.4 (d) and 1.5 are not there.

On Tau Ceti's main branch, later than the revision pinned here:

- The kernel of `θ` is generated by `ξ`, for the integers of a complete algebraically closed nonarchimedean field and a
  choice of `ε`: `PreTilt.ker_fontaineTheta_eq_span_xi`, with `TauCeti.Perfectoid.mu`, `TauCeti.Perfectoid.xi` and
  `TauCeti.Perfectoid.mu_eq_xi_mul_frobeniusEquiv_symm`; a parallel form for rings of integral elements of perfectoid
  Tate rings is `TauCeti.Huber.IsRingOfIntegralElements.ker_fontaineTheta_eq_span_cyclotomicXi` (1.2 (b) chooses one
  `ξ`).
- Functoriality of the tilt, of the untilt and of `θ`: `PreTilt.map`, `PreTilt.untilt_natural`,
  `WittVector.theta_natural` (1.1, 1.2 (a)).
- The isometric, jointly continuous action of `G_p` on `ℂ_p`: `UniformSpace.Completion.instMulSemiringAction` with
  `UniformSpace.Completion.algEquiv_smul_def`, `PadicAlgCl.instIsIsometricSMul`,
  `AlgEquiv.continuousSMul_of_isIsometricSMul`, assembled in `TauCeti/NumberTheory/Padics/Complex/GaloisAction.lean`
  (1.1).

## Results taken from other roadmaps

- Ax–Sen–Tate: the elements of `ℂ_p` fixed by a closed subgroup `H ⊆ G_p` form the closure of the fixed field of `H` in `ℚ̄_p`, and those
  fixed by `G_K`, `K/ℚ_p` finite, are the elements of `K`; hence an element fixed by an open subgroup, or by `j(Γ)` for a group over `G_p`,
  is algebraic, and lies in `K_Γ` in the second case: PadicPeriodRings §1.2 (used in 1.6, 2.2 (f), 3.4 (a), 5.7).
- The continuous action of `G_p` on `ℂ_p` by isometric automorphisms: PadicPeriodRings §1.1 (used in 1.1).
- Corestriction and Shapiro's lemma for continuous cohomology of profinite groups: ProfiniteCohomology §§6.2, 7.2 (used in
  4.1 (d)).

## Downstream consumers

- SelmerBoundsForAnticyclotomicTwists uses the rank of the crystalline cocycles (4.2), the Artin–Schreier sequence (4.3)
  and the frame theorem for Kisin modules with its stability under normalising elements (5.8, 5.9) for the local loss and
  the lifting of crystalline extension classes in large weight.
- GaloisRepresentationsOfUnitaryEigenforms uses the closure properties, jumps and linear Frobenius (3.2–3.7), the
  characters of 4.4, the twists of 4.5 and the limit theorems of Layer 6 for the local behaviour above `ℓ` of the Galois
  representations of eigenforms.
- IdelicReciprocityCountsAndCyclotomicClassGroups uses Layer 3 and 4.1–4.2 for local duality of crystalline cocycles, and 4.4
  for the `ℓ`-adic avatars of algebraic Hecke characters at places above `ℓ` where the infinity type vanishes.
- PadicComparisonForFunctorCohomology uses the period rings of Layer 1, the module `W(C♭)` of 4.3, and the crystalline
  representations and linear Frobenius of 3.1 and 3.7.
- AbelianSchemesWithThetaStructuresAndTheirCohomology uses 3.1 and 3.7 for the Galois representations cut out of
  cohomology by an eigensystem.
- CongruencesOfTwistedThetaLifts uses 4.2 (c) for the cocycles of Tate twists.

## Scope and ownership

### Owned here

- the period rings `A_inf`, `A_max`, `B⁺`, `B_max`, `B_dR⁺`, `B_dR` over `ℂ_p`, the period `t`, the fundamental exact sequence for
  `B_max`, Tate's vanishing of `H⁰(U, ℂ_p(i))`, Hodge–Tate elimination and the invariants of `B_dR` (Layer 1);
- charts and Kummer charts in `A_inf`, the ring `S_B`, and ratios of periods (Layer 2);
- `B_max`-admissibility, crystalline and potentially crystalline representations, Hodge–Tate jumps, the linear Frobenius,
  and their properties (Layer 3);
- crystalline cocycles and their rank, the Artin–Schreier sequence over the tilt, characters trivial on inertia near `1`,
  and twists by characters in local form (Layer 4);
- period matrices, frames, the radius lemma, jump lattices and Kisin modules of Kummer charts (Layer 5);
- the uniform period bound and the passage of crystallinity, jumps and killing polynomials to limits of traces (Layer 6).

### Not owned here

- the `ℓ`-adic avatar of an algebraic Hecke character: IdelicReciprocityCountsAndCyclotomicClassGroups §9.1; its local
  behaviour at every finite place: GaloisRepresentationsOfUnitaryEigenforms §6.4 (e);
- the local conditions of an `ℓ`-adic Galois representation at a place of a number field, and their passage to retracts:
  GaloisRepresentationsOfUnitaryEigenforms §§1.3, 1.4;
- local duality for crystalline cocycles: IdelicReciprocityCountsAndCyclotomicClassGroups §§5.1, 5.2;
- the comparison of the route's cohomology with `B_max`-crystalline representations: PadicComparisonForFunctorCohomology
  §§5.5, 7.6;
- Ax–Sen–Tate (PadicPeriodRings §1.2), and the comparison of `B_max` with `B_cris`, which the route does not use.

## References

- `[ShortProof]`: the folder `grh` of <https://github.com/lsernau/grh-lean> at commit
  `72fead102f663d5c7a407964a13dc0cf9d977207`; this roadmap covers `src/Lib/PadicHodge`, apart from the `ℓ`-adic
  avatars of algebraic Hecke characters in `Lib/PadicHodge/Characters.lean` and their local behaviour, which
  IdelicReciprocityCountsAndCyclotomicClassGroups §9.1 and GaloisRepresentationsOfUnitaryEigenforms §6.4 (e) state.
- L. Berger, *Limites de représentations cristallines*, Compositio Math. 140 (2004), 1473–1498.
- B. Bhatt, M. Morrow, P. Scholze, *Integral p-adic Hodge theory*, Publ. Math. IHÉS 128 (2018).
- B. Bhatt, P. Scholze, *Prismatic F-crystals and crystalline Galois representations* (2023).
- S. Bloch, K. Kato, *L-functions and Tamagawa numbers of motives*, Grothendieck Festschrift I (1990).
- O. Brinon, B. Conrad, *CMI Summer School notes on p-adic Hodge theory* (2009).
- X. Caruso, *An introduction to p-adic period rings* (2019).
- P. Colmez, *Théorie d'Iwasawa des représentations de de Rham d'un corps local*, Ann. of Math. 148 (1998).
- B. Conrad, *Lifting global representations with local properties*, preprint (2011).
- J.-M. Fontaine, *Le corps des périodes p-adiques*, Astérisque 223 (1994).
- J.-M. Fontaine, *Représentations p-adiques semi-stables*, Astérisque 223 (1994), Exp. III.
- J.-M. Fontaine, *Représentations ℓ-adiques potentiellement semi-stables*, Astérisque 223 (1994), Exp. VIII.
- L. Herr, *Sur la cohomologie galoisienne des corps p-adiques*, Bull. Soc. Math. France 126 (1998), 563–600.
- M. Kisin, *Crystalline representations and F-crystals*, Progr. Math. 253 (2006).
- M. Kisin, *Potentially semi-stable deformation rings*, J. Amer. Math. Soc. 21 (2008).
- T. Liu, *Torsion p-adic Galois representations and a conjecture of Fontaine*, Ann. Sci. ENS 40 (2007), 633–674.
- J.-P. Serre, *Abelian ℓ-adic representations and elliptic curves* (1968).
- J. Tate, *p-divisible groups* (1967).
- N. Wach, *Représentations p-adiques potentiellement cristallines*, Bull. Soc. Math. France 124 (1996), 375–400.
- P. Wake, C. Wang-Erickson, *Deformation conditions for pseudorepresentations*, Forum Math. Sigma 7 (2019).
