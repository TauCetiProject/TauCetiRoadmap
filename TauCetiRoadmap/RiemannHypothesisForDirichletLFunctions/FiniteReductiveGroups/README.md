# Roadmap: finite reductive groups and the characters of `GL_n(𝔽_q)`

**Summary.** Let `G` be a connected reductive group over a finite field `𝔽_q` and `F` its Frobenius
endomorphism. The finite group `G^F` of rational points (`GL_n(𝔽_q)`, `Sp_{2n}(𝔽_q)`, the finite unitary
groups) has finitely many irreducible complex characters, and two classical machines construct them. Their
general theory is stated in ReductiveGroups and RepresentationTheory/CharacterTheory; this roadmap states, for the
general linear groups, the forms that the family's formal proof uses, and cites the general theorems of which they are
cases. Harish-Chandra induction from Levi subgroups of rational parabolic subgroups
sorts the irreducible characters into series, each attached to a cuspidal character of a Levi subgroup.
Deligne–Lusztig induction attaches to every rational maximal torus `T` and every character `θ` of `T^F`
a virtual character `R_T^G(θ)`, the alternating sum of the `θ`-isotypic parts of the ℓ-adic cohomology
with compact supports of a variety on which `G^F × T^F` acts. The first general theorem is the
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
Harish-Chandra functors with their Mackey formula, and which states in general the rational Borel pairs and tori, Harish-Chandra
series, Gelfand–Graev representations and Deligne–Lusztig induction; on the [RepresentationTheory](../../RepresentationTheory/README.md) family ([CharacterTheory](../../RepresentationTheory/CharacterTheory/README.md),
[InductionRestriction](../../RepresentationTheory/InductionRestriction/README.md) and [SchurWeyl](../../RepresentationTheory/SchurWeyl/README.md)) for characters, induction and symmetric functions, CharacterTheory
stating Green's theory of the characters of `GL_n(𝔽_q)`; on
[EtaleCohomologyFoundations](../../EtaleCohomologyFoundations/README.md) for compactly supported ℓ-adic cohomology, and on EtaleDualityAndPerverseSheaves for the
Lefschetz numbers of finite-order automorphisms; and on [SmoothRepresentationsOfLocalGroups](../../SmoothRepresentationsOfLocalGroups/README.md)
for compact induction and Jacquet modules of `p`-adic groups, with the depth-zero representations of `GL_n`. In the family [RiemannHypothesisForDirichletLFunctions](../README.md) it feeds
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
Deligne–Lusztig induction, cited from ReductiveGroups with the forms for `GL_n` that the formal proof uses, in the
order the Lang map as a `G^F`-torsor and Deligne–Lusztig varieties, inner
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
  by `a ↦ a^q` on coordinates; `G^F ≃ G₀(𝔽_q)` by that layer. The statements of Layers 0–4 made for a general `G`
  are made for every Steinberg endomorphism `F` in the sense of ReductiveGroups Layer 9E (some power `F^δ` is the
  `q^δ`-Frobenius of an `𝔽_{q^δ}`-structure); there `q` denotes the positive real number with that
  property (for the Suzuki and Ree groups an odd power of `√2` or `√3`), and every formula below in which
  `q` appears (`q^N`, `q^{ℓ(w)}`, `|G^F|_p`) is read with this `q`. The statements made for `GL_n`, and Layers 5
  and 6, concern `GL_n` with the standard Frobenius.
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
[FormalProof]. Where a section states the form of [FormalProof], or restates a section of another roadmap, what no other
roadmap states of the wider form is kept beside the statement: in a second statement block headed **Wider form** when a
route rests on it (2.6, 5.1), and otherwise in a *Remark* (1.1, 2.6, 3.2, 4.2, 4.10, 4.11, 5.9); neither is a
statement of [FormalProof].

**Labels.** Under each section heading, `*Origin:*` says where its statement comes from and `*Method of the formal proof:*`
how [FormalProof] proves it. The definitions of 2.1, 5.3 and 6.4 carry the first label only. The statements of 0.2, 0.5,
1.4, 3.1, 3.3, 3.4, 4.1–4.3, 4.6, 5.10 and 6.2 are not statements of [FormalProof]: 6.2 is stated with its route, and the
others restate published theorems through the sections of other roadmaps that state them, with the routes of the clauses
that no such section states. Of each other section [FormalProof] has a statement, which the second label names. In 0.4,
1.0–1.3, 2.3, 2.6, 3.2, 4.4, 4.5, 4.7–4.11, 5.1, 5.4, 5.7 and 5.9 the statement is a case of the general theorem that the
`*Corollary of:*` line names: the form that [FormalProof] has, for `GL_n` over every finite field or over a prime field as
the section says, except that 3.2 is stated without the étale hypotheses of that form, and that the clauses of 4.8, 5.4
and 5.7 which [FormalProof] has for prime fields `𝔽_p` with `p ≥ 5` are stated over every finite field. In 0.1, 0.3 and
2.2 the statement is the general theorem, of which [FormalProof] has the case of `GL_n`. The parts of a section that are
this roadmap's own formulations are named in the first label.

**Corollaries of general theorems.** A section may carry, as a third line under these two labels, `*Corollary of:*`,
which names a general theorem and the roadmap section that states it, and the clauses it covers when it does not cover
the whole section. The general theorem is proved in the roadmap that states it, and what the line covers is deduced from
it. The proof of the Riemann hypothesis for Dirichlet L-functions needs only that case, not the general theorem in full:
the `*Method of the formal proof:*` label says how [FormalProof] proves it, and for which form of the statement when
that proof has a narrower one. Where the route given with the section is not the deduction, it is a second proof,
[FormalProof]'s unless the label says that it differs; the `*Needs:*` line lists what that route needs, and the
deduction needs the section that the `*Corollary of:*` line names. In 4.4, 4.5, 4.7, 4.9 and 4.10 the line names, beside
the general theorem, RepresentationTheory/CharacterTheory §9a.8 (b), which identifies Green's class functions `J_n(θ̃)`
with the Deligne–Lusztig characters of the Coxeter torus.

## Layer 0: finite reductive groups, rational tori and classes

### 0.1 Rational Borel pairs and the order of `G^F`

*Origin:* published: Steinberg, *Endomorphisms of linear algebraic groups* (1968), and Carter (1985), the rational Borel
pairs, the Sylow subgroup `U₀^F`, the rational Bruhat decomposition with its cell sizes and the order of `G^F`.

*Method of the formal proof:* only `GL_n` occurs: over every field each invertible matrix is `u·m·u′` with `u`, `u′` upper
unitriangular and `m` monomial, by column reduction (a right translate by a unitriangular matrix places the lowest nonzero
entries of the columns in distinct rows), and `m` is unique because a permutation `τ` with `τ(b) ≤ b` for all `b` is the
identity; the order of `GL_n(𝔽_q)`, the product of the `q^n − q^i`, `0 ≤ i < n`, is Mathlib's. The route written here is
not that proof's: it obtains the decomposition for every `G^F` from Lang's theorem and fixed-coset lifting.

*Corollary of:* ReductiveGroups §7a.1 (rational Borel pairs, the Sylow subgroup `U₀^F` and the rational Bruhat
decomposition with its cell sizes, extended to Steinberg endomorphisms in ReductiveGroups Layer 9E), for every clause but
the order formula.

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

*Origin:* published: Deligne and Lusztig (1976), §1, and Dudas and Michel (2015), Propositions 7.10 and 7.12 (i), the
rational maximal tori, their types in the `F`-classes of `W` and their normalisers.

*Method of the formal proof:* none; the statement is not in [FormalProof].

For `g ∈ G` with `g⁻¹F(g) ∈ N_G(T₀)` of image `w ∈ W`, the torus `T = gT₀g⁻¹` is rational; it is said to
be **of type `w`**, and `ad(g⁻¹)` identifies `T^F` with `T₀^{wF} = {t ∈ T₀ : ẇF(t)ẇ⁻¹ = t}`. Every
rational maximal torus is of some type, and `T ↦ type` is a bijection from `G^F`-classes of rational
maximal tori to `F`-classes of `W` (`w ∼ v⁻¹wF(v)`); `N_{G^F}(T)/T^F ≅ {v ∈ W : v⁻¹wF(v) = w}`. Write
`T_w` for a torus of type `w`.

This is ReductiveGroups §7a.2 (rational maximal tori), extended to Steinberg endomorphisms in ReductiveGroups Layer 9E.

*Needs:* 0.1; ReductiveGroups §7a.2 (Layer 9E for Steinberg endomorphisms).

**Checks.**
- `GL₂`: two classes, `T₁^F ≅ (𝔽_q^×)²` of order `(q−1)²` and `T_s^F ≅ 𝔽_{q²}^×` of order `q² − 1`; they
  are geometrically conjugate and not rationally conjugate (their orders differ).
- The convention `g⁻¹F(g)` and the formula `ẇF(t)ẇ⁻¹ = t` are tested on `GL₂` with `w = s`: `T₀^{sF}`
  consists of `diag(a, a^q)` with `a^{q²} = a`, a cyclic group of order `q² − 1`.

### 0.3 Semisimple and regular elements

*Origin:* published: Steinberg (1965), 2.7 (a), 2.8 and 2.11, the centralisers of semisimple elements and the regular
semisimple elements; Macdonald (1995), Ch. IV, their form in `GL_n(𝔽_q)`; the descent of conjugacy along a finite
extension of the field is the Noether–Deuring theorem, and the cancellation of direct powers by counting homomorphisms is
Lovász (1967).

*Method of the formal proof:* the part of order prime to `p` of an element `g` of order `p^a m`, `p ∤ m`, is the power
`g^{p^{aφ(m)}}`, `φ` Euler's function, and it is unique with its properties; of the clauses on `GL_n` the formal proof
has those on an element with separable characteristic polynomial (its centraliser is commutative, from an eigenbasis over
the algebraic closure and a cyclic vector), the existence of elliptic elements and the descent of conjugacy: for a finite
extension `K′` of a finite field `K`, restriction of scalars gives an isomorphism between `[K′ : K]` copies of the two
`K[X]`-modules, and the copies are cancelled by counting homomorphisms from every finite module, the device of Lovász
(1967), in place of the Krull–Schmidt theorem. The route written here is that proof's for `g = su` and for the descent of
conjugacy; for `C_G(s)°` it cites ReductiveGroups §7.1, and for `GL_n` it treats every semisimple `s`, of which that
proof has the case of a separable characteristic polynomial.

*Corollary of:* ReductiveGroups §7.1 (centralisers of semisimple elements: `C_G(s)°` is reductive, generated by a maximal
torus through `s` and the `U_α` with `α(s) = 1`, and contains every maximal torus through `s`; the regularity criterion),
for the clauses on `C_G(s)°` and on regular elements of a general `G`.

Every `g ∈ G^F` is uniquely `g = su = us` with `s` semisimple of order prime to `p` and `u` unipotent of
`p`-power order, both powers of `g`. For semisimple `s ∈ G^F`, `C_G(s)°` is a rational connected reductive
subgroup containing every maximal torus through `s`; `s` is **regular** when `C_G(s)°` is a maximal torus (Steinberg
1965, 2.7 (a) and 2.11, p. 53, stated there for semisimple `G`).
For `G = GL_n`, `C_G(s)` is connected; if the characteristic polynomial of `s` is `∏_f f^{m_f}` over
monic irreducible `f ≠ X`, then `C_{G^F}(s) ≅ ∏_f GL_{m_f}(𝔽_{q^{deg f}})`; `s` is regular exactly when the
characteristic polynomial is squarefree, and `C_{G^F}(s) ≅ 𝔽_{q^n}^×` (with `s` regular and its
centraliser a torus that is anisotropic modulo the centre of `GL_n`) exactly when it is irreducible — such `s`
are called **regular elliptic**. Elements of `GL_n(K)` that are conjugate in `GL_n(K′)`, `K′/K` a finite extension of
finite fields, are conjugate in `GL_n(K)`.

*Route.* Jordan decomposition in the finite group (powers of `g`). Reductivity of `C_G(s)°`, its generation
by a maximal torus through `s` and the root subgroups `U_α` with `α(s) = 1`, and the fact that it contains
every maximal torus through `s`, are ReductiveGroups §7.1; it is rational
because `F(C_G(s)°) = C_G(F(s))° = C_G(s)°`. For `GL_n`, `s` makes `𝔽_q^n` a module over
`𝔽_q[X]/(charpoly)`, which splits by the Chinese remainder theorem; the centraliser is the unit group of
the endomorphism ring of that module. The descent of conjugacy is proved as the Method label says.

*Needs:* ReductiveGroups Layers 4, 7; ReductiveGroups §7.1 (centralisers of semisimple elements);
Mathlib `Matrix.charpoly`,
`Polynomial.Monic`, `Irreducible`, `Squarefree`.

### 0.4 Conjugacy classes of `GL_n(𝔽_q)`

*Origin:* published: Green (1955) and Macdonald (1995), Ch. IV, the conjugacy classes of `GL_n(𝔽_q)`, of which the
statement has the Jordan type inside one primary component, the splitting along coprime characteristic polynomials, the
separable classes and the count of the characteristic polynomials of invertible matrices.

*Method of the formal proof:* over every field, the structure theorem for torsion modules over `K[X]` decomposes an
endomorphism killed by a power of an irreducible `f` into summands `K[X]/(f^e)`, on which `ker f^j` has dimension
`deg f·min(j, e)`, so the dimensions of the `ker f(g)^j` determine the exponents and hence the conjugacy class; a block
with coprime characteristic polynomials on a stable subspace and on the quotient is split off (there for a finite field)
by solving `ug − gu = h` for a given map `h` from the quotient to the subspace, the map `u ↦ ug − gu` being injective on
the maps from the quotient to the subspace; and the classes with separable characteristic polynomial. Its count is of the
monic polynomials with nonzero constant term.

*Corollary of:* RepresentationTheory/CharacterTheory §9a.1 (the conjugacy classes of `GL_n(𝔽_q)`), for the clauses over a
finite field: the separable classes and the number of monic polynomials with nonzero constant term, which is the number
of semisimple classes.

Let `K` be a field, `f` an irreducible polynomial over `K` and `g` an endomorphism of a finite-dimensional `K`-vector
space killed by a power of `f`. Then the space, as a `K[X]`-module through `g`, is a direct sum of modules
`K[X]/(f^{e_i})`; `dim ker f(g)^j = deg(f)·Σ_i min(j, e_i)` for every `j`; and two such endomorphisms with the same
dimensions of `ker f(g)^j` for every `j` are conjugate (the Jordan type inside one primary component). An endomorphism
with coprime characteristic polynomials on a stable subspace and on the quotient is conjugate to the direct sum of the two
(in [FormalProof] for a finite field). Two elements of `GL_n` with the same separable characteristic polynomial are
conjugate. The monic polynomials of degree `n` over `𝔽_q` with nonzero constant term number `q^n − q^{n−1}` for `n ≥ 1`.

The classification of all conjugacy classes of `GL_n(𝔽_q)` by the functions from the monic irreducible polynomials
`f ≠ X` to partitions, the generating function `Σ_{n≥0} k_n(q) t^n = ∏_{i≥1} (1 − t^i)/(1 − q t^i)` of their number
`k_n(q)` (written `c_n(q)` there), the number `q^n − q^{n−1}` of semisimple classes, and the number `k_n(q)` of the
classes of pairs `(T, θ)` of a rational maximal torus and a character of its rational points, also for the Levi
subgroups `∏_i GL_{n_i}`, are RepresentationTheory/CharacterTheory §9a.1.

*Route.* The route of [FormalProof], given in the Method label above.

*Needs:* 0.3; RepresentationTheory/CharacterTheory §9a.1 (for the general form cited).

**Checks.**
- `k₁ = q − 1`, `k₂ = q² − 1`, `k₃ = q³ − q`, read off the product to order `t³`.
- `GL₂(𝔽_q)`: `q − 1` central, `½(q−1)(q−2)` split semisimple, `q − 1` non-semisimple and `½q(q−1)`
  elliptic classes, matching CharacterTheory Layer 9's four families.
- Pairs for `n = 2`: `T₁` with the `½(q−1)q` unordered pairs `{α, β}` of characters of `𝔽_q^×` (`α = β` allowed),
  and `T_s` with the `½(q²−1−(q−1)) + (q−1) = ½(q² + q − 2)` Frobenius orbits of characters of `𝔽_{q²}^×`: in all
  `q² − 1 = k₂(q)`.

### 0.5 Regular unipotent elements

*Origin:* published: Steinberg (1965), 3.1, Lemma 3.2 and Theorem 3.3, (a), (b) and the existence of regular unipotent
elements; Digne, Lehrer and Michel (1992), their rational form; (c) is this roadmap's own formulation.

*Method of the formal proof:* none; the statement is not in [FormalProof].

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

*Route.* (a), (b) and the existence of regular unipotent elements are ReductiveGroups §7C.6, and the rational form of
(a), with the regular unipotent elements of `G^F`, is ReductiveGroups §7i.1 (a), extended to Steinberg endomorphisms in
ReductiveGroups Layer 9E. (c) The simple roots of `L` (for the Borel subgroup `B₀ ∩ L` after conjugating `P` to a standard
one) are simple roots of `G`, and the image of `u` in `L` has the same components on them. For `GL_n` all three
are direct: `u − 1` has rank `n − 1` iff `u` has one Jordan block, the kernels of `(u − 1)^j` form the only
`u`-stable complete flag, and a block-triangular `u` with one Jordan block has one Jordan block in each
diagonal block.

*Needs:* 0.1; ReductiveGroups §7C.6 (regular unipotent elements), §7i.1 (their rational form; Layer 9E for Steinberg
endomorphisms); ReductiveGroups Layer 7 (for (c)).

**Checks.**
- `GL₂`: `[[1, a], [0, 1]]` with `a ≠ 0` is regular and fixes only the line `⟨e₁⟩`; `a = 0` gives `1`, whose
  centraliser is all of `GL₂`.
