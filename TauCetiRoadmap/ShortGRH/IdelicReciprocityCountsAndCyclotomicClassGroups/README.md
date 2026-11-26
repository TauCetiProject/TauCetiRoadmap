# Roadmap: idelic reciprocity, cocycle counts and cyclotomic class groups

**Summary.** The Riemann hypothesis for Dirichlet `L`-functions follows from a one-sided bound for a sum over primes,
which gives a zero-free half-plane. That bound comes from comparing an upper and a lower bound for the covolume of a
lattice of theta lifts. The lower bound needs, prime by prime, twists of the lifts by characters of `U(1)` of a CM
field whose Galois representations have small Selmer groups; the upper bound and the norms of the lifts need Hecke
characters of the CM field, their values and their `L`-functions. This background roadmap states the arithmetic of
number fields that these steps use and that the class field theory already in the library does not give in the form
needed: the link between places of one fixed algebraic closure of `ℚ` and completions, the local and global Artin maps
read at that closure, counts of Galois cocycles that replace local and global duality and the formula of Greenberg and
Wiles, Grunwald's theorem with an extra clause on units, Hecke characters of CM fields and the non-vanishing of their
`L`-functions on the real half-line `s ≥ 1`, the `ℓ`-adic characters attached to algebraic Hecke characters, and two
cyclotomic inputs: a nonzero integer of explicit size in all twisted Stickelberger ideals, and a uniform bound for the
odd classes of a CM field inside a cyclotomic field at every prime.

The headline theorems are these. (1) *Cocycle counts* (4.4, 4.5): over a totally complex field, a finite Galois module
killed by `ℓ^r` on which some element central modulo an open normal subgroup `U`, with trivial `ℓ`-adic cyclotomic
character, acts without nonzero fixed vectors has at most `#M^{#ι+1}` cocycles trivialised at the places above a level
and at infinity, for `ι` a family of auxiliary primes split for `U`; consequently the module of *relations* (functions
on `U` with the properties of restrictions of dual cocycles) satisfies
`#Z(∅)·#M^{#S+r_∞} ≤ #relations·#M·∏_{v∈S} #A_v` (`r_∞` the number of infinite places). No local duality and no dual Selmer group occur. (2) *Grunwald in
prime exponent* (6.1): over a totally complex field a character of the finite ideles killed by a prime `p` is the
restriction through the Artin map of a Galois character killed by `p` at finitely many prescribed places, and also on
the units at every place whose norm is not prime. (3) *Hecke `L`-functions at `s = 1`* (8.4): for a nontrivial Hecke
character with integral angular exponents, the partial Euler product, as a function of real `s > 1`, agrees near `1`
with a function analytic at `1`, its values at the primes of degree one have mean `−m`, `m ∈ ℕ`, and it has no zero on
`[1, ∞)` if `ψ² ≠ 1`. (4) *The `ℓ`-adic avatar* (9.1): over a totally complex field, the `ℓ`-adic character of an
algebraic Hecke character, given on Artin symbols by the character and its infinity type, and compatible with
restriction to CM extensions; its local behaviour at every finite place, those above `ℓ` included, is stated for CM
fields containing a primitive `5040`-th root of unity in GaloisRepresentationsOfUnitaryEigenforms §6.4 (e). (5) *Odd
classes* (10.7): for a CM field `E ⊂ ℚ(μ_N)` and `t ≥ 0` there is an integer `0 < X ≤ 2^{4(N+t+3)^{27}}·h_E` whose
valuation bounds, at every prime `ℓ` (`2` included), the length of the module of odd cocycles of `G_E` in `O/ℓ^ν(−e)`
unramified outside `ℓ` and trivial on the elements of the decomposition groups above `ℓ` with trivial cyclotomic
character, for all `e < t` and all `ν`.

The roadmap is used by the roadmaps of the lower bound: CongruencesOfTwistedThetaLifts (odd classes, relations modulo
`ℓ`, Selmer modules, avatars) and SelmerBoundsForAnticyclotomicTwists (relations, Selmer cocycles, crystalline local
duality, Galois characters coming from `U(1)`); by OneSidedPrimeSumBoundsAndAdmissibleData,
ThetaLiftChainsAndTheSeesawIdentity, DivisibilityOfThetaDerivatives and DeterminantsOfThetaLiftChains (characters of
`U(1)`, splitting characters, values of algebraic Hecke characters, `L`-functions of base changes); by
RemainingAndMainTermsOfSecondMoments (Euler products); and by the background roadmaps
GaloisRepresentationsOfUnitaryEigenforms (avatars, steps of prime degree), CrystallineRepresentationsAndKisinModules
and PadicComparisonForFunctorCohomology (places of the algebraic closure, Galois descent), WeilRepresentationsOnBanachSpacesOfData and
SiegelWeilAndRallisFormulasOnUnitaryGroups (characters of `U(1)` on determinants, Tate integrals).

Layer 1 sets up places of the fixed algebraic closure `Ω` as valuation subrings and identifies decomposition groups
with absolute Galois groups of completions. Layer 2 reads the library's local and global class field theory at `Ω`:
the local Artin map at a place of `Ω`, the global Artin map on finite ideles, norm groups, the existence theorem for
totally complex fields. Layer 3 treats cocycles with local conditions at tamely ramified places. Layer 4 counts
cocycles at split primes, in place of duality. Layer 5 is local duality for crystalline cocycles, as an inequality.
Layer 6 is Grunwald's theorem in prime exponent and the CM extensions of prime degree built from it. Layer 7 treats
characters of `U(1)` of a CM field, splitting characters and values of algebraic Hecke characters. Layer 8 treats Hecke
`L`-functions for real `s ≥ 1`. Layer 9 treats `ℓ`-adic avatars. Layer 10 contains the cyclotomic inputs.

## Conventions and notation

Notation not restated here is that of OneSidedPrimeSumBoundsAndAdmissibleData, whose letters follow the reading guide
of the shorter formal proof. That roadmap's fields (`K = ℚ(√−d)`, the CM field of the data) do not occur here: in this
roadmap every statement is for general number fields.

**Fields and Galois groups.** `Ω` is one fixed algebraic closure of `ℚ`; every number field `K` is a subfield of `Ω`
and `G_K = Gal(Ω/K)`, a profinite group. Several statements are made for a profinite group `Γ` that acts on `Ω` with
open stabilisers as the Galois group of `Ω/K`; both `G_K` and each closed subgroup of `G_K`, over the fixed field of
that subgroup, are of this kind. A *character* of `Γ` is a continuous homomorphism `χ : Γ → ℚ/ℤ` (`ℚ/ℤ` discrete); it
factors through the topological abelianisation `Γ^ab = Γ/[Γ,Γ]⁻`. `c` is a fixed complex conjugation of `Ω` (an automorphism acting as
complex conjugation under some embedding `Ω → ℂ`). For a CM field `E`, `E⁺` is its maximal totally real subfield,
`x ↦ x̄` the conjugation (on `E`, its adeles and its places), `Φ` a CM type, given as one embedding `Φ_w : E → ℂ` for
each infinite place `w`, and `g ↦ g^c = cgc` the conjugation of `G_E`. `χ_N : Γ → (ℤ/N)^×` and `χ_ℓ : Γ → ℤ_ℓ^×` are the
cyclotomic characters (action on `μ_N`, on `μ_{ℓ^∞}`). A Dirichlet character `ψ` modulo `N` is read as the character
`g ↦ ψ(χ_N(g))` of `G_ℚ`, so that `ψ(Frob_p) = ψ(p)` for arithmetic Frobenius elements.

**Places and ideles.** A finite place `v` of `K` is a nonzero prime of `𝒪_K`; `q_v` is its norm, `K_v` the completion,
`𝒪_v` its integers and `ϖ_v` a uniformiser chosen once for each `v`. `𝔸_{K,f}` is the ring of finite adeles, `Ô_K` the
integral finite adeles, and the *finite ideles* are `𝔸_{K,f}^×`; `x_v` is the component of a finite idele at `v`,
`ι_v(y)` the finite idele with component `y ∈ K_v^×` at `v` and `1` elsewhere, and `K^×` is embedded diagonally (the
*principal ideles*). For a set `S` of finite places, `U^S` is the group of finite ideles that are units at every place
outside `S`. `x ∈ K` is *totally positive* if `σ(x) > 0` for every embedding `σ : K → ℝ`. For a totally complex field
`K`, `𝔸_K = ℂ^{infinite places} × 𝔸_{K,f}` (one copy of `ℂ` for each infinite place, read through the chosen
embedding), and a *unitary Hecke character* is a continuous character `𝔸_K^×/K^× → S¹`.

**Coefficients.** For a prime `ℓ`, `O` is the ring of integers of a finite extension of `ℚ_ℓ` (a discrete valuation
ring, free of finite rank over `ℤ_ℓ`), `v_O` its additive valuation with `v_O(ϖ_O) = 1` for a uniformiser `ϖ_O`, and
lengths are `O`-lengths, not divided by the ramification index. `O(e)`, `(O/ℓ^ν)(e)` carry the action of `χ_ℓ^e`.

**Labels of the formal proof.** Under each heading, `*Origin:*` says where the statement comes from and
`*Method of the formal proof:*` how the shorter formal proof proves it; `[ShortProof]` names the file (under `src/`)
and declarations where it does. Where the library already has a result or a theory that a section transfers, the
section says which declaration to build on. Sections cite the other roadmaps of this family by name, with the result
in words where a section number is not fixed.

### Table of symbols

| Symbol | Meaning | Defined |
|---|---|---|
| `Ω, G_K, Γ` | fixed algebraic closure of `ℚ`, `Gal(Ω/K)`, profinite group acting as `Gal(Ω/K)` | Conventions, 1.1 |
| `A, D_A, I_A` | place of `Ω` (valuation subring), its decomposition and inertia groups | 1.1 |
| `I_S` | union of the inertia groups `I_A` of the places `A` above primes in a set `S` | 1.1 |
| Frobenius for `q` at `A` | `σ ∈ D_A` with `σx ≡ x^q` modulo the maximal ideal of `A` | 1.1 |
| `k_A` | fixed field of `D_A` in `Ω` (a henselian local field) | 1.3 |
| `v, q_v, K_v, 𝒪_v, ϖ_v` | finite place, norm, completion, integers, chosen uniformiser | Conventions |
| `𝔸_{K,f}^×, Ô_K, ι_v, U^S` | finite ideles, integral finite adeles, idele with one component, ideles that are units off `S` | Conventions |
| `E, E⁺, Φ, x̄, g^c` | CM field, real subfield, CM type, conjugation, `cgc` | Conventions |
| `χ_N, χ_ℓ` | cyclotomic characters modulo `N` and `ℓ`-adic | Conventions |
| `Art_A` | local Artin map `K_v^× → D_A^ab` at a place `A` above `v` (uniformisers to geometric Frobenius) | 2.1 |
| `Art_K` | global Artin map on finite ideles `𝔸_{K,f}^× → G_K^ab` | 2.2 |
| `Z(P), A_v` | Selmer cocycles allowed to ramify at `P`, allowed local cocycles | 3.1, 4.5 |
| `γ_A` | a tame generator of inertia at `A` | 1.4 |
| split places, `FrobeniiDetectRoots` | auxiliary primes split for `U`, with Frobenius elements in `U` | 4.1 |
| `Triv(V)` | cocycles trivialised above a level and at infinity | 4.1 |
| `U(1)(𝔸_E), [U(1)]` | norm-one adeles `u ū = 1` of a CM field, and their quotient by the rational points | 7.1 |
| `μ` of weight `e`, tame part `ψ` | character of `U(1)(𝔸_E)` with `μ(u) = ∏ u_w^{e(w)}·∏ ψ_v(u mod v)` on integral `u` | 7.1 |
| `υ` | splitting character of a CM field | 7.2 |
| `(θ, n)` | algebraic Hecke character: finite-idele character and infinity type | 7.5 |
| `L^S(s, ψ)`, `ψ(ϖ_v)` | partial Euler product of real `s > 1` | 8.1 |
| `r_θ` | `ℓ`-adic avatar of `(θ, n)` | 9.1 |
| `Sha_e(O, ν)`, `C(ℓ, e, ψ, ν)` | odd classes of a CM field, odd component over `ℚ` | 10.1 |
| Stickelberger property of `X` | divisibility at every prime and congruence with twisted Stickelberger sums | 10.1 |

## Layer 1: Places of the algebraic closure and their completions

The shorter proof works inside one algebraic closure `Ω` of `ℚ`, with places of `Ω` given as valuation subrings and
decomposition groups as stabilisers. The library's local theory is stated for completions and their absolute Galois
groups. This layer sets up the vocabulary (1.1), the places above a prime (1.2), the identification of decomposition
groups with absolute Galois groups of completions, which is the bridge to the library (1.3), the local facts used at
a place of `Ω` (1.4), and the finite ideles (1.5).

### 1.1 Places of `Ω`, decomposition and inertia groups, Frobenius elements

*Origin:* definitions and conventions.

*Method of the formal proof:* definitions. The Galois correspondence of (5) is transferred from Mathlib's infinite
Galois theory (`InfiniteGalois`) along the map `Γ → Gal(Ω/K)`, which is continuous by the compatibility clause of (5)
and onto because its image is a closed subgroup with fixed field `K`.

Let `Γ` act on `Ω` as the Galois group of `Ω/K`, with open stabilisers.

1. A *place* of `Ω` is a valuation subring `A` of `Ω`, with maximal ideal `𝔪_A`. `A` *lies over* the finite place `v`
   of `K` if `𝒪_K ∩ 𝔪_A = v`.
2. The *decomposition group* `D_A ⊂ Γ` is the stabiliser of `A`. For `q ≥ 1`, `σ ∈ Γ` is a *Frobenius for `q` at `A`*
   if `σ ∈ D_A` and `σ(x) − x^q ∈ 𝔪_A` for every `x ∈ A`; an *arithmetic Frobenius* at `A` over `v` is a Frobenius for
   `q_v`. The *inertia group* `I_A` is the set of Frobenius elements for `q = 1`; it is a closed normal subgroup of
   `D_A`. For a set `S` of finite places of `K`, `I_S` is the union of the `I_A` over the places `A` above the places of
   `S`.
3. The calculus of Frobenius elements: if `σ` is a Frobenius for `q` at `A`, then `gσg⁻¹` is one at `gA`; `στ` is a
   Frobenius for `qq′` if and only if `τ` is one for `q′`; two Frobenius elements for the same `q` differ by inertia.
   Frobenius elements are carried along equivariant ring maps `Ω → Ω′` to Frobenius elements at the pulled-back place.
4. A *henselian local field datum* `(k, A)`: `Ω` is algebraically closed of characteristic `0`, `Γ = Gal(Ω/k)` fixes
   the place `A`, and `A ∩ k` is a discrete valuation ring with finite residue field (of order `q`); `k` need not be
   complete.
5. The facts of infinite Galois theory used, for such `Γ`: the fixed field of a closed subgroup `H` is a field over
   which `H` acts as the Galois group, the correspondence between intermediate fields and closed subgroups is
   bijective with `[L : K] = [Γ : H]` for open `H`, a map of such groups compatible with a ring map of the top fields is
   continuous, and restriction to a subgroup fixing a subfield is a closed embedding (an open one for subgroups of
   finite index), with image the fixer of that subfield.

ArithmeticGaloisRepresentations §2.1 defines, for `Γ = G_K` with `K` a number field (read in `Gal(Ω/K)` through a
`K`-isomorphism of the algebraic closure used there with `Ω`), the decomposition and inertia groups and the arithmetic
Frobenius elements at a maximal ideal `Q` of the integral closure of `𝒪_K`; its valuation-subring bridge identifies them
with the stabiliser of the valuation subring `A_Q`, its inertia group and the Frobenius elements for `q_v` at `A_Q` of
item 2, and it states `D_{σQ} = σD_Qσ⁻¹` and that the arithmetic Frobenius elements form one coset of inertia. Items
1–3 are wider: every valuation subring of `Ω` is a place (those above `v` are the `A_Q`, 1.2), `Γ` may be a closed
subgroup of `G_K` such as `D_A` over its fixed field, and Frobenius elements are taken for every `q` (as in 1.4 and
2.1 (b)); of the multiplicativity in `q` and the transport along equivariant maps of item 3 it states only cases:
the `f`-th power relative to an intermediate field, restriction to a finite Galois layer, and the local embedding.

*Needs:* Mathlib `InfiniteGalois.fixedField_fixingSubgroup`, `InfiniteGalois.fixingSubgroup_fixedField` (infinite Galois
correspondence), `ValuationSubring`.

[ShortProof], `Lib/ClassField/Places/GaloisDefs` (`New.IsProGalois`, `New.IsLocalGalois`, `New.decompGroup`,
`New.inertiaGroup`, `New.IsFrob`, `New.IsPlaceOver`, `New.IsFrob.conj`, `New.IsFrob.mul_iff`,
`New.IsFrob.inv_mul_mem_inertiaGroup`, `New.IsFrob.map`, `New.cyclotomicChar`);
`Lib/ClassField/Places/ProfiniteGalois` (`New.fixedFieldOf_fixingSubgroup`, `New.fixingSubgroup_fixedFieldOf`,
`New.finrank_fixedFieldOf`, `New.continuous_of_equivariant_emb`, `New.isClosedEmbedding_galois_restrict`,
`New.isOpenEmbedding_galois_restrict`); `Lib/ClassField/Places/DecompositionCyclotomic` (`New.isClosed_inertiaGroup`);
`Lib/ClassField/Local/ArtinMap` (`New.inertiaAbove`)

### 1.2 Places above a prime and embeddings into `p`-adic fields

*Origin:* adapted from the theory of the decomposition of primes in Galois extensions of number fields (Neukirch
(1999); Serre (1979); Stacks Project, tag 09EE): here for valuation subrings of one fixed algebraic closure, with the
extension of embeddings to finite adeles.

*Method of the formal proof:* a valuation subring dominating the local ring at `v` lies over `v`; transitivity is the
usual argument with the integral closure of `𝒪_K` in `Ω`; almost all primes are unramified in the finite extension
cut out by an open subgroup; an embedding of `E` into a `p`-adic normed field is uniformly continuous for the induced
prime and extends to the completion, which is finite over `ℚ_p`.

Let `K` be a number field and `Γ = G_K` (or a group as in 1.1).

(a) Every finite place `v` has a place of `Ω` above it. A place lies over at most one `v`, and then `A ∩ K` is the
valuation ring of `v`: for `x ∈ K`, `x` is a unit at `A` if and only if `v(x) = 0`, and `π ∈ K` is a uniformiser of
`A ∩ K` if and only if it is one at `v`. A place whose valuation is nontrivial on `Ω^×` lies over some `v`.

(b) If `A` lies over `v`, so does `gA` for every `g ∈ Γ`, and `Γ` acts transitively on the places above `v`.

(c) For every open subgroup `U ⊂ Γ`, for all but finitely many `v`, every inertia group `I_A` with `A` above `v` lies in
`U`.

(d) For a number field `L ⊃ K` in `Ω`, a place `A` above `v` lies over a prime `u` of `L` with `u ∩ 𝒪_K = v`. For
`L/K` Galois and a prime `u` of `L` above `v`: `#{u′ above v}·e(u/v)·f(u/v) = [L : K]`.

(e) Let `p` be a prime, `F` a field with an ultrametric norm that makes it a normed algebra over `ℚ_p` (not
necessarily complete), and `σ : E → F` an embedding of a number field. The integers `x` with `‖σ(x)‖ < 1` form a
prime `v_σ` of `E` containing `p`, the valuation of `σ` is equivalent to that of `v_σ`, and `σ` extends to a continuous
ring homomorphism `σ_v : E_{v_σ} → ℚ_p(σE) ⊂ F` with `‖σ_v(x)‖ ≤ ‖σ_v(y)‖` if and only if `v(x) ≤ v(y)`. The composite
`σ_𝔸 : 𝔸_{E,f} → F` with the projection to the component at `v_σ` is a continuous ring homomorphism extending `σ`;
`‖σ_𝔸(x)‖ ≤ 1` for `x ∈ Ô_E`, and `‖σ_𝔸(x)‖ = ‖σ_𝔸(y)‖` if and only if `x` and `y` have equal valuations at `v_σ`. For a
CM field, `v_{σ∘conj} = v̄_σ` and `σ_𝔸` is compatible with conjugation.

ArithmeticGaloisRepresentations §2.1 states the existence in (a) and the transitivity in (b) for the places `A_Q` of its
valuation-subring bridge, `Q` a maximal ideal above `v` of the integral closure `O` of `𝒪_K` in `Ω`. Every place `A`
above `v` is of this form: `A` contains `O` and dominates its localisation at `Q = 𝔪_A ∩ O`, which is the valuation ring
`A_Q`, so `A = A_Q`. The other clauses of (a) are not stated there. (c) is the finiteness of the ramification set of a
representation with open kernel (ArithmeticGaloisRepresentations §2.2), applied to a faithful representation of `Γ/N`
for an open normal subgroup `N ⊂ U`.

*Needs:* 1.1; ArithmeticGaloisRepresentations §§2.1, 2.2 (existence and transitivity of the maximal ideals above `v`,
the valuation-subring bridge; finite ramification sets); Mathlib `Ideal.ramificationIdx`, `Ideal.inertiaDeg`,
`Ideal.ncard_primesOver_mul_ramificationIdxIn_mul_inertiaDegIn` (the formula `#{u}·e·f = [L : K]`).

[ShortProof], `Lib/ClassField/Places/ValuationSubrings` (`New.FinPlace.isPlaceOver_placeOver`,
`New.IsPlaceOver.isEquiv`, `New.IsPlaceOver.unique`, `New.exists_isPlaceOver_of_val_ne_one`, `New.IsPlaceOver.smul`,
`New.IsPlaceOver.exists_smul`, `New.finite_ramified`, `New.IsPlaceOver.exists_above`,
`New.FinPlace.ncard_mul_ramificationIdx_mul_inertiaDeg`, `New.placeOfEmb`, `New.exists_placeOfEmb_extension`,
`New.adeleExtension`, `New.norm_adeleExtension_le_one`, `New.norm_adeleExtension_eq_iff`, `New.adeleExtension_star`)

