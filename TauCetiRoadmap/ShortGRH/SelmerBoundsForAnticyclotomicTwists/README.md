# Roadmap: Selmer bounds for anticyclotomic twists

**Summary.** The argument proves a one-sided bound for a sum over primes, and that bound gives a half-plane free of zeros. The bound
comes from comparing an upper and a lower bound for the covolume of a lattice of theta lifts. The lower bound needs, at
each prime `ℓ`, that the orthogonal projection of integral forms onto the lifts has small `ℓ`-adic denominators. By
Ribet's method (CongruencesOfTwistedThetaLifts) such a denominator is bounded by three kinds of quantities: lengths of
Selmer groups of twisted main summands, a local loss at the places above `ℓ`, and valuations of ratios of twisted to
untwisted Hecke `L`-values. This roadmap bounds all three.

It proves two things. First, for finitely many `ℓ`-adic representations of main-summand type there is one tame
anticyclotomic character `τ` of `U(1)` such that every power `τ^j`, `1 ≤ j ≤ m`, has small ramification, makes all the
twisted Selmer groups short, and keeps the ratios of `L`-values barely divisible by `ℓ` (Layers 1, 2 and 5). The route
works with Selmer groups modulo `ℓ^M` cut out by linear relations on cocycles. Auxiliary primes are added one at a time,
each with a linear tie between the values of a cocycle at a tame generator and at a Frobenius element (the descent). All
twists are then written as one system of equations over a polynomial ring. Restricting to a line and specialising at
roots of unity of `ℓ`-power order gives the twist. The `L`-values enter through Stickelberger systems: integral elements
of group rings of class groups of `U(1)` with Euler-factor norm relations. Second, at a place above `ℓ`, it bounds the
length by which the crystalline cocycles of the dual of a summand fail to be orthogonal, under cup products, to the
crystalline cocycles of a class of lattices whose Hodge–Tate jumps lie in windows near `0` and near large weights (Layers
3 and 4). The bound is explicit, linear in the rank of the lattice and uniform in `ℓ`; the power of `ℓ` that makes the
cup products vanish does not depend on the rank in the essential cases. The proof uses Kisin modules over Kummer charts.

## Conventions and notation

The data of the argument are those of OneSidedPrimeSumBoundsAndAdmissibleData §2.1 (the parameters), §2.2 (the field and
its infinite places), §3.2 (admissible data: ranks, weights, places, level), §3.3 (sizes) and §3.4 (tame characters and
twists); the letters below follow it, except where the table says otherwise. Layers 1–3 do not use the data: they hold for
any CM field and any prime. Sections 4.1, 4.2, 4.6, 4.8 (b) and Layer 5 are stated on the data; 4.3–4.5, 4.7 and
4.8 (a) are general statements about lattices over a local Galois group, placed in Layer 4 because the local loss is
their use.

**Galois groups and cocycles.** `Ω` is an algebraic closure of `ℚ`, and every number field is a subfield of `Ω`. For a CM
field `E`, `G_E = Gal(Ω/E)`, `c` is a fixed complex conjugation, `g^c = cgc`, and `g^{−c} = (g^c)^{−1}`. For a finite place
`v` of `E`, `D_v` and `I_v` are the decomposition and inertia groups of a chosen place of `Ω` above `v`. A *Frobenius
element* at a place `A` of `Ω` above `v` stabilises `A` and acts on residues as `x ↦ x^{Nv}`. A *tame generator* is a
chosen element of `I_v` that multiplies an `n`-th root of a uniformiser by a fixed primitive `n`-th root of unity, for
every `n` prime to `v`. `[g, h] = g h g^{−1} h^{−1}`. A matrix representation `ρ : G_E → M_n(O)` acts on `B^n` for every
`O`-module `B`. A *cocycle* is a function `z : G_E → B^n` with `z(gh) = z(g) + ρ(g)z(h)`; it is *unramified outside* a set
`S` of finite places if it vanishes on the inertia groups above all finite places not in `S`. A *relation* is a finitely
supported function `f : G_E → M_n(O)`, and `z` *obeys* `f` if `Σ_g f(g)z(g) = 0`.

**Frobenius elements, the cyclotomic character and Hodge–Tate jumps.** Frobenius elements in this roadmap are
arithmetic, as just defined; CongruencesOfTwistedThetaLifts uses the inverse, the geometric Frobenius element, and says
so where it matters. The `ℓ`-adic cyclotomic character is written `χ` here (1.1); CongruencesOfTwistedThetaLifts writes
`cyc` for it and `χ` for its inverse. The sign of Hodge–Tate jumps is the one of 3.1: the jump `u` is counted by the
semilinear maps `f` with `f(gx) = χ(g)^{−u}·g(f(x))`, so the cyclotomic character has the jump `−1` and its inverse the
jump `1`. Both roadmaps use this sign.

**Characters for a modulus.** For sets `S`, `Q` of finite places of `E`, a homomorphism `χ` from `G_E` to a commutative
monoid is a *character for `Q` relative to `S`* if it is locally constant and `χ(Art x) = η(x/x̄)` for a character `η` of
the finite ideles that is trivial on `E^×` and on the ideles that are units off `S ∪ S̄` and `≡ 1` at the places of
`Q ∖ (S ∪ S̄)`. Such a `χ` is anticyclotomic, unramified outside `Q ∪ Q̄`, and trivial on the decomposition groups above
`S`. "A character for `Q`" means relative to the places above `ℓ`.

**Coefficients, lengths, valuations.** `ℓ` is a prime. A *coefficient ring* is the ring of integers `O` of a finite Galois
extension of `ℚ_ℓ` inside `ℚ̄_ℓ`, with residue field `k_O`. "For all large `O`" means for all coefficient rings containing a
given one. `len_O` is the length over `O`, possibly infinite. `len_ℓ = len_O / len_O(O/ℓ)` is the normalised length, so
that `O/ℓ` has length `1`. `len(X/Y)` for submodules `X, Y` means `len(X/(X ∩ Y))`. `v_O` is the normalised valuation of
`O`. `v` on `ℚ̄_ℓ` is `max(−log_ℓ |x|, 0)`, so `v(ℓ) = 1`, `v(0) = ∞`, and `v` is cut off at `0`. `ℤ̄_ℓ` is the ring of
integral elements of `ℚ̄_ℓ`. `ι : ℂ ≅ ℚ̄_ℓ` is a fixed isomorphism when `ℓ`-adic avatars or `ℓ`-adic sizes of complex
numbers occur.

| Symbol | Meaning |
|---|---|
| `E` | a CM field in `Ω` (in Layers 4–5 the field of the data, `E = K(ζ)` with `K = ℚ(√−d)`) |
| `S₀`, `g₀` | a finite set of finite places, and an element of `G_E` inertial at a place of `S₀` not above `ℓ` |
| `T = (ρ, S_T, (Z_w), γ_*, ζ_*)` | a Selmer datum (1.1) |
| `β_T` | the number of a Selmer datum: global term plus local terms (1.1) |
| `H_T` | the group generated by all `[g, γ_*]` and `[g, γ_*^c]` (1.1) |
| `J`, `P₀` | a set of tied primes and its first prime (1.1) |
| `φ_v`, `γ_v`, `λ_v`, `s_v(i)` | Frobenius element, tame generator, character to `ℤ/ℓ^N` and slopes at `v ∈ J` |
| `ψ_X`, `Sel(x)` | the polynomial twist `∏_j(1 + X_j)^{h_j}` and the Selmer module of the twist at a point `x` (2.1) |
| `Θ_Q`, `ϑ`, `β_Y` | the elements, the character and the number of a Stickelberger system `Y` (2.3) |
| `Cl_Q` | norm-one finite ideles modulo `E^×` and the units `≡ 1` at `Q` (2.3) |
| `v_ρ` | Gauss valuation `v_ρ(Σ_i y_i Y^i) = min_i (v(y_i) + ρ i)` |
| `Γ`, `j` | a group with a homomorphism `j : Γ → G_{ℚ_p}` of open image (Layer 3) |
| `Z_f(L)` | crystalline cocycles of a lattice `L` (3.1) |
| `𝒞(F, K, U)` | a class of lattices: admissibility, allowed jumps, polynomials killing inertia (3.1) |
| `L^{⊥𝒬}`, `δ_𝒬(L)` | the cup-orthogonal module and the dual defect (3.1) |
| `k`, `e`, `f`, `d` | a Kummer chart, its ramification index, residue degree and `d = 0` if `e = 1`, `v_p(e) + 1` otherwise (3.2) |
| `m`, `r`, `k_D`, `t` | the number of lifts, the rank, `k_D = r + 1 − m`, `t = 5r` (OneSidedPrimeSumBoundsAndAdmissibleData §3.2, there `k` for `k_D`) |
| `b`, `G_off` | the weight at the b-places, and the weight `a/x₁` at the other places (OneSidedPrimeSumBoundsAndAdmissibleData §3.2, the weight `κ`) |
| `h₂`, `Δ` | half the gap, `h₂ = r^8`, and the gap `Δ = 2h₂` (OneSidedPrimeSumBoundsAndAdmissibleData §3.2, there `Δ/2` for `h₂`) |
| `w_j(σ)` | the weight of the `j`-th lift at the infinite place of `σ` (OneSidedPrimeSumBoundsAndAdmissibleData §3.2, there `κ_j`) |
| `p₀`, `p₁`, `M`, `N` | the two level primes, `M = p₀p₁`, and the level (OneSidedPrimeSumBoundsAndAdmissibleData §3.2) |
| `f_D` | the number of infinite places of `E` (OneSidedPrimeSumBoundsAndAdmissibleData §2.2, there `f`) |
| chosen places | the places dividing the fixed element `π_M` of `E` (DivisibilityOfThetaDerivatives §1.5) |
| bad places | the places dividing `ℓ p₀ p₁ N` (CongruencesOfTwistedThetaLifts §1.1, which fixes the notion of its Conventions) |
| `n_GL` | the order of `∏ GL_{rt}` over the residue fields of the chosen places (so named in the Conventions of CongruencesOfTwistedThetaLifts; the product occurs in ThetaLiftChainsAndTheSeesawIdentity §2.10 (b)) |
| `e'_ℓ` | `(4f_D + 3) r v_ℓ(n_GL) + 2^{−ℓ}` (CongruencesOfTwistedThetaLifts §1.5, the twist allowance) |
| `ε(σ)` | `+1` if the complex embedding `σ` of `E` lies in the CM type, `−1` otherwise (4.1) |

A *pair* `(ν, z)` is a character `ν` of `U(1)(𝔸)` of weight `−c` and an integer `1 ≤ z ≤ t` with `z ≤ c ≤ 4b`
(DivisibilityOfThetaDerivatives §1.6 (b)); it is *ramified* if its tame part is nontrivial exactly at the chosen places
(DeterminantsOfThetaLiftChains §1.1 (a)). Its *ratio* at a tame character `ϑ` and a sign `s` is
`|L(z, (νϑ^s)^{−1})| / |L(z, ν^{−1})|`, the Euler factors at the chosen places, in the numerator also at the modulus of
`ϑ`, and at their conjugates being omitted (DeterminantsOfThetaLiftChains §1.1 (b)). Tame characters of `U(1)`, twists and
`m`-fold twists are those of OneSidedPrimeSumBoundsAndAdmissibleData §3.4.

## Layer 1: Selmer data and the descent

A Galois lattice over a CM field with local conditions above `ℓ` and an inertial element acting by a scalar. Auxiliary
primes are added one at a time, each with a tie between the values of a cocycle at its tame generator and at its
Frobenius element, until the tied Selmer groups modulo `ℓ^M` of finitely many lattices are bounded by their global and
local terms.

### 1.1 Selmer data, tied primes and tied Selmer groups

*Origin:* definitions and conventions.

Let `E` be a CM field, `ℓ` a prime, `O` the ring of integers of a finite extension of `ℚ_ℓ`, `S₀` a finite set of finite
places of `E` and `g₀ ∈ G_E`.

- For `ρ : G_E → M_n(O)` and `a ∈ O ∖ {0}`, let `W_a = (O/a)^n` and let `W_a^{*c}` be `Hom(W_a, ℚ/ℤ)` with `g` acting by
  `y ↦ χ(g^c)·y∘ρ((g^c)^{−1})`, where `χ` is the `ℓ`-adic cyclotomic character. The *global term* of `ρ` is
  `sup_{a≠0} len_O Hom_{G_E}(W_a, W_a^{*c})`. The *local term* at a finite place `v ∤ ℓ` is the supremum over `a ≠ 0` of
  `len_O(C_v(W_a)) − len_O(W_a)`, where `C_v(W_a)` is the module of restrictions to `D_v` of the locally constant cocycles
  `G_E → W_a`. For a finite set `S`, the *places term* is the sum of the local terms at the places of `S` not above `ℓ`. The
  *first-prime term* for `g₀` is `v_O(det(ρ(g₀) − 1)) + v_O(det(ρ(g₀^{−c}) − 1))`.
- A *Selmer datum* `T` for `(S₀, g₀)` consists of the following. A homomorphism `ρ : G_E → M_n(O)`, `n ≥ 1`, whose
  reductions modulo every `ℓ^M` are locally constant. A finite set `S_T ⊆ S₀` that contains the places above `ℓ`, such
  that `ρ` is trivial on the inertia groups above the places outside `S_T`. For each `w | ℓ`, a finitely generated
  `O`-module `Z_w` of cocycles `D_w → O^n` that contains the coboundaries. An element `γ_*` inertial at a place of `S_T` not
  above `ℓ`, and `ζ_* ∈ O`. These are subject to five conditions: the `O`-span of `ρ(G_E)` is `M_n(O)`;
  `Σ_{w|ℓ} rank_O Z_w ≤ (#{w | ℓ} + f)·n`, where `f` is the number of infinite places of `E`; `ρ(γ_*) = ρ(γ_*^{−c}) = ζ_*·1`;
  `ζ_*² − 1` is a unit; and the global term, the places term of `S_T` and the first-prime term are finite. The *number* of `T` is
  `β_T = ` global term `+` places term `+` first-prime term.
- The *local relations* of `T` are the relations `f`, supported on some `D_w`, `w | ℓ`, that every member of `Z_w` obeys.
  `H_T` is the subgroup of `G_E` generated by all `[g, γ_*]` and `[g, γ_*^c]`.
- An *auxiliary set* for `S` is a finite set `I` of finite places of prime norm with `v ∉ S`, `v̄ ∉ S` and `v̄ ∉ I` for `v ∈ I`.
- *Auxiliary prime data* at a prime `P`, for an integer `q` and a set `T'` of places, are a place of `Ω` above `P`, a
  Frobenius element `φ`, the tame generator `γ` at that place, and a homomorphism `λ : G_E → ℤ/q`. They satisfy:
  `NP ≡ 1 (mod q)`, `P ∉ T'`, `P̄ ≠ P`, `λ(γ) = 1`, and `λ` is a character for `{P}` relative to `T'`.
- A *set of tied primes* for `S₀`, a family of conditions `U_i` on `G_E` (one for each datum `i` of a finite family), a
  set `W ⊆ G_E` and a level `N` is a finite set `J` of places with a first prime `P₀ ∈ J`. Each `v ∈ J` carries auxiliary
  prime data `(φ_v, γ_v, λ_v)` for `q = ℓ^N` relative to the places above `ℓ`, and slopes `s_v(i) ∈ O`. They satisfy:
  `J` is auxiliary for `S₀`; for `v ≠ P₀` in `J` and `w ∈ J`, `λ_w(φ_v) = 1` if `w = P₀` and `0` otherwise;
  `φ_{P₀} ∈ W` and `s_{P₀} = 0`; no place of `S₀` and no `v ∈ J ∖ {P₀}` divides `NP₀`; and where `s_v(i) ≠ 0`, `U_i`
  holds at `φ_v` and at `φ_v^{−c}`.
- The *ties* of index `i` on `J` are the relations `z(γ_v) = s_v(i)z(φ_v)` and `z(γ_v^{−c}) = s_v(i)z(φ_v^{−c})`, `v ∈ J`.
- For a set `S` of places, a set `L` of relations and an `O`-module `B`, `Sel(ρ, S, L; B)` is the module of locally
  constant cocycles `G_E → B^n` that are unramified outside `S` and obey `L`. The *tied Selmer group*
  `Sel_{R,J}(T, i; a)` is `Sel(ρ, S_T ∪ R ∪ R̄, L; O/a)`, where `L` consists of the local relations, `z(γ_*) = 0` and the ties of
  index `i` on `J`. `Sel(J) = Sel_{J,J}`.
- For a character `ψ : G_E → O′^×` with `O′ ⊇ O`, the *twisted Selmer group* `Sel_Q(Tψ; B)` is
  `Sel(ψ·ρ, S_T ∪ Q ∪ Q̄, L′; B)`, where `L′` consists of the local relations and `z(γ_*) = 0`. Write
  `len_ℓ Sel_Q(Tψ) ≤ b` if, for all large coefficient rings `O′`, `ψ` takes values in `O′` and
  `len_ℓ Sel_Q(Tψ; Frac(O′)/O′) ≤ b`.
- Given tied primes `(J, P₀)` and an index `i`, a *new auxiliary prime* for `i` is a prime `P` of prime norm with auxiliary
  prime data `(φ, γ, λ)` for `ℓ^N`. It satisfies: `P, P̄ ∉ J ∪ S₀`; `P ∤ NP₀`; the data are auxiliary prime data at `P`
  relative to every set contained in `(J ∖ {P₀}) ∪ {w | ℓ}`; `λ(φ) = 0`; `λ_v(φ) = 1` for `v = P₀` and `0` for the other
  `v ∈ J`; and `U_i` holds at `φ` and `φ^{−c}`.

*Needs:* IdelicReciprocityCountsAndCyclotomicClassGroups §§1.1, 1.4, 2.1, 2.2 (the Artin map of a number field `K`, in the geometric normalisation: the continuous
homomorphism `Art` from the finite ideles of `K` to the abelianised Galois group of `Ω/K` such that, for every
continuous character `χ` of that group with values in `ℚ/ℤ` and every finite idele `a`, `χ(Art(a))` is the product over
the finite places `v` of the values of `χ` at the local Artin symbols of the components `a_v`; the local Artin map at
`v` sends a uniformiser to the class of the inverse of a Frobenius element and a unit to the class of an element of
the inertia group, at the chosen place of `Ω` above `v`. At a place `A` of `Ω` above a finite place `w` of `K`: the
decomposition group and the inertia group; the Frobenius elements, which lie in the decomposition group and act on
the residue field as `x ↦ x^{Nw}`; and a chosen *tame generator*, an element `γ` of the inertia group such that for
every `n` prime to the residue characteristic there are a uniformiser `π ∈ K` at `w` and `y ∈ Ω` with `y^n = π` and
`γ(y)/y` a primitive `n`-th root of unity); GaloisRepresentationsOfUnitaryEigenforms §9.2 (the module of the locally constant cocycles for `ρ` with
values in `B^n` that vanish on the inertia groups above the places outside a set `S` and obey a set `L` of relations;
[ShortProof] `Lib/GaloisRep/Main/SelmerModules.lean` (`New.selmerModule`)).

