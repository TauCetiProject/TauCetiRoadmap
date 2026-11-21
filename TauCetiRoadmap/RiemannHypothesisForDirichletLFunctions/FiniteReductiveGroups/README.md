# Roadmap: finite reductive groups and the characters of `GL_n(𝔽_q)`

**Summary.** Let `G` be a connected reductive group over a finite field `𝔽_q` and `F` its Frobenius
endomorphism. The finite group `G^F` of rational points (`GL_n(𝔽_q)`, `Sp_{2n}(𝔽_q)`, the finite unitary
groups) has finitely many irreducible complex characters, and this roadmap builds the two classical
machines that construct them. Harish-Chandra induction from Levi subgroups of rational parabolic subgroups
sorts the irreducible characters into series, each attached to a cuspidal character of a Levi subgroup.
Deligne–Lusztig induction attaches to every rational maximal torus `T` and every character `θ` of `T^F`
a virtual character `R_T^G(θ)`, the alternating sum of the `θ`-isotypic parts of the ℓ-adic cohomology
with compact supports of a variety on which `G^F × T^F` acts. The first headline theorem is the
Deligne–Lusztig package: `⟨R_T^G(θ), R_{T'}^G(θ')⟩` is the number of cosets `nT^F` of elements `n` of the rational
transporter of `T` to `T'` that carry `θ'` to `θ`; `R_T^G(θ)` has degree `ε_Gε_T|G^F|_{p'}/|T^F|`, so that
for `θ` in general position `ε_Gε_T R_T^G(θ)` is an irreducible character, cuspidal when `T` lies in no
proper rational Levi subgroup; every irreducible character occurs in some `R_T^G(θ)`, and two of them
have a common constituent only if their pairs are geometrically conjugate; and the values of
`R_T^G(θ)` are given by a character formula in terms of Green functions. The second is the
multiplicity-one theorem of Gelfand, Graev and Steinberg: for a regular character `ψ` of the unipotent
radical `U^F` of a rational Borel subgroup, `Ind_{U^F}^{G^F} ψ` has no repeated constituent, and it meets
every `R_T^G(θ)` with multiplicity `ε_Gε_T`.

For `G = GL_n` the theory becomes completely explicit, and the third headline theorem is Green's. For a
character `θ` of `𝔽_{q^n}^×` whose `n` Frobenius conjugates `θ, θ^q, …, θ^{q^{n−1}}` are distinct, there
is an irreducible cuspidal character `σ_θ` of `GL_n(𝔽_q)` of degree `(q−1)(q²−1)⋯(q^{n−1}−1)`, with value
`(−1)^{n−1}(θ(z) + θ(z^q) + ⋯ + θ(z^{q^{n−1}}))` at an element whose characteristic polynomial is
irreducible with root `z ∈ 𝔽_{q^n}`. The irreducible characters of `GL_n(𝔽_q)` correspond to
partition-valued functions on Frobenius orbits of characters of the finite fields, through a
characteristic map that sends power sums to Deligne–Lusztig characters and Schur functions to irreducible
characters; this gives Green's degree formula, shows that every cuspidal character is some `σ_θ`, and
shows that the Gelfand–Graev representation contains exactly one irreducible character from each series
of such functions. Its share of each series is computed exactly, which makes the series equidistributed
in a precise sense (squarefree labels carry weight between `q^{−n}` and `q^{−n}(1−q^{−1})^{−n}`, all other
labels together at most `2/q`). The derivatives of the Gelfand–Graev representation are explicit,
`Γ_n^{(j)} ≅ (q^j − q^{j−1})·Γ_{n−j}`, and the representation induced from a Bessel-type character of a subgroup of index
`q^k` of the unitriangular group is `Γ_{(k,n−k)} ⊕ ⊕_{j<k}(q^{k−j} − q^{k−j−1})·Γ_{(j,n−j)}`, a sum of degenerate Gelfand–Graev
representations `Γ_{(j,n−j)} = Γ_j × Γ_{n−j}` (`Γ_{(0,n)} = Γ_n`); so the multiplicity of that character in every Harish-Chandra
induced cuspidal representation lies between `q^k(1 − q^{−1})` and `q^k(1 + (2n − 1)/q)` when `n ≤ q`. Shintani descent
compares `GL_n(𝔽_q)` with `GL_n(𝔽_{q^d})`: the norm `δ ↦ δF(δ)⋯F^{d−1}(δ)` induces a bijection from twisted classes onto classes,
the resulting lift of class functions is an isometry compatible with Harish-Chandra induction, and for a prime `l` the lift of
`σ_θ` is, up to a sign, the twisted character of an explicit irreducible representation of `GL_n(𝔽_{q^l})` (cuspidal when
`l ∤ n`, the product of the `l` conjugate cuspidal representations of `GL_{n/l}(𝔽_{q^l})` when `l ∣ n`); so labels of
Harish-Chandra series lift along extensions of prime degree. The last layer connects
the finite theory to depth-zero representations of
`GL_n(F)` for every nonarchimedean local field `F` with residue field `𝔽_q`: compact induction of `σ_θ`,
inflated to `GL_n(𝒪_F)` and extended to the centre, gives exactly the supercuspidal representations of
depth zero, and the `GL_n(𝔽_q)`-module of vectors fixed by the first congruence subgroup carries the
cuspidal support of any depth-zero representation as a Harish-Chandra series.

The roadmap builds on [ReductiveGroups](../../ReductiveGroups/README.md), which constructs `G^F`, proves Lang's theorem and owns the
Harish-Chandra functors with their Mackey formula; on the [RepresentationTheory](../../RepresentationTheory/README.md) family ([CharacterTheory](../../RepresentationTheory/CharacterTheory/README.md),
[InductionRestriction](../../RepresentationTheory/InductionRestriction/README.md) and [SchurWeyl](../../RepresentationTheory/SchurWeyl/README.md)) for characters, induction and symmetric functions; on
[EtaleCohomologyFoundations](../../EtaleCohomologyFoundations/README.md) for compactly supported ℓ-adic cohomology; and on [SmoothRepresentationsOfLocalGroups](../../SmoothRepresentationsOfLocalGroups/README.md)
for compact induction and Jacquet modules of `p`-adic groups. In the family [RiemannHypothesisForDirichletLFunctions](../README.md) it feeds
[BaseChangeAndGaloisRepresentationsForUnitaryGroups](../BaseChangeAndGaloisRepresentationsForUnitaryGroups/README.md)
(explicit local Langlands parameters of depth-zero supercuspidal representations, through the lift of labels under
unramified base change of prime degree) and the theta-chain roadmaps, from
[ThetaChainsOnDefiniteUnitaryGroups](../ThetaChainsOnDefiniteUnitaryGroups/README.md) to [ThetaChainsAndFrobeniusPrimeSums](../ThetaChainsAndFrobeniusPrimeSums/README.md)
(labels, weights and multiplicities at auxiliary primes, and the local type statement at the twist places).

Layer 0 sets up `G^F`, its rational maximal tori, its classes and its regular unipotent elements; Layer 1
is Harish-Chandra theory; Layer 2 is the Gelfand–Graev representation, generic characters, degenerate
Gelfand–Graev representations and the Harish-Chandra restriction of `Γ_ψ`, and, for `GL_n`, the mirabolic
subgroup, the derivatives of `Γ_n`, the Bessel-type induced representations and their multiplicities; Layer 3
develops the facts about compactly supported ℓ-adic cohomology and Lefschetz numbers of finite-order
automorphisms that Deligne–Lusztig theory needs; Layer 4 is
Deligne–Lusztig induction, in the order the Lang map as a `G^F`-torsor and Deligne–Lusztig varieties, inner
products, Harish-Chandra compatibility, Steinberg character
and the two averages, degree, disjointness of Lusztig series and exhaustion, cuspidality, Gelfand–Graev
pairings; Layer 5 is Green's theory of `GL_n(𝔽_q)`, with the characteristic maps, labels, Gelfand–Graev weights
and their Bessel-type shares, counts, the Gauss sums of cuspidal characters, and Shintani descent in prime degree; Layer 6
is the bridge to depth zero, with the local type statement for representations of `GL_{a+b}(F)` that have a vector
of a given type under a parahoric subgroup of type `(a, b)`.

## Conventions

- **Fields and Frobenius.** `p` is a prime, `q = p^f`, and `k̄` is a fixed algebraic closure of `𝔽_q`, with
  `𝔽_{q^n} ⊂ k̄` the subfield of order `q^n`. `G₀` is a connected reductive group over `𝔽_q`,
  `G = G₀ ×_{𝔽_q} k̄`, and `F : G → G` is the `q`-Frobenius of ReductiveGroups Layer 7a, acting on points
  by `a ↦ a^q` on coordinates; `G^F ≃ G₀(𝔽_q)` by that layer. Layers 0–4 are stated, and are to be proved,
  for every Steinberg endomorphism `F` in the sense of ReductiveGroups Layer 9E (some power `F^δ` is the
  `q^δ`-Frobenius of an `𝔽_{q^δ}`-structure); there `q` denotes the positive real number with that
  property (for the Suzuki and Ree groups an odd power of `√2` or `√3`), and every formula below in which
  `q` appears (`q^N`, `q^{ℓ(w)}`, `|G^F|_p`) is read with this `q`. Layers 5 and 6 concern `GL_n` with the
  standard Frobenius.
- **Rational objects.** "Rational" means `F`-stable. A rational Levi subgroup always means a rational
  Levi complement `L` of a rational parabolic subgroup `P`; `W = N_G(T₀)/T₀` for a rational maximal torus
  `T₀` inside a rational Borel subgroup `B₀ = T₀U₀`, with the action of `F`, simple reflections `S` and
  length function `ℓ`. `N` is the number of positive roots.
- **The sign `ε`.** For a rational maximal torus `T`, `F` acts on `X(T) ⊗ ℝ` as `q·φ_T` with `φ_T` of finite
  order (by ReductiveGroups 9E, `F^δ` restricted to `T` is the `q^δ`-Frobenius of an `𝔽_{q^δ}`-structure on `T`, so
  `F^δ = q^δ·ρ` on `X(T)` with `ρ` of finite order; on the standard torus of the Chevalley carriers this is ChevalleyGroups
  C5, *Steinberg endomorphisms*); put `r(T) = dim (X(T) ⊗ ℝ)^{φ_T}`. For a rational connected reductive
  subgroup `H`, `r(H) = r(T_H)` for a rational maximal torus `T_H` of `H` contained in a rational Borel
  subgroup of `H`, and `ε_H = (−1)^{r(H)}`. For the `q`-Frobenius of an `𝔽_q`-structure `r(H)` is the
  `𝔽_q`-rank of `H`, the dimension of a maximal `𝔽_q`-split torus, as in Deligne–Lusztig.
- **Coefficients.** Characters and representations of finite groups are complex. ℓ-adic cohomology uses
  `ℚ̄_ℓ` for a prime `ℓ ≠ p` and is compared with complex characters through a field isomorphism
  `ι : ℚ̄_ℓ ≅ ℂ`, with no continuity condition; every statement in which `ℓ` or `ι` appears is proved
  independent of both (target 3.1).
- **Characters and pairing.** Class functions, the pairing
  `⟨f₁, f₂⟩ = |G^F|⁻¹ Σ_g f₁(g) f₂(g⁻¹)` and virtual characters are those of
  RepresentationTheory/CharacterTheory (Layers 0 and 3). "Constituent" means an irreducible character
  with nonzero pairing. `|G^F|_p` and `|G^F|_{p'}` are the `p`-part and prime-to-`p` part of the order. `conj(z)` is
  the complex conjugate of `z ∈ ℂ`.
- **Harish-Chandra functors.** `R_{L⊂P}^G` and `*R_{L⊂P}^G` are the functors of ReductiveGroups Layer 7c
  with coefficient ring `ℂ`. By that roadmap's Layer 7e they do not depend on `P`, and are written `R_L^G`,
  `*R_L^G`.
- **The general linear group.** `GL_n = Matrix.GeneralLinearGroup (Fin n)`. `B`, `T`, `U` are the upper
  triangular, diagonal and upper unitriangular subgroups; `P_n ⊂ GL_n` is the mirabolic subgroup of
  matrices with last row `(0, …, 0, 1)`; Levi subgroups of standard parabolic subgroups are block diagonal
  `GL_{n₁} × ⋯ × GL_{n_r}`, the parabolic being block upper triangular, and `π₁ × π₂` denotes
  `R_{GL_a×GL_b}^{GL_{a+b}}(π₁ ⊠ π₂)`. `ψ₀` is a fixed nontrivial character of `(𝔽_q, +)` and
  `ψ(u) = ψ₀(u_{12} + u_{23} + ⋯ + u_{n−1,n})` is the standard regular character of `U(𝔽_q)`.
- **Combinatorics.** Partitions are Mathlib's `Nat.Partition`; `ℓ(μ)` is the number of parts,
  `n(μ) = Σ_i (i−1) μ_i`, `H̃_μ(t) = ∏_{boxes} (t^{h(box)} − 1)` with `h` the hook length, `f^μ` the number
  of standard tableaux, `z_μ` the order of the centraliser in `S_{|μ|}` of a permutation of cycle type `μ`,
  and `ψ_n(t) = ∏_{i=1}^n (t^i − 1)`. `Λ` is the ring of symmetric functions of SchurWeyl Layer 7 with its
  Hall inner product, power sums `p_μ`, complete and elementary functions `h_m`, `e_m` and Schur functions
  `s_μ`. The unipotent class of Jordan type `μ` is `u_μ`; `u_{(n)}` is regular unipotent and
  `u_{(1^n)} = 1`.
- **Characters of finite fields.** `L_n = Hom(𝔽_{q^n}^×, ℂ^×)`. For `d ∣ n`, `L_d ↪ L_n` by composition
  with the norm `𝔽_{q^n}^× → 𝔽_{q^d}^×`; `L = colim_n L_n`. Frobenius acts by `θ ↦ θ^q`; the degree of
  `θ ∈ L` is the size of its orbit, and `θ ∈ L_n` is **regular** when its degree is `n`, that is when
  `θ, θ^q, …, θ^{q^{n−1}}` are distinct. The canonical parametrisations below are by Frobenius orbits in
  `L`; `|O|` is the size of an orbit and `q_O = q^{|O|}`. The **labelled form**: a Frobenius-equivariant
  group isomorphism `k̄^× ≅ L` (one exists; it is a choice) turns orbits into monic irreducible polynomials
  over `𝔽_q` other than `X`, and functions on orbits into monic polynomials with nonzero constant term. The
  **tame labelled form** is the following choice. Let `t = (t_n)_{n≥1}` be a topological generator of the limit
  `lim_n 𝔽_{q^n}^×` along the norm maps, and `ι` an isomorphism from the group of roots of unity of order prime to `p` in
  `ℂ` onto `k̄^×`. Then `θ ↦ ι(θ(t_n))` for `θ ∈ L_n` is a well-defined Frobenius-equivariant isomorphism `L ≅ k̄^×`; its
  inverse is the labelled form attached to `(t, ι)`. For a nonarchimedean local field (of any characteristic) with residue
  field `k ≅ 𝔽_q` and a topological generator `γ₀` of its tame inertia group, the images `t_n(γ₀)` under the tame characters
  `t_n : I → k_n^×` form such a `t`. The comparison of the label of a depth-zero representation (6.3) with its Langlands
  parameter is not part of this roadmap (Downstream consumers).
- **Labels and Green data.** A **label** of degree `n` is a finitely supported function `m` from Frobenius
  orbits to `ℕ` with `Σ_O |O|·m(O) = n`; a **Green datum** is a finitely supported function `λ` from orbits to
  partitions, of weight `‖λ‖ = Σ_O |O|·|λ(O)|`, with label `|λ| : O ↦ |λ(O)|`.
- **The convention for Green's parametrisation** is pinned by three Checks of Layer 5: the label `(n)` at
  the orbit of the trivial character gives the trivial character, `(1^n)` there gives the Steinberg
  character, and `(1)` at an orbit of size `n` gives `σ_θ`.
- **Local fields (Layer 6).** `F` is a nonarchimedean local field (of any characteristic) with ring of
  integers `𝒪`, uniformiser `ϖ` and residue field `k ≅ 𝔽_q`; `K = GL_n(𝒪)`, `K₁ = ker(K → GL_n(k))`;
  `F_n/F` is the unramified extension of degree `n` with residue field `k_n`; representations are smooth
  and complex, in the categories of SmoothRepresentationsOfLocalGroups SR.0.

**Statements of the formal proof.** Where a target or a clause names [FormalProof], the form that proof establishes is recorded at the target: its
hypotheses, ranges and constants are those of the proof, including restrictions that the route written here does not
visibly use. A wider or sharper form stated beside it is this roadmap's own, proved by the route written here, and is not in
[FormalProof].

## Layer 0: finite reductive groups, rational tori and classes

### 0.1 Rational Borel pairs and the order of `G^F`

There is a rational Borel subgroup `B₀` containing a rational maximal torus `T₀`, and `G^F` acts
transitively on rational Borel subgroups and on rational Borel pairs. `U₀^F` is a Sylow `p`-subgroup of
`G^F` of order `q^N`, the Bruhat decomposition `G^F = ⊔_{w ∈ W^F} B₀^F ẇ B₀^F` holds with
`|B₀^F ẇ B₀^F| = |B₀^F| q^{ℓ(w)}`, where `ℓ` is the length function of `W` (not that of the Coxeter group
`W^F`), and hence `|G^F| = q^N |T₀^F| Σ_{w∈W^F} q^{ℓ(w)}`.

*Route.* Existence and transitivity from Lang's theorem and fixed-coset lifting (ReductiveGroups 7a; 9E for
Steinberg endomorphisms) applied to `G` acting on the variety of Borel pairs, whose stabilisers are
connected; the Bruhat decomposition of `G` (ReductiveGroups Layer 7) is `F`-stable, and fixed-coset lifting
applied to each double coset gives the rational one; `|U_w^F| = q^{ℓ(w)}` for the product `U_w` of the root
subgroups that `w` makes negative, an `F`-stable connected unipotent group of dimension `ℓ(w)`. For split
`G` and the `q`-Frobenius the decomposition is the Tits system of ReductiveGroups Layer 7 at `k = 𝔽_q`, which
is consumed and not re-proved.

*Needs:* ReductiveGroups Layers 7, 7a, 7b; for Steinberg endomorphisms Layer 9E.

**Checks.**
- `GL₂(𝔽_q)`: `q·(q−1)²·(1 + q) = q(q−1)(q²−1)`, Mathlib's `Matrix.card_GL_field` at `n = 2`.
- `GL_n(𝔽_q)`: `q^{n(n−1)/2} (q−1)^n Σ_{w∈S_n} q^{ℓ(w)} = q^{n(n−1)/2} ψ_n(q)`, by the identity
  `Σ_{w∈S_n} q^{ℓ(w)} = ψ_n(q)/(q−1)^n`.
- `U₃(𝔽_q)` (the unitary group of a Hermitian form on `𝔽_{q²}³`): `W = S₃`, `W^F = {1, w₀}` with
  `ℓ(w₀) = 3`, and `|G^F| = q³(q+1)(q²−1)·(1 + q³) = q³(q+1)(q²−1)(q³+1)`; reading `ℓ` in `W^F` (where
  `ℓ(w₀) = 1`) would give the wrong order.

### 0.2 Rational maximal tori and twisted classes of the Weyl group

For `g ∈ G` with `g⁻¹F(g) ∈ N_G(T₀)` of image `w ∈ W`, the torus `T = gT₀g⁻¹` is rational; it is said to
be **of type `w`**, and `ad(g⁻¹)` identifies `T^F` with `T₀^{wF} = {t ∈ T₀ : ẇF(t)ẇ⁻¹ = t}`. Every
rational maximal torus is of some type, and `T ↦ type` is a bijection from `G^F`-classes of rational
maximal tori to `F`-classes of `W` (`w ∼ v⁻¹wF(v)`); `N_{G^F}(T)/T^F ≅ {v ∈ W : v⁻¹wF(v) = w}`. Write
`T_w` for a torus of type `w`.

*Route.* Conjugacy of maximal tori (ReductiveGroups Layer 7) and Lang's theorem for `G` give `g` with
`g⁻¹F(g) ∈ N_G(T₀)`; Lang's theorem for `T₀` and fixed-coset lifting for `N_G(T₀) ⊃ T₀` show that the
`F`-class of the image is well defined and that every `F`-class occurs.

*Needs:* 0.1; ReductiveGroups Layers 7, 7a.

**Checks.**
- `GL₂`: two classes, `T₁^F ≅ (𝔽_q^×)²` of order `(q−1)²` and `T_s^F ≅ 𝔽_{q²}^×` of order `q² − 1`; they
  are geometrically conjugate and not rationally conjugate (their orders differ).
- The convention `g⁻¹F(g)` and the formula `ẇF(t)ẇ⁻¹ = t` are tested on `GL₂` with `w = s`: `T₀^{sF}`
  consists of `diag(a, a^q)` with `a^{q²} = a`, a cyclic group of order `q² − 1`.

### 0.3 Semisimple and regular elements

Every `g ∈ G^F` is uniquely `g = su = us` with `s` semisimple of order prime to `p` and `u` unipotent of
`p`-power order, both powers of `g`. For semisimple `s ∈ G^F`, `C_G(s)°` is a rational connected reductive
subgroup containing every maximal torus through `s`; `s` is **regular** when `C_G(s)°` is a maximal torus (Steinberg
1965, 2.7 (a) and 2.11, p. 53, stated there for semisimple `G`).
For `G = GL_n`, `C_G(s)` is connected; if the characteristic polynomial of `s` is `∏_f f^{m_f}` over
monic irreducible `f ≠ X`, then `C_{G^F}(s) ≅ ∏_f GL_{m_f}(𝔽_{q^{deg f}})`; `s` is regular exactly when the
characteristic polynomial is squarefree, and `C_{G^F}(s) ≅ 𝔽_{q^n}^×` (with `s` regular and its
centraliser a torus that is anisotropic modulo the centre of `GL_n`) exactly when it is irreducible — such `s`
are called **regular elliptic**.

*Route.* Jordan decomposition in the finite group (powers of `g`). Reductivity of `C_G(s)°`, its generation
by a maximal torus through `s` and the root subgroups `U_α` with `α(s) = 1`, and the fact that it contains
every maximal torus through `s`, are OrbitMeasuresOnAdelicGroups §4.1; it is rational
because `F(C_G(s)°) = C_G(F(s))° = C_G(s)°`. For `GL_n`, `s` makes `𝔽_q^n` a module over
`𝔽_q[X]/(charpoly)`, which splits by the Chinese remainder theorem; the centraliser is the unit group of
the endomorphism ring of that module.

*Needs:* ReductiveGroups Layers 4, 7; OrbitMeasuresOnAdelicGroups §4.1 (centralisers of semisimple elements);
Mathlib `Matrix.charpoly`,
`Polynomial.Monic`, `Irreducible`, `Squarefree`.

### 0.4 Conjugacy classes of `GL_n(𝔽_q)`

Conjugacy classes of `GL_n(𝔽_q)` correspond to functions `μ` from monic irreducible polynomials `f ≠ X`
to partitions, with `Σ_f deg(f)·|μ(f)| = n`: the semisimple part has characteristic polynomial
`∏_f f^{|μ(f)|}` and the unipotent part, inside `∏_f GL_{|μ(f)|}(𝔽_{q^{deg f}})`, has Jordan type `μ(f)` in
each factor. Unipotent classes correspond to partitions of `n`. The number `k_n(q)` of classes satisfies
`Σ_{n≥0} k_n(q) t^n = ∏_{i≥1} (1 − t^i)/(1 − q t^i)`, and the number of semisimple classes is
`q^n − q^{n−1}` for `n ≥ 1`. The number of `GL_n(𝔽_q)`-classes of pairs `(T, θ)` of a rational maximal
torus `T` and a character `θ` of `T^F` is also `k_n(q)`; the same holds for every Levi subgroup
`∏_i GL_{n_i}`, class by class.

*Route.* 0.3 and Jordan normal form in each factor. For the generating function: monic polynomials with
nonzero constant term have generating function `(1 − t)/(1 − qt) = ∏_d (1 − t^d)^{−N*_q(d)}` (unique
factorisation), `N*_q(d)` the number of monic irreducible `f ≠ X` of degree `d`; the class count is
`∏_d (Σ_μ t^{d|μ|})^{N*_q(d)} = ∏_d ∏_{i≥1} (1 − t^{di})^{−N*_q(d)}`, and substituting `t ↦ t^i` in the
first identity gives the product. Pairs: by 0.2 a pair is, up to conjugacy, a cycle type `τ ⊢ n` with a
character `θ = ⊠_i θ_i` of `∏_i 𝔽_{q^{τ_i}}^×` up to the normaliser `∏_k (ℤ/k ≀ S_{a_k})` (`a_k` the number of
parts equal to `k`, `ℤ/k` acting by Frobenius); a character of `𝔽_{q^r}^×` whose Frobenius orbit has size
`d ∣ r` factors through the norm to `𝔽_{q^d}^×` (by Hilbert 90 the kernel of the norm is `{x^{q^d−1}}`),
so the classes of pairs correspond to a label `m` of degree `n` (Conventions) with a partition `ρ_O ⊢ m(O)`
for each orbit, the parts of `ρ_O` being the `τ_i/|O|` with `θ_i` over `O`. The Frobenius orbits of size `d`
in `L` number `N*_q(d)` (labelled form), so the count is `∏_O Σ_k p(k)t^{|O|k} = ∏_d∏_{i≥1}(1 − t^{di})^{−N*_q(d)}`,
the product above.

*Needs:* 0.2, 0.3; SchurWeyl Layer 0 (partitions).

**Checks.**
- `k₁ = q − 1`, `k₂ = q² − 1`, `k₃ = q³ − q`, read off the product to order `t³`.
- `GL₂(𝔽_q)`: `q − 1` central, `½(q−1)(q−2)` split semisimple, `q − 1` non-semisimple and `½q(q−1)`
  elliptic classes, matching CharacterTheory Layer 9's four families.
- Pairs for `n = 2`: `T₁` with the `½(q−1)q` unordered pairs `{α, β}` of characters of `𝔽_q^×` (`α = β` allowed),
  and `T_s` with the `½(q²−1−(q−1)) + (q−1) = ½(q² + q − 2)` Frobenius orbits of characters of `𝔽_{q²}^×`: in all
  `q² − 1 = k₂(q)`.

### 0.5 Regular unipotent elements

A unipotent `u ∈ G` is **regular** if `dim C_G(u) = dim T₀`. Let `U₀* ⊂ U₀` be the subgroup generated by the root
subgroups of the non-simple positive roots, so that `U₀/U₀* ≅ ∏_{α simple} U_α` (this quotient and its rational
points are treated in 2.1). (a) An element `u ∈ U₀` is regular iff its image in `U₀/U₀*` has every component
nontrivial; for `u ∈ U₀^F` this means that its image in every factor `U_O^F` of `(U₀/U₀*)^F ≅ ∏_O U_O^F`, `O`
running over the `F`-orbits of simple roots, is nontrivial, `F` permuting the components along an orbit. In
particular `G^F` contains regular unipotent elements. (b) A regular unipotent element lies in exactly one
Borel subgroup. (c) If a regular unipotent `u` lies in a parabolic subgroup `P = L ⋉ U_P`, its image in
`P/U_P ≅ L` is regular unipotent in `L`. For `GL_n` the regular unipotent elements are those with one Jordan
block, the class `u_{(n)}` of the Conventions. Over `ℂ` the Lie-algebra form of (a) and (b), for regular nilpotent elements
(simple-component criterion in `𝔫`, unique Borel subalgebra), is FormalConnectionsOpers §4.3.

*Route.* (a), (b) are Steinberg's theorems on regular elements (Steinberg 1965, Lemma 3.2 and Theorem 3.3,
pp. 54–55, stated there for semisimple `G`): for `u ∈ U₀` with all
simple components nontrivial, on a Bruhat cell `U₀ẇB₀/B₀ ≅ U_{w}` (ReductiveGroups Layer 7) the commutator
relations (Layers 7C, 9) show that `u` fixes a point only for `w = 1`, so `B₀` is the only Borel subgroup
containing `u`; `C_G(u)` then lies in `B₀`, and the same commutator computation gives `dim C_{B₀}(u) = dim T₀`
when the components are nontrivial and a larger dimension otherwise. Rationality: `F` maps the component in
`U_α` to the component in `U_{F(α)}`, so for `F`-fixed `u` the components along an orbit are all trivial or all
nontrivial. (c) The simple roots of `L` (for the Borel subgroup `B₀ ∩ L` after conjugating `P` to a standard
one) are simple roots of `G`, and the image of `u` in `L` has the same components on them. For `GL_n` all three
are direct: `u − 1` has rank `n − 1` iff `u` has one Jordan block, the kernels of `(u − 1)^j` form the only
`u`-stable complete flag, and a block-triangular `u` with one Jordan block has one Jordan block in each
diagonal block.

*Needs:* 0.1; ReductiveGroups Layers 7, 7a, 7C, 9.

**Checks.**
- `GL₂`: `[[1, a], [0, 1]]` with `a ≠ 0` is regular and fixes only the line `⟨e₁⟩`; `a = 0` gives `1`, whose
  centraliser is all of `GL₂`.
