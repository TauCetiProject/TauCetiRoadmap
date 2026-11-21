# Roadmap: Selmer length bounds and local lifting

**Summary.** Fix a prime `p` and the ring of integers `O` of a finite extension `E` of `ℚ_p`, with uniformizer `λ` and residue field `k`. This roadmap bounds the Selmer groups of the twists of a Galois lattice over a number field by characters of `p`-power order, and proves local theorems at the places above `p` with explicit exponents. Its global objects are a number field `F` (with `p` odd or `F` without real places), a free `O`-module `T` of rank `r ≥ 1` with a continuous action of the Galois group of `F` unramified outside a finite set `S` of places containing those above `p` and `∞`, and a local condition above `p` given abstractly: saturated submodules `ℒ_v ⊆ H¹(F_v, T)` containing the torsion, called *balanced* when the ranks `rank ℒ_v − rank H⁰(F_v, T)` over the places above `p` add up to the sum of the ranks `rank H⁰(F_v, T)` over the infinite places. Its local objects are lattices in crystalline representations of `G_K`, for finite extensions `K` of `ℚ_p`, with their Bloch–Kato finite classes `H¹_f`.

The headline theorems are these. (1) If `ℒ` is balanced and neither `T/λT` nor its Tate dual has nonzero invariants under `G_F`, then for finitely many characters `d_j : G_F → ℤ/p^M` trivial on the decomposition groups above `p` and unramified outside a finite set `Q` of places disjoint from `S`, the Selmer groups of the twists of `T` over the group ring `Λ = O[(ℤ/p^M)^J]` (the image of `ℒ_v` above `p`, no condition at the other places of `Q ∪ S`, unramified elsewhere) are the kernels of one square matrix `Φ` with entries in the maximal ideal of `Λ`, naturally in the coefficients; and for every `u ∈ μ_{p^M}(O′)^J`, `O′` the integers of a finite extension `E′` of `E` containing `μ_{p^M}`, the Selmer group of `T ⊗ ψ_u^{−1} ⊗ E′/O′`, `ψ_u = ∏_j u_j^{d_j}`, has length equal to the valuation of a lift of `det Φ` at `(u_j − 1)_j`, both sides infinite when that value is `0`. (2) Let `F` be a CM field and `T_s` finitely many such lattices with balanced conditions, each with `T_s/λT_s` absolutely irreducible, conjugate self-dual up to a power `χ_cyc^{t_s}` of the cyclotomic character, with no invariants of the residual Tate dual at the finite places of `S` not above `p`, and such that one element of `G_{F(μ_{p^∞})}` acts on every `T_s/λT_s` by a scalar `ϑ_s` with `ϑ_s² ≠ 1`. Then for every `ε′ > 0` there is an anticyclotomic character `ψ` of `p`-power order, ramified exactly at a set `Q` of places whose size is bounded independently of `ε′`, such that for every `m` prime to `p` each Selmer group of `T_s ⊗ ψ^m ⊗ E′/O′` has length at most `(ν_s + ε′)·length(O′/p)`, `ν_s` the largest `ν` with `χ_cyc^{t_s·rank T_s} ≡ 1 (mod p^ν)` on `G_F`, and at most `ε′·length(O′/p)` when `T_s/λT_s` is not isomorphic to its twist by `χ̄_cyc^{t_s}`. (3) Let `K₀/ℚ_p` be finite unramified, `K₀ ⊆ K ⊆ K₀(μ_{p^s})` (`s ≥ 2` if `p = 2`), `E` containing the images of the embeddings of `K₀(μ_{p^s})`, and `V` an `E`-representation of `G_K`, crystalline over `K₀(μ_{p^s})`, with all its Hodge–Tate weights in `[−M₀, h₀]` and with `0` not a weight at some embedding `τ` of `K`. Then `p^c·H⁰(K, V/T) = 0` for every stable lattice `T`, where `c = 2 + Σ_u(2s + n₀ + 1 + v_p(u))` over the distinct weights `u` at `τ` and `n₀` is the least integer with `M₀ + h₀ ≤ p^{n₀}(p − 1)`. (4) Let `f : T₁ ↠ T₂` be a surjection of stable lattices in crystalline representations of `G_K`, with `E` containing the images of the embeddings of `K`. If `p` is odd, `K/ℚ_p` is unramified and the weights of `T₁` at the embedding `i` lie in `[−M_i, h_i]` with `M_i, h_i ≥ 0`, then `p^{e°}·H¹_f(K, T₂) ⊆ f(H¹_f(K, T₁))` with an explicit `e° ≤ 23(2 + H/p + log_p(H + 1))`, `H = max_i(M_i + h_i)`, and `e° = 0` when `max_i M_i + max_i h_i ≤ p − 2`. If `K` lies in `ℚ_p(μ_{lcm(p,N)})` (`4 | N` if `p = 2`), `E ⊇ μ_{lcm(p,N)}`, and the weights of `T₁` lie in `[−h, h]`, the same holds with the exponent `32(2h·s_N + 1) + s_N + ⌊log_p 2h⌋ + ⌊log_p N⌋ + 1`, `s_N = max(1, v_p(N))`.

The roadmap extends [SelmerIwasawaCohomology](../../SelmerIwasawaCohomology/README.md), which supplies Selmer structures, Selmer complexes, Iwasawa algebras and the Bloch–Kato local condition; it rests on [PhiGammaModulesAndIwasawaCohomology](../../PhiGammaModulesAndIwasawaCohomology/README.md) for Wach lattices and the Herr complex, on [WachLatticesOverTheCyclotomicTower](../WachLatticesOverTheCyclotomicTower/README.md) for the annihilators of the cokernels of Wach lattices, on [PrismaticCohomologyPartIII](../../PrismaticCohomologyPartIII/README.md) for prismatic `F`-crystals, and on [ArithmeticGaloisDuality](../../ArithmeticGaloisDuality/README.md) for local and global duality and the Greenberg–Wiles formula. In the family [RiemannHypothesisForDirichletLFunctions](../README.md), the twist selection and the local bounds feed the congruence bounds of [CongruenceModulesOfThetaLifts](../CongruenceModulesOfThetaLifts/README.md), and the lifting theorems feed the bound with local defects of [LengthBoundsInPadicFamilies](../LengthBoundsInPadicFamilies/README.md).

Layer 3 presents Selmer functors over finite group rings by square matrices, reads the lengths of twisted Selmer groups off a specialised determinant, places auxiliary primes in position, bounds the determinant and assembles twist selection, with the local condition above `p` kept abstract. Layer 4 relates `H¹_f` and `H¹_g` to crystalline and de Rham extensions, makes the Bloch–Kato condition an instance of Layer 3, bounds finite parts and invariants modulo lattices, and proves the lifting theorems with loss over unramified, ramified cyclotomic, abelian, tamely ramified and tame-type bases, with the lattices at finite levels of the cyclotomic tower that they use, and the pushouts of finite classes under a lifting exponent.

## Conventions

Notation and conventions not restated here are those of [SelmerIwasawaCohomology](../../SelmerIwasawaCohomology/README.md) (its Conventions and Layers 2–4) and, for Wach lattices and `(φ, Γ)`-modules, those of PhiGammaModulesAndIwasawaCohomology §6.0 and WachLatticesOverTheCyclotomicTower §§6.4–6.10.

`p` is a prime and `O ⊂ E` are the coefficients: `E` is a finite extension of `ℚ_p`, `O` its ring of integers, `λ` a uniformizer and `k` the residue field. `F` is a number field and `S` a finite set of places of `F` containing the places above `p` and `∞`. Condition `(P)` is that of the Conventions of SelmerIwasawaCohomology: `p` is odd or `F` has no real places. For a lattice `T`, `T̄ = T/λT` and `T^† = Hom_O(T, O)(1)`. `χ_cyc` is the `p`-adic cyclotomic character; in the local sections `χ` is the cyclotomic character of `Γ_K`, and `v_p` is the valuation with `v_p(p) = 1`. Hodge–Tate weights are normalised so that `ℚ_p(1)` has weight `−1`. Lengths are lengths of modules over `O`, or over the ring named, and may be infinite.

For a `G_K`-stable lattice `T` in a representation `V` of `G_K`, `K/ℚ_p` finite, `H¹_f(K, V)` is the Bloch–Kato subgroup of SelmerIwasawaCohomology §4.9, `H¹_f(K, T)` is its preimage in `H¹(K, T)` and `H¹_f(K, V/T)` its image in `H¹(K, V/T)` (the `T`- and `W`-conditions of that section).

Layer 3 uses only a local condition above `p` given abstractly (a balanced saturated condition, 3.22), so it needs nothing from Layer 4; 4.9b shows that the Bloch–Kato condition of SelmerIwasawaCohomology §4.9 is one, under the hypothesis (H3) stated there. In 4.10a–4.10f the letters `M`, `Q`, `S`, `H`, `J`, `X`, `L` and `Λ_c` have the local meanings given there (weights, the elements `π₀ + p` and `φ^{s−1}(q)`, window sizes, sets of integers, the variables `π₀` and `φ^{s−1}(π)` or a finite module, an exponent, a product of distinguished polynomials), unrelated to Layer 3; the lattice maps there are written `f`.

## Layer 3: Selmer presentations over group rings and twist selection

This layer works with the Selmer data of 3.22: a Galois lattice over a number field with a balanced saturated local condition above `p`, given abstractly. It presents the Selmer functor over a finite group ring by a square matrix, reads the lengths of twisted Selmer groups off the specialised determinant, places auxiliary primes in position, bounds the determinant from below, and selects one anticyclotomic twist that makes the Selmer groups of finitely many lattices small at once.

### 3.22 Selmer presentations over group rings, and tame anticyclotomic characters

**Selmer data (for 3.22–3.26).** `F` is a number field satisfying condition `(P)` of the Conventions, `S` a finite set of
places of `F` containing the places above `p` and `∞`, `T` a free `O`-module of rank `r ≥ 1` with a continuous action of
`G_{F,S}`, `V = T[1/p]`, `T̄ = T/λT` and `T^† = Hom_O(T, O)(1)`. A **saturated condition above `p`** is a family
`ℒ = (ℒ_v)_{v|p}` of `O`-submodules `ℒ_v ⊆ H¹(F_v, T)` that contain the torsion of `H¹(F_v, T)` and have torsion-free
quotient `H¹(F_v, T)/ℒ_v`; it is **balanced** if

`Σ_{v|p}(rank_O ℒ_v − rank_O H⁰(F_v, T)) = Σ_{v|∞} rank_O H⁰(F_v, T)`.

Write `ℒ_v(k)` for the image of `ℒ_v` in `H¹(F_v, T̄)` and `ℒ_v(k)^⊥ ⊆ H¹(F_v, T̄^†)` for its exact annihilator under local
Tate duality.

Let `J` be a finite set, `M ≥ 1`, and `d_j : G_F → ℤ/p^M` (`j ∈ J`) continuous homomorphisms, trivial on the decomposition
groups above `p` and unramified outside a finite set `Q` of finite places disjoint from `S`. Put
`Λ = O[(ℤ/p^M)^J]` (local, residue field `k`; the finite group ring case of SelmerIwasawaCohomology §3.0) and `κ = ∏_j[d_j] : G_F → Λ^×`. For a
discrete `p`-power-torsion `Λ`-module `B` define `Sel_Q(T ⊗ κ^{−1} ⊗ B) ⊂ H¹(G_F, T ⊗_O B(κ^{−1}))` by: at `v | p` the image
of `ℒ_v ⊗_O B` (`κ` is trivial on `G_{F_v}`); no condition at the finite places of `Q ∪ S` not above `p`; unramified
elsewhere. `Sel_Q(T̄)` is the case `B = k`; `Sel_∅(T̄) ⊆ Sel_Q(T̄)` is the subgroup of classes unramified also at `Q`; and
`Sel_∅(T̄^†) ⊆ H¹(G_F, T̄^†)` has the dual conditions (SelmerIwasawaCohomology §2.13): `ℒ_v(k)^⊥` at `v | p`, zero at the finite places of `S` not
above `p`, unramified elsewhere.

**CM data (for (1) and 3.24–3.26).** In addition, `F` is a CM field with maximal totally real subfield `F⁺` and a fixed
complex conjugation `c ∈ G_{F⁺} ∖ G_F`; a homomorphism `d` on `G_F` is *anticyclotomic* if `d(cgc^{−1}) = −d(g)`; `S` is
`c`-stable; `ℒ` is a balanced saturated condition above `p` (for CM `F` the right side of the balance is `r[F:ℚ]/2`); `t ∈ ℤ`.
The hypotheses are:

- (H1) `T̄` is absolutely irreducible;
- (H2) `T^†∘c ≅ T ⊗ χ_cyc^t` as `O[G_F]`-modules, where `(T^†∘c)(g) = T^†(cgc^{−1})`;
- (H5) there is `z ∈ G_{F(μ_{p^∞})}` acting on `T̄` by a scalar `ϑ ∈ k^×` with `ϑ² ≠ 1`;
- (H6) `H⁰(F_v, T̄^†) = 0` for every finite place `v ∈ S` not above `p`.

(H6) holds at `v` as soon as some element of the inertia group at `v` acts on `T̄` without the eigenvalue `1`: it then
acts on `T̄^†` without the eigenvalue `1`, since `χ̄_cyc` is trivial on inertia at `v ∤ p`.

**Normalisation of `z`.** Replacing `z` by `z^ϵ`, `ϵ ∈ Ẑ` the idempotent with image `0` in `ℤ_p` and `1` in `∏_{q≠p}ℤ_q`,
keeps `z` in `G_{F(μ_{p^∞})}` and does not change `ϑ` (its order is prime to `p`); so we assume, as we may, that `z` has
pro-order prime to `p`. Then: (a) `z` acts on `T` by the Teichmüller scalar `[ϑ]` (its image in `GL(T)` is `[ϑ]` times a
commuting element of the pro-`p` kernel of reduction, and has order prime to `p`), so every commutator `[g, z]`, `g ∈ G_F`,
acts trivially on `T`; (b) every continuous homomorphism `G_F → ℤ/p^M` vanishes on `z`, so `κ(z) = 1` for every `κ` as
above; (c) `z` has trivial image in every finite `p`-group quotient of `G_{F(μ_{p^∞})}`; (d) for every ideal `𝔞 ⊆ O` and
every closed normal subgroup `N ⊆ G_F` containing `z`, `z` is central modulo `ker(T/𝔞T) ∩ N` (the commutators lie in `N`
and act trivially on `T`).

(H5) gives `H⁰(G_F, T̄) = 0 = H⁰(G_F, T̄^†)` (`z` acts by `ϑ` and by `ϑ^{−1}`). Which target uses which: (2) and 3.23 use the
Selmer data, the balance and `H⁰(G_F, T̄) = 0 = H⁰(G_F, T̄^†)` only; (1) uses the CM data only; 3.24(1) uses (H5) and
(H2); 3.24(4) uses (H1), (H2), (H5), (H6) and the balance; 3.25–3.26 use all of them.

For `M ≥ 1` put `V_M := {x ∈ F^× : v(x) ≡ 0 (mod p^M) for every finite place v ∤ p}`, `𝒢_M := F(μ_{2p^M}, V_M^{1/p^M})` and
`H_M := G_{𝒢_M}`. Prove:

1. (*tame anticyclotomic characters*, CM data) `𝒢_M/F` is finite, unramified outside the places above `p`, Galois over
   `F⁺`, and abelian of exponent dividing `p^M` over `F(μ_{2p^M})`; so `H_M` is open and normal in `G_{F⁺}`, and `z ∈ H_M` by
   (c). Every place `𝔭` of `F` of degree one over `ℚ` and split over `F⁺` (`c𝔭 ≠ 𝔭`), not above `p`, that splits completely
   in `𝒢_M` (hence has `N(𝔭) ≡ 1 (mod 2p^M)`) carries a continuous anticyclotomic `d_𝔭 : G_F → ℤ/p^M`, trivial on the
   decomposition groups above `p`, unramified outside `{𝔭, c𝔭}` and surjective on the inertia groups at `𝔭` and at `c𝔭`;
2. (*presentation*) if `ℒ` is balanced and `H⁰(G_F, T̄) = 0 = H⁰(G_F, T̄^†)`, there is a square matrix `Φ ∈ M_{n_Q}(𝔪_Λ)`,
   `n_Q = dim_k Sel_Q(T̄)`, with `Sel_Q(T ⊗ κ^{−1} ⊗ B) ≅ ker(Φ : B^{n_Q} → B^{n_Q})` naturally in `B`; `det Φ` generates the
   zeroth Fitting ideal of `𝔐_Q := Λ^{n_Q}/(rows of Φ)`, so it is determined by the functor up to a unit of `Λ`. Moreover the
   isomorphism is given by a *universal cocycle*: there is a continuous map `Z` from `G_F` to `Hom_Λ(Λ^{n_Q}, T ⊗_O Λ)` such that
   for every `B` and every `ξ ∈ ker(Φ | B^{n_Q})`, `g ↦ Z(g)ξ` (the image of `Z(g)` under `e_j ↦ ξ_j`) is a cocycle with class in
   `Sel_Q(T ⊗ κ^{−1} ⊗ B)`, it is a coboundary only if `ξ = 0`, and every Selmer class is the class of exactly one such
   cocycle; for an `O`-algebra map `ev : Λ → A` the images `ev(Φ)`, `ev(Z)` have the same property for the discrete
   `p`-power-torsion `A`-modules;
3. (*square presentations of left-exact functors*) let `Λ′` be a complete Noetherian local ring with maximal ideal `𝔪′` and
   finite residue field `k′`; call a `Λ′`-module *torsion* if it is the union of its submodules of finite length
   (equivalently, every element is killed by a power of `𝔪′`). Let `𝔉` be an additive `Λ′`-linear functor on `Λ′`-modules
   which on torsion modules is left exact, has every element in the image of a finitely generated submodule, and
   satisfies: for `0 → K → B → B″ → 0` with `K` simple, `𝔉(K)` is finite and `#coker(𝔉(B) → 𝔉(B″)) ≤ #𝔉(K)`. Then
   `𝔉(B) ≅ ker(Φ : B^{n_𝔉} → B^{n_𝔉})` naturally in torsion `B`, with `Φ ∈ M_{n_𝔉}(𝔪′)` and `n_𝔉 = dim_{k′}𝔉(k′)`.

*Route.* (1) `V_M` is `c`-stable and contains `F^{×p^M}` with finite quotient (finiteness of the class group and of the
`p`-units), so `𝒢_M` is finite and Galois over `F⁺`; it is unramified at `v ∤ p` because `v(x) ≡ 0 (mod p^M)` there.
Let `𝔭` split completely in `𝒢_M`. The map `k_𝔭^×/p^M → C/p^M`, `C = 𝔸_F^×/(F^×·∏_{v|p}F_v^×·∏_{v∤p𝔭}𝒪_v^×·U_𝔭^{(1)}·F_∞^×)`, is
injective: an element of the kernel is, up to a `p^M`-th power, the image of some `x ∈ V_M`, which is a `p^M`-th power at
`𝔭` because `x^{1/p^M} ∈ 𝒢_M`. Since `k_𝔭^×/p^M` is cyclic of order `p^M` and `ℤ/p^M` is self-injective, its image is a direct
summand of `C/p^M`; class field theory (ClassFieldTheory Layer 13) gives `χ′ : G_F → ℤ/p^M` unramified outside `𝔭`,
trivial on the decomposition groups above `p` and surjective on `I_𝔭`. Put `d_𝔭 := χ′ − χ′∘c`; as `𝔭` is split over `F⁺`,
`c𝔭 ≠ 𝔭`, so `d_𝔭` restricts to `χ′` on `I_𝔭` and to `−χ′∘c` on `I_{c𝔭}`. (3) Left exactness and the finiteness
condition make `𝔉` pro-representable on torsion modules, `𝔉 = Hom_{Λ′}(𝔐, −)` with `𝔐` generated by `n_𝔉` elements; the
number of relations of a minimal presentation of `𝔐` is `dim Ext¹(𝔐, k′)`, which is the cokernel of `𝔉(I) → 𝔉(I/k′)` for an
injective hull `I` of `k′`, hence `≤ n_𝔉`; pad the relations with zeros to a square matrix, whose entries lie in `𝔪′` by
minimality. (2) Apply (3) to `B ↦ Sel_Q(T ⊗ κ^{−1} ⊗ B)`. At `v | p` use the local complex `U_v ⊆ C(F_v, T)` of all
`0`-cochains and the `1`-cocycles with class in `ℒ_v`, tensored with `B`: then `H⁰(U_v ⊗ B) = H⁰(F_v, T ⊗ B)` and its `H¹`
is the image of `ℒ_v ⊗ B`; because `ℒ_v` contains the torsion of `H¹(F_v, T)`, the kernel of
`H¹(F_v, T ⊗ B′) → H¹(F_v, T ⊗ B)` for `B′ ⊂ B` lies in the image of `ℒ_v ⊗ B′`, which makes the condition left exact, and
the functor is left exact because `H⁰(G_F, T ⊗ B) = 0` for torsion `B` (dévissage from `H⁰(G_F, T̄) = 0`); it commutes
with filtered colimits. The cokernel condition: the Selmer complex of SelmerIwasawaCohomology §2.21 built from these `U_v`, the full local
complexes at the finite places of `Q ∪ S` not above `p` and the unramified complexes elsewhere has Euler characteristic `0`
over `k`. Indeed `χ(U_v ⊗ k) = h⁰(F_v, T̄) − dim(ℒ_v ⊗ k) = rank H⁰(F_v, T) − rank ℒ_v` (the torsion of `H¹(F_v, T)` adds the
same amount to both terms), the global and local Euler characteristic formulas (ArithmeticGaloisDuality §R02.4.4,
ClassFieldTheory Layer 5) and the balance give `Σ_{v|∞}(h⁰(F_v, T̄) − rank H⁰(F_v, T)) = 0` under `(P)`; with `h⁰ = 0` and
`h³ = h⁰(G_F, T̄^†) = 0` (duality, ArithmeticGaloisDuality §D7.7.4) the obstruction space `H²` over `k` has dimension
`dim Sel_Q(T̄)`; the relaxed places of `Q` and `S` contribute local `H²` to it, which this count includes (Poitou–Tate,
ArithmeticGaloisDuality §R02.4.3). For `0 → k → B → B″ → 0` the Selmer complexes of `T ⊗ κ^{−1} ⊗ k`, `T ⊗ κ^{−1} ⊗ B`,
`T ⊗ κ^{−1} ⊗ B″`, built termwise from continuous cochains with values in `T ⊗_O (·)` and from the `U_v ⊗_O (·)`, form a short
exact sequence of complexes (`T` is free, and `Z¹_ℒ` and `C¹(F_v, T)/Z¹_ℒ` are torsion-free, the latter because `ℒ_v` is
saturated, `Z¹_ℒ` the cocycles with class in `ℒ_v`); `H⁰(U_v ⊗ B) = H⁰(F_v, T ⊗ B)` and `H¹(U_v ⊗ B) → H¹(F_v, T ⊗ B)` is
injective (`Z¹_ℒ ⊗ B → C¹ ⊗ B` is, by the same torsion-freeness), so SelmerIwasawaCohomology §2.22 identifies the `H¹` of each complex with the
Selmer group (`H⁰(G_F, T ⊗ B) = 0`), and the long exact sequence puts `coker(𝔉(B) → 𝔉(B″))` inside the obstruction space
over `k`, of dimension `dim Sel_Q(T̄) = dim_k 𝔉(k)`. So (3) applies: `𝔉 = Hom_Λ(𝔐_Q, −)` on torsion modules with
`𝔐_Q = Λ^{n_Q}/(rows of Φ)` (a vector `ξ ∈ B^{n_Q}` defines a map `𝔐_Q → B` exactly when `Φξ = 0`); the zeroth Fitting ideal of a
finitely presented module does not depend on the presentation, and two generators of a principal ideal of a local ring
differ by a unit. *The universal cocycle* is the image of the tautological element under the pro-representing isomorphism
of (3): passing to the inverse limit over the finite quotients `𝔐_Q/𝔪_Λ^j𝔐_Q` (continuous cohomology with finite
coefficients commutes with this limit), `Sel_Q(T ⊗ κ^{−1} ⊗ 𝔐_Q) ≅ Hom_Λ(𝔐_Q, 𝔐_Q)`; a cocycle with the class of the identity,
lifted to a continuous cochain with values in `T ⊗_O Λ^{n_Q} = Hom_Λ(Λ^{n_Q}, T ⊗_O Λ)`, is `Z`. For `ξ ∈ ker(Φ | B^{n_Q})`,
`g ↦ Z(g)ξ` is the pushforward of that cocycle along `ξ : 𝔐_Q → B` (it does not depend on the lift), and by naturality its
class is the one attached to `ξ`; this gives the three properties, and they hold over `A` because the functor on
`A`-modules is the restriction of the functor on `Λ`-modules. *Needs:* SelmerIwasawaCohomology §§2.6, 2.13, 2.19, 2.21, 2.22, 3.0;
ArithmeticGaloisDuality §§R02.4.2–R02.4.4, R02.5.1, D7.7.4; ClassFieldTheory Layers 5, 13 (local Euler characteristic; ray
class fields); Mathlib `Ideal.fittingIdeal` (or the Fitting ideals of finitely presented modules).

**Checks.**

- `J = ∅`: `Λ = O`, and (2) presents the relaxed Selmer group of `T ⊗ B` itself.
- The matrix is square because of the balance: without it the Euler characteristic of the Selmer complex is nonzero, and
  either the twisted Selmer groups or their duals have positive corank for every twist.
- In (3), the functor `Hom_{Λ′}(Λ′/𝔪′², −)` on `Λ′ = O` is left exact with `n_𝔉 = 1` and the cokernel condition holds;
  it is `ker(λ²)`, the `1 × 1` matrix `(λ²)` with entry in `𝔪′`.
- In (1) the governing field matters: for a place `𝔭` that does not split in `𝒢_M`, some `x/c(x)`, `x ∈ V_M`, need not be a
  `p^M`-th power modulo `𝔭`, and then no character of order `p^M` as in (1) exists at `𝔭`.
- In (1) "split over `F⁺`" is needed: at a degree-one place `𝔭 = c𝔭` ramified in `F/F⁺`, `c` acts trivially on `k_𝔭^×`, so
  `χ′ − χ′∘c` is unramified at `𝔭`.

### 3.23 Lengths of twists as valuations of a specialised determinant

Let `Φ`, `n_Q` be as in 3.22(2) and `𝐅 ∈ O[X_j : j ∈ J]` a lift of `det Φ` under `X_j ↦ [e_j] − 1`, `e_j` the generator of
the `j`-th factor. Let `O′ ⊇ O` be the integers of a finite extension `E′` containing `μ_{p^M}`, with normalized valuation
`v′`; for `u = (u_j) ∈ μ_{p^M}(O′)^J` put `ψ_u = ∏_ju_j^{d_j} : G_F → O′^×`. Prove

`length_{O′} Sel_Q(T ⊗ ψ_u^{−1} ⊗ E′/O′) = v′(𝐅((u_j − 1)_j))`,

both sides infinite when `𝐅((u_j − 1)_j) = 0`, the Selmer group having the conditions of 3.22 (the image of `ℒ_v ⊗ E′/O′`
above `p`).

*Route.* The `O`-algebra map `sp_u : Λ → O′`, `[e_j] ↦ u_j`, carries `κ^{−1}` to `ψ_u^{−1}`; take `B = E′/O′` with `Λ` acting
through `sp_u` in 3.22(2): `Sel_Q(T ⊗ ψ_u^{−1} ⊗ E′/O′) = ker(sp_u(Φ))` on `(E′/O′)^{n_Q}`. The kernel of a square matrix over a
discrete valuation ring on `(E′/O′)^{n_Q}` has length `v′(det)` (Smith normal form), and `det sp_u(Φ) = 𝐅(u − 1)`. The condition
above `p` is the image of `ℒ_v ⊗ B` for every `B`, so it is the same for `T ⊗ ψ_u^{−1}` and `T`: `ψ_u` is trivial there.
*Needs:* 3.22; Mathlib `Matrix.det`, `Module.length`, Smith normal form over a PID.

**Checks.**

- `n_Q = 1`, `Φ = ([e_j] − 1)` for one `j`, `u_j` a primitive `p^m`-th root of unity: the length is
  `v′(u_j − 1) = e(O′/ℤ_p)/(p^{m−1}(p − 1))`, a positive integer; divided by `length_{O′}(O′/p) = e(O′/ℤ_p)` it is
  `1/(p^{m−1}(p − 1))`, which tends to `0` as `m` grows. `u_j = 1` gives an infinite Selmer group.
- With `ψ_u` in place of `ψ_u^{−1}` the formula holds with `𝐅((u_j^{−1} − 1)_j)`; the sign of the twist matters when `𝐅` is
  not symmetric.

### 3.24 Auxiliary places in position

Keep the CM data with (H1), (H2), (H5), (H6), fix `z` as in (H5), normalised, and `M ≥ 1`. Fix an open subgroup
`L ⊆ H_M` (so `L ⊆ G_{F(μ_{2p^M})}`), normal in `G_{F⁺}`, acting trivially on `T̄`, such that `z` is central modulo `L` (every
commutator `[g, z]`, `g ∈ G_F`, lies in `L`) and `L` contains the inertia group of every place outside a finite set
`S_L ⊇ S`. The standard choice is `L = ker(T/𝔞T) ∩ H_M` for an ideal `p^MO ⊆ 𝔞 ⊆ λO` (for instance `𝔞 = λO`), with
`S_L = S`: it is normal in `G_{F⁺}` because by (H2) conjugation by `c` carries `ker(T/𝔞T)` onto `ker(T^†/𝔞T^† ⊗ χ_cyc^{−t})`,
which contains `ker(T/𝔞T) ∩ G_{F(μ_{2p^M})}`; `z` is central modulo it by (d) of the normalisation; and `T` and `𝒢_M` are
unramified outside `S`. For integers `R₁ ≥ R₂ ≥ 0` and a finite set `A` of places, a family
`𝔓 = (𝔭_b^{(1)})_{b≤R₁} ⊔ (𝔭_a^{(2)})_{a≤R₂}` of places is **in position** (at level `M`, relative to `z` and `L`) if every
member has degree one over `ℚ`, is split over `F⁺`, lies outside `S_L ∪ A ∪ cA` and splits completely in `𝒢_M` (so carries a
character `d_𝔭` as in 3.22(1)); no two members are equal or conjugate under `c`; `Frob_{𝔭_b^{(1)}}` is conjugate to an element of `zL` (the
*first-half* places); the decomposition group at `𝔭_a^{(2)}` acts trivially on `T̄` and on `μ_p` (the *second-half* places);
and `d_{𝔭_b^{(1)}}(Frob_{𝔭_a^{(2)}}) = δ_{ab}` for all `a ≤ R₂`, `b ≤ R₁` (the first-half places with `b > R₂` are *unpaired*).
Then take `J = 𝔓`, `Q = 𝔓 ∪ c𝔓` in 3.22. At `𝔭_a^{(2)}` fix a Frobenius element `φ_a` and a tame inertia element `γ_a`
with `d_{𝔭_a^{(2)}}(γ_a) = 1`; write `⟨·,·⟩ : T̄ × T̄^† → k(1)` for the duality pairing, read as `k`-valued on elements that
fix `μ_p`. Prove:

1. (*first half*) at `𝔭_b^{(1)}` and `c𝔭_b^{(1)}`, `H^i(F_v, T ⊗ κ^{−1} ⊗ B) = 0 = H^i(F_v, T^† ⊗ κ ⊗ B)` for `i = 0, 1, 2` and
   every `p`-power-torsion `Λ`-module `B`;
2. (*tame relation over the dual numbers*) let `D = ⟨φ, γ⟩` be a tame quotient with `φγφ^{−1} = γ^N`, `N ≡ 1 (mod 2p^M)`,
   acting trivially on `T̄`, `K ⊇ k` a field and `μ : D → K` additive; if `ω` is a `1`-cocycle of `D` with values in
   `T̄ ⊗ K[ε]/(ε²)` for the action through `1 + εμ`, with leading part `ω₀`, then `μ(γ)·ω₀(φ) = μ(φ)·ω₀(γ)`;
3. (*reciprocity*) there are `u_a ∈ k^×` with
   `Σ_a u_a(⟨x(γ_a), y(φ_a)⟩ − ⟨x(cγ_ac^{−1}), y(cφ_ac^{−1})⟩) = 0` for all `x ∈ Sel_Q(T̄)` and `y ∈ Sel_∅(T̄^†)`;