[ShortProof], `New/Congruences/Selmer/SelmerData.lean` (`New.Selmer.SelmerDatum`, `New.Selmer.SelmerDatum.tiedSelmer`,
`New.Selmer.IsNewAuxiliaryPrime`, `New.Selmer.SelmerDatum.sahGroup`), `New/Congruences/Selmer/AuxiliaryPrimes.lean`
(`New.IsAuxPrimeDataAt`, `New.IsAuxiliary`, `New.Selmer.IsTiedPrimes`, `New.Selmer.tieRelations`),
`New/Congruences/Selmer/Line.lean` (`New.Selmer.SelmerDatum.twistedSelmer`, `New.Selmer.SelmerDatum.TwistedLengthLe`)

### 1.2 Auxiliary primes with a prescribed Frobenius element

*Origin:* adapted from Gras and Munnier (1998), Théorème 1.1: a cyclic extension of degree `p^M`, totally ramified at one
place and unramified elsewhere, exists exactly when the place splits completely in a governing field; here a degree-one
prime with a Frobenius element near a given element of the normal closure of inertia, with an anticyclotomic character
of order `ℓ^N` ramified only at it and its conjugate.

*Method of the formal proof:* take a finite set `T` of places that contains `S`, its conjugate and the places above `ℓ`,
but no other place of `R`, and whose ideles generate the idele classes together with `E^×`. The open subgroup fixing the
`ℓ^N`-th roots of the `T`-units contains `z`. Chebotarev's theorem gives `P` with Frobenius elements in that subgroup and in
`W`. There every `T`-unit is an `ℓ^N`-th power modulo `P`, so the discrete logarithm at `P` descends to idele classes and,
read through `y ↦ y/ȳ`, gives `λ`. The Frobenius element is then corrected by tame inertia so that `λ` vanishes on it.

Let `E` be a CM field, `ℓ` a prime, `N ≥ 0`, `S` a finite set of finite places and `R` a finite set of places of `E`. Let
`z` lie in the normal closure in `G_E` of the union of the inertia groups above the places of
`R ∖ (S ∪ S̄ ∪ {w | ℓ})`, and let `W` be a neighbourhood of `z`. Prove that there are a prime `P ∉ R ∪ R̄` of prime norm and
data `(φ, γ, λ)` with `λ : G_E → ℤ/ℓ^N`, such that `φ ∈ W`, `λ(φ) = 0`, and the data are auxiliary prime data at `P` for
`ℓ^N` relative to every set `T′ ⊆ S ∪ {w | ℓ}`.

*Needs:* 1.1; IdelicReciprocityCountsAndCyclotomicClassGroups §2.3 (Chebotarev's density theorem in its existence form: the Frobenius elements at
primes of degree one outside a finite set are dense in the absolute Galois group; the existence theorem of class
field theory for a totally complex field: a continuous homomorphism from the finite ideles to a `T₁` group that is
trivial on the principal ideles factors through the Artin map).

[ShortProof], `New/Congruences/Selmer/AuxiliaryPrimes.lean` (`New.Selmer.exists_isAuxPrimeDataAt`,
`New.Selmer.exists_anticyclotomicChar_of_frob_fixes_roots`)

### 1.3 Sah's lemma for Selmer data

*Origin:* adapted from Sah's lemma, which is classical (a cocycle that vanishes at an element acting by a scalar `ζ`
with `ζ − 1` a unit is determined by its values on commutators): here for the element `γ_*` of a Selmer datum and its
conjugate, with detection on the abstract group `H_T` and a spanning statement modulo `a`.

*Method of the formal proof:* `γ_*` acts by `ζ_*`, so every commutator with `γ_*` or `γ_*^c` acts trivially; the identity
`[g, γ_*]·γ_*g = gγ_*` and the cocycle rule give (a); `ζ_* − 1` is a unit since `ζ_*² − 1` is, which gives (b). For (c),
reduce to the residue field and apply (b); then the span of `z(H_T)` is stable under `G_E`, because
`z(ghg^{−1}) = ρ(g)z(h)` for `h ∈ H_T` and `H_T` is normal, and it contains a vector with a unit coordinate; since `ρ(G_E)`
spans all matrices, it is everything.

Let `T` be a Selmer datum and `B` an `O`-module. Prove:

1. (a) every cocycle `z : G_E → B^n` with `z(γ_*) = 0` satisfies `z([g, γ_*]) = (1 − ζ_*)z(g)` for all `g ∈ G_E`;
2. (b) a cocycle with `z(γ_*) = 0` that vanishes on `H_T` is zero; and `ρ(h) = 1` for `h ∈ H_T`;
3. (c) for `a ∈ O` with `O/a ≠ 0` and a cocycle `z : G_E → (O/a)^n` with `z(γ_*) = 0` some value of which has a unit
   coordinate, the `O`-span of `z(H_T)` is `(O/a)^n`;
4. (d) if a set `R` of places contains `v` and `v̄` for every `v ∈ S_T` not above `ℓ`, then `H_T` lies in the normal
   closure of the union of the inertia groups above `R`.

*Needs:* 1.1.

[ShortProof], `New/Congruences/Selmer/SelmerData.lean` (`New.Selmer.SelmerDatum.cocycle_commutator_γ`,
`New.Selmer.SelmerDatum.cocycle_eq_zero_of_sahGroup`, `New.Selmer.SelmerDatum.span_image_sahGroup_eq_top`,
`New.Selmer.SelmerDatum.sahGroup_le_normalClosure`)

### 1.4 Adding auxiliary primes

*Origin:* particular to this proof: a new prime with a chosen slope keeps a set of tied primes tied, and new primes
exist whose Frobenius element is close to any element of `γ_{P₀}H_T`.

*Method of the formal proof:* (a) and (b) are checked field by field: a character of a prime in `J` is unramified at the
other primes of `J` and their conjugates, and the character of the new prime vanishes on the decomposition groups at the
old primes other than `P₀`. For (c), `γ_{P₀}h` lies in the normal closure of inertia above a set of places outside
`S₀ ∪ J`, by 1.3 (d), and acts trivially on `T/ℓ^M`. Apply 1.2 to it, with `R` enlarged by the primes of `J`.

Let `(J, P₀)` be a set of tied primes for `S₀`, `(U_i)`, `W` and `N`. Prove:

1. (a) for `v, w ∈ J`, `λ_w(γ_v) = 1` if `w = v` and `0` otherwise;
2. (b) if `P` with data `l` is a new auxiliary prime for `i`, then for every `t ∈ O` the set `J ∪ {P}`, with the data `l`
   and the slope `t` at `P` for `i` and `0` for the other indices, is a set of tied primes with first prime `P₀`;
3. (c) let `T` be a Selmer datum for `(S₀, g₀)` and let `U_i(g)` say that `ρ(g) ≡ 1 (mod ℓ^M)`. For every `h ∈ H_T`, every
   finite set `R` of places and every neighbourhood `X` of `γ_{P₀}h`, there is a new auxiliary prime `P` for `i`, with
   `P, P̄ ∉ R` and Frobenius element in `X`.

*Needs:* 1.1, 1.2, 1.3.

[ShortProof], `New/Congruences/Selmer/SelmerData.lean` (`New.Selmer.IsTiedPrimes.insert_of_isNewAuxiliaryPrime`,
`New.Selmer.IsTiedPrimes.character_tameGenerator_eq_ite`), `New/Congruences/Selmer/Mirror.lean`
(`New.Selmer.SelmerDatum.exists_isNewAuxiliaryPrime`)

### 1.5 The descent

*Origin:* particular to this proof: boundedly many auxiliary primes with ties make the Selmer groups modulo `ℓ^M` of
finitely many Selmer data no longer than their global and local terms; nearest published result: Bertolini and Darmon
(1994), Lemma 2.21 with Definition 2.22 and Lemma 2.23, Chebotarev choices of auxiliary primes that prescribe the
localisation of Selmer classes.

*Method of the formal proof:* start from one prime `P₀` with Frobenius element in `W` and slope `0` (1.2). Let
`ℓ^M = ϖ^e` up to a unit. As long as, for some datum `i`, some level `1 ≤ k ≤ e` and some new auxiliary prime, a tied class
modulo `ϖ^k` has values at `φ, φ^{−c}` that are not the values at `γ, γ^{−c}` of a tied class allowed to ramify at the new
prime, the tilting lemma gives a unit slope. The tilting lemma: for `a` outside at most as many residue classes as the
evaluations have coordinates (`2n` here, the values at an element and at its `−c`-conjugate being taken together), the kernel of
`a·ev_γ − ev_φ` is no longer than the part of the kernel of `ev_γ` that `ev_φ` maps into its image. The size of the residue
field leaves room for this slope. Adding the prime with this slope (1.4 (b)) lowers the total length
`Σ_{i,k} len Sel(J) mod ϖ^k` by at least `1`. When no such prime exists, take a level at which the group has a class with a
unit coordinate (1.3 (c)) and is no shorter. A Greenberg–Wiles count, with relations at split primes in place of dual
cocycles, bounds the tied group by its dual plus the places term. Reciprocity at conjugate primes then bounds the dual by
the global term. For a tied class `z` and a dual element `y`, the form `Ψ(h, h′) = ⟨z(h), y(h′)⟩ − ⟨z(h′^c), y(h^c)⟩`
vanishes on `H_T × H_T`: first on the diagonal, by reciprocity at new primes with Frobenius elements near `γ_{P₀}h`
(1.4 (c)), then everywhere, by conjugation with `γ_*`. So `y` is determined by a `G_E`-map `W_a → W_a^{*c}`. The number of
added primes is bounded by the initial total length.

Let `E` be a CM field, `ℓ` a prime, `O` the ring of integers of a finite extension of `ℚ_ℓ`, `S₀` a finite set of finite
places, `g₀` inertial at a place of `S₀` not above `ℓ`, and `W` a neighbourhood of `g₀`. Let `T_i` (`i` in a finite set)
be Selmer data for `(S₀, g₀)` of ranks `n_i`, and `M ≥ 0` with `#k_O > 2n_i·v_O(ℓ^M) + 1` for all `i`. Prove that there is
`s ≥ 0` such that for every `N > M` there is a set of tied primes `(J, P₀)` for `S₀`, for the conditions
`U_i(g) : ρ_i(g) ≡ 1 (mod ℓ^M)`, for `W` and for `N`, with `#J ≤ s` and

`len_O Sel(J)(T_i, i; ℓ^M) ≤ ` global term of `T_i` `+` places term of `T_i` for every `i`.

*Needs:* 1.1, 1.2, 1.3, 1.4; IdelicReciprocityCountsAndCyclotomicClassGroups §4.5 (global duality for a Galois module `M` over a number field `K`, in
the form with relations at split primes, which stand for the dual Selmer group. A *relation setting* modulo `m ≥ 1`
is: a module `M` killed by `m` and fixed by the complex conjugations; an open normal subgroup `U` of `G_K` that fixes
`M` and the `m`-th roots of unity and contains no complex conjugation; a finite set `S` of primes outside which `M`
is unramified; and for each `v ∈ S` a module of allowed functions from a decomposition group at `v` to `M` that
contains the coboundaries, whose cocycles form `A_v`. `Z(P)` is the module of the cocycles `G_K → M` that are allowed
at each prime of `S`, vanish at the complex conjugations and are unramified outside `S ∪ P`. A *relation off* a
finite set `T` of primes is a locally constant map `y : G_K → Hom(M, ℚ/ℤ)` that vanishes outside `U`, is additive on
`U`, satisfies `y(gug^{−1})(a) = χ_m(g)·y(u)(g^{−1}a)` for `g ∈ G_K`, `u ∈ U`, with `χ_m` the cyclotomic character
modulo `m`, vanishes on the inertia groups above the primes outside `T`, and obeys the reciprocity law
`Σ_P y(φ_P)(z(γ_P)) = 0` for every finite family of distinct primes `P ∉ T`, each with a Frobenius element `φ_P ∈ U`
and a tame generator `γ_P` for `m` at one place above `P`, and every `z ∈ Z(P)`, `P` here the set of these primes. The count, a case of the formula
of Greenberg and Wiles as a lower bound: let `K` be totally complex, `m = ℓ^r` with `r ≥ 1`, `M` finite, and let some
`σ ∈ G_K` fix the `ℓ`-power roots of unity, commute with every element of `G_K` modulo `U`, and fix no nonzero element
of `M`; let `p ≥ 1` be prime to `m`, divisible by no prime of `S`, and such that the inertia groups above the primes
dividing `p` lie in `U`. Then there is a finite set `T ⊇ S` of primes not dividing `p` with
`#Z(∅)·#M^{#S + r₂} ≤ #{relations off T}·#M·∏_{v∈S} #A_v`, `r₂` the number of infinite places of `K`).

[ShortProof], `New/Congruences/Selmer/Descent.lean` (`New.Selmer.exists_isTiedPrimes_card_le_and_length_le`,
`New.Selmer.tilting`, `New.Selmer.exists_slope_totalTiedLength_lt`), `New/Congruences/Selmer/Count.lean`
(`New.Selmer.SelmerDatum.exists_length_tiedSelmer_le`), `New/Congruences/Selmer/Mirror.lean`
(`New.Selmer.SelmerDatum.length_dualSelmer_le`)

## Layer 2: Twists of Selmer data and Stickelberger systems

All twists by products of powers of the characters of the auxiliary primes are written as one system of equations over a
polynomial ring. The lengths of their Selmer groups are read off as valuations of polynomials at the points
`(ζ_𝔮 − 1)_𝔮`. Group-ring elements with Euler-factor norm relations are treated in the same way. A restriction to a line,
followed by a specialisation at roots of unity of `ℓ`-power order, gives one character all of whose first `m` powers are
good.

### 2.1 Polynomial twists and one system of equations

*Origin:* adapted from Mazur and Rubin (2005), building on Nekovář (2006), §6.1 and Theorem 7.8.6: Selmer modules
presented by a matrix; here one matrix over the polynomial ring `O[X_j]`, not square and possibly with infinitely many
rows, whose specialisations present the Selmer modules modulo `ℓ^M` of all twists `∏_j(1 + x_j)^{h_j}` at once, with
lengths read off as least valuations of polynomials.

*Method of the formal proof:* on an open normal subgroup on which all `h_j` vanish and `ρ ≡ 1 (mod ℓ^M)`, every cocycle of
every twist is determined by its values on a finite quotient. The cocycle rule, unramifiedness and the relations are
linear equations over `O[X]` in these values. This gives one matrix `A`, and `Sel(x)` is the kernel of `A(x)`. Over a
discrete valuation ring, the length of the kernel of a matrix on a power of `O′/ℓ^M` is the least valuation of a family of
polynomials built from its maximal minors and `ℓ^M`, which gives (c); a member of that family that attains the least value
at `x₀` gives (d).

Let `σ` be a finite set, `h_j : G_E → ℤ/q` (`j ∈ σ`) locally constant homomorphisms, `ρ : G_E → M_n(O)` a homomorphism that
is locally constant modulo `ℓ^M`, `S` a finite set of finite places and `L` any set of relations. Put
`ψ_X(g) = ∏_j(1 + X_j)^{h_j(g)} ∈ O[X_σ]`, the exponents read in `[0, q)`. For a ring map `e : O → O′` and `x ∈ O′^σ` put
`ρ_x(g) = ψ_x(g)·e(ρ(g))`, which need not be multiplicative. Let `Sel(x)` be the module of locally constant
`z : G_E → (O′/ℓ^M)^n` with `z(gh) = z(g) + ρ_x(g)z(h)`, unramified outside `S` and obeying `e(L)`. Prove:

1. (a) for `q`-th roots of unity `ζ_j`, `ψ_{ζ−1}(g) = ∏_j ζ_j^{h_j(g)}`; and for a set of tied primes `J` with characters
   `h_v = λ_v`, `ψ_X(φ_v) = ψ_X(φ_v^{−c}) = 1 + X_{P₀}` for `v ≠ P₀` and `ψ_X(γ_v) = ψ_X(γ_v^{−c}) = 1 + X_v`;
2. (b) for `a | ℓ^M` with `O/a` finite, `Sel(ρ, S, L; O/a)` is finite;
3. (c) there is a matrix `A` over `O[X_σ]` with finitely many columns `k` such that `Sel(x) ≅ ker(A(x) : (O′/ℓ^M)^k → ⋯)`
   for every `e : O → O′` and every `x ∈ O′^σ`; and there is a set `𝓜 ⊆ O[X_σ]` such that, for every discrete valuation
   ring `O′` of characteristic `0`, every `e` and every `x`, `len_{O′} Sel(x) = min_{P ∈ 𝓜} v_{O′}(e(P)(x))`;
4. (d) for every `(O₀, e₀, x₀)` of this kind there is `P ∈ O[X_σ]` with `v_{O₀}(e₀(P)(x₀)) = len Sel(x₀)` and
   `len_{O′} Sel(x) ≤ v_{O′}(e(P)(x))` at every point over every such `O′`.

*Needs:* 1.1; ShortGRH background (for a matrix `A` over a discrete valuation ring `O` and `a ≠ 0`, the length of the
kernel of `A` on `(O/a)^k` is the least valuation of a maximal minor of the matrix made of the rows of `A` and of
`a·1`; [ShortProof] `Lib/General/Algebra/SharpMinors.lean` (`New.Selmer.isLeast_length_matrixKernel`)).

[ShortProof], `New/Congruences/Selmer/OneSystem.lean` (`New.Selmer.exists_matrix_selmerAtPoint_equiv`,
`New.Selmer.exists_isLeast_length_selmerAtPoint`, `New.Selmer.exists_sharp_polynomial`, `New.Selmer.finite_selmerModule`,
`New.Selmer.IsTiedPrimes.universalChar_frob`, `New.Selmer.IsTiedPrimes.universalChar_tame_gen`)

### 2.2 The failure to be tied

*Origin:* particular to this proof: on the line `X_{P₀} = Y`, `X_v = s_v Y`, the ties at the primes other than the first
cost at most the valuation of `∏ det((1 + Y)ρ(φ_w) − 1)`, and the ties at the first prime cost at most the first-prime term.

*Method of the formal proof:* at a prime of norm `≡ 1 (mod ℓ^N)`, a Frobenius element and a tame generator commute up to
wild inertia and `ℓ^N`-th powers of inertia. Where these act trivially and the cocycle vanishes on them,
`z(γφ) = z(φγ)`, that is, `(φ − 1)z(γ) = (γ − 1)z(φ)` for the twisted action. On the line, `γ_w` acts by `1 + s_v y` times
`ρ(γ_w)` and `φ_w` by `(1 + y)ρ(φ_w)`. So the defect of the tie `z(γ_w) − s_v z(φ_w)` lies in the kernel of
`(1 + y)ρ(φ_w) − 1`, whose length is at most the valuation of its determinant. At `y = 0` the same argument puts
`z(γ_w)`, `w = P₀, P̄₀`, in the kernel of `ρ(φ_w) − 1`.