- `SU₃(𝔽_q)` (2.1's Check): the regular unipotent elements of `U₀^F` are those with nonzero image in
  `(U₀/U₀*)^F ≅ (𝔽_{q²}, +)`, `q³ − q` of them.

### Examples

The Bruhat decomposition gives `|GL₂(𝔽_q)| = q·(q−1)²·(1 + q) = q(q−1)(q²−1)`, and for the unitary group `U₃(𝔽_q)`, with `ℓ` the length function of `W` and not of `W^F`, `|G^F| = q³(q+1)(q²−1)(q³+1)` (0.1). `GL₂` has two classes of rational maximal tori, `T₁^F ≅ (𝔽_q^×)²` and `T_s^F ≅ 𝔽_{q²}^×`, geometrically but not rationally conjugate (0.2). The class numbers of `GL_n(𝔽_q)` begin `k₁ = q − 1`, `k₂ = q² − 1`, `k₃ = q³ − q`, and the `q² − 1` classes of `GL₂(𝔽_q)` are `q − 1` central, `½(q−1)(q−2)` split semisimple, `q − 1` non-semisimple and `½q(q−1)` elliptic ones (RepresentationTheory/CharacterTheory §9a.1, cited in 0.4). In `GL₂`, `[[1, a], [0, 1]]` with `a ≠ 0` is regular unipotent and fixes only the line `⟨e₁⟩` (0.5).

### Dependencies

ReductiveGroups Layers 4, 7, 7a, 7b, 7C, 9 and 9E, with §7.1 (centralisers of semisimple elements, 0.3), §§7a.1, 7a.2 (0.1, 0.2), §7C.6 and §7i.1 (0.5); RepresentationTheory/CharacterTheory §9a.1 (0.4); Mathlib's `Matrix.charpoly`, `Polynomial.Monic`, `Irreducible` and `Squarefree`.

## Layer 1: Harish-Chandra theory

### 1.0 Transitivity of Harish-Chandra functors

*Origin:* published: Dudas and Michel (2015), Proposition 9.5, the transitivity of the Harish-Chandra functors, of which
(ii) is the case of class functions of the general linear groups; (i) is induction in stages through an inflation, the
form for finite groups of RepresentationTheory/InductionRestriction Layer 0 that (ii) uses.

*Method of the formal proof:* it computes with `Ind_P f(x) = |P|⁻¹ Σ_y f(y⁻¹xy)` (`f` extended by zero off `P`): the
inner induction is unfolded and absorbed into the outer sum by a change of variable, so that both bracketings of a triple
product become one sum of a function supported on the three-block parabolic subgroup, whose two descriptions agree entry
by entry.

*Corollary of:* ReductiveGroups §7c.1 (transitivity of the Harish-Chandra functors), for (ii).

(i) Let `H` be a finite group, `Q ⊂ H` a subgroup, `π : Q → L` a surjective homomorphism, `P′ ⊂ L` a subgroup and `f′` a
function on `P′`. With `Ind_P f(x) = |P|⁻¹ Σ_y f(y⁻¹xy)` (`f` extended by zero off `P`), inducing to `H` the inflation
along `π` of `Ind_{P′}^L f′` equals inducing to `H` from `π⁻¹(P′)` the function `f′∘π` (induction in stages through an
inflation).
(ii) For class functions `χ₁, χ₂, χ₃` of `GL_a(𝔽_q)`, `GL_b(𝔽_q)`, `GL_c(𝔽_q)`, `(χ₁ × χ₂) × χ₃ = χ₁ × (χ₂ × χ₃)`, both
being the Harish-Chandra induction of `χ₁ ⊠ χ₂ ⊠ χ₃` from the standard three-block parabolic subgroup of `GL_{a+b+c}`.

The general statements, for a connected reductive `G` with a Frobenius or Steinberg endomorphism — the rational parabolic
subgroups contained in a rational parabolic subgroup `Q = M ⋉ V`, and the natural isomorphisms
`R_{M⊂Q}^G ∘ R_{L⊂P_M}^M ≅ R_{L⊂P}^G` and `*R_{L⊂P_M}^M ∘ *R_{M⊂Q}^G ≅ *R_{L⊂P}^G` for `P = P_M ⋉ V` — are ReductiveGroups
§§7b.1 and 7c.1, extended to Steinberg endomorphisms in ReductiveGroups Layer 9E.

*Route.* The route of [FormalProof], given in the Method label above.

*Needs:* ReductiveGroups Layer 7c (the adapter `R = Ind ∘ Inf`); InductionRestriction Layer 0.

**Checks.**
- `GL₃`, `Q = P_{(2,1)}`, `P_M = B ∩ GL₂`: `R_{GL₂×GL₁}^{GL₃}(Ind_{B₂}^{GL₂} 1 ⊠ 1) = Ind_{B₃}^{GL₃} 1`, of
  degree `(q²+q+1)(q+1)`, the number of complete flags in `𝔽_q³`.

### 1.1 Cuspidal representations

*Origin:* published: Harish-Chandra (1970) and Springer (1970), the cuspidal representations of finite reductive groups,
with the definition as in Dudas and Michel (2015), Definition 10.2; here the case of `GL_n(𝔽_q)`. The invariance under
the automorphisms of `ℂ` and the remark are this roadmap's own formulation.

*Method of the formal proof:* cuspidality is the absence of vectors fixed by the unipotent radicals of the proper block
parabolic subgroups. The average of a character over such a radical is the dimension of the fixed vectors, so over a
prime field the character condition at the maximal standard parabolic subgroups is the absence of fixed vectors there; a
general block parabolic subgroup is reduced to a maximal one because, after conjugation by a permutation matrix, its
unipotent radical contains that of the parabolic subgroup cut at its first block; and cuspidality is invariant under the
automorphisms of `ℂ`.

*Corollary of:* ReductiveGroups §7h.1 (cuspidal representations: the tests by Harish-Chandra restriction and by
invariants, on maximal parabolic subgroups), for every clause but the invariance under the automorphisms of `ℂ`.

Let `G = GL_n(𝔽_q)`. An irreducible representation `π` of `G` is **cuspidal** if `π^{U_P^F} = 0` for the unipotent
radical `U_P` of every proper block upper triangular parabolic subgroup `P`; it is enough to test the maximal ones (two
blocks). Over a prime field this holds exactly when the Harish-Chandra restriction of the character of `π` to
`GL_a × GL_b` vanishes for all `a + b = n` with `a, b ≥ 1`. Cuspidality is invariant under the field automorphisms of
`ℂ`.

The general statement, for every `G^F` — the tests by Harish-Chandra restriction and by invariants, on maximal parabolic
subgroups, the preservation of cuspidality by the contragredient and by twisting with a linear character `χ` of `G^F`
trivial on `U₀^F`, a condition on a linear character equivalent to triviality on all unipotent elements of `G^F` and to
`χ` having order prime to `p`, and the cuspidality of every irreducible representation of a torus — is ReductiveGroups
§7h.1, extended to Steinberg endomorphisms in ReductiveGroups Layer 9E.

*Remark* (this roadmap's own formulation; not a statement of [FormalProof]). Every `α∘det` on `GL_n(𝔽_q)` is trivial on
the unipotent elements, so twisting by `α∘det` preserves cuspidality (ReductiveGroups §7h.1).

*Route.* The route of [FormalProof], given in the Method label above. For the remark: `det u = 1` for unipotent `u`, and
ReductiveGroups §7h.1 (twisting by a linear character trivial on `U₀^F`).

*Needs:* ReductiveGroups 7b, 7c (the invariants description of `*R`); ReductiveGroups §7h.1 (for the remark).

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

*Origin:* published: Harish-Chandra (1970), Springer (1970) and Dudas and Michel (2015), Lemma 10.3, Proposition 10.6 and
Theorem 10.11, the cuspidal support and the partition into Harish-Chandra series of a finite reductive group, of which
the statement is the case of `GL_n(𝔽_p)`, in terms of characters.

*Method of the formal proof:* existence is by induction on `n`: a non-cuspidal irreducible character has a nonzero
two-block Harish-Chandra restriction, a constituent `κ₁ ⊠ κ₂` of it has cuspidal supports by induction, and Frobenius
reciprocity with the associativity of the product (1.0 (ii)) places the character in the product of the two lists;
uniqueness comes from the pairing of two products of cuspidal characters, computed by reciprocity and the two-block
Mackey formula, in which cuspidality leaves only the terms that remove one common factor from both lists, so that the
products are orthogonal unless the lists are permutations of each other.

*Corollary of:* ReductiveGroups §7h.2 (cuspidal support and Harish-Chandra series).

Let `p` be a prime and `G = GL_n(𝔽_p)`. For every irreducible character `χ` of `G` there is a list `(σ_1, …, σ_r)` of
cuspidal characters `σ_i` of `GL_{n_i}(𝔽_p)`, `n_1 + ⋯ + n_r = n`, with `⟨χ, σ_1 × ⋯ × σ_r⟩ ≠ 0`; and for two such lists
`⟨σ_1 × ⋯ × σ_r, τ_1 × ⋯ × τ_s⟩ = 0` unless one is a permutation of the other. Hence the list is unique up to permutation
(the **cuspidal support** of `χ`), and the **Harish-Chandra series** `{χ : ⟨χ, σ_1 × ⋯ × σ_r⟩ ≠ 0}` partition the
irreducible characters of `G`.

The general statement, for every `G^F` — a pair `(L, σ)` of a rational Levi subgroup and an irreducible cuspidal
representation of `L^F` with `π` a constituent of `R_L^G(σ)`, unique up to `G^F`-conjugacy, and the partition into
Harish-Chandra series — is ReductiveGroups §7h.2, extended to Steinberg endomorphisms in ReductiveGroups Layer 9E.

*Route.* The route of [FormalProof], given in the Method label above.

*Needs:* 1.0, 1.1; ReductiveGroups 7c, 7d (the two-block Mackey formula); CharacterTheory Layer 3.

### 1.3 Endomorphism algebras

*Origin:* published: Howlett and Lehrer (1980), and Dudas and Michel (2015), (11.7), Lemma 11.8 and Proposition 10.8, the
dimension of the endomorphism algebra of `R_L^G σ` and the bijection of the series of `(L, σ)` with its simple modules,
of which the statement is the case of `GL_n` with a trivial stabiliser.

*Method of the formal proof:* for pairwise non-isomorphic cuspidal blocks, an intertwiner between two induced
representations is a kernel `K` on the group with `K(p′gp) = σ′(p′)K(g)σ(p)`; every double coset of block parabolic
subgroups contains a permutation matrix `w`, and cuspidality forces `K(w) = 0` unless `w` carries blocks to blocks with
isomorphic representations. So the endomorphism algebra is `ℂ`, the induced representation is irreducible, and two such
induced representations are isomorphic exactly when their blocks match.

*Corollary of:* ReductiveGroups §7h.3 (endomorphism algebras of Harish-Chandra induced cuspidal representations, in the
case of a trivial stabiliser), with §7h.2 for the isomorphism criterion.

For a cuspidal pair `(L, σ)` put `W_{G^F}(L, σ) = {n ∈ N_{G^F}(L) : ^nσ ≅ σ}/L^F`. Let `L = GL_{n_1} × ⋯ × GL_{n_r}` be a
block diagonal Levi subgroup of `G = GL_n` and `σ = σ_1 ⊠ ⋯ ⊠ σ_r` with `σ_i` irreducible cuspidal representations of
`GL_{n_i}(𝔽_q)` that are pairwise non-isomorphic, so that `W_{G^F}(L, σ) = 1`. Then `End_{G^F}(R_L^G σ) = ℂ`: `R_L^G σ`
is irreducible. Two such induced representations are isomorphic exactly when their blocks match (a permutation of the
blocks carries one datum to the other).

The general statement, for every cuspidal pair of every `G^F` — `dim End_{G^F}(R_L^G σ) = |W_{G^F}(L, σ)|`, and
`π ↦ Hom_{G^F}(π, R_L^G σ)` a bijection from the series of `(L, σ)` to the simple modules of `End_{G^F}(R_L^G σ)`, under
which the multiplicity of `π` is the dimension of its module — is ReductiveGroups §7h.3, extended to Steinberg
endomorphisms in ReductiveGroups Layer 9E.

*Route.* The route of [FormalProof], given in the Method label above.

*Needs:* 1.1; ReductiveGroups 7b, 7c; RepresentationTheory/CharacterTheory Layers 2–3.

### 1.4 The general linear group: Hecke algebras of type A

*Origin:* published: Howlett and Lehrer (1980), Theorems 3.18 (i) and 4.14 with Example 4.15, and Iwahori (1964), the
endomorphism algebra of `R_L^G σ` as a tensor product of Iwahori–Hecke algebras of type A; the identification of each
`T_s` with `±R_M^G(T_s^M)` is this roadmap's own formulation.

*Method of the formal proof:* none; the statement is not in [FormalProof].

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
singles out one multiple of the operators supported on `P^F ṡ P^F`). The two constituents and the presentation by the `T_w` are
Howlett–Lehrer 1980, Theorems 3.18 (i) and 4.14 (pp. 48, 56–57); `L = GL_d^m` is their Example 4.15 (pp. 57–58). Thus `End(R_L^G σ) ≅ ⊗_O H_{m_O}(a_O)`, where
`H_m(a)` is the Iwahori–Hecke algebra of `S_m` with these
relations, the algebra of TypeAHeckeAlgebras §1.1 at the parameter `√a` after the substitution `T_s ↦ √a·T_s`; it
is split semisimple, and by ReductiveGroups §7h.3 the constituents of `R_L^G σ` correspond to its simple modules, with
multiplicity the dimension. For `L = T` and `σ = 1` this is Iwahori's theorem `End(Ind_{B^F}^{G^F} 1) ≅ H_n(q)`.
The value `a_O = q^{d_O}`, and with it `T_s = R_M^G(T_s^M)` for every `s`, is 2.4(d).

*Route.* `W_{G^F}(L, σ)`, the basis `T_w` with its relations, the split semisimplicity and Iwahori's case are
CharacterTheory §9a.5, whose route builds from the block permutation matrices operators `B_w` supported on
`P^F ẇ P^F`, a basis by ReductiveGroups §7h.3, with `B_w B_{w'} = B_{ww'}` when lengths add. What is proved here is the relation of the
`T_s` to the operators `T_s^M`. *The quadratic relation* is computed inside `M` and transported.
By ReductiveGroups §7h.3 for `M` (with `W_{M^F}(L, σ) = {1, s}`), `End_M(R_L^M σ)` is two-dimensional, spanned by `1` and an operator `T^M`
supported on `P_M^F ṡ P_M^F`; so `R_L^M σ = (σ_O × σ_O) ⊠ σ'` has exactly two constituents `π_− ⊠ σ'`, `π_+ ⊠ σ'`, each of
multiplicity one, and `T^M`, not a scalar, has two distinct eigenvalues `λ_−`, `λ_+`, one on each. The trace of `T^M` on
`R_L^M σ` is zero (its kernel vanishes on the identity double coset), so `λ_−·deg π_− + λ_+·deg π_+ = 0`, that is
`λ_− = −a_O λ_+`; rescaled so that `λ_+ = −1`, the operator `T_s^M` of the statement satisfies `(T_s^M − a_O)(T_s^M + 1) = 0`.
By ReductiveGroups §7c.1, `R_L^G σ = R_M^G(R_L^M σ)`, and the functor `R_M^G = Ind_{Q^F}^{G^F} ∘ Inf_{M^F}^{Q^F}` (`Q = MV` the parabolic subgroup
with Levi `M` containing `P`, `P = P_M V`) maps `End_M(R_L^M σ)` into `End_G(R_L^G σ)` as an algebra homomorphism: in the
description of intertwiners by kernels it inflates the kernel to `Q^F` and extends it by zero, so `R_M^G(T_s^M)` is supported
on `P_M^F ṡ P_M^F V^F = P^F ṡ P^F` (`ṡ ∈ M` normalises `V`) and is a nonzero multiple `c_s·B_s` of the basis operator of `s`
(the operators supported on one double coset form a line, ReductiveGroups §7h.3), which satisfies the quadratic relation. Two simple reflections
`s, s'` of `S_{m_O}` satisfy `s' = wsw⁻¹` with `ℓ(ws) = ℓ(s'w) = ℓ(w) + 1`, so `B_{s'}B_w = B_{s'w} = B_{ws} = B_wB_s` with `B_w` invertible
(a product of the `B_r` of simple reflections `r`, each a root of a quadratic polynomial with nonzero roots): `B_s` and `B_{s'}`
have the same minimal polynomial, and `{a_O/c_s, −1/c_s} = {a_O/c_{s'}, −1/c_{s'}}`. Fix one `s₀` in each factor and put
`c_O = c_{s₀}`: then every `T_{s'} := c_OB_{s'}` has the roots `a_O` and `−1`, and the basis `T_w = ∏_O c_O^{ℓ_O(w)}B_w` (`ℓ_O(w)` the
length of the `S_{m_O}`-component of `w`) keeps `T_wT_{w'} = T_{ww'}` when lengths add and satisfies the quadratic relations.
Comparing the two root sets, `c_{s'} = c_O`, or `a_O/c_{s'} = −1/c_O` and `−1/c_{s'} = a_O/c_O`, which forces `a_O² = 1` and
`c_{s'} = −c_O`; so `T_s = ±R_M^G(T_s^M)`, with the sign `+` for every `s` when `a_O ≠ 1`. No value of `a_O` enters this argument: when `a_O = 1`
the roots `1`, `−1` do not distinguish an operator from its negative, and the identification of every `T_s` with
`R_M^G(T_s^M)` follows once `a_O ≠ 1`, which is 2.4(d). The eigenspaces of `T_s` on
all of `R_L^G σ` are sums of several constituents, and the trace of `T_s` there does not give their degrees (Checks).

*Needs:* ReductiveGroups §§7c.1, 7h.3 (transitivity; endomorphism algebras); RepresentationTheory/CharacterTheory §9a.5 (the Hecke algebras of Harish-Chandra induced cuspidal
representations of `GL_n(𝔽_q)`); ReductiveGroups 7b–7d; TypeAHeckeAlgebras §§1.1, 1.2.

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

Layer 0; ReductiveGroups Layers 7, 7b, 7c, 7d, 7e and 9E, with §§7b.1, 7c.1 (1.0, 1.4) and Layer 7h (1.1–1.4); InductionRestriction Layer 0; RepresentationTheory/CharacterTheory Layers 2–3 and §9a.5 (1.4); TypeAHeckeAlgebras §§1.1 and 1.2.

## Layer 2: Gelfand–Graev representations, the mirabolic subgroup and Bessel-type induced representations

### 2.1 Regular characters and Gelfand–Graev representations

*Origin:* definitions and conventions.

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

*Origin:* published: Gelfand and Graev (1962), Steinberg, *Lectures on Chevalley groups* (1968), and Digne, Lehrer and
Michel (1992), §2, the multiplicity one of the Gelfand–Graev representations and their independence of `ψ` under a
connected centre.

*Method of the formal proof:* for `GL_n(𝔽_q)` and the standard regular character, Gelfand's trick: with `E` the sum of the
`ψ(u)⁻¹τ(u)` over `U^F`, the anti-involution `g ↦ J gᵀ J` preserves `U^F` and `ψ`, every double coset of `U^F` contains a
monomial matrix, and a monomial matrix `m` either is fixed by the anti-involution or has `E·τ(m)·E = 0`; so the operators
`E·τ(g)·E` commute, and the space of `(U^F, ψ)`-eigenvectors of an irreducible `τ` has dimension at most one.

*Corollary of:* ReductiveGroups §7i.2 (multiplicity one of the Gelfand–Graev representations and generic representations),
extended to Steinberg endomorphisms in ReductiveGroups Layer 9E.

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

*Origin:* published: Gelfand and Graev (1962) and Steinberg, *Lectures on Chevalley groups* (1968), the uniqueness of
Whittaker functionals; here for `GL_n(𝔽_q)` and the standard regular character.

*Method of the formal proof:* for `GL_n` over every finite field and the standard regular character `ψ`: a Whittaker
functional on `π` is a `(U^F, ψ⁻¹)`-eigenvector of the dual representation, so the line statement is the bound of 2.2 for
eigenvectors; over a prime field the pairing of a class function with the Gelfand–Graev character is identified with the
trace of the `(U^F, ψ)`-idempotent by rearranging the sum over the group. The route written here obtains the line from
Frobenius reciprocity and 2.2, with no passage to the dual representation.

*Corollary of:* ReductiveGroups §7i.2 (uniqueness of Whittaker functionals and generic representations).

Let `G = GL_n(𝔽_q)` and `ψ` the standard regular character of `U^F` (Conventions). For every irreducible `π`,
`Hom_{U^F}(π, ψ)` has dimension at most one (uniqueness of Whittaker functionals); `π` is **generic** if this space is
not zero. Over a prime field, for every class function `χ` of `G` the pairing `⟨χ, Γ_ψ⟩` is the trace of the
`(U^F, ψ)`-idempotent, the dimension of the `(U^F, ψ)`-eigenspace when `χ` is a character; so `π` is generic exactly when
it is a constituent of `Γ_ψ`.

The general statement, for every connected reductive `G` and every regular character `ψ` — `π` generic when
`Hom_{U₀^F}(π, ψ) ≠ 0`, equivalently when it is a constituent of `Γ_ψ`, that space being a line, and the notion
independent of `ψ` under a connected centre — is ReductiveGroups §7i.2, extended to Steinberg endomorphisms in
ReductiveGroups Layer 9E.

*Route.* Frobenius reciprocity (InductionRestriction Layer 2) and 2.2 for the line; the pairing with `Γ_ψ` by
rearranging the sum over the group, as the Method label says.

*Needs:* 2.2; InductionRestriction Layer 2.

### 2.4 Derivatives and the restriction to the mirabolic subgroup (`GL_n`)

*Origin:* published: Zelevinsky (1981), Ch. III, in the formalism of Gelfand and Kazhdan (1975) and Bernstein and
Zelevinsky (1976), the functors, the derivatives and (a), (b); S. I. Gelfand (1970), Proposition 1.3, Theorems 2.3 and
3.3, the criterion for cuspidality by the restriction to `P_n` and the degree; Green (1955), §5, Example (ii), the values
in (c). The lower bound for the degree of a generic representation is deduced from (a) and (b) in the route; (d) is
deduced in the route from (a), (b) and ReductiveGroups §7h.3.

*Method of the formal proof:* the formal proof has the cuspidal clause of (b) and the degree bound for generic
representations. For a cuspidal character, Fourier expansion of its sums over unitriangular subgroups column by column,
the term of the trivial character vanishing by cuspidality and the others being conjugate, gives
`dim π = ∏_{i<n}(q^i − 1)` times the dimension of the Whittaker eigenspace, a line; the map to the representation induced
from the generic character, which is irreducible, is then an isomorphism by equality of dimensions. The degree bound comes
from `∏_{i<n}(q^i − 1)` linearly independent translates of a Whittaker functional under the mirabolic subgroup, by
induction on `n`. The route written here is not that proof's: it goes through the functors `Φ^±`, `Ψ^±` and the
derivatives.

*Corollary of:* RepresentationTheory/CharacterTheory §9a.2 (the mirabolic subgroup and derivatives of `GL_n(𝔽_q)`:
(a)–(d)), for every clause but the degree bound for generic representations and the consequence of (d) for the
operators `T_s` of 1.4.

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
one-dimensional; `π` is cuspidal iff `π|_{P_n} ≅ (Φ⁺)^{n−1}Ψ⁺(1) = Ind_{U^F}^{P_n(𝔽_q)} ψ` (S. I. Gelfand 1970, Proposition 1.3,
Theorem 2.3 with its Corollary 1, and Theorem 3.3, pp. 20–23 of the original). In particular
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
cuspidal, let `(∏_{i≤r} GL_{n_i}, ⊠_i σ_i)`, `r ≥ 2`, be its cuspidal support (ReductiveGroups §7h.2): by adjunction and 1.0,
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
ReductiveGroups 7d), one copy in each of the two constituents (ReductiveGroups §7h.3: `|W_{G^F}(L, σ⊠σ)| = 2`, the algebra
commutative); `*R_{GL_{2d−k}×GL_k}(σ × σ) = 0` for `0 < k < d` and `d < k < 2d` by the Mackey formula and
cuspidality; so by (b) the derivatives of each constituent vanish except in degrees `d` (equal to `σ`, the
Whittaker coinvariant of `σ` being a line) and `2d`. The top derivatives are counted by dimensions in (a). Put
`B = ψ_{2d−1}(q)/(q^d − 1)`. Then `dim(σ × σ) = [GL_{2d} : P_{(d,d)}]·ψ_{d−1}(q)² = ψ_{2d}(q)/(q^d − 1)² = (q^d + 1)B`; the
two derivatives in degree `d` (one `σ` from each constituent) contribute `2·ψ_{d−1}(q)·∏_{j=d+1}^{2d−1}(q^j − 1) = 2B`; the
remainder `(q^d − 1)B = ψ_{2d−1}(q)` is `dim (σ × σ)^{(2d)}·∏_{j=1}^{2d−1}(q^j − 1)`, so `(σ × σ)^{(2d)}` is a line. As derivatives
are additive, exactly one constituent has a nonzero top derivative, a line: it is generic (by (b)), the other is not.
Their degrees, by (a): `B + ψ_{2d−1}(q) = q^dB` and `B`, so the ratio `a_O` of 1.4 (for `σ_O = σ`, `d_O = d`) is `q^d > 1`, and 1.4 (the case `a_O ≠ 1`)
gives `T_s = R_M^G(T_s^M)` for every simple reflection `s`. This computation uses ReductiveGroups §7h.3, the group `W_{G^F}(L, σ ⊠ σ)` of 1.4 and
(a), (b), none of the statements of 1.4 on the operators `T_s`.

*Needs:* 1.0, 1.1, 1.4; 2.3; InductionRestriction Layers 2–5 (Mackey and Clifford theory); ReductiveGroups 7d and
§§7h.2, 7h.3 (cuspidal support; endomorphism algebras).

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

*Origin:* adapted from Gelfand and Graev (1962) and S. I. Gelfand (1970), multiplicity one and the degree of generic
representations: here an explicit bound for convolution with the Gelfand–Graev character.

*Method of the formal proof:* the kernel is the matrix of the convolution operator in the permutation representation on a
free `G^F`-set; on an irreducible subrepresentation of an eigenspace the operator is a scalar by Schur's lemma, equal to
`|G^F|/dim π` or `0` because its trace is `|G^F|` times the rank of the `(U^F, ψ)`-averaging idempotent, which multiplicity
one bounds by `1`. The bound `dim π ≥ ∏_{i<n}(q^i − 1)` for generic `π` is proved by induction on `n`, by exhibiting that
many linearly independent translates of a Whittaker functional under the mirabolic subgroup, separated by the characters
of the last-column subgroup, and the numerical bound from `∏_{i≤k}(1 − x^i) ≥ 1 − 3x/2` for `0 < x ≤ 1/3`, by induction on
`k`, with `(1 − 3x/2)(1 + 3x) ≥ 1`. The route written here takes the eigenvalue from the convolution formula for an
irreducible character, the degree bound from 2.4 and the numerical bound from Euler's pentagonal identity.

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

*Origin:* published: Digne, Lehrer and Michel (1992), Theorem 2.9, the Harish-Chandra restriction of the Gelfand–Graev
representation to a standard Levi subgroup, with the Gelfand–Graev representation of `L_J^F` named through
`H¹(F, Z(L_J))`, of which the statement is the numerical form for `GL_n(𝔽_p)` and two blocks. The wider form (c) is
published, as its heading says; the explicit regular character `ψ^J` of the remark is this roadmap's own formulation.

*Method of the formal proof:* the formal proof has the statement and, over every finite field, the dimension of the
eigenspace of the character with one simple root omitted in a representation induced from cuspidal data (2.8 (a)). The
eigenspace of an induced representation (on characters, the trace of the `(U^F, ψ)`-idempotent on an
induced class function) is decomposed over the double cosets `P^F\G^F/U^F`, represented by permutation matrices; a coset
contributes zero when a simple root subgroup on which the character is nontrivial is conjugated into the unipotent radical
of `P`, or, for induced cuspidal representations and the character with one simple root omitted, when the omitted position
cuts a block, and each surviving coset contributes the Whittaker space of the Levi subgroup, a line.

*Corollary of:* ReductiveGroups §7i.3 (b) (the Harish-Chandra restriction of a Gelfand–Graev representation is a
Gelfand–Graev representation), with §7i.2 (the centre of `GL_n` is connected), by adjunction.

For `G = GL_n` let `Γ_m` be the Gelfand–Graev representation of `GL_m(𝔽_q)` for the standard regular character
(Conventions), `Γ₀` the trivial representation of the trivial group, and for a composition `λ = (λ₁, …, λ_s)` of `n` let
`ψ_λ` be the character `u ↦ ψ₀(Σ_i u_{i,i+1})` of `U^F`, the sum over the `i` that are not partial sums `λ₁ + ⋯ + λ_j`,
and `Γ_λ = Ind_{U^F}^{G^F} ψ_λ`, the **degenerate Gelfand–Graev representation** of `λ` (that of ReductiveGroups §7i.3
for the set `J` of the `s_i` with `i` not a partial sum). For a composition with two parts write
`Γ_{(j,n−j)} = Γ_j × Γ_{n−j}`; `Γ_{(0,n)} = Γ_{(n,0)} = Γ_n`.

Let `p` be a prime, `G = GL_n(𝔽_p)`, `n = a + b`, `L = GL_a × GL_b` and `Γ_m` the Gelfand–Graev representation of
`GL_m(𝔽_p)` for the standard regular character. For every class function `ρ` of `L(𝔽_p)`,
`⟨R_L^G ρ, Γ_n⟩ = ⟨ρ, Γ_a ⊠ Γ_b⟩`.

The general statements, for every `G`, every regular character `ψ` of `U₀^F` (2.1) and every `F`-stable `J ⊂ S` — with
`ψ_J` the character that agrees with `ψ` on the `U_O^F`, `O ⊂ J`, and is trivial on `U₀*^F` and on the other `U_O^F`, and
`Γ_{ψ,J} = Ind_{U₀^F}^{G^F} ψ_J`: (a) `ψ|_{U₀^F ∩ L_J}` is regular and `Γ_{ψ,J} ≅ R_{L_J}^G(Γ^{L_J}_{ψ|})`; (b)
`*R_{L_J}^G(Γ_ψ)` is a Gelfand–Graev representation of `L_J^F`, and `Z(L_J)` is connected when `Z(G)` is — are
ReductiveGroups §7i.3, extended to Steinberg endomorphisms in ReductiveGroups Layer 9E; with §7i.2 they give
`*R_{L_J}^G(Γ) ≅ Γ^{L_J}` under a connected centre.

**Wider form** (published: Zelevinsky (1981); not a statement of [FormalProof]). (c) For `G = GL_n(𝔽_q)`:
`Γ_λ ≅ Γ_{λ₁} × ⋯ × Γ_{λ_s}`, it depends only on the multiset of parts, `*R_{M_λ}^G(Γ_n) ≅ Γ_{λ₁} ⊠ ⋯ ⊠ Γ_{λ_s}` for
`M_λ = GL_{λ₁} × ⋯ × GL_{λ_s}`, and for every irreducible `χ` the multiplicity `⟨χ, Γ_λ⟩` is the number, counted with
multiplicity, of generic constituents of `*R_{M_λ}^G χ`.