4. (*choice of Frobenius classes*) (a) `dim_k Sel_∅(T̄) = dim_k Sel_∅(T̄^†)`; (b) for `Λ`, `κ` as in 3.22 (any `J`, `d_j`)
   and every `p`-power-torsion `Λ`-module `B`, restriction to `L` is injective on `H¹(G_F, T ⊗ κ^{−1} ⊗ B)` and on
   `H¹(G_F, T^† ⊗ κ ⊗ B)`, in particular on `H¹(G_F, T̄)` and `H¹(G_F, T̄^†)`; (c) there is `R ≤ (dim_k Sel_∅(T̄))²` such that
   for every `L` as above there are `h_1, …, h_R ∈ L` and an open subgroup `L′ ⊆ L`, normal in `G_{F⁺}`, with: whenever each
   `φ_a` lies in the class of `h_a` modulo `L′`, for some `θ⁰ ∈ k^R` the pairing
   `B(x, y) = Σ_a θ⁰_a(⟨x(φ_a), y(φ_a)⟩ − ⟨x(cφ_ac^{−1}), y(cφ_ac^{−1})⟩)` on `Sel_∅(T̄) × Sel_∅(T̄^†)` has left kernel of
   dimension at most `e`, where `e = 0` if `T̄ ≇ T̄ ⊗ χ̄_cyc^t` and `e = 1` otherwise; in the second case `χ̄_cyc^{tr} = 1`.
   For every `M`, every such `L`, every `R₁ ≥ R₂ = R` and every `A` there are families in position (at level `M`,
   relative to `z` and `L`) whose second-half Frobenius elements lie in these classes.

*Route.* (1) The place is tame with `N(𝔭) ≡ 1 (mod p)`. Frobenius at `𝔭_b^{(1)}` acts on `T̄` as `ϑ` and on `T̄^†` as `ϑ^{−1}`
(it fixes `μ_p`); at `c𝔭_b^{(1)}` its conjugate by `c` acts on `T̄` as `ϑ^{−1}` and on `T̄^†` as `ϑ`, by (H2). None of these is
`1`, and `κ ≡ 1` modulo `𝔪_Λ`; so `H⁰ = 0` by dévissage on `B`, `H² = 0` by local duality and `H¹ = 0` by the local Euler
characteristic (ClassFieldTheory Layer 5). (2) Compare `ω(φγ) = ω(φ) + ω(γ) + εμ(φ)ω₀(γ)` with
`ω(γ^Nφ) = ω(γ^N) + ω(φ) + εμ(γ)ω₀(φ)`; in characteristic `p`, `ω(γ^N) = Nω(γ) + εN(N−1)/2·μ(γ)ω₀(γ) = ω(γ)` because
`2p | N − 1`. (3) For every additive `λ₀ : k → 𝔽_p` the sum over all places of the local invariants of `λ₀(x ∪ y)` vanishes
(Poitou–Tate, ArithmeticGaloisDuality §R02.4.3). The local conditions are orthogonal at every place outside `Q`: above `p`
by definition of `ℒ_v(k)^⊥`, at the finite places of `S` not above `p` because `y` is zero there, elsewhere because
unramified classes annihilate each other (ArithmeticGaloisDuality §R02.4.2). At the first-half places all terms vanish by (1). The tame formula is
part of this target: at a place `v ∤ p` with `N(v) ≡ 1 (mod p)` whose decomposition group acts trivially on `T̄` and `μ_p`,
`H¹(F_v, T̄)` is the group of homomorphisms of the tame quotient, and for `y` unramified the local pairing is
`u_v·⟨x(γ_v), y(φ_v)⟩` with `u_v ∈ k^×` fixed by the choice of `γ_v` and the invariant `H²(F_v, k(1)) ≅ k` (ClassFieldTheory
Layer 5). At `c𝔭_a^{(2)}`, with the generators `cγ_ac^{−1}`, `cφ_ac^{−1}`, the constant is `−u_v`, because `c` acts on `μ_p` by
inversion and so transports the tame identification at `𝔭_a^{(2)}` to minus that at `c𝔭_a^{(2)}`; put `u_a = u_{𝔭_a^{(2)}}`.
(4a) The Greenberg–Wiles formula (ArithmeticGaloisDuality §R02.5.1) for `Sel_∅(T̄)` and `Sel_∅(T̄^†)` gives the difference of
dimensions as `Σ_{v|p}(dim ℒ_v(k) − h⁰(F_v, T̄)) − Σ_{v|∞}h⁰(F_v, T̄) + Σ_{v∈S, v∤p∞} h²(F_v, T̄)`. For a saturated condition
containing the torsion, `dim ℒ_v(k) − h⁰(F_v, T̄) = rank ℒ_v − rank H⁰(F_v, T)` (the torsion of `H¹(F_v, T)` contributes
`h⁰(F_v, T̄) − rank H⁰(F_v, T)`), so the first two terms cancel by the balance; and `h²(F_v, T̄) = h⁰(F_v, T̄^†) = 0` by local
duality and (H6). (4b) By (a) and (b) of the normalisation, `z` acts on `T ⊗ κ^{−1} ⊗ B` by `[ϑ]` and on `T^† ⊗ κ ⊗ B` by
`[ϑ]^{−1}` (`z` fixes `μ_{p^∞}`); `z` is central in `G_F/L`, and inner automorphisms act trivially on cohomology
(ProfiniteCohomology §2.4), so `[ϑ]^{±1} − 1`, a unit, kills `H¹(G_F/L, (T ⊗ κ^{−1} ⊗ B)^L)` and
`H¹(G_F/L, (T^† ⊗ κ ⊗ B)^L)`; inflation–restriction (ProfiniteCohomology §5.4) gives (b). (4c) By (b), classes restricted to
`L` are `G_F`-equivariant homomorphisms. The four modules `T̄`, `T̄^†`, `T̄∘c`, `T̄^†∘c` are absolutely irreducible; `z` acts
on them by `ϑ`, `ϑ^{−1}`, `ϑ^{−1}`, `ϑ` (by (H2)), so the only possible isomorphism among them is `T̄ ≅ T̄^†∘c`, which by (H2)
means `T̄ ≅ T̄ ⊗ χ̄_cyc^t`. If it does not hold, for independent classes `x_a` of `Sel_∅(T̄)` and `y_b` of `Sel_∅(T̄^†)` the
image of `L` in `⊕T̄ ⊕ ⊕T̄^† ⊕ ⊕T̄∘c ⊕ ⊕T̄^†∘c` spans (Goursat), and polarisation of
`Σc_{ab}(⟨x_a(h), y_b(h)⟩ − ⟨x_a(chc^{−1}), y_b(chc^{−1})⟩)` shows that the forms `h ↦ (x, y) ↦ ⟨x(h), y(h)⟩ − ⟨x(chc^{−1}), y(chc^{−1})⟩`, `h ∈ L`, span all bilinear forms on `Sel_∅(T̄) × Sel_∅(T̄^†)`; with (a) a nondegenerate combination exists,
using at most `(dim Sel_∅(T̄))²` of them. If it holds, transport `Sel_∅(T̄^†)` to a subspace `W′ ⊂ H¹(G_F, T̄)` through
`T̄^† ≅ T̄∘c` and `c`; the invariant pairing `B_A` of `T̄` so obtained satisfies `B_A^T = ηB_A`, `η = ±1` (Schur), and the same
polarisation shows that the tensors killed by all the forms are the `η`-symmetric tensors on `U = Sel_∅(T̄) ∩ W′`. A form
that is alternating on `U × U` when `η = 1` (symmetric and nondegenerate when `η = −1`), nondegenerate between complements
of `U`, and zero on the cross terms is in the span and has left kernel of dimension at most `1`. When `r` is odd and `p` is
odd, `η = 1` (an invertible antisymmetric matrix has even size), and the corank of an alternating form is the parity of
`dim U`. Taking determinants in `T̄ ≅ T̄ ⊗ χ̄_cyc^t` gives `χ̄_cyc^{tr} = 1`. Let `L′` be the intersection of `L` with the
kernels of the restrictions to `L` of all classes of `Sel_∅(T̄)` and `Sel_∅(T̄^†)` and with its conjugate by `c`. The places:
choose the first-half places first, by Chebotarev for degree-one places (Chebotarev (Completed) Layers 10, 14, with
ArithmeticDirichletSeries (Completed) §5.3 for the places of higher degree; a degree-one place unramified in `F/F⁺` is split
over `F⁺`, and the ramified ones are finitely many) in the class of `z` modulo `L`; then the
second-half places in the classes of `h_ag_a` modulo `L′ ∩ ⋂_bker d_{𝔭_b^{(1)}}`, where `g_a` is a product of inertia elements
at the `𝔭_b^{(1)}` (in `L`, as `𝔭_b^{(1)} ∉ S_L`) with `d_{𝔭_b^{(1)}}(h_ag_a) = δ_{ab}`: the classes of `Sel_∅(T̄)` and `Sel_∅(T̄^†)` are
unramified at the `𝔭_b^{(1)}`, so they take the same values at `h_ag_a` as at `h_a`. *Needs:* 3.22; SelmerIwasawaCohomology §§2.13, 2.19;
ArithmeticGaloisDuality §§R02.4.2 (local Tate pairing, unramified orthogonality), R02.4.3 (Poitou–Tate), R02.5.1
(Greenberg–Wiles); ClassFieldTheory Layer 5 (local duality, local Euler characteristic, the invariant); ProfiniteCohomology
§§2.4, 5.4; Chebotarev (Completed) Layers 10, 14; ArithmeticDirichletSeries (Completed) §5.3.

**Checks.**

- In (2) the hypothesis `2p | N − 1` is used at `p = 2`: for `p = 2` and `N ≡ 3 (mod 4)` the term `N(N−1)/2` is odd and the
  relation acquires the extra term `μ(γ)ω₀(γ)`.
- In (4c), for `T̄ ≅ T̄ ⊗ χ̄_cyc^t`, `e = 1` cannot be improved to `0` when the transported dual group `W′` equals `Sel_∅(T̄)`,
  `η = 1` and `dim Sel_∅(T̄)` is odd: an alternating form on a space of odd dimension is degenerate. When `W′ ≠ Sel_∅(T̄)`, a
  form whose alternating corner on `U` has odd size can still be invertible on `Sel_∅(T̄) × Sel_∅(T̄^†)`.
- (*the hypothesis (H6)*) Enlarging `S` by one unramified place `v` at which `Frob_v` has the eigenvalue `N(v)` on `T̄` (so
  `H⁰(F_v, T̄^†) ≠ 0`) changes the conditions at `v` to "none" for `T̄` and "zero" for `T̄^†`, and makes
  `dim Sel_∅(T̄) − dim Sel_∅(T̄^†) = h⁰(F_v, T̄^†) > 0`: (4a) fails, and with it (4c) once the difference exceeds `e`.
- (*a scalar `z`*) If `z` only had no eigenvalue `1` on `T̄`, a class inflated from `Gal(F(T̄, μ_p)/F)` could restrict to
  zero on `L`: such a class lies in the left kernel of every form in (4c). The scalar action is what kills these classes
  in (4b).

### 3.25 The residual determinant bound

Let `𝔓` be a family in position (3.24) with `R` second-half places (and `R₁ ≥ R` first-half places), with
`4rR + 2 < p^M`, and suppose that for its second-half Frobenius elements and some `θ⁰` the pairing of 3.24(4c) has left
kernel of dimension at most `e ∈ {0, 1}`. Let `Φ ∈ M_{n_Q}(𝔪_Λ)` be the presentation of 3.22(2) for `Q = 𝔓 ∪ c𝔓`. Prove: if
`e = 0`, every lift `𝐅 ∈ O[X_q : q ∈ 𝔓]` of `det Φ` has a coefficient that is a unit of `O` on a monomial of total degree
at most `4rR` not involving the variables of the unpaired first-half places; if `e = 1`, either `n_Q = 0` or some entry of the
adjugate of `Φ` has a lift with a unit coefficient on a monomial of total degree at most `4rR` not involving those
variables.

*Route.* Work over the field `K = k((σ))` of Laurent series in an indeterminate `σ`. For the direction `b_{(2),a} = σ·β_a`,
`b_{(1),a} = 1 − Σ_{a′}σβ_{a′}d_{𝔭_{a′}^{(2)}}(φ_a)` (with `β_a` the ratio of the reciprocity constants `u_a` of 3.24(3) and the
`θ⁰_a`) and `b_q = 0` on the unpaired first-half places, restrict a lift `Θ` of `Φ` to the line `X_q = b_qY`, giving
`Ψ(Y) ∈ M_{n_Q}(K[Y])`; only monomials not involving the unpaired variables survive. The `O`-algebra map `Λ → K[ε]/(ε²)`,
`[δ] ↦ 1 + εΣ_qb_qδ_q`, sends `Θ` to `Ψ₀ + εΨ₁` and `κ^{−1}` to `1 + εμ` with `μ = −Σ_qb_qd_q`, anticyclotomic, `μ(φ_a) = −1`
and `μ(γ_a) = −σβ_a`. Since the entries of `Φ` lie in `𝔪_Λ`, `Ψ₀ = 0`, so `n_Q = dim Sel_Q(T̄)` and the first-order solutions
are the kernel of `Ψ₁`: by 3.22(2) with `B = K[ε]`, they are Selmer classes over `K[ε]`. The unpaired first-half places
contribute neither classes nor conditions, by 3.24(1). 3.24(2) at `𝔭_a^{(2)}` and its conjugate gives
`ω₀(γ_a) = σβ_aω₀(φ_a)` and `ω₀(cγ_ac^{−1}) = σβ_aω₀(cφ_ac^{−1})`. Expanding `ω₀` in powers of `σ`, the two lowest
coefficients `x₀, x₁` satisfy: `x₀` vanishes on the second-half inertia, hence lies in `Sel_∅(T̄)` by 3.24(1), and the
reciprocity law 3.24(3) applied to `x₁` puts `x₀` in the left kernel of the pairing. With `e = 0` no nonzero vector lifts
to first order, so all elementary divisors of `Ψ` over `K[[Y]]` have order `1` and `ord_Y det Ψ = n_Q`; with `e = 1` some
adjugate entry has order at most `4rR`. And `n_Q ≤ 2rR + e`: the inertia values at the second-half places and their
conjugates map `Sel_Q(T̄)/Sel_∅(T̄)` into a space of dimension `2rR`, on which the reciprocity law 3.24(3) imposes
`dim Sel_∅(T̄^†) − e` independent conditions (the map `y ↦ (y(φ_a), y(cφ_ac^{−1}))_a` has kernel inside the right kernel of the
pairing, of dimension at most `e`), and `dim Sel_∅(T̄) = dim Sel_∅(T̄^†)` by 3.24(4a). If two polynomials `F`, `G` over `O` have
the same image in `Λ`, they are congruent modulo `λ` and the `X_q^{p^M}` (the kernel of `O[X] → Λ` is generated by the
`(1 + X_q)^{p^M} − 1`, which are `X_q^{p^M}` modulo `λ`); so if the restriction of `G` to the line is not divisible by `Y^{4rR+1}`
over `K` and `p^M > 4rR + 2`, then `F` has a unit coefficient in degree at most `4rR`, on a monomial not involving the unpaired
variables. *Needs:*
3.22, 3.24; Mathlib `Matrix.adjugate`, Smith normal form over `K[[Y]]`.

**Checks.**

- If `Sel_Q(T̄) = 0`, then `n_Q = 0`, `det Φ = 1`, and the conclusion holds with the constant term.
- The conclusion does not depend on the lift: the lifts of `0` form the ideal generated by the `(1 + X_q)^{p^M} − 1`, and
  `(1 + X)^{p^M} − 1` has all its coefficients in degree below `p^M` divisible by `p`, so every element of that ideal has all
  coefficients in degree below `p^M` divisible by `λ`; this is where `p^M > 4rR + 2` enters.

### 3.25a The determinant bound when `T̄ ≅ T̄ ⊗ χ̄_cyc^t`

Keep the CM data with (H1), (H2), (H5), (H6), and assume `T̄ ≅ T̄ ⊗ χ̄_cyc^t` and `tr ≠ 0`. Let `ν` be the largest integer
with `χ_cyc^{tr} ≡ 1 (mod p^ν)` on `G_F` (`ν ≥ 1` by 3.24(4c)), `ν_λ := v_λ(p^ν) = ν·e(O/ℤ_p)` and `𝔞_ν := λp^νO = λ^{ν_λ+1}O`.
Assume `M ≥ ν + 2` and that the subgroup `L` of 3.24 acts trivially on `T/𝔞_νT` (for instance `L = ker(T/𝔞_νT) ∩ H_M`);
families in position are relative to `z` and this `L`. For a family `𝔓` in position and `n ≤ p^{M−ν}`, say that `𝔓` has
`NF(n)` if a lift of `det Φ` (3.22(2) for `Q = 𝔓 ∪ c𝔓`) has a coefficient outside `𝔞_ν`, that is of valuation at most `ν_λ`,
on a monomial of total degree less than `n`; this does not depend on the lift, since the coefficients of `(1 + X)^{p^M} − 1`
in degree below `p^{M−ν}` lie in `p^{ν+1}O ⊆ 𝔞_ν`.

*Test data and dual Selmer groups.* For a family `𝔓` in position and `1 ≤ N ≤ p^{M−ν}`, a **test datum of length `N`** is
the ring `C := (O′/𝔞_ν)[τ]/(τ^N)`, `O′ ⊇ O` the integers of a finite unramified extension, with constants `a_q ∈ C`
(`q ∈ 𝔓`), units at the second-half places; then `ev : Λ → C`, `[e_q] ↦ 1 + a_qτ`, is an `O`-algebra map (the coefficients
of `(1 + X)^{p^M} − 1` below degree `p^{M−ν}` lie in `𝔞_ν`). More generally, for a finite `O`-algebra `A` with an `O`-algebra
map `ev : Λ → A` (through which `κ` acts) put `A^∨ := Hom_{ℤ_p}(A, ℚ_p/ℤ_p)`, and let `Sel^*_Q(T^† ⊗ κ ⊗ A)` be the classes of
`H¹(G_F, T^† ⊗_O A(κ))` that are zero at the finite places of `S ∪ Q` not above `p`, unramified at the other places not above
`p`, and at `v | p` orthogonal to the image of `ℒ_v ⊗ A^∨` under the local pairing
`H¹(F_v, T ⊗ A^∨) × H¹(F_v, T^† ⊗ A) → ℚ_p/ℤ_p`; likewise `Sel^*_Q(T^† ⊗ κ ⊗ B′)` for a finite `A`-module `B′`, with `B′^∨` in place of
`A^∨`. The duality pairing of 3.24 extends to the `A`-bilinear pairing
`⟨·,·⟩_A : (T ⊗_O A) × (T^† ⊗_O A) → A(1)`, `⟨t ⊗ ζ, s ⊗ ζ′⟩_A := ⟨t, s⟩·ζζ′` (`⟨t, s⟩ ∈ O(1)` the duality of `T` and `T^†`); when `A`
is killed by `p^M` (as test data are, `M ≥ ν + 2`), it is read as `A`-valued on elements of `G_F` that fix `μ_{p^M}` (a generator of
`μ_{p^M}` being fixed once).

*Bordered data.* Let `𝔓` have an unpaired first-half place `q₀`, put `L₁ := L ∩ ⋂_{q∈𝔓, q≠q₀}ker d_q` (normal in `G_{F⁺}`, the
`d_q` being anticyclotomic, with `z` central modulo it, as `d_q(z) = 0`), and let `𝔮` be a place such that `𝔓′ := 𝔓 ∪ {𝔮}`, with
`𝔮` a second-half place paired with `q₀`, is in position and the Frobenius elements at `𝔮` lie in `L₁`; fix a tame inertia
generator `γ_𝔮` with `d_𝔮(γ_𝔮) = 1` and a Frobenius element `φ_𝔮` with `d_𝔮(φ_𝔮) = 0` (replace a Frobenius element `φ` by
`φγ_𝔮^{−d_𝔮(φ)}`; `γ_𝔮` lies in `L₁`, as `𝔮 ∉ S_L` and the `d_q`, `q ∈ 𝔓`, are unramified at `𝔮`). So `φ_𝔮` acts trivially on
`T/𝔞_νT`, `d_{q₀}(φ_𝔮) = 1` and `d_q(φ_𝔮) = 0` for `q ∈ 𝔓`, `q ≠ q₀`. Let `C` be a test datum for `𝔓` with `a_{q₀} = 0`, `Φ`, `Φ′`
the presentations of 3.22(2) for `𝔓`, `𝔓′`, with universal cocycles `Z`, `Z′`, `D := C[x₁, x₂]/(x₁², x₂^{2r})`, and
`ev′ : Λ′ → D` the map with `X_q ↦ a_qτ` (`q ≠ q₀`), `X_{q₀} ↦ x₂`, `X_𝔮 ↦ x₁` (an `O`-algebra map when `2r ≤ p^{M−ν−1}`: the
coefficients of `(1 + X)^{p^M} − 1` in degree below `2r` then lie in `p^{ν+1}O`). For classes `x` of `T ⊗ κ^{−1} ⊗ C` and `y` of
`T^† ⊗ κ ⊗ C` that restrict to homomorphisms on `L₁` put
`[x, y]_𝔮 := ⟨x(φ_𝔮), y(φ_𝔮)⟩_C − ⟨x(cφ_𝔮c^{−1}), y(cφ_𝔮c^{−1})⟩_C ∈ C`.

Prove:

1. (*one more second-half place*) let `𝔓` have `R` second-half places and an unpaired first-half place `q₀`, suppose an entry
   of the adjugate of `Φ` has a lift with a unit coefficient on a monomial of total degree at most `w` not involving the
   variables of the unpaired first-half places (for instance `w = 4rR` by 3.25 with `e = 1`), put `N := 2(ν_λ + 1)w + 2`, and
   assume `N + 2r ≤ p^{M−ν−1}`. Then `𝔓` has `NF(N)`, or there are infinitely many places `𝔮` such that `𝔓 ∪ {𝔮}`, with `𝔮` a
   second-half place paired with `q₀` whose Frobenius elements lie in `L₁`, is in position and has `NF(N + 2r)`;
2. (*persistence*) if `𝔓` has `NF(n)` and `𝔓′` is obtained from `𝔓` by adding one second-half place, paired with a first-half
   place of `𝔓`, whose Frobenius elements act trivially on `T/𝔞_νT` (automatic if they lie in `L`), and `n + 2r ≤ p^{M−ν−1}`,
   then `𝔓′` has `NF(n + 2r)`; the same holds for a unit coefficient, on a monomial not involving the variables of the
   unpaired first-half places, of a lift of an entry of the adjugate of `Φ` (it passes to an entry of the adjugate of `Φ′`) or
   of `det Φ` (then triviality on `T̄`, which every second-half place has, suffices). No first-half place is added. By
   induction, adding `n′` such places one at a time gives `NF(n + 2rn′)` when `n + 2rn′ ≤ p^{M−ν−1}`; for several data as in
   3.22 over the same `F`, `p`, `O`, `S`, `z`, `L`, a place whose Frobenius elements lie in `L` serves all of them;
3. (*a dual class*) let `A` be a finite `O`-algebra with an `O`-algebra map `ev : Λ → A` (for instance a test datum), `ρ ∈ A^{n_Q}`
   a row with `ρ·ev(Φ) = 0`, `τ′ ∈ A` an element killing `H⁰(F_v, T^† ⊗ κ ⊗ A)` for every finite place `v ∈ S ∪ Q` not above `p`
   (for a test datum, `τ′ = τ` does, see the route), and `c ∈ A` with `c·τ′·ρ_j ≠ 0` for some `j`. Then some
   `y ∈ Sel^*_Q(T^† ⊗ κ ⊗ A)` has `c·y ≠ 0`;
4. (*the determinant after adding a place*) in the bordered data, with `2r ≤ p^{M−ν−1}`, suppose `det ev(Φ) = 0`, let
   `x ∈ Sel_Q(T ⊗ κ^{−1} ⊗ C)` be the class of the column `adj(ev(Φ))_{·l₀}` (it lies in `ker ev(Φ)`) and
   `y ∈ Sel^*_Q(T^† ⊗ κ ⊗ C)` any class. If `[x, y]_𝔮 ≠ 0`, then `det ev′(Φ′) ≠ 0`.

The clauses 3 and 4 are referred to as (3′) and (4′).

*Route of (3′).* Counting. For a finite `A`-module `B′` with Pontryagin dual `B′^∨`, the Greenberg–Wiles formula
(ArithmeticGaloisDuality §R02.5.1) gives `#Sel_Q(T ⊗ κ^{−1} ⊗ B′^∨) = #Sel^*_Q(T^† ⊗ κ ⊗ B′)·∏_{v∈Q} #H⁰(F_v, T^† ⊗ κ ⊗ B′)`: the
terms above `p` and at `∞` cancel by the balance (the conditions are the images of the saturated `ℒ_v`, as in 3.24(4a)), the
terms at the finite places of `S` not above `p` are `1` by (H6) (dévissage along a composition series, on whose graded pieces
`κ` acts trivially), and the global invariants vanish by (H5). Suppose `c` kills `Sel^*_Q(T^† ⊗ κ ⊗ A)`, and let `y` be a class of
it. Then `cy = dm` for a cochain `m`; the image of `m` in `T^† ⊗ A/cA` is a global invariant, hence `0`, so `m = cm′` and `y − dm′`
has values in `T^† ⊗ A[c]`; at a finite place `v ∈ S ∪ Q` not above `p`, `y = dm_v` and `c(m_v − m′)` is a local invariant, killed
by `τ′`, so `m_v − m′` has values in `T^† ⊗ A[cτ′]`; above `p` the condition for `A[cτ′]`, whose dual is `A^∨/cτ′A^∨`, is the image of
that for `A`. So every class comes from `Sel^*_Q(T^† ⊗ κ ⊗ A[cτ′])`, and `#Sel^*_Q(T^† ⊗ κ ⊗ A) ≤ #Sel^*_Q(T^† ⊗ κ ⊗ A[cτ′])`. The
local factors for `A` and `A[cτ′]` agree (the local invariants are killed by `τ′`, so they lie in `T^† ⊗ A[cτ′]`); with
3.22(2), the formula for `B′ = A` and `B′ = A[cτ′]` gives `#ker(ev(Φ) | (A^∨)^{n_Q}) ≤ #ker(ev(Φ) | (A^∨/cτ′A^∨)^{n_Q})`. An
endomorphism of a finite module has kernel and cokernel of the same order, so the surjection
`coker(ev(Φ) | (A^∨)^{n_Q}) ↠ coker(ev(Φ) | (A^∨/cτ′A^∨)^{n_Q})` is bijective and `cτ′·(A^∨)^{n_Q} ⊆ ev(Φ)·(A^∨)^{n_Q}`; `ρ` kills the
right side, so `cτ′ρ_j` kills `A^∨` and is `0`, against the hypothesis. For a test datum, `τ` kills the local invariants: at
the finite places of `S` not above `p` they vanish by (H6), at the first-half places and their conjugates by 3.24(1), and at
a second-half place (resp. its conjugate) the tame inertia generator acts on the unramified `T^† ⊗ C` through `κ` by
`(1 + a_qτ)^{±1}`, so the invariants are killed by `(1 + a_qτ)^{±1} − 1 = ±a_qτ·unit`, hence by `τ` (`a_q` a unit).

*Route of (4′).* (i) *Universal cocycles* (3.22(2)): the Selmer classes of `T ⊗ κ^{−1} ⊗ C` for `𝔓` are the classes of the
`g ↦ Z(g)ξ`, `ev(Φ)ξ = 0`, and those for `𝔓′` over `D` the classes of the `g ↦ Z′(g)ξ′`, `ev′(Φ′)ξ′ = 0`. For `g ∈ G_F` and a
coordinate `c ≤ r` let `Z(g)_c`, `Z′(g)_c` be the corresponding rows (of length `n_Q`, `n_{Q′}`); the class of `Z′(g)_c` in
`𝔐′ := D^{n_{Q′}}/rows(ev′(Φ′))` is the functional "value at `g`, coordinate `c`" on Selmer classes. (ii) *Tame relations.* On
the tame quotient at `𝔮` the module `T ⊗ κ^{−1} ⊗ D` is unramified, `φ_𝔮` acts by `1 + a` and `γ_𝔮` by `1 + b`, `b² = 0`; a cocycle
`z` there satisfies `a·z(γ_𝔮) = b·z(φ_𝔮)` (compare `z(φ_𝔮γ_𝔮) = z(φ_𝔮) + (1 + a)z(γ_𝔮)` with
`z(γ_𝔮^Nφ_𝔮) = z(γ_𝔮^N) + (1 + b)^Nz(φ_𝔮)`, `N = N(𝔮) ≡ 1 (mod 2p^{ν+1})`, so that `(1 + b)^N = 1 + b` and `z(γ_𝔮^N) = z(γ_𝔮)` on a
module killed by `p^{ν+1}`). As `κ` is anticyclotomic, `(a, b) = ((1 + x₂)^{−1} − 1, (1 + x₁)^{−1} − 1) = (−x₂(1 + x₂)^{−1}, −x₁)` at
`𝔮` and `(x₂, x₁)` at `c𝔮`: the two inversions cancel. Applied to the tautological cocycle with values in `T ⊗ 𝔐′`:
`x₁·Z′(φ_𝔮)_c = x₂·ϵ·Z′(γ_𝔮)_c` and `x₁·Z′(cφ_𝔮c^{−1})_c = x₂·Z′(cγ_𝔮c^{−1})_c` in `𝔐′`, `ϵ := (1 + x₂)^{−1}`. (iii) *Comparison.* Over
`C` (that is, modulo `(x₁, x₂)`), let `𝔑 ⊆ C^{n_{Q′}}` be spanned by the rows of the reduction of `ev′(Φ′)` and the `2r` vectors
`Z′(γ_𝔮)_c`, `Z′(cγ_𝔮c^{−1})_c`. The tautological `𝔓′`-cocycle with values in `T ⊗ C^{n_{Q′}}/𝔑` vanishes at `γ_𝔮` and
`cγ_𝔮c^{−1}`, so it is unramified at `𝔮` and `c𝔮` (inertia acts trivially there, and `γ_𝔮` generates its pro-`p` quotient): a
Selmer cocycle for `𝔓`. By universality it is `g ↦ Z(g)ξ` plus a coboundary, `ev(Φ)ξ = 0`; let `E` (`n_Q × n_{Q′}` over `C`) lift
`ξ`. Then the rows of `ev(Φ)E` lie in `𝔑`; `rows(E) + 𝔑 = C^{n_{Q′}}` (modulo the span of the rows of `E` the tautological cocycle
is a coboundary, so its coordinates vanish); and `Z′(φ)_c − Z(φ)_c·E ∈ 𝔑` for `φ ∈ {φ_𝔮, cφ_𝔮c^{−1}}`, which act trivially, so
that the coboundary vanishes at them. (iv) *Reciprocity.* For `f ∈ Sel_{Q′}(T ⊗ κ^{−1} ⊗ C^∨)` and `y ∈ Sel^*_Q(T^† ⊗ κ ⊗ C)`:
`⟨f(γ_𝔮), y(φ_𝔮)⟩ = ⟨f(cγ_𝔮c^{−1}), y(cφ_𝔮c^{−1})⟩`. Indeed the sum of the local invariants of `f ∪ y` vanishes (ArithmeticGaloisDuality
§R02.4.3); the terms vanish above `p` (the dual condition), at the places of `S ∪ Q` not above `p` (`y` is locally a coboundary)
and away from `S ∪ Q′` (both unramified), and the two remaining ones are `u·⟨f(γ_𝔮), y(φ_𝔮)⟩` and `−u·⟨f(cγ_𝔮c^{−1}), y(cφ_𝔮c^{−1})⟩`
by the tame formula of 3.24(3) (the sign from `c` acting on `μ_p` by inversion). By Pontryagin duality over the finite ring `C`
(a vector of `C^{n_{Q′}}` that kills every `C^∨`-valued solution of a matrix is a combination of its rows), the vector
`Σ_c( y(φ_𝔮)_c·Z′(γ_𝔮)_c − y(cφ_𝔮c^{−1})_c·Z′(cγ_𝔮c^{−1})_c )` lies in the row space of the reduction of `ev′(Φ′)`. (v) *The
determinant.* Suppose `det ev′(Φ′) = 0`. By (iii) and Nakayama (`x₁`, `x₂` nilpotent), `𝔐′` is generated by lifts `ε_b` of the rows
of `E` (`b ≤ n_Q`) and the `2r` elements `τ_j := ϵ_j·Z′(γ_j)_c`, `j = (𝔮, c)` or `(c𝔮, c)` (`γ_j = γ_𝔮` or `cγ_𝔮c^{−1}`, `ϵ_j = ϵ` or `1`).
Relations among these generators, lifted from `C` (a relation modulo `(x₁, x₂)` lifts to a relation over `D` with the same
reduction): for each row `b ≠ l₀` of `ev(Φ)`, the relation it induces through `E` (by (iii)); in place of the row `l₀`, the
relation of (iv); and the `2r` relations `x₂τ_j − x₁W_j` of (ii), `W_j` the expression of `Z′(φ_j)_c` in the generators, whose
reduction is `Z(φ_j)_c` in the `ε`-coordinates by (iii). A square matrix of relations among generators of a module has its
determinant in the zeroth Fitting ideal, here `(det ev′(Φ′)) = 0`. Expanding along the last `2r` rows with `x₁² = 0 = x₂^{2r}`
(the term without `x₁` is `x₂^{2r}` times a determinant; the terms with two factors `x₁` vanish), the determinant is `x₁x₂^{2r−1}`
times an element whose image in `C` is, up to one sign, `Σ_c( y(φ_𝔮)_c·Z(φ_𝔮)_c − y(cφ_𝔮c^{−1})_c·Z(cφ_𝔮c^{−1})_c )·adj(ev(Φ))_{·l₀}`
(exchange the row `l₀` with each of the last rows and expand), which is `[x, y]_𝔮`; and the annihilator of `x₁x₂^{2r−1}` in `D` is
the kernel `(x₁, x₂)` of `D → C`. So `[x, y]_𝔮 = 0`, against the hypothesis. The algebra of (v) is a lemma on square matrices
of relations, valid for any surjection `D ↠ C` with kernel in `(x₁, x₂)`, `x₁² = 0`, `x₂^m = 0` and `Ann(x₁x₂^{m−1})` in the kernel,
`m` the number of tame relations.