- `SU₃(𝔽_q)` (2.1's Check): the regular unipotent elements of `U₀^F` are those with nonzero image in
  `(U₀/U₀*)^F ≅ (𝔽_{q²}, +)`, `q³ − q` of them.

### Examples

The Bruhat decomposition gives `|GL₂(𝔽_q)| = q·(q−1)²·(1 + q) = q(q−1)(q²−1)`, and for the unitary group `U₃(𝔽_q)`, with `ℓ` the length function of `W` and not of `W^F`, `|G^F| = q³(q+1)(q²−1)(q³+1)` (0.1). `GL₂` has two classes of rational maximal tori, `T₁^F ≅ (𝔽_q^×)²` and `T_s^F ≅ 𝔽_{q²}^×`, geometrically but not rationally conjugate (0.2). The class numbers of `GL_n(𝔽_q)` begin `k₁ = q − 1`, `k₂ = q² − 1`, `k₃ = q³ − q`, and the `q² − 1` classes of `GL₂(𝔽_q)` are `q − 1` central, `½(q−1)(q−2)` split semisimple, `q − 1` non-semisimple and `½q(q−1)` elliptic ones (0.4). In `GL₂`, `[[1, a], [0, 1]]` with `a ≠ 0` is regular unipotent and fixes only the line `⟨e₁⟩` (0.5).

### Dependencies

ReductiveGroups Layers 4, 7, 7a, 7b, 7C, 9 and 9E; OrbitMeasuresOnAdelicGroups §4.1 (centralisers of semisimple elements, 0.3); SchurWeyl Layer 0 (partitions, 0.4); Mathlib's `Matrix.charpoly`, `Polynomial.Monic`, `Irreducible` and `Squarefree`.

## Layer 1: Harish-Chandra theory

### 1.0 Transitivity of Harish-Chandra functors

Let `Q = M ⋉ V` be a rational parabolic subgroup with rational Levi complement `M`, and `P_M = L ⋉ U_M` a
rational parabolic subgroup of `M` with rational Levi complement `L`. Then `P = P_M ⋉ V` is a rational
parabolic subgroup of `G` with Levi complement `L` and unipotent radical `U_M V`, every rational parabolic
subgroup of `G` contained in `Q` arises in this way (with `P_M = P ∩ M`), and there are natural isomorphisms
`R_{M⊂Q}^G ∘ R_{L⊂P_M}^M ≅ R_{L⊂P}^G` and `*R_{L⊂P_M}^M ∘ *R_{M⊂Q}^G ≅ *R_{L⊂P}^G`.

*Route.* `P_M V` contains `B_M V` for a Borel subgroup `B_M` of `M`, which is a Borel subgroup of `G`, so it is
parabolic (ReductiveGroups Layer 7: a smooth closed subgroup containing a parabolic is parabolic); `U_M V`
is a normal connected unipotent subgroup with reductive quotient `L`, hence the unipotent radical
(ReductiveGroups 7b), and all pieces are `F`-stable. For the functors use ReductiveGroups 7c's adapter
`R_{L⊂P}^G = Ind_{P^F}^{G^F} ∘ Inf_{L^F}^{P^F}`: since `P^F = P_M^F V^F` with `V^F` normal in `Q^F`,
`Inf_{M^F}^{Q^F} ∘ Ind_{P_M^F}^{M^F} ≅ Ind_{P^F}^{Q^F} ∘ Inf_{P_M^F}^{P^F}` (one double coset in the Mackey
decomposition), and induction in stages (InductionRestriction Layer 0) gives the first isomorphism. The
second is its adjoint, or directly `(N^{V^F})^{U_M^F} = N^{(U_M V)^F}` with `(U_M V)^F = U_M^F V^F`.

*Needs:* ReductiveGroups Layers 7, 7b, 7c; InductionRestriction Layer 0.

**Checks.**
- `GL₃`, `Q = P_{(2,1)}`, `P_M = B ∩ GL₂`: `R_{GL₂×GL₁}^{GL₃}(Ind_{B₂}^{GL₂} 1 ⊠ 1) = Ind_{B₃}^{GL₃} 1`, of
  degree `(q²+q+1)(q+1)`, the number of complete flags in `𝔽_q³`.

### 1.1 Cuspidal representations

An irreducible representation `π` of `G^F` is **cuspidal** if `*R_L^G(π) = 0` for every proper rational
Levi subgroup `L`, equivalently `π^{U_P^F} = 0` for every proper rational parabolic subgroup `P`. It is
enough to test maximal proper rational parabolic subgroups. Cuspidality is preserved by passing to the
contragredient and by twisting with a linear character `χ` of `G^F` that is trivial on `U₀^F`; for a linear
character this condition is equivalent to triviality on all unipotent elements and to `χ` having order prime
to `p`, and every `α∘det` on `GL_n(𝔽_q)` satisfies it. Every irreducible representation of a torus is
cuspidal.

*Route.* The invariants description of `*R` (ReductiveGroups 7c); if `P ⊂ Q` then `U_Q ⊂ U_P`, so
`π^{U_P^F} ⊂ π^{U_Q^F}` and a nonzero invariant for `P` gives one for every rational parabolic containing it.
Duality commutes with taking `U_P^F`-invariants, and so does twisting by a linear character trivial on `U_P^F`.
The condition on `χ`: the unipotent elements of `G^F` are its `p`-elements (0.3), each conjugate into the Sylow
`p`-subgroup `U₀^F` (0.1), and every `U_P^F` consists of unipotent elements; so `χ` is trivial on `U₀^F` iff it is
trivial on all unipotent elements, and then it is trivial on every `U_P^F`. A linear character of order
prime to `p` is `1` at every `p`-element; conversely, if `χ` is trivial on `p`-elements, write `χ = χ_pχ_{p′}`
with `χ_p`, `χ_{p′}` powers of `χ` of `p`-power and prime-to-`p` order: `χ_p` is trivial on the `p`-elements and on
the elements of order prime to `p`, hence on every `g = su` (0.3), and `χ = χ_{p′}`. For `GL_n`, `det u = 1` for
unipotent `u`.

*Needs:* 0.1, 0.3; ReductiveGroups 7b, 7c.

**Checks.**
- The trivial representation of `GL_n(𝔽_q)`, `n ≥ 2`, is not cuspidal; the cuspidal representations of
  `GL₂(𝔽_q)` are exactly the `½q(q−1)` representations `TauCeti.GL2Cuspidal θ` (`θ^q ≠ θ`) of CharacterTheory Layer 9, of degree
  `q − 1`. For `q ≥ 3` they are the irreducible representations of degree `q − 1`; for `q = 2` the degree does not single them
  out: the trivial and the sign character of `GL₂(𝔽₂) ≅ S₃` both have degree `1 = q − 1`, and only the sign is cuspidal (next Check).
- The condition on `χ` cannot be dropped: `GL₂(𝔽₂)` permutes the three nonzero vectors of `𝔽₂²`, which identifies
  it with `S₃`, and `U^F` is generated by a transposition. The sign character `sgn` has no `U^F`-fixed vector, so it
  is cuspidal (it is the cuspidal character of degree `q − 1 = 1`), while `sgn ⊗ sgn` is the trivial character, which
  is not; `sgn` has order `2 = p` and is not of the form `α∘det` (`𝔽₂^×` is trivial). For `GL₂(𝔽₃)` and `α₀` the
  quadratic character of `𝔽₃^×`, twisting by `α₀∘det` permutes the three cuspidal characters of degree `2`: in the
  notation of 5.2, with `θ` a generator of the character group of `𝔽_9^×` and `α₀∘N = θ⁴`, it exchanges `σ_θ` and
  `σ_{θ⁵}` and fixes `σ_{θ²}`.
- Testing only the Borel subgroup is not enough: for `GL₃(𝔽_q)`, the constituents of
  `R_{GL₂×GL₁}^{GL₃}(σ ⊠ α)` with `σ` cuspidal have no `U^F`-fixed vector and are not cuspidal.

### 1.2 Harish-Chandra series and cuspidal support

For every irreducible `π` there is a pair `(L, σ)`, `L` a rational Levi subgroup and `σ` an irreducible
cuspidal representation of `L^F`, with `π` a constituent of `R_L^G(σ)`; the pair is unique up to
`G^F`-conjugacy (the **cuspidal support** of `π`). Consequently the **Harish-Chandra series**
`{π : π is a constituent of R_L^G(σ)}`, over `G^F`-classes of cuspidal pairs, partition the irreducible
representations of `G^F`.

*Route.* Existence: let `L` be minimal among rational Levi subgroups with `*R_L^G(π) ≠ 0`; every constituent
`τ` of `*R_L^G(π)` is cuspidal, since `*R_{L'}^L τ ≠ 0` for a proper `L' ⊂ L` would give `*R_{L'}^G π ≠ 0` by
1.0; adjunction makes `π` a constituent of `R_L^G τ`. Uniqueness: by the Mackey formula (ReductiveGroups
7d), `⟨R_L^G σ, R_M^G τ⟩` is a sum over `L^F\S(L,M)^F/M^F` of pairings of Harish-Chandra restrictions to
proper Levi subgroups of `L` and `M` unless `xMx⁻¹ = L`; cuspidality of `σ, τ` kills all other terms, so the
pairing vanishes unless the pairs are conjugate.

*Needs:* 1.0, 1.1; ReductiveGroups 7c–7e (9E for Steinberg endomorphisms); CharacterTheory Layer 3.

### 1.3 Endomorphism algebras

For a cuspidal pair `(L, σ)` put `W_{G^F}(L, σ) = {n ∈ N_{G^F}(L) : ^nσ ≅ σ}/L^F`. Then
`dim End_{G^F}(R_L^G σ) = |W_{G^F}(L, σ)|`, and `π ↦ Hom_{G^F}(π, R_L^G σ)` is a bijection from the
series of `(L, σ)` to the irreducible modules of `End_{G^F}(R_L^G σ)`, under which the multiplicity of `π`
is the dimension of its module.

*Route.* The Mackey formula as in 1.2, with only `x ∈ N_{G^F}(L)` contributing `⟨σ, ^xσ⟩`; the bijection
is the double-centraliser theorem for the semisimple module `R_L^G σ` (SemisimpleAlgebras via
CharacterTheory Layer 2).

*Needs:* 1.2; RepresentationTheory/CharacterTheory Layers 2–3.

### 1.4 The general linear group: Hecke algebras of type A

Let `L = ∏_O GL_{d_O}^{m_O}` (block diagonal, the blocks of each `O` consecutive) and
`σ = ⊠_O σ_O^{⊠ m_O}` with `σ_O` pairwise non-isomorphic irreducible cuspidal representations of
`GL_{d_O}(𝔽_q)`. Then `W_{G^F}(L, σ) ≅ ∏_O S_{m_O}`, realised by the block permutation matrices. For each
`O`, `σ_O × σ_O` has exactly two constituents, each of multiplicity one; call them `π_−`, `π_+` with
`deg π_− ≤ deg π_+`, and let `a_O = deg π_+/deg π_− ≥ 1`. For a simple reflection `s` of the factor `S_{m_O}` let `M ⊃ L`
be the Levi subgroup in which the two `σ_O`-blocks exchanged by `s` form one block `GL_{2d_O}`, so that
`R_L^M σ = (σ_O × σ_O) ⊠ σ'` with `σ'` the product of the other blocks, and let `T_s^M` be the endomorphism of `R_L^M σ`
that acts by `a_O` on `π_− ⊠ σ'` and by `−1` on `π_+ ⊠ σ'`; it is supported on `P_M^F ṡ P_M^F` (`P_M = P ∩ M`).
`End(R_L^G σ)` has a basis `T_w`, `w ∈ ∏_O S_{m_O}`, with `T_w` supported on the double coset `P^F ẇ P^F`,
`T_w T_{w'} = T_{ww'}` when lengths add, and `(T_s − a_O)(T_s + 1) = 0` for each simple reflection `s` of the factor
`S_{m_O}`; each `T_s` is `±R_M^G(T_s^M)`, and `T_s = R_M^G(T_s^M)` for every `s` when `a_O ≠ 1` (the relation then
singles out one multiple of the operators supported on `P^F ṡ P^F`). Thus `End(R_L^G σ) ≅ ⊗_O H_{m_O}(a_O)`, where
`H_m(a)` is the Iwahori–Hecke algebra of `S_m` with these
relations, the algebra of TypeAHeckeAlgebras §1.1 at the parameter `√a` after the substitution `T_s ↦ √a·T_s`; it
is split semisimple, and by 1.3 the constituents of `R_L^G σ` correspond to its simple modules, with
multiplicity the dimension. For `L = T` and `σ = 1` this is Iwahori's theorem `End(Ind_{B^F}^{G^F} 1) ≅ H_n(q)`.
The value `a_O = q^{d_O}`, and with it `T_s = R_M^G(T_s^M)` for every `s`, is 2.4(d).

*Route.* `W_{G^F}(L, σ)`: the normaliser of `L` permutes the blocks, and a permutation preserves `σ` iff it
preserves each `σ_O`-block family, the `σ_O` being pairwise non-isomorphic. The block permutation matrices
form a subgroup `S ⊂ N_{G^F}(L)` permuting the tensor factors of `σ`, which gives an extension of `σ` to
`L^F ⋊ S` and with it operators `B_w` supported on `P^F ẇ P^F` (1.3's dimension count gives the basis); when
lengths add, `P^F ẇ P^F ẇ' P^F = P^F ẇẇ' P^F` with unique factorisation of the unipotent parts, so
`B_w B_{w'} = B_{ww'}`, which is the braid relations. *The quadratic relation* is computed inside `M` and transported.
By 1.3 for `M` (with `W_{M^F}(L, σ) = {1, s}`), `End_M(R_L^M σ)` is two-dimensional, spanned by `1` and an operator `T^M`
supported on `P_M^F ṡ P_M^F`; so `R_L^M σ = (σ_O × σ_O) ⊠ σ'` has exactly two constituents `π_− ⊠ σ'`, `π_+ ⊠ σ'`, each of
multiplicity one, and `T^M`, not a scalar, has two distinct eigenvalues `λ_−`, `λ_+`, one on each. The trace of `T^M` on
`R_L^M σ` is zero (its kernel vanishes on the identity double coset), so `λ_−·deg π_− + λ_+·deg π_+ = 0`, that is
`λ_− = −a_O λ_+`; rescaled so that `λ_+ = −1`, the operator `T_s^M` of the statement satisfies `(T_s^M − a_O)(T_s^M + 1) = 0`.
By 1.0, `R_L^G σ = R_M^G(R_L^M σ)`, and the functor `R_M^G = Ind_{Q^F}^{G^F} ∘ Inf_{M^F}^{Q^F}` (`Q = MV` the parabolic subgroup
with Levi `M` containing `P`, `P = P_M V`) maps `End_M(R_L^M σ)` into `End_G(R_L^G σ)` as an algebra homomorphism: in the
description of intertwiners by kernels it inflates the kernel to `Q^F` and extends it by zero, so `R_M^G(T_s^M)` is supported
on `P_M^F ṡ P_M^F V^F = P^F ṡ P^F` (`ṡ ∈ M` normalises `V`) and is a nonzero multiple `c_s·B_s` of the basis operator of `s`
(the operators supported on one double coset form a line, 1.3), which satisfies the quadratic relation. Two simple reflections
`s, s'` of `S_{m_O}` satisfy `s' = wsw⁻¹` with `ℓ(ws) = ℓ(s'w) = ℓ(w) + 1`, so `B_{s'}B_w = B_{s'w} = B_{ws} = B_wB_s` with `B_w` invertible
(a product of the `B_r` of simple reflections `r`, each a root of a quadratic polynomial with nonzero roots): `B_s` and `B_{s'}`
have the same minimal polynomial, and `{a_O/c_s, −1/c_s} = {a_O/c_{s'}, −1/c_{s'}}`. Fix one `s₀` in each factor and put
`c_O = c_{s₀}`: then every `T_{s'} := c_OB_{s'}` has the roots `a_O` and `−1`, and the basis `T_w = ∏_O c_O^{ℓ_O(w)}B_w` (`ℓ_O(w)` the
length of the `S_{m_O}`-component of `w`) keeps `T_wT_{w'} = T_{ww'}` when lengths add and satisfies the quadratic relations.
Comparing the two root sets, `c_{s'} = c_O`, or `a_O/c_{s'} = −1/c_O` and `−1/c_{s'} = a_O/c_O`, which forces `a_O² = 1` and
`c_{s'} = −c_O`; so `T_s = ±R_M^G(T_s^M)`, with the sign `+` for every `s` when `a_O ≠ 1`. No value of `a_O` enters this argument: when `a_O = 1`
the roots `1`, `−1` do not distinguish an operator from its negative, and the identification of every `T_s` with
`R_M^G(T_s^M)` follows once `a_O ≠ 1`, which is 2.4(d). The eigenspaces of `T_s` on
all of `R_L^G σ` are sums of several constituents, and the trace of `T_s` there does not give their degrees (Checks). Split
semisimplicity: the criterion of TypeAHeckeAlgebras §1.2, `∏_r (1 + a + ⋯ + a^{r−1}) ≠ 0`, holds for `a > 0`.

*Needs:* 1.0, 1.3; ReductiveGroups 7b–7d; TypeAHeckeAlgebras §§1.1, 1.2.

**Checks.**
- `GL₂`, `σ = 1`: `Ind_{B^F}^{G^F} 1 = 1 + St`, of degrees `1` and `q`, so `a = q`; `T_s` acts by `q` on the
  `B`-fixed line of the trivial constituent (the index `[B^F s B^F : B^F] = q`) and by `−1` on the
  Steinberg constituent, so `(T_s − q)(T_s + 1) = 0` and not `(T_s − 1)(T_s + 1) = 0`.
- `GL₃`, `σ = 1`: three constituents, with multiplicities `1, 2, 1` (the dimensions of the simple modules
  of `H₃(q)`) and degrees `1, q(q+1), q³`; `1 + 2q(q+1) + q³ = (q²+q+1)(q+1)`, the number of complete flags.
- The trace argument must be made inside `M`: for `GL₃(𝔽₂)`, `σ = 1`, `T_{s₁}` on the `21` complete flags sums over the two
  other flags with the same plane; it satisfies `(T_{s₁} − 2)(T_{s₁} + 1) = 0` with eigenvalue multiplicities `7` and `14`, while
  the constituents have degrees `1, 6, 8`; reading the two eigenspace dimensions of the whole representation as constituent
  degrees fails. In `M = GL₂ × GL₁`, `R_T^M 1 = (1 + St₂) ⊠ 1` has degrees `1, 2`, `T^M_{s₁}` has eigenvalues `2, −1`, and
  `2·1 − 1·2 = 0`.
- The constant `c_O` need not be `1`: for `GL₃(𝔽₃)`, `L = T` and `σ = χ ⊠ χ ⊠ χ` with `χ` the quadratic character of `𝔽₃^×`, the
  operators `B_{s₁}`, `B_{s₂}` built from the permutation of the tensor factors both have eigenvalues `−3` and `1`, with
  multiplicities `13` and `39`, so `c_{s₁} = c_{s₂} = −1` and `T_{s_i} = −B_{s_i}`; `B_{s₁}B_{s₂}B_{s₁} = B_{s₂}B_{s₁}B_{s₂}` (by computation).

### Examples

`R_{GL₂×GL₁}^{GL₃}(Ind_{B₂}^{GL₂} 1 ⊠ 1) = Ind_{B₃}^{GL₃} 1`, of degree `(q²+q+1)(q+1)`, the number of complete flags in `𝔽_q³` (1.0). The cuspidal representations of `GL₂(𝔽_q)` are the `½q(q−1)` representations `TauCeti.GL2Cuspidal θ` of degree `q − 1`; for `GL₂(𝔽₂) ≅ S₃` the sign character is cuspidal and the trivial character is not (1.1). For `GL₂`, `Ind_{B^F}^{G^F} 1 = 1 + St` with `(T_s − q)(T_s + 1) = 0`, and for `GL₃` the three constituents of `Ind_{B^F}^{G^F} 1` have multiplicities `1, 2, 1` and degrees `1, q(q+1), q³` (1.4).

### Dependencies

Layer 0; ReductiveGroups Layers 7, 7b, 7c, 7d, 7e and 9E; InductionRestriction Layer 0; RepresentationTheory/CharacterTheory Layers 2–3; TypeAHeckeAlgebras §§1.1 and 1.2.

## Layer 2: Gelfand–Graev representations, the mirabolic subgroup and Bessel-type induced representations

### 2.1 Regular characters and Gelfand–Graev representations

Let `U₀*` be the subgroup of `U₀` generated by the root subgroups of the non-simple positive roots; it is a
rational connected normal subgroup with abelian quotient `U₀/U₀* ≅ ∏_{α simple} U_α`. For an `F`-orbit `O`
of simple roots let `U_O` be the image of `∏_{α∈O} U_α` in `U₀/U₀*`, so that
`U₀^F/U₀*^F ≅ (U₀/U₀*)^F ≅ ∏_O U_O^F`. A character `ψ` of `U₀^F` is **regular** if it is trivial on `U₀*^F`
and nontrivial on `U_O^F` for every `F`-orbit `O` of simple roots. The **Gelfand–Graev representation** is
`Γ_ψ = Ind_{U₀^F}^{G^F} ψ`, of degree `|G^F|_{p'}`. For `GL_n` the regular characters are
`u ↦ ψ₀(Σ_i a_i u_{i,i+1})` with every `a_i ≠ 0`, and `T^F` permutes them transitively.

*Route.* The commutator relations among root subgroups (ReductiveGroups Layers 7C and 9) give
`[U_α, U_β] ⊂ ∏_{i,j>0} U_{iα+jβ}`, so `U₀*` is normal with abelian quotient; Lang's theorem for the
connected group `U₀*` (ReductiveGroups 7a) gives `U₀^F/U₀*^F ≅ (U₀/U₀*)^F`, and `F` permutes the factors
`U_α` along the orbits. The degree is `|G^F|/|U₀^F| = |G^F|_{p'}` by 0.1. For `GL_n`, conjugation by
`diag(t₁, …, t_n)` multiplies `a_i` by `t_i/t_{i+1}`.

*Needs:* 0.1; ReductiveGroups Layers 7a, 7C, 9; InductionRestriction Layer 2.

**Checks.**
- `SU₃(𝔽_q)` (type `²A₂`): the two simple roots `α, β` form one `F`-orbit and `α + β` is a root, so
  `U_αU_β` is not a subgroup (`[U_α, U_β] = U_{α+β}`); `U₀^F` has order `q³`, `U₀*^F = U_{α+β}^F` has order `q`
  and `(U₀/U₀*)^F ≅ (𝔽_{q²}, +)`. The regular characters are the `q² − 1` characters of `U₀^F` trivial on
  `U₀*^F` and nontrivial: a definition "nontrivial on `(U_αU_β)^F`" cannot be read.

### 2.2 Multiplicity one

For every connected reductive `G` and every regular character `ψ`, the algebra `End_{G^F}(Γ_ψ)` is
commutative; equivalently `Γ_ψ` is multiplicity free. If `Z(G)` is connected, all regular characters are
`T₀^F`-conjugate and `Γ_ψ` does not depend on `ψ` up to isomorphism.

*Route.* `End(Γ_ψ)` is the algebra `H_ψ` of the functions `f` on `G^F` with `f(ugu') = ψ(u)f(g)ψ(u')` for
`u, u' ∈ U₀^F`, under convolution (Frobenius reciprocity and Mackey, InductionRestriction Layers 2–4); it has a basis
`f_n`, indexed by the double cosets `U₀^F n U₀^F` that support such a function, `f_n` supported on `U₀^F n U₀^F` with
`f_n(n) = 1` for a chosen representative `n`. *Gelfand's trick, with representatives.* Let `ι` be an anti-automorphism of
`G^F` with `ι(U₀^F) = U₀^F`, `ψ∘ι = ψ` on `U₀^F` and `ι(n) = n` for one representative `n` of each supporting double coset.
Then `f ↦ f∘ι` maps `H_ψ` to itself (`(f∘ι)(ugu') = ψ(u')f(ι(g))ψ(u)`), reverses convolution, and fixes each `f_n`: `f_n∘ι` is
supported on `U₀^F n U₀^F` and takes the value `f_n(ι(n)) = 1` at `n`. So `f ↦ f∘ι` is the identity, and
`f₁ ∗ f₂ = (f₁ ∗ f₂)∘ι = (f₂∘ι) ∗ (f₁∘ι) = f₂ ∗ f₁`. That `ι` preserves `ψ` and maps each supporting double coset to itself
is not enough: `f_n∘ι = f_n(ι(n))·f_n` with `f_n(ι(n)) = ψ(u)ψ(u')` for `ι(n) = unu'`, which can be `−1` (Checks).
*`G = GL_n`*, `ψ` the standard regular character (every regular character is `T^F`-conjugate to it, 2.1);
this case is in [FormalProof], `Formalism/PadicSubsetSums/StableGradedCounts/MemBesselSetZeroIffUpperTriangular.lean`
(`Formalism.IrreducibleCountingLemmas.GaloisIrreducibility.gelfand_graev_multiplicity_one`),
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/WhittakerSpaceDimFiniteGLLeOne.lean`
(`GlobalTheory.FinGL.GGFree.whDim_le_one`). Every
`U^F`-double coset contains exactly one monomial matrix `n` (Bruhat decomposition, 0.1). Write `n e_j = t_j e_{σ(j)}` and
`τ = σ⁻¹`; then, for `x_{ab}(c) = 1 + cE_{ab}`, `n⁻¹x_{ab}(c)n = x_{τ(a)τ(b)}(c·t_{τ(b)}/t_{τ(a)})`, and `U^F ∩ nU^Fn⁻¹` is the product of the root subgroups
`x_{ab}`, `a < b`, with `τ(a) < τ(b)`. A biequivariant function is supported on `U^F n U^F` iff `ψ(u) = ψ(n⁻¹un)` on this
group, that is (`ψ₀` nontrivial) iff for all `a < b` with `τ(a) < τ(b)`: `b = a + 1` exactly when `τ(b) = τ(a) + 1`, and
then `t_{τ(b)} = t_{τ(a)}`. So `τ` is increasing by steps of one on each maximal run of consecutive ascents, the images of
the runs are intervals, each lying above the next (at the descent between two runs the maximum of one image exceeds the
minimum of the next), and `t` is constant on each image: `n` is block anti-diagonal with scalar blocks `c_1·1, …, c_s·1`
(block sizes a composition of `n`, `c_i ∈ 𝔽_q^×`), and every such `n` supports; there are `(q − 1)q^{n−1}` of them. Take
`ι(g) = J gᵀ J` with `J` the antidiagonal permutation matrix: an anti-automorphism with `ι(u)_{ij} = u_{n+1−j, n+1−i}`, so
`ι(U^F) = U^F` and `ψ∘ι = ψ` (the superdiagonal is permuted), and `ι(n) = n` for every block anti-diagonal matrix with scalar
blocks (the reflection `(i, j) ↦ (n+1−j, n+1−i)` maps each block to itself and its diagonal to itself). Hence `H_ψ` is
commutative. For a product of general linear groups (the Levi subgroups `∏_i GL_{λ_i}`) `H_ψ` is the tensor product of the
algebras of the factors. *General `G`:* the commutativity of `H_ψ` for every connected reductive `G` with a Steinberg
endomorphism and every regular `ψ` is Steinberg's theorem (Steinberg, *Lectures on Chevalley groups*; Digne–Michel); proof
not given here beyond general linear groups and their products. The conjugacy statement: the `T₀^F`-orbits of
regular characters are counted by the `F`-coinvariants of `Z(G)/Z(G)°`.

*Needs:* 2.1; 0.1; InductionRestriction Layers 2–4; ReductiveGroups Layer 7 (Bruhat decomposition).

**Checks.**
- `SL₂(𝔽_q)`, `q` odd (centre `μ₂`, not connected): there are two non-isomorphic Gelfand–Graev
  representations, each of degree `q² − 1` and multiplicity free: Steinberg, the `(q−3)/2` principal
  series of degree `q + 1`, the `(q−1)/2` cuspidal representations of degree `q − 1`, and one of each of
  the two pairs of degree `(q+1)/2` and `(q−1)/2`; their degrees sum to `q² − 1`. Connectedness of the
  centre is needed for uniqueness, not for multiplicity one.
- `GL₂(𝔽_q)`: `Γ_ψ` has degree `(q−1)(q²−1)` and contains each of the `q − 1` twists of the Steinberg
  character, the `½(q−1)(q−2)` irreducible principal series and the `½q(q−1)` cuspidal characters once:
  `(q−1)q + ½(q−1)(q−2)(q+1) + ½q(q−1)(q−1) = (q−1)(q²−1)`.
- `GL₂(𝔽_q)`, the route: the supporting monomial representatives are the `q − 1` scalars `a·1` and the `(q − 1)²` matrices
  `[[0, a], [b, 0]]`, `q² − q` in all (the number of generic constituents above); `ι([[a, b], [c, d]]) = [[d, b], [c, a]]` fixes
  each of them. By computation, for `GL₂(𝔽_p)`, `p = 2, 3, 5, 7`, and `GL₃(𝔽_p)`, `p = 2, 3`: the supporting monomials are exactly
  the block anti-diagonal ones with scalar blocks (`p^n − p^{n−1}` of them), `ι` fixes every basis function, and all structure
  constants commute.
- Fixing each supporting double coset is not enough. In the dihedral group of order `8` with `U = ⟨r²⟩` (its centre) and
  `ψ(r²) = −1`, inversion is an anti-automorphism preserving `ψ` and every double coset `gU`, but `r⁻¹ = r·r²`, so
  `f(r⁻¹) = −f(r)` for the function on `rU`; all four double cosets support, and `End(Ind_U ψ) ≅ M₂(ℂ)` is not commutative.

### 2.3 Generic representations

An irreducible `π` is **generic** (for `ψ`) if `Hom_{U₀^F}(π, ψ) ≠ 0`, equivalently if `π` is a
constituent of `Γ_ψ`; then that space is a line (uniqueness of Whittaker functionals). Under a connected
centre the notion does not depend on `ψ`.

*Route.* Frobenius reciprocity (InductionRestriction Layer 2) and 2.2.

*Needs:* 2.2.

### 2.4 Derivatives and the restriction to the mirabolic subgroup (`GL_n`)

Write `P_n = GL_{n−1} ⋉ V_n` with `V_n` the unipotent radical of matrices `[[1_{n−1}, v], [0, 1]]`, and define the exact
functors `Ψ⁻(τ) = τ^{V_n}` to representations of `GL_{n−1}(𝔽_q)` and its left adjoint `Ψ⁺` (inflation). For `n ≥ 2` the
stabiliser in `GL_{n−1}` of the character `v ↦ ψ₀(v_{n−1})` of `V_n` is the mirabolic subgroup `P_{n−1}`; define
`Φ⁻(τ)` = the `(V_n, ψ₀(v_{n−1}))`-isotypic part, a representation of `P_{n−1}(𝔽_q)`, and
`Φ⁺(ρ) = Ind_{P_{n−1}V_n}^{P_n}(ρ ⊗ ψ₀(v_{n−1}))`. For `n = 1`, `P_1 = GL_0 = 1` and `V_1 = 1`, so `Ψ^±` are the identity, and
`V_1` has no nontrivial character: `Φ^±` occur only on `P_m` with `m ≥ 2`.

(a) For `n ≥ 2`, `Ψ⁻Ψ⁺ ≅ 1`, `Φ⁻Φ⁺ ≅ 1`, `Φ⁻Ψ⁺ = 0`, `Ψ⁻Φ⁺ = 0`. For `n ≥ 1` every representation `τ` of `P_n(𝔽_q)` satisfies
`τ ≅ ⊕_{k=1}^n (Φ⁺)^{k−1}Ψ⁺(τ^{(k)})` with the **derivatives** `τ^{(k)} = Ψ⁻(Φ⁻)^{k−1}τ`, representations
of `GL_{n−k}(𝔽_q)` (for `n = 1` the single term `τ = Ψ⁺Ψ⁻τ`); `dim (Φ⁺)^{k−1}Ψ⁺(ρ) = dim ρ·∏_{j=n−k+1}^{n−1}(q^j − 1)`. The representations
`(Φ⁺)^{k−1}Ψ⁺(ρ)`, for `1 ≤ k ≤ n` and `ρ` irreducible of `GL_{n−k}(𝔽_q)`, are irreducible and pairwise
non-isomorphic, and exhaust the irreducible representations of `P_n(𝔽_q)`.
(b) For a representation `π` of `GL_n(𝔽_q)` put `π^{(k)} = (π|_{P_n})^{(k)}`. Then `π^{(k)}` is the space of
`(U_k, ψ)`-coinvariants, on the second factor, of `*R_{GL_{n−k}×GL_k}^{GL_n}(π)`, as a representation of
`GL_{n−k}(𝔽_q)`. For irreducible `π`: `π` is generic iff `π^{(n)} ≠ 0`, and then `π^{(n)}` is
one-dimensional; `π` is cuspidal iff `π|_{P_n} ≅ (Φ⁺)^{n−1}Ψ⁺(1) = Ind_{U^F}^{P_n(𝔽_q)} ψ`. In particular
every cuspidal representation is generic and has degree `ψ_{n−1}(q) = ∏_{i=1}^{n−1}(q^i − 1)`, and every
generic representation has degree at least `ψ_{n−1}(q)`.
(c) Every unipotent element of `GL_n(𝔽_q)` is conjugate into `P_n(𝔽_q)`, and for a cuspidal `π` and `u`
unipotent of Jordan type `μ`, `π(u) = (−1)^{n−ℓ(μ)}∏_{i=1}^{ℓ(μ)−1}(q^i − 1)`, that is
`(−1)^{n−1}∏_{i=1}^{ℓ(μ)−1}(1 − q^i)`.
(d) For an irreducible cuspidal `σ` of `GL_d(𝔽_q)`, `σ × σ` has two constituents, each of multiplicity one: a
generic one of degree `q^d·ψ_{2d−1}(q)/(q^d − 1)` and a non-generic one of degree `ψ_{2d−1}(q)/(q^d − 1)`,
whose restriction to `P_{2d}` is `(Φ⁺)^{d−1}Ψ⁺(σ)`. Hence `a_O = q^{d_O}` in 1.4; as `a_O ≠ 1`, the operators `T_s` there are
the `R_M^G(T_s^M)` for every simple reflection `s`.

*Route.* (a) The finite-field version of Bernstein–Zelevinsky's theory (Gelfand–Kazhdan; Zelevinsky,
Ch. III; the counterpart for `GL_n` of a local field, with the same functors and derivatives `Ψ⁻(Φ⁻)^{k−1}`, is
SmoothRepresentationsOfLocalGroups SR.5.1 *mirabolic-derivatives*, *derivative-exactness*): the exact sequence
`0 → Φ⁺Φ⁻ → 1 → Ψ⁺Ψ⁻ → 0` on representations of `P_n`, split because the groups
are finite, from the decomposition of `τ|_{V_n}` into the `V_n`-invariants and the orbit of nontrivial
characters of `V_n` under `GL_{n−1}`, which `GL_{n−1}(𝔽_q)` permutes transitively with stabiliser `P_{n−1}(𝔽_q)` of index
`q^{n−1} − 1` (so that the stabiliser in `P_n(𝔽_q)` is `P_{n−1}V_n`), for `n ≥ 2`; iterate down to `P_1 = 1`, where `τ = Ψ⁺Ψ⁻τ`
(the index `q^{n−1} − 1` vanishes at `n = 1`, where there is no nontrivial character to stabilise). (b) Unwinding `(Φ⁻)^{k−1}` and `Ψ⁻`, `π^{(k)}` is the space of
coinvariants of the unipotent radical of the parabolic of type `(n−k, k)` (trivial character) times `U_k`
(character `ψ`), which is the stated Whittaker coinvariant of the Harish-Chandra restriction; genericity is
`k = n` with 2.3; cuspidality is the vanishing of all `*R` with `k < n` (1.1). For the criterion by the
mirabolic restriction, by (a) it says that `π^{(k)} = 0` for `k < n` and `π^{(n)}` is a line. If `π` is not
cuspidal, let `(∏_{i≤r} GL_{n_i}, ⊠_i σ_i)`, `r ≥ 2`, be its cuspidal support (1.2): by adjunction and 1.0,
`*R_{GL_{n−n_r}×GL_{n_r}}^{GL_n}(π)` has a constituent `τ ⊠ σ_r`, and `σ_r`, cuspidal of smaller rank, is
generic by induction on `n`, so `π^{(n_r)} ≠ 0` with `n_r < n`. The degree count:
`|P_n(𝔽_q)|/|U^F| = ψ_{n−1}(q)`.
The degree bound for generic representations is stated in [FormalProof] as
`Formalism.L2.SG.GGMirabolic.MirabolicBound` (`Formalism/LocalToGlobal/SiegelLatticeTheory/ClosedLocalOrbits/GGMirabolic.lean`).
(c) A unipotent element fixes a nonzero linear form, hence is conjugate into
`P_n`, and by (b) `π|_{P_n} = ρ_n` with `ρ_k = (Φ⁺)^{k−1}Ψ⁺(1)` on `P_k`. Claim, by induction on `k`: the value
of `ρ_k` at a unipotent `u ∈ P_k` with `ℓ` Jordan blocks (in `GL_k`) is `f_k(ℓ) = (−1)^{k−ℓ}∏_{i=1}^{ℓ−1}(q^i − 1)`;
`ρ₁ = 1`. Write `u = (a, v) ∈ GL_{k−1} ⋉ V_k`. Since `ρ_k = Φ⁺(ρ_{k−1})`, the induced-character formula gives
`ρ_k(u) = Σ_w ψ₀(w(v))·ρ_{k−1}(a_w)`, the sum over the nonzero linear forms `w` on `𝔽_q^{k−1}` with `w∘a = w`,
`a_w` being `a` read in the stabiliser of `w`, a `GL_{k−1}`-conjugate of `P_{k−1}`; so `ρ_{k−1}(a_w) = f_{k−1}(ℓ(a))`
does not depend on `w`. The forms fixed by `a` make up a space of dimension `ℓ(a)` whose annihilator is
`Im(a − 1)`: if `v ∈ Im(a − 1)` the sum is `q^{ℓ(a)} − 1` and `u` has `ℓ(a) + 1` blocks; otherwise the sum is `−1`
and `u` has `ℓ(a)` blocks (`ker(u − 1)` is computed directly). In both cases `ρ_k(u) = f_k(ℓ(u))`. (d) Harish-Chandra restriction of `σ × σ` to `GL_d × GL_d` is `2(σ ⊠ σ)` (Mackey,
ReductiveGroups 7d), one copy in each of the two constituents (1.3: `|W_{G^F}(L, σ⊠σ)| = 2`, the algebra
commutative); `*R_{GL_{2d−k}×GL_k}(σ × σ) = 0` for `0 < k < d` and `d < k < 2d` by the Mackey formula and
cuspidality; so by (b) the derivatives of each constituent vanish except in degrees `d` (equal to `σ`, the
Whittaker coinvariant of `σ` being a line) and `2d`. The top derivatives are counted by dimensions in (a). Put
`B = ψ_{2d−1}(q)/(q^d − 1)`. Then `dim(σ × σ) = [GL_{2d} : P_{(d,d)}]·ψ_{d−1}(q)² = ψ_{2d}(q)/(q^d − 1)² = (q^d + 1)B`; the
two derivatives in degree `d` (one `σ` from each constituent) contribute `2·ψ_{d−1}(q)·∏_{j=d+1}^{2d−1}(q^j − 1) = 2B`; the
remainder `(q^d − 1)B = ψ_{2d−1}(q)` is `dim (σ × σ)^{(2d)}·∏_{j=1}^{2d−1}(q^j − 1)`, so `(σ × σ)^{(2d)}` is a line. As derivatives
are additive, exactly one constituent has a nonzero top derivative, a line: it is generic (by (b)), the other is not.
Their degrees, by (a): `B + ψ_{2d−1}(q) = q^dB` and `B`, so the ratio `a_O` of 1.4 (for `σ_O = σ`, `d_O = d`) is `q^d > 1`, and 1.4 (the case `a_O ≠ 1`)
gives `T_s = R_M^G(T_s^M)` for every simple reflection `s`. This computation uses 1.3, the group `W_{G^F}(L, σ ⊠ σ)` of 1.4 and
(a), (b), none of the statements of 1.4 on the operators `T_s`.

*Needs:* 1.0–1.4; 2.3; InductionRestriction Layers 2–5 (Mackey and Clifford theory); ReductiveGroups 7d.

**Checks.**
- `n = 2`: `P₂ ≅ 𝔽_q ⋊ 𝔽_q^×`; its irreducible representations are the `q − 1` characters (`k = 1`,
  `Ψ⁺` of the characters of `GL₁`) and the one of degree `q − 1` (`k = 2`, `Φ⁺Ψ⁺(1)`), matching
  `(q−1)·1² + (q−1)² = q(q−1) = |P₂(𝔽_q)|`.
- A one-dimensional representation `α∘det` of `GL_n(𝔽_q)`, `n ≥ 2`, has `π^{(1)} = α∘det` on `GL_{n−1}`
  and all higher derivatives zero; it is neither generic nor cuspidal.
- (c) for `GL₂`: a cuspidal character is `q − 1` at `1` and `Σ_{a≠0}ψ₀(a) = −1` at a regular unipotent
  element; for `GL₃`: `(q−1)(q²−1)` at `1`, `−(q−1)` on the class `(2,1)` and `1` at a regular unipotent
  element.
- (d) for `d = 1`, `σ = 1`: the two constituents of `Ind_B 1` of `GL₂` have degrees `1` and `q`.
- (d) for `d = 2`, `q = 2`, `σ` the sign character of `GL₂(𝔽₂) ≅ S₃` (its cuspidal character): `dim(σ × σ) = 35 = (q² + 1)B`
  with `B = 7`, and by computation over `GL₄(𝔽₂)` the induced character has norm `2` and pairs to `1` with `Γ₄`; the
  constituents have degrees `28 = q²B` (generic) and `7`.

### 2.5 The Gelfand–Graev convolution bound (`GL_n`)

Let `γ` be the character of `Γ_ψ` on `G^F = GL_n(𝔽_q)`. Convolution `f ↦ f ∗ γ` on functions on `G^F` is
positive semidefinite and acts on the `π`-isotypic part by `|G^F|·m_π/dim π`, where `m_π ∈ {0, 1}` is the
multiplicity of `π^∨` in `Γ_ψ`. Hence, for every family `(v_x)_{x∈G^F}` in a complex Hilbert space,
`0 ≤ Σ_{x,y} γ(y⁻¹x)⟨v_x, v_y⟩ ≤ γ(1) ∏_{i=1}^{n−1} (1 − q^{−i})^{−1} Σ_x ‖v_x‖²`, with
`γ(1) = |G^F|/|U^F|`; and `∏_{i≥1}(1 − q^{−i})^{−1} ≤ 1 + 3/q` for `q ≥ 3`. For a finite product of
groups `GL_{n_j}(𝔽_{q_j})` the product kernel satisfies the product bound.

*Route.* Convolution by the character of `π` is `|G^F|/dim π` times the central idempotent of `π^∨`
(CharacterTheory §3.5); multiplicity one (2.2) gives `m_π ∈ {0,1}`; generic representations have degree
at least `ψ_{n−1}(q)` (2.4) and `|U^F| = q^{n(n−1)/2}`, so every eigenvalue is at most
`γ(1)·q^{n(n−1)/2}/ψ_{n−1}(q)`. The numerical bound: Euler's pentagonal identity gives
`∏_{i≥1}(1 − x^i) ≥ 1 − x − x²` for `0 ≤ x < 1` (the remaining terms pair into an alternating series with
decreasing terms), and `(1 + 3x)(1 − x − x²) ≥ 1` for `0 ≤ x ≤ 1/3`.

*Needs:* 2.2, 2.4; CharacterTheory §3.5.

**Checks.**
- `n = 1`: `U = 1`, `Γ_ψ` is the regular representation of `𝔽_q^×`, `γ` is `q − 1` at `1` and `0` elsewhere, and both sides of
  the bound equal `(q−1) Σ_x ‖v_x‖²` (the empty product is `1`).
- `q = 2`: `∏_{i=1}^{n−1}(1 − 2^{−i})^{−1}` is `2` for `n = 2` and `8/3 > 1 + 3/2` for `n = 3` (the infinite
  product is about `3.46`): the numerical bound fails from `n = 3`, and the restriction `q ≥ 3` cannot be
  dropped.
- `GL₂(𝔽_q)`: the largest eigenvalue `|G^F|/(q−1)` is attained on the cuspidal characters, and equals
  `γ(1)·q/(q−1) = γ(1)(1 − q^{−1})^{−1}`; the bound is sharp.

### 2.6 Degenerate Gelfand–Graev representations and Harish-Chandra restriction

Let `ψ` be a regular character of `U₀^F` (2.1). For an `F`-stable `J ⊂ S` let `P_J = L_J ⋉ U_{P_J}` be the standard rational
parabolic subgroup with its standard Levi subgroup, `ψ_J` the character of `U₀^F` that agrees with `ψ` on `U_O^F` for the
`F`-orbits `O ⊂ J` and is trivial on `U₀*^F` and on the other `U_O^F`, and `Γ_{ψ,J} = Ind_{U₀^F}^{G^F} ψ_J` the **degenerate
Gelfand–Graev representation**; so `Γ_{ψ,S} = Γ_ψ` and `Γ_{ψ,∅} = Ind_{U₀^F}^{G^F} 1`.
(a) `ψ|_{U₀^F ∩ L_J}` is a regular character of `L_J^F` and `Γ_{ψ,J} ≅ R_{L_J}^G(Γ^{L_J}_{ψ|})`.
(b) `*R_{L_J}^G(Γ_ψ) ≅ Γ^{L_J}_{ψ^J}`, where `ψ^J(u) = ψ(ẇuẇ⁻¹)` for `u ∈ U₀^F ∩ L_J`, `w = w₀w_J` with `w₀`, `w_J` the longest
elements of `W` and of `W_J` and `ẇ ∈ N_{G^F}(T₀)` a representative; `ψ^J` is a regular character of `L_J^F`. Equivalently
`⟨R_{L_J}^G ρ, Γ_ψ⟩ = ⟨ρ, Γ^{L_J}_{ψ^J}⟩` for every class function `ρ` of `L_J^F`. If `Z(G)` is connected, so is `Z(L_J)`, and
`*R_{L_J}^G(Γ) ≅ Γ^{L_J}` for the Gelfand–Graev representations of 2.2.
(c) For `G = GL_n` let `Γ_m` be the Gelfand–Graev representation of `GL_m(𝔽_q)` for the standard regular character
(Conventions), `Γ₀` the trivial representation of the trivial group, and for a composition `λ = (λ₁, …, λ_s)` of `n` let `ψ_λ`
be the character `u ↦ ψ₀(Σ_i u_{i,i+1})` of `U^F`, the sum over the `i` that are not partial sums `λ₁ + ⋯ + λ_j`, and
`Γ_λ = Ind_{U^F}^{G^F} ψ_λ` (the case of (a) in which `J` consists of the `s_i` with `i` not a partial sum). Then
`Γ_λ ≅ Γ_{λ₁} × ⋯ × Γ_{λ_s}`, it depends only on the multiset of parts, `*R_{M_λ}^G(Γ_n) ≅ Γ_{λ₁} ⊠ ⋯ ⊠ Γ_{λ_s}` for
`M_λ = GL_{λ₁} × ⋯ × GL_{λ_s}`, and for every irreducible `χ` the multiplicity `⟨χ, Γ_λ⟩` is the number, counted with
multiplicity, of generic constituents of `*R_{M_λ}^G χ`. For a composition with two parts write `Γ_{(j,n−j)} = Γ_j × Γ_{n−j}`;
`Γ_{(0,n)} = Γ_{(n,0)} = Γ_n`.

*Route.* Rational points are taken after forming products of root subgroups. For a closed set `Ψ ⊂ Φ⁺` (`α, β ∈ Ψ` and
`α + β ∈ Φ` imply `α + β ∈ Ψ`) the product `U_Ψ` of the `U_β`, `β ∈ Ψ`, is a closed connected subgroup by the commutator
relations `[U_α, U_β] ⊂ ∏_{i,j>0}U_{iα+jβ}`, the product map in any order being an isomorphism of varieties (ordered collection
along the height filtration; ReductiveGroups Layers 7C and 9), and `U_Ψ ∩ U_{Ψ′} = U_{Ψ∩Ψ′}` for closed `Ψ, Ψ′` (compare
coordinates in an ordering of `Φ⁺` that begins with `Ψ ∩ Ψ′`, then `Ψ ∖ Ψ′`, then `Ψ′ ∖ Ψ`). If `Ψ` is also `F`-stable, so is
`U_Ψ`, and `U_Ψ^F` is in general not the product of the rational points of the individual root subgroups (for `SU₃`,
Checks). Closedness is needed: in `SU₃` the set `{α, β}` is `F`-stable and `U_αU_β` is not a group (2.1, Checks). The sets
used below are closed: `Φ⁺ ∖ Φ_J`; its intersection with `w⁻¹(Φ⁺)`; `Φ⁺ ∩ w(Φ⁺ ∖ Φ_J)`; and the latter minus `Δ` (a sum of
two roots of height at least two is not simple). (a) `U_{P_J}` is the product of the root
subgroups `U_β`, `β ∈ Φ⁺ ∖ Φ_J`; its image in `U₀/U₀*` is `∏_{α∈Δ∖J}U_α`, so `U_{P_J}^F` maps into
`(∏_{α∈Δ∖J}U_α)^F = ∏_{O⊄J}U_O^F` under `U₀^F → (U₀/U₀*)^F`, and `ψ_J` is trivial on it. `U₀ = (U₀ ∩ L_J) ⋉ U_{P_J}` with
`F`-stable factors gives `U₀^F = (U₀^F ∩ L_J) ⋉ U_{P_J}^F`, so `Ind_{U₀^F}^{P_J^F}ψ_J` is the inflation of
`Ind_{U₀^F∩L_J}^{L_J^F}ψ|`, and ReductiveGroups 7c's adapter `R = Ind ∘ Inf` with induction in stages (InductionRestriction
Layer 0) gives the isomorphism. The simple roots of `L_J` for `B₀ ∩ L_J` are those of `J`; the subgroup `U*_{L}` of
`U₀ ∩ L_J` generated by its non-simple positive root subgroups lies in `U₀*`, and `(U₀ ∩ L_J)/U*_L → U₀/U₀*` is the inclusion of
the factors `∏_{α∈J}U_α`, so `ψ|` is trivial on `U*_L^F` and, by Lang's theorem for the connected `U*_L` (ReductiveGroups 7a;
9E), nontrivial on each `U_O^F`, `O ⊂ J`: it is regular. (b) By 0.1 and `T₀^F ⊂ P_J^F` the double cosets
`U₀^F\G^F/P_J^F` are the `U₀^F ẇ P_J^F` with `w ∈ W^F` of minimal length in `wW_J`, and Mackey's formula (InductionRestriction
Layer 3) gives `(Γ_ψ)|_{P_J^F} = ⊕_w Ind_{P_J^F ∩ ẇ⁻¹U₀^Fẇ}^{P_J^F}(ψ∘ad ẇ)`. As `U_{P_J}^F` is normal in `P_J^F`, the
`U_{P_J}^F`-invariants of a summand vanish unless `ψ∘ad ẇ` is trivial on `U_{P_J}^F ∩ ẇ⁻¹U₀^Fẇ = V^F`, where `V` is the
`F`-stable product of the root subgroups `U_β`, `β ∈ Φ⁺ ∖ Φ_J`, `w(β) > 0`. Its conjugate `V' = ẇVẇ⁻¹` is the product of the
`U_γ` with `γ` in the closed set `Ψ' = Φ⁺ ∩ w(Φ⁺ ∖ Φ_J)`; `V' ∩ U₀*` is the product over `Ψ' ∖ Δ` (connected and `F`-stable),
and `V'/(V' ∩ U₀*) ≅ ∏_{α∈D}U_α` with `D = Δ ∩ w(Φ⁺ ∖ Φ_J)`, an `F`-stable set. By Lang's theorem for `V' ∩ U₀*`, the image of
`V'^F` in `(U₀/U₀*)^F` is `(∏_{α∈D}U_α)^F = ∏_{O⊂D}U_O^F`. As `ψ` is regular, `ψ` is trivial on `V'^F` iff `D = ∅`: no simple root
lies in `w(Φ⁺ ∖ Φ_J)`, that is `w⁻¹(Δ) ⊂ Φ⁻ ∪ Φ_J`. No simple root goes under `w⁻¹`
to `Φ_J⁻` (`w(Φ_J⁻) ⊂ Φ⁻` by minimality), so `w⁻¹(Δ) ⊂ Φ⁻ ∪ Φ_J⁺`, and `(ww_J)⁻¹ = w_Jw⁻¹` sends every simple root to a negative
root (`w_J` maps `Φ_J⁺` to `Φ_J⁻` and permutes `Φ⁻ ∖ Φ_J`): `ww_J = w₀`. Conversely `w₀w_J` is `F`-fixed and minimal in its coset,
so exactly one summand survives. For it the image of `P_J ∩ ẇ⁻¹U₀ẇ` in `L_J` is `U₀ ∩ L_J` (`w(Φ_J⁺) ⊂ Φ⁺`), and `w` maps the
simple roots of `J` to simple roots (`w(α) = −w₀(α′)` with `α′ = −w_J(α) ∈ J` simple), so `ψ^J` is regular; the invariants of
the surviving summand are `Ind_{U₀^F∩L_J}^{L_J^F}ψ^J`. The adjunction form is ReductiveGroups 7c. `Z(G)` is the
diagonalisable group with character group `X(T₀)/ℤΦ`, so it is connected iff `X(T₀)/ℤΦ` has no torsion of order prime to `p`
(for `SL_p` in characteristic `p`, `X(T₀)/ℤΦ ≅ ℤ/p` and the centre is `μ_p`, connected, with trivial group of `k̄`-points); likewise `Z(L_J)` with `X(T₀)/ℤΦ_J`. This group
is an extension of `X(T₀)/ℤΦ` by the free group `ℤΦ/ℤΦ_J` on `Δ ∖ J`, so its torsion injects into that of `X(T₀)/ℤΦ`, and
connectedness of `Z(G)` gives that of `Z(L_J)`; 2.2 for `L_J` removes the dependence on `ψ^J`. (c) From (a), (b) (the centre
of `GL_n` is connected) and ReductiveGroups 7e (the Levi subgroups of two compositions with the same parts are conjugate by a
permutation matrix); the multiplicity by adjunction, `Γ^{M_λ} = ⊠_i Γ_{λ_i}` being multiplicity free with every generic irreducible representation of
`M_λ^F` as a constituent (2.2, 2.3).

*Needs:* 0.1, 2.1–2.3; 1.0; ReductiveGroups 7a, 7b, 7c, 7e, 7C, 9 (9E for Steinberg endomorphisms); InductionRestriction
Layers 0, 3.

**Checks.**
- `SU₃(𝔽_q)` (type `²A₂`, the Check of 2.1), `J = ∅`: `F` exchanges `U_α` and `U_β`, so `U_α^F = U_β^F = 1` and the product of the
  rational points of the three positive root subgroups is `U_{α+β}^F`, of order `q`, on which `ψ` is trivial, while
  `U₀^F ∩ ẇ⁻¹U₀^Fẇ = U₀^F` (`w = 1`, order `q³`) carries `ψ` nontrivially: only `w = w₀` survives, and `*R_T^G(Γ_ψ)` is the regular
  representation of `T^F ≅ 𝔽_{q²}^×`. By computation for `q = 2, 3` (`|G^F| = 216, 6048`): `|U^F| = q³`, `|U_α^F| = |U_β^F| = 1`,
  `|U_{α+β}^F| = q`, and `dim Γ_ψ^{U^F} = q² − 1`; counting the double cosets of `w = 1` as well would give `2(q² − 1)`.
- `GL₂`, `L = T`: `(Γ_ψ)^{U^F}` is the regular representation of `T(𝔽_q)`, of dimension `(q−1)²`: two lines from each of the
  `½(q−1)(q−2)` irreducible principal series, one from each of the `q − 1` twisted Steinberg representations, none from
  the cuspidal ones.
- `SL₂(𝔽_q)`, `q` odd: the Harish-Chandra restriction to `T` of each of the two Gelfand–Graev representations is the
  regular representation of `T^F`, of dimension `q − 1`; (b) does not need a connected centre.
- `⟨Γ_{(1,1)}, Γ₂⟩ = dim Γ₂^{U^F} = (q−1)²` for `GL₂`.

### 2.7 Derivatives of the Gelfand–Graev representation and Bessel-type induced representations (`GL_n`)

Let `G_n = GL_n(𝔽_q)`, `U_n = U(𝔽_q)`, `Γ_n` and `Γ_{(j,n−j)}` as in 2.6(c), and the mirabolic functors and derivatives as
in 2.4.
(a) `⟨Γ_n, Γ_n⟩ = q^n − q^{n−1}` for `n ≥ 1`; it is the number of generic irreducible representations of `G_n`. The derivatives
of the Gelfand–Graev representation are `Γ_n^{(j)} ≅ (q^j − q^{j−1})·Γ_{n−j}` for `1 ≤ j ≤ n`, that is
`Γ_n|_{P_n} ≅ ⊕_{j=1}^n (q^j − q^{j−1})·(Φ⁺)^{j−1}Ψ⁺(Γ_{n−j})`.
(b) (Bessel-type induced representations.) Let `n ≥ 2`, `1 ≤ k ≤ n − 1`, `0 ≤ i ≤ n − k − 1`, `W = {i+1, …, i+k}` (the block),
`c = i + k + 1`, `H_i = {u ∈ U_n : u_{a,c} = 0 for all a ∈ W}`, a subgroup of index `q^k`, and
`ϕ_i(u) = ψ₀(Σ_{a=i+1}^{i+k−1} u_{a,a+1} + Σ_{j=1}^{i−1} u_{j,j+1} + [i ≥ 1]·u_{i,c} + Σ_{j=c}^{n−1} u_{j,j+1})`, a character of `H_i`:
generic on the block, generic along the chain `1 → ⋯ → i → c → c+1 → ⋯ → n`, with no entry joining block and chain. Then
`Ind_{H_i}^{G_n} ϕ_i ≅ Γ_{(k,n−k)} ⊕ ⊕_{j=1}^{k−1} (q^{k−j} − q^{k−j−1})·Γ_{(j,n−j)} ⊕ (q^k − q^{k−1})·Γ_n`,
independently of `i`. Equivalently, for every class function `χ` of `G_n`,
`⟨χ|_{H_i}, ϕ_i⟩ = ⟨χ, Γ_{(k,n−k)}⟩ + Σ_{j=0}^{k−1} (q^{k−j} − q^{k−j−1})·⟨χ, Γ_{(j,n−j)}⟩`.
(c) For every representation `π` of `G_n`, `dim Hom_{H_i}(ϕ_i, π) ≥ (q^k − q^{k−1})·dim Hom_{U_n}(ψ, π)`, with equality iff
`⟨π, Γ_{(j,n−j)}⟩ = 0` for `1 ≤ j ≤ k` (for instance when `π` is cuspidal).
There is no hypothesis on `q` (`q = 2` and non-prime `q` included). *Status.* (b) is the statement of [FormalProof], which
proves the equality of multiplicities for every finite-dimensional representation, at `i = 0` and from each position to the
next. (b) follows from [FormalProof],
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/SymmetricPositionCharMultiplicityEqSumDegenerateStatement.lean`
(`GlobalTheory.T.symmetricPositionCharMultiplicity_eq_sum_degenerateWhittaker`),
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/SymmetricPositionCharMultiplicitySuccEq.lean`
(`GlobalTheory.FinGL.RootExchange.nPos_succ`), `Formalism/LocalToGlobal/Divisibility/DefGroup.lean`
(`Formalism.L2.DIV.symEdge`).
For `i = 0`, `H₀` is the group of unitriangular matrices
whose `(k+1)`-st column vanishes above the diagonal and `ϕ₀ = ψ|_{H₀}`; for `n = k + 2s + 1` and `i = s` the block sits in the
middle of the chain. The position `i = n − k` is excluded: there the group is `U_n` and the representation is `Γ_{(n−k,k)}`.
The character form of (b) is stated as `bessel_pairing_eq`, with `besselCharacter` for `ϕ_i` and
`degenerateCharacter` for the characters `ψ_{(j,n−j)}` of 2.6 (c).

*Route.* (a) Put `a_j = ⟨Γ_j, Γ_j⟩ = dim Hom_{U_j}(Γ_j, ψ)` (Frobenius reciprocity). By 2.4(b) and 2.6(c), `Γ_n^{(j)}` is the space of
`(U_j, ψ)`-coinvariants, on the second factor, of `*R_{GL_{n−j}×GL_j}^{GL_n}(Γ_n) ≅ Γ_{n−j} ⊠ Γ_j`, that is `a_j·Γ_{n−j}`. Count
dimensions in 2.4(a): `dim Γ_m = ψ_m(q)` and `ψ_{n−j}(q)·∏_{l=n−j+1}^{n−1}(q^l − 1) = ψ_{n−1}(q)` for every `j`, so
`ψ_n(q) = ψ_{n−1}(q)·Σ_{j=1}^n a_j`, that is `Σ_{j≤n} a_j = q^n − 1` for every `n`, whence `a_n = q^n − q^{n−1}`. The count of generic
representations is 2.2 and 2.3. (b) *The case `i = 0`.* Put `τ = Ind_{U_k}^{P_{k+1}} ψ = Ind_{G_k}^{P_{k+1}} Γ_k`; then
`Ind_{H₀}^{P_n} ϕ₀ = (Φ⁺)^{n−k−1}(τ)`. For `k = n − 1` this is direct: `H₀ = U_{n−1}` and `ϕ₀ = ψ` on it. For `k ≤ n − 2`,
`H₀ = U_k ⋉ N′` with `N′` the unipotent radical of the parabolic subgroup of type `(k+1, 1, …, 1)`, and `ϕ₀|_{N′}` has
stabiliser `P_{k+1}` in the Levi factor `GL_{k+1}`, which gives the formula. Restricted to the unipotent radical
`V_{k+1}` of `P_{k+1}`, `τ` is `Γ_k` tensor the regular representation of `V_{k+1}`, so `Ψ⁻τ = Γ_k` and `Φ⁻τ = Γ_k|_{P_k}`; by 2.4(a)
and (a), `τ ≅ Ψ⁺(Γ_k) ⊕ ⊕_{j=1}^k (q^j − q^{j−1})·(Φ⁺)^jΨ⁺(Γ_{k−j})`. Finally `Ind_{P_n}^{G_n}(Φ⁺)^{n−m−1}Ψ⁺(ρ) ≅ ρ × Γ_{n−m}` for a
representation `ρ` of `G_m` (induction in stages: the inducing subgroup is `(G_m × U_{n−m}) ⋉ Hom(𝔽_q^{n−m}, 𝔽_q^m)` with the
character `ρ ⊗ ψ`), which gives (b) for `i = 0` with 2.6(c). *Exchange `i − 1 → i`.* After the permutation of coordinates that
puts `i + k` in front of the block, the pair `(H_{i−1}, ϕ_{i−1})` becomes `A = {u ∈ U_n : u_{i,a} = 0, a ∈ W}` with the same formula
`ϕ` for the character as `(B, ϕ_B) = (H_i, ϕ_i)`. Both are characters (`(uu′)_{i,c} = u_{i,c} + u′_{i,c} + Σ_{a∈W}u_{i,a}u′_{a,c}`, and one
factor of each product vanishes), equal on `A ∩ B`. With `X = {1 + Σ_a x_aE_{i,a}} ⊂ B` and `Y = {1 + Σ_a y_aE_{a,c}} ⊂ A` one has
`U_n = Y·B`, and for `y ∈ Y ∖ {1}`, `x ∈ X`: `y⁻¹xy = x·(1 + (Σ_a x_ay_a)E_{i,c}) ∈ B` with `ϕ_B(x) = 1`, so
`ϕ_B(y⁻¹xy) = ψ₀(Σ_a x_ay_a)`, nontrivial for a suitable `x`. By Mackey's irreducibility criterion `Ind_B^{U_n}ϕ_B` is irreducible
of degree `q^k`; the double coset of `1` gives a nonzero map from `Ind_A^{U_n}ϕ_A`, of the same degree, which is therefore an
isomorphism; induce to `G_n`. (c) Every multiplicity `⟨π, Γ_{(j,n−j)}⟩` is non-negative, the coefficients in (b) of the
`Γ_{(j,n−j)}`, `1 ≤ j ≤ k`, are positive, and `⟨π, Γ_{(j,n−j)}⟩ = 0` for `1 ≤ j < n` when `π` is cuspidal (2.6(c), 1.1).

*Needs:* 2.2–2.4, 2.6; 1.0, 1.1; InductionRestriction Layers 0, 2–4.

**Checks.**
- `n = 2`, `k = 1`: `H₀ = 1` and (b) reads `ℂ[GL₂(𝔽_q)] ≅ Ind_{U^F}^{G^F}1 ⊕ (q−1)·Γ₂`, of degree `q(q−1)(q²−1)`; (a) for `n = 2` is
  the count `(q−1) + ½(q−1)(q−2) + ½q(q−1) = q² − q` of 2.2's Check.
- Degrees in (b): `1 + Σ_{j<k}(q^{k−j} − q^{k−j−1}) = q^k = [U_n : H_i]` copies of a representation of degree `ψ_n(q) = [G_n : U_n]`.
- Multiplicities for `GL₂`, `k = 1`, by type (`χ∘det`, twisted Steinberg, irreducible principal series, cuspidal): `1, q, q + 1, q − 1`, each `(q−1)⟨χ, Γ₂⟩ + ⟨χ, Γ_{(1,1)}⟩`. For `GL₃`, `k = 2`, the cuspidal characters give `q² − q`, the characters
  `σ × α` with `σ` cuspidal of `GL₂` give `q²`, the irreducible principal series `q² + 2q`, the twisted Steinberg characters `q²`,
  the one-dimensional characters `0`.
- The entry `(i, c)` is part of the definition: with the chain cut after `i` (no entry `(i, c)`, `i ≥ 1`) the cuspidal
  characters would have multiplicity `0`.

### 2.8 Multiplicities of the Bessel-type characters in Harish-Chandra induced cuspidal representations (`GL_n`)

Let `n ≥ 2`, `1 ≤ k ≤ n − 1`, `0 ≤ i ≤ n − k − 1` and `(H_i, ϕ_i)` as in 2.7(b); let `L = GL_{d_1} × ⋯ × GL_{d_t}` be a standard Levi
subgroup (`d_1 + ⋯ + d_t = n`), `σ = σ_1 ⊠ ⋯ ⊠ σ_t` an irreducible cuspidal representation of `L(𝔽_q)` (the `σ_l` need not be
distinct), and `c_j = #{I ⊂ {1, …, t} : Σ_{l∈I} d_l = j}`.
(a) `⟨R_L^G σ, Γ_{(j,n−j)}⟩ = c_j` for `0 ≤ j ≤ n`, and the multiplicity `m(σ) = dim Hom_{H_i}(ϕ_i, R_L^G σ)` is
`m(σ) = c_k + Σ_{j=0}^{k−1}(q^{k−j} − q^{k−j−1})·c_j`.
(b) `q^k(1 − q^{−1}) ≤ m(σ) ≤ q^k∏_{l=1}^t(1 + q^{−d_l}) ≤ q^k(1 + q^{−1})^n`, and if `n ≤ q` then `m(σ) ≤ q^k(1 + (2n − 1)/q)`.
(c) (Several fields.) Let `(𝔽_{q_v})_{v∈V}` be `s` finite fields, `g > 0` a real number with `q_v ≥ g` for all `v` (only the bounds
involving `s/g` and `sn/g` use `g`), and for each `v` let `(H_{i_v}, ϕ_{i_v})` in
`GL_n(𝔽_{q_v})` be as in 2.7(b) with the same `n` and `k`, and `(L_v, σ_v)` a cuspidal pair as above, `L_v = ∏_l GL_{d_{v,l}}`. The
multiplicity `m` of `⊠_v ϕ_{i_v}` in `⊠_v R_{L_v}^G σ_v` satisfies, with `n̄ = ∏_v q_v^k`,
`∏_v(1 − q_v^{−1}) ≤ m/n̄ ≤ ∏_v∏_l(1 + q_v^{−d_{v,l}})`, hence `1 − s/g ≤ m/n̄ ≤ e^{sn/g}`. *The form of the formal proof.*
Consequently, if `2sn ≤ g`, then `(1 − δ)·n̄ ≤ m ≤ (1 + δ)·n̄` with `δ = 4sn/g`; this is the form with the constants of
[FormalProof] (there `s = 2f` and the statement reads: if `4f·n ≤ g`, then `|m − n̄| ≤ (8f·n/g)·n̄`). The bounds above give
more, by `e^x ≤ 1 + 2x` on `[0, 1]`: the same inequalities with `δ = 2sn/g` as soon as `sn ≤ g`; this sharper form is this
roadmap's own estimate, an elementary consequence of (a), and is not used by [FormalProof].
The bounds concern the whole Harish-Chandra induced representation `R_L^G σ`, not its constituents.

*Status.* (a), (b) and the first form of (c) are the statements of [FormalProof], for every finite field and every position
`0 ≤ i ≤ n − k − 1`; the bound `q^k(1 + (2n − 1)/q)` is stated there, with the lower bound, under `n ≤ q`.
(a): [FormalProof],
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/DegenerateWhittakerDimParabolicInductionCuspidalStatement.lean`
(`GlobalTheory.T.degenerateWhittakerDim_parabolicInduction_cuspidal`),
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/SymmetricPositionCharMultiplicityParabolicInduct.lean`
(`GlobalTheory.FinGL.nPos_parInd`);
(b) follows from [FormalProof],
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/SumNumBlockSetsMulGammaTwoSidedBounds.lean`
(`GlobalTheory.FinGL.sum_numBlockSets_mul_gamma_two_sided_bounds`), and is stated there as
`GlobalTheory.FinGL.MultSharpPf.PlaceBound` (`Development/AbelianVarietyTheory/Proofs/DivisorProofs/MultSharpOfPlaceBound.lean`);
the product bounds of (c) follow from [FormalProof],
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/MultSharpOfPlaceBound.lean`
(`GlobalTheory.FinGL.MultSharpPf.levelMult_ofLocal`).

*Route.* (a) By the Mackey formula (ReductiveGroups 7d) and cuspidality of `σ`, `*R_{M}^G R_L^G σ` for `M = GL_j × GL_{n−j}` is the
sum, over the subsets `I` with `Σ_{l∈I} d_l = j` (the double cosets `W_M\W/W_L` with `wLw⁻¹ ⊂ M`), of
`R^{GL_j}(⊠_{l∈I}σ_l) ⊠ R^{GL_{n−j}}(⊠_{l∉I}σ_l)`, the blocks keeping their order. A Harish-Chandra induced cuspidal representation
`R_{L′}^{G′}σ′` of a general linear group has exactly one generic constituent, with multiplicity one:
`⟨R_{L′}^{G′}σ′, Γ^{G′}⟩ = ⟨σ′, Γ^{L′}⟩ = ∏_l ⟨σ′_l, Γ_{d′_l}⟩ = 1` by 2.6(b), and because cuspidal representations are generic
(2.4(b)) and Gelfand–Graev representations are multiplicity free (2.2). With 2.6(c) this gives `c_j`, and 2.7(b) gives `m(σ)`.
(b) `c_0 = 1` and `c_j ≥ 0` give the lower bound. For the upper, `q^{k−j} − q^{k−j−1} ≤ q^{k−j}` and
`Σ_{j≤k} c_jq^{−j} ≤ Σ_{I} q^{−Σ_{l∈I}d_l} = ∏_l(1 + q^{−d_l}) ≤ (1 + q^{−1})^n`; for `n ≤ q`,
`(1 + q^{−1})^n − 1 − n/q = Σ_{r≥2} C(n, r)q^{−r} ≤ (n(n−1)/q²)·Σ_{r≥2}1/r! ≤ (n − 1)/q`, using `C(n, r) ≤ n(n−1)n^{r−2}/r!`.
(c) The multiplicity of a product is the product of the multiplicities, so (b) at each `v` gives the product bounds. Then
`∏_v(1 − q_v^{−1}) ≥ 1 − Σ_v q_v^{−1} ≥ 1 − s/g`, and `1 + x^d ≤ (1 + x)^d` gives `∏_l(1 + q_v^{−d_{v,l}}) ≤ (1 + q_v^{−1})^n ≤ e^{n/g}`.
If `sn ≤ g`, then `1 − s/g ≥ 1 − δ` and `e^{sn/g} ≤ 1 + 2sn/g`, as `e^x ≤ 1 + 2x` for `0 ≤ x ≤ 1`.

*Needs:* 2.2, 2.4, 2.6, 2.7; 1.1; ReductiveGroups 7d.

**Checks.**
- Rank two: `n = 2`, `k = 1`, `i = 0`, `H₀ = 1`: `m(σ) = dim R_L^Gσ`, which is `q + 1` for `L = T` (`c_1 = 2`) and `q − 1` for `L = G`
  (`c_1 = 0`); `n̄ = q`, the deviation is exactly `1`, and the bounds of (b) are `q − 1 ≤ m(σ) ≤ q + 2 + q^{−1}`.
- `GL₃`, `k = 2`: `L = T` gives `c = (1, 3, 3, 1)` and `m = q² + 2q` (also when the three characters coincide, where
  `R_T^G σ` is reducible); `L = GL₂ × GL₁` gives `m = q²`; `L = G` gives `m = q² − q`.
- The bounds fail for constituents: for `n ≥ 3`, `α∘det ⊂ R_T^G(α ⊠ ⋯ ⊠ α)` has multiplicity `0` in `Ind_{H_i}^{G_n}ϕ_i`, because
  `α∘det` is trivial on `U_n` while `ϕ_i`, a function of `n − 2` matrix entries, is nontrivial. For `n = 2` (`H₀ = 1`) the
  multiplicity is `1`, still below the lower bound `q − 1` when `q ≥ 3`.
- The hypothesis `n ≤ q` of the last bound of (b) is needed: for `q = 2`, `n = 7`, `k = 3`, `L = T` (`c_j = C(7, j)`),
  `m(σ) = 35 + 4 + 14 + 21 = 74 > 60 = 2³(1 + 13/2)`, while `q^k(1 + q^{−1})^n = 8·(3/2)^7 ≈ 136.7`.
- With `s = 2f` fields and `n = r`, the first form of (c) is the deviation `δ = 8fr/g` under `4fr ≤ g`, the statement of
  [FormalProof]; the sharper form gives `δ = 4fr/g` under `2fr ≤ g`.

### Examples

For `GL₂(𝔽_q)`, `Γ_ψ` has degree `(q−1)(q²−1)` and contains each of the `q − 1` twisted Steinberg characters, the `½(q−1)(q−2)` irreducible principal series and the `½q(q−1)` cuspidal characters once; for `SL₂(𝔽_q)`, `q` odd, there are two non-isomorphic Gelfand–Graev representations, each multiplicity free (2.2). `P₂(𝔽_q) ≅ 𝔽_q ⋊ 𝔽_q^×` has the `q − 1` characters and one irreducible representation of degree `q − 1`, and a cuspidal character of `GL₃(𝔽_q)` takes the values `(q−1)(q²−1)`, `−(q−1)` and `1` at `1`, on the unipotent class `(2,1)` and at a regular unipotent element (2.4). For `n = 2`, `k = 1`, the group `H₀` is trivial and 2.7 (b) reads `ℂ[GL₂(𝔽_q)] ≅ Ind_{U^F}^{G^F}1 ⊕ (q−1)·Γ₂` (2.7). For `GL₃` and `k = 2` the multiplicity of the Bessel-type character in `R_L^G σ` is `q² + 2q`, `q²` and `q² − q` for `L = T`, `GL₂ × GL₁` and `G` (2.8).

### Dependencies

Layers 0 and 1; ReductiveGroups Layers 7, 7a, 7b, 7c, 7d, 7e, 7C, 9 and 9E; InductionRestriction Layers 0, 2–5 (Mackey and Clifford theory); RepresentationTheory/CharacterTheory §3.5.

## Layer 3: Lefschetz numbers of finite-order automorphisms

Throughout, `X` is a quasi-projective scheme over `k̄` (every variety of Layer 4 is one), `ℓ ≠ p`, and
`H^i_c(X) = H^i_c(X, ℚ̄_ℓ)` is the compactly supported cohomology of EtaleCohomologyFoundations §F.2.5,
rationalised (§F.4.5) and extended to `ℚ̄_ℓ`; it is finite dimensional and vanishes outside
`[0, 2 dim X]` (§F.3). A group acting on `X` by `k̄`-automorphisms acts on `H^i_c(X)` on the left by
`γ ↦ (γ⁻¹)^*`. Closed, open and locally closed subschemes, fixed-point schemes, finite products and the
quotients of 3.2(c) are again quasi-projective. The statements are made for the individual groups `H^i_c(X)`
as modules over the groups acting (3.2(a)–(c), 3.4(a), (c)), for the complexes `RΓ_c(X, ℤ/ℓ^ν)` along a free action
(3.2(d)) and for Lefschetz numbers; Deligne–Lusztig theory
(Layer 4) uses them and nothing else from ℓ-adic cohomology. The module forms enter the disjointness of Lusztig series
in 4.8, the triviality of the action of connected groups (3.4(a), used in 3.4(b) and 4.5(c)) and the description of the
cohomology of `Y_U` as an induced module in 4.5(a).

### 3.1 Lefschetz numbers: integrality and independence of `ℓ`

For an automorphism `g` of finite order, `L(g, X) = Σ_i (−1)^i tr(g | H^i_c(X))` is a rational integer,
independent of `ℓ` and of `ι`, and `L(g, X) = L(g⁻¹, X)`. If `X`, `g` are defined over `𝔽_{q'}` with
`q'`-Frobenius `F'` commuting with `g`, then for every `m ≥ 1` the set `X^{gF'^m}` is finite,
`|X^{gF'^m}| = Σ_i (−1)^i tr((gF'^m)^* | H^i_c(X))`, and `L(g, X) = −R(∞)` where
`R(t) = Σ_{m≥1} |X^{gF'^m}| t^m` is a rational function in `ℚ(t)`.

*Route.* Everything is defined over some finite field. `gF'^m` is the Frobenius endomorphism of a twisted
`𝔽_{q'^m}`-form of `X` (Galois descent along the finite cyclic extension cut out by the order of `g`,
effective for quasi-projective `X`), so the rational trace formula
(InverseGaloisAndArithmeticFundamentalGroups §IG.0.T3) gives the fixed-point count. The commuting
operators `g^*` (finite order, semisimple) and `F'^*` have simultaneous eigenvalues `ζ_j μ_j^m`, so
`R(t) = Σ (−1)^{i_j} ζ_j μ_j t/(1 − μ_j t)` and `R(∞) = −Σ (−1)^{i_j} ζ_j = −tr`; `R` has integer Taylor
coefficients and is independent of `ℓ`, so its value at infinity is rational, and it is an algebraic
integer. Equality for `g⁻¹` because a rational trace of a finite-order operator equals its complex
conjugate.

*Needs:* EtaleCohomologyFoundations §§F.2.5, F.3, F.4.5, F.10.1, F.10.2b; InverseGaloisAndArithmeticFundamentalGroups
§IG.0.T3; SchemeAndStackFoundations §1.24 (Galois descent of affine schemes, glued over `⟨g⟩`-stable affine opens as
in 3.2 (c)).

**Checks.**
- `X = 𝔾_m`, `g = 1`: `L = 1 − 1 = 0`, and `|𝔾_m(𝔽_{q^m})| = q^m − 1` gives `R(t) = qt/(1−qt) − t/(1−t)`,
  with `R(∞) = −1 + 1 = 0`.
- `X = 𝔾_m`, `g(x) = x⁻¹`: `g` acts on `H¹_c = ℚ̄_ℓ` by `−1` and on `H²_c` by `+1`, so `L = 2`, the number
  of fixed points `±1` in characteristic `≠ 2` (and `L = 2` also in characteristic 2, where `g` has the one
  fixed point `1`: the formula `L = |X^g|` is false in general).

### 3.2 Additivity, products, quotients and free actions

(a) If `Z ⊂ X` is closed with complement `V`, there is a long exact sequence
`⋯ → H^i_c(V) → H^i_c(X) → H^i_c(Z) → H^{i+1}_c(V) → ⋯`, equivariant for every finite group of automorphisms of
`X` preserving `Z`. Hence `L(g, X) = L(g, Z) + L(g, V)` for `g`-stable `Z`. Call a decomposition of `X` into finitely many
locally closed subschemes `Z_1, …, Z_m` a **filtered stratification** if `Z_1 ∪ ⋯ ∪ Z_j` is closed for every `j`; this holds
when the closure of each piece is a union of pieces (number the pieces so that a piece lying in the closure of another
comes before it), and for the
preimage, under a morphism, of the decomposition of a variety into the finitely many orbits of an algebraic group
(numbered by increasing dimension; the boundary of an orbit is a union of orbits of smaller dimension). For a filtered
stratification into `g`-stable pieces, `L(g, X) = Σ_j L(g, Z_j)`; and if a finite group `Δ` acts on `X` preserving each piece,
an irreducible representation of `Δ` that occurs in no `H^i_c` of any piece occurs in no `H^i_c(X)`.
(b) `H^k_c(X × Y) ≅ ⊕_{i+j=k} H^i_c(X) ⊗ H^j_c(Y)`, compatibly with automorphisms acting factorwise; hence
`L((g, h), X × Y) = L(g, X)·L(h, Y)`.
(c) If a finite group `Γ` acts on `X`, the quotient `π : X → X/Γ` exists, is finite, and `X/Γ` is
quasi-projective; `H^i_c(X/Γ) ≅ H^i_c(X)^Γ`, compatibly with every automorphism of `X` commuting with `Γ`, and
for such an automorphism `g` of finite order `L(g, X/Γ) = |Γ|⁻¹ Σ_{γ∈Γ} L(gγ, X)`.
(d) Let `Γ` act freely on `X`, with quotient map `π : X → X/Γ`, and for `Λ = ℤ/ℓ^ν` (`ν ≥ 1`) regard
`RΓ_c(X, Λ) = RΓ_c(X/Γ, π_*Λ)` as a complex of `Λ[Γ]`-modules through the action of `Γ` on `π_*Λ`. Then it is a perfect
complex of `Λ[Γ]`-modules, its derived reduction to `ℤ/ℓ^μ` (`1 ≤ μ ≤ ν`) is `RΓ_c(X, ℤ/ℓ^μ)`, and the limit
`RΓ_c(X, ℤ_ℓ)` is a perfect complex of `ℤ_ℓ[Γ]`-modules. Consequently `L(γ, X) = 0` for every `γ ∈ Γ` whose order is not a
power of `p`.

*Route.* (a) The localisation triangle of §F.2.5, `j_!j^* → id → i_*i^*`, is natural, so automorphisms preserving
`Z` act compatibly on its long exact cohomology sequence; alternating traces are additive along it. For a filtered
stratification, `Z_m` is open in `X` with closed complement `Z_1 ∪ ⋯ ∪ Z_{m−1}`, itself filtered by the remaining pieces;
induction on `m` gives the sum formula. For the isotypic statement, the isotypic projector of an irreducible
representation of `Δ` is exact on `ℚ̄_ℓ[Δ]`-modules, so the long exact sequences of the same induction carry the vanishing
from the pieces to `X`. The hypothesis cannot be dropped from the route: for two lines `L₁, L₂` meeting at a point `p`,
with points `q_i ∈ L_i ∖ {p}`, the pieces `(L₁ ∖ {p, q₁}) ∪ {q₂}`, `(L₂ ∖ {p, q₂}) ∪ {q₁}`, `{p}` are locally closed and none
of them is open. (b) Künneth with compact supports
(§F.2.7), with field coefficients, in each degree. (c) Existence:
every finite set of points of a quasi-projective scheme lies in an affine open subscheme; for an orbit `Γx`
and such an affine `V ⊃ Γx`, `∩_γ γV` is a `Γ`-stable affine open (an intersection of affines in a separated
scheme), so `X` is covered by `Γ`-stable affines `Spec A`, whose quotients `Spec A^Γ` glue to `X/Γ`, with `π`
finite since `A` is integral over `A^Γ`; the norm `⊗_γ γ^*𝓛` of an ample `𝓛` descends after a power, so `X/Γ`
is quasi-projective (Mumford, *Abelian varieties*, §7; SGA 1, Exp. V, §1). Cohomology:
`π_*ℚ̄_ℓ` has `Γ`-invariants `ℚ̄_ℓ` (check on geometric stalks, where `Γ` permutes the fibre transitively),
and invariants are exact in characteristic zero; an automorphism commuting with `Γ` descends to `X/Γ` and acts
compatibly. (d) For a free action `π` is a finite étale `Γ`-torsor (Mumford, *Abelian varieties*, §7), so `π_*Λ` is
étale-locally the constant sheaf `Λ[Γ]`, a flat sheaf of `Λ[Γ]`-modules, and `π_! = π_*` gives `RΓ_c(X, Λ) = RΓ_c(X/Γ, π_*Λ)`.
EtaleCohomologyFoundations §F.10.4 makes the following argument for a torsor over a smooth affine curve; it is made here
over the quasi-projective base `X/Γ`. For a finitely generated right `Λ[Γ]`-module `N`, the projection comparison
`N ⊗ᴸ_{Λ[Γ]} RΓ_c(X/Γ, π_*Λ) ≅ RΓ_c(X/Γ, N ⊗_{Λ[Γ]} π_*Λ)` holds: both sides are way-out triangulated functors of `N`
(`π_*Λ` is flat and `RΓ_c` has finite cohomological dimension), and the natural map between them is an isomorphism at
`N = Λ[Γ]`. The right side is `RΓ_c` of a constructible sheaf, with finite cohomology in degrees `[0, 2 dim X]` (§F.3). So
`RΓ_c(X, Λ)` has finite cohomology and Tor amplitude in `[0, 2 dim X]`, and over the finite ring `Λ[Γ]` such a complex is
perfect: in a resolution by finitely generated free modules, the cokernel of the differential into degree `0` is flat and
finitely presented, hence projective, and truncating there leaves a bounded projective representative. `N = (ℤ/ℓ^μ)[Γ]`
gives the reductions, and the limit over `ν` (§F.4.5) is perfect over the `ℓ`-adically complete ring `ℤ_ℓ[Γ]`, because
finitely generated projective modules, their maps and homotopies lift along `ℤ/ℓ^{ν+1} → ℤ/ℓ^ν`. The character of a finitely generated projective `ℤ_ℓ[Γ]`-module vanishes at
every `γ` whose order is divisible by `ℓ`: restricted to the cyclic group `C = ⟨γ⟩ = C_ℓ × C_{ℓ'}` it stays
projective, `ℤ_ℓ[C_{ℓ'}]` is a finite product of unramified discrete valuation rings `𝒪_i` (`ℓ ∤ |C_{ℓ'}|`),
so `ℤ_ℓ[C] = ∏_i 𝒪_i[C_ℓ]` is a product of local rings and the module is a sum of copies of the `𝒪_i[C_ℓ]`,
on which `γ` acts by a scalar times a fixed-point-free permutation of the basis `C_ℓ`, with trace zero. The
alternating sum over a bounded projective representative computes `L(γ, X)` (§F.4.5), so choosing `ℓ` a
prime other than `p` dividing the order of `γ` gives `L(γ, X) = 0` by 3.1.

*Needs:* 3.1; EtaleCohomologyFoundations §§0.8, F.0.2 (finite étale torsors), F.2.5, F.2.7, F.3, F.4.5, F.10.4 (the right–left
derived tensor over a group ring on the enhanced module sheaves).

**Checks.**
- (d) cannot drop the condition on the order: `Γ = ℤ/p` acting on `𝔸¹` over `𝔽̄_p` by `x ↦ x + 1` is free, and
  `L(γ, 𝔸¹) = 1` for every `γ` (`H²_c` is the only cohomology and `Γ` acts trivially on it).
- (c) with `X = 𝔾_m`, `Γ = μ₂` acting by `x ↦ −x` (`p ≠ 2`): `X/Γ ≅ 𝔾_m` and `L(1, X/Γ) = ½(L(1, X) + L(−1, X)) = 0`.

### 3.3 The Jordan decomposition formula

If `g = su` with `s` of order prime to `p` and `u` of `p`-power order, both powers of `g`, then
`L(g, X) = L(u, X^s)`.

*Route.* By 3.2(a) it suffices to show `L(g, X ∖ X^s) = 0`. Stratify `X ∖ X^s` into the finitely many
locally closed `g`-stable pieces on which the stabiliser in `⟨g⟩` is a fixed subgroup `H`, numbered by decreasing `|H|`;
this is a filtered stratification, the union of the pieces with `|H| ≥ m` being the closed set `∪_{|H|≥m} X^H`. `⟨g⟩/H` acts
freely on the piece, and the image of `g` there has order divisible by a prime other than `p`, because
`s ∉ H` (no point of the piece is fixed by `s`). 3.2(d) gives zero on each piece. On `X^s`, `s` acts
trivially, so `L(g, X^s) = L(u, X^s)`.

*Needs:* 3.1, 3.2.

### 3.4 Connected groups, tori and affine fibrations

(a) A connected algebraic group acting on `X` acts trivially on every `H^i_c(X)`.
(b) If a torus `S` acts on `X` commuting with `g`, then `L(g, X) = L(g, X^S)`.
(c) If `f : X → Y` is equivariant for automorphisms `g` of `X` and `g'` of `Y`, and Zariski-locally on `Y`
the map `f` is a projection `Y' × 𝔸^d → Y'`, then `H^i_c(X) ≅ H^{i−2d}_c(Y)(−d)` compatibly with `g` and `g'`
(and with every group of such pairs), and `L(g, X) = L(g', Y)`.
(d) A diagonalisable group `D` acting on `X` has only finitely many distinct stabilisers `Stab_D(x)`,
`x ∈ X(k̄)`.

*Route.* (a) Let `pr : H × X → H` be the projection and `φ(h, x) = (h, hx)`, an automorphism of `H × X` over `H`. By base
change for compactly supported direct images (§F.2.4) along `H → Spec k̄`, `R^i pr_! Λ` is the constant sheaf on `H` with
value `H^i_c(X, Λ)` (`Λ = ℤ/ℓ^r`; then pass to `ℚ̄_ℓ`, §F.4.5), and `φ` acts on it by an automorphism whose fibre at a point
`h ∈ H(k̄)` is, again by base change, the action of `h` on `H^i_c(X)` (`φ` restricted to `{h} × X` is `x ↦ hx`). An
endomorphism of a constant sheaf on a connected scheme is constant, so all `h` act as `h = 1`, that is trivially. (The
action and projection maps `H × X → X` are not proper, so they do not induce maps on `H^*_c` to compare: for `H = 𝔾_m`,
`X` a point, `H^0_c(X) ≠ 0` and `H^0_c(H) = 0`.) (d) Noetherian induction on closed subsets `Z ⊂ X`, not required to be
`D`-stable (a disconnected `D` can permute the irreducible components: `μ₂` exchanging two points, `p ≠ 2`, has no
nonempty irreducible stable closed subset). For an irreducible component `Z₁` of `Z` with its reduced structure, the
stabiliser family `S = {(d, x) ∈ D × Z₁ : dx = x}`, the preimage of the diagonal under `(d, x) ↦ (dx, x)`, is a closed subgroup
scheme of `D × Z₁` over `Z₁`, defined whether or not `Z₁` is `D`-stable. By generic flatness it is flat over a dense open
`V₁ ⊂ Z₁`, and a flat closed subgroup scheme of the constant diagonalisable group over a connected reduced base is constant
(rigidity of groups of multiplicative type, SGA 3, Exp. IX–X), so `Stab_D(x)` is constant on `V₁`. Doing this for every
component and removing from `Z` the dense opens `V₁ ∖ (other components)` leaves a proper closed subset, to which the
induction applies. (b) Apply (d) to
`D = S × ⟨s⟩` (`g = su`); choose `t ∈ S` of finite order prime to `p` outside the finitely many proper closed
cosets `{t : st ∈ A}` attached to the stabilisers `A ⊂ S × ⟨s⟩` that do not contain `S` (torsion points of
order prime to `p` are Zariski dense), so that `X^{st}` and `(X^s)^S` have the same `k̄`-points (a point fixed by `st` has a
stabiliser containing `st`, hence `S`, hence `s`), hence the same reduced subscheme; as schemes they can differ (Checks). Then
`L(g, X) = L(gt, X)` by (a), `= L(u, X^{st})` by 3.3, `= L(u, (X^S)^s)` because a Lefschetz number depends only on the
reduced subscheme (3.2(a) for the closed subscheme `Z_red ⊂ Z`, whose complement is empty, gives `L(h, Z) = L(h, Z_red)`),
`= L(g, X^S)` by 3.3 on `X^S`. (c) On each chart `Y′ × 𝔸^d → Y′`,
`Rf_!ℚ̄_ℓ` is concentrated in degree `2d` with `R^{2d}f_!ℚ̄_ℓ ≅ ℚ̄_ℓ(−d)` (`H^*_c(𝔸^d)` and §F.2.7). The smooth trace of
EtaleCohomologyFoundations §0.11, `Rf_!Λ(d)[2d] → Λ` for the smooth morphism `f` with torsion coefficients `Λ = ℤ/ℓ^r`, is
compatible with restriction to open subschemes and with composition, and the trace of an isomorphism is the identity;
so it is defined globally, an automorphism of a chart over `Y′` preserves it, and it is an isomorphism because it is
one on each chart. Passing to the `ℓ`-adic limit and rationalising (§F.4.5) gives `Rf_!ℚ̄_ℓ ≅ ℚ̄_ℓ(−d)[−2d]`, and an
equivariant pair `(g, g′)` preserves the trace (composition with `g` and `g′`), so the resulting isomorphism
`H^i_c(X) ≅ H^{i−2d}_c(Y)(−d)` is compatible with `(g, g′)`.

*Needs:* 3.1, 3.3; EtaleCohomologyFoundations §§0.11, F.2.4, F.2.5, F.2.7, F.4.5.

**Checks.**
- (b): `S = 𝔾_m` acting on `ℙ¹` by scaling, `g = 1`: `L(1, ℙ¹) = 2 = |{0, ∞}| = L(1, (ℙ¹)^S)`.
- (b) gives equality of fixed loci, not of fixed-point schemes: for `p ≠ 2`, `X = {y² = x³} ⊂ 𝔸²` with `S = 𝔾_m` acting by the
  weights `(2, 3)` and `g = s = 1`, the only stabiliser other than `S` is trivial, so `t = −1` is admissible; `X^t` is cut out by
  `2y = 0`, so `X^t = Spec k̄[x]/(x³)`, while `X^S = Spec k̄` is the reduced origin. Both have one point and Lefschetz number `1`.
- (d): `𝔾_m` acting on `𝔸²` with weights `(1, 2)` has the three stabilisers `𝔾_m` (the origin), `μ₂` (the
  second axis minus the origin) and `1`.
- (d) for a disconnected `D`: `μ₂` acting on two points by exchanging them (`p ≠ 2`) has the single stabiliser `1`, found on
  each component `{x}` although no nonempty irreducible closed subset is stable.

### Examples

On `X = 𝔾_m` the identity has Lefschetz number `0`, and the inversion `x ↦ x⁻¹` has Lefschetz number `2` in every characteristic, although in characteristic `2` it has one fixed point (3.1). The group `ℤ/p` acting on `𝔸¹` over `𝔽̄_p` by translation acts freely with Lefschetz numbers `1`, so the condition on the order in 3.2 (d) is needed, and `μ₂` acting on `𝔾_m` by `x ↦ −x` gives `L(1, 𝔾_m/μ₂) = 0` (3.2). `𝔾_m` acting on `ℙ¹` by scaling has `L(1, ℙ¹) = 2 = L(1, (ℙ¹)^{𝔾_m})`, and acting on `𝔸²` with weights `(1, 2)` it has the three stabilisers `𝔾_m`, `μ₂` and `1` (3.4).

### Dependencies

EtaleCohomologyFoundations §§0.8, 0.11, F.0.2, F.2.4, F.2.5, F.2.7, F.3, F.4.5, F.10.1, F.10.2b and F.10.4; InverseGaloisAndArithmeticFundamentalGroups §IG.0.T3; SchemeAndStackFoundations §1.24.

## Layer 4: Deligne–Lusztig induction

### 4.1 Deligne–Lusztig varieties

(a) (The Lang torsor.) The Lang map `L : G → G`, `L(g) = g⁻¹F(g)`, is surjective, étale and finite, and it is a
`G^F`-torsor for left multiplication: `G^F`, the fixed-point subgroup scheme of `F`, is finite and étale (the constant group
on the finite group `G^F`), and `(γ, x) ↦ (γx, x)` is an isomorphism `G^F × G → G ×_{L,G,L} G`. Consequently, for every
locally closed subscheme `Y ⊂ G`, `L⁻¹(Y) → Y` is a `G^F`-torsor, and `L` identifies the quotient `G^F\L⁻¹(Y)` (3.2(c)) with `Y`.
For a torus and the `q`-Frobenius the torsor statement of (a) is FourierDeligneTransform §2.1, written additively
(`L = F − id`); (a) extends it to non-commutative `G` and to Steinberg endomorphisms.
(b) Let `T` be a rational maximal torus, `B = TU ⊃ T` a Borel subgroup (not necessarily rational), and `w` the
relative position of `B` and `F(B)`. The variety
`Y_U = {gU ∈ G/U : g⁻¹F(g) ∈ U·F(U)}` is smooth, quasi-projective and of pure dimension `ℓ(w)`; `G^F` acts
on it by left and `T^F` by right multiplication, and `Y_U → X_B = {gB : g⁻¹F(g) ∈ B·F(B)}` is a
`T^F`-torsor.

*Route.* (a) *Étale.* The differential of `L` at `1` is `dF₁ − 1`. Some power `F^δ` is the `q^δ`-Frobenius of an
`𝔽_{q^δ}`-structure (Conventions), whose comorphism sends a function vanishing at `1` and defined over `𝔽_{q^δ}` to its
`q^δ`-th power, so `d(F^δ)₁ = (dF₁)^δ = 0`: `dF₁` is nilpotent and `dF₁ − 1` is invertible. From `L(hg) = g⁻¹L(h)F(g)`,
`L∘ρ_g = λ_g∘L` with `ρ_g(h) = hg` and `λ_g(x) = g⁻¹xF(g)` automorphisms of the variety `G`, so the differential of `L` is
invertible at every point of `G(k̄)`; a morphism of smooth varieties of the same dimension with this property is étale
(the differential criterion for smooth morphisms; SGA 1, Exp. I–II). *Fibres.* For points with values in a `k̄`-algebra `R`, `x⁻¹F(x) = y⁻¹F(y)` iff
`F(yx⁻¹) = yx⁻¹`, `F` being a homomorphism; so `(γ, x) ↦ (γx, x)` identifies `G^F × G` with `G ×_{L,G,L} G`, where
`G^F = L⁻¹(1)` is the fixed-point scheme. It is étale over `k̄` (a fibre of the étale `L`) with finitely many points
(ReductiveGroups 7a: finiteness of Frobenius-fixed points, applied to `F^δ`), hence the constant finite group.
*Torsor and finiteness.* `L` is surjective (ReductiveGroups 7a; 9E for Steinberg endomorphisms), so étale and surjective,
an fppf covering; after base change along `L` itself it becomes the trivial torsor `G^F × G → G`. So `L` is a `G^F`-torsor
(SchemeAndStackFoundations §1.15). It is affine (`G` is affine), and the quasi-coherent algebra `L_*𝒪_G` becomes finite
locally free of rank `|G^F|` after the faithfully flat base change along `L`, hence is finite locally free (fpqc descent,
SchemeAndStackFoundations §1.1): `L` is finite. *Quotients.* The base change of `L` to `Y` is a `G^F`-torsor
`L⁻¹(Y) → Y`; for an affine open `V ⊂ Y`, `𝒪(V) → 𝒪(L⁻¹V)` is faithfully flat and `𝒪(L⁻¹V) ⊗_{𝒪(V)} 𝒪(L⁻¹V) ≅ ∏_{γ∈G^F}𝒪(L⁻¹V)`,
so the invariants `𝒪(L⁻¹V)^{G^F}`, the equaliser of the two maps to this product, are `𝒪(V)` (faithfully flat descent): the
quotient of 3.2(c) is `Y`. A bijection on geometric points alone would not give this identification (Checks).
(b) `L⁻¹(U·F(U))` is étale over the smooth variety `U·F(U)` (an orbit of `U × F(U)` acting by `(u, v)·x = uxv⁻¹`), and it is
stable under right multiplication by `U` (`L(gu) = u⁻¹L(g)F(u)`); `Y_U` is its image in `G/U`, the quotient by this free
action. The dimension count is the length of `w` by the Bruhat cell of `(B, F(B))`. *The `T^F`-torsor.* Both `B` and `F(B)`
contain `T = F(T)`, so `F(B) = ṅBṅ⁻¹` with `ṅ ∈ N_G(T)`, `F(U) = ṅUṅ⁻¹` and `B·F(B) = U·T·F(U) = BṅBṅ⁻¹`. For `x ∈ B·F(B)` the
*torus coordinate* `τ(x)`, the `a ∈ T` of an expression `x = uav` with `u ∈ U`, `v ∈ F(U)`, is well defined and a morphism
`B·F(B) → T`: write `xṅ = jṅb` with `j ∈ U ∩ ṅU⁻ṅ⁻¹` and `b ∈ B`, uniquely and with a regular inverse (the Bruhat cell,
ReductiveGroups 7C, transported to `(T, B)`; `U⁻` the unipotent radical opposite to `U`); moving the factor of `u` in
`U ∩ ṅUṅ⁻¹` across `ṅ` shows that every expression `x = uav` has `a = ṅb_Tṅ⁻¹`, `b_T` the image of `b` in `B/U = T`. So
`U·F(U) = τ⁻¹(1)`, `τ(uxv) = τ(x)` for `u ∈ U`, `v ∈ F(U)`, and `τ(t⁻¹xF(t)) = τ(x)·t⁻¹F(t)` for `t ∈ T`. As
`(gb)⁻¹F(gb) ∈ B·(B·F(B))·F(B) = B·F(B)` for `b ∈ B`, the preimage of `X_B` under the `T`-torsor `G/U → G/B` is the image `X̃_B` of
`L⁻¹(B·F(B))`, and `φ(gU) = τ(g⁻¹F(g))` is a morphism `X̃_B → T` with `Y_U = φ⁻¹(1)` and `φ(gtU) = φ(gU)·t⁻¹F(t)` for `t ∈ T`. On
an open `V ⊂ X_B` over which `G/U → G/B` has a section `σ_V` (translates of the big cell), `(y, t) ↦ σ_V(y)t` identifies the part of
`X̃_B` over `V` with `V × T`, and the part of `Y_U` with `{(y, t) : t⁻¹F(t) = a(y)⁻¹}`, `a = φ∘σ_V`: the pullback along
`a⁻¹ : V → T` of the Lang map of `T`, which is a `T^F`-torsor by (a) for the torus `T` (with `F|_T`), the right action of `T^F` on
`Y_U` being the action on this pullback. Being a torsor is local on the base, so `Y_U → X_B` is a `T^F`-torsor, and, as in
(a), the quotient `Y_U/T^F` of 3.2(c) is `X_B`.

*Needs:* 0.1, 0.2; 3.2(c); ReductiveGroups Layers 7, 7a, 7C (9E for Steinberg endomorphisms); SchemeAndStackFoundations
§§1.1, 1.15.

**Checks.**
- A bijection on geometric points is not an isomorphism: the absolute Frobenius `x ↦ x^p` of `𝔾_a` is bijective on
  `k̄`-points, with differential `0`. The Lang map of `𝔾_a` for the `q`-Frobenius, `x ↦ x^q − x`, has differential `−1` and is the
  Artin–Schreier `𝔽_q`-torsor; that of `𝔾_m`, `t ↦ t^{q−1}`, is the Kummer `μ_{q−1}`-torsor.
- `dF₁` need not vanish: on `𝔾_a²` in characteristic `2`, `F(x, y) = (y², x)` has `F²` the `2`-Frobenius and `dF₁ = [[0, 0], [1, 0]]`;
  `L(x, y) = (y² − x, x − y)` has invertible differential, `G^F = {(0, 0), (1, 1)}`, and over `𝔽_{2^m}`, `m ≤ 6`, every nonempty fibre
  has two points, differing by an element of `G^F` (by computation).
- `SL₂` over `𝔽₂`: on `SL₂(𝔽_{2^m})`, `m ≤ 4`, `L(x) = L(y)` iff `yx⁻¹ ∈ SL₂(𝔽₂)`, every nonempty fibre has `6` points, and the image
  has `|SL₂(𝔽_{2^m})|/6` elements (by computation).
- (b), by computation on `K`-points: `SL₂` over `𝔽₂` (`K = 𝔽₄, 𝔽₁₆, 𝔽₆₄`) and over `𝔽₃` (`K = 𝔽₈₁`) with `T` the nonsplit torus
  (`g₀⁻¹F(g₀) = [[0, 1], [−1, 0]]`, `T^F ≅ μ_{q+1}`), and `GL₃` over `𝔽₂` (`K = 𝔽₄`) with `g₀⁻¹F(g₀)` the transposition `(12)`, where
  `U ∩ F(U)` has dimension `2` and `x = uav` is not unique: `τ` is well defined, `τ((gb)⁻¹F(gb)) = τ(g⁻¹F(g))·t⁻¹F(t)` for every
  `b = tu ∈ B(K)`, the `K`-points of `Y_U` over each `K`-point of `X_B` are empty or one `T^F`-orbit, the `gtU` with
  `t⁻¹F(t) = τ(g⁻¹F(g))⁻¹`, and `|X_B(K)| = |K| + 1 − (q + 1)` for `SL₂`.

### 4.2 Deligne–Lusztig characters and Green functions

For a character `θ` of `T^F`, the virtual character
`R_T^G(θ)(g) = |T^F|⁻¹ Σ_{t∈T^F} θ(t)⁻¹ L((g, t), Y_U)`, where `(g, t)` acts by `y ↦ g·y·t`, is a virtual
character of `G^F` with values in `ℤ[θ]`; it is the alternating sum of the `θ`-isotypic parts of
`H^i_c(Y_U)` under `T^F`. It does not depend on `ℓ` or on `ι`, and depends on `(T, θ)` only up to
`G^F`-conjugacy (independence of `B ⊃ T` is part of 4.4). The **Green function**
`Q_T^G(u) = R_T^G(1)(u)`, for unipotent `u`, is integer valued and `R_T^G(θ)(u) = Q_T^G(u)` for every `θ`;
`R_T^G(θ)(1)` does not depend on `θ`. For a product, `R^{G₁×G₂}_{T₁×T₂}(θ₁ ⊠ θ₂) = R^{G₁}_{T₁}(θ₁) ⊠ R^{G₂}_{T₂}(θ₂)`.

*Route.* Integrality and independence of `ℓ, ι` from 3.1; virtuality from the decomposition of
`H^i_c(Y_U)` under `G^F × T^F`. On unipotent `u`, `(u, t)` has semisimple part `(1, t)`; `T^F` acts freely
on `Y_U` and its elements have order prime to `p`, so 3.3 and 3.2(d) give `L((u,t), Y_U) = 0` for `t ≠ 1`.
Products: for `B₁ × B₂ ⊃ T₁ × T₂` the variety `Y_{U₁×U₂}` is `Y_{U₁} × Y_{U₂}`, and 3.2(b) factors the Lefschetz numbers.

*Needs:* 4.1; 3.1–3.4; CharacterTheory Layer 3 (virtual characters).

**Checks.**
- If `B` is rational, `Y_U = G^F/U^F` is finite, and `R_T^G(θ) = Ind_{B^F}^{G^F} θ` (inflated through
  `B^F → T^F`): `L((g,t), Y_U)` counts the `xU^F` with `x⁻¹gx ∈ t⁻¹U^F`, so the sum is the induced
  character. With `θ(t)` in place of `θ(t)⁻¹` the formula would give `Ind θ⁻¹`; this pins the convention.
- `G = T`: `Y_U = T^F` and `R_T^T(θ) = θ`.

### 4.3 The character formula

For `g = su ∈ G^F`,
`R_T^G(θ)(su) = |C°(s)^F|⁻¹ Σ_{x ∈ G^F, x⁻¹sx ∈ T} θ(x⁻¹sx)·Q^{C°(s)}_{xTx⁻¹}(u)`, where
`C°(s) = C_G(s)°`. In particular, for regular semisimple `s` with `T' = C°(s)`,
`R_T^G(θ)(s) = Σ_{x ∈ T'^F\{x ∈ G^F : x⁻¹T'x = T}} θ(x⁻¹sx)`, which vanishes unless `T` and `T'` are
`G^F`-conjugate.

*Route.* By 3.3, `L((su, t), Y_U) = L((u, 1), Y_U^{(s,t)})`. A point `gU` is fixed by `(s, t)` iff
`g⁻¹sg ∈ t⁻¹U`; so the fixed-point set is empty unless `t⁻¹` is conjugate to `s`, and it is a disjoint
union, indexed by the `x ∈ G^F` with `x⁻¹sx = t⁻¹` taken modulo `C°(s)^F`, of translates of the
Deligne–Lusztig varieties of `C°(s)` for the tori `xTx⁻¹` (Deligne–Lusztig, Theorem 4.2). Summing over `t`
with the weight `θ(t)⁻¹ = θ(x⁻¹sx)` gives the formula. For regular `s`, `C°(s) = T'` and
`Q^{T'}_{T'}(1) = 1`.

*Needs:* 4.2; 3.3; 0.3.

### 4.4 The inner product formula

Put `N_{G^F}(T, T') = {n ∈ G^F : nTn⁻¹ = T'}` and `W_{G^F}(T, θ) = {n ∈ N_{G^F}(T) : θ(n⁻¹tn) = θ(t) for all t ∈ T^F}/T^F`. Then
`⟨R_T^G(θ), R_{T'}^G(θ')⟩ = |{n ∈ N_{G^F}(T, T')/T^F : θ'(ntn⁻¹) = θ(t) for all t ∈ T^F}|`, for any choice of
Borel subgroups `B ⊃ T`, `B' ⊃ T'` defining the two sides. Hence `R_T^G(θ)` does not depend on `B`,
`R_T^G(θ)` and `R_{T'}^G(θ')` are orthogonal unless `(T, θ)` and `(T', θ')` are `G^F`-conjugate, and
`⟨R_T^G(θ), R_T^G(θ)⟩ = |W_{G^F}(T, θ)|`; `θ` is in **general position** when `W_{G^F}(T, θ) = 1`.

*Route.* (Deligne–Lusztig, Theorem 6.8 and its proof.) *A Lefschetz number.* By 3.1 (`L(h, X) = L(h⁻¹, X)`) and 3.2(b), (c),
`⟨R_T^G(θ), R_{T'}^G(θ')⟩ = |T^F|⁻¹|T'^F|⁻¹ Σ_{t,t'} θ(t)⁻¹θ'(t')·L((t, t'), G^F\(Y_U × Y_{U'}))`, with `(t, t') ∈ T^F × T'^F` acting by
right multiplication on the two factors. Put `Ỹ = {g ∈ G : g⁻¹F(g) ∈ F(U)}` and `Ỹ'` likewise for `U'`; `Ỹ × Ỹ' → Y_U × Y_{U'}` is a
`G^F × T^F × T'^F`-equivariant fibration in affine spaces (route of 4.5(c)), so by 3.4(c) and 3.2(c) the Lefschetz numbers may be
computed on `G^F\(Ỹ × Ỹ')`, which `(g, g') ↦ (g⁻¹F(g), g'⁻¹F(g'), g⁻¹g')` identifies with
`Z = {(x, x', y) ∈ F(U) × F(U') × G : xF(y) = yx'}`, on which `(t, t')` acts by `(x, x', y) ↦ (t⁻¹xt, t'⁻¹x't', t⁻¹yt')`: after the
automorphism `(g, g') ↦ (g, g⁻¹g')` of `G × G`, which turns the diagonal left action of `G^F` into the action on the first
factor, the map `(g, g') ↦ (g⁻¹F(g), g⁻¹g')` is `L × id`, a `G^F`-torsor (4.1(a)); `Ỹ × Ỹ'` is the preimage of the closed
subvariety `{(x, y) : x ∈ F(U), y⁻¹xF(y) ∈ F(U')} ≅ Z` (`x' = y⁻¹xF(y)`), so 4.1(a) identifies its quotient by `G^F` with `Z`. *The
pieces.* Let `N_G(T', T) = {n ∈ G : nT'n⁻¹ = T}`. By the Bruhat decomposition (ReductiveGroups Layer 7, transported by an element
carrying `(T', B')` to `(T, B)`), `G = ⊔ BnB'` over `n ∈ N_G(T', T)/T'`, and `(u, τ, u') ↦ unτu'` is an isomorphism
`U_n × T' × U' → BnB'`, where `U_n = U ∩ nU'^-n⁻¹` and `U'^-` is the unipotent radical of the Borel subgroup through `T'` opposite to
`B'`. The pieces `Z_n = {(x, x', y) ∈ Z : y ∈ BnB'}` are `T^F × T'^F`-stable and form a filtered stratification (the preimage of an
orbit decomposition, 3.2(a)). In the coordinates `y = unτu'`, `a = u⁻¹xF(u)`, `b = u'x'F(u')⁻¹`, `Z_n` is the variety of the
`(u, a, u', b, τ) ∈ U_n × G × U' × G × T'` with `uaF(u)⁻¹ ∈ F(U)`, `u'⁻¹bF(u') ∈ F(U')` and `a = nτ·b·F(nτ)⁻¹`. The closed subgroup
`H_n = {(s, s') ∈ T × T' : F(s')s'⁻¹ = F(n)⁻¹·F(s)s⁻¹·F(n)}` acts on `Z_n` by
`(u, a, u', b, τ) ↦ (sus⁻¹, sas⁻¹, s'u's'⁻¹, s'bs'⁻¹, n⁻¹sn·τ·s'⁻¹)`: the two side conditions are kept because `T` normalises `U_n`
and `F(U)` and `T'` normalises `U'` and `F(U')` (for instance `(sus⁻¹)(sas⁻¹)F(sus⁻¹)⁻¹ = s·(uaF(u)⁻¹)·(F(u)cF(u)⁻¹c⁻¹)·s⁻¹` with
`c = s⁻¹F(s) ∈ T`), and the equation by the defining relation of `H_n`; the element `(t⁻¹, t'⁻¹)` of `T^F × T'^F ⊂ H_n` acts as
`(t, t')`. *Fixed points.* Both projections of `H_n` are onto (Lang's theorem for the tori), so `H_n°` maps onto `T` and onto `T'`.
A point fixed by `H_n°` therefore has `u = 1`, `u' = 1` (`U ∩ C_G(T) = 1 = U' ∩ C_G(T')`), `a ∈ C_G(T) ∩ F(U) = T ∩ F(U) = 1` and
likewise `b = 1`,
hence `F(nτ) = nτ`; conversely, if `m = nτ` is rational, then `ad(F(n)⁻¹) = ad(m⁻¹)` on `T`, so `H_n° = {(s, m⁻¹sm) : s ∈ T}`, which
fixes `(1, 1, 1, 1, τ)`. By 3.4(b), `L((t, t'), Z_n)` is the number of fixed points of `(t, t')` on the finite set `G^F ∩ nT'`, that
is the number of `m ∈ G^F ∩ nT'` with `m⁻¹tm = t'`. *The count.* By 3.2(a),
`L((t, t'), Z) = #{m ∈ N_{G^F}(T', T) : m⁻¹tm = t'}`, and the character sum becomes
`|T'^F|⁻¹·#{m ∈ N_{G^F}(T', T) : θ'(m⁻¹tm) = θ(t) for all t ∈ T^F}`, which is the stated count through `n = m⁻¹` (when the
transporter is not empty, `|T^F| = |T'^F|`). Only the fixed points of `H_n°` enter: the pieces themselves are not fibred in affine
spaces over tori (Checks). Independence of `B`: for two choices `B, B₁ ⊃ T` the three pairings of `R_{T⊂B}^G(θ)` and
`R_{T⊂B₁}^G(θ)` are all `|W_{G^F}(T, θ)|`, so their difference has norm zero.

*Needs:* 4.1, 4.2; 3.1, 3.2, 3.4; ReductiveGroups Layers 7, 7a.

**Checks.**
- `G = SL₂` over `𝔽₂` and `T = T'` the non-split torus (`T^F ≅ μ₃`), with `Y_U = Y_{U'}` in the model
  `{v ∈ 𝔸² : det(v, Fv) = 1}`, `G^F = SL₂(𝔽₂)` acting linearly and `T^F` by scalars. The closed piece (`n ∈ T`) is
  `(G^F\Y_U) × μ₃ ≅ 𝔸¹ × μ₃`, of compactly supported Euler characteristic `3 = |G^F ∩ T|`. On the open piece, for `M = (v | w)`
  with `c = det M ≠ 0`, `M⁻¹F(M) = [[a, c⁻¹], [c⁻¹, b]]` with `ab = c − c⁻²`, and Lang's map identifies the piece with this surface;
  it has `4^k + (−2)^k + 1` points over `𝔽_{2^k}`, hence Euler characteristic `3 = |G^F ∩ nT|` (`n ∉ T`), while a fibration in
  affine spaces over a torus of positive dimension has Euler characteristic `0`. On the open piece `(ζ, ζ') ∈ μ₃²` has Lefschetz
  number `3` if `ζζ' = 1` and `0` otherwise, on the closed piece `3` if `ζ = ζ'` and `0` otherwise (the elements of `G^F ∩ nT`
  invert `T^F`), and the formula gives `⟨R_T(θ), R_T(θ')⟩ = [θ' = θ] + [θ' = θ⁻¹]`, which is `2` for `θ = 1`.

### 4.5 Harish-Chandra compatibility

(a) If `T ⊂ L` with `L` a rational Levi subgroup, then `R_L^G ∘ R_T^L = R_T^G`; in particular
`R_T^G(θ) = Ind_{B^F}^{G^F} θ` when `T` lies in a rational Borel subgroup `B`.
(b) (Mackey formula) For a rational Levi subgroup `L` and a rational maximal torus `T`,
`*R_L^G ∘ R_T^G = Σ_x R_{xTx⁻¹}^L ∘ ad(x)`, the sum over `x ∈ L^F\{x ∈ G^F : xTx⁻¹ ⊂ L}/T^F`.
(c) `⟨R_T^G(θ), 1_{G^F}⟩ = 1` if `θ = 1` and `0` otherwise.
(d) (Functions of the semisimple part.) If `f` is a class function on `G^F` with `f(su) = f(s)` for every Jordan
decomposition `g = su` (0.3), then `⟨f, R_T^G(θ)⟩ = |T^F|⁻¹ Σ_{t∈T^F} f(t)·conj(θ(t))` for every rational maximal torus `T`
and every `θ`.

*Route.* (a) By 4.4 choose `B = B_L U_P` with `B_L ⊃ T` a Borel subgroup of `L`, so `U = U_L U_P`. For `gU ∈ Y_U`,
`g⁻¹F(g) ∈ U·F(U) ⊂ P`, so `F(gP) = gP`, and `(G/P)^F = G^F/P^F` by Lang's theorem for the connected `P`; so `gU ↦ gP`
maps `Y_U` `G^F`-equivariantly onto the finite set `G^F/P^F`. Its fibre over `P` is `{gU : g ∈ P, g⁻¹F(g) ∈ U·F(U)}`; writing
`g = l·u` with `l ∈ L`, `u ∈ U_P`, and using `U·F(U) = U_L F(U_L)·U_P`, the condition is `l⁻¹F(l) ∈ U_L F(U_L)`, so the fibre
is the variety `Y_{U_L}` of `L`, on which `U_P^F` acts trivially and `L^F × T^F` as on `Y_{U_L}`. Hence
`Y_U ≅ G^F ×_{P^F} Y_{U_L} = G^F/U_P^F ×_{L^F} Y_{U_L}`, and `H^*_c(Y_U)` is the induced module
`ℚ̄_ℓ[G^F/U_P^F] ⊗_{L^F} H^*_c(Y_{U_L})` (3.2(a), the variety being a finite disjoint union of translates of `Y_{U_L}`), which is
ReductiveGroups 7c's `R_{L⊂P}^G` (Digne–Michel, transitivity of Lusztig induction). (b) This is the Mackey formula for
Lusztig induction in the case where one of the two Levi subgroups is a maximal torus (Deligne–Lusztig; Digne–Michel),
here with the other parabolic rational. `*R_L^G R_T^G(θ)` is the alternating `θ`-isotypic cohomology of `U_P^F\Y_U` as an
`L^F`-module (3.2(c)). Stratify `Y_U` by the geometric relative position of `gB` to `P`, that is by the double coset
`PgB ⊂ G`: `P\G/B` is finite, so this is the preimage of the decomposition of `G/B` into finitely many `P`-orbits, a
filtered stratification (3.2(a)), and its pieces are stable under `U_P^F`, `L^F` and `T^F`. (A finer decomposition by the
orbits of the finite group `P^F` is not a stratification: for `GL₂`, the non-split variety `X(s) = ℙ¹ ∖ ℙ¹(𝔽_q)` lies in
the open relative position to the rational Borel subgroup `B^F` and is infinite, so it is the union of infinitely many
`B^F`-orbits.) Each piece is, up to an equivariant fibration in affine spaces (3.4(c)), a variety on which a torus acts;
on some pieces a subtorus of `T` acts without fixed points, so that their Lefschetz numbers vanish by 3.4(b), and the
others together contribute the `R^L_{xTx⁻¹}(ad(x)θ)`, `x ∈ L^F\{x ∈ G^F : xTx⁻¹ ⊂ L}/T^F` (the analysis of the
pieces is cited: Deligne–Lusztig, §8; Digne–Michel). For `G = GL_n` and its Levi subgroups (b) has a
second route that uses only 4.4 and (a): for `L = ∏_i GL_{n_i}` the `R^L_{T'}(θ')` over the `L^F`-classes of pairs
are pairwise orthogonal and nonzero (4.4 for `L`) and as many as the classes of `L^F` (0.4), so they span the
class functions of `L^F`; by adjunction and (a), `⟨*R_L^G R_T^G(θ), R^L_{T'}(θ')⟩ = ⟨R_T^G(θ), R_{T'}^G(θ')⟩`, which 4.4
for `G` counts as the `n ∈ N_{G^F}(T, T')/T^F` carrying `θ'` to `θ`; grouping these `n` by the double cosets
`L^F n T^F` (each `n` has `nTn⁻¹ = T' ⊂ L`) gives the pairing of the right side computed by 4.4 for `L`. Both
sides of (b) have the same pairing with a spanning set, so they are equal. (c) Let
`Ỹ = {g ∈ G : g⁻¹F(g) ∈ F(U)}`, with `G^F × T^F` acting by left and right multiplication. The map `g ↦ gU` sends `Ỹ`
onto `Y_U`, and its fibre over `gU` with `g⁻¹F(g) = u₁f` (`u₁ ∈ U`, `f ∈ F(U)`) is `g·u₁(U ∩ F(U))`, so `Ỹ → Y_U` is an
equivariant fibration in affine spaces and `H^*_c(Ỹ) ≅ H^*_c(Y_U)(−d)[−2d]` (3.4(c)). The Lang map identifies
`G^F\Ỹ = G^F\L⁻¹(F(U))` with `F(U)` (4.1(a)), an affine space, on which `t ∈ T^F` acts by `g⁻¹F(g) ↦ t⁻¹g⁻¹F(g)F(t) = t⁻¹(g⁻¹F(g))t`,
that is by conjugation `f ↦ t⁻¹ft`; conjugation by the connected
group `T`, which normalises `F(U)` (`T = F(T) ⊂ F(B)`), extends this action, so `T^F` acts trivially on
`H^*_c(G^F\Ỹ) = ℚ̄_ℓ(−N)[−2N]` (3.4(a)).
By 3.2(c), `⟨R_T^G(θ), 1⟩` is the alternating dimension of the `θ`-isotypic part of `H^*_c(G^F\Ỹ)`, which is `1`
for `θ = 1` and `0` otherwise. (d) First, for every rational maximal torus `T′` of a connected reductive group `C`,
`Σ_u Q_{T′}^C(u) = |C^F|/|T′^F|`, the sum over the unipotent elements of `C^F`: `Σ_θ R_{T′}^C(θ)` vanishes off the unipotent
elements and equals `|T′^F|·Q_{T′}^C` on them (4.3, 4.2), and `Σ_θ ⟨R_{T′}^C(θ), 1⟩ = 1` by (c). Summing 4.3 over the unipotent
`u ∈ C°(s)^F` therefore gives `Σ_u R_T^G(θ)(su) = |T^F|⁻¹ Σ_{x ∈ G^F, x⁻¹sx ∈ T} θ(x⁻¹sx)` for semisimple `s`. Hence
`|G^F|·⟨f, R_T^G(θ)⟩ = Σ_s f(s)·|T^F|⁻¹ Σ_{x : x⁻¹sx ∈ T} conj(θ(x⁻¹sx))`, the outer sum over the semisimple elements; the
pairs `(s, x)` correspond to the pairs `(t, x) ∈ T^F × G^F` through `s = xtx⁻¹`, and `f(xtx⁻¹) = f(t)`, which gives the formula.

*Needs:* 4.1, 4.2, 4.3, 4.4; 1.0; 3.2, 3.4; 0.3; 0.4 (for the second route of (b) for `GL_n`); ReductiveGroups 7a, 7b, 7c.

**Checks.**
- (a) for `G = L = T = 𝔾_m` over `𝔽_3` (`P = G`, `U = U_P = 1`): `Y_U = T^F` has two points, the base `G^F/P^F` one and the
  fibre `Y_{U_L} = T^F` two; a fibration over `G^F/U_P^F = T^F` with fibre `Y_{U_L}` would have four points.
- (b) for `GL₂`, `L = T = T₁`: the index set is `T₁^F\N_{G^F}(T₁)/T₁^F = W`, of order `2`, and indeed
  `(Ind_{B^F} 1)^{U^F}` is two copies of the trivial character of `T₁^F`.
- (c) for `GL₂`: `⟨Ind_B 1, 1⟩ = 1`, `⟨1 − St, 1⟩ = 1`, and `⟨R_{T_s}(θ), 1⟩ = ⟨−σ_θ, 1⟩ = 0` for regular `θ`.
- (d) with `f = 1` is (c). For `GL_n` and `f(x) = Σ_α θ̃(α)` over the eigenvalues (5.6(b)), with `T = T_{(n)}`: `⟨f, R_{T_{(n)}}(θ′)⟩`
  is the number of `j < n` with `θ̃|_{𝔽_{q^n}^×}^{q^j} = θ′` (checked by computation on `GL₂(𝔽_q)`, `q ≤ 7`, and `GL₃(𝔽_q)`, `q = 2, 3`).
  The hypothesis on `f` is needed: for `f = St_G` on `GL₂` (not constant along `su`: `St(1) = q`, `St(u) = 0` for `u ≠ 1`
  unipotent) and `T = T₁`, `⟨St, R_{T₁}(1)⟩ = 1` (4.6(c)), while `|T₁^F|⁻¹ Σ_t St(t) = (q−1)^{−2}((q−1)·q + (q−1)(q−2)) = 2`
  (4.6(b): `St = q` at the `q − 1` central elements, `1` at the others).

### 4.6 The Steinberg character and the two averages

Let `St_G = Σ_J (−1)^{|J/F|} R_{L_J}^G(1)`, the sum over the `F`-stable subsets `J ⊂ S`, with `L_J` the standard
rational Levi subgroup and `|J/F|` the number of `F`-orbits in `J`. Then:
(a) `St_G` is an irreducible character;
(b) `St_G(1) = |G^F|_p`, `St_G(s) = ε_G ε_{C°(s)} |C°(s)^F|_p` for semisimple `s`, and `St_G(g) = 0` when `g` is
not semisimple;
(c) `⟨R_T^G(1), St_G⟩ = ε_G ε_T` for every rational maximal torus `T`;
(d) `1_{G^F} = |W|⁻¹ Σ_{w∈W} R_{T_w}^G(1)` and `St_G = |W|⁻¹ Σ_{w∈W} ε_G ε_{T_w} R_{T_w}^G(1)`.
For split `G` and the `q`-Frobenius, (a) and `St_G(1) = q^N` are SmoothRepresentationsOfLocalGroupsPartII SRU.4.1
*finite-steinberg* (with the alternating-sum identity of SRU.4.9), which also characterises `St_G` by the sign character of
`End(Ind_{B^F}^{G^F}1)`; here they are stated for every Steinberg endomorphism.

*Route,* in the order (a), (c), (d), (b). (a) `⟨St, St⟩ = Σ_{J,K}(−1)^{|J/F|+|K/F|}|P_J^F\G^F/P_K^F|` by the Mackey
formula for Harish-Chandra functors (ReductiveGroups 7d). By 0.1 the rational double cosets `P_J^F\G^F/P_K^F` correspond
to `W_J^F\W^F/W_K^F` (`W_J^F = W_J ∩ W^F`), equivalently to the `F`-fixed double cosets in `W_J\W/W_K` (each has a unique
element of minimal length, which is `F`-fixed), and not to all of `W_J\W/W_K`. Solomon's identity in its twisted form,
`Σ_{J,K}(−1)^{|J/F|+|K/F|}·#(W_J\W/W_K)^F = 1`, the sum over pairs of `F`-stable subsets, gives `1`; `St(1) > 0` by (b)'s first
step below, which uses only 0.1. (c) By 4.5(b),(c), `⟨R_{T_w}(1), R_{L_J}^G(1)⟩ = ⟨*R_{L_J}^G R_{T_w}(1), 1⟩` is the number of
`L_J^F`-classes in `{x : xT_wx⁻¹ ⊂ L_J}/T_w^F`, which by 0.2 for `G` and for `L_J` is the number `N_J(w)` of cosets `vW_J`
with `v⁻¹wF(v) ∈ W_J`. These cosets are the faces of type `J` of the Coxeter complex `Σ` of `(W, S)` fixed by the
simplicial automorphism `c_w : vW_K ↦ wF(v)W_{F(K)}` (a fixed face has `F`-stable type). Take the augmented chain complex
of `Σ`, in which the face `vW_K` has dimension `|S ∖ K| − 1` and `W` itself is the empty face of dimension `−1`; `c_w`
permutes the vertices of a fixed face of type `J` as `F` permutes `S ∖ J`, with sign `(−1)^{|S∖J| − |(S∖J)/F|}`. The Hopf
trace formula gives the reduced Lefschetz number `L̃(c_w) = Σ_J (−1)^{|S∖J|−1}(−1)^{|S∖J|−|(S∖J)/F|}N_J(w) = −(−1)^{|S/F|}Σ_J(−1)^{|J/F|}N_J(w)`. `Σ` triangulates the unit sphere of the span `V` of the roots (dimension `|S|`), the
face `vW_K` being `v` applied to the face `C_K` of type `K` of the fundamental chamber. Let `φ = q⁻¹F` act on `X(T₀) ⊗ ℝ` by
pullback (Conventions). Then `φ∘v∘φ⁻¹ = F⁻¹(v)` for `v ∈ W`, and `φ` sends each simple root `α` to a positive multiple of the
simple root `β` with `F(U_β) = U_α`, so `φ(C_K) = C_{F⁻¹(K)}`: `φ` induces `vW_K ↦ F⁻¹(v)W_{F⁻¹(K)}`, the inverse permutation of
types, and `c_w` is induced by the linear map `wφ⁻¹` (for three copies of `SL₂` cycled by `F` the types go `1 → 2 → 3` under `F`,
while `φ` sends the first simple root to the third). So `L̃(c_w) = (−1)^{|S|−1}det(wφ⁻¹|V) = (−1)^{|S|−1}det(w)det(φ|V)`
(`det φ = ±1`); `φ` permutes the simple roots up to positive scalars, so `det(φ|V) = (−1)^{|S|−|S/F|}`. Hence
`Σ_J(−1)^{|J/F|}N_J(w) = det(w) = (−1)^{ℓ(w)}`, which is `ε_Gε_{T_w}`:
for an orthogonal map `g` of finite order of `X(T₀) ⊗ ℝ`, `det g = (−1)^{dim − dim Fix(g)}`, so
`ε_Gε_{T_w} = (−1)^{dim Fix(φ) + dim Fix(wφ)} = det(φ)det(wφ) = det(w)` (Solomon 1966 for `F` trivial on `W`). The
unaugmented Lefschetz number with the signs `(−1)^{|J|}` is not the right count (Checks). (d) The class function
`f = |W|⁻¹ΣR_{T_w}(1)` has `⟨f, f⟩ = 1` by 4.4 (the twisted classes of `W` and their centralisers, 0.2) and
`⟨f, 1⟩ = 1` by 4.5(c), so `‖f − 1‖ = 0`; likewise the signed average has norm one and pairs to `1` with `St_G` by
(c), and `St_G` has norm one by (a). (b) Three steps. (1) *Restriction to `U₀^F`.* By 0.1 the double cosets
`U₀^F\G^F/P_J^F` are the `U₀^F ẇ P_J^F` with `w ∈ W^F` of minimal length in `wW_J` (`T₀^F ⊂ P_J^F`), and for such `w`,
`U₀ ∩ ẇP_Jẇ⁻¹ = U₀ ∩ ẇB₀ẇ⁻¹ =: U_{(w)}`, since `w` maps the positive roots of `L_J` to positive roots and so no
positive root lies in `w(Φ_J^−)`. Mackey's formula (InductionRestriction Layer 3) gives
`(Ind_{P_J^F}^{G^F}1)|_{U₀^F} = Σ_w Ind_{U_{(w)}^F}^{U₀^F}1` over these `w`. With the descent set
`D(w) = {s ∈ S : ℓ(ws) < ℓ(w)}`, `F`-stable for `F`-fixed `w`, the condition is `D(w) ∩ J = ∅`, so
`St_G|_{U₀^F} = Σ_{w∈W^F} c_w Ind_{U_{(w)}^F}^{U₀^F}1` with `c_w = Σ_{J ⊂ S∖D(w), F-stable}(−1)^{|J/F|}`, a product of
factors `1 − 1` over the `F`-orbits in `S ∖ D(w)`: `c_w = 0` unless `D(w) = S`, that is `w = w₀`, and
`U_{(w₀)} = 1`. So `St_G` restricts to the regular character of the Sylow `p`-subgroup `U₀^F`: `St_G(1) = q^N = |G^F|_p`,
and `St_G(u) = 0` for unipotent `u ≠ 1`, every unipotent element being conjugate into `U₀^F`. (2) *Averages over
tori.* For a function `f` on rational maximal tori, constant on `G^F`-classes,
`|W|⁻¹Σ_{w∈W} f(T_w) = |G^F|⁻¹Σ_T |T^F| f(T)`, the sum over all rational maximal tori: by 0.2 the class of `T_w` has
`|G^F|/(|T_w^F|·|C_{W,F}(w)|)` members, `C_{W,F}(w) = {v : v⁻¹wF(v) = w}`, and the `F`-class of `w` has
`|W|/|C_{W,F}(w)|` members. (3) *Semisimple parts.* At `g = su`, with `C = C°(s)`, (d) and 4.3 give
`St_G(su) = |G^F|⁻¹Σ_T|T^F|ε_Gε_T|C^F|⁻¹Σ_{x∈G^F, x⁻¹sx∈T}Q^C_{xTx⁻¹}(u)`; put `T′ = xTx⁻¹`, which contains `s`, and use
that the rational maximal tori containing `s` are exactly those of `C` (0.3; `s` is central in `C`): this is
`ε_G|C^F|⁻¹Σ_{T′⊂C}|T′^F|ε_{T′}Q^C_{T′}(u) = ε_Gε_C·St_C(u)` by (2) and (d) for `C`. By (1) for `C`, `St_C(u)` is
`|C^F|_p` for `u = 1` and `0` otherwise. (The restriction to `U₀^F` is Curtis's computation.)

*Needs:* 4.3, 4.4, 4.5; 0.1, 0.2, 0.3; 1.0; ReductiveGroups 7b–7d; InductionRestriction Layer 3.

**Checks.**
- `GL₂`: `St = Ind_{B^F} 1 − 1`, of degree `q`; `½(R_{T₁}(1) + R_{T_s}(1)) = 1` and `½(R_{T₁}(1) − R_{T_s}(1)) = St`.
- `U₃(𝔽_q)`: the two simple roots form one `F`-orbit, so the `F`-stable `J` are `∅` and `S`, `|∅/F| = 0`,
  `|S/F| = 1`, and `St = Ind_{B^F} 1 − 1`, of degree `q³ = |G^F|_p`. The sign `(−1)^{|J|}` would give
  `Ind_{B^F} 1 + 1`, of degree `q³ + 2`, which is not irreducible.
- (a) for `U₃(𝔽_q)`: `W = S₃`, `W^F = {1, w₀}`; the `F`-fixed double cosets give `⟨St, St⟩ = 2 − 1 − 1 + 1 = 1`, while all of
  `W_J\W/W_K` would give `6 − 1 − 1 + 1 = 5`. For split `G` the two counts agree: for `GL₃` (`S = {s₁, s₂}`) the sixteen
  terms give `(6 − 3 − 3 + 1) − (3 − 2 − 2 + 1) − (3 − 2 − 2 + 1) + (1 − 1 − 1 + 1) = 1`.
- (c) for split `A₁` (`GL₂`) at `w = 1`: `N_∅(1) = 2`, `N_S(1) = 1`, and `2 − 1 = 1 = ε_Gε_{T₁}`, while the Lefschetz number of the
  identity on the Coxeter complex, two points, is `2`; at `w = s`: `0 − 1 = −1 = ε_Gε_{T_s}`. For `GL₃` the alternating counts are
  `6 − 3 − 3 + 1 = 1` at `w = 1`, `0 − 1 − 1 + 1 = −1` at a reflection and `0 − 0 − 0 + 1 = 1` at a `3`-cycle, the signs
  `(−1)^{ℓ(w)}`.
- (c) for three copies of `SL₂` cycled by `F` (`W = {±1}³`, `F(v) = (v₃, v₁, v₂)`, the `F`-stable `J` being `∅` and `S`): `N_∅(w)` is `2`
  if `det w = 1` and `0` otherwise, so `N_∅(w) − N_S(w) = det(w)`; by computation `wφ⁻¹` induces `c_w` on all `208` pairs of a
  nonempty face (`6 + 12 + 8 = 26` faces; the `56` pairs `(v, K)`, `K ≠ S`, present some faces several times) and an element `w`
  (`|W| = 8`), and `wφ` on `16` of them only.
- (b) at semisimple elements of `GL₂`: at a split regular `s`, `C°(s) = T₁` and `St(s) = ε_Gε_{T₁}·1 = 1`, which is
  `(Ind_{B^F}1 − 1)(s) = 2 − 1`; at a regular elliptic element `ε_Gε_{T_s}·1 = −1`, matching CharacterTheory Layer 9.
  The two Borel subgroups through `T₁` both contain `s`, while `T₁` has a single parabolic subgroup: the
  `s`-fixed rational parabolic subgroups of `G` do not correspond to those of `C°(s)`.
- (b) for `GL₃` at `s = diag(a, a, b)`, `a ≠ b`: `C°(s) = GL₂ × GL₁`, `ε_Gε_{C°(s)} = 1` and `St(s) = q`; directly,
  `s` fixes `3(q+1)` complete flags, `q + 2` planes and `q + 2` lines, and `3(q+1) − 2(q+2) + 1 = q`. At
  `diag(J₂(a), b)` (`J₂` a Jordan block) the counts are `3, 2, 2` and `St = 0`.

### 4.7 Degree, sign and irreducibility

(a) `R_T^G(θ)(1) = ε_G ε_T |G^F|_{p'}/|T^F|`.
(b) For `θ` in general position `ε_G ε_T R_T^G(θ)` is an irreducible character.

*Route.* (a) Induction on `dim G`; for a torus `R_T^T(θ) = θ`. Write `D_T = R_T^G(1)(1)`. Pair `R_T^G(1)` with
`St_G` using 4.6(b), which vanishes off semisimple elements, and 4.3 at semisimple `s`: for `s` non-central,
`C°(s)` is a proper connected reductive group, the induction hypothesis gives
`Q^{C°(s)}_{xTx⁻¹}(1) = ε_{C°(s)}ε_T|C°(s)^F|_{p'}/|T^F|`, and the term of `s` is `ε_Gε_T·#{x : x⁻¹sx ∈ T}/|T^F|`;
the central `s` contribute `|Z^F|·|G^F|_p·D_T`. Since `Σ_{s semisimple}#{x : x⁻¹sx ∈ T}/|T^F| = |G^F|`, this
gives `⟨R_T^G(1), St⟩ = ε_Gε_T + |Z^F||G^F|⁻¹(|G^F|_p D_T − ε_Gε_T|G^F|/|T^F|)`, and 4.6(c) forces
`D_T = ε_Gε_T|G^F|_{p'}/|T^F|`; 4.2 removes `θ`. (b) Norm one (4.4) and positive degree after the sign (a).
For `G = GL_n` and its Levi subgroups (a) also follows without the Steinberg character. Let `T_τ` be the product
of the Coxeter tori of the blocks of `L_τ = ∏_i GL_{τ_i}`; by 4.5(a),
`Q_{T_τ}(1) = [G^F : P_τ^F]∏_i Q^{GL_{τ_i}}_{T_{(τ_i)}}(1)`.
For each `k` there is a character `θ` of `𝔽_{q^k}^×` with `k` distinct Frobenius conjugates (`q^k − 1` exceeds
`Σ_{d∣k, d<k}(q^d − 1)`); `R_{T_{(k)}}(θ)` has norm one (4.4) and vanishing Harish-Chandra restriction to every proper
Levi subgroup (4.5(b), whose index set is empty), so it is `±` an irreducible cuspidal character, of degree
`ψ_{k−1}(q)` (2.4(b)); by 4.2, `Q_{T_{(k)}}(1) = ε′_kψ_{k−1}(q)` with `ε′_k = ±1`. Evaluating the first average of 4.6(d)
at `1` gives `1 = Σ_{τ⊢n} z_τ⁻¹Q_{T_τ}(1) = ψ_n(q)Σ_τ z_τ⁻¹∏_i ε′_{τ_i}/(q^{τ_i} − 1)`, in which the term of `τ = (n)` is
`ε′_nψ_{n−1}(q)/n`; so the identity determines `ε′_n` from the `ε′_k`, `k < n`. The signs `ε′_k = (−1)^{k−1}` satisfy it:
it is then `h_n = Σ_τ p_τ/z_τ` (SchurWeyl §7.6) under the principal specialisation `p_k ↦ (1 − t^k)⁻¹` at `t = q`, which
sends `h_n` to `∏_{i=1}^n(1 − q^i)⁻¹ = (−1)^n/ψ_n(q)`, an identity of rational functions in `t`. Hence
`Q_{T_τ}(1) = (−1)^{n−ℓ(τ)}ψ_n(q)/∏_i(q^{τ_i} − 1)`, which is (a), as `r(GL_n) = n` and `r(T_τ) = ℓ(τ)`.

*Needs:* 4.2–4.6; 0.2, 0.3; for the second route of (a): 2.4(b), SchurWeyl Layer 7 (§7.6).

**Checks.**
- `GL₂`: `R_{T₁}^G(1) = 1 + St`, `R_{T_s}^G(1) = 1 − St`, of degree `−(q−1) = ε_Gε_{T_s}(q²−1)(q−1)/(q²−1)`.
- (a) at `T` in a rational Borel subgroup: `ε_Gε_T = 1` and `|G^F|_{p'}/|T^F| = [G^F : B^F]`, the degree of
  `Ind_{B^F}^{G^F}θ` (4.5(a)).
- The second route for `n = 2`: `1 = ½·(q−1)(q²−1)·(1/(q−1)² + ε′_2/(q²−1))` forces `ε′_2 = −1`.

### 4.8 Geometric conjugacy, Lusztig series and exhaustion

Pairs `(T, θ)`, `(T', θ')` are **geometrically conjugate** if some `g ∈ G` with `gTg⁻¹ = T'` satisfies
`θ'∘N_{F^m/F}∘ad(g) = θ∘N_{F^m/F}` on `T^{F^m}` for some `m` with `g ∈ G^{F^m}`, `N_{F^m/F}` the norm
`t ↦ t·F(t)⋯F^{m−1}(t)`. If `R_T^G(θ)` and `R_{T'}^G(θ')` have a common constituent, the pairs are
geometrically conjugate; every irreducible character of `G^F` is a constituent of some `R_T^G(θ)`; and
`reg_{G^F} = |G^F|_{p'}|W|⁻¹Σ_{w∈W} ε_Gε_{T_w}|T_w^F|⁻¹ Σ_θ R_{T_w}^G(θ)`. The **Lusztig series**
`E(G^F, κ)`, the constituents of the `R_T^G(θ)` with `(T, θ)` in the geometric class `κ`, therefore partition
the irreducible characters.

*Route.* Disjointness. Let `χ` be a constituent of `R_T^G(θ)` and of `R_{T'}^G(θ')`, defined by `B = TU` and
`B' = T'U'`. Since `R_T^G(θ)` is the alternating sum of the `θ`-isotypic parts of the `G^F`-modules `H^i_c(Y_U)`
(4.2), `χ` occurs in some `H^i_c(Y_U)_θ`; since `R_{T'}^G(θ'⁻¹)` is the complex conjugate of `R_{T'}^G(θ')`
(`L(g, X) = L(g⁻¹, X)`, 3.1), `χ̄` occurs in some `H^j_c(Y_{U'})_{θ'⁻¹}`. So
`(H^i_c(Y_U)_θ ⊗ H^j_c(Y_{U'})_{θ'⁻¹})^{G^F} ≠ 0`, and by 3.2(b), (c) this space is a summand of the part of
`H^{i+j}_c(G^F\(Y_U × Y_{U'}))` on which `T^F × T'^F` acts by `θ ⊠ θ'⁻¹`. Stratify `G^F\(Y_U × Y_{U'})` as in 4.4
by the relative position of the two Borel subgroups, the pieces `Z_w` indexed by the `w = ẇT'` with
`ẇT'ẇ⁻¹ = T`. The pieces are the preimages of the finitely many `G`-orbits on pairs of Borel subgroups, so this is a
filtered stratification (3.2(a)), and by 3.2(a) the `θ ⊠ θ'⁻¹`-part of `H^*_c` is nonzero on some `Z_w`. Up to the equivariant
fibration in affine spaces `Ỹ × Ỹ' → Y_U × Y_{U'}` (3.4(c), compatibly with `T^F × T'^F`), `Z_w` is the piece `Z_n`, `n = ẇ`, of the
route of 4.4, on which the action of `T^F × T'^F` extends to the action of the closed subgroup `H_n ⊂ T × T'` given there, whose
identity component acts trivially on every cohomology group (3.4(a)); so `θ ⊠ θ'⁻¹` is trivial on `(T^F × T'^F) ∩ H_n°` (an
element `(s, s')` acts as `(s⁻¹, s'⁻¹)`). For `m` with `F^m(ẇ) = ẇ`, the homomorphism
`x ↦ (N_{F^m/F}(x), N_{F^m/F}(F(ẇ)⁻¹xF(ẇ)))` maps the connected `T` into `H_n` (both sides of the defining relation become
`F(ẇ)⁻¹F^m(x)x⁻¹F(ẇ)`), hence into `H_n°`; at `x = F(t)`, `t ∈ T^{F^m}`, its value is the rational pair
`(N_{F^m/F}(t), N_{F^m/F}(ẇ⁻¹tẇ))`. Triviality on these pairs says `θ∘N_{F^m/F} = θ'∘N_{F^m/F}∘ad(ẇ⁻¹)` on
`T^{F^m}`, which is geometric conjugacy by `g = ẇ⁻¹` (Deligne–Lusztig, proof of Theorem 6.2). The regular character: `Σ_θ R_T^G(θ) = L((·, 1), Y_U)`,
which by 4.3 vanishes off unipotent elements and equals `|T^F|Q_T^G(u)` at `u`; so the right side is supported on
unipotent elements with value `|G^F|_{p'}·|W|⁻¹Σ_w ε_Gε_{T_w}Q_{T_w}(u) = |G^F|_{p'}·St_G(u)` (4.6(d)), which is `|G^F|`
at `u = 1` and `0` otherwise (4.6(b)). Exhaustion: `χ(1) = ⟨χ, reg⟩ ≠ 0` and `reg` is a combination of the
`R_T^G(θ)` (Deligne–Lusztig, Corollary 7.7).

*Needs:* 4.2–4.7; 3.1, 3.2, 3.4.

### 4.9 Cuspidality

If `T` lies in no proper rational Levi subgroup, then `*R_L^G R_T^G(θ) = 0` for every proper rational `L`;
hence for `θ` in general position `ε_G ε_T R_T^G(θ)` is irreducible and cuspidal.

*Route.* The Mackey formula 4.5(b), whose index set is empty; 4.7(b) and 1.1.

*Needs:* 4.5, 4.7; 1.1.

### 4.10 Green functions at regular unipotent elements

For every rational maximal torus `T` and every regular unipotent `u ∈ G^F`, `Q_T^G(u) = 1`.

*Route.* A regular unipotent `u` lies in exactly one Borel subgroup, hence in exactly one rational parabolic
subgroup of each type, and its image in the Levi quotient is regular unipotent (0.5); so for a rational Levi `L`
and a class function `χ` of `L^F`, `R_L^G(χ)(u) = χ(u_L)` with `u_L` regular unipotent in `L^F` (one fixed coset
in `G^F/P^F`). With 4.5(a) this reduces the statement to tori `T` lying in no proper rational Levi subgroup of
the minimal rational Levi containing them. For `GL_n` these are the Coxeter tori of the blocks `GL_k`: for
`T_{(k)}`, with `T_{(k)}^F ≅ 𝔽_{q^k}^×` and `N_{G^F}(T_{(k)})/T_{(k)}^F ≅ ℤ/k` acting by Frobenius, a character `θ`
with `k` distinct Frobenius conjugates exists (`q^k − 1` exceeds `Σ_{d∣k, d<k}(q^d − 1)`), is in general position,
and `T_{(k)}` lies in no proper rational Levi subgroup (`T_{(k)}^F` acts irreducibly on `𝔽_q^k`); so
`(−1)^{k−1}R_{T_{(k)}}(θ)` is an irreducible cuspidal character (4.9), whose value at a regular unipotent element
is `(−1)^{k−1}` by 2.4(c), and `Q_{T_{(k)}}(u) = R_{T_{(k)}}(θ)(u) = 1`. For a general `G` and such `T`,
`Q_T^G(u) = L(u, X(w))`, the Lefschetz number of `u` on the Deligne–Lusztig variety (`X(w) = X_B = Y_U/T^F` by 4.1(b); 3.2(c)
and 4.2), and
Deligne–Lusztig compute it to be `1` (Deligne–Lusztig, Theorem 9.16).

*Needs:* 0.5; 4.1, 4.2, 4.5, 4.9; 1.0; 2.4(c) for `GL_n`.

**Checks.**
- `GL₂`: `Q_{T₁}(u) = (Ind_B 1)(u) = 1` (one fixed point on `ℙ¹(𝔽_q)`) and `Q_{T_s}(u) = (1 − St)(u) = 1`.

### 4.11 Gelfand–Graev characters and Lusztig series

For every rational maximal torus `T` and every `θ`, `⟨Γ_ψ, R_T^G(θ)⟩ = ε_G ε_T`. If `Z(G)` is connected,
every Lusztig series contains exactly one constituent of `Γ_ψ`, which occurs in `Γ_ψ` once.

*Route.* Induction on the semisimple rank. For an `F`-stable `J ⊂ S` let `ψ_J` be the character of 2.6, so that
`Ind_{U₀^F}^{G^F}ψ_J = Γ_{ψ,J} = R_{L_J}^G(Γ^{L_J})` by 2.6(a). Since `Σ_J (−1)^{|J/F|}ψ_J = ∏_O(1 − ψ_O)` vanishes on
the non-regular elements of `U₀^F` (those with a trivial component in some `U_O^F`), the class function
`Δ = Σ_J (−1)^{|J/F|}Ind ψ_J` is supported on regular unipotent elements, where `R_T^G(θ) = 1` (4.10); hence
`⟨Δ, R_T^G(θ)⟩ = ⟨Δ, 1⟩ = 1` (only `J = ∅` pairs with `1`). For `J ≠ S`, adjunction, the Mackey formula 4.5(b),
the induction hypothesis on `L_J` and `ε_{L_J} = ε_G` give `⟨R_{L_J}^G Γ^{L_J}, R_T^G(θ)⟩ = ε_Gε_T·N_J(T)` with
`N_J(T) = ⟨R_T^G(1), R_{L_J}^G(1)⟩`; with `Σ_J(−1)^{|J/F|}N_J(T) = ε_Gε_T` (4.6(c)) this leaves
`⟨Γ_ψ, R_T^G(θ)⟩ = ε_Gε_T`. The second statement, for a general `G` with connected centre, combines the first
with 2.2, 4.4 and 4.8 and two further inputs: the uniform projection of `Γ_ψ` to a series has norm
`Σ 1/|W_{G^F}(T, θ)|` over the rational classes in it, which is `1` when `Z(G)` is connected, so every series
contains a constituent of `Γ_ψ`; and `⟨Γ_ψ, Γ_ψ⟩`, the number of double cosets supporting `End(Γ_ψ)` in 2.2, equals
the number of geometric conjugacy classes of pairs, so that, `Γ_ψ` being multiplicity free, no series contains two
(Deligne–Lusztig, §10, Theorem 10.7). For `GL_n` the second statement is also 5.4(c), proved there from the
first statement and 4.8 without these inputs.

*Needs:* 0.5; 2.1–2.3, 2.6(a), 4.4–4.10; 1.0.

**Checks.**
- `GL₂`: `⟨Γ_ψ, Ind_{B^F}(α ⊗ β)⟩ = 1` for all `α, β` (the irreducible principal series, or the twisted
  Steinberg constituent when `α = β`), and `⟨Γ_ψ, R_{T_s}(θ)⟩ = −1` for every `θ` (`R_{T_s}(θ) = −σ_θ` for
  regular `θ`, and `α∘det − α·St` for `θ = α∘N`).
- `SL₂(𝔽_q)`, `q` odd: each of the two Gelfand–Graev representations pairs to `1` with `Ind_B 1 = 1 + St` (it
  contains `St`, not `1`), although the centre is not connected.

### Examples

For `GL₂`, `R_{T₁}^G(1) = 1 + St` and `R_{T_s}^G(1) = 1 − St`, of degree `−(q−1)` (4.7), so that `½(R_{T₁}(1) + R_{T_s}(1)) = 1` and `½(R_{T₁}(1) − R_{T_s}(1)) = St` (4.6); at a regular unipotent `u`, `Q_{T₁}(u) = Q_{T_s}(u) = 1` (4.10), and `⟨Γ_ψ, R_{T_s}(θ)⟩ = −1` for every `θ` (4.11). For `SL₂` over `𝔽₂` and its non-split torus, `⟨R_T(θ), R_T(θ')⟩ = [θ' = θ] + [θ' = θ⁻¹]` (4.4). For `U₃(𝔽_q)` the Steinberg character is `Ind_{B^F} 1 − 1`, of degree `q³` (4.6). The Lang map of `𝔾_a` for the `q`-Frobenius is the Artin–Schreier `𝔽_q`-torsor `x ↦ x^q − x`, and that of `𝔾_m` the Kummer `μ_{q−1}`-torsor `t ↦ t^{q−1}` (4.1).

### Dependencies

Layers 0–3; ReductiveGroups Layers 7, 7a, 7b, 7c, 7d, 7C and 9E; SchemeAndStackFoundations §§1.1, 1.15; RepresentationTheory/CharacterTheory Layer 3; InductionRestriction Layer 3; SchurWeyl Layer 7 (§7.6, for the second route of 4.7 (a)).

## Layer 5: Green's theory of `GL_n(𝔽_q)`

`G = GL_n` with the standard Frobenius from here on.

### 5.1 Tori of `GL_n`, characters of finite fields and labels

The rational maximal tori of `GL_n` up to `GL_n(𝔽_q)`-conjugacy correspond to partitions `τ ⊢ n` (the cycle
type of `w ∈ S_n`), with `T_τ^F ≅ ∏_i 𝔽_{q^{τ_i}}^×`, `ε_G ε_{T_τ} = (−1)^{n − ℓ(τ)}` and
`|N_{G^F}(T_τ)/T_τ^F| = z_τ`. The **Coxeter torus** `T_{(n)}` has `T_{(n)}^F ≅ 𝔽_{q^n}^×`, realised by the
multiplication operators of `𝔽_{q^n}` in an `𝔽_q`-basis, and `N_{G^F}(T_{(n)})/T_{(n)}^F ≅ ℤ/n` acting by
`x ↦ x^q`; it is the only rational maximal torus contained in no proper rational Levi subgroup. In `L_n`, the
number of regular characters is `Σ_{d∣n} μ(n/d)(q^d − 1)`, and the number of Frobenius orbits of degree `n`
is `N*_q(n) = n⁻¹ Σ_{d∣n} μ(n/d)(q^d − 1)`, the number of monic irreducible polynomials of degree `n` over
`𝔽_q` with nonzero constant term; `(q^n − 2q^{n/2})/n ≤ N*_q(n) ≤ q^n/n` for `n ≥ 2`.
**Pairs attached to a label.** For a label `m` of degree `n` (Conventions), a choice of `θ_O ∈ O` for each
orbit, and a tuple `ρ = (ρ_O)` of partitions `ρ_O ⊢ m(O)`, let `T_{m,ρ}` be the rational maximal torus with
`T_{m,ρ}^F ≅ ∏_O ∏_i 𝔽_{q^{|O|ρ_{O,i}}}^×` and `θ_{m,ρ} = ⊠_O ⊠_i θ_O ∘ N_{𝔽_{q^{|O|ρ_{O,i}}}/𝔽_{q^{|O|}}}`. Every
pair `(T, θ)` is `G^F`-conjugate to some `(T_{m,ρ}, θ_{m,ρ})` with `m` and `ρ` unique; two pairs are geometrically
conjugate (4.8) exactly when their labels agree; and `|W_{G^F}(T_{m,ρ}, θ_{m,ρ})| = ∏_O z_{ρ_O}`.

*Route.* 0.2 with `W = S_n` and trivial Frobenius action; `T_w^F` from the cycle decomposition of `w`.
Counting: Möbius inversion of `Σ_{d∣n} |{θ ∈ L_n of degree d}| = q^n − 1`; the bounds from
`|Σ_{d∣n, d<n} μ(n/d)q^d| ≤ Σ_{d≤n/2} q^d ≤ 2q^{n/2}` and from the sign of the leading correction term. Pairs:
the correspondence with `(m, ρ)` is the one of 0.4's count of pairs. Geometric conjugacy: over `𝔽_{q^k}`, `k`
divisible by every degree `|O|ρ_{O,i}` of a factor `𝔽_{q^{|O|ρ_{O,i}}}^×` of either torus, both tori split and
`θ∘N_{F^k/F}` becomes `n` characters of `𝔽_{q^k}^×`, each
orbit `O` contributing its `|O|` conjugates with multiplicity `m(O)`; `S_n` permutes these, so geometric
conjugacy is equality of these multisets. The stabiliser: `N/T^F ≅ ∏_k (ℤ/(|O|k) ≀ S_{a_k})` on the factors of
size `|O|k`, and a rotation by `j` fixes `θ_O∘N` iff `|O| ∣ j` because `θ_O` is regular of degree `|O|`, so the
stabiliser is `∏_k (ℤ/k ≀ S_{a_k})`, of order `z_{ρ_O}`; distinct orbits give distinct characters.

*Needs:* 0.2, 0.4; 4.8; Mathlib `GaloisField`, `ArithmeticFunction.moebius`.

**Checks.**
- `n = 2`: `q² − q` regular characters of `𝔽_{q²}^×` in `½q(q−1)` orbits, the cuspidal count of
  CharacterTheory Layer 9.
- `n = 1`: every character of `𝔽_q^×` is regular, and `N*_q(1) = q − 1`, not `q`: the polynomial `X` is excluded.
- Two labels with the same tori and different characters: for `θ ≠ θ'` in `L₁`, the label `2·{θ} + {θ'}` with
  `ρ = ((2), (1))` and the label `{θ} + 2·{θ'}` with `ρ = ((1), (2))` give tori of the same type `(2, 1)` in `GL₃`
  and non-conjugate pairs.

### 5.2 Green's cuspidal characters

For a regular `θ ∈ L_n`, `σ_θ = (−1)^{n−1} R_{T_{(n)}}^G(θ)` is an irreducible cuspidal character of
`GL_n(𝔽_q)` of degree `ψ_{n−1}(q)`; `σ_θ = σ_{θ'}` iff `θ' = θ^{q^j}` for some `j`. Further: `σ_θ` has central
character `θ|_{𝔽_q^×}`; `σ_θ ⊗ (α∘det) = σ_{θ·(α∘N)}` for `α ∈ L_1`; `σ_θ^∨ = σ_{θ⁻¹}`; at a regular elliptic
element with eigenvalue `z ∈ 𝔽_{q^n}`, `σ_θ = (−1)^{n−1} Σ_{j=0}^{n−1} θ(z^{q^j})`; at a regular semisimple
element that is not elliptic, `σ_θ = 0`; at `su` with `s` semisimple, `σ_θ(su) = 0` unless the characteristic
polynomial of `s` is `P^{n/d}` with `P` irreducible of degree `d ∣ n`, in which case, with `z` a root of `P` and
`ℓ_d(u)` the number of Jordan blocks of `u` in `C(s)^F ≅ GL_{n/d}(𝔽_{q^d})`,
`σ_θ(su) = (−1)^{n−1} (Σ_{j=0}^{d−1} θ(z^{q^j}))·∏_{i=1}^{ℓ_d(u)−1}(1 − q^{di})`. (That every cuspidal character is
some `σ_θ` is 5.5.) Finally, distinct `σ_θ` have distinct restrictions to the regular elliptic elements: if
`θ, θ' ∈ L_n` are regular and `Σ_jθ(z^{q^j}) = Σ_jθ'(z^{q^j})` for every `z ∈ 𝔽_{q^n}` of degree `n`, then
`θ' = θ^{q^j}` for some `j`. The existence of `σ_θ` with its
degree and values is stated as `exists_cuspidal_of_regular`, with `IsCuspidal` (cuspidality as in 1.1, tested on the
standard maximal parabolic subgroups) and `HasCuspidalValues` (the values above).

*Route.* Irreducibility and sign: `θ` regular is in general position for `T_{(n)}` (the Weyl group acts by
Frobenius), so 4.7(b) applies, and `ε_G ε_{T_{(n)}} = (−1)^{n−1}`. Cuspidality from 4.9 and 5.1. Degree from
4.7(a). Distinctness and the orbit criterion from 4.4. Central character, twist and dual from the
definition of `R_T^G` (the centre acts through `θ` on `Y_U`; `R_T^G(θ)⊗(α∘det) = R_T^G(θ·α∘det|_T)`;
`R_T^G(θ)^∨ = R_T^G(θ⁻¹)` by 3.1). Values: 4.3, where for `s` with characteristic polynomial `P^{n/d}` the
torus `T_{(n)}` lies in `C(s) ≅ Res_{𝔽_{q^d}/𝔽_q}GL_{n/d}`, and for other `s` no conjugate of `s` lies in `T_{(n)}`; it remains to
show that the Green function `Q^{C(s)}_{T_{(n)}}` at a unipotent element with `ℓ_d(u)` blocks is `∏_{i=1}^{ℓ_d(u)−1}(1 − q^{di})`.
Over `k̄`, `C(s)` is a product of `d` copies of `GL_{n/d}` permuted cyclically by `F`, and projection to the first factor
identifies `C(s)^F` with `GL_{n/d}(𝔽_{q^d})` and the rational parabolic and Levi subgroups of `C(s)`, with their rational points
and unipotent radicals, with the parabolic and Levi subgroups of `GL_{n/d}` defined over `𝔽_{q^d}`; so it identifies the
Harish-Chandra functors and cuspidality on both sides. It does not identify Deligne–Lusztig varieties (Checks), and none
is needed: `T_{(n)}` lies in no proper rational Levi subgroup of `C(s)` (its rational points `𝔽_{q^n}^×` act irreducibly on
`𝔽_{q^d}^{n/d}`), `N_{C(s)^F}(T_{(n)})/T_{(n)}^F ≅ ℤ/(n/d)` acts by `x ↦ x^{q^d}`, and for a character `θ′` of `𝔽_{q^n}^×` with
`n/d` distinct `q^d`-conjugates (one exists, by the count in the route of 4.10 over `𝔽_{q^d}`) 4.9 applied in `C(s)` makes `ε_{C(s)}ε_{T_{(n)}}R^{C(s)}_{T_{(n)}}(θ′)`,
`ε_{C(s)}ε_{T_{(n)}} = (−1)^{n/d−1}` (`r(C(s)) = n/d`, `r(T_{(n)}) = 1`), an irreducible cuspidal character of
`GL_{n/d}(𝔽_{q^d})`; its values at unipotent elements are 2.4(c) for `GL_{n/d}(𝔽_{q^d})`, and on unipotent elements it is
`(−1)^{n/d−1}Q^{C(s)}_{T_{(n)}}` (4.2), which gives the product. Separation: identify the characters of the cyclic group
`𝔽_{q^n}^×`, of order `N = q^n − 1`, with `ℤ/N`. If the orbit sums agree on the elements of degree `n`, the function
`f = Σ_jθ^{q^j} − Σ_jθ'^{q^j}` vanishes off `⋃_{p∣n}𝔽_{q^{n/p}}^×` (`p` prime), so it is a sum of functions supported
on the subgroups `𝔽_{q^{n/p}}^×`, and its Fourier transform `f̂ = 1_O − 1_{O'}` (`O`, `O'` the two Frobenius orbits,
supposed distinct) is a sum of functions `h_p` invariant under translation by the group `K_p` of characters trivial
on `𝔽_{q^{n/p}}^×`. The averaging operators `A_p` over the `K_p` commute and fix `h_p`, so `∏_p(1 − A_p)f̂ = 0`.
Expand at a point `θ ∈ O`: the term of the empty set of primes is `1`; the term of a nonempty set `S` averages over
the characters trivial on `𝔽_{q^{d_S}}^×`, `d_S = n/∏_{p∈S}p`, a group of order `(q^n − 1)/(q^{d_S} − 1)` whose cosets
meet each orbit in at most `n` points, so it has absolute value at most `n(q^{d_S} − 1)/(q^n − 1)`. Hence
`q^n − 1 ≤ nΣ_{S≠∅}(q^{d_S} − 1) < 2nq^{n/2}`, the `d_S` being distinct divisors of `n` at most `n/2`. This is
impossible once `q^{n/2} ≥ 2n + 1`; the other pairs with `n ≥ 2` are `(2, n)` for `2 ≤ n ≤ 8`, `(3, 2)`, `(3, 3)` and `(4, 2)`,
and for each of them except `(2, 6)` the first inequality fails by inspection. For `q = 2` the term of a set `S` with
`d_S = 1` is exactly `0`: the characters trivial on `𝔽_2^× = 1` are all characters, and the average of `1_O − 1_{O'}` over all of
them is `(|O| − |O'|)/N = 0`, both orbits having `n` elements. Dropping that term, the inequality at `(2, 6)` reads
`63 ≤ 6·((2³ − 1) + (2² − 1)) = 60`, which is false. (For `n = 1` there is nothing to prove.)

*Needs:* 4.3–4.9; 5.1; 2.4(c); Mathlib `GaloisField`, Fourier analysis on finite abelian groups (`AddChar`).

**Checks.**
- `n = 1`: `σ_θ = θ`.
- The separation clause is about equality of the orbit sums and does not extend to proportionality: for `(q, n) = (3, 2)`,
  `θ` a generator of the character group of `𝔽_9^×` and `α₀` the quadratic character of `𝔽_3^×`, the orbit sums of `θ` and
  of `θ⁵ = θ·(α₀∘N)` are opposite at all six elements of degree `2` (both vanish at the two elements of norm `1`, and
  `α₀(N z) = −1` at the other four).
- A non-regular `θ = α∘N_{𝔽_{q²}/𝔽_q}` on `𝔽_{q²}^×` gives `−R_{T_s}^G(θ) = α·St − α∘det`, not a
  character: the regularity hypothesis is needed for irreducibility.
- At a regular unipotent element `σ_θ = (−1)^{n−1}`; at `1` the formula gives
  `(−1)^{n−1}∏_{i=1}^{n−1}(1−q^i) = ψ_{n−1}(q)`, the degree.
- The restriction of scalars and the group over the larger field share rational points, parabolic subgroups and
  Harish-Chandra functors, not Deligne–Lusztig varieties: for `C = Res_{𝔽_{q³}/𝔽_q}GL₂` (over `k̄`, `GL₂³` with `F` permuting the
  factors cyclically) the relative position `(s, s, s)` is `F`-conjugate to `(s, 1, 1)`, and both give the Coxeter torus of
  `GL₂(𝔽_{q³})`; by 4.1 the variety of `C` for `(s, s, s)` has dimension `3`, that of `GL₂` over `𝔽_{q³}` for its Coxeter torus
  dimension `1`.

### 5.3 Comparison with `GL₂(𝔽_q)`

For a quadratic extension `E/𝔽_q` and `θ : E^× → ℂ^×` with `θ^q ≠ θ`, the cuspidal representation
`TauCeti.GL2Cuspidal θ` of CharacterTheory Layer 9 has character `σ_θ`, transported along the isomorphism
`E ≅ 𝔽_{q²}`.

*Route.* Both are class functions; compare on the four class families of 0.4 using the pinned values
(at an elliptic element `u ∈ E ∖ 𝔽_q` the pinned value is `−(θ(u) + θ(u^q))`) and 5.2.

*Needs:* 5.2; CharacterTheory Layer 9 (pinned `GL₂` objects and values).

### 5.4 The characteristic map of a label

Fix a label `m` of degree `n`, the cuspidal characters `σ_O = σ_{θ_O}` of `GL_{|O|}(𝔽_q)` (5.2), the Levi
subgroup `L_m = ∏_O GL_{|O|}^{m(O)}` and `σ_m = ⊠_O σ_O^{⊠m(O)}`. Let `Λ_m = ⊗_O Λ^{m(O)}` (degree-`m(O)` parts,
complex coefficients) with the tensor product of the Hall inner products, and define the linear map
`ch_m : Λ_m → class functions on GL_n(𝔽_q)` by `ch_m(⊗_O p_{ρ_O}) = (−1)^{n + Σ_O m(O)} R_{T_{m,ρ}}^G(θ_{m,ρ})`
(5.1). Then:
(a) `ch_m` is an isometry onto the span `V_m` of the `R_T^G(θ)` with `(T, θ)` of label `m`, and `V_m` is the span
of the Lusztig series `E_m` of label `m`; the `V_m` are pairwise orthogonal and span all class functions;
(b) `ch_{m'+m''}(f'·f'') = ch_{m'}(f') × ch_{m''}(f'')` (Harish-Chandra product from `GL_{n'} × GL_{n''}`);
in particular `ch_m(⊗_O p_1^{m(O)}) = R_{L_m}^G(σ_m)`;
(c) `γ_m = ch_m(⊗_O e_{m(O)})` is an irreducible character, the unique constituent of `Γ_ψ` in `E_m`;
(d) for every Green datum `λ` with label `m`, `χ_λ = ch_m(⊗_O s_{λ(O)})` is an irreducible character; the `χ_λ`
are pairwise distinct, `E_m = {χ_λ : |λ| = m}`, and `E_m` is the Harish-Chandra series of `(L_m, σ_m)`, with
`⟨χ_λ, R_{L_m}^G σ_m⟩ = ∏_O f^{λ(O)}`.

*Route.* (a) 4.4 with 5.1: pairs of label `m` with different `ρ` are not conjugate, and
`⟨R_{T_{m,ρ}}(θ_{m,ρ}), R_{T_{m,ρ}}(θ_{m,ρ})⟩ = ∏_O z_{ρ_O} = ⟨⊗p_{ρ_O}, ⊗p_{ρ_O}⟩`; pairs of different labels
are not geometrically conjugate, so the `V_m` are orthogonal. `dim V_m = dim Λ_m = ∏_O p(m(O))` and
`Σ_m ∏_O p(m(O)) = k_n(q)`, the number of classes of pairs (0.4), which is the dimension of the space of class
functions; so `⊕_m V_m` is everything. Each `V_m` lies in the span of `E_m`, and the spans of the `E_m` are
orthogonal: this is the disjointness of Lusztig series (4.8, a common constituent of two Deligne–Lusztig
characters forces geometric conjugacy), the one input of this target that rests on the module forms of Layer 3.
Hence `V_m = span E_m`, and (c), (d) and every later statement of this layer depend on it. (b) 4.5(a):
`T_{m',ρ'} × T_{m'',ρ''}` inside `GL_{n'} × GL_{n''}` is `T_{m,ρ'∪ρ''}`, and the signs multiply. (c) The projection of `Γ_ψ` to `span E_m = V_m`
pairs with `ch_m(⊗p_{ρ_O})` to `(−1)^{n+Σm(O)}ε_Gε_{T_{m,ρ}} = (−1)^{Σ_O(m(O) − ℓ(ρ_O))}` (4.11, 5.1), which is
`⟨⊗p_{ρ_O}, ⊗e_{m(O)}⟩`; so the projection is `ch_m(⊗e_{m(O)})`, of norm one, and since `Γ_ψ` is an actual
character the projection is a single irreducible character. (d) Products of the characters of (c) for
smaller labels are actual characters (b), so `ch_m` maps `⊗_O Λ_ℤ^{m(O)}`, spanned over `ℤ` by products of the
`e_k`, into virtual characters; the `ch_m(⊗s_{λ(O)})` are virtual characters forming an orthonormal basis of
`span E_m`, hence `±` the elements of `E_m`, and `⟨ch_m(⊗s_{λ(O)}), R_{L_m}^G σ_m⟩ = ⟨⊗s_{λ(O)}, ⊗p_1^{m(O)}⟩ = ∏f^{λ(O)} > 0`
fixes the sign and shows that every element of `E_m` is a constituent of `R_{L_m}^G σ_m`, whose constituents lie
in `E_m`.

*Needs:* 0.4; 4.4, 4.5, 4.8, 4.11; 5.1, 5.2; SchurWeyl Layer 7 (§§7.5–7.7: `Λ`, Hall form, Jacobi–Trudi, power
sums).

**Checks.**
- `n = 2`, `m = 2·{1}`: `ch(h₂) = ½(R_{T₁}(1) + R_{T_s}(1)) = 1` and `ch(e₂) = ½(R_{T₁}(1) − R_{T_s}(1)) = St`, the
  constituent of `Γ_ψ` in the unipotent series.
- `n = 2`, `m = {θ}` with `|O| = 2`: `ch_m(p₁) = (−1)^{2+1}R_{T_s}(θ) = σ_θ`.
- The sign `(−1)^{n+Σm(O)}` cannot be dropped: without it `ch_m(p₁)` for an orbit of size `2` is `−σ_θ`.

### 5.5 Green's parametrisation and degree formula

The irreducible characters of `GL_n(𝔽_q)` are the `χ_λ` of 5.4, `λ` running over the Green data of weight
`n`, without repetition. Its degree is `χ_λ(1) = ψ_n(q) ∏_O q_O^{n(λ(O))} / H̃_{λ(O)}(q_O)`. Twisting and
duality: `χ_λ ⊗ (α∘det) = χ_{α·λ}` (orbits multiplied by `α ∈ L_1`) and `χ_λ^∨ = χ_{λ∘inv}`. The number of
irreducible characters is `k_n(q)` (0.4). Every irreducible cuspidal character is some `σ_θ`; so the cuspidal
characters are in bijection with the Frobenius orbits of degree `n`, and there are `N*_q(n)` of them. Part of
this target is the **`q`-hook formula** in `Λ`: the principal specialisation `s_μ(1, t, t², …) = t^{n(μ)} ∏_{boxes} (1 − t^{h(box)})^{−1}`, as an identity in `ℤ[[t]]`. That every
irreducible cuspidal character is some `σ_θ` is stated as `exists_regular_of_isCuspidal`.

*Route.* 5.4(a),(d): the `E_m` partition the irreducible characters and `E_m = {χ_λ : |λ| = m}` without
repetition. The degree: `ch_m(⊗p_{ρ_O})(1) = (−1)^{Σ_O(m(O) − ℓ(ρ_O))}ψ_n(q)/∏_{O,i}(q_O^{ρ_{O,i}} − 1)` by 4.7(a)
and 5.1, which is `ψ_n(q)` times the value at `⊗p_{ρ_O}` of the specialisation `f ↦ ∏_O (−1)^{deg f_O}f_O(1, t, t², …)|_{t=q_O}`
(`p_k(1, t, …) = (1 − t^k)⁻¹`); expand `s_μ = Σ_ρ χ^μ(ρ)p_ρ/z_ρ` (SchurWeyl §7.6) and apply the `q`-hook formula. The
`q`-hook formula: the bialternant formula at `x_i = t^{i−1}`, `i ≤ N`, is a ratio of Vandermonde determinants in
powers of `t`, giving `s_μ(1, …, t^{N−1}) = t^{n(μ)}∏_{boxes}(1 − t^{N+c(box)})/(1 − t^{h(box)})`, `c` the content;
let `N → ∞` in `ℤ[[t]]` (Macdonald, Ch. I §3, Examples 1–2). Twisting and duality: for every pair `(T, θ)`,
`R_T(θ) ⊗ (α∘det) = R_T(θ·(α∘det)|_{T^F})` and `R_T(θ)^∨ = R_T(θ⁻¹)` (4.3: `det(su) = det s`, and the Green functions are rational
integers, `Q(u⁻¹) = Q(u)`). For the pairs of 5.1, `α∘det` restricted to `T_{m,ρ}^F` is `⊠_{O,i} α∘N_{𝔽_{q^{|O|ρ_{O,i}}}/𝔽_q}`, so
`θ_{m,ρ}·(α∘det) = θ_{α·m,ρ}` with the representatives `θ_O·(α∘N_{𝔽_{q^{|O|}}/𝔽_q})` of the orbits `α·O`, and `θ_{m,ρ}⁻¹ = θ_{m∘inv,ρ}`;
the orbit sizes and the signs of 5.4 are unchanged. Hence `ch_m(f) ⊗ (α∘det) = ch_{α·m}(f)` and `ch_m(f)^∨ = ch_{m∘inv}(f)` for every
`f ∈ Λ_m` (the tensor factors transported along `O ↦ α·O`, `O ↦ O⁻¹`), first for `f = ⊗_O p_{ρ_O}` and then by linearity; at
`f = ⊗_O s_{λ(O)}` this is the formula. Knowing the two operations only on cuspidal characters and their compatibility with
Harish-Chandra products would not suffice: that fixes their effect on `p₁` in each tensor factor, and the involution
`s_μ ↦ s_{μ′}` of `Λ` also preserves products and fixes `p₁`. Cuspidal
characters: `χ_λ` lies in the Harish-Chandra series of `(L_m, σ_m)` (5.4(d)), so it is cuspidal iff `L_m = G`, iff
`m` is a single orbit of size `n` with `m(O) = 1`, iff `χ_λ = σ_θ`.

*Needs:* 5.2, 5.4; 0.4; 4.7; SchurWeyl Layer 7 (Schur functions, Jacobi–Trudi, the Frobenius
characteristic, Hall form).

**Checks.**
- `λ = (n)` at the orbit of `1` gives degree `1` (the trivial character); `λ = (1^n)` there gives
  `q^{n(n−1)/2}`, the Steinberg character; `λ = (1)` at an orbit of size `n` gives `ψ_{n−1}(q)`, `σ_θ`.
  Exchanging `λ(O)` with its conjugate partition throughout would swap the first two: this Check pins the
  convention.
- `GL₂`: `(2)` at `{α}`: degree 1; `(1,1)` at `{α}`: `q`; `(1)` at `{α}`, `(1)` at `{β}`, `α ≠ β`: `q + 1`;
  `(1)` at an orbit of size 2: `q − 1`; with counts `q−1, q−1, ½(q−1)(q−2), ½q(q−1)` and
  `Σ deg² = |GL₂(𝔽_q)|` (CharacterTheory 9.2).
- `GL₃`, `λ = (2,1)` at `{1}`: `n((2,1)) = 1`, hooks `3, 1, 1`, degree `q(q+1)`, as in 1.4's Check.

### 5.6 Uniformity and Green functions

(a) Every class function on `GL_n(𝔽_q)` is a linear combination of the `R_T^G(θ)`. Explicitly, for a Green datum
`λ` of label `m`,
`χ_λ = (−1)^{n+Σ_O m(O)} Σ_ρ (∏_O χ^{λ(O)}(ρ_O)/z_{ρ_O}) R_{T_{m,ρ}}^G(θ_{m,ρ})`, the sum over tuples `ρ = (ρ_O)`,
`ρ_O ⊢ m(O)`, with `χ^μ` the irreducible character of `S_{|μ|}` of SchurWeyl Layer 4 (`χ^{(k)}` trivial). For a
unipotent character this is `χ_μ = (n!)⁻¹ Σ_{w∈S_n} χ^μ(w) R_{T_w}^G(1)`. Special values of Green functions:
`Q_{T_τ}^G(u_{(n)}) = 1`; `Q_{T_τ}^G(1) = (−1)^{n−ℓ(τ)} ψ_n(q)/∏_i (q^{τ_i} − 1)`;
`Q_{T_{(n)}}^G(u_μ) = ∏_{i=1}^{ℓ(μ)−1}(1 − q^i)`.
(b) (Green's virtual characters and eigenvalue sums.) For `θ ∈ L_n`, regular or not, `R_{T_{(n)}}^G(θ)` (4.2) is called
**Green's virtual character** of `θ`; it is `(−1)^{n−1}σ_θ` when `θ` is regular (5.2), and `*R_L^G R_{T_{(n)}}^G(θ) = 0` for every
proper rational Levi subgroup `L`. For a homomorphism `θ̃ : k̄^× → ℂ^×` let `b_{θ̃}^{(n)}(x) = Σ_α θ̃(α)`, the sum over the
eigenvalues `α ∈ k̄^×` of `x ∈ GL_n(𝔽_q)` counted with multiplicity. Then
`b_{θ̃}^{(n)} = Σ_{a=1}^{n} R_{GL_a×GL_{n−a}}^{GL_n}(R_{T_{(a)}}^{GL_a}(θ̃|_{𝔽_{q^a}^×}) ⊠ 1_{GL_{n−a}(𝔽_q)})`
(the term `a = n` is `R_{T_{(n)}}^G(θ̃|_{𝔽_{q^n}^×})`); in particular `b_{θ̃}^{(n)}` is a virtual character.

*Route.* (a) 5.4(a) for uniformity; the formula is 5.4's definition of `ch_m` applied to
`⊗_O s_{λ(O)} = ⊗_O Σ_{ρ_O} χ^{λ(O)}(ρ_O)p_{ρ_O}/z_{ρ_O}` (SchurWeyl §7.6). Special values: 4.10, 4.7(a) with 5.1,
and 2.4(c) with 5.2 (`Q_{T_{(n)}} = (−1)^{n−1}σ_θ` on unipotent elements). (b) The vanishing of the Harish-Chandra restrictions
is 4.5(b): `T_{(n)}` lies in no proper rational Levi subgroup (5.1), so the index set there is empty. Write `β_a` for
`R_{T_{(a)}}^{GL_a}(θ̃|_{𝔽_{q^a}^×})` and `γ_n = b^{(n)} − Σ_{a<n} R(β_a ⊠ 1)`. For `0 < c < n`, the Harish-Chandra restriction
to `GL_c × GL_{n−c}` of `b^{(n)}` is `b^{(c)} ⊠ 1 + 1 ⊠ b^{(n−c)}` (an average over the unipotent radical of a function of the
eigenvalues, which are those of the two diagonal blocks). By the Mackey formula (ReductiveGroups 7d) the restriction of
`R(β_a ⊠ 1_{GL_{n−a}})` to `GL_c × GL_{n−c}` is a sum over the splittings `a = a₁ + a₂` with `a₁ ≤ c`, `a₂ ≤ n − c` (the double
cosets of these two Levi subgroups), in which `β_a` enters through its restriction to `GL_{a₁} × GL_{a₂}`. For `a < n` only
`a₁ = 0` and `a₂ = 0` survive (the clause just proved), and as `*R(1) = 1 ⊠ 1` these terms are `R(β_a ⊠ 1_{GL_{c−a}}) ⊠ 1` (if
`a ≤ c`) and `1 ⊠ R(β_a ⊠ 1_{GL_{n−c−a}})` (if `a ≤ n − c`). Summing over `a < n` gives `b^{(c)} ⊠ 1 + 1 ⊠ b^{(n−c)}` by the
formula in the ranks `c, n − c < n` (induction on `n`), so `γ_n` is killed by every proper
Harish-Chandra restriction. Such a class function is orthogonal to every Harish-Chandra induced function (adjunction),
in particular to `R_{T_τ}(θ′)` for `τ ≠ (n)` (4.5(a): `T_τ` lies in a proper rational Levi subgroup); by (a) it lies in the span
of the `R_{T_{(n)}}(θ′)`. By 4.5(d), applied to the function `b^{(n)}` of the semisimple part,
`⟨γ_n, R_{T_{(n)}}(θ′)⟩ = ⟨b^{(n)}, R_{T_{(n)}}(θ′)⟩ = (q^n − 1)⁻¹ Σ_{z ∈ 𝔽_{q^n}^×} Σ_{j<n} θ̃(z^{q^j})·conj(θ′(z))` (the eigenvalues of `z` in
`T_{(n)}^F ≅ 𝔽_{q^n}^×` are its conjugates), which is the number of `j < n` with `θ^{q^j} = θ′`, `θ = θ̃|_{𝔽_{q^n}^×}`, and
equals `⟨R_{T_{(n)}}(θ), R_{T_{(n)}}(θ′)⟩` (4.4). So `γ_n − β_n` lies in that span and is orthogonal to it: `γ_n = β_n`. Virtuality:
`R_T(θ)` is a virtual character (4.2) and Harish-Chandra induction preserves virtual characters.

*Needs:* 4.2, 4.4, 4.5, 4.7, 4.10; 5.1, 5.2, 5.4; 2.4(c); ReductiveGroups 7c, 7d; SchurWeyl Layers 4, 7.

**Checks.**
- `n = 2`: `χ_{(2)} = ½(R_{T₁}(1) + R_{T_s}(1)) = 1` and `χ_{(1,1)} = ½(R_{T₁}(1) − R_{T_s}(1)) = St`.
- `Q_{T_{(n)}}^G(1) = ∏_{i=1}^{n−1}(1−q^i)`, which agrees with the second special value at `τ = (n)`.
- (b) for `n = 1`: `b = θ̃|_{𝔽_q^×} = R_{T_{(1)}}(θ̃)`. For `n = 2` at a central element `a`:
  `Ind_B(θ̃ ⊠ 1)(a) + R_{T_s}(θ̃|_{𝔽_{q²}^×})(a) = (q + 1)θ̃(a) + (1 − q)θ̃(a) = 2θ̃(a) = b(a)`; with `σ_θ` in place of Green's
  virtual character the value would be `2qθ̃(a)`: the sign matters, and the formula holds also for non-regular `θ̃|_{𝔽_{q²}^×}`
  (for which `σ_θ` is not defined). By computation the formula holds for every `θ̃` on `GL₂(𝔽_q)`, `q = 2, 3, 4, 5, 7`, and
  on `GL₃(𝔽₂)`, and for 61 characters `θ̃` on `GL₃(𝔽₃)`, with the Harish-Chandra induction computed over the group.

### 5.7 Generic and semisimple characters; labels

The **semisimple label** of `χ_λ` is `|λ| : O ↦ |λ(O)|`; in the labelled form it is the monic polynomial
`∏_O P_O^{m(O)}` of degree `n` with nonzero constant term. The irreducible characters of label `m` form one
Harish-Chandra series (of `(L_m, σ_m)`) and one Lusztig series. `χ_λ` is generic iff every `λ(O)` is a column
`(1^{m(O)})`; it is called **semisimple** iff every `λ(O)` is a row `(m(O))`. Each label carries exactly one
generic and one semisimple character; there are `q^n − q^{n−1}` of each, with degrees
`q^{N(m)} ψ_n(q)/∏_O ψ_{m(O)}(q_O)` (generic), `N(m) = Σ_O |O|·m(O)(m(O)−1)/2`, and
`ψ_n(q)/∏_O ψ_{m(O)}(q_O)` (semisimple). The central idempotent `z_m` of `ℂ[GL_n(𝔽_q)]` cutting out the
characters of label `m` exists, and the `z_m` are orthogonal with sum `1`; `Γ_ψ = Σ_m χ_{gen(m)}`.

*Route.* The two series from 5.4(a),(d). Genericity: 5.4(c), `γ_m = χ_λ` for the columns, is the only
constituent of `Γ_ψ` of label `m`, and `Γ_ψ` is multiplicity free (2.2), so `Γ_ψ = Σ_m γ_m`. Degrees from 5.5:
a column of length `k` has `n((1^k)) = k(k−1)/2` and `H̃_{(1^k)}(t) = ψ_k(t)`, a row has `n = 0` and the same hook
product. The idempotents: sums of the central idempotents of the characters of each label (CharacterTheory
§3.5). The count: labels are monic polynomials of degree `n` with nonzero constant term (0.4).

*Needs:* 2.2; 5.4, 5.5; 0.4; CharacterTheory §3.5.

**Checks.**
- The unipotent label `(X − 1)^n` has generic character `St` (degree `q^{n(n−1)/2}`) and semisimple
  character `1`.
- `GL₂`: generic characters are the twisted Steinbergs, the irreducible principal series and the cuspidals,
  `(q−1) + ½(q−1)(q−2) + ½q(q−1) = q² − q`.

### 5.8 Gelfand–Graev weights of labels

(a) The **weight** of a label `m` is `wt(m) = (Γ_ψ z_m)(1)/Γ_ψ(1)`, the share of the Gelfand–Graev
representation in the series `m`. Then `Σ_m wt(m) = 1` and `wt(m) = q^{N(m)}/∏_O ψ_{m(O)}(q_O)`. For squarefree
labels (`m(O) ≤ 1` for every `O`), `wt(m) = ∏_{m(O)=1} (q_O − 1)⁻¹`, so
`q^{−n} ≤ wt(m) ≤ q^{−n} ∏_{m(O)=1}(1 − q_O^{−1})^{−1}`; the total weight of the labels that are not squarefree
is at most `2/q`. For a representation `V` of `GL_n(𝔽_q)` contained in `c` copies of the regular representation
and a set `S` of labels, `dim Hom_{U^F}(ψ, z_S V) ≤ c·(|GL_n(𝔽_q)|/|U^F|)·Σ_{m∈S} wt(m)`, `z_S = Σ_{m∈S} z_m`. For a
product of groups `GL_{n_v}(𝔽_{q_v})` the weights of tuples of labels are the products of the weights.
(b) (Degenerate Gelfand–Graev representations.) For a composition `λ = (λ₁, …, λ_s)` of `n` and the degenerate
Gelfand–Graev representation `Γ_λ = Ind_{U^F}^{G^F}ψ_λ ≅ R_{M_λ}^G(Γ^{M_λ})` of 2.6(c), `⟨χ, Γ_λ⟩` is for irreducible `χ` the
number, with multiplicity, of generic constituents of `*R_{M_λ}^G χ` (2.6(c)); and for a squarefree label `m` with orbits
`O₁, …, O_t`, `⟨χ_{gen(m)}, Γ_λ⟩` is the number of maps `c : {1, …, t} → {1, …, s}` with `Σ_{c(j)=i}|O_j| = λ_i` for every `i`, so
that the share of the series `m` in `Γ_λ` is that number times `wt(m)`.
(c) (Shares in the Bessel-type induced representations.) Let `(H_i, ϕ_i)` be as in 2.7(b) for some `1 ≤ k ≤ n − 1`, `e_{H_i,ϕ_i}`
the idempotent of `ϕ_i` in `ℂ[H_i]`, and `wt_H(m) = (e_{H_i,ϕ_i}z_m)(1)/e_{H_i,ϕ_i}(1)` the share of the series `m` in
`Ind_{H_i}^{G^F}ϕ_i`; let `wt_{(j,n−j)}(m)` be the share of `m` in `Γ_{(j,n−j)}` (`wt_{(0,n)} = wt`). Then
`wt_H(m) = q^{−k}·(wt_{(k,n−k)}(m) + Σ_{j=0}^{k−1}(q^{k−j} − q^{k−j−1})·wt_{(j,n−j)}(m))` and `wt_H(m) ≥ (1 − q^{−1})·wt(m)` for every
label `m`. For a squarefree label with orbits of sizes `d₁, …, d_t` and `c_j = #{I ⊂ {1, …, t} : Σ_{l∈I} d_l = j}`,
`wt_H(m) = wt(m)·((1 − q^{−1})Σ_{j=0}^{k−1} c_jq^{−j} + c_kq^{−k})`, which lies between `(1 − q^{−1})·wt(m)` and
`wt(m)·∏_l(1 + q^{−d_l})`, with equality on the left iff no sum of some of the `d_l` lies in `[1, k]`. The labels that are not
squarefree have total share at most `3/q` in `Ind_{H_i}^{G^F}ϕ_i`.

*Route.* (a) `Γ_ψ z_m = χ_{gen(m)}` (5.7) and `Γ_ψ(1) = |G^F|/|U^F| = ψ_n(q)` give the formula from 5.7's degree.
For the bound: squarefree labels have `wt ≥ q^{−n}`, and the number of squarefree monic polynomials of degree `n`
with nonzero constant term satisfies `S′_n = q^n − q^{n−1} − S′_{n−1} ≥ q^n − 2q^{n−1}` for `n ≥ 2` (splitting off a
factor `X`, `S′_n + S′_{n−1}` is the number `q^n − q^{n−1}` of all squarefree monic polynomials of degree `n`; and
`S′_{n−1} ≤ q^{n−1}`), so the squarefree labels carry weight at least `1 − 2/q`. The inequality for `V`:
in `c·ℂ[G^F] = c·⊕_π π^{dim π}` the `ψ`-isotypic part of `z_S`'s range has dimension `c·Σ_{π ∈ S} dim π·m_π`
`= c·Γ_ψ(1)·Σ_{m∈S} wt(m)`. (b) The identification of `Γ_λ` and the multiplicity are 2.6(c). For squarefree `m`,
`χ_{gen(m)} = R_{L_m}^G(σ_m)` is irreducible (5.4(d), the series has one element), and the Mackey formula (ReductiveGroups
7d) with cuspidality writes `*R_{M_λ}^G R_{L_m}^G(σ_m)` as the sum over the maps `c` of the products `⊠_i (×_{c(j)=i} σ_{O_j})`,
each irreducible and generic for `M_λ` (5.4(d) and 5.7 on each block). (c) The share of `m` in a representation `V` is
`dim z_mV/dim V`, and `(a·e_χ)(1) = (χ(1)/|G^F|)·tr(a, χ)` for the central idempotent `e_χ`, so
`wt_H(m) = Σ_{χ∈E_m} χ(1)⟨χ|_{H_i}, ϕ_i⟩/[G^F : H_i]`. Insert 2.7(b), with `[G^F : H_i] = q^k·|G^F|/|U^F|` and
`dim Γ_{(j,n−j)} = |G^F|/|U^F|` for every `j`; the lower bound keeps only the term `j = 0`. For squarefree `m`,
`⟨χ_{gen(m)}, Γ_{(j,n−j)}⟩ = c_j` by (b) with `λ = (j, n − j)`, so `wt_{(j,n−j)}(m) = c_j·wt(m)`; the upper bound from
`q^{k−j} − q^{k−j−1} ≤ q^{k−j}` and `Σ_{j≤k} c_jq^{−j} ≤ ∏_l(1 + q^{−d_l})`. The shares in `Ind_{H_i}^{G^F}ϕ_i` sum to `1`, and by the
lower bound and (a) the squarefree labels carry at least `(1 − q^{−1})(1 − 2q^{−1}) ≥ 1 − 3q^{−1}`.

*Needs:* 5.4, 5.5, 5.7; 2.2, 2.3, 2.6, 2.7; ReductiveGroups 7d; CharacterTheory §3.5.

**Checks.**
- `n = 1`: every label is squarefree and `wt = 1/(q−1)` for each of the `q − 1` labels.
- `n = 2`: the `½(q−1)(q−2)` labels `(X−a)(X−b)`, `a ≠ b`, have weight `(q−1)^{−2}` (total
  `(q−2)/(2(q−1))`); the `½q(q−1)` irreducible labels have weight `(q²−1)^{−1}` (total `q/(2(q+1))`); the
  `q − 1` labels `(X−a)²` have `N(m) = 1` and weight `q/((q−1)(q²−1))` (total `q/(q²−1)`, the share of the
  twisted Steinberg characters, of degree `q`, in `Γ_ψ` of degree `(q−1)(q²−1)`). The three totals sum to
  `1`, and the non-squarefree total `q/(q²−1)` is at most `2/q`.
- Using the semisimple degree (no factor `q^{N(m)}`) in place of the generic one would give the labels
  `(X−a)²` total weight `1/(q²−1)` and a sum `q/(q+1) ≠ 1`: the constituent of `Γ_ψ` in a non-squarefree
  series is the generic (Steinberg-type) one, not the semisimple one.
- (b) with `λ = (1^n)`: `Γ_λ = Ind_{U^F}^{G^F} 1`, and for `m` a product of `n` distinct linear factors the count is
  `n!`, the dimension of the `U^F`-invariants of the irreducible principal series. With `λ = (1, 1)` and `m`
  irreducible of degree `2` the count is `0`: a cuspidal character has no `U^F`-fixed vector.
- (c) for `n = 2`, `k = 1`: `H₀ = 1`, `Ind_{H₀}^{G^F}ϕ₀` is the regular representation, and the share of the label
  `(X−a)(X−b)`, `a ≠ b`, is `(q+1)²/|GL₂(𝔽_q)| = (q+1)/(q(q−1)²)`, which is `wt(m)·((1 − q^{−1}) + 2q^{−1})` with `c_1 = 2`; for an
  irreducible label of degree `2` it is `(q−1)²/|GL₂(𝔽_q)| = (1 − q^{−1})·wt(m)`, the lower bound.

### 5.9 Counting

For `n ≥ 1`: the number of cuspidal irreducible characters of `GL_n(𝔽_q)` is `N*_q(n)`; the number of
generic, and of semisimple, irreducible characters is `q^n − q^{n−1}`; the number of irreducible
characters is `k_n(q)`, with generating function `∏_{i≥1}(1 − t^i)/(1 − qt^i)`, and
`q^n − q^{n−1} ≤ k_n(q) ≤ q^n`. Consequently the proportion of generic characters is at least `1 − q^{−1}`, and the
proportion of cuspidal characters lies between `(1 − 2q^{−n/2})/n` and `(1 − q^{−1})^{−1}/n` (`n ≥ 2`).

*Route.* 5.5, 5.7, 0.4, 5.1. The lower bound counts the semisimple classes. The upper bound, for every real
`q ≥ 2`. Expanding each factor `(1 − x)/(1 − qx) = 1 + Σ_{b≥1}(q^b − q^{b−1})x^b` with `x = t^i` gives
`k_n = Σ_{ν⊢n} w(ν)`, `w(ν) = q^{ℓ(ν)}(1 − q^{−1})^{d(ν)}`, `d(ν)` the number of distinct part sizes. Let `𝒫₂` be the
partitions with all parts at least `2` and `g_r = Σ_{μ∈𝒫₂, |μ|=r} w(μ)`, the coefficients of
`∏_{i≥2}(1 − t^i)/(1 − qt^i)`. Splitting off the parts equal to `1`, `k_n = g_n + (1 − q^{−1})Σ_{r<n} q^{n−r}g_r`. At
`t = 1/q` the product telescopes, `∏_{i=2}^M (1 − q^{−i})/(1 − q^{1−i}) = (1 − q^{−M})/(1 − q^{−1})`, and its series has
nonnegative terms and converges there (its poles lie at `|t| = q^{−1/i} > q^{−1}`), so `Σ_r g_rq^{−r} = (1 − q^{−1})⁻¹`,
that is `q^n = (1 − q^{−1})Σ_{r≥0} q^{n−r}g_r`. Subtracting, `q^n − k_n = (1 − q^{−1})Σ_{r>n} q^{n−r}g_r − q^{−1}g_n`, so with
`W(μ) = q^{−|μ|}w(μ)` the claim is `Σ_{μ∈𝒫₂, |μ|=n} W(μ) ≤ (q − 1)Σ_{μ'∈𝒫₂, |μ'|>n} W(μ')`. For `μ ∈ 𝒫₂` of size `n` and
`k ≥ 1` put `A_k(μ) = μ ∪ (2^k)`, and, if `2` is not a part of `μ`, `B_k(μ) = (μ₁ + k, μ₂, …)`. Then
`W(A_k(μ)) = q^{−k}W(μ)` if `2` is a part of `μ` and `q^{−k}(1 − q^{−1})W(μ)` otherwise, and
`W(B_k(μ)) ≥ q^{−k}(1 − q^{−1})W(μ)` (the number of distinct part sizes grows by at most one). These partitions lie
in `𝒫₂`, have size larger than `n`, and are pairwise distinct: `A_k(μ)` has `k` or more parts equal to `2` and size
`n + 2k`, which recovers `(μ, k)`; `B_k(μ)` has no part `2` and its size recovers `k`, then `μ`. With
`(q − 1)Σ_{k≥1}q^{−k} = 1` the right side is at least
`Σ_{2∈μ} W(μ) + (2(q − 1)/q)Σ_{2∉μ} W(μ) ≥ Σ_μ W(μ)`, as `q ≥ 2`. The proportions follow from 5.1's bounds on
`N*_q(n)`.

*Needs:* 0.4; 5.1, 5.5, 5.7.

**Checks.**
- `k₃(q) = q³ − q` and `q³ − q² ≤ q³ − q ≤ q³`; `N*_q(3) = (q³ − q)/3`.
- `q^n − k_n(q)` for `n = 1, …, 6` is `1, 1, q, q, q² + q − 1, q²`, positive and of lower order than `q^n`.
- `k₅(q) = q⁵ − q² − q + 1` while `q·k₄(q) = q⁵ − q²`: `k_n(q) − q k_{n−1}(q)` changes sign, so the bound cannot be
  read off coefficientwise from `Σ q^n t^n = (1 − qt)⁻¹`.

### 5.10 Gauss sums of cuspidal characters

For an irreducible representation `σ` of `GL_n(𝔽_q)` the operator `Σ_{x∈GL_n(𝔽_q)} ψ₀(tr x)σ(x)` commutes with `σ` and is
therefore a scalar `w(σ)`, the **Gauss sum** of `σ`. For `θ ∈ L_n` put `G_n(θ) = Σ_{z∈𝔽_{q^n}^×} θ(z)ψ₀(Tr_{𝔽_{q^n}/𝔽_q} z)`.
(a) For regular `θ ∈ L_n`, `w(σ_θ) = (−1)^{n−1}q^{n(n−1)/2}G_n(θ)`.
(b) (`n = 2`.) If `θ, θ' ∈ L_2` are regular, `θ|_{𝔽_q^×} = θ'|_{𝔽_q^×}` and `G_2(θ·(α∘N)) = G_2(θ'·(α∘N))` for every `α ∈ L_1`, then
`θ' ∈ {θ, θ^q}`: the twisted Gauss sums and the central character determine a cuspidal representation of `GL₂(𝔽_q)`.

*Route.* `x ↦ ψ₀(tr x)` is a class function, so the operator commutes with `σ(GL_n(𝔽_q))` and Schur's lemma applies.
(a) `w(σ_θ)·ψ_{n−1}(q) = Σ_x σ_θ(x)ψ₀(tr x)`. By 5.2, `σ_θ(su) = 0` unless the characteristic polynomial of `s` is `P^m` with `P`
irreducible of degree `d`, `dm = n`, and then `σ_θ(su) = (−1)^{n−1}(Σ_{j<d}θ(z^{q^j}))·Q(u)` with `z` a root of `P` and
`Q(u) = ∏_{i=1}^{ℓ_d(u)−1}(1 − q^{di})` the Green function at `u` of the Coxeter torus `T_c` of `C(s) ≅ GL_m(𝔽_{q^d})` (5.6), while
`tr(su) = m·Tr_{𝔽_{q^d}/𝔽_q}(z) = Tr_{𝔽_{q^n}/𝔽_q}(z)`. For every rational maximal torus `T`, `Σ_{u unipotent} Q_T(u) = |G^F|/|T^F|`:
`Σ_θ R_T(θ)` vanishes off the unipotent elements and equals `|T^F|Q_T` on them (4.3, 4.2), and `Σ_θ⟨R_T(θ), 1⟩ = 1` (4.5(c)).
Applied to `C(s)` and `T_c` (`|T_c^F| = q^n − 1`), the elements with semisimple part conjugate to `s` contribute
`(|G^F|/|C(s)^F|)·(−1)^{n−1}(Σ_{j<d}θ(z^{q^j}))ψ₀(Tr z)·|C(s)^F|/(q^n − 1)`; summing over the classes, each polynomial `P` carrying
its `d` roots, gives `(−1)^{n−1}|G^F|G_n(θ)/(q^n − 1)`, and `|G^F| = q^{n(n−1)/2}ψ_n(q)`. (b) Fourier inversion on `𝔽_q^×`:
`G_2(θ·(α∘N)) = Σ_{t∈𝔽_q^×} α(t)S_θ(t)` with `S_θ(t) = Σ_{N z = t} θ(z)ψ₀(Tr z)`, so the hypothesis says `S_θ = S_{θ'}`. For a generic
irreducible `σ` let `J_σ(g) = |U^F|⁻¹Σ_{u∈U^F} ψ(u)⁻¹χ_σ(gu)`, the trace of `σ(g)` composed with the projection onto the line of
`(U^F, ψ)`-equivariant vectors (2.3). `J_σ` is left and right `(U^F, ψ)`-equivariant, so by the Bruhat decomposition it is
supported on the scalar matrices times `U^F` and on `U^F·T^F·w·U^F`, `w` the nontrivial permutation matrix, and it is
determined by the central character `ω_σ` (`J_σ(z) = ω_σ(z)`) and by `t ↦ J_σ(diag(t, 1)w)`. For `σ = σ_θ`, `diag(t, 1)w·u` has
characteristic polynomial `X² − xX − t` (`x` the entry of `u`), and the values of 5.2 (`−(θ(z) + θ(z^q))` at an elliptic element,
`−θ(a)` at `a` times a regular unipotent element, `0` at a split regular one) give
`J_{σ_θ}(diag(t, 1)w) = −q^{−1}θ(−1)S_θ(−t)`. Distinct generic `σ` have distinct `J_σ`: up to nonzero factors and `g ↦ g⁻¹`,
`J_σ` is the coefficient function of `e_σe_ψ`, `e_σ` the central idempotent of `σ` and `e_ψ` that of `ψ` in `ℂ[U^F]`, a nonzero
element of the two-sided ideal `e_σℂ[G^F]`. As `S_θ = S_{θ'}`, `θ(−1) = θ'(−1)` and the central characters `θ|_{𝔽_q^×}`, `θ'|_{𝔽_q^×}`
agree, `J_{σ_θ} = J_{σ_{θ'}}`, so `σ_θ ≅ σ_{θ'}` (cuspidal representations are generic, 2.4(b)), and 5.2 gives the orbit.

*Needs:* 4.2, 4.3, 4.5; 5.2, 5.6; 2.3, 2.4(b); CharacterTheory §3.5.

**Checks.**
- `n = 1`: `σ_θ = θ` and `w(θ) = G_1(θ)`.
- `n = 2`, over the four class families of 0.4: the central elements contribute `(q−1)Σ_a θ(a)ψ₀(2a)`, the non-semisimple ones
  `−(q²−1)Σ_a θ(a)ψ₀(2a)`, the elliptic ones `−q(q−1)Σ_{z∉𝔽_q}θ(z)ψ₀(Tr z)`, the split ones `0`; the total is `−q(q−1)G_2(θ)`,
  and `w(σ_θ) = −qG_2(θ)`, as (a) says.
- (b) does not extend to all ranks: regular `θ, θ′ ∈ L_n` with the same restriction to `𝔽_q^×` and `G_n(θ·(α∘N)) = G_n(θ′·(α∘N))`
  for every `α ∈ L_1` need not be Frobenius conjugate. For `(q, n) = (2, 8)` the characters `θ`, `θ³` of order `17` are regular
  and not conjugate (`3 ∉ ⟨2⟩` in `(ℤ/17)^×`), and `G_8(θ) = G_8(θ³) = 16`: as `2⁴ ≡ −1 (mod 17)`, `θ⁻¹` is a Frobenius conjugate
  of `θ`, so `G_8(θ) = G_8(θ⁻¹)`, the complex conjugate of `G_8(θ)` (`ψ₀` is real); so `G_8(θ)` is real of absolute value `16`, hence
  rational, hence equal to all its Galois conjugates `G_8(θ^c)`. For `(3, 6)`, `θ` and `θ⁵` of order
  `28` (`3³ ≡ −1 (mod 28)`), all twisted sums are `−27`; for `(4, 5)`, `θ` and `θ²` of order `11` (`2⁵ ≡ −1 (mod 33)`), the twisted
  sums of `θ` and of `θ²` agree for every `α` (all are `32` for `ψ₀(x) = (−1)^{Tr_{𝔽_4/𝔽_2}(x)}`). The reality argument uses the
  canonical character `ψ₀ = exp(2πi·Tr_{𝔽_q/𝔽_p}(·)/p)`, for which `G_n(θ^p) = G_n(θ)`: for another `ψ₀(a·)`, `a ∈ 𝔽_q^×`, a single sum
  is multiplied by `θ(a)^{−1}` and need not stay real (on `𝔽_4`, for a cubic character and `a` a generator). The equalities
  hold for every `ψ₀`: passing to `ψ₀(a·)` multiplies `G_n(θ·(α∘N))` by `θ(a)^{−1}α(a)^{−n}`, the same factor for two characters
  with the same restriction to `𝔽_q^×`.

### 5.11 Shintani descent for `GL_n`

Let `k = 𝔽_q ⊂ k′ = 𝔽_{q^d}` (`d ≥ 1`), `G = GL_n(k)`, `G′ = GL_n(k′)`, `F` the automorphism of `G′` raising every entry to the
`q`-th power (of order `d`), and `N(δ) = δ·F(δ)⋯F^{d−1}(δ)` for `δ ∈ G′`. Elements `δ, δ′` of `G′` are **`F`-conjugate** if
`δ′ = y⁻¹δF(y)` for some `y ∈ G′`; an **`F`-class function** is constant on `F`-conjugacy classes. Over `k′` the set `L` of the
Conventions is the same, with Frobenius `θ ↦ θ^{q^d}`: a Frobenius orbit of size `m` over `k` is the union of `gcd(d, m)`
orbits of size `m/gcd(d, m)` over `k′`. The **lift** of a label `m` of degree `n` over `k` is the label `m^{(d)}` over `k′` with
`m^{(d)}(O′) = m(O)` for every orbit `O′` over `k′` contained in the orbit `O` over `k`; it has degree `n`, and
`(m^{(d)})^{(d′)} = m^{(dd′)}`.
(a) *Norm classes.* For `δ ∈ G′`, `N(δ)` is conjugate in `G′` to an element `γ ∈ G`, unique up to conjugacy in `G` (the **norm
class** of `δ`); `δ ↦` (norm class) is a bijection from the `F`-conjugacy classes of `G′` onto the conjugacy classes of `G`; and
`{y ∈ G′ : y⁻¹δF(y) = δ}` is isomorphic to the centraliser of `γ` in `G`. Hence `#{δ ∈ G′ : N(δ) ∼ γ}·|G| = #(class of γ)·|G′|`.
(b) *The Shintani lift.* For a class function `f` on `G`, `Sh_d(f)(δ) = f(γ)` (`γ` in the norm class of `δ`) is an `F`-class
function on `G′`; `|G′|⁻¹ Σ_δ Sh_d f(δ)·conj(Sh_d f′(δ)) = |G|⁻¹ Σ_γ f(γ)·conj(f′(γ))`; and `Sh_d(ω∘det) = (ω∘N_{k′/k})∘det` for
every character `ω` of `k^×`.
(c) *Harish-Chandra induction.* Let `M = ∏_i GL_{n_i}` be a standard Levi subgroup with standard parabolic subgroup `P = MU`,
and `Sh_d^M = ⊠_i Sh_d` the lift for `M`. For an `F`-class function `φ` on `M(k′)` put
`R_M^F(φ)(δ) = |P(k′)|⁻¹ Σ_{y ∈ G′, y⁻¹δF(y) ∈ P(k′)} φ(pr_M(y⁻¹δF(y)))`, with `pr_M : P(k′) → M(k′)` the projection along `U(k′)`. Then
`Sh_d(R_M^G f) = R_M^F(Sh_d^M f)` for every class function `f` on `M(k)`. Moreover, if `φ = ⊠_i φ_i` and each `φ_i` satisfies
`Σ_δ conj(φ_i(δ))ρ_i(δ) = 0` for every irreducible representation `ρ_i` of `GL_{n_i}(k′)` not isomorphic to a given `τ_i`, then
`Σ_δ conj(R_M^F(φ)(δ))ρ(δ) = 0` for every irreducible representation `ρ` of `G′` that is not a constituent of `R_M^{G′}(⊠_i τ_i)`.
(d) *Cuspidal characters in prime degree.* Let `d = l` be prime, `θ ∈ L_m` regular, and `τ` the following irreducible
representation of `GL_m(k′)`: if `l ∤ m`, `τ = σ_θ` formed over `k′` (as an element of `L`, `θ` is regular of degree `m` over `k′`;
as a character of `𝔽_{q^{lm}}^×` it is `θ∘N_{𝔽_{q^{lm}}/𝔽_{q^m}}`); if `l ∣ m`, `τ = σ_θ × σ_{θ^q} × ⋯ × σ_{θ^{q^{l−1}}}`, the `θ^{q^i}`
read as characters of `𝔽_{(q^l)^{m/l}}^× = 𝔽_{q^m}^×`, each regular of degree `m/l` over `k′` and pairwise not conjugate over `k′`
(so the product is irreducible, 5.4(d)). Then `τ∘F ≅ τ`, and there are an isomorphism `A : τ → τ∘F` (`A∘τ(g) = τ(F(g))∘A`)
with `A^l = 1` and a sign `ε ∈ {±1}` such that `Sh_l(χ_{σ_θ})(δ) = ε·tr(τ(δ)∘A)` for every `δ ∈ GL_m(k′)`.
(e) *Labels in prime degree.* Let `d = l` be prime, `χ` the character of a Harish-Chandra product `R_M^G(⊠_i σ_{θ_i})` of
cuspidal representations, of label `m` (5.7), and `ρ` a representation of `G′` with `Σ_δ conj(Sh_l χ(δ))ρ(δ) ≠ 0`. Then `ρ` has
an irreducible constituent of label `m^{(l)}`.

*Route.* (a) Lang's theorem for `GL_n` over `k̄` (ReductiveGroups 7a), `F` extended to the `q`-Frobenius of `GL_n(k̄)`, gives `x`
with `δ = x⁻¹F(x)`; then `N(δ) = x⁻¹F^d(x)`, and `γ = F^d(x)x⁻¹` is `F`-fixed (from `F(x) = xδ` and `F^d(δ) = δ`), so `γ ∈ G` and
`N(δ) = x⁻¹γx`. Matrices over `k′` conjugate over `k̄` are conjugate over `k′`, and elements of `G` conjugate in `G′` are conjugate
in `G` (rational canonical form, 0.4). `x` is determined by `δ` up to `x ↦ gx` with `g ∈ G`, which conjugates `γ` in `G`;
replacing `δ` by `y⁻¹δF(y)` replaces `x` by `xy` and keeps `γ`. If `x` and `x′` give the same `γ`, then `y = x⁻¹x′` satisfies
`F^d(y) = y`, so `y ∈ G′` and `x′⁻¹F(x′) = y⁻¹δF(y)`: injectivity. Surjectivity: for `γ ∈ G` choose `x` with `F^d(x)x⁻¹ = γ` (Lang
for `F^d`) and put `δ = x⁻¹F(x)`; then `F^d(δ) = δ` because `F(γ) = γ`. Finally `y ↦ xyx⁻¹` maps `{y ∈ G′ : y⁻¹δF(y) = δ}` onto
the centraliser of `γ` in `G`: `y⁻¹δF(y) = δ` says that `u = xyx⁻¹` is `F`-fixed, and then `F^d(y) = y` says that `u` commutes with
`γ`. So the `F`-class of `δ` has `|G′|/|C_G(γ)|` elements, which is the count. (b) The sum over `G′` groups by norm classes with
the fibres of (a); `det N(δ) = N_{k′/k}(det δ)`. (c) Let `δ = x⁻¹F(x)` and `γ = F^d(x)x⁻¹` as in (a). For `y ∈ G′`,
`δF(y)P = yP` says that the coset `xyP ∈ G(k̄)/P(k̄)` is `F`-fixed, hence lies in `G/P(k)` (Lang for the connected `P`), and
`γ·xyP = F^d(xyP) = xyP`. Conversely, for a coset `c ∈ G/P(k)` fixed by `γ`, `x⁻¹c` is fixed by `F^d` (as `F^d(x⁻¹c) = x⁻¹γ⁻¹c`),
hence of the form `yP` with `y ∈ G′`, and `δF(yP) = yP`. So `yP(k′) ↦ xyP` is a bijection from the cosets with
`y⁻¹δF(y) ∈ P(k′)` onto the points of `G/P(k)` fixed by `γ`. If `xy = zp⁻¹` with `z ∈ G` and `p ∈ P(k̄)`, then `y⁻¹δF(y) = pF(p)⁻¹` and `z⁻¹γz = F^d(p)⁻¹p`, so by the
construction of (a) in `P` and in `M`, the image of `z⁻¹γz` in `M(k)` lies in the norm class of the image of `y⁻¹δF(y)` in
`M(k′)`. Comparing with `R_M^G(f)(γ) = Σ_{zP ∈ G/P(k), γzP = zP} f(pr_M(z⁻¹γz))` (`pr_M : P(k) → M(k)`; ReductiveGroups 7c, the adapter
`R = Ind ∘ Inf`) term by term gives the identity. For the second part, in the group algebra
`Σ_δ conj(R_M^F(φ)(δ))·δ = (|U(k′)|/|P(k′)|)·Σ_{y ∈ G′} y·a_φ·e_U·F(y)⁻¹`, with `a_φ = Σ_{m ∈ M(k′)} conj(φ(m))·m` and `e_U` the
idempotent of `U(k′)` (`M` normalises `U`, so `a_φ` and `e_U` commute). In a representation `ρ`, `ρ(a_φe_U)` acts on `ρ^{U(k′)}`, the
Harish-Chandra restriction, through `M(k′)`, and by zero on its complement; by the hypothesis on the `φ_i` it vanishes unless
the Harish-Chandra restriction has a constituent `⊠_i τ_i`, that is (adjunction) unless `ρ` is a constituent of
`R_M^{G′}(⊠_i τ_i)`. (d) For `m = 1`, `σ_θ = θ` and `τ = θ∘N_{k′/k}` (`l ∤ 1`), and (b) gives `Sh_l(θ) = (θ∘N_{k′/k})∘det = τ`: the
assertion holds with `A = 1`, `ε = 1`. Let `m ≥ 2`; then `θ ≠ 1`, as `θ` is regular of degree `m`. Let `Ĝ_a = GL_a(k′) ⋊ ⟨F⟩` and extend
`θ` to a homomorphism `θ̃ : k̄^× → ℂ^×`. For `a ≤ m` let `b′_a` be the
eigenvalue sum of `θ̃` on `GL_a(k′)` (5.6(b) over `k′`: a virtual character) and `b̂_a` its tensor induction to `Ĝ_a`
(TensorInductionAndFiniteGroupInputs §6.1): `b̂_a(δF) = b′_a(N(δ)) = Sh_l(b_a)(δ)`,
`b_a` the eigenvalue sum on `GL_a(k)`, and `b̂_a(y) = ∏_{i<l} b′_a(F^i(y))` for `y ∈ GL_a(k′)`. Define virtual characters `X_a` of `Ĝ_a`
by `X_a = b̂_a − Σ_{c<a} Ind_{P̂_c}^{Ĝ_a}(X_c ⊠ 1)`, where `P̂_c = P_{(c, a−c)}(k′) ⋊ ⟨F⟩` and `X_c ⊠ 1` is inflated from
`(GL_c(k′) × GL_{a−c}(k′)) ⋊ ⟨F⟩`, `1` the trivial character of `Ĝ_{a−c}`. The induced-character formula gives
`Ind_{P̂_c}(Z)(δF) = |P_c(k′)|⁻¹ Σ_{y : y⁻¹δF(y) ∈ P_c(k′)} Z(pr(y⁻¹δF(y))F)`, `pr` the projection of `P_c(k′)` onto `(GL_c × GL_{a−c})(k′)`, so by (c) (with `Sh_l(1) = 1`) and by induction on `a`,
`X_a(δF) = Sh_l(β_a)(δ)`, `β_a = R_{T_{(a)}}(θ̃|_{𝔽_{q^a}^×})` (5.6(b)). As `β_m = (−1)^{m−1}σ_θ` (5.6(b), `θ` regular),
`X = (−1)^{m−1}X_m` has `X(δF) = Sh_l(χ_{σ_θ})(δ)`, and by (b) `|GL_m(k′)|⁻¹ Σ_δ |X(δF)|² = 1`. By TensorInductionAndFiniteGroupInputs §6.2,
`X` is on the coset `GL_m(k′)F` a root of unity of `ℚ(e^{2πi/l})` (TensorInductionAndFiniteGroupInputs §6.2 (b′), which is
that roadmap's addition to the form of the formal proof), hence
`±e^{2πij/l}`, times one extension `τ̃₀` of an `F`-stable irreducible `τ₀`, and `τ₀` occurs in every `F`-stable character `Y` with
`l ∤ ⟨X|_{GL_m(k′)}, Y⟩`; with `A = e^{2πij/l}τ̃₀(F)` this is the asserted form for `τ₀`. It remains to see that `τ` is `F`-stable and
that `l ∤ ⟨X|_{GL_m(k′)}, τ⟩`; then `τ₀ = τ`. By Mackey (`Ĝ_m = GL_m(k′)·P̂_c`, `GL_m(k′) ∩ P̂_c = P_c(k′)`),
`X|_{GL_m(k′)} = (−1)^{m−1}(∏_{i<l} b′_m(F^i(·)) − Σ_{c<m} R(X_c|_{GL_c(k′)} ⊠ 1))`, the outer sign applying to both terms (for
`q = m = l = 2` the value at `1` is `−(4 − 5) = 1`). The constituents of the Harish-Chandra induced `R(X_c|_{GL_c(k′)} ⊠ 1)`, `c < m`,
have the trivial character of `GL_1(k′)` in their cuspidal support (the trivial character of `GL_{m−c}(k′)` lies in the principal
series of the trivial character); the cuspidal support of `τ` does not contain it (`m ≥ 2`: it consists of `σ_θ` over `k′`, a
cuspidal representation of `GL_m(k′)`, or of the `σ_{θ^{q^i}}` of `GL_{m/l}(k′)`, which for `m = l` are the characters `θ^{q^i} ≠ 1`),
so these terms are orthogonal to `τ` (1.2). The function `∏_{i<l} b′_m(F^i(y)) = ∏_{i<l} Σ_α θ̃^{q^i}(α)` depends on the eigenvalues of `y` only. *Case `l ∤ m`.* `τ` is
`F`-stable: `σ_θ∘F = σ_{θ^q}` over `k′`, and `θ^q = θ^{q^{lj}}` for `lj ≡ 1 (mod m)`. With `T′` the Coxeter torus of `GL_m(k′)`
(`T′^F ≅ 𝔽_{q^{lm}}^×`, whose element `z` has the eigenvalues `z^{q^{la}}`, `a < m`), `τ = (−1)^{m−1}R_{T′}(θ)` and 4.5(d) make
`⟨∏_i b′_m(F^i(·)), τ⟩` equal to `(−1)^{m−1}` times the number of tuples `(a_i)_{i<l} ∈ (ℤ/m)^l` with `∏_{i<l} θ̃^{q^{i+la_i}} = θ∘N` on
`𝔽_{q^{lm}}^×`. The sets `E = {i + la_i}` are the transversals of `ℤ/lm → ℤ/l` satisfying `∏_{e∈E} θ̃^{q^e} = θ∘N`. Translation
`E ↦ E + m` preserves transversals (`l ∤ m`) and the condition (it raises the left side to the power `q^m`, and
`(θ∘N)^{q^m} = θ∘N`); it has order `l`, and a fixed transversal is a coset `c + mℤ/lmℤ`, for which the condition reads
`(θ∘N)^{q^c} = θ∘N`, i.e. `θ^{q^c} = θ`, i.e. `m ∣ c`, by regularity. So exactly one solution is fixed, the number of solutions is
`≡ 1 (mod l)`, and `⟨X|, τ⟩ ≡ 1 (mod l)`. *Case `l ∣ m`.* `τ` is `F`-stable: `σ_{θ^{q^i}}∘F = σ_{θ^{q^{i+1}}}`, and `θ^{q^l}` is a
`k′`-conjugate of `θ`. With `L′ = GL_{m/l}(k′)^l`, `⟨f, τ⟩ = ⟨*R_{L′} f, ⊠_i σ_{θ^{q^i}}⟩` (adjunction), and for
`f = ∏_{j<l} b′_m(F^j(·))` the Harish-Chandra restriction is `(x_0, …, x_{l−1}) ↦ ∏_{j<l} Σ_{i<l} b′_{θ̃^{q^j}}(x_i)`, `b′_{θ̃^{q^j}}` the
eigenvalue sum of `θ̃^{q^j}` on `GL_{m/l}(k′)`. Expand over the maps `j ↦ i(j)`: a map missing some `i` contributes a factor
`⟨1, σ_{θ^{q^i}}⟩ = 0`; for a bijection the factor at `i = i(j)` is `⟨b′_{θ̃^{q^j}}, σ_{θ^{q^i}}⟩ = (−1)^{m/l−1}#{a < m/l : θ^{q^{j+la}} = θ^{q^i}}`
(4.5(d) on the Coxeter torus of `GL_{m/l}(k′)`), which is `(−1)^{m/l−1}δ_{ij}` as `θ` is regular of degree `m` and `i, j < l`. Only the
identity contributes, and `⟨X|, τ⟩ = ±1`. (e) is in [FormalProof],
`Development/AbelianVarietyTheory/Proofs/DivisorProofs/FormalGermBaseChange.lean`
(`GlobalTheory.Shin.DescentAll.kills_liftAll`),
`Development/AbelianVarietyTheory/Definitions/Divisors/OrthSubrepresentation.lean` (`GlobalTheory.Shin.Kills`).
By (c), `Sh_l χ = R_M^F(⊠_i Sh_l χ_{σ_{θ_i}})`. For each `i` let `τ_i` be the
representation of (d) for `θ_i`. `Sh_l χ_{σ_{θ_i}} = ±tr(τ_i(·)∘A_i)` satisfies the hypothesis of the second part of (c): for an
`F`-class function `φ` the operator `Σ_δ conj(φ(δ))ρ(δ)` lies in `Hom(ρ∘F, ρ)`, so it vanishes unless `ρ` is `F`-stable, and then it
is a multiple of `B⁻¹` (`B : ρ → ρ∘F` with `B^l = 1`) with coefficient proportional to the pairing on the coset of `φ` with the
extension of `ρ` given by `B`, which vanishes for `ρ ≇ τ_i` (the restrictions to the coset of the extensions of distinct `F`-stable
irreducible representations are orthogonal: the same target, TensorInductionAndFiniteGroupInputs §6.2). By the second part of (c), `ρ` has a
constituent in `R_M^{G′}(⊠_i τ_i)`, whose constituents have the label `Σ_i` (label of `τ_i`) (5.4(b), 5.7), and the label of `τ_i`
is the lift of the orbit of `θ_i`: one orbit of size `m_i` over `k′` if `l ∤ m_i`, the `l` orbits of the `θ_i^{q^j}` if `l ∣ m_i`. So
the label is `m^{(l)}`.

*Needs:* 0.4, 1.0, 1.2, 4.4, 4.5, 5.1, 5.2, 5.4, 5.6, 5.7; ReductiveGroups 7a, 7b, 7c; InductionRestriction
Layer 2; TensorInductionAndFiniteGroupInputs §§6.1, 6.2 (with (b′)); RepresentationTheory/CharacterTheory
Layer 3.

**Checks.**
- `n = 1`: `Sh_d(ω) = ω∘N_{k′/k}`, and every element of `k^×` is a norm from `k′^×`.
- (a) for `GL₂(𝔽₂) ⊂ GL₂(𝔽₄)`: the classes of sizes `1, 3, 2` have fibres `30, 90, 60` in `G′` (`|G′| = 180`); the fibre count also
  holds, by enumeration, for `GL₂` with `(q, d) ∈ {2, 3, 4} × {2, 3}` and `(2, 5)`, and for `GL₃(𝔽₂)` with `d = 2, 3`.
- (c) for `GL₂` and `M = T`: at `δ` whose norm class is elliptic both sides vanish, since an elliptic `γ` fixes no point of
  `ℙ¹(k)` and `δ∘F` fixes no line over `k′`.
- (d) does not preserve degrees: for `q = 2`, `m = l = 2` and `θ` of order `3`, `τ = R(θ ⊠ θ²)` of `GL₂(𝔽₄)` has degree `5`, while
  `Sh₂(χ_{σ_θ})(1) = σ_θ(1) = 1`; (d) is a statement about twisted characters.
- (d), the sign on restriction, for `q = m = l = 2` and `θ` of order `3`: computed from the induced-character formula on
  `GL₂(𝔽₄) ⋊ ⟨F⟩`, `X(δF) = Sh₂(χ_{σ_θ})(δ)` at all `180` elements `δ`, `X|_{GL₂(𝔽₄)} = −(∏_{i<2} b′₂(F^i(·)) − Ind_{B(𝔽₄)}(X₁| ⊠ 1))` at every
  element (value `1` at the identity; the reading `−∏_i b′₂(F^i(·)) − Ind(X₁| ⊠ 1)` gives `−9` there), `⟨X|, τ⟩ = −1` and
  `⟨Ind(X₁| ⊠ 1), τ⟩ = 0`.
- (d), case `l ∤ m`: the number of transversals is `≡ 1 (mod l)` but need not be `1`. For `q = 2`, `m = 2`, `l = 5` and `θ̃` of
  exponent `11` on `𝔽_{2^{10}}^×` (so `θ` has exponent `2` on `𝔽₄^×`) there are `11` solutions, and the pairing of
  `∏_{i<5} b′₂(F^i(·))` with `σ_θ` computed over `GL₂(𝔽₃₂)` is `−11`; for `q = 5`, `m = 2`, `l = 3` both `1` and `4` occur.
- (d), case `l ∣ m`, for `q = 2`, `m = l = 3`, `θ` of order `7` on `𝔽₈^×`: `τ` is the irreducible principal series of `θ, θ², θ⁴` of
  `GL₃(𝔽₈)`; for `m = l = 2`, `τ = R(θ ⊠ θ^q)` of `GL₂(𝔽_{q²})`.
- (d) in the form "`Σ_δ conj(Sh_l χ_{σ_θ}(δ))·δ` lies in the isotypic ideal of `τ`" (fixed by the central idempotent of `τ`, at
  every `F`-class), by enumeration of `G′`: for `GL₂` with `(q, l) ∈ {2, 3, 4} × {2, 3}` and `(2, 5)`, and for `GL₃(𝔽₂)` with `l = 2`
  (`τ` cuspidal of `GL₃(𝔽₄)`) and `l = 3` (`|G′| = 115 379 712`); the idempotents of the other `F`-stable irreducible
  representations tested (trivial, Steinberg, another lifted cuspidal, an `F`-stable principal series) kill it.

The general case is Shintani's theorem: for every `d` the Shintani lift matches the irreducible characters of `G` with the
`F`-stable irreducible characters of `G′` through their twisted characters, preserving Green's parametrisation read on
the orbits of `F^d`. This roadmap states only the prime-degree case for Harish-Chandra products of cuspidal characters.

### Examples

For `n = 2` the irreducible characters have the degrees `1`, `q`, `q + 1` and `q − 1`, in the numbers `q − 1`, `q − 1`, `½(q−1)(q−2)` and `½q(q−1)` (5.5); in the unipotent series `ch(h₂) = 1` and `ch(e₂) = St`, and `ch_m(p₁) = σ_θ` for an orbit of size `2` (5.4). The labels of `GL₂` have the Gelfand–Graev weights `(q−1)^{−2}`, `(q²−1)^{−1}` and `q/((q−1)(q²−1))` for `(X−a)(X−b)` with `a ≠ b`, for the irreducible labels and for `(X−a)²`, with totals summing to `1` (5.8). `k₃(q) = q³ − q` and `N*_q(3) = (q³ − q)/3` (5.9). For `n = 2`, `w(σ_θ) = −qG_2(θ)` (5.10). For `GL₂(𝔽₂) ⊂ GL₂(𝔽₄)` the classes of sizes `1, 3, 2` have norm fibres of sizes `30, 90, 60` in `GL₂(𝔽₄)` (5.11).

### Dependencies

Layers 0, 1, 2 and 4; ReductiveGroups Layers 7a, 7b, 7c and 7d; RepresentationTheory/CharacterTheory Layers 3, 9 and §3.5; SchurWeyl Layers 4 and 7 (§§7.5–7.7); InductionRestriction Layer 2; TensorInductionAndFiniteGroupInputs §§6.1, 6.2 (5.11); Mathlib's `GaloisField`, `ArithmeticFunction.moebius` and `AddChar`.

## Layer 6: depth-zero representations of `p`-adic `GL_n`

### 6.0 `K₁`-invariants and Jacquet modules

This item is not a target of this roadmap: it records, in the form 6.1–6.5 use, the case `G = GL_n` of
LocalFactorsOfTwistsAndTypes §2.1 (a) and (d), which Layer 6 imports. For an admissible representation `π` of `GL_n(F)` and a
standard parabolic `P = MN`, `M = GL_{n₁} × ⋯ × GL_{n_r}`, the projection to the Jacquet module induces an
isomorphism of `M(k)`-modules `(π^{K₁})^{N(k)} ≅ (π_N)^{M ∩ K₁}`, that is `*R_{M(k)}^{GL_n(k)}(π^{K₁}) ≅ (π_N)^{M∩K₁}`
(injectivity for every smooth `π`). In particular a supercuspidal `π` has `π^{K₁}` cuspidal as a `GL_n(k)`-module, and an
irreducible `π` has depth zero iff every member of its supercuspidal support does.

*Reading.* The comparison is LocalFactorsOfTwistsAndTypes §2.1 (d) for `G = GL_n`, `x`
the vertex fixed by `K` and `P` standard: there `J = K₁N(𝒪)`, so `π^J = (π^{K₁})^{N(k)}`, and `M_{x,0+} = M ∩ K₁`;
injectivity rests on the invertibility of the contracting Hecke operator, LocalFactorsOfTwistsAndTypes §2.1 (c). For supercuspidal `π`
every `π_N`, `P` proper, vanishes, so the comparison and 1.1 make `π^{K₁}` cuspidal. The statement on the
supercuspidal support is LocalFactorsOfTwistsAndTypes §2.1 (a), which uses only Jacquet's lemma and the Iwasawa decomposition.

*Needs:* LocalFactorsOfTwistsAndTypes §2.1; 1.1.

**Checks.**
- `GL₂`, `π` an unramified principal series: `π^{K₁} = Ind_{B(k)}^{GL₂(k)} 1`, whose `U(k)`-invariants are
  two-dimensional, as is `(π_N)^{T(𝒪)}`.

### 6.1 Depth-zero supercuspidal representations from cuspidal characters

A smooth irreducible representation `π` of `GL_n(F)` has **depth zero** if `π^{G_{x,0+}} ≠ 0` for some
point `x` of the building (the Moy–Prasad filtration of ReductiveGroupsPartII §RG2.3.6); for `GL_n` this is
equivalent to `π^{K₁} ≠ 0`, because `G_{x,0+}` contains `G_{v,0+}` for every vertex `v` in the closure of the
facet of `x`, and all vertices are conjugate to the one fixed by `K`. For an irreducible cuspidal
representation `σ` of `GL_n(k)` and a character `c : F^× → ℂ^×` with `c|_{𝒪^×} = ω_σ ∘ (𝒪^× → k^×)`, let
`Λ_{σ,c}` be the representation of `F^×K` equal to the inflation of `σ` on `K` and to `c` on `F^×`. Then
`π(σ, c) = c-Ind_{F^×K}^{GL_n(F)} Λ_{σ,c}` is an irreducible supercuspidal representation of depth zero, with
central character `c`, contragredient `π(σ^∨, c⁻¹)` and `π(σ,c)^{K₁} ≅ σ` as `GL_n(k)`-modules;
`π(σ, c) ≅ π(σ', c')` iff `σ ≅ σ'` and `c = c'`; and every irreducible supercuspidal representation of depth
zero is isomorphic to some `π(σ, c)`. This holds for every nonarchimedean local field `F`.

*Route.* Intertwining: by the Cartan decomposition (ReductiveGroupsPartII RG2.4 *cartan-decomposition*) every
`g ∉ F^×K` lies in `F^×K t K` with `t = diag(ϖ^{a₁}, …, ϖ^{a_n})`, `a₁ ≥ ⋯ ≥ a_n` not all equal; the image of
`K ∩ tKt⁻¹` in `GL_n(k)` contains the unipotent radical `N(k)` of a proper parabolic, while `t⁻¹N(𝒪)t ⊂ K₁`, so a
`K ∩ tKt⁻¹`-map from `Λ` to `^tΛ` factors through the `N(k)`-coinvariants of `σ`, which vanish by cuspidality.
So the `G`-intertwining of `Λ_{σ,c}` is `F^×K`, and the compact-induction criterion
(SmoothRepresentationsOfLocalGroups SR.3a.1 *compact-induction-criterion*) gives irreducibility and matrix
coefficients compactly supported modulo the centre, hence supercuspidality (*harish-chandra-compactness*).
The isomorphism criterion is Mackey's formula for compact induction with that intertwining. The
`K₁`-invariants: only the trivial double coset `F^×K·1·K` contributes, by the same cuspidality argument. Depth
zero: `π(σ,c)^{K₁} ≅ σ ≠ 0`. Exhaustion: a depth-zero supercuspidal `π` has `π^{K₁} ≠ 0` after conjugation, a
cuspidal `GL_n(k)`-module by 6.0, so it contains an irreducible cuspidal `σ`, and Frobenius reciprocity gives
a nonzero map `π(σ, ω_π) → π`, an isomorphism since both are irreducible.

*Needs:* 6.0; 1.1; SmoothRepresentationsOfLocalGroups SR.2.1 (compact induction, Frobenius reciprocity),
SR.3a.1 (*compact-induction-criterion*, *cuspidal-representations*, *harish-chandra-compactness*);
ReductiveGroupsPartII §RG2.3.6, RG2.4 *cartan-decomposition*.

**Checks.**
- `n = 1`: depth-zero characters are the tamely ramified characters `c` of `F^×` (trivial on `1 + ϖ𝒪`), and
  `π(c|_{𝒪^×}, c) = c`.
- `c-Ind_{F^×K}^{GL₂(F)}` of the trivial representation of `GL₂(k)` extended by a character is reducible:
  `diag(ϖ, 1)` intertwines it, the trivial representation of `GL₂(k)` not being cuspidal.
- For `n ≥ 2` a depth-zero supercuspidal `π(σ, c)` has no vector fixed by the pro-unipotent radical `I₁ ⊃ K₁` of an
  Iwahori subgroup, since `(π^{K₁})^{U(k)} = σ^{U(k)} = 0`: depth zero is detected by `K₁`, not by `I₁`. For `n = 1`,
  `I₁ = K₁ = 1 + ϖ𝒪` and every depth-zero character is fixed by it (`U(k)` is trivial).
- Comparison: for `F/ℚ_p` finite, `(K, Λ_{σ,c}|_K)` is the depth-zero maximal distinguished cuspidal type of
  SmoothRepresentationsOfLocalGroups *distinguished-cuspidal-types* (`β = 0`, `𝔄` a maximal order, `κ` trivial,
  `K¹ = K₁`), and `π(σ, c)` is the representation that target attaches to the extension `Λ_{σ,c}`.

### 6.2 Parametrisation by level-zero characters of the unramified extension

A character `θ̃` of `F_n^×` is **of level zero and regular** if it is trivial on `1 + ϖ𝒪_{F_n}` and its
restriction to `𝒪_{F_n}^×`, read on `k_n^×`, is a regular character `θ`. Put
`π_{θ̃} = π(σ_θ, θ̃|_{F^×})`. Then `θ̃ ↦ π_{θ̃}` is a bijection from `Gal(F_n/F)`-orbits of regular
level-zero characters onto the isomorphism classes of depth-zero supercuspidal representations of `GL_n(F)`,
and `π_{θ̃} ⊗ (χ∘det) = π_{θ̃·(χ∘N_{F_n/F})}` for every character `χ` of `F^×` trivial on `1 + ϖ𝒪`.

*Route.* `F_n^× = ϖ^ℤ × 𝒪_{F_n}^×` because `ϖ` remains a uniformiser; `θ̃` is determined by `θ` and
`θ̃(ϖ)`, and Galois conjugation acts by `θ ↦ θ^q` fixing `θ̃(ϖ)`. Compatibility of central characters:
`θ̃|_{𝒪^×} = θ|_{k^×} = ω_{σ_θ}` (5.2). Combine with 6.1, the twist rule of 5.2 and 5.5 (every cuspidal
character of `GL_n(k)` is some `σ_θ`).

*Needs:* 6.1; 5.2, 5.5.

**Checks.**
- `n = 2`, `q` odd, fixed central character `c`: the depth-zero supercuspidal representations of `GL₂(F)`
  with central character `c` number `(q−1)/2` if `c|_{𝒪^×}`, read on `k^×`, is a square in the character
  group of `k^×`, and `(q+1)/2` otherwise (regular `θ ∈ L₂` restricting to a given character of `k^×`: `q + 1`
  in all, minus the `θ = α∘N` with `α² = c|_{k^×}`, then halved for Galois orbits). Summed over the `q − 1`
  characters of `k^×` this gives `½q(q−1)`, the number of cuspidal representations of `GL₂(k)`.

### 6.3 Labels of depth-zero representations

An irreducible `π` has depth zero iff `π^{K₁} ≠ 0`, iff every member of its supercuspidal support has depth
zero. If its supercuspidal support is `{π_{θ̃_1}, …, π_{θ̃_r}}`, with `θ_i` of degree `n_i`, then every irreducible
constituent of the `GL_n(k)`-module `π^{K₁}` lies in the Harish-Chandra series of `(∏_i GL_{n_i}(k), ⊠_i σ_{θ_i})`;
equivalently its semisimple label (5.7) is the **label of `π`**, `m_π(O) = #{i : θ_i ∈ O}`. The label of
`π ⊗ (χ∘det)` for tamely ramified `χ` is the translate of `m_π` by `χ|_{𝒪^×}`.

*Route.* The equivalences from 6.0 and 6.1. Labels: embed `π` in the normalised induction from its cuspidal
support (SmoothRepresentationsOfLocalGroups SR.3.1); by the Iwasawa decomposition `GL_n(F) = P·K`, a
`K₁`-invariant vector of `i_P^G τ` is a function on `K` with `f(pk) = τ(p)f(k)` for `p ∈ P ∩ K`, and `K₁` being normal
in `K` its values lie in `τ^{M∩K₁}`, so `(i_P^G τ)^{K₁} ≅ R_{M(k)}^{GL_n(k)}(τ^{M∩K₁})`; `π_{θ̃_i}^{K₁} ≅ σ_{θ_i}` by 6.1, and
taking `K₁`-invariants is exact. Constituents of a Harish-Chandra induced representation lie in its series (1.2),
and 5.7 identifies the series with the label.

*Needs:* 6.0, 6.1, 6.2; 1.2; 5.7; SmoothRepresentationsOfLocalGroups SR.2.2 (Jacquet functors), SR.3.1
(cuspidal support); ReductiveGroupsPartII RG2.4 *iwasawa-decomposition*.

**Checks.**
- An unramified principal series `π = i_B^G(χ₁ ⊗ ⋯ ⊗ χ_n)`, `χ_i` unramified, has label `n·{1}` (the
  polynomial `(X−1)^n`), and `π^{K₁} ≅ Ind_{B(k)}^{GL_n(k)} 1`.
- The Steinberg representation of `GL₂(F)` has `St^{K₁} = St_{GL₂(k)}`, label `(X−1)²`, while it has no
  `K`-fixed vector.

### 6.4 Representations of depth zero up to twist

An irreducible representation of `GL_n(F)` is **of depth zero up to twist** if every member of its
supercuspidal support is `χ ⊗ π₀` with `χ` a character of `F^×` and `π₀` of depth zero. This class
contains every irreducible representation whose supercuspidal support consists of characters of `F^×`, is
stable under twisting by characters, contragredients, and the passage to subquotients of parabolic
inductions of its members, and for `n = 1` consists of all characters. Its members `π` with `χ` tamely
ramified throughout are exactly those of depth zero.

*Route.* Definitions and SR.3.1 (supercuspidal support of subquotients and twists); 6.3 for the last
statement.

*Needs:* 6.1, 6.3; SmoothRepresentationsOfLocalGroups SR.3.1.

### 6.5 The local type statement

Let `F` be a nonarchimedean local field with residue field `k ≅ 𝔽_q`, `a, b ≥ 1`, and
`J ⊂ GL_{a+b}(𝒪_F)` the group of the matrices whose lower left `b × a` block is `≡ 0` and whose upper left `a × a` block is
`≡ 1` modulo `ϖ`. Let `χ` be a tamely ramified character of `F^×` with reduction `α` on `k^×`, and `f` a label of degree `a`
over `k` in which the orbit `{α}` does not occur (in the labelled form of 5.7, `P_O` does not divide `f` for `O = {α}`).
Let `π` be an irreducible smooth representation of `GL_{a+b}(F)` with a vector `x` such that `π(h)x = α(det h̄)·x` for every
`h ∈ J`, `h̄` the reduction of the lower right `b × b` block of `h`, and such that the series idempotent `z_f` of `f` (5.7)
does not kill `x`: `Σ_{g∈GL_a(k)} z_f(g)·π(g̃)x ≠ 0`, with `g̃ ∈ GL_a(𝒪_F)`, in the upper left block, a lift of `g`. Then
`π ≅ π₁ × ((χ∘det) ⊗ π_sph)` (parabolic induction, irreducible), with `π_sph` an irreducible spherical representation of
`GL_b(F)` and `π₁` an irreducible representation of `GL_a(F)` having a vector fixed by `1 + ϖM_a(𝒪_F)` that `z_f` does not
kill; so `π₁` has depth zero and, by 6.3, label `f`. The label `f` need not be squarefree. [FormalProof] has this
statement for residue fields of prime order (`q = p`); for every finite residue field it is this roadmap's own, by the
route below, which nowhere uses that `q` is prime.

*Route.* The Jacquet module of `π` along the parabolic subgroup of type `(a, b)` has an irreducible subquotient carrying the
vector `x` with both block actions (injectivity of the Jacquet map on vectors of depth zero, 6.0). Hence at least `b`
members of the supercuspidal support of `π` are unramified twists of `χ`. If more than `b` were, the geometric lemma
would place one of them in the `GL_a` block, and `α` would occur in `f` (6.3). So exactly `b` are, and `π` is the product
of a representation `π₁` of `GL_a(F)` and a representation `π₂` of `GL_b(F)` with disjoint, hence unlinked, supports:
irreducible (Bernstein–Zelevinsky). `π₂ ⊗ χ^{−1}∘det` is spherical, and by the geometric lemma again the vector comes
from `π₁`. *Status.* For `q = p`, statement of [FormalProof].

*Needs:* 6.0, 6.3; 5.7; SmoothRepresentationsOfLocalGroups SR.2.2 (Jacquet functors and parabolic induction), SR.3.1
(supercuspidal support).

**Checks.**
- The condition on `{α}` cannot be reversed: for `a = b = 1`, `f` the label `{α}` and `π = (χ∘det) ⊗ St`, the Iwahori-fixed
  line of `St` is a line of `π` on which `J` acts through `α` of the lower right entry and `GL_1(k)` through `α`, so the
  idempotent of `f` does not kill it; but `π` is a constituent of the reducible `i_B(χν^{1/2} ⊗ χν^{−1/2})` (`ν = |·|`) and
  not an irreducible parabolic induction.

### Examples

For `GL₂` and an unramified principal series `π`, `π^{K₁} = Ind_{B(k)}^{GL₂(k)} 1`, whose `U(k)`-invariants are two-dimensional, as is `(π_N)^{T(𝒪)}` (6.0). For `n = 1` the depth-zero supercuspidal representations are the tamely ramified characters `c` of `F^×`, with `π(c|_{𝒪^×}, c) = c` (6.1). For `n = 2` and `q` odd, the depth-zero supercuspidal representations of `GL₂(F)` with central character `c` number `(q−1)/2` or `(q+1)/2`, according as `c|_{𝒪^×}` read on `k^×` is a square in the character group of `k^×` or not; summed over the `q − 1` characters of `k^×` this gives `½q(q−1)`, the number of cuspidal representations of `GL₂(k)` (6.2). The Steinberg representation of `GL₂(F)` has label `(X−1)²` and `St^{K₁} = St_{GL₂(k)}` (6.3).

### Dependencies

Layers 1 and 5; SmoothRepresentationsOfLocalGroups SR.2.1, SR.2.2, SR.3.1 and SR.3a.1 (SR.5.2 for a comparison in a Check of 6.1); LocalFactorsOfTwistsAndTypes §2.1 (the depth-zero Jacquet comparison); ReductiveGroupsPartII §RG2.3.6 and RG2.4.

## Downstream consumers

- **BaseChangeAndGaloisRepresentationsForUnitaryGroups**, a sub-roadmap of this family (the explicit parameters of
  depth-zero supercuspidal representations and of representations of depth zero up to twist, added there to the theory
  of EndoscopicTransferAndUnitaryTraceComparison Layer 10), uses the tame labelled form of the Conventions: when the local
  field has characteristic zero (a finite extension of `ℚ_p`), with the choice `t_n(γ₀)` of the Conventions the roots of
  the label of a depth-zero representation (6.3) are, through `ι`, the eigenvalues of `γ₀` on its Langlands parameter;
  this is its §10.34 (iii) with §10.35 (c), stated there for finite extensions of `ℚ_p`, which also fixes the
  normalisation of the `t_n` and routes (iii) in every rank by unramified base change of prime degree, through the lift
  of labels of 5.11. In positive characteristic the label and the choice of `t` are defined in the same way, and the
  comparison with Langlands parameters is not part of this roadmap or of that section. That roadmap uses 5.2 (the values of `σ_θ`
  at regular elliptic elements), 5.10 (the Gauss sums of the `σ_θ`, which give the `ε`-factors of the `π_{θ̃}`, and in
  rank two the separation of cuspidal representations by their twisted Gauss sums), 5.11 (Shintani descent: the matching
  of functions inflated from the residue field and the lift of labels under unramified base change of prime degree, which
  give the inertial types of depth-zero supercuspidal representations in every rank), 1.1 and 6.1–6.4.
- **The theta-chain roadmaps of this family** (ThetaChainsOnDefiniteUnitaryGroups, RowTowerAndRallisIdentities,
  BesselPoincareSeriesAndGramBounds, CongruenceModulesOfThetaLifts,
  ArithmeticVolumesAndIntegralFormsOnUnitaryShimuraVarieties, GluedTargetAndDivisionInequality and
  ThetaChainsAndFrobeniusPrimeSums): cuspidal supports and Harish-Chandra series (1.2), regular characters and
  Gelfand–Graev multiplicity one (2.1, 2.2), derivatives (2.4), the Gelfand–Graev kernel bound (2.5), degenerate
  Gelfand–Graev representations and the Harish-Chandra restriction of `Γ_n` (2.6), the Bessel-type decomposition and
  inequality at the level of the type primes (2.7), the multiplicities of the level in Harish-Chandra induced cuspidal
  representations (2.8), the cuspidal characters and their values (5.2), Green's parametrisation (5.5), labels (5.7),
  weights, degenerate Gelfand–Graev multiplicities and Bessel-type shares (5.8), depth-zero supercuspidal representations
  and their parametrisation (6.1, 6.2), labels of depth-zero representations (6.3), representations of depth zero up
  to twist (6.4) and the local type statement (6.5); the tame labelled form of the Conventions.
- **RepresentationTheory/CharacterTheory** Layer 9 is the case `n = 2` of Layer 5, compared in 5.3.

## Scope and ownership

This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) is independently definitive. Its subject is part of
the representation theory of finite groups, and what it uses from the [RepresentationTheory](../../RepresentationTheory/README.md) family is
owned there: class functions, virtual characters, central idempotents and the character table of `GL₂(𝔽_q)` by
[CharacterTheory](../../RepresentationTheory/CharacterTheory/README.md), induction, Mackey and Clifford theory by
[InductionRestriction](../../RepresentationTheory/InductionRestriction/README.md), and partitions, characters of symmetric groups and symmetric
functions by [SchurWeyl](../../RepresentationTheory/SchurWeyl/README.md).

The roadmap owns:

- rational Borel pairs and the order of `G^F`, rational maximal tori and the twisted classes of the Weyl group,
  semisimple and regular elements, the conjugacy classes of `GL_n(𝔽_q)` with their count and the count of classes
  of pairs of a torus and a character, and regular unipotent elements (Layer 0);
- transitivity of Harish-Chandra functors, cuspidality, Harish-Chandra series, cuspidal support and the
  endomorphism algebras of Harish-Chandra induced cuspidal representations for every finite reductive group,
  and their type-A form for `GL_n` (Layer 1);
- regular characters, Gelfand–Graev representations and their multiplicity one, generic representations,
  the finite-field theory of derivatives and the mirabolic subgroup of `GL_n` with the cuspidal values at
  unipotent elements, the Gelfand–Graev convolution bound, degenerate Gelfand–Graev representations and the
  Harish-Chandra restriction of Gelfand–Graev representations for every finite reductive group, and for `GL_n` the
  derivatives of the Gelfand–Graev representation, the Bessel-type induced representations with their decomposition
  into degenerate Gelfand–Graev representations, and their multiplicities in Harish-Chandra induced cuspidal
  representations (Layer 2);
- the module forms of the localisation sequence, the Künneth isomorphism, quotients and affine fibrations for
  compactly supported ℓ-adic cohomology of quasi-projective schemes with finite group actions, and Lefschetz
  numbers of finite-order automorphisms: integrality, independence of `ℓ`, additivity, the quotient formula,
  the perfectness of compactly supported cohomology over the group ring of a finite group acting freely and the
  vanishing of Lefschetz numbers for free actions, the Jordan decomposition formula, torus fixed points and affine
  fibrations (Layer 3);
- the Lang map as a finite étale `G^F`-torsor, Deligne–Lusztig varieties and characters for rational maximal tori, Green
  functions, the character
  formula, the inner product formula, compatibility with Harish-Chandra functors, the pairing of a function of the
  semisimple part with a Deligne–Lusztig character, the Steinberg character and
  the two averages, degree and irreducibility, geometric conjugacy, disjointness of Lusztig series, exhaustion,
  cuspidality, Green functions at regular unipotent elements and the pairing with Gelfand–Graev characters
  (Layer 4);
- Green's theory of `GL_n(𝔽_q)`: cuspidal characters, their values and their separation by the values at
  regular elliptic elements, the characteristic maps of labels, the parametrisation and degree formula with the
  `q`-hook formula, uniformity and special values of Green
  functions, Green's virtual characters and the expansion of eigenvalue sums, generic and semisimple characters, labels and
  their idempotents, Gelfand–Graev weights,
  degenerate Gelfand–Graev multiplicities, the shares of labels in the Bessel-type induced representations, the
  counts, the Gauss sums of cuspidal characters with their separating property in rank two, and Shintani descent for
  `GL_n` (norm classes and the Shintani lift in every degree, its compatibility with Harish-Chandra induction, and in
  prime degree the lift of cuspidal characters and of labels) (Layer 5);
- depth-zero supercuspidal representations of `GL_n(F)` as compact inductions of cuspidal characters, their
  parametrisation by level-zero characters, labels of depth-zero representations, the class of
  representations of depth zero up to twist, and the local type statement (Layer 6). For `F` finite over `ℚ_p` the
  irreducibility and exhaustion of 6.1 are the depth-zero case of SmoothRepresentationsOfLocalGroups SR.5.2
  *distinguished-cuspidal-types*; 6.1 extends them to every nonarchimedean local field, positive characteristic
  included.

It does not own, and consumes by name:

- the finite groups `G^F`, Lang's theorem (surjectivity of the Lang map on points), fixed-coset lifting, rational parabolic and Levi subgroups, the
  Harish-Chandra functors with their adjunctions, Mackey formula and independence of the parabolic, their
  Steinberg-endomorphism extensions and the root-subgroup commutator relations: **ReductiveGroups** Layers 7, 7a–7f,
  7C, 9 and 9E; the centralisers of semisimple elements: **OrbitMeasuresOnAdelicGroups** §4.1, a sub-roadmap of this
  family;
- the assembled character table and the pinned objects of `GL₂(𝔽_q)`: **RepresentationTheory/CharacterTheory**
  Layer 9, compared in 5.3 and not re-proved;
- tensor induction of virtual characters to an overgroup of prime index, and the virtual characters of norm one on a
  non-trivial coset of a normal subgroup of prime index: **TensorInductionAndFiniteGroupInputs** §§6.1, 6.2, a
  sub-roadmap of this family;
- Iwahori–Hecke algebras of type A and their Specht modules: **TypeAHeckeAlgebras** §§1.1, 1.2; symmetric functions,
  Schur functions, the Frobenius characteristic and characters of symmetric groups:
  **SchurWeyl** Layers 4 and 7;
- compactly supported étale cohomology, its finiteness, Künneth formula, rational realisation, the smooth trace, the
  derived tensor over a group ring, and the perfectness of compactly supported cohomology along a finite étale torsor
  over a smooth affine curve: **EtaleCohomologyFoundations** (§F.10.4 for the last two), whose perfectness 3.2 (d)
  extends to a free action on every quasi-projective scheme; the Grothendieck–Lefschetz trace formula:
  **InverseGaloisAndArithmeticFundamentalGroups** §IG.0.T3;
- compact induction and its irreducibility criterion, Jacquet modules and supercuspidal support:
  **SmoothRepresentationsOfLocalGroups**; the depth of the supercuspidal support and the depth-zero Jacquet comparison:
  **LocalFactorsOfTwistsAndTypes** §2.1, a sub-roadmap of this family;
  Moy–Prasad filtrations and the Cartan and Iwasawa decompositions: **ReductiveGroupsPartII**.

LocalGaloisDeformationRings §2.26.2 constructs the finite `GL` character induction and the level-zero virtual classes
from Deligne–Lusztig character formulas and keeps their degree, sign and restriction identities as part of that target;
for those classes they are cases of the general statements 1.2–1.4, 4.2–4.7 and 5.2–5.6 above.

The BN-pairs of the fixed-point groups on the explicit Chevalley carriers of the finite groups of Lie type are
CFSGBasicProperties T1–T3's; 0.1 states the rational Bruhat decomposition for every `G^F`, and on those carriers
the two agree through the identification of the carrier with `G^F`.

Outside this roadmap: the ℓ-modular representation theory of finite reductive groups, Lusztig's Jordan
decomposition and the classification of unipotent characters beyond type A, character sheaves, Green
polynomials and the Hall algebra of finite `𝔽_q[t]`-modules, and the representation theory of the finite groups
of positive-depth quotients `GL_n(𝒪/ϖ^r)`, `r ≥ 2`.

## Exact supplier contracts

### From Mathlib

| Use here | Declarations |
|---|---|
| general linear groups and orders | `Matrix.GeneralLinearGroup`, `Matrix.card_GL_field`, `Matrix.charpoly`, `Matrix.GeneralLinearGroup.det` |
| finite fields | `FiniteField`, `GaloisField`, `FiniteField.frobeniusAlgHom`, `ZMod`, `AddChar` |
| polynomials | `Polynomial.Monic`, `Irreducible`, `Squarefree`, `Polynomial.natDegree` |
| groups and representations | `Representation`, `FDRep`, `MonoidAlgebra`, `ConjClasses`, `Subgroup`, `MulAction`, `Rep.ind` |
| combinatorics | `Nat.Partition`, `Equiv.Perm`, `ArithmeticFunction.moebius` |

### From TauCetiRoadmap.ReductiveGroups

| Use here | Section |
|---|---|
| `G^F`, rational points, finiteness, Lang's theorem, fixed-coset lifting | Layer 7a |
| rational parabolic and Levi subgroups, unipotent radicals, `P^F = L^F ⋉ U^F`, parabolic double cosets | Layer 7b |
| Harish-Chandra induction and restriction over `ℂ`, the adapter `R = Ind ∘ Inf`, adjunctions, the invariants description | Layer 7c |
| the Mackey formula for Harish-Chandra functors | Layer 7d |
| independence of the parabolic for a common Levi subgroup | Layer 7e |
| Steinberg endomorphisms and the extension of 7a–7f | Layer 9E |
| Borel subgroups, maximal tori, Weyl groups, parabolic subgroups, the Bruhat decomposition and its cells, the Tits system | Layer 7 |
| root subgroups, their commutator relations and ordered collection (products over closed sets of roots, 2.6); the coordinates `g = jṅb` of a Bruhat cell with regular inverse (the torus coordinate of 4.1(b)) | Layers 7C, 9 |

### From OrbitMeasuresOnAdelicGroups, a sub-roadmap of this family

| Use here | Section |
|---|---|
| centralisers of semisimple elements: `C_G(s)°` reductive, generated by a maximal torus through `s` and the `U_α` with `α(s) = 1`, containing every maximal torus through `s` (0.3) | §4.1 |

### From TauCetiRoadmap.ReductiveGroupsPartII

| Use here | Section |
|---|---|
| Moy–Prasad filtrations `G_{x,r}`, `G_{x,0+}` | §RG2.3.6 *moy-prasad-filtration* |
| the Cartan and Iwasawa decompositions | RG2.4 *cartan-decomposition*, *iwasawa-decomposition* |

### From TauCetiRoadmap.RepresentationTheory.CharacterTheory

| Use here | Section |
|---|---|
| class functions, the pairing, virtual characters, multiplicities, central idempotents | Layers 0, 2, 3 (CharacterTheory §3.5) |
| the pinned `GL₂(𝔽_q)` objects and character values | Layer 9 |

### From TauCetiRoadmap.RepresentationTheory.InductionRestriction

| Use here | Section |
|---|---|
| induction in stages | Layer 0 |
| induction, induced characters, Frobenius reciprocity | Layer 2 |
| the Mackey decomposition and intertwining numbers | Layers 3–4 |
| Clifford theory | Layer 5 |

### From TensorInductionAndFiniteGroupInputs, a sub-roadmap of this family

| Use here | Section |
|---|---|
| tensor induction to an overgroup `Ĝ ⊃ H` of prime index `l`: for a virtual character `ψ` of `H`, the class function equal to `∏_{i<l}ψ(x^ihx^{−i})` on `H` and to `ψ(g^l)` off `H` is a virtual character of `Ĝ` (used in 5.11(d)) | §6.1 |
| a virtual character of `Ĝ` of norm one on the coset `Hx` is there a complex number `b` of absolute value one times one extension of an `x`-stable irreducible character `τ₀` of `H`, and `τ₀` occurs in every `x`-stable character `Y` of `H` with `l ∤ ⟨X|_H, Y⟩`; by (b′), `b` is a root of unity of `ℚ(e^{2πi/l})`, `±1` for `l = 2` and `±e^{2πij/l}` for odd `l`; the restrictions to `Hx` of the extensions of distinct `x`-stable irreducible characters are orthonormal (used in 5.11(d), (e)) | §6.2, with (b′) |

### From TauCetiRoadmap.RepresentationTheory.SchurWeyl

| Use here | Section |
|---|---|
| partitions, hooks, standard tableaux | Layers 0, 5 |
| characters of `S_n` | Layers 4, 6 |
| `Λ`, Hall inner product, power sums, Schur functions, Jacobi–Trudi, the Frobenius characteristic `s_μ = Σ_ρ χ^μ(ρ)p_ρ/z_ρ` (and `h_n = Σ_ρ p_ρ/z_ρ`, used in 4.7) | Layer 7 (SchurWeyl §§7.5–7.7) |

### From TauCetiRoadmap.TypeAHeckeAlgebras

| Use here | Section |
|---|---|
| `H_m(q)` and its basis | §1.1 |
| split semisimplicity and Specht modules | §1.2 |

### From TauCetiRoadmap.EtaleCohomologyFoundations

| Use here | Section |
|---|---|
| compact-support cohomology, localisation sequence | §F.2.5 |
| base change for compactly supported direct images (used in 3.4(a)) | §F.2.4 |
| the smooth trace `Rf_!Λ(d)[2d] → Λ`, with its compatibility with open restriction, composition and finite flat traces | §0.11 |
| Künneth with compact supports | §F.2.7 |
| finiteness and cohomological dimension | §F.3 |
| rational realisation | §F.4.5 |
| Frobenius on finite-field schemes and on cohomology | §§F.10.1, F.10.2b |
| finite étale torsors (used in 3.2 (d)) | §F.0.2 |
| finite traces; the right–left derived tensor over a group ring `A[G]` on the enhanced module sheaves (used in 3.2 (d), which proves over every quasi-projective base the perfectness that §F.10.4 states for a torsor over a smooth affine curve) | §§0.8, F.10.4 |

### From TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups

| Use here | Section |
|---|---|
| the rational Grothendieck–Lefschetz trace formula for powers of Frobenius | §IG.0.T3 |

### From TauCetiRoadmap.SchemeAndStackFoundations

| Use here | Section |
|---|---|
| fpqc descent of quasi-coherent modules and of functions (used in 4.1(a)) | §1.1 |
| Galois descent of affine schemes, for the twisted forms of 3.1 | §1.24 |
| torsors under a flat group scheme: the pseudo-torsor isomorphism and fppf-local sections (used in 4.1(a)) | §1.15 |

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

| Use here | Section |
|---|---|
| compact induction, Frobenius reciprocity, Jacquet functors | SR.2.1, SR.2.2 |
| the compact-induction irreducibility criterion, cuspidal representations, Harish-Chandra's compactness theorem | SR.3a.1 *compact-induction-criterion*, *cuspidal-representations*, *harish-chandra-compactness* |
| supercuspidal support | SR.3.1 |
| comparison only (Check of 6.1): depth-zero maximal distinguished cuspidal types | SR.5.2 *distinguished-cuspidal-types* |

### From LocalFactorsOfTwistsAndTypes, a sub-roadmap of this family

| Use here | Section |
|---|---|
| the depth of the supercuspidal support (a); the invertibility of the contracting Hecke operator (c) and the depth-zero Jacquet comparison `(π^{G_{x,0+}})^{N∩G_{x,0}} ≅ (π_N)^{M_{x,0+}}` for every admissible `π`, injective for every smooth `π` (d) | §2.1 |

## References

- P. Deligne, G. Lusztig, *Representations of reductive groups over finite fields*, Ann. of Math. 103 (1976),
  103–161: Layer 3 (§3), Layer 4 (§§1, 4, 6–10; §6 for the disjointness of Lusztig series in 4.8), the cuspidal
  characters of 5.2.
- F. Digne, J. Michel, *Representations of finite groups of Lie type*, LMS Student Texts 21 (1991; second
  edition 2020): Layers 1, 2, 4 (Harish-Chandra theory, Gelfand–Graev representations and their Harish-Chandra
  restriction in 2.6, Lusztig induction and its transitivity, the Mackey formula, the Steinberg character).
- R. W. Carter, *Finite groups of Lie type: conjugacy classes and complex characters* (1985): Layers 0, 1, 4.
- O. Dudas, J. Michel, *Lectures on finite reductive groups and their representations* (2015): Layers 0–1.
- C. W. Curtis, *The Steinberg character of a finite group with a (B,N)-pair*, J. Algebra 4 (1966): 4.6(b) (the
  restriction of the Steinberg character to a Sylow `p`-subgroup).
- L. Solomon, *The orders of the finite Chevalley groups*, J. Algebra 3 (1966): 4.6(a), (c) (the alternating sum
  over parabolic subgroups of a Coxeter group).
- R. Steinberg, *Regular elements of semisimple algebraic groups*, Publ. Math. IHÉS 25 (1965): 0.3, 0.5.
- J. A. Green, *The characters of the finite general linear groups*, Trans. AMS 80 (1955), 402–447: 5.2, 5.4–5.6 (with the
  basic characters of 5.6(b)).
- T. Shintani, *Two remarks on irreducible characters of finite general linear groups*, J. Math. Soc. Japan 28 (1976):
  5.11 (Shintani descent).
- I. M. Gelfand, M. I. Graev, *Construction of irreducible representations of simple algebraic groups over a
  finite field*, Dokl. Akad. Nauk SSSR 147 (1962): 2.2.
- S. I. Gelfand, *Representations of the full linear group over a finite field*, Math. USSR Sb. 12 (1970): 2.4
  (cuspidal representations restricted to the mirabolic subgroup).
- R. Steinberg, *Lectures on Chevalley groups*, Yale (1967): 2.2 (multiplicity one for every `G`, cited); *Endomorphisms of linear algebraic groups*,
  Mem. AMS 80 (1968): Steinberg endomorphisms, 0.1.
- R. B. Howlett, G. I. Lehrer, *Induced cuspidal representations and generalised Hecke rings*, Invent. Math.
  58 (1980), 37–64: 1.3–1.4.
- N. Iwahori, *On the structure of a Hecke ring of a Chevalley group over a finite field*, J. Fac. Sci. Univ.
  Tokyo 10 (1964): 1.4.
- A. V. Zelevinsky, *Representations of finite classical groups: a Hopf algebra approach*, LNM 869 (1981): 2.4,
  2.6(c), 2.7(a), 5.8(b).
- T. Kondo, *On Gaussian sums attached to the general linear groups over finite fields*, J. Math. Soc. Japan 15
  (1963): 5.10(a).
- I. Piatetski-Shapiro, *Complex representations of GL(2, K) for finite fields K*, Contemp. Math. 16 (1983): 5.10(b)
  (Bessel functions of `GL₂(𝔽_q)`).
- I. M. Gelfand, D. Kazhdan, *Representations of the group GL(n, K) where K is a local field*, in Lie groups and
  their representations (1975): 2.4.
- I. N. Bernstein, A. V. Zelevinsky, *Representations of the group GL(n, F) where F is a nonarchimedean local
  field*, Russian Math. Surveys 31 (1976): 2.4 (the derivative formalism).
- G. Lusztig, B. Srinivasan, *The characters of the finite unitary groups*, J. Algebra 49 (1977): 5.6
  (uniformity).
- I. G. Macdonald, *Symmetric functions and Hall polynomials*, second edition (1995), Ch. I §3 and Ch. IV: 5.5
  (the `q`-hook formula), 5.4–5.6.
- D. Mumford, *Abelian varieties* (1970), §7; A. Grothendieck, *Revêtements étales et groupe fondamental*
  (SGA 1), Exp. V: 3.2(c); SGA 1, Exp. I–II (étale and smooth morphisms, the differential criterion): 4.1(a).
- M. Demazure, A. Grothendieck, *Schémas en groupes* (SGA 3), Exp. IX–X: 3.4(d).
- A. Moy, G. Prasad, *Unrefined minimal K-types for p-adic groups*, Invent. Math. 116 (1994); *Jacquet functors
  and unrefined minimal K-types*, Comment. Math. Helv. 71 (1996): 6.0, 6.3.
- C. J. Bushnell, G. Henniart, *The local Langlands conjecture for GL(2)* (2006), §11: 6.1 (the depth-zero case
  of compact induction).
- [FormalProof] Levent Alpöge, the Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for Dirichlet L-functions
  announced in [Announcement]; source with a public verification setup:
  <https://github.com/leanprover-community/riemann-hypothesis>. Source of the statements of 2.7 (b), (c) (the Bessel-type
  decomposition and the inequality), of 2.8 (a), (b) and the first form of 2.8 (c) (the multiplicities of the Bessel-type
  characters in Harish-Chandra induced cuspidal representations and their near-constancy over several places), of the
  lower bound of 5.8 (c), of 5.11 (e) in the form stated (the lift of labels in prime degree), and of 6.5 (the local type
  statement, for residue fields of prime order).
- [Announcement] Levent Alpöge, the announcement of that proof, 20 November 2026: <https://alpo.ge/remark.pdf>.