### 1.3 Decomposition groups as absolute Galois groups of completions

*Origin:* adapted from the theory of decomposition groups and completions (Neukirch (1999); Serre (1979); Stacks
Project, tag 09EE): here for the infinite extension `Ω/K`, with the decomposition group of a valuation subring of `Ω`
identified with `Gal(ℚ̄_p/K_v)` through an embedding `Ω → ℚ̄_p`.

*Method of the formal proof:* every place above `p` is the pull-back of the integers of `ℚ̄_p` along some embedding,
because all such places are conjugate (1.2 (b)); restriction along the embedding maps the open subgroup of
`Gal(ℚ̄_p/ℚ_p)` fixing the image of `K` isomorphically onto the decomposition group; an element fixing `K` and
preserving the valuation fixes the closure of `K` by continuity, so the fixed field of the image is the image of `K_v`.

Let `K` be a number field, `A` a place of `Ω` above the finite place `v` of `K`, and `p` the prime below `v`.

(a) There is an embedding `e : Ω → ℚ̄_p` with `A = e^{−1}(𝒪_{ℚ̄_p})`; it restricts on `K` to an embedding inducing `v`
and extends (1.2 (e)) to a continuous embedding `K_v → ℚ̄_p` under which the integers of `ℚ̄_p` meet `K_v` in `𝒪_v`.

(b) For every such `e`, there is a homomorphism `j : D_A → Gal(ℚ̄_p/ℚ_p)` with `j(g)(e(x)) = e(g x)` for `x ∈ Ω`;
it is an open embedding of topological groups with image `Gal(ℚ̄_p/K_v)` (the automorphisms fixing `e(K)`, equivalently
`e(K_v)`). So `D_A` acts on `ℚ̄_p` as the absolute Galois group of `K_v`, compatibly with `e`.

(c) Consequently the fixed field `k_A` of `D_A` in `Ω` is a henselian local field datum (1.1) with residue field of
order `q_v`; uniformisers of `K` at `v` remain uniformisers of `k_A`; an arithmetic Frobenius at `A` exists; and there
is an additive order `ord_A : Ω^× → ℚ`, normalised by `ord_A(ϖ) = 1` for uniformisers `ϖ` of `K` at `v`, that is the
`v`-adic order on `K^×` and satisfies `ord_{gA}(g x) = ord_A(x)`.

(d) For an open subgroup `U ⊂ G_K` with fixed field `L` and the prime `u` of `L` below `A`:
`[D_A : D_A ∩ U] = e(u/v)·f(u/v)`; `e(u/v) = 1` if `I_A ⊂ U`; if `D_A ⊂ U` then `q_u = q_v`; and `D_A ⊂ U` as soon as `U`
contains `I_A` and an arithmetic Frobenius at `A`.

The library has the finite-level identification of decomposition groups with local Galois groups
(`IsDedekindDomain.HeightOneSpectrum.decompositionEquiv`) and the maps `G_{K_v} → G_K`; (b) is the absolute form, which
is the transfer through which the library's local theory applies at places of `Ω` in 1.4 and 2.1.
ArithmeticGaloisRepresentations §2.1 states (b) read backwards, as a target ("The local embedding"): for an embedding
`ι` of algebraic closures over `K → K_v`, `τ ↦ ι⁻¹τι` is a closed embedding of `G_{K_v}` onto the decomposition group of
the prime cut out by `ι`, carrying inertia and arithmetic Frobenius lifts to those at that prime. For `ι = e` that prime
gives the place `A` (1.2), and `j` is the inverse map, open in `Gal(ℚ̄_p/ℚ_p)` as `K_v/ℚ_p` is finite. That section
also gives, in (c), the henselian valuation of `k_A` (its valuation ring is the henselisation of the local ring of `𝒪_K`
at `v`) and the existence of an arithmetic Frobenius; (a), `ord_A` and (d) are not stated there.

*Needs:* 1.1, 1.2; ArithmeticGaloisRepresentations §2.1 (the local embedding `G_{K_v} → G_K` onto a decomposition group;
the henselian valuation of the decomposition field).

[ShortProof], `Lib/ClassField/Places/DecompositionCompletion` (`New.exists_comap_intQpBar_eq`,
`New.exists_inducesPlace`, `New.GaloisRep.InducesPlace`, `New.IsCompletionEmb`, `New.IsPlaceOver.exists_isCompletionEmb`,
`New.Period.isLocalGalois_of_isOpenEmbedding`, `New.IsPlaceOver.isLocalGalois_and_residueCard_eq_and_isUniformiser`,
`New.IsPlaceOver.exists_isFrob`, `New.IsPlaceOver.ordRat_ofBase`, `New.IsPlaceOver.ramification_in_tower`,
`New.IsPlaceOver.decompGroup_le`)

### 1.4 Frobenius, inertia, roots of unity and tame inertia at a place of `Ω`

*Origin:* adapted from the theory of Frobenius elements and tame ramification of local fields (Neukirch (1999); Serre
(1979); Stacks Project, tag 09EE): here for henselian local fields inside `Ω` and at places of `Ω` above primes of a
number field.

*Method of the formal proof:* (a) lifts a Frobenius of the residue field of `Ω`, which is an algebraic closure of the
finite residue field. (b) compares `σ(ζ)` with `ζ^{q′}` modulo `𝔪_A`, reduction modulo `𝔪_A` being injective on the
roots of unity whose order is a unit at `A`; its last clause uses that `ℚ_p(μ_{p^∞})/ℚ_p` is totally ramified. (c) rests
on the transitivity of inertia on the roots of an Eisenstein polynomial, applied to `X^n − π`. (d) is (c) for the
henselian field `k_A` of 1.3 (c), in which uniformisers of `K` at `w` stay uniformisers.

Let `(k, A)` be a henselian local field datum with residue field of order `q` (1.1).

(a) There is an arithmetic Frobenius `φ`; for every such `φ` the products `φ^n i` (`n ≥ 0`, `i ∈ I_A`) are dense in
`Γ`; `A` is integral over `A ∩ k`. A finite extension `k′ ⊂ Ω` of `k` is again a henselian local field datum, with
ramification index `e` and residue degree `f` satisfying `ef = [k′ : k]`, and `e = 1` if `Gal(Ω/k′)` contains `I_A`.
For every `r ∈ ℚ/ℤ` there is exactly one character of `Γ` trivial on `I_A` with value `r` at `φ`.

(b) For `N` prime to the residue characteristic and a Frobenius `σ` for `q′` at `A`: `σ(ζ) = ζ^{q′}` for every `ζ ∈ μ_N`,
so `χ_N(σ) = q′ mod N` and `χ_ℓ(σ) = q′` for `ℓ` prime to the residue characteristic; inertia fixes these roots of
unity. Over `ℚ_p`, every integer prime to `p` is a value of `χ_p` on the inertia group of `Gal(ℚ̄_p/ℚ_p)`.

(c) *Tame inertia.* Let `π` be a uniformiser of `k`, `n` prime to the residue characteristic and `y ∈ Ω` with `y^n = π`.
Let `f : I_A → P` be a homomorphism to a monoid with open kernel and `f(g)^n = 1` for all `g`. Then `f` is trivial on
the stabiliser of `y` in `I_A`; if `s(y)/y` is a primitive `n`-th root of unity for some `s ∈ I_A`, every value of `f`
is a power of `f(s)`; and for a Frobenius `φ` for `q′` at `A`, `f(φsφ⁻¹) = f(s)^{q′}`.

(d) *At a place of `Ω`.* Let `A` lie over the finite place `w` of a number field `K`. There is `γ_A ∈ I_A ⊂ G_K` (a
*tame generator*) such that for every `n` prime to the residue characteristic there are a uniformiser `π ∈ K` at `w`
and `y` with `y^n = π` and `γ_A(y)/y` a primitive `n`-th root of unity; for every `m ≥ 1` some `γ ∈ I_A` has
`γ(y)/y = ζ_m` for a fixed primitive `m`-th root of unity `ζ_m`, some uniformiser `π ∈ K` and some `y` with `y^m = π`. For every homomorphism `f : G_K → P`
trivial on the elements of `I_A` near `1` and with `f(g)^n = 1` on `I_A`, `n` prime to `w`: every `f(s)`, `s ∈ I_A`, is
a power of `f(γ_A)`, and `f(φsφ⁻¹) = f(s)^{q′}` for every Frobenius `φ` for `q′` at `A`.

The library has (a)–(c) for complete nonarchimedean local fields and their absolute Galois groups
(`TauCeti.inertiaSubgroup`, `TauCeti.exists_isArithFrobeniusLift`, `TauCeti.maximalUnramifiedGaloisGroupEquivZHat`,
the tame quotient in `TauCeti/NumberTheory/LocalField/Tame/Quotient.lean`); at places of `Ω` they follow through 1.3.
ArithmeticGaloisRepresentations §2.1a transports the `ℓ`-adic tame character of `K_w`, for `ℓ` different from the
residue characteristic, to the inertia group of a place of `Ω` along the local embedding of its §2.1, with its law under
conjugation by Frobenius; (d) needs in addition one `γ_A` that generates the tame quotient modulo every `n` prime to the
residue characteristic, and the factorisation of the maps `f` through it, which are not stated there.

*Needs:* 1.1, 1.2, 1.3; ArithmeticGaloisRepresentations §2.1a (the tame character transported to inertia at a place,
for (d)).

[ShortProof], `Lib/ClassField/Places/LocalFields` (`New.IsLocalGalois.frobenius_spec`, `New.IsLocalGalois.of_finite`,
`New.existsUnique_unramified_char`); `Lib/ClassField/Places/DecompositionCyclotomic`
(`New.IsFrob.cyclotomicCharMod_eq`, `New.IsFrob.cyclotomicChar_eq`, `New.cyclotomicChar_eq_one_of_mem_inertiaGroup`,
`New.cyclotomicCharMod_surjective`); `Lib/ClassField/Places/TameInertia` (`New.IsLocalGalois.tame_inertia`,
`New.IsLocalGalois.exists_inertia_smul_eq_of_pow_eq`, `New.Selmer.apply_eq_pow_of_isFrob`,
`New.Selmer.exists_inertia_cyclotomicGp_eq`, `New.Period.IsWeilPair.eq_pow_of_isFrob`); `Lib/ClassField/Local/ArtinMap`
(`New.IsPlaceOver.exists_tameGenerator`, `New.IsPlaceOver.tame_inertia`); `Lib/ClassField/GreenbergWiles/SelmerLevels`
(`New.exists_isTameGeneratorFor`)

### 1.5 Finite ideles and the class group

*Origin:* adapted from the theory of ideles and the ideal class group (Neukirch (1999); Serre (1979); Stacks Project,
tag 09EE): here for finite ideles only, with total positivity in place of the archimedean components.

*Method of the formal proof:* the divisor map from the finite ideles to fractional ideals; its composite with the map
to the class group has kernel generated by the principal ideles and the integral unit ideles; finiteness of the class
group and of the sign group at the real places.

Let `K` be a number field.

(a) There is a homomorphism `d` from the finite ideles to the nonzero fractional ideals of `K` with: `x` integral at `w`
if and only if the exponent of `w` in `d(x)` is `≥ 0`; kernel `U^∅` (the ideles that are units everywhere); `d(ι_w(ϖ_w)) =
w`; `d(x) = (x)` for `x ∈ K^×`. The composite with the class group has kernel `K^×·U^∅`, and `a^{h_K} ∈ K^×·U^∅` for
every finite idele `a`.

(b) For finite sets `R`, `R′` of finite places there is a finite set `T ⊃ R` meeting `R′` only inside `R` with
`K^×·U^T = 𝔸_{K,f}^×`.

(c) An open subgroup of the finite ideles that contains the totally positive principal ideles has finite index; `U^S`
is open, and compact for `S = ∅`; a character of the finite ideles with open kernel is trivial on the unit ideles at
almost every place.

The library has ideles of number fields, ray subgroups and finiteness statements under
`TauCeti/NumberTheory/NumberField/Global/Ideles`, to build on.

*Needs:* 1.1; Mathlib `IsDedekindDomain.FiniteAdeleRing`, `ClassGroup`,
`NumberField.RingOfIntegers.instFintypeClassGroup`, `NumberField.classNumber`.

[ShortProof], `Lib/ClassField/Places/Ideles` (`New.exists_idele_divisor_hom`, `New.exists_idele_classGroup_hom`,
`New.pow_classNumber_mem_principal_sup`, `New.exists_sup_idelesUnitOff_eq_top`,
`New.finiteIndex_idele_subgroup_of_isOpen`, `New.isOpen_idelesUnitOff`, `New.isCompact_idelesUnitOff_empty`,
`New.eventually_unramified`)

## Layer 2: Artin maps at a fixed algebraic closure

The library has local and global class field theory for complete local fields, the full idele class group and the
arithmetic normalisation of the Artin map (ClassFieldTheory C.6: "All local and global Artin maps use arithmetic
Frobenius"). Its local Artin map is absolute, with values in the abelianised absolute Galois group (ClassFieldTheory
§7.1). ClassFieldTheory states the global Artin map at finite layers, `C_K → Gal(L/K)^ab` for a finite Galois extension
`L/K` (§11.1); the pinned library also has their limit `C_K → G_K^ab`, the absolute Artin map of the global class
formation (2.2). Existence is a statement about open subgroups of finite index of `C_K` (ClassFieldTheory §12.1). The
route reads class field theory at places of `Ω`, on finite ideles, in the geometric normalisation (uniformisers go to
inverses of arithmetic Frobenius elements), with one absolute global map into `G_K^ab`. This layer states the form
needed. The statements of 2.1 are those of the library transported by 1.3 and composed with inversion; those of 2.2
and 2.3 follow from the library's theory through the absolute global map restricted to the finite ideles.

### 2.1 The local Artin map at a place of `Ω`

*Origin:* adapted from local class field theory (Serre (1979); Milne (2020)): here at a place `A` of `Ω`, with values
in the abelianised decomposition group of `A`, in the geometric normalisation.

*Method of the formal proof:* the shorter proof builds the invariant `ℚ/ℤ ≅ H²(D_A, Ω^×)` from its own cocycles and
pins the local Artin map down by a cup-product formula with cyclic classes, then reads its properties in `ℚ̄_p` through
1.3. With the library, `Art_A` is the composite of the library's local Artin map of `K_v` with inversion
(`TauCeti.ClassFieldTheory.geometricArtinMap`, ClassFieldTheory §7.1) and the isomorphism of 1.3 (b). Then (a) and
(b) are the transports of `denseRange_artinMap`, `isArithFrobeniusLift_of_mk_eq_artinMap_uniformizer`,
`mem_inertiaSubgroup_of_mk_eq_artinMap` and `map_artinMap_unitFiltration_zero` of ClassFieldTheory §7.1, read after
inversion (a uniformiser goes to the class of the inverse of an arithmetic Frobenius). The first statement of (c) is
the transport of `artinMap_norm`, and its last statement that of the kernel identity of ClassFieldTheory §7.1 (for a
finite abelian extension of local fields and a character `ψ` of its Galois group, `ψ` kills the symbol of `x` exactly
when `x` is a norm from the fixed field of `ker ψ`), applied to the abelian extension `L_u/K_v` that `χ` cuts out
through 1.3 (b) and the injective character of `Gal(L_u/K_v)` induced by `χ`; (d) and (e) are not stated there.

Let `K` be a number field, `A` a place of `Ω` above the finite place `v` of `K`, `D_A ⊂ G_K` its decomposition group
and `D_A^ab` its topological abelianisation. Let `Art_A : K_v^× → D_A^ab` be the local Artin map of `K_v`, transported
by 1.3 (b), normalised so that uniformisers go to the classes of inverses of arithmetic Frobenius elements. Prove:

(a) `Art_A` has dense image, and every homomorphism from `K_v^×` to the topological abelianisation of a profinite
group is continuous. For a uniformiser `x` of `K_v`, `Art_A(x)` is the class of `s⁻¹` for some
arithmetic Frobenius `s` at `A`; for a unit `x`, `Art_A(x)` is the class of an element of `I_A`.

(b) If `g⁻¹` is a Frobenius for `q_v^n` at `A`, `n ≥ 0`, the class of `g` is `Art_A(x)` for some `x` of valuation `n`;
in particular every element of `I_A` is the symbol of a unit, and every inverse of an arithmetic Frobenius the symbol
of a uniformiser.

(c) *Norms.* For a finite extension `L/K` in `Ω`, `A` above the prime `u` of `L` and `v` of `K`: if `Art^L_A(y)` is the
class of `g ∈ D_A ∩ G_L`, then `Art^K_A(N_{L_u/K_v}(y))` is the class of `g`. More generally the same holds along an
endomorphism of `Ω` extending `K → L` and carrying the actions accordingly. If a character `χ` of `D_A ⊂ G_K` has kernel
`D_A ∩ G_L` and `χ(Art^K_A(x)) = 0`, then `x` is a norm from `L_u^×`.

(d) *Independence of the place.* The image of `Art_A(x)` in `G_K^ab` does not depend on the place `A` above `v`; write
`Art_v : K_v^× → G_K^ab` for it. For a character `χ` of `G_K`, `χ(Art_v(x))` is the value of `χ|_{D_A}` at `Art_A(x)`.

(e) *Tame unit.* There is a unit `u ∈ 𝒪_v^×` whose residue generates the multiplicative group of the residue field and
with `Art_A(u)` the class of the tame generator `γ_A` of 1.4 (d).

*Needs:* 1.3, 1.4; ClassFieldTheory §§5.1, 6.1, 7.1 (local invariant, reciprocity, absolute Artin map and the kernel
identity).

[ShortProof], `Lib/ClassField/GaloisCohomology/ContinuousCocycles` (`New.localArtin`); `Lib/ClassField/Local/ArtinMap`
(`New.artinAt`, `New.continuous_hom_locField_units`,
`New.IsNormCompatible`, `New.IsPlaceOver.isLocalArtin_localArtin`, `New.IsPlaceOver.denseRange_localArtin`,
`New.IsPlaceOver.exists_isFrob_localArtin_eq_inv`, `New.IsPlaceOver.exists_mem_inertiaGroup_localArtin_eq`,
`New.IsPlaceOver.exists_localArtin_eq_of_isFrob_pow`, `New.IsPlaceOver.exists_localArtin_eq`,
`New.IsPlaceOver.localArtin_localNorm`, `New.IsPlaceOver.artinAt_eq_of_localArtin_eq`,
`New.IsPlaceOver.abelianLift_artinAt`, `New.IsPlaceOver.IsTameUnit`, `New.IsPlaceOver.exists_isTameUnit`)

### 2.2 The global Artin map on finite ideles

*Origin:* adapted from global class field theory and Artin reciprocity (Milne (2020); Tate (1967); for reciprocity
from the sum formula, Hasse (1933)): here on finite ideles, with values in `G_K^ab` of the fixed closure, in the
geometric normalisation, with the real places handled by total positivity.

*Method of the formal proof:* the shorter proof builds global class field theory itself: a bound for the index of
norm subgroups by comparing the densities of 8.1 and 8.4 at the primes of degree one; from that bound and a count of
`S`-units, the local–global principle for Brauer classes; and the reciprocity law by reduction to the cyclotomic
characters of prime conductor. ClassFieldTheory states the global Artin map for each finite Galois extension `L/K`,
on the idele class group, with values in `Gal(L/K)^ab` (§11.1, `globalArtinMap`). The pinned library also has the
limit of these maps: the absolute Artin map `TauCeti.ClassFieldTheory.ClassFormation.absoluteArtinMap` of the global
class formation `TauCeti.ClassFieldTheory.globalClassFormation K`, read on `C_K` through
`TauCeti.ClassFieldTheory.globalGroundEquiv K`, with values in the topological abelianisation of the absolute Galois
group of `K`. Its restriction to each finite layer is the Artin map of that layer
(`abelianizationRestrict_absoluteArtinMap`; `globalArtinMap_eq_of_mk_eq_absoluteArtinMap` for `globalArtinMap`), it is
the only homomorphism with this property (`eq_absoluteArtinMap_of_forall_abelianizationRestrict`), its image is dense
(`denseRange_absoluteArtinMap`) and its kernel is the intersection of the norm subgroups
(`absoluteArtinMap_eq_zero_iff`). MordellLawrenceVenkatesh §1.8 states the same map on `𝔸_K^×` as a target,
continuous and with the local Artin maps as its components, in the arithmetic normalisation. With the library, `Art_K`
is this map on the ideles with archimedean components `1`, read in `G_K^ab` through a `K`-isomorphism of the separable
closure with `Ω` (two such differ by an inner automorphism, which is trivial on `G_K^ab`), and composed with
inversion. Its local components are those of 2.1 by `globalArtinMap_local` in each finite layer, and the reciprocity
law (b) comes from `globalArtinMap_principal` with the archimedean symbols of ClassFieldTheory §10.1 (`infiniteArtinAt`,
trivial at complex places, the complex conjugation at a real place where the element is negative). What 2.2 adds to
the library is the restriction to the finite ideles: continuity and surjectivity there, (b) in this form, and (c)–(f).
For the first statement of (c), Tau Ceti's main branch, later than the revision pinned here, has the norm
compatibility of the finite layers (`TauCeti.ClassFieldTheory.globalArtinMap_ideleClassNormMap`), which gives it in the
limit; the transport along endomorphisms of `Ω` is not stated there.

Let `K` be a number field and `Art_K : 𝔸_{K,f}^× → G_K^ab` the homomorphism with `χ(Art_K(a)) = ∑_v χ(Art_v(a_v))` for
every character `χ` of `G_K` (2.1 (d); the sum is finite). Prove:

(a) `Art_K` is continuous, surjective, and `Art_K(ι_v(x)) = Art_v(x)`.

(b) *Reciprocity.* `Art_K(x) = 1` for every totally positive `x ∈ K^×`; `χ(Art_K(x)) = 0` for every `x ∈ K^×` if the
character `χ` vanishes on all complex conjugations; and if `χ` is nonzero on every complex conjugation, `χ(Art_K(x)) =
0` if and only if `N_{K/ℚ}(x) > 0`.