Let `(J, P₀)` be a set of tied primes for `S₀`, `(U_i)`, `W` and `N ≥ 1`, with characters `λ_v` and slopes `s_v = s_v(i)`.
Let `ρ : G_E → M_n(O)` be trivial modulo `ℓ^M` on the inertia groups above the places outside `S₀` and at every `g` with
`U_i(g)`. Let `S` be a set of places and `L` a set of relations. Prove:

1. (a) let `e : O → O′` with `O′` a discrete valuation ring, and let `y ∈ O′` be such that `ℓ^M` divides
   `Σ_{0≤j<ℓ^N} α^j` for every `α ≡ 1 (mod y)`. At the point `x_{P₀} = y`, `x_v = e(s_v)y` (`v ≠ P₀`), adding to `L` the ties
   of index `i` on `J ∖ {P₀}` lowers `len_{O′} Sel(x)` (2.1, for the characters `λ_v`) by at most `v_{O′}(e(P¹)(y))`, where
   `P¹(Y) = ∏_{v ∈ J∖{P₀}} ∏_{g ∈ {φ_v, φ_v^{−c}}} det((1 + Y)ρ(g) − 1)`;
2. (b) if `M ≤ N` and `ρ(φ_{P₀}) ≡ ρ(g₀)`, `ρ(φ_{P₀}^{−c}) ≡ ρ(g₀^{−c}) (mod ℓ^M)`, then adding the relations
   `z(γ_{P₀}) = 0 = z(γ_{P₀}^{−c})` lowers `len_O Sel(ρ, S, L; O/ℓ^M)` by at most
   `v_O(det(ρ(g₀) − 1)) + v_O(det(ρ(g₀^{−c}) − 1))`.

*Needs:* 1.1, 2.1.

[ShortProof], `New/Congruences/Selmer/Untied.lean` (`New.Selmer.IsTiedPrimes.relLength_tied_le`,
`New.Selmer.IsTiedPrimes.relLength_tieRelations_le_sum_addVal_det`, `New.Selmer.sub_one_smul_eq_of_tame`)

### 2.3 Stickelberger systems

*Origin:* definitions and conventions.

Let `E` be a CM field, `ℓ` a prime, `S₀` a finite set of finite places and `g₀ ∈ G_E`.

- For a finite set `Q` of finite places, `Cl_Q` is the group of finite ideles `u` with `uū = 1`, modulo the norm-one
  elements of `E^×` and the norm-one units that are `≡ 1` at the places of `Q`. The map `y ↦ [y/ȳ]` from finite ideles onto
  `Cl_Q` is surjective (Hilbert 90). For `c ∈ Cl_Q`, fix `g_c ∈ G_E` lifting `Art(y)` for a chosen `y` with `[y/ȳ] = c`. A
  function `F` on `G_E` is evaluated on `Θ = Σ_c a_c[c] ∈ ℤ̄_ℓ[Cl_Q]` by `F(Θ) = Σ_c a_c F(g_c)`. For a character `ψ` for `Q`,
  `ψ(Θ)` does not depend on the choices.
- For a list `ε₁, …, ε_r` of integers, `a ∈ ℚ̄_ℓ` and an integer `q`, the *Euler factor* is
  `Eul(a, q) = ∏_{i ≤ r} ∏_{δ = ±1} (1 − a^δ q^{−ε_i})`.
- A *Stickelberger system* `Y` for `(S₀, g₀)` consists of a continuous character `ϑ : G_E → ℚ̄_ℓ^×` unramified outside `S₀`
  with `ϑ(g₀) ≠ 1`, a list of integers `ε₁, …, ε_r` (the exponents), and for every finite set `Q` an element
  `Θ_Q ∈ ℤ̄_ℓ[Cl_Q]`. These satisfy `1(Θ_∅) ≠ 0` for the trivial character `1`, and the norm relation:
  `ψ(Θ_{Q∪{P}}) = ψ(Θ_Q)·Eul(ϑ(φ)ψ(φ), NP)` whenever `P ∉ Q`, `Q ∪ {P}` is auxiliary for `S₀`, `ψ : G_E → ℚ̄_ℓ` is a
  character for `Q`, and `φ` is a Frobenius element at a place above `P`.
- The *number* of `Y` is `β_Y = v(1(Θ_∅)) + 2r·v(ϑ(g₀) − 1)`; it is finite.

*Needs:* 1.1; GaloisRepresentationsOfUnitaryEigenforms §5.3 (the Artin map on finite ideles, and Hilbert's Theorem 90 for the finite ideles of a
CM field: a finite idele of norm one to the totally real subfield is `x/x̄`).

[ShortProof], `New/Congruences/Selmer/StickelbergerSystems.lean` (`New.Selmer.StickelbergerSystem`,
`New.Selmer.StickelbergerSystem.β`, `New.Selmer.U1ClassGroup`, `New.Selmer.groupRingEval`, `New.Selmer.eulerFactor`)

### 2.4 Stickelberger systems on a line

*Origin:* particular to this proof: the value of the polynomial character `ψ_X` at the element of a Stickelberger system
for a set of tied primes has, at some point whose coordinates have valuation at least `ρ`, valuation at most
`β_Y + s₀ρ`.

*Method of the formal proof:* on the line where every variable but `X_{P₀}` vanishes, the norm relation at the primes of
`J ∖ {P₀}`, whose Frobenius elements have `λ_{P₀} = 1` and `λ_v = 0` for the others, shows that `P(X, 0)` is congruent to
`R₀R₁` up to a power of `1 + X` modulo `(1 + X)^{ℓ^N} − 1`. `R₀` comes from `Θ_{{P₀}}` and has `v(R₀(0)) ≤ β_Y` by (b).
`R₁` comes from the Euler factors and has Gauss valuation at most `2r·#(J ∖ {P₀})·ρ`. When `v_ρ(R₀R₁) < Nρ`, the
congruence and a count of roots give a point `y` with `v(y) ≥ ρ` and `v(P(y)) ≤ v_ρ(R₀R₁)`.

Let `Y` be a Stickelberger system for `(S₀, g₀)` with `r` exponents, and `(J, P₀)` a set of tied primes for `S₀` (any
conditions, any `W`) at level `N`. Let `P = ψ_X(Θ_J) ∈ ℤ̄_ℓ[X_v : v ∈ J]` for `ψ_X = ∏_{v∈J}(1 + X_v)^{λ_v}`. Prove:

1. (a) for disjoint `Q`, `I` with `Q ∪ I` auxiliary for `S₀`, a character `ψ` for `Q` and Frobenius elements `φ_v` at places
   above the `v ∈ I`: `ψ(Θ_{Q∪I}) = ψ(Θ_Q)·∏_{v∈I} Eul(ϑ(φ_v)ψ(φ_v), Nv)`;
2. (b) if `β_Y < M ≤ N` and `v(ϑ(φ_{P₀}) − ϑ(g₀)) ≥ M`, then `v(1(Θ_{{P₀}})) ≤ β_Y`;
3. (c) if `v(ϑ(φ_{P₀}) − ϑ(g₀)) ≥ M`, `β_Y + 1 < M ≤ Nρ`, `s₀ ≥ 1`, `2r·#J ≤ s₀` and `s₀ρ < 1` (`ρ > 0` rational), then
   there is `y ∈ ℤ̄_ℓ^J` with `v(y_v) ≥ ρ` for all `v` and `v(P(y)) ≤ β_Y + s₀ρ`.

*Needs:* 1.1, 2.1, 2.3; ShortGRH background (the Gauss valuation `v_ρ` of a polynomial over `ℤ̄_ℓ`: `v(g(y)) ≥ v_ρ(g)`
if `v(y) ≥ ρ`, with equality at one point for finitely many polynomials at once; `v_ρ` is additive on products and is
given by `v₀(g)` and the valuations of the integral roots; [ShortProof] `Lib/General/NumberTheory/GaussValuation.lean`
(`New.Selmer.gaussVal`, `New.Selmer.gaussVal_le_eval`, `New.Selmer.exists_forall_ellVal_eval_eq_gaussVal`,
`New.Selmer.gaussVal_eq_add_sum_roots`)).

[ShortProof], `New/Congruences/Selmer/StickelbergerLine.lean`
(`New.Selmer.StickelbergerSystem.exists_point_ellVal_universalChar_le`,
`New.Selmer.StickelbergerSystem.ellVal_one_element_singleton_le`,
`New.Selmer.StickelbergerSystem.exists_congruence_lineChar_element`), `New/Congruences/Selmer/StickelbergerSystems.lean`
(`New.Selmer.StickelbergerSystem.groupRingEval_element_union`)

### 2.5 Restriction to a line

*Origin:* particular to this proof: for finitely many Selmer data and Stickelberger systems there are `s₀` and, for every
radius `r` with `s₀r < 1` and all large `N`, auxiliary primes with characters to `ℤ/ℓ^N` and, for each datum and system, a
polynomial that controls its twists at `ℓ^N`-th roots of unity and has, at a point of radius `r`, valuation at most
`β + s₀r`.

*Method of the formal proof:* apply the descent (1.5) to all data at once, with the Frobenius element of the first prime
so close to `g₀` that `ρ_i(φ_{P₀}^{±})` agrees with `ρ_i(g₀^{±})` modulo `ℓ^M` and `ϑ_k(φ_{P₀}) ≡ ϑ_k(g₀)` modulo a high
power of `ℓ`. For a datum take `P = P⁰·P¹`. Here `P⁰` is a polynomial sharp at `0` (2.1 (d)) for the module tied at
`J ∖ {P₀}`, restricted to the line; its value at `0` has valuation at most `β_T` by 2.2 (b) and the descent. `P¹` is the
polynomial of 2.2 (a), whose Gauss valuation of radius `r` is at most `2n·#J·r`. The point is taken on the line at a
parameter that is generic for both. For a system, take 2.4 (c). Since `M > β_T + 1`, a bound below `β_T + 1` for the module
modulo `ℓ^M` bounds the module with divisible coefficients.

Let `E`, `ℓ`, `S₀`, `g₀` be as in 1.5, `O` a coefficient ring, `T_i` (`i` in a finite set) Selmer data for `(S₀, g₀)` over
`O`, and `Y_k` (`k` in a finite set) Stickelberger systems for `(S₀, g₀)`. Let `M` be a *torsion level*:
`len_ℓ β_{T_i} + 1 < M` and `#k_O > 2n_i·v_O(ℓ^M) + 1` for all `i`. Prove that there is `s₀ ≥ 1` such that for every rational
`r > 0` with `s₀r < 1` and all large `N` there are:

- an auxiliary set `Q` for `S₀` with `2#Q ≤ s₀`, and for each `𝔮 ∈ Q` a character `λ_𝔮 : G_E → ℤ/ℓ^N` for `{𝔮}` that is onto
  on inertia at `𝔮`;
- for each datum and each system a polynomial `P ∈ ℤ̄_ℓ[X_𝔮 : 𝔮 ∈ Q]` and a point `x⁰` with `v(x⁰_𝔮) ≥ r` and
  `v(P(x⁰)) ≤ β + s₀r`, where `β = len_ℓ β_{T_i}` for a datum and `β = β_{Y_k}` for a system;

such that, for all `ℓ^N`-th roots of unity `ζ_𝔮`, with `ψ = ∏_𝔮 ζ_𝔮^{λ_𝔮}` and `x = (ζ_𝔮 − 1)_𝔮`: `ψ(Θ_Q) = P(x)` for each
system, and `len_ℓ Sel_Q(T_iψ) ≤ v(P(x))` for each datum with `v(P(x)) < len_ℓ β_{T_i} + 1`.

The formal proof states, as a step, the case of one datum on a given set of tied primes. If the Selmer group modulo `ℓ^M`
tied at `J ∖ {P₀}` has length at most `β_T`, and `2n·#J ≤ s₀`, `r ≤ 1`, `M ≤ Nr`, then some `P` bounds all `Sel(x)` (2.1) and
has `v(P(x⁰)) ≤ len_ℓ β_T + s₀r` at a point of radius `r`.

*Needs:* 1.1, 1.5, 2.1, 2.2, 2.4.

[ShortProof], `New/Congruences/Selmer/Line.lean` (`New.Selmer.exists_twistPolynomials`,
`New.Selmer.exists_boundsSelmer_ellVal_eval_le`, `New.Selmer.TwistPolynomials`, `New.Selmer.IsTorsionLevel`)

### 2.6 Roots of unity at which polynomials are hardly more divisible than at given points

*Origin:* adapted from the classical Newton polygon estimate for the value of a polynomial at `ζ − 1`, `ζ` a root of
unity of `p`-power order, which reads the valuation of the value off the Gauss valuation at the radius `v(ζ − 1)` and
the roots of that valuation: here one tuple of roots of unity of bounded `ℓ`-power order at which each of
finitely many polynomials in at most `s₀` variables loses at most `ε` against its value at a given point of radius `ρ`,
whatever their degrees and number.

*Method of the formal proof:* in one variable, among the exponents `h ≤ h₀` with `ρ_h ≤ ρ`, where `ρ_h = 1/φ(ℓ^h)`, one has
few roots of valuation `ρ_h`. This follows from a harmonic sum: `δ·Σ_h 1/(h + 1)` exceeds `B`. A root of unity of order
`ℓ^h` whose `ζ − 1` is far from those roots then loses at most `δ`. In several variables, one coordinate of all points is
moved at a time, each time with loss `δ = min(ε, 1)/(s₀ + 2)`.

Let `ρ_h = 1/φ(ℓ^h)` and `v_ρ` the Gauss valuation. Prove:

1. (a) let `δ < 1`, `B ≥ 0`, `h₀ ≥ 0` and `ρ > 0` with `B < δ·Σ 1/(h + 1)`, the sum over `1 ≤ h ≤ h₀` with `ρ_h ≤ ρ`. If
   `g ∈ ℤ̄_ℓ[Y]` has `v_ρ(g) ≤ B`, then for one such `h` and some primitive `ℓ^h`-th root of unity `ζ`,
   `v(g(ζ − 1)) ≤ v_{ρ_h}(g) + δ`;
2. (b) given `s₀ ≥ 0`, rational `ρ > 0`, `β ≥ 0` and `ε > 0`, there is `h₀` with the following property. For any finite
   families of polynomials `P_i ∈ ℤ̄_ℓ[X_1, …, X_s]`, `s ≤ s₀`, and points `x_i ∈ ℤ̄_ℓ^s` with all coordinates of valuation at
   least `ρ` and `Σ_i v(P_i(x_i)) ≤ β`, there are `ζ_1, …, ζ_s` with `ζ_j^{ℓ^{h₀}} = 1`, `v(ζ_j − 1) ≤ ρ` and
   `v(P_i((ζ_j − 1)_j)) ≤ v(P_i(x_i)) + ε` for every `i`.

*Needs:* ShortGRH background (the Gauss valuation `v_ρ` of a polynomial over `ℤ̄_ℓ`: `v(g(y)) ≥ v_ρ(g)` if `v(y) ≥ ρ`,
with equality at one point for finitely many polynomials at once; `v_ρ` is additive on products and is given by `v₀(g)`
and the valuations of the integral roots; [ShortProof] `Lib/General/NumberTheory/GaussValuation.lean`
(`New.Selmer.gaussVal`, `New.Selmer.gaussVal_le_eval`, `New.Selmer.exists_forall_ellVal_eval_eq_gaussVal`,
`New.Selmer.gaussVal_eq_add_sum_roots`)).

[ShortProof], `New/Congruences/Selmer/RootsOfUnity.lean` (`New.Selmer.exists_rootsOfUnity_ellVal_eval_le_add`,
`New.Selmer.exists_rootOfUnity_eval_le_gaussVal_add`)

### 2.7 The twisting theorem, general form

*Origin:* particular to this proof: one anticyclotomic character of `ℓ`-power order, tamely ramified at an auxiliary set,
whose first `m` powers all make the Selmer groups of finitely many Selmer data no longer than `β_T + ε`, keep the values
at finitely many Stickelberger systems of valuation at most `β_Y + ε`, and have values within `ε` of `1` at the tame
generators.

*Method of the formal proof:* take `s₀` from 2.5, then `r` with `s₀r ≤ ε/2`, then `h₀` from 2.6 applied, at radius `r/m`,
to the polynomials of all data and systems composed with `X ↦ (1 + X)^j − 1` for `1 ≤ j ≤ m`, so that one tuple of roots
of unity serves all powers. Then take a level `N ≥ h₀` with its polynomials from 2.5. The character is
`ψ = ∏_𝔮 ζ_𝔮^{λ_𝔮}`. Its `j`-th power is ramified at every `𝔮`, because `v(ζ_𝔮^j − 1) ≤ r < ∞`. The tame values add up to
at most `2#Q·r ≤ ε`.

Let `E`, `ℓ`, `O`, `S₀ ⊇ {w | ℓ}`, `g₀`, `T_i`, `Y_k` and a torsion level `M` be as in 2.5, and let `m ≥ 1` and `ε > 0`. Prove
that there are an auxiliary set `Q` for `S₀` and a character `ψ : G_E → ℚ̄_ℓ` such that each `χ = ψ^j`, `1 ≤ j ≤ m`:

1. (a) is a character for `Q`, has `ℓ`-power order, and is ramified at every place of `Q`;
2. (b) satisfies `len_ℓ Sel_Q(T_iχ) ≤ len_ℓ β_{T_i} + ε` for every `i`;
3. (c) satisfies `v(χ(Θ_Q)) ≤ β_{Y_k} + ε` for every `k`;
4. (d) satisfies `Σ_{w ∈ Q ∪ Q̄} v(χ(γ_w) − 1) ≤ ε` for any tame generators `γ_w` at any places above the `w`.

*Needs:* 2.5, 2.6.

[ShortProof], `New/Congruences/Selmer/GeneralTheorem.lean` (`New.Selmer.exists_anticyclotomic_twist`,
`New.Selmer.IsSmallTwist`, `New.Selmer.exists_rootsOfUnity_ellVal_eval_le`)

## Layer 3: Crystalline cocycles, cup products and lifting in large weight

Local theory at one place above a prime `p`, in terms of cocycles of lattices. The central quantities are the dual
defect, which is the length of the crystalline cocycles of a lattice modulo those whose cup products with the
crystalline cocycles of a class of lattices are coboundaries, and the cup exponent, a power of `p` that carries all
crystalline cocycles into the cup-orthogonal ones. The jumps of the lattices lie in a low window `[−η, η]` and in far
windows of opposite signs near large weights. The bounds are proved for sides of a Kummer chart and then passed to
lattices.

### 3.1 Lattices over a local Galois group, crystalline cocycles, classes and cup-orthogonality

*Origin:* definitions and conventions.

Let `p` be a prime and `Γ` a group with a homomorphism `j : Γ → G_{ℚ_p} = Gal(ℚ̄_p/ℚ_p)` of open image. "Near `1`" is the
filter of preimages of neighbourhoods of `1`. `O` is the ring of integers of a finite extension of `ℚ_p`, and `χ` is the
cyclotomic character, through `j`. A *lattice* is a finite free `O`-module `L` with an `O`-linear action of `Γ`. `B_max` is
Colmez's period ring, and `Γ` acts on `B_max ⊗_{ℤ_p} L` diagonally, through `j` on the first factor.

