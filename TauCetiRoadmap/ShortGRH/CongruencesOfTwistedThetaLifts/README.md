# Roadmap: congruences of twisted theta lifts

**Summary.** The Riemann hypothesis for Dirichlet `L`-functions follows from a one-sided bound for a sum over primes,
which gives a zero-free half-plane. That bound comes from comparing two bounds for the covolume of a lattice of theta
lifts: an upper bound from a composite lift that is divisible at each prime, and a lower bound from the norms of the
lifts. The lower bound needs, prime by prime, a twist for which the theta lifts have few congruences with other forms:
the orthogonal projection onto the space of lifts must take integral forms (orthogonal to the false lifts) to forms
whose denominators are bounded, and the sum of these denominators over all primes must fit a fixed budget. This
roadmap proves that such twists exist. It is the first half of the congruence part of the lower bound; the second
half, SelmerBoundsForAnticyclotomicTwists, makes the Selmer groups small and bounds the local losses.

The headline theorems are these. (1) *Regular families of twists* (7.3): for all admissible data `D` there is an
`m`-fold twist `θ_ι`, of modulus prime to `ℓ`, for each prime `ℓ` and each `ι : ℂ ≃ ℚ̄_ℓ`, such that for every ramified
pair the inverse ratios of `L`-values at the first `m` powers of the twists and their inverses have height at most `x₁`,
and for each `1 ≤ j ≤ m` the denominators of the projections to the lifts at `θ_ι^j` are bounded by numbers `γ_ℓ`
whose sum over the primes is at most `f·a·(log b)³/(m·k)`. (2) *The bound for denominators* (6.9): if a twist `ϑ` has
small ramification and the space `Z` is spanned by lifts whose twisted main summands have short Selmer groups with
divisible coefficients, then an operator on `Z` whose determinant has `ℓ`-adic norm at least
`ℓ^(−dim Z·r·β_ℓ)` takes the projection to `Z` of every integral form orthogonal to the false lifts to an integral
form, where `β_ℓ` is a sum of explicit local losses, the twist allowance, an error term (class number and odd classes)
and `v_ℓ` of the order of the chosen general linear groups; the orders of the even classes do not enter. (3) *Ribet's
element* (6.5): for finitely many conjugate self-dual `ℓ`-adic representations, some of which have the trace of a
twisted main summand plus `t′` powers of the inverse cyclotomic character, there is one Hecke-side element, a
polynomial in tie variables at auxiliary places, that multiplies every `det(1 − u(g))` into the ideal of tied traces,
has no monomial properly dividing the product of the variables, and whose top coefficient has valuation at most
`sel + 2t′·ram + r′·loc + e_ℓ − 2v_ℓ(n_GL)`. (4) *Taylor–Wiles places in a triangle* (4.3): at every level `ℓ^ν` there
are auxiliary places, indexed by one finite ordered set, whose tame generators and Frobenius elements cut down the even
classes of the Tate twists one after another, up to a bounded power of `ℓ`. (5) *Main summands* (2.8): every Hecke
eigensystem of a good form on `W_m` has, for each lift index `j`, a rank-`r` representation that gives, for every
twist, the traces of the normalised representations of the lifted eigenforms up to `t` powers of the inverse
cyclotomic character.

The roadmap rests on OneSidedPrimeSumBoundsAndAdmissibleData for the data (fields, places, sizes, level, twists,
heights); on ThetaLiftChainsAndTheSeesawIdentity for the descent pairs and the good forms; on
DeterminantsOfThetaLiftChains for the lifts `W_j → V_j` and the main pairs; on
NormsOfThetaLiftsAndExchangeIdentities for the false lifts and the denominator predicate; and on
SelmerBoundsForAnticyclotomicTwists for the twisting theorem and the local losses above `ℓ`. Its regular families are
used by DeterminantsOfThetaLiftChains, which defines them and proves Theorem C with them.

Layer 1 fixes the Galois-theoretic notions: conjugate self-dual representations, representations of a type, main
summands, lift settings and Selmer lengths with divisible coefficients. Layer 2 attaches these to the forms of the
argument and produces main summands for the good eigensystems. Layer 3 is Ribet's method to first order as pure
algebra, over any group and any discrete valuation ring. Layer 4 builds the triangles of Taylor–Wiles places that
remove the even classes. Layer 5 builds the operators at the auxiliary places on the Hecke side. Layer 6 assembles
Ribet's element and the bound for denominators. Layer 7 chooses the twists and sums the bounds over the primes.

## Conventions and notation

Notation not restated here is that of OneSidedPrimeSumBoundsAndAdmissibleData §2.1 (the parameters), §2.2 (the field
and its infinite places), §3.2 (admissible data), §3.3 (their sizes), §3.4 (twists and the characters of the lifts)
and §4.1 (the unit of the errors), whose letters follow the reading guide of the formal proof, and of
DivisibilityOfThetaDerivatives §1.5 (the chosen places and the residue characters `ω`). Descent pairs, labels, good
forms and lifts are those of ThetaLiftChainsAndTheSeesawIdentity §2.16 (descent pairs), §2.18 (the descent pairs of
the chain), §2.5 (labels and the idempotent `e₀`), §2.7 (good forms) and of DeterminantsOfThetaLiftChains §2.1 (the
lift of a descent pair).

**Data and fields.** `D` is admissible data. `E = K(ζ)` is its CM field, `K = ℚ(√−d)`, `F = E⁺`, `f` the number of
infinite places of `E`, `Φ` its CM type, and for an embedding `σ : E → ℂ`, `ε(σ) = 1` if `σ ∈ Φ` and `ε(σ) = −1`
otherwise. `E` contains a primitive `5040`-th root of unity and lies in a cyclotomic field. `Ω` is a fixed algebraic
closure of `ℚ` containing `E`, `G_E = Gal(Ω/E)`, `c` a fixed complex conjugation and `g^c = c g c`. The two level
primes are `p₀, p₁`, `M = p₀p₁`, `N` is the level, and the *chosen places* are the places of `E` dividing `π_M` (half
of those above `M`). The *bad places* for a prime `ℓ` are the places of `E` dividing `ℓ·M·N`.

**Sizes.** `m` is the number of lifts, `r` and `k = r + 1 − m` the ranks, `t = 5r`, `Δ = 2r⁸` the gap and `h_Δ = r⁸`,
`κ_j` the lift weight of step `j` (an integer at each infinite place), `λ_q(v)` (`q < r`) the target parameter at the
infinite place `v`, `x ≤ x₁ ≤ b` the scales, `a = x·b`, `u_err = f·a·(log b)³` the unit of the errors and
`B_den = u_err/(m·k)` the denominator budget. `ω` is the fixed family of residue characters, trivial off the chosen
places and of order `q₂` at them. `n_GL` is the product over the chosen places `w` of the orders of `GL_{rt}(k_w)`,
`k_w` the residue field.

**Twists.** A *twist* `ϑ` is a tame automorphic character of `U(1)` of weight `0`, with tame part `ϑ_tame` nontrivial
at every place of its modulus `Q(ϑ)`; an `m`-fold twist `τ` has `τ_tame,w^n ≠ 1` for `w ∈ Q(τ)` and `1 ≤ n ≤ m`, and
`τ^j` denotes its `j`-th power as a twist (OneSidedPrimeSumBoundsAndAdmissibleData §3.4 (tame characters, twists and
`m`-fold twists)). The *level places* of `D` for `ϑ` are the chosen places and the places of `Q(ϑ)`
(ThetaLiftChainsAndTheSeesawIdentity §2.6 (the level places of a twist)).

**Coefficients.** `ℓ` is a prime and `ι : ℂ ≃ ℚ̄_ℓ` a fixed isomorphism. A *coefficient ring* is the ring of integers
`O` of a finite Galois extension of `ℚ_ℓ` in `ℚ̄_ℓ`, with fraction field `K_O`; "for all large `O`" means for all
coefficient rings containing a given one. Lengths of `O`-modules are *normalised* so that `O/ℓ` has length `1`. `v_ℓ`
is the valuation of `ℚ̄_ℓ` with `v_ℓ(ℓ) = 1`, with values in `[0, ∞]` (negative values read as `0`). `cyc` is the
`ℓ`-adic cyclotomic character, `χ = cyc⁻¹`, and `O(−e)` the rank-one representation `χ^e`. `G_ν ⊂ G_E` is the
subgroup fixing the `ℓ^ν`-th roots of unity.

**Representations.** An `ℓ`-adic representation of rank `n` is a homomorphism `R : G_E → GL_n(ℚ̄_ℓ)`; a *lattice* of
`R` over `O` is a homomorphism `u : G_E → M_n(O)` that is conjugate to `R` over `ℚ̄_ℓ`. A place of `Ω` is a valuation
subring; for a place `A` over a finite place `w` of `E`, `I_A` is its inertia group, `τ_A` the chosen generator of tame
inertia, and a *Frobenius datum* is a place `w` of prime norm, a place `A` over it and a geometric Frobenius element
there. "For most Frobenii" refers to the filter of the formal proof: a set of Frobenius data belongs to it if every
nonempty open set of `G_E` has a nonempty open part `U` such that, for almost all `w`, it contains every datum with
Frobenius in `U`; "near `g`" refines this by Frobenius near `g` (ShortGRH background (most Frobenii)). `R` is
*attached* to a system `H` of Hecke polynomials if three things hold: `R` is continuous; the trace form
`(X, Y) ↦ tr(XY)` is nondegenerate on the `ℚ̄_ℓ`-span of `R(G_E)`; and, for each `η > 0` and most Frobenius data
`(w, A, s)`, the coefficients of the characteristic polynomial `det(X − R(s))` of the geometric Frobenius element `s`
are within `η` of those of `ι(H_w)` (ShortGRH background (Galois representations of eigensystems, in the weak
sense)). The first two conditions are part of the definition: a representation that is not semisimple can satisfy the
third alone. A system of Hecke polynomials may have several attached representations; a statement about "`R` attached
to `H`" is about every one of them. The *avatar* of an algebraic Hecke character is its `ℓ`-adic Galois character
through `ι`; `ψ_ϑ` is the avatar of the base change of `ϑ⁻¹` to `E`.

**Frobenius elements and Hodge–Tate jumps.** Frobenius elements in this roadmap are geometric: the inverse of an
element that stabilises `A` and acts on residues as `x ↦ x^{Nw}`. (SelmerBoundsForAnticyclotomicTwists uses the
arithmetic Frobenius element, and writes `χ` for the cyclotomic character itself, where this roadmap writes
`χ = cyc⁻¹`.) Hodge–Tate jumps have the sign of SelmerBoundsForAnticyclotomicTwists §3.1: for a `ℤ_ℓ`-algebra map
`γ` from the coefficients to `ℂ_ℓ`, the multiplicity of the jump `u` of a representation on `T` is the dimension of
the space of `γ`-semilinear maps `f : T → ℂ_ℓ` with `f(gx) = cyc(g)^{−u}·g(f(x))` for `g` near `1` in the
decomposition group. So `cyc` has the jump `−1`, `χ = cyc⁻¹` has the jump `1`, and `O(−e) = χ^e` has the jump `e`.
For a weight `κ` on a unitary group of rank `N`, with highest weight `λ_1(v) ≥ … ≥ λ_N(v)` at the infinite place `v`,
*the jumps of `κ` in rank `N`* are the family that has, at `σ : E → ℂ` over `v`, the `N` integers `j − 1 − λ_j(v)`,
`1 ≤ j ≤ N`, if `σ ∈ Φ`, and the `N` integers `λ_j(v) + N − j` if `σ ∉ Φ`.

**Places and sets of places.** A finite set `Q` of places of `E` is *auxiliary* for a set `S` if its places have prime
norm, neither they nor their conjugates lie in `S`, and no conjugate of a place of `Q` lies in `Q`. `Q̄` is the set of
conjugates, `I_Q` the union of the inertia groups above `Q ∪ Q̄`.