(c) *Norms.* For a number field `L ⊃ K` in `Ω` and a finite idele `y` of `L`: if `Art_L(y)` is the class of `g′ ∈ G_L`,
then `Art_K(N_{L/K}(y))` is the class of the image of `g′` in `G_K` (more generally along an endomorphism of `Ω`
extending `K → L`).

(d) *Local symbols.* Let `A` lie over `v` and `χ` be a character of `G_K`. The values `χ(Art_v(x))`, `x ∈ K_v^×`, are the
values of `χ` on `D_A`; they all vanish if and only if `χ(D_A) = 0`; they vanish on units if and only if `χ(I_A) = 0`.
If `χ(I_A) = 0` and `φ` is an arithmetic Frobenius at `A`, then `χ(Art_v(x)) = −ord_v(x)·χ(φ)` for `x ∈ K^×`.

(e) *A product formula on valuations.* Let `χ` be killed by `n` with `χ(Art_K(x)) = 0` for some `x ∈ K^×`, let `w_j` be
distinct places, `s_j` an arithmetic Frobenius at a place above `w_j` where `χ` is unramified, and suppose that at every
other finite place `v` either `χ(Art_v(x)) = 0`, or `χ` is unramified at `v` and `x·r^{−n}` is a unit at a place above
`v` for some `r ∈ Ω^×` fixed by inertia there. Then `∑_j ord_{w_j}(x)·χ(s_j) = 0`.

(f) *Unramified characters.* If `K^×·U^S = 𝔸_{K,f}^×` and a continuous homomorphism `z : G_K → V` to a discrete abelian
group vanishes on the complex conjugations, on `D_A` for the places above `S` and on `I_A` for the places above the
places outside `S`, then `z = 0`.

*Needs:* 1.3, 1.5, 2.1; ClassFieldTheory §§10.1, 11.1 (Brauer sequence, global Artin reciprocity); Tau Ceti
`TauCeti.ClassFieldTheory.ClassFormation.absoluteArtinMap` at `TauCeti.ClassFieldTheory.globalClassFormation` (the
absolute global Artin map `C_K → G_K^ab`); MordellLawrenceVenkatesh §1.8 (the same map on `𝔸_K^×`, continuous, with the
local Artin maps as components); on Tau Ceti's main branch `TauCeti.ClassFieldTheory.globalArtinMap_ideleClassNormMap`
(norm compatibility, for (c)).

[ShortProof], `Lib/ClassField/Global/ArtinMap` (`New.abelianLift_artinMap_eq_finprod`, `New.continuous_artinMap`,
`New.artinMap_locIdele`, `New.artinMap_map_adeleNorm`, `New.IsPlaceOver.range_abelianLift_comp_artinAt`,
`New.IsPlaceOver.artinAt_trivial_iff_decompGroup_le`, `New.IsPlaceOver.artinAt_units_trivial_iff_inertiaGroup_le`,
`New.IsPlaceOver.abelianLift_artinAt_of_inertiaGroup_le_ker`); `Lib/ClassField/Global/ArtinReciprocity`
(`New.artin_reciprocity`, `New.abelianLift_artinMap_principalIdele_eq_one`,
`New.artinMap_principalIdele_eq_one_of_isTotallyPositive`, `New.abelianLift_artinMap_principalIdele_eq_one_iff`);
`Lib/ClassField/Global/NormTheorems` (`New.artinMap_surjective`); `Lib/ClassField/Global/ExistenceTheorem`
(`New.sum_ord_smul_frob_eq_zero`, `New.QZChar.eq_zero_of_unramified_off`); `Lib/ClassField/Global/AlbertBrauerHasseNoether`
(`New.second_inequality`, `New.albert_brauer_hasse_noether`)

### 2.3 Norm groups, Hasse's norm theorem, the existence theorem, Kummer characters and detecting points

*Origin:* adapted from the norm and existence theorems of global class field theory (Milne (2020); Tate (1967)): here
on finite ideles, for totally positive elements, and with existence only for totally complex fields.

*Method of the formal proof:* in the shorter proof, (b) applies the local–global principle for Brauer classes, proved
with 2.2, to the cyclic class of `x`; (c) is first proved over fields that contain `μ_n`, where the Kummer characters
of (d) describe the abelian extensions of exponent dividing `n`, and the general case is reduced to that one through a
cyclic subextension of `K(μ_n)/K` and the norm compatibility 2.2 (c); the detecting points are Artin symbols of
representatives of a finite quotient of the ideles. With the library, (a) is the kernel and the norm index of the
global Artin map of `L/K` on the full idele class group (ClassFieldTheory §11.1, `ker_globalArtinMap`: the kernel is
`N_{L/K}(C_L)`; §12.1, `card_ideleClassNormQuotient`: its index is `[L : K]`) restricted to the finite ideles, where
`x` has to be positive at the real places of `K` that ramify in `L` and is made totally positive by multiplying it with
the norm of an element of `L^×` of suitable signs. (b) is the placewise cyclic Hasse norm theorem (ClassFieldTheory
§13.1, `isGlobalNorm_iff_isLocalNormEverywhere`, the placewise form of `cyclicHasseNorm`), whose hypotheses those of (b)
imply: total positivity makes `x` a local norm at the real places, and a nonzero element of the closure of `N_{L/K}(L)`
in `K_v` is a norm from `K_v ⊗_K L`, since `L` is dense there and the nonzero local norms form an open, hence closed,
subgroup of `K_v^×`. (c) is not the library's existence theorem but a deduction from it (ClassFieldTheory §12.1,
`globalAbelianExistence`, for the open subgroups of finite index) together with the surjectivity of `Art_K` and the
separation of the points of `G_K^ab` by characters. For `n = p` prime, the second statement of (d) is the Kummer case
of ClassFieldTheory §12.1 (`globalNormSubgroup_kummerLayer_sUnits`: for `S` containing the places above `p` and
generating the class group, that is with `K^×·U^S = 𝔸_{K,f}^×`, the norm subgroup of `K(U_S^{1/p})/K`, `U_S` the
`S`-units, is the image of the ideles that are `p`-th powers at `S` and at the infinite places and units elsewhere),
read at finite ideles through 2.2, the complex places imposing no condition; for composite `n` it is not stated there.

Let `K` be a number field.

(a) If the kernel of a character `χ` of `G_K` is `G_L`, then `L/K` is cyclic, `ker(χ∘Art_K)` has index `[L : K]` in the
finite ideles, and a finite idele lies in it if and only if it is `x·N_{L/K}(y)` with `x ∈ K^×` totally positive and `y`
a finite idele of `L`. Every cyclic `L/K` is cut out by some character.

(b) *Hasse.* For `L/K` cyclic, a totally positive `x ∈ K^×` that lies in the closure of `N_{L/K}(L)` in `K_v` for every
finite place `v` is a norm from `L^×`.

(c) *Existence.* For `K` totally complex, a continuous homomorphism `θ` from the finite ideles to a `T₁` topological
group `C`, trivial on `K^×`, factors through `Art_K`: there is a continuous homomorphism `μ : G_K → C` with `μ(g) = θ(x)`
whenever the class of `g` is `Art_K(x)`.

(d) *Kummer characters.* If `G_K` fixes `μ_n`, there is an additive map `κ` from the `G_K`-invariant elements of `Ω^×`
to the homomorphisms `G_K → ℤ/n` with `ζ_n^{κ(x)(g)} = g(a)/a` whenever `a^n = x`. If moreover `K` is totally complex, `S`
is finite, `K^×·U^S = 𝔸_{K,f}^×` and `S` contains the places above `n`, then a finite idele whose Artin symbol is killed
by `κ(u)` for every `S`-unit `u` lies in `K^×·(U^S ∩ (n-th powers at the places of S))`.

(e) *Local powers.* For `n ≥ 1` and a finite place `v`, the `n`-th powers have index at most `n²·N(v^a)` in `K_v^×`, where
`a` is the exponent of `v` in `n`; for a finite set `S`, the finite ideles that are `n`-th powers at the places of `S`
have index at most `n^{2#S + [K:ℚ]}`.

(f) *Detecting points.* Let `K` be totally complex, `S` a set of finite places and `m ≥ 1` such that the finite ideles
that are `m`-th powers at `S` have finite index `i_S`. There are finitely many `p_i ∈ G_K` and integers `n_i ≥ 2` with
`∏ n_i | h_K·i_S` such that every locally constant homomorphism `x : G_K → B` to an abelian group, killed by `m` and
vanishing on `I_A` for the places `A` above places outside `S`, satisfies `n_i·x(p_i) = 0` for all `i`, and is zero if
it vanishes at every `p_i`.

*Needs:* 1.5, 2.1, 2.2; ClassFieldTheory §§11.1, 12.1, 13.1 (kernel of the global Artin map, existence, norm index,
the Kummer layer of the `S`-units, cyclic Hasse).

[ShortProof], `Lib/ClassField/Global/NormTheorems` (`New.exists_isProGalois_ker_of_isCyclic`, `New.hasse_norm`,
`New.index_ker_abelianLift_comp_artinMap`, `New.abelianLift_artinMap_eq_one_iff`); `Lib/ClassField/Global/ExistenceTheorem`
(`New.exists_comp_artinMap`, `New.exists_kummer_chars`, `New.index_pow_local_le`, `New.index_idelesPowAt_ne_zero_and_le`,
`New.OddPart.IsUnramifiedTorsionHom`, `New.OddPart.exists_detecting_points_hom`)

### 2.4 Galois descent from a subgroup of finite index