*Remark* (this roadmap's own formulation; not a statement of [FormalProof]). In (b) of ReductiveGroups §7i.3 the regular
character can be taken to be `ψ^J(u) = ψ(ẇuẇ⁻¹)` for `u ∈ U₀^F ∩ L_J`, `w = w₀w_J` with `w₀`, `w_J` the longest elements of
`W` and of `W_J` and `ẇ ∈ N_{G^F}(T₀)` a representative: `*R_{L_J}^G(Γ_ψ) ≅ Γ^{L_J}_{ψ^J}`, and `ψ^J` is a regular character
of `L_J^F`. Equivalently `⟨R_{L_J}^G ρ, Γ_ψ⟩ = ⟨ρ, Γ^{L_J}_{ψ^J}⟩` for every class function `ρ` of `L_J^F`.

*Route.* The statement: the route of [FormalProof], given in the Method label above. (c) From ReductiveGroups §7i.3 (a),
(b) and §7i.2 (the centre of `GL_n` is connected) and ReductiveGroups 7e (the Levi subgroups of two compositions with the
same parts are conjugate by a permutation matrix); the multiplicity by adjunction, `Γ^{M_λ} = ⊠_i Γ_{λ_i}` being
multiplicity free with every generic irreducible representation of `M_λ^F` as a constituent (2.2, ReductiveGroups
§7i.2). The remark: by ReductiveGroups §7i.3 (b) and its route, of the summands
`Ind_{P_J^F ∩ ẇ⁻¹U₀^Fẇ}^{P_J^F}(ψ∘ad ẇ)` of `(Γ_ψ)|_{P_J^F}`, `w ∈ W^F` of minimal length in `wW_J`, only that of
`w = w₀w_J` has nonzero `U_{P_J}^F`-invariants. For it the image of `P_J ∩ ẇ⁻¹U₀ẇ` in `L_J` is `U₀ ∩ L_J` (`w(Φ_J⁺) ⊂ Φ⁺`), and `w` maps the
simple roots of `J` to simple roots (`w(α) = −w₀(α′)` with `α′ = −w_J(α) ∈ J` simple), so `ψ^J` is regular; the invariants of
the surviving summand are `Ind_{U₀^F∩L_J}^{L_J^F}ψ^J`. The adjunction form is ReductiveGroups 7c.

*Needs:* 0.1, 2.1, 2.2; ReductiveGroups 7c, 7e and §§7i.2, 7i.3; InductionRestriction Layers 0, 3.

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

*Origin:* adapted from Gelfand and Kazhdan (1975), Bernstein and Zelevinsky (1976) and Zelevinsky (1981), the theory of
derivatives over a finite field, and from the exchange of root subgroups: the decomposition (b) of the Bessel-type
induced representations of `GL_n(𝔽_q)` into degenerate Gelfand–Graev representations, with the inequality (c). In (a) the
norm `⟨Γ_n, Γ_n⟩ = q^n − q^{n−1}` is published (Zelevinsky (1981), Proposition 9.4; Brundan, Dipper and Kleshchev (2001),
Theorem 2.5d (ii), (iii)), and the formula for the derivatives `Γ_n^{(j)}` is this roadmap's own formulation, deduced by a
dimension count.

*Method of the formal proof:* the formal proof has (b) and (c), for every finite-dimensional representation, and of (a)
the norm `⟨Γ_n, Γ_n⟩` over a prime field (4.11 (a)); it proves (b) and (c) by a count of dimensions of character
eigenspaces: for the first position, a descent to the mirabolic subgroup of `GL_{k+1}` and a
recursion obtained by Fourier expansion along one matrix coordinate at a time, solved with the coefficients
`q^{k−j} − q^{k−j−1}`; from one position to the next, conjugation by a cyclic permutation matrix and two injections between
eigenspaces given by averaging. The route written here is not that proof's: for `i = 0` it decomposes `Ind_{H₀}^{P_n} ϕ₀`
with the mirabolic functors and the derivatives of `Γ_k` from (a), and it exchanges the positions by Mackey's
irreducibility criterion.

*Corollary of:* RepresentationTheory/CharacterTheory §9a.9 (`⟨Γ_n, Γ_n⟩ = q^n − q^{n−1}`, the number of generic irreducible
representations), for that clause of (a).

Let `G_n = GL_n(𝔽_q)`, `U_n = U(𝔽_q)`, `Γ_n` and `Γ_{(j,n−j)}` as in 2.6, and the mirabolic functors and derivatives as
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
`degenerateCharacter` for the characters `ψ_{(j,n−j)}` of 2.6.

*Route.* (a) Put `a_j = ⟨Γ_j, Γ_j⟩ = dim Hom_{U_j}(Γ_j, ψ)` (Frobenius reciprocity). By 2.4(b) and ReductiveGroups §7i.3 (b) with §7i.2, `Γ_n^{(j)}` is the space of
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
character `ρ ⊗ ψ`), which gives (b) for `i = 0` with ReductiveGroups §7i.3 (a). *Exchange `i − 1 → i`.* After the permutation of coordinates that
puts `i + k` in front of the block, the pair `(H_{i−1}, ϕ_{i−1})` becomes `A = {u ∈ U_n : u_{i,a} = 0, a ∈ W}` with the same formula
`ϕ` for the character as `(B, ϕ_B) = (H_i, ϕ_i)`. Both are characters (`(uu′)_{i,c} = u_{i,c} + u′_{i,c} + Σ_{a∈W}u_{i,a}u′_{a,c}`, and one
factor of each product vanishes), equal on `A ∩ B`. With `X = {1 + Σ_a x_aE_{i,a}} ⊂ B` and `Y = {1 + Σ_a y_aE_{a,c}} ⊂ A` one has
`U_n = Y·B`, and for `y ∈ Y ∖ {1}`, `x ∈ X`: `y⁻¹xy = x·(1 + (Σ_a x_ay_a)E_{i,c}) ∈ B` with `ϕ_B(x) = 1`, so
`ϕ_B(y⁻¹xy) = ψ₀(Σ_a x_ay_a)`, nontrivial for a suitable `x`. By Mackey's irreducibility criterion `Ind_B^{U_n}ϕ_B` is irreducible
of degree `q^k`; the double coset of `1` gives a nonzero map from `Ind_A^{U_n}ϕ_A`, of the same degree, which is therefore an
isomorphism; induce to `G_n`. (c) Every multiplicity `⟨π, Γ_{(j,n−j)}⟩` is non-negative, the coefficients in (b) of the
`Γ_{(j,n−j)}`, `1 ≤ j ≤ k`, are positive, and `⟨π, Γ_{(j,n−j)}⟩ = 0` for `1 ≤ j < n` when `π` is cuspidal (ReductiveGroups
§7i.3 (a) with adjunction, 1.1).

*Needs:* 2.2–2.4, 2.6; 1.0, 1.1; ReductiveGroups §§7i.2, 7i.3; InductionRestriction Layers 0, 2–4.

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

*Origin:* adapted from the Mackey formula for Harish-Chandra induction and from 2.7: exact multiplicities of the
Bessel-type characters in Harish-Chandra induced cuspidal representations, nearly constant over several fields; the
sharper form of (c) is this roadmap's own formulation.

*Method of the formal proof:* the degenerate Whittaker dimensions of `R_L^G σ` are computed by one Mackey count over the
double cosets of `P^F` and `U^F` in `G^F`, with Bruhat representatives: a coset contributes nothing when a root of the
character falls in the unipotent radical of `P` or when the cut separates two indices of one block (cuspidality), and the
remaining cosets, indexed by the sets of blocks of total size `j`, each contribute the Whittaker dimension `1` of the
cuspidal datum. The multiplicity `m(σ)` follows from 2.7 by induction on the position `i`, the bounds from `c_0 = 1`,
`c_j ≤ C(n, j)` and `(1 + 1/q)^n ≤ e^{n/q} ≤ 1 + 2n/q`, and the several-field form from the product of the local
multiplicities, written as averaged character sums. The route written here passes through the Harish-Chandra restrictions
to `GL_j × GL_{n−j}` and the generic constituent of an induced cuspidal representation, and bounds `Σ_j c_jq^{−j}` by
`∏_l(1 + q^{−d_l})`.

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
`⟨R_{L′}^{G′}σ′, Γ^{G′}⟩ = ⟨σ′, Γ^{L′}⟩ = ∏_l ⟨σ′_l, Γ_{d′_l}⟩ = 1` by ReductiveGroups §7i.3 (b) with §7i.2, and because cuspidal representations are generic
(2.4(b)) and Gelfand–Graev representations are multiplicity free (2.2). With 2.6(c) this gives `c_j`, and 2.7(b) gives `m(σ)`.
(b) `c_0 = 1` and `c_j ≥ 0` give the lower bound. For the upper, `q^{k−j} − q^{k−j−1} ≤ q^{k−j}` and
`Σ_{j≤k} c_jq^{−j} ≤ Σ_{I} q^{−Σ_{l∈I}d_l} = ∏_l(1 + q^{−d_l}) ≤ (1 + q^{−1})^n`; for `n ≤ q`,
`(1 + q^{−1})^n − 1 − n/q = Σ_{r≥2} C(n, r)q^{−r} ≤ (n(n−1)/q²)·Σ_{r≥2}1/r! ≤ (n − 1)/q`, using `C(n, r) ≤ n(n−1)n^{r−2}/r!`.
(c) The multiplicity of a product is the product of the multiplicities, so (b) at each `v` gives the product bounds. Then
`∏_v(1 − q_v^{−1}) ≥ 1 − Σ_v q_v^{−1} ≥ 1 − s/g`, and `1 + x^d ≤ (1 + x)^d` gives `∏_l(1 + q_v^{−d_{v,l}}) ≤ (1 + q_v^{−1})^n ≤ e^{n/g}`.
If `sn ≤ g`, then `1 − s/g ≥ 1 − δ` and `e^{sn/g} ≤ 1 + 2sn/g`, as `e^x ≤ 1 + 2x` for `0 ≤ x ≤ 1`.

*Needs:* 2.2, 2.4, 2.6, 2.7; 1.1; ReductiveGroups 7d and §§7i.2, 7i.3.

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

Layers 0 and 1; ReductiveGroups Layers 7, 7a, 7b, 7c, 7d, 7e, 7C, 9 and 9E, with Layers 7h (2.4) and 7i (2.2, 2.3, 2.6–2.8); InductionRestriction Layers 0, 2–5 (Mackey and Clifford theory); RepresentationTheory/CharacterTheory §3.5, §9a.2 (2.4) and §9a.9 (2.7).

## Layer 3: Lefschetz numbers of finite-order automorphisms

Throughout, `X` is a quasi-projective scheme over `k̄` (every variety of Layer 4 is one), `ℓ ≠ p`, and
`H^i_c(X) = H^i_c(X, ℚ̄_ℓ)` is the compactly supported cohomology of EtaleCohomologyFoundations §F.2.5,
rationalised (§F.4.5) and extended to `ℚ̄_ℓ`; it is finite dimensional and vanishes outside
`[0, 2 dim X]` (§F.3). A group acting on `X` by `k̄`-automorphisms acts on `H^i_c(X)` on the left by
`γ ↦ (γ⁻¹)^*`. Closed, open and locally closed subschemes, fixed-point schemes, finite products and the
quotients by finite groups (EtaleCohomologyFoundations §F.2.5a) are again quasi-projective. The statements used are made
for the individual groups `H^i_c(X)` as modules over the groups acting (EtaleCohomologyFoundations §§F.2.5, F.2.7 and
F.2.5a, cited in 3.2, and 3.4(a), (c)), for the complexes `RΓ_c(X, ℤ/ℓ^ν)` along a free action (EtaleCohomologyFoundations
§F.10.4a) and for Lefschetz numbers; Deligne–Lusztig theory (ReductiveGroups Layer 9F, cited in Layer 4) uses them and
nothing else from ℓ-adic cohomology. The module forms enter the disjointness of Lusztig series (ReductiveGroups §9F.8),
the triviality of the action of connected groups (3.4(a), used in 3.4(b); for linear groups it is used in
ReductiveGroups §9F.5 (c)) and the description of the cohomology of `Y_U` as an induced module (ReductiveGroups §9F.5
(a)).

### 3.1 Lefschetz numbers: integrality and independence of `ℓ`

*Origin:* published: Deligne and Lusztig (1976), Proposition 3.3, and Dudas and Michel (2015), Proposition 13.1 (iii) and
Corollary 13.2, the integrality and the independence of `ℓ` of the Lefschetz numbers of finite-order automorphisms, with
the twisted fixed-point counts.

*Method of the formal proof:* none; the statement is not in [FormalProof].

For an automorphism `g` of finite order, `L(g, X) = Σ_i (−1)^i tr(g | H^i_c(X))` is a rational integer,
independent of `ℓ` and of `ι`, and `L(g, X) = L(g⁻¹, X)`. If `X`, `g` are defined over `𝔽_{q'}` with
`q'`-Frobenius `F'` commuting with `g`, then for every `m ≥ 1` the set `X^{gF'^m}` is finite,
`|X^{gF'^m}| = Σ_i (−1)^i tr((gF'^m)^* | H^i_c(X))`, and `L(g, X) = −R(∞)` where
`R(t) = Σ_{m≥1} |X^{gF'^m}| t^m` is a rational function in `ℚ(t)`.

This is EtaleDualityAndPerverseSheaves §7.6 (*lefschetzIntegrality*, written there with `Lef(g, X)` and `R_g`); a rational
integer does not depend on `ι`.

*Needs:* EtaleDualityAndPerverseSheaves §7.6 (*lefschetzIntegrality*).

**Checks.**
- `X = 𝔾_m`, `g = 1`: `L = 1 − 1 = 0`, and `|𝔾_m(𝔽_{q^m})| = q^m − 1` gives `R(t) = qt/(1−qt) − t/(1−t)`,
  with `R(∞) = −1 + 1 = 0`.
- `X = 𝔾_m`, `g(x) = x⁻¹`: `g` acts on `H¹_c = ℚ̄_ℓ` by `−1` and on `H²_c` by `+1`, so `L = 2`, the number
  of fixed points `±1` in characteristic `≠ 2` (and `L = 2` also in characteristic 2, where `g` has the one
  fixed point `1`: the formula `L = |X^g|` is false in general).

### 3.2 Additivity, products, quotients and free actions

*Origin:* published: the Künneth formula in étale cohomology (The Stacks Project, Lemma 59.97.2), here for `X` proper
and smooth and `Y` proper over an algebraically closed field, with `ℚ_ℓ` coefficients. The remark (the sufficient
conditions for a filtered stratification and the isotypic form of additivity) is this roadmap's own formulation.

*Method of the formal proof:* the formal proof has the statement as a statement conditional on étale inputs that it
names. It proves it by a Leray–Hirsch argument with maps that are isomorphisms up to a fixed integer `N`: integral
classes on `X` give a basis of the cohomology at every level `ℓ^ν` up to `N`; the cohomology of `X` is unchanged by base
change to a strictly henselian algebra (proper base change, and specialisation along a valuation ring, where smoothness
of `X` is used); the cone of the Leray–Hirsch map over `Y` is contracted up to a power of `N`; the limit over `ν` and
inverting `ℓ` give the isomorphism.

*Corollary of:* EtaleCohomologyFoundations §F.2.7 (the Künneth formula with compact supports), with §F.4.5 (its form
with rational coefficients) and `H^*_c = H^*` for proper schemes.

Let `k` be an algebraically closed field, `ℓ` a prime invertible in `k`, `X` a proper smooth scheme and `Y` a proper
scheme over `k`. Then `⊕_a H^a(X, ℚ_ℓ(i)) ⊗ H^{n−a}(Y, ℚ_ℓ) ≅ H^n(X ×_k Y, ℚ_ℓ(i))` for every `n` and every `i`; no group
action is considered.

The general statements, for quasi-projective schemes over `k̄` with finite groups of automorphisms, are in other
roadmaps: (a) the equivariant localisation sequence `⋯ → H^i_c(V) → H^i_c(X) → H^i_c(Z) → H^{i+1}_c(V) → ⋯` for `Z ⊂ X`
closed with complement `V` is EtaleCohomologyFoundations §F.2.5, and the additivity of Lefschetz numbers, also along a
decomposition into finitely many locally closed `g`-stable pieces `Z_1, …, Z_m` with `Z_1 ∪ ⋯ ∪ Z_j` closed for every
`j`, is EtaleDualityAndPerverseSheaves §7.6 (*lefschetzDevissage* (a)); (b) the Künneth formula with compact supports,
`H^k_c(X × Y) ≅ ⊕_{i+j=k} H^i_c(X) ⊗ H^j_c(Y)` compatibly with automorphisms acting factorwise, is EtaleCohomologyFoundations
§F.2.7, and `L((g, h), X × Y) = L(g, X)·L(h, Y)` is *lefschetzDevissage* (b); (c) for a finite group `Γ` acting on `X`, the
quotient `X/Γ` and `H^i_c(X/Γ) ≅ H^i_c(X)^Γ` are EtaleCohomologyFoundations §F.2.5a, and
`L(g, X/Γ) = |Γ|⁻¹ Σ_{γ∈Γ} L(gγ, X)` is *lefschetzDevissage* (c); (d) for a free action of `Γ`, the perfectness of
`RΓ_c(X, ℤ/ℓ^ν)` over `(ℤ/ℓ^ν)[Γ]`, its derived reductions and the perfectness of the limit over `ℤ_ℓ[Γ]` are
EtaleCohomologyFoundations §F.10.4a, and `L(γ, X) = 0` for every `γ ∈ Γ` whose order is not a power of `p` is
*lefschetzDevissage* (d).