*Route of (1).* Suppose `NF(N)` fails. (i) *Reduction to a finite ring.* Take a test datum `C` of length `N` with `O′` of large
residue field, `a_{q₀} = 0` and units `a_q` at the other places chosen as follows: restrict the lift of the chosen adjugate
entry to `X_{q₀} = 0`; its lowest form that is nonzero modulo `λ` has degree `j₀ ≤ w`, because the monomial of the hypothesis
does not involve the variables of the unpaired first-half places and survives the restriction; choose `(a_q)` where that
form takes a unit value (possible over a large residue field). Then `p^ντ^{N−1} ≠ 0`, `det ev(Φ) = 0` (its coefficients of
degree `< N` lie in `𝔞_ν`, the others die), and the chosen entry `adj(ev(Φ))_{bb′}` lies in `τ^{j₀}C^× + λC` with `j₀ ≤ w`; it
divides `τ^{j₀(ν_λ+1)}` because `(λC)^{ν_λ+1} = 0`, hence it divides `τ^{(ν_λ+1)w}`. (ii) *A Selmer class and a dual class.*
The column `adj(ev(Φ))_{·b′}` lies in `ker ev(Φ)`: a Selmer class `x` over `C` (3.22(2)). The row `ρ = adj(ev(Φ))_{b·}` satisfies
`ρ·ev(Φ) = 0`. Apply (3′) with `τ′ = τ`, `j = b′` and `c = p^ντ^{(ν_λ+1)w}`: `c·τ·ρ_{b′} ≠ 0`, because `ρ_{b′} = adj(ev(Φ))_{bb′}` divides
`τ^{(ν_λ+1)w}`, so some `ζ ∈ C` has `p^ντ^{(ν_λ+1)w}·τ·ρ_{b′}·ζ = p^ντ^{N−1} ≠ 0`. So some `y ∈ Sel^*_Q(T^† ⊗ κ ⊗ C)` has
`p^ντ^{(ν_λ+1)w}·y ≠ 0`. (iii) *The forms do not vanish on `L₁`.* `κ` (through `ev`, with `a_{q₀} = 0`), `T ⊗ C` and `T^† ⊗ C` are
trivial on `L₁`, so `x`, `y` restrict to homomorphisms there, and restriction to `L₁` is injective (3.24(4b) for `L₁`). Suppose
`⟨x(h), y(h)⟩_C − ⟨x(chc^{−1}), y(chc^{−1})⟩_C = 0` for all `h ∈ L₁`. Split `L₁` by the eigenvalues `ϑ`, `ϑ^{−1}` of conjugation by
`z`, polarise, and transport `y` through `c` and the isomorphism of (H2) to a cocycle `ỹ` for `T ⊗ χ_cyc^t`; the vanishing compares
`(T ⊗ χ_cyc^t)(θ)` with `T(θ)` for group-ring elements `θ`. Since `T̄(G_F)` spans `M_r(k)` (Burnside, from (H1)), the images
under `T ⊗ χ_cyc^t` of the kernel of `T` on `O[G_F]` form `M_r(I)` for an ideal `I` modulo which `T ≅ T ⊗ χ_cyc^t`; taking
determinants, `χ_cyc^{tr}(g) − 1 ∈ I` for all `g`, and some `χ_cyc^{tr}(g₀) − 1` is `p^ν` times a unit. Hence
`p^ν·x(h)_αy(h′)_β = 0` in `C` for all `h, h′ ∈ L₁` and all coordinates (the pairing being `C`-bilinear); the values of `x` on
`L₁` generate an ideal containing every coordinate of the column (modulo it `x` vanishes on `L₁`, hence is a coboundary, and
the presentation is natural in `B`), in particular `adj(ev(Φ))_{bb′}`, which divides `τ^{(ν_λ+1)w}`; so `p^ντ^{(ν_λ+1)w}·y` vanishes
on `L₁` and is a coboundary, a contradiction. (iv) *A new place.* So some `h ∈ L₁` has `⟨x(h), y(h)⟩_C − ⟨x(chc^{−1}), y(chc^{−1})⟩_C ≠ 0`;
let `ι ∈ I_{q₀}` (in `L`, as `q₀ ∉ S_L`, and in `ker d_q` for `q ≠ q₀`) with `d_{q₀}(ιh) = 1`. Since `a_{q₀} = 0` and `T` is unramified
at `q₀`, `I_{q₀}` and `I_{cq₀}` act trivially on `T ⊗ C` and `T^† ⊗ C`, and the local cohomology at `q₀`, `cq₀` vanishes (3.24(1)),
so `x` and `y` vanish on these inertia groups and the form takes the same value at `ιh` as at `h`. Chebotarev (Completed)
Layers 10, 14 give infinitely many places `𝔮` of degree one, split over `F⁺`, whose Frobenius is conjugate to `ιh` modulo the
open subgroup `L₂ := L₁ ∩ ker d_{q₀} ∩ ker(x|_{L₁}) ∩ ker(y|_{L₁}) ∩ ker(x∘Ad(c)|_{L₁}) ∩ ker(y∘Ad(c)|_{L₁})`, normal in
`G_{F⁺}` (`d_{q₀}` is anticyclotomic, and the restrictions to `L₁` are equivariant homomorphisms); as `ιh ∈ L₁` and
`d_{q₀}(ιh) = 1`, the Frobenius elements at `𝔮` lie in `L₁` and have `d_{q₀}(Frob_𝔮) = 1`, so `𝔓 ∪ {𝔮}` is in position with `𝔮`
paired with `q₀`, and `[x, y]_𝔮 ≠ 0` (the Frobenius element `φ_𝔮` of the bordered data differs from `Frob_𝔮` by an element of the
inertia group at `𝔮`, which lies in `L₂`). (v) *The determinant after adding `𝔮`.* By (4′) for the column `b′` (`l₀ := b′`) and
this `y`, the image `det ev′(Φ′)` of `det Φ′` in `D` is nonzero. A monomial of total degree at least `N + 2r` vanishes at the point
`(a_qτ, x₁, x₂)` (`τ^N = x₁² = x₂^{2r} = 0`), and coefficients in `𝔞_ν` vanish in `C`; so `det Φ′` has a coefficient outside `𝔞_ν` in
degree less than `N + 2r`.

*Route of (2).* Add one second-half place `𝔮` with partner `𝔭₁` (`d_{𝔭₁}(Frob_𝔮) = 1`), a first-half place of `𝔓`, and let
`Λ₁ = Λ′/(X_𝔮)`, which is the group ring of `𝔓`. On `Λ₁`-modules `B` there is an exact sequence
`0 → 𝔉₁(B) → 𝔉′(B) → 𝔏(B)` with `𝔉′` the functor of `𝔓′`, `𝔉₁` the functor of `𝔓` (unramified at `𝔮`, `c𝔮`) and
`𝔏(B) = ⊕_{v=𝔮,c𝔮}H¹(F_v, T ⊗ κ₁^{−1} ⊗ B)/H¹_{ur}`, the singular quotients, which for these tame places with unramified
coefficients are `Hom(I_v^{tame}, T ⊗ B)^{Frob} = ker(N(v)^{−1}κ₁(φ_v)^{−1}T(φ_v) − 1 | T ⊗ B)`, `φ_v` a Frobenius element. The
functors are represented on torsion modules (3.22(3)); passing to the representing modules, `𝔑 → 𝔐′ ⊗ Λ₁ → 𝔐₁ → 0` is
exact, with `𝔑` presented by the two square matrices `N(v)^{−1}κ₁(φ_v)^{−1}T(φ_v) − 1` of size `r`, so
`Fitt_a(𝔑)·Fitt_b(𝔐₁) ⊆ Fitt_{a+b}(𝔐′ ⊗ Λ₁)`: for `a = b = 0`, `det Φ·P_𝔮` is a multiple of `det Φ′|_{X_𝔮=0}`, with
`P_𝔮 := ∏_{v=𝔮,c𝔮}det(N(v)^{−1}κ₁(φ_v)^{−1}T(φ_v) − 1)`; for `a = 0`, `b = 1`, every entry of the adjugate of `Φ` times `P_𝔮` is a
combination of the entries of the adjugate of `Φ′|_{X_𝔮=0}` (the first Fitting ideal of a module presented by a square matrix
is generated by the entries of its adjugate). The polynomials whose coefficients below a given degree lie in `𝔞_ν` (resp. in
`λO`) form an ideal; so it suffices that the product with `P_𝔮` has a coefficient outside `𝔞_ν` (resp. a unit coefficient)
below degree `n + 2r`. For a unit coefficient on a monomial not involving the variables of the unpaired first-half places
of `𝔓′` (those of `𝔓` other than `𝔭₁`), first set these variables to `0`: a ring map, which keeps the given monomial of the lift
for `𝔓` (it involves no unpaired variable of `𝔓`) and does not change `P_𝔮` (below); a coefficient of the image of an adjugate
entry of `Φ′` is a coefficient of that entry on a monomial free of these variables. As `φ_𝔮` acts trivially on `T/𝔞_νT`, so does `cφ_𝔮c^{−1}` (by (H2), since
`φ_𝔮` fixes `μ_{p^{ν+1}}`), and `N(𝔮) ≡ 1 (mod p^M)` with `p^M ∈ 𝔞_ν`; hence
`P_𝔮 ≡ (κ₁(φ_𝔮)^{−1} − 1)^r(κ₁(φ_𝔮) − 1)^r` modulo `𝔞_ν`: no term below degree `2r`, and a form `P_{𝔮,2r} = ±ℓ_𝔮^{2r}` of degree `2r`,
`ℓ_𝔮` the linear form `X_{𝔭₁} + Σ_ad_{𝔭_a^{(2)}}(φ_𝔮)X_{𝔭_a^{(2)}}` (the first-half `d_q` other than `d_{𝔭₁}` vanish at `φ_𝔮`), whose
coefficient on `X_{𝔭₁}^{2r}` is `±1` and whose monomials involve only `X_{𝔭₁}` and second-half variables. Let `m ≤ ν_λ` be the least
valuation of a coefficient of the polynomial `f` (a lift of `det Φ`, or of the adjugate entry after the substitution) below
degree `n`, and `d₀` the least degree in which it occurs. In degree `d₀ + 2r` the product is congruent to `f_{d₀}P_{𝔮,2r}` modulo
`λ^{m+1}` (the other terms have a factor in `𝔞_ν ⊆ λ^{m+1}O` or a coefficient of valuation `> m`), and `λ^{−m}f_{d₀}·P_{𝔮,2r}` is
nonzero modulo `λ` since `k[X]` is a domain: a coefficient of valuation exactly `m` in degree `d₀ + 2r < n + 2r`. For `λO` in
place of `𝔞_ν` the same argument with `m = 0` needs only `φ_𝔮` trivial on `T̄`.
*Needs:* 3.22, 3.24, 3.25; SelmerIwasawaCohomology §§2.21–2.22; ArithmeticGaloisDuality §§R02.4.3, R02.5.1; Chebotarev (Completed) Layers 10, 14;
Mathlib `Matrix.adjugate`, `Ideal.fittingIdeal` (or the Fitting ideals of finitely presented modules).

**Checks.**

- `ν` measures the congruence `T ≡ T ⊗ χ_cyc^t`: if `T ≅ T ⊗ χ_cyc^t` integrally, the determinant gives `χ_cyc^{tr} = 1` and
  `tr = 0`, which is excluded; the obstruction in (iii) is exactly the factor `p^ν`.
- At `p = 2`, `χ̄_cyc = 1`, so `T̄ ≅ T̄ ⊗ χ̄_cyc^t` always and `ν ≥ 1`: this target is the only route to a bound at `p = 2`.
- In (2) triviality of `φ_𝔮` on `T/𝔞_νT` is needed: if the constant term of `P_𝔮` is not in `𝔞_ν` the product can lose the
  low coefficient (one variable, `f = X − λ`, `g = X + λ`, `𝔞 = λ²O`: `fg ≡ X²`).
- In (4′) the class `y` need not be attached to a row of the adjugate: only `[x, y]_𝔮 ≠ 0` is used, and (3′) produces `y` by
  counting, with no map from the dual of a cokernel to the dual Selmer group.
- (*the bordered ring*) `D = C[x₁, x₂]/(x₁², x₂^{2r})` must be truncated at `x₂^{2r}`, `2r ≤ p^{M−ν}`: the coefficient of `x₂^k` in
  `(1 + x₂)^{p^M} − 1` has valuation `M − v_p(k)`, which is `ν` at `k = p^{M−ν}`, outside `𝔞_ν = λp^νO`; so `X_{q₀} ↦ x₂` is not a ring
  map from `Λ′` when `x₂^{p^{M−ν}} ≠ 0`.

### 3.25b One specialisation for finitely many polynomials

Let `O₀` be the ring of integers of a finite extension `K₀` of `ℚ_p`, with uniformizer `ϖ₀`, and `v` the valuation of `ℚ̄_p`
with `v(p) = 1`. Let `D ≥ 0`, `n, s ≥ 1` be integers and `v₀ ≥ 0`, `ε > 0` real. A polynomial of `O₀[X_1, …, X_n]` is *of the first
kind* (for `D`, `v₀`) if it has a coefficient of valuation at most `v₀` on a monomial of total degree at most `D`. Prove:

1. there is `M₁` such that for every `M ≥ M₁` and all `f_1, …, f_s` of the first kind there are integers `1 ≤ M_q ≤ M` (`q ≤ n`)
   such that for all roots of unity `u_q` of exact order `p^{M_q}`: `v(u_q − 1) ≤ ε`, `f_j((u_q − 1)_q) ≠ 0` and
   `v(f_j((u_q − 1)_q)) ≤ v₀ + ε` for every `j`. In particular `u = (u_q) ∈ μ_{p^M}^n`, every `u_q ≠ 1`, and the same holds for
   `u^m = (u_q^m)_q` for every `m` prime to `p`. `M₁` depends only on `D`, `v₀`, `n`, `s`, `ε`, `p` and `K₀`, not on the polynomials
   or their degrees. With `k := max_qM_q` and `e_q := k − M_q`, the `u_q` may be taken to be the powers `ζ^{p^{e_q}}` of any primitive
   `p^k`-th root of unity `ζ`, and `p^{e_q}/φ(p^k) = v(u_q − 1) ≤ ε`;
2. (*a second kind of polynomial*) let the variables be divided into *first-half* and *second-half* ones, `n_max ≥ 0` and
   `s′ ≥ 0`, and for every `M ≥ M₀` let `f_{M,1}, …, f_{M,s}` be of the first kind and `g_{M,1}, …, g_{M,s′}` of the *second kind at
   level `M`*: modulo the ideal generated by the second-half variables and the `(1 + X_q)^{p^M} − 1` for the first-half variables,
   `g_{M,j} ≡ D_{M,j}·h_{M,j}` with `v(h_{M,j}(0)) ≤ v₀`, and `D_{M,j} ≡ u_{M,j}·∏_{q first half}X_q^{n_q}` modulo `ϖ₀` and the `X_q^{p^M}`, with
   `u_{M,j}(0) ≠ 0` and all `n_q ≤ n_max`. Then there are `M ≥ M₀`, `1 ≤ k ≤ M` and exponents `e_q < k` with `p^{e_q}/φ(p^k) ≤ ε` such
   that for every primitive `p^k`-th root of unity `ζ`, at `u_q := ζ^{p^{e_q}}`, all the values `f_{M,j}((u_q − 1)_q)` and
   `g_{M,j}((u_q − 1)_q)` are nonzero, of valuation at most `v₀ + ε`.

*Route.* (*One variable.*) For `g = Σ_ig_iY^i` over the ring of integers of a finite extension of `K₀` with ramification
index `e′`, having a coefficient of valuation at most `μ′` in degree at most `D`, and `x` with `v(x) = δ > 0` such that `−δ`
is not the slope of an edge of the Newton polygon of `g` (NewtonPolygons §§2.1–2.3), the minimum of `v(g_i) + iδ` is
attained once, so by the strict ultrametric inequality `v(g(x)) = min_i(v(g_i) + iδ) ≤ μ′ + Dδ`. The edges of negative slope
number at most `D + e′μ′ + 1`: at most `D` to the left of the small coefficient, and to its right the heights decrease in
`(1/e′)ℤ ∩ [0, μ′]`. (*One variable at a time.*) For `u` of exact order `p^{m}`, `v(u − 1) = 1/φ(p^m)`, and distinct `m` give
distinct valuations. Specialise `X_n` first: for each `f_j`, apply the one-variable statement to the coefficient, as a
polynomial in `X_n`, of a small monomial in the other variables; among `s(D + e₀v₀ + 1) + 1` consecutive levels `m` one
avoids all the slopes, for every `u_n` of that exact order, and the specialised polynomials over `O₀[u_n]` keep a
coefficient of valuation at most `v₀ + D/φ(p^{M_n})` in degree at most `D`. The conjugates of `u_n` over `K₀` give conjugate
polynomials with the same valuations, and the classes of `u_n` that are not conjugate are at most `[K₀ : ℚ_p]` in number;
adding their specialisations to the list, repeat for `X_{n−1}, …, X_1`, the number of candidate levels at each step being
bounded in terms of the previous levels (the ramification index grows to at most `e₀φ(p^{M_n})`). Choosing the windows of
levels beyond a bound depending only on the data makes `Σ_q D/φ(p^{M_q}) ≤ ε` and every `v(u_q − 1) ≤ ε`; `M₁` is the
largest level used. The polynomials at a given `M` may have degree up to `p^M`: only the low coefficient and the count of
slopes enter. The powers: `ζ^{p^{e_q}}` has exact order `p^{k−e_q} = p^{M_q}`, and `v(ζ^{p^{e_q}} − 1) = 1/φ(p^{M_q}) = p^{e_q}/φ(p^k)`.
(2) is a statement of [FormalProof]; for the polynomials of the first kind alone it follows from (1) in this form. The
remaining steps of the route, for the second kind, are not given here. *Needs:* NewtonPolygons §§2.1–2.3 (coefficient polygons, supporting values, active indices); Mathlib
`Polynomial`, `IsPrimitiveRoot`.

**Checks.**

- No choice of the orders made before the polynomials are known suffices: `∏_{1≤i≤I}((1 + X_1) − (1 + X_2)^{p^i})` has the unit
  coefficient `1` on `X_1^I`, yet vanishes at `(u_1, u_2) = (ζ^{p^i}, ζ)` for every primitive `ζ` and every `1 ≤ i ≤ I`; in (1) the
  orders are chosen for the given polynomials, one variable at a time, and in (2) the exponents `e_q` for the given ones.
- `n = 1`, `f = p^{v₀} + X^D`: for `u` of exact order `p^m` with `D/φ(p^m) < v₀`, `v(f(u − 1)) = D/φ(p^m)`, below `v₀`, and at most `ε`
  when moreover `D/φ(p^m) ≤ ε` (for `p = 3`, `m = D = v₀ = 1` it is `1/2`); the bound `v₀ + ε` is not sharp, only uniform.

### 3.26 Twist selection

Let `(T_s, ℒ_s, t_s)_{s∈𝒮}` be finitely many data as in 3.22 (CM data), over the same `F`, `p`, `O`, `S`, with ranks `r_s`,
each satisfying (H1), (H2), (H6) with a balanced saturated condition `ℒ_s`, and (H5) with one common `z`, normalised (acting
on `T̄_s` by a scalar `ϑ_s`, `ϑ_s² ≠ 1`). Put `ν_s := v_p(#H⁰(F, ℚ_p/ℤ_p(t_sr_s)))`, the largest `ν` with
`χ_cyc^{t_sr_s} ≡ 1 (mod p^ν)` on `G_F` (infinite when `t_sr_s = 0`), and `𝔞_s := λp^{ν_s}O` if `ν_s < ∞`, `𝔞_s := λO` otherwise.
A **polynomial condition** of level `v₀`, degree function `D : ℕ → ℕ` and exponent bound `n_max : ℕ → ℕ`, relative
to an open subgroup `H_𝒞 ⊆ G_F`, normal in `G_{F⁺}`, **modulo which `z` is central** (`[g, z] ∈ H_𝒞` for all `g ∈ G_F`; this
holds if `z ∈ H_𝒞`, and for the kernel of any character of `G_F`), and to a finite set `A_𝒞` of places, is a rule that attaches
to every `M ≥ 1` and every family `𝔓` in position at level `M` relative to `z` and a subgroup `L ⊆ H_𝒞` as in 3.24, avoiding
`A_𝒞` and with second-half Frobenius elements in `H_𝒞`, a polynomial `f ∈ O[X_q : q ∈ 𝔓]` depending only on `M` and `𝔓`, of one
of the two kinds of 3.25b: either with a coefficient of valuation at most `v₀` on a monomial of total degree at most `D(n₁)`,
`n₁` the number of first-half places of `𝔓` (the first kind), or of the second kind at level `M` of 3.25b(2) for `v₀` and
`n_max(n₁)`, the first-half and second-half variables being those of the first-half and second-half places of `𝔓`. The
first-half Frobenius elements of such a family lie in `zL ⊆ zH_𝒞`, a coset which is a union of conjugacy classes of
`G_F` (`H_𝒞` is normal and `z` central modulo it); it is `H_𝒞` itself exactly when `z ∈ H_𝒞`. Given finitely many polynomial
conditions `𝒞_j` (degree functions `D_j`, exponent bounds `n_{max,j}`, levels `v_j`), let, for `M > max{ν_s : ν_s < ∞} + 1`,

`L_M := ⋂_s ker(T_s/𝔞_sT_s) ∩ H_M ∩ ⋂_j H_{𝒞_j}`,

an open subgroup as in 3.24 for every `T_s` (with `S_{L_M}` = `S` and the places ramified in the fixed fields of the
`H_{𝒞_j}`), and let families in position at level `M` be relative to `z` and `L_M`. Prove: for every `ε′ > 0` and every finite
set `A` of places, there are `R`, an integer `M ≥ 1`, a family `𝔓` in position at level `M` with at most `R` first-half
places, avoiding `A`, with `Q = 𝔓 ∪ c𝔓` (so `#Q ≤ 4R`), a finite extension `O′` and roots of unity `u_q ∈ μ_{p^M}(O′)`,
`u_q ≠ 1`, such that `ψ = ∏_qu_q^{d_q}` — an anticyclotomic character of `p`-power order ramified exactly at `Q` and trivial
on the decomposition groups above `p` — satisfies, for every `s ∈ 𝒮` and every integer `m` prime to `p`:

1. `length_{O′} Sel_Q(T_s ⊗ ψ^m ⊗ E′/O′) ≤ (ν_s + ε′)·length_{O′}(O′/p)`;
2. `length_{O′} Sel_Q(T_s ⊗ ψ^m ⊗ E′/O′) ≤ ε′·length_{O′}(O′/p)` if `T̄_s ≇ T̄_s ⊗ χ̄_cyc^{t_s}`;
3. `Σ_{𝔭∈Q} v_p(ψ(γ_𝔭) − 1) ≤ ε′` for inertia generators `γ_𝔭`;
4. `v_p(f_j((u_q^m − 1)_q)) ≤ v_j + ε′` for the polynomial `f_j` that `𝒞_j` attaches to `𝔓`.

`R` is independent of `ε′` and `A`: it depends only on the `r_s`, the `dim Sel_∅(T̄_s)`, `e(O/ℤ_p)` and the `ν_s`.

*Route.* (a) For each level `M` the subgroup `L_M` is normal in `G_{F⁺}` (each factor is, by (H2) for the kernels, since
`p^M ∈ 𝔞_s`), contains the relevant inertia groups, and `z` is central modulo it: a commutator `[g, z]`, `g ∈ G_F`, acts
trivially on every `T_s` ((a) of the normalisation), lies in `H_M` (normal, containing `z`) and lies in every `H_{𝒞_j}` (`z` is
central modulo each). Every first-half Frobenius element lies in `zL_M ⊆ zH_{𝒞_j}` and every second-half one chosen below in
`L_M ⊆ H_{𝒞_j}`, so every `𝒞_j` attaches a polynomial to the families constructed; their numbers of first-half places are at
most `R`, which does not depend on the conditions, so the degrees are at most `max_{n≤R}D_j(n)` and the exponents at most
`max_{n≤R}n_{max,j}(n)`. The data with `t_sr_s = 0` take no part in the determinant argument: for them `ν_s = ∞` and clause 1 is
empty, and clause 2 does not apply, because `r_s ≥ 1` forces `t_s = 0` and then `T̄_s ≅ T̄_s ⊗ χ̄_cyc^{t_s}`. By 3.24(4c) for each
`s` with `t_sr_s ≠ 0` and Chebotarev, choose a family in position avoiding `A` and the `A_{𝒞_j}`, whose second-half classes serve
all these `s` at once (the union of the classes `h_a` for the different `s`, with `θ⁰` zero on the places of the others), with
one additional unpaired first-half place for each such `s` with `T̄_s ≅ T̄_s ⊗ χ̄_cyc^{t_s}`; all first-half places are chosen
at this step, and the following steps add only second-half places. For `s` with `T̄_s ≇ T̄_s ⊗ χ̄_cyc^{t_s}` 3.25 with `e = 0` gives a unit
coefficient of a lift of `det Φ_s` in bounded degree; for the others (`t_sr_s ≠ 0`) 3.25 with `e = 1` gives a unit coefficient
of an adjugate entry, and 3.25a(1), applied once for each such `s`, adds a second-half place with Frobenius in `L_M`, paired
with the first-half place reserved for `s`, after which a lift of `det Φ_s` has a coefficient of valuation at most `v(p^{ν_s})`
in bounded degree; 3.25a(2) keeps all these bounds (and the unit coefficients of the adjugate entries needed before
3.25a(1) is applied) as second-half places are added (their Frobenius elements lie in `L_M`, so act trivially on every
`T_s/𝔞_sT_s`). So `R` and a degree bound `D` depend only on the `r_s`, the `dim Sel_∅(T̄_s)` (through the
`R ≤ (dim Sel_∅(T̄_s))²` of 3.24(4c)), `e(O/ℤ_p)` and the `ν_s`, and for every `M` beyond a bound `M₀` there is such a family at
level `M`, with the same numbers of places. (b) If every condition is of the first kind, 3.25b(1), applied to the lifts of
the `det Φ_s` (coefficient of valuation at most `ν_s` in degree at most `D`) and to the `f_j` (degree at most `max_{n≤R}D_j(n)`),
with `ε` small in terms of `ε′` and `R`, gives one `M ≥ M₀` and `u ∈ μ_{p^M}^𝔓` with all `u_q ≠ 1`, `v(u_q − 1) ≤ ε` and the
valuations of all these polynomials at `u^m − 1` within `ε` of their levels, for every `m` prime to `p`; `M` is part of the
conclusion. If some condition is of the second kind, 3.25b(2), applied to the same polynomials for the families of (a) at
every level `M ≥ M₀`, gives `M`, `k` and `u_q = ζ^{p^{e_q}}` with the same properties, for every primitive `p^k`-th root of unity
`ζ` (so also for `ζ^m`, `m` prime to `p`). (c) 3.23 (with `u^{−m}`) converts (a)–(b) into 1–2; 3 holds because `ψ(γ_𝔭) = u_q^{±d_q(γ_𝔭)}` with `d_q(γ_𝔭)`
prime to `p`, so `v(ψ(γ_𝔭) − 1) = v(u_q − 1) ≤ ε` at each of the at most `4R` places. *Needs:* 3.22–3.25b; Chebotarev
(Completed) Layers 10, 14; ArithmeticDirichletSeries (Completed) §5.3.

**Checks.**

- `ν_s = 0` whenever `[F(μ_p) : F]` does not divide `t_sr_s`, since then `χ̄_cyc^{t_sr_s} ≠ 1`; `ν_s = ∞` when `t_sr_s = 0`, and
  clause 1 is then empty.
- At `p = 2`, `χ̄_cyc = 1`, so `ν_s ≥ 1` and clause 2 never applies.
- (*the coset `zH_𝒞`*) For `H_𝒞 = ker(T̄_s) ∩ G_{F(μ_p)}`, which does not contain `z` (it acts by `ϑ_s ≠ 1`), the families
  constructed have their first-half Frobenius elements in `zL_M`, which is disjoint from `H_𝒞`. A rule defined only on families
  whose Frobenius elements all lie in `H_𝒞` attaches nothing to them, and clause 4 would concern a polynomial that does not
  exist; such a rule is not a polynomial condition, which must be defined on the coset `zH_𝒞`.
- (*kernels of characters*) For a character `χ̄` of `G_F` with `c`-stable kernel and `χ̄(z) ≠ 1`, `H_𝒞 := ker χ̄` is normal in
  `G_{F⁺}`, does not contain `z`, and `z` is central modulo it; the first-half places of the families are those with
  `χ̄(Frob) = χ̄(z) ≠ 1`, the second-half ones those with `χ̄(Frob) = 1`.

### Examples

For `J = ∅`, `Λ = O` and 3.22 (2) presents the relaxed Selmer group of `T ⊗ B` itself; in 3.22 (3) the functor `Hom_{Λ′}(Λ′/𝔪′², −)` on `Λ′ = O` is `ker(λ²)`, presented by the `1 × 1` matrix `(λ²)`. For `n_Q = 1` and `Φ = ([e_j] − 1)`, with `u_j` a primitive `p^m`-th root of unity, 3.23 gives the length `v′(u_j − 1) = e(O′/ℤ_p)/(p^{m−1}(p − 1))`, and `u_j = 1` gives an infinite Selmer group. If `Sel_Q(T̄) = 0`, then `n_Q = 0`, `det Φ = 1`, and 3.25 holds with the constant term. For `n = 1` and `f = p^{v₀} + X^D`, a root of unity `u` of exact order `p^m` with `D/φ(p^m) < v₀` gives `v(f(u − 1)) = D/φ(p^m)` (for `p = 3` and `m = D = v₀ = 1` it is `1/2`), as in 3.25b (1). In 3.26, `ν_s = 0` whenever `[F(μ_p) : F]` does not divide `t_sr_s`, and at `p = 2` always `ν_s ≥ 1`, so that clause 2 of 3.26 never applies there.

### Dependencies

SelmerIwasawaCohomology §§2.6, 2.13, 2.19, 2.21, 2.22 and 3.0; ArithmeticGaloisDuality §§R02.4.2–R02.4.4, R02.5.1 and D7.7.4; ClassFieldTheory Layers 5 and 13; ProfiniteCohomology §§2.4 and 5.4; Chebotarev (Completed) Layers 10 and 14; ArithmeticDirichletSeries (Completed) §5.3; NewtonPolygons §§2.1–2.3; Mathlib's determinants, adjugates, lengths, polynomials and primitive roots of unity, and the Smith normal form. The local condition above `p` is abstract in this layer, which uses nothing from Layer 4.

## Layer 4: Bloch–Kato finite classes and lifting with loss

This layer works at one place above `p`, with lattices in crystalline and de Rham representations of `G_K` for finite `K/ℚ_p` and their Bloch–Kato finite classes. It identifies the finite classes with the crystalline extensions, shows that the Bloch–Kato condition is balanced, bounds the finite part of the classes cut out by a character and the invariants modulo a lattice, and proves that a surjection of lattices induces a map of finite classes whose cokernel is killed by an explicit power of `p`.

### 4.9a Crystalline and de Rham extensions are the `H¹_f` and `H¹_g` classes