*Origin:* adapted from Galois descent for semilinear actions (Speiser's lemma) and Hilbert's Theorem 90 (Serre
(1997); Neukirch, Schmidt and Wingberg (2008); Atiyah and Wall (1967)): here relative to a subgroup of finite index
that is the fixer of its own fixed field.

*Method of the formal proof:* for a scalar `a` fixed by `U`, summing `τ(g)(a y)` over representatives `g` of the
cosets of `j⁻¹(U)` gives a vector fixed by `Γ`; the cosets act on `F^U` by pairwise distinct automorphisms, which are
linearly independent over `F` (Dedekind), so some `F`-combination of these sums, for suitable `a`, equals `y`. For
Hilbert 90, `Ω` with the action twisted by the cocycle has a nonzero invariant vector `x` by the first statement, and
the cocycle is the coboundary of `x⁻¹`.

Let a group `G` act on a field `F` by automorphisms, `j : Γ → G` a homomorphism, `U ⊂ G` a subgroup of finite index that
is the fixer of its own fixed field `F^U`, and `τ` a representation of `Γ` on an `F`-vector space `V` that is
semilinear along `j`: `τ(g)(a x) = (j(g)a)·τ(g)x`. Then every `y ∈ V` fixed by all `g` with `j(g) ∈ U` lies in the
`F`-span of the vectors fixed by all of `Γ`. In particular (Hilbert 90) every continuous 1-cocycle of a profinite group
acting on `Ω` as the Galois group of `Ω/K`, with values in `Ω^×`, is a coboundary.

*Needs:* 1.1.

[ShortProof], `Lib/ClassField/GaloisCohomology/KummerCyclicClasses` (`New.Period.mem_span_fixed`, `New.hilbert90_unitsRep`)

## Layer 3: Cocycles with local conditions

The Selmer bounds of the lower bound count cocycles, not cohomology classes, with explicit vanishing conditions on
inertia and decomposition groups. This layer fixes the notions (3.1), treats cocycles at a place where the action is
tamely ramified (3.2), and proves finiteness for cocycles unramified outside a finite set (3.3).

### 3.1 Continuous cocycles, Selmer cocycles and Selmer modules

*Origin:* definitions and conventions.

*Method of the formal proof:* cocycles are explicit functions on the group; local conditions are submodules of
functions on decomposition groups or linear relations among values.

1. A *discrete module* over a ring `R` for a topological group `Γ` is an `R`-module with the discrete topology and a
   continuous `R`-linear action. `Z¹(Γ, M)` is the module of continuous maps `z : Γ → M` with `z(gh) = z(g) + g z(h)`.
   For a character `χ : Γ → O^×` and an `O`-module `B`, a *`χ`-cocycle* in `B` is a locally constant `z : Γ → B` with
   `z(gh) = z(g) + χ(g) z(h)`.
2. For a number field `K`, a finite discrete `G_K`-module `M`, a set `S` of finite places with a place `A_v` of `Ω` above
   each `v`, submodules `L_v` of the functions `D_{A_v} → M`, and a set `P` of finite places, the *Selmer cocycles*
   `Z_{S,L}(P)` are the `z ∈ Z¹(G_K, M)` that vanish on `I_A` for every `A` above a place outside `S ∪ P`, whose
   restriction to `D_{A_v}` lies in `L_v` for `v ∈ S`, and that vanish at every complex conjugation.
3. For `ρ : G_E → M_n(O)`, a set `S` of places, a set `L` of finitely supported functions `G_E → M_n(O)` (linear
   relations) and an `O`-module `B`, the *Selmer module* is that of GaloisRepresentationsOfUnitaryEigenforms §9.2
   (locally constant `ρ`-cocycles `c : G_E → Bⁿ`, zero on inertia above the places outside `S`, with
   `∑_g f(g)c(g) = 0` for `f ∈ L`). Membership is monotone: a member for `(S, L)` is a member for `(T, K)` if `K ⊂ L`
   and it vanishes on inertia at the places of `S ∖ T`.
4. For a CM field `E`, `idOrConj_b(g)` is `g` for `b = true` and `(g^c)⁻¹` for `b = false`.

*Needs:* 1.1; GaloisRepresentationsOfUnitaryEigenforms §9.2 (Selmer modules).

[ShortProof], `Lib/ClassField/GaloisCohomology/ContinuousCocycles` (`New.DiscreteModule`, `New.Z1`, `New.Z2`, `New.H2`,
`New.QZChar`, `New.DiscreteModule.IsShortExact.card_eq_card_mul_card`); `Lib/ClassField/GreenbergWiles/SelmerLevels`
(`New.selmerZ1`); `Lib/ClassField/GaloisCohomology/TameSelmerCocycles` (`New.Selmer.mem_selmerModule_iff`,
`New.Selmer.mem_selmerModule_of_eq_zero_on_inertiaAbove`, `New.Selmer.mem_selmerModule_of_subset`);
`Lib/ClassField/Global/CMSplittingCharacters` (`New.idOrConjInv`)

### 3.2 Cocycles at tamely ramified places

*Origin:* adapted from the theory of tame ramification (Neukirch (1999); Serre (1979); Stacks Project, tag 09EE): here
for locally constant cocycles of a matrix representation, with values killed by a power of `ℓ` prime to the place.

*Method of the formal proof:* the cocycle makes `G_E` act on `Bⁿ` by the affine maps `u ↦ c(g) + ρ(g)u`. This
homomorphism to the permutations of `Bⁿ` satisfies the hypotheses of 1.4 (d) with exponent `mℓ^M`, which is prime to
the place: it is trivial on the elements of `I_A` near `1`, and its values on all of `I_A` have order dividing `mℓ^M`.
By 1.4 (d) the action of each element of `I_A` is then a power of that of `γ_A`.

Let `E` be a number field, `ρ : G_E → M_n(O)` multiplicative, `B` an `O`-module killed by `ℓ^M`, `A` a place of `Ω` above a
finite place `P` of `E`, `c : G_E → Bⁿ` locally constant with `c(gh) = c(g) + ρ(g)c(h)`.

(a) If `ρ(i^m) = 1` for `i ∈ I_A`, `ρ` is trivial on the elements of `I_A` near `1`, `m ℓ^M` is a unit at `A`, and
`c(γ_A) = 0` for the tame generator `γ_A`, then `c` vanishes on `I_A`. In particular this holds when `P ∤ ℓ` and `ρ` is
trivial on `I_A` (also with `ρ` precomposed with an endomorphism of `G_E` preserving that triviality).

(b) Under the same hypotheses on `ρ` and `A`, the restrictions to `D_A` of the locally constant cocycles obeying a set
of relations have length at most `length(Bⁿ) + length(ker(ρ(γ) − 1) on Bⁿ)`, for any `γ ∈ I_A`.

(c) If `c` vanishes on `I_{A′}` and at an arithmetic Frobenius at `A′`, it vanishes on `D_{A′}`. If `ρ` is trivial on
inertia above `v` and `c` vanishes on `I_{A′}` for one place `A′` above `v`, it vanishes on `I_A` for every place `A`
above `v`.

(d) *Detection on one side.* Let `E` be CM, `P ∤ ℓ`, `v ∈ {P, P̄}` and `ρ` trivial on inertia above `v`. There are
`b ∈ {true, false}` and a place `A′` above `v` such that every member `c` of a Selmer module of `ρ` with
`c(idOrConj_b(γ_A)) = 0` vanishes on inertia above `v`, and if moreover `c(idOrConj_b(φ)) = 0` for an arithmetic
Frobenius `φ` at `A`, then `c` vanishes on `D_{A′}`.

*Needs:* 1.4, 3.1.

[ShortProof], `Lib/ClassField/GaloisCohomology/TameSelmerCocycles` (`New.Selmer.cocycle_eq_zero_on_inertia_of_tameGenerator`,
`New.Selmer.eq_zero_on_inertiaGroup_of_tameGenerator`, `New.Selmer.length_localCocycles_le`,
`New.Selmer.eq_zero_on_decompGroup`, `New.Selmer.eq_zero_on_inertiaAbove`, `New.Selmer.exists_conj_side_detects`)

### 3.3 Finiteness of cocycles unramified outside a finite set

*Origin:* adapted from the published theory of the Hermite–Minkowski finiteness theorem: here as finiteness of
continuous cocycles, proved by class field theory.

*Method of the formal proof:* class field theory takes the place of a bound for discriminants. Choose an open normal
subgroup `U` with trivial action on `V` and no complex conjugation in it. The restriction of a cocycle to `U` is a
homomorphism, and by 2.2 (f) over the fixed field of `U` such a homomorphism, if unramified outside `S`, is known
once its restrictions to the decomposition groups above finitely many places are known; each of these ranges over a
finite set by the local statement at the end. The cocycle itself is then fixed by its values at representatives of
`G/U`.

Let `G` act on `Ω` as the Galois group over a number field `K`, `V` a finite discrete `G`-module and `S` a finite set of
finite places. Only finitely many continuous cocycles `G → V` vanish on `I_A` for every place `A` above a place outside
`S`. In particular the Selmer cocycles of 3.1 (2) with `S`, `P` finite are finitely many. Over a henselian local field
datum (1.1), a finite discrete module has finitely many continuous cocycles.

*Needs:* 1.2, 2.2, 3.1.

[ShortProof], `Lib/ClassField/GreenbergWiles/SelmerLevels` (`New.finite_cocycles_unramified_outside`,
`New.selmerZ1.finite_unramified_cocycles`); `Lib/ClassField/LocalDuality/KummerFiniteness` (`New.IsLocalGalois.finite_Z1`)

## Layer 4: Counting cocycles at split primes

In place of local and global duality and the Greenberg–Wiles formula, the route counts cocycles that are trivialised at
the places above a level and at infinity. Auxiliary primes split in the field of an open normal subgroup `U` carry
power residue symbols of `N`-units; these give linear relations among the values of cocycles at tame generators, and
an element central modulo `U` with trivial cyclotomic character and no fixed vectors bounds the count. From the count
comes a lower bound for the number of *relations*, functions on `U` with the properties of restrictions of dual
cocycles; this is the form in which the Selmer bounds use the dual side.

### 4.1 Split places, `N`-units and trivialised cocycles

*Origin:* definitions and conventions.

*Method of the formal proof:* the definitions are those of the counts; cocycles carry their trivialisations as data.

Let `K` be a number field, `m, N ≥ 1`, `U` an open normal subgroup of `G_K`, `I ⊂ G_K` a set and `ι` a finite index set.

1. The *places above `N` and infinity* are the places `B` of `Ω` with `N ∈ 𝔪_B`, together with the infinite places of
   `Ω`; `G_K` permutes them. The *`N`-units* of `Ω` are the `x ∈ Ω^×` that are units at every place `B` with `N ∉ 𝔪_B`;
   `E_N(U)` is the group of `N`-units fixed by `U`, with its action of `G_K/U`.
2. *Split places* `s` for `(m, N, I, U, ι)`: `U` fixes `μ_m` and `m | N`; distinct finite places `v_i` (`i ∈ ι`) not dividing
   `N`, places `A_i` of `Ω` above them and arithmetic Frobenius elements `φ_i ∈ U` at `A_i`; `I` is the union of the
   inertia groups above the places not dividing `N` other than the `v_i`; inertia above every place not dividing `N`
   lies in `U`; and for every number field `F` between `K` and the fixed field of `U`, `F^×·U_F^T = 𝔸_{F,f}^×` for `T`
   the set of places `w` of `F` dividing `N`.
   The Frobenius elements *detect roots* if every `y ∈ Ω^×` with `y^m ∈ E_N(U)` that is fixed by all `φ_i` is fixed by `U`.
3. A *tame generator of order `m`* at a place `A` above `v` is `γ ∈ I_A` such that `γ(y)/y = ζ_m` for a fixed primitive
   `m`-th root of unity `ζ_m`, some uniformiser `π ∈ K` at `v` and some `y` with `y^m = π`.
4. For a set `X` with a `G`-action and a discrete module `V`, the *trivialised cocycles* `Triv_{X,I}(V)` are the pairs
   `(f, z)` of a map `f : X → V` and a continuous `z : G → V` vanishing on `I` with `g·f(x) = f(gx) + z(g)` for all `g, x`;
   for `X` nonempty `z` is a cocycle. `V` has *few cocycles with exponent `k`* if `0 < #Triv_{X,I}(V) ≤ #V^k`. Here `X` is
   the set of places above `N` and infinity.
5. A finite `R[G]`-module `V` *satisfies `(n, U, z, a)`* if it is killed by `n`, `U` acts trivially on it, and `ρ(z) − a`
   is injective on `V`. `V` is *Higman-projective* over `G/U` if it satisfies Higman's criterion of
   AuxiliaryAlgebraAndAnalysisForThetaLifts §1.2 for `Δ = G/U`: some additive `τ : V → V` has `∑ gτg⁻¹ = 1`, the sum over
   representatives of `G/U`.

*Needs:* 1.1, 1.4, 1.5; AuxiliaryAlgebraAndAnalysisForThetaLifts §1.2 (Higman's criterion).

[ShortProof], `Lib/ClassField/GreenbergWiles/SelmerLevels` (`New.PlaceAboveLevel`, `New.IsLargeLevel.sUnits`,
`New.IsLargeLevel.fixedSUnits`, `New.IsLargeLevel.SplitPlaces`, `New.IsLargeLevel.SplitPlaces.FrobeniiDetectRoots`,
`New.IsTameGeneratorFor`, `New.IsLargeLevel.ofBase_mem_sUnits`); `Lib/ClassField/GreenbergWiles/SplitPrimeReciprocity`
(`New.DiscreteModule.trivialisedCocycles`, `New.DiscreteModule.HasFewCocycles`); `Lib/General/Algebra/CartanMap`
(`New.DiscreteModule.FiniteKilledFixedInj`, `New.DiscreteModule.IsHigmanProjective`)

### 4.2 The equivariant `S`-unit theorem

*Origin:* adapted from the published theory of Dirichlet's `S`-unit theorem: here equivariantly for the `N`-units of the
field of an open normal subgroup, with linearly independent equivariant logarithms indexed by orbits of places, and the
count of equivariant maps to projective modules.

*Method of the formal proof:* (a) is the `S`-unit theorem, with the logarithms at the places above `N` and infinity
grouped by `Q`-orbits. (b) compares two lattices with an action of `Δ`, `A` modulo torsion and the permutation
lattice on `Z`. For `V` satisfying Higman's criterion, the number of equivariant maps from a lattice to `V` is fixed by
the characteristic polynomial of an integral matrix built from the action on the lattice and the map `τ` of the
criterion (4.1 (5)); the forms `Λ_z` identify the two lattices after tensoring with `ℝ`, so the two polynomials agree.

(a) Let `Q` be an open normal subgroup of `G_K` and `X` the set of `Q`-orbits of places of `Ω` above `N` and infinity.
Then `E_N(Q)` is finitely generated; there are additive maps `Λ_x : E_N(Q) × ℤ → ℝ`, `x ∈ X`, permuted by `G_K/Q` (acting
trivially on `ℤ`) as it permutes `X` and linearly independent over `ℝ`; and `rank(E_N(Q) × ℤ) ≤ #X`.

(b) Let `Δ` be a finite group, `Z` a finite `Δ`-set, `V` a finite `𝔽_ℓ[Δ]`-module that is Higman-projective, and `A` a
finitely generated `ℤ[Δ]`-module of rank at most `#Z` with linearly independent real linear forms `Λ_z` permuted by `Δ`
as `Z` is. Then `A` has as many equivariant maps to `V` killing its torsion as there are equivariant maps `Z → V`.

*Needs:* 1.2, 4.1; Mathlib `NumberField.Units.regulator_ne_zero`, `NumberField.Units.finrank_mul_regulator_eq_det`
(Dirichlet's unit theorem); Tau Ceti `TauCeti.finrank_sUnits_numberField`, `Set.unit_fg_of_units` (the `S`-unit
theorem).

[ShortProof], `Lib/ClassField/GreenbergWiles/SelmerLevels` (`New.IsLargeLevel.dirichlet_fixedSUnits`,
`New.linearIndependent_sUnit_log`, `New.PlaceAboveLevel.bijective_orbits`); `Lib/ClassField/GaloisCohomology/TateIndexFormula`
(`New.card_hom_lattice_eq_card_equivariant`, `New.card_invariants_linHom`)

### 4.3 Power residue reciprocity at split primes

*Origin:* particular to this proof: power residue symbols of `N`-units at split auxiliary primes give linear relations
among the values of trivialised cocycles at tame generators, and over a totally complex field every solution of these
relations is realised by a trivialised cocycle.

*Method of the formal proof:* `b` comes from the Kummer characters of the `N`-units (2.3 (d)), and (b) from the
product formula 2.2 (e). For (c), a cocycle that is a coboundary on the stabiliser of one place in each orbit extends
to a trivialised cocycle, and trivialised cocycles of an open subgroup of finite index give trivialised cocycles of
`G_K` by corestriction.

Let `s` be split places for `(m, N, I, U, ι)`, `γ_i` a tame generator of order `m` at `A_i`, and `V` a discrete
`ℤ/m`-module on which `U` acts trivially. There is an additive map `b : E_N(U) → (ℤ/m)^ι` such that:

(a) `ζ_m^{b(y)_i} = φ_i(r)/r` whenever `r^m = y`;

(b) for every `(f, z) ∈ Triv(V)`: if `z(γ_i) = 0` for all `i` then `z` vanishes on `U`; and for every `y ∈ E_N(U)`,
`∑_{i, g} b(g y)_i · g⁻¹ z(γ_i) = 0`, the sum over `i ∈ ι` and representatives `g` of `G_K/U`;

(c) if the fixed field of `U` is totally complex and `F : ι × G_K/U → ℤ/m` satisfies `∑_{i,g} b(g y)_i F(i, g) = 0` for all
`y ∈ E_N(U)`, then for every `a ∈ V` there is `(f, z) ∈ Triv(V)` with `z(γ_i) = ∑_g g(F(i, g) a)`.

Moreover, for a short exact sequence `0 → A → B → C → 0` of discrete modules: `#Triv(B) = #Triv(A)·#(image of Triv(B) in
Triv(C))`; if `A` and `C` have few cocycles with exponent `k`, so has `B`, and if moreover `#Triv(B) = #B^k`, every
trivialised cocycle of `C` lifts to `B` and `#Triv(A) = #A^k`.

*Needs:* 1.4, 2.2, 2.3, 4.1.

[ShortProof], `Lib/ClassField/GreenbergWiles/SplitPrimeReciprocity` (`New.IsLargeLevel.SplitPlaces.PowerResidueSymbols`,
`New.IsLargeLevel.SplitPlaces.exists_powerResidueSymbols`, `New.IsLargeLevel.SplitPlaces.power_residue_reciprocity`,
`New.DiscreteModule.trivialisedCocycles.exists_mem_of_orbit_reps`, `New.DiscreteModule.trivialisedCocycles.corestrict_mem`,
`New.DiscreteModule.trivialisedCocycles.card_eq_of_isShortExact`,
`New.DiscreteModule.trivialisedCocycles.hasFewCocycles_of_isShortExact`)

### 4.4 The count of trivialised cocycles

*Origin:* particular to this proof: an upper bound for the number of trivialised cocycles of a finite Galois module over
a totally complex field, with the vanishing of the dual Selmer group replaced by an element central modulo `U` without
fixed vectors and by Frobenius elements that detect roots.

*Method of the formal proof:* in (a) the trivialised cocycles are compared, through the relations of 4.3, with the
equivariant maps from `E_N(U) × ℤ` to `V` counted in 4.2 (b). For (b), the modules `W` in play are those satisfying
`(l, U, z, 1)` (4.1 (5)). The proof first works over an open subgroup containing `z` whose image in `G_K/U` normalises
a Sylow `l`-subgroup `P/U`, both indices prime to `l`. There (a), applied after filtering by the invariants of `P`,
bounds every such `W`, and (a) gives equality for the Higman-projective ones; embedding `W` in a Higman-projective
module and using the last statement of 4.3, trivialised cocycles lift along exact sequences over that subgroup, and
corestriction carries the lifting to `G_K`. Only then, over `G_K`, is `#Triv(W)/#W^{#ι+1}` multiplicative in exact
sequences (4.3); it is `1` on Higman-projective modules by (a), hence `1` throughout by
AuxiliaryAlgebraAndAnalysisForThetaLifts §1.2. A filtration of `V` by modules killed by `l` gives the bound.

Let `K` be a number field, `N ≥ 1` and `l` a prime.

(a) *Projective case.* Let `s` be split places for `(l, N, I, U, ι)`, `V` a finite module satisfying `(l, U, z, n)` (4.1 (5))
and Higman-projective over `G_K/U`, and suppose `z(x)·x^{−n}` is fixed by `U` for every `x ∈ Ω^×` with `x^l ∈ E_N(U)` fixed by
all `φ_i`. Then `V` has few cocycles with exponent `#ι + 1`; if moreover `n` is the representative in `[0, l)` of
`χ_l(z) mod l` and `K` is totally complex, `#Triv(V) = #V^{#ι+1}`.

(b) *Central case.* Let `K` be totally complex, `s` split places for `(l^r, N, I, U, ι)` with `r ≥ 1`, `V` a finite module
satisfying `(l^r, U, z, 1)` with `χ_l(z) = 1` and
`[z, g] ∈ U` for every `g ∈ G_K`, and suppose that the Frobenius elements of `s` detect roots. Then
`0 < #Triv(V) ≤ #V^{#ι+1}`.

*Needs:* 4.1, 4.2, 4.3; AuxiliaryAlgebraAndAnalysisForThetaLifts §1.2 (multiplicative functions trivial on the
modules that satisfy Higman's criterion); Mathlib `Sylow.nonempty`, `Sylow.not_dvd_index` (on the finite quotient
`G_K/U`).

[ShortProof], `Lib/ClassField/GreenbergWiles/CocycleCounts` (`New.IsLargeLevel.SplitPlaces.card_trivialised_of_isHigmanProjective`,
`New.IsLargeLevel.SplitPlaces.hasFewCocycles_of_isHigmanProjective`,
`New.IsLargeLevel.SplitPlaces.card_trivialisedCocycles_eq_of_isHigmanProjective`,
`New.IsLargeLevel.SplitPlaces.fixes_sub_of_frobeniiDetectRoots`, `New.IsLargeLevel.SplitPlaces.hasFewCocycles_of_central`)

### 4.5 Relations at split primes and the Greenberg–Wiles inequality

*Origin:* adapted from the published theory of the Greenberg–Wiles formula: here only an inequality, with relations
standing for the dual Selmer group and without local or global duality.

*Method of the formal proof:* in (b) the level `q` is large, and for an open normal subgroup acting trivially on the
`m`-th roots of the `U`-invariant `q`-units, Chebotarev's theorem gives split primes whose Frobenius elements meet each
of its cosets that meets `U`; a linear form that vanishes on the values at the tame generators of all cocycles in
`Z({v_i})` is then given by a relation. In (c) the count of 4.4 bounds the cocycles that may ramify at the split primes, and
through them the group of linear forms that annihilate their values; (d) puts (b) and (c) together.

Let `K` be a number field and `M` a finite discrete `G_K`-module. A *relation setting* `D` for `M` and `m ≥ 1`: `m M = 0`;
an open normal subgroup `U` fixing `M` and `μ_m` and containing no complex conjugation; complex conjugations act
trivially on `M`; a finite set `S` of places outside which `M` is unramified; a place `A_v` above every `v`; and local
conditions `L_v` (submodules of functions `D_{A_v} → M`) containing the local coboundaries for `v ∈ S`. Write `Z(P)` for
the Selmer cocycles of 3.1 (2) (allowed at `S`, ramified at most at `S ∪ P`) and `A_v = L_v ∩ Z¹(D_{A_v}, M)`. A *split
prime* is a place above a finite place of `K` with an arithmetic Frobenius in `U` and a tame generator of order `m`. A
*relation off a finite set `T`* is a locally constant `y : G_K → Hom(M, ℚ/ℤ)` that vanishes outside `U`, is additive on
`U`, satisfies `y(g u g⁻¹)(a) = χ_m(g)·y(u)(g⁻¹a)`, vanishes on inertia above the places outside `T`, and for every finite
family of split primes above distinct places outside `T` satisfies `∑_j y(frob_j)(z(γ_j)) = 0` for every `z ∈ Z(those
places)`. `p ≥ 1` can be *avoided* if `(m, p) = 1`, no place of `S` divides `p`, and the places dividing `p` are unramified
in the field of `U`. Prove:

(a) There are finitely many relations off `T`.

(b) If `p` can be avoided, there are a level `q`, split places `s` for `(m, q, I, U, ι)` whose Frobenius elements detect
roots, tame generators `γ_i` of order `m`, and a finite set `T ⊃ S` of places prime to `p`, all places of `S` dividing `q`,
such that every family `ν ∈ Hom(M, ℚ/ℤ)^ι` with `∑_i ν_i(z(γ_i)) = 0` for all `z ∈ Z({v_i})` is `(y(φ_i))_i` for a relation `y`
off `T`.

(c) *Counting Selmer cocycles.* Let `s` be split places for `(m, N, I, U′, ι)` (4.1), with `N` in every place of `S`. If
`0 < #Triv(M) ≤ #M^k` (cocycles vanishing on `I`, trivialised above `N` and infinity), then
`#Z({v_i})·#M^{#S + r_∞} ≤ #M^k·∏_{v∈S} #A_v`, `r_∞` the number of infinite places of `K`. If moreover `k = #ι + 1`, `Z(∅) ⊂ Z({v_i})`
and the elements of `Z(∅)` vanish at elements `γ_i`, `i ∈ ι`, then `#Z(∅)·#M^{#S + r_∞}` is at most `#M·∏_{v∈S} #A_v` times the
number of families `ν ∈ Hom(M, ℚ/ℤ)^ι` with `∑_i ν_i(z(γ_i)) = 0` for every `z ∈ Z({v_i})`.

(d) *The inequality.* Let `K` be totally complex, `M` killed by `ℓ^r` (`r ≥ 1`), and `σ ∈ G_K` with `χ_ℓ(σ) = 1`, `[σ, g] ∈ U`
for all `g` and no nonzero fixed vector in `M`. If `p` can be avoided, there is a finite set `T ⊃ S` of places prime to `p`
with `#Z(∅)·#M^{#S + r_∞} ≤ #(relations off T)·#M·∏_{v∈S} #A_v`.

The Greenberg–Wiles formula (ArithmeticGaloisDuality §R02.5.1) together with Poitou–Tate duality gives bounds of this
kind through the restriction of dual Selmer cocycles to `U`; the route needs only the inequality.

*Needs:* 3.1, 3.3, 4.1, 4.3, 4.4; ArithmeticGaloisRepresentations §5.1 (Chebotarev's density theorem).

[ShortProof], `Lib/ClassField/GreenbergWiles/Relations` (`New.SplitPrime`, `New.RelationSetting`,
`New.RelationSetting.IsRelation`, `New.RelationSetting.relations`, `New.RelationSetting.finite_relations`,
`New.RelationSetting.Avoids`, `New.RelationSetting.exists_splitPlaces_forall_exists_mem_relations`,
`New.RelationSetting.exists_card_cocycles_le`); `Lib/ClassField/GreenbergWiles/SelmerRelations`
(`New.selmerZ1.card_mul_pow_le`, `New.selmerZ1.exists_splitPlaces_frob_mem_coset`, `New.selmerZ1.exists_three_values`,
`New.selmerZ1.card_relations_ge`)

### 4.6 Relations modulo `ℓ`

*Origin:* particular to this proof: a lower bound for the number of reductions modulo `ℓ` of relations, for a module
whose `ℓ`-torsion has order `ℓ`, using only four infinite places.

*Method of the formal proof:* by 4.5 (b), linear forms on the group `M[ℓ]` of order `ℓ` come from relations; against
this, 4.4 (a) applies to `M[ℓ]` over the open subgroup acting trivially on `M[ℓ]` and on `μ_ℓ`, whose index is prime to
`ℓ`, with the central element taken in the procyclic image of `κ`, and bounds the cocycles killed by `ℓ`.

Let `D` be a relation setting for `M` and `m` (4.5) with `ℓ | m`, `#M[ℓ] = ℓ`, and `K` with at least four infinite places.
Let `κ : G_K → ℤ_ℓ^×` be a continuous character with values `≡ 1 mod 4`, `c ∈ G_K` with `g ∈ U` or `gc ∈ U` whenever
`κ(g) = 1`, and let the local conditions be `L_v = {f : f(g) = 0 for g ∈ D_{A_v} with (ℓ ∈ v ⇒ κ(g) = 1)}` for every
`v`. Then for some finite `T ⊃ S` the reductions modulo `ℓ` of the relations off `T` form a group of order at least
`ℓ^{k+1}`, `k` the number of places of `S` not above `ℓ`.

*Needs:* 4.4, 4.5; ArithmeticGaloisRepresentations §5.1 (Chebotarev's density theorem).

[ShortProof], `Lib/ClassField/GreenbergWiles/RelationsModL` (`New.RelationSetting.reductions`,
`New.RelationSetting.exists_pow_le_card_reductions`, `New.RelationSetting.exists_hasFewCocycles_torsion`,
`New.RelationSetting.card_torsionBy_cocycles_mul_pow_le`)

## Layer 5: Local duality for crystalline cocycles

The Selmer bounds use local Tate duality only as one divisibility, for groups of crystalline cocycles of lattices in
perfect duality modulo `ℓ^m`. Crystalline representations, their cocycles, Hodge–Tate jumps and the linear Frobenius
are those of CrystallineRepresentationsAndKisinModules §3.1 (defined through `B_max`).

### 5.1 Classes of Galois lattices, cup-orthogonality and the dual defect

*Origin:* definitions and conventions.

*Method of the formal proof:* membership in a class is a conjunction of three conditions, so (a)–(c) follow from the
behaviour of admissibility (CrystallineRepresentationsAndKisinModules §3.6) and of jumps (§3.4, and the Hodge frames of
§3.3 for tensor products) under subobjects, twisted duals and tensor products; (e) is §3.2 (a) with §3.4 (d). For (d),
the linear Frobenius of `s` on `Y ⊗ L` is the tensor product of those on `Y` and on `L` (§3.7 (c)), which `q` and `r`
kill; so it is killed by the monic polynomial over `ℤ_p` of degree `deg q·deg r` whose roots are the products of a
root of `q` and a root of `r`, and §3.7 (e) passes this to `s⁻¹` on the Tate dual.

Let `p` be a prime, `O` a `ℤ_p`-algebra, `Γ` a group with a homomorphism to `G_{ℚ_p} = Gal(ℚ̄_p/ℚ_p)`, `χ` the cyclotomic
character.

1. A *Galois lattice* is a free `O`-module of finite rank with an `O`-linear `Γ`-action; its *Tate dual* is
   `Hom_O(L, O(1))`; the tensor product of two lattices carries the diagonal action.
2. For a filter `F` on `Γ`, a relation `K` between elements of `Γ` and polynomials in `O[X]`, and finite sets `U_g ⊂ ℤ` for
   the `ℤ_p`-algebra maps `g : O → ℂ_p`, the lattice `Y` is *in the class `(F, K, U)`* if it is admissible along the
   supremum of `F` and the filter of neighbourhoods of `1` (its periods fixed by almost all elements span), its Hodge–Tate
   jumps at `g` lie in `U_g`, and `Q` kills `s` on its periods (through the linear Frobenius at the Weil pair `(s, 0)`)
   whenever `K(s, Q)` holds and `s` maps into inertia. A lattice in a class is potentially crystalline.
3. A *pairing* of `Y` and `L` modulo `p^m` is an `O`-linear `ψ : Y ⊗ L → O(1)` with `gψ − ψ = p^m c(g)` for a crystalline
   cocycle `c` of the Tate dual of `Y ⊗ L`, together with a `ℤ_p`-linear `f : O → ℤ_p`; it gives `Y × L → ℤ/p^m`. The
   *cup-orthogonal* `L^{⊥𝒬}` of a class `𝒬` is the module of functions `c : Γ → L` whose cup product with every crystalline
   cocycle of every `Y ∈ 𝒬`, under every pairing, is a 2-coboundary with values in `ℚ̄_p^×`. The *dual defect* is the
   length of the crystalline cocycles of `L` modulo those in `L^{⊥𝒬}`; `L` has *cup exponent `e`* if `p^e` carries the
   crystalline cocycles into `L^{⊥𝒬}`.

Prove, for `O` a domain finite over `ℤ_p`: (a) a lattice with jointly injective equivariant maps to finitely many
lattices of a class is in the class; (b) the Tate dual of a lattice in `(F, K, U)` is in `(F, K(·⁻¹), −U − 1)`, and, when
the image of `Γ` in `G_{ℚ_p}` is open and `L` is potentially crystalline, the multiplicity of the jump `u` of the Tate dual
of `L` is that of `−u − 1`; (c) the tensor product of lattices in `(F, K, U)` and
`(F, K′, U′)` is in `(F, ∅, U + U′)`; (d) if `s` maps into inertia and `K`, `K′` relate `s` to monic `q`, `r` over `ℤ_p`, a
monic polynomial of degree at most `deg q·deg r` over `ℤ_p` kills `s⁻¹` on the Tate dual of `Y ⊗ L`; (e) a lattice on which
`Γ` acts through `χ^c` is in the class `(F, ∅, {−c})`; (f) the dual defect vanishes exactly when all crystalline cocycles
are cup-orthogonal.

*Needs:* CrystallineRepresentationsAndKisinModules §§3.1, 3.2, 3.3, 3.4, 3.6, 3.7 (definitions, Tate twists, Hodge
frames, jumps, admissibility, linear Frobenius).

[ShortProof], `Lib/ClassField/LocalDuality/CrystallineDuality` (`New.Lift.GalLattice`, `New.Lift.GalLattice.tateDual`,
`New.Lift.InClass`, `New.Lift.Pairing`, `New.Lift.cupOrthogonal`, `New.Lift.dualDefect`, `New.Lift.HasCupExponent`,
`New.Lift.InClass.of_jointly_injective`, `New.Lift.InClass.dual`, `New.Lift.InClass.tensor`,
`New.Lift.exists_isKilledBy_tateDual_tensor`, `New.Lift.InClass.of_cyclotomic_pow`, `New.Lift.jump_tateDual`,
`New.Lift.dualDefect_eq_zero_iff`)

### 5.2 Local duality for crystalline cocycles

*Origin:* adapted from local Tate duality (Serre (1997); Milne (2006)): here one divisibility, for groups of crystalline
cocycles modulo `ℓ^m` of potentially crystalline lattices in perfect duality, with the sizes of the cocycle groups.

*Method of the formal proof:* (a) adds the rank formula of CrystallineRepresentationsAndKisinModules §4.2 for `L` and
for `L′`, whose jumps correspond under `u ↦ −u − 1` (§3.4 (e)). (b) and (c) rest on (d), a count of cocycles: when
the group acts on `M` through elements of `ℓ`-power order, the count of Kummer cocycles at the end of (d) and an
induction on `M` give the inequality, and in general one restricts to an open subgroup of index prime to `#M`, from
which the annihilators descend. No perfect pairing and no Euler characteristic formula enter. At the pins, the
library's perfect duality pairing and Euler characteristic formula (`TauCeti.ClassFieldTheory.tateDualityPairing_perfect`,
`TauCeti.ClassFieldTheory.eulerCharacteristic_mixed`), transferred by 1.3, also give the inequality (d). On Tau Ceti's
main branch, later than the revision pinned here: `TauCeti.ClassFieldTheory.natCard_H1_eq_mul` (the Euler
characteristic formula for the cohomology of a finite discrete module).

Let `ℓ` be a prime, `Γ` a topological group with an open embedding into `G_{ℚ_ℓ}`, of index `n` (so `Γ` is the absolute
Galois group of a finite extension of `ℚ_ℓ` of degree `n`), `O` as in the Conventions, `L`, `L′` potentially crystalline
Galois lattices over `O` (5.1) and `b : L′ ≅ Hom_{ℤ_ℓ}(L, ℤ_ℓ)` a `ℤ_ℓ`-linear isomorphism with `b(gx)(gy) = χ(g)·b(x)(y)`.
Let `Z_f(L)` be the crystalline cocycles of `L` and `d = rank_{ℤ_ℓ} L`.

(a′) For every lattice `L` over `O` there is a `ℤ_ℓ`-linear form `f` on `O` such that `(φ, x) ↦ f(φ(x))` is a perfect
`ℤ_ℓ`-pairing between `Hom_O(L, O)` and `L`.

(a) For every `m`, `[Z_f(L) : ℓ^m Z_f(L)]·[Z_f(L′) : ℓ^m Z_f(L′)] = ((ℓ^m)^d)^{2+n}`.

(b) Let `V = L/ℓ^m L`, a finite discrete module, with `q : L → V` the reduction; for groups of cocycles `Y` of
`Hom(V, ℚ̄_ℓ^×)` the annihilator `Y^⊥` under the cup product into `H²(Γ, ℚ̄_ℓ^×)` satisfies `#Y^⊥·#Y | ((ℓ^m)^d)^{2+n}`.

(c) Let `H` be a group of maps `Γ → L′` and `S` a group of maps `Γ → V`, such that the elements of `S` and the reductions of
the elements of `Z_f(L)` are continuous cocycles with some lift whose cup products modulo `ℓ^m` (through `b`) with the
elements of `H` are 2-coboundaries. Then `[S : S ∩ q(Z_f(L))]` divides `[Z_f(L′) : H ∩ Z_f(L′)]`.

(d) Let `(k, A)` be a henselian local field datum (1.1) with `#(𝒪/l) = l^d` for a prime `l`, and `M` a finite discrete module
killed by a power of `l`, fixed by a subgroup `Q` that contains an `l`-power of every element. Cup-orthogonal groups of
continuous cocycles `X ⊂ Z¹(Hom(M, Ω^×))`, `W ⊂ Z¹(M)` (cup product into `H²(Γ, Ω^×)`) satisfy `#X·#W ≤ #M^{2+d}`. Over such a
field there are `n²·#(𝒪/n)` continuous cocycles `Γ → Ω^×` killed by `n`, and `#(k^×/k^{×n})/#μ_n(k) = n·#(𝒪/n)`.

*Needs:* 1.3, 5.1; CrystallineRepresentationsAndKisinModules §§3.4, 4.1, 4.2 (jump duality, reduction, rank formula);
ClassFieldTheory §5.1 (local duality, for (d)).

[ShortProof], `Lib/ClassField/LocalDuality/CrystallineDuality` (`New.Selmer.exists_perfect_pairing`,
`New.Period.IsPotentiallyCrystalline.index_mul_index_dual`, `New.Period.IsCupOrthogonal`,
`New.Period.IsPotentiallyCrystalline.card_pairingAnnihilator_mul_card_dvd`,
`New.Period.IsPotentiallyCrystalline.relIndex_dvd_of_orthogonal`); `Lib/ClassField/LocalDuality/DualityInequality`
(`New.card_mul_card_le_of_le_pairingAnnihilator`, `New.card_mul_card_le_of_orthogonal`,
`New.DiscreteModule.local_duality_card_dvd`); `Lib/ClassField/LocalDuality/KummerFiniteness`
(`New.cokerKerIndex_local_units`, `New.IsLocalGalois.card_kummer_cocycles`)

## Layer 6: Grunwald's theorem and steps of prime degree

The Galois representations of the route are built along towers of CM extensions of prime degree with prescribed
local behaviour at one split place. They come from Grunwald's theorem in prime exponent, with an extra clause on units
at the places of non-prime norm.

### 6.1 Grunwald's theorem in prime exponent, with the unit clause

*Origin:* adapted from the Grunwald–Wang theorem (Artin and Tate (1968), ch. X; Wang (2014)): here in prime exponent
over a totally complex field, for characters of the finite ideles not assumed trivial on `K^×`, with the additional
conclusion on the units at every place of non-prime norm.

*Method of the formal proof:* `χ` comes from the existence theorem 2.3 (c), applied on an open subgroup of finite
ideles: those that are units outside a suitably enlarged `S` (1.5 (b)) and `p`-th powers at finitely many auxiliary
places of prime norm. Chebotarev's theorem (ArithmeticGaloisRepresentations §5.1) provides these places, one for each
class of units outside the enlarged set, modulo `p`-th powers, on which `ψ` is nontrivial, chosen so that the class is
not a local `p`-th power there; this makes `ψ` trivial on the principal ideles of the subgroup.

Let `K` be a totally complex number field, `p` a prime, `S` a finite set of finite places and `ψ` a character of the
finite ideles with values in `ℚ/ℤ`, open kernel and `pψ = 0` (not assumed trivial on `K^×`). There is a character `χ` of
`G_K` with `pχ = 0` such that `χ(Art_K(ι_u(x))) = ψ(ι_u(x))` for every `x ∈ K_u^×` if `u ∈ S`, and for every unit `x ∈ 𝒪_u^×`
if the norm `q_u` is not a prime number.

*Needs:* 1.5, 2.2, 2.3; ArithmeticGaloisRepresentations §5.1 (Chebotarev's density theorem).

[ShortProof], `Lib/ClassField/Grunwald` (`New.grunwald`)

### 6.2 Steps of prime degree with prescribed local behaviour

*Origin:* particular to this proof: CM extensions `E′/E` of prime degree, fixed fields of the symmetrisation `χ^{sym}`
of a Galois character, that carry Weil data and have a prescribed tame character at one split place.

*Method of the formal proof:* for (a), `χ^{sym}` is invariant under conjugation by `c`, and its fixed field is CM; the
norm condition of a step is 2.3 (a) applied to `χ^{sym}`, and the vanishing on inertia above `p` gives the integer of
trace `1` that a step requires. For (b), the Weil data of `L` are made from those of `E`: the same `ȷ`, the splitting
character composed with the norm, and a finite idele corrected by the relative different. For (c), Grunwald's theorem
(6.1) is applied at `w` and `w̄`; its unit clause keeps the auxiliary ramification away from the places fixed by
conjugation, so that (a) and (b) apply.

Let `E` be a CM field with CM type `Φ`. For a character `χ` of `G_E`, let `χ^{sym}(g) = χ(g) + χ(g^c)`; its value at
`Art_E(a)` is `χ(Art_E(a)) + χ(Art_E(ā))`. Let `E_χ` be the fixed field of `ker χ^{sym}`. A *step* `E′/E` with a character
`μ` of the finite ideles of `E` is as in GaloisRepresentationsOfUnitaryEigenforms §5.1 (`E′/E` CM, Galois of prime
degree, `E` containing a primitive `5040`-th root of unity, some integer of `E′` of trace `1` to `E`, `μ` with open
kernel and trivial on `E^×`, `μ(z z̄) = 1` exactly when `z ∈ E^×·N_{E′/E}(𝔸_{E′,f}^×)`).
*Weil data* `(ȷ, α, υ)` on `E` are as in WeilRepresentationsOnBanachSpacesOfData §3.1 (`E` containing a primitive
`5040`-th root of unity, `α` a finite idele, `υ` a splitting character (7.2) with `υ(ϖ_w) = −1` at the finite places
`w = w̄`).

(a) `E_χ` is CM, the CM type of `E` extends to it compatibly, and it contains a primitive `5040`-th root of unity if `E`
does. If `E` contains one, `pχ = 0` for a prime `p`, `χ^{sym} ≠ 0` and `χ^{sym}` kills inertia above `p`, then `E_χ/E` is a
step of degree `p` for the character `exp(2πi χ∘Art_E)`.

(b) A splitting character of `E` composed with the norm is a splitting character of every CM field `L ⊃ E` with a
compatible CM type. If `E` has Weil data, `L` contains a primitive `5040`-th root of unity and no prime `u = ū` of `L`
divides the relative different, then `L` has Weil data.

(c) Let `E` carry Weil data, `w` a split finite place of `E` (`w̄ ≠ w`), `A` a place of `Ω` above `w`, `p` a prime and
`λ : E_w^× → ℚ/ℤ` a nontrivial character with `pλ = 0` and `λ(x^{q_w − 1}) = 0` for units `x`. There are a character `ν` of
`G_E` and a place `u` of `E′ = E_ν` such that `E′/E` is a step of degree `p` with Weil data; `u` is split, lies below `A` and
is the only place of `E′` above `w`; and `ν(Art_w(x)) = 0` and `ν^{sym}(Art_w(x)) = λ(x)` for all `x ∈ E_w^×`.

*Needs:* 2.1, 2.2, 2.3, 6.1, 7.2; WeilRepresentationsOnBanachSpacesOfData §3.1 (Weil data);
GaloisRepresentationsOfUnitaryEigenforms §5.1 (steps of prime degree).

[ShortProof], `Lib/ClassField/Grunwald` (`New.QZChar.abelianLift_symmetrise`, `New.QZChar.stepField`,
`New.isStep_stepField`, `New.nonempty_splittingChar_of_cmTypeOver`, `New.nonempty_weilData_of_not_dvd_differentIdeal`,
`New.GaloisRep.IsStepOfLocalChar`, `New.GaloisRep.exists_isStepOfLocalChar`, `New.GaloisRep.exists_step_of_local_char`)

## Layer 7: Hecke characters of CM fields

The twists of the argument are characters of the norm-one torus `U(1)` of a CM field, tamely ramified at split places;
the Weil representation uses a splitting character; the theta lifts need the values of algebraic Hecke characters at
every conjugate and every `p`-adic embedding. Throughout, `E` is a CM field with CM type `Φ`.

### 7.1 Characters of `U(1)` with given weight and tame part

*Origin:* adapted from the theory of Hecke characters of type `A₀` (Weil (1956); Raghuram, arXiv:2207.03399, §4):
Hecke characters of a CM field with prescribed restrictions to units and prescribed infinity type; here for characters
of the norm-one adeles, with existence under a condition on the integers of norm one, finiteness and conjugation.

*Method of the formal proof:* the character is first written on the open subgroup of points with integral finite part
and extended to `U(1)(𝔸_E)` trivially on the rational points, using divisibility of the circle; integers of norm one are
roots of unity; Hilbert 90 for the ideles (`y ↦ y/ȳ` is onto the norm-one ideles) relates the class group of `U(1)` to
that of `E`.

`U(1)(𝔸_E)` is the group of adeles `u` of `E` with `u ū = 1`; its *rational points* come from `E`, and for a finite set `S`
of finite places `U(1)_S` is the open subgroup of points with integral finite part `≡ 1` modulo every place of `S`. An
*automorphic character* of `U(1)` is a continuous `μ : U(1)(𝔸_E) → S¹` trivial on the rational points. It has *weight*
`e : {infinite places} → ℤ` and *tame part* `ψ = (ψ_v)` (characters of the residue fields, almost all trivial) if
`μ(u) = ∏_w u_w^{e(w)}·∏_v ψ_v(u mod v)` for every `u` with integral finite part. Its *base change* is the unitary Hecke
character `y ↦ μ(y/ȳ)` of `E`. Prove:

(a) `y ↦ y/ȳ` maps the ideles of `E` onto `U(1)(𝔸_E)`; base change is injective; the finite part of every point of
`U(1)(𝔸_E)` is `y/ȳ` for a finite idele `y`.

(b) The class group `U(1)(𝔸_E)/(rational points · U(1)_S)` is finite, and for `S = ∅` its order divides `h_E`.

(c) *Existence.* If `ψ` is trivial outside a finite set `S` and `∏_w Φ_w(u)^{e(w)}·∏_{v∈S} ψ_v(u mod v) = 1` for every
integer `u` of `E` with `u ū = 1`, there is a character of weight `e` and tame part `ψ`.

(d) The characters of weight `0` with tame part trivial outside `S` are exactly the characters of the class group of
level `S`; they are finitely many and take roots of unity as values; for every `e` and `ψ` there are finitely many
characters of weight `e` and tame part `ψ`. The product of characters of weights `e`, `e′` and tame parts `ψ`, `ψ′`
has weight `e + e′` and tame part `ψψ′`.

(e) For `u` with archimedean part `1` there are `n > 0` and `γ ∈ E`, `γγ̄ = 1`, with `u^n γ` a unit at every finite place and
`μ(u)^n = ∏_w Φ_w(γ)^{e(w)}`. For an automorphism `σ` of `ℂ` with `σ∘Φ_w = Φ_{π(w)}` for a permutation `π`, some character
has weight `e∘π⁻¹`, tame part `σ∘ψ` and agrees with `σ∘μ` on the points with archimedean part `1`.

ThetaChainsOnDefiniteUnitaryGroups §2.4 (a) with `n_η = 0`, for `E/E⁺` unramified at every finite place, gives an
existence criterion for the base changes of these characters with prescribed units at split places; (c) is the form
the route uses, for every CM field and all tame parts.

*Needs:* 1.5, 2.4.

[ShortProof], `Lib/ClassField/HeckeCharacter/Basic` (`New.AutChar`, `New.HeckeChar`, `New.AutChar.baseChange`,
`New.AutChar.HasWeight`, `New.rationalU1`, `New.integralU1`, `New.divStar_surjective`,
`New.exists_snd_div_divStar_finIdeleIncl_eq_one`, `New.AutChar.baseChange_injective`, `New.finite_u1_classGroup`,
`New.card_u1_classGroup_dvd_classNumber`, `New.AutChar.exists_hasWeight_of_prod_eq_one`, `New.AutChar.tameChars`,
`New.AutChar.exists_mem_tameChars`, `New.AutChar.exists_classGroup_char_eq_of_hasWeight_zero`,
`New.AutChar.finite_tameChars`, `New.AutChar.finite_setOf_hasWeight`, `New.AutChar.HasWeight.isOfFinOrder_apply`,
`New.AutChar.HasWeight.mul`, `New.AutChar.HasWeight.exists_pow_eq_prod`, `New.AutChar.HasWeight.exists_conj`)

### 7.2 Splitting characters: existence and restriction to the real subfield

*Origin:* adapted from the theory of Hecke characters of type `A₀` (Weil (1956); Raghuram, arXiv:2207.03399, §4):
Hecke characters of a CM field with prescribed restriction to the ideles of the totally real subfield and prescribed
infinity type; here the everywhere unramified character of weight one extending the quadratic character, under a
condition on roots of unity.

*Method of the formal proof:* for (a), the character is prescribed as `∏_w x_w/|x_w|` on the ideles whose finite
part is a unit and as `1` on the products `y·b·b̄` (`y ∈ E^×`, `b` an idele); the two prescriptions agree where both
apply because of the hypothesis on roots of unity and because an `a = ā` with `a·z·z̄ = 1` for a finite idele `z` has
`∏_w Φ_w(a) > 0`, and the result extends to all ideles since the circle group is divisible. For (b), class field theory
for `E/E⁺` decides which ideles fixed by conjugation have the form `a·z·z̄` with `a = ā`, and the values of `υ` and `η`
are compared through the signs at the infinite places. The formal proof reads this class field theory on finite ideles
through 2.2 and 2.3, and uses it only for the quadratic layer `E/E⁺`, which ClassFieldTheory gives on full ideles. By
its §11.1 the ideles of `E⁺` of the form `a·z·z̄` are the kernel of the global Artin map of `E/E⁺`, of index `2`
(§12.1, `card_ideleClassNormQuotient`), so `η` is a character; `υ` is trivial on that kernel and is `−1` on an idele of
`E⁺` with finite part `1` and one negative component, hence equals `η` there. At a finite place `w = w̄` the place of
`E⁺` below `w` does not split in `E`, so by local reciprocity (§6.1) and the local components of the global Artin map
(`globalArtinMap_local`) some element of its completion, placed at `w`, has `η = −1`. The sign in (a) holds because
the idele of `E⁺` with the components of `a` at the infinite places and `1` at the finite ones lies in that kernel, so
that its symbol, the product of the archimedean symbols of §10.1 (complex conjugation where `a` is negative), is
trivial and `a` is negative at an even number of places.

A *splitting character* of `E` is as in WeilRepresentationsOnBanachSpacesOfData §3.1, for any CM field `E`: a unitary
Hecke character `υ` with `υ(x̄) = υ(x)⁻¹` that equals `∏_w x_w/|x_w|` on the ideles whose finite part is a unit of `Ô_E`.
The quadratic idele character `η` of `E/E⁺` is `1` on the ideles `a·z·z̄` (`a ∈ E^×` with `a = ā`, `z` an idele) and `−1`
on the other ideles fixed by conjugation.

(a) *Existence.* If `E` contains a primitive `5040`-th root of unity and every root of unity `y ∈ E` is `δ/δ̄` for a unit
`δ` of `𝒪_E` with `∏_w Φ_w(δ) = 1`, then `E` has a splitting character.

(b) *Restriction.* For a splitting character `υ`: `υ(y) = η(y)` for every idele `y` fixed by conjugation (the ideles of
`E⁺`); `υ(ι_w(ϖ)) = −1` for every uniformiser `ϖ` at a finite place `w = w̄`; for each finite place `w = w̄` there is a
finite idele with components `1` outside `w`, fixed by conjugation, on which `η = −1`.

ThetaChainsOnDefiniteUnitaryGroups §2.4 (a) with `n_η = 1` also gives (a), through its condition `(★)`, which the
hypothesis of (a) implies: every `x` with `(x) = 𝔞_x𝒪_E` is then a unit `δ` times an element of `E⁺`, where `(★)` is the
product formula. Its hypothesis that `E/E⁺` is unramified at every finite place holds here, since `E` contains a
primitive `5040`-th root of unity.

*Needs:* 1.5, 7.1; ClassFieldTheory §§6.1, 7.1, 10.1, 11.1, 12.1 (class field theory of `E/E⁺` on full ideles: local
reciprocity, the absolute local Artin map in which §11.1 states the local components, archimedean symbols, global
reciprocity with its local components, norm index `2`); AdelicUnitaryGroupsAndAlgebraicModularForms §3.4 (a) (under
the 5040 condition, a unit of `Ô_E` fixed by conjugation is `t̄t` for a unit `t`);
WeilRepresentationsOnBanachSpacesOfData §3.1 (splitting characters).

[ShortProof], `Lib/ClassField/Global/CMSplittingCharacters` (`New.Cohomology.IsRealTimesNorm`,
`New.Cohomology.quadraticIdeleChar`, `New.Cohomology.upsilon_eq_quadraticIdeleChar`,
`New.Cohomology.upsilon_locFullIdele_eq_neg_one_of_star_eq`, `New.Cohomology.upsilon_atUniformizer_eq_neg_one`,
`New.Cohomology.υ_star_eq_inv_and_apply_eq`, `New.Cohomology.exists_quadraticIdeleChar_eq_neg_one`,
`New.nonempty_splittingChar`); `Lib/Weil/Construction/WeilData` (`New.SplittingChar`)

### 7.3 Base change from `U(1)` and splitting characters of rank `k`

*Origin:* this roadmap's own formulation: the parametrisation of the splitting characters of rank `k`, relative to one
splitting character, by characters of `[U(1)]`, through Hilbert's Theorem 90; the splitting condition is that of
Harris, Kudla and Sweet (1996), §1.

*Method of the formal proof:* a Hecke character trivial on the ideles fixed by conjugation factors through `y ↦ y/ȳ`,
which is onto the norm-one ideles with kernel the ideles fixed by conjugation; only the fact that `υ` has order at
most two on those ideles is used.

Let `υ` be a fixed splitting character of `E` (7.2). For a character `ν` of `[U(1)]` and `k ∈ ℤ`, let
`ν_k(y) = ν(y/ȳ)·υ(y)^{−k}`. A Hecke character `χ` is *splitting of rank `k`* if it agrees with `υ^k` on the ideles fixed by
conjugation.

(a) A unitary Hecke character is a base change `y ↦ ν(y/ȳ)` if and only if it is trivial on the ideles fixed by
conjugation.

(b) `χ` is splitting of rank `k` if and only if `χ = ν_k` for exactly one character `ν` of `[U(1)]`.

(c) `(νν′)_{k+l} = ν_k ν′_l`; `(ν⁻¹υ_1^k)_k = (ν_k)⁻¹`, `υ_1` the restriction of `υ` to `U(1)(𝔸_E)`; `(ν υ_1^l)_{k+2l} = ν_k`;
for signs `s ∈ {±1}^n` with `n_±` signs `±1`, `(υ_1^{n_−})_n = υ^{−(n_+ − n_−)}`; and `(ν υ_1^{⌊n/2⌋})_n` is the base change
of `ν` for `n` even and the base change times `υ⁻¹` for `n` odd.

The formal proof proves the case in which `E` carries Weil data (6.2), `υ` is the splitting character of the data,
and `k, l ≥ 0`.

BaseChangeAndGaloisRepresentationsForUnitaryGroups §6.3a states the existence of splitting characters for every
quadratic extension; it does not state the parametrisation (b).

*Needs:* 7.1, 7.2.

[ShortProof], `Lib/ClassField/HeckeCharacter/SplittingCharacters` (`New.HeckeChar.exists_baseChange_eq`,
`New.HeckeChar.exists_baseChange_iff`, `New.HeckeChar.IsSplitting`, `New.HeckeChar.isSplitting_iff`,
`New.HeckeChar.IsSplitting.autChar`, `New.AutChar.spaceChar_mul`, `New.AutChar.spaceChar_inv_mul_upsilonU1_pow`,
`New.AutChar.spaceChar_add_two_mul`, `New.AutChar.spaceChar_stdChar`, `New.AutChar.spaceChar_rankTwist_eq_ite`,
`New.AutChar.inv_spaceChar_rankTwist_inv`)

### 7.4 Galois characters coming from the norm-one torus

*Origin:* adapted from global class field theory (Milne (2020); Tate (1967)), for a CM field: here three properties of
a Galois character whose value at the Artin symbol of `x` is a character of `x/x̄`.

*Method of the formal proof:* the facts listed after (c) come first, from the definitions of 1.1 and the formula for
`Art_E` in 2.2. Then (a) is `η(x̄/x) = η(x/x̄)⁻¹`, and (b), (c) follow from 2.2 (d), because `η(x/x̄) = 1` when `x` is
supported at a place of `S`, or is a unit supported at a place outside `I ∪ Ī`.

Let `S`, `I` be sets of finite places of `E` and `χ : G_E → C` a homomorphism to an abelian group that comes from `U(1)`
for `S`, `I` as in GaloisRepresentationsOfUnitaryEigenforms §9.2 (`χ(Art_E(x)) = η(x/x̄)` for a suitable character `η` of
the finite ideles). Then:

(a) `χ((g^c)⁻¹) = χ(g)` for every `g`;

(b) `χ(D_A) = 1` for every place `A` above a place of `S`;

(c) `χ` is trivial on inertia above every place outside `I ∪ Ī`.

Also: `Art_E(x̄)` is the class of `g^c` if `Art_E(x)` is that of `g`; `A ↦ cA` maps places above `v` to places above `v̄`
and Frobenius elements at `A` to their conjugates at `cA`; `g ∈ I_A` if and only if `g^c ∈ I_{cA}`; `χ_ℓ(g^c) = χ_ℓ(g)`.

*Needs:* 2.1, 2.2; GaloisRepresentationsOfUnitaryEigenforms §9.2 (characters coming from `U(1)`).

[ShortProof], `Lib/ClassField/Global/CMSplittingCharacters` (`New.artinMap_star`, `New.conjPlace`,
`New.IsPlaceOver.conjPlace_star`, `New.IsFrob.conjPlace_conjGal`, `New.conjGal_mem_inertiaGroup_iff`,
`New.cyclotomicChar_conjGal`, `New.IsFromU1.apply_idOrConjInv`, `New.IsFromU1.eq_one_of_mem_decompGroup`,
`New.IsFromU1.eq_one_of_mem_inertiaAbove`); `Lib/GaloisRep/Main/SelmerModules` (`New.IsFromU1`)

### 7.5 Values of algebraic Hecke characters

*Origin:* adapted from Weil (1956), the values of algebraic Hecke characters (of type `A₀`): here the power relation
with an element of the field, the absolute values at every conjugate and every `p`-adic embedding, and conjugate
characters.

*Method of the formal proof:* by 1.5 (c) the subgroup `K^×·(ker θ ∩ Ô_K^×)` is open of finite index, so some power
`y^N` lies in it, which gives (a); the absolute values in (b), (d) and (e) then follow from the product formula for
the element `γ` of (a).

An *algebraic Hecke character* of a number field `K` is a pair `(θ, n)` of a character `θ` of the finite ideles with open
kernel and an integer `n_τ` for each embedding `τ : K → ℂ`, with `θ(x) = ∏_τ τ(x)^{−n_τ}` for every `x ∈ K^×`.

(a) For every finite idele `y` there are `N ≥ 1` and `γ ∈ K^×` with `y^N/γ` a unit at every finite place and
`θ(y)^N = ∏_τ τ(γ)^{−n_τ}`; so `θ(y)` is algebraic.

(b) For `ι : ℂ → ℂ_p`, `|ι(θ(y))| = ∏_τ |y_{v(ι∘τ)}|^{−n_τ}`, where `y_{v(ι∘τ)}` is the component of `y` at the prime induced
by `ι∘τ`, read through 1.2 (e).

(c) For every automorphism `σ` of `ℂ`, `σ∘θ` is again an algebraic Hecke character, with exponents `n_{σ⁻¹∘τ}`.

(d) If `K` is a CM field and `n_τ + n_τ̄ = j` for all `τ`, then `|σ(θ(y))| = |y|^{j/2}` for every automorphism `σ` of `ℂ`.

(e) For `E` CM and a character `μ` of `U(1)` of weight `e` (7.1), the base change `y ↦ μ(y/ȳ)` on finite ideles is algebraic
with exponent `e(w)` at `Φ_w` and `−e(w)` at `Φ̄_w`; at a point `u` of `U(1)(𝔸_E)` with archimedean part `1`, `μ(u)` is its
value at a finite idele `y` with finite part of `u` equal to `y/ȳ`; so `|σ(μ(u))| = 1` for every `σ` and
`|ι(μ(u))| = ∏_w |u_{w,ι}|^{−e(w)}`, where `u_{w,ι}` is the image of the finite part of `u` under the extension
`(ι∘Φ_w)_𝔸` of `ι∘Φ_w` to finite adeles (1.2 (e)). For a splitting character `υ`, `x ↦ υ(x)|x|^{−1/2}` on finite ideles
is algebraic with exponents `0` on `Φ` and `−1` on `Φ̄`; for every finite idele `x` there are `n ≥ 1` and `y ∈ E^×` with
the valuations of `x^n` such that `(υ(x)|x|^{−1/2})^n = ∏_w Φ_w(ȳ)`. The formal proof proves the statement on `υ` for
the splitting character of Weil data on `E` (6.2).

The library has algebraicity of the values on ideals and the complex absolute value for its type `A₀` characters
(`TauCeti.GlobalNumberFields.HeckeCharacter.IsAlgebraic.isAlgebraic_idealCharacter`,
`TauCeti.GlobalNumberFields.HeckeCharacter.IsAlgebraic.exists_weight_norm_apply`); (a)–(c) and (d) at every conjugate are
not in it.

*Needs:* 1.2, 1.5, 7.1, 7.2.

[ShortProof], `Lib/ClassField/Local/ArtinMap` (`New.algHeckeChars`, `New.AlgHeckeChar`);
`Lib/ClassField/HeckeCharacter/AlgebraicValues` (`New.AlgHeckeChar.exists_pow_eq_prod`,
`New.AlgHeckeChar.norm_padic_eq_prod`, `New.AlgHeckeChar.norm_padic_eq_one`, `New.AlgHeckeChar.conjugateBy`,
`New.AlgHeckeChar.norm_map_eq_sqrt_finIdeleAbs_zpow`, `New.IsHeckeOfType.toAlgebraic`,
`New.AutChar.HasWeight.baseChangeAlgebraic`, `New.AutChar.HasWeight.exists_baseChangeAlgebraic_apply_eq`,
`New.AutChar.HasWeight.norm_map_eq_one`, `New.AutChar.HasWeight.norm_padic_eq_prod`, `New.WeilData.chiFinAlgebraic`,
`New.WeilData.exists_chiFin_pow_eq_prod`, `New.WeilData.norm_map_chiFin`)

### 7.6 Characters of `U(1)` tamely ramified at split places, on determinants and for a modulus

*Origin:* particular to this proof: the local values of characters of `U(1)` of given weight and tame part at split and
non-split places, the characters tamely ramified on a set of places disjoint from its conjugate, and their values on
determinants of the stabiliser of the standard lattice.

*Method of the formal proof:* (a) and the values on determinants in (d) evaluate the defining formula of 7.1 at
integral points, and (b) follows from the defining properties of a splitting character (7.2). The surjectivity in
(d) uses only that the places dividing `𝔪` are split (`𝔪` is prime to `𝔪̄`): at each of them an integral lift of the
residue matrix is carried into `K₀` by the map `ι_w` of AdelicUnitaryGroupsAndAlgebraicModularForms §3.1, and the
product of these elements is the required lift.

Let `μ` have weight `e` and tame part `ψ` (7.1).

(a) For a finite place `w` with `ψ_{w̄} = 1` and `x ∈ E_w^×` (a unit if `w` is split), the base change of `μ` at `ι_w(x)` is
`ψ_w` of the residue of the finite part of `x/x̄`; for `w` split and `x` a unit it is `ψ_w(x mod w)`; for `w = w̄` with
`ψ_w = 1` it is trivial on `ι_w(E_w^×)`. If `ψ_w = ψ_{w̄} = 1`, the base change is unramified at `w` and takes inverse values at
the chosen uniformisers at `w` and `w̄`.

(b) For a splitting character `υ`, its restriction `υ_1` to `U(1)(𝔸_E)` has weight `1` and trivial tame part, and the base
change of `υ_1` is `υ²`; `μυ_1^n` has weight `e + n`.

(c) A *split tame character* of weight `e` is a character of `[U(1)]` of weight `e` with `e(w) > 0` for all `w`, whose tame
part is nontrivial exactly on a nonempty finite set `S` of places with `S ∩ S̄ = ∅`.

(d) Let `K₀ ⊂ GL_n(𝔸_{E,f})` be the stabiliser of the standard lattice in the finite adelic unitary group of a standard
hermitian space (AdelicUnitaryGroupsAndAlgebraicModularForms §3.1). For `k ∈ K₀`, `μ(det k) = ∏_i ψ_{w_i}(det(k mod w_i))` if `ψ`
is trivial outside the distinct places `w_i`; `υ_1(det k) = 1`. For a modulus `𝔪` (an ideal of `𝒪_E` prime to its
conjugate), reduction `K₀ → GL_n(𝒪_E/𝔪)` is onto, with lifts supported at the places dividing `𝔪𝔪̄`. A character `ν`
of `[U(1)]` is *tame for `𝔪`* with weight `d` and character `χ` of `(𝒪_E/𝔪)^×` if `𝔪 ≠ (1)`, `ν` has weight `d` and a
tame part `ψ′` that is nontrivial exactly at the primes dividing `𝔪`, and `χ(x) = ∏_{w | 𝔪} ψ′_w(x mod w)`. Then
`ν(det k) = χ(det(k mod 𝔪))` for `k ∈ K₀`; `ν⁻¹` is tame for `𝔪` with weight `−d` and character `χ⁻¹`; and `νν′` is
tame for `𝔪` with weight `d + d′` and character `χ` for every character `ν′` of `[U(1)]` of weight `d′` with trivial
tame part.

The formal proof proves (b), and `υ_1(det k) = 1` in (d), for the splitting character of Weil data on `E` (6.2).

*Needs:* 7.1, 7.2; AdelicUnitaryGroupsAndAlgebraicModularForms §3.1 (`G_f` and its level `K₀`).

[ShortProof], `Lib/ClassField/HeckeCharacter/SplitTameCharacters` (`New.AutChar.HasWeight.exists_baseChange_finPart_locIdele`,
`New.AutChar.HasWeight.baseChange_finPart_locIdele`, `New.AutChar.HasWeight.baseChange_finPart_locIdele_eq_one`,
`New.WeilData.upsilonU1_hasWeight`, `New.WeilData.baseChange_upsilonU1`, `New.Exchange.SplitTameChar`);
`Lib/ClassField/Avatar/HeckeBaseChange` (`New.AutChar.HasWeight.charUnramifiedAt`, `New.AutChar.HasWeight.atUniformizer_star`);
`Lib/ClassField/HeckeCharacter/TameModulus` (`New.AutChar.HasWeight.apply_det_eq_prod`,
`New.Exchange.upsilonU1_detFin_eq_one_of_mem_stdLevel`, `New.Rows.exists_reductionGL_eq`, `New.Rows.reductionGL_surjective`,
`New.Modulus.charOfTamePart`, `New.Exchange.IsTameFor`, `New.Exchange.IsTameFor.apply_det`,
`New.Exchange.SplitTameChar.character_detFin_eq_of_mem_stdLevel`)

## Layer 8: Hecke `L`-functions on the real line

The route needs Hecke `L`-functions only for real `s ≥ 1`: continuity, analyticity at `s = 1`, non-vanishing for
characters with `ψ² ≠ 1`, and the mean of the values at primes of degree one. In the shorter proof the continuation to
a neighbourhood of `1` uses only the finite places of Tate's integral (8.2) and the estimate of 8.3; Poisson summation
does not occur.

### 8.1 Euler products over primes and densities at primes of degree one

*Origin:* adapted from the theory of Euler products and Dirichlet densities of primes (Tate (1950); Milne (2020)):
here for real `s > 1`, with coefficients of modulus at most one, and with densities measured at the primes of degree
one up to a bounded term.

*Method of the formal proof:* `log P(a, s)` and `∑_{q_v prime} a_v q_v^{−s}` differ by the terms of order at least two
of the logarithms and by the terms at the places whose norm is not prime, and these are bounded in terms of `[K : ℚ]`;
this gives (a) for `s ≥ 2`, and (b) because a factor `(s − 1)^l` contributes `−l·log(1/(s − 1))` to the logarithm.

Let `K` be a number field and `a` a function on the finite places with `|a_v| ≤ 1`. For real `s > 1` put
`P(a, s) = ∏_v (1 − a_v q_v^{−s})^{−1}`, and at `s = 1` its limit from the right when it exists. For a character `ψ` of the
finite ideles and a set `S` of places, `a_v = ψ(ι_v(ϖ_v))` for `v ∉ S` and `0` for `v ∈ S` gives `L^S(s, ψ)`, the partial
`L`-function when `S` contains the places where `ψ` ramifies. `a` has *prime density `l`* if for real `s → 1⁺` the series
`∑_{q_v prime} a_v q_v^{−s}` converges and equals `l·log(1/(s − 1)) + O(1)`.

(a) For `s > 1` the product converges to `P(a, s)`, is nonzero, and for `s ≥ 2` satisfies `|log|P(a, s)|| ≤ C` with `C`
depending only on `K`; removing finitely many factors multiplies it by their inverses. For a completely multiplicative
function `χ` on the ideals of `𝒪_K` with `|χ| ≤ 1`, `P(χ(v), s) = ∑_{𝔞} χ(𝔞)N(𝔞)^{−s}`.

(b) If `P(a, s)·(s − 1)^{−l}` tends to a nonzero limit as `s → 1⁺` for some integer `l`, then `a` has prime density `−l`.

(c) Densities are linear and monotone in real parts; constants `c` have density `c`; infinitely many places have prime
norm; for a finite extension `L/K` and `c ∈ ℂ`, `v ↦ c·#{w | v : q_w = q_v}` (places of `L` of relative degree one above `v`)
has density `c`.

*Needs:* Mathlib `NumberField.dedekindZeta`, `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT`,
`NumberField.dedekindZeta_residue_ne_zero` (the pole gives summability).

[ShortProof], `Lib/ClassField/HeckeL/EulerProduct` (`New.IsHeckeOfType`, `New.CharUnramifiedAt`, `New.heckeCoeff`,
`New.eulerProd`, `New.HasPrimeDensity`, `New.eulerProd_eq_exp`, `New.hasProd_eulerProd`, `New.eulerProd_erase`,
`New.eulerProd_ne_zero_and_abs_log_norm_le`, `New.hasSum_eulerProd`, `New.hasPrimeDensity_of_tendsto`,
`New.HasPrimeDensity.sum`, `New.HasPrimeDensity.re_le_re`, `New.hasPrimeDensity_const`, `New.frequently_prime_q`,
`New.hasPrimeDensity_card_degree_one`)

### 8.2 The finite Tate integral

*Origin:* adapted from Tate's zeta integrals (Tate (1950), §4.4–4.5): here only the finite places, for a function of
the finite ideles determined at `S` and equal on the unit ideles to an indicator times `ψ⁻¹`.

*Method of the formal proof:* Tate's computation, at the finite places only: the integral is unfolded over the fibres
of the divisor map of 1.5 (a), and the Dirichlet series that results is identified with `L^S(s, ψ)` by the last
statement of 8.1 (a).

Let `ψ` be a character of the finite ideles of `K` with open kernel and `ψ(x)∏_w (Φ_w(x)/|Φ_w(x)|)^{n_w} = 1` on `K^×`, for
integers `n_w`, where `Φ_w : K → ℂ` is a chosen embedding inducing the infinite place `w` (a Hecke character *of type
`n`*); `|ψ| = 1`. Let `μ` be a Haar measure on the finite ideles, `V ∋ 1` open,
`S` a set of places, and `f` a function on the finite ideles that vanishes unless `x` is integral outside `S` and a unit at
`S`, with `f(u)ψ(u) = 1_V(u)` on the unit ideles, and whose value on integral ideles depends only on the components at
`S`. Then `μ(Ô^× ∩ V) ≠ 0`, and for real `s > 1` the function `f(x)ψ(x)|x|^s` is integrable with integral
`L^S(s, ψ)·μ(Ô^× ∩ V)`.

*Needs:* 1.5, 8.1.

[ShortProof], `Lib/ClassField/HeckeL/ContinuationAtOne` (`New.IsHeckeOfType.integral_mul_finIdeleAbs_rpow_eq_eulerProd_mul`,
`New.IsHeckeOfType.tate_integral`, `New.IsHeckeOfType.norm_eq_one`, `New.IsHeckeOfType.norm_heckeCoeff_le`,
`New.IsHeckeOfType.exists_monoidHom_asIdeal_eq_heckeCoeff`)

### 8.3 Idelic theta sums as Riemann sums

*Origin:* particular to this proof: the theta sum of an adelic tent over a coset of the principal ideles depends, up to
an error that is a power of the module times a larger theta sum, only on the module of the idele.

*Method of the formal proof:* `Θ_r(b)` weights the points of `K` lying in a box of the adeles whose volume depends only
on the module of `b`, so it approximates an integral that depends on the module alone; the boundary terms of the sum at
radius `r/3` are bounded by the sum at radius `r`.

Ideles are pairs of a unit of `K ⊗ ℝ` and a finite idele; the principal ideles are the diagonal image of `K^×`, a
discrete subgroup; the *module* of an idele is `|N_{K⊗ℝ/ℝ}(x_∞)|·|x_f|`. For a finite idele `d` and `r > 0` the *tent* is
`max(r − dist(x_∞, 1), 0)` if `d(x_f − 1) ∈ Ô_K` and `0` otherwise; the *theta sum* `Θ_r(b)` is the sum of the tent over the
coset of `b` modulo the principal ideles. For `0 < r < 1` there are `δ > 0` and `C > 0` such that for every `l > 0` some real
`i` satisfies `|i − Θ_{r/3}(b)| ≤ C·l^δ·Θ_r(b)` for every idele `b` of module `l`.

*Needs:* 1.5; Mathlib `NumberField.mixedEmbedding`, `NumberField.mixedEmbedding.mixedSpace` (with its Haar measure
`volume`).

[ShortProof], `Lib/ClassField/HeckeL/IdelicThetaSum` (`New.ZetaIntegral.principalIdeles`, `New.ZetaIntegral.ideleModule`,
`New.ZetaIntegral.adelicTent`, `New.ZetaIntegral.thetaSum`, `New.ZetaIntegral.exists_abs_sub_thetaSum_le_mul_rpow`,
`New.ZetaIntegral.exists_abs_sub_thetaSum_le`, `New.ZetaIntegral.discreteTopology_principalIdeles`)

### 8.4 Continuation to `s = 1`, non-vanishing and prime densities

*Origin:* adapted from the theory of Hecke `L`-functions (Tate (1950); Milne (2020), VI 4.8–4.9, for characters of
finite order; Lang, *Algebraic Number Theory*, for the non-vanishing; Titchmarsh, §2.11, for a continuation by a
Riemann sum over `ℚ`): here for real `s` only, with an analytic continuation near `1` when the character is
nontrivial with integral angular exponents, non-vanishing when `ψ² ≠ 1`, and densities over the primes of degree one.

*Method of the formal proof:* Tate's integral (8.2) of `ψ` against a tent is unfolded over the principal ideles; the
Riemann-sum estimate (8.3) shows that the remaining integral over the module is analytic at `s = 1` when `ψ ≠ 1`; the
density is the order of vanishing at `1` (8.1 (b)); for `ψ² ≠ 1` the inequality `3 + 4cos θ + cos 2θ ≥ 0` between the
densities of `1`, `ψ`, `ψ²` excludes a zero.

Let `ψ ≠ 1` be a Hecke character of type `n` (8.2) of a number field `K`, and `S` a finite set of finite places. Then:

(a) some function `F` of a real variable, analytic at `1`, equals `L^S(s, ψ)` for all real `s > 1` near `1`;

(b) `L^S(s, ψ)` is continuous on `[1, ∞)`, and for some `m ∈ ℕ` the values `ψ(ϖ_v)`, `v ∉ S`, have prime density `−m`; if
`m = 0`, `L^S(s, ψ) ≠ 0` for all real `s ≥ 1`;

(c) if `ψ² ≠ 1`, `L^S(s, ψ) ≠ 0` for all real `s ≥ 1`;

(d) if `K` is CM and `n ≠ 0` then `ψ ≠ 1`; `ψ^d` is of type `d·n`.

LFunctions §6.9 (continuation of the `L`-function of an algebraic Hecke character to the plane) with §7.3
(non-vanishing on `Re s = 1`) and §7.5 implies (a)–(c) for the characters it covers, the unitary parts of algebraic
Hecke characters that are not norm twists; the route needs only the real half-line.

*Needs:* 8.1, 8.2, 8.3.

[ShortProof], `Lib/ClassField/HeckeL/ContinuationAtOne` (`New.IsHeckeOfType.exists_analyticAt_one_eulerProd`,
`New.IsHeckeOfType.continuousOn_eulerProd`, `New.IsHeckeOfType.exists_hasPrimeDensity_neg_natCast`,
`New.IsHeckeOfType.exists_hasPrimeDensity`, `New.IsHeckeOfType.eulerProd_ne_zero`, `New.IsHeckeOfType.ne_one`,
`New.IsHeckeOfType.pow`, `New.IsHeckeOfType.exists_level_tate_integral`)

### 8.5 `L`-functions and algebraic characters of base changes from `U(1)`

*Origin:* adapted from the theory of Hecke characters of CM fields (Weil (1956); for the `L`-functions, the works
cited in 8.4): here non-vanishing on `[1, ∞)` of the `L`-functions of base changes of characters of `U(1)` of nonzero
weight, their symmetry under inversion, and the algebraic characters made from them.

*Method of the formal proof:* a base change of nonzero weight has angular exponents `2e ≠ 0`, so its square is
nontrivial and 8.4 (c) applies; inversion exchanges the factors at `v` and `v̄`, which are paired in the product.

Let `μ` be a character of `[U(1)]` of weight `e` and tame part `ψ` (7.1), and `L_μ^S(s)` the Euler product of its base change
without the factors at `S ∪ S̄`.

(a) If `e ≠ 0` and `S` is finite, `L_μ^S(s) ≠ 0` for every real `s ≥ 1`.

(b) If `ψ_v = 1` for every `v ∉ S`, then `L_{μ⁻¹}^S = L_μ^S`; in particular `|L^S(s, ν)| = |L^S(s, ν⁻¹)|`.

(c) With a splitting character `υ`: at an idele with finite part `1`, `μ(y/ȳ)υ(y)^{−r} = ∏_w (y_w/|y_w|)^{2e(w)−r}`; for
integers `k, j`, `x ↦ μ(x/x̄)υ(x)^{−k}|x|^{j−k/2}` on finite ideles is an algebraic Hecke character with exponent `j + e(w) − k`
at `Φ_w` and `j − e(w)` at `Φ̄_w`, unramified at `w` if `ψ_w = ψ_{w̄} = 1`; `υ` is unramified everywhere.

The formal proof proves the first two statements of (c) for the splitting character of Weil data on `E` (6.2).

*Needs:* 7.1, 7.2, 7.5, 8.1, 8.4.

[ShortProof], `Lib/ClassField/Avatar/HeckeBaseChange` (`New.AutChar.L`, `New.AutChar.HasWeight.L_ne_zero`,
`New.AutChar.HasWeight.L_inv`, `New.AutChar.HasWeight.baseChange_mul_upsilon_zpow_inv_apply`,
`New.AutChar.HasWeight.spaceChar_apply_of_snd_eq_one`, `New.AutChar.HasWeight.toAlgebraic`,
`New.AutChar.HasWeight.charUnramifiedAt_toAlgebraic`, `New.WeilData.charUnramifiedAt_upsilon`)

## Layer 9: `ℓ`-adic avatars

The Galois representations of the route are twisted by the `ℓ`-adic characters attached to algebraic Hecke
characters. Finite type, Hodge–Tate jumps and killing polynomials of an `ℓ`-adic representation at a place of `Ω` are
those of GaloisRepresentationsOfUnitaryEigenforms §1.3.

### 9.1 The `ℓ`-adic avatar and its local behaviour

*Origin:* (a) adapted from the theory of `ℓ`-adic characters attached to algebraic Hecke characters (Serre (1968),
II–III): here for a totally complex field, through the Artin map on finite ideles, with the restriction to a CM
extension; (b) particular to this proof: an eigenform of rank one of any weight, spherical at a given split place, from
which GaloisRepresentationsOfUnitaryEigenforms §6.4 (e) obtains the local behaviour of the avatar.

*Method of the formal proof:* (a) is the existence theorem 2.3 (c) applied to the character
`x ↦ ι(θ(x))·∏_τ (ι∘τ)_𝔸(x)^{n_τ}` of the finite ideles, which is continuous and trivial on `K^×`. For its last
statement, both sides are continuous characters of `G_L`; at a Frobenius element of a place of `L` prime to `ℓ` both
are `ι` of the value of `θ` at the same local idele, by the formula of (a) and the compatibility of local Artin maps with
norms (2.1), and these elements are dense (GaloisRepresentationsOfUnitaryEigenforms §1.2 (b), (d)). For (b), take the
forms of weight `κ` fixed by the integral elements congruent to `1` modulo one auxiliary place `v ∉ {w, w̄}` with
`q_v > 2^{[E:ℚ]}`: at this level the classes have trivial stabilisers, so these forms make up a nonzero space of finite
dimension, which the Hecke operators at the split places away from `v` keep and which is spanned by their eigenforms
(AdelicUnitaryGroupsAndAlgebraicModularForms §6.3 (d)); any one of them will do.

Let `K` be a totally complex number field, `ℓ` a prime and `ι : ℂ ≅ ℚ̄_ℓ` fixed.

(a) *Existence.* There is a homomorphism `θ ↦ r_θ` from the algebraic Hecke characters of `K` (7.5) to the continuous
characters `G_K → ℚ̄_ℓ^×` with `r_θ(g) = ι(θ(x))·∏_τ (ι∘τ)_𝔸(x)^{n_τ}` whenever the class of `g` is `Art_K(x)`, where `(ι∘τ)_𝔸`
is the extension of `ι∘τ` to finite adeles (1.2 (e)). For every number field `L ⊃ K`, the base change `θ∘N_{L/K}`
(`N_{L/K}` the norm from the finite ideles of `L` to those of `K`), with the exponent `n_{τ|K}` at each embedding
`τ : L → ℂ`, is an algebraic Hecke character of `L`; this holds for every number field `K`, totally complex or not.
For a CM field `L ⊃ K`, the avatar of `θ∘N_{L/K}` is the restriction of `r_θ` to `G_L`.

(b) For `E` a CM field containing a primitive `5040`-th root of unity, every split place `w` of `E` and every weight,
there is an eigenform of that weight on the definite unitary group of rank one, spherical at `w`.

AutomorphicGaloisRepresentationsPartII, Layer AG2.0 (the `l`-adic character of an algebraic Hecke character), gives,
for every number field, the character of the first statement of (a) with its local components away from `ℓ` and its
Hodge–Tate numbers; it states neither the restriction to `G_L` in (a) nor potential crystallinity and the action of
inertia and Frobenius on the periods above `ℓ`.

The local behaviour of `r_θ` at every finite place, those above `ℓ` included (for the crystalline case, after Conrad,
*Lifting global representations with local properties*, App. B), is stated for CM fields containing a primitive
`5040`-th root of unity in GaloisRepresentationsOfUnitaryEigenforms §6.4 (e): its proof uses the Galois representations
of rank one of that roadmap, which themselves use (a).

*Needs:* 1.2, 2.1, 2.2, 2.3, 7.5; GaloisRepresentationsOfUnitaryEigenforms §§1.1, 1.2 (eigenforms and Hecke
polynomials; density of most Frobenii); AdelicUnitaryGroupsAndAlgebraicModularForms §§3.9, 6.1, 6.3 (congruence levels;
algebraic forms; Hecke eigenforms); WeilRepresentationsOnBanachSpacesOfData §9.2 (the Hecke operators at split places
keep the forms of a level); ShortGRH background (for a CM field `E` with at least two infinite places, distinct finite
places `w_i` with `∏_i q_{w_i} > (2n)^{[E:ℚ]}` and a subgroup `K` of the integral elements of the finite adelic unitary
group `G_f(n)` congruent to `1` modulo every `w_i`, the rational points of the standard definite unitary group of rank
`n` meet every `gKg⁻¹`, `g ∈ G_f(n)`, only in `1`; [ShortProof] `Lib/Shimura/HeckeTower/HeckeData`
(`New.Variety.classAut_eq_bot`)).

[ShortProof], `Lib/PadicHodge/Characters` (`New.exists_avatar`, `New.AlgHeckeChar.avatar`);
`Lib/ClassField/Avatar/LocalGlobalCompatibility` (`New.GaloisRep.avatar_baseChange`, `New.GaloisRep.exists_eigenform_rank_one`);
`Lib/ClassField/Avatar/HeckeBaseChange` (`New.AlgHeckeChar.baseChange`)

### 9.2 Twisting by the avatar of a character of parallel type

*Origin:* particular to this proof: twisting an `ℓ`-adic representation by a power of the cyclotomic character times
an avatar shifts its Hodge–Tate jumps and rescales its Hecke polynomial at the places where the character is unramified
and of parallel type.

*Method of the formal proof:* `ρ′` is `ρ` multiplied by `χ_ℓ^d·r`, with `r` the avatar (9.1 (a)) of `ω·|·|^{−d}`. At
the places of the statement `ω·|·|^{−d}` is unramified and has type `0` at the embeddings inducing `w`, so the local
clauses of `r` come from CrystallineRepresentationsAndKisinModules §4.4, read through the formula of 9.1 (a) at local
Artin symbols (2.1), and under multiplication by a character (CrystallineRepresentationsAndKisinModules §4.5) being
unramified or crystalline is kept, the jumps are shifted and the Hecke polynomial is rescaled by `c`.

Let `E` be a CM field, `ω = (θ, n)` an algebraic Hecke character and `d ∈ ℕ`. For every continuous `ℓ`-adic representation
`ρ` of `G_E` there is a continuous `ρ′` (a twist of `ρ`) such that at every finite place `w` where `θ` is unramified and
`n_σ = d` for every `σ` inducing `w` (through `ι`): if `ρ` is unramified, respectively crystalline, above `w`, with jump
data `J` and Hecke polynomial `∑_{j≤a} (−1)^j q^{j(j−1)/2} ι(t_j c^{−j}) X^{a−j}` (for all natural numbers `q`, `a` and
all complex `t_0, …, t_a`) killing geometric Frobenius, where
`c = θ(ι_w(ϖ_w))`, then `ρ′` has the same property with jump data `J(τ) − n_τ` and Hecke polynomial
`∑_{j≤a} (−1)^j q^{j(j−1)/2} ι(t_j) X^{a−j}`.

*Needs:* 2.1, 9.1; GaloisRepresentationsOfUnitaryEigenforms §§1.1, 1.3 (Hecke polynomials; spherical above a place);
CrystallineRepresentationsAndKisinModules §§3.2, 3.4, 3.7, 4.4, 4.5 (Tate twists; characters trivial on inertia near
`1`; twists by characters).

[ShortProof], `Lib/ClassField/Avatar/HeckeBaseChange` (`New.Variety.exists_twist_algHeckeChar`, `New.scalarRep`,
`New.isGoodAt_scalarRep_cyclotomicCharIn_pow_mul`, `New.hasJumpsAt_scalarRep_cyclotomicCharIn_pow_mul`,
`New.polyKillsAt_scalarRep_cyclotomicCharIn_pow_mul`)

## Layer 10: Cyclotomic inputs

The lower bound charges each prime `ℓ` an error that contains the length of the odd classes of the CM field of the data,
which lies in a cyclotomic field. This layer bounds them by one integer of explicit size, at every prime, `2` included,
through Kolyvagin's method for the Euler system of Gauss sums, with Bernoulli numbers replaced by an integer that lies in
all twisted Stickelberger ideals.

### 10.1 Odd classes, components and the Stickelberger property

*Origin:* definitions and conventions.

*Method of the formal proof:* definitions. The route works with these cocycle modules directly and never identifies
them with Tate–Shafarevich groups or with classes in Galois cohomology.

Let `ℓ` be a prime and `O` as in the Conventions.

1. For a CM field `E`, `e ≥ 0` and `ν ≥ 0`, the *odd classes* `Sha_e(O, ν)` are the odd module `Ш⁻(E, O/ℓ^ν, e)` of
   GaloisRepresentationsOfUnitaryEigenforms §9.2 (cocycles `G_E → (O/ℓ^ν)(−e)` unramified outside `ℓ`, vanishing on `I_A`
   for `e = 0` and on the elements of `D_A` with `χ_ℓ = 1` for `e > 0`, `A` above `ℓ`, and odd under `g ↦ g^c` if `e > 0`);
   for `e = 0` they are the everywhere unramified homomorphisms `G_E → O/ℓ^ν`.
2. For a Dirichlet character `ψ` modulo `N` with values in `O` and `e ≥ 0`, let `Υ = χ_ℓ^e ψ`. The *component*
   `C(ℓ, e, ψ, ν)` is the component of `Υ` with values in `O/ℓ^ν`, as in GaloisRepresentationsOfUnitaryEigenforms §9.2
   (`Υ⁻¹`-cocycles `G_ℚ → O/ℓ^ν` vanishing at `c` and at the elements of `Gal(Ω/ℚ(μ_N))` in inertia away from `ℓ` or in a
   decomposition group above `ℓ` with trivial `χ_ℓ`).
3. For `c ≥ 1` and `x ∈ ℚ/ℤ` with representative `⟨x⟩ ∈ [0, 1)`, `m_c(x) = ⌊c⟨x⟩⌋ − ⌊c⟨−x⟩⌋`. For `N ≥ 1` and `e ≥ 1`, an
   integer `X ≥ 1` has the *Stickelberger property* for `(N, e)` if (i) for every prime `l` some `c ≡ 1 mod N` prime to `l`
   has `(c^e − 1)(c^{e+1} − 1) | X`, and (ii) for every `c ≡ 1 mod N`, every domain `O` of characteristic `0` and every
   character `ψ` modulo `N` with values in `O` and `ψ(−1) = −(−1)^e` there is `w ∈ O` with
   `(c^{e+1} − 1)X ≡ 2w·∑_{0≤a<Nm} ⌊ca/(Nm)⌋ a^e ψ(a) mod m` for every `m ≥ 1` prime to `c`.

*Needs:* 1.1, 3.1; GaloisRepresentationsOfUnitaryEigenforms §9.2 (odd modules and components).

[ShortProof], `Lib/GaloisRep/Main/SelmerModules` (`New.Selmer.shaLocalSet`, `New.Selmer.shaOdd`, `New.Selmer.tateTwist`,
`New.OddPart.vanishingCocycles`, `New.OddPart.component`, `New.OddPart.inertiaOff`); `Lib/Cyclotomic/Stickelberger`
(`New.OddPart.floorDiff`); `Lib/Cyclotomic/Voronoi` (`New.OddPart.IsStickelbergerBound`)

### 10.2 Voronoi's congruence and a nonzero integer in all Stickelberger ideals

*Origin:* adapted from Voronoi's congruence for Bernoulli numbers (Ireland and Rosen (1990); for the untwisted
congruence, Eberl (2024)): here twisted by a Dirichlet character, modulo `f²`, and used to produce one integer with the
Stickelberger property of explicit size.

*Method of the formal proof:* (a) comes from a congruence for sums of powers along an arithmetic progression. For (c),
one integer matrix indexed by the units modulo `N` has as eigenvalues, one for each character `ψ` modulo `N`, the sums
`2∑ψ(t)β(t) + (−1)^e + ψ(−1)`; these are nonzero by (b) and Hurwitz's formula, so the determinant is a nonzero multiple
of each of them, and its size is bounded by expanding `B_{e+1}` in a Fourier series. `X` is the absolute value of this
determinant times the two factors of (i), and (a) carries divisibility by the Bernoulli sums at level `N` over to the
Stickelberger sums at level `Nm` in (ii).

Let `N ≥ 1` and `e ≥ 1`.

(a) *Voronoi.* For a Dirichlet character `χ` modulo `N` with values in a commutative ring, `f = Nm` and `c ≡ 1 mod N` prime to
`m`: `(c^{e+1} − 1)∑_{t<f} χ(t)t^{e+1} ≡ (e + 1)c^e f ∑_{t<f} ⌊ct/f⌋ t^e χ(t) mod f²`. With `β(a) = (e + 2)!N^{e+1}B_{e+1}(a/N)`, an
integer, and values in a ring without additive torsion:
`(e + 2)!(e + 1)N c^e ∑_{a<Nm} ⌊ca/(Nm)⌋ a^e χ(a) ≡ (c^{e+1} − 1)∑_{a<N} χ(a)β(a) mod m`.

(b) For a complex Dirichlet character `χ` modulo `N` (not necessarily primitive), `L(χ, −e) = 0` if and only if
`χ(−1) = (−1)^e`; `∑_{a<N} χ(a)β(a) = −(e + 2)!(e + 1)N·L(χ, −e)`, which is nonzero when `χ(−1) = −(−1)^e`.

(c) There is an integer `0 < X ≤ 2^{(N+e+3)^6}` with the Stickelberger property for `(N, e)`.

The library has the Bernoulli and Hurwitz inputs (Mathlib `HurwitzZeta.hurwitzZeta_neg_nat`; the library's
`DirichletCharacter.generalizedBernoulli`) and, for primitive characters, the zeros of `L(χ, s)` on `Re s ≤ 0`, which
are those of the gamma factor except `s = 0` for the trivial character (Mathlib
`DirichletCharacter.LFunction_eq_zero_iff_of_re_nonpos`). On Tau Ceti's main branch, later than the revision pinned
here: `TauCeti.LFunctions.dirichletData_entireCompletion_ne_zero_of_re_nonpos` (no zero of the completed function of a
primitive character on `Re s ≤ 0`).

*Needs:* 10.1; ZeroFreeRegionsAndPrimesInShortWindows §1.2 (reflection of the zeros); Mathlib
`DirichletCharacter.LFunction`, `DirichletCharacter.LFunction_ne_zero_of_one_le_re`, `HurwitzZeta.hurwitzZeta_neg_nat`,
`Polynomial.bernoulli`.

[ShortProof], `Lib/Cyclotomic/Voronoi` (`New.OddPart.voronoi_congruence`, `New.OddPart.voronoi_congruence_bernoulli`,
`New.OddPart.LFunction_neg_nat_eq_zero_iff`, `New.OddPart.sum_mul_bernoulli_eq_neg_mul_LFunction`,
`New.OddPart.sum_mul_bernoulli_ne_zero`, `New.OddPart.exists_isStickelbergerBound`)

### 10.3 Jacobi-type quotients of Gauss sums over prime fields

*Origin:* adapted from Stickelberger's theorem on Gauss sums and the product relation of Davenport and Hasse
(Washington (1997), 6.2 and Thm 15.1; Davenport and Hasse (1935)), in the form that the Euler system of Gauss sums
of 10.4 uses: here a family of quotients of Gauss sums over `𝔽_p`, indexed by torsion points of `ℚ/ℤ`, with exact
Galois equivariance, its orders at a place above `p`, a distribution relation up to roots of unity and a congruence at
the primes dividing `p − 1`.

*Method of the formal proof:* (a) is the part of Stickelberger's theorem that the route needs: the `𝔓`-adic orders of
the Gauss sums of a cyclic family of characters depend additively and injectively on the character. For (b),
`J(x) = j(x)/j(−x)` with `j(x) = g(χ_x)^c/g(χ_x^c)`; the Galois action, the absolute values and the congruence come
from the corresponding properties of Gauss sums, the order at `𝔓` from (a), and the distribution relation from
Hermite's identity for the integer parts that make up `m_c`.

Let `p` be a prime, `𝔓` a place of `Ω` above `p`, `ψ₀` a nontrivial additive character of `𝔽_p` and `c ≥ 1`.

(a) For `r` prime to `p` and an injective homomorphism `t ↦ χ_t` from `ℤ/r` to the characters of `𝔽_p^×`, there is an
injective homomorphism `S : ℤ/r → ℚ/ℤ` such that the representative in `[0, 1)` of `S(t)` is `ord_𝔓 g(χ_t, ψ₀)`, normalised by
`ord_𝔓(p) = 1`.

(b) There is a map `J : ℚ/ℤ → Ω^×` (built from the quotients `g(χ)^c/g(χ^c)` of Gauss sums over `𝔽_p`) such that for every
`M | p − 1` and every `x` with `Mx = 0`: `σ(J(x)) = J(ax)` whenever `σ ∈ G_ℚ` acts on `μ_M` by `ζ ↦ ζ^a`; `J(x)` is a unit at
every place not above `p`, has absolute value `1` under every embedding `Ω → ℂ`, and has `ord_𝔓 J(x) = m_c(x)`; for `r | M`
prime to `c`, `∏_{b mod r} J(x + b/r)/J(rx)` is a root of unity; and for a prime `q | p − 1` and `qb = 0`, `J(x + b)/J(x) ≡ 1`
modulo every place above `q`.

The library has the exact valuations of Gauss sums over every finite field (`TauCeti.stickelberger_congruence`,
`TauCeti.intValuation_gaussSum_inv_pow`), which give (a); the family `J` is not in it. On Tau Ceti's main branch, later
than the revision pinned here: Stickelberger's relation `Ideal.span_stickelbergerPhi`.
BernoulliBoundsForClassGroupEigenspaces §10.1 (c1)–(c2) states the same Euler system in another arrangement, for each
level separately and for `b` below the level.

*Needs:* 1.2, 10.1; Mathlib `gaussSum`.

[ShortProof], `Lib/Cyclotomic/Stickelberger` (`New.OddPart.stickelberger`, `New.OddPart.sum_floorDiff`,
`New.OddPart.isOfFinAddOrder_distribution`, `New.OddPart.IsJacobiFamily`, `New.OddPart.exists_isJacobiFamily`)

### 10.4 Kolyvagin's derivative cocycles

*Origin:* adapted from Kolyvagin's derivative classes for the Euler system of Gauss sums (Rubin (1991); with a Tate
twist, Banaszak and Gajda (1996)): here derivative cocycles of `G_ℚ` with values in `O/ℓ^n` for the character
`χ_ℓ^{e+1}ψ`, for one finite set of auxiliary primes, with vanishing on inertia at the primes of the conductor.

*Method of the formal proof:* the cocycles are of Kummer type for the family `J` of 10.3: for an `ℓ^n`-th root `y` of a
value of `J` and `g ∈ G_ℚ`, the images of `y` under `γ` and `gγg⁻¹` differ by a root of unity, and `κ_S(g)` is formed
from the exponents of these roots of unity with Kolyvagin's operators for the primes in `S`
(EulerSystemsAndKolyvaginSystems §3.1), weighted by `a^e ψ(a)`. (b) uses the congruence of 10.3 (b) at `q`, and (c)
the order of `J` at `𝔓`.

Let `ℓ` be a prime, `O` a `ℤ_ℓ`-algebra, `ψ` a Dirichlet character modulo `N` with values in `O`, `e, n, c ≥ 0`,
`Υ = χ_ℓ^{e+1}ψ`, `γ ∈ G_ℚ`, `P` a finite set of primes `≡ 1 mod cNℓ^n`, `p` a prime `≡ 1 mod Nℓ^n∏_{q∈P} q` and `𝔭` a place
of `Ω` above `p`. There are maps `κ_S : G_ℚ → O/ℓ^n`, `S ⊂ P`, such that:

(a) each `κ_S` is a locally constant `Υ`-cocycle with `κ_S(γ) = 0` that vanishes on `I_𝔄 ∩ Gal(Ω/ℚ(μ_N))` for every place `𝔄`
above none of `ℓ`, `p` and the primes of `S` (the places above the primes dividing `N` included);

(b) for `q ∈ P ∖ S`, a place `𝔔` above `q` and an arithmetic Frobenius `φ` at `𝔔`, some `τ ∈ I_𝔔` has `κ_{S∪{q}}(τ) = κ_S(φ)`;

(c) if `κ_∅` vanishes on `I_𝔭`, then `(Υ(γ) − 1)·∑_{a ∈ (ℤ/Nℓ^n)^×} m_c(a/(Nℓ^n))·a^e ψ(a) = 0` in `O/ℓ^n`, with `a` read in
`[0, Nℓ^n)`.

BernoulliBoundsForClassGroupEigenspaces §10.1 (c3)–(c5) states derivative classes of the system of Jacobi sums; it lacks
the vanishing on inertia at the places above the primes dividing `N` in (a).

*Needs:* 1.4, 10.1, 10.3; EulerSystemsAndKolyvaginSystems §3.1 (the derivative operator and its identity).

[ShortProof], `Lib/Cyclotomic/Kolyvagin/DerivativeCocycles` (`New.OddPart.derivativeSum`, `New.OddPart.IsKolyvaginSystem`,
`New.OddPart.exists_isKolyvaginSystem`)

### 10.5 Reciprocity at auxiliary primes; annihilation and detection of odd components

*Origin:* adapted from the Stickelberger annihilation of Coates and Sinnott (1974) and from the bound obtained with the
Euler system of Gauss sums (Rubin (2000), III.4, Thm 4.6): here, with an integer `X` having the Stickelberger property
in place of a Bernoulli number, an annihilator `4X²` of the odd component at every prime and, for large primes,
`v_ℓ(X) + 1` elements of `G_ℚ` that detect its cocycles.

*Method of the formal proof:* (a) is the product formula 2.2 (e) over `ℚ(μ_{Nm})`, in which `q` splits completely,
for the character given by `x` and the element `y`; the hypotheses on `y` leave only the terms at the places above
`q`. For (b), `y` is taken among the values of the family `J` of 10.3, whose orders give the Stickelberger sums, so these
sums kill the values of `x` at Frobenius elements; Chebotarev's theorem spreads this to all of `G_ℚ`, and the
Stickelberger property turns it into the annihilator `4X²`. For (c), the reciprocity modulo `ℓ` of (a) is applied to
the cocycles of 10.4 at auxiliary primes chosen by Chebotarev's theorem, and controls their ramification; Kolyvagin's
descent then forces `ℓ^{v_ℓ(X)+1} | X` unless `v_ℓ(X) + 1` suitable points detect.

Let `N ≥ 1`, `e ≥ 1`, `X` with the Stickelberger property for `(N, e)` (10.1), `ℓ` a prime, `O` as in the Conventions and `ψ`
a Dirichlet character modulo `N` with values in `O` such that `χ_ℓ^e ψ` is odd (value `−1` at `c`).

(a) *Reciprocity.* Let `q ≡ 1 mod Nm` be a prime, `φ` an arithmetic Frobenius at a place `𝔅` above `q`, `x ∈ C(ℓ, e, ψ, ν)`
killed by `m`, `a ≡ 1 mod N` prime to `ℓ`, and `y ∈ Ω^×` fixed by `Gal(Ω/ℚ(μ_{Nm}))` such that at each place prime to `ℓq`
either `y` is a unit times an `m`-th power of an element fixed by inertia there, or `x` vanishes on the decomposition group.
With `s_u ∈ G_ℚ` acting on `μ_{Nm}` by `u`, and `k_u = ord_𝔅 s_u(y)`: `(∑_u k_u u^e ψ(u))·2(a^e − 1)·x(φ) = 0`. Modulo `ℓ`: if
`ℓ x = 0`, `ℓ κ = 0` for a `χ_ℓ^{e+1}ψ`-cocycle `κ` with values in a finite `O`-module, vanishing on the inertia over
`ℚ(μ_N)` at places above neither `ℓ` nor a prime of a finite set `T`, `q ≡ 1 mod Nℓ`, `φ(Nℓ)` is a unit in `O`, every
place prime to `q` lies above no prime of `T` or has its decomposition group killed by `x`, and `2(a^e − 1)x(φ) ≠ 0`,
then `κ` vanishes on `I_𝔅`.

(b) *Annihilation.* `4X²` kills `C(ℓ, e, ψ, ν)` for every prime `ℓ`, `2` included, and every `ν`.

(c) *Detection.* If `X ≠ 0` and `ℓ > N + e + 3`, there are `v_ℓ(X) + 1` elements of `G_ℚ` such that every element of
`C(ℓ, e, ψ, ν)` vanishing at all of them is zero.

BernoulliBoundsForClassGroupEigenspaces §10.1 (a)–(b) bounds the lengths of the components by generalised Bernoulli
numbers for odd `ℓ` prime to the degree; the route needs (b) at every prime and (c), through `X`.

*Needs:* 2.2, 10.1, 10.3, 10.4; ArithmeticGaloisRepresentations §5.1 (Chebotarev's density theorem).

[ShortProof], `Lib/Cyclotomic/Kolyvagin/ReciprocityComponentBounds` (`New.OddPart.artin_reciprocity_of_mem_component`,
`New.OddPart.reciprocity_mod_ell`, `New.OddPart.nsmul_component_eq_zero`, `New.OddPart.exists_detecting_points_component`)

### 10.6 Few elements detect cocycles unramified outside `ℓ`

*Origin:* particular to this proof: a polynomial number of elements of `G_E`, at most `y^{20}`, on which every cocycle
unramified outside `ℓ` with values in a Tate twist is tested; for homomorphisms this is a crude, explicit form of the
finite generation of the largest pro-`ℓ` quotient of `G_E` unramified outside `ℓ`.

*Method of the formal proof:* with `M = Nℓ²`, the field `F = ℚ(μ_M)` contains `E`, and `G_F` acts trivially on the
coefficients of a cocycle killed by `M`, so that such a cocycle is a homomorphism on `G_F`. The set `s` consists of
coset representatives of `G_F` in `G_E` together with the points of 2.3 (f) for `F`, whose number (c) bounds through
the class number of `ℚ(μ_M)` and the index of local `M`-th powers; cocycles killed by higher powers of `ℓ` are reduced
to this case by induction on the exponent.

Let `E ⊂ ℚ(μ_N)` be a number field and `ℓ` a prime.

(a) There is a finite set `s ⊂ G_E` with `#s ≤ y^{20}` whenever `N ≤ y` and `ℓ ≤ y²`, such that for every `O`, `n`, `e`, a
locally constant cocycle `G_E → (O/ℓ^n)(−e)` unramified outside `ℓ` that vanishes on `s` is zero.

(b) If `g₀` generates `G_E` modulo `ker χ_ℓ`, there is such a set `s ⊂ ker χ_ℓ` with the same bound such that such a cocycle
vanishing at `g₀` and on `s` is zero.

(c) For every `M ≥ 1`, the class number of `ℚ(μ_M)` times the index of the finite ideles that are `M`-th powers above
`ℓ` is at most `2^{M³+5M²+M}`.

*Needs:* 2.3, 3.1.

[ShortProof], `Lib/Cyclotomic/OddSha` (`New.ncard_placesDividing_le_finrank`,
`New.OddPart.classNumber_mul_index_idelesPowAt_le`, `New.OddPart.exists_detecting_points_cocycles`,
`New.OddPart.exists_detecting_points_mem_ker`)

### 10.7 One integer bounding the odd classes of a cyclotomic CM field at every prime

*Origin:* particular to this proof: for a CM field contained in a cyclotomic field, a bound for the length of its odd
classes at every prime `ℓ`, `2` included, and for all Tate twists below a given bound, by the valuation of a single
nonzero integer of explicit size.

*Method of the formal proof:* for `e = 0` the odd classes are unramified homomorphisms, and (a) is the bound by the
class number. For `e > 0` they decompose into the components of 10.1 (2), one for each Dirichlet character modulo `N`,
and 10.5 (b) gives (b). In (c) an annihilator `m` and `k` detecting points give `v_O(m^k)`; the points are those of
10.6 when `ℓ ≤ y²` and those of 10.5 (c) when `ℓ > y²`, and `X` gathers these bounds over all `e < t`.

Let `E ⊂ ℚ(μ_N)` be a CM field and `t ≥ 0`. There is an integer `X ≠ 0` with `X ≤ 2^{4(N+t+3)^{27}}·h_E` such that for every
prime `ℓ`, every `O` (Conventions) containing the values of the Dirichlet characters modulo `N`, every `0 ≤ e < t` and every
`ν`: `length_O Sha_e(O, ν) ≤ v_O(X)`. Also, with `y = N + e + 3` and the same `O`:

(a) `length_O Sha_0(O, ν) ≤ v_O(h_E)`;

(b) for `e ≠ 0` and `X_e` with the Stickelberger property for `(N, e)`, `4φ(N)·4X_e²` kills `Sha_e(O, ν)`;

(c) if `m` kills `Sha_e(O, ν)` and at most `k` elements detect its members, `length_O Sha_e(O, ν) ≤ v_O(m^k)`; for `ℓ ≤ y²`
this holds with `k = y^{20}`, and for `ℓ > y²`, `e ≠ 0` and `0 < X_e ≤ 2^{y^6}`, the length is at most
`v_O((4φ(N)·4X_e²)^{y^{20}})`.

BernoulliBoundsForClassGroupEigenspaces §10.1 (b) and UniformWildKernelBounds §7.3 (a) bound minus parts of
Tate–Shafarevich groups for odd primes only; the route uses this bound at every prime.

*Needs:* 10.1, 10.2, 10.5, 10.6.

[ShortProof], `Lib/Cyclotomic/OddSha` (`New.length_shaOdd_zero_le_addVal_classNumber`, `New.exists_character_components`,
`New.OddPart.nsmul_shaOdd_eq_zero_of_isStickelbergerBound`, `New.OddPart.length_shaOdd_le_addVal_pow`,
`New.OddPart.length_shaOdd_le_of_le_sq`, `New.OddPart.length_shaOdd_le_of_sq_lt`, `New.exists_length_shaOdd_le`)

## What the library already provides

- Chebotarev's density theorem: `NumberField.Chebotarev.hasDirichletDensity_frobeniusPrimeSet`, with
  `NumberField.Chebotarev.infinite_frobeniusPrimeSet`; the primes of residue degree above one have Dirichlet density
  zero (`TauCeti.hasDirichletDensity_higherDegreePrimes`), so the primes of prime norm carry the density; at places of
  `Ω` through 1.2 and 1.3.
- Hilbert 90 for locally constant cocycles: `TauCeti.isMulCoboundary₁_of_isMulCocycle₁_of_isLocallyConstant`.
- Cup products of explicit 1-cocycles and their anticommutativity: `TauCeti.ContCohomology.explicitCup11`,
  `TauCeti.ContCohomology.explicitCup11_eq_neg_flip`.
- Kummer cocycles: `TauCeti.kummerCocycle`, `TauCeti.kummerIso`.
- Brauer classes split by a cyclic extension as cyclic (carry) classes, vanishing exactly on norms:
  `TauCeti.ClassFieldTheory.exists_characterCarryCocycle_eq_relBrInfl`,
  `TauCeti.ClassFieldTheory.unitsRepH2Equiv_characterCarryCocycle_eq_zero_iff`. These four items are what the shorter proof
  uses in degrees `≤ 2` to prove class field theory itself; the route takes class field theory from the library (Layer 2).
- Global class field theory: `TauCeti.ClassFieldTheory.brLocalization_injective`, `TauCeti.ClassFieldTheory.globalArtinEquiv`,
  `TauCeti.ClassFieldTheory.apply_globalArtinMap_eq_finsum`, `TauCeti.ClassFieldTheory.globalAbelianExistence`,
  `TauCeti.ClassFieldTheory.cyclicHasseNorm`, `TauCeti.ClassFieldTheory.natCard_H2_globalFormation_dvd_degree`,
  `TauCeti.ClassFieldTheory.ker_globalArtinMap`, `TauCeti.ClassFieldTheory.card_ideleClassNormQuotient`,
  `TauCeti.ClassFieldTheory.isGlobalNorm_iff_isLocalNormEverywhere`,
  `TauCeti.ClassFieldTheory.globalNormSubgroup_kummerLayer_sUnits`; read at finite ideles and at `Ω` in 2.2 and 2.3, and
  on full ideles for `E/E⁺` in 7.2.
- The absolute global Artin map `C_K → G_K^ab`: `TauCeti.ClassFieldTheory.ClassFormation.absoluteArtinMap` at
  `TauCeti.ClassFieldTheory.globalClassFormation`, read on `C_K` through `TauCeti.ClassFieldTheory.globalGroundEquiv`,
  with `TauCeti.ClassFieldTheory.ClassFormation.abelianizationRestrict_absoluteArtinMap`,
  `TauCeti.ClassFieldTheory.ClassFormation.eq_absoluteArtinMap_of_forall_abelianizationRestrict`,
  `TauCeti.ClassFieldTheory.ClassFormation.denseRange_absoluteArtinMap`,
  `TauCeti.ClassFieldTheory.ClassFormation.absoluteArtinMap_eq_zero_iff` and
  `TauCeti.ClassFieldTheory.globalArtinMap_eq_of_mk_eq_absoluteArtinMap`; restricted to the finite ideles and composed
  with inversion it is `Art_K` of 2.2.
- Local class field theory for complete nonarchimedean local fields: `TauCeti.ClassFieldTheory.invMap`,
  `TauCeti.ClassFieldTheory.artinMap`, `TauCeti.ClassFieldTheory.artinMap_norm`, `TauCeti.ClassFieldTheory.localArtinEquiv`,
  `TauCeti.ClassFieldTheory.geometricArtinMap`, `TauCeti.ClassFieldTheory.localSymbol_kummerClass_eq_zero_of_mem_unitFiltration`;
  read at places of `Ω` in 2.1, and at the places of `E⁺` that do not split in `E` in 7.2.
- Local Tate duality and the Euler characteristic for finite modules: `TauCeti.ClassFieldTheory.tateDualityPairing_perfect`,
  `TauCeti.ClassFieldTheory.eulerCharacteristic_mixed`; they give 5.2 (d) through 1.3.
- Frobenius, inertia and unramified characters of complete local fields: `TauCeti.inertiaSubgroup`,
  `TauCeti.exists_isArithFrobeniusLift`, `TauCeti.maximalUnramifiedGaloisGroupEquivZHat`; through 1.3 they give 1.4 (a)–(b).
- Valuations of Gauss sums over every finite field: `TauCeti.stickelberger_congruence`,
  `TauCeti.intValuation_gaussSum_inv_pow`; they give 10.3 (a).
- Values of `L(χ, s)` at negative integers through Hurwitz zeta: Mathlib `HurwitzZeta.hurwitzZeta_neg_nat`, and the library's
  `DirichletCharacter.generalizedBernoulli`.

On Tau Ceti's main branch, later than the revision pinned here:
`NumberField.Chebotarev.infinite_frobeniusPrimeSet_inter_setOf_inertiaDeg_eq_one` (every Frobenius class contains
infinitely many primes of residue degree one over `ℚ`), `TauCeti.ClassFieldTheory.natCard_H1_eq_mul` (the Euler
characteristic formula for the cohomology of a finite discrete module), `Ideal.span_stickelbergerPhi` (Stickelberger's
relation), `TauCeti.kolyvaginDerivative` (the Kolyvagin derivative operator in a group algebra) and
`TauCeti.ClassFieldTheory.globalArtinMap_ideleClassNormMap` (the global Artin map of a finite layer is compatible with
the norm of idele classes from an intermediate field; for 2.2 (c)).

## Results taken from other roadmaps

- Chebotarev's density theorem, in the form that the Frobenius elements at places of prime norm outside a finite set meet
  every nonempty open set: ArithmeticGaloisRepresentations §5.1 states that the Frobenius elements above any set of
  places of Dirichlet density one are dense, and the places of prime norm outside a finite set form such a set, those
  of residue degree above one having density zero (`TauCeti.hasDirichletDensity_higherDegreePrimes`). Used in 4.5, 4.6,
  6.1 and 10.5.
- Corestriction, Shapiro's lemma, cup products in low degrees, Hilbert 90 and Kummer theory for profinite groups:
  ProfiniteCohomology Layers 6–9. Used only through class field theory.
- Decomposition and inertia groups and arithmetic Frobenius elements at the maximal ideals of the integral closure, with
  their valuation subrings; the local embedding `G_{K_v} → G_K` onto a decomposition group; finiteness of ramification
  sets; the tame character transported to inertia at a place: ArithmeticGaloisRepresentations §§2.1, 2.1a, 2.2. Used in
  1.2, 1.3 and 1.4, and compared with 1.1 there.
- Global class field theory: ClassFieldTheory Layers 10–13 (the Brauer sequence and sum of invariants, global
  reciprocity, existence, the norm index, the Kummer layer of the `S`-units and the cyclic Hasse norm theorem). Used in
  2.2, 2.3 and 7.2.
- The absolute global Artin map on `𝔸_K^×`, continuous, with the local Artin maps as components:
  MordellLawrenceVenkatesh §1.8. Used in 2.2.
- Local class field theory and local duality: ClassFieldTheory §§5.1, 6.1, 7.1. Used in 2.1, 5.2 and 7.2.
- The derivative operator of Kolyvagin and its identity: EulerSystemsAndKolyvaginSystems §3.1. Used in 10.4.

## References

- `[ShortProof]`: the folder `grh` of <https://github.com/lsernau/grh-lean> at commit
  `72fead102f663d5c7a407964a13dc0cf9d977207`; this roadmap covers `src/Lib/ClassField` (except
  `GaloisCohomology/ShapiroCorestriction`, `Local/InvariantMap` and `Global/Chebotarev`, and the two theorems on the
  local behaviour of avatars in `Avatar/LocalGlobalCompatibility`, which GaloisRepresentationsOfUnitaryEigenforms
  §6.4 (e) states) and `src/Lib/Cyclotomic`, with declarations of `src/Lib/PadicHodge/Characters`,
  `src/Lib/GaloisRep/Main/SelmerModules`, `src/Lib/General/Algebra/CartanMap` and `src/Lib/Weil/Construction/WeilData`.
- Artin and Tate, *Class Field Theory* (1968), ch. X.
- Atiyah and Wall, in Cassels–Fröhlich (1967), IV §8.
- G. Banaszak, W. Gajda, *Euler systems for higher K-theory of number fields*, J. Number Theory 58 (1996).
- J. Coates, W. Sinnott, *An analogue of Stickelberger's theorem for the higher K-groups*, Invent. Math. 24 (1974).
- B. Conrad, *Lifting global representations with local properties* (preprint 2011), App. B.
- H. Davenport, H. Hasse, J. reine angew. Math. 172 (1935).
- M. Eberl, *Kummer's congruence*, Archive of Formal Proofs (2024).
- Harris, Kudla, Sweet, *Theta dichotomy for unitary groups*, J. Amer. Math. Soc. 9 (1996), §1.
- H. Hasse, *Die Struktur der R. Brauerschen Algebrenklassengruppe*, Math. Ann. 107 (1933).
- K. Ireland, M. Rosen, *A Classical Introduction to Modern Number Theory*, 2nd ed. (1990).
- S. Lang, *Algebraic Number Theory*.
- J. S. Milne, *Arithmetic Duality Theorems*, 2nd ed. (2006), I 2.3, 2.8.
- J. S. Milne, *Class Field Theory* (v4.03, 2020), I and III 2; VI 4.8–4.9; VI 4.9, VII 4–9, VIII 4.
- J. Neukirch, *Algebraic Number Theory* (1999), I §9, II §§7–9, VI §1.
- Neukirch, Schmidt, Wingberg, *Cohomology of Number Fields*, 2nd ed. (2008), Ch. I, VI.
- A. Raghuram, *Notes on the arithmetic of Hecke L-functions*, arXiv:2207.03399, §4.
- K. Rubin, *Kolyvagin's system of Gauss sums*, Arithmetic Algebraic Geometry (Texel 1989), Progr. Math. 89 (1991),
  309–324.
- K. Rubin, *Euler Systems* (2000), III.4, Thm 4.6.
- J.-P. Serre, *Abelian ℓ-adic representations and elliptic curves* (1968), II–III.
- J.-P. Serre, *Local Fields* (1979), I §7, IV §2; XII–XIV.
- J.-P. Serre, *Galois Cohomology* (1997), II §5.2 Thm 2 and §5.7.
- Stacks Project, tag 09EE.
- J. Tate, *Fourier analysis in number fields and Hecke's zeta-functions* (1950), in Cassels–Fröhlich, ch. XV,
  §4.4–4.5.
- J. Tate, *Global class field theory*, in Cassels–Fröhlich (1967), ch. VII.
- Titchmarsh, *Theory of the Riemann zeta-function*, §2.11.
- S. Wang, *Grunwald–Wang theorem, an effective version*, arXiv 1401.0389 (2014).
- L. Washington, *Introduction to Cyclotomic Fields*, 2nd ed. (1997), 6.2 and Thm 15.1.
- A. Weil, *On a certain type of characters of the idèle-class group of an algebraic number-field*, Tokyo–Nikko
  symposium 1955 (1956).