*Remark* (this roadmap's own formulation; not a statement of [FormalProof]). Call a decomposition of a quasi-projective
`X` into finitely many locally closed subschemes `Z_1, …, Z_m` a **filtered stratification** if `Z_1 ∪ ⋯ ∪ Z_j` is closed
for every `j`; this holds when the closure of each piece is a union of pieces (number the pieces so that a piece lying in
the closure of another comes before it), and for the preimage, under a morphism, of the decomposition of a variety into
the finitely many orbits of an algebraic group (numbered by increasing dimension; the boundary of an orbit is a union of
orbits of smaller dimension). If a finite group `Δ` acts on `X` preserving each piece of a filtered stratification, an
irreducible representation of `Δ` that occurs in no `H^i_c` of any piece occurs in no `H^i_c(X)`.

*Route.* The statement: the route of [FormalProof], given in the Method label above. The remark: for a filtered
stratification, `Z_m` is open in `X` with closed complement `Z_1 ∪ ⋯ ∪ Z_{m−1}`, itself filtered by the remaining pieces;
the isotypic projector of an irreducible representation of `Δ` is exact on `ℚ̄_ℓ[Δ]`-modules, so the long exact sequences
of the localisation triangles (EtaleCohomologyFoundations §F.2.5), by induction on `m`, carry the vanishing from the
pieces to `X`. The hypothesis cannot be dropped from the route: for two lines `L₁, L₂` meeting at a point `p`, with points
`q_i ∈ L_i ∖ {p}`, the pieces `(L₁ ∖ {p, q₁}) ∪ {q₂}`, `(L₂ ∖ {p, q₂}) ∪ {q₁}`, `{p}` are locally closed and none of them
is open.

*Needs:* EtaleCohomologyFoundations §§F.2.5 (for the remark), F.2.7 and F.4.5; for the general statements cited,
EtaleCohomologyFoundations §§F.2.5a, F.10.4a and EtaleDualityAndPerverseSheaves §7.6 (*lefschetzDevissage*).

**Checks.**
- (d) cannot drop the condition on the order: `Γ = ℤ/p` acting on `𝔸¹` over `𝔽̄_p` by `x ↦ x + 1` is free, and
  `L(γ, 𝔸¹) = 1` for every `γ` (`H²_c` is the only cohomology and `Γ` acts trivially on it).
- (c) with `X = 𝔾_m`, `Γ = μ₂` acting by `x ↦ −x` (`p ≠ 2`): `X/Γ ≅ 𝔾_m` and `L(1, X/Γ) = ½(L(1, X) + L(−1, X)) = 0`.

### 3.3 The Jordan decomposition formula

*Origin:* published: Deligne and Lusztig (1976), Theorem 3.2, and Dudas and Michel (2015), Proposition 13.10, the Jordan
decomposition formula for Lefschetz numbers.

*Method of the formal proof:* none; the statement is not in [FormalProof].

If `g = su` with `s` of order prime to `p` and `u` of `p`-power order, both powers of `g`, then
`L(g, X) = L(u, X^s)`.

This is EtaleDualityAndPerverseSheaves §7.6 (*lefschetzJordanFormula*, with `s = g_{p′}` and `u = g_p`).

*Needs:* EtaleDualityAndPerverseSheaves §7.6 (*lefschetzJordanFormula*).

### 3.4 Connected groups, tori and affine fibrations

*Origin:* published: Deligne and Lusztig (1976), Proposition 6.4 and §3, and Dudas and Michel (2015), Propositions
13.7–13.9, (a)–(c), (a) there for linear groups; (a) for a connected algebraic group that need not be linear, by the same
route, and (d) are this roadmap's own formulation.

*Method of the formal proof:* none; the statement is not in [FormalProof].

(a) A connected algebraic group acting on `X` acts trivially on every `H^i_c(X)`.
(b) If a torus `S` acts on `X` commuting with `g`, then `L(g, X) = L(g, X^S)`.
(c) If `f : X → Y` is equivariant for automorphisms `g` of `X` and `g'` of `Y`, and Zariski-locally on `Y`
the map `f` is a projection `Y' × 𝔸^d → Y'`, then `H^i_c(X) ≅ H^{i−2d}_c(Y)(−d)` compatibly with `g` and `g'`
(and with every group of such pairs), and `L(g, X) = L(g', Y)`.
(d) A diagonalisable group `D` acting on `X` has only finitely many distinct stabilisers `Stab_D(x)`,
`x ∈ X(k̄)`.

*Route.* (b), (c), and (a) for a connected linear algebraic group, are EtaleDualityAndPerverseSheaves §7.6
(*lefschetzGroupActions*), which cites the published proof of (b); (a) is proved here for every connected algebraic group,
and the route of (b) is written below. (a) Let `pr : H × X → H` be the projection and `φ(h, x) = (h, hx)`, an automorphism of `H × X` over `H`. By base
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
reduced subscheme (EtaleDualityAndPerverseSheaves §7.6, *lefschetzDevissage* (a), for the closed subscheme `Z_red ⊂ Z`,
whose complement is empty, gives `L(h, Z) = L(h, Z_red)`), `= L(g, X^S)` by 3.3 on `X^S`.

*Needs:* 3.3 (for (b)); EtaleDualityAndPerverseSheaves §7.6 (*lefschetzGroupActions*; *lefschetzDevissage* (a), for (b));
EtaleCohomologyFoundations §§F.2.4, F.4.5 (for (a)).

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

EtaleDualityAndPerverseSheaves §7.6 (3.1, 3.3, 3.4 and the Lefschetz numbers cited in 3.2); EtaleCohomologyFoundations §§F.2.4, F.2.5, F.2.5a, F.2.7, F.3, F.4.5 and F.10.4a.

## Layer 4: Deligne–Lusztig induction

### 4.1 Deligne–Lusztig varieties

*Origin:* published: Lang (1956), Steinberg, *Endomorphisms of linear algebraic groups* (1968), and Dudas and Michel (2015),
Theorem 7.3, the Lang map as a finite étale torsor; Deligne and Lusztig (1976), §1, and Dudas and Michel (2015), Definition 14.2, the Deligne–Lusztig varieties.

*Method of the formal proof:* none; the statement is not in [FormalProof].

(a) (The Lang torsor.) The Lang map `L : G → G`, `L(g) = g⁻¹F(g)`, is surjective, étale and finite, and it is a
`G^F`-torsor for left multiplication: `G^F`, the fixed-point subgroup scheme of `F`, is finite and étale (the constant group
on the finite group `G^F`), and `(γ, x) ↦ (γx, x)` is an isomorphism `G^F × G → G ×_{L,G,L} G`. Consequently, for every
locally closed subscheme `Y ⊂ G`, `L⁻¹(Y) → Y` is a `G^F`-torsor, and `L` identifies the quotient `G^F\L⁻¹(Y)` (EtaleCohomologyFoundations §F.2.5a) with `Y`.
For a torus and the `q`-Frobenius the torsor statement of (a) is FourierDeligneTransform §2.1, written additively
(`L = F − id`); (a) extends it to non-commutative `G` and to Steinberg endomorphisms.
(b) Let `T` be a rational maximal torus, `B = TU ⊃ T` a Borel subgroup (not necessarily rational), and `w` the
relative position of `B` and `F(B)`. The variety
`Y_U = {gU ∈ G/U : g⁻¹F(g) ∈ U·F(U)}` is smooth, quasi-projective and of pure dimension `ℓ(w)`; `G^F` acts
on it by left and `T^F` by right multiplication, and `Y_U → X_B = {gB : g⁻¹F(g) ∈ B·F(B)}` is a
`T^F`-torsor.

(a) is ReductiveGroups §7a.3 (the Lang map as a finite étale torsor), extended to Steinberg endomorphisms in ReductiveGroups
Layer 9E, where the differential of `F` at `1` is nilpotent; (b) is ReductiveGroups §9F.1, and the quotient `Y_U/T^F`
(EtaleCohomologyFoundations §F.2.5a) is `X_B` by descent along the torsor, as in (a).

*Needs:* 0.1, 0.2; EtaleCohomologyFoundations §F.2.5a; ReductiveGroups §7a.3 (Layer 9E for Steinberg endomorphisms) and §9F.1.

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
  `U ∩ F(U)` has dimension `2` and `x = uav` is not unique: the torus coordinate `τ` of ReductiveGroups §9F.1 is well defined,
  `τ((gb)⁻¹F(gb)) = τ(g⁻¹F(g))·t⁻¹F(t)` for every `b = tu ∈ B(K)`, the `K`-points of `Y_U` over each `K`-point of `X_B` are empty or
  one `T^F`-orbit, the `gtU` with `t⁻¹F(t) = τ(g⁻¹F(g))⁻¹`, and `|X_B(K)| = |K| + 1 − (q + 1)` for `SL₂`.

### 4.2 Deligne–Lusztig characters and Green functions

*Origin:* published: Deligne and Lusztig (1976), §§1 and 4, and Dudas and Michel (2015), Definitions 14.2 and 14.7 and
Proposition 14.8, the Deligne–Lusztig characters and the Green functions. The remark (the values in `ℤ[θ]`, the dependence
on `(T, θ)` only up to `G^F`-conjugacy and the product formula) is this roadmap's own formulation.

*Method of the formal proof:* none; the statement is not in [FormalProof].

For a character `θ` of `T^F`, the virtual character
`R_T^G(θ)(g) = |T^F|⁻¹ Σ_{t∈T^F} θ(t)⁻¹ L((g, t), Y_U)`, where `(g, t)` acts by `y ↦ g·y·t`, is a virtual
character of `G^F`; it is the alternating sum of the `θ`-isotypic parts of
`H^i_c(Y_U)` under `T^F`. It does not depend on `ℓ` or on `ι` (independence of `B ⊃ T` is ReductiveGroups §9F.4). The
**Green function** `Q_T^G(u) = R_T^G(1)(u)`, for unipotent `u`, is integer valued and `R_T^G(θ)(u) = Q_T^G(u)` for every `θ`;
`R_T^G(θ)(1)` does not depend on `θ`.

*Remark* (this roadmap's own formulation; not a statement of [FormalProof]). `R_T^G(θ)` has values in `ℤ[θ]` and depends
on `(T, θ)` only up to `G^F`-conjugacy. For a product, `R^{G₁×G₂}_{T₁×T₂}(θ₁ ⊠ θ₂) = R^{G₁}_{T₁}(θ₁) ⊠ R^{G₂}_{T₂}(θ₂)`.

*Route.* The virtual character, its independence of `ℓ` and `ι`, the Green function and `R_T^G(θ)(u) = Q_T^G(u)` are
ReductiveGroups §9F.2, and `R_T^G(θ)(1) = Q_T^G(1)`. For the remark: the values lie in `ℤ[θ]` because the Lefschetz
numbers are rational integers (3.1); products: for `B₁ × B₂ ⊃ T₁ × T₂` the variety `Y_{U₁×U₂}` is `Y_{U₁} × Y_{U₂}`, and
EtaleDualityAndPerverseSheaves §7.6 (*lefschetzDevissage* (b)) factors the Lefschetz numbers.

*Needs:* 4.1; 3.1; ReductiveGroups §9F.2; EtaleDualityAndPerverseSheaves §7.6 (*lefschetzDevissage* (b), for the remark);
CharacterTheory Layer 3 (virtual characters).

**Checks.**
- If `B` is rational, `Y_U = G^F/U^F` is finite, and `R_T^G(θ) = Ind_{B^F}^{G^F} θ` (inflated through
  `B^F → T^F`): `L((g,t), Y_U)` counts the `xU^F` with `x⁻¹gx ∈ t⁻¹U^F`, so the sum is the induced
  character. With `θ(t)` in place of `θ(t)⁻¹` the formula would give `Ind θ⁻¹`; this pins the convention.
- `G = T`: `Y_U = T^F` and `R_T^T(θ) = θ`.

### 4.3 The character formula

*Origin:* published: Deligne and Lusztig (1976), Theorem 4.2, and Carter (1985), Theorem 7.2.8, the character formula, for
the Frobenius of an `𝔽_q`-structure; for every Steinberg endomorphism, Digne and Michel (2020).

*Method of the formal proof:* none; the statement is not in [FormalProof].

For `g = su ∈ G^F`,
`R_T^G(θ)(su) = |C°(s)^F|⁻¹ Σ_{x ∈ G^F, x⁻¹sx ∈ T} θ(x⁻¹sx)·Q^{C°(s)}_{xTx⁻¹}(u)`, where
`C°(s) = C_G(s)°`. In particular, for regular semisimple `s` with `T' = C°(s)`,
`R_T^G(θ)(s) = Σ_{x ∈ T'^F\{x ∈ G^F : x⁻¹T'x = T}} θ(x⁻¹sx)`, which vanishes unless `T` and `T'` are
`G^F`-conjugate.

This is ReductiveGroups §9F.3 (the character formula).

*Needs:* 4.2; 0.3; ReductiveGroups §9F.3.

### 4.4 The inner product formula

*Origin:* published: Green (1955), Lemma 6.3, the inner products of his class functions of `GL_n(𝔽_q)` attached to the
characters of `𝔽_{q^n}^×`: the number of Frobenius conjugates of one character that equal the other; the class functions
themselves, by the same recursion, are his Lemma 3.2 with Theorems 2 and 5.

*Method of the formal proof:* `J_n(θ̃)` is defined as by Green, by Möbius inversion over the invariant subspaces of the
eigenvalue sum; it is primitive (4.5 (b)), a primitive class function is orthogonal to the functions induced from proper
parabolic subgroups and vanishes off the elements whose characteristic polynomial is a power of one irreducible
polynomial, and the total of `J_n(θ̃)` over the matrices with a given characteristic polynomial comes from a convolution
identity on monic polynomials, after which the orthogonality of the characters of `𝔽_{q^n}^×` gives the count. The route
written here is not that proof's: it is the deduction from the general theorem.

*Corollary of:* ReductiveGroups §9F.4 (the inner product formula for Deligne–Lusztig characters), through
RepresentationTheory/CharacterTheory §9a.8 (b) (`J_n(θ̃) = R_{T_{(n)}}^G(θ̃|_{𝔽_{q^n}^×})`).

**Green's class functions.** For a homomorphism `θ̃ : k̄^× → ℂ^×` let `b_{θ̃}^{(n)}(x) = Σ_α θ̃(α)`, the sum over the
eigenvalues `α ∈ k̄^×` of `x ∈ GL_n(𝔽_q)` counted with multiplicity. Green's class functions `J_n(θ̃)` on `GL_n(𝔽_q)`,
`n ≥ 1`, are those of RepresentationTheory/CharacterTheory §9a.8 (b), determined by the recursion
`b_{θ̃}^{(n)} = Σ_{a=1}^{n} R_{GL_a×GL_{n−a}}^{GL_n}(J_a(θ̃) ⊠ 1_{GL_{n−a}(𝔽_q)})` (the term `a = n` is `J_n(θ̃)`).
**The inner product.** For homomorphisms `θ̃`, `θ̃′` with restrictions `θ`, `θ′` to `𝔽_{q^n}^×`,
`⟨J_n(θ̃), J_n(θ̃′)⟩ = ⟨J_n(θ̃), b_{θ̃′}^{(n)}⟩ = #{j < n : θ^{q^j} = θ′}`.

The inner product formula for every pair of rational maximal tori of every `G^F` — with
`N_{G^F}(T, T′) = {n ∈ G^F : nTn⁻¹ = T′}` and `W_{G^F}(T, θ) = {n ∈ N_{G^F}(T) : θ(n⁻¹tn) = θ(t) for all t ∈ T^F}/T^F`,
`⟨R_T^G(θ), R_{T′}^G(θ′)⟩` is the number of `n ∈ N_{G^F}(T, T′)/T^F` with `θ′(ntn⁻¹) = θ(t)` for all `t ∈ T^F`, for any
choice of Borel subgroups `B ⊃ T`, `B′ ⊃ T′`; hence `R_T^G(θ)` does not depend on `B`, non-conjugate pairs give orthogonal
characters, and `⟨R_T^G(θ), R_T^G(θ)⟩ = |W_{G^F}(T, θ)|`, `θ` being in **general position** when `W_{G^F}(T, θ) = 1` — is
ReductiveGroups §9F.4.

*Route.* The case `G = GL_n`, `T = T′ = T_{(n)}` of ReductiveGroups §9F.4, in which `N_{G^F}(T_{(n)})/T_{(n)}^F ≅ ℤ/n`
acts by `x ↦ x^q` (5.1), with RepresentationTheory/CharacterTheory §9a.8 (b). The second equality: `J_n(θ̃)` is killed by
every proper Harish-Chandra restriction (4.5 (b)), and the terms `a < n` of the recursion for `b_{θ̃′}^{(n)}` are
Harish-Chandra induced.

*Needs:* 4.5 (b), 5.1; ReductiveGroups Layer 7c (adjunction) and §9F.4; RepresentationTheory/CharacterTheory §9a.8 (b).

**Checks.**
- The general statement for `G = SL₂` over `𝔽₂` and `T = T′` the non-split torus (`T^F ≅ μ₃`), with `Y_U = Y_{U′}` in the model
  `{v ∈ 𝔸² : det(v, Fv) = 1}`, `G^F = SL₂(𝔽₂)` acting linearly and `T^F` by scalars; here `U ∩ F(U) = 1`, so the pieces `Z_n` of
  the route of ReductiveGroups §9F.4 are those of `G^F\(Y_U × Y_U)`. The closed piece (`n ∈ T`) is `(G^F\Y_U) × μ₃ ≅ 𝔸¹ × μ₃`, of
  compactly supported Euler characteristic `3 = |G^F ∩ T|`. On the open piece, for `M = (v | w)` with `c = det M ≠ 0`,
  `M⁻¹F(M) = [[a, c⁻¹], [c⁻¹, b]]` with `ab = c − c⁻²`, and Lang's map identifies the piece with this surface; it has
  `4^k + (−2)^k + 1` points over `𝔽_{2^k}`, hence Euler characteristic `3 = |G^F ∩ nT|` (`n ∉ T`), while a fibration in affine
  spaces over a torus of positive dimension has Euler characteristic `0`. On the open piece `(ζ, ζ′) ∈ μ₃²` has Lefschetz number
  `3` if `ζζ′ = 1` and `0` otherwise, on the closed piece `3` if `ζ = ζ′` and `0` otherwise (the elements of `G^F ∩ nT` invert
  `T^F`), and the formula gives `⟨R_T(θ), R_T(θ′)⟩ = [θ′ = θ] + [θ′ = θ⁻¹]`, which is `2` for `θ = 1`.

### 4.5 Harish-Chandra compatibility

*Origin:* published: Springer and Zelevinsky (1984) and Zelevinsky (1981), the cuspidal class functions of `GL_n(𝔽_q)`
are primitive in the Hopf algebra of class functions, so all their proper Harish-Chandra restrictions vanish, and the
restriction of a product of cuspidal characters to a two-block Levi subgroup is the sum over sub-families.

*Method of the formal proof:* the vanishing is proved by induction on the dimension: summing the defining recursion over
the unipotent radical of the stabiliser of a subspace `A`, the invariant subspaces inside `A`, those meeting `A` trivially
and the others contribute the eigenvalue sum on `A`, that on `V/A`, and zero, which cancels the term of the whole space by
additivity of the eigenvalue sum; products of cuspidal characters are restricted by the two-block Mackey formula and
induction on the list; (d) comes from the total of `J_n(θ̃)` on each fibre of the characteristic polynomial (4.4). The
route written here is not that proof's: it is the deduction from the general theorems.

*Corollary of:* ReductiveGroups §9F.5 (b), (d) (the Mackey formula against a torus, whose index set is empty for
`T_{(n)}`, and the pairing with the functions of the semisimple part), through RepresentationTheory/CharacterTheory §9a.8
(b), for the clauses on `J_n(θ̃)`; ReductiveGroups Layer 7d (the Mackey formula for Harish-Chandra functors), for the
products of cuspidal characters.

(b) For every `θ̃` and `n ≥ 2`, `*R_L^G J_n(θ̃) = 0` for every proper rational Levi subgroup `L` of `GL_n`. Over a prime
field `𝔽_p`: for cuspidal characters `σ_i` of `GL_{d_i}(𝔽_p)`, `1 ≤ i ≤ r`, with `Σ_i d_i = a + b`,
`*R_{GL_a×GL_b}^{GL_{a+b}}(σ_1 × ⋯ × σ_r) = Σ_I (×_{i∈I} σ_i) ⊠ (×_{i∉I} σ_i)`, the sum over the subsets
`I ⊂ {1, …, r}` with `Σ_{i∈I} d_i = a`, the products taken in the order of the list.
(d) For every `θ̃`, `θ̃′`, with `θ = θ̃|_{𝔽_{q^n}^×}`:
`⟨b_{θ̃′}^{(n)}, J_n(θ̃)⟩ = (q^n − 1)⁻¹ Σ_{z∈𝔽_{q^n}^×} Σ_{j<n} θ̃′(z^{q^j})·conj(θ(z))` (the eigenvalues of
`z ∈ T_{(n)}^F ≅ 𝔽_{q^n}^×` are its conjugates). At `θ̃′ = 1` this gives `⟨J_n(θ̃), 1_{G^F}⟩ = 1` if `θ = 1` and `0`
otherwise.

The general statements, for every `G^F` and every rational maximal torus `T` — (a) `R_L^G ∘ R_T^L = R_T^G` for `T ⊂ L`, in
particular `R_T^G(θ) = Ind_{B^F}^{G^F} θ` when `T` lies in a rational Borel subgroup `B`; (b) the Mackey formula
`*R_L^G ∘ R_T^G = Σ_x R_{xTx⁻¹}^L ∘ ad(x)`, the sum over `x ∈ L^F\{x ∈ G^F : xTx⁻¹ ⊂ L}/T^F`; (c)
`⟨R_T^G(θ), 1_{G^F}⟩ = 1` if `θ = 1` and `0` otherwise; (d) `⟨f, R_T^G(θ)⟩ = |T^F|⁻¹ Σ_{t∈T^F} f(t)·conj(θ(t))` for a
class function `f` with `f(su) = f(s)` for every Jordan decomposition `g = su` — are ReductiveGroups §9F.5.

*Route.* (b) ReductiveGroups §9F.5 (b) for `T = T_{(n)}`, which lies in no proper rational Levi subgroup (5.1), with
RepresentationTheory/CharacterTheory §9a.8 (b); for the products, the Mackey formula (ReductiveGroups Layer 7d) and
cuspidality. (d) ReductiveGroups §9F.5 (d) for `f = b_{θ̃′}^{(n)}` and `T = T_{(n)}`.

*Needs:* 1.1, 4.4 (for (d)), 5.1; ReductiveGroups Layer 7d and §9F.5; RepresentationTheory/CharacterTheory §9a.8 (b).

**Checks.**
- For `GL₂` (ReductiveGroups §9F.5 (c), and (d) at `θ̃′ = 1` for the Coxeter torus): `⟨Ind_B 1, 1⟩ = 1`, `⟨1 − St, 1⟩ = 1`,
  and `⟨R_{T_s}(θ), 1⟩ = ⟨−σ_θ, 1⟩ = 0` for regular `θ`.
- (d): for `GL_n` and `f(x) = Σ_α θ̃(α)` over the eigenvalues (5.6(b)), with `T = T_{(n)}`: `⟨f, R_{T_{(n)}}(θ′)⟩` is the number
  of `j < n` with `θ̃|_{𝔽_{q^n}^×}^{q^j} = θ′` (checked by computation on `GL₂(𝔽_q)`, `q ≤ 7`, and `GL₃(𝔽_q)`, `q = 2, 3`). The
  hypothesis on `f` in the general statement (d) is needed: for `f = St_G` on `GL₂` (not constant along `su`: `St(1) = q`,
  `St(u) = 0` for `u ≠ 1` unipotent) and `T = T₁`, `⟨St, R_{T₁}(1)⟩ = 1` (4.6(c)), while
  `|T₁^F|⁻¹ Σ_t St(t) = (q−1)^{−2}((q−1)·q + (q−1)(q−2)) = 2` (4.6(b): `St = q` at the `q − 1` central elements, `1` at the others).
- The general statement (a) for `G = L = T = 𝔾_m` over `𝔽₃` (`P = G`, `U = U_P = 1`): `Y_U = T^F` has two points, the base
  `G^F/P^F` one and the fibre `Y_{U_L} = T^F` two; a fibration over `G^F/U_P^F = T^F` with fibre `Y_{U_L}` would have four points.
- The general statement (b) for `GL₂`, `L = T = T₁`: the index set is `T₁^F\N_{G^F}(T₁)/T₁^F = W`, of order `2`, and indeed
  `(Ind_{B^F} 1)^{U^F}` is two copies of the trivial character of `T₁^F`.

### 4.6 The Steinberg character and the two averages

*Origin:* published: Curtis (1966), Solomon (1966) and Deligne and Lusztig (1976), §7, the Steinberg character, its values
and its expansion in the characters `R_T^G(1)`; for every Steinberg endomorphism, Digne and Michel (2020).

*Method of the formal proof:* none; the statement is not in [FormalProof].

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

This is ReductiveGroups §9F.6 (the Steinberg character and the two averages).

*Needs:* 4.3; ReductiveGroups §§9F.4–9F.6.

**Checks.**
- `GL₂`: `St = Ind_{B^F} 1 − 1`, of degree `q`; `½(R_{T₁}(1) + R_{T_s}(1)) = 1` and `½(R_{T₁}(1) − R_{T_s}(1)) = St`.
- `U₃(𝔽_q)`: the two simple roots form one `F`-orbit, so the `F`-stable `J` are `∅` and `S`, `|∅/F| = 0`,
  `|S/F| = 1`, and `St = Ind_{B^F} 1 − 1`, of degree `q³ = |G^F|_p`. The sign `(−1)^{|J|}` would give
  `Ind_{B^F} 1 + 1`, of degree `q³ + 2`, which is not irreducible.
- (a) for `U₃(𝔽_q)`: `W = S₃`, `W^F = {1, w₀}`; the `F`-fixed double cosets give `⟨St, St⟩ = 2 − 1 − 1 + 1 = 1`, while all of
  `W_J\W/W_K` would give `6 − 1 − 1 + 1 = 5`. For split `G` the two counts agree: for `GL₃` (`S = {s₁, s₂}`) the sixteen
  terms give `(6 − 3 − 3 + 1) − (3 − 2 − 2 + 1) − (3 − 2 − 2 + 1) + (1 − 1 − 1 + 1) = 1`.
- (c) for split `A₁` (`GL₂`), with `N_J(w) = ⟨R_{T_w}^G(1), R_{L_J}^G(1)⟩`, the number of cosets `vW_J` with `v⁻¹wv ∈ W_J` (as in
  the route of ReductiveGroups §9F.6): at `w = 1`, `N_∅(1) = 2`, `N_S(1) = 1`, and `2 − 1 = 1 = ε_Gε_{T₁}`; at `w = s`:
  `0 − 1 = −1 = ε_Gε_{T_s}`. For `GL₃` the alternating counts are `6 − 3 − 3 + 1 = 1` at `w = 1`, `0 − 1 − 1 + 1 = −1` at a
  reflection and `0 − 0 − 0 + 1 = 1` at a `3`-cycle, the signs `(−1)^{ℓ(w)}`.
- (c) for three copies of `SL₂` cycled by `F` (`W = {±1}³`, `F(v) = (v₃, v₁, v₂)`, the `F`-stable `J` being `∅` and `S`), where
  `N_J(w) = ⟨R_{T_w}^G(1), R_{L_J}^G(1)⟩` is the number of cosets `vW_J` with `v⁻¹wF(v) ∈ W_J`: `N_∅(w)` is `2` if `det w = 1`
  and `0` otherwise, and `N_S(w) = 1`, so `N_∅(w) − N_S(w) = det(w)`, which is `ε_Gε_{T_w}`.
- (b) at semisimple elements of `GL₂`: at a split regular `s`, `C°(s) = T₁` and `St(s) = ε_Gε_{T₁}·1 = 1`, which is
  `(Ind_{B^F}1 − 1)(s) = 2 − 1`; at a regular elliptic element `ε_Gε_{T_s}·1 = −1`, matching CharacterTheory Layer 9.
  The two Borel subgroups through `T₁` both contain `s`, while `T₁` has a single parabolic subgroup: the
  `s`-fixed rational parabolic subgroups of `G` do not correspond to those of `C°(s)`.
- (b) for `GL₃` at `s = diag(a, a, b)`, `a ≠ b`: `C°(s) = GL₂ × GL₁`, `ε_Gε_{C°(s)} = 1` and `St(s) = q`; directly,
  `s` fixes `3(q+1)` complete flags, `q + 2` planes and `q + 2` lines, and `3(q+1) − 2(q+2) + 1 = q`. At
  `diag(J₂(a), b)` (`J₂` a Jordan block) the counts are `3, 2, 2` and `St = 0`.

### 4.7 Degree, sign and irreducibility

*Origin:* published: Green (1955), Lemma 5.3 and Theorem 12, the degree `∏_{i=1}^{n−1}(1 − q^i)` of his class function of
`GL_n(𝔽_q)` and, for a regular character, the irreducibility of `(−1)^{n−1}J_n(θ̃)`; Zelevinsky (1981), the irreducibility
of Harish-Chandra products of distinct cuspidal characters.

*Method of the formal proof:* as in Green (1955), the degree comes from the defining recursion at the identity and a
`q`-binomial identity, and `J_n(θ̃)` is a virtual character by Brauer's characterisation for the eigenvalue power sum and
induction on `n` for the induced terms of the recursion; its norm is that of 4.4, and the sign of the degree fixes the
sign. Over prime fields a Harish-Chandra product of distinct cuspidal characters has norm one by induction on the number
of factors. The route written here is not that proof's: it is the deduction from the general theorems.

*Corollary of:* ReductiveGroups §9F.7 (degree, sign and irreducibility of Deligne–Lusztig characters), through
RepresentationTheory/CharacterTheory §9a.8 (b), for (a) and (b); RepresentationTheory/CharacterTheory §9a.5 (the
endomorphism algebra of a Harish-Chandra induced cuspidal representation), for the irreducibility in (c).

(a) `J_n(θ̃)(1) = ∏_{i=1}^{n−1}(1 − q^i)` for every `θ̃`.
(b) If `θ = θ̃|_{𝔽_{q^n}^×}` is regular, `(−1)^{n−1}J_n(θ̃)` is an irreducible character.
(c) Over a prime field `𝔽_p`: a Harish-Chandra product `σ_1 × ⋯ × σ_r` of pairwise distinct cuspidal characters is an
irreducible character, and for cuspidal characters `σ_i` of `GL_{d_i}(𝔽_p)` with `Σ_i d_i = n`,
`(σ_1 × ⋯ × σ_r)(1) = ψ_n(p)·∏_i σ_i(1)/ψ_{d_i}(p)`.

The general statement, for every rational maximal torus of every `G^F` — `R_T^G(θ)(1) = ε_G ε_T |G^F|_{p'}/|T^F|`, and
`ε_G ε_T R_T^G(θ)` irreducible for `θ` in general position — is ReductiveGroups §9F.7.

*Route.* (a), (b): ReductiveGroups §9F.7 for `T = T_{(n)}`, where `ε_Gε_{T_{(n)}} = (−1)^{n−1}` and
`|G^F|_{p′}/|T_{(n)}^F| = ψ_{n−1}(q)` (5.1), with RepresentationTheory/CharacterTheory §9a.8 (b). (c): the group
`∏_i S_{m_i}` of §9a.5 is trivial; the degree is the index of the parabolic subgroup times the degrees.

*Needs:* 4.4, 5.1; ReductiveGroups §9F.7; RepresentationTheory/CharacterTheory §§9a.5, 9a.8 (b).

**Checks.**
- `GL₂`: `R_{T₁}^G(1) = 1 + St`, `R_{T_s}^G(1) = 1 − St`, of degree `−(q−1) = ε_Gε_{T_s}(q²−1)(q−1)/(q²−1)`.
- The general degree formula at `T` in a rational Borel subgroup `B`: `ε_Gε_T = 1` and `|G^F|_{p'}/|T^F| = [G^F : B^F]`, the degree
  of `Ind_{B^F}^{G^F}θ` (4.5, general statement (a)).

### 4.8 Geometric conjugacy, Lusztig series and exhaustion

*Origin:* published: Springer (1970), S. I. Gelfand (1970) and Zelevinsky (1981), Harish-Chandra's theory of cuspidal
support for `GL_n(𝔽_p)`: exhaustion by products of cuspidal characters and disjointness of the series; Green (1955), a
cuspidal character determines its Frobenius orbit.

*Method of the formal proof:* every irreducible character is a constituent of a Harish-Chandra product of cuspidal characters, by induction on `n`
through restriction to two-block Levi subgroups and Frobenius reciprocity, as in S. I. Gelfand (1970), Theorem 2.4; two
such products whose lists are not permutations of each other are orthogonal, by computing their inner product by induction
on the length of one list, the argument of Grinberg and Reiner, Lemma 3.2.4, after Springer (1970), Theorem 4.7; and the
polynomial of a cuspidal character of `GL_d` is recovered from its values at elliptic elements, by a bound on the support of a
combination of at most `2d` characters of a cyclic group when `p ≥ 5`, and over every finite field from the power sums of
exponents `1, …, d`. [FormalProof] states the label clause over prime fields `𝔽_p` with `p ≥ 5`. The route written here is
not that proof's: it is the deduction from the general theorem.

*Corollary of:* ReductiveGroups §7h.2 (cuspidal support and Harish-Chandra series), for exhaustion and orthogonality;
RepresentationTheory/CharacterTheory §9a.4 (the orbit criterion) with §9a.7 (every cuspidal character is some `σ_θ`), for
the label.

For `G = GL_n` over a prime field `𝔽_p`: every irreducible character of `GL_n(𝔽_p)` is a constituent of a Harish-Chandra
product `σ_1 × ⋯ × σ_r` of cuspidal characters, and two such products whose lists are not permutations of each other are
orthogonal (both stated in 1.2); a product of pairwise distinct cuspidal characters has norm one (4.7 (c)). So the
Harish-Chandra series of the products of cuspidal characters partition the irreducible characters of `GL_n(𝔽_p)`. Over
every finite field `𝔽_q`, every irreducible character of `GL_n(𝔽_q)` has exactly one label (5.7).

The general statement, for every `G^F` — pairs `(T, θ)`, `(T′, θ′)` are **geometrically conjugate** if some `g ∈ G` with
`gTg⁻¹ = T′` satisfies `θ′∘N_{F^m/F}∘ad(g) = θ∘N_{F^m/F}` on `T^{F^m}` for some `m` with `g ∈ G^{F^m}`, `N_{F^m/F}` the norm
`t ↦ t·F(t)⋯F^{m−1}(t)`; if `R_T^G(θ)` and `R_{T′}^G(θ′)` have a common constituent the pairs are geometrically conjugate;
every irreducible character of `G^F` is a constituent of some `R_T^G(θ)`;
`reg_{G^F} = |G^F|_{p'}|W|⁻¹Σ_{w∈W} ε_Gε_{T_w}|T_w^F|⁻¹ Σ_θ R_{T_w}^G(θ)`; and the **Lusztig series** `E(G^F, κ)`, the
constituents of the `R_T^G(θ)` with `(T, θ)` in the geometric class `κ`, partition the irreducible characters — is
ReductiveGroups §9F.8.

*Route.* The case `G = GL_n` of ReductiveGroups §7h.2: a rational Levi subgroup is conjugate to a block diagonal one, and
two cuspidal pairs are conjugate exactly when their lists are permutations of each other. The label: the list is unique up
to permutation, and each cuspidal character in it is a `σ_θ` with the Frobenius orbit of `θ` unique
(RepresentationTheory/CharacterTheory §§9a.7, 9a.4).

*Needs:* 1.2, 4.7 (c), 5.7; ReductiveGroups §7h.2; RepresentationTheory/CharacterTheory §§9a.4, 9a.7.

### 4.9 Cuspidality

*Origin:* published: Springer and Zelevinsky (1984), the class functions of `GL_n(𝔽_q)` attached to the characters of
`𝔽_{q^n}^×` are primitive, that is, cuspidal; for regular characters also S. I. Gelfand (1970), Theorem 6.1.

*Method of the formal proof:* the vanishing is 4.5 (b), by the induction on the dimension described there, the invariant
subspaces being sorted by their position relative to the subspace fixed by the parabolic subgroup; for regular `θ`,
`(−1)^{n−1}J_n(θ̃)` is then an irreducible cuspidal character (4.7). The route written here is not that proof's: it is the
deduction from the general theorem.

*Corollary of:* ReductiveGroups §9F.9 (cuspidality of `R_T^G(θ)` for a torus in no proper rational Levi subgroup), through
RepresentationTheory/CharacterTheory §9a.8 (b).

For every `θ̃` and every proper rational Levi subgroup `L` of `GL_n`, `*R_L^G J_n(θ̃) = 0` (4.5 (b)); hence, for
`θ = θ̃|_{𝔽_{q^n}^×}` regular, `(−1)^{n−1}J_n(θ̃)` is an irreducible cuspidal character of `GL_n(𝔽_q)`.

The general statement — if `T` lies in no proper rational Levi subgroup, then `*R_L^G R_T^G(θ) = 0` for every proper
rational `L`, and for `θ` in general position `ε_G ε_T R_T^G(θ)` is irreducible and cuspidal — is ReductiveGroups §9F.9.

*Route.* ReductiveGroups §9F.9 for `T = T_{(n)}` (5.1), with RepresentationTheory/CharacterTheory §9a.8 (b).

*Needs:* 4.5 (b), 4.7, 5.1; 1.1; ReductiveGroups §9F.9; RepresentationTheory/CharacterTheory §9a.8 (b).

### 4.10 Green functions at regular unipotent elements

*Origin:* published: Green (1955), §5, Example (ii), with Lemma 5.3, the values of his class function of `GL_n(𝔽_q)` at
the elements whose characteristic polynomial is a power of one irreducible polynomial, in particular the value `1` at a
regular unipotent element. The remark is this roadmap's own formulation.

*Method of the formal proof:* as in Green (1955), for `g` with characteristic polynomial `f^m` the invariant subspaces are
grouped by the span of their image in `V/f(g)V`, a vector space over `𝔽_q[X]/(f)`; the partial sums are affine in the
dimension, and Möbius inversion on the lattice of its subspaces with a `q`-binomial identity gives the product. The route
written here is not that proof's: it is the deduction from the general theorems.

*Corollary of:* ReductiveGroups §9F.10 (Green functions take the value `1` at regular unipotent elements), through
RepresentationTheory/CharacterTheory §9a.8 (b), for the value at a regular unipotent element; ReductiveGroups §9F.3 (the
character formula) with RepresentationTheory/CharacterTheory §9a.8 (a) (`Q_{T_{(n)}}^G(u_μ) = ∏_{i=1}^{ℓ(μ)−1}(1 − q^i)`)
and (b), for the other values.

Let `g ∈ GL_n(𝔽_q)` have characteristic polynomial `f^m` with `f` irreducible of degree `d`, let `z ∈ k̄^×` be a root of
`f`, and `t` the number of Jordan blocks of the unipotent part of `g` in the centraliser `≅ GL_m(𝔽_{q^d})` of its
semisimple part. Then, for every `θ̃`, `J_n(θ̃)(g) = (Σ_{j<d} θ̃(z^{q^j}))·∏_{i=1}^{t−1}(1 − q^{di})`; and `J_n(θ̃)(g) = 0`
when the characteristic polynomial of `g` is not a power of one irreducible polynomial. In particular
`J_n(θ̃)(u) = ∏_{i=1}^{t−1}(1 − q^i)` at a unipotent `u` with `t` Jordan blocks, which is `1` at a regular unipotent
element.

The general statement — for `F` the `q`-Frobenius of an `𝔽_q`-structure, `Q_T^G(u) = 1` for every rational maximal torus
`T` and every regular unipotent `u ∈ G^F` (0.5) — is ReductiveGroups §9F.10.

*Remark* (this roadmap's own formulation; not a statement of [FormalProof]). For a Steinberg endomorphism `F` that is not
the `q`-Frobenius of an `𝔽_q`-structure, the statement `Q_T^G(u) = 1` for every rational maximal torus `T` and every
regular unipotent `u ∈ G^F` is not covered by ReductiveGroups §9F.10, and no route is given for it here.

*Route.* ReductiveGroups §9F.3 for `T = T_{(n)}`: no conjugate of `s` lies in `T_{(n)}` unless the characteristic
polynomial of `s` is `f^m`, and then the Green function of `T_{(n)}` in `C(s)` is that of the Coxeter torus of
`GL_m(𝔽_{q^d})`, RepresentationTheory/CharacterTheory §9a.8 (a) over `𝔽_{q^d}` (the argument of §9a.4).

*Needs:* 0.5; 4.4; ReductiveGroups §§9F.3, 9F.10; RepresentationTheory/CharacterTheory §§9a.4, 9a.8.

**Checks.**
- `GL₂`: `Q_{T₁}(u) = (Ind_B 1)(u) = 1` (one fixed point on `ℙ¹(𝔽_q)`) and `Q_{T_s}(u) = (1 − St)(u) = 1`.

### 4.11 Gelfand–Graev characters and Lusztig series

*Origin:* published: Deligne and Lusztig (1976), §10, Theorem 10.7, one constituent of the Gelfand–Graev character in
every series; here for `GL_n(𝔽_p)`, in Harish-Chandra's form. The first remark is published, as its heading says; the
second is this roadmap's own formulation.

*Method of the formal proof:* the pairing with `Γ_ψ` is the Whittaker dimension; it is multiplicative under
Harish-Chandra induction, by a Mackey computation over the double cosets `U^F\G^F/P^F` with shuffle representatives, and a
cuspidal character of degree `∏_{i<d}(p^i − 1)` has Whittaker dimension one, since only its top derivative is nonzero. The
route written here is not that proof's: it is the deduction from the general theorems.

*Corollary of:* ReductiveGroups §7i.3 (b) (the Harish-Chandra restriction of a Gelfand–Graev representation is a
Gelfand–Graev representation), for (b); RepresentationTheory/CharacterTheory §9a.2 (b) (a cuspidal representation is
generic) for (c), and §9a.9 (`⟨Γ_n, Γ_n⟩ = q^n − q^{n−1}`, one generic character for every label) for (a) and (d).

For `G = GL_n` over a prime field `𝔽_p`, with `Γ_ψ` the Gelfand–Graev character of `GL_n(𝔽_p)` and `Γ_ψ^{(d)}` that of
`GL_d(𝔽_p)`:
(a) `⟨Γ_ψ, Γ_ψ⟩ = p^n − p^{n−1}`;
(b) for cuspidal characters `σ_i` of `GL_{d_i}(𝔽_p)` with `Σ_i d_i = n`,
`⟨σ_1 × ⋯ × σ_r, Γ_ψ⟩ = ∏_i ⟨σ_i, Γ_ψ^{(d_i)}⟩`;
(c) a cuspidal character `σ` of `GL_d(𝔽_p)` of degree `ψ_{d−1}(p)` has `⟨σ, Γ_ψ^{(d)}⟩ = 1`;
(d) every Harish-Chandra product of cuspidal characters has a generic irreducible constituent.

The general statement — for `F` the `q`-Frobenius of an `𝔽_q`-structure and `Z(G)` connected, `⟨Γ_ψ, R_T^G(θ)⟩ = ε_G ε_T`
for every rational maximal torus `T` and every `θ`, and every Lusztig series contains exactly one constituent of `Γ_ψ`,
which occurs in `Γ_ψ` once — is ReductiveGroups §9F.11.

*Remark* (published: Digne and Michel (2020), Chapter 12, for groups whose centre is not connected; not a statement of
[FormalProof]). For `F` the `q`-Frobenius of an `𝔽_q`-structure, `⟨Γ_ψ, R_T^G(θ)⟩ = ε_G ε_T` for every regular character
`ψ`, every rational maximal torus `T` and every `θ` also when `Z(G)` is not connected.

*Remark* (this roadmap's own formulation; not a statement of [FormalProof]). For a Steinberg endomorphism `F` that is not
the `q`-Frobenius of an `𝔽_q`-structure, the two statements of ReductiveGroups §9F.11 are not covered by that section,
and no route is given for them here: the route of the first remark rests on the value of Green functions at regular
unipotent elements, for which 4.10 gives no route in that case.

*Route.* (b): adjunction and ReductiveGroups §7i.3 (b) for `L = ∏_i GL_{d_i}`. (c): RepresentationTheory/CharacterTheory
§9a.2 (b) with multiplicity one (2.2). (a), (d): §9a.9. The first remark: induction on the semisimple rank. For an
`F`-stable `J ⊂ S` let `ψ_J` be the character of ReductiveGroups §7i.3, so that
`Ind_{U₀^F}^{G^F}ψ_J = Γ_{ψ,J} = R_{L_J}^G(Γ^{L_J})` by §7i.3 (a). Since `Σ_J (−1)^{|J/F|}ψ_J = ∏_O(1 − ψ_O)` vanishes on
the non-regular elements of `U₀^F` (those with a trivial component in some `U_O^F`), the class function
`Δ = Σ_J (−1)^{|J/F|}Ind ψ_J` is supported on regular unipotent elements, where `R_T^G(θ) = 1` (ReductiveGroups §9F.10);
hence `⟨Δ, R_T^G(θ)⟩ = ⟨Δ, 1⟩ = 1` (only `J = ∅` pairs with `1`). For `J ≠ S`, adjunction, the Mackey formula
(ReductiveGroups §9F.5 (b)), the induction hypothesis on `L_J` and `ε_{L_J} = ε_G` give
`⟨R_{L_J}^G Γ^{L_J}, R_T^G(θ)⟩ = ε_Gε_T·N_J(T)` with `N_J(T) = ⟨R_T^G(1), R_{L_J}^G(1)⟩`; with
`Σ_J(−1)^{|J/F|}N_J(T) = ε_Gε_T` (4.6(c)) this leaves `⟨Γ_ψ, R_T^G(θ)⟩ = ε_Gε_T`. The centre is not used (Checks).

*Needs:* 2.2; 4.6; ReductiveGroups §§7i.2, 7i.3, 9F.5, 9F.10; RepresentationTheory/CharacterTheory §§9a.2, 9a.9.

**Checks.**
- `GL₂`: `⟨Γ_ψ, Ind_{B^F}(α ⊗ β)⟩ = 1` for all `α, β` (the irreducible principal series, or the twisted
  Steinberg constituent when `α = β`), and `⟨Γ_ψ, R_{T_s}(θ)⟩ = −1` for every `θ` (`R_{T_s}(θ) = −σ_θ` for
  regular `θ`, and `α∘det − α·St` for `θ = α∘N`).
- (First remark) `SL₂(𝔽_q)`, `q` odd: each of the two Gelfand–Graev representations pairs to `1` with `Ind_B 1 = 1 + St` (it
  contains `St`, not `1`), although the centre is not connected.

### Examples

For `GL₂`, `R_{T₁}^G(1) = 1 + St` and `R_{T_s}^G(1) = 1 − St`, of degree `−(q−1)` (ReductiveGroups §9F.7; for `T_s`, 4.7), so that `½(R_{T₁}(1) + R_{T_s}(1)) = 1` and `½(R_{T₁}(1) − R_{T_s}(1)) = St` (4.6); at a regular unipotent `u`, `Q_{T₁}(u) = Q_{T_s}(u) = 1` (ReductiveGroups §9F.10; for `T_s`, 4.10), and `⟨Γ_ψ, R_{T_s}(θ)⟩ = −1` for every `θ` (ReductiveGroups §9F.11). For `SL₂` over `𝔽₂` and its non-split torus, `⟨R_T(θ), R_T(θ')⟩ = [θ' = θ] + [θ' = θ⁻¹]` (ReductiveGroups §9F.4). For `U₃(𝔽_q)` the Steinberg character is `Ind_{B^F} 1 − 1`, of degree `q³` (4.6). The Lang map of `𝔾_a` for the `q`-Frobenius is the Artin–Schreier `𝔽_q`-torsor `x ↦ x^q − x`, and that of `𝔾_m` the Kummer `μ_{q−1}`-torsor `t ↦ t^{q−1}` (4.1).

### Dependencies

Layers 0–3, with 5.1 and 5.7. From Layer 5, 4.4, 4.5, 4.7 and 4.9 use the wider form of 5.1 (the Coxeter torus
`T_{(n)}`, its normaliser and the absence of a proper rational Levi subgroup containing it), whose route uses nothing of
Layer 4, and 4.8 uses the definition of a label (5.7), which rests through 5.2 on 4.2–4.4, 4.7 and 4.9 and not on 4.8; so
item by item the dependencies between the two layers are acyclic. ReductiveGroups Layers 7, 7a, 7b, 7c, 7d, 7C and 9E, with §7a.3 (4.1), §§7h.2, 7i.2, 7i.3 (4.8, 4.11) and Layer 9F (4.1–4.11); RepresentationTheory/CharacterTheory Layer 3 and §§9a.2, 9a.4, 9a.5, 9a.7–9a.9 (4.4, 4.5, 4.7–4.11); EtaleCohomologyFoundations §F.2.5a and EtaleDualityAndPerverseSheaves §7.6 (4.1, 4.2).

## Layer 5: Green's theory of `GL_n(𝔽_q)`

`G = GL_n` with the standard Frobenius from here on.

### 5.1 Tori of `GL_n`, characters of finite fields and labels

*Origin:* published: Rosen (2002), Proposition 2.1, the bound (a), over prime fields also Bary-Soroker, Koukoulopoulos and
Kozma (2023), Proposition 8.1; (b) and (c) are particular to this proof. The wider form is published, as its heading says.

*Method of the formal proof:* `d·N_q(d) ≤ q^d` because the monic irreducible polynomials of degree `d` are coprime
divisors of `X^{q^d} − X`; a character of `𝔽_{q^n}^×` fixed by a proper power of Frobenius has exponent divisible by
`(q^n − 1)/(q^{n/r} − 1)` for a prime `r ∣ n`, which bounds the nontrivial characters that are not regular by
`Σ_{r∣n}(q^{n/r} − 2)`; and over `𝔽_p` a polynomial goes to the character matched with one of its roots.

*Corollary of:* CharacterSumsOverFiniteFields §3.1a (the bound `Π_q(n) ≤ q^n/n`), for (a).

(a) For every finite field `𝔽_q` and `d ≥ 1`, `d·N_q(d) ≤ q^d`, with `N_q(d)` the number of monic irreducible
polynomials of degree `d` over `𝔽_q`.
(b) For `n ≥ 1`, the number of nontrivial characters of `𝔽_{q^n}^×` that are not regular is at most
`Σ_{r∣n}(q^{n/r} − 2)`, the sum over the primes `r` dividing `n`.
(c) Over a prime field `𝔽_p` and for `d ≥ 1`: there is a map from the monic irreducible polynomials of degree `d` with
nonzero constant term to the regular characters of `𝔽_{p^d}^×` under which two polynomials with Frobenius conjugate
images are equal; so `N*_p(d)` is at most the number of Frobenius orbits of degree `d`.

Gauss's formula `n·Π_q(n) = Σ_{d∣n} μ(n/d)q^d` for the number `Π_q(n)` of monic irreducible polynomials of degree `n` over
`𝔽_q`, with the bounds `(q^n − 2q^{n/2})/n ≤ Π_q(n) ≤ q^n/n`, is CharacterSumsOverFiniteFields §3.1a; for `n ≥ 2`,
`Π_q(n) = N*_q(n)`.

**Wider form** (published: Carter (1985) and Deligne and Lusztig (1976), the rational maximal tori of `GL_n`; Green (1955),
Lusztig and Srinivasan (1977) and Macdonald (1995), Ch. IV, the pairs attached to a label and their geometric conjugacy;
Rosen (2002), Proposition 2.1, the number of Frobenius orbits of degree `n`; not a statement of [FormalProof]).
The rational maximal tori of `GL_n` up to `GL_n(𝔽_q)`-conjugacy correspond to partitions `τ ⊢ n` (the cycle
type of `w ∈ S_n`), with `T_τ^F ≅ ∏_i 𝔽_{q^{τ_i}}^×`, `ε_G ε_{T_τ} = (−1)^{n − ℓ(τ)}` and
`|N_{G^F}(T_τ)/T_τ^F| = z_τ`. The **Coxeter torus** `T_{(n)}` has `T_{(n)}^F ≅ 𝔽_{q^n}^×`, realised by the
multiplication operators of `𝔽_{q^n}` in an `𝔽_q`-basis, and `N_{G^F}(T_{(n)})/T_{(n)}^F ≅ ℤ/n` acting by
`x ↦ x^q`; it is the only rational maximal torus contained in no proper rational Levi subgroup. In `L_n`, the
number of regular characters is `Σ_{d∣n} μ(n/d)(q^d − 1)`, and the number of Frobenius orbits of degree `n`
is `N*_q(n) = n⁻¹ Σ_{d∣n} μ(n/d)(q^d − 1)`, the number of monic irreducible polynomials of degree `n` over
`𝔽_q` with nonzero constant term.
**Pairs attached to a label.** For a label `m` of degree `n` (Conventions), a choice of `θ_O ∈ O` for each
orbit, and a tuple `ρ = (ρ_O)` of partitions `ρ_O ⊢ m(O)`, let `T_{m,ρ}` be the rational maximal torus with
`T_{m,ρ}^F ≅ ∏_O ∏_i 𝔽_{q^{|O|ρ_{O,i}}}^×` and `θ_{m,ρ} = ⊠_O ⊠_i θ_O ∘ N_{𝔽_{q^{|O|ρ_{O,i}}}/𝔽_{q^{|O|}}}`. Every
pair `(T, θ)` is `G^F`-conjugate to some `(T_{m,ρ}, θ_{m,ρ})` with `m` and `ρ` unique; two pairs are geometrically
conjugate (ReductiveGroups §9F.8) exactly when their labels agree; and `|W_{G^F}(T_{m,ρ}, θ_{m,ρ})| = ∏_O z_{ρ_O}`.

*Route.* (a)–(c): the route of [FormalProof], given in the Method label above. The wider form: 0.2 with `W = S_n` and
trivial Frobenius action; `T_w^F` from the cycle decomposition of `w`. Counting: Möbius inversion of
`Σ_{d∣n} |{θ ∈ L_n of degree d}| = q^n − 1`. Pairs: the correspondence with `(m, ρ)` is the one of the count of classes
of pairs in RepresentationTheory/CharacterTheory §9a.1. Geometric conjugacy: over `𝔽_{q^k}`, `k`
divisible by every degree `|O|ρ_{O,i}` of a factor `𝔽_{q^{|O|ρ_{O,i}}}^×` of either torus, both tori split and
`θ∘N_{F^k/F}` becomes `n` characters of `𝔽_{q^k}^×`, each
orbit `O` contributing its `|O|` conjugates with multiplicity `m(O)`; `S_n` permutes these, so geometric
conjugacy is equality of these multisets. The stabiliser: `N/T^F ≅ ∏_k (ℤ/(|O|k) ≀ S_{a_k})` on the factors of
size `|O|k`, and a rotation by `j` fixes `θ_O∘N` iff `|O| ∣ j` because `θ_O` is regular of degree `|O|`, so the
stabiliser is `∏_k (ℤ/k ≀ S_{a_k})`, of order `z_{ρ_O}`; distinct orbits give distinct characters.

*Needs:* 0.2; CharacterSumsOverFiniteFields §3.1a; ReductiveGroups §9F.8 (geometric conjugacy);
RepresentationTheory/CharacterTheory §9a.1 (the classes of pairs); Mathlib `GaloisField`, `ArithmeticFunction.moebius`.

**Checks.**
- `n = 2`: `q² − q` regular characters of `𝔽_{q²}^×` in `½q(q−1)` orbits, the cuspidal count of
  CharacterTheory Layer 9.
- `n = 1`: every character of `𝔽_q^×` is regular, and `N*_q(1) = q − 1`, not `q`: the polynomial `X` is excluded.
- Two labels with the same tori and different characters: for `θ ≠ θ'` in `L₁`, the label `2·{θ} + {θ'}` with
  `ρ = ((2), (1))` and the label `{θ} + 2·{θ'}` with `ρ = ((1), (2))` give tori of the same type `(2, 1)` in `GL₃`
  and non-conjugate pairs.

### 5.2 Green's cuspidal characters

*Origin:* published: Green (1955), the cuspidal characters of `GL_n(𝔽_q)`, their degree and their values, with the orbit
criterion in his Lemma 6.3; Deligne and Lusztig (1976), their form through `R_T^G(θ)`. The separation by the values at
regular elliptic elements is this roadmap's own formulation.

*Method of the formal proof:* the formal proof has, over every finite field and in the form of Green's class function, the
degree, cuspidality, the orbit criterion and the values (4.4, 4.7, 4.9, 4.10), and the parametrisation of the cuspidal
characters of `GL_d` by the monic irreducible polynomials of degree `d` other than `X` (existence, uniqueness of the
label, the dimension `∏_{i=1}^{d−1}(q^i − 1)`, and that two cuspidal characters with the same label are isomorphic), as
`ReciprocityTheory.Ty.Fin.GreenAll.cuspParam_all`; and over a prime field the statement of `σ_θ` with its degree,
cuspidality, the orbit criterion and its values at the elements with irreducible characteristic polynomial. The class
function `x ↦ Σ θ(α)^k` over the eigenvalues `α` of `x` is a virtual character by Brauer's induction theorem; Green's class
function is obtained from it by Möbius inversion over the invariant subspaces of `x`, the subtracted terms being
Harish-Chandra induced; its norm is computed by counting endomorphisms with a given characteristic polynomial (4.4), and
for regular `θ` it is one, which gives an irreducible cuspidal character up to the sign `(−1)^{n−1}`. This is the route of
Green (1955), with the cuspidal part extracted by an explicit inversion. The route written here is not that proof's: it
derives every clause from Layer 4.

*Corollary of:* RepresentationTheory/CharacterTheory §9a.4 (Green's cuspidal characters: degree, orbit criterion, central
character, twists, dual and values), for every clause but the separation by the values at regular elliptic elements.

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

*Route.* 4.4, 4.7 and 4.9 are stated for Green's class function `J_n(θ̃)`, which is `R_{T_{(n)}}^G(θ̃|_{𝔽_{q^n}^×})` by
RepresentationTheory/CharacterTheory §9a.8 (b). Irreducibility and sign: `θ` regular is in general position for `T_{(n)}`
(the Weyl group acts by Frobenius), so 4.7(b) applies, and `ε_G ε_{T_{(n)}} = (−1)^{n−1}`. Cuspidality from 4.9 and 5.1. Degree from
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
`n/d` distinct `q^d`-conjugates (one exists, by 5.1 (b) over `𝔽_{q^d}`) ReductiveGroups §9F.9 applied in `C(s)` makes `ε_{C(s)}ε_{T_{(n)}}R^{C(s)}_{T_{(n)}}(θ′)`,
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

*Needs:* 4.2–4.4, 4.7, 4.9; 5.1; 2.4(c); ReductiveGroups §9F.9; RepresentationTheory/CharacterTheory §9a.8 (b); Mathlib
`GaloisField`, Fourier analysis on finite abelian groups (`AddChar`).

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

*Origin:* definitions and conventions.

For a quadratic extension `E/𝔽_q` and `θ : E^× → ℂ^×` with `θ^q ≠ θ`, the cuspidal representation
`TauCeti.GL2Cuspidal θ` of CharacterTheory Layer 9 has character `σ_θ`, transported along the isomorphism
`E ≅ 𝔽_{q²}`.

*Route.* Both are class functions; compare on the four class families of RepresentationTheory/CharacterTheory §9a.1 using the pinned values
(at an elliptic element `u ∈ E ∖ 𝔽_q` the pinned value is `−(θ(u) + θ(u^q))`) and 5.2.

*Needs:* 5.2; CharacterTheory Layer 9 (pinned `GL₂` objects and values) and §9a.1 (the class families).

### 5.4 The characteristic map of a label

*Origin:* published: Green (1955) and Macdonald (1995), Ch. IV, the characteristic map of `GL_n(𝔽_q)`, of which this is
the case of a squarefree label; Zelevinsky (1981), the irreducibility of Harish-Chandra products of distinct cuspidal
characters.

*Method of the formal proof:* for a squarefree label the product has norm one by the inner product formula for products
of cuspidal characters (4.8), so it is irreducible; it is the only character of its label because a cuspidal character
is determined by its polynomial; it is generic because the Whittaker dimension is multiplicative (4.11); and its degree
is the index of the parabolic subgroup times the degrees of the factors. Labels are multiplicative because a constituent
of a product of two characters is a constituent of the product of two products of cuspidal characters. [FormalProof] has
the clauses at a squarefree label over prime fields `𝔽_p` with `p ≥ 5`, and the other two over every prime field. The
route written here is not that proof's: it is the deduction from the general theorem.

*Corollary of:* RepresentationTheory/CharacterTheory §9a.6 (b)–(d) (`ch_m(⊗_O p_1^{m(O)}) = R_{L_m}^G(σ_m)`, the generic
character and the Harish-Chandra series of a label), at a squarefree label for the clauses on it, with §9a.7 for the
degree, and for every label for the multiplicativity of labels.

Let `m` be a squarefree label of degree `n` over `𝔽_q` (`m(O) ≤ 1` for every `O`), with `σ_O = σ_{θ_O}` (5.2) for the
orbits with `m(O) = 1`, `L_m = ∏_{m(O)=1} GL_{|O|}` and `σ_m = ⊠_{m(O)=1} σ_O`. Then `R_{L_m}^G(σ_m)` is an irreducible
character; it is the only irreducible character of label `m` (5.7); it is generic; and its degree is
`ψ_n(q)/∏_{m(O)=1}(q^{|O|} − 1)`. For every prime `p`: if irreducible characters `χ′` of `GL_{n′}(𝔽_p)` and `χ″` of
`GL_{n″}(𝔽_p)` have labels `m′` and `m″`, every irreducible constituent of `χ′ × χ″` has label `m′ + m″`; and every
Harish-Chandra product of cuspidal characters has a generic irreducible constituent (4.11 (d)).

The characteristic map of every label over every finite field is RepresentationTheory/CharacterTheory §9a.6, written there
with `κ` for `m`. For a label `m` of degree `n`, with `σ_O = σ_{θ_O}`, `L_m = ∏_O GL_{|O|}^{m(O)}` and
`σ_m = ⊠_O σ_O^{⊠m(O)}`, let `Λ_m = ⊗_O Λ^{m(O)}` (the parts of degree `m(O)`, complex coefficients) with the tensor product of
the Hall inner products; the linear map `ch_m : Λ_m → (class functions on GL_n(𝔽_q))` is defined by
`ch_m(⊗_O p_{ρ_O}) = (−1)^{n + Σ_O m(O)} R_{T_{m,ρ}}^G(θ_{m,ρ})` (the pairs of 5.1). (a) `ch_m` is an isometry onto the span
`V_m` of the `R_T^G(θ)` with `(T, θ)` of label `m`, `V_m` is the span of the set `E_m` of irreducible constituents of these
`R_T^G(θ)`, and the `V_m` are pairwise orthogonal and span all class functions. (b) `ch_{m′+m″}(f′·f″) = ch_{m′}(f′) × ch_{m″}(f″)`,
in particular `ch_m(⊗_O p_1^{m(O)}) = R_{L_m}^G(σ_m)`. (c) `ch_m(⊗_O e_{m(O)})` is an irreducible character, the unique
constituent of `Γ_ψ` in `E_m`. (d) For every Green datum `λ` of label `m`, `χ_λ = ch_m(⊗_O s_{λ(O)})` is an irreducible
character; the `χ_λ` are pairwise distinct, `E_m = {χ_λ : |λ| = m}`, `E_m` is the Harish-Chandra series of `(L_m, σ_m)`, and
`⟨χ_λ, R_{L_m}^G σ_m⟩ = ∏_O f^{λ(O)}`.

*Route.* RepresentationTheory/CharacterTheory §9a.6 (b), (c), (d) for a squarefree label: `Λ_m` is spanned by
`⊗_O p_1`, which is also `⊗_O e_1` and `⊗_O s_{(1)}`; the degree from §9a.7. The multiplicativity of labels from §9a.6
(b), (d); the generic constituent is 4.11 (d).

*Needs:* 4.11; 5.1 (the pairs `(T_{m,ρ}, θ_{m,ρ})`), 5.2, 5.7 (the definition of the label); RepresentationTheory/CharacterTheory
§§9a.6, 9a.7.

**Checks.**
- `n = 2`, `m = 2·{1}`: `ch(h₂) = ½(R_{T₁}(1) + R_{T_s}(1)) = 1` and `ch(e₂) = ½(R_{T₁}(1) − R_{T_s}(1)) = St`, the
  constituent of `Γ_ψ` in the unipotent series.
- `n = 2`, `m = {θ}` with `|O| = 2`: `ch_m(p₁) = (−1)^{2+1}R_{T_s}(θ) = σ_θ`.
- The sign `(−1)^{n+Σm(O)}` cannot be dropped: without it `ch_m(p₁)` for an orbit of size `2` is `−σ_θ`.

### 5.5 Green's parametrisation and degree formula

*Origin:* published: Green (1955), the parametrisation by Green data, the degree formula and the exhaustion of the cuspidal
characters (his Lemma 7.7 and Theorem 13); Macdonald (1995), Ch. I §3, Examples 1–2, and Ch. IV, the `q`-hook formula;
restated in Brundan, Dipper and Kleshchev (2001), (2.3.5)–(2.3.7).

*Method of the formal proof:* the formal proof has the exhaustion of the cuspidal characters over every finite field
(5.9), and over prime fields also by a count: the monic polynomials of degree `d` with nonzero constant term inject into the
multisets of cuspidal characters of groups `GL_{d_i}(𝔽_p)` with `Σ_i d_i = d`, while different multisets have disjoint nonempty sets of generic constituents, of which there are at most
`q^d − q^{d−1}`; a cuspidal character outside the list would give one multiset too many. The count compares the numbers
that Brundan, Dipper and Kleshchev (2001), Theorem 2.5d (iii)–(iv), compare, from the other hypothesis. The route written
here is not that proof's: it obtains the cuspidal characters from the classification by Green data.

*Corollary of:* RepresentationTheory/CharacterTheory §9a.7 (Green's parametrisation and degree formula, with twisting,
duality, the exhaustion of the cuspidal characters and the `q`-hook formula); the two counts are
RepresentationTheory/CharacterTheory §9a.10.

The irreducible characters of `GL_n(𝔽_q)` are the `χ_λ` of RepresentationTheory/CharacterTheory §9a.6, `λ` running over the Green data of weight
`n`, without repetition. Its degree is `χ_λ(1) = ψ_n(q) ∏_O q_O^{n(λ(O))} / H̃_{λ(O)}(q_O)`. Twisting and
duality: `χ_λ ⊗ (α∘det) = χ_{α·λ}` (orbits multiplied by `α ∈ L_1`) and `χ_λ^∨ = χ_{λ∘inv}`. The number of
irreducible characters is `k_n(q)` (0.4). Every irreducible cuspidal character is some `σ_θ`; so the cuspidal
characters are in bijection with the Frobenius orbits of degree `n`, and there are `N*_q(n)` of them. Part of
this target is the **`q`-hook formula** in `Λ`: the principal specialisation `s_μ(1, t, t², …) = t^{n(μ)} ∏_{boxes} (1 − t^{h(box)})^{−1}`, as an identity in `ℤ[[t]]`. That every
irreducible cuspidal character is some `σ_θ` is stated as `exists_regular_of_isCuspidal`.

*Route.* RepresentationTheory/CharacterTheory §9a.6 (a), (d), whose characteristic maps `ch_m` and Lusztig series `E_m`
are used here: the `E_m` partition the irreducible characters and `E_m = {χ_λ : |λ| = m}` without
repetition. The degree: `ch_m(⊗p_{ρ_O})(1) = (−1)^{Σ_O(m(O) − ℓ(ρ_O))}ψ_n(q)/∏_{O,i}(q_O^{ρ_{O,i}} − 1)` by ReductiveGroups
§9F.7 (a) and 5.1, which is `ψ_n(q)` times the value at `⊗p_{ρ_O}` of the specialisation `f ↦ ∏_O (−1)^{deg f_O}f_O(1, t, t², …)|_{t=q_O}`
(`p_k(1, t, …) = (1 − t^k)⁻¹`); expand `s_μ = Σ_ρ χ^μ(ρ)p_ρ/z_ρ` (SchurWeyl §7.6) and apply the `q`-hook formula. The
`q`-hook formula: the bialternant formula at `x_i = t^{i−1}`, `i ≤ N`, is a ratio of Vandermonde determinants in
powers of `t`, giving `s_μ(1, …, t^{N−1}) = t^{n(μ)}∏_{boxes}(1 − t^{N+c(box)})/(1 − t^{h(box)})`, `c` the content;
let `N → ∞` in `ℤ[[t]]` (Macdonald, Ch. I §3, Examples 1–2). Twisting and duality: for every pair `(T, θ)`,
`R_T(θ) ⊗ (α∘det) = R_T(θ·(α∘det)|_{T^F})` and `R_T(θ)^∨ = R_T(θ⁻¹)` (4.3: `det(su) = det s`, and the Green functions are rational
integers, `Q(u⁻¹) = Q(u)`). For the pairs of 5.1, `α∘det` restricted to `T_{m,ρ}^F` is `⊠_{O,i} α∘N_{𝔽_{q^{|O|ρ_{O,i}}}/𝔽_q}`, so
`θ_{m,ρ}·(α∘det) = θ_{α·m,ρ}` with the representatives `θ_O·(α∘N_{𝔽_{q^{|O|}}/𝔽_q})` of the orbits `α·O`, and `θ_{m,ρ}⁻¹ = θ_{m∘inv,ρ}`;
the orbit sizes and the signs of RepresentationTheory/CharacterTheory §9a.6 are unchanged. Hence `ch_m(f) ⊗ (α∘det) = ch_{α·m}(f)` and `ch_m(f)^∨ = ch_{m∘inv}(f)` for every
`f ∈ Λ_m` (the tensor factors transported along `O ↦ α·O`, `O ↦ O⁻¹`), first for `f = ⊗_O p_{ρ_O}` and then by linearity; at
`f = ⊗_O s_{λ(O)}` this is the formula. Knowing the two operations only on cuspidal characters and their compatibility with
Harish-Chandra products would not suffice: that fixes their effect on `p₁` in each tensor factor, and the involution
`s_μ ↦ s_{μ′}` of `Λ` also preserves products and fixes `p₁`. Cuspidal
characters: `χ_λ` lies in the Harish-Chandra series of `(L_m, σ_m)` (RepresentationTheory/CharacterTheory §9a.6 (d), with `L_m = ∏_O GL_{|O|}^{m(O)}`), so it is cuspidal iff `L_m = G`, iff
`m` is a single orbit of size `n` with `m(O) = 1`, iff `χ_λ = σ_θ`.

*Needs:* 5.1, 5.2; 0.4; 4.3; ReductiveGroups §9F.7 (a); RepresentationTheory/CharacterTheory §§9a.6, 9a.7, 9a.10;
SchurWeyl Layer 7 (Schur functions, Jacobi–Trudi, the Frobenius characteristic, Hall form).

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

*Origin:* published: Lusztig and Srinivasan (1977), the uniformity of the class functions of `GL_n(𝔽_q)`; Green (1955),
Lemma 3.2 and Theorems 2 and 5, his virtual characters and the expansion of the eigenvalue sums through them; Deligne and
Lusztig (1976), the values of the Green functions. The identification of Green's virtual characters with the
`R_{T_{(a)}}` in (b) is published and is the statement of RepresentationTheory/CharacterTheory §9a.8 (b).

*Method of the formal proof:* the formal proof has the expansion of (b) in Green's form: the eigenvalue sum `b_{θ̃}^{(n)}` is
a virtual character by Brauer's method (it is the character of a lift to characteristic zero on the subgroups to which an
induction theorem reduces), as in Green (1955), and Green's virtual character is defined from it by inversion over the
invariant subspaces, so that the expansion over the maximal parabolic subgroups holds by construction; the identification
of that virtual character with `R_{T_{(n)}}^G(θ̃|_{𝔽_{q^n}^×})` is not among its statements. The route written here is not
that proof's: it proves the expansion for the `R_{T_{(a)}}` from the vanishing of their proper Harish-Chandra restrictions,
the Mackey formula, uniformity, ReductiveGroups §9F.5 (d) and §9F.4.

*Corollary of:* RepresentationTheory/CharacterTheory §9a.8 ((a) uniformity and the special values of the Green functions;
(b) Green's virtual characters, the expansion of the eigenvalue sums and their identification with
`R_{T_{(n)}}^G(θ̃|_{𝔽_{q^n}^×})`).

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

*Route.* (a) RepresentationTheory/CharacterTheory §9a.6 (a) for uniformity; the formula is the definition of `ch_m` there
applied to `⊗_O s_{λ(O)} = ⊗_O Σ_{ρ_O} χ^{λ(O)}(ρ_O)p_{ρ_O}/z_{ρ_O}` (SchurWeyl §7.6). Special values: ReductiveGroups §9F.10,
ReductiveGroups §9F.7 (a) with 5.1, and 2.4(c) with 5.2 (`Q_{T_{(n)}} = (−1)^{n−1}σ_θ` on unipotent elements). (b) The
vanishing of the Harish-Chandra restrictions is ReductiveGroups §9F.9, through the Mackey formula §9F.5 (b): `T_{(n)}` lies
in no proper rational Levi subgroup (5.1), so the index set there is empty. Write `β_a` for
`R_{T_{(a)}}^{GL_a}(θ̃|_{𝔽_{q^a}^×})` and `γ_n = b^{(n)} − Σ_{a<n} R(β_a ⊠ 1)`. For `0 < c < n`, the Harish-Chandra restriction
to `GL_c × GL_{n−c}` of `b^{(n)}` is `b^{(c)} ⊠ 1 + 1 ⊠ b^{(n−c)}` (an average over the unipotent radical of a function of the
eigenvalues, which are those of the two diagonal blocks). By the Mackey formula (ReductiveGroups 7d) the restriction of
`R(β_a ⊠ 1_{GL_{n−a}})` to `GL_c × GL_{n−c}` is a sum over the splittings `a = a₁ + a₂` with `a₁ ≤ c`, `a₂ ≤ n − c` (the double
cosets of these two Levi subgroups), in which `β_a` enters through its restriction to `GL_{a₁} × GL_{a₂}`. For `a < n` only
`a₁ = 0` and `a₂ = 0` survive (the clause just proved), and as `*R(1) = 1 ⊠ 1` these terms are `R(β_a ⊠ 1_{GL_{c−a}}) ⊠ 1` (if
`a ≤ c`) and `1 ⊠ R(β_a ⊠ 1_{GL_{n−c−a}})` (if `a ≤ n − c`). Summing over `a < n` gives `b^{(c)} ⊠ 1 + 1 ⊠ b^{(n−c)}` by the
formula in the ranks `c, n − c < n` (induction on `n`), so `γ_n` is killed by every proper
Harish-Chandra restriction. Such a class function is orthogonal to every Harish-Chandra induced function (adjunction),
in particular to `R_{T_τ}(θ′)` for `τ ≠ (n)` (ReductiveGroups §9F.5 (a): `T_τ` lies in a proper rational Levi subgroup); by (a) it lies in the span
of the `R_{T_{(n)}}(θ′)`. By ReductiveGroups §9F.5 (d), applied to the function `b^{(n)}` of the semisimple part,
`⟨γ_n, R_{T_{(n)}}(θ′)⟩ = ⟨b^{(n)}, R_{T_{(n)}}(θ′)⟩ = (q^n − 1)⁻¹ Σ_{z ∈ 𝔽_{q^n}^×} Σ_{j<n} θ̃(z^{q^j})·conj(θ′(z))` (the eigenvalues of `z` in
`T_{(n)}^F ≅ 𝔽_{q^n}^×` are its conjugates), which is the number of `j < n` with `θ^{q^j} = θ′`, `θ = θ̃|_{𝔽_{q^n}^×}`, and
equals `⟨R_{T_{(n)}}(θ), R_{T_{(n)}}(θ′)⟩` (ReductiveGroups §9F.4). So `γ_n − β_n` lies in that span and is orthogonal to it: `γ_n = β_n`. Virtuality:
`R_T(θ)` is a virtual character (4.2) and Harish-Chandra induction preserves virtual characters.

*Needs:* 4.2; 5.1, 5.2; 2.4(c); ReductiveGroups 7c, 7d and §§9F.4, 9F.5, 9F.7, 9F.9, 9F.10; RepresentationTheory/CharacterTheory
§9a.6; SchurWeyl Layers 4, 7.

**Checks.**
- `n = 2`: `χ_{(2)} = ½(R_{T₁}(1) + R_{T_s}(1)) = 1` and `χ_{(1,1)} = ½(R_{T₁}(1) − R_{T_s}(1)) = St`.
- `Q_{T_{(n)}}^G(1) = ∏_{i=1}^{n−1}(1−q^i)`, which agrees with the second special value at `τ = (n)`.
- (b) for `n = 1`: `b = θ̃|_{𝔽_q^×} = R_{T_{(1)}}(θ̃)`. For `n = 2` at a central element `a`:
  `Ind_B(θ̃ ⊠ 1)(a) + R_{T_s}(θ̃|_{𝔽_{q²}^×})(a) = (q + 1)θ̃(a) + (1 − q)θ̃(a) = 2θ̃(a) = b(a)`; with `σ_θ` in place of Green's
  virtual character the value would be `2qθ̃(a)`: the sign matters, and the formula holds also for non-regular `θ̃|_{𝔽_{q²}^×}`
  (for which `σ_θ` is not defined). By computation the formula holds for every `θ̃` on `GL₂(𝔽_q)`, `q = 2, 3, 4, 5, 7`, and
  on `GL₃(𝔽₂)`, and for 61 characters `θ̃` on `GL₃(𝔽₃)`, with the Harish-Chandra induction computed over the group.

### 5.7 Generic and semisimple characters; labels

*Origin:* published: S. I. Gelfand (1970), Zelevinsky (1981) and Deligne and Lusztig (1976), §10, a generic character in
every Harish-Chandra series of `GL_n(𝔽_q)`; the idempotents `z_m` are particular to this proof over prime fields `𝔽_p`
with `p ≥ 5`, and over every other finite field this roadmap's own formulation.

*Method of the formal proof:* the label of a character is defined through a product of cuspidal characters that contains
it and is unique by the orthogonality of such products; the idempotent of a label is the sum of the central idempotents
of its characters, and its laws follow from the orthogonality relations; each product of cuspidal characters contains a
generic character because the Whittaker dimension is multiplicative and positive on cuspidal characters; and the number
of generic characters is at most `⟨Γ_ψ, Γ_ψ⟩ = p^n − p^{n−1}`, since each occurs in `Γ_ψ` with a nonzero multiplicity.
[FormalProof] has the first three clauses of the statement over prime fields `𝔽_p` with `p ≥ 5`, and the last two over
every prime field. The route written here is not that proof's: it is the deduction from the general theorems.

*Corollary of:* RepresentationTheory/CharacterTheory §9a.9 (one generic character for every label; `q^n − q^{n−1}` generic
characters) with §9a.6 (d) (the characters of a label form one Harish-Chandra series), for every clause but the
idempotents `z_m`.

An irreducible character `χ` of `GL_n(𝔽_q)` **has label** `m` if `χ` is a constituent of a Harish-Chandra product
`σ_{θ_1} × ⋯ × σ_{θ_r}` of cuspidal characters (5.2) with `m(O) = #{i : θ_i ∈ O}`; in the labelled form the label is the
monic polynomial `∏_O P_O^{m(O)}` of degree `n` with nonzero constant term. Over every finite field `𝔽_q`: every
irreducible character of `GL_n(𝔽_q)` has exactly one label; the central idempotent `z_m` of `ℂ[GL_n(𝔽_q)]`, the sum of
the central idempotents of the characters of label `m`, satisfies `z_m z_{m′} = 0` for `m ≠ m′` and `Σ_m z_m = 1`; and the
series of a squarefree label has exactly one character (5.4), which is generic. For every prime `p`: every Harish-Chandra
product of cuspidal characters of `GL_n(𝔽_p)` has a generic irreducible constituent, and the number of generic irreducible characters of
`GL_n(𝔽_p)` is at most `p^n − p^{n−1}`.

The general form, over every finite field, is RepresentationTheory/CharacterTheory §9a.9: every irreducible character
`χ_λ` has exactly one label, its **semisimple label** `|λ| : O ↦ |λ(O)|`, and the characters of label `m` form one
Harish-Chandra series, that of `(L_m, σ_m)` (5.4), and one Lusztig series (§9a.6 (a) with the wider form of 5.1, a label
being a geometric conjugacy class of pairs); `χ_λ` is generic iff every `λ(O)` is a column `(1^{m(O)})`, and is called **semisimple** iff every
`λ(O)` is a row `(m(O))`; each label carries exactly one generic character `χ_{gen(m)}` and one semisimple character, there
are `q^n − q^{n−1}` of each, with degrees `q^{N(m)} ψ_n(q)/∏_O ψ_{m(O)}(q_O)` (generic),
`N(m) = Σ_O |O|·m(O)(m(O)−1)/2`, and `ψ_n(q)/∏_O ψ_{m(O)}(q_O)` (semisimple); and `Γ_ψ = Σ_m χ_{gen(m)}`.

*Route.* RepresentationTheory/CharacterTheory §9a.9 with §9a.6 (d), at `q = p` for the last two clauses; for a squarefree
label the series has one character (5.4). The idempotents: sums of the central idempotents of the
characters of each label (CharacterTheory §3.5), the labels partitioning the irreducible characters
(RepresentationTheory/CharacterTheory §9a.9). The count: labels are monic polynomials of degree `n` with nonzero constant
term (0.4).

*Needs:* 5.2, 5.4 (for the clause on squarefree labels); 0.4; 5.1 (for the Lusztig series); CharacterTheory §3.5;
RepresentationTheory/CharacterTheory §§9a.6, 9a.9.

**Checks.**
- The unipotent label `(X − 1)^n` has generic character `St` (degree `q^{n(n−1)/2}`) and semisimple
  character `1`.
- `GL₂`: generic characters are the twisted Steinbergs, the irreducible principal series and the cuspidals,
  `(q−1) + ½(q−1)(q−2) + ½q(q−1) = q² − q`.

### 5.8 Gelfand–Graev weights of labels

*Origin:* adapted from Green (1955) and Zelevinsky (1981), the degree formula and the degenerate Gelfand–Graev
multiplicities: the share of each Harish-Chandra series in the Gelfand–Graev and Bessel-type representations, with uniform
bounds.

*Method of the formal proof:* the share of a series in the representation cut out by an idempotent `a` is computed
character by character as `(χ(1)/|G^F|)·tr(a, χ)`. The formal proof has the weights of the squarefree labels, over prime
fields with at least `5` elements: such a series is the Harish-Chandra product of the cuspidal characters of the
irreducible factors, of Whittaker dimension `1` (multiplicativity under Harish-Chandra induction) and of known degree,
which gives `wt(m) = ∏_{m(O)=1}(q_O − 1)⁻¹`; the shares in the Bessel-type representation come from 2.7 and a Leibniz rule
for the derivatives of a product of cuspidal characters, with `Σ_j c_jq^{−j} ≤ ∏_l(1 + q^{−d_l})`; the labels that are not
squarefree are bounded by counting, the monic polynomials of degree `n` that vanish at `0` and those that are not
squarefree each numbering at most `q^{n−1}`. The route written here counts the squarefree labels through the recursion
`S′_n = q^n − q^{n−1} − S′_{n−1}`, and proves the weight formula for every label and the count of (b) for every composition.

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

*Route.* (a) `Γ_ψ z_m = χ_{gen(m)}` (RepresentationTheory/CharacterTheory §9a.9, with the idempotents of 5.7) and `Γ_ψ(1) = |G^F|/|U^F| = ψ_n(q)` give the formula from the generic degree of §9a.9.
For the bound: squarefree labels have `wt ≥ q^{−n}`, and the number of squarefree monic polynomials of degree `n`
with nonzero constant term satisfies `S′_n = q^n − q^{n−1} − S′_{n−1} ≥ q^n − 2q^{n−1}` for `n ≥ 2` (splitting off a
factor `X`, `S′_n + S′_{n−1}` is the number `q^n − q^{n−1}` of all squarefree monic polynomials of degree `n`; and
`S′_{n−1} ≤ q^{n−1}`), so the squarefree labels carry weight at least `1 − 2/q`. The inequality for `V`:
in `c·ℂ[G^F] = c·⊕_π π^{dim π}` the `ψ`-isotypic part of `z_S`'s range has dimension `c·Σ_{π ∈ S} dim π·m_π`
`= c·Γ_ψ(1)·Σ_{m∈S} wt(m)`. (b) The identification of `Γ_λ` and the multiplicity are 2.6(c). For squarefree `m`,
`χ_{gen(m)} = R_{L_m}^G(σ_m)` is irreducible (RepresentationTheory/CharacterTheory §9a.6 (d), the series has one element), and the Mackey formula (ReductiveGroups
7d) with cuspidality writes `*R_{M_λ}^G R_{L_m}^G(σ_m)` as the sum over the maps `c` of the products `⊠_i (×_{c(j)=i} σ_{O_j})`,
each irreducible and generic for `M_λ` (RepresentationTheory/CharacterTheory §§9a.6 (d), 9a.9 on each block). (c) The share of `m` in a representation `V` is
`dim z_mV/dim V`, and `(a·e_χ)(1) = (χ(1)/|G^F|)·tr(a, χ)` for the central idempotent `e_χ`, so
`wt_H(m) = Σ_{χ∈E_m} χ(1)⟨χ|_{H_i}, ϕ_i⟩/[G^F : H_i]`. Insert 2.7(b), with `[G^F : H_i] = q^k·|G^F|/|U^F|` and
`dim Γ_{(j,n−j)} = |G^F|/|U^F|` for every `j`; the lower bound keeps only the term `j = 0`. For squarefree `m`,
`⟨χ_{gen(m)}, Γ_{(j,n−j)}⟩ = c_j` by (b) with `λ = (j, n − j)`, so `wt_{(j,n−j)}(m) = c_j·wt(m)`; the upper bound from
`q^{k−j} − q^{k−j−1} ≤ q^{k−j}` and `Σ_{j≤k} c_jq^{−j} ≤ ∏_l(1 + q^{−d_l})`. The shares in `Ind_{H_i}^{G^F}ϕ_i` sum to `1`, and by the
lower bound and (a) the squarefree labels carry at least `(1 − q^{−1})(1 − 2q^{−1}) ≥ 1 − 3q^{−1}`.

*Needs:* 5.5, 5.7; 2.2, 2.3, 2.6, 2.7; ReductiveGroups 7d; CharacterTheory §3.5; RepresentationTheory/CharacterTheory
§§9a.6, 9a.9.

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

*Origin:* published: Green (1955), Lemma 7.7 and Theorem 13, the irreducible cuspidal characters of `GL_n(𝔽_q)` are in
bijection with the monic irreducible polynomials of degree `n` other than `X`. The remark is this roadmap's own
formulation.

*Method of the formal proof:* Green's characters for the regular characters of `𝔽_{q^n}^×` give an injection; exhaustion
expands a cuspidal character `χ` in Green's class functions with the integer coefficients `a_k = ⟨χ, S_k⟩`, `S_k` the
eigenvalue power sums, which satisfy `Σ a_k² = n` and are divisible by `s` on the exponents fixed by `q^{n/s}`, so that
only regular exponents occur; over prime fields a second proof counts generic characters. It departs from the published
proofs, which compare the number of irreducible characters with the number of conjugacy classes, by working with the
cuspidal character alone. The route written here is not that proof's: it reads the count of cuspidal characters from 5.5
and the wider form of 5.1, and the inequality from 5.7.

*Corollary of:* RepresentationTheory/CharacterTheory §9a.10 (the number `N*_q(n)` of cuspidal characters and the number
`q^n − q^{n−1}` of generic characters).

For `n ≥ 1` and every finite field `𝔽_q`: the irreducible cuspidal characters of `GL_n(𝔽_q)` are in bijection with the
monic irreducible polynomials of degree `n` over `𝔽_q` other than `X`; so their number is `N*_q(n)`. Over a prime field
`𝔽_p`, the number of generic irreducible characters of `GL_n(𝔽_p)` is at most `p^n − p^{n−1}` (5.7).

The general counts — the number `k_n(q)` of irreducible characters, with generating function
`∏_{i≥1}(1 − t^i)/(1 − qt^i)` (0.4), exactly `q^n − q^{n−1}` generic and `q^n − q^{n−1}` semisimple irreducible
characters, and `q^n − q^{n−1} ≤ k_n(q) ≤ q^n` for prime powers `q` — are RepresentationTheory/CharacterTheory §9a.10.

*Remark* (this roadmap's own formulation; not a statement of [FormalProof]). The upper bound `k_n(q) ≤ q^n` holds for
every real `q ≥ 2`, `k_n(q)` being the coefficient of `t^n` in `∏_{i≥1}(1 − t^i)/(1 − qt^i)`. The proportion of generic
characters among the irreducible characters of `GL_n(𝔽_q)` is at least `1 − q^{−1}`, and the proportion of cuspidal
characters lies between `(1 − 2q^{−n/2})/n` and `(1 − q^{−1})^{−1}/n` (`n ≥ 2`).

*Route.* The statement: 5.5 (the cuspidal characters are the `σ_θ`, in bijection with the Frobenius orbits of degree `n`)
and the wider form of 5.1 (these orbits are the monic irreducible polynomials of degree `n` other than `X`); the inequality
is 5.7. The remark: the upper bound, for every real `q ≥ 2`. Expanding each factor `(1 − x)/(1 − qx) = 1 + Σ_{b≥1}(q^b − q^{b−1})x^b` with `x = t^i` gives
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
`Σ_{2∈μ} W(μ) + (2(q − 1)/q)Σ_{2∉μ} W(μ) ≥ Σ_μ W(μ)`, as `q ≥ 2`. The proportions follow from the counts of
RepresentationTheory/CharacterTheory §9a.10 and the bounds of CharacterSumsOverFiniteFields §3.1a on `N*_q(n) = Π_q(n)`.

*Needs:* 0.4; 5.1, 5.5, 5.7; RepresentationTheory/CharacterTheory §9a.10; CharacterSumsOverFiniteFields §3.1a.

**Checks.**
- `k₃(q) = q³ − q` and `q³ − q² ≤ q³ − q ≤ q³`; `N*_q(3) = (q³ − q)/3`.
- `q^n − k_n(q)` for `n = 1, …, 6` is `1, 1, q, q, q² + q − 1, q²`, positive and of lower order than `q^n`.
- `k₅(q) = q⁵ − q² − q + 1` while `q·k₄(q) = q⁵ − q²`: `k_n(q) − q k_{n−1}(q)` changes sign, so the bound cannot be
  read off coefficientwise from `Σ q^n t^n = (1 − qt)⁻¹`.

### 5.10 Gauss sums of cuspidal characters

*Origin:* published: Kondo (1963), the Theorem of the Introduction, p. 245, (a); Piatetski-Shapiro (1983), (b).

*Method of the formal proof:* none; the statement is not in [FormalProof].

For an irreducible representation `σ` of `GL_n(𝔽_q)` the operator `Σ_{x∈GL_n(𝔽_q)} ψ₀(tr x)σ(x)` commutes with `σ` and is
therefore a scalar `w(σ)`, the **Gauss sum** of `σ`. For `θ ∈ L_n` put `G_n(θ) = Σ_{z∈𝔽_{q^n}^×} θ(z)ψ₀(Tr_{𝔽_{q^n}/𝔽_q} z)`.
(a) For regular `θ ∈ L_n`, `w(σ_θ) = (−1)^{n−1}q^{n(n−1)/2}G_n(θ)`.
(b) (`n = 2`.) If `θ, θ' ∈ L_2` are regular, `θ|_{𝔽_q^×} = θ'|_{𝔽_q^×}` and `G_2(θ·(α∘N)) = G_2(θ'·(α∘N))` for every `α ∈ L_1`, then
`θ' ∈ {θ, θ^q}`: the twisted Gauss sums and the central character determine a cuspidal representation of `GL₂(𝔽_q)`.

*Route.* `x ↦ ψ₀(tr x)` is a class function, so the operator commutes with `σ(GL_n(𝔽_q))` and Schur's lemma applies.
(a) is RepresentationTheory/CharacterTheory §9a.11, written there with `g_n(θ)` for `G_n(θ)`. (b) Fourier inversion on `𝔽_q^×`:
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

*Needs:* 5.2; 2.3, 2.4(b); CharacterTheory §3.5; RepresentationTheory/CharacterTheory §9a.11 (for (a)).

**Checks.**
- `n = 1`: `σ_θ = θ` and `w(θ) = G_1(θ)`.
- `n = 2`, over the four class families of RepresentationTheory/CharacterTheory §9a.1: the central elements contribute `(q−1)Σ_a θ(a)ψ₀(2a)`, the non-semisimple ones
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

*Origin:* published: Shintani (1976), Lemma 2-6 with its Corollary and Lemmas 2-8 and 2-9, (a), (b) and the first part of
(c), with the devices of the proof of (d) (tensor induction, Lemmas 1-4 and 2-10; a virtual character of norm one on the
coset, Lemma 2-11); Kawanaka (1987), the lift of a cuspidal character in (d). The second part of (c) and (e) are particular
to this proof.

*Method of the formal proof:* the norm map and the count of its fibres are established inside `GL_n(k′)` by a count in the
centraliser algebra and descent of semilinear maps; the lift of a Harish-Chandra induction is the twisted induction of the
lifts; and in prime degree `l` the lift of a cuspidal character is identified through a virtual character of the
semidirect product, built by tensor induction and of norm one on the coset, whose pairing with the candidate character is
congruent to `1` modulo `l`. [FormalProof] states (d) as the membership of the lift in the isotypic part of `τ`. For (a)–(c)
the route written here is not that proof's: it uses Lang's theorem for `GL_n` over the algebraic closure; for (d) and (e)
it is.

*Corollary of:* RepresentationTheory/CharacterTheory §9a.12 (Shintani descent for `GL_n`: norm classes, the Shintani lift
and its compatibility with Harish-Chandra induction), for (a), (b) and the first part of (c).

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
(so the product is irreducible, RepresentationTheory/CharacterTheory §9a.6 (d)). Then `τ∘F ≅ τ`, and there are an isomorphism `A : τ → τ∘F` (`A∘τ(g) = τ(F(g))∘A`)
with `A^l = 1` and a sign `ε ∈ {±1}` such that `Sh_l(χ_{σ_θ})(δ) = ε·tr(τ(δ)∘A)` for every `δ ∈ GL_m(k′)`.
(e) *Labels in prime degree.* Let `d = l` be prime, `χ` the character of a Harish-Chandra product `R_M^G(⊠_i σ_{θ_i})` of
cuspidal representations, of label `m` (5.7), and `ρ` a representation of `G′` with `Σ_δ conj(Sh_l χ(δ))ρ(δ) ≠ 0`. Then `ρ` has
an irreducible constituent of label `m^{(l)}`.

*Route.* (a) Lang's theorem for `GL_n` over `k̄` (ReductiveGroups 7a), `F` extended to the `q`-Frobenius of `GL_n(k̄)`, gives `x`
with `δ = x⁻¹F(x)`; then `N(δ) = x⁻¹F^d(x)`, and `γ = F^d(x)x⁻¹` is `F`-fixed (from `F(x) = xδ` and `F^d(δ) = δ`), so `γ ∈ G` and
`N(δ) = x⁻¹γx`. Matrices over `k′` conjugate over `k̄` are conjugate over `k′`, and elements of `G` conjugate in `G′` are conjugate
in `G` (the descent of conjugacy, 0.3). `x` is determined by `δ` up to `x ↦ gx` with `g ∈ G`, which conjugates `γ` in `G`;
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
so these terms are orthogonal to `τ` (ReductiveGroups §7h.2). The function `∏_{i<l} b′_m(F^i(y)) = ∏_{i<l} Σ_α θ̃^{q^i}(α)` depends on the eigenvalues of `y` only. *Case `l ∤ m`.* `τ` is
`F`-stable: `σ_θ∘F = σ_{θ^q}` over `k′`, and `θ^q = θ^{q^{lj}}` for `lj ≡ 1 (mod m)`. With `T′` the Coxeter torus of `GL_m(k′)`
(`T′^F ≅ 𝔽_{q^{lm}}^×`, whose element `z` has the eigenvalues `z^{q^{la}}`, `a < m`), `τ = (−1)^{m−1}R_{T′}(θ)` and ReductiveGroups §9F.5 (d) make
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
constituent in `R_M^{G′}(⊠_i τ_i)`, whose constituents have the label `Σ_i` (label of `τ_i`) (RepresentationTheory/CharacterTheory §9a.6 (b), §9a.9), and the label of `τ_i`
is the lift of the orbit of `θ_i`: one orbit of size `m_i` over `k′` if `l ∤ m_i`, the `l` orbits of the `θ_i^{q^j}` if `l ∣ m_i`. So
the label is `m^{(l)}`.

*Needs:* 0.3, 1.0, 4.5, 5.1, 5.2, 5.6, 5.7; ReductiveGroups 7a, 7b, 7c and §§7h.2, 9F.5; RepresentationTheory/CharacterTheory
§§9a.6, 9a.9; InductionRestriction Layer 2; TensorInductionAndFiniteGroupInputs §§6.1, 6.2 (with (b′)); RepresentationTheory/CharacterTheory
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
`F`-stable irreducible characters of `G′` through their twisted characters (RepresentationTheory/CharacterTheory §9a.12 (d)).
This roadmap states only the prime-degree case for Harish-Chandra products of cuspidal characters.

### Examples

For `n = 2` the irreducible characters have the degrees `1`, `q`, `q + 1` and `q − 1`, in the numbers `q − 1`, `q − 1`, `½(q−1)(q−2)` and `½q(q−1)` (5.5); in the unipotent series `ch(h₂) = 1` and `ch(e₂) = St`, and `ch_m(p₁) = σ_θ` for an orbit of size `2` (RepresentationTheory/CharacterTheory §9a.6, cited in 5.4). The labels of `GL₂` have the Gelfand–Graev weights `(q−1)^{−2}`, `(q²−1)^{−1}` and `q/((q−1)(q²−1))` for `(X−a)(X−b)` with `a ≠ b`, for the irreducible labels and for `(X−a)²`, with totals summing to `1` (5.8). `k₃(q) = q³ − q` and `N*_q(3) = (q³ − q)/3` (5.9). For `n = 2`, `w(σ_θ) = −qG_2(θ)` (5.10). For `GL₂(𝔽₂) ⊂ GL₂(𝔽₄)` the classes of sizes `1, 3, 2` have norm fibres of sizes `30, 90, 60` in `GL₂(𝔽₄)` (5.11).

### Dependencies

Layers 0, 1, 2 and 4; ReductiveGroups Layers 7a, 7b, 7c and 7d, with §7h.2 and §§9F.3–9F.5, 9F.7–9F.10 (5.1, 5.2, 5.5, 5.6, 5.11); RepresentationTheory/CharacterTheory Layers 3, 9 and §3.5, with §§9a.1, 9a.4 and 9a.6–9a.12 of its Layer 9a (5.1–5.11); CharacterSumsOverFiniteFields §3.1a (5.1); SchurWeyl Layers 4 and 7 (§§7.5–7.7); InductionRestriction Layer 2; TensorInductionAndFiniteGroupInputs §§6.1, 6.2 (5.11); Mathlib's `GaloisField`, `ArithmeticFunction.moebius` and `AddChar`.

## Layer 6: depth-zero representations of `p`-adic `GL_n`

### 6.0 `K₁`-invariants and Jacquet modules

*Origin:* published: Dat (2009), Propositions 3.1 and 6.2 (i), for every reductive group and every smooth representation,
the comparison of the depth-zero invariants with those of the Jacquet module, and Moy and Prasad (1996), Proposition 6.7
and Theorem 5.2 (1), for admissible representations, with the depth of the supercuspidal support; here `GL_n` at the
vertex of `GL_n(𝒪)`.

*Method of the formal proof:* the formal proof has, for every nonarchimedean local field, every block decomposition and
every admissible `π`, the bijection of the projection from the `K₁(N ∩ K)`-fixed vectors of `π` onto the `(M ∩ K₁)`-fixed
vectors of `π_N`, injective for every smooth `π`, and, for `F ≅ ℚ_p`, the cuspidality of `π^{K₁}` for supercuspidal `π`,
read from compactly supported matrix coefficients. Surjectivity is Jacquet's lemma with a contracting central element;
injectivity is proved by induction on the exponents of a contracting diagonal element, each step reducing to the
statement that, in a representation of `GL_n(k)`, a vector fixed by a unipotent radical and killed by the sum over the
opposite radical is zero, which is proved by induction on pairs of orthogonal idempotents of the matrix ring. The route
written here is not that proof's: it reads the comparison from LocalFactorsOfTwistsAndTypes §2.1, with injectivity from
one invertible Hecke operator, and the supercuspidal clause from the vanishing of the Jacquet modules.

*Corollary of:* SmoothRepresentationsOfLocalGroups SR.7.1 (*depth-zero-jacquet*, *depth-zero-support*: the depth-zero
Jacquet comparison and the depth of the cuspidal support).

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

*Origin:* published: Carayol (1984), Theorem 4.2 with the complement to Definition 4.1, the compact induction from `F^×K`
of `Λ_{σ,c}` is irreducible and supercuspidal, inequivalent data giving inequivalent representations; Moy and Prasad
(1996), Propositions 6.6 and 6.8, every depth-zero supercuspidal representation arises so; for `n = 2`, Bushnell and
Henniart (2006), §11. The `K₁`-invariants `σ` and the contragredient, which no cited source states in this form, are
derived from these in SmoothRepresentationsOfLocalGroups SR.7.2.

*Method of the formal proof:* the formal proof has, for every nonarchimedean local field, an irreducible quotient `π` of the
compact induction containing the inflation of `σ`, its cuspidality and `π^{K₁} = σ`, and, over fields isomorphic to `ℚ_p`,
uniqueness and exhaustion in terms of types: `π` is an irreducible quotient of the subrepresentation generated by a vector
of `σ`; its Jacquet modules vanish because the sum of the `σ(u)x` over a proper unipotent radical of the residue field is
zero and `G = P·K`; `π^{K₁} = σ` by the Cartan decomposition; and two such representations are isomorphic by a graph
argument in `π ⊕ π′`. The route written here is not that proof's: it proves the compact induction irreducible through its
intertwining and the compact-induction criterion.

*Corollary of:* SmoothRepresentationsOfLocalGroups SR.7.2 (*depth-zero-supercuspidals*: the compact inductions `π(σ, ω)`,
their central characters, the isomorphism criterion and exhaustion, with the `K¹`-invariants and the contragredient).

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

*Needs:* 6.0; 1.1, with ReductiveGroups §7h.1 (the contragredient of a cuspidal representation is cuspidal, for
`π(σ^∨, c⁻¹)`); SmoothRepresentationsOfLocalGroups SR.2.1 (compact induction, Frobenius reciprocity),
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

*Origin:* published: Bushnell and Henniart (2005), 2.2 Proposition, the parametrisation of the essentially tame
supercuspidal representations of `GL_n(F)` by admissible pairs, in its case of level zero (`F_n/F` unramified, the
character trivial on `1 + ϖ𝒪_{F_n}`); for `n = 2`, Bushnell and Henniart (2006), §11.

*Method of the formal proof:* none; the statement is not in [FormalProof].

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

*Origin:* published: Moy and Prasad (1996), Theorem 5.2 (1), and Dat (2009), Proposition 6.3 (ii), an irreducible
representation has depth zero iff its supercuspidal support has; the statement for every constituent, the labels in
positive characteristic and the rule for twists are this roadmap's own formulation.

*Method of the formal proof:* a `K₁`-fixed vector of `π` is lifted to the representation induced from the supercuspidal
support, of which `π` is a subquotient, and evaluated at a point of `K` (Iwasawa decomposition), which gives a vector of
the tensor product of the support fixed by `M ∩ K₁`; the converse lifts fixed vectors from a Jacquet module of `π`
containing that tensor product, by Jacquet's lemma; for the label, evaluation at the identity gives a nonzero
`P(k)`-equivariant map from `π^{K₁}` to the inflated tensor product of the `x^{K₁}`, and Frobenius reciprocity gives the
nonzero inner product with the Harish-Chandra product of the cuspidal characters. The route written here is not that
proof's: it identifies the `K₁`-invariants of the induced representation with a Harish-Chandra induction and uses
exactness, which gives the statement for every constituent.

*Corollary of:* SmoothRepresentationsOfLocalGroups SR.7.1 (*depth-zero-support*: depth zero is read on the cuspidal
support), for the second equivalence of the first sentence; the first is SmoothRepresentationsOfLocalGroups SR.7.2 (6.1).

An irreducible `π` has depth zero iff `π^{K₁} ≠ 0`, iff every member of its supercuspidal support has depth
zero (the second equivalence: Moy–Prasad 1996, Theorem 5.2 (1), p. 110). If its supercuspidal support is `{π_{θ̃_1}, …, π_{θ̃_r}}`, with `θ_i` of degree `n_i`, then every irreducible
constituent of the `GL_n(k)`-module `π^{K₁}` lies in the Harish-Chandra series of `(∏_i GL_{n_i}(k), ⊠_i σ_{θ_i})`;
equivalently its semisimple label (RepresentationTheory/CharacterTheory §9a.9) is the **label of `π`**, `m_π(O) = #{i : θ_i ∈ O}`. The label of
`π ⊗ (χ∘det)` for tamely ramified `χ` is the translate of `m_π` by `χ|_{𝒪^×}`.
In [FormalProof] these statements are made for complex representations, with depth zero taken to mean `π^{K₁} ≠ 0`: that a
`K₁`-fixed vector of `π` gives one in every member of its supercuspidal support, for every nonarchimedean local field `F`;
the converse, and the statement on labels, only for `F` of characteristic zero, the latter in this form: every member `x`
of the support is supercuspidal of depth zero, the character of `x^{K₁}` is that of a `σ_θ` with `θ` regular, and the
character of `π^{K₁}` has a nonzero inner product with the Harish-Chandra product of these characters (so some irreducible
constituent of `π^{K₁}` lies in the series). The statement for every constituent, the converse and the labels in positive
characteristic, and the rule for twists are this roadmap's, by the route below, which does not use the characteristic (the
converse through LocalFactorsOfTwistsAndTypes §2.1 (a)). The first of these statements is [FormalProof],
`Development/AbelianVarietyTheory/PublishedTheorems/GaloisCohomology₂/DepthZeroSupport.lean`
(`GlobalTheory.Published.DepthZeroSupport`),
`Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/ExistsContractNeZero.lean` (`GlobalTheory.SmGL.depthZeroSupport`).
The converse is stated there as `GlobalTheory.Published.DepthZeroInduction`
(`Development/AbelianVarietyTheory/PublishedTheorems/GaloisCohomology₂/DepthZeroInduction.lean`), which
`GlobalTheory.DepthZeroPass.depthZeroInduction` (`Development/AbelianVarietyTheory/Proofs/InertiaEigenvalues/FixedNeBotOfIsSubquotient.lean`)
derives from the statements `GlobalTheory.Published.GeometricLemma`, `GlobalTheory.Published.BernsteinZelevinskyFiniteness` and
`GlobalTheory.Published.ZelevinskyPolynomialRing`; the statement on labels is
`Development/AutomorphicArithmetic/Foundations/GaloisRepresentations/RegularSemisimpleFibres/ResEmbCompat.lean`
(`UpperTheory.Gal.InertialTypesAlt.LblOf`), proved in `TypeOfLblHolds.lean` of the same folder (`UpperTheory.Gal.InertialTypesAlt.lblOf_holds`).

*Route.* The equivalences from 6.0 and 6.1. Labels: embed `π` in the normalised induction from its cuspidal
support (SmoothRepresentationsOfLocalGroups SR.3.1); by the Iwasawa decomposition `GL_n(F) = P·K`, a
`K₁`-invariant vector of `i_P^G τ` is a function on `K` with `f(pk) = τ(p)f(k)` for `p ∈ P ∩ K`, and `K₁` being normal
in `K` its values lie in `τ^{M∩K₁}`, so `(i_P^G τ)^{K₁} ≅ R_{M(k)}^{GL_n(k)}(τ^{M∩K₁})`; `π_{θ̃_i}^{K₁} ≅ σ_{θ_i}` by 6.1, and
taking `K₁`-invariants is exact. Constituents of a Harish-Chandra induced representation lie in its series
(ReductiveGroups §7h.2), and RepresentationTheory/CharacterTheory §9a.9 identifies the series with the label.

*Needs:* 6.0, 6.1, 6.2; ReductiveGroups §7h.2; RepresentationTheory/CharacterTheory §9a.9; SmoothRepresentationsOfLocalGroups SR.2.2 (Jacquet functors), SR.3.1
(cuspidal support); ReductiveGroupsPartII RG2.4 *iwasawa-decomposition*.

**Checks.**
- An unramified principal series `π = i_B^G(χ₁ ⊗ ⋯ ⊗ χ_n)`, `χ_i` unramified, has label `n·{1}` (the
  polynomial `(X−1)^n`), and `π^{K₁} ≅ Ind_{B(k)}^{GL_n(k)} 1`.
- The Steinberg representation of `GL₂(F)` has `St^{K₁} = St_{GL₂(k)}`, label `(X−1)²`, while it has no
  `K`-fixed vector.

### 6.4 Representations of depth zero up to twist

*Origin:* definitions and conventions.

An irreducible representation of `GL_n(F)` is **of depth zero up to twist** if every member of its
supercuspidal support is `χ ⊗ π₀` with `χ` a character of `F^×` and `π₀` of depth zero. This class
contains every irreducible representation whose supercuspidal support consists of characters of `F^×`, is
stable under twisting by characters, contragredients, and the passage to subquotients of parabolic
inductions of its members, and for `n = 1` consists of all characters. Its members `π` with `χ` tamely
ramified throughout are exactly those of depth zero.
In [FormalProof] the class has this form: every member of the supercuspidal support is a character of `F^×`, or `F` is
isomorphic to a field `ℚ_p` and the member is `χ ⊗ π₀` with `π₀` of depth zero; members of rank at least two are thus
admitted only over the fields `ℚ_p`. Its properties are stated there for complex representations and `F` of
characteristic zero: a twist or the contragredient of a supercuspidal member of the class is in the class; a Langlands
quotient is in the class if and only if the supercuspidal representations at the beginnings of its segments are; and for
`π₀` irreducible of depth zero, `χ ⊗ π₀` has depth zero if and only if `χ` is tamely ramified. The class is
`UpperTheory.Zero.LLC.GoodCusp` and `UpperTheory.Zero.LLC.Good` (`Development/AutomorphicArithmetic/Foundations/LocalLanglands/IsRecTOfIsRec.lean`);
the three properties are stated in `UpperTheory.Zero.LLC.ClBasic`, `UpperTheory.Zero.LLC.GoodSeg` and `UpperTheory.Zero.LLC.TwTame`
(`Development/AutomorphicArithmetic/Foundations/LocalLanglands/RecTTransport.lean`), and proved as `UpperTheory.Zero.LLC.clBasic`,
`UpperTheory.Zero.LLC.goodSeg` and `UpperTheory.Zero.LLC.twTame` (`ClBasic.lean`, `GoodSeg.lean` and `TwTame.lean` in
`Development/AutomorphicArithmetic/Foundations/LocalLanglands/LocalCentralUnits/`). The class over every
nonarchimedean local field, positive characteristic included, and its stability under subquotients of parabolic
inductions, are this roadmap's, by the route below.

*Route.* Definitions and SR.3.1 (supercuspidal support of subquotients and twists); 6.3 for the last
statement.

*Needs:* 6.1, 6.3; SmoothRepresentationsOfLocalGroups SR.3.1.

### 6.5 The local type statement

*Origin:* adapted from the depth-zero types of Moy and Prasad (1996) and the geometric lemma of Bernstein and Zelevinsky: a
representation with a vector of a given parahoric type of shape `(a, b)` is an irreducible product of a depth-zero and a
twisted spherical representation; for residue fields not of prime order this roadmap's own formulation.

*Method of the formal proof:* the image of the vector in the Jacquet module along the parabolic subgroup of type
`(a, 1, …, 1)` is nonzero by the injectivity of the Jacquet map on vectors of depth zero, and the units of each factor
`GL_1` act on it by `χ`; the filtration of the geometric lemma then gives at least `b` unramified twists of `χ` in the
supercuspidal support. When there are exactly `b`, `π` is a product `π₁ × π₂` by the irreducibility of products with
unlinked supports, and a second use of the geometric lemma, along type `(a, b)`, shows that `π₂ ⊗ χ⁻¹∘det` is spherical
and that the vector comes from `π₁`.

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

Layers 1 and 5; ReductiveGroups §§7h.1, 7h.2 and RepresentationTheory/CharacterTheory §9a.9 (6.1, 6.3); SmoothRepresentationsOfLocalGroups SR.2.1, SR.2.2, SR.3.1 and SR.3a.1 (SR.5.2 for a comparison in a Check of 6.1), with SR.7.1 and SR.7.2 (6.0, 6.1, 6.3); LocalFactorsOfTwistsAndTypes §2.1 (the depth-zero Jacquet comparison); ReductiveGroupsPartII §RG2.3.6 and RG2.4.

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

## Scope and ownership

This sub-roadmap of [RiemannHypothesisForDirichletLFunctions](../README.md) is independently definitive. Its subject is part of
the representation theory of finite groups, and what it uses from the [RepresentationTheory](../../RepresentationTheory/README.md) family is
owned there: class functions, virtual characters, central idempotents and the character table of `GL₂(𝔽_q)` by
[CharacterTheory](../../RepresentationTheory/CharacterTheory/README.md), induction, Mackey and Clifford theory by
[InductionRestriction](../../RepresentationTheory/InductionRestriction/README.md), and partitions, characters of symmetric groups and symmetric
functions by [SchurWeyl](../../RepresentationTheory/SchurWeyl/README.md).

The roadmap owns, in the forms stated here:

- the cases for `GL_n` that [FormalProof] has of the rational Borel pairs and the order of `G^F` (0.1) and of the
  semisimple and regular elements, with the descent of conjugacy (0.3); the classification of primary endomorphisms,
  the splitting along coprime characteristic polynomials, the separable classes and the count of characteristic
  polynomials of invertible matrices (0.4); and the image of a regular unipotent element in a Levi quotient (0.5 (c))
  (Layer 0);
- induction in stages through an inflation and the associativity of the Harish-Chandra product of `GL_n` (1.0),
  cuspidality for `GL_n(𝔽_q)` with the remark of 1.1, the cuspidal support and the Harish-Chandra series of `GL_n(𝔽_p)`
  (1.2), the irreducibility of Harish-Chandra products of pairwise non-isomorphic cuspidal representations (1.3), and
  for `GL_n` the relation of the operators `T_s` of the type-A Hecke algebras to those of the Levi subgroups of relative
  rank one (1.4) (Layer 1);
- regular characters, Gelfand–Graev representations and their multiplicity one (2.1, 2.2; for `GL_n` the case that
  [FormalProof] has), the generic representations of `GL_n(𝔽_q)` (2.3), the lower bound `ψ_{n−1}(q)` for the degree of a
  generic representation of `GL_n(𝔽_q)` and the consequence of 2.4 (d) for the operators `T_s` of 1.4 (2.4), the
  Gelfand–Graev convolution bound (2.5), the Harish-Chandra restriction of the Gelfand–Graev representation of `GL_n(𝔽_p)` to two blocks, the degenerate
  Gelfand–Graev representations of `GL_n(𝔽_q)` with the wider form and the remark of 2.6, and for `GL_n` the
  derivatives of the Gelfand–Graev representation, the Bessel-type induced representations with their decomposition
  into degenerate Gelfand–Graev representations, and their multiplicities in Harish-Chandra induced cuspidal
  representations (2.7, 2.8) (Layer 2);
- the Künneth isomorphism for a proper smooth and a proper scheme (3.2), with the remark of 3.2 (the criteria for filtered
  stratifications and the isotypic form of additivity), the triviality of the action of a connected algebraic group on
  cohomology, the route of the torus fixed-point formula and the finiteness of the stabilisers of a diagonalisable group
  (3.4) (Layer 3);
- the inner products, Harish-Chandra restrictions, degree, irreducibility, cuspidality and values of Green's class
  functions `J_n(θ̃)` of `GL_n(𝔽_q)` (RepresentationTheory/CharacterTheory §9a.8 (b)) (4.4, 4.5, 4.7, 4.9, 4.10), the
  Harish-Chandra restrictions, irreducibility,
  norms and Whittaker dimensions of the products of cuspidal characters of `GL_n(𝔽_p)` (4.5, 4.7, 4.8, 4.11), and the
  remarks of 4.2, 4.10 and 4.11 (Layer 4);
- Green's theory of `GL_n(𝔽_q)` in the forms stated here: the counting lemmas (b), (c) of 5.1 with its wider form (the
  tori of `GL_n`, the Frobenius orbits and the pairs attached to a label), the separation of cuspidal characters by their
  values at regular elliptic elements (5.2), the characteristic map at a squarefree label of `GL_n(𝔽_q)` with the
  multiplicativity of labels over prime fields (5.4), the idempotents of the labels of `GL_n(𝔽_q)`, the single character
  of a squarefree label, and over prime fields the generic constituents of Harish-Chandra products and the bound for the
  number of generic characters (5.7, 5.9), Gelfand–Graev weights, degenerate Gelfand–Graev multiplicities and the shares
  of labels in the Bessel-type induced representations (5.8), the remark of 5.9, the separation of the cuspidal
  representations of `GL₂(𝔽_q)` by their twisted Gauss sums (5.10 (b)), and for Shintani descent the second part of 5.11
  (c) and, in prime degree, the lift of cuspidal characters and of labels (5.11 (d), (e)) (Layer 5);
- the parametrisation of the depth-zero supercuspidal representations of `GL_n(F)` by level-zero characters (6.2), labels
  of depth-zero representations (6.3), the class of representations of depth zero up to twist (6.4), and the local type
  statement (6.5) (Layer 6).

The general theorems of which the sections carrying a `*Corollary of:*` line are corollaries are owned by their homes:
ReductiveGroups §§7.1, 7a.1, 7c.1 and Layers 7d, 7h, 7i and 9F (Layers 0, 1, 2 and 4);
RepresentationTheory/CharacterTheory §§9a.1, 9a.2, 9a.4–9a.10, 9a.12 (0.4, 2.4, 2.7, Layer 4 and Layer 5);
EtaleCohomologyFoundations §F.2.7 (3.2); CharacterSumsOverFiniteFields §3.1a (5.1); SmoothRepresentationsOfLocalGroups
SR.7.1 and SR.7.2 (6.0, 6.1, 6.3). The general statements that the sections stating a form of [FormalProof] cite in a
sentence (0.4, 1.0–1.3, 2.3, 2.6, 3.2, 4.4, 4.5, 4.7–4.11, 5.1, 5.4, 5.7, 5.9), and those of 0.1, 0.3 and 2.2, are owned
by the sections named there, among them ReductiveGroups §§7a.1, 7b.1, 7i.2, 7i.3, 9F.4–9F.11,
RepresentationTheory/CharacterTheory §§9a.1, 9a.6, 9a.9, 9a.10, EtaleCohomologyFoundations §§F.2.5, F.2.5a, F.10.4a and
EtaleDualityAndPerverseSheaves §7.6. The statements of 0.2, 0.5 (a), (b), 1.4 (the presentation of the endomorphism
algebra), 2.4 (a)–(d), 3.1, 3.3, 3.4 (b), (c), 4.1–4.3, 4.6, 5.1 (a), 5.2 but for its separation clause, 5.5, 5.6, the
uniqueness of the label in 4.8 and 5.7, the count of cuspidal characters in 5.9, 5.10 (a), 5.11 (a), (b) and the first part
of (c), and 6.1, which this roadmap restates, are owned by the sections they cite: ReductiveGroups §§7a.2, 7a.3, 7C.6,
7i.1, 9F.1–9F.3 and 9F.6, RepresentationTheory/CharacterTheory §§9a.2, 9a.4, 9a.5 and 9a.7–9a.12,
CharacterSumsOverFiniteFields §3.1a, EtaleDualityAndPerverseSheaves §7.6 and SmoothRepresentationsOfLocalGroups SR.7.2.

It does not own, and consumes by name:

- the finite groups `G^F`, Lang's theorem (surjectivity of the Lang map on points), fixed-coset lifting, rational parabolic and Levi subgroups, the
  Harish-Chandra functors with their adjunctions, Mackey formula and independence of the parabolic, their
  Steinberg-endomorphism extensions and the root-subgroup commutator relations: **ReductiveGroups** Layers 7, 7a–7f,
  7C, 9 and 9E; the centralisers of semisimple elements: **ReductiveGroups** §7.1;
- the rational Borel pairs and maximal tori, the Lang torsor, regular unipotent elements, Harish-Chandra series,
  Gelfand–Graev representations and Deligne–Lusztig induction of every finite reductive group: **ReductiveGroups**
  §§7a.1–7a.3, 7b.1, 7c.1, 7C.6 and Layers 7h, 7i and 9F;
- Green's theory of the characters of `GL_n(𝔽_q)`: **RepresentationTheory/CharacterTheory** Layer 9a;
- the Lefschetz numbers of finite-order automorphisms: **EtaleDualityAndPerverseSheaves** §7.6; the number of monic
  irreducible polynomials over a finite field with its bounds: **CharacterSumsOverFiniteFields** §3.1a;
- the assembled character table and the pinned objects of `GL₂(𝔽_q)`: **RepresentationTheory/CharacterTheory**
  Layer 9, compared in 5.3 and not re-proved;
- tensor induction of virtual characters to an overgroup of prime index, and the virtual characters of norm one on a
  non-trivial coset of a normal subgroup of prime index: **TensorInductionAndFiniteGroupInputs** §§6.1, 6.2, a
  sub-roadmap of this family;
- Iwahori–Hecke algebras of type A and their Specht modules: **TypeAHeckeAlgebras** §§1.1, 1.2; symmetric functions,
  Schur functions, the Frobenius characteristic and characters of symmetric groups:
  **SchurWeyl** Layers 4 and 7;
- compactly supported étale cohomology, its finiteness, Künneth formula, rational realisation, the cohomology of a
  quotient by a finite group and the perfectness of compactly supported cohomology along a free action of a finite
  group: **EtaleCohomologyFoundations** (§§F.2.5a and F.10.4a for the last two);
- compact induction and its irreducibility criterion, Jacquet modules, supercuspidal support and the depth-zero
  representations of `GL_n(F)`: **SmoothRepresentationsOfLocalGroups** (SR.7.1, SR.7.2 for the last); the depth of the
  supercuspidal support and the depth-zero Jacquet comparison:
  **LocalFactorsOfTwistsAndTypes** §2.1, a sub-roadmap of this family;
  Moy–Prasad filtrations and the Cartan and Iwasawa decompositions: **ReductiveGroupsPartII**.

LocalGaloisDeformationRings §2.26.2 constructs the finite `GL` character induction and the level-zero virtual classes
from Deligne–Lusztig character formulas and keeps their degree, sign and restriction identities as part of that target;
for those classes they are cases of the general statements of ReductiveGroups §§7h.2, 7h.3, 9F.2–9F.7 and
RepresentationTheory/CharacterTheory §§9a.4–9a.8, cited in 1.2–1.4, 4.2–4.7 and 5.2–5.6 above.

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
| the Mackey formula for Harish-Chandra functors (1.2, 4.5) | Layer 7d |
| independence of the parabolic for a common Levi subgroup | Layer 7e |
| Steinberg endomorphisms and the extension of 7a–7f | Layer 9E |
| Borel subgroups, maximal tori, Weyl groups, parabolic subgroups, the Bruhat decomposition and its cells, the Tits system | Layer 7 |
| root subgroups and their commutator relations (2.1) | Layers 7C, 9 |
| centralisers of semisimple elements: `C_G(s)°` reductive, generated by a maximal torus through `s` and the `U_α` with `α(s) = 1`, containing every maximal torus through `s` (0.3) | §7.1 |
| rational Borel pairs and the rational Bruhat decomposition, rational maximal tori, the Lang map as a finite étale torsor (0.1, 0.2, 4.1) | §§7a.1–7a.3 |
| parabolic subgroups contained in a parabolic subgroup, transitivity of the Harish-Chandra functors (1.0, 1.4) | §§7b.1, 7c.1 |
| regular unipotent elements and their rational form (0.5) | §§7C.6, 7i.1 |
| cuspidal representations, cuspidal support and Harish-Chandra series, endomorphism algebras (1.1–1.4, 2.4, 4.8, 5.11, 6.1, 6.3) | Layer 7h (§§7h.1–7h.3) |
| regular characters, Gelfand–Graev representations, multiplicity one and generic representations, degenerate Gelfand–Graev representations and Harish-Chandra restriction (2.2, 2.3, 2.6–2.8, 4.11) | Layer 7i (§§7i.1–7i.3) |
| Deligne–Lusztig varieties and characters, Green functions, the character and inner product formulas, Harish-Chandra compatibility, the Steinberg character, degree and irreducibility, Lusztig series, cuspidality, Green functions at regular unipotent elements and Gelfand–Graev characters (Layer 4, 5.2, 5.5, 5.6, 5.11) | Layer 9F (§§9F.1–9F.11) |

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
| the characters of `GL_n(𝔽_q)`: conjugacy classes, the mirabolic subgroup and derivatives, Green's cuspidal characters, the Hecke algebras of Harish-Chandra induced cuspidal representations, the characteristic maps, the parametrisation and degree formula, uniformity and Green's virtual characters, generic and semisimple characters, the counts, the Gauss sums of cuspidal characters and Shintani descent (0.4, 1.4, 2.4, 2.7, Layer 4, Layer 5 and 6.3) | Layer 9a (§§9a.1, 9a.2, 9a.4–9a.12) |

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
| `Λ`, Hall inner product, power sums, Schur functions, Jacobi–Trudi, the Frobenius characteristic `s_μ = Σ_ρ χ^μ(ρ)p_ρ/z_ρ` | Layer 7 (SchurWeyl §§7.5–7.7) |

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
| Künneth with compact supports (3.2) | §F.2.7 |
| finiteness and cohomological dimension | §F.3 |
| rational realisation, with the Künneth formula for rational coefficients (3.2) | §F.4.5 |
| the compactly supported cohomology of a quotient by a finite group as a module (cited in 3.2; 4.1) | §F.2.5a |
| the perfectness of compactly supported cohomology over the group ring of a finite group acting freely on a quasi-projective scheme (cited in 3.2) | §F.10.4a |

### From TauCetiRoadmap.EtaleDualityAndPerverseSheaves

| Use here | Section |
|---|---|
| Lefschetz numbers of finite-order automorphisms: integrality and independence of `ℓ`, additivity, products, the quotient formula, the vanishing for free actions, the Jordan decomposition formula, connected groups, tori and affine fibrations (3.1–3.4; 4.2) | §7.6 (*lefschetzIntegrality*, *lefschetzDevissage*, *lefschetzJordanFormula*, *lefschetzGroupActions*) |

### From TauCetiRoadmap.CharacterSumsOverFiniteFields

| Use here | Section |
|---|---|
| Gauss's formula for the number of monic irreducible polynomials over a finite field and its two bounds (5.1) | §3.1a |

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

| Use here | Section |
|---|---|
| compact induction, Frobenius reciprocity, Jacquet functors | SR.2.1, SR.2.2 |
| the compact-induction irreducibility criterion, cuspidal representations, Harish-Chandra's compactness theorem | SR.3a.1 *compact-induction-criterion*, *cuspidal-representations*, *harish-chandra-compactness* |
| supercuspidal support | SR.3.1 |
| comparison only (Check of 6.1): depth-zero maximal distinguished cuspidal types | SR.5.2 *distinguished-cuspidal-types* |
| the depth-zero Jacquet comparison and the depth of the cuspidal support; the depth-zero supercuspidal representations of `GL_n(F)` (6.0, 6.1, 6.3) | SR.7.1 *depth-zero-jacquet*, *depth-zero-support*; SR.7.2 *depth-zero-supercuspidals* |

### From LocalFactorsOfTwistsAndTypes, a sub-roadmap of this family

| Use here | Section |
|---|---|
| the depth of the supercuspidal support (a); the invertibility of the contracting Hecke operator (c) and the depth-zero Jacquet comparison `(π^{G_{x,0+}})^{N∩G_{x,0}} ≅ (π_N)^{M_{x,0+}}` for every admissible `π`, injective for every smooth `π` (d) | §2.1 |

## References

- P. Deligne, G. Lusztig, *Representations of reductive groups over finite fields*, Ann. of Math. 103 (1976),
  103–161: Layer 3 (§3); 4.1–4.3 and 4.6 (§§1, 4, 7); 4.11 (§10); the cuspidal characters of 5.2; 0.2, 5.1, 5.6, 5.7.
- F. Digne, J. Michel, *Representations of finite groups of Lie type*, LMS Student Texts 21 (1991); second
  edition, LMS Student Texts 95 (2020): 2.2 (multiplicity one for every `G`, cited), 4.3 and 4.6 (the statements for
  every Steinberg endomorphism), the first remark of 4.11 (Chapter 12).
- R. W. Carter, *Finite groups of Lie type: conjugacy classes and complex characters* (1985): 0.1, 4.3; 5.1.
- O. Dudas, J. Michel, *Lectures on finite reductive groups and their representations* (2015): Layers 0–1; 3.1–3.4,
  4.1, 4.2.
- C. W. Curtis, *The Steinberg character of a finite group with a (B,N)-pair*, J. Algebra 4 (1966): 4.6(b) (the
  restriction of the Steinberg character to a Sylow `p`-subgroup).
- L. Solomon, *The orders of the finite Chevalley groups*, J. Algebra 3 (1966): 4.6(a), (c) (the alternating sum
  over parabolic subgroups of a Coxeter group).
- R. Steinberg, *Regular elements of semisimple algebraic groups*, Publ. Math. IHÉS 25 (1965): 0.3, 0.5.
- J. A. Green, *The characters of the finite general linear groups*, Trans. AMS 80 (1955), 402–447: 0.4; 2.4 (c);
  4.4, 4.7, 4.8, 4.10 (his class functions of `GL_n(𝔽_q)`); 5.1, 5.2, 5.4–5.6, 5.8, 5.9 (with the basic characters of
  5.6(b)).
- T. Shintani, *Two remarks on irreducible characters of finite general linear groups*, J. Math. Soc. Japan 28 (1976):
  5.11 (Shintani descent).
- I. M. Gelfand, M. I. Graev, *Construction of irreducible representations of simple algebraic groups over a
  finite field*, Dokl. Akad. Nauk SSSR 147 (1962): 2.2, 2.3, 2.5.
- S. I. Gelfand, *Representations of the full linear group over a finite field*, Mat. Sb. 83(125) (1970), 15–41;
  Math. USSR Sb. 12 (1970), 13–39: 2.4
  (cuspidal representations restricted to the mirabolic subgroup); 2.5, 4.8, 4.9, 5.7.
- R. Steinberg, *Lectures on Chevalley groups*, Yale (1968): 2.2, 2.3 (multiplicity one for every `G`, cited); *Endomorphisms of linear algebraic groups*,
  Mem. AMS 80 (1968): Steinberg endomorphisms, 0.1, 4.1.
- R. B. Howlett, G. I. Lehrer, *Induced cuspidal representations and generalised Hecke rings*, Invent. Math.
  58 (1980), 37–64: 1.3–1.4.
- N. Iwahori, *On the structure of a Hecke ring of a Chevalley group over a finite field*, J. Fac. Sci. Univ.
  Tokyo 10 (1964): 1.4.
- A. V. Zelevinsky, *Representations of finite classical groups: a Hopf algebra approach*, LNM 869 (1981): 2.4,
  2.6(c), 2.7 (a) (the norm of `Γ_n`), 4.5, 4.7, 4.8, 5.4, 5.7, 5.8(b).
- T. Kondo, *On Gaussian sums attached to the general linear groups over finite fields*, J. Math. Soc. Japan 15
  (1963): 5.10(a).
- I. Piatetski-Shapiro, *Complex representations of GL(2, K) for finite fields K*, Contemp. Math. 16 (1983): 5.10(b)
  (Bessel functions of `GL₂(𝔽_q)`).
- I. M. Gelfand, D. Kazhdan, *Representations of the group GL(n, K) where K is a local field*, in Lie groups and
  their representations (1975): 2.4, 2.7.
- I. N. Bernstein, A. V. Zelevinsky, *Representations of the group GL(n, F) where F is a nonarchimedean local
  field*, Russian Math. Surveys 31 (1976): 2.4, 2.7 (the derivative formalism).
- G. Lusztig, B. Srinivasan, *The characters of the finite unitary groups*, J. Algebra 49 (1977): 5.1 (the pairs
  attached to a label), 5.6 (uniformity).
- I. G. Macdonald, *Symmetric functions and Hall polynomials*, second edition (1995), Ch. I §3 and Ch. IV: 5.5
  (the `q`-hook formula), 0.3, 0.4, 5.1, 5.4.
- M. Demazure, A. Grothendieck, *Schémas en groupes* (SGA 3), Exp. IX–X: 3.4(d).
- A. Moy, G. Prasad, *Unrefined minimal K-types for p-adic groups*, Invent. Math. 116 (1994); *Jacquet functors
  and unrefined minimal K-types*, Comment. Math. Helv. 71 (1996): 6.0, 6.1, 6.3, 6.5.
- C. J. Bushnell, G. Henniart, *The local Langlands conjecture for GL(2)* (2006), §11: 6.1 and 6.2, the case
  `n = 2`.
- C. J. Bushnell, G. Henniart, *The essentially tame local Langlands correspondence, I*, J. Amer. Math. Soc. 18
  (2005), 685–710: 6.2 (its case of level zero).
- H. Carayol, *Représentations cuspidales du groupe linéaire*, Ann. Sci. ENS (4) 17 (1984), 191–225: 6.1.
- J.-F. Dat, *Finitude pour les représentations lisses de groupes p-adiques*, J. Inst. Math. Jussieu 8 (2009), 261–333:
  6.0, 6.3.
- Harish-Chandra, *Eisenstein series over finite fields*, in Functional Analysis and Related Fields (ed. F. E. Browder),
  Springer (1970), 76–88: 1.1, 1.2.
- T. A. Springer, *Cusp forms for finite groups*, in Seminar on Algebraic Groups and Related Finite Groups, Lecture Notes
  in Math. 131 (1970), C1–C24: 1.1, 1.2, 4.8.
- F. Digne, G. I. Lehrer, J. Michel, *The characters of the group of rational points of a reductive group with
  non-connected centre*, J. reine angew. Math. 425 (1992), 155–192: 0.5, 2.2, 2.6.
- J. Brundan, R. Dipper, A. Kleshchev, *Quantum linear groups and representations of GL_n(F_q)*, Mem. Amer. Math.
  Soc. 149 (2001), no. 706: 2.7, 5.5.
- T. A. Springer, A. V. Zelevinsky, *Characters of GL(n, F_q) and Hopf algebras*, J. London Math. Soc. (2) 30 (1984),
  27–43: 4.5, 4.9.
- D. Grinberg, V. Reiner, *Hopf algebras in combinatorics*, arXiv:1409.8356v7: 4.8.
- N. Kawanaka, *Shintani lifting and Gelfand–Graev representations*, Proc. Symp. Pure Math. 47 (1987), 147–163: 5.11
  (the lift of a cuspidal character).
- Lang, *Algebraic groups over finite fields*, Amer. J. Math. 78 (1956), 555–563: 4.1.
- L. Lovász, *Operations with structures*, Acta Math. Acad. Sci. Hungar. 18 (1967), 321–328: 0.3 (the cancellation of
  direct powers by counting homomorphisms).
- Rosen, *Number theory in function fields*, Graduate Texts in Math. 210 (2002): 5.1.
- Bary-Soroker, Koukoulopoulos, Kozma, *Irreducibility of random polynomials: general measures*, Invent. Math. (2023),
  arXiv:2007.14567: 5.1.
- The Stacks Project, Lemma 59.97.2 (the Künneth formula in étale cohomology): 3.2.
- [FormalProof] Levent Alpöge, the Lean formalization of the Riemann hypothesis and of the Riemann hypothesis for Dirichlet L-functions
  announced in [Announcement]; source with a public verification setup:
  <https://github.com/leanprover-community/riemann-hypothesis>. Source of the statements of 2.7 (b), (c) (the Bessel-type
  decomposition and the inequality), of 2.8 (a), (b) and the first form of 2.8 (c) (the multiplicities of the Bessel-type
  characters in Harish-Chandra induced cuspidal representations and their near-constancy over several places), of the
  lower bound of 5.8 (c), of 5.11 (e) in the form stated (the lift of labels in prime degree), and of 6.5 (the local type
  statement, for residue fields of prime order).
- [Announcement] Levent Alpöge, the announcement of that proof, 20 November 2026: <https://alpo.ge/remark.pdf>.