- `L` is *admissible along* a filter `F` on `Γ` if the elements of `B_max ⊗ L` fixed by `F`-almost all `g` span
  `B_max ⊗ L` over `B_max`. `L` is *potentially crystalline* if it is admissible along "near `1`". `Z_f(L)`, the
  *crystalline cocycles*, is the `O`-module of maps `c : Γ → L` such that `1 ⊗ c(g) = gy − y` for some `y ∈ B_max ⊗ L` and
  all `g`.
- For a `ℤ_p`-algebra map `γ : O → ℂ_p` and `u ∈ ℤ`, the *jump multiplicity* `j_γ(L, u)` is the dimension over `ℚ̄_p` (`0`
  if infinite) of the space of `γ`-semilinear maps `f : L → ℂ_p` with `f(gx) = χ(g)^{−u}·g(f(x))` for `g` near `1`. `L` *has
  the jumps* `J` at `γ`, a multiset of integers, if `j_γ(L, u)` is the multiplicity of `u` in `J` for every `u`.
- For `s ∈ Γ` with `j(s)` in the inertia group and a potentially crystalline `L`, `s` acts on the periods of `L` (the
  elements of `B_max ⊗ L` fixed near `1`) by a `B_max`-linear operator `β_s`. A polynomial `Q` over `O` *kills* `s` on `L` if
  `Q(β_s) = 0`.
- For a filter `F` on `Γ`, a relation `K(s, Q)` between elements of `Γ` and polynomials over `O`, and finite sets `U(γ) ⊂ ℤ`
  for the embeddings `γ`, the *class* `𝒞(F, K, U)` consists of the lattices that are admissible along "near `1`" `⊔ F`,
  whose jumps at every `γ` lie in `U(γ)`, and on which `Q` kills `s` whenever `K(s, Q)` holds and `j(s)` is inertial.
  `𝒞(⊤, ⊥, U)` is the class of lattices crystalline over `Γ` (`F`-almost all means all) with jumps in `U`, with no condition
  on inertia.
- A relation `K` is a *tame type* for `(p, r, N)` if `K(X^e − 1)` holds for `e = lcm_{1≤i≤r}(p^i − 1)` and `K(q)` holds for
  the image of some monic `q ∈ ℤ_p[X]` of degree at most `N`.
- `L^∨(1) = Hom_O(L, O(1))` is the Tate dual, and `Y ⊗ L = Y ⊗_O L` with the diagonal action.
- A *pairing* `P` of `Y` and `L` modulo `p^m` is the following: an exponent `m`, an element `ψ ∈ (Y ⊗ L)^∨(1)`, a
  `ℤ_p`-linear `f : O → ℤ_p`, and a crystalline cocycle `c` of `(Y ⊗ L)^∨(1)` with `gψ − ψ = p^m c(g)` for all `g`. Its
  bilinear form is `b_P(y, x) = f(ψ(y ⊗ x)) mod p^m`.
- For `a : Γ → Y` and `c : Γ → L`, the *cup product of `a` and `c` under `P` is a coboundary* if the 2-cochain
  `(g, h) ↦ ε_m(b_P(a(g), g·c(h)))` with values in `ℚ̄_p^×` is the coboundary of a continuous 1-cochain `Γ → ℚ̄_p^×`, `Γ`
  acting through `j`. Here `ε_m` is a fixed embedding of `ℤ/p^m(1)` into `ℚ̄_p^×`, and continuity refers to a topology
  on `Γ`, on which this notion and the three that follow depend. When `j` is an open embedding, as in every statement
  of Layers 3 and 4 that bounds a cup exponent, the topology is that of the open subgroup `j(Γ)` of `G_{ℚ_p}`. The
  statements that do not assume this (4.4 (b)) hold for every topology on `Γ`, and the scaled condition of 3.2 is
  imposed only for topologies that make `j` an open embedding.
- For a class `𝒬`, the *cup-orthogonal module* `L^{⊥𝒬}` consists of the maps `c : Γ → L` (not necessarily cocycles) such
  that, for every `Y ∈ 𝒬`, every pairing `P` of `Y` and `L` and every `a ∈ Z_f(Y)`, the cup product of `a` and `c` under `P` is
  a coboundary. The *dual defect* is `δ_𝒬(L) = len_O(Z_f(L)/(Z_f(L) ∩ L^{⊥𝒬}))`. `L` has *cup exponent* `e` for `𝒬` if
  `p^e·Z_f(L) ⊆ L^{⊥𝒬}`.
- A finite set `V ⊂ ℤ` *fits the windows* `(η, ε, b, W)`, for `η, b, W ≥ 0` and a sign `ε`, if
  `V ⊆ [−η, η] ∪ ε·[b, b + W]`. The *gap condition* `NoMult(p, n, b)` says that `p` divides no nonzero integer within
  distance `n` of `0`, `b` or `−b`.

*Needs:* CrystallineRepresentationsAndKisinModules §§1.3, 3.1, 3.7 (Colmez's period ring `B_max = B^+[1/μ]`, where `B^+ = A_max[1/p]`, `A_max` is the
`p`-adic completion of `A_inf[X]/(pX − ξ)` and `μ = [ε] − 1`, with its actions of `G_{ℚ_p}` and of the Frobenius `φ`;
it is used in place of Fontaine's `B_cris`. Over it, the definitions of this section: admissibility along a filter,
potentially crystalline lattices, `Z_f(L)` and the jump multiplicities `j_γ(L, u)`. For a potentially crystalline
`L`, `s ∈ Γ` and `m ≥ 0` such that `j(s)^{−1}` is a Frobenius element for `p^m` (for `m = 0`: `j(s)` is inertial),
there is exactly one `B_max`-linear operator `β_{s,m}` of `B_max ⊗ L` that acts as `φ^m s ⊗ s` on the periods of `L`;
`β_{st,m+k} = β_{s,m}β_{t,k}`; and `β_{s,0} = 1` for inertial `s` near `1`. A polynomial `Q` over `O` kills `(s, m)`
on `L` if `L` is potentially crystalline and `Q(β_{s,m}) = 0`; this section uses `m = 0` and writes `β_s = β_{s,0}`;
[ShortProof] `Lib/PadicHodge/PeriodRings/CrystallineRings.lean` (`New.Period.Amax`, `New.Period.BPlus`,
`New.Period.Bmax`), `Lib/PadicHodge/Crystalline/Basic.lean` (`New.Period.IsAdmissible`,
`New.Period.IsPotentiallyCrystalline`, `New.Period.crysCocycles`, `New.Period.jump`, `New.Period.HasJumps`,
`New.Period.IsWeilPair`, `New.Period.linearFrob`, `New.Period.IsPotentiallyCrystalline.linearFrob_eq`,
`New.Period.IsKilledBy`), `Lib/PadicHodge/Crystalline/Regularity.lean` (`New.Period.linearFrob_apply`,
`New.Period.linearFrob_mul`, `New.Period.IsPotentiallyCrystalline.eventually_linearFrob_eq_one`)).

[ShortProof], `Lib/ClassField/LocalDuality/CrystallineDuality.lean` (`New.Lift.InClass`, `New.Lift.Pairing`,
`New.Lift.Pairing.IsCupCoboundary`, `New.Lift.cupOrthogonal`, `New.Lift.dualDefect`, `New.Lift.HasCupExponent`),
`New/Congruences/Lifting/SidePoints.lean` (`New.Lift.FitsWindows`, `New.Lift.NoMultipleNear`),
`New/Congruences/Lifting/CupOrthogonalityBounds.lean` (`New.Lift.IsTameType`)

### 3.2 Kummer charts, letters and sides

*Origin:* definitions and conventions.

Let `Γ`, `j` be as in 3.1, `K` the fixed field of `j(Γ)`, `A_inf = W(O_{ℂ_p}^♭)`, `θ : A_inf → O_{ℂ_p}` Fontaine's map, and
`Λ = W(𝔽_{p^f})` inside `A_inf`.

- A *Kummer chart* `k` of `Γ` is a subring `S = Λ[[z]] ⊂ A_inf`, where `z` is a non-unit Teichmüller lift, together with an
  element `E = z^e A + p` (`A` a unit) that generates `ker θ` and a subgroup `Γ′ ⊆ Γ` of index prime to `p`. The subgroup
  `j(Γ′)` fixes `Λ` and `θ(z)` and contains every element of `G_{ℚ_p}` that does; `Γ′` contains all `g` near `1`; and for
  every `l ≥ 0` some `g ∈ Γ′` has `g(z) = [ε]^l z`. Here `e` is the *ramification index*, `f` the *residue degree*, and
  `d = 0` if `e = 1`, `d = v_p(e) + 1` otherwise. The chart is *unramified* if `E = z + p` and `e = 1`.
- The *letters* of `k` are the elements of `𝔽_{p^f}^×`, permuted by `i ↦ i^p`. For `a ≥ 0`, `i^{(−a)}` is the letter whose
  `p^a`-th power is `i`, the letter `a` steps before `i`. For a *letter root* `ζ ∈ O` with `ζ^{p^f − 1} = 1`, an embedding `g : O → ℂ_p` *lies over* the letter
  `i` if `g(ζ) = θ([i])`, the image of the Teichmüller lift. For sets `U(g)`, the *letter jumps* `U_k(i)` at `i` are `{0}`
  together with the union of the `U(g)` over the `g` that lie over `i`.
- A *side* `S` of `k` over `(O, ζ)` consists of the following. A lattice `Y` crystalline over `Γ′`. Finite sets of
  integers, one for each embedding, containing the jumps of `Y` there, and one for each letter, `U_S(i) ∋ 0`, containing
  those of the embeddings over `i`. A lattice `C` (the parameters). An `O`-linear map `α_S : C → Z_f(Y)`. The *jump
  multiplicity* of `S` at `(i, u)` is `Σ_{g over i} j_g(Y, u)`. A *pairing of sides* `S`, `S′` is a pairing of their
  lattices `Y`, `Y′`. For `c ∈ C`, `c′ ∈ C′` and `N ≥ 0`, the pairing gives a *scaled cup coboundary of exponent* `N` if, for every
  topology on `Γ` that makes `j` an open embedding (there is one exactly when `j` is injective, the topology of the open
  subgroup `j(Γ)` of `G_{ℚ_p}`), the cup product of `α_S(c)` and `p^N·α_{S′}(c′)` under it is a coboundary; so the
  condition is empty when `j` is not injective.

*Needs:* 3.1; CrystallineRepresentationsAndKisinModules §2.4 (existence of a Kummer chart for every `Γ`, with `ef = [G_{ℚ_p} : j(Γ)]`, unramified
when `j(Γ)` contains inertia).

[ShortProof], `Lib/PadicHodge/Kisin/KummerChartExistence.lean` (`New.Lift.KummerChart`,
`New.Lift.KummerChart.IsUnramified`, `New.Lift.KummerChart.differentBound`, `New.Lift.exists_kummerChart`),
`New/Congruences/Lifting/CupProductBound.lean` (`New.Lift.KummerChart.PairingSide`,
`New.Lift.Pairing.IsScaledCupCoboundary`), `New/Congruences/Lifting/CupOrthogonalityBounds.lean`
(`New.Lift.KummerChart.letterJumps`)

### 3.3 Exponent bounds by cuts for paired sides: sparse b-letters

*Origin:* particular to this proof: when the large Hodge–Tate jumps sit at letters no three of which follow one another
closely under Frobenius, an explicit power of `p`, independent of the rank, makes the cup products of the cocycles of two
paired sides coboundaries.

*Method of the formal proof:* the scheme of cuts, 3.3a (h), with all shifts `0`. The cuts are the letters followed by `J`
letters that are not b-letters. The sizes are `W = 5η`, `n = G = 10η`, `b + 5η` in place of `b`,
`s₀ = ⌊(b + 10η)/(p − 3)⌋ + 1`, `ω = η` and `κ = 12((J + 1)X + δ) + 1`, so that `51κ ≤ 10³(δ + (J + 1)X)`. Sparseness
gives a cut `1` to `2J + 1` letters back from each letter, and shows that a b-letter after the nearest cut is the letter
itself or lies `J + 1` letters after the cut. So each gap is plain, or, on an unramified chart with `10p^Jη ≤ b`, long.

Let `k` be a Kummer chart of `Γ`, `S`, `S′` sides of `k` over `(O, ζ)` with a pairing, `T` a set of letters (the
b-letters), `ε` a sign for each letter, and `η, V, X, δ, b, J, G ≥ 0` with `η ≥ 1`, `J ≥ 1` and `G + V ≤ η`. Let `U_S(i)` fit
the windows `(η, −ε(i), β(i), V)` and `U_{S′}(i)` fit `(η, ε(i), β(i), V)`, where `β(i) = b` for `i ∈ T` and `β(i) = G`
otherwise. Assume:

- no `i ∈ T` has `i^{p^s} ∈ T` and `i^{p^{s+t}} ∈ T` with `1 ≤ s, t ≤ J`;
- either `k` is unramified, `p ≥ 7` and `10p^Jη ≤ b`, or `ε` is constant and `8e ≤ p^{J+1}`;
- `2e(b + 5η) ≤ p^{J+1}δ` and `20(J + 1 + d)η + ⌊log_p(2(b + 5η))⌋ ≤ X`.

Prove that for all `c ∈ C`, `c′ ∈ C′` the pairing gives a scaled cup coboundary of exponent `10³(δ + (J + 1)X)`.

*Needs:* 3.1, 3.2, 3.3a (h).

[ShortProof], `New/Congruences/Lifting/CutExponentBounds.lean`
(`New.Lift.KummerChart.PairingSide.SidePairing.isScaledCupCoboundary_sparse_thick`)

### 3.3a The walk: cuts, standard points, stops and safe moves

*Origin:* particular to this proof: the cup product of the cocycles of two paired sides becomes a coboundary, after an
explicit power of `p`, once points of the Kisin modules of the two extensions are chosen at a set of letters (the cuts)
and joined along Frobenius orbits by moves whose pairings are small. This section states the objects and the lemmas of
that method which 3.3, 3.4, 3.5, 3.6 and 3.7 use.

*Method of the formal proof:* (a) solves `(φ − 1)y = B(w, φx′ − w′) + B(x, w′ − x′)` in `𝕎 ⊗ ℤ/p^m(1)` and corrects
the natural cochain by `y`; the safe moves make the corrected cochain fixed by `φ` up to small terms, hence constant.
(b) pairs the move and the point at rest with `φ^l` of a point of the Tate dual side, whose first component acts as the
projector to a letter. (c) (ii) uses an operator `p^c + υ·Σ_l (t_l − 1)/(zτ)` with `t_l ∈ Γ′` and `υ ∈ A_inf`. (d)
shows that a power of `z` lifts constants modulo a power of `p` and removes the modulus by Nakayama's lemma. (e) applies
(a) to the sums over the letters of the points, each carried by Frobenius from the last cut. (g) expands in powers of
`E`, multiplies by a monic `f(E)` and takes a Taylor coefficient. (h) takes the points of (c) at the cuts, the stops of
(f) at plain gaps and those of (g) at long gaps, and applies (e). (i) is (e) with a cut at every letter.

Let `k` be a Kummer chart of `Γ` with ring `Λ[[z]]`, and `(O, ζ)`, `e`, `f`, `d` as in 3.2. Write `𝕎 = W(ℂ_p^♭)`, `φ`
for its Frobenius, `τ = [ε^{1/p}] − 1`, `Fil^n = Fil^n B_dR` for `n ∈ ℤ`, and `[P] = 1` if `P` holds, `0` otherwise.

**Kisin modules, orders and depth.** Let `L` be a lattice over `O` that is crystalline over `Γ′`, with a finite set
`U_L(i) ⊂ ℤ` for each letter `i` that contains the jumps of `L` at the embeddings over `i`.

- `M(L) = 𝕎 ⊗_{ℤ_p} L`, on which `φ` acts through `𝕎` and `Γ` diagonally. `M(L)_i`, the *part at the letter* `i`, is
  the submodule on which `1 ⊗ ζ` acts as the Teichmüller lift `[i]`; `M(L)` is the direct sum of the `M(L)_i`, and
  `x ↦ x_i` is the projection.
- A *form* on `L` is an `A_inf`-linear map `μ : M(L) → B_dR` with `μ(1 ⊗ gx) = g·μ(1 ⊗ x)` for `g ∈ Γ′`, `x ∈ L`. It has
  *type* `u` at `i` if `μ((1 ⊗ x)_i) ∈ Fil^{−u}` for all `x ∈ L`.
- `𝒩_A(L)` is the `A_inf`-module of the `x ∈ M(L)` such that, for some product `r` of elements `φ^a(E)`, `a ≥ 0`, some
  power of `τ` multiplies `rx` into `A_inf ⊗ L`, and `μ(φ^n(rx)) ∈ B_dR^+` for all `n ≥ 1` and all forms `μ`. The
  *localised Kisin module* `𝒩(L)` is the `Λ[[z]]`-module of the `x ∈ 𝒩_A(L)` with `μ(x) ∈ 𝒦₀` for all forms `μ`. Here
  `𝒦₀` is the subfield of `B_dR` generated, over the subfield of `ℚ̄_p` fixed by `j(Γ′)`, by `Λ[[z]]` and by the ring of
  the elements of `B^+ = A_max[1/p]` whose multiplication commutes with every `Λ[[z]]`-linear endomorphism of `B^+` that
  preserves the image of `A_max`.
- *Orders* are a function `o(a, u) ∈ ℤ` of a *level* `a ≥ 0` (it stands for the prime `φ^a(E)`) and of `u ∈ ℤ`. An
  `x ∈ M(L)` *has orders* `o` at `i` if `x ∈ 𝒩_A(L) ∩ M(L)_i` and `μ(φ^{−a}x) ∈ Fil^{o(a,u)}` for all `a`, all
  `u ∈ U_L(i^{(−a)})` and all forms `μ` of type `u` at `i^{(−a)}`. It *has depth* `o` at `i` if `gx − x` has
  orders `o` at `i` for every `g ∈ Γ′`.
- Particular orders: `r_s(a, u) = s·[a = 0] − u` for `s ∈ ℤ`; the *standard orders of level* `l`, `σ_l(a, u) = 0` for
  `a < l` and `−u` for `a ≥ l`; the *standard depth* `D_{s,η,l}(a, u) = −u + s·[a = 0] + η·[a < l]`; the *stop orders*
  `q_{η,l}(a, u) = max(0, −u − η)` for `a < l` and `−u` for `a ≥ l`; the *rule bound* `R_{l,s}(a, w) = 1` for `a < l`,
  `s − w` for `a = l`, `−w` for `a > l`. For orders `o`, `l ≥ 0` and `n ∈ ℤ`, the *shift* `o[l, n]` is `n` at the levels
  `a < l` and `o(a − l, u)` at the levels `a ≥ l`.
- The *cost* of the step `n ∈ ℤ` at the level `a` is `c_a(n) = v_p(n) + d + 3a`, with `v_p(0) = 0`.