Let `K/ℚ_p` be finite, `V` an `E`-representation of `G_K`, `η : G_K → E^×` a character and `0 → V → W → E(η) → 0` an
extension with class `c ∈ H¹(K, V(η^{−1}))`. Define `H¹_g(K, V′) := ker(H¹(K, V′) → H¹(K, V′ ⊗ B_dR))` for every
`E`-representation `V′`. Prove: (1) if `V` and `η` are crystalline, `W` is crystalline if and only if
`c ∈ H¹_f(K, V(η^{−1}))`; (2) if `V` and `η` are de Rham, `W` is de Rham if and only if `c ∈ H¹_g(K, V(η^{−1}))`; (3)
`H¹_f ⊆ H¹_g`, both functorial in `V′` and compatible with finite extensions of `E`; (4) for a `G_K`-stable `O`-lattice `T` in
a crystalline `V`, a class `ξ ∈ H¹(K, T)` lies in `H¹_f(K, T)`, the preimage of `H¹_f(K, V)` (SelmerIwasawaCohomology §4.9), if and only if its
extension `0 → T → T_ξ → O → 0` has `T_ξ[1/p]` crystalline.

*Route.* Twisting by `η^{−1}` preserves crystallinity (resp. the de Rham property), and carries the class of `W` to that of
`W(η^{−1})`, so assume `η = 1`. For `B = B_cris` (resp. `B_dR`), tensor the extension with `B` and take invariants:
`0 → D_B(V) → D_B(W) → D_B(E) → H¹(K, V ⊗ B)`, where the last map sends `1` to the image of `c` under
`H¹(K, V) → H¹(K, V ⊗ B)` and is `B^{G_K} ⊗ E`-linear. As `V` is `B`-admissible, `D_B(W)` has full rank exactly when that
image vanishes. (3) `B_cris ⊂ B_dR`. (4) `T_ξ[1/p]` is the extension of `E` by `V` with the image of `ξ` as class; apply (1).
Sources: Bloch–Kato, §3. *Needs:* SelmerIwasawaCohomology §4.9; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P2, R07.P3, R07.P5;
ArithmeticGaloisDuality §R02.1.2 (long exact sequences for the period coefficients); PadicPeriodRings §§4.1–4.3.

**Checks.**

- `V = ℚ_p(1)`, `η = 1`: a Kummer extension is crystalline exactly when its class lies in the completed-unit line, as in
  SelmerIwasawaCohomology §4.9's Checks, while every Kummer extension is de Rham: `H¹_g(ℚ_p, ℚ_p(1)) = H¹` has dimension `2`.
- `V = ℚ_p`, `η = 1`: the unramified homomorphism gives a crystalline extension and the logarithm of the cyclotomic
  character does not, matching `H¹_f(K, ℚ_p) = H¹_ur`.
- In (4) the torsion of `H¹(K, T)` consists of crystalline classes: a torsion class gives a split extension after inverting
  `p`.

### 4.9b The Bloch–Kato condition is balanced

Let `F`, `S`, `T`, `V` be as in the Selmer data of 3.22, and assume

- (H3) `V` is de Rham at every place above `p`, and `Σ_{v|p} dim_E(D_dR(V|_{G_{F_v}})/Fil⁰) = Σ_{v|∞} dim_E H⁰(F_v, V)`.

Prove: the `T`-conditions `ℒ_v := H¹_f(F_v, T)` of SelmerIwasawaCohomology §4.9 (`v | p`) form a balanced saturated condition above `p`, with
`rank_O ℒ_v − rank_O H⁰(F_v, T) = dim_E(D_dR(V|_{G_{F_v}})/Fil⁰)`; hence 3.22–3.26 apply with the Bloch–Kato condition
above `p`, and (H3) is exactly what makes it balanced. For a CM field `F` and `E` containing the images of the embeddings of
`F`, (H3) holds when `V` is de Rham above `p` and, for every embedding `τ`, the numbers of negative Hodge–Tate weights of `V`
at `τ` and at `τ∘c` add up to `r`.

*Route.* `H¹_f(F_v, T)` is the preimage of `H¹_f(F_v, V)`, so it contains the torsion and has torsion-free quotient (SelmerIwasawaCohomology §2.6).
SelmerIwasawaCohomology §4.9's dimension formula gives `dim_E H¹_f(F_v, V) = dim_E(D_dR/Fil⁰) + dim_E H⁰(F_v, V)`, and
`rank_O H⁰(F_v, T) = dim_E H⁰(F_v, V)`; summing over `v | p`, (H3) is the balance. For CM `F`, `dim_E(D_dR/Fil⁰)` is the
number of negative weights summed over the embeddings above `v`, and the right side of the balance is `r[F:ℚ]/2`.
*Needs:* SelmerIwasawaCohomology §§2.6, 4.9.

**Checks.**

- `F` imaginary quadratic, `V = E(1)`: weight `−1` at both embeddings, so the left side of (H3) is `2` against
  `r[F:ℚ]/2 = 1`, and the condition is not balanced. By the Greenberg–Wiles formula, for every nontrivial character `ψ` of
  `p`-power order trivial on the decomposition groups above `p`, `Sel(T ⊗ ψ ⊗ E′/O′)` has positive corank. For the trivial
  twist the global invariants of the dual `E` cancel the excess (for `F = ℚ(i)`, `p = 3`, the relaxed residual Selmer group
  of `μ_3 ⊗ k` is `O_F^×/3 ⊕ Cl_F[3] = 0`).
- `V = E` at a place `v | p`: `H⁰(F_v, V) ≠ 0`, `rank ℒ_v = 1` (the unramified line) and `rank H⁰(F_v, T) = 1`; the
  invariants cancel in the balance, so no hypothesis on `H⁰(F_v, V)` is needed.

### 4.9c A bound for the finite part of the classes cut out by a character

Let `K₀/ℚ_p` be finite unramified, `s ≥ 1` (`s ≥ 2` if `p = 2`), `K₀ ⊆ K ⊆ K_s := K₀(μ_{p^s})`, and `E` containing the images of
the embeddings of `K_s`. Let `0 → Y → Ỹ → O → 0` be an exact sequence of `G_K`-stable `O`-lattices (`O` with trivial action),
`Ỹ[1/p]` crystalline as a representation of `G_{K_s}`. Let `U` be the **set** of the integers that are Hodge–Tate weights of `Y`
at some embedding of `K` into `E`, each counted once (the jumps of the Hodge filtration of `D_dR(Y[1/p])`; so
`#U ≤ [K:ℚ_p]·rk Y`), and suppose `U ⊂ [−M₀, h₀]` with `M₀, h₀ ≥ 0`. Let `ỹ ∈ Ỹ` lie over `1` and `f(g) := (g − 1)ỹ ∈ Y`. Let `e ≥ 0`,
`V_e := E(χ_cyc^{−e})` with a stable lattice `L_e`, and `ϕ : Y → V_e/L_e` an `O`-linear `G_K`-map. Put

`n₀` := the least integer `≥ 0` with `M₀ + h₀ ≤ p^{n₀}(p − 1)`, `m := 2s + n₀ + 1`, `v := m − s = s + n₀ + 1`,
`g_K := v_p([K_s : K])`, `v_p(0) := 0`,
`c′ := v + Σ_{0≤i≤e}(2 + max(1, r_i))`, `r_i := Σ_{u∈U, u≠i}(m + v_p(u − i))`,
`c := c′ + (e + 2)s + v_p(e) + ⌊e/(p − 1)⌋ + 1 + (s + v_p(e + 1)) + g_K`.

Prove (statements of [FormalProof]; the route below gives every step except three sub-statements, named there, whose
proofs are not given here):

1. `p^c·[ϕ∘f]` lies in `H¹_f(K, V_e/L_e)`, the image of `H¹_f(K, V_e)` (SelmerIwasawaCohomology §4.9). Moreover the `p^n`-torsion of
   `H¹(K, V_e/L_e)_{div}/H¹_f(K, V_e/L_e)` has length at most `([K:ℚ_p] + 1)·n·length_O(O/p)`; `H¹_f(K, V_e/L_e) = 0` for `e > 0`,
   and for `e = 0` it consists of the unramified classes. The exponent depends on `s` and on `M₀ + h₀` through `v` and `m`, not
   only on `K`;
2. (*abelian bases*) let `N ≥ 1` (`4 | N` if `p = 2`), `K′ := ℚ_p(μ_{lcm(p,N)})`, `s_N := max(1, v_p(N))`, `K ⊆ K′` a subfield
   containing `ℚ_p`, `E ⊇ μ_{lcm(p,N)}`, and `Y`, `Ỹ`, `ỹ`, `e`, `L_e`, `ϕ` as above, with `Ỹ[1/p]` crystalline as a representation of
   `G_K`. Then `K′ = K′₀(μ_{p^{s_N}})`, `K′₀ := ℚ_p(μ_{N′})` unramified, `N′` the prime-to-`p` part of `N`, and
   `p^{c(K′) + v_p([K′:K])}·[ϕ∘f] ∈ H¹_f(K, V_e/L_e)`, where `c(K′)` is the exponent `c` of (1) for `K′` at the level `s_N` (with the
   same set `U`, and `g_{K′} = 0`), and `v_p([K′ : K]) ≤ ⌊log_p N⌋`. If moreover `U ⊂ [−h, h]`, `#U ≤ n` and `e < t ≤ h` (`h, t ≥ 1`),
   then `c(K′) + v_p([K′ : K]) ≤ 40(t + 1)(n + 1)λ_N`, `λ_N := s_N + ⌊log_p 2h⌋ + ⌊log_p N⌋ + 1`.

*Route of (1).* Let `K_m := K₀(μ_{p^m})`, `ξ` a generator of the kernel of `θ : A_inf → 𝒪_{ℂ_p}`, `B_dR^+` the completion of
`A_inf[1/p]` at `(ξ)` with its filtration `Fil^j = ξ^jB_dR^+`, and `t ∈ Fil¹` the period of `ℤ_p(1)`. (a) *Torsion.* Since `Ỹ[1/p]` is
de Rham over `K_s`, the class of `f ⊗ 1` in `H¹(G_{K_s}, Y ⊗_{ℤ_p} A_inf/ξ^{e+1}A_inf)` is torsion: `(A_inf/ξ^{e+1})[1/p] = B_dR^+/Fil^{e+1}`, and `1` lifts to `(Ỹ ⊗ B_dR^+)^{G_{K_s}}` because `D_dR` is exact on de Rham representations and strict for the
filtrations. (b) *The torsion is killed by `p^{c′}`.* Filter by the pieces `ξ^iA_inf/ξ^{i+1}A_inf ≅ 𝒪_{ℂ_p}(i)`, `0 ≤ i ≤ e`. The
sub-statement for one piece is
   (G) for `0 ≤ i ≤ e`, the torsion of `H¹(G_{K_m}, Y ⊗_{ℤ_p} ξ^iA_inf/ξ^{i+1}A_inf)` is killed by `p^{2 + max(1, r_i)}`.
Its route is the frame argument written out in 4.9d, with `χ^i` in place of `χ^0`: after decompletion along the cyclotomic tower (with the lattice of
`Y` at level `s` of 4.10e(0)), the piece becomes a free module `Ô_{K_∞}^{r′}` on which a generator `g` of `Gal(K₀(μ_{p^∞})/K_m)` acts by
`χ^i(g)ϱ(g)·g`, `ϱ` a matrix representation over `𝒪_{K_m}` with a Hodge–Tate basis (the representation is de Rham) whose weights
lie in `U`; on the summand `𝒪_{K_m}^{r′}` of Tate's decomposition `Ô_{K_∞} = 𝒪_{K_m} ⊕ X_m` the operator is linear and semisimple and
`∏_{u∈U}(ϱ(g) − χ(g)^{−u}) = 0`, a product over the **set** `U`, while on the complement `g − 1` has a bounded inverse; so
`(ϱ(g) − χ(g)^{−i})y = ∏_{u∈U, u≠i}(χ(g)^{−i} − χ(g)^{−u})·w` has an integral solution whenever `(ϱ(g) − χ(g)^{−i})w′ = p^kw`, and
`v_p(χ(g)^{−i} − χ(g)^{−u}) = m + v_p(u − i)`; Tate's almost vanishing of `H¹(Gal(K̄/K₀(μ_{p^∞})), 𝒪_{ℂ_p})` and the passage back to
the lattice basis cost `1` each. Dévissage over the pieces (the invariants of the quotients lift after inverting `p`, so a
torsion class of the filtered module comes, after the exponent of a quotient, from a torsion class of the sub-piece) and
descent from `K_m` to `K_s` (`cor∘res = [K_m : K_s] = p^{m−s}`, ArithmeticGaloisDuality §R02.2.3, the cost `v`) give `p^{c′}`: so
`p^{c′}(f ⊗ 1)` is a coboundary. (c) *Push to the character.* Let `ψ : Y → ℚ_p` be a `ℤ_p`-coordinate of a lift of `ϕ`, equivariant
for `χ_cyc^{−e}` modulo `ℤ_p`, and `c_ψ := ψ∘f`: then `p^{c′}c_ψ(σ) − (χ_cyc(σ)^{−e}σ(b) − b) ∈ A_inf + Fil^{e+1}B_dR` for some
`b ∈ B_dR^+` and all `σ ∈ G_{K_s}`. (d) *A genuine cocycle.* `p^{s + v_p(e+1)}c_ψ` is congruent modulo `ℤ_p` to a cocycle `z : G_{K_s} → ℚ_p(−e)`: the
obstruction lies in `H²(K_s, ℤ_p(−e))`, dual to `H⁰(K_s, ℚ_p/ℤ_p(e + 1))`, of order `p^{s + v_p(e+1)}` (ClassFieldTheory Layer 5;
`χ_cyc(G_{K_s}) = 1 + p^sℤ_p`). (e) *The dual exponential.* Let `exp^* : H¹(K_s, ℚ_p(−e)) → K_s` be the dual exponential (the image
of a class in `H¹(G_{K_s}, (B_dR^+/Fil^{e+1})(−e)) = K_s·t^e·log χ_cyc`). The two remaining sub-statements are:
   (D1) a class of `H¹(K_s, ℚ_p(−e))` represented, modulo `A_inf + Fil^{e+1}B_dR`, by a twisted coboundary of `B_dR^+` as in (c) has
   `v_p(exp^*) ≥ −(e(s + 1) + v_p(e!) + 1 + s + e/(p − 1))`;
   (D2) the dual exponentials of the classes with values in `ℤ_p(−e)` contain `p^β𝒪_{K_s}`, `β := s − 1 − e − v_p((e − 1)!)` for `e > 0`
   and `β := −1` for `e = 0`: an inclusion of lattices, with `β` of either sign (for `e = s = 1` it is `−1`), not a loss of
   annihilation.
Put `a := (e + 2)s + v_p(e) + ⌊e/(p − 1)⌋ + 1`. Then `a ≥ β + (e(s + 1) + v_p(e!) + 1 + s + e/(p − 1))`: for `e > 0` the right side is
`(e + 2)s + v_p(e) + e/(p − 1)`, for `e = 0` it is `s ≤ 2s + 1 = a`. So by (D1) applied to `p^{c′}z` and (D2) there is a cocycle `z₁`
with values in `ℤ_p(−e)` and `exp^*(p^{a+c′}z − z₁) = 0`. (f) *Finiteness.* A class of `H¹(K_s, ℚ_p(−e))` with `exp^* = 0` lies in
`H¹_g = H¹_f` (SelmerIwasawaCohomology §4.9: it is zero if `e > 0`, unramified if `e = 0`); `z₁` dies in `(ℚ_p/ℤ_p)(−e)`; so `p^{c′ + (s + v_p(e+1)) + a}` times
the restriction of `[ϕ∘f]` to `G_{K_s}` is finite. (g) *Descent* to `K`: corestriction preserves the finite classes and
`cor∘res = [K_s : K]`, the cost `g_K`. The exponents add up to `c`. The torsion clause: the divisible part of `H¹(K, V_e/L_e)` has
corank at most `[K:ℚ_p] + 1` (local Euler characteristic); the description of the finite classes is SelmerIwasawaCohomology §4.9. Not given here:
(G), (D1), (D2), and in (b) the rational lifting of the invariants of the quotients.

*Route of (2).* Restrict to `G_{K′}`: `Ỹ[1/p]` is crystalline over `K′`, `K′₀ ⊆ K′ ⊆ K′₀(μ_{p^{s_N}}) = K′` (`s_N ≥ 2` if `p = 2`, as
`4 | N`), `E` contains the images of `K′`, and the set of weights of `Y` at the embeddings of `K′` is `U` (the weights at an
embedding of `K′` are those at its restriction to `K`). So (1) for `K′` at the level `s_N` gives `p^{c(K′)}·res[ϕ∘f]` finite; corestriction
preserves the finite classes and `cor∘res = [K′ : K]`, `p^{v_p([K′:K])}` times a unit (ArithmeticGaloisDuality §R02.2.3). The degree:
`[K′ : ℚ_p] = o·[K′₀(μ_{p^{s_N}}) : K′₀] = o·p^{s_N−1}(p − 1)` (resp. `o·2^{s_N−1}` for `p = 2`), `o` the order of `p` modulo `N′`; so
`v_p([K′ : K]) ≤ v_p(o) + s_N − 1 ≤ log_p N′ + v_p(N) = log_p N` (`o ≤ N′`, and `s_N − 1 ≤ v_p(N)`). The round bound: with
`λ := λ_N` and `M₀ = h₀ = h`, `n₀ ≤ ⌊log_p 2h⌋ + 1`, `m ≤ 2λ`, `v ≤ 2λ`, `|u − i| ≤ 2h`, so `r_i ≤ n(m + λ) ≤ 3nλ` and each term of `c′` is at most
`3(n + 1)λ`; `v_p(e), v_p(e + 1) ≤ log_p h ≤ λ` and `⌊e/(p − 1)⌋ ≤ t`; hence `c(K′) ≤ 2λ + 3t(n + 1)λ + (2t + 4)λ`, and with
`v_p([K′:K]) ≤ λ` the total is at most `(n + 1)(5t + 7)λ ≤ 7(t + 1)(n + 1)λ ≤ 40(t + 1)(n + 1)λ`. *Needs:* SelmerIwasawaCohomology §4.9; 4.10e(0);
ClassFieldTheory Layer 5; ProfiniteCohomology §5.4; ArithmeticGaloisDuality §R02.2.3; PadicPeriodRings §§1.3–1.5 (normalized
traces and Tate's decomposition, Tate's cohomology of `ℂ_p(j)`, `B_dR^+`).

**Checks.** (`K = ℚ_p`, `s = 1`, `p` odd, `μ` an unramified character; then `g_K = 0` and `U` is the weight of `Y`.)

- `e > 0`, `Y = O(χ_cyc^{−e}μ)`, `U = {e}`: `V_e` has the single weight `e > 0`, so `H¹_f(K, V_e) = 0` and the statement says that
  `p^c·[ϕ∘f] = 0`. Directly: `[f]` is torsion (its restriction to `ℚ_p(μ_p)` is finite, `Y[1/p]` has no negative weight and no
  invariants there, and restriction is injective after inverting `p`); the torsion of `H¹(K, Y)` is `H⁰(K, Y[1/p]/Y)`, killed by
  `χ_cyc^{−e}(g) − 1` for `g` in inertia, hence by `p^{1+v_p(e)}` (by `1` if `(p − 1) ∤ e`); so `p^{1+v_p(e)}[ϕ∘f] = 0`, and
  `1 + v_p(e) ≤ c`. This holds however close `μ` is to `1`, which makes the image of `ϕ` large.
- `U = {u₀}`, `u₀ ≠ e`, `Y = O(χ_cyc^{−u₀}μ)`: `ϕ` is equivariant, so its image is killed by `χ_cyc^{−u₀}μ(g) − χ_cyc^{−e}(g)` for `g`
  in inertia, hence by `p^{1+v_p(u₀−e)}`; so `p^{1+v_p(u₀−e)}[ϕ∘f] = 0`, inside the term `m + v_p(u₀ − e)` of `c′` at `i = e`.
- `e = 0`, `U = {0}`: `Ỹ` is crystalline over `ℚ_p(μ_p)` with all weights `0`, hence unramified there; so the inertia group of
  `ℚ_p` acts on `Ỹ` through a quotient of order dividing `p − 1`, and `ϕ∘f`, a homomorphism from `G_K` to the `p`-primary group
  `V_0/L_0`, vanishes on inertia: it is unramified and lies in `H¹_f(K, V_0/L_0)`, so `c = 0` would suffice.
- `U = ∅` (`Y = 0`): `f = 0`, and the statement is empty.
- (*the set and semisimplicity*) The product over the set `U` in (G) uses that `ϱ(g)` is semisimple (a Hodge–Tate basis). On a
  free module of rank two, `γ = (1, p^N; 0, 1)` satisfies `(γ − 1)² = 0` but not `γ − 1 = 0`, and its coinvariants contain `ℤ/p^N`
  for every `N`; such a `γ` has no Hodge–Tate basis with weight set `{0}`, which would force `γ = 1`. A bound read off from the
  polynomial `(γ − 1)²` alone, with the weight `0` counted twice and `r_0 = 0`, would be false.
- (*abelian bases*) `p = 7`, `N = 91`, `ψ = χ_7χ_{13}` with `χ_7`, `χ_{13}` cubic characters of conductors `7`, `13`: `7` has order `12`
  modulo `13`, so `χ_{13}` is an unramified character of order `3` of `G_{ℚ_7}`, and `ψ` cuts out a totally ramified cubic
  extension `K` of `ℚ_7` different from the cubic subfield of `ℚ_7(μ_7)`, the only cubic subfield of the tower `ℚ_7(μ_{7^s})`. So `K₀ = ℚ_7`
  and `K ⊄ K₀(μ_{7^s})` for every `s`: (1) does not apply to `K`; but `K ⊆ ℚ_7(μ_{91}) = K′`, `s_N = 1`, and (2) does, with
  `v_7([K′ : K]) = 0`.

### 4.9d Invariants of a crystalline lattice modulo the lattice

Prove (statements of [FormalProof]; the route gives every step except the classical inputs and the frame, named there):

1. let `K₀/ℚ_p` be finite unramified, `s ≥ 1` (`s ≥ 2` if `p = 2`), `K₀ ⊆ K ⊆ K_s := K₀(μ_{p^s})`, `E` containing the images of the
   embeddings of `K_s`, `V` an `E`-representation of `G_K`, crystalline as a representation of `G_{K_s}`, with all its Hodge–Tate
   weights (at all embeddings) in `[−M₀, h₀]`, `M₀, h₀ ≥ 0`, and `τ` an embedding of `K` into `E` at which `0` is not a Hodge–Tate
   weight of `V`. Put `n₀ := min{n ≥ 0 : M₀ + h₀ ≤ p^n(p − 1)}`, `m := 2s + n₀ + 1` and `c := 2 + Σ_u(m + v_p(u))`, the sum over the
   distinct Hodge–Tate weights `u` of `V` at `τ`. Then `p^c·H⁰(K, V/T) = 0` for every `G_K`-stable `O`-lattice `T ⊂ V`; in particular
   `length_O H⁰(K, V/T) ≤ rk_O T·c·length_O(O/p)`. (The route shows that `p^c` kills even `H⁰(K₀(μ_{p^m}), V/T)`.)
2. (*abelian bases*) let `N`, `K′ = ℚ_p(μ_{lcm(p,N)})`, `s_N` and `λ_N` be as in 4.9c(2), `K ⊆ K′`, `E ⊇ μ_{lcm(p,N)}`, `V` crystalline
   as a representation of `G_K` with weights in `[−M₀, h₀]`, and `τ` an embedding of `K` at which `0` is not a weight. Then
   `p^c·H⁰(K, V/T) = 0` for every stable lattice `T`, `c` the exponent of (1) for `K′` at the level `s_N` and an embedding of `K′`
   extending `τ`. If moreover the weights at every embedding lie in a set `U ⊂ [−h, h]` (`h ≥ 1`) with `#U ≤ n`, then
   `c ≤ 20(n + 1)λ_N`.

*Route.* (0) For (1) it suffices to treat `K = K_s`: `V` is crystalline over `K_s`, `T` is `G_{K_s}`-stable, the weights at an
embedding of `K_s` extending `τ` are those at `τ`, and `H⁰(K, V/T) ⊆ H⁰(K_s, V/T)`; (2) is (1) over `K′ = K′₀(μ_{p^{s_N}})` by the same
restriction (4.9c(2)), and the bound follows as there: `m ≤ 2λ_N`, `v_p(u) ≤ log_p h ≤ λ_N` for the at most `n` distinct weights `u ≠ 0`
at the embedding, so `c ≤ 2 + 3nλ_N ≤ 20(n + 1)λ_N`. (1) *Frame.* After base change to `A_inf` along `ι_s`, the lattice `N_s(T)` of 4.10e(0)
satisfies `X^{h₀}(T ⊗ A_inf) ⊆ N_s(T) ⊗ A_inf ⊆ X^{−M₀}(T ⊗ A_inf)`; specialising along the cyclotomic tower at `π = ζ_{p^{s+n₀}} − 1`, where `X`
takes the value `ζ_{p^{1+n₀}} − 1`, whose `(M₀ + h₀)`-th power divides `p` by the choice of `n₀`, gives a lattice within `p` of
`T ⊗ 𝒪_{ℂ_p}`, fixed by `Gal(K̄/K₀(μ_{p^∞}))`, on which `G_{K₀(μ_{p^m})}` acts through matrices `ϱ(σ)` over the integers of `K₀(μ_{p^m})`,
with `ϱ(g) ≡ 1` modulo elements of norm `< p^{−1/(p−1)}` for a generator `g` of `Gal(K₀(μ_{p^∞})/K₀(μ_{p^m}))` (this is where
`m = 2s + n₀ + 1` comes from: `(γ − 1)N_s(T) ⊆ πN_s(T)`). (2) Cut by the idempotent of `τ` in `K ⊗ ℂ_p`; `V` being de Rham, the result
has a Hodge–Tate basis with weights among those at `τ`, and the lattice it defines meets `V` in `T`. (3) *Torsion of `H¹`.* A torsion
class of `H¹(G_{K₀(μ_{p^m})}, 𝒪_{ℂ_p}^{r′})` for the action `χ^iϱ`, `i` not a weight at `τ`, is killed by `p^{1+N_i}`,
`N_i := max(1, Σ_{u≠i}(m + v_p(u − i)))`: Tate's almost vanishing on `Gal(K̄/K₀(μ_{p^∞}))` (cost `1`); Tate's decomposition
`Ô_{K_∞} = 𝒪_{K₀(μ_{p^m})} ⊕ X_m` and the bounded inverse of `g − 1` on `X_m` (cost at most `1 ≤ N_i`); on the first summand the twisted
generator is linear, annihilated by `∏_u(ϱ(g) − χ(g)^{−u})` over the distinct weights, and `v_p(χ(g)^{−i} − χ(g)^{−u}) = m + v_p(u − i)`
(for `p = 2`, `m ≥ 2`); if `∏_u(ϱ − f_u) = 0` and `(ϱ − f_i)w′ = p^kw` with `k ≥ 0`, then `(ϱ − f_i)y = ∏_{u≠i}(f_i − f_u)·w` for an integral
`y` (pure algebra). (4) For `v ∈ V` with `(σ − 1)v ∈ T` for all `σ ∈ G_{K₀(μ_{p^m})}`: `σ ↦ p(σ − 1)v` is such a torsion class for
`i = 0`; so `p^{2+N₀}v` differs from an integral vector by an invariant of `ℂ_p^{r′}` for weights `≠ 0`, which is zero (Tate:
`H⁰(G_{K₀(μ_{p^m})}, ℂ_p(j)) = 0` for `j ≠ 0`); and `2 + N₀ ≤ c`. Not given here: the frame of (1) and (2) (the position of `N_s(T)` in
`A_inf`, the decompletion, the Hodge–Tate basis) and Tate's theorems, which are PadicPeriodRings §§1.3–1.4. *Needs:* SelmerIwasawaCohomology §4.9;
4.10e(0); PadicPeriodRings §§1.3–1.5.

**Checks.**

- `V = ℚ_p(u)`, `u ≠ 0`, `K = ℚ_p`, `p` odd: `G_{ℚ_p(μ_{p^m})}` acts on `ℚ_p/ℤ_p(u)` through `χ_cyc^{∓u}` with image `1 + p^mℤ_p`, so
  `H⁰(ℚ_p(μ_{p^m}), ℚ_p/ℤ_p(u))` has exponent exactly `m + v_p(u)`; the bound is `m + v_p(u) + 2`.
- (*the hypothesis on `τ`*) If `0` is a weight at every embedding the statement fails: `V = ℚ_p` gives `H⁰ = ℚ_p/ℤ_p`; and
  `V = μ_n ⊕ ℚ_p(1 − k)` over `ℚ_p` (`k ≥ 2`, weights `0` and `k − 1`; `μ_n` unramified with Frobenius acting by `1 + p^n`), with the split lattice, has
  `H⁰(ℚ_p, V) = 0` but `H⁰(ℚ_p, V/T) ⊇ ℤ/p^n` for every `n`. No bound for `H⁰(K, V/T)` follows from the degree-one character bound of
  4.9c.

### 4.10a Torsion classes cut out of crystalline families beyond the Fontaine–Laffaille range

Let `p` be odd, `K/ℚ_p` finite unramified of degree `n`, and `E/ℚ_p` finite containing the images of the embeddings of
`K`. Take position data of rank `r` and block length `t` in position (position data exist only for `p ≥ 11`), a crystalline
`ρ` with `HT_i(ρ) = U_i`, crystalline characters `χ_c = χ_1χ_cyc^{−(c−1)}` (`1 ≤ c ≤ t`) with `HT_i(χ_c) = {w_i + c − 1}`, and
the notions of full representation and admissible module, all as in WachLatticesOverTheCyclotomicTower §§6.4, 6.9 (with
its labelling `HT_i` of the Hodge–Tate data by the source embedding of `φ_i`); put `d = Σ_i#{u ∈ U_i : u < w_i}`, the number
of negative Hodge–Tate weights of `ρχ_1^{−1}`. Let `T₀ ⊂ ρ` be a stable lattice, `X` a finite `O`-module and `z` a continuous
cocycle of `G_K` with values in `T₀(χ_1^{−1}) ⊗ X`; for `a` with `λ^aX = 0` let `ℰ_z(a)` be the extension of `(O/λ^a)(χ_1)`
by `T₀ ⊗ X` defined by `z`, and call `z` **admissible** if `ℰ_z(a)` is admissible for all large `a`. Prove:

1. `H⁰(G_K, T̄₀(χ̄_1^{−1})) = 0 = H²(G_K, T̄₀(χ̄_1^{−1}))`; `H¹(G_K, T₀(χ_1^{−1}))` is free of rank `r[K:ℚ_p]`, commutes with
   `⊗_OX`, and contains `H¹_f(K, T₀(χ_1^{−1}))` (the `T`-condition of SelmerIwasawaCohomology §4.9) as a direct summand of rank `d`;
2. `z` is admissible if and only if its class lies in the image of `H¹_f(K, T₀(χ_1^{−1})) ⊗_O X`;
3. for `2 ≤ c ≤ t`, a cocycle with values in `X(χ_cχ_1^{−1}) = X(χ_cyc^{−(c−1)})` is admissible (its extension of
   `(O/λ^a)(χ_1)` by `X(χ_c)` is admissible) if and only if it is a coboundary;
4. a homomorphism `G_K → X` (the case `c = 1`) is admissible if and only if it is unramified.

The range of weights `h_i` may be of size about `p²/4`, far beyond the Fontaine–Laffaille range `h_i ≤ p − 2`.