**Labels.** A *label* of degree `n` over a finite field is a monic squarefree polynomial of degree `n`, nonzero at `0`;
it is *primitive* if it is irreducible with a root generating the units of the extension of degree `n`; it names one
of Green's characters of `GL_n` of the field, and its idempotent is the central idempotent of that character (ShortGRH
background (Green's characters of `GL_n` over a finite field and the idempotents of labels)).

**Descent pairs.** A descent pair `O` (ThetaLiftChainsAndTheSeesawIdentity §2.16 (descent pairs)) has a hermitian space `W`
of rank `r_O`, the standard definite space `V` of rank `n_O > r_O`, `t_O = n_O − r_O`, chosen places `w_i`, twist
places, weights, and a character `μ_O` of `U(1)` of weight `w_O` with tame part `ψ_O`. `F(O)` is the space of algebraic
forms on `V` of the weight and level of `O`, with its Petersson product; `T_{w,i}` are the Hecke operators at a split
place `w` off the places of `O` and their conjugates, and the Hecke polynomial operator at `x ∈ ℂ` is
`Σ_{i ≤ n_O} (−x)^i q_w^{i(i−1)/2} T_{w,i}`. The *normalising character* `χ_O` is the avatar of the algebraic Hecke
character made from the inverse of the character of `W`, of weight `−r_O`; the *normalised representation* of `R` is
`R ⊗ χ_O`. For a twist `ϑ` and `1 ≤ j ≤ m`, `O_j(ϑ)` is the `j`-th descent pair for `ϑ` (`W = W_j`, `V = V_j` of rank
`r + t`, character of weight `−κ_j` twisted by `ϑ`; ThetaLiftChainsAndTheSeesawIdentity §2.18 (the descent pairs of
the chain)), and `Z_j(ϑ) ⊂ F(O_j(ϑ))` is the space of lifts, the image of the good forms on `W_j`
(ThetaLiftChainsAndTheSeesawIdentity §2.7 (good forms)) under the lift `W_j → V_j` (DeterminantsOfThetaLiftChains §2.1
(the lift of a descent pair)). A *system* is a space of forms with given Hecke eigenvalues at almost
all places; it carries Hecke polynomials and an attached representation, chosen once among those attached to them.
The *weight of `O`* is the weight of the forms of `F(O)` on `V`, and *the jumps of the weight of `O`* are its jumps in
rank `n_O` (above). The *normalised jumps* `J_O` of `O` are these jumps, each lowered at `σ` by the exponent at `σ` of
the infinity type of the algebraic Hecke character whose avatar is `χ_O`; they are the jumps of the normalised
representation `R ⊗ χ_O` of a representation `R` with the jumps of the weight of `O`. This defines `J_O` for `n_O`
of either parity; 2.6 (a) writes it out when `n_O` is even.

**Base data.** *Base data* `B` on the standard definite space `V` of rank `n`, for a weight `κ` and an integer
`n_B ≥ 1`, consist of: a finite set `S_B` of finite places of `E`; a space `F_B` of algebraic forms of weight `κ` on
`V`, stable under every operator on the forms of weight `κ` that commutes with the translations by the components at
`S_B ∪ S̄_B` of the integral points of `U(V)(𝔸_f)`, and on which some open subgroup acts by a character through its
components at `S_B ∪ S̄_B`; such that `n_B` is a common multiple of the orders of the stabilisers `Γ ∩ gK₀g⁻¹`, `Γ`
the rational points of `U(V)`, `K₀` the integral points and `g ∈ U(V)(𝔸_f)`. For a finite family `u` of finite places
of `E`, the *forms of `B` of level `u`* are the forms of `F_B` fixed by the components, at the places off
`S_B ∪ S̄_B`, of the integral points that reduce to `1` at the places of `u`; the *forms of base level* are those of
level `u = ∅`, and "principal level at `u`" means level `u`. A *system of `B` at level `u`* is a system that contains
a nonzero form of `B` of level `u`; the *base systems* are those at level `∅`. A form of `B` is *integral above `ℓ`*
if its values at the points whose components above `ℓ` are integral have coordinates that `ι` sends to integers of
`ℚ̄_ℓ`. These are the base data of the Taylor–Wiles method on a definite unitary group (ShortGRH background (base data
of the Taylor–Wiles method on a definite unitary group)).

**Labels of the formal proof.** Under each heading, `*Origin:*` says where the statement comes from and
`*Method of the formal proof:*` how the shorter formal proof proves it; `[ShortProof]` names the file and declaration
where it does. Sections cite the sibling roadmaps of this family by section number, `<Roadmap> §k.n`.

### Table of symbols

| Symbol | Meaning | Defined |
|---|---|---|
| `D, E, K, F, f, Φ, ε(σ)` | data, CM field, `ℚ(√−d)`, `E⁺`, number of infinite places, CM type, sign of an embedding | OneSidedPrimeSumBoundsAndAdmissibleData §2.1, §2.2, §3.2; Conventions |
| `Ω, G_E, c, g^c` | algebraic closure of `ℚ`, `Gal(Ω/E)`, complex conjugation, `cgc` | Conventions |
| `p₀, p₁, M, N, π_M` | level primes, `p₀p₁`, level, the integer whose divisors are the chosen places | OneSidedPrimeSumBoundsAndAdmissibleData §3.2; chosen places DivisibilityOfThetaDerivatives §1.5 |
| `m, r, k, t` | number of lifts, ranks, `k = r + 1 − m`, `t = 5r` | OneSidedPrimeSumBoundsAndAdmissibleData §3.2 |
| `Δ, h_Δ, κ_j, λ_q(v)` | gap `2r⁸`, `r⁸`, lift weight, target parameter | OneSidedPrimeSumBoundsAndAdmissibleData §3.2, §3.4 (there the row parameter); ThetaLiftChainsAndTheSeesawIdentity §2.4 |
| `x, x₁, b, a, u_err, B_den` | scales, `xb`, `f·a·(log b)³`, `u_err/(mk)` | OneSidedPrimeSumBoundsAndAdmissibleData §3.2, §4.1; Conventions |
| `ω, q₂` | residue characters at the chosen places, their order | DivisibilityOfThetaDerivatives §1.5; OneSidedPrimeSumBoundsAndAdmissibleData §3.2 |
| `n_GL` | `∏_{w chosen} #GL_{rt}(k_w)` | Conventions |
| `ϑ, Q(ϑ), ϑ_tame, τ^j` | twist, its modulus, tame part, `j`-th power of an `m`-fold twist | OneSidedPrimeSumBoundsAndAdmissibleData §3.4 |
| `ℓ, ι, O, K_O, v_ℓ` | prime, `ℂ ≃ ℚ̄_ℓ`, coefficient ring, its fraction field, valuation | Conventions |
| `cyc, χ, O(−e), G_ν` | cyclotomic character, its inverse, Tate twist, kernel modulo `ℓ^ν` | Conventions |
| `ψ_ϑ, χ_O` | avatar of `ϑ⁻¹`, normalising character of a descent pair | Conventions |
| `O, r_O, n_O, t_O, w_i, μ_O, ψ_O, w_O, F(O)` | descent pair and its data, forms on `V` | ThetaLiftChainsAndTheSeesawIdentity §2.16 |
| `O_j(ϑ), Z_j(ϑ)` | `j`-th descent pair for `ϑ`, space of lifts | ThetaLiftChainsAndTheSeesawIdentity §2.18; DeterminantsOfThetaLiftChains §2.1 (the lift) |
| `e₀` | idempotent of the good forms | ThetaLiftChainsAndTheSeesawIdentity §2.5 |
| `c̃_i, e_c` | scaled label, type projection | 1.4 |
| `e′_ℓ` | the twist allowance `(4f + 3)·r·v_ℓ(n_GL) + 2^(−ℓ)` | 1.5 |
| `sel(ρ, Q, γ)` | crystalline Selmer length with divisible coefficients | 1.5 |
| `Ev_e(O, S, ν), Sha_e(O, ν)` | even and odd classes in `(O/ℓ^ν)(−e)` | 4.1 |
| `β_ℓ, loc_ℓ, e_ℓ, o_D` | clearing bound, local defect bound, error term, odd class bound | 6.1 |

## Layer 1: Conjugate self-dual representations, main summands and lift settings

The Selmer bounds of the lower bound apply to `ℓ`-adic representations of `G_E` that are conjugate self-dual with
prescribed local behaviour. This layer names them: representations of a level and of a type (1.2), main summands, the
rank-`r_O` representations that carry the congruences of a lift (1.3), lift settings, the label tuples for which the
argument runs (1.4), and Selmer lengths with divisible coefficients of a twisted lattice (1.5).

### 1.1 Galois-theoretic notation

*Origin:* definitions and conventions.

*Method of the formal proof:* the notions are those of the background of the formal proof, with the conventions
fixed in the Conventions of this roadmap.

The notions of the Conventions are fixed as stated there: coefficient rings and normalised lengths, lattices of
`ℓ`-adic representations, places of `Ω` with their inertia groups, tame generators and Frobenius data, the filter of
most Frobenii, attached representations, avatars and the normalising character of a descent pair, bad places and
auxiliary sets. In addition:

- a representation `R` is *of finite type* at a place `A` of `Ω` if it is trivial on an open subgroup of inertia at
  `A` when `A ∤ ℓ`, and potentially crystalline at `A` when `A | ℓ`; it *has jumps* `J`, a multiset `J(σ)` of
  integers for each `σ : E → ℂ`, at `A` if its Hodge–Tate jumps (with the sign of the Conventions) at the embeddings `ι∘σ` inducing `A` are `J(σ)`; it
  is *good* at `A` if it is unramified (crystalline above `ℓ`); a polynomial `P` *kills* an inertia element `s` at `A`
  if `P(R(s)) = 0` (above `ℓ`, the analogous condition on the Weil–Deligne datum of the periods);
- for a lattice `ρ` over `O`, a set `T` of places, an `O`-module `B` and a set `L` of linear relations, the *Selmer
  module* is the module of locally constant cocycles `G_E → Bⁿ` for `ρ` unramified outside `T` that satisfy the
  relations of `L`; the *crystalline relations* of `ρ` are the relations that cut out the Bloch–Kato finite classes at
  the places above `ℓ`;
- for an index set `J` and a group element family `τ : J → G_E`, `τ^±` is the family on `J × {+, −}` with
  `τ^±(j, +) = τ_j` and `τ^±(j, −) = (τ_j^c)⁻¹`.

*Needs:* ShortGRH background (most Frobenii); ShortGRH background (Galois representations of eigensystems, in the
weak sense); ShortGRH background (`ℓ`-adic avatars of algebraic Hecke characters); ShortGRH background (finite type,
Hodge–Tate jumps and crystalline relations at places of `Ω`); ShortGRH background (continuous cocycles and Selmer
modules); ThetaLiftChainsAndTheSeesawIdentity §2.16 (descent pairs).

[ShortProof], `New/Congruences/GaloisRepresentations/SelmerHypotheses` (`New.Selmer.badPlaces`, `New.Selmer.normalizingAvatar`, `New.Selmer.normalisedRep`, `New.Data.TameChar.invAvatar`)

### 1.2 Conjugate self-dual representations of a level, and representations of a type

*Origin:* definitions and conventions.

*Method of the formal proof:* self-duality is imposed on traces only, which is the form in which it is checked for
attached representations (2.1) and used in the lattice arguments (6.2).

Let `R` be an `ℓ`-adic representation of rank `n`, `t′ ≥ 0`, `J` a family of multisets of jumps and `S` a set of
finite places of `E`.

1. `R` is *conjugate self-dual with twist `t′`* if `R` is continuous, the trace form `(X, Y) ↦ tr(XY)` is
   nondegenerate on the `ℚ̄_ℓ`-span of `R(G_E)`, and `tr R(g^c) = χ(g)^(t′−1)·tr R(g⁻¹)` for all `g ∈ G_E` (with
   `t′ − 1` read as `0` when `t′ = 0`).
2. `R` is *conjugate self-dual of level `S`* (with twist `t′` and jumps `J`) if it is as in (1) and, at every finite
   place `v` that is outside `S` or lies above `ℓ` or above `M`, and every place `A` of `Ω` over `v`: `R` is of finite
   type at `A`, has jumps `J` at `A`, and is good at `A` if `v` is not above `M`.
3. For a descent pair `O` and labels `c = (c_i)`, `c_i` a polynomial over the residue field `k_{w_i}` of the chosen
   place `w_i`, `R` is a *representation of type `(O, t′, J, c, S)`* if it is as in (2) and, for each `i` and each
   place `A` over `w_i`, every inertia element at `A` is killed by the polynomial whose roots are the images of the
   roots of `c_i`, read through the fixed injective character of the algebraic closure of `k_{w_i}` and the tame
   exponent of the element at level `r_O!`.

*Needs:* 1.1.

[ShortProof], `New/Congruences/GaloisRepresentations/SelmerHypotheses` (`New.Selmer.IsConjSelfDual`, `New.Selmer.IsConjSelfDualOfLevel`, `New.Selmer.IsRepOfType`)

### 1.3 Main summands

*Origin:* definitions and conventions.

*Method of the formal proof:* the conditions are those that the twisting theorem (SelmerBoundsForAnticyclotomicTwists
§5.4) and Ribet's method (6.4, 6.5) use; the residual consequences (5) follow from the spanning clause by linear algebra.

1. *Weight conditions.* For `1 ≤ r′ ≤ r` and `t′ ≤ t`, jumps `J` satisfy the *main-summand weight conditions* for
   `(r′, t′)` if there is `j ≤ m` such that every `u ∈ J(σ)` is low, `Δ ≤ 4|u|` and `|u| ≤ 2mΔ`, or high,
   `|ε(σ)u + κ_j(σ)| ≤ t`; at most `r′m/k` jumps at each `σ` have `|u| ≤ 2h_Δ²`; and at most `r′` of the jumps at `σ`
   and at `σ^c` together are negative.
2. *Main summand.* A representation `R` of rank `r′` is a *main summand* with string length `t′` and jumps `J` if `R`
   is conjugate self-dual of empty level with twist `t′` and jumps `J` (1.2 (2), `S = ∅`), `J` satisfies (1) for
   `(r′, t′)`, and:
   - at every place `v` above `M` and not above `ℓ` and every `A` over `v` there are `γ ∈ I_A` (the tame generator if
     `v` is chosen) and an integer `N′` prime to `v` with `R(s^{N′}) = 1` for all `s ∈ I_A`, and
     `v_ℓ det(R(γ) − 1) ≤ r′·v_ℓ(n_GL)`, `v_ℓ det(R((γ^c)⁻¹) − 1) ≤ r′·v_ℓ(n_GL)`;
   - for all large `O`, the image of every lattice of `R` over `O` spans `M_{r′}(O)` over `O`;
   - for all large `O` and every lattice `u` of `R` over `O`, some `g` with `cyc(g) = p₀^{r′}` or `cyc(g) = p₁^{r′}`
     has `u(g)` scalar;
   - some `γ` in an inertia group above `M`, not above `ℓ`, acts by a scalar `y` with `|y^{ℓ^a·i} − 1| = 1` for all
     `a ≥ 0` and `1 ≤ i ≤ 4r′ + 2`.
3. *Lift trace.* A representation `u` of rank `n` has *lift trace* `(ψ, R, t′)` if
   `tr u(g) = ψ(g)·tr R(g) + Σ_{0 ≤ e < t′} χ(g)^e` for all `g`.
4. *Main summand of a pair and a system.* For a descent pair `O` and a system of Hecke eigenvalues `z`, `R` is a main
   summand for `(O, z)` if it is a main summand with string length `t_O` for some jumps, and for every tame character
   `ϑ`, every descent pair `V′` with `μ_{V′} = μ_O·ϑ`, every eigenform `y` for `V′` lifting `z` (its Hecke polynomials
   at the split places off the level are those of a lift of `z`, ThetaLiftChainsAndTheSeesawIdentity §2.16 (the Hecke
   polynomial of a lift)), with Hecke polynomials `H`, and every `S′` attached to `H`, the normalised representation of `S′`
   for `V′` has lift trace `(ψ_ϑ, R, t_{V′})`.
5. *Residual consequences.* If `R` is a main summand of rank `r′`, then for all large `O`: (a) for every lattice `u`
   and every ring map `O → k` to a field, the only `u(G_E)`-stable subspaces of `k^{r′}` are `0` and `k^{r′}`; (b) if
   `R` has matrices over `O` in two bases `B`, `B′`, then `B′ = α·B·κ` with `α ∈ ℚ̄_ℓ^×` and `κ ∈ GL_{r′}(O)`.

*Needs:* 1.1, 1.2; ThetaLiftChainsAndTheSeesawIdentity §2.16 (descent pairs and lifted Hecke polynomials).

[ShortProof], `New/Congruences/GaloisRepresentations/SelmerHypotheses` (`New.Selmer.IsMainSummandLike`, `New.Selmer.HasLiftTrace`, `New.Selmer.IsMainSummand`, `New.Selmer.IsMainSummandLike.eventually_lattice_unique`), with the weight conditions in `New/Congruences/LocalLoss/Basic` (`New.Selmer.IsMainSummandWeights`)

### 1.4 Lift settings and type projections

*Origin:* definitions and conventions.

*Method of the formal proof:* the type projection is the action of a central idempotent of a finite group algebra by
translations at the chosen places, which commute with the Hecke operators at other places.

Let `O` be a descent pair with chosen places `w_i`, `ϑ` a twist and `c = (c_i)` labels. The *scaled label* `c̃_i` is
`c_i` with its roots multiplied by the element of `k_{w_i}^×` that names the character `ψ_O(w_i)⁻¹`. `O` with `c` is a
*lift setting for `ϑ`* if:

- the places of `O` are the level places of `D` for `ϑ`, and `ψ_O = ω^j·ϑ_tame` for some `1 ≤ j ≤ m`;
- `r_O` and `t_O` are odd, `r_O ≤ r` and `t_O ≤ t`;
- each `c_i` is a label of degree `r_O`, and `c̃_i` does not have the root `1`;
- over each of `p₀, p₁` there is a chosen place `w_i` above it with either `r_O = r` and `c_i` primitive, or `r_O = 1`
  and `c_i = X − 1`.

The *type projection* `e_c` is the endomorphism of `F(O)` by which the tensor product of the idempotents of the labels
`c_i` acts through `∏_i GL_{r_O}(k_{w_i})`. Then:

(a) `e_c` is a self-adjoint idempotent, and its range is stable under the Hecke polynomial operators at every `x ∈ ℂ`
and every split place `w` with `w, w̄` off the places of `O`;
(b) if `O` with `c` is a lift setting for `ϑ`, every `w_i` is a chosen place of `D` and `n_O ≤ 2·n_m`, with
`n_m = k + m(t + 1)`;
(c) infinitely many split places of `E` lie, with their conjugates, off the places of `O`.

*Needs:* 1.1; ShortGRH background (Green's characters of `GL_n` over a finite field and the idempotents of labels);
ThetaLiftChainsAndTheSeesawIdentity §2.16 (descent pairs), §2.6 (the level places of a twist).

[ShortProof], `New/Congruences/GaloisRepresentations/SelmerHypotheses` (`New.Selmer.IsLiftSetting`, `New.Selmer.scaledTypePoly`, `New.Selmer.typeProjection`, `New.Selmer.IsLiftSetting.range_typeProjection_mem_invtSubmodule`)

### 1.5 Twisted lattices and Selmer lengths with divisible coefficients

*Origin:* definitions and conventions.

*Method of the formal proof:* the module with coefficients in `O/ℓ^m` embeds in the one with divisible coefficients,
whose length bounds it.

Let `ψ : G_E → ℚ̄_ℓ^×` be a character, `R` a representation, `Q` a finite set of places, `γ ∈ G_E` and `ζ` an integer
of `ℚ̄_ℓ`.

1. The *twist allowance* is `e′_ℓ = (4f + 3)·r·v_ℓ(n_GL) + 2^(−ℓ)`.
2. For a lattice `ρ` over `O` and `m ≥ 0`, `Sel_m(ρ, Q, γ)` is the module of continuous cocycles `G_E → (O/ℓ^m)ⁿ` for
   `ρ` that are unramified outside the places above `ℓ`, above `M` and in `Q ∪ Q̄`, satisfy the crystalline relations
   above `ℓ` and vanish at `γ`; `sel(ρ, Q, γ) ∈ ℕ ∪ {∞}` is the length of the same module with values in `(K_O/O)ⁿ`.
3. A *twisted lattice* for `(ψ, R, γ, ζ)` over `O` is a lattice `u` of `R` over `O` and a model `ψ′` of `ψ` with values
   in `O` such that `ψ′(γ)u(γ) = ζ·1`, `ζ ∈ O`, `ζ − 1` is a unit, and `γ` lies in an inertia group at a place not
   above `ℓ`. `R` *has a twisted lattice* for `(ψ, γ, ζ)` if one exists over all large `O`.
4. `R` *has divisible Selmer length at most `s`* for `(ψ, Q, γ, ζ)` if, for all large `O`, there is a twisted lattice
   `(u, ψ′)` with normalised length of `sel(ψ′u, Q, γ)` at most `s`.

Then: (a) the length of `Sel_m(ρ, Q, γ)` is at most `sel(ρ, Q, γ)` for every `m`; (b) a divisible Selmer bound gives
a twisted lattice; (c) it holds for every larger bound.

*Needs:* 1.1.

[ShortProof], `New/Congruences/GaloisRepresentations/SelmerHypotheses` (`New.Selmer.twistError`, `New.Selmer.selmerCocycles`, `New.Selmer.HasDivisibleSelmerLengthLe`, `New.Selmer.length_selmerCocycles_le_crystallineSelmerLength`)

## Layer 2: Galois representations of the forms and main summands

The forms of the argument have Galois representations attached in the weak sense of the formal proof. This layer
shows that they are conjugate self-dual (2.1), that the descent pairs and the main pairs of the data are lift settings
(2.2), how representations of a type behave under twisting and at the bad places (2.3–2.5), that forms of a type sit
in base data of the Taylor–Wiles method (2.6), and that the good eigensystems have main summands (2.7, 2.8).

### 2.1 Attached representations are conjugate self-dual

*Origin:* adapted from the published theory of conjugate self-duality of the Galois representations of automorphic
representations of unitary groups: here on traces, for representations attached in the weak sense, deduced from the
duality of the Hecke operators at a split place and its conjugate.

*Method of the formal proof:* the Hecke operators at `w` and `w̄` are adjoint, which relates the coefficients of the
two Hecke polynomials; this gives the trace relation at most Frobenii, and it passes to every `g` along the filter of
most Frobenii near `g`.

(a) Let `f ≠ 0` be a form in rank `k′ + 1`, spherical at a split place `w` and at `w̄`, with Hecke polynomials `Q_w`,
`Q_{w̄}`. Then `Q_w(0)·[X^{k′}]Q_{w̄} = q_w^{k′}·[X]Q_w`.
(b) If `f` is an eigenform of rank `n` with system `Q` of Hecke polynomials, then every representation `R` attached to
`Q` (continuity and the nondegenerate trace form included, as in the Conventions) is conjugate self-dual with twist `n`
(1.2 (1)).
(c) Let `R` be conjugate self-dual with twist `k′` and of finite type at the conjugate place `Ā` of a place `A`. Then
`R` is of finite type at `A`; if `R` has at `Ā` the jumps of a weight `κ` in rank `k′` (Conventions), it has them at `A`; and a
polynomial that kills `s` at `Ā` kills `(s^c)⁻¹` at `A`. Composing `σ` with complex conjugation replaces each jump `u` of
a weight in rank `k′` by `k′ − 1 − u`.

*Needs:* 1.2; ShortGRH background (Galois representations of eigensystems, in the weak sense); ShortGRH background
(most Frobenii).

[ShortProof], `New/Congruences/GaloisRepresentations/AttachedRepresentations` (`New.Selmer.isConjSelfDual_of_attached`, `New.Selmer.coeff_zero_mul_coeff_star`, `New.Selmer.isFiniteTypeAt_and_hasJumpsAt_of_conjPlace`)

### 2.2 The pairs of the data are lift settings

*Origin:* particular to this proof: the good label tuples of the target forms, and the constant label `X − 1` of the
rank-one lifts of the main pairs, satisfy the conditions of a lift setting.

*Method of the formal proof:* the conditions are read off the definitions of good tuples (degree `r`, no root a
`q₂`-th root of unity, one primitive label over each level prime) and of the main pairs; the divisibility in (c) is
that of `p^d − 1` into the order of `GL_{rt}(𝔽_p)`.

(a) For `1 ≤ j ≤ m`, a twist `ϑ` and a good tuple `c` of labels at the chosen places, `O_j(ϑ)` with `c` is a lift
setting for `ϑ`.
(b) For a main pair `p = (ν, z)` for `j` and a twist `ϑ`, the descent pair of the lift of `νϑ` from `U(1)` to `U(2z)`
with every label `X − 1` is a lift setting for `ϑ`, and its lifted form lies in the range of the type projection.
(c) For `i ∈ {0, 1}` and `1 ≤ d ≤ rt`, `p_i^d − 1` divides `n_GL`; so `v_ℓ(p_i^d − 1) ≤ v_ℓ(n_GL)`.
(d) A finite set of places of `E` above `M` has at most `4f` elements, and some chosen place lies above `p₀` or `p₁`,
not above `ℓ`, with residue field of order `p₀` or `p₁`.
(e) A lattice `u` of `R` over `O` is continuous if `R` is, is trivial where `R` is, has the traces of `R`, and comes
with an injective `O`-algebra map `M_n(O) → M_n(ℚ̄_ℓ)` that sends `u(g)` to `R(g)` and keeps traces and determinants.

*Needs:* 1.4; ThetaLiftChainsAndTheSeesawIdentity §2.5 (good tuples of labels), §2.16 (descent pairs), §2.18 (the
descent pairs `O_j(ϑ)` of the chain); DeterminantsOfThetaLiftChains §1.1 (main pairs);
NormsOfThetaLiftsAndExchangeIdentities (the theta lift of a character of `U(1)` to `U(2z)` and its lifted
form).

[ShortProof], `New/Congruences/GaloisRepresentations/AttachedRepresentations` (`New.Selmer.isLiftSetting_descentPair`, `New.Selmer.isLiftSetting_mainPair`, `New.Selmer.trivialLift_mem_range_typeProjection`, `New.Selmer.ellVal_levelPrime_pow_sub_one_le`)

### 2.3 Twisting by avatars, and representations of labelled eigenforms

*Origin:* particular to this proof: representations of a type are stable under twisting by the avatar of a character
of `U(1)` tamely ramified only at the chosen places, and arise from eigenforms whose local types at the chosen places
are induced from labels.

*Method of the formal proof:* the avatar shifts the jumps by minus its infinity type and acts on tame inertia at the
chosen places through the residue character, which scales the roots of the labels; the local conditions of an
attached representation come from the local behaviour of attached representations at spherical and at depth-zero
places.

Let `O` with some labels `d` be a lift setting for `ϑ`.
(a) Let `R` be a representation of type `(O, k′, J, c, S)`, let `a` be a character of `U(1)` of weight `e` whose tame
part `ψ` is trivial at every place that is not chosen, and let `α` be the avatar of the algebraic Hecke character
`y ↦ a(y/ȳ)·υ(y)^(−k″)·|y|^(j′ − k″/2)` (`υ` the fixed splitting character). If `(b′ − 1) + (2j′ − k″) = k′ − 1`
(subtractions truncated at `0`), then `R ⊗ α` is a representation of type `(O, b′, J′, c′, S)` with
`J′(σ) = J(σ)` shifted by minus the infinity type of the character at `σ`, and `c′_i` the label `c_i` with roots
multiplied by the element naming `ψ(w_i)`.
(b) Let `f` be an eigenform of weight `κ` on the definite space of rank `n′`, with Hecke polynomials `H` and `R`
attached to `H`. Suppose `f` is spherical at every place outside `S` or above `ℓM`, except the chosen places of `O` and
their conjugates, and that the type of `f` at `w_i` is induced from the label `c_i` of degree `r_O` and trivial
characters on further blocks. Then `R` is a representation of type `(O, n′, jumps of κ, c_i·(X − 1)^(n′ − r_O), S)`.

*Needs:* 1.2, 1.4, 2.1; ShortGRH background (`ℓ`-adic avatars of algebraic Hecke characters); ShortGRH background
(local behaviour of attached representations at spherical places and at places of depth-zero type).

[ShortProof], `New/Congruences/GaloisRepresentations/AttachedRepresentations` (`New.Selmer.IsRepOfType.twist_avatar`, `New.Selmer.isRepOfType_of_hasProductLabel`)

### 2.4 Inertia above the level primes; representations of a type are main summands

*Origin:* particular to this proof: the conditions of a main summand at the places above `M` and on the image follow
from the type at the chosen places and the numerical weight conditions.

*Method of the formal proof:* inertia above `p_l` acts through roots of unity of order prime to `ℓ` named by the
scaled labels; a primitive label (or `X − 1`) gives an element whose eigenvalues are pairwise incongruent conjugates,
which forces the image of a lattice to span all matrices and gives a scalar at an element of cyclotomic character
`p_l^{r_O}`; the order `q₂` of `ω` keeps the scalar far from `1`.

Let `O` with `c` be a lift setting for `ϑ`.
(a) Let `v` divide `p_l` (`l ∈ {0, 1}`), `A` over `v` and `t′ ≥ 0`. There is `γ ∈ I_A`, the tame generator if `v` is
chosen, such that every `s ∈ I_A` has a multiset `μ` of `r_O + t′` roots of unity, each of order dividing
`p_l^{r_O!} − 1` and some `p_l^d − 1` with `1 ≤ d ≤ r`, whose polynomial `∏_{y ∈ μ}(X − y)` kills `s` at `A` and
`(s^c)⁻¹` at `Ā` in every representation of a type with labels `c̃_i·(X − 1)^{t′}`; and `1 ∉ μ` if `t′ = 0` and
`s = γ`.
(b) If `R` of rank `r_O` is a representation of type `(O, k′, J, c̃, ∅)` and `J` satisfies the main-summand weight
conditions for `(r_O, k′)`, then `R` is a main summand with string length `k′` and jumps `J`.

*Needs:* 1.2, 1.3, 1.4, 2.2.

[ShortProof], `New/Congruences/GaloisRepresentations/RowsAndColumnsFromLabels` (`New.Selmer.exists_inertiaGroup_isInertiaSpectrum`, `New.Selmer.IsRepOfType.isMainSummandLike`)

### 2.5 Inertia at the twist places

*Origin:* particular to this proof: at a place of the modulus of the twist, the parahoric type of the forms makes
inertia act on the normalised representation with the two eigenvalues `1` and `ψ_ϑ`.

*Method of the formal proof:* the parahoric type at a twist place has the block of the embedding `W ⊂ V` with the
character `ψ_O⁻¹` and the complementary block trivial; local–global compatibility at such a place gives the quadratic
relation, and the normalising character is unramified there.

Let `O` with `c` be a lift setting for `ϑ`, `Q(ϑ)` auxiliary for the bad places, `f` an eigenform of the weight of `O`
with Hecke polynomials `H`, `R` attached to `H`, and suppose `f` has the parahoric type of `O` at every twist place:
an integral matrix whose reduction is block triangular for the decomposition (complement of `W`, `W`) multiplies `f`
by `ψ_O⁻¹` of the determinant of the `W`-block of the reduction. Then for every place `A` of `Ω` over a place of
`Q(ϑ) ∪ Q(ϑ)̄`, `R` is of finite type at `A` and `(X − ψ_ϑ(s))(X − 1)` kills every `s ∈ I_A`; and the normalised
representation `u = R ⊗ χ_O` satisfies `(u(g) − ψ_ϑ(g))(u(g) − 1) = 0` for all `g ∈ I_{Q(ϑ)}`.

*Needs:* 1.1, 1.4; ShortGRH background (local behaviour of attached representations at tamely ramified parahoric
places); ShortGRH background (`ℓ`-adic avatars of algebraic Hecke characters).

[ShortProof], `New/Congruences/GaloisRepresentations/RowsAndColumnsFromLabels` (`New.Selmer.isFiniteTypeAt_and_polyKillsAt_of_mem_conjClosure`, `New.Selmer.normalisedRep_quadratic_on_inertia`)

### 2.6 Forms of a type and their base data

*Origin:* particular to this proof: the image of the type projection lies in base data of the Taylor–Wiles method on
the definite space, and every system of these base data, at every auxiliary level, has a normalised representation of
a type with the quadratic relation at the twist places.

*Method of the formal proof:* the normalised representation of an eigenform with the labels `c̃_i` is a
representation of a type by 2.3 and the twist by `χ_O`; the base data are the forms of the type fixed by `O` at its
places, with `n_GL` as common multiple of the stabiliser orders; `n_GL·e_c` has integral coefficients.

Let `O` with `c` be a lift setting for `ϑ`, with `Q(ϑ)` auxiliary for the bad places.
(a) If `f` is an eigenform of the weight of `O` with the labels `c̃_i` at the chosen places (completed by trivial
characters on further blocks), spherical at the places outside `S` or above `ℓM` except the chosen places and their
conjugates, and `R` is attached to its Hecke polynomials, then `R ⊗ χ_O` is a representation of type
`(O, t_O, J_O, c̃_i·(X − 1)^{t_O}, S)`, where `J_O` are the normalised jumps of `O` (Conventions). If `n_O` is even and `l = 2λ` is the
doubled parameter on `W` that fits `O`, then `J_O(σ)` consists of `0, 1, …, t_O − 1` and the numbers
`(t_O − 1 − ε(σ)(l_q(v) − 2w_O(v)))/2`, `q < r_O`, `v` the place of `σ`.
(b) A `(c, S)`-form is an eigenform of the weight of `O`, of type `c`, with the level and character of `O` off `S ∪ S̄`.
If `S` avoids the bad places, the normalised representation of a `(c, S)`-form is a representation of type
`(O, t_O, J_O, c̃_i·(X − 1)^{t_O}, Q(ϑ) ∪ Q(ϑ)̄ ∪ S ∪ S̄)`.
(c) There are jumps `J` and base data `B` (Conventions) on the definite space of rank `n_O`, for the weight of `O`
and the integer `n_B = n_GL`, such that: the forms `e_c y` (`y ∈ F(O)`) are forms of `B` of base level; if
`y` is integral above `ℓ`, so is `n_GL·e_c y`; and for every finite family `u` of places outside the bad places and
every system `x` of `B` at principal level at `u`, the normalised representation `R_x` of `x` is a representation of
type `(O, t_O, J, c̃_i·(X − 1)^{t_O}, Q(ϑ) ∪ Q(ϑ)̄ ∪ u ∪ ū)` with `(R_x(g) − ψ_ϑ(g))(R_x(g) − 1) = 0` on `I_{Q(ϑ)}`.

*Needs:* 1.4, 2.3, 2.5; ShortGRH background (base data of the Taylor–Wiles method on a definite unitary group).

[ShortProof], `New/Congruences/GaloisRepresentations/BaseLevelOfLabel` (`New.Selmer.isRepOfType_normalisedRep`, `New.Selmer.normalisedJumps_eq_range_add_map`, `New.Selmer.IsFormOfType.isRepOfType_normalisedRep`, `New.Selmer.exists_baseLevel`)

### 2.7 The jumps of the descent pairs and of the main pairs

*Origin:* particular to this proof: the Hodge–Tate jumps that the target parameter and the lift weights give satisfy
the main-summand weight conditions.

*Method of the formal proof:* elementary inequalities between `λ_q`, `κ_j`, `t` and `Δ` from the sizes of the data;
the low jumps are the last `m` parameters, which the gap separates from the high ones.

Let `1 ≤ j ≤ m`. For `σ` over the infinite place `v` put `u_q(σ) = ⌊t/2⌋ − ε(σ)(λ_q(v) + κ_j(v))`, `q < r`.
(a) For `q + 1 < k`, `|ε(σ)u_q + κ_j(v)| ≤ t`; for `k ≤ q + 1 ≤ r`, `Δ ≤ 4|u_q|` and `|u_q| ≤ 2mΔ`; if `2mΔ ≤ B` and
`B + t < κ_j(v)`, exactly `m` of the `u_q(σ)` have `|u_q| ≤ B`. The family `J_j(σ) = {u_q(σ) : q < r}` satisfies the
main-summand weight conditions for `(r, t)`.
(b) For a weight `(d, κ)` whose doubled Harish-Chandra parameter is that of `W` (twice `λ`), the jumps of `(d, κ)` in
rank `r` at `σ`, lowered by `(r − t)/2 + ε(σ)w`, are the numbers `⌊t/2⌋ − ε(σ)(λ_q(v) + w)`, `q < r`.
(c) For a main pair `p = (ν, z)` for `j`, with `ν` of weight `−c_p`, the single jump `z − 1 − ε(σ)c_p(v)` satisfies
`|ε(σ)u + κ_j(v)| ≤ t` and the main-summand weight conditions for `(1, 2z − 1)`.

*Needs:* 1.3; OneSidedPrimeSumBoundsAndAdmissibleData §3.2 (the ranks, `t`, the gap `Δ` and the lift weights `κ_j`),
§3.3 (their sizes), §3.4 (the row parameter `λ_q(v)`, here the target parameter);
DeterminantsOfThetaLiftChains §1.1 (main pairs).

[ShortProof], `New/Congruences/GaloisRepresentations/RowsFromEigensystems` (`New.Selmer.isMainSummandWeights_descentPair`, `New.Selmer.isMainSummandWeights_mainPair`, `New.Selmer.map_jumps_sub_eq_map_targetParameter`)

### 2.8 Main summands for the Hecke eigensystems of good forms

*Origin:* adapted from Mínguez (2008): the explicit Howe correspondence for dual pairs of type II, which gives, place
by place, the parameter of a theta lift at the split places of hyperspecial level; here as an identity of traces: the
normalised representation of every eigenform on `V` that lifts a given system has the trace of one rank-`r_O`
representation twisted by `ψ_ϑ`, the same for all twists `ϑ`, plus `t_O` powers of `χ`, and that representation is a
main summand.

*Method of the formal proof:* the Hecke polynomial of a lift at a split place factors as a `q`-Pochhammer string times
the rescaled Hecke polynomial of the system; comparing linear coefficients and multiplying by the normalising
character gives the trace identity at most Frobenii; a representation of a type whose traces are the limits of the
eigenvalues is then a main summand for the pair by 2.4 (b) and 2.7.

Let `O` be a descent pair, `c` labels with `O, c` a lift setting for the trivial twist, `r_O − t_O = 2a′`.
(a) If `y ≠ 0` for a descent pair `V′` lifts the system `b` and has Hecke polynomial `H` at a split place `w` off the
places of `V′`, then `−[X^{n−1}]H = q_w^{t_{V′}}·(ν_w/ν′_w)·b_w(1) + (Σ_{i < t_{V′}} q_w^i)·ν_w`, where `ν_w`, `ν′_w` are
the values at a uniformiser of the Hecke characters made from the characters of `W` and `V` (times `q_w^{rank/2}`).
(b) If `μ_{V′} = μ_O·ϑ` for a tame `ϑ` and `y` is an eigenform for `V′` lifting `b` with Hecke polynomials `H`, then for
most Frobenii `φ` at places `w`: `−χ_{V′}(φ)·ι([X^{n−1}]H_w) = α_ϑ(φ)·α_O(φ)·ι(b_w(1)) + Σ_{e < t_{V′}} χ(φ)^e`, with
`α_ϑ` the avatar of `ϑ⁻¹(y/ȳ)` and `α_O` that of `μ_O⁻¹(y/ȳ)|y|^{a′}`.
(c) If `R` of rank `r_O` is a representation of type `(O, r_O, J, c, ∅)` whose trace at every `g` is the limit of
`ι(b_w(1))` along most Frobenii near `g`, and the jumps `J(σ)` lowered by `(r_O − t_O)/2 − ε(σ)w_O(v)` satisfy the
main-summand weight conditions for `(r_O, t_O)`, then there is a main summand for `(O, b)` (1.3 (4)).
(d) If the Hecke eigenvalues `p(w, i)` occur in a nonzero good form on `W_m`, then for each `1 ≤ j ≤ m` there is a
rank-`r` representation that is a main summand for `(O_j(1), p)`.

*Needs:* 1.3, 1.4, 2.1, 2.4, 2.6, 2.7; ThetaLiftChainsAndTheSeesawIdentity §2.7 (good forms), §2.16 (lifted Hecke
polynomials), §2.18 (the descent pairs `O_j(1)` of the chain and the fit of the target parameter);
ShortGRH background (Galois representations of eigensystems, in the weak sense); ShortGRH background (most Frobenii);
ShortGRH background (`ℓ`-adic avatars of algebraic Hecke characters).

[ShortProof], `New/Congruences/GaloisRepresentations/RowsFromEigensystems` (`New.Selmer.neg_coeff_eq_of_hasLiftHeckePolynomial`, `New.Selmer.eventually_trace_frob_eq_of_hasLiftHeckePolynomial`, `New.Selmer.exists_isMainSummand_of_isRepOfType`, `New.Selmer.exists_isMainSummand_descentPair`)

## Layer 3: Ribet's method to first order

Ribet's method produces, from a lattice in a representation that is residually reducible along a family, an element
of the coefficient algebra whose value at a point bounds a congruence ideal. Here it is done to first order: auxiliary
places tie tame inertia to Frobenius through variables `X_j`, only the coefficients of the monomials dividing
`∏ X_j` are read, and the cocycles of the characters are cut down by a triangular condition instead of being counted.
The layer is pure algebra: a group `G`, a discrete valuation ring `O` and finitely many representations `u_x` of `G`.

### 3.1 Trace ideals, tie ideals, triangle costs and common Ribet elements

*Origin:* definitions and conventions.

*Method of the formal proof:* the relations are taken in the group ring over a polynomial ring, and modules of
functions are used in place of Galois cohomology so that the statements hold for any group.

Let `O` be a commutative ring, `L` an `O`-algebra, `G` a group, `J` a finite index set, `R_J = O[X_j : j ∈ J]`, and
`u_x : G → M_σ(O)` (`x ∈ Y`) representations.

1. *Fitting ideal and functions.* For a submodule `N ⊂ R_J^s`, `Fitt(N)` is the ideal generated by the determinants of
   the square matrices whose rows lie in `N` (the zeroth Fitting ideal of `R_J^s/N`). For `Φ : Oⁿ → R_J^s`, `z : G → Oⁿ`
   and `p ∈ O`, the *module of functions* of `N` is the module of the functions `g ↦ Ψ(z(g))` on `G`, for the
   `O`-linear `Ψ : Oⁿ → O/p` that vanish on `Φ⁻¹(N)`.
2. *Ribet cocycles.* For a representation `ρ` of `G` over `O` and an `O`-module `B`, the Ribet cocycles are the
   cocycles `c : G → B^d` for `ρ` such that `Σ_g θ_g·c(g) = 0` whenever `Σ_g θ_g·(u_x(g) − 1) = 0` for all `x`; for
   `T ⊂ G` and `γ ∈ G`, those vanishing on `T` and at `γ`.
3. *Character cocycles.* For a character `χ : G → O^×`, elements `δ_v ∈ G`, `γ, a ∈ G`: a Ribet cocycle `c : G → O/p`
   for `χ` that vanishes at the `δ_v` and, if `c(γ) = 0`, has `(χ(g) − 1)·c(a) = 0` for all `g`. A module `Z` of
   functions is *detected* by a finite `s ⊂ G` if a member vanishing on `s` is `0`.
4. *Trace ideal.* For an `O`-subalgebra `S` of the families `Y → L[X_j]` and an `S`-submodule `𝒥`, elements `τ_i, φ_i`
   of `G`, indices `k(i) ∈ J`, `p ∈ O` and polynomials `ε_j ∈ O[X]`: `𝒥` is a *trace ideal* if `S` contains the
   constant families `X_j` and the coefficients of the characteristic polynomials of the `u_x(g)`, and `𝒥` contains
   the families `p·tr u_x(g)` and `tr((u_x(τ_i) − 1)u_x(g)) − X_{k(i)}·tr(((X − 1)ε_{k(i)})(u_x(φ_i))·u_x(g))`.
5. *Tie ideal and tied rows.* In `R_J[G]`, with `I` the augmentation ideal and `ρ₀ ∈ R_J[G]`, the *tie ideal* is the
   left ideal spanned by the elements killed by every `u_x`, by `p·I`, by the ties
   `τ_k − 1 − X_j·ε_j(φ_k)·(φ_k − 1)` for `k = (j, ±)`, and by `I·ρ₀`. For generators `gen_i ∈ G`, a row `(r_i)` over
   `R_J[G]` is *tied* if `Σ_i r_i(gen_i − 1)` lies in the tie ideal. The *tied normaliser* for `γ, a ∈ G` and `c₁ ∈ O` is
   `ρ₀ = n + (1 − n)(a − 1)` with `n = c₁(γ − 1)`.
6. *Triangle cost.* For a module `Z` of functions `G → B`, `τ, τ′, φ, φ′ : J → G` (`J` linearly ordered), `I ⊂ J`,
   `C ∈ O` and `b`, `Z` has *triangle cost* `(I, C, b)` if there is `A ⊂ G` such that, with `Z₀` the members vanishing
   on `A`: (a) for `j ∈ I` and `c ∈ Z₀` with `c(τ_i) = c(τ′_i)` for all `i < j` and `c(φ_i) = c(φ′_i)` for the `i < j`
   in `I`, `C·c(τ_j) = C·c(τ′_j)`; (b) for every submodule `Z₁ ⊂ Z₀` whose members vanish at all `τ_j, τ′_j` and have
   `c(φ_j) = c(φ′_j)` for `j ∈ I`, the length of `Z/Z₀` plus the length of `Z₁` modulo its `C`-torsion is at most `b`.
7. *Common Ribet element.* For functions `β_i : Y → L`, `𝓧 ⊂ Y`, `π ∈ 𝓧` and `c ∈ L`: the constant families `β_i` lie
   in `S` and vanish on `𝓧`, and some `f ∈ S` has `f·β_i ∈ 𝒥` for all `i`, has at every `x ∈ 𝓧` coefficient `0` at every
   monomial properly dividing `∏_j X_j`, and has coefficient `c` at `∏_j X_j` in `f(π)`.

*Needs:* none.

[ShortProof], `New/Congruences/FirstOrder/FittingBlock` (`New.Selmer.HasTriangleCost`, `New.Selmer.IsTraceIdeal`, `New.Selmer.IsCharacterCocycle`, `New.Selmer.IsCommonRibetElement`); `New/Congruences/FirstOrder/RibetMatrices` (`New.Selmer.tieIdeal`, `New.Selmer.tiedRows`, `New.Selmer.tiedNormaliser`)

### 3.2 Amitsur's formula for block matrices and Ribet's polynomial

*Origin:* adapted from the published theory of Amitsur's formula and of Ribet's method by the Cayley–Hamilton
theorem: here for an algebra represented by matrices whose characteristic polynomials are defined over a subring,
and a square matrix of relations modulo a two-sided ideal and a left ideal.

*Method of the formal proof:* Amitsur's formula expresses the characteristic coefficients of a block matrix through
those of products of blocks; the Cayley–Hamilton theorem for the block matrix `ρ(B)` gives the polynomial.

Let `R` be a commutative ring, `L` an `R`-algebra, `Λ` an `R`-algebra and `ρ : Λ → M_σ(L)` an `R`-algebra map.
(a) If the characteristic polynomial of every `ρ(w)` has coefficients in the image of `R`, then for every square
matrix `P` over `Λ` the block matrix `(ρ(P_{ab}))` has characteristic polynomial with coefficients in the image of `R`.
(b) Suppose the `w ∈ Λ` whose `ρ(w)` has characteristic coefficients in the image of `R` span `Λ` over `R`. Let `𝔞` be
a two-sided ideal containing `ker ρ`, `y ∈ Λ^N`, `I` the left ideal spanned by its entries, `ρ₀ ∈ Λ`, and `B` a square
matrix over `Λ` with `(By)_a ∈ 𝔞 + Iρ₀` for every `a`. Then some `P ∈ R[X]` has `P(0) = det(ρ(B))` (the block matrix)
and `zP(ρ₀) ∈ 𝔞` for all `z ∈ I`; moreover `tr ρ(ρ₁P(ρ₀))` lies in the image of `R` for all `ρ₁ ∈ Λ`, and if `ρ(z) = δ`
for some `z ∈ I` and `δ ∈ R`, then `δ·tr ρ(ρ₁P(ρ₀)) = tr ρ(a)` for some `a ∈ 𝔞`.

*Needs:* IntegralHeckeAndGaloisDeterminants §0.5.

[ShortProof], `New/Congruences/FirstOrder/RibetMethod` (`New.amitsur_charpoly_comp_coeff_mem_range`, `New.Selmer.exists_ribet_polynomial`)

### 3.3 Ribet's element for a matrix of tied rows

*Origin:* particular to this proof: Ribet's polynomial of 3.2, read through a family of representations, gives one
element of the algebra of characteristic coefficients that multiplies the determinants of the left ideal into the
module of tied traces, with a prescribed value on the points where the representation is a block plus characters.

*Method of the formal proof:* 3.2 (b) applied in the group algebra with the ideal of elements whose traces lie in `𝒥`;
on the block points the determinant of `B` splits into the determinants of the block and of each character, and the
element `ρ₁` isolates the first character.

Let `u_x : O[G] → M_σ(O)` (`x ∈ Y`) be algebra maps and `S` an `O`-algebra of functions `Y → L` containing the
constants and the functions `x ↦` coefficients of the characteristic polynomial of `u_x(g)`. Let `𝒥` be an
`S`-submodule of functions `Y → L`, `y ∈ O[G]^N`, `I` its left span, `𝔞` the left ideal spanned by the `w` with
`x ↦ tr u_x(wg)` in `𝒥` for all `g`, and `B` a square matrix with `(By)_a ∈ 𝔞 + Iρ₀`. Suppose that on `𝓧 ⊂ Y`, `u_x` is
the block sum of `ψ_x` (rank `r′`) and characters `η_0, …, η_{t′−1}`, that `ψ_x(ρ₁) = 0`, `η_e(ρ₁) = μ₀` for `e = 0` and
`0` otherwise, and `η_0(ρ₀) = 0`. Then some `f ∈ S` has `f·(x ↦ det u_x(w)) ∈ 𝒥` for all `w ∈ I`, and
`f(x) = μ₀·det ψ_x(B)·∏_e det η_e(B)` for `x ∈ 𝓧`.

*Needs:* 3.2.

[ShortProof], `New/Congruences/FirstOrder/RibetMethod` (`New.Selmer.exists_ribet_element_of_tied_rows`)

### 3.4 Fitting ideals of modules with a triangle cost

*Origin:* particular to this proof: a bound for the Fitting ideal of a module of relations in polynomial variables,
through the module of functions it defines and a triangular condition at the variables.

*Method of the formal proof:* the module is enlarged in three stages: by the relations that make the functions vanish
on a set, at the cost of a length; by the triangle, one variable at a time; and finally read at `X_j = 0`, where the
constant coefficient is bounded by a length modulo torsion.

Let `O` be a discrete valuation ring, `J` a finite linear order, `R_J = O[X_j]`, `s ⊂ G` finite, `Φ : Oⁿ → R_J^s`
linear, `z : G → Oⁿ`, `N ⊂ R_J^s` a submodule, `p ≠ 0`, `τ, τ′, φ, φ′ : J → G`, `C ∈ O`, `I ⊂ J`. Suppose that the module
of functions of `N` has triangle cost `(I, C, b)`; that `Φ(pv) ∈ N` for all `v`; that `Φ(z(g)) − e_g ∈ N` for `g ∈ s`
(`e_g` the basis vector); that `Φ(z(τ_j)) − X_jΦ(z(φ_j))` and `Φ(z(τ′_j)) − X_jΦ(z(φ′_j))` lie in `N`; and that for
`j ∈ I` and `i < j`, either `i ∈ I` or `X_i·R_J^s ⊂ N`. Then some `F ∈ R_J` has `v(F(0)) ≤ b + (#I + #s)·v(C)` and
`F·∏_{j∈I} X_j ∈ Fitt(N)`.

*Needs:* 3.1.

[ShortProof], `New/Congruences/FirstOrder/FittingBlock` (`New.Selmer.exists_mul_prod_X_mem_fittingIdeal`, `New.Selmer.exists_mem_fittingIdeal_addVal_constantCoeff_le`)

### 3.5 Tied rows on the block

*Origin:* particular to this proof: matrices of tied rows whose determinant on the main block is bounded by the
length of a module of cocycles.

*Method of the formal proof:* the rows given by cocycle relations, by the generators and by the normaliser are tied;
the module they span has a dual that is the module of Ribet cocycles of the block, whose length bounds an elementary
divisor and so the determinant of a suitable square matrix.

Let `O` be a discrete valuation ring, `u_x` representations of `G` over `O` with coordinates `z` for generators
`gen_i` (`u_x(g) − 1 = Σ_i z_i(g)(u_x(gen_i) − 1)` for all `g, x`), `ρ` a representation of rank `r′` whose image spans
`M_{r′}(O)`, `γ ∈ G` with `ρ(γ) = y·1`, `c₁(y − 1) = 1`, `a ∈ G`, and let `b₀` bound the length of the Ribet cocycles of
`ρ` with values in `K_O/O` that vanish at the `τ_k` and at `γ`. Then some square matrix of rows tied for the tied
normaliser of `(γ, a, c₁)` has, through `ρ` at `X_j = 0`, a determinant of valuation at most `b₀`.

*Needs:* 3.1.

[ShortProof], `New/Congruences/FirstOrder/RibetMatrices` (`New.Selmer.exists_tiedRows_addVal_det_le`)

### 3.6 Tied rows for the characters

*Origin:* particular to this proof: tied rows that serve all characters at once, with determinants on each character
controlled modulo the monomials that do not divide `∏ X_j`.

*Method of the formal proof:* for each character the cocycle relations define a module of relations whose module of
functions is a module of character cocycles; 3.4 puts a multiple of the product of the variables of that type in its
Fitting ideal, and unit rows at the generators glue the characters into one matrix.

Let `O` be a discrete valuation ring and `u_x` representations of `G` over `O` with coordinates for generators made of
elements `δ_v` (`v ∈ W`) and two finite sets `s₀, s ⊂ G`. Let `ξ_e` (`e < t′`) be characters trivial on `γ` and the
`δ_v`; let `o_v(X)(X − 1)` kill every `u_x(δ_v)`; `p ≠ 0`; `ε_j(ξ_e(φ_k)) ≡ 1 mod p`; `q_e ∈ R_J[G]` with
`ξ_{e′}(q_e) = C` for `e′ = e` and `0` otherwise; `ty : J → {0, …, t′ − 1}` monotone. Suppose that for each `e` every
module of character cocycles for `ξ_e` has triangle cost `({j : ty(j) = e}, C, b_e)` for `τ(j, +), τ(j, −), φ(j, +),
φ(j, −)` and is detected by `s`. Then there are matrices `B_{e,i}` and weights `w_{e,i}` over `R_J` and, for each choice
`i = (i_e)`, a square matrix of tied rows (for the tied normaliser) whose determinant on `ξ_e` is
`c₀·det B_{e,i_e}`, `c₀ = C^{#s}·∏_v o_v(1)`, such that `Σ_i w_{e,i}·det B_{e,i} = Γ_e·∏_{ty(j) = e} X_j + ζ_e`, with
`ζ_e` in the colon ideal `(𝔫 : ∏_{ty(j) < e} X_j)` of the ideal `𝔫` spanned by the monomials not dividing `∏_j X_j`, and
`v(Γ_e(0)) ≤ b_e + (#{ty(j) = e} + #s)·v(C)`.

*Needs:* 3.1, 3.4.

[ShortProof], `New/Congruences/FirstOrder/RibetMatrices` (`New.Selmer.nonempty_characterRows`, `New.Selmer.CharacterRows`)

### 3.7 Ribet's lemma to first order over a discrete valuation ring

*Origin:* adapted from the published theory of Ribet's method in Fitting-ideal form, for a representation that is a
block plus several characters along a family: here to first order in tie variables, with one element for all
determinants of combinations `Σ ω_g(u_x(g) − 1)`, and with the cocycles of the characters bounded by triangle costs.

*Method of the formal proof:* the matrices of 3.5 and 3.6 are glued: on the block points the product of their
determinants is the value of one element of `S` (3.3), the weights of 3.6 combine the choices, and the coefficients
modulo `p` pass to coefficients in `K_O/O`.

Let `O` be a discrete valuation ring, `L` an `O`-algebra, `u_x` (`x ∈ Y`, `Y` finite) representations of `G` over `O`,
`S` a subalgebra of the families `Y → L[X_j]` and `𝒥` an `S`-submodule. Assume:
1. on `𝓧 ⊂ Y`, `u_x` is the block sum of `ρ_x` and characters `ξ_0 = 1, ξ_1, …, ξ_{t′−1}`, and the image of `ρ_π`
   spans all matrices, for one `π ∈ 𝓧`;
2. `γ_x` acts on `ρ_x` by a scalar `y_x` with `y_x − 1` a unit and trivially on the characters;
3. `p ≠ 0`, `𝒥` is a trace ideal for `p`, `τ_k, φ_k` (`k ∈ J × {+, −}`) and `ε_j`, and `ε_j(ξ_e(φ_k)) ≡ 1 mod p`;
4. `a ∈ G` with `∏_{e′ ≠ e}(ξ_e(a) − ξ_{e′}(a))` dividing `C` for every `e`, and `ty : J → {0, …, t′ − 1}` monotone;
5. the Ribet cocycles of `ρ_π` with values in `K_O/O` that vanish at the `τ_k` and at `γ_π` have length at most `b₀`;
6. the `δ_v` are trivial on the characters and `o_v(X)(X − 1)` kills every `u_x(δ_v)`;
7. for each `e`, every module of character cocycles for `ξ_e` (with `δ_v, γ_π, a`) has triangle cost
   `({ty(j) = e}, C, b_e)` and is detected by a finite `s ⊂ G`.

Then (a) [gluing] for tied matrices `B₀` and `M_i` and weights `w_i`, some `f ∈ S` multiplies every
`det(Σ_g ω_g(u_x(g) − 1))` into `𝒥` and has value `Σ_i w_i·μ₀·det ρ_x(B₀)·∏_e det ξ_e(M_i)` at `x ∈ 𝓧`; and (b) the
determinants `det(Σ_g ω_g(u_x(g) − 1))` (`ω` finitely supported) have a common Ribet element at `π` whose coefficient
comes from some `c ∈ O` with
`v(c) ≤ b₀ + Σ_e b_e + t′·(Σ_v v(o_v(1)) + 2#s·v(C)) + (#J + 1)·v(C)`.

*Needs:* 3.1, 3.3, 3.5, 3.6.

[ShortProof], `New/Congruences/FirstOrder/RibetLemma` (`New.Selmer.exists_traceIdeal_multiplier_eq_sum_det`, `New.Selmer.exists_isCommonRibetElement_addVal_le`)

## Layer 4: Even classes and triangles of Taylor–Wiles places

Ribet's method leaves, beside the Selmer group of the main summand, the extensions of the characters among
themselves: classes of `G_E` in the Tate twists `(O/ℓ^ν)(−e)`, `0 < e < t`. Their odd parts are bounded by the odd
class bound (6.1); the even parts, whose orders are not controlled, are removed by auxiliary places. Over the totally
real field `F`, Kummer maps satisfy a reciprocity law with the even classes; Taylor–Wiles places chosen one after
another, each with a new Kummer map that the earlier places do not see, cut the even classes down in a triangle.
Throughout, `E` is a CM field in `Ω` containing a primitive `5040`-th root of unity.

### 4.1 Even classes, triangles and auxiliary twists

*Origin:* definitions and conventions.

*Method of the formal proof:* the definitions use cocycles rather than classes, with explicit vanishing conditions
that single out representatives.

1. For a coefficient ring `O`, a set `S` of places, `ν ≥ 0` and `e ≥ 0`, the *even classes* `Ev_e(O, S, ν)` are the
   locally constant cocycles `c : G_E → (O/ℓ^ν)(−e)` unramified outside the places above `ℓ` and `S ∪ S̄`, with
   `c(g^c) = c(g)`, that vanish on the elements of the decomposition groups above `ℓ` with `cyc = 1`. The *odd classes*
   `Sha_e(O, ν)` are the cocycles in `(O/ℓ^ν)(−e)` unramified outside `ℓ`, vanishing on the local set above `ℓ` (the
   inertia groups above `ℓ` if `e = 0`, the elements of the decomposition groups above `ℓ` with `cyc = 1` otherwise),
   and with `c(g^c) = −c(g)` if `e ≠ 0` (ShortGRH background (odd classes over cyclotomic fields)).
2. A *tame generator family* `(ν, w, τ, φ)`: places `w_j` not above `ℓ`, `τ_j` the chosen tame generator at a place
   over `w_j`, and `φ_j ∈ G_ν`.
3. A *prime triangle* `(ν, w, τ, φ, a, t′, ty, h, c′)`, for a finite linear order `J`, a monotone
   `ty : J → {0 < e < t′}`, `a ∈ G_E` and `h, c′ ≥ 0`: `(ν, w, τ, φ)` is a tame generator family; there is a finite set
   `s` of elements with `cyc = 1` and `(#J + #s + 1)·h ≤ c′` such that every cocycle in `(O/ℓ^ν)(−e)` unramified off
   `ℓ` that vanishes at `a` and on `s` is `0` (all `O`, `e`), and for each exponent `e` and `g ∈ s` some `j` with
   `ty(j) = e` has `z(φ_j) = 2z(g)` for all `z ∈ Ev_e(O, ∅, ν)`; `∏_{k ≠ e, k < t′}(u^e − u^k)` divides `ℓ^h` in `ℤ_ℓ`,
   `u = cyc(a⁻¹)`; every `z ∈ Ev_{ty(j)}(O, {w_i}, ν)` with `z(τ_i) = 0` for `i < j` and `z(φ_i) = 0` for the `i < j`
   with `ty(i) = ty(j)` has `ℓ^h·z(τ_j) = 0`; and `4(χ(a)^e − 1)²` divides `ℓ^h` in `O` for `0 < e < t′`.
4. An *auxiliary twist* `(S, Q, ψ, c″)`: `Q` is auxiliary for `S` with no place above `ℓ`, `ψ` is anticyclotomic of
   modulus `Q` (it comes from the norm-one torus), and for some tame generators `σ_P` at places over the `P ∈ Q`,
   `Σ_P v_ℓ(ψ(σ_P) − 1) ≤ c″`.

Then: (a) for a tame generator family, `χ` is trivial on `τ^±` and every power of `χ` is `≡ 1 mod ℓ^ν` on `φ^±`; (b) a
cocycle modulo `ℓ^{e′}` of a representation trivial on the elements of inertia off `S` with `cyc = 1`, unramified off
`S` and the `w_j, w̄_j`, that vanishes on `τ^±`, is unramified off `S`; (c) if `c ∈ Ev_e(O, S, ν)` and `b ∈ O/ℓ^ν` is
killed by every additive `u : O/ℓ^ν → ℤ/ℓ^ν` for which `u∘c` is a cocycle for `cyc^(−e) mod ℓ^ν`, then `b = 0`.

*Needs:* 1.1; ShortGRH background (odd classes over cyclotomic fields); ShortGRH background (continuous cocycles and
Selmer modules).

[ShortProof], `New/Congruences/FirstOrder/EvenClasses` (`New.Selmer.evenClasses`, `New.Selmer.IsTameGeneratorFamily`, `New.Selmer.IsPrimeTriangle`, `New.Selmer.IsAuxTwist`, `New.Selmer.IsTameGeneratorFamily.mem_selmerModule_of_tame_eq_zero`, `New.Selmer.eq_zero_of_forall_mem_Z1_of_mem_evenClasses`)

### 4.2 Kummer maps and their reciprocity law with even classes

*Origin:* adapted from the published theory of Kummer duality for Tate twists of `ℤ/ℓ^ν` over a totally real field and
global reciprocity: here as a linear relation between the values of an even class at tame generators, with the values
of a Kummer map at the Frobenius elements as coefficients, and a count of Kummer maps modulo `ℓ`.

*Method of the formal proof:* a Kummer map is the restriction to `G_E` of a relation over `F` in a setting of local
conditions; the extension `cyc⁺` of `cyc` to `G_F`, trivial at `c`, gives the equivariance; the reciprocity law is the
defining property of a relation applied to the even class read over `F`; the count comes from the dimension of the
relations modulo `ℓ`, with at least four infinite places.

A Frobenius datum is *`ν`-split* if its place is not above `ℓ` and its Frobenius lies in `G_ν`. Let `x` be a finite
family of `ν`-split data and `T` a finite set of primes of `F`. Let `M_e = ℤ/ℓ^ν` with `G_F` acting by `(cyc⁺)^(−e)`. A
*Kummer map of exponent `e` off `T`* is a function `ψ : G_E → ℤ/ℓ^ν` such that `g ↦ (n ↦ nψ(g)/ℓ^ν)` is the restriction
of a relation off `T`: a locally constant map `y : G_ν → Hom(M_e, ℚ/ℤ)`, extended by `0` to `G_F`, with
`y(gug⁻¹) = cyc(g)·y(u)∘g⁻¹`, trivial on inertia at the primes outside `T`, such that `Σ_P y(φ_P)(z(γ_P)) = 0` for
every finite family of distinct primes `P ∉ T` of `F` with Frobenius elements `φ_P ∈ G_ν` and tame generators `γ_P`
and every cocycle `z` of `G_F` in `M_e` that satisfies the local conditions at the primes above `ℓ` (vanishing on the
part of the decomposition group in `ker cyc⁺`) and below `x` (vanishing on the decomposition group), vanishes at the
complex conjugations and is unramified outside these primes and the `P`.
(a) A Kummer map is locally constant; on `G_ν` it is a homomorphism negated by complex conjugation, and
`ψ(ghg⁻¹) = cyc(g)^(e+1)·ψ(h)`.
(b) Let `T` contain the primes above `ℓ` or below `x`, and let `w_j` be `ν`-split data above distinct primes of `F`
outside `T`, with tame generators `γ_j` normalised over `F`. If `z ∈ Ev_e(O, {w_j}, ν)` vanishes at the Frobenius
elements of `x`, then `Σ_j ψ(φ_j)·2z(γ_j) = 0`; so if `ψ(φ_i) = 0` for `i ≠ j`, every `n` divisible by `2ψ(φ_j)` kills
`z(τ_j)`.
(c) If `ν > 0`, `E` has at least four infinite places, and `x` is a finite family of `ν`-split data above distinct
primes of `F`, then for some finite `T` containing the primes above `ℓ` or below `x`, the reductions modulo `ℓ` of the
Kummer maps of exponent `e` off `T` span a space of dimension greater than the number of members of `x`.

*Needs:* 4.1; ShortGRH background (global duality for relations of finite Galois modules over a number field);
ShortGRH background (continuous cocycles and Selmer modules).

[ShortProof], `New/Congruences/FirstOrder/KummerMaps` (`New.Selmer.IsKummerMap`, `New.Selmer.IsKummerMap.hasKummerType`, `New.Selmer.IsKummerMap.sum_eq_zero`, `New.Selmer.IsKummerMap.nsmul_apply_tameGenerator_eq_zero`, `New.Selmer.exists_card_lt_finrank_kummerReductions`)

### 4.3 Taylor–Wiles places in a triangle, with prescribed Frobenii

*Origin:* particular to this proof: Taylor–Wiles places, the same number at every `ℓ`-power level and with Frobenius
data in a prescribed set, chosen in triangular order so that each new place sees a new Kummer map and the reciprocity
laws remove the even classes up to a bounded power of `ℓ`.

*Method of the formal proof:* the places are indexed by an exponent and a test point and chosen one after another:
a new Kummer map and an element killed by the earlier maps, at which the new map takes a given product (4.2 (c));
Chebotarev's theorem gives a place whose Frobenius has twice these values under the maps and at which the even
classes take twice their value at the test point; the reciprocity law of each Kummer map at its own place and the
later ones gives the triangle.

Let `E` have at least four infinite places and lie in the cyclotomic field of level `N′ > 0`, let `t′ ≥ 0`, `y′` with
`N′ + t′ < y′`, `γ ∈ G_E` a topological generator modulo `ker cyc`, `h ≥ 0` with `cyc(γ)^a − 1 | ℓ^h` for `0 < a < t′`,
and `ℓ ≤ y′²` or `h = 0`. Let `W` be a set of Frobenius data such that for all `ν` and `g` some `δ` with `cyc(δ) = 1`
has `W` containing most Frobenii near `δ^{ℓ^ν}g`. Then there are a finite linear order `J` and a monotone
`ty : J → {0 < e < t′}` such that for every `ν > 0` there are Taylor–Wiles places of level `ℓ^ν` indexed by `J` (Frobenius
data at places `w_j`, no two equal or conjugate, with `ℓ^ν | q_{w_j} − 1`), with data in `W`, forming a prime triangle
`(ν, w, τ, φ, γ⁻¹, t′, ty, y′h, y′²²h)`, `τ_j` the tame generators and `φ_j` the Frobenius elements.

*Needs:* 4.1, 4.2; ShortGRH background (most Frobenii); ShortGRH background (Taylor–Wiles places).

[ShortProof], `New/Congruences/FirstOrder/TrianglePrimes` (`New.Selmer.exists_isPrimeTriangle`)

### 4.4 Even parts and the triangle cost of Tate twists

*Origin:* particular to this proof: a prime triangle gives the triangle cost (3.1 (6)) of every module of cocycles in
a Tate twist, with the bound made of a crystalline colength and the length of the odd classes.

*Method of the formal proof:* the even part `c + c∘(g ↦ g^c)` of a cocycle is an even class, and the odd part is
counted by the odd classes; the triangle condition on the even part is the defining property of the prime triangle.

(a) Let `e ≠ 0` and `c` a continuous cocycle in `(O/ℓ^ν)(−e)`, unramified outside `ℓ` and `S ∪ S̄`, vanishing on the
elements of the decomposition groups above `ℓ` with `cyc = 1`. Then `c + c∘(g ↦ g^c) ∈ Ev_e(O, S, ν)`.
(b) Let `(ν, w, τ, φ, g₀, t′, ty, h, c′)` be a prime triangle, `e < t′`, and `Z` a module of cocycles in `(O/ℓ^ν)(−e)`
unramified outside `ℓ` and the `w_j, w̄_j`, such that `(χ(g₀)^e − 1)` kills `z(g₀)` for every `z ∈ Z` unramified off
`ℓ`. If the length of `Z` modulo its members satisfying the crystalline relations above `ℓ`, plus the length of
`Sha_e(O, ν)`, is at most `b`, then `Z` has triangle cost `({ty(j) = e}, ℓ^h, b)` for `τ, τ′, φ, φ′`, with
`τ′_j = (τ_j^c)⁻¹` and `φ′_j = (φ_j^c)⁻¹`.

*Needs:* 3.1, 4.1; ShortGRH background (odd classes over cyclotomic fields).

[ShortProof], `New/Congruences/FirstOrder/TateTwistCocycles` (`New.Selmer.add_conjGal_mem_evenClasses`, `New.Selmer.hasTriangleCost_tateTwist`)

## Layer 5: Operators at the auxiliary places

On the Hecke side the ties become operators. At each auxiliary place the norm from principal level to the base level is
deformed to first order, `Nm_j + α_j·∂_j`, where the tame generator acts as a diamond operator and Frobenius through a
normalised Hecke operator; a weak lift (a system whose normalised representation has the eigenvalue `1` everywhere)
has at a suitable Frobenius a Hecke polynomial that is a full chain of roots times an integral factor, which makes the
first-order term integral. The product of the deformed norms kills the ideal of tied traces, and its top coefficient,
applied through Ribet's element, clears the denominator of the projection to the lifts.

### 5.1 First-order deformations of the norm, and logarithms

*Origin:* particular to this proof: the algebra of products of first-order deformations of the norms of the factors
of a product of finite groups, and of logarithms on the stabiliser of a line in `GL_n` of a finite field.

*Method of the formal proof:* expansion of the product in square-free monomials; the transfer of the first entry is
computed on diagonal matrices; the logarithm is a norm weighted by a homomorphism to `ℤ/m`, and the congruences are
reductions modulo `m/(2k)`.

Let `ρ` map a product `∏_j Γ_j` of finite groups to a ring `R`, `𝒜_j` pairwise commuting subrings with `ρ(Γ_j) ⊂ 𝒜_j`,
`Nm_j = Σ_{g ∈ Γ_j} ρ(g)` and `∂_j ∈ 𝒜_j`, and write `a ≡ b` for `σ(a) = σ(b)` after a ring map `σ`.
(a) The coefficient `N_S = ∏_{j∈S} ∂_j ∏_{j∉S} Nm_j` of `∏_{j∈S} α_j` in `∏_j(Nm_j + α_j∂_j)` commutes with every
element commuting with all `𝒜_j`; `N_∅` is the sum of `ρ` over the whole group; for `j ∉ S`, `N_S = N′Nm_j` and
`N_{S∪{j}} = N′∂_j` for one `N′`.
(b) For `𝒩 = Σ_S N_S ∏_{i∈S} X_i` and a polynomial `P` over a commutative ring mapping to `R`, if `Nm_j t = 0` and
`∂_j t ≡ Nm_j r′`, the coefficient of `∏_{i∈J} X_i` in `𝒩·G(t − X_j r′)` is `≡ 0` for every `G`.
(c) If `Σ g⁻¹Ψg = n′`, `δ = n′²δ′` with `δ′` commuting with the group and the `N_S`, and each `g ∈ Γ_j` has `Z` with
`n′∂_j(g − 1) ≡ Nm_j Z` and `δ′·Nm·Z = 0`, then for `i ≥ #S` there is `Y` with `δ^i N_S ≡ Y·Nm`, and `Y = δ^i` for
`S = ∅`.
(d) Over a finite field, the transfer to `GL_n` of the character `g ↦ g_{11}` of the stabiliser of the first line is
the determinant.
(e) If `σ` kills every `y` with `2k′y ∈ mR` and an additive map `C′` on weights `ℤ/m → ℤ` kills every
`f(· − k′) − f`, then `σ` kills its value at the weight `valMinAbs`. For a homomorphism `a : H → ℤ/m` on a subgroup
`H ⊂ Γ`, the coset derivative `∂ = −(Σ_h ρ(h))·B(valMinAbs)·(Σ_h ρ(h⁻¹))` (`h` over representatives of `Γ/H`)
satisfies `n′∂(g − 1) ≡ Nm·Z` with `L′Z = 0`, under the hypotheses that `R` has no `#H`-torsion, `m = 0` after `σ`,
right multiplication by `p ∈ H` shifts weights by `a(p)`, `H` fixes `B(1)`, `Σ_{p∈H} p⁻¹Ψp = n′`, and `L′` is invariant
with `L′(B(1)) = 0`.

*Needs:* none.

[ShortProof], `New/Congruences/FirstOrder/OnePrime` (`New.Patching.familyCoeff`, `New.Patching.exists_empty_eq_sum_and_insert_eq_mul`, `New.Patching.map_top_coeff_mul_C_sub_X_mul_C_eq_zero`, `New.Patching.exists_map_pow_mul_family_eq_mul_norm`, `New.Patching.transfer_firstEntry`, `New.Patching.exists_map_nsmul_mul_sub_one_eq_sum_mul`)

### 5.2 Chains of roots for weak lifts

*Origin:* particular to this proof: the Hecke polynomial of a weak lift at a split place is divisible by the chain
`X₀, X₀q, …, X₀q^{t_O−1}`, and at most Frobenii a congruence of characteristic polynomials makes the cofactor
integral.

*Method of the formal proof:* the eigenvalue `1` of the normalised representation at every `g` gives, through the
attached representation and the spherical chain lemma, the full chain of roots; the integrality of the cofactor
comes from the congruence at a Frobenius where the remaining factor is a unit at `1`.

Let `O` be a descent pair, `x` a system of forms on `V` of the weight of `O`, `f ∈ x` nonzero, `u = x`'s Galois
representation normalised by `χ_O`. `x` is a *weak lift* if `det(1 − u(g)) = 0` for all `g`. A polynomial `P` has the
*chain of roots* `(e, q, d, t′)` if `P(dX) = ∏_{i<t′}(X − q^i)·S(X)` with `S | e`.
(a) If `x` is a weak lift and `w ∤ ℓ` is split with norm `q`, the Hecke polynomial of `f` at `w` has the roots
`X₀q^i`, `i < t_O`, where `X₀` is the value at a uniformiser of the Hecke character of `W` (the inverse of `χ_O` at a
geometric Frobenius).
(b) If moreover the characteristic polynomials of `u` are integral, then for most Frobenii `φ` at `w`: whenever
`det(X − u(φ))` is congruent modulo the maximal ideal to `S(X)·∏_{i<t_O}(X − χ(φ)^i)` with `|S(1)| ≥ 1`, the Hecke
polynomial of `x` at `w` has the chain of roots `(e, q_w, ι⁻¹(χ_O(φ))⁻¹, t_O)` for an integral `e` with `e(1) = 1`.
(c) If a subspace `Z ⊂ F(O)` is stable under the Hecke polynomial operators at all split places off the places of `O`,
so is its orthogonal complement, and `Z ⊂ N′` as soon as every nonzero form of `Z` lying in a system lies in `N′`.
(d) If a set of operators on a space with basis `b` contains all integral combinations of `m′` of its members and the
diagonal operators with eigenvalues `l_k` (`k < m′`), it contains a diagonal operator with eigenvalues `μ_k`,
`|ι(μ_k)| ≥ |ι(l_k(k))|`.

*Needs:* 1.1, 1.4; ShortGRH background (the spherical chain lemma for `GL_n`); ShortGRH background (most Frobenii).

[ShortProof], `New/Congruences/FirstOrder/HeckeStrings` (`New.Selmer.isRoot_hecke_chain`, `New.Selmer.eventually_exists_hasRootChain`, `New.Selmer.orthogonal_mem_invtSubmodule_heckePolyOnForms`, `New.Selmer.le_of_isotypic_mem`, `New.Selmer.exists_diagonal_mem_norm_ge`)

### 5.3 Tied traces and the dictionary at one auxiliary place

*Origin:* particular to this proof: traces of the normalised representations as elements of the Hecke algebra of the
systems at principal level at the auxiliary places, the ideal of tied traces, and the operators by which the tame
generator and Frobenius act on forms.

*Method of the formal proof:* the Hecke algebra is defined as the functions on systems that preserve the integral
forms; characteristic coefficients and the idempotent of a congruence class lie in it by the decomposition of a finite
algebra over a henselian local ring; at one place, local–global compatibility makes the tame generator act as a
diamond operator and Frobenius as a normalised `U`-operator.

Let `B` be base data, `Q` Taylor–Wiles places off the base level, `x` the systems of `B` at principal level at `Q`,
and `N_x` the twist of the representation of `x` by a character `a` with integral values, trivial at the tame
generators. The *Hecke algebra* `𝕋` is the set of functions `t` on these systems such that scaling each system by
`ι⁻¹(t(x))` preserves the integral forms.
(a) For all `g` and `i`, `x ↦ [X^i]det(X − N_x(g))` lies in `𝕋`; if these are integral, then for every system `π` the
indicator function of the systems congruent to `π` lies in `𝕋`.
(b) For `P ∈ ℤ_ℓ[X]` and `h, g ∈ G_E`, `tr[P(h)g] := (x ↦ tr(P(N_x(h))N_x(g)))` lies in `𝕋`. For polynomials `H_j`, the
*tied ideal* of `𝕋[α_j : j ∈ J]` is generated by the `ℓ^ν·tr[g]` and the `tr[(γ_j − 1 − α_j(φ_j − 1)H_j(φ_j))g]`.
(c) At `w = w_j`, with a unit `z̄` of `k_w`, a logarithm `ind : k_w^× → ℤ/ℓ^ν` with `ind(z̄) = 1` and the diamond
`diag(z̄, 1, …, 1)`: on a form of `x` on which `GL_n(k_w)` acts by `ψ∘ind∘det`, `tr[(γ − 1)g·p(φ)]` acts as
`(⟨γ⟩ − 1)` times `tr[g·p(φ)]`; on a form on which the stabiliser of a line acts by `ψ∘ind∘(g ↦ g_{11})`, with
`ψ(n!) ≠ 1`, `tr[(γ − 1)g·p(φ)]` acts as `p(Ũ)` times `tr[(γ − 1)g]`, `Ũ = a(φ)U` with `U` the Hecke operator of
`diag(ϖ, 1, …, 1)` for the pro-unipotent Iwahori subgroup.

*Needs:* 4.1; ShortGRH background (base data of the Taylor–Wiles method on a definite unitary group); ShortGRH
background (Taylor–Wiles places); ShortGRH background (local behaviour of attached representations at places of
principal level).

[ShortProof], `New/Congruences/FirstOrder/TiedTraces` (`New.Patching.BaseLevel.charpoly_coeff_mem_heckeAlgebra`, `New.Patching.BaseLevel.exists_indicator_isCongruent`, `New.Patching.BaseLevel.traceElement`, `New.Patching.BaseLevel.tiedIdeal`, `New.Patching.BaseLevel.tameTrace_smul_eq_diamond_sub_one`, `New.Patching.BaseLevel.tameTrace_smul_eq_aevalHecke`)

### 5.4 The family of operators at the auxiliary places

*Origin:* particular to this proof: the norm from the deep auxiliary level to the base level, deformed in one
parameter per place, kills the ideal of tied traces modulo `ℓ^ν/(2n!)` and factors through the norm up to a power of a
Hecke operator.

*Method of the formal proof:* at one place the first-order term `∂_j` is built from a logarithm on the residue field
(5.1 (e)) and the dictionary (5.3 (c)); the chain of roots of 5.2 makes it integral and relates it to Frobenius; the
product over the places (5.1 (a)–(c)) gives the family.

In the setting of 5.3, let `c` be the common multiple of the stabiliser orders of `B`, `Nm` the sum over
`∏_j GL_n(k_{w_j})`, and `≡` equality after a ring map `σ` on the integral endomorphisms that kills every `T` with
`ℓ^ν | 2n!T`.
(a) Let `δ ∈ 𝕋` and `t′ ≠ 0`, and suppose that at `w_j` the Hecke polynomial of every base system where `δ ≠ 0` has
the chain of roots `(H, q_{w_j}, a(φ_j)⁻¹, t′)` (5.2). Then there is an integral operator `∂` made of
translates at `w_j` such that for all `g`, `Nm_j·tr[(γ_j − 1)g] = 0` and `∂·tr[(γ_j − 1)g] ≡ Nm_j·tr[(φ_j − 1)H(φ_j)g]`,
and each `g ∈ GL_n(k_{w_j})` has an integral `Z` with `c·∂(g − 1) ≡ Nm_j Z` and `δ·Nm·Z = 0`.
(b) Let `δ = c²δ′`, `δ′ ∈ 𝕋`, with the chain condition of (a) (for polynomials `H_j`) at every `w_j` for the base systems where `δ′ ≠ 0`. Then there
are integral operators `𝒩_S`, `Y_S` (`S ⊂ J`) commuting with `𝕋`, with `𝒩_∅ = Nm` and `Y_∅ = δ^{#J}`, such that
`Σ_S 𝒩_{Sᶜ}·G_S ≡ 0` for every `G` in the tied ideal (`G_S` its coefficient at `∏_{j∈S} α_j`), and
`δ^{#J}𝒩_S ≡ Y_S·Nm` for all `S`.

*Needs:* 5.1, 5.2, 5.3; ShortGRH background (base data of the Taylor–Wiles method on a definite unitary group).

[ShortProof], `New/Congruences/FirstOrder/AuxiliaryPrimeTie` (`New.Patching.BaseLevel.exists_mul_traceElement_tameGenerator_eq_frob`, `New.Patching.BaseLevel.exists_deformed_norm_family`)

### 5.5 The top coefficient clears denominators

*Origin:* particular to this proof: applied to the projection of an integral form of base level, the top coefficient
of an element of the tied ideal, times a bounded integer, gives an integral form.

*Method of the formal proof:* the family of 5.4 applied to `(δ₀ − n₀)𝒟` in the tied ideal gives `Nm` times the top
coefficient on the projection, up to the factor `δ^{#J}` and the reduction; the norm of an integral form is integral.

In the setting of 5.4, let `ℓ^ν | q_{w_j} − 1` for all `j`.
(a) Let `A, δ₀ ∈ 𝕋`, `n₀ ∈ ℤ_ℓ`, `𝒟 ∈ 𝕋[α]` with coefficients `𝒟_S`, `(δ₀ − n₀)𝒟` in the tied ideal, the chain condition
at every `w_j` for the base systems where `Aδ₀ ≠ 0`, and `2n!(n₀c²)^{#J+1} | ℓ^ν`. If `l` is a form of base level with
`d·l` integral, and `y` satisfies `Aδ₀l = n₀Ay`, `δ₀y = n₀y` and `𝒟_S y = 0` for `S ≠ J`, then
`d·c·A^{#J+1}𝒟_J y` is integral.
(b) Let `δ_i` be functions on the systems, `δ₀ = ∏_k(λ_k − δ_{s(k)})`, `n₀ = ∏_k λ_k`, the characteristic polynomials of
the `N_x` integral, the chain condition at every `w_j` for the base systems congruent to `π` with `δ₀ ≠ 0`,
`2n!(n₀c²)^{#J+1} | ℓ^ν`, and suppose that for a scalar `m′`, every trace ideal of the `N_x` (3.1 (4), for `ℓ^ν`, the
tame generators, the Frobenius elements and the `H_j`) has a common Ribet element for the `δ_i` at `π` with
coefficient `r′`, `v_ℓ(m′r′) ≤ B′`. Then there is a function `s` on the systems with `v_ℓ(m′s(π)) ≤ B′` such that `d·c·s·y`
is integral whenever `l, y` are of base level, `d·l` is integral, `y` is supported on `𝓧` and `l, y` agree at the
systems where `δ₀ ≠ 0` (`s·y` the diagonal operator).

*Needs:* 3.1, 5.4.

[ShortProof], `New/Congruences/FirstOrder/AuxiliaryPrimeTie` (`New.Patching.BaseLevel.smul_top_coeff_mem_ellIntegralForms`, `New.Patching.BaseLevel.exists_diagOp_mem_ellIntegralForms`)

## Layer 6: Ribet's element and the bound for denominators

The algebra of Layer 3, the triangles of Layer 4 and the operators of Layer 5 are assembled for the representations of
the descent pairs. The local defects above `ℓ` (SelmerBoundsForAnticyclotomicTwists §4.6) bound the cocycles at the lift; a
lattice adapted to the block decomposition gives Ribet's element with its top coefficient bounded (6.5); the
operators at the auxiliary places then clear the denominator at each base system (6.7), and a projection argument
for forms orthogonal to the false lifts gives the bound for denominators (6.9).

### 6.1 The constants of the denominator bound

*Origin:* adapted from the published theory of the minus parts of class groups of cyclotomic fields (Stickelberger's
theorem; for large `ℓ` a bound of this kind follows from the main conjecture of Mazur and Wiles): here an upper bound
for the lengths of the odd classes at every prime and every finite level by the valuations of one integer of explicit
size, the same for all primes; with the definitions of the constants of the denominator bound.

*Method of the formal proof:* (a) is the background bound for odd classes over cyclotomic fields: for `0 < e < t` a
nonzero Stickelberger bound of size at most `2^((N_c + e + 3)^6)` gives an integer that kills the module, a power of
their product bounds the length for small and for large `ℓ`, and the class number serves for `e = 0`; `o_D` is the
integer so obtained for the conductor and the `t` of the data. The other constants are explicit.

(a) *The odd class bound.* The integer comes before the prime: there is a positive integer `o_D`, depending on the
data `D` only, with `o_D ≤ 2^(4(N_c + t + 3)^27)·h_E` (`N_c` the conductor of a cyclotomic field containing `E`, `h_E`
the class number of `E`), such that for every prime `ℓ`, for all large coefficient rings `O` at `ℓ`, all `e < t` and
all `ν ≥ 0`, the length over `O` of the odd classes `Sha_e(O, ν)` (for `e = 0`: of the everywhere unramified
homomorphisms) is at most the valuation of `o_D` in `O`, that is, its normalised length is at most `v_ℓ(o_D)`. Fix
such an `o_D` once for the data; it does not depend on `ℓ`, on `ι` or on `O`.

(b) *The constants at a prime `ℓ`.* Put
- `loc_ℓ = 4f·d_ℓ`, with `d_ℓ` the local loss of SelmerBoundsForAnticyclotomicTwists §4.1 (the local loss bound, there
  the defect bound `B_ℓ`: `10⁶(m/k)(b·v_ℓ(M) + v_ℓ((2b)!·Π^{h_Δ³}))`, `Π` the product of the integers in `(b − 30h_Δ³, b + 30h_Δ³]`);
- `e_ℓ = t·v_ℓ(o_D) + 8ft·v_ℓ(n_GL) + 2v_ℓ(n_GL) + ((4t + 1)h_Δ²² + h_Δ)·v_ℓ(n_GL)`;
- `β_ℓ = loc_ℓ + (1 + 2t)·e′_ℓ + e_ℓ + v_ℓ(n_GL)`, the *clearing bound*;
- for a descent pair `O`, `ram, sel ≥ 0`: `β(O, ram, sel) = sel + 2t_O·ram + r_O·loc_ℓ + e_ℓ`.

*Needs:* 1.5, 4.1; SelmerBoundsForAnticyclotomicTwists §4.1 (the local loss bound `B_ℓ`); ShortGRH background (odd classes over
cyclotomic fields: for a CM field `E` inside the cyclotomic field of conductor `N_c` and an integer `t`, one nonzero
integer `X ≤ 2^(4(N_c + t + 3)^27)·h_E` such that for every prime `ℓ`, every coefficient ring `O` at `ℓ` with enough
roots of unity, every `e < t` and every `ν`, the length of the odd classes in `(O/ℓ^ν)(−e)` is at most the valuation
of `X` in `O`).

[ShortProof], `New/Congruences/FirstOrder/TraceRelations` (`New.Selmer.oddClassBound`, `New.Selmer.oddClassBound_le`, `New.Selmer.localDefectBound`, `New.Selmer.denominatorError`, `New.Selmer.clearingBound`, `New.Selmer.eventually_length_shaOdd_le`); `New/Congruences/FirstOrder/DenominatorBound` (`New.Selmer.liftValuationBound`); `Lib/Cyclotomic/OddSha` (`New.exists_length_shaOdd_le`)

### 6.2 Block-diagonal lattices and the local defects of Ribet's cocycles

*Origin:* particular to this proof: a representation with the trace of a twisted main summand plus `t′` Tate twists has a
block-diagonal lattice, and the crystalline colength of Ribet's cocycles above `ℓ` is bounded by the sum of the local
defects of the summands, which add up to at most `r′·loc_ℓ`.

*Method of the formal proof:* nondegeneracy of the trace form makes the representation the semisimple sum with the
traces given, and the spanning lattice of the summand fixes the block; at each place above `ℓ` the local lattices lie in
one class of the local theory, and local duality bounds the colength by the defect of the Tate dual.

(a) Let `R′` of rank `n` have nondegenerate trace form on the span of its image and
`tr R′(g) = ψ(g)tr R(g) + Σ_{e<t′} χ(g)^e`, with `R` of rank `r′`, and let `R₀` be a lattice of `R` over `O` and `ψ′` a
model of `ψ` such that `ψ′R₀` spans `M_{r′}(O)`. Then `R′` has a lattice over `O` that is block diagonal with summands
`ψ′R₀` and `O(−e)`, `e < t′`; and for a finite family of such representations with lattices, there are lattices of all
of them that are block diagonal at the members with this trace.
(b) Let `u_x` (finitely many) and `ρ` be lattices whose restrictions to each place `v` above `ℓ` lie in one class of
local lattices of SelmerBoundsForAnticyclotomicTwists §3.1 (classes of local lattices). Then the Ribet cocycles of `ρ` modulo
`ℓ^{M′}` satisfying the crystalline relations above `ℓ` have colength at most the sum over `v` of the dual defects of
`ρ` at `v`.
(c) Let `V` with `c` be a lift setting for `ϑ`, `R` a main summand of rank `r′` with string length `t′`, and `ρ_x`
representations of type `(V, t′, J′, c̃_i(X − 1)^{t′}, S)`. For all large `O`, if `u_x` are lattices of the `ρ_x` and `u_π`
is block diagonal with summands `T` and `O(−e)`, `T` agreeing above `ℓ` with a lattice of `R`, then at each place above
`ℓ` some class of local lattices contains all `u_x` and the summands of `u_π`, and the normalised dual defects of the
`t′ + 1` summands at all places above `ℓ` add up to at most `r′·loc_ℓ`.

*Needs:* 1.3, 1.4, 6.1, 3.1; SelmerBoundsForAnticyclotomicTwists §3.1 (classes of local lattices and dual defects),
§4.8 (the class of a lattice read at a place above `ℓ`), §4.7 (the colength of the crystalline relations, by the dual
defect), §4.6 (the defect of the dual of a summand at a place above `ℓ`).

[ShortProof], `New/Congruences/FirstOrder/TraceRelations` (`New.Selmer.exists_blockDiagonal_lattice`, `New.Selmer.exists_blockDiagonal_lattices`, `New.Selmer.crystallineColength_le_sum_dualDefect`, `New.Selmer.eventually_exists_inClass_sum_dualDefect_le`)

### 6.3 Tame relations at the places above `M` and at the twist places

*Origin:* particular to this proof: at the places above `M` and of the modulus of an auxiliary twist, inertia satisfies
polynomial relations whose values at `1` have bounded total valuation.

*Method of the formal proof:* above `M` the inertia spectra of 2.4 (a) give the polynomial with valuation controlled by
`v_ℓ(n_GL)`; at the twist places the quadratic relation of 2.5 gives `X − ψ(σ)`.

Let `V` with `c` be a lift setting for `ϑ`, `(bad places, Q, ψ, ram)` an auxiliary twist, `u_x` representations of type
`(V, t′, J, c̃_i(X − 1)^{t′}, S)` with `(u_x(g) − ψ(g))(u_x(g) − 1) = 0` on `I_Q`, and `u′_x`, `ψ′` models over `O`. Then
there are finitely many places `q_v` prime to `ℓ`, covering up to conjugation the places above `M` not above `ℓ` and the
places of `Q`, with tame generators `δ_v`, and polynomials `o_k` (`k` running over `δ^±`) with
`o_k(u′_x(δ^±_k))(u′_x(δ^±_k) − 1) = 0` for all `x`, such that the normalised `Σ_k v(o_k(1)) ≤ 2ram + 8f·v_ℓ(n_GL)`.

*Needs:* 2.4, 2.5, 4.1.

[ShortProof], `New/Congruences/FirstOrder/TraceRelations` (`New.Selmer.exists_tame_relations`)

### 6.4 The cocycles of the main summand at the lift

*Origin:* particular to this proof: with divisible coefficients, the Ribet cocycles of the twisted main summand at the
lift, killed at the tame generators of the auxiliary places, are counted by the local loss and its Selmer group.

*Method of the formal proof:* killing the tame generators removes the ramification at the auxiliary places (4.1 (b));
what remains is the Selmer module up to the crystalline colength, bounded by the local defects (6.2 (b)).

Let `(ν, w, τ, φ)` be a tame generator family, `T` a lattice of rank `r′` and `u_x` lattices over `O` whose restrictions
above `ℓ`, with the summands `T`, `O(−e)` (`e < t′`), lie in classes of local lattices with normalised dual defects
adding up to at most `r′·loc_ℓ`; let the `u_x` be continuous and unramified outside `ℓ`, `M`, `Q ∪ Q̄` and the `w_j, w̄_j`,
`T` unramified outside `ℓ`, `M`, `Q ∪ Q̄`, and the normalised `sel(T, Q, γ) ≤ sel < ∞`. Then there are `b₀` and a loss
`λ_T` with `b₀ = λ_T + sel(T, Q, γ)`, the Ribet cocycles of `T` in `K_O/O` vanishing on `τ^±` and at `γ` of length at most
`b₀`, and the normalised `λ_T` plus the normalised crystalline colengths modulo `ℓ^ν` of the `O(−e)`, `e < t′`, at most
`r′·loc_ℓ`.

*Needs:* 1.5, 4.1, 6.1, 6.2.

[ShortProof], `New/Congruences/FirstOrder/RibetElement` (`New.Selmer.exists_length_le_loss_add_crystallineSelmerLength`)

### 6.5 Ribet's element for conjugate self-dual representations

*Origin:* adapted from Bellaïche and Chenevier (2009) and Urban (2001): the congruence ideal bounded by Selmer lengths
through lattices in a family; here as an element of a polynomial algebra in tie variables at the places of a prime
triangle, for a twisted main summand plus `t′` Tate twists, whose top coefficient is bounded by the Selmer length with
divisible coefficients, the ramification of the twist, the local defects and an error term made of the class number,
the odd classes and the order of the chosen groups, without the orders of the even classes.

*Method of the formal proof:* the coefficient ring is enlarged until the representations, the twist and the triangle
are defined over it; block-diagonal lattices (6.2 (a)) put the family in the form of 3.7; the cocycles of the block are
bounded by 6.4, those of the characters by the triangle cost of 4.4 with the odd classes, and the relations at the old
places by 6.3; Ribet's lemma to first order (3.7) gives the element.

Let `V` with `c` be a lift setting for `ϑ`, `t′ = t_V`, `r′ = r_V`, `(bad places, Q, ψ, ram)` an auxiliary twist, and
`h ≤ v_ℓ(n_GL)`. Let `(ν, w, τ, φ, g₀, t′, ty, h_Δh, h_Δ²²h)` be a prime triangle. Let `u_x` (`x ∈ Y`, finite) be
representations of type `(V, t′, J′, c̃_i(X − 1)^{t′}, Q ∪ Q̄ ∪ {w_j, w̄_j})` with `(u_x(g) − ψ(g))(u_x(g) − 1) = 0` on
`I_Q`. For `x ∈ 𝓧 ⊂ Y` let `u_x` have lift trace `(ψ, R_x, t′)` with `R_x` a main summand with string length `t′`, and
`ψR_x` a twisted lattice for some `(γ_x, ζ_x)`. Let `S`, `𝒥` be a trace ideal for `ℓ^ν`, the `τ_j`, the `φ_j` and
polynomials `H_j` with `H_j(1) = 1`. At `π ∈ 𝓧` let `R_π` have divisible Selmer length at most `sel < ∞` for
`(ψ, Q, γ_π, ζ_π)`. Then the families `x ↦ det(1 − u_x(g))` have a common Ribet element at `π` whose coefficient `d` of
`∏ X_j` satisfies `v_ℓ(d) + 2v_ℓ(n_GL) ≤ sel + 2t′·ram + r′·loc_ℓ + e_ℓ`.

*Needs:* 1.3, 1.4, 1.5, 3.7, 4.1, 4.4, 6.1, 6.2, 6.3, 6.4.

[ShortProof], `New/Congruences/FirstOrder/RibetElement` (`New.Selmer.ribet_columns`), with `New/Congruences/FirstOrder/TateTwistCocycles`

### 6.6 The separating element and the auxiliary places of the Taylor–Wiles method

*Origin:* particular to this proof: an element separating the powers of the cyclotomic character up to a power of `ℓ`
bounded by `v_ℓ(n_GL)`, and Taylor–Wiles places in a triangle at which every weak lift congruent to a given lift has a
Hecke polynomial with a chain of roots and an integral cofactor independent of the system.

*Method of the formal proof:* for `ℓ > h_Δ²` a generator modulo `ℓ` separates the powers; for small `ℓ` the powers
`p_i^d − 1` dividing `n_GL` give the bound; 4.3 is applied with the set of Frobenius data on which 5.2 (b) holds and
the twisted main summand is a unit at `1`.

(a) There are `h ≤ v_ℓ(n_GL)`, with `h = 0` unless `ℓ ≤ h_Δ²`, and a topological generator `γ` of `G_E` modulo `ker cyc`
such that `cyc(γ)^a − 1 | ℓ^h` in `ℤ_ℓ` for `0 < a < t`; if `ℓ > h_Δ²`, `cyc(γ)^a − 1` is a unit.
(b) Let `V` with `c` be a lift setting for an auxiliary twist `ϑ` of ramification at most `ram`, `B` base data whose
systems have integral characteristic polynomials, `x₀` a system with lift trace `(ψ_ϑ, R, t_V)` for a main summand `R`,
and `γ, h` as in (a). Then there are a finite linear order `J` and a monotone `ty : J → {0 < e < t_V}` such that for every
`ν > 0` some places of norm `≡ 1 mod ℓ^ν`, indexed by `J`, form a prime triangle for `γ⁻¹` with bounds `h_Δh` and
`h_Δ²²h`, avoid the bad places and are off the base level, and at which, for every weak lift `x` of base level
congruent to `x₀`, the Hecke polynomial at `w_j`, has the chain of roots
`(e_j, q_{w_j}, ι⁻¹(χ_V(φ_j))⁻¹, t_V)` with `e_j` integral, `e_j(1) = 1`, independent of `x`.

*Needs:* 2.2, 4.1, 4.3, 5.2; ShortGRH background (base data of the Taylor–Wiles method on a definite unitary group).

[ShortProof], `New/Congruences/FirstOrder/DenominatorBound` (`New.Selmer.exists_cyclotomicChar_pow_sub_one_dvd`, `New.Selmer.exists_isUnit_cyclotomicChar_pow_sub_one`, `New.Selmer.exists_eventually_hasRootChain_mostFrobeniiAt`, `New.Selmer.exists_taylorWilesPlaces_hasRootChain`)

### 6.7 The operator at one base system

*Origin:* particular to this proof: at a base system that lifts a main summand with short Selmer group, an operator
diagonal in the systems, with eigenvalue of bounded valuation there, takes forms of base level that agree with an
integral form off the non-weak-lift systems to integral forms.

*Method of the formal proof:* 6.6 gives the places; 6.5 gives a common Ribet element for every trace ideal of the
normalised representations; 5.5 (b) turns it into the operator.

(a) Let `V` with `c` be a lift setting for `ϑ` of ramification at most `ram`, the places of a prime triangle with bounds
`h_Δh` and `h_Δ²²h` (`h ≤ v_ℓ(n_GL)`), and `N_x` (finitely many systems) normalised representations of type
`(V, t_V, J, c̃_i(X − 1)^{t_V}, Q(ϑ) ∪ Q(ϑ)̄ ∪ {w_j, w̄_j})` with the quadratic relation on `I_{Q(ϑ)}`; let each system of `𝓧` lift a main summand
with a twisted lattice, with divisible Selmer length at most `sel < ∞` at `x₀`, and `𝒥` a trace ideal for `ℓ^ν` with
`H_j(1) = 1`. Then the families `x ↦ det(1 − N_x(g))` have a common Ribet element at `x₀` whose top coefficient `d` has
`v_ℓ(n_GL²·d) ≤ β(V, ram, sel)`.
(b) Let `B` be base data whose systems at every level outside the bad places have normalised representations of type
`(V, t_V, J, c̃_i(X − 1)^{t_V}, Q(ϑ) ∪ Q(ϑ)̄ ∪ u ∪ ū)` (`u` the places of the level) with the quadratic relation on `I_{Q(ϑ)}`, and `𝓧`, `x₀` as in (a). Then at some
auxiliary level there is a function `s` on the systems with `v_ℓ(n_GL²·s(x₀)) ≤ β(V, ram, sel)` such that
`n_GL²·s·y` is integral whenever `l` and `y` are of base level, `n_GL·l` is integral, `y` is supported on `𝓧`, and `l`
and `y` have the same components at the base systems that are not weak lifts.

*Needs:* 5.5, 6.1, 6.5, 6.6.

[ShortProof], `New/Congruences/FirstOrder/DenominatorBound` (`New.Selmer.exists_isCommonRibetElement_ellVal_le`, `New.Selmer.exists_ellVal_le_and_diagOp_mem_ellIntegralForms`)

### 6.8 Lift generators and projections orthogonal to the false lifts

*Origin:* particular to this proof: a form orthogonal to the false lifts differs from its projection to a space of
lifts, in each type, only on systems that are not weak lifts.

*Method of the formal proof:* the space of lifts and its complement are Hecke stable (5.2 (c)); in a system that is a
weak lift and not in the space of lifts, the false lifts fill the complement, so the component of a form orthogonal to
them vanishes there.

Let `O` be a descent pair, `E′` an element of the group algebra of `∏_i GL_{r_O}(k_{w_i})` and `Z ⊂ F(O)`. A *lift
generator* of `Z` for `(ϑ, sel)` is a form of `Z` in the range of a type projection `e_c` with `(O, c)` a lift setting for
`ϑ` and `range e_c ⊂ range E′`, that lifts a system with a main summand `R` (for a pair `V′` with `μ_O = μ_{V′}·ϑ`)
such that `R` has divisible Selmer length at most `sel` for `(ψ_ϑ, Q(ϑ), γ, ζ)`. The *false lifts* (for `E′` and `Z^⊥`) and
"orthogonal to the false lifts" are those of NormsOfThetaLiftsAndExchangeIdentities (false lifts): forms in `Z^⊥` and
the range of `E′` killed by the Hecke polynomial at the root expected of a lift, at some split place off the level.
(a) Let `ϑ` be auxiliary of ramification at most `ram`, `(O, c)` a lift setting, `Z` stable under the Hecke polynomial
operators and under `e_c` with `range e_c ⊂ range E′`, and `y` orthogonal to the false lifts. If every nonzero form of
`range e_c` in a system and outside `M′` belongs to a weak lift, then `e_c(y − pr_Z y) ∈ M′`.
(b) The span of the lift generators of `Z` is stable under the Hecke polynomial operators and under every `e_c` of a
lift setting.

*Needs:* 1.3, 1.4, 1.5, 4.1, 5.2; NormsOfThetaLiftsAndExchangeIdentities (false lifts);
ThetaLiftChainsAndTheSeesawIdentity §2.16 (descent pairs and lifted Hecke polynomials).

[ShortProof], `New/Congruences/FirstOrder/DenominatorBound` (`New.Selmer.IsLiftGenerator`, `New.Selmer.typeProjection_sub_starProjection_mem_of_isOrthogonalToFalseLifts`, `New.Selmer.span_isLiftGenerator_mem_invtSubmodule`)

### 6.9 The bound for denominators

*Origin:* particular to this proof: the denominator of the projection to a space spanned by lifts, for a twist with
short Selmer groups, is cleared by an operator whose determinant has `ℓ`-adic norm at least `ℓ^(−dim Z·r_O·β_ℓ)`, on the
integral forms orthogonal to the false lifts; the bound is made of local losses, the twist allowance, the class number,
the odd classes and the order of the chosen groups.

*Method of the formal proof:* each lift generator gives, through the base data of 2.6 and the operator of 6.7, a linear
map with every lift generator as eigenvector and an eigenvalue of bounded valuation at it (projections of forms
orthogonal to the false lifts are integral, by 6.8); 5.2 (d) combines them into one operator diagonal in the lift
generators; multiplying by `n_GL` and taking the determinant gives the clearing bound.

Let `O` be a descent pair, `E′` and `Z ⊂ F(O)` as in 6.8.
(a) Let `ϑ` have ramification at most `ram` (`(bad places, Q(ϑ), ψ_ϑ, ram)` an auxiliary twist), `sel < ∞`, and `Z` be
spanned by lift generators for `(ϑ, sel)`. Then some operator `Λ` on `Z` preserves the Hecke eigenspaces at the split
places off the level, has every eigenvalue `μ` with `v_ℓ(ι(μ)) ≤ β(O, ram, sel)`, and takes `pr_Z y` to an integral form
for every `y` integral at `ι` and orthogonal to the false lifts.
(b) If `ϑ` has ramification at most `e′_ℓ` and `Z` is spanned by lift generators for `(ϑ, e′_ℓ)`, then some operator `Λ` on
`Z` has `|ι(det Λ)| ≥ exp(−dim Z·r_O·β_ℓ·log ℓ)`, takes `pr_Z y` to a form integral at `ι` for every `y` integral at
`ι` and orthogonal to the false lifts, and `|ι⟨y′, Λ pr_Z y⟩| ≤ 1` for every `y′` integral at all places above `ℓ`. That
is, the projection to `Z` has denominator at most `β_ℓ log ℓ` in the sense of NormsOfThetaLiftsAndExchangeIdentities
(the denominator predicate).

*Needs:* 2.6, 5.2, 6.1, 6.7, 6.8; NormsOfThetaLiftsAndExchangeIdentities (the denominator predicate; false lifts).

[ShortProof], `New/Congruences/FirstOrder/DenominatorBound` (`New.Selmer.exists_operator_ellVal_le_liftValuationBound`, `New.Selmer.exists_operator_det_clearingBound`, `New.Selmer.denominatorLe_clearingBound`)

## Layer 7: The choice of twists

For each prime and each identification `ι`, the twisting theorem (SelmerBoundsForAnticyclotomicTwists §5.4) gives an
`m`-fold twist whose powers make the Selmer groups of finitely many main summands short; with 6.9 these bound the
denominators of the projections to the lifts and to the lines of the main pairs; and the bounds, summed over the
primes, fit the budget.

### 7.1 The budget of the clearing bounds

*Origin:* particular to this proof: summed over any finite set of primes with the weights `log ℓ`, the clearing bounds
and the valuations of the class number of `U(1)` at the chosen level are at most `B_den`.

*Method of the formal proof:* the weighted sum of the valuations of an integer is at most its logarithm; the local
loss gives the main term `4·10⁶e¹⁸⁰·f(m/k)·b·log b`, and the other terms are negligible, at most a fixed power of `x`;
the scale inequalities of the data compare the total with `B_den`.

Reals `e_ℓ′ ≥ 0` are *negligible with exponent `C′`* if `Σ_{ℓ∈T} e_ℓ′ log ℓ ≤ x^{C′}` for every finite set `T` of primes.
(a) For every finite set `T` of primes and `a′ ≤ b′`, `Σ_{ℓ∈T} v_ℓ(a′) log ℓ ≤ log b′`.
(b) `Σ_{ℓ∈T} loc_ℓ log ℓ ≤ 4·10⁶·e¹⁸⁰·f·(m/k)·b·log b`.
(c) The families `ℓ ↦ v_ℓ(o_D)`, `ℓ ↦ e′_ℓ`, `ℓ ↦ e_ℓ` and `ℓ ↦ v_ℓ(h_{U(1)})` are negligible with exponents `2000`,
`999`, `4000` and `30`. For the first this uses that `o_D` is one integer for all primes (6.1 (a)), so that (a)
applies with `a′ = o_D` and `b′ = 2^(4(N_c + t + 3)^27)·h_E`, and `log b′ ≤ x^{2000}` by the sizes of the data.
(d) `Σ_{ℓ∈T}(β_ℓ log ℓ + v_ℓ(h_{U(1)}) log ℓ) ≤ B_den`, where `h_{U(1)}` is the number of classes of `U(1)` at the chosen
level.

*Needs:* 6.1; OneSidedPrimeSumBoundsAndAdmissibleData §3.3 (the sizes of the data: the scale inequalities, the bound
for the class number of `E`), §2.3 (a) (a cyclotomic field containing `E`, for the conductor `N_c`);
CompositeThetaLiftsAndShortForms §5.2 (a) (the bound for the number of classes of `U(1)` at a level).

[ShortProof], `New/Congruences/FitTwistsExist` (`New.Selmer.sum_localDefectBound_mul_log_le`, `New.Selmer.isNegligible_padicValNat_oddClassBound`, `New.Selmer.isNegligible_denominatorError`, `New.Selmer.isNegligible_twistError`, `New.Selmer.sum_clearingBound_add_padicValNat_le`)

### 7.2 Main summands of the lifts and denominators for the powers of a twist

*Origin:* particular to this proof: the space of lifts is spanned by lift generators whose systems do not depend on
the twist, and the main pairs have rank-one main summands; so a twist that shortens the Selmer groups of finitely many
main summands bounds the denominators for the lifts and for the lines of the main pairs.

*Method of the formal proof:* the lifts of good eigenforms on `W_j` span the space of lifts; their systems occur on
`W_m` by equality of multiplicities; the main summands come from 2.8 (d), and for a main pair from the trivial
representation with the jump `0` (2.7 (c)); 6.9 (b) gives the denominators. For (e), let `s_c` be representatives,
integral above `ℓ`, of the classes `c` of `U(1)` at the chosen level; the sum `Ξ″` over `c` of the translates of `Ξ′` by
the central elements `s_c⁻¹`, each multiplied by the value of the character of `V` there, is integral above `ℓ`, is
orthogonal to the false lifts for the complement of the line (the same sum applied to a false lift in that complement
lies in the kernel of the descent, because the stabilisers are trivial), and has `pr Ξ″ = h_{U(1)}·pr Ξ′`, because
these translations fix `φ`. On a line the clearing operator is a scalar `μ` with `|ι(μ)| ≥ e^{−β}`, and the
denominator bound applied to `Ξ″` and paired with `Ξ` gives `|ι(μ·h_{U(1)}·⟨Ξ, pr Ξ′⟩)| ≤ 1`.

(a) The trivial rank-one representation is a representation of type `(O, 1, {0}, X − 1, ∅)` for every descent pair `O`
with `W` of rank one; for every main pair `p` for `j` there is a rank-one main summand for the lift of the untwisted
character of `p` and the trivial system.
(b) For a twist `ϑ` and `1 ≤ j ≤ m`, `Z_j(ϑ)` is spanned by its forms `y` that lie in the range of `e_c` for a tuple `c`
with `(O_j(ϑ), c)` a lift setting for `ϑ` and `range e_c ⊂ range e₀`, and lift a system that occurs in a nonzero good form
on `W_m`.
(c) Let `ϑ` be auxiliary for the bad places with ramification at most `e′_ℓ`. If every system of good forms on `W_m` has
a main summand `R` for `(O_j(1), ·)` with `R` of divisible Selmer length at most `e′_ℓ` for `(ψ_ϑ, Q(ϑ), γ, ζ)` (some
`γ, ζ`), then the projection to `Z_j(ϑ)` has denominator at most `β_ℓ log ℓ` for `e₀`. If `p` is a main pair for `j` and
its rank-one main summand has divisible Selmer length at most `e′_ℓ`, the projection to the line of the lifted form of
the lift of the character of `p` twisted by `ϑ` has denominator at most `β_ℓ log ℓ` for the idempotent of the labels
`X − 1`.
(d) A denominator bound `β` for `Z_j(ϑ)` and `e₀` gives, for every `β′ ≥ β`, an operator clearing the projection in the
sense of DeterminantsOfThetaLiftChains §1.3 (b) (regular families of twists).
(e) *From the denominator of a line to the pairing of test forms.* Let `p = (ν, z)` be a main pair for `j`, `ϑ` a
twist, `V` the definite space of rank `2z` of the lift of `νϑ` from `U(1)` (2.2 (b)), `φ` the lifted form and `pr` the
orthogonal projection to the line `ℂφ`. A *test form* at `ℓ` is a form on `V`, of the weight and level of that descent
pair, that is integral at every embedding `ℂ → ℂ_ℓ` and orthogonal to the false lifts taken for the idempotent of the
labels `X − 1` and for the kernel of the descent to `U(1)`, the adjoint of the lift
(NormsOfThetaLiftsAndExchangeIdentities (test forms)). Suppose that the projection to `ℂφ` has denominator at most `β`
at `ι` for the idempotent of the labels `X − 1`, in the sense of 6.9 (b) with `Z = ℂφ` (there the false lifts are
taken for `Z^⊥`, not for the kernel of the descent), and that the stabiliser in `U(1)(E⁺)` of every class of `U(1)` at
the chosen level is trivial, as it is on the data. Then, for any two test forms `Ξ, Ξ′` at `ℓ`,
`|ι(h_{U(1)}·⟨Ξ, pr Ξ′⟩)| ≤ e^β` and hence `|ι⟨pr Ξ, pr Ξ′⟩| ≤ exp(β + v_ℓ(h_{U(1)})·log ℓ)`, with `h_{U(1)}` the number
of classes of `U(1)` at the chosen level. This is the second clause of the denominators of
DeterminantsOfThetaLiftChains §1.3 (b) (regular families of twists) for `ϑ` and `j`, with the bound
`β + v_ℓ(h_{U(1)})·log ℓ`; the class number is the price of passing from the complement of the line to the kernel of
the descent.

*Needs:* 1.3, 2.2, 2.7, 2.8, 6.9; ThetaLiftChainsAndTheSeesawIdentity §2.18 (the descent pairs of the lifts
`W_j → V_j`), §2.7 (good forms), §2.16 (lifted Hecke polynomials), §2.10 (trivial stabilisers at levels inside the
chosen level); SecondMomentsOfPoincareSeries §2.3 (equality of multiplicities of eigensystems in the good forms);
DeterminantsOfThetaLiftChains §2.1 (the lifts `W_j → V_j` and the Hecke polynomials of a lifted eigenform), §1.1 (main
pairs), §1.3 (regular families of twists); NormsOfThetaLiftsAndExchangeIdentities (test forms, false lifts and the
denominator predicate; the lift of a character of `U(1)`, its lifted form and its descent; the central translations
and the classes of `U(1)`).

[ShortProof], `New/Congruences/FitTwistsExist` (`New.Selmer.isRepOfType_one`, `New.Selmer.exists_isMainSummand_mainPair`, `New.Selmer.range_goodLift_le_span_hasLiftHeckePolynomial`, `New.Selmer.denominatorLe_range_goodLift`, `New.Selmer.denominatorLe_span_trivialLift`, `New.Selmer.DenominatorLe.clearsProjection`); for (e), `New/OneLift/HeckeValues/CentralAction` (`New.Selmer.DenominatorLe.norm_card_mul_inner_starProjection_le`, `New.Selmer.DenominatorLe.norm_inner_starProjection_le`, `New.LValueData.isOrthogonalToFalseLifts_sum_normalizedCentralOp_inv`)

### 7.3 All data have regular families of `m`-fold twists

*Origin:* particular to this proof: the twists of the lower bound, one for each prime `ℓ` and each `ι : ℂ ≃ ℚ̄_ℓ`, whose
first `m` powers have few congruences; for them the denominators of the projections to the lifts and the inverse
ratios of `L`-values of the ramified pairs sum over all primes to totals that the heights afford, without any
hypothesis on the groups of even classes.

*Method of the formal proof:* the eigensystems of the good forms on `W_m` are finitely many, so finitely many main
summands occur (2.8 (d), 7.2 (a)); the twisting theorem gives one `m`-fold twist for all of them; 7.2 (c) bounds the
denominators of each power, for the space of lifts and for the line of each main pair; 7.2 (d) turns the first into
the clearing operator and 7.2 (e) the second into the bound for the pairing of test forms, which costs
`v_ℓ(h_{U(1)})·log ℓ`; the sums over the primes are 7.1.

(a) For every prime `ℓ` and `ι : ℂ ≃ ℚ̄_ℓ` there is an `m`-fold twist `τ` with modulus of norm prime to `ℓ` such that, for
`1 ≤ j ≤ m`, every ramified pair `p` and `s = ±1`, `|ι(ratio_p(τ^j, s))⁻¹| ≤ ℓ^{e′_ℓ}`, and the denominators for `τ^j` and
`j` (both clauses: the clearing operator for the lifts, by 7.2 (c), (d), and the pairing of test forms for the main
pairs, by 7.2 (c), (e); DeterminantsOfThetaLiftChains §1.3 (b) (regular families of twists)) are at most
`β_ℓ log ℓ + v_ℓ(h_{U(1)}) log ℓ`.
(b) For all admissible data `D` there is a family `θ_ι` of `m`-fold twists, one for each prime `ℓ` and each
`ι : ℂ ≃ ℚ̄_ℓ`, that is regular in the sense of DeterminantsOfThetaLiftChains §1.3 (regular families of twists): the modulus of
`θ_ι` is prime to `ℓ`; for every ramified pair, `1 ≤ j ≤ m` and `s = ±1`, the family `ι ↦ ratio_p(θ_ι^j, s)⁻¹` has height at
most `x₁`; and for each `j` there are `γ_ℓ` with `Σ_{ℓ∈T} γ_ℓ ≤ B_den` for every finite set `T` of primes such that the
denominators for `θ_ι^j` and `j` are at most `γ_ℓ` at every `ι` over `ℓ`.

*Needs:* 2.8, 7.1, 7.2; SelmerBoundsForAnticyclotomicTwists §5.4 (the twisting theorem for finitely many main summands);
DeterminantsOfThetaLiftChains §1.3 (regular families of twists), §1.1 (ramified pairs and ratios of `L`-values);
OneSidedPrimeSumBoundsAndAdmissibleData §1.2 (heights of families over the pairs `ι`), §3.2 (admissible data and the
scale `x₁`), §3.4 (`m`-fold twists).

[ShortProof], `New/Congruences/FitTwistsExist` (`New.Selmer.exists_mFoldTwist_hasDenominatorsLe`, `New.exists_isRegularFamily`)