**Points of a side.** Let `S` be a side of `k` over `(O, ζ)`, with lattice `Y`, sets `U_S(i)`, parameters `C` and
`α_S` (3.2).

- The *extension* `X_S` is `Y × C` with `g(y, c) = (gy + α_S(c)(g), c)` and the sets `U_S(i)`. `C` is taken with the
  trivial action and the sets `{0}`. `pr : M(X_S) → M(C)` is the projection and `w ↦ w_Y` the projection to `M(Y)`. The
  *constant* of `c ∈ C` at `i` is `(1 ⊗ c)_i`.
- A *point of `S` over `p^e c` at `i` with orders `o` and depth `o′`* is an `x ∈ 𝒩(X_S)` with `pr(x) = p^e(1 ⊗ c)_i`
  that has orders `o` and depth `o′` at `i`. A *standard point* for `(e, s, η, l)` is one with orders `r_{−η}` and depth
  `D_{s,η,l}`. A *stop* for `(e, η, l)` is one with orders `q_{η,l}` and depth `q_{η,l}`. A vector `w ∈ M(X_S)` *lies
  over `0` with orders `o` at `i`* if `pr(w) = 0` and `w` has orders `o` at `i`.
- `p^κE^s` *kills the cokernel of `S` at `i`* if, for every `c ∈ C`, `p^κE^s(1 ⊗ c)_i = pr(x)` for some `x ∈ M(X_S)`
  with orders `σ_0` at `i`.
- An additive map `A : 𝒩(X_S) → 𝒩(X_S)` is an *operator of cost* `e` if, for every letter `i`, all orders `o` and every
  `x ∈ 𝒩(X_S)` of depth `o` at `i` whose image `pr(x)` is a constant at `i`, the vector `Ax − p^e x` lies over `0` with
  orders `o` at `i`.

**Pairings.** Let `P` be a pairing of sides `S`, `S′` (3.2), with exponent `m`, form `ψ`, map `f` and cocycle `c_P`.

- The *Tate dual side* of `P` has the lattice `(Y ⊗ Y′)^∨(1)`, the parameters `O` with `α(1) = c_P`, and the sets
  `{0} ∪ {−u − u′ − 1 : u ∈ U_S(i), u′ ∈ U_{S′}(i)}`.
- `B_P : M(Y) × M(Y′) → 𝕎 ⊗ ℤ/p^m(1)` is the `𝕎`-bilinear extension of `(y, y′) ↦ f(ψ(y ⊗ y′)) mod p^m`. A pair
  `(w, w′)` in `M(X_S) × M(X_{S′})` is *safe for* `κ` if `p^κ·B_P(w_Y, w′_{Y′})` lies in `W(𝔪^♭)·(1 ⊗ 1)`, where `𝔪^♭`
  is the maximal ideal of `O_{ℂ_p}^♭`.
- The *move of the first side by `v` with `q′` at rest* is safe for `κ` if the pairs `(v, gq′ − q′)`, `g ∈ Γ′`, are.
  The *move of the second side by `v′` with `q` at rest* is safe for `κ` if the pairs `(gq − q, gv′)`, `g ∈ Γ′`, are.
- A *safe path for `κ` from `(y, y′)` by `(w, w′)` to `(x, x′)`* consists of four safe moves: of the first side by
  `y − w` with `y′` at rest, of the second by `y′ − w′` with `w` at rest, of the first by `w − x` with `w′` at rest, and
  of the second by `w′ − x′` with `x` at rest.

Let `S`, `S′` be sides of `k` over `(O, ζ)` with a pairing `P`, and `c ∈ C`, `c′ ∈ C′`. Prove:

1. (a) (the pairing lemma) let `x, w ∈ M(X_S)` have `pr(x) = pr(w) = p^{e₁}(1 ⊗ c)` and `x′, w′ ∈ M(X_{S′})` have
   `pr(x′) = pr(w′) = p^{e₂}(1 ⊗ c′)`. If the moves of the second side by `hx′ − x′`, `h ∈ Γ′`, with `x` at rest are
   safe for `e₃`, and there is a safe path for `e₃` from `(φx, φx′)` by `(w, w′)` to `(x, x′)`, then the pairing gives a
   scaled cup coboundary of exponent `N` at `(c, c′)` for every `N ≥ e₁ + e₂ + e₃`;
2. (b) (the rule) let `l ≥ 0`, and let `ν` be a point of the Tate dual side over `p^κ·1` at `i^{(−l)}` with orders
   `o_ν` that do not increase in `u` at any level, and any depth. Let `w` lie over `0` with orders `o` at `i` in
   `M(X_S)`, and let `x′` be a point of `S′` over `p^{e′}c′` at `i` with any orders and depth `o′`. If
   `o_ν[l, 0](a, −u − u′ − 1) + o(a, u) + o′(a, u′) > 0` for all `a ≥ 0`, `u ∈ U_S(i^{(−a)})` and
   `u′ ∈ U_{S′}(i^{(−a)})`, then the move of the first side by `w` with `x′` at rest is safe for `κ`. In
   particular this holds if `p^κE^t` kills the cokernel of the Tate dual side at `i^{(−l)}` and
   `o(a, u) + o′(a, u′) ≥ R_{l,t}(a, u + u′)` for all such `a`, `u`, `u′`. The same holds with the sides exchanged: for
   a point `x` of `S` of depth `o` and a `w′ ∈ M(X_{S′})` over `0` with orders `o′`, the move of the second side by
   `w′` with `x` at rest is safe for `κ`;
3. (c) (points and depth) (i) if `p^κE^s` kills the cokernel of `S` at `i`, then `S` has a point over `p^κc` at `i`
   with orders `r_{−s}` and depth `r_{−s}`. (ii) (The depth lemma.) For `a ≥ 0` and `n ∈ ℤ` there is an operator `B` of
   cost `c_a(n)` such that, for every `x ∈ 𝒩(X_S)` and every form `μ` on `X_S`, if `μ(φ^{−a}(gx − x)) ∈ Fil^n` for all
   `g ∈ Γ′`, then `μ(φ^{−a}(gBx − Bx)) ∈ Fil^{n+1}` for all `g ∈ Γ′`. Operators of costs `e`, `e′` compose to one of
   cost `e + e′`. For a finite set `I` of steps `(a, n)` there is an operator of cost `Σ_{(a,n) ∈ I} c_a(n)` that sends
   every `x` of depth `o` at a letter `i`, over a constant at `i`, to an element of depth `o′` at `i`, whenever `I`
   contains all `(a, n)` with `o(a, u) ≤ n < o′(a, u)` for some `u ∈ U_S(i^{(−a)})`. (iii) If `S` has a point
   over `p^e c` at `i` with orders `o₁` and depth `o`, `I` is as in (ii) and `e′ ≥ e + Σ_{(a,n) ∈ I} c_a(n)`, then `S`
   has a point over `p^{e′}c` at `i` with depth `o′` and with orders `o′(a, u)` where `o₁(a, u) > 0` and
   `min(o′(a, u), 0)` elsewhere. (iv) If `x` is a point over `p^e c` at `i^{(−l)}` with orders `o` and depth `o′`,
   then `φ^l x` is a point over `p^e c` at `i` with orders `o[l, 0]` and depth `o′[l, 1]`. (v) (The gap rule.) Let `x`
   be a point at `i` whose orders are at least `r_{−t}` and whose depth is at least `r_0` on the sets
   `U_S(i^{(−a)})`, for an integer `t`. If `h ≥ 0` and no element of `U_S(i)` lies in `[−t, −h)`, then `x` has
   orders `r_{−h}`, with the same depth;
4. (d) (killers on an unramified chart) if `k` is unramified, `p ≥ 5` and every element of every `U_S(j)` is at most
   `(p − 3)(s + t)`, then `p^sE^t` kills the cokernel of `S` at every letter;
5. (e) (the walk) let some letters be *cuts*, and for every letter `i` let `l(i) ≥ 1` be least such that
   `i^{(−l(i))}` is a cut. Let `κ, e, e′, η ≥ 0` and `t(i) ≥ 0`, and at each cut `i` let: `p^κE^{t(i)}` kill the
   cokernel of the Tate dual side at `i`; `x(i)` and `x′(i)` be standard points of `S` and `S′` for
   `(e, t(i), η, l(i))` and `(e′, t(i), η, l(i))` over `p^e c` and `p^{e′}c′` at `i`; and either `S` have a stop `q`
   for `(e, η, l(i))` over `p^e c` at `i` such that the move of the second side by
   `φ^{l(i)}x′(i^{(−l(i))}) − x′(i)` with `q` at rest is safe for `κ`, or `S′` have a stop `q′` for
   `(e′, η, l(i))` over `p^{e′}c′` at `i` such that the move of the first side by `φ^{l(i)}x(i^{(−l(i))}) − x(i)`
   with `q′` at rest is safe for `κ`. Then the pairing gives a scaled cup coboundary of exponent `N` at `(c, c′)` for
   every `N ≥ e + e′ + κ`;
6. (f) (stops at plain cuts) let `l ≥ 1`, let `p^κE^t` kill the cokernel of the Tate dual side at `i`, and for `a < l`
   let every element of `U_S(i^{(−a)})` be at most `η` and every element of `U_{S′}(i^{(−a)})` at least `−η`.
   Let `x` be a point of `S` over `p^e c` at `i` with orders `r_{−η}` and depth `D_{t,η,l}(a, u) + η₀·[a = l]`, and let
   `x′` and `x₀′` be points of `S′` over `p^{e′}c′`, at `i` with orders `r_{−η}` and at `i^{(−l)}` with orders
   `r_{−η₀}`, of any depths. Then `x` is a stop for `(e, η, l)` and a standard point for `(e, t, η, l)`, and the move
   of the second side by `φ^l x₀′ − x′` with `x` at rest is safe for `κ`. The same holds with the sides exchanged;
7. (g) (the long gap lemma) let `k` be unramified, `l, A, κ, s, g, δ ≥ 0` with `3 ≤ p^l` and `A ≤ p^l δ`, let `p^κ`
   kill the cokernel of `S` at `i^{(−l)}` and `E^s` kill it at `i`, and for `a < l` let every element of
   `U_S(i^{(−a)})` be at most `g`. If `N = s + g·Σ_{a<l} p^a < A`, then `S` has a point over `p^{κ+4δ}c` at `i`
   with orders `σ_l(a, u) + A·[a = 0 and u < −N]` and depth `σ_l(a, u) + A·[a = 0]`;
8. (h) (the scheme of cuts) let some letters be cuts, and let a sign `ε(i)`, a *shift* `s(i) ≥ 0` and `β(i) ≥ 0` be
   given at each letter, and `η, V, W, X, δ, κ, b, n, J, s₀, G, ω ≥ 0` with `η ≥ 1` and `V + 4η ≤ W`. Let `U_S(i)` fit
   the windows `(η, −ε(i), β(i), V)` and `U_{S′}(i)` fit `(η, ε(i), β(i), V)`. Assume the size conditions:
   `n + ⌊log_p(2b)⌋ + (J + 1 + d)W + dG ≤ X`; `12((J + 1)X + δ) < κ`; `2eb ≤ p^{J+1}δ`; `8e ≤ p^{J+1}`; `G ≤ (p − 1)n`;
   and, for every letter `i`, `β(i) + s(i) + W ≤ 2b`, `s(i) + W ≤ pn`, and `β(i) + W ≤ (p − 3)s₀` if `p ≥ 5`. Let every
   cut `i` be a *killing cut*: either `s(i) = 0` and `β(i^{p^t}) + W ≤ G` for `1 ≤ t ≤ J`, or `k` is unramified,
   `p ≥ 5`, `s(i) < β(i)` and `s₀ ≤ κ + s(i)`. Then at every cut `i`, `p^κE^{s(i)}` kills the cokernels of `S`, of `S′`
   and of the Tate dual side at `i`, and for `l ≤ 2J + 1` each of `S`, `S′` has a point over `p^{25κ}` times any
   parameter at `i` with orders `r_{−η}` and depth `D_{s(i),η,l+1}` (so a standard point for `(25κ, s(i), η, l)`).
   Assume moreover that every letter `i` has a cut `i^{(−l)}` with `1 ≤ l ≤ 2J + 1`, and that, whenever
   `i^{(−l)}` with `l ≥ 1` is a cut and no `i^{(−a)}` with `0 < a < l` is one, there is `t ≥ 0` such that one
   of the following holds. A *plain gap*: for every `a < l`, `ε(i^{(−a)}) = ε(i^{(−t)})` or
   `β(i^{(−a)}) + V ≤ η`. A *long gap* with pivot `i^{(−t)}`: `k` is unramified, `p ≥ 5`,
   `s(i^{(−l)}) = 0`, `t + J + 1 = l`, `s₀ + ω·Σ_{a≤J} p^a < β(i^{(−t)})`, `η ≤ ω`,
   `β(i^{(−a)}) + V ≤ ω` for `t < a < l`, and for every `a < l` with `a ≠ t`,
   `ε(i^{(−a)}) ≠ ε(i^{(−t)})` or `β(i^{(−a)}) + V ≤ η`. Then the pairing gives a scaled cup coboundary
   of exponent `N` at `(c, c′)` for every `N ≥ 51κ`;
9. (i) (killers at every letter) let `a, κ, η, W ≥ 0`, and at each letter let `b(i) ≥ 0` and a sign `ε(i)` be given.
   At every letter `i` let `p^κE^a` kill the cokernels of `S`, of `S′` and of the Tate dual side, let
   `NoMult(p, 6(a + η + W), b(i))` hold, and let `U_S(i)` fit `(η, −ε(i), b(i), W)` and `U_{S′}(i)` fit
   `(η, ε(i), b(i), W)`. Assume that no element of any `U_S(i)` or `U_{S′}(i)` lies in `[−a, 0)`, or that `k` is
   unramified and every `U_{S′}(i)` lies in `[−η, 0]`. Then the pairing gives a scaled cup coboundary of exponent `H` at
   `(c, c′)` for every `H ≥ 3(κ + (48(a + η + W) + 4)d)`.

*Needs:* 3.1, 3.2; CrystallineRepresentationsAndKisinModules §§5.6, 5.7, 5.8, 5.9 (Kisin modules of a lattice `L` that is crystalline over `Γ′`, over a Kummer
chart with ring `Λ[[z]]`, in the notation of 3.3a. Let `a ≥ 0` be least such that the jumps of `L` over `Γ′` lie in
`[−a, a]`; let `N_A(L)` be the `A_inf`-module of the `x ∈ M(L)` that a power of `τ` multiplies into `A_inf ⊗ L` and with
`μ(φ^n x) ∈ B_dR^+` for all `n ≥ 1` and all forms `μ`, and `N(L)` the `Λ[[z]]`-module of the `x ∈ N_A(L)` with
`μ(x) ∈ 𝒦₀` for all forms `μ`, so that `𝒩_A(L)` and `𝒩(L)` are obtained from them by allowing a product of elements
`φ^b(E)`; a form is *crystalline* if its restriction to `1 ⊗ L` comes from a `ℤ_p`-linear map `L → B_max`; and `𝔅 ⊂ B^+`
is the ring of the elements whose multiplication commutes with every `Λ[[z]]`-linear endomorphism of `B^+` that
preserves the image of `A_max`. The frame theorem: (1) some `rank_{ℤ_p} L` vectors, linearly independent over `A_inf`,
span `N(L)` over `Λ[[z]]` and `N_A(L)` over `A_inf`; in particular `N(L)` is free over `Λ[[z]]` and `N_A(L)` is its
`A_inf`-span; (2) `τ^a` carries `N_A(L)` into `A_inf ⊗ L` and `A_inf ⊗ L` into `N_A(L)`; (3) `E^a·φ` maps `N(L)` into
itself; (4) for a crystalline form `μ` and `y ∈ N(L)`, `E^a·μ(y)` lies in the image of `𝔅`, and `x ∈ M(L)` lies in
`N(L)` exactly when a power of `τ` multiplies it into `A_inf ⊗ L` and, for some `n`, `E^n·μ(x)` lies in the image of `𝔅`
for every crystalline form `μ`; (5) if `d ∈ A_inf` divides `r` whenever it divides some `E^m r` in `B^+`, then an
`x ∈ N_A(L)` with, for one `n`, `E^n·μ(x) ∈ B^+·d` for every crystalline form `μ` lies in `d·N_A(L)`; (6) a
`Λ[[z]]`-linear map `A_inf → Λ[[z]]`, applied to the coefficients, carries relations over `A_inf` among vectors with all
form values in `𝒦₀` to relations; (7) if `3e ≤ p^l` and `eA ≤ p^l δ`, then `p^{4δ}` times an element of `φ^l N_A(L)`
with all form values in `𝒦₀` lies in the `Λ[[z]]`-span of the elements `y` of that kind with `g·μ(y) − μ(y) ∈ Fil^A` for
all forms `μ` and all `g ∈ Γ′`. The bound for the forms of a type: for a letter `i` and
`u ∈ ℤ` there are `r` forms of type `u` at `i`, with `r` at most the sum of the jump multiplicities `j_γ(L, u)` over
the embeddings `γ` over `i`, such that every form of type `u` at `i` is a `ℚ̄_p`-combination of them modulo a form of
type `u − 1` at `i`).