*Route.* (1) WachLatticesOverTheCyclotomicTower §6.9(1c): `T̄₀(χ̄_1^{−1})^{ss}` has no constituent `k` (`e = 0`) and no
constituent `k(χ̄_cyc)` (`e = −1`), so `H⁰ = 0` and, by local duality, `H² = 0` (ClassFieldTheory Layer 5); freeness of `H¹`
and its compatibility with `⊗X` follow by dévissage and the local Euler characteristic; `H¹_f` has rank `d` by SelmerIwasawaCohomology §4.9's
dimension formula (`H⁰ = 0`) and is a summand by saturation (SelmerIwasawaCohomology §2.6). (2) Admissible classes form a submodule of `H¹(· ⊗ X)`,
stable under change of `X` and detected after injections `X ↪ X′`. A finite class gives a crystalline extension of `χ_1` by
`ρ` by 4.9a; adding `χ_2, …, χ_t` as direct summands gives a full representation, and `ℰ_z(a)` is a quotient of lattices in
it: finite classes are admissible. Conversely, over `X = k` the admissible classes contain `H¹_f ⊗ k` and have dimension at
most `d` (WachLatticesOverTheCyclotomicTower §6.9(3)), so they are `H¹_f ⊗ k`. For general `X`, write
`H¹ ⊗ X = (H¹_f ⊗ X) ⊕ (C ⊗ X)` with `C` a complement; if `z ∈ C ⊗ X` is admissible and nonzero, choose `j` with
`z ∈ C ⊗ λ^jX`, `z ∉ C ⊗ λ^{j+1}X`; admissibility is detected after `λ^jX ↪ X`, and some `f : λ^jX → k` has `f_*z ≠ 0`,
an admissible class over `k` outside `H¹_f ⊗ k`, a contradiction. (3) The "if" half: coboundaries give split extensions,
quotients of lattices in `ρ ⊕ χ_1 ⊕ ⋯ ⊕ χ_t`. The "only if" half: WachLatticesOverTheCyclotomicTower §6.9(4) with
`e = c − 1 ∈ [1, t − 1]` over `X = k`, and dévissage on the length of `X` (admissibility is detected after injections).
(4) The "only if" half: WachLatticesOverTheCyclotomicTower §6.9(4) with `e = 0` and the same dévissage. The "if" half: reduce to `X = O/λ^b`; for
`f(Frob) = x`, take `μ` unramified with `μ(Frob) ≡ 1 + λ^bx` modulo `λ^{2b}`; the lattice `{(a, a′) : a ≡ a′ (mod λ^b)}` in
`χ_1 ⊕ χ_1μ`, inside the sum of the two full representations `ρ ⊕ χ_1 ⊕ ⋯ ⊕ χ_t` and `ρ ⊕ χ_1μ ⊕ χ_2 ⊕ ⋯ ⊕ χ_t`, has the
extension of class `f` as a subquotient. The comparison is insensitive to enlarging `E`: admissibility is preserved by
`⊗_OO′` (fullness passes to `E′`), and `H¹(T ⊗ X)/(image of H¹_f ⊗ X)` injects into its base change. *Needs:* SelmerIwasawaCohomology §§2.6, 4.9, 4.10;
4.9a; WachLatticesOverTheCyclotomicTower §§6.4–6.9 and PhiGammaModulesAndIwasawaCohomology §§3.4, 3.6; ArithmeticGaloisDuality §R02.4.2; ClassFieldTheory
Layer 5 (local duality, Euler characteristic).

**Checks.**

- If every `h_i ≤ p − 2`, then `σ_i = 0`, and admissible modules are torsion-crystalline in the interval: SelmerIwasawaCohomology §§4.8 and 4.10
  then give the hard half of (2) under a weaker hypothesis than (P4) of WachLatticesOverTheCyclotomicTower §6.9; (2) does
  not give SelmerIwasawaCohomology §4.10, whose predicate allows all crystalline lattices with weights in the interval.
- (4) is consistent with SelmerIwasawaCohomology §4.9's Check `H¹_f(K, ℚ_p) = H¹_ur`: the unramified homomorphisms are the admissible ones.
- `n = 2`, `h_0 = h_1 = 60`, `p = 41`: `σ_i = 1`, so windows with `η_i ≤ 30` are allowed although `h_i > p − 2 = 39`; the
  theorem applies there and the Fontaine–Laffaille comparison does not.
- Outside (P5) the theorem fails: in the example of WachLatticesOverTheCyclotomicTower §6.9's Checks (`r = t = 1`,
  `U = {p}`, `w = η = 1`), `H⁰ ≠ 0`, every class of `H¹(G_{ℚ_p}, 𝔽_p)` is admissible, and the image of `H¹_f ⊗ k` is the line
  of the torsion class: (1) and (2) fail.

### 4.10b Defect and colength under local duality

Let `K/ℚ_p` be finite, `V` a de Rham `E`-representation of `G_K`, `T ⊂ V` a stable lattice, `W = V/T`, `T′ = Hom_O(T, O)(1)`,
and let `F_W ⊆ H¹(K, W)` be the image of `H¹_f(K, V)` (the `W`-condition of SelmerIwasawaCohomology §4.9). Under the local Tate pairing
`H¹(K, W) × H¹(K, T′) → E/O`, `F_W` and `H¹_f(K, T′)` are exact annihilators: this is SelmerIwasawaCohomology §2.17 for `T′`, with the orthogonal pair
of SelmerIwasawaCohomology §4.9. Prove: for every `O`-submodule `I ⊆ H¹_f(K, T′)` the annihilator `I^⊥ ⊆ H¹(K, W)` contains `F_W`, and

`length_O(I^⊥/F_W) = length_O(H¹_f(K, T′)/I)` (both sides possibly infinite).

So a class of `H¹(K, W)` orthogonal to `I` is finite up to a defect of length at most the colength of `I` in `H¹_f(K, T′)`.

*Route.* The pairing identifies `H¹(K, W)` with the Pontryagin dual of the finitely generated `O`-module `H¹(K, T′)`, so for
submodules `I ⊆ I′` the quotient `I^⊥/I′^⊥` is the Pontryagin dual of `I′/I`, of the same length; take `I′ = H¹_f(K, T′)`, whose
annihilator is `F_W` (SelmerIwasawaCohomology §2.17). *Needs:* SelmerIwasawaCohomology §§2.17, 4.9; ArithmeticGaloisDuality §R02.4.2; ClassFieldTheory Layer 5.

**Checks.**

- `I = H¹_f(K, T′)`: no defect. `I = 0`: `I^⊥ = H¹(K, W)` and the defect is the full corank `dim H¹(K, V) − dim H¹_f(K, V)`,
  matching the rank of `H¹_f(K, T′)` by the dimension formula of SelmerIwasawaCohomology §4.9.

### 4.10c Lifting finite classes with loss over an unramified base

Let `p` be odd, `K/ℚ_p` finite unramified of degree `n`, and `E` containing the images of the embeddings of `K`; the Wach
lattices `N(T)`, the indices `i ∈ ℤ/n` with the labelling `HT_i`, the elements `γ` (a topological generator of the pro-`p` part
of `Γ_K`) and `γ₀` (with `χ(γ₀)` a topological generator of `ℤ_p^×`), `π₀` and `Q := π₀ + p` are those of
WachLatticesOverTheCyclotomicTower §§6.4, 6.10. Let `f : T₁ ↠ T₂` be a surjection of `G_K`-stable `O`-lattices in
crystalline `E`-representations with `HT_i(T₁) ⊂ [−M_i, h_i]`, `M_i, h_i ≥ 0` (standing convention: `ℚ_p(1)` has weight
`−1`), and let `H`, `M`, `cost`, `e_W`, `e°_U` and `e_U` (for the weights of `T₁`) be as in WachLatticesOverTheCyclotomicTower
§6.10; put `h := max_ih_i`. Prove:

1. (*for every prime `p` and every finite `K/ℚ_p`*, `E` arbitrary) for a `G_K`-stable `O`-lattice `T` in a crystalline
   `E`-representation of `G_K`, `H¹_f(K, T)` (the `T`-condition of SelmerIwasawaCohomology §4.9; by 4.9a(4), the classes whose extension of `O` by `T`
   is crystalline) contains the torsion of `H¹(K, T)` and is generated by at most `([K:ℚ_p] + 1)·rk T` elements (over the
   unramified `K` of this section, `(n + 1)·rk T`);
2. (*Herr representatives*) let `ξ ∈ H¹_f(K, T)`, with weights of `T` in `[−M, h]`, and `e` the `φ`- and `Γ_K`-fixed generator
   of `N(O)`. If `x ∈ N(T_ξ)^{Γ_K^{tor}}` maps to `p^ke`, then `((φ − 1)x, (γ − 1)x)` is a Herr cocycle of `D(T)^{Γ_K^{tor}}` (for
   the procyclic group generated by `γ`) with components in `Q^{−M}N(T)^{Γ_K^{tor}}` and `π₀N(T)^{Γ_K^{tor}}` representing
   `unit·p^kξ` (PhiGammaModulesAndIwasawaCohomology §3.6). Conversely every Herr cocycle `(y, z)` with
   `y ∈ Q^{−M}N(T)^{Γ_K^{tor}}`, `z ∈ π₀N(T)^{Γ_K^{tor}}` represents a class of `H¹_f(K, T)`, which is zero only if `(y, z) = d⁰m`
   with `m ∈ N(T)^{Γ_K^{tor}}`. (*Poles at several levels*) More generally, if `(y, z)` is a Herr cocycle of `D(T)^{Γ_K^{tor}}` with
   `Λ·y ∈ N(T)` for a product `Λ` of powers of the `φ^j(π₀ + p)`, `j ≥ 0`, and `z ∈ π₀N(T)`, the class of `(y, z)` is finite;
3. (*lifting with loss*) `p^{e°}·H¹_f(K, T₂) ⊆ f(H¹_f(K, T₁))` with `e° := 2·cost(0, H) + e°_U`; `e° = 0` when `M + h ≤ p − 2`.
   As round bounds, `e° ≤ e := 2e_W + e_U` and `e ≤ 23·(2 + H/p + log_p(H + 1))`.

The interval `[−M_i, h_i]` must contain `0`; the statement is not invariant under twist.

*Route.* (1) `H¹_f(K, T)` modulo torsion is free of rank
`dim H¹_f(K, V) = dim_E(D_dR/Fil⁰) + dim H⁰(K, V) ≤ [K:ℚ_p]·rk T + dim H⁰(K, V)` (SelmerIwasawaCohomology §4.9's exact sequence; `D_dR(V)` is free of
rank `rk T` over `K ⊗_{ℚ_p} E`); the torsion of `H¹(K, T)` is the quotient of `H⁰(K, V/T) ⊆ (E/O)^{rk T}` by its divisible part,
the image of `H⁰(K, V)`, of corank `dim H⁰(K, V)`, so it needs at most `rk T − dim H⁰(K, V)` generators; a torsion class splits
after inverting `p`. Nothing here uses `p` odd or `K` unramified. (2) The first
half is the connecting map of Herr complexes (PhiGammaModulesAndIwasawaCohomology §3.6) for
`0 → D(T) → D(T_ξ) → D(O) → 0`, on `Γ_K^{tor}`-invariants with the pro-`p` generator `γ` (the element `γ₀` is used only in
WachLatticesOverTheCyclotomicTower §6.10(2)), applied to the lift `x` of `p^ke`; the components are placed by the heights,
the `Γ` condition and the saturation of WachLatticesOverTheCyclotomicTower §6.4(2), (3), (5). For the converse, let `T′_ξ`
be the extension defined by the cocycle. The module `N(T) ⊕ O_E[[π]]e′` with `φ(e′) = e′ + y`, `γ(e′) = e′ + z` and `Γ_K^{tor}`
fixing `e′` is finite free and spans `D(T′_ξ)`; its pole order is at most `M`, its height at most `M + h`
(`Q^{M+h}e′ = Q^{M+h}φ(e′) − Q^h(Q^My)`, with `Q^My ∈ N(T) ⊆ Q^{−h}φ^*N(T)`), and `Γ_K` acts trivially on it modulo `π`
(`z ∈ π₀N(T)`). By WachLatticesOverTheCyclotomicTower §6.4(8) the extension is crystalline, so the class is finite (4.9a(4)).
If the class is zero, `(y, z) = d⁰m` with `m ∈ D(T)^{Γ_K^{tor}}`, and `N(T) ⊕ O_E[[π]](e′ − m)` is a second module with these
properties in the same `D(T′_ξ)`; by the uniqueness in WachLatticesOverTheCyclotomicTower §6.4(8) the two coincide, so `m ∈ N(T)`. *Poles at several levels.* Let
`b ∈ W(C^♭) ⊗ T` with `(φ − 1)b = y` (`φ − 1` is onto there); the class of `(y, z)` is the cocycle `g ↦ z_g − (g − 1)b`, `z_g` the
element given by Herr's formula `z_g = ((g − 1)/(γ − 1))·z`, so that `(γ − 1)z_g = (g − 1)z`. Because `Λy ∈ N(T)`, the denominators
of `b` against `T ⊗ A_inf` are products of the images of the `φ^j(π₀ + p)`, which become units in `B_cris`. The equation
`(γ − 1)w = z` has a solution `w` whose coordinates in a basis of `N(T)` are series convergent on the open unit disc with `t`
inverted, with poles only at zeros of `t`; evaluated in `V ⊗ B_cris` it gives `z_g = (g − 1)w`. So the cocycle is
`g ↦ (g − 1)(w − b)`, a coboundary in `V ⊗ B_cris`, and the class is finite (SelmerIwasawaCohomology §4.9). The bound on the denominators of `b` and
the existence and convergence of `w` are statements of [FormalProof] whose proofs are not given here; the case `Λ = Q^M` is
the converse above. (3) Let `ξ ∈ H¹_f(K, T₂)`. (i)
`T_ξ` is crystalline with the weights of `T₂` and `0`, inside the intervals of `T₁` (this is where `0 ∈ [−M_i, h_i]` is used).
WachLatticesOverTheCyclotomicTower §6.10(2) for `T_ξ ↠ O` gives `x ∈ N(T_ξ)^{Γ_K^{tor}}` over `p^{cost(0,H)}e`, and by (2) its Herr cocycle `(y, z)` represents
`unit·p^{cost(0,H)}ξ`. (ii) By WachLatticesOverTheCyclotomicTower §6.10(2) for `N(T₁) → N(T₂)` the cochain `p^{cost(0,H)}(y, z)` lifts to a cochain `(ỹ, z̃)` of
the truncated complex of `N(T₁)^{Γ_K^{tor}}`; `ω := d¹(ỹ, z̃)` maps to `0`, so it lies in the truncated complex of the kernel
`T₀` (saturation, WachLatticesOverTheCyclotomicTower §6.4(5): `N(T₀) = N(T₁) ∩ D(T₀)`), whose weights are among those of `T₁`. (iii) `ω` is torsion modulo
`im d¹`: `H¹_f(K, V₁) → H¹_f(K, V₂)` is onto, because in SelmerIwasawaCohomology §4.9's sequence
`0 → H⁰(K, V) → D_cris(V) → D_cris(V) ⊕ D_dR(V)/Fil⁰ → H¹_f(K, V) → 0` the middle terms are exact functors on crystalline
representations; so `p^m·unit·p^{cost(0,H)}ξ` is the image of some `ξ₁ ∈ H¹_f(K, T₁)`, represented after `p^{cost(0,H)}` by a cocycle
with poles `(y₁, z₁)` of `N(T₁)` (by (i) for `ξ₁`); `f(y₁, z₁)` and `p^{m+cost(0,H)}(y, z)` represent the same class, so they differ
by `d⁰x₂` with `x₂ ∈ N(T₂)^{Γ_K^{tor}}` (converse of (2)); lifting `p^{cost(0,H)}x₂` to `x₁ ∈ N(T₁)` (WachLatticesOverTheCyclotomicTower §6.10(2)), the cochain
`p^{m+cost(0,H)}(ỹ, z̃) − p^{cost(0,H)}(y₁, z₁) + d⁰x₁` maps to `0`, lies in the truncated complex of `N(T₀)`, and has
`d¹ = p^{m+cost(0,H)}ω`. (iv) WachLatticesOverTheCyclotomicTower §6.10(4) for `T₀` gives `p^{e°_U}ω = d¹(y₀, z₀)`; then `p^{e°_U}(ỹ, z̃) − (y₀, z₀)` is a cocycle
with poles of `N(T₁)` lifting `p^{e°_U + cost(0,H)}(y, z)`, finite by (2): `p^{e°}ξ ∈ f(H¹_f(K, T₁))`. Total `2cost(0, H) + e°_U`: one
`cost(0, H)` to represent a finite class by a cocycle with poles, one for the cokernel of the Wach lattices, `e°_U` for the
obstruction of the kernel. If `M + h ≤ p − 2`, then `H < p − 1` and `cost(0, H) = 0`, and `e°_U = 0` (WachLatticesOverTheCyclotomicTower §6.10(4)). The
round bounds: `cost(0, H) + 3 ≤ e_W` and `e°_U ≤ e_U`; `J ⊆ [−M + 1, M + h]` has at most `3H` elements, so
`Σ_{j∈J}v_p(j) ≤ 3H/(p − 1) + 2log_p(3H + 1)`, and `a_A + v_p(a_A!) ≤ M/(p − 1) + 1 + M/(p − 1)²`; with
`e_W ≤ Hp/(p − 1)² + 3 + log_p(H + 1)` this gives `2e_W + e_U ≤ 12H/p + 9 + 4log_p(H + 1)` for `p ≥ 3`, below the stated bound. The properties of Wach
lattices used are those of 4.10e(0) at `s = 1` (heights, the `Γ` condition of (a), saturation, Sen, Herr):
WachLatticesOverTheCyclotomicTower §§6.4(2), 6.4(3), 6.4(5), 6.5(4) and (2) above. Sources: Wach 1996, Berger-Wach-2004 (Wach lattices); Herr 1998 (the complex); Bloch–Kato,
§3 (crystalline extensions and the exact sequence for `H¹_f`); [FormalProof]. *Needs:* SelmerIwasawaCohomology §4.9; 4.9a;
PhiGammaModulesAndIwasawaCohomology §§3.6, 6.0 and WachLatticesOverTheCyclotomicTower §§6.4, 6.5(4), 6.10; PadicPeriodRings §§4.1–4.3 (`B_cris`).

**Checks.**

- (*the Fontaine–Laffaille range*) If `M + h ≤ p − 2`, then `e° = 0`: `f` induces a surjection `H¹_f(K, T₁) → H¹_f(K, T₂)`.
- (*loss exactly `1` at span `p − 1`*) `O = ℤ_p`, `T₁ := {(a, b) ∈ p^{−1}ℤ_p ⊕ ℤ_p(p − 1) : pa ≡ b (mod p)}`, `f(a, b) = b`, kernel `ℤ_p`,
  weights `{0, −(p − 1)}`: `H¹_f(K, T₂) = H¹(K, T₂)`; a finite class of `T₁` is a cocycle `(z₀/p, z₂)` with `z₀` an unramified
  homomorphism and `z₀ ≡ z₂ (mod p)`, so the image of `H¹_f(K, T₁)` consists of the classes whose reduction is an unramified
  homomorphism, and the cokernel is `Hom(G_K, 𝔽_p)/Hom^{ur}(G_K, 𝔽_p)`, of length `n` and exponent `1`. Here `e° = 3`.
- (*a logarithm is necessary*) Gluing `ℤ_p` and `ℤ_p((p − 1)p^k)` modulo `p^{k+1}` in the same way, a totally ramified character
  of order `p^{k+1}` shows that the loss is exactly `k + 1 = 1 + v_p(H)` at `H = (p − 1)p^k`.
- (*span `0`, large weight*) `T₁ = U ⊗ ℤ_p(−b)` with `U` the unramified unipotent lattice of rank two, `T₂ = ℤ_p(−b)` its
  quotient, `(p − 1)p^j` dividing `b` exactly: all weights are `b`, `H¹_f(K, T_i)` is the torsion `H⁰(K, V_i/T_i)`, and
  `H⁰(K, V₂/T₂) = ℤ/p^{1+j}` while the image of `H⁰(K, V₁/T₁)` is `0` (apply a Frobenius lift `g` with `χ(g) = 1`): loss `1 + j`,
  which (3) sees through `H = b`.
- (*the interval must contain `0`*) `b ≡ 1 (mod p − 1)`, `b ≥ p`, `2 ≤ j ≤ p − 2`, `T₁` the extension of `ℤ_p(b − j)` by `ℤ_p(b)` of a
  class `ξ ∈ H¹(K, ℤ_p(j))` with nonzero reduction (crystalline, `H¹_f = H¹` for `ℤ_p(j)`): the weights `{−b, −(b − j)}` span
  `j < p − 1`, yet the connecting map `H¹(K, ℤ_p(b − j)) → H²(K, ℤ_p(b))` is the cup product with `ξ`, nonzero modulo `p` by
  local duality, so some class of `H¹_f(K, T₂) = H¹(K, T₂)` does not lift: loss `≥ 1`. The smallest interval containing the
  weights and `0` is `[−b, 0]`, so `H = b ≥ p`.
- `T₁ = T₀ ⊕ T₂`: no loss, while `e°` is positive in general: the exponent is an upper bound.
- (*the condition `z ∈ π₀N` in (2)*) For `T = O` the pair `(0, e)` is a Herr cocycle with `y = 0 ∈ N(O)` and `z = e ∉ π₀N(O)`; its class
  is the homomorphism `g ↦ log χ(g)/log χ(γ)` on the pro-`p` part, which is ramified, hence not finite. The clause on poles needs
  `z ∈ π₀N`, not `z ∈ N`.

### 4.10d Lifting along arcs of embeddings, the cluster corollary, and words of weights

In the setting of 4.10c with `p ≥ 5`, call the indices `i ∈ ℤ/n` the **letters**, in their Frobenius order (`φ` carries the
factor `i − 1` to `i`). Fix window sizes `G, S, η ≥ 0` and `h ≥ 1` and give each letter a **type**, which is part of the
data: *thin*, *up `b_i`* or *down `b_i`*, with `b_i > g := max(G, S, η, 1)` and `b_i + S ≤ h`. The weights of `T₁` at a thin
letter lie in `[−G, G]`, at an up `b` letter in `[b, b + S] ∪ [−η, η]`, at a down `b` letter in `[−b − S, −b] ∪ [−η, η]`, and all
weights lie in `[−h, h]`; `g ≤ h`. A letter is **thick** if its type is up or down; `b_i` is its *size*. A **cut set** is a
nonempty set `cuts ⊆ ℤ/n` with arc lengths `ℓ(c) ≥ j` (`j ≥ 1`) such that `c − ℓ(c)` is the previous cut and the `j` letters after
each cut are thin; the **arc** of `c` is `{c − ℓ(c) + 1, …, c}`, its letter `c − s` is at **level `s`**, and `ℓ_max := max_cℓ(c)`.
For `• ∈ {1, 2}` and a letter `i` let `H^•_i` be the length of the smallest interval containing `0` and the weights of `T_•` at
`i` (so `H^•_i ≤ 2h`, and `≤ 2G` at a thin letter), `H^• := max_iH^•_i`, `c_• := ⌈1 + log_p(H^• + 1)⌉`, and

`rr := max_{c∈cuts} max_{•∈{1,2}} (⌊min(⌊Σ_{a≥0}(H^•_{c+a+1} + c_• + 3)(p − 1)^{−a}⌋, H^•)·p/(p − 1)²⌋ + c_•)`

(indices modulo `n`). Put `M′ := ⌊(h + 2g)/(p − 1)⌋ + 1`, `σ := ⌈(3g + M′/p^{j−1})p/(p − 1)² + 1⌉`, `a₀ := 2σ + rr + 2g·ℓ_max`, and
`κ := max(ℓ_max + Σ_{i∈Ω∖0}(ℓ_max + 1 + v_p(i)))` over the unions `Ω` of three sets of at most `3g` consecutive integers in
`[−2h, 2h]`. Prove:

1. (*lifting along arcs*) suppose every arc contains at most two thick letters and, for two thick letters of one arc at
   levels `s₀ < s₁` (the letter at `s₁` is the earlier one) of sizes `b₀`, `b₁`: if the letter at `s₁` is down and the one at
   `s₀` up, then `b₀ < pb₁`; if the letter at `s₁` is up and the one at `s₀` down, then `2b₀ ≤ pb₁` and `2a₀ < b₁`. Then
   `p^e·H¹_f(K, T₂) ⊆ f(H¹_f(K, T₁))` with `e = 2rr + 4σ + 2a₀ + 2κ`, and `e ≤ 800·(h/(p − 1)^{j+1} + g·ℓ_max + log_p h)`;
2. (*the cluster corollary*) there is an absolute constant `C ≥ 1` such that the following holds. Let `p ≥ 11`,
   `j ≥ 1` with `2j < n`, and let every letter be of type up `b_i` or down `b_i` with `b_i ∈ [b, b + η]` (the thick letters) or
   `b_i ≤ w` (these letters are then thin for `G := w + S + η`), with `C(j + 1)(w + S + η + 1) ≤ b`; put `h := b + η + S` if some
   letter is thick and `h := w + S + η` otherwise. Suppose every thick letter has among the `j` letters before it either no
   thick letter or exactly one, at distance `d ≤ j`, with no other among the `d + j` letters before it (as `d + j ≤ 2j < n`, these
   letters do not include the letter itself; the condition holds when any `2j + 1` consecutive letters contain at most two
   thick ones). Then
   `length_O coker(H¹_f(K, T₁) → H¹_f(K, T₂)) ≤ C(n + 1)·rk T₂·(h/(p − 1)^{j+1} + (w + S + η + 1)(j + 1) + log_p h)·length_O(O/p)`;
3. (*words of weights*; [FormalProof] states it with the round exponent `e = 2e_W + e_U` of 4.10c(3) in place of `e°` below,
   and the form with `e° ≤ e` follows from the same assembly; the proof is given here only in part, see the route) there is
   an absolute constant `C ≥ 1` such that the following holds. Let `p ≥ 11`, let every letter be of type up `b_i` or down `b_i`
   (no thin letters) with `b_i > η`, thick if `b_i ∈ [b, b + η]` and otherwise `b_i ≤ w`, some letter not thick,
   `20·max(w, η, S) ≤ b`, and `T₂` with at most `m` weights in `[−η, η]` at every letter; let `e°` be the exponent of 4.10c(3)
   for the intervals of `T₁`, `h := b + η + S` if some letter is thick and `h := w + S` otherwise, and `[res] := 1` if some
   non-thick letter adjacent to a thick one has size `b′` with `|p·b′ − b| ≤ C(pη + pS + b/p + b′ + p·log_p(2h))`, `0` otherwise.
   (i) If the directions alternate along the letters (so `n` is even) and no three consecutive letters are thick, then
   `length_O coker(H¹_f(K, T₁) → H¹_f(K, T₂)) ≤ (C(n + 1)·rk T₂·(h/p² + (w + η)/p + S + 1 + log_p(2h) + η·[res]) + C·n·m·e°)·length_O(O/p)`.
   (ii) If all letters have the same direction and no `R ≥ 1` consecutive letters are all thick, the same holds with
   `R²(S + 1 + log_p(2h))` in place of `S + 1 + log_p(2h)` and `C·n·m·R²·e°` in place of `C·n·m·e°`.
4. (*alternating words of comparable sizes*; [FormalProof] states it with the constants below; the proof is given here
   only in part, see the route) Let `p ≥ 11`, let `K/ℚ_p` be unramified of even degree `n`, and let `E` contain the images of
   the embeddings of `K(μ_p)`. Let every letter be of type up `b_i` or down `b_i` (no thin letters), the directions
   alternating: the letters of one parity are down, the others up. No letter is required to be thick in the sense of (3),
   and the number `h` of the setting plays no role. Let `T₂` have at most `m` weights, counted with multiplicity, in `[−η, η]`
   at every letter. Put `H₀ := max_i b_i + S`, `H := H₀ + η` and `a(p, H) := H(2p − 1)/(p − 1)² + 4 + log_p(2H)`, and suppose
   that for every letter `i`: (S1) `2a(p, H) + η + 1 ≤ b_i`; (S2) `H₀/2 ≤ b_i`. Let `e′ := 2e_W + e_U` be the round exponent
   of 4.10c(3) for `T₁` and the intervals `[−b_i − S, η]` at the down letters, `[−η, b_i + S]` at the up letters (so that the
   number `H` of 4.10c for these intervals is the `H` above). Then there is an integer `e ≥ 0` with
   `e ≤ 32H/p² + 4S + 10η/(p − 1) + 25(1 + log_p(2H))` and
   `length_O coker(H¹_f(K, T₁) → H¹_f(K, T₂)) ≤ ((n + 1)·rk T₂·e + 4n·m·e′ + (3/2)·n·(rk T₂·S + 2m·((H + 1)/(p − 1) + 1)))·length_O(O/p)`;
   and if `m = 0`, `p^{e+3S}·H¹_f(K, T₂) ⊆ f(H¹_f(K, T₁))`. The conditions (S1), (S2) hold whenever there is a real `B ≥ 100`
   with `|b_i − B| ≤ η` for every `i` and `2η + S ≤ B/10`; in particular when every letter is thick for a number `b ≥ 100`
   (`b_i ∈ [b, b + η]`) and `2η + S ≤ b/10`.