[ShortProof], `New/Congruences/Lifting/SidePoints.lean` (`New.Lift.KummerChart.PairingSide.pointsOver`,
`New.Lift.KummerChart.PairingSide.standardPoints`, `New.Lift.KummerChart.PairingSide.stopPoints`,
`New.Lift.KummerChart.PairingSide.IsOperatorOfCost`,
`New.Lift.KummerChart.PairingSide.pointsOver_nonempty_of_killsCokernel`,
`New.Lift.KummerChart.PairingSide.exists_isOperatorOfCost_mem_hodgeFil_succ`,
`New.Lift.KummerChart.PairingSide.IsOperatorOfCost.comp`,
`New.Lift.KummerChart.PairingSide.exists_isOperatorOfCost_and_mem_deepElements`,
`New.Lift.KummerChart.PairingSide.pointsOver_nonempty_of_costs`,
`New.Lift.KummerChart.PairingSide.phi_pow_smul_mem_pointsOver`), `New/Congruences/Lifting/SafeMoves.lean`
(`New.Lift.KummerChart.PairingSide.SidePairing.isSafeMoveFst_of_orders`,
`New.Lift.KummerChart.PairingSide.SidePairing.isSafeMoveSnd_of_orders`,
`New.Lift.KummerChart.PairingSide.SidePairing.isSafeMoveFst_of_killsCokernel`,
`New.Lift.KummerChart.PairingSide.SidePairing.isSafeMoveSnd_of_killsCokernel`,
`New.Lift.KummerChart.PairingSide.mem_pointsOver_raisedOrdersAtZero_of_gap`,
`New.Lift.KummerChart.PairingSide.SidePairing.isScaledCupCoboundary_of_stops`,
`New.Lift.KummerChart.PairingSide.SidePairing.exists_mem_stopPoints_isSafeMoveSnd`,
`New.Lift.KummerChart.PairingSide.SidePairing.exists_mem_stopPoints_isSafeMoveFst`),
`New/Congruences/Lifting/CupProductBound.lean` (`New.Lift.KummerChart.PairingSide.extensionLattice`,
`New.Lift.Pairing.tateDualSide`, `New.Lift.Pairing.IsSafe`, `New.Lift.Pairing.IsSafePath`,
`New.Lift.KummerChart.PairingSide.KillsCokernel`, `New.Lift.Pairing.IsScaledCupCoboundary.of_isSafePath`,
`New.Lift.KummerChart.PairingSide.killsCokernel_of_isUnramified`), `New/Congruences/Lifting/ExponentLattices.lean`
(`New.Lift.KummerChart.cost`, `New.Lift.KummerChart.JumpLattice.withOrders`,
`New.Lift.KummerChart.JumpLattice.invariantsMod`,
`New.Lift.KummerChart.JumpLattice.exists_valueAt_sub_mem_hodgeFil_succ`), `Lib/PadicHodge/Kisin/Modules.lean`
(`New.Lift.KummerChart.JumpLattice.forms`, `New.Lift.KummerChart.JumpLattice.kisinLoc`),
`New/Congruences/Lifting/LongGap.lean` (`New.Lift.KummerChart.PairingSide.pointsOver_nonempty_of_long_gap`),
`New/Congruences/Lifting/CutExponentBounds.lean` (`New.Lift.KummerChart.CutSizes`,
`New.Lift.KummerChart.Letter.IsKillingCut`, `New.Lift.KummerChart.Letter.IsLongGap`,
`New.Lift.KummerChart.PairingSide.killsCokernel_of_isKillingCut`,
`New.Lift.KummerChart.PairingSide.pointsOver_cutOrders_nonempty`,
`New.Lift.KummerChart.PairingSide.SidePairing.isScaledCupCoboundary_of_cut_windows`),
`New/Congruences/Lifting/DeepPoints.lean`
(`New.Lift.KummerChart.PairingSide.SidePairing.isScaledCupCoboundary_of_killsCokernel`)

### 3.4 Exponent bounds by cuts for paired sides: any pattern of b-letters

*Origin:* particular to this proof: over an unramified chart with `p ≥ 7`, for any placement of the far windows of two
sizes `b ≥ G` among the letters, the cup products of the cocycles of two paired sides become coboundaries after
`p^{10⁴(K + ⌊log_p 2(b + W)⌋)}`, with `b < Kp²`.

*Method of the formal proof:* the scheme of cuts, 3.3a (h), with `J = 1`. A letter whose successor is a b-letter gets the
shift `max(⌊b/p⌋ − 7K, 0)`, the others `0`, and the cuts are the letters whose shift is below their window start: the
b-letters and the letters whose successor is not a b-letter are cuts, so one of the two letters before each letter is a
cut. The sizes are `X = 3K + ⌊log_p(2(b + W))⌋`, `δ = 4K`, `κ = 12(2X + 4K) + 1`, `n = K`, `s₀ = ⌊b/p⌋ + 12K`,
`ω = G + W`, with `b + W` and `G + W` in place of `b` and `G`. A gap is plain, or it is long with the letter itself as
pivot: a b-letter, preceded by a letter of the opposite sign that is not a b-letter, two letters after a cut of shift `0`.

Let `k` be an unramified Kummer chart, `p ≥ 7`, `S`, `S′` paired sides over `(O, ζ)`, `T` a set of letters, `ε` signs, and
`η, V, W, b, G, K` with `η ≥ 1`, `V + 4η ≤ W`, `0 < G ≤ b`, `b < Kp²`, `2G < Kp` and `W ≤ K`. Let the letter jumps of `S` fit
`(η, −ε(i), β(i), V)` and those of `S′` fit `(η, ε(i), β(i), V)`, with `β = b` on `T` and `G` off `T`. Prove that for all
`c, c′` the pairing gives a scaled cup coboundary of exponent `10⁴(K + ⌊log_p(2(b + W))⌋)`.

*Needs:* 3.1, 3.2, 3.3a (h).

[ShortProof], `New/Congruences/Lifting/CutExponentBounds.lean`
(`New.Lift.KummerChart.PairingSide.SidePairing.isScaledCupCoboundary_any_pattern`)

### 3.5 Few low jumps: a submodule of small colength that cups to zero

*Origin:* particular to this proof: over an unramified chart with `p ≥ 5`, when `p` divides no integer near `0` or the
large weights, the parameters of a side whose cocycles cup to zero with every opposite side, without any power of `p`,
have colength `O(Σ_i (n_i(a + 1) + r_i(W + 1)))`, where `n_i` counts the low jumps and `r_i` all jumps at the letter `i`.

*Method of the formal proof:* raise the depth of points of the extension when all steps occur at the level of `E`, by the
operators of 3.3a (c), at a cost bounded by the cost function and the gap condition (on an unramified chart a step `n` at
the level `0` with `p ∤ n` or `n = 0` costs `0`), and bound the length of parameters lost to depth at each letter by the
number of low jumps there. Over the parameters whose constants have deep points at every letter, the points of the other
side exist by the window condition and 3.3a (c), the cokernel of the Tate dual side is killed by `E^a` (3.3a (d): its
jumps are at most `(p − 3)a`), and at each letter a stop is found according to the sign, by 3.3a (f) or by the rule
3.3a (b). The walk 3.3a (e), with a cut at every letter, then closes with exponent `0`.

Let `k` be an unramified Kummer chart, `p ≥ 5`, `η ≥ 1`, `a, W ≥ 0`, and for each letter `i` let `b(i) ≥ 0`, a sign `ε(i)` and
`n(i), r(i) ≥ 0`. Let `S` be a side over `(O, ζ)` with, at each letter: `b(i) + W + η ≤ (p − 3)a`; `6(a + η + W) < b(i)`;
`NoMult(p, 6(a + η + W), b(i))`; `U_S(i)` fits `(η, ε(i), b(i), W)`; `f·Σ_{|u|≤η} m_S(i, u) ≤ n(i)` and
`f·Σ_{u ∈ U_S(i)} m_S(i, u) ≤ r(i)`, where `m_S` is the jump multiplicity of `S`. Prove that there is a `ℤ_p`-submodule
`V ⊆ C` with `len_{ℤ_p}(C/V) ≤ 11·Σ_i (n(i)(a + 1) + r(i)(W + 1))` such that, for every side `S″` whose letter jumps fit
`(η, −ε(i), b(i), W)` and every pairing of `S″` and `S`, the pairing gives a scaled cup coboundary of exponent `0` for all
`c ∈ C″` and `d ∈ V`.

*Needs:* 3.1, 3.2, 3.3a (b), (c), (d), (e), (f).

[ShortProof], `New/Congruences/Lifting/FewLowJumps.lean`
(`New.Lift.KummerChart.PairingSide.exists_relLength_le_and_isScaledCupCoboundary`), `New/Congruences/Lifting/DeepPoints.lean`
(`New.Lift.KummerChart.PairingSide.pointsOver_nonempty_of_noMultipleNear`)

### 3.6 From sides to lattices: dual defects and cup exponents

*Origin:* particular to this proof: for a crystalline lattice over an unramified base whose jumps lie in a low window and
in far windows opposite to those of a class of crystalline lattices, the dual defect vanishes when there is no small
negative jump and is `O(f(m(a + 1) + rank·(W + 1)))·len(O/p)` when there are at most `m` low jumps, and explicit cup
exponents hold for sparse and for arbitrary patterns of large weights.

*Method of the formal proof:* the *universal side* of `L` has parameters `C = Z_f(L)` with the trivial action, `α` the
identity, and letter jumps `U_k(i)`. Every lattice of the class `𝒞(⊤, ⊥, U)`, restricted to `Γ′`, is a side with letter
jumps from `U`, and every pairing with `L` is a pairing of sides. A crystalline cocycle `x` is cup-orthogonal as soon as
all such pairings give scaled cup coboundaries at `(c, x)`. The vanishing in (a) is 3.3a (i) with `κ = 0`, as `E^a` kills
the three cokernels by 3.3a (d) and `d = 0`. Then 3.5 gives the bound in (a) (the `ℤ_p`-colength, times `f`, bounds the
`O`-length), and 3.4 and 3.3 give (b) and (c).

Let `j` be an open embedding, `O` the ring of integers of a finite extension of `ℚ_p`, `k` a Kummer chart of `Γ`, `ζ` a letter
root in `O`, `U`, `U′` finite sets of integers for the embeddings of `O`, and `L ∈ 𝒞(⊤, ⊥, U′)`. Prove:

1. (a) let `k` be unramified, `p ≥ 5`, `η ≥ 1`, and at each letter `b(i) + W + η ≤ (p − 3)a`, `6(a + η + W) < b(i)` and
   `NoMult(p, 6(a + η + W), b(i))`. Let `U_k(i)` fit `(η, −ε(i), b(i), W)` and `U′_k(i)` fit `(η, ε(i), b(i), W)`. Then
   `δ_{𝒞(⊤,⊥,U)}(L) = 0` if no member of any `U(g)` or `U′(g)` lies in `[−a, 0)`, or if every `U′(g) ⊆ [−η, 0]`. And if
   `Σ_{|u|≤η} j_g(L, u) ≤ m` for every `g`, then `δ_{𝒞(⊤,⊥,U)}(L) ≤ 11f(m(a + 1) + rank_O L·(W + 1))·len_O(O/p)`;
2. (b) let `k` be unramified, `p ≥ 7`, `η ≥ 1`, `V + 4η ≤ M`, `0 < G ≤ b`, `b < Kp²`, `2G < Kp`, `M ≤ K`, and let `U_k(i)` and
   `U′_k(i)` fit opposite windows `(η, ∓ε(i), β(i), V)`, with `β = b` on a set `T` of letters and `G` off it. Then `L` has cup
   exponent `10⁴(K + ⌊log_p(2(b + M))⌋)` for `𝒞(⊤, ⊥, U)`;
3. (c) under the window hypotheses of 3.3 for `U_k`, `U′_k`, the sparseness of `T`, and the alternative and size conditions
   of 3.3 (with `M` in place of `X`), `L` has cup exponent `10³(δ + (J + 1)M)` for `𝒞(⊤, ⊥, U)`.

*Needs:* 3.1, 3.2, 3.3, 3.3a (d), (i), 3.4, 3.5.

[ShortProof], `New/Congruences/Lifting/CupOrthogonalityBounds.lean`
(`New.Lift.KummerChart.dualDefect_eq_zero_and_dualDefect_le`, `New.Lift.KummerChart.hasCupExponent_any_pattern`,
`New.Lift.KummerChart.hasCupExponent_sparse_thick`, `New.Lift.KummerChart.universalSide`)

### 3.7 Tame inertial types over `ℚ_p`

*Origin:* particular to this proof: for potentially crystalline lattices over `ℚ_p` of tame inertial type, with jumps in
two opposite windows small against `p`, a power of `p` that depends on the type and the windows but not on the
ramification makes crystalline cocycles cup to zero with those of the paired lattices; nearest published result:
Caraiani, Emerton, Gee and Savitt (2022), §3.1, extensions of Breuil–Kisin modules with tame descent data in height one.

*Method of the formal proof:* take a tame chart, a Kummer chart with an inertia element `s` acting on `z` by a primitive
`e`-th root of unity modulo `p`, with `e = lcm_{i≤r}(p^i − 1)`. Tame charts exist when `j` is onto and `r < p`. Over its
subgroup, every lattice of the class is crystalline, since `X^e − 1` kills inertia on the periods. A monic `q` of degree at
most `N` that kills `s` on the periods makes `p^κ`, `κ = r²(N + 1)²`, kill the cokernels (3.3a) of the two sides and of
the Tate dual side at every letter. Then 3.3a (i) applies with `a = 0`, and `d ≤ 1` on a tame chart.

Let `j` be a surjective open embedding (so `K = ℚ_p`), `F` a filter on `Γ`, and `K` a relation such that `K(s, ·)` is a tame
type for `(p, r, N)` for every `s` with `j(s)` inertial. Let `L ∈ 𝒞(F, K′, U′)` with `K′(s, Q) = K(s^{−1}, Q)`, and let every
`U(g)` fit `(η, −ε, b, W)` and every `U′(g)` fit `(η, ε, b, W)` for one sign `ε`. If
`p > b + 6(W + η) + r²(N + 1)² + 2`, prove that `L` has cup exponent `3r²(N + 1)² + 150(η + W + 1)` for `𝒞(F, K, U)`.

*Needs:* 3.1, 3.2, 3.3a (i); CrystallineRepresentationsAndKisinModules §5.9 (the membership criterion for the Kisin module of a lattice `L`
crystalline over `Γ′`, over a Kummer chart, in the notation of 3.3a: with `N(L)` the `Λ[[z]]`-module of the
`x ∈ M(L)` that a power of `τ` multiplies into `A_inf ⊗ L`, with `μ(φ^n x) ∈ B_dR^+` for `n ≥ 1` and `μ(x) ∈ 𝒦₀` for
all forms `μ`, an `x ∈ M(L)` lies in `N(L)` exactly when a power of `τ` multiplies it into `A_inf ⊗ L` and, for some
`n`, `E^n·μ(x)` lies in the image of `𝔅` for every form `μ` whose restriction to `1 ⊗ L` comes from a `ℤ_p`-linear
map `L → B_max`; here `𝔅 ⊂ B^+` is the ring of the elements whose multiplication commutes with every
`Λ[[z]]`-linear endomorphism of `B^+` that preserves the image of `A_max`);
CrystallineRepresentationsAndKisinModules §§3.1, 3.7 (for a potentially crystalline lattice `L` and `s ∈ Γ` with `j(s)` inertial, the `B_max`-linear
operator `β_s` of `B_max ⊗ L` that acts as `s ⊗ s` on the periods of `L` exists and is unique, with
`β_{s^n} = β_s^n`, `β_{st} = β_sβ_t` for inertial `s`, `t`, and `β_s = 1` for inertial `s` near `1`; a polynomial `Q`
over `O` kills `s` on `L` if `L` is potentially crystalline and `Q(β_s) = 0`).

[ShortProof], `New/Congruences/Lifting/CupOrthogonalityBounds.lean` (`New.Lift.hasCupExponent_of_isTameType`),
`New/Congruences/Lifting/TameCharts.lean` (`New.Lift.TameChart.killsCokernel_of_isKilledBy`, `New.Lift.exists_tameChart`)

## Layer 4: The local loss above ℓ

On the data, at a place above `ℓ`: the weights of a main summand, the unit of the local loss, how b-places sit in a
Galois orbit, and the bound for the defect of the dual of each summand of a lift. The bound is uniform in `ℓ`. It is
`O((m/k)(b v_ℓ(M) + λ))` per unit of rank, where `λ` is the `ℓ`-adic valuation of an explicit product of integers near
`b`.

### 4.1 Main summand weights, the crystalline loss and the defect bound

*Origin:* definitions and conventions.

Let `D` be the data, `ℓ` a prime and `ι : ℂ ≅ ℚ̄_ℓ`.

- For a complex embedding `σ` of `E`, `ε(σ) = 1` if `σ` lies in the CM type and `−1` otherwise. For `e : E → ℚ̄_ℓ` and
  `g ∈ G_{ℚ_ℓ}`, `σ_e(g) = ι^{−1} ∘ g^{−1} ∘ e` is a complex embedding of `E`, and `γ_g : O → ℂ_ℓ`, `x ↦ g(x)`, is an embedding
  of a coefficient ring.
- *Main summand weights* `(r′, t′, J)`, with `J(σ)` a multiset of integers for each complex embedding `σ`, satisfy
  `1 ≤ r′ ≤ r`, `t′ ≤ t`, and three conditions. For one `j ≤ m`, every `u ∈ J(σ)` is low, `Δ ≤ 4|u| ≤ 8mΔ`, or high,
  `|ε(σ)u + w_j(σ)| ≤ t`. At most `r′m/k_D` members of `J(σ)` have `|u| ≤ 2h₂²`. At most `r′` members of `J(σ)` and `J(σ̄)`
  together are negative.
- The *crystalline loss* is `λ(h, b, ℓ) = v_ℓ((2b)!·(∏ n)^{h³})`, the product over the integers `n` with
  `max(b − 30h³, 0) < n ≤ b + 30h³`. The *defect bound* is `B_ℓ = 10⁶(m/k_D)(b·v_ℓ(M) + λ(h₂, b, ℓ))`.
- The *far window start* at `σ` for `i ≤ m` is `S_i(σ) = b` if the place of `σ` is a b-place and `G_off` otherwise, plus
  `iΔ + h₂ − 2t`.
- The *summands* of a lift with main summand `T` are `T` itself and, for `0 ≤ c < t′`, the characters `O(−c)`, the `c`-th
  power of the inverse cyclotomic character.
- For a matrix representation `u` of `G_E` over `O` and a place `v | ℓ`, `Z_f(u)_v` is the module of crystalline cocycles
  (3.1) of the decomposition group at the chosen place above `v`. That group is identified with an open subgroup of
  `G_{ℚ_ℓ}` through a chosen embedding `Ω → ℚ̄_ℓ` that induces the place. The *crystalline relations* of `u` are the
  relations supported on some decomposition group above `ℓ` that hold on `Z_f(u)_v`.
- For a finite family of representations `u_x : G → GL_σ(O)` and `ρ : G → GL_d(O)`, `Rib(u, ρ; a)` is the module of
  Ribet cocycles of `ρ` with values in `O/a`, in the sense of CongruencesOfTwistedThetaLifts §3.1 (2).

*Needs:* 3.1; CongruencesOfTwistedThetaLifts §3.1 (Ribet cocycles);
OneSidedPrimeSumBoundsAndAdmissibleData §2.2 (the field `E`, its infinite places and its CM type),
§3.2 (the data: `m`, `r`, `k_D`, `t`, `b`, `G_off`, `h₂`, `Δ`, the lift weights `w_j`, the b-places, `M`).

[ShortProof], `New/Congruences/LocalLoss/Basic.lean` (`New.Selmer.IsMainSummandWeights`, `New.Selmer.crystallineLoss`,
`New.Selmer.defectBound`, `New.Selmer.cmSign`, `New.Selmer.summandRep`, `New.Selmer.crysCocyclesAt`,
`New.Selmer.crysRelations`, `New.Selmer.ribetCocycles`), `New/Congruences/LocalLoss/CrystallineDefect.lean`
(`New.Selmer.farWindowStart`)

### 4.2 b-places in a Galois orbit above ℓ

*Origin:* particular to this proof: two b-places read through one embedding `E → ℚ̄_ℓ` have the same CM sign when `ℓ`
divides `q₁d`, and no three of them follow one another at short distances in an orbit of Frobenius when `ℓ ≤ k_D t`.

*Method of the formal proof:* the infinite places of `E` form the group `(ℤ/q₁)^×` through the action on `ζ`. The ratio of
the places read by `g` and `g′` is `ε(σ)ε(σ′)ℓ^n` modulo the part of `q₁` prime to `ℓ`, when `g′g^{−1}` raises `ζ^{ℓ^a}` to
the power `ℓ^n`. Sparseness of the b-places excludes three of them at exponents `0 < i < n < l₀(s)`. For the signs: b-places
are `≡ −1 (mod q₀)`. If `ℓ | q₁`, `g g′^{−1}` would send `(1 + √−d)/2` to its conjugate, both would have norm `< 1`, and
their sum is `1`. If `ℓ = d`, a similar argument applies.

Let `e : E → ℚ̄_ℓ`, `ζ` the root of unity of order `q₁` of the data, and `g, g′, g₁ ∈ G_{ℚ_ℓ}`. Prove:

1. (a) if `ℓ ≤ k_D t`, `0 < i < n < l₀(s)`, `g′g^{−1}` raises `e(ζ)^{ℓ^a}` to the power `ℓ^n` and `g′g₁^{−1}` raises it to
   the power `ℓ^i`, and the places of `σ_e(g)` and `σ_e(g′)` are b-places, then the place of `σ_e(g₁)` is not;
2. (b) if `ℓ | q₁d` and the places of `σ_e(g)` and `σ_e(g′)` are b-places, then `ε(σ_e(g)) = ε(σ_e(g′))`.

*Needs:* 4.1; OneSidedPrimeSumBoundsAndAdmissibleData §2.1 (the parameters `q₀`, `d`, and the numbers `q₁`, `l₀`),
§2.2 (the root of unity `ζ`, and the infinite places of `E` as the group of units modulo `q₁`),
§3.1 (sparse sets of places), §3.2 (the b-places, their class `−1` modulo `q₀` and their sparseness for the primes up to
`k_D t`).

[ShortProof], `New/Congruences/LocalLoss/Basic.lean` (`New.Selmer.notMem_bPlaces_of_short_arc`,
`New.Selmer.cmSign_eq_of_mem_bPlaces`, `New.Selmer.placeClass_eq_cmSign_mul_pow`)

### 4.3 Cocycles that obey the relations among the `u(g) − 1`

*Origin:* adapted from the Artin–Rees lemma, which is classical: here a cocycle that obeys every linear relation
among the families `(u_x(g) − 1)_x` is, up to multiples of a power of `a`, the graph of an equivariant map on a
subrepresentation.

*Method of the formal proof:* `Y` is the image of `(θ, v) ↦ (Σθ_g(u_x(g) − 1) + a^{k+1}v, Σθ_g c(g))`. It is stable under
`G` by the cocycle rule. By Artin–Rees for `(a)`, the elements of the span of the `u(g) − 1` that are divisible by `a^{k+1}`
lie in `a` times the span, where the map vanishes because `a` kills its values; so the first projection is injective on
`Y`.

Let `O` be a noetherian ring, `a ∈ O`, `X` a finite set, `u_x : G → GL_σ(O)` and `ρ : G → GL_d(O)` representations of a group
`G`, and `c ∈ Rib(u, ρ; a)`. Prove that there are `k ≥ 0` and a `G`-stable `O`-submodule `Y` of `(∏_x M_σ(O)) × (O/a)^d`,
with `G` acting by left multiplication by `(u_x(g))_x` on the first factor and through `ρ` on the second, such that the
first projection is injective on `Y` and `((u_x(g) − 1)_x + a^k v, c(g)) ∈ Y` for every `g ∈ G` and every `v`.

*Needs:* 4.1.

[ShortProof], `New/Congruences/LocalLoss/Basic.lean` (`New.Selmer.ribetCocycles.exists_graph_subrepresentation`)

### 4.4 The rank of crystalline cocycles, and defects from cup exponents

*Origin:* adapted from the dimension formula of Bloch and Kato (1990) for `H¹_f`: here the `O`-rank of the
crystalline cocycles of a lattice at a place of a CM field above `ℓ`, counted by the negative Hodge–Tate jumps at the
complex embeddings read through that place; and the passage from a cup exponent to a bound for the dual defect.

*Method of the formal proof:* (a) is the rank formula over `ℤ_ℓ` for the underlying `ℤ_ℓ`-lattice, with the jumps counted
in two ways and the ranks divided by `[O : ℤ_ℓ]`. For (b), the defect is the length of a quotient of `Z_f(L)/ℓ^k`, which is
free over `O/ℓ^k` of rank `rank Z_f(L)`. By the rank formula this rank is at most `2[G_ℓ : j(Γ)]·rank L`.

Let `E` be a CM field, `e : E → ℚ̄_ℓ`, `Γ` with `j : Γ → G_{ℚ_ℓ}` an open
embedding onto the elements fixing `e(E)`, `O` a coefficient ring and `L` a potentially crystalline lattice. Prove:

1. (a) if for every `g ∈ G_{ℚ_ℓ}` the lattice `L` has the jumps `J(σ_e(g))` at `γ_g`, then
   `rank_O Z_f(L) = rank_O L + Σ_σ #{u ∈ J(σ) : u < 0}`, the sum over the distinct complex embeddings `σ = σ_e(g)`;
2. (b) (for any `Γ` with `j` of open image) if `L` has cup exponent `k` for a class `𝒬` and `y ≥ 2k·rank L`, then
   `len_ℓ δ_𝒬(L) ≤ [G_{ℚ_ℓ} : j(Γ)]·y`.

[ShortProof] proves (a) for a CM field that contains a primitive `5040`-th root of unity, which is the case of the
data and the only one used; the rank formula does not need the root of unity.

*Needs:* 3.1, 4.1; CrystallineRepresentationsAndKisinModules §§3.4, 4.2 (the rank formula for crystalline cocycles: for a potentially crystalline
`ℤ_ℓ`-lattice `T` with jumps `J` over a group of index `n`, `rank Z_f(T) = rank T + n·#{u ∈ J : u < 0}`).

[ShortProof], `New/Congruences/LocalLoss/CrystallineCocycles.lean` (`New.Selmer.finrank_crysCocycles_eq_add_neg_jumps`,
`New.Selmer.normLength_dualDefect_le_of_hasCupExponent`)

### 4.5 The dual defect under crystalline size conditions

*Origin:* particular to this proof: a bound for the normalised dual defect of a crystalline lattice whose jumps lie in
windows at b-letters and at the other letters, in terms of the crystalline loss, uniform in `ℓ`.

*Method of the formal proof:* write `λ = λ(h, b, ℓ)` and `K = ⌊2λ/Q⌋`. If `ℓ ≤ Q`, the b-letters are sparse and 3.6 (c)
gives a cup exponent `10⁴Kx` with `x ≤ m`. If `ℓ > Q`, the chart is unramified. Then if `λ ≥ h³`, 3.6 (b) gives such an
exponent; otherwise `ℓ` divides no integer near the windows, and 3.6 (a) gives the bound directly. Exponents become defects
by 4.4 (b).

Let `j : Γ → G_{ℚ_ℓ}` be an open embedding, `O` a coefficient ring, `L` a lattice, and for each embedding `g` of `O` a
sign `ε(g)` and finite sets `U(g)`, `U′(g)`, and let some of the embeddings be called *thick*. Let `Q, m, h, μ, G, b, δ, η, W ≥ 0` satisfy
the size conditions: `Q > 0`, `99(Q² + (W + 1)Q + Q + W + m) ≤ h`, `99h³ ≤ G`, `99(Gh³ + G) ≤ b`, `2 log(4b) < m`, `δ < η` and
`99((η + W)Q + η + h) ≤ h³`. Put `a(g) = b + δ` if `g` is thick and `G + δ` otherwise. Assume:

- `U(g)` fits `(η, −ε(g), a(g), W)`, `U′(g)` fits `(η, ε(g), a(g), W)`, and `L ∈ 𝒞(⊤, ⊥, U′)`;
- either every negative member of every `U(g)`, `U′(g)` is at most `−h/2` and `Σ_{|u|≤η} j_g(L, u) ≤ μ` for every `g`, or every
  `U′(g) ⊆ [−η, 0]`;
- `y ≥ 10⁵(rank L·⌊2λ/Q⌋·m + μλ)` with `λ = λ(h, b, ℓ)`;
- `k` is a Kummer chart of `Γ` with `ef = [G_{ℚ_ℓ} : j(Γ)]` and `e ≤ h`, and `ζ` is a letter root in `O`. For thick `g`,
  and for all `g` if `Q < ℓ`, `g` is thick exactly when `T(g(ζ))`, and `ε(g) = s(g(ζ))`, for fixed `T`, `s` on `ℂ_ℓ`. Either
  `k` is unramified and `ℓ ≥ 7`, or `ℓ ≤ Q` and `s` is constant. If `ℓ ≤ Q`, there are no `x` and `1 ≤ a, a′ ≤ log_ℓ h³`
  with `T(x)`, `T(x^{ℓ^a})` and `T(x^{ℓ^{a+a′}})`.

Prove that `len_ℓ δ_{𝒞(⊤,⊥,U)}(L) ≤ [G_{ℚ_ℓ} : j(Γ)]·y`.

*Needs:* 3.1, 3.2, 3.6, 4.1, 4.4.

[ShortProof], `New/Congruences/LocalLoss/CrystallineCocycles.lean`
(`New.Selmer.normLength_dualDefect_le_of_crystallineSizes`, `New.Selmer.CrystallineSizes`, `New.Selmer.LettersReadThick`,
`New.Selmer.HasFewLowJumps`)

### 4.6 The defect of the dual of a summand at a place above ℓ

*Origin:* particular to this proof: at a place above `ℓ`, for lattices of a crystalline class, or of a tame class at the
level primes, adapted to the summands of a lift, the normalised dual defect of the Tate dual of each summand is at most
`[G_ℓ : Γ]·rank·B_ℓ/x`, with `x = 1` for the main summand and `x = t` for the characters.

*Method of the formal proof:* the jumps of the main summand lie, at each embedding, in `[−η, η]` with `η = h₂² + 1` or in
the far window `∓ε(σ)·[S_i(σ), S_i(σ) + 4t]`, and those of the dual are `−u − 1`. The data satisfy the size conditions of
4.5 with `Q = k_D t`, `h = h₂`, `G = G_off` and `W = 4t`. 4.2 provides the reading of thickness and sign through a letter
root for large coefficient rings, with sparse b-letters for small `ℓ`. The main-summand weights give few low jumps. 4.5
then gives a bound that is compared with `B_ℓ`. In the tame case (`ℓ = p₀` or `p₁`), 3.7 gives the exponent, and it is
compared with `b·v_ℓ(M)`.

Let `ι : ℂ ≅ ℚ̄_ℓ`, `e : E → ℚ̄_ℓ`, `j : Γ → G_{ℚ_ℓ}` an open embedding onto the elements fixing `e(E)`, and `(r′, t′, J)` main
summand weights. Prove that for all large coefficient rings `O` the following holds. Let `(L_x)`, `x ∈ {∗} ∪ {0, …, t′ − 1}`,
be lattices over `O`, and `𝒞 = 𝒞(F, K, U)` a class, such that:

- either `ℓ = p₀` or `ℓ = p₁` and `K(s, ·)` is a tame type for `(ℓ, r, (r + t)r)` for every inertial `s`, or `F = ⊤` and
  `K = ⊥`;
- every `u ∈ U(γ)` is a jump at `γ` of some `L_x`;
- `L_∗` has rank `r′` and the jumps `J(σ_e(g))` at `γ_g` for every `g`, and `L_c` has the single jump `c` at every `γ_g`.

Then for every `x` with `L_x ∈ 𝒞`, `len_ℓ δ_𝒞(L_x^∨(1)) ≤ [G_{ℚ_ℓ} : j(Γ)]·rank(L_x)·B_ℓ/x′`, with `x′ = 1` for `x = ∗` and
`x′ = t` otherwise.

*Needs:* 3.7, 4.1, 4.2, 4.4, 4.5.

[ShortProof], `New/Congruences/LocalLoss/CrystallineDefect.lean` (`New.Selmer.summand_defect_le_at_place`,
`New.Selmer.IsSummandClass`, `New.Selmer.crystallineSizes_data`)

### 4.7 Non-crystalline cocycles modulo `ℓ^m` bounded by the Tate dual

*Origin:* particular to this proof: by local Tate duality, the cocycles modulo `ℓ^m` that obey the relations among the
`u_x(g) − 1`, but fail the crystalline relations of `L`, are no longer than the dual defect of `L^∨(1)` for a class that
contains the `u_x` and `L`.

*Method of the formal proof:* the restriction along `η` of a cocycle of `Rib(u, ρ; ℓ^m)` comes from a crystalline cocycle
of a lattice of the class. 4.3 gives an equivariant graph, whose lattice is in the class because the class is stable under
the operations used. A divisibility of indices from local Tate duality for crystalline cocycles then bounds the module of
such maps modulo the reductions of `Z_f(L)` by `δ_𝒞(L^∨(1))`. Obeying the relations that hold on `Z_f(L)` is weaker than being
a reduction of `Z_f(L)`.

Let `j : Γ → G_{ℚ_ℓ}` be an open embedding, `R` the ring of integers of a finite extension of `ℚ_ℓ`, `η : Γ → G` a
homomorphism, `u_x : G → GL_n(R)` (`x` in a finite set) and `ρ : G → GL_d(R)` representations. Let the lattices of all
`u_x ∘ η` and the lattice `L` of `ρ ∘ η` lie in a class `𝒞 = 𝒞(F, K, U)`. Prove that, for every `m`, the module `Rib(u, ρ; ℓ^m)`,
modulo its members whose restriction along `η` obeys all relations that hold on `Z_f(L)`, has length at most
`δ_𝒞(L^∨(1))`.

*Needs:* 3.1, 4.1, 4.3; IdelicReciprocityCountsAndCyclotomicClassGroups §5.2 (local Tate duality for crystalline cocycles, as one divisibility of
indices. Let `j : Γ → G_{ℚ_ℓ}` be an open embedding, `L` and `L′` potentially crystalline lattices over `ℤ_ℓ` with a
perfect pairing `b : L′ × L → ℤ_ℓ` such that `b(gx, gy) = χ(g)·b(x, y)`, `m ≥ 0`, and `q : L → V` an equivariant
surjection onto a finite discrete `Γ`-module with kernel `ℓ^mL`. A map `s : Γ → V` is *cup-orthogonal* to a subgroup
`H` of the maps `Γ → L′` if it is a continuous cocycle and has a lift `a : Γ → L`, `q∘a = s`, such that for every
`c ∈ H` the 2-cochain `(g, h) ↦ ε_m(b(g·c(h), a(g)))` with values in `ℚ̄_ℓ^×` is a continuous coboundary. Let `H` be
any such subgroup and `S` any subgroup of the maps `Γ → V`. If `q∘z` for every `z ∈ Z_f(L)` and every member of `S`
are cup-orthogonal to `H`, then `[S : S ∩ q(Z_f(L))]` divides `[Z_f(L′) : H ∩ Z_f(L′)]`, where `q(Z_f(L))` is the
group of the maps `q∘z`).

[ShortProof], `New/Congruences/LocalLoss/TateDualBound.lean` (`New.Selmer.relLength_ribetCocycles_le`,
`New.Selmer.comesFromClass_of_mem_ribetCocycles`, `New.Selmer.relLength_le_of_comesFromClass`)

### 4.8 Tame classes from roots of unity, and lattices read at a place above ℓ

*Origin:* particular to this proof: polynomial conditions defined by roots of unity of orders `ℓ^a − 1` are tame types,
and a lattice in a conjugate self-dual representation of given level lies, at each place above `ℓ`, in the class given
by its jumps, crystalline away from `p₀p₁` and with the inertia polynomials of the representation at `p₀p₁`.

*Method of the formal proof:* a root of `y^{ℓ^a − 1} = 1` is a Teichmüller lift in the unramified ring of degree `a ≤ r`, so
its minimal polynomial over `ℤ_ℓ` is monic of degree at most `r`; take the product. For the lattices, the jumps,
admissibility and killing polynomials pass from `ℚ̄_ℓ` to a lattice over `O` by an equivariant embedding.

Prove:

1. (a) let `M` be a multiset of at most `N` elements of `ℚ̄_ℓ`, each with `y^{ℓ^a − 1} = 1` for some `1 ≤ a ≤ r`, and let a
   property `K` of polynomials over `O` hold for every polynomial `Q` with `Q(y) = 0` for each element `y` of `M`
   (no multiplicity is asked: `X^e − 1`, which has simple roots, is such a polynomial when its roots include the
   elements of `M`). Then `K` is a tame type for
   `(ℓ, r, Nr)`;
2. (b) let `R` be a conjugate self-dual representation of level `S` with jumps `τ`, in a class `𝓡` of such representations,
   `u` a lattice in `R` over `O`, and `w | ℓ` a place of `E`. Then `u`, restricted to the decomposition group at `w`, has
   at `γ_g` the jumps `τ(ι^{−1} ∘ g^{−1} ∘ e_w)`. It lies in the class `𝒞(F_w, K_w, U_w)`, where `F_w` is `⊤` if `w ∤ p₀p₁` and
   `⊥` otherwise, `U_w` are the corresponding members of `τ`, and `K_w(s, Q)` says that `w | p₀p₁` and that `Q` kills `s` on
   every member of `𝓡`, restricted to the decomposition group at `w`.

*Needs:* 3.1, 4.1; CongruencesOfTwistedThetaLifts §1.1 (the local conditions: finite type, jumps and killing polynomials
at a place), §1.2 (conjugate self-dual representations of given level); CrystallineRepresentationsAndKisinModules §2.4 (Teichmüller lifts in the
Witt vectors of a finite field, embedded in `ℚ̄_ℓ`: every root of `y^{ℓ^a − 1} = 1` is one).

[ShortProof], `New/Congruences/LocalLoss/LocalLattices.lean` (`New.Selmer.isTameType_of_roots`,
`New.Selmer.hasJumps_and_inClass_localLattice`, `New.Selmer.IsConjSelfDualOfLevel.inClass_localLattice`)

## Layer 5: The twisting theorem on the data

The general twisting theorem of Layer 2 is applied to the lattices of finitely many representations of main-summand type
and to Stickelberger systems built from the `L`-values of the ramified pairs. The character it gives is read as the
`ℓ`-adic avatar of a tame character of `U(1)`.

### 5.1 Main summands are Selmer data

*Origin:* particular to this proof: over all large coefficient rings, a lattice in a representation of main-summand type
is a Selmer datum with the crystalline relations above `ℓ`, whose number is at most `(4f_D + 3)·rank·v_ℓ(n_GL)`.

*Method of the formal proof:* the span condition and the scalar `γ_*` are hypotheses on main summands. Conjugate
self-duality on traces makes `γ_*^{−c}` act by the same scalar. The rank condition on the `Z_w` follows from the rank
formula (4.4 (a)) and the bound on negative jumps. The global term is bounded through an element with cyclotomic
character `p_l^{rank}` acting by a scalar `α`: `α − χ(g^c)α′ = (1 − p_l^{rank})α` kills `Hom_G(W_a, W_a^{*c})`, and
`p_l^{rank} − 1` divides `n_GL`. The local terms at the places above `p₀p₁` are bounded by local duality and the
determinant bounds of the hypotheses.