*Route of (1).* There is no induction on the rank or on `n`: invariants at the cuts are regularised into cocycles, every
finite class is decomposed over the cuts, at each cut invariants are lifted from `T₂` to `T₁` through a description of the
cut lattice at the levels of its arc, and the pieces are assembled. Coordinates: `X := π₀`, `q := X + p`, `p_s := φ^s(q)` (a
unit times a distinguished polynomial of degree `p^s` in `O[[X]]` with constant term `p`), `N_i` the `Γ_K^{tor}`-invariants of
the factor of the Wach lattice at the letter `i`, `v` the valuation of `O` with `v(λ) = 1`. For a cut `c` with previous cut
`c′ := c − ℓ(c)`, and a level `s < ℓ(c)`, let `H_s := g + G`, `g + b + S` or `g + η` according as the letter `c − s` is thin, up
of size `b` or down (`g` plus the upper end of the window of that letter; these exponents are not the `H^•_i` of the setting,
which enter only `rr`), and put `Λ_c := ∏_{s<ℓ(c)}p_s^{H_s}` and `Θ_c := ∏_{s<ℓ(c)}p_s^g`. At an up letter `H_s − b = g + S ≥ 0`, and
the heights along the arc (WachLatticesOverTheCyclotomicTower §6.4(2)) give `N_c ⊆ Λ_c^{−1}O[[X]]φ^{ℓ(c)}(N_{c′})`.
(a) *Inverting `γ − 1` modulo `X^{k+1}`.* `γ` acts on `X^rN/X^{r+1}N` by `u₁^r`, `u₁ := χ(γ)^{p−1}`, with
`v_p(u₁^r − 1) = 1 + v_p(r)` (`p` odd); so for `z ∈ XN` there is `v = Σ_{1≤r≤k}p^{A(k)−A(r)}X^rd_r`, `d_r ∈ N`, with
`(γ − 1)v ≡ p^{A(k)}z` modulo `X^{k+1}N`, `A(r) := r + v_p(r!)` (induction on `k`); conversely `v ∈ XN` and `(γ − 1)v ∈ X^kN` imply
`p^Kv ∈ X^kN` for some `K`.
(b) *Transport and the cocycle `ρ_c(w)`.* `p^σφ^j(X)^r ≡ p^{A(r)}x_r` modulo `f := X^{M′}∏_{s<j}p_s^{3g}` with `x_r ∈ O[[X]]`
(this is the definition of `σ`; it uses `(p − 1)A(r) ≤ pr` and `(p − 1)² ≥ p`). A *transport* of `z ∈ XN_c` is an element
`τ ∈ O[[X]]·φ^j(N_c)` such that for some `K ≥ 0` and `v ∈ XN_c`: `(γ − 1)v ≡ p^Kz` modulo `X^{M′}N_c` and
`p^Kτ ≡ p^σφ^j(v)` modulo `f·O[[X]]φ^j(N_c)`. One exists (`v` from (a), `τ := Σ_rx_rφ^j(d_r)`), and a transport of `0` lies in
`f·O[[X]]φ^j(N_c)` (the converse in (a)). For `w` at a cut `c` with `(γ − 1)w ∈ XN_c` and a transport `τ` of `(γ − 1)w`,
`r_c := p^σφ^j(w) − τ` at the letter `c + j` has `(γ − 1)r_c ∈ f·O[[X]]φ^j(N_c) ⊆ X^{M′}N_{c+j}` (the `j` letters after `c` are
thin); `φ − 1` is bijective on `∏_iX^{M′}N_i` (`(p − 1)M′ > h + 2g` exceeds every pole order), and `ρ_c(w) := (r_c at the letter c + j, z)` with `d_φz = d_γ(r_c)` is a Herr cocycle, `O`-linear in `w` modulo `XN_c` and modulo coboundaries (two transports
differ by a transport of `0`, which gives a coboundary), and functorial in the lattices.
(c) *Decomposition over the cuts.* For the class `ξ` of an extension `Y` of `O` by `T₂`, choose `x_c ∈ N_c(Y)` over `p^{rr}e` at
each cut (WachLatticesOverTheCyclotomicTower §6.10(3) at the cuts, for the family `H^{(2)}`), a transport `τ_c` of `(γ − 1)x_c`,
put `R_c := p^σφ^j(x_c) − τ_c` at the letter `c + j`, and propagate by Frobenius along each arc; the defect at the cut `c` is
`w_c := φ^{ℓ(c)−j}(R_{c′}) − p^σx_c`, with `(γ − 1)w_c ∈ XN_c` and `Λ_cw_c ∈ O[[X]]·φ^{ℓ(c)}(N_{c′}(T₂))`; `−p^στ_c` is a transport
of `(γ − 1)w_c`, and `p^{rr+2σ}ξ ≡ Σ_cρ_c(w_c)` modulo coboundaries.
(d) *The cut lattice at the levels of its arc.* Let `D_i` be the part of `D_cris` at the letter `i`, with its Hodge filtration
(jumps `HT_i`); the filtration at level `s` of the cut `c` is `φ^s(Fil^•D_{c−s}) ⊆ D_c`, and the *expansion at level `s`* is the
evaluation at the zeros of `p_s` (the primitive `p^{s+1}`-th roots of unity), as in WachLatticesOverTheCyclotomicTower §6.4(6),
(7). (d1) For `x ∈ Λ_c^{−1}O[[X]]φ^{ℓ(c)}(N_{c′})`: `x ∈ N_c` if and only if its expansion at every level `s < ℓ(c)` lies in `Fil⁰` for
the filtration `φ^s(Fil^•D_{c−s})`. Route: `x` lies in `D(T)` and in `N_c[1/∏_{s<ℓ(c)}p_s]` (the heights along the arc); the
localisation clause of WachLatticesOverTheCyclotomicTower §6.4(7), applied at each level (the zeros of the `p_s` for distinct
`s` are distinct), puts it in `N(V)`, and `N(T) = N(V) ∩ D(T)`; equivalently, the free module `N_c` over the two-dimensional
regular ring is the intersection of its localisations at the height-one primes, it agrees with `Λ_c^{−1}O[[X]]φ^{ℓ(c)}(N_{c′})`
away from the primes over the `p_s`, and its completion at a prime over `p_s` is `Fil⁰`. (d2) For `x ∈ N_{c′}` with
`(γ − 1)x ∈ X^{M′}N_{c′}` and image `x̄` in `N_{c′}/πN_{c′} ⊂ D_{c′}`, the expansion of `φ^{ℓ(c)}(x)` at every level `s < ℓ(c)` is the
constant `φ^{ℓ(c)}(x̄) ∈ D_c` modulo `t^{(p−1)M′}`. Route: the expansion `Σ_it^ix_i` of `x` at `π = 0` has no pole and `x₀ = x̄`; `γ`
multiplies `x_i` by `χ(γ)^i ≠ 1`, so `x_i = 0` for `0 < i < (p − 1)M′` (`X` is `π^{p−1}` times a unit); the expansion of `φ(y)` at a
root of unity `ζ` is `φ` of the expansion of `y` at `ζ^p` with `t ↦ pt`, and `ζ^{p^{ℓ(c)}} = 1` at every level `s < ℓ(c)`, so
`ℓ(c)` such steps reach `π = 0`. (d3) *Coordinates.* With a basis `(e_k)` of `N_{c′}` and lifts of the `p^Ke_k` invariant
modulo `X^{M′}` ((a), (b)), an element `w` with `Λ_cw ∈ O[[X]]φ^{ℓ(c)}(N_{c′})` has a coordinate vector `y ∈ O[[X]]^r`, its
*partner* (cost `p^σ` each way), whose expansion at level `s` is, modulo negligible terms, `t^{−H_s}·unit·Σ_ky_k(t)φ^{ℓ(c)}(ē_k)`
by (d2), the `φ^{ℓ(c)}(ē_k)` forming a basis of `D_c`. The *model lattice* at level `s` is `Σ_{i≥0}t^iD_c` (thin),
`Σ_{i≥0}t^iD_c + Σ_{−b≤i<0}t^iF_s` (up `b`), `Σ_{i≥b}t^iD_c + Σ_{0≤i<b}t^iF_s` (down `b`), `F_s` the step `Fil^b`, resp. `Fil^{−η}`,
of `φ^s(Fil^•D_{c−s})`; with `V_s := F_s ∩ O^r` in the basis `(φ^{ℓ(c)}(ē_k))`, the expansion of `w` at level `s` lies in the model
lattice exactly when `y` is admissible at `s` in the sense of (f) (lying in such a lattice at all zeros of `p_s` is
divisibility by the corresponding power of `p_s` up to powers of `λ`, and the modules of (f) are saturated). The passage from
the Wach lattices of `T₁`, `T₂` and `O` to these coordinates (letters by the idempotents of `O ⊗ W(k)`, `Γ_K^{tor}`-invariants by
averaging, `|Γ_K^{tor}| = p − 1` a unit) is bookkeeping and is not written out here.
(e) *Graded model and killing polynomials.* In `(E ⊗ ℚ_p(μ_{p^{s+1}}))((t)) ⊗ D` with `γ` acting on the coefficient of `t^i` by
`χ(γ)^i` times the Galois action, an element fixed by `Γ_K` modulo a lattice of the form `Σ_it^i ⊗ D_i` is a constant modulo
it. With `L := ℓ(c) − 1`, `P_Ω(Z) := ∏_{i∈Ω∖0}(Z^{p^L} − χ(γ)^{ip^L})·Σ_{k<p^L}Z^k` kills the coefficients in `Ω∖0` and multiplies
constants by `unit·p^{L+Σ_{i∈Ω∖0}(1+L+v_p(i))}`; with at most two thick letters per arc the jump windows lie in three sets of at
most `3g` consecutive integers, whence `2κ`. In the jump windows `Fil⁰` lies between the `t^{±g}`-shifts of the model lattice of
the type, so the saturated submodules of (f) are `V_s = Fil^b` (up) and `V_s = Fil^{−η}` (down) at the letter `c − s`.
(f) *Splitting* (commutative algebra over `O[[X]]`). Let `V_s ⊆ O^r` be saturated and call `y ∈ O[[X]]^r` *admissible at `s`* if
it lies in `p_s^{H_s}O[[X]]^r` (thin), in `p_s^{H_s−b_s}(V_s ⊗ O[[X]]) + p_s^{H_s}O[[X]]^r` (up), in
`p_s^{H_s}(V_s ⊗ O[[X]]) + p_s^{H_s+b_s}O[[X]]^r` (down). These three modules are saturated (`O[[X]]/(p_s^k)` is `O`-free by
Weierstrass division), so a `λ`-power multiple of `y` lies in one of them only if `y` does. Suppose that for every level `s`
some `λ^ky − Λ_cd_s` (`d_s ∈ O^r`) is admissible at `s`. Then `y = y_{const} + ν` with `ν` admissible at every level, where:
`y_{const} = 0` if no level is down (any number of up levels); `y_{const} = Λ_cd` (`d ∈ O^r`) for one down level `s_d` and a set `I`
of up levels with `Σ_{s∈I}b_sp^s < b_{s_d}p^{s_d}` — the order of the levels plays no role, and the inequality is also necessary:
if `b_sp^s ≥ b_{s_d}p^{s_d}` for one up level `s`, write `p_s^{b_s} = λW₀ + p_{s_d}^{b_{s_d}}z₀` (sharpness in (g)); for `r = 1`,
`V_s = O`, `V_{s_d} = 0` the vector `(Λ_c/p_s^{b_s})W₀` satisfies the hypothesis with `k = 1`, `d_{s_d} = 1`, and `Λ_cd + ν` with `ν`
admissible would give `(1 − λd)p_s^{b_s} ∈ p_{s_d}^{b_{s_d}}O[[X]]`, which is impossible; `y_{const} = Λ_cd + Λ_cf₀d′` for two down
levels `s₀ < s₁`, with `f₀ ≡ 0` modulo `p_{s₁}^{b₁}`, `f₀ ≡ λ^{k₀}` modulo `p_{s₀}^{b₀}`, `k₀` minimal; and `y_{const} = Λ_cd + α(Λ_c/p_{s₁}^{b₁})d′`,
`d′ ∈ V_{s₁}`, for an up level at `s₁` and a down level at `s₀ < s₁`, where `p_{s₁}^{b₁} = λ^{k₁}α + p_{s₀}^{b₀}β` with `k₁` maximal;
the last two need no size condition. Proof: at thin and down levels saturation forces `p_s^{H_s} | y`, and the `p_s^{H_s}` are
coprime up to powers of `λ` (`ap_s + a′p_{s′} = λ^N`), so `y = (Λ_c/P)x`, `P` the product of the `p_s^{b_s}` over the up levels; at a
down level, after cancelling, `λ^kx − d_s` lies in `V ⊗ O[[X]] + p^bO[[X]]^r` up to the up factors, and `O·1` is a direct summand of the
`O`-free module `O[[X]]/(p^b)`, so the constant is `λ^k` times a constant, the up factors being removed by the first half of
(g); for two down levels a constant in `λ^aO[[X]] + J`, `J := (p_{s₀}^{b₀}, p_{s₁}^{b₁})`, lies in `(λ^a, λ^{k₀})O` (purity), and a
Smith basis of `V_{s₀} + V_{s₁}` splits the difference of the two constants; for the word (up, down) a Smith basis of the image
of `V_{s₁}` in `O^r/V_{s₀}` and the maximality of `k₁` give `d′`.
(g) *Sizes.* (i) If `Σ_{s∈I}b_sp^s < Bp^{s′}`, `a′ ∈ O` and `a′∏_{s∈I}p_s^{b_s} ∈ (λ^{k′}, p_{s′}^B)`, then `λ^{k′} | a′`: modulo `λ`,
`p_s ≡ unit·X^{p^s}`, so the image of `∏_Ip_s^{b_s}` in `k[[X]]/(X^{Bp^{s′}})` is a unit times `X^{Σb_sp^s} ≠ 0` and is part of an
`O`-basis of `O[[X]]/(p_{s′}^B)`. This is sharp: if `Σb_sp^s ≥ Bp^{s′}`, then `∏_Ip_s^{b_s} ∈ (λ, p_{s′}^B)`. The hypothesis `b₀ < pb₁`
of (1) is the adjacent case of `b₀p^{s₀} < b₁p^{s₁}`. (ii) If `s₀ < s₁`, `2(a + 2gℓ_max) < b₁`, `2b₀ ≤ pb₁` and
`p^aΘ_c²p_{s₀}^{b₀} ∈ (λ^k, p_{s₁}^{b₁})`, then `k ≤ 2(a + 2gℓ_max)·v(p)`. The Gauss valuation `v_ϑ(Σa_nX^n) := min_n(v(a_n) + ϑn)`,
`ϑ > 0`, is multiplicative, units have `v_ϑ = 0`, and `v_ϑ(p_s) = min(v(p), ϑp^s)`. Evaluate at `ϑ := u/p^{s₁}` with
`v(p)(a + 2gℓ_max)/(b₁ − b₀/p) < u < v(p)` (a nonempty interval by the two inequalities): `v_ϑ(p_{s₁}) = u` and
`v_ϑ(p_{s₀}) ≤ u/p`, so elements of `(λ^k, p_{s₁}^{b₁})` have `v_ϑ ≥ min(k, b₁u)`, while
`v_ϑ(p^aΘ_c²p_{s₀}^{b₀}) ≤ v(p)(a + 2gℓ_max) + b₀u/p < b₁u`; hence `k ≤ v(p)(a + 2gℓ_max) + b₀u/p`, and letting `u` decrease to the
lower end, `k ≤ b₁v(p)(a + 2gℓ_max)/(b₁ − b₀/p) ≤ 2v(p)(a + 2gℓ_max)`.
(h) *Lifting along an arc.* For `w ∈ W_c(T₂) := {w : (γ − 1)w ∈ XN_c, Λ_cw ∈ O[[X]]φ^{ℓ(c)}(N_{c′})}`, `x′ := P_Ω(γ)w` is at every
level a `γ`-fixed constant plus a model-lattice element ((e)), so its partner satisfies the hypothesis of (f) for `T₂`. The
constants lift from `T₂` to `T₁` after `p^{rr}` (WachLatticesOverTheCyclotomicTower §6.10(3) at the previous cut), and after `p^{2a₀}` in all words; in the word (up
at `s₁`, down at `s₀`) the filtration step must be lifted inside `V_{s₁}`: for `e ∈ V_{s₁}(T₂)` the vector
`y₂ := p_{s₀}^{b₀}(Λ_c/p_{s₁}^{b₁})e` is admissible for `T₂` at every level; through the partners (`p^σ` each way) and WachLatticesOverTheCyclotomicTower §6.10(3) at
the cut (`p^{rr}`) it lifts to `y₁` with `Θ_c²y₁` admissible for `T₁` and `f(y₁) ≡ p^{2σ+rr}y₂` modulo `Λ_c`. Admissibility of
`Θ_c²y₁` at the levels other than `s₁`, with the coprimality of (f), gives `Θ_c²y₁ ∈ (Λ_c/p_{s₁}^{H_{s₁}})O[[X]]^r`; so for a
functional `μ` on `O^r` with `μ(e) = 1` and `μ(f(V_{s₁}(T₁))) = λ^kO`, the common factor `Λ_c/p_{s₁}^{b₁}` cancels and
`p^{2σ+rr}Θ_c²p_{s₀}^{b₀} ∈ (λ^k, p_{s₁}^{b₁})`. The second half of (g) with `a = 2σ + rr` gives `k ≤ 2a₀·v(p)`, and the Smith normal
form of `f(V_{s₁}(T₁)) ⊆ V_{s₁}(T₂)` gives `p^{2a₀}V_{s₁}(T₂) ⊆ f(V_{s₁}(T₁))`: this is where `2b₀ ≤ pb₁`, `2a₀ < b₁` and the
definition of `a₀` enter. Reading (f) backwards for `T₁` and correcting by WachLatticesOverTheCyclotomicTower §6.10(3) at the cut gives `z` with
`f(z) = p^{2σ+2a₀+rr}x′`; a second killing polynomial gives `w′ ∈ W_c(T₁)` with `f(w′) ≡ unit·p^{2σ+2a₀+rr+k″}w` modulo `XN_c(T₂)`,
`k″ ≤ 2κ`.
(i) *Assembly.* Lift each `w_c` by (h), use the linearity and functoriality of `ρ_c`, equalise the exponents; `ρ_c` of an
element of `W_c(T₁)` is a finite class (the clause on poles at several levels of 4.10c(2): a cocycle at one letter whose
`γ`-part lies in `X^{M′}N ⊆ π₀N` and whose first component lies in `Λ_c^{−1}N`, `Λ_c` a product of powers of the `p_s = φ^s(π₀ + p)`;
`Λ_c` contains `p_1 = φ(q)` as soon as an arc has two letters, and `p_1^{−1}` lies in no `q^{−M}O[[X]]`, so the form with `Q^{−M}N`
alone does not suffice). Total `e = (rr + 2σ) + (2σ + 2a₀ + rr + 2κ)`; the bound `800` is the estimate of [FormalProof]
for these quantities under the size hypotheses on the windows. "At most two thick letters per arc" is where the case
analysis of (f) stops (a word with one down level and several up levels goes through by the first half of (g)); it is used
again only to bound the number of windows in `κ`. Every step has its proof here except the bookkeeping of (d3), which is
described and not written out. The argument uses `p ≥ 3` only ((a) needs `p` odd, (b) uses `(p − 1)² ≥ p`); see the Checks.

*Route of (2)* (a derivation from (1)). The cluster condition yields a cut set with at most two thick letters per arc,
`ℓ_max ≤ 3j + 1`, and the size inequalities of (1) (all thick sizes lie in `[b, b + η]`, and `C(j + 1)(w + S + η + 1) ≤ b`); the
non-thick letters are thin with `G = w + S + η`; apply (1), and multiply the exponent by the number of generators of
`H¹_f(K, T₂)`, at most `(n + 1)·rk T₂` (4.10c(1)), and by `length_O(O/p)`. If any `2j + 1` consecutive letters contain at most
two thick ones, the window of `2j + 1` letters ending at a thick letter contains at most one other, which gives the cluster
condition. The same constant `C` stands in the hypothesis and in the conclusion.

*Route of (3)* (a separate development, not a corollary of (1); what is proved and what is a statement of [FormalProof] is
said at each step). Put `Sg := h/p² + (w + S + η)/p + log_p(2h) + 1`. (a) *Big case* (proved): if some letter is thick and
`b` is at most a constant times `Sg`, 4.10c(3) for the intervals `[−η, b_i + S]` or `[−b_i − S, η]` and 4.10c(1) give the
bound. (b) *Arcs* (proved): otherwise take `j = 1` and the cut set `{c : c + 1 is not thick}`, the non-thick letters playing
the role of thin ones with `G = w + S`; every arc is a non-thick letter followed by a run of thick ones, of length at most
`3` in (i) (of one direction in (ii)). The arcs have up to three letters that are not thin, so the splitting of step (f) of
the route of (1) does not apply; and for a non-thick down letter of size `b′` before a thick up letter of size `b₀ ≥ pb′` the
single-constant splitting of (f) fails (its inequality is necessary there). A finite class decomposes over the cuts as in
step (c) of the route of (1), with `σ, rr ≤ 3Sg` (the regularised cocycles and the decomposition in this setting are
statements of [FormalProof], of the same content as steps (b), (c) of the route of (1)). (c) *Exceptional classes* (the
assembly is proved; its two inputs are statements): at each cut there is a basis of the lattice of the previous cut and a
set of at most `m·ro(c)` basis vectors (`ro(c)` the number of thick letters of the arc; this uses that `T₂` has at most `m`
weights in `[−η, η]` at each letter) outside which the constants lie in `Fil^{b_s}` at every up level, and which span
`Fil^{−η}` at every down level (*universal part*, a statement); after a killing polynomial the coordinates outside this set are
lifted by the one-coordinate lifting (d), and the invariants supported on it give at most `m·ro(c)(ℓ(c) + 1)` finite classes,
the *exceptional classes*. So `p^{e₂}·H¹_f(K, T₂) ⊆ f(H¹_f(K, T₁)) + 𝒵` with `e₂` a constant times `Sg` (plus `η[res]` in (i)) and
`𝒵` spanned by at most `4nm` (resp. `(R + 1)nm`) classes, each lifted by 4.10c(3) at the cost `e°` (or `e`); the colength is at
most `((n + 1)·rk T₂·e₂ + #𝒵·e°)·length_O(O/p)`. (d) *One-coordinate lifting* (a statement of [FormalProof]): for a basis vector
outside the exceptional set and a coefficient constant modulo `p_s^{b_s+S}` at the down levels, the invariant of `T₂` it defines
is, after `p^{e₁}` and modulo `XN_c(T₂)`, the image of an invariant of `T₁`, with `e₁ ≤ 40·Sg + η·[res]` in (i) and
`e₁ ≤ 6·Sg + 1` in (ii). Its proof splits into seven cases by the length and the directions of the arc. One is written out
here, the one producing the resonance term: with the letter `c` up of size `b₀` and `c − 1` down of size `b′`, the coefficient
has denominator `q^{b₀}` and is constant modulo `p_1^{b′+S}`, and making it integral there costs `p^d`,
`d ≤ max(0, b₀/p − (b′ + S)) + 2 + log_pb₀`; so `η·[res]` is the cost of a near-coincidence of the degrees `b₀` and `p(b′ + S)`.
A second case is known by its steps (their proofs are statements of [FormalProof]): the arc of length two with `c` up and
thick, of size `b₀`, at level `0` and `c − 1` down and not thick, of size `b′`, at level `1`, when `p(b′ + S + η) + η < b₀`. There
`p_1^{b′+S}/p_0^{b₀}` times the frame vector of the constant in `Fil^{b₀}` at level `0` is an invariant of `T₂`; after `p^{rr}` it lifts
to `T₁`; in a horizontal frame of `T₁`, multiplied by `p_1^ηp_0^{b₀+S}`, its coefficient of `p_0^{S+p(b′+S+η)}` (in the coordinate
in which `p_0` is the variable) is a constant vector of `T₁`; only terms with constant in `Fil^{η+1}` at level `0` contribute, and
`T₁` has no weight in `(η, b₀)` there, so the vector lies in `Fil^{b₀}`, and its image in `T₂` is `p^{2σ+rr}` times a unit times
the frame vector. So the frame direction lifts inside `Fil^{b₀}(T₁)` at the cost `p^{3σ+rr}`, by extracting a Taylor coefficient
instead of using the Gauss valuation of (g) of the route of (1). Not proved here: the regularisation and decomposition in
this setting, the coordinates along an arc, the universal part, and the other five cases of (d). Sources: [FormalProof].

*Route of (4)* (a separate development, not a corollary of (1) or of (3); the assembly, the count and the arithmetic of the
exponent are proved here, the three inputs (a)–(c) are statements of [FormalProof] whose proofs are not given). Notation
of the route of (1): `X = π₀`, `q = X + p`, `N_i`, `Γ_K^{tor}`. Put `δ := 1 + log_p(2H)`, `a := ⌈a(p, H)⌉`,
`M″ := ⌊H₀/(p − 1)⌋ + 1`, `σ₁ := (M″ + η)/(p − 1) + 1`, `σ₂ := 2H/(p − 1)² + 1` and
`𝔠 := rk T₂·S + 2m·((H + 1)/(p − 1) + 1)`. *Steps.* By 4.10c(1) `H¹_f(K, T₂)` is generated by at most `(n + 1)·rk T₂`
classes; let `F⁰` be the free `O`-module on such generators, with its map to finite cocycles of `T₂`. A *step of the first
kind* replaces a submodule of `F⁰` by the kernel of a map to a module generated by at most `m` elements, a *step of the
second kind* by the kernel of a map to a module of length at most `𝔠·length_O(O/p)`.
(a) *Finite classes as sums over the down letters* (statement). There is an integer
`e_a ≤ (2a + 2η + S)/(p − 1) + δ + 2σ₁ + 2` such that, after `n` steps of the first kind (none if `m = 0`), for every remaining
`ξ` there are vectors `w_c ∈ D(T₂)`, one for each down letter `c`, depending linearly on `ξ`, with: `w_c` supported at the
letter `c` and `Γ_K^{tor}`-invariant; `Λw_c ∈ N(T₂)` for a product `Λ` of powers of the `φ^j(q)`; `(γ − 1)w_c ∈ X·N(T₂)`;
`q^η w_c` in the span of `φ(N_{c−1}(T₂))`; and `p^{e_a}ξ = ±Σ_c Ψ(w_c)` modulo coboundaries. Here `Ψ(w)` is the class of a
Herr cocycle whose first component is a truncation of `p^{⌈σ₁⌉}φ(w)` modulo `X^{M″}q^η` and whose second component lies in
`X^{M″}N(T₂)`; it is finite by the clause on poles at several levels of 4.10c(2).
(b) *Lifting the vectors* (statement). There is an integer `e_b ≤ H₀/(p(p − 1)) + 2E_B + 3σ₂ + 3S + 3 + 2δ`,
`E_B := (3a + S + 2η)/(p − 1) + 3δ`, such that for every down letter `c` and every family of vectors as in (a), after `6`
steps of the first kind and `3` of the second, each `p^{e_b}w_c` is, modulo `X·N(T₂)^{Γ_K^{tor}}`, the image of a vector of
`D(T₁)` of the same kind (supported at `c`, invariant, with poles at finitely many levels, `(γ − 1)u ∈ X·N(T₁)`); if `m = 0`
the same holds with `e_b + 3S` and no step. It is obtained from two statements, each for one down letter: after `3` steps
of the first kind and `1` of the second the vector is lifted modulo `N_c(T₂)^{Γ_K^{tor}}`; and vectors of
`N_c(T₂)^{Γ_K^{tor}}` are lifted, after `3` steps of the first kind and `2` of the second, modulo `X·N(T₂)^{Γ_K^{tor}}`. Their
proofs compare the lattices of `T₂` two letters apart through `φ²` and truncate `φ²(w)` modulo `X·q^Y` at the cost
`⌈Y/(p − 1)² + 1⌉`; the expansions are taken at the zeros of `q`, which is where `μ_p ⊂ E` is used; (S2) enters as
`b_c/p ≤ b_{c−1} + S` for consecutive letters, in the bound for the leading coefficient of such an expansion; (S1) keeps the
windows `[−η, η]` and `±[b_i, b_i + S]` apart with room `2a(p, H)`.
(c) *From vectors to classes* (statement). If `p^kw ≡ f(u)` modulo `X·N(T₂)^{Γ_K^{tor}}` with `u` as in (b), then
`p^kΨ(w)` lies in `f(H¹_f(K, T₁))`.
*Assembly* (proved). There are at most `n/2` down letters (`n` is even and the directions alternate), so (a) and (b) give a
chain `F⁰ ⊇ F¹ ⊇ … ⊇ F^k` with at most `n + 6·(n/2) = 4n` steps of the first kind and at most `3·(n/2) = 3n/2` of the
second, and by (c) `p^e` maps the classes of `F^k` into `f(H¹_f(K, T₁))` with `e := e_a + e_b`. The cokernel is killed by
`p^{e′}` (4.10c(3)); it is filtered by the images of the `F^i`; a step of the first kind contributes a module with at most
`m` generators killed by `p^{e′}`, a step of the second kind a module of length at most `𝔠·length_O(O/p)`, and the image of
`F^k` a module with at most `(n + 1)·rk T₂` generators killed by `p^e`. This is the bound. *The exponent* (proved). With
`a < a(p, H) + 1`, `H₀ ≤ H`, `p ≥ 11` and `δ ≥ 1`, in `e_a + e_b` the coefficient of `H` is
`8(2p − 1)/(p − 1)³ + 8/(p − 1)² + 1/(p(p − 1)) ≤ 32/p²`, that of `S` is `3 + 3/(p − 1) ≤ 4`, that of `η/(p − 1)` is `8`, and the
rest is at most `13.4 + 9.8δ ≤ 25δ`. *The last sentence* (proved): if `|b_i − B| ≤ η`, `B ≥ 100`, `2η + S ≤ B/10`, then
`H ≤ (11/10)B`, `max_j b_j + S ≤ 2b_i`, and `2a(p, H) ≤ (42/100)H + 8 + 2log_{11}(2H)` for `p ≥ 11`, which gives (S1).
Sources: [FormalProof]. *Needs:* SelmerIwasawaCohomology §4.9; 4.9a, 4.10c;
PhiGammaModulesAndIwasawaCohomology §3.6; WachLatticesOverTheCyclotomicTower §§6.4–6.5, 6.10.

**Checks.**

- With every letter thin and one cut (`j = ℓ_max = n`): `e ≤ 800(h/(p − 1)^{n+1} + g·n + log_p h)` for weights in `[−g, g]`,
  weaker than 4.10c(3) unless `h ≫ g`: the arc bound pays only for large weights at few letters. No level is down, so (f) is
  trivial and `a₀` does not enter the word condition.
- In step (f) of the route of (1), for two down levels with `(p_{s₁}^{b₁}, p_{s₀}^{b₀}) ∋ 1`, `k₀ = 0` and the statement is the
  Chinese remainder theorem.
- (*one thick letter, rank two*) `p ≥ 5`, `K = ℚ_{p²}` (`n = 2`), `E ⊇ K`, `χ_LT : G_K → O_K^×` the Lubin–Tate character of the uniformizer
  `p`, `LT_i` its composites with the two embeddings (so `χ_cyc = LT₀LT₁`, and `LT_i` has weight `−1` at one letter and `0` at the
  other), `b := 1 + (p² − 1)p^k`, `T₀ := O(LT₀^bLT₁)`, `T₂ := O`, `κ_ur ∈ H¹(K, O)` the unramified class. Then
  `H²(K, T₀) ≅ O/p^{k+1}` (dual to `H⁰(K, (E/O)(LT₀^{1−b}))`, and the `x^{b−1} − 1`, `x ∈ O_K^×`, generate `(p^{k+1})`), and
  `ε ↦ ε ∪ κ_ur` maps `H¹(K, T₀)` onto it (its transpose is an inflation, injective); let `T₁` be the extension of `O` by `T₀` of a
  class `ε` with `ε ∪ κ_ur` a generator. All weights of `T₀` are negative, so `H¹_f = H¹` for `T₀[1/p]` and `T₁` is crystalline,
  with weights `{−b, 0}` at one letter (down of size `b`, `S = η = 0`) and `{−1, 0}` at the other (thin, `G = 1`); take the cut at
  the down letter, `j = 1`, `ℓ_max = 2`. `H¹_f(K, T₂) = O·κ_ur`, and `aκ_ur` lifts to `H¹_f(K, T₁)` exactly when `p^{k+1} | a`: the
  loss is exactly `k + 1 = 1 + v_p(b − 1)`. Here `b − 1 = −(−b) − 1` is where the jump `−b` enters the killing polynomial of
  (e), and `κ ≥ ℓ_max + (ℓ_max + 1 + v_p(b − 1))` (take `Ω ∋ b − 1`): the part `1 + v_p(b − 1)` of that summand is attained.
  Replacing `ε` by `p^Nε` gives the loss `max(k + 1 − N, 0)`.
- (*the prime `3`*) The route of (1) uses `p ≥ 3` only; `p ≥ 5` is the hypothesis under which [FormalProof] states (1), and (1)
  is not asserted here for `p = 3`.
- In (2), if every letter is thick (`n ≥ 3`), the cluster hypothesis fails for every `j ≥ 1` and (2) says nothing: it needs
  letters of small size between the thick ones.
- In (3)(i), the cuts are the letters before a non-thick letter; three consecutive thick letters would give an arc whose
  words the case analysis does not cover. With `m = 0` there is no exceptional class and no term `e°`.
- (*ramified coefficients*) The factor `length_O(O/p) = e(O/ℤ_p)` in (2) and (3) is needed. In (2), take `p ≥ 11`, `n ≥ 2`, `j = 1`,
  `ψ := χ_cyc^{−(p−1)}·μ` with `μ` unramified and `ψ(Fr₀) = 1` for one Frobenius lift `Fr₀`, `T₁ = U ⊗ ψ` with `U = O²` the
  unramified unipotent lattice, and `T₂ = O(ψ)` its quotient: every letter is up of size `p − 1 ≤ w`, none thick,
  `H¹_f(K, T_i) = H⁰(K, V_i/T_i)`, `H⁰(K, V₂/T₂) = (E/O)[p]`, and a fixed vector `(x, y)` of `V₁/T₁` has `y = 0` (apply `Fr₀`), so the
  cokernel is `O/p`, of length `e(O/ℤ_p)`, while the other factors of the bound do not depend on `O`.
- (*the two-letter word*) In (4) with `n = 2` and both letters thick for `b ≥ 100`, `2η + S ≤ b/10`: the bound is
  `3·rk T₂·e + 8m·e′ + 3(rk T₂·S + 2m((H + 1)/(p − 1) + 1))`, with `e` of the order `H/p²` while `e′` is of the order `H/p`: the
  gain over 4.10c(3) is the factor `p` on the part of the cokernel that is not carried by the at most `8m` exceptional
  classes.
- (*all letters thick*) (3)(i) asks for a letter that is not thick and (2) says nothing when every letter is thick; (4) is
  the clause for such words when the directions alternate. With all letters thick and one direction no clause applies.
- (*the size conditions*) `p = 11`, `B = 100`, `η = 5`, `S = 0`: `H ≤ 110`, `a(11, 110) = 23.1 + 4 + log_{11}220 < 29.4`, and
  `2a + η + 1 < 65 ≤ 95 ≤ b_i`.

### 4.10e Lifting finite classes with loss over ramified cyclotomic, abelian and tamely ramified bases

Let `K/ℚ_p` be finite with maximal unramified subfield `K₀` and residue field `k`, `n = [K₀ : ℚ_p]`, `E` containing the images of
the embeddings of `K₀(μ_{p^s})` (for (0)–(2)), resp. of `K` (for (3)), and `f : T₁ ↠ T₂` a surjection of `G_K`-stable `O`-lattices
in crystalline `E`-representations whose Hodge–Tate weights at every embedding lie in `[−M, h]` with `M, h ≥ 0`; put
`H := M + h` (standing convention: `ℚ_p(1)` has weight `−1`). Give `W(k)[[π]]` the `δ`-structure whose Frobenius `φ` is the Witt
vector Frobenius on `W(k)` and `φ(π) = (1 + π)^p − 1`; put `A := O ⊗ W(k)[[π]]`, `q := φ(π)/π`, and for `s ≥ 1` `X := φ^{s−1}(π)`,
`Q := φ^{s−1}(q)` (so `φ(X) = XQ`). Fix a compatible system `ε = (1, ζ_p, ζ_{p²}, …) ∈ O_{C^♭}` of `p`-power roots of unity; let
`A_inf := W(O_{C^♭})`, `θ̃ := θ∘φ^{−1}` and `ξ̃ := ([ε]^p − 1)/([ε] − 1)`, a generator of `ker θ̃`, so that `(A_inf, ker θ̃)` is the
prism of PrismaticCohomologyPartIII §7.12(2); let `B_dR^+` be the completion of `A_inf[1/p]` at `ker θ̃`, `B_dR` its fraction
field, and `t := p^{−1}log([ε]^p) ∈ B_dR^+` (the series `log[ε]` does not converge there: `θ̃([ε]) = ζ_p ≠ 1`; `[ε]^p − 1 ∈ ker θ̃`).
Prove:

0. (*lattices at level `s`*) Let `K₀ ⊆ K ⊆ K₀(μ_{p^s})` with `s ≥ 1` (`s ≥ 2` if `p = 2`), `Γ_K := Gal(K₀(μ_{p^∞})/K)`, and
   `γ ∈ Γ_K` with `v_p(χ(γ) − 1) = s`. The objects:
   - (*the cyclotomic prism of level `s`*) `𝔖_s := (W(k)[[π]], (Q))`: the `q`-de Rham prism `(ℤ_p[[q − 1]], ([p]_q))` of
     PrismaticCohomology §0.77 (`q − 1 ↦ π`), base-changed to `W(k)` and pulled back by `φ^{s−1}`. It is not a Breuil–Kisin prism
     (there `φ(u) = u^p`).
   - (*the map to `A_inf`*) `ι_s : W(k)[[π]] → A_inf`, `π ↦ π_{s−1} := [ε^{1/p^{s−1}}] − 1`, and on `W(k)` the `W(k)`-algebra structure
     of `A_inf` compatible with `θ̃` (the Witt-functorial inclusion followed by the Frobenius of `A_inf`, as in
     PrismaticCohomologyPartIII §7.12(4)). For `s = 1`, `π_0 = [ε] − 1` is Fontaine's variable. Let `D_s(T) := φ^{−(s−1)}(D(T))`
     inside `W(C^♭) ⊗_{ℤ_p} T`, where `D(T)` is the étale `(φ, Γ_K)`-module of PhiGammaModulesAndIwasawaCohomology §6.0, formed with
     `π_0`: an étale `(φ, Γ_K)`-module over `O ⊗ W(k)((π))^∧_p` acting through `ι_s`; `D_1(T) = D(T)`.
   - (*the lattice*) For a `G_K`-stable `O`-lattice `T` in a crystalline `V` let `𝔐(T)` be the prismatic `F`-crystal of the
     underlying `ℤ_p`-lattice (PrismaticCohomologyPartIII §7.22), on which `O` acts through its action on `T`, by functoriality.
     `N_s(T) ⊆ D_s(T)` is the image of `𝔐(T)(𝔖_s)` under base change along `ι_s` followed by the comparison
     `𝔐(T)(A_inf)[1/μ] ≅ T ⊗_{ℤ_p} A_inf[1/μ]`, `μ := [ε] − 1` (PrismaticCohomologyPartIII §7.13(2)); it is an `A`-module with `φ` and
     with the action of `Γ_K` coming from its action on `𝔖_s`.
   - (*expansions*) `Â_s`, the completion of `A[1/p]` at the ideal `(Q)`, is the product, over the zeros `(i, ζ)` of `Q` (`i` an
     embedding of `K₀` into `E`, naming the factor `e_iA`, and `ζ` a primitive `p^s`-th root of unity in `E`, the point `π = ζ − 1`), of
     rings `E[[t]]`, with `t := p^{−1}log((1 + π)^{p^s})`, so that `1 + π = ζ·exp(t/p^{s−1})` at `(i, ζ)`; equivalently
     `Â_s = (E ⊗_{ℚ_p} K₀(μ_{p^s}))[[t]]`, the zero `(i, ζ)` corresponding to the embedding of `K₀(μ_{p^s})` that is `i` on `K₀` and sends
     `ζ_{p^s}` to `ζ`, whose restriction to `K` is an embedding `τ(i, ζ)`. `g ∈ Γ_K` acts by `t ↦ χ(g)t` and through its action on
     `K₀(μ_{p^s})`; `ι_s` extends to `Â_s → E ⊗_{ℚ_p} B_dR^+`, `t ↦ t`. For crystalline `V`, `D_dR(V)` is a module over `K ⊗_{ℚ_p} E`, and
     `Fil⁰_s(V) := Σ_jt^{−j}Â_s ⊗_{K⊗_{ℚ_p}E} Fil^jD_dR(V)` inside `Â_s[1/t] ⊗_{K⊗E} D_dR(V)`; its factor at `(i, ζ)`, over
     `τ = τ(i, ζ)`, is the lattice `Fil⁰_τ := Σ_jt^{−j}E[[t]] ⊗_E Fil^j_τ = {Σ_kt^kd_k : d_k ∈ Fil^{−k}_τ}` of `E((t)) ⊗_E D_{dR,τ}(V)`,
     `D_{dR,τ}(V) := E ⊗_{K⊗E, τ⊗1} D_dR(V)` with its filtration `Fil^•_τ`. The *expansion* at the zeros of `Q` of `x ∈ N_s(T)[1/Q]` is its
     image in `N_s(T) ⊗_A Â_s[1/t]`, and its expansion at `(i, ζ)` the component there.

   Prove: (*the prism*) `Q` is distinguished, `W(k)[[π]]/(Q) ≅ O_{K₀(μ_{p^s})}` by `π ↦ ζ_{p^s} − 1`, so `𝔖_s` is a bounded prism over
   `O_K`, and `Γ_K` acts on it by the `W(k)`-linear automorphisms `π ↦ (1 + π)^{χ(g)} − 1`, which are maps of prisms over `O_K`;
   (*the map*) `ι_s` is a map of prisms `𝔖_s → (A_inf, ker θ̃)` over `O_K`, with `ι_s(Q) = ξ̃`, and `ι_s∘g = g∘ι_s` for `g ∈ G_K`
   acting on `𝔖_s` through `Γ_K`; and, for every such `T`:
   - (a) (*what the prismatic construction supplies*) `N_s(T)` is free of finite rank over `A` and spans `D_s(T)` over
     `O ⊗ W(k)((π))^∧_p`; `Q^kφ(N_s(T)) ⊆ N_s(T)` and `Q^kN_s(T) ⊆ A·φ(N_s(T))` for some `k ≥ 0`; `(g − 1)N_s(T) ⊆ πN_s(T)` for every
     `g ∈ Γ_K`, and `(γ − 1)N_s(T) ⊆ XN_s(T)`; `T ↦ N_s(T)` is an `O`-linear functor; and `N_s(O) = A·e` with `e` fixed by `φ` and `Γ_K`;
   - (U)_s (*uniqueness*) a free `A`-submodule `N′ ⊆ D_s(T)` that spans `D_s(T)`, with `γ(N′) ⊆ N′`, `(γ − 1)N′ ⊆ πN′`, and
     `Q^kφ(N′) ⊆ N′`, `Q^kN′ ⊆ A·φ(N′)` for some `k ≥ 0`, equals `N_s(T)`;
   - (H)_s (*heights and the comparison at the zeros of `Q`*) if the weights of `T` at every embedding lie in `[−M, h]`, then
     `Q^Mφ(N_s(T)) ⊆ N_s(T)` and `Q^hN_s(T) ⊆ A·φ(N_s(T))`; and `ι_s` with the comparison of PrismaticCohomologyPartIII §7.13(2)
     identifies `N_s(T) ⊗_A Â_s` with `Fil⁰_s(V)`, compatibly with `Γ_K` (trivial on `D_dR(V)`). Point by point: at each zero `(i, ζ)`
     of `Q`, over `τ = τ(i, ζ)`, the expansion of an element of `N_s(T)` is a Laurent series `Σ_kt^kd_k` (bounded below) with
     `d_k ∈ Fil_τ^{−k}`, and these expansions span `Fil⁰_τ` over `E[[t]]`. Consequently an element of `N_s(T)[1/Q]` whose expansion at
     every zero of `Q` lies in `Fil⁰_s(V)` lies in `N_s(T)`;
   - (S)_s `N_s(T)` is `p`-saturated in `D_s(T)`; for an exact sequence `0 → T₀ → T₁ → T₂ → 0`, `N_s(T₀) = N_s(T₁) ∩ D_s(T₀)` and the
     cokernel of `N_s(T₁) → N_s(T₂)` has finite length;
   - (Sen)_s for `y ≥ 1`, `Q^{−y}N_s(T)/N_s(T)` is `O`-free, and `γ` acts on `(Q^{−y}N_s(T)/N_s(T))[1/p]` semisimply, with eigenvalues the
     `χ(γ)^{−(w+l)}`, `w` a weight of `T`, `1 ≤ l ≤ y`, each of which occurs;
   - (Herr)_s for `K = K₀(μ_{p^s})`: the two halves of 4.10c(2), with `X`, `Q` in place of `π₀`, `π₀ + p` and the Herr complex of
     the procyclic group generated by `γ`; and the clause on poles at several levels: a Herr cocycle `(y, z)` of `D_s(T)` with
     `(∏_νφ^{j_ν}(Q))·y ∈ N_s(T)` for finitely many exponents `j_ν ≥ 0` and `z ∈ πN_s(T)` has a finite class;
   - (R) for `s = 1`, `p` odd and `e_K := [K : K₀]`: the `Γ_K^{tor}`-invariants of `O[[π]]` are `O[[π′]]` with
     `π′ = unit·π^{(p−1)/e_K}`, `q = unit·E_K(π′)`, `φ(π′) = unit·π′E_K(π′)^{(p−1)/e_K}`, `(γ − 1)π′ = unit·π′E_K(π′)`, `E_K` of degree
     `e_K` with roots of valuation `1/e_K`; and `N_1(T)` has a basis of `Γ_K^{tor}`-invariant vectors, with
     `(γ − 1)N_1(T)^{Γ_K^{tor}} ⊆ π′N_1(T)^{Γ_K^{tor}}`;
   - for `s = 1`, `K = K₀` and `p` odd, `N_1(T)` is the Wach lattice `N(T)` of PhiGammaModulesAndIwasawaCohomology §6.0, inside
     `D_1(T) = D(T)`.

   The prism, the map, (a), `p`-saturation in (S)_s, (Sen)_s given (H)_s, the first half of (Herr)_s, (R) and the identification
   at `s = 1` have their proofs in the route; the clause on poles of (Herr)_s has the route of 4.10c(2), with the same two
   steps not given. (U)_s, (H)_s, the exactness clauses of (S)_s and the converse half of (Herr)_s are statements of
   [FormalProof], with proofs not given here; [FormalProof] states and proves them for every prime and every
   `(K, s)`, for every assignment `T ↦ N′(T)` with the properties (a) and the comparison of (H)_s;
1. (*cyclotomic bases*) if `K = K₀(μ_{p^s})` (`s ≥ 1`, and `s ≥ 2` if `p = 2`), then `p^{e_s}·H¹_f(K, T₂) ⊆ f(H¹_f(K, T₁))` with
   `e_s := 2(2Hs + v_p((2H)!)) + Σ_{j∈J}(s + v_p(j)) + Ms + v_p(M!)`, `J` the set of WachLatticesOverTheCyclotomicTower §6.10(4) for
   the weights of `T₁` (`J := ({w + k : w a weight of T₁ at some embedding, 1 ≤ k ≤ M} ∖ {0}) ∪ {1, …, M}`); as round bounds,
   `e_s ≤ 14Hs ≤ 32(Hs + 1)` (the route is the chain of 4.10c(3) with the lattices of (0); it rests on clauses of (0) whose
   proofs are not given here);
   (1′) (*abelian bases*) let `N ≥ 1` (`4 | N` if `p = 2`), `K_N := ℚ_p(μ_{lcm(p,N)})` (the field `K′` of 4.9c(2)),
   `s_N := max(1, v_p(N))`, `K ⊆ K_N`, `E ⊇ μ_{lcm(p,N)}`, and `T₁`, `T₂` lattices in representations crystalline over `K`, the weights of `T₁` at every embedding in
   `[−h, h]`. Then `p^e·H¹_f(K, T₂) ⊆ f(H¹_f(K, T₁))` with `e = 32(2h·s_N + 1) + s_N + ⌊log_p 2h⌋ + ⌊log_p N⌋ + 1`;
2. (*descent*) if `K/K′` is finite, `T₁`, `T₂` are `G_{K′}`-stable and `p^e·H¹_f(K, T₂) ⊆ f(H¹_f(K, T₁))` for the restrictions to
   `G_K`, then `p^{e + v_p([K:K′])}·H¹_f(K′, T₂) ⊆ f(H¹_f(K′, T₁))`;
3. (*tamely ramified bases*; the statement of [FormalProof], whose proof is given here only as its assembly) let `p` be odd,
   `K ⊆ K₀(μ_p)`, `e_K := [K : K₀]`; for every embedding `τ` of `K` let a direction and a size `b_τ > η` be given, the weights of
   `T₁` at `τ` lying in `[b_τ, b_τ + S] ∪ [−η, η]` (up) or in `[−b_τ − S, −b_τ] ∪ [−η, η]` (down) and in `[−h, h]`; let `T₂` have at
   most `m` weights in `[−η, η]` at each `τ`, and suppose `e_K = 2` or the direction depends only on `τ|_{K₀}`. Then there are at
   most `n·e_K(e_K + 1)·m` finite classes of `T₂` modulo which `p^Y·H¹_f(K, T₂) ⊆ f(H¹_f(K, T₁))`,
   `Y ≤ 80(e_Kh/p + e_KS + e_K·log_p h + 1 + η)`; and `p^{E′}·H¹_f(K, T₂) ⊆ f(H¹_f(K, T₁))` with `E′ := e_1` of (1) for `H = 2h`,
   `M = h` (so `E′ ≤ 18h` for `p ≥ 3`); hence, for an absolute constant `C`,
   `length_O coker(H¹_f(K, T₁) → H¹_f(K, T₂)) ≤ (C(ne_K + 1)·rk T₂·(e_Kh/p + e_KS + e_Klog_p h + 1 + η) + ne_K(e_K + 1)m·C(h + 1))·length_O(O/p)`.

The weight interval in (1) contains `0`; the statement is not invariant under twist.

*Route.* (0) *The prism.* `δ(Q) = φ^{s−1}(δ(q))` is a unit, `φ^{s−1}` being a `δ`-map (PrismaticCohomology §§0.61, 0.77);
`Q = Φ_{p^s}(1 + π)`, the `p^s`-th cyclotomic polynomial in `1 + π`, is a unit times a distinguished polynomial with constant term
`p`, so `W(k)[[π]]/(Q) = W(k)[ζ_{p^s}] = O_{K₀(μ_{p^s})}`, and `W(k)[[π]]` is `(p, Q)`-adically complete (`Q ≡ X^{p−1}` modulo `p`); `g ∈ Γ_K`
fixes the image of `O_K` because `K ⊆ K₀(μ_{p^s})`. *The map.* `φ(π_{s−1}) = (1 + π_{s−1})^p − 1`; `ι_s(Q) = Φ_{p^s}([ε^{1/p^{s−1}}]) = ([ε]^p − 1)/([ε] − 1) = ξ̃`; `θ̃([ε^{1/p^{s−1}}]) = θ([ε^{1/p^s}]) = ζ_{p^s}`, and the `θ̃`-compatible structure on `W(k)` makes the
composite with `θ̃` the inclusion `W(k) ⊂ O_C`; `g([ε^{a}]) = [ε^{χ(g)a}]`. *(a).* `𝔐(T)(𝔖_s)` is finite projective over the local
ring `W(k)[[π]]`, hence free, and it injects into `T ⊗ A_inf[1/μ]`; over `A = ∏_iO[[π]]` (`E` contains the images of `K₀`) each
factor of `N_s(T)` has depth two over the regular local ring `O[[π]]`, hence is free. After inverting `Q` and completing `p`-adically
the value becomes an étale `φ`-module over `O ⊗ W(k)((π))^∧_p` with the same base change to `W(C^♭)`, hence `D_s(T)` (Fontaine's
equivalence for `G_{K₀(μ_{p^∞})}`): `N_s(T)` spans. The Frobenius of the crystal, an isomorphism after inverting `Q` between
finite free modules, gives the powers `Q^k`. Evaluation at `π = 0` is a map of prisms `𝔖_s → (W(k), (p))` over `O_K` that is
invariant under `Γ_K`, so `Γ_K` acts trivially on `𝔐(T)(W(k), (p)) = N_s(T)/πN_s(T)`; `(X)` is a `δ`-ideal with `Q ≡ X^{p−1}` modulo
`p`, so `𝔖_s → (W(k)[[π]]/(X), (p))` is a map of prisms over `O_K`, and `γ` acts trivially on its target because
`(1 + π)^{χ(γ)−1} ≡ 1` modulo `X` when `p^{s−1} | χ(γ) − 1`: so `(γ − 1)N_s(T) ⊆ XN_s(T)`. Functoriality and `O`-linearity come from
the equivalence of PrismaticCohomologyPartIII §7.22; `𝔐(ℤ_p)` is the structure sheaf, with value `W(k)[[π]]` and `e = 1`. *(S)_s, saturation.* `N_s(T)/p` is
free over `(O/p ⊗ k)[[π]]` and `D_s(T)/p = (N_s(T)/p)[1/π]`, so `N_s(T)/p → D_s(T)/p` is injective. *(Sen)_s.* `Q^{−y}N_s(T)/N_s(T) ≅ N_s(T)/Q^yN_s(T)` is free over `A/Q^yA`, which is `O`-free (Weierstrass division); it is supported at the zeros of `Q`, so after
inverting `p` it is, by the comparison of (H)_s, `t^{−y}Fil⁰_s(V)/Fil⁰_s(V)`, spanned by the `t^{−(a+l)} ⊗ gr^aD_dR(V)` (`a` a weight,
`1 ≤ l ≤ y`, after splitting the filtration), on which `γ`, which fixes `μ_{p^s}`, acts by `χ(γ)^{−(a+l)}`; nothing here depends on
`p`. *(Herr)_s, first half.* The connecting map of Herr complexes (Herr's complex needs only that the group generated by `γ`,
`Gal(K₀(μ_{p^∞})/K₀(μ_{p^s}))`, is procyclic, which is `s ≥ 2` at `p = 2`) for `0 → D_s(T) → D_s(T_ξ) → D_s(O) → 0`, applied to a lift in
`N_s(T_ξ)` of `p^ke`, with the components placed by (H)_s, (a) and (S)_s as in 4.10c(2). The converse half needs a
crystallinity criterion at level `s` (the analogue of WachLatticesOverTheCyclotomicTower §6.4(8)) and (U)_s; neither is given
here. *(Herr)_s, poles.* As in 4.10c(2): `b ∈ W(C^♭) ⊗ T` with `(φ − 1)b = y` has denominators against `T ⊗ A_inf` that are products
of the images of the `φ^{j_ν}(Q)`, units in `B_cris`; a solution `w` of `(γ − 1)w = z` convergent on the open disc with `t` inverted
gives the class as the coboundary `g ↦ (g − 1)(w − b)` in `V ⊗ B_cris`. *(R).* `Γ_K^{tor}`, cyclic of order `(p − 1)/e_K`, prime to `p`, acts by `π ↦ (1 + π)^ω − 1`, `ω` a root of unity; its invariants
are `O[[π′]]`, `π′ := Σ_{δ∈Γ_K^{tor}}δ(π)`, since an invariant series vanishing at `0` starts in a degree divisible by `(p − 1)/e_K`;
`E_K` is the minimal polynomial over `K₀` of the value of `π′` at `π = ζ_p − 1`, a uniformizer of `K`, and `q`, `E_K(π′)` have the same
zeros; `γ(π′) − π′` vanishes at `0` and at the zeros of `q`, and its quotient by `π′E_K(π′)` has the unit value
`(χ(γ)^{(p−1)/e_K} − 1)/E_K(0)` at `0`; by (a), `Γ_K` acts trivially on `N_1(T)/πN_1(T)`, so averaging over `Γ_K^{tor}` lifts a basis to
invariant vectors (Nakayama), and `πO[[π]] ∩ O[[π′]] = π′O[[π′]]`. *The case `s = 1`, `K = K₀`.* `N_1(T) ⊆ D(T)` satisfies the
hypotheses of WachLatticesOverTheCyclotomicTower §6.4(8) by (a) (with `a_i = b_i = k`; as a subset of `D(T)` it is a module over
Fontaine's ring `W(k)[[π_0]]`), so it is `N(T)`; alternatively (U)_1 and the properties of Wach lattices. (1) The chain of
4.10c(3) with the lattices of (0). The general form of WachLatticesOverTheCyclotomicTower §6.10(1) holds with `X`, `Q` (its
proof uses only `φ(X) = XQ`, the decomposition of `O[[π]]` over `φ(O[[π]])` and `X ≡ π^{p^{s−1}}` modulo `λ`), so `X^H` kills the
cokernels of `N_s(T₁) → N_s(T₂)` and of `N_s(T_ξ) → N_s(O)`. The descent of WachLatticesOverTheCyclotomicTower §6.10(2) runs with `γ′ = γ`, `X`, `u = χ(γ)`
(`γ(X) = (1 + X)^{χ(γ)} − 1`), and every factor `χ(γ)^k − 1`, `1 ≤ k ≤ H`, has valuation `s + v_p(k)` (`p` odd, or `p = 2` and
`s ≥ 2`): each of the two cokernels the chase uses is killed by `p^{Hs+v_p(H!)}`, within the term `2Hs + v_p((2H)!)` of `e_s` charged
for it (linear in `H`: no factor is a unit, unlike over `K₀`). The obstruction `ω ∈ XQ^{−M}N_s` of the kernel is treated with the
polynomial `P(γ) := ∏_{j∈J}(γ − χ(γ)^{−j})` in `γ`: (Sen)_s gives `(γ − 1)P(γ)·Q^{−M}N_s ⊆ N_s` (the product over the distinct values
`χ(γ)^{−(w+l)}`, `w` a weight, `1 ≤ l ≤ M`, divides `(γ − 1)P(γ)`, and `γ` preserves `N_s`); `1 − φ` is bijective on `X^{M+1}N_s`
(`φ(X^{M+1}) = X^{M+1}Q^{M+1}` and `M + 1 > M`); `c_Γ := ∏_{1≤i≤M}(χ(γ)^i − 1)` carries `XN_s` into `(γ − 1)(XN_s) + X^{M+1}N_s` (`γ` acts
on `X^iN_s/X^{i+1}N_s` by `χ(γ)^i`); and with the `X`- and `p`-saturation of `N_s` in `Q^{−M}N_s` one gets `P(1)c_Γ·ω ∈ im d¹`, at the
cost `v_p(P(1)c_Γ) = Σ_{j∈J}(s + v_p(j)) + Ms + v_p(M!)`. The chase of 4.10c(3) then runs with (Sen)_s, (Herr)_s and (S)_s, and the
exponents add up to at most `e_s`. Round bounds: `#J ≤ 2H`, `Σ_{j∈J}v_p(j) ≤ v_p((M − 1)!) + v_p((M + h)!) ≤ 2H/(p − 1)`,
`v_p((2H)!) ≤ 2H/(p − 1)`, `v_p(M!) ≤ H/(p − 1)`, so `e_s ≤ 7Hs + 7H/(p − 1) ≤ 14Hs`. Nothing in the chain distinguishes `p = 2`; it
rests on the clauses of (0) whose proofs are not given here. (1′) Restrict to `K_N = K_{N,0}(μ_{p^{s_N}})`, `K_{N,0} = ℚ_p(μ_{N′})`
(4.9c(2)): the lattices are crystalline over `K_N` with weights in `[−h, h]`, so (1) with `H = 2h`, `M = h`, `s = s_N` gives an
exponent `e_{s_N} ≤ 32(2h·s_N + 1)`; (2) from `K_N` to `K` adds `v_p([K_N : K]) ≤ ⌊log_p N⌋` (4.9c(2)), which is at most
`s_N + ⌊log_p 2h⌋ + ⌊log_p N⌋ + 1`. (2) Restriction preserves finite classes and commutes with `f`; so does corestriction, which by the projection
formula and the compatibility of the local invariants with corestriction (ClassFieldTheory Layer 5) is adjoint to restriction
under local Tate duality, the finite parts being exact annihilators (SelmerIwasawaCohomology §§2.17, 4.9). For `ξ ∈ H¹_f(K′, T₂)`, `p^e·res ξ = f(ξ₁)` with
`ξ₁ ∈ H¹_f(K, T₁)`, and `f(cor ξ₁) = p^e·[K:K′]·ξ` (`cor∘res = [K:K′]`, ArithmeticGaloisDuality §R02.2.3). (3) (the assembly,
proved; its third input is a statement of [FormalProof]) Over `O[[π′]]` (clause (R)) every embedding of `K₀` is a cut, and the
`e_K` zeros of `E_K(π′)`, the `e_K` embeddings of `K` above it, play the role of the levels of an arc; the hypothesis "`e_K = 2` or
one direction above each embedding of `K₀`" is the set of words covered. Three inputs: `H¹_f(K, T₂)` has at most
`(ne_K + 1)·rk T₂` generators (4.10c(1), which holds for every finite `K/ℚ_p`); the basic theorem over `K`: (1) for `K₀(μ_p)` with
`H = 2h`, `M = h`, descended to `K` by (2) at no cost (`v_p([K₀(μ_p):K]) = 0`), with exponent `E′ = e_1 ≤ 18h` for `p ≥ 3`
(`2(4h + v_p((4h)!)) ≤ 8h + 8h/(p − 1)`, `#J ≤ 3h − 1`, `Σ_{j∈J}v_p(j) ≤ 3h/(p − 1)`, `v_p(h!) ≤ h/(p − 1)`, so
`e_1 ≤ 12h − 1 + 12h/(p − 1)`), linear in `h`
because every factor costs at least `1` (enlarging `E` to contain the images of `K₀(μ_p)` changes neither side: `H¹_f` commutes
with the flat base change `O → O′`); and a statement of [FormalProof]: a finite class decomposes over the embeddings of `K₀` as in
steps (a)–(c) of the route of 4.10d(1), over `O[[π′]]` (with WachLatticesOverTheCyclotomicTower §6.10(1) for `π′` at the cuts), and each piece lifts modulo at most
`e_K(e_K + 1)m` exceptional classes per embedding of `K₀` (a universal part as in 4.10d(3)), which gives `Y`. Then the length of
the cokernel is at most ((generators)`·Y + n·e_K(e_K + 1)m·E′`)`·length_O(O/p)` (each generator of the quotient by the span of the
exceptional classes is killed by `p^Y`, and each exceptional class by `p^{E′}`); the term `ne_K(e_K + 1)m·C(h + 1)` is the number
of exceptional classes times the exponent, linear in `h`, of the basic theorem over the tame base. *Needs:* SelmerIwasawaCohomology §§2.17, 4.9; 4.9a,
4.10c, 4.10d; PhiGammaModulesAndIwasawaCohomology §§1.0, 6.0 and WachLatticesOverTheCyclotomicTower §§6.4(8), 6.10; PrismaticCohomology §§0.61, 0.77;
PrismaticCohomologyPartIII §§7.12, 7.13, 7.22; ArithmeticGaloisDuality §R02.2.3; ClassFieldTheory Layer 5.

**Checks.**

- (*the normalisation*) At `s = 1`, `ι_1(π) = [ε] − 1`, and the kernel of `ι_1` followed by `θ̃` is generated by `q` (it sends `π` to
  `ζ_p − 1`): this is the variable of PhiGammaModulesAndIwasawaCohomology §6.0, whose Wach lattices have their heights against
  `q`. With `π ↦ [ε] − 1` into `(A_inf, ker θ)` one would not have a map of prisms: `θ([ε] − 1) = 0`, and `θ` sends the image of `q`
  to `p ≠ 0`. The isomorphism of prisms `φ : (A_inf, ker θ) → (A_inf, ker θ̃)` over `O_C` turns `ι_s` into the equivalent map
  `π ↦ [ε^{1/p^s}] − 1` into `(A_inf, ker θ)`; with it the image of `𝔐(T)(𝔖_s)` is `φ^{−1}(N_s(T))`, and `φ^s` of it lies in `D(T)`.
- (*the tensor product in `Fil⁰_s(V)`*) `K = ℚ_3`, `s = 1`, `E = ℚ_3(μ_3)`, `T = O`: `Q = q` has the two zeros `ζ − 1`, `ζ` a primitive cube root
  of unity, so `Â_1 = E[[t]] × E[[t]]`, and `N_1(O) ⊗_A Â_1 = Â_1` has rank one; `D_dR(V) = K ⊗_{ℚ_3} E = E` is free of rank one over
  `K ⊗ E`, and `Â_1 ⊗_{K⊗E} D_dR(V) = Â_1`. The tensor product over `K` alone, `Â_1 ⊗_K D_dR(V)`, would have rank `[E:ℚ_3] = 2`: the
  coefficient field would be counted twice.
- (*level `s` from level `1`*) For `K ⊆ K₀(μ_p)`, `p` odd and `s ≥ 1`, the `W(k)`-linear map `π ↦ (1 + π)^{p^{s−1}} − 1` is a map of
  prisms `𝔖_1 → 𝔖_s` over `O_K` (it carries `q` to `Q`), compatible with `Γ_K`, and `ι_s` composed with it is `ι_1`; so
  `N_s(T) = (O ⊗ W(k)[[π_{s−1}]])·N_1(T)`. For `T = ℤ_p(1)` (`K = ℚ_p`, `e₁` a basis): `N_s(ℤ_p(1)) = X^{−1}A·e₁`, with
  `φ(X^{−1}e₁) = Q^{−1}·X^{−1}e₁` (pole `Q`) and `γ ≡ 1` modulo `X`; the plausible wrong object `π^{−1}A·e₁`, the Wach lattice's
  formula in the variable of `A`, has `φ(π^{−1}e₁) = q^{−1}·π^{−1}e₁`, a pole along `q`, which is prime to `Q` for `s ≥ 2`.
- For `K = K₀` and `p` odd the unramified statement 4.10c(3) gives an exponent `≤ C(2 + H/p + log_p(H + 1))`; over
  `K₀(μ_{p^s})` the exponent grows linearly in `H`: the factors `χ(γ)^k − 1` all have valuation at least `s`, while over `K₀`
  only one in `p − 1` is a non-unit.
- (2) with `K = K₀(μ_p)`, `K′ = K₀`, `p` odd: `v_p([K:K′]) = 0`, so descent costs nothing at tame level.
- In (0) and (1) for `p = 2` the cyclotomic `ℤ_2`-extension starts at `K₀(μ_4)`: `Gal(K₀(μ_{2^∞})/K₀) ≅ ℤ_2^×` is not procyclic,
  hence `s ≥ 2`; descent (2) from `K₀(μ_4)` to `K₀` costs `v_2(2) = 1`.
- (1) at `s = 1`, `H = 2h`, `M = h`, `p = 3`, `h = 1`: weights in `[−1, 1]`, `J ⊆ {1, 2}`, `e_1 ≤ 2(4 + v_3(4!)) + (1 + 1) + 1 = 13 ≤ 18h`.
- (*the killing polynomial is in `γ`*) `p = 5`, `s = 1`, `K = ℚ_5(μ_5)`, `T = O`, the interval `[−1, 0]` (`X = π`, `M = 1`, `J = {1}`): `γ`
  acts on `Q^{−1}A/A ⊗ E` by the single eigenvalue `χ(γ)^{−1}` (it fixes the four zeros of `Q` and `γ(Q)/Q ≡ χ(γ)` modulo `Q`), so
  `P(γ) = γ − χ(γ)^{−1}` costs `v_5(1 − χ(γ)^{−1}) = 1 = s + v_5(1)`; the operator `X^{−1}(γ − 1)` has there the four eigenvalues
  `(χ(γ)^{−1} − 1)/(ζ − 1)`, `ζ` a primitive fifth root of unity, of total valuation `3`. The constant charged in (1) is
  `P(1)c_Γ = (1 − χ(γ)^{−1})(χ(γ) − 1)`, of valuation `2 = Σ_{j∈J}(s + v_5(j)) + Ms + v_5(M!)`.
- (*abelian bases*) In (1′), `v_p([K_N : K]) ≤ ⌊log_p N⌋` (4.9c(2)); for `N` prime to `p` the field `K_N = ℚ_p(μ_{pN})` has level `s_N = 1`,
  and it contains the completion at a place above `p` of every abelian number field of conductor dividing `pN`.

### 4.10f Lifting finite classes with loss for potentially crystalline lattices of tame type over `ℚ_p`

Let `f : T₁ ↠ T₂` be a surjection of `G_{ℚ_p}`-stable `O`-lattices in potentially crystalline `E`-representations whose
inertial types (the actions of `I_{ℚ_p}` on `D_pst`) are sums of characters of `I_{ℚ_p}` of order prime to `p` taken from a set
`Σ ∋ 1` of at most `N ≥ 2` such characters, stable under `χ ↦ χ^p`; suppose the Hodge–Tate weights of `T₁` lie in a set `U ∋ 0` of
at most `N + 1` integers, `U ⊂ [−η, η′]`, `1 ≤ η < η′`, and `40(η′N² + N³) < p`. Let `r′` be the largest length of an orbit of
`χ ↦ χ^p` on the ratios of two characters of `Σ`. Prove: `4r′ ≤ N²`, and (the statement of [FormalProof], whose proof is given here
as the reduction and the assembly of the route)

`p^k·H¹_f(ℚ_p, T₂) ⊆ f(H¹_f(ℚ_p, T₁))`, `k = 4(N − 1)r′ + η(r′ + N + 3)`,

with `H¹_f(ℚ_p, T)` the preimage of `H¹_f(ℚ_p, T[1/p])` (SelmerIwasawaCohomology §4.9). The exponent does not depend on `η′`. The proof passes through
Breuil–Kisin modules with tame descent data (the values of the prismatic `F`-crystals of the lattices on the Breuil–Kisin prism of
a tame extension over which they become crystalline), a description of the finite classes by the vanishing of a monodromy
operator built from a connection on these modules, and a lifting statement for exact triples of such modules; these
intermediate statements are not stated here.

*Route.* (a) *Reduction to a crystalline situation* (proved). Put `a := (p − 1)!` and `K′ := ℚ_{p^a}((−p)^{1/(p^a−1)})`, tamely
ramified over `ℚ_p` with ramification index `p^a − 1`. A character of `Σ` lies in an orbit of `χ ↦ χ^p` of length `r ≤ N < p`, so
`χ^{p^r} = χ` and its order divides `p^r − 1`, which divides `p^a − 1`; it is trivial on the inertia group of `K′`, so the lattices
are crystalline over `K′`. `4r′ ≤ N²`: a ratio of characters from two orbits of lengths `a′ + b′ ≤ N` has orbit length dividing
`lcm(a′, b′) ≤ a′b′ ≤ N²/4`, and within one orbit, of length at most `N − 1` because `1 ∈ Σ`, the orbit length is at most
`N − 1 ≤ N²/4`. Enlarging `E` (the next steps take `E ⊇ ℚ_{p^a}(μ_{p^a−1})`) changes neither side: `H¹_f` commutes with the flat base
change `O → O′`. (b) *Breuil–Kisin modules with descent* (statements of [FormalProof]): evaluate the prismatic `F`-crystal of each
lattice (PrismaticCohomologyPartIII §7.22, Bhatt–Scholze) on the Breuil–Kisin prism `(W(𝔽_{p^a})[[u]], (u^{p^a−1} + p))` of `K′`
(PrismaticCohomology §0.76, PrismaticCohomologyPartIII §7.12(1)), on which the automorphisms of `K′` over `ℚ_p` act, giving a descent
datum; a connection on the module over the ring of rigid functions on the open unit disc, and the criterion that a class is
finite exactly when an associated monodromy operator vanishes, are derived from the crystal and from the basic properties of
`B_cris` (the fundamental exact sequence, surjectivity of `φ − 1` on `Fil⁰`; PadicPeriodRings §§4.1–4.3). (c) *Lifting along the
triple* (the assembly is proved; its eleven component statements are statements of [FormalProof]): a power `p^{2(N−1)r′}`, which
depends on the type only and not on `η′`, kills the cokernels along the triple of the Breuil–Kisin modules, of their submodules
fixed by the descent datum, and of the lattices of vectors that carry the finite classes; the monodromy obstruction of a lift
is integral after `p^{η(r′+1)}` and vanishes in the quotient, so after `p^{η(r′+1)+2(N−1)r′}` it comes from the kernel, where it is
integral after a further `p^{η+(N+1)η}` and is then the obstruction of an integral vector of the kernel, which is subtracted. The
exponents add up to `2(N − 1)r′ + η(r′ + 1) + 2(N − 1)r′ + η + (N + 1)η = k`; the hypothesis `40(η′N² + N³) < p` supplies the
inequalities the component statements need. *Needs:* SelmerIwasawaCohomology §4.9; 4.9a; PrismaticCohomology §0.76; PrismaticCohomologyPartIII §§7.12,
7.22; PadicPeriodRings §§4.1–4.3.

**Checks.**

- `N = 2`, `η = r′ = 1`: `k = 10`.
- The hypothesis `40(η′N² + N³) < p` puts all weights far below `p`; for `Σ = {1}` the lattices are crystalline over `ℚ_p` with
  `η + η′ ≤ p − 2`, where 4.10c(3) gives exponent `0`, and this statement only a bounded one.

### 4.10g Pushouts of finite classes under a lifting exponent

Let `K/ℚ_p` be finite. A *surjection of lattices* is an `E`-linear `G_K`-map `W₁ → W₂` of continuous `E`-representations of `G_K`
carrying a `G_K`-stable lattice `L₁` onto a `G_K`-stable lattice `L₂`. A pair `(A, B)` of representations *has lifting exponent
`e`* if for every surjection of lattices with `W₁`, `W₂` subrepresentations of finite sums `A^a ⊕ B^b`, `p^e·H¹_f(K, L₂)` lies in the
image of `H¹_f(K, L₁)` (`H¹_f(K, L)` the preimage of `H¹_f(K, L[1/p])`, SelmerIwasawaCohomology §4.9; for `U/L_U` the image of `H¹_f(K, U)`). Let `U` be de Rham,
`L_U ⊂ U` a stable lattice, `L_U^† := Hom_O(L_U, O)(1) ⊂ U^*(1)` its dual, and `𝒳` a set of representations, closed under finite
direct sums, such that for every `X ∈ 𝒳`: `(X, U)` has lifting exponent `e`, or `X` is de Rham and `(X^*(1), U^*(1))` has lifting
exponent `e`. Prove:

1. for `X ∈ 𝒳`, every stable lattice `L_X ⊂ X`, every `O`-linear `G_K`-map `ϕ : L_X → U/L_U` and every `y ∈ H¹_f(K, L_X)`:
   `p^e·ϕ_*(y) ∈ H¹_f(K, U/L_U)`;
2. the classes `ϕ_*(y)`, over all `X ∈ 𝒳`, `L_X`, `ϕ`, `y` as in (1), span in `H¹(K, U/L_U)/H¹_f(K, U/L_U)` a module of length at most
   `e·(rank_O H¹_f(K, L_U^†) + rank_O L_U)·length_O(O/p) ≤ e·([K:ℚ_p] + 1)·dim_E U·length_O(O/p)`; for `K = ℚ_p` at most
   `2e·dim_E U·length_O(O/p)`.

*Route.* Lift `ϕ` to an `E`-linear `ϕ̃ : X → U` (`L_X` is free). (1), first case: `Γ := {(a, u) ∈ L_X × U : u − ϕ̃(a) ∈ L_U}` is the image
of `L_X ⊕ L_U` under a shear, hence a lattice of `X ⊕ U`; it is stable because `gϕ̃(a) − ϕ̃(ga) ∈ L_U` for `a ∈ L_X` (`ϕ` is
equivariant); and the first projection maps it onto `L_X`, a surjection of lattices with `W₁ = X ⊕ U`. The lifting exponent gives,
on cocycles, `p^ey = pr₁(ỹ) + da₀` with `ỹ` finite in `Γ` and `a₀ ∈ L_X`; `z := pr₂(ỹ)` is finite in `U` (functoriality of `H¹_f`), and
`z ≡ ϕ̃(pr₁ỹ) = p^eϕ(y) − d(ϕ(a₀))` modulo `L_U`: so `p^eϕ_*(y)` is the image of a finite class of `U`. Only functoriality is used
here. Second case: let `ϕ̃^t : U^*(1) → X^*(1)` be the transpose; `Γ′ := {(f, x′) ∈ L_U^† × X^*(1) : x′ − ϕ̃^t(f) ∈ L_X^†}` is a stable
lattice of `U^*(1) ⊕ X^*(1)` mapping onto `L_U^†` (for `f ∈ L_U^†`, `a ∈ L_X`: `⟨a, gϕ̃^t(f) − ϕ̃^t(gf)⟩ ∈ O(1)`). For
`d ∈ H¹_f(K, L_U^†)`, `p^ed = pr₁κ + df₀` with `κ` finite in `Γ′`; `pr₂κ` is finite in `X^*(1)`, hence orthogonal to `y` under local duality
(`X` de Rham: SelmerIwasawaCohomology §4.9); on cochains, `(ϕ∘y) ∪ pr₁κ` is the reduction of `y ∪ pr₂κ` (the defining congruence of `Γ′`), a coboundary; so
`p^eϕ_*(y)` annihilates `H¹_f(K, L_U^†)` under the local pairing, and the annihilator of `H¹_f(K, L_U^†)` in `H¹(K, U/L_U)` is
`H¹_f(K, U/L_U)` (4.10b, `U` de Rham). (2) By (1) every class `ϕ_*(y)` is killed by `p^e` modulo `H¹_f`. A pushout from `X₁` is one
from `X₁ ⊕ X₂` (lattice `L₁ ⊕ L₂`, map `ϕ ⊕ 0`, class `y ⊕ 0`) and `𝒳` is closed under sums, so finitely many of the classes lie in the
span of the pushouts from one `X`, a submodule killed by `p^e`; a module all of whose finitely generated submodules have length
at most `B` has length at most `B`. By local duality `H¹(K, U/L_U)/H¹_f(K, U/L_U) ≅ Hom_O(M, E/O)` with `M := H¹_f(K, L_U^†)` (4.10b), and
a submodule killed by `p^e` has length at most `length(M/p^eM) ≤ e·μ(M)·length_O(O/p)`, `μ(M)` the number of generators. The torsion
of `M` is that of `H¹(K, L_U^†)`, a quotient of a submodule of `H⁰(K, U^*(1)/L_U^†) ⊆ (E/O)^{rank L_U}`, so it needs at most `rank L_U`
generators, and `μ(M) ≤ rank M + rank L_U`. Finally `rank M = dim H¹_f(K, U^*(1)) = dim H⁰(K, U^*(1)) + dim D_dR(U^*(1))/Fil⁰ ≤ dim D_dR(U^*(1)) = [K:ℚ_p]·dim U` (the dimension formula of SelmerIwasawaCohomology §4.9; `H⁰ ⊗ K` embeds in `Fil⁰D_dR`). *Needs:* SelmerIwasawaCohomology §4.9; 4.10b; ClassFieldTheory
Layer 5 (local duality).

**Checks.**

- `X = U`, `L_X = L_U`, `ϕ` the multiplication by `p^{−n}` followed by reduction: `ϕ_*(y)` is the image of the finite class `p^{−n}y` of
  `U`, finite without loss; (1) is consistent there and not sharp. With `e = 0`, (2) says that every pushout is finite.
- `U = E` trivial, `K = ℚ_p`: `rank H¹_f(ℚ_p, O(1)) = 1` (the completed units), and the bound of (2) is `2e·length_O(O/p)`.
- (*why a pushout statement*) The target of `ϕ` is the divisible module `U/L_U`, not a lattice, so a lifting exponent along
  surjections of lattices does not apply to `ϕ` directly; the graph lattice `Γ` turns it into the surjection `Γ ↠ L_X`.

### Examples

For `V = ℚ_p(1)` over `ℚ_p`, a Kummer extension is crystalline exactly when its class lies in the completed-unit line, while every Kummer extension is de Rham and `H¹_g(ℚ_p, ℚ_p(1)) = H¹` has dimension `2`; for `V = ℚ_p`, `H¹_f(K, ℚ_p) = H¹_ur` (4.9a). For `F` imaginary quadratic and `V = E(1)`, the left side of (H3) is `2` against `r[F:ℚ]/2 = 1`, so the Bloch–Kato condition is not balanced (4.9b). For `V = ℚ_p(u)`, `u ≠ 0`, over `ℚ_p` with `p` odd, `H⁰(ℚ_p(μ_{p^m}), ℚ_p/ℤ_p(u))` has exponent exactly `m + v_p(u)`, against the bound `m + v_p(u) + 2` of 4.9d. For the lattice `T₁ = {(a, b) ∈ p^{−1}ℤ_p ⊕ ℤ_p(p − 1) : pa ≡ b (mod p)}` and `f(a, b) = b`, the cokernel on finite classes is `Hom(G_K, 𝔽_p)/Hom^{ur}(G_K, 𝔽_p)`, of exponent `1`, where 4.10c (3) gives `e° = 3`. At `s = 1`, `H = 2h`, `M = h`, `p = 3` and `h = 1` the exponent of 4.10e (1) is at most `13 ≤ 18h`. In 4.10f, `N = 2` and `η = r′ = 1` give `k = 10`. For `U = E` trivial and `K = ℚ_p` the bound of 4.10g (2) is `2e·length_O(O/p)`.

### Dependencies

Layer 3 (the Selmer data of 3.22, in 4.9b); SelmerIwasawaCohomology §§2.6, 2.17, 4.8 (in a Check of 4.10a), 4.9 and 4.10; PhiGammaModulesAndIwasawaCohomology §§1.0, 3.4, 3.6 and 6.0; WachLatticesOverTheCyclotomicTower §§6.4–6.10; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P2, R07.P3 and R07.P5 (4.9a); PadicPeriodRings §§1.3–1.5 (4.9c, 4.9d) and PadicPeriodRings §§4.1–4.3 (4.9a, 4.10c, 4.10f); PrismaticCohomologyPartIII §§7.12, 7.13 and 7.22 and PrismaticCohomology §§0.61, 0.76 and 0.77 (4.10e (0), 4.10f); ArithmeticGaloisDuality §§R02.1.2, R02.2.3 and R02.4.2; ClassFieldTheory Layer 5; ProfiniteCohomology §5.4. Construction order: 4.9c and 4.9d use, in their routes, the lattices at level `s` of 4.10e (0), a later section of this layer; 4.10e (0) and what it rests on (4.9a and 4.10c (2)) use neither 4.9c nor 4.9d, so 4.10e (0) is built before them and there is no cycle.

## Downstream consumers

For each target of this roadmap, the statements that use it, in this roadmap, in the family [RiemannHypothesisForDirichletLFunctions](../README.md) and on main:

- **3.22**: 3.23–3.26, hence CongruenceModulesOfThetaLifts §§7.7a–7.7d, 7.8.
- **3.23**: 3.26, hence CongruenceModulesOfThetaLifts §7.8.
- **3.24**: 3.25, hence 3.25a, 3.26 and CongruenceModulesOfThetaLifts §7.8.
- **3.25**: 3.25a, 3.26, hence CongruenceModulesOfThetaLifts §7.8.
- **3.25a**: 3.26, hence CongruenceModulesOfThetaLifts §7.8.
- **3.25b**: 3.26, hence CongruenceModulesOfThetaLifts §7.8.
- **3.26**: CongruenceModulesOfThetaLifts §7.8 (one twist for all signatures, both sides, the twisted theta value and the theta index; the theta conditions are polynomial conditions in the sense above, of the first or of the second kind, produced there; a condition given only by an inequality for a Gauss norm is not of either kind and must first be brought to the first kind).
- **4.9a**: 4.10a–4.10f, hence CongruenceModulesOfThetaLifts §§7.6, 7.7a–7.7d, 7.10a–7.10c; AnabelianGeometryAndNonabelianChabauty §4.6 (the extension description in its target "The Bloch–Kato subgroups `H¹_e ⊆ H¹_f ⊆ H¹_g`").
- **4.9b**: CongruenceModulesOfThetaLifts §§7.7a–7.7d, 7.8 (the relaxed Selmer groups with the Bloch–Kato condition above `ℓ`).
- **4.9c**: CongruenceModulesOfThetaLifts §§7.7a–7.7d, 7.10a–7.10c (the bound for the character blocks at the rows, with `Y` the lattice of the block `ρ_0`, `Ỹ` the extension cut out by a cut cocycle, and `e < t`): (1) at the rows over unramified bases, (2) at the primes of the conductor of the host and at `2`, `3`, with `N` the modulus of the host. At the type primes of the consumer this statement is not used (a tame type of niveau `> 1` is crystalline over no `K₀(μ_{p^s})`); the description of the finite classes of `(E/O)(χ_cyc^{−e})` used there is SelmerIwasawaCohomology §4.9.
- **4.9d**: CongruenceModulesOfThetaLifts §§7.7d, 7.10a (the `H⁰` terms and the torsion of `H¹_f` in the congruence bound at the split rows; (2) at the primes of the conductor of the host).
- **4.10a**: CongruenceModulesOfThetaLifts §7.6 (the local condition at `ℓ` for the cocycles cut out of the lifted eigensystems, at primes in position).
- **4.10b**: LengthBoundsInPadicFamilies §1.8e (rows), hence CongruenceModulesOfThetaLifts §§7.7a–7.7d.
- **4.10c**: 4.10d, 4.10e ((1) over ramified `K` and at `p = 2` in 4.10e(3)); LengthBoundsInPadicFamilies §1.8e (the cochain part of (Col) and the hypothesis (Row)), hence CongruenceModulesOfThetaLifts §§7.10a–7.10c (the rows at small split primes; (1), as the generator count, also at the rows over ramified and dyadic bases).
- **4.10d**: LengthBoundsInPadicFamilies §1.8e (the hypothesis (Row)), hence CongruenceModulesOfThetaLifts §§7.10a–7.10c (the rows at primes inert in the CM subfield); (4), alternating words of comparable sizes: CongruenceModulesOfThetaLifts §7.10a (row 4, the places where both letters are thick).
- **4.10e**: CongruenceModulesOfThetaLifts §§7.10a–7.10c (the rows at `ℓ = 2, 3`, at the primes ramified in the host, with (1′) at the primes of the conductor of the host, and at the two large ramified primes, through the cochain part of (Col) or the hypothesis (Row) of LengthBoundsInPadicFamilies §1.8e).
- **4.10f**: 4.10g, and through it CongruenceModulesOfThetaLifts §§7.10a–7.10c (the rows at the type primes, as the row defects (Row) of LengthBoundsInPadicFamilies §1.8e(2) with no columns).
- **4.10g**: CongruenceModulesOfThetaLifts §§7.10a–7.10c (at the type primes, `K = ℚ_ℓ`, `e` the exponent of 4.10f: the lengths `2r·e_max` and `2e_max` of the spans of the cut cocycles of the blocks modulo the finite classes, in the first form at the places of one kind and in the dual form at their conjugates), through the row defects of LengthBoundsInPadicFamilies §1.8e(2) with no columns.

## Scope and ownership

This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) is independently definitive.