Let `D` be the data, `ι : ℂ ≅ ℚ̄_ℓ`, and `R` a representation of main-summand type of rank `n` for some `(t′, J)`. Let `w` be
a chosen place not above `ℓ` and `g₀` its tame generator. Prove that for all large coefficient rings `O` there is a Selmer
datum `T` for (the bad places, `g₀`) over `O` such that `ρ_T` is a lattice in `R`, `S_T` is the set of places above `ℓ p₀ p₁`,
the local relations of `T` are the crystalline relations of `ρ_T`, and `len_ℓ β_T ≤ (4f_D + 3)·n·v_ℓ(n_GL)`.

*Needs:* 1.1, 4.1, 4.4, 4.8; CongruencesOfTwistedThetaLifts §1.3 (main summands: the hypotheses on an `ℓ`-adic
representation of `G_E` under which its Selmer groups are estimated), §1.1 (bad places);
DivisibilityOfThetaDerivatives §1.5 (the chosen places, over whose residue fields `n_GL` is the order of `∏ GL_{rt}`).

[ShortProof], `New/Congruences/Selmer/MainSummands.lean` (`New.Selmer.IsMainSummandLike.eventually_exists_selmerDatum`,
`New.Selmer.IsMainSummandLike.normLength_congruenceTerm_le`)

### 5.2 L-values of a ramified pair as integral measures, and avatars of tame characters

*Origin:* adapted from the `p`-adic `L`-functions of CM fields (Katz (1978)) and from theta elements (Bertolini and
Darmon (1996); Chida and Hsieh (2018)), integral group-ring elements that interpolate twisted Hecke `L`-values, with
Euler-factor norm relations: here, for a pair
ramified at the chosen places, a function of the tame characters of `U(1)` that is, at each modulus, evaluation on a
group-ring element integral at every prime away from the modulus, and gives at twists a power of the absolute value of
the ratio of twisted to untwisted partial `L`-values.

*Method of the formal proof:* for `z ≥ 2` the function is an integral multiple of the algebraic part of the `L`-value, the
squared norm of a theta lift from `U(1)`. For `z = 1` it is a determinant theta period on `U(2)` times its conjugate, which
gives the square of the ratio. Adding a place to the modulus multiplies the element by Euler factors. For the avatars, a
character for `I` comes from an idele class character `η`. Restricted to `U(1)(𝔸)`, `η` factors through the class group of
tame level `I`, so it comes from a tame character `μ`, and the Galois character is the avatar of `μ^{−1}`.

Let `D` be the data and `(ν, z)` a ramified pair. Prove:

1. (a) there is a function `F` on the tame characters of `U(1)` with: `F(1) ≠ 0`; at each modulus `Q`, finitely many points
   `u_a ∈ U(1)(𝔸)` and coefficients `c_a ∈ ℂ`, integral at every prime not dividing the norm of `Q` under every embedding
   `ℂ → ℂ_l`, with `F(ϑ′) = Σ_a c_a ϑ′(u_a)` for all `ϑ′` of modulus `Q`; for `v ∉ Q(ϑ)` and `ϑ′` equal to `ϑ` with `v` added to
   the modulus, `F(ϑ′) = F(ϑ)·∏_{l∈I} ∏_{δ=±1}(1 − (νϑ)_v(ϖ_v)^δ/Nv^l)`, the base change of `νϑ` read at a uniformiser at `v`;
   and `F(ϑ) = F(1)·N(Q_ϑ)^{m₀}·r(ϑ)^{m₀+1}` at every twist `ϑ`, with `r` the ratio of the pair. Here `(I, m₀) = ({z}, 0)`
   for `z ≥ 2` and `({0, 1}, 1)` for `z = 1`;
2. (b) for an auxiliary set `I` for the bad places, every character `ψ : G_E → ℚ̄_ℓ` for `I` is, for some tame
   character `τ` of modulus `I`, the `ℓ`-adic avatar of the base change of `τ^{−1}` to `E`.

*Needs:* NormsOfThetaLiftsAndExchangeIdentities §§2.5, 2.7, 6.1 (Hecke `L`-values as squared norms: from §2.5 the
integral algebraic part, from §2.7 the determinant theta period at `z = 1`, from §6.1 integral measures);
DivisibilityOfThetaDerivatives §1.6 (pairs); DeterminantsOfThetaLiftChains §1.1 (ramified pairs and the ratio of a
pair); OneSidedPrimeSumBoundsAndAdmissibleData §3.4 (tame characters and twists); IdelicReciprocityCountsAndCyclotomicClassGroups §9.1 (the `ℓ`-adic
avatar of an algebraic Hecke character: a continuous character of `G_E` whose value at most geometric Frobenius elements
is `ι` of the value of the Hecke character at a uniformiser, and which is given on the image of the Artin map by the
Hecke character).

[ShortProof], `New/Congruences/Selmer/ClassSums.lean` (`New.Data.CriticalPair.exists_isTwistMeasure`,
`New.Data.CriticalPair.IsTwistMeasure`, `New.Selmer.exists_tameChar_invAvatar_eq`)

### 5.3 The Stickelberger systems of the L-values

*Origin:* particular to this proof: the integral measure of a ramified pair, mapped to the group rings of the `Cl_Q`, is
a Stickelberger system for the bad places and the tame generator at a chosen place, whose values at twists have the
`ℓ`-adic size of a power of the ratio of `L`-values.

*Method of the formal proof:* the elements are the images of the integral group-ring elements of 5.2 (a), read on `Cl_Q`
through `y ↦ y/ȳ`. The character `ϑ` is the `ℓ`-adic avatar of the base change of `ν^{−δ}`. It is unramified outside the bad
places, and at the tame generator of the chosen place it is a nontrivial root of unity with `v(ϑ(g₀) − 1) ≤ v(Nw − 1)`. The
Euler factors of 5.2 (a) give the norm relation, and the values at twists give the norms.

Let `D` be the data, `ι : ℂ ≅ ℚ̄_ℓ`, `δ = ±1`, `(ν, z)` a ramified pair, `w` a chosen place not above `ℓ` and `g₀` its tame
generator. Prove that there is a Stickelberger system `Y` for (the bad places, `g₀`) with:

1. (a) `β_Y ≤ v(1(Θ_∅)) + 4v(Nw − 1)`;
2. (b) for every twist `ξ` whose modulus `Q` is auxiliary for the bad places and whose inverse avatar `ψ`, the `ℓ`-adic avatar of the base change of `ξ^{−1}` to `E`, is a
   character for `Q`: `|ψ(Θ_Q)| = |1(Θ_∅)|·|ι(r)|^i`, where `r = |L(z, (νξ^δ)^{−1})|/|L(z, ν^{−1})|` is the ratio of the pair
   at `ξ^δ`, and `i = 2` if `z = 1`, `i = 1` otherwise;
3. (c) consequently, for such `ξ` and every `c ≥ 0`, `v(ψ(Θ_Q)) ≤ β_Y + c` implies `v(ι(r)) ≤ 4v(Nw − 1) + c`.

*Needs:* 2.3, 5.2; DivisibilityOfThetaDerivatives §1.5 (the chosen places), §1.6 (pairs); DeterminantsOfThetaLiftChains
§1.1 (ramified pairs and the ratio of a pair); OneSidedPrimeSumBoundsAndAdmissibleData §3.4 (twists); ShortGRH
background (the `ℓ`-adic avatar of an algebraic Hecke character: a continuous character of `G_E` whose value at most
geometric Frobenius elements is `ι` of the value of the Hecke character at a uniformiser, and which is given on the
image of the Artin map by the Hecke character; [ShortProof] `Lib/PadicHodge/Characters.lean` (`New.AlgHeckeChar.avatar`,
`New.AlgHeckeChar.avatar_apply_of_artinMap_eq`, `New.AlgHeckeChar.eventually_avatar_frob`)).

[ShortProof], `New/Congruences/Selmer/LValueSystems.lean` (`New.Selmer.exists_stickelbergerSystem_β_le_and_norm_eq`,
`New.Selmer.exists_stickelbergerSystem_ellVal_ratio_le`, `New.Data.CriticalPair.stickelbergerChar`)

### 5.4 The twisting theorem

*Origin:* particular to this proof: for finitely many representations of main-summand type, one tame anticyclotomic
character of `U(1)` all of whose first `m` powers have small ramification, make every twisted Selmer group (crystalline
above `ℓ`, with divisible coefficients) of length at most `e'_ℓ`, and keep every ratio of twisted to untwisted `L`-values
of a ramified pair of valuation at most `e'_ℓ`.

*Method of the formal proof:* take a chosen place `w₀` not above `ℓ`, with norm a level prime `p_{i₀}`, and its tame
generator `g₀`. 5.1 gives Selmer data over one large `O` with `len_ℓ β_T ≤ c = (4f_D + 3)r·v_ℓ(n_GL)` at the torsion level
`c + 2`. 5.3 gives one Stickelberger system for each ramified pair and sign. Apply 2.7 with `ε = 2^{−ℓ}`. 5.2 (b) reads the
character as the avatar of the inverse of a tame character `τ`; it is `m`-fold because all `ψ^j` ramify at every prime of
`Q`. The Selmer bound for a datum gives the crystalline Selmer bound for the twisted representation, and
`4v(p_{i₀} − 1) + 2^{−ℓ} ≤ e'_ℓ`.

Let `D` be the data, `ℓ` a prime, `ι : ℂ ≅ ℚ̄_ℓ`, and `R_i` (`i` in a finite set) representations of main-summand type
(each for some `t′`, `J`). Prove that there is an `m`-fold twist `τ` such that every `ξ = τ^j`, `1 ≤ j ≤ m`, satisfies:

1. (a) the modulus `Q` of `ξ` is auxiliary for the bad places, the inverse avatar `ψ` of `ξ` (5.3 (b)) is a character for `Q`, and
   `Σ_{w∈Q} v(ψ(γ_w) − 1) ≤ e'_ℓ` for some family of tame generators `γ_w`;
2. (b) for every `i` there are `γ` inertial at a place not above `ℓ` and `ζ ∈ ℤ̄_ℓ` such that, for all large `O`, `R_i` has a
   lattice over `O` on whose twist by `ψ` the element `γ` acts by the scalar `ζ`, with `ζ − 1` a unit. On that lattice, the
   module of cocycles with values in `Frac(O)/O` that are unramified outside `ℓ p₀ p₁`, `Q`, `Q̄`, obey the crystalline
   relations above `ℓ` and vanish at `γ` has `len_ℓ ≤ e'_ℓ`;
3. (c) for every ramified pair `(ν, z)` and every sign `s`, `v(ι(|L(z, (νξ^s)^{−1})|/|L(z, ν^{−1})|)) ≤ e'_ℓ`, the Euler
   factors at the chosen places, in the numerator also at `Q`, and at their conjugates being omitted.

*Needs:* 2.7, 5.1, 5.2, 5.3; CongruencesOfTwistedThetaLifts §1.3 (main summands), §1.5 (the crystalline Selmer length with
divisible coefficients; the number `e'_ℓ`), §4.1 (auxiliary twists);
OneSidedPrimeSumBoundsAndAdmissibleData §3.4 (`m`-fold twists).

[ShortProof], `New/Congruences/Selmer/TwistingTheorem.lean` (`New.Selmer.exists_mFoldTwist_hasDivisibleSelmerLengthLe`,
`New.Selmer.SelmerDatum.TwistedLengthLe.hasDivisibleSelmerLengthLe`)

## Downstream consumers

- CongruencesOfTwistedThetaLifts §§1.1 and 1.3 use the Hodge–Tate jumps of 3.1, the crystalline relations and the
  main summand weights of 4.1; its §6.1 uses the defect bound `B_ℓ` (4.1); its §§6.2 and 6.4 use classes of local
  lattices and dual defects (3.1), the defect of the dual of a summand (4.6), the bound by the Tate dual (4.7) and the
  class of a lattice read at a place above `ℓ` (4.8); its §7.3 uses the twisting theorem (5.4).

## Scope and ownership

### Owned here

- Selmer data, tied primes, auxiliary primes with a prescribed Frobenius element, Sah's lemma and the descent
  (Layer 1).
- Polynomial twists, Stickelberger systems, the restriction to a line, the estimate at roots of unity and the general
  twisting theorem (Layer 2).
- Lattices over a local Galois group, crystalline cocycles, classes, cup-orthogonality and dual defects; Kummer
  charts, sides and the walk; the exponent bounds and the bounds for dual defects (Layer 3).
- Main summand weights, the crystalline loss and the defect bound, and the local loss above `ℓ` on the data (Layer 4).
- Main summands as Selmer data, the `L`-values of a ramified pair as integral measures and Stickelberger systems, and
  the twisting theorem on the data (Layer 5).

### Not owned here

- The data, their sizes, tame characters and twists: OneSidedPrimeSumBoundsAndAdmissibleData.
- Pairs, the chosen places, ramified pairs and their ratios: DivisibilityOfThetaDerivatives §§1.5, 1.6 and
  DeterminantsOfThetaLiftChains §1.1.
- Hecke `L`-values as squared norms of lifts from `U(1)`: NormsOfThetaLiftsAndExchangeIdentities §§2.5, 2.7, 6.1.
- Conjugate self-dual representations of a level, main summands, Ribet cocycles, twisted lattices and Selmer lengths
  with divisible coefficients, and the use of the bounds of this roadmap in Ribet's method:
  CongruencesOfTwistedThetaLifts.
- The results named `ShortGRH background` on the *Needs:* lines: the Artin map, Chebotarev's theorem and the existence
  theorem, global duality with relations at split primes, lengths of kernels by maximal minors, Gauss valuations,
  the period ring `B_max` and crystalline cocycles, Kummer charts and Kisin modules, the rank formula, local Tate
  duality for crystalline cocycles, and avatars. Each entry names the form used and where `[ShortProof]` proves it.
- Twist selection and the local bounds in the forms of SelmerLengthBoundsAndLocalLifting, which owns them for the route
  of RiemannHypothesisForDirichletLFunctions. That roadmap states results with the same purpose as four sections here,
  in other forms; none of them is cited as a supplier, and the sections here are not restatements of them.
  - Its §3.25b (one specialisation for finitely many polynomials) and 2.6 here. There the polynomials have a
    coefficient of valuation at most `v₀` on a monomial of bounded degree (or are of a second kind), the roots of unity
    are powers of one primitive root, and the bound `v₀ + ε` holds for every power prime to `p`. In 2.6 (b) no
    coefficient or degree is prescribed: each polynomial comes with a point of radius `ρ`, and the loss `ε` is against
    its value there; the powers `j ≤ m` enter in 2.7 by composing with `X ↦ (1 + X)^j − 1`.
  - Its §3.26 (twist selection) and 2.7, 5.4 here. There the data are lattices with balanced saturated local conditions
    under the hypotheses of its §3.22, the bound is `ν_s + ε′` with `ν_s` the valuation of the order of
    `H⁰(F, ℚ_p/ℤ_p(t_sr_s))`, it holds for every power prime to `p`, and the side conditions are polynomial conditions
    of the two kinds of its §3.25b. Here the data are Selmer data given by relations on cocycles (1.1), the bound is
    `β_T + ε` with `β_T` the global term plus the places term, the side conditions are Stickelberger systems (2.3), and
    the powers are `1 ≤ j ≤ m`.
  - Its §4.10b (defect and colength under local duality) and 4.7 here. There, for a de Rham representation of the
    Galois group of a finite extension of `ℚ_p`, the length of the annihilator of a submodule `I ⊆ H¹_f` of the dual
    modulo the finite classes equals the colength of `I`. In 4.7 the statement is about cocycles, not classes: the
    module of Ribet cocycles modulo those that obey the crystalline relations is bounded by the dual defect
    `δ_𝒞(L^∨(1))`, which is defined by cup products with the crystalline cocycles of every lattice of a class (3.1).
  - Its §4.10f (lifting with loss for lattices of tame type over `ℚ_p`) and 3.7 here. There a surjection `T₁ ↠ T₂` of
    lattices of tame inertial type has `p^k·H¹_f(T₂) ⊆ f(H¹_f(T₁))` with `k = 40(N·r′ + η(N + r′))`, for weights in
    `[−η, η′]` and `40(η′N² + N³) < p`. In 3.7 the exponent `3r²(N + 1)² + 150(η + W + 1)` is a cup exponent, for two
    lattices whose jumps fit opposite windows `(η, ∓ε, b, W)`, with the tame type given by polynomials that kill
    inertia on the periods, for `p > b + 6(W + η) + r²(N + 1)² + 2`.

## Exact supplier contracts

### From CongruencesOfTwistedThetaLifts

§1.1 (the local conditions at a place: finite type, jumps, killing polynomials; bad places); §1.2 (conjugate
self-dual representations of a level); §1.3 (main summands); §1.5 (Selmer lengths with divisible coefficients, twisted
lattices, the twist allowance `e′_ℓ`); §3.1 (2) (Ribet cocycles).

### From OneSidedPrimeSumBoundsAndAdmissibleData

§2.1, §2.2 (the parameters, the field, its infinite places and CM type); §3.2, §3.3 (the data and their sizes); §3.4
(tame characters, twists and `m`-fold twists).

### From other roadmaps

DivisibilityOfThetaDerivatives §1.5 (the chosen places), §1.6 (pairs); DeterminantsOfThetaLiftChains §1.1 (ramified
pairs and ratios); NormsOfThetaLiftsAndExchangeIdentities §§2.5, 2.7, 6.1 (`L`-values as squared norms and integral
measures); ThetaLiftChainsAndTheSeesawIdentity §2.10 (the order `n_GL`).

## References

- `[ShortProof]`: the folder `grh` of <https://github.com/lsernau/grh-lean> at commit
  `72fead102f663d5c7a407964a13dc0cf9d977207`; this roadmap covers `src/New/Congruences/Selmer`,
  `src/New/Congruences/Lifting` and `src/New/Congruences/LocalLoss`.
- M. Bertolini, H. Darmon (1994): Lemma 2.21, Definition 2.22 and Lemma 2.23, cited in 1.5.
- M. Bertolini, H. Darmon, *Heegner points on Mumford–Tate curves*, Invent. Math. 126 (1996).
- S. Bloch, K. Kato, *L-functions and Tamagawa numbers of motives*, in The Grothendieck Festschrift I (1990).
- A. Caraiani, M. Emerton, T. Gee, D. Savitt (2022): §3.1, extensions of Breuil–Kisin modules with tame descent data,
  cited in 3.7.
- M. Chida, M.-L. Hsieh, *Special values of anticyclotomic L-functions for modular forms*, J. reine angew. Math. 741
  (2018).
- G. Gras, A. Munnier, *Extensions cycliques `T`-totalement ramifiées*, Publ. Math. Besançon (1998).
- N. Katz, *p-adic L-functions for CM fields*, Invent. Math. 49 (1978).
- B. Mazur, K. Rubin (2005), cited in 2.1.
- J. Nekovář, *Selmer complexes*, Astérisque 310 (2006).