This roadmap owns the statements of its two layers above: Selmer functors on torsion modules over finite group rings with an abstract balanced saturated condition above `p`, their square-matrix presentations with a universal cocycle, the square presentations of left-exact functors and the tame anticyclotomic characters (3.22); the length of a twisted Selmer group as the valuation of a specialised determinant (3.23); auxiliary places in position with the residual determinant bounds, also when `T̄ ≅ T̄ ⊗ χ̄_cyc^t` (3.24, 3.25, 3.25a); the specialisation lemma for roots of unity (3.25b); twist selection (3.26); the crystalline-extension and de Rham-extension criteria for `H¹_f` and `H¹_g` and the identification of crystalline classes with `H¹_f` (4.9a); the balance of the Bloch–Kato condition (4.9b); the bound for the finite part of the classes cut out by a character (4.9c) and the killing exponent for the invariants of a crystalline representation modulo a lattice (4.9d), both also over the abelian bases `K ⊆ ℚ_p(μ_{lcm(p,N)})`; the identification of torsion classes cut out of crystalline families with the Bloch–Kato finite ones under a position hypothesis on the weights, beyond the Fontaine–Laffaille range (4.10a); the defect of a class orthogonal to part of the dual finite classes (4.10b); the cyclotomic prisms of finite level over `O_K` and the lattices at a finite level of the cyclotomic tower obtained from prismatic `F`-crystals on them, with their uniqueness, heights, comparison at the zeros of `Q`, `Γ` condition, saturation, Sen and Herr properties (4.10e (0)); the lifting theorems with loss over unramified, ramified cyclotomic, abelian, tamely ramified and tame-type bases, along arcs of embeddings, for words of weights and for alternating words of comparable sizes (4.10c–4.10f); and the pushouts of finite classes under a lifting exponent (4.10g).

The theory these statements extend is owned elsewhere. Selmer structures and dual Selmer structures, local duality for the finite conditions, Poitou–Tate for Selmer groups, Selmer complexes as mapping fibres, Iwasawa algebras of `ℤ_p^d × Δ`, the Bloch–Kato local condition and its integral comparison in the Fontaine–Laffaille range are [SelmerIwasawaCohomology](../../SelmerIwasawaCohomology/README.md) §§2.6, 2.13, 2.17, 2.19, 2.21, 2.22, 3.0 and 4.7–4.11. Wach lattices with their uniqueness and twist laws and the integral Herr comparison are [PhiGammaModulesAndIwasawaCohomology](../../PhiGammaModulesAndIwasawaCohomology/README.md) §§3.4, 3.6 and 6.0; the reduction of Wach lattices, position data, full representations and admissible modules, and the annihilators of the cokernels of Wach lattices with the torsion bound for the truncated Herr complex are [WachLatticesOverTheCyclotomicTower](../WachLatticesOverTheCyclotomicTower/README.md) §§6.4–6.10: the count of `(φ, Γ)`-modules behind 4.10a and the annihilators behind 4.10c–4.10e are proved there. Prismatic `F`-crystals and their étale comparison are [PrismaticCohomologyPartIII](../../PrismaticCohomologyPartIII/README.md) §§7.12, 7.13 and 7.22, and the Breuil–Kisin and `q`-de Rham prisms are [PrismaticCohomology](../../PrismaticCohomology/README.md) §§0.61, 0.76 and 0.77. Local and global duality, restriction and corestriction and the Greenberg–Wiles formula are [ArithmeticGaloisDuality](../../ArithmeticGaloisDuality/README.md); local class field theory and ray class fields are [ClassFieldTheory](../../ClassFieldTheory/README.md) Layers 5 and 13; the Chebotarev density theorem is [Chebotarev](../../../Completed/Chebotarev/README.md); the period rings are [PadicPeriodRings](../../PadicPeriodRings/README.md) and [FiniteFlatGroupsAndIntegralPadicHodgeTheory](../../FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md); Newton polygons are [NewtonPolygons](../../NewtonPolygons/README.md). The target "The Bloch–Kato subgroups `H¹_e ⊆ H¹_f ⊆ H¹_g`" of [AnabelianGeometryAndNonabelianChabauty](../../AnabelianGeometryAndNonabelianChabauty/README.md) §4.6 states that a class lies in `H¹_f` (resp. `H¹_g`) exactly when the corresponding extension is crystalline (resp. de Rham); 4.9a proves that description and defines `H¹_g`, while the definition of `H¹_e` and the unipotent torsor statements are owned there.

In this family, CongruenceModulesOfThetaLifts uses twist selection, the balance of the Bloch–Kato condition and the local bounds of Layer 4, and LengthBoundsInPadicFamilies uses the defect statement and the lifting theorems with loss in its bound with local defects; Downstream consumers above lists each use.

## Exact supplier contracts

### From TauCetiRoadmap.SelmerIwasawaCohomology

§2.6: the conditions on `T` and on `W = V/T` propagated from a condition on `V` by preimage and image; the preimage is saturated. §2.13: dual Selmer structures (the dual conditions of 3.22). §2.17: local duality for the finite conditions on `T` and `W`: `H¹_f(K, T)` and the finite condition of the discrete dual are exact annihilators (4.10b, 4.10e (2)). §2.19: Poitou–Tate for Selmer groups. §2.21: the Selmer complex as the mapping fibre of specified local complexes. §2.22: the `H⁰` correction, identifying the `H¹` of the Selmer complex with the Selmer group when the relevant `H⁰` vanishes. §3.0: Iwasawa algebras of `ℤ_p^d × Δ`, which cover the finite group rings `O[(ℤ/p^M)^J]` of Layer 3 as the case of a trivial pro-`p` part. §4.9: the Bloch–Kato condition `H¹_f(K, V) = ker(H¹(K, V) → H¹(K, V ⊗ B_cris))`, its `T`-condition by preimage and its `W`-condition by image; for crystalline `V` the exact sequence `0 → H⁰(K, V) → D_cris(V) → D_cris(V) ⊕ D_dR(V)/Fil⁰ → H¹_f(K, V) → 0` and the dimension formula `dim H¹_f(K, V) = dim(D_dR(V)/Fil⁰) + dim H⁰(K, V)`; for de Rham `V` the orthogonality of the finite conditions under local duality. §§4.7, 4.8, 4.10, 4.11: the integral crystalline comparison in the Fontaine–Laffaille range (the Checks of 4.10a).

### From TauCetiRoadmap.PhiGammaModulesAndIwasawaCohomology

§6.0: Wach lattices, their uniqueness and twist laws. §§3.4, 3.6: the integral Herr comparison for finite `p`-primary modules, with the prime-to-`p` torsion adapter. §1.0: the cyclotomic norm fields and their field realization (4.10e). Used in 4.10a and 4.10c–4.10e.

### From WachLatticesOverTheCyclotomicTower, a sub-roadmap of this family

§§6.4–6.9: reduced invariant Wach lattices with their heights (labelled by the source embedding of `φ_i`) and `Γ` condition, and their localisation at `ζ_p − 1` and at all levels (§6.4 (7)); the Sen clause over distinct values (with poles, §6.5 (4)), Sen weights modulo `p` as the residues of the Hodge–Tate weights, and semisimplicity at `0` under the residue hypothesis; position data, full representations and admissible modules; the existence of models, the Sen weights of models of subquotients of `T̄`, the uniqueness of the models of the block characters and the absence of the characters `k(χ̄_cyc^{−e})`, `−1 ≤ e < t`, from `T̄^{ss}`; the largest model with its Sen-weight count; the residual bound (under the position hypothesis the classes of `H¹(G_K, T̄₀(χ̄_1^{−1}))` with admissible extension form a subspace of dimension at most `d`); and the admissible classes of the block characters (zero for `1 ≤ e < t`, unramified for `e = 0`). §6.4 (5): `N(T₀) = N(T₁) ∩ D(T₀)` for an exact sequence of lattices. §6.4 (8): a lattice with a finite free submodule of its étale module satisfying the height and `Γ` conditions is crystalline, and the submodule is its Wach lattice. §6.10: the annihilator of the cokernel of the Wach lattices of a surjection (`π^H`, the `γ`-descent and the Frobenius recursion) and the torsion bound for the truncated Herr complex, with the sharp exponents `cost` and `e°_U`. Used in 4.10a and 4.10c–4.10e.

### From TauCetiRoadmap.PrismaticCohomologyPartIII

§7.12: the Breuil–Kisin prism and the prism `(A_inf, ker θ̃)` are objects of the prismatic site of `O_K`, with the `W(k)`-algebra structure of `A_inf` compatible with `θ̃` (the Witt-functorial inclusion followed by the Frobenius). §7.13 (2): for the value `M` of a prismatic `F`-crystal on `A_inf`, with étale realisation `T`, `M[1/μ] ≅ T ⊗_{ℤ_p} A_inf[1/μ]` and `M ⊗ B_dR^+ ≅ T ⊗ B_dR^+`. §7.22: the étale realisation is an equivalence from prismatic `F`-crystals on `O_K` (in vector bundles) to `ℤ_p`-lattices in crystalline representations of `G_K`, with quasi-inverse `T ↦ 𝔐(T)`, for every prime `p`. Used in 4.10e (0) (the value of `𝔐(T)` on the cyclotomic prism `(W(k)[[π]], (φ^{s−1}(q)))` over `O_K`, transported to `A_inf` along `ι_s`) and 4.10f (its value on the Breuil–Kisin prism of a tame extension).

### From TauCetiRoadmap.PrismaticCohomology

§0.61: a `δ`-map carries distinguished elements to distinguished elements. §0.76: the Breuil–Kisin prism. §0.77: the `q`-de Rham prism `(ℤ_p[[q − 1]], ([p]_q))`. Used in 4.10e (0) (the cyclotomic prism `𝔖_s`) and 4.10f.

### From TauCetiRoadmap.ArithmeticGaloisDuality

§R02.1.2: long exact sequences for continuous cohomology, including the period coefficients (4.9a). §R02.2.3: restriction and corestriction for finite index, `cor∘res = [K′ : K]` (4.9c, 4.10e (2)). §R02.4.2: the local Tate pairing, and unramified classes as exact annihilators (3.24, 4.10a, 4.10b). §R02.4.3: Poitou–Tate duality (3.22, 3.24, 3.25a). §R02.4.4: finiteness, cohomological dimension and Tate's global Euler characteristic formula (3.22). §R02.5.1: the Greenberg–Wiles formula (3.22, 3.24, 3.25a). §D7.7.4: duality for the Selmer complexes (3.22).

### From TauCetiRoadmap.ClassFieldTheory

Layer 5: local Tate duality, the local Euler characteristic formula and the invariant `H²(F_v, k(1)) ≅ k` (3.22, 3.24, 4.9c, 4.10a, 4.10b, 4.10e, 4.10g). Layer 13: ray class fields and the characters they give (3.22 (1)).

### From TauCetiRoadmap.ProfiniteCohomology

§2.4: inner automorphisms act trivially on cohomology (3.24 (4b)). §5.4: inflation–restriction (3.24 (4b), 4.9c).

### From TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory

§§R07.P2, R07.P3, R07.P5: the crystalline period structures, the fundamental exact sequences with their continuous sections and boundary maps, and the arithmetic realization interfaces, for finite `K/ℚ_p` (4.9a).

### From TauCetiRoadmap.PadicPeriodRings

§§1.3–1.5: normalized traces and Tate's decomposition, Tate's cohomology of `ℂ_p(j)`, and `B_dR^+` (4.9c, 4.9d). §§4.1–4.3: the basic properties of `B_cris`, among them the fundamental exact sequence and the surjectivity of `φ − 1` on `Fil⁰` (4.9a, 4.10c (2), 4.10e (0), 4.10f).

### From TauCetiRoadmap.NewtonPolygons

§§2.1–2.3: the Newton polygon of a polynomial over a nonarchimedean field from its coefficient valuations, its supporting value `min_i(v(g_i) + iδ)` as the valuation of the Gauss norm, and the active indices. Used in 3.25b.

### From TauCetiRoadmap.Chebotarev

Layers 10 and 14: every conjugacy class of a finite Galois quotient of `G_F` is the Frobenius class of a set of primes of positive (Dirichlet, resp. natural) density. Used in 3.24 (4c), 3.25a (1) and 3.26.

### From TauCetiRoadmap.ArithmeticDirichletSeries

§5.3: the primes of a number field of residue degree greater than one have density zero, so the conjugacy classes of Chebotarev are met by places of degree one over `ℚ`. Used in 3.24 (4c) and 3.26.

### From Mathlib

`Matrix.det`, `Matrix.adjugate`, `Module.length`, `Polynomial` and `IsPrimitiveRoot`; the Smith normal form over a principal ideal domain (3.23, 3.25); Fitting ideals of finitely presented modules (3.22, 3.25a).

## References

- **Bloch–Kato** — Spencer Bloch and Kazuya Kato, *L-functions and Tamagawa numbers of motives*, The Grothendieck Festschrift I (1990), 333–400: crystalline extensions and the exact sequence for `H¹_f` (4.9a–4.10c, 4.10g).
- **Wach 1996** — Nathalie Wach, *Représentations p-adiques potentiellement cristallines*, Bulletin de la Société Mathématique de France 124 (1996), 375–400: Wach lattices (4.10c).
- **Berger-Wach-2004** — Laurent Berger, *Limites de représentations cristallines*, Compositio Mathematica 140 (2004), 1473–1498: Wach lattices (4.10c).
- **Herr 1998** — Laurent Herr, *Sur la cohomologie galoisienne des corps p-adiques*, Bulletin de la Société Mathématique de France 126 (1998), 563–600: the Herr complex (4.10c).
- **BS23-FCRYS** — Bhargav Bhatt and Peter Scholze, [Prismatic F-crystals and crystalline Galois representations](https://arxiv.org/abs/2106.14735v2), arXiv:2106.14735v2: Theorem 1.2 (Theorem 5.6 in the body; the equivalence, for every prime `p`), through PrismaticCohomologyPartIII §7.22, in 4.10e (0) (evaluation on the cyclotomic prism; no statement on Breuil–Kisin prisms is used there) and 4.10f (evaluation on a Breuil–Kisin prism).
- [FormalProof] Levent Alpöge, the Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for Dirichlet L-functions announced in [Announcement]; source with a public verification setup: <https://github.com/leanprover-community/riemann-hypothesis>. It is the source of the presentation of Selmer functors over group rings with a universal cocycle, the residual determinant bounds, the determinant bound under a congruence `T ≡ T ⊗ χ_cyc^t` (a dual class by counting and the determinant after adding a place), and twist selection (3.22–3.26); of the bound for the classes cut out by a character and the killing exponent for invariants modulo a lattice, with their forms over abelian bases (4.9c, 4.9d); of the local theorem beyond the Fontaine–Laffaille range (4.10a); of the lifting theorems with loss along surjections of crystalline lattices and the lattices at a finite level of the cyclotomic tower (4.10c–4.10f); and of the pushouts of finite classes under a lifting exponent (4.10g).
- [Announcement] Levent Alpöge, the announcement of that proof, 20 November 2026: <https://alpo.ge/remark.pdf>.
