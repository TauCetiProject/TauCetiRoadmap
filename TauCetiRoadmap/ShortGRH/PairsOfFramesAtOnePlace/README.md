# Roadmap: pairs of frames at one place

**Summary.** The roadmaps of the family `ShortGRH` prove the Riemann hypothesis for Dirichlet L-functions by one
route ([index of the family](../README.md)). Its spanning theorem, Theorem B, rests on a second moment of Poincaré
series on a unitary group `G` with `ϱ` hyperbolic planes, unfolded along a Bessel subgroup
([SecondMomentsOfPoincareSeries](../SecondMomentsOfPoincareSeries/README.md)). After unfolding, the second moment is a
sum of products of local quantities: at each place, inner products of orbital integrals `∫ W(y) ⊗ W(γ⁻¹y)^* dy` of a
Bessel function `W` at elements `γ = w_p x` of the big cell, indexed by heads `p = (p₀, …, p_ϱ)`. This roadmap proves
the
local estimates for these quantities, at a real place and at a finite set of finite places read as one ring, by one
argument. An inner product of two orbital integrals is an integral over a position `x` and two frames, the images of
the frame `(e₀, …, e_{ϱ−1}, z)` under two points of the group. The headline theorems are: at the complex place, the cut
of a normalised Bessel function has the local bounds that the sieve of
[RemainingAndMainTermsOfSecondMoments](../RemainingAndMainTermsOfSecondMoments/README.md) reads (decay in the
frequency and for unequal entries of the two heads, a bound `(1 + b^{−10})/deg` for the mass, a continuous positive top
form); at the finite places, the same decay for the Bessel vector of a group `Z` between the principal congruence
subgroup and the integral points, the bound `ϰ(Z) ≤ vol(Z)·vol(K(M))·(vol(Z) + Q^{−t})` for its mass integral, the
density at the last entry with its positivity and its descent, and a gain `b^{−6k}` in the mass integral for each
chosen place at which `Z` fixes a given vector.

The estimates are organised by floors: floor `l` chooses the frame vector `f_l` on a quadric and an element of a
Heisenberg group along it. A place enters only through a place datum (measures of the floors, a level, a compact
box, close pairs of vectors) and a gauge (a filtration of the ring by sizes with one constant `Λ` whose powers bound
all losses). The gains come from Plancherel's formula on quadrics: a frequency, two different heads, or a deep
vector, one that is long from both points, each save a power. Positions are cut into shells by their height, and the
gain of a deep vector pays for the loss on the high shells.

The roadmap covers the folder `New/Spanning/Frames` of `[ShortProof]` (22 files) in Layers 1 to 7, and in Layer 8, a
supplement independent of the others, the folder `New/Appendix/DiscreteSeries` (9 files): steep parameters and
lower bounds for periods of discrete series coefficients with a large gap by Laplace's method. It builds on
SecondMomentsOfPoincareSeries for the group, its frame and Bessel subgroups, Bessel functions and filling data. It
feeds SecondMomentsOfPoincareSeries (the local bounds at `ℂ`; a point at which the Bessel period is large),
RemainingAndMainTermsOfSecondMoments (place data at the finite places, the finite Bessel vector, the scaled orbital
integral, the density at the last entry, mass ratios, the gain from fixed vectors) and
[DeterminantsOfThetaLiftChains](../DeterminantsOfThetaLiftChains/README.md) (steep parameters; the pairing of two steep
coefficients).

Layer 1 defines sizes, lengths and balanced frames. Layer 2 defines place data, the measures of the floors, gauges
and correlations, and proves the volume and Plancherel estimates on quadrics. Layer 3 proves the abstract estimates
for the forms of the floors. Layer 4 applies them at the complex place and Layer 5 at the finite places. Layer 6
treats the top floor at the finite places through the last entry. Layer 7 proves the gain from fixed vectors. Layer 8
is the supplement on discrete series.

## Conventions and notation

**Roadmaps and sources.** A roadmap name of the family `ShortGRH` refers to that roadmap; every other roadmap name
refers to the roadmap of that name in the family `RiemannHypothesisForDirichletLFunctions`, unless an area is named.
Citations are by section number, `Name §k.n`; bare numbers are sections of this roadmap. `ShortGRH background (…)` names
a result that the family uses and that no roadmap section states; it is given in the form used, with the file and
declaration of `[ShortProof]` that proves it. `[ShortProof]` is the formal proof that the family follows; the pointer
line of a section names the file under its directory `src/` and the declarations that prove the statement. The labels
`*Origin:*`, `*Method of the formal proof:*` and `*Needs:*` are those of the [index of the family](../README.md).

**The shape and the group.** A shape `𝔰` is that of SecondMomentsOfPoincareSeries §3.1: `ϱ ≥ 0`, a finite set `κ` with
`k`
elements and `k₀ ∈ κ`; `n = ϱ + 1` and `r = k + 2ϱ + 1`. For a commutative ring `A` with involution `x ↦ x̄`, the split
form
has the basis `e_a` (`a < ϱ`), the middle block (the `x_i`, `i ∈ κ`, and `z`), `e*_a` (`a < ϱ`), with `⟨e_a, e*_b⟩ =
δ_{ab}`, a
hermitian Gram matrix on the middle block, and all other products of basis vectors `0`; `J` is its Gram matrix and `G`
its unitary group over `A`, written in this basis. In Layers 4 to 7 the middle block is the one of
SecondMomentsOfPoincareSeries §3.1 (over `ℂ`) or §4.1 (in the lattice basis, with `⟨z, z⟩ = −N`). The frame is
`f = (f₀, …, f_ϱ) = (e₀, …, e_{ϱ−1}, z)`. A basis vector has floor `a` if it is `e_a` or `e*_a`, floor `ϱ` if it is `z`,
and
floor `ϱ + 1` otherwise; `V_l` is the span of the basis vectors of floor at least `l`.

**Floor groups.** `G^(l)` is the fixer in `G` of the basis vectors of floor below `l` (so `G^(0) = G`, and `G^(l)` is
trivial
for `l ≥ ϱ + 2`). `U_(<l)` is the group of the isometries that are unitriangular for the flag `⟨e₀⟩ ⊂ ⋯ ⊂ ⟨e₀, …,
e_{l−1}⟩` and
act trivially on `V_l` modulo that flag; `N_l = G^(l) ∩ U_(<l+1)`; `R^(l)` is the group of the isometries `g` such that
`g f_a − f_a` lies in the span of `f₀, …, f_{a−1}` for `a < l` (`l ≤ ϱ + 1`). `𝖴 = U_(<ϱ)` is the unipotent group of
SecondMomentsOfPoincareSeries §3.1 and `H` the fixer of the basis vectors outside `κ`. `σ₀(g)` is the sum of the
entries of `g` just above the diagonal on the frame. `Y^(l)` is the quotient of the vectors orthogonal to `e_b`, `b <
l`, by
the span of these `e_b`.

**Measures.** Integrals of nonnegative functions take values in `[0, ∞]`. `μ ∗ ν` is the convolution of measures on
`G`, the image of `μ × ν` under multiplication. A family of measures `(μ_β)` disintegrates a measure `μ` along a map `q`
if
`μ = ∫ μ_β dβ` and `μ_β` is carried by `q⁻¹(β)`.

### Table of symbols

| Symbol | Meaning | Defined |
|---|---|---|
| `𝔰, ϱ, κ, k, n, r` | shape, hyperbolic planes, index set of `X₀`, its rank, `ϱ + 1`, `k + 2ϱ + 1` | SecondMomentsOfPoincareSeries §3.1 |
| `G, J, f, V_l, Y^(l)` | unitary group, Gram matrix, frame, floors, quotients along the frame | Conventions |
| `G^(l), U_(<l), N_l, R^(l), 𝖴, H, σ₀` | floor groups, Bessel subgroups, superdiagonal sum | Conventions |
| `A_(i)`, size, `L` | numbers of size `i`, the scale | 1.1 |
| `w_p`, head | Weyl element of a sequence of units, adapted sequence | 1.2 |
| `A, τ, δ, ψ, c_P, O` | a place: ring, trace-one element, skew unit, character, Plancherel constant; integers | 2.1 |
| `ν(v, β), η_l` | Heisenberg element and measure | 2.1 |
| `F, M, K, θ_l, μ_H, 𝖬, 𝗆_j, θ_{≥l}` | place datum, level, box, floor measures, measure of `H`, of the group, of the floors below `j`, from `l` on | 2.2 |
| near, stable, `𝔡_a`, depth, `p, X′, s, r_l` | nearness, stability, product sets, depth, block rank, free part, volume exponent, Heisenberg rank | 2.2 |
| `Γ, Λ`, position ball | gauge, its loss, close positions | 2.3 |
| `k_j` | partial correlation from floor `j` on | 2.3 |
| `κ_j(p, q), 𝓘_j, 𝖥_j, ‖k‖²` | head density, form of floor `j`, its `L¹` version, norm of the correlation | 3.2 |
| `Π_j(p, q; x)`, gain | product of second moments, gain of a function at a position | 3.3 |
| shell, `𝒩(W)` | set of positions of bounded height, unit of integrals over positions | 3.5 |
| `c_𝖬, c_form, Θ_𝔰, ℓ, hw_j` | Haar ratio at `ℂ`, normalising constant, constants of the local bounds | 4.1, 4.2; SecondMomentsOfPoincareSeries §3.3 |
| `K(g)`, lattice datum | congruence subgroup, place datum of the integral lattice | 5.1 |
| `χ_M, Z, W_Z, fl, m(Z), ϰ(Z)` | finite Bessel function, intermediate group, Bessel vector, unipotent mass, mass ratio, mass integral | 5.2 |
| `μ_t, P_t` | fiber measure of a sphere, embedding by the last entry | 6.1 |
| `𝒪_Z(p, l), FP_Z, J^Z_top, HS_Z` | scaled orbital integral, fiber pairing, density at the last entry, head sums | 6.2, 6.3 |
| `μ_l, c_l`, steep, Laplace datum, `θ` | lowest `K`-type, coefficient, steep parameters, data and integrand of Laplace's method | 8.1 |
| position, `R_v`, `σ` | position of `U(η)` in `U(ε)`, its group, its additive sum | 8.5, 8.6 |

## Layer 1: Sizes, lengths and balanced frames

One filtration of the ring measures numbers, vectors and matrices on one scale, in the same way at a real place and
at the finite places. It gives the length of a vector at a point of the group, the induced length on the quotients
`Y^(l)` along the frame, balanced frame vectors, and the comparison of the lengths at two points.

### 1.1 Sizes of numbers, vectors and matrices

*Origin:* definitions and conventions.

*Method of the formal proof:* definitions; the lemmas are the rules of a size applied entry by entry.

Let `A` be a commutative ring with involution and `G` the unitary group over `A` of a split form of a shape
(Conventions), with Gram matrix `J`. A size for `G` is a family of subsets `A_(i) ⊂ A`, `i ≥ 0` (the numbers of size
`i`), such that:

- `A_(i)·A_(j) ⊂ A_(i+j)`;
- a sum of at most `r + 1` numbers of size `i` has size `i + 1`, where `r` is the rank of the space;
- `x ∈ A_(i)` if and only if `−x ∈ A_(i)`, and if and only if `x̄ ∈ A_(i)`;
- `0` and `1` have every size;
- the entries of `J` and of `J⁻¹` have size `1`.

A vector or a matrix has size `i` if all its entries have. Prove: the product of a matrix of size `i`, with rows and
columns indexed by the basis, and a vector or matrix of size `j` has size `i + j + 1`.

The two cases in view: at a real place, `A_(i) = {x : |x| ≤ L^i}` for a fixed number `L` (4.1); at the finite places,
`A_(i) = {x : α^i x integral}` for a fixed integral unit `α` (5.2).

*Needs:* SecondMomentsOfPoincareSeries §3.1, §4.1.

[ShortProof], `New/Spanning/Frames/Lengths.lean` (`New.Floors.Size`, `New.Floors.Size.vecsOfSize`,
`New.Floors.Size.HasMatrixSize`, `New.Floors.Size.HasMatrixSize.mono`)

### 1.2 Lengths at a point, induced lengths and balanced frame vectors

*Origin:* particular to this proof: lengths of vectors read at a point of the group through a size, on the quotients
of the isotropic flag of the frame; a short dual stands for a lower bound on the length at a real place and for
primitivity at the finite places.

*Method of the formal proof:* definitions; the quotient of two Weyl elements is computed on the basis.

Let `S` be a size for `G`. For `0 ≤ l ≤ ϱ`, `Y^(l)` is the quotient of the vectors orthogonal to `e_b`, `b < l`, by the
span
of these `e_b`; a vector `ω` is orthogonal below `l` if `⟨e_b, ω⟩ = 0` for `b < l`, and two vectors are congruent below
`l` if
they differ by an element of that span.

(a) A vector `y` has length at most `L^i` at `g ∈ G` if `g⁻¹y` has size `i`. Its class has induced length at most `L^i`
at
`g` on `Y^(l)` if some vector congruent to `y` below `l` has length at most `L^i` at `g`.

(b) The frame vector `e_a` (`a < ϱ`) is balanced at `g` with bound `L^i` if its class in `Y^(a)` has induced length at
most `L^i` at `g`, and some `ζ` orthogonal below `a` with `⟨e_a, ζ⟩ = 1` (a dual of `e_a`) has length at most `L^i` at
`g`.

(c) For a sequence of units `p = (p_a)` and `j ≤ ϱ`, the Weyl element `w_p` of length `j` sends `e_a ↦ p_a e*_a` and
`e*_a ↦ p̄_a⁻¹ e_a` for `a < j` and fixes the other basis vectors. Prove: `w_q⁻¹w_p` is diagonal, with entries
`p_a/q_a` at `e*_a` and `q̄_a/p̄_a` at `e_a` for `a < j`. The sequence `p` is a head of length `j` for `S` if the
inverses of
the products `p₀⋯p_{l−1}`, `l ≤ j`, have size `1`.

(d) For a unit `ρ` of `A` and `g, g′ ∈ G`: the lengths at `g` and `g′` differ by at most `L^t` on `Y^(l)` modulo `ρ` if
every
vector orthogonal below `l` of length at most `L^i` at `g` agrees modulo `ρ`, up to size `i + t`, with a lift of its
class read at `g′`. The vector `e_a` has a short dual of exponent `i` for `(g, g′)` modulo `ρ` if some dual `ζ` of `e_a`
in
`Y^(a)` has length at most `L^i` at `g` and, read at `g`, agrees modulo `ρ` up to size `i` with a lift of its class read
at
`g′`.

*Needs:* 1.1; SecondMomentsOfPoincareSeries §3.1.

[ShortProof], `New/Spanning/Frames/Lengths.lean` (`New.Floors.weylRatio`, `New.Floors.coe_weylRatio`,
`New.Floors.IsOrthogonalBelow`, `New.Floors.CongrBelow`, `New.Floors.Size.LengthLeAt`,
`New.Floors.Size.InducedLengthLe`, `New.Floors.Size.IsBalanced`, `New.Floors.Size.GaugesDifferLe`,
`New.Floors.Size.HasShortDual`, `New.Floors.Size.IsHead`)

### 1.3 Comparing the lengths at two points; minors and heads

*Origin:* particular to this proof: if the lengths at two points differ little on `Y^(l)`, and `e_{l−1}` has short lifts
at both points and a short dual that looks nearly the same from both, then they differ little on `Y^(l−1)`; over a
head such duals come from determinants of blocks of the isometries.

*Method of the formal proof:* a vector of `Y^(l−1)` is split along `e_{l−1}` and its dual; the component in `Y^(l)` is
compared by hypothesis and the coefficient through the dual. Over a head, Cramer's rule writes the duals as quotients
of minors of the matrix of products `⟨f_a, γ f_b⟩`, whose leading minors are the products of the entries of the head.

Let `S` be a size, `ρ` a unit of size `1` with `ρ̄ = ρ`, and `g, g′ ∈ G`. Prove:

(a) let `a < ϱ`. If the class of `e_a` in `Y^(a)` has induced length at most `L^c` at `g` and at `g′`, `e_a` has a short
dual
of exponent `c` for `(g, g′)` modulo `ρ`, and the lengths at `g` and `g′` differ by at most `L^t` on `Y^(a+1)` modulo
`ρ`, then
they differ by at most `L^{t+4c+12}` on `Y^(a)` modulo `ρ`;

(b) if the hypotheses of (a) on `e_a` hold for all `a < j ≤ ϱ` and the lengths differ by at most `L^t` on `Y^(j)` modulo
`ρ`,
then they differ by at most `L^{t+(4c+12)j}` on the whole space `Y^(0)` modulo `ρ`;

(c) if the lengths at `g` and `gx` differ by at most `L^i` on `Y^(0)` modulo `ρ`, then `(x − 1)/ρ` has size `i + 4`;

(d) if `ξ, ξ′` lie in the group `R^(l)` and `ξg`, `ξ′γ⁻¹g` have size `1`, then the leading minors of order at most `l`
of the matrix `(⟨f_a, γf_b⟩)_{a,b}` of the products of the frame vectors have size `9n`, `n = ϱ + 1`;

(e) let `K` be a set of isometries of size `1`, `j ≤ ϱ`, and `p` a head of length `j`. If `ηw_p⁻¹g ∈ K` for some `η ∈
R^(j)`, and
`sg ∈ K` for some `s` that lies in `R^(j)` and in `U_(<j)`, then `g` has size `60n²` and `w_p⁻¹g` has size
`99n²`.

*Needs:* 1.1, 1.2.

[ShortProof], `New/Spanning/Frames/TwoGauges.lean` (`New.Floors.Size.leadingMinor_mem_ofSize`,
`New.Floors.Size.GaugesDifferLe.of_succ`, `New.Floors.Size.GaugesDifferLe.on_whole_space_of_hasShortDual`,
`New.Floors.Size.GaugesDifferLe.hasMatrixSize_sub_one`, `New.Floors.Size.head_prod_mul_dual_mem_ofSize`,
`New.Floors.Size.head_products_mem_ofSize`, `New.Floors.Size.dual_mem_vecsOfSize`,
`New.Floors.Size.head_entries_mem_ofSize`, `New.Floors.Size.hasMatrixSize_weylElem_inv`,
`New.Floors.Size.hasMatrixSize_inv_of_mem_unipotentBelow`, `New.Floors.Size.hasMatrixSize_of_isHead`)

## Layer 2: Place data, floor measures, correlations and quadrics

A place datum fixes a level, a compact set of the group and a basis adapted to the frame; the measure of the group is
built floor by floor from measures on quadrics and on Heisenberg groups. A gauge collects the few facts about a place
that the estimates use. A correlation is a kernel on pairs of points with a character law; integrating it over the
floors from `l` on gives the partial correlations. The equation of a quadric is solved in a block of orthonormal
coordinates, and Plancherel's formula acts on the orthonormal coordinates off two such blocks.

### 2.1 Places, floor groups and the measures of the floors

*Origin:* adapted from the published theory of isotropic flags in unitary groups and of Haar measure in the
coordinates of a flag (Knapp, *Lie groups beyond an introduction*; Helgason, *Groups and geometric analysis*, Ch. I
§5): here over a locally compact ring with involution, with the measures of the floors as the factors.

*Method of the formal proof:* definitions; the group `N_a` is a Heisenberg group parametrised by Eichler
transformations, and `u ↦ ue*_a` maps it bijectively onto the isotropic vectors `y` of `V_a` with `⟨e_a, y⟩ = 1`.

(a) A place is a commutative ring `A` with a continuous involution, locally compact and second countable as a
topological ring, with a Haar measure (the volume), an element `τ` with `τ + τ̄ = 1`, a unit `δ` with `δ̄ = −δ`, a Haar
measure on the skew elements such that `(a, b) ↦ τδ⁻¹a + b` carries the product of two copies of it to the volume, a
multiplicative measurable modulus `|·| : A → [0, ∞]`, a continuous additive character `ψ`, and a constant `c_P` that
bounds the `L¹` norm of the Fourier transform of the kernel in Plancherel's inequality on `A^ι`. A finite place is a
place with a compact open subring `O` (the integers) that contains `τ`, `δ` and `δ⁻¹`, is self-dual for `ψ`, has skew
part
of measure `1`, with `c_P = 1` and `|x|` the inverse of the generalised index of `xO` in `O`.

(b) Let `G` be the unitary group of the split form of a shape over a place `A` (Conventions), with basis `e_a`, the
middle block, `e*_a` (`a < ϱ`) and frame `f = (e_0, …, e_{ϱ−1}, z)`. `V_l` is the span of the basis vectors of floor at
least `l`, where `e_a`, `e*_a` have floor `a`, `z` has floor `ϱ` and the other middle vectors floor `ϱ + 1`. The floor
groups `G^(l)`, `U_(<l)`, `N_l`, `R^(l)`, `𝖴` and `H` are those of the Conventions. For `a < ϱ`, `N_a` consists of the
elements `ν(v, β)`: `e*_a ↦ e*_a + v + (β − τ⟨v, v⟩)e_a`, with
`v ∈ V_{a+1}` and `β` skew.

(c) The Heisenberg measure `η_l` is, for `l < ϱ`, the image of (volume of `V_{l+1}`) × (skew measure) under `ν`, and the
unit mass at `1` otherwise. A hyperbolic basis of the middle space, with `m` further pairs and orthonormal part indexed
by `ι`, is a basis of `V_ϱ` whose Gram matrix is the sum of `m + 1` hyperbolic planes and the identity on `ι`, for a
form
whose determinant has modulus `1`. With it, the quadric measure of floor `b` is the measure on the quadric
`{y ∈ V_b : ⟨y, y⟩ = ⟨f_b, f_b⟩}` that disintegrates the volume of `V_b` along `y ↦ ⟨y, y⟩`.

*Needs:* SecondMomentsOfPoincareSeries §3.1, §4.1; ShortGRH background (floor groups, Heisenberg parametrisation,
measures of quadrics that disintegrate Haar measure, and Plancherel's inequality at a place; [ShortProof]
`Lib/DiscreteSeries/Bruhat/FloorGroups.lean`, `Lib/DiscreteSeries/Bruhat/FloorMeasures.lean`
(`New.Floors.HyperbolicBasis.isDisintegration_floorVolume`, `New.Floors.Place.plancherel_inequality`),
`Lib/General/Measure/QuadricDisintegration.lean` (`New.Floors.Place`)).

[ShortProof], `Lib/General/Measure/QuadricDisintegration.lean` (`New.Floors.Place`);
`Lib/SiegelWeil/OneVector/FinitePlaceDensity.lean` (`New.Floors.IntegralPlace`);
`Lib/DiscreteSeries/Bruhat/FloorMeasures.lean` (`New.Floors.TraceOne.heisenbergElem`,
`New.Floors.Place.heisenbergMeasure`, `New.Floors.HyperbolicBasis`,
`New.Floors.HyperbolicBasis.floorQuadricMeasure`)

### 2.2 Place data, the measure of the group, near points and depth

*Origin:* particular to this proof: the data of one place for the estimates of pairs of frames, the measure of the
group as a convolution over the floors, and the depth of a frame vector at two points.

*Method of the formal proof:* definitions; the invariance in (b) follows floor by floor from the invariance of the
quadric measures under the floor groups and of the Heisenberg measures under `N_l`.

(a) A place datum `F` for `G` consists of a hyperbolic basis (2.1 (c)); an s-finite measure `θ_top` carried by `G^(ϱ)`
whose image under `σ ↦ σ⁻¹f_ϱ` is the quadric measure of the top floor; a nonzero s-finite measure `μ_H` carried by `H`,
invariant under right translation by `H`, with `μ_H{h : hg ∈ 𝖴K} ≤ 1` for every `g`; a unit `M` with `M̄ = M` (the
level);
a set of close pairs `(ω₁, ω₂)` of vectors, open, containing `0`, with compact closure; a compact set `K ⊂ G` (the box);
and a measurable set of positions in `G`.

(b) The floor measure `θ_l` on `G^(l)`: for `l ≤ ϱ` its image under `σ ↦ σ⁻¹f_l` is the quadric measure of floor `l`
(for
`l < ϱ` it is carried by the big cell, the `σ` with `⟨e_l, σ⁻¹e_l⟩` invertible); `θ_{ϱ+1} = μ_H`; higher floors carry
the
unit mass at `1`. The measure of the group is `𝖬 = (η_{ϱ+1}∗θ_{ϱ+1})∗⋯∗(η₀∗θ₀)`; `𝗆_j` is the convolution of the factors
of the floors below `j`; and `θ_{≥l} = θ_{ϱ+1}∗⋯∗θ_l` integrates functions on `G^(l)` that are left invariant under
`𝖴 ∩ G^(l)`. Prove: the convolution of the factors of the floors from `l` on is invariant under right translation by
`G^(l)`.

(c) A point `g` is near at `j` if `R^(j)g` meets `K`. A vector `ω` is short from `g` and `g′` if `(g⁻¹ω, g′⁻¹ω)` is a
close
pair. The class of `ω` in `Y^(l)` is stable at `g` and `g′` if `ω` is orthogonal below `l` and `(g⁻¹ω, g′⁻¹ω′)` is a
close pair
for some `ω′` that agrees with `ω` at the indices of floor at least `l`. `𝔡_a(x, y)` is the set of the products `⟨e_a,
ω⟩`
with `ω` stable in `Y^(a)` at `x` and `xy`; the depth of `e_a` at `x` and `xy` is `1/vol 𝔡_a(x, y)`.

(d) The block rank is `p = 2m + 2`; `X′` is the span of the first `#ι − 2p` orthonormal basis vectors, and `y_X` the
vector
of the products of these with `y`; the volume exponent is `s = dim X′ − (3n + 1 + m)`, `n = ϱ + 1`; the depth weight of
length `j` at `(x, xy)` is `∏_{a<j} depth_a(x, y)^{−s}`. The floor modulus is `|g|^{r_l+1/2}` with
`r_l = k + 1 + 2(ϱ − (l + 1))` the rank of the vector part of `N_l` (by default `g = M`). For a function `c ≥ 0` and a
number `B`, "the mass of `c` on floor `j` is at most `B`" means that for every `g` the integral of `c(σg)` for `θ_j`,
over the
`σ` with `σg` near at `j + 1`, is at most `B`.

*Needs:* 1.2, 2.1.

[ShortProof], `New/Spanning/Frames/Levels.lean` (`New.Floors.PlaceData`, `New.Floors.PlaceData.floorMeasure`,
`New.Floors.PlaceData.partialGroupMeasure`, `New.Floors.PlaceData.groupMeasure`,
`New.Floors.PlaceData.quotientMeasureFrom`, `New.Floors.PlaceData.partialGroupMeasure_mconv_dirac`,
`New.Floors.PlaceData.IsNear`, `New.Floors.PlaceData.blockRank`,
`New.Floors.PlaceData.FreeIndex`, `New.Floors.PlaceData.orthonormalPart`, `New.Floors.PlaceData.IsShortFrom`,
`New.Floors.PlaceData.IsStable`, `New.Floors.PlaceData.stableProducts`, `New.Floors.PlaceData.depth`,
`New.Floors.PlaceData.volumeExponent`, `New.Floors.PlaceData.depthWeight`,
`New.Floors.PlaceData.commonVectors`, `New.Floors.PlaceData.productDifferences`,
`New.Floors.PlaceData.IsCommonBound`, `New.Floors.PlaceData.floorModulus`, `New.Floors.PlaceData.upperGram`);
`New/Spanning/Frames/Correlations.lean` (`New.Floors.PlaceData.FloorMassLe`, `New.Floors.PlaceData.IsNear.anti`)

### 2.3 Gauges, pairing kernels and partial correlations

*Origin:* particular to this proof: the axioms through which a scale is used at either kind of place, and the kernels
whose correlations are estimated.

*Method of the formal proof:* definitions. For (d), a point near at `j` has, after an element of `R^(j)`, entries of
size `1`, and the lifts and duals of the `e_a`, `a < j`, are read off its columns.

Let `F` be a place datum for `G` over a place `A`.

(a) A gauge `Γ` for `F` is a size (1.1) with compact sets `A_(j)`, together with a number `2 ≤ Λ < ∞` (the loss), such
that: `m ≤ 9n`; `c_P ≥ 1`; `M`, the hyperbolic basis, `τδ⁻¹` and the elements of `K` have size `1`; for a close pair
`(ω₁, ω₂)`, `ω₁` and `(ω₁ − ω₂)/M` have size `1`; if `1/M` has size `1`, then for every `i` some unit `c` with `c⁻¹` of
size
`i + 2` makes `(cω₁, cω₂)` a close pair for all vectors `ω₁, ω₂` of size `i`; a unit of size `j` has modulus at most
`Λ^j`;
`vol A_(j) ≤ Λ^{j+1}`; `2p ≤ #ι`; the volume of `A^p` disintegrates along the standard form into an s-finite kernel each
measure of which gives mass at most `Λ^{p(j+1)}` to the vectors of size `j`; and for every `g ∈ K`, every position `z`
and
every `ϱ` linear forms `v` on `X′`, there is a common bound for the set `W` of the vectors of `X′` killed by `v` and
short
from `g` and `gz`: a measurable `φ ≥ 0` on `X′` with `φ(u) ≥ 1/vol⟨u, W⟩`, with `φ(u)` at least the volume of the
numbers `c`
such that `⟨cu, W⟩` lies in the set of the numbers `(⟨ω₁, ω′₁⟩ − ⟨ω₂, ω′₂⟩)/M` for close pairs, and with
`∫ φ^s ≤ Λ^{99n(j+1)}` over the vectors of size `j`.

(b) The close positions (the position ball) of `Γ` are the positions `z` for which `(z − 1)/M` has size `1`.

(c) For a jointly measurable function `k` on `G × G`, the partial correlation from floor `j` on is
`k_j(g, y) = ∫ k(xg, xy) dθ_{≥j}(x)`. Such a `k` is a pairing kernel at floor `j`, for an element `w ∈ G`, if: `w`
commutes
with `G^(j)`; for every `l` and all `n, n′ ∈ U_(<l)`, `k_{l+1}(ng, n′y) = ψ((σ₀(wn′w⁻¹) − σ₀(n))/M)·k_{l+1}(g, y)`,
where `σ₀` is
the sum of the entries just above the diagonal on the frame; for every `l` the integral `∫ |k(xg, xy)| dθ_{≥l}(x)` has a
finite bound independent of `g` and `y`; and `k_l(g, y) ≠ 0` implies that `g` is near at `l`. These rules hold for the
correlation `k(g, y) = ⟨W(g), W(wy)⟩` of a cut Bessel function `W` (3.2).

(d) Prove: if `g` is near at `j`, then every `e_a` with `a < j` is balanced at `g` with bound `L^5` for the size of `Γ`.

(e) For a kernel `k`, a position `x` and `j ≤ ϱ`: the weighted square is `a_j(g) = (depth weight of length j at
(g, gx))·|k_{j+1}(g, gx)|²`; `b_j(g) = ∫ (a_j + b_{j+1})(σg) dθ_j(σ)` for `j < n` and `b_j = 0` for `j ≥ n`; the second
moment
of one frame at `x` from floor `j` is the integral of `b_j` over the floors below `j` (for `𝗆_j`).

*Needs:* 1.1, 1.2, 2.2.

[ShortProof], `New/Spanning/Frames/Correlations.lean` (`New.Floors.Gauge`, `New.Floors.Gauge.positionsOfSize`,
`New.Floors.PlaceData.IsPairingKernel`, `New.Floors.PlaceData.partialCorrelation`,
`New.Floors.PlaceData.invDepthWeight`, `New.Floors.PlaceData.pivotL1Norm`,
`New.Floors.PlaceData.weightedSquare`, `New.Floors.PlaceData.weightedSquareSum`,
`New.Floors.PlaceData.weightedSquareIntegral`, `New.Floors.Gauge.isBalanced_of_isNear`)

### 2.4 Volumes on quadrics and on sections

*Origin:* adapted from the published computation of measures on quadrics by solving the equation in a hyperbolic
plane: here in a block of orthonormal coordinates, uniformly for a gauge, and for the sections of an isotropic cone.

*Method of the formal proof:* a block of `p = 2m + 2` orthonormal vectors contains enough room to solve
`⟨y, y⟩ = c` for the remaining coordinates fixed, by the kernel of the gauge; the section `⟨e_a, y⟩ = c` of the cone of
`Y^(a)` is the orbit `c·n⁻¹e*_a` of the Heisenberg group `N_a`.

Let `Γ` be a gauge for `F`. Prove:

(a) let `ρ` be the volume of `V_b` or the quadric measure of floor `b`. In the coordinates of the basis of `V_b`, `ρ` is
solved
in every block of `p` distinct orthonormal basis vectors: the other coordinates are free, and over each of their
values the points of the block with all coordinates of size `j` have mass at most `Λ^{p(j+1)}`;

(b) for `ρ` as in (a) and measurable `φ ≥ 0` on `X′` with integral at most `B` over the vectors of size `j + 4`, the
`ρ`-integral of `φ(y_X)` over the vectors `y` of size `j` is at most `Λ^{99n(j+6)}·B`;

(c) (Heisenberg groups) let `Φ ≥ 0` on `N_a`, `u` a unit, and suppose that at each `n = ν(ω, β)` with `Φ(n) ≠ 0`, `v/u`
has size
`j` for some `v` congruent below `a` to `(n⁻¹ − 1)e*_a`, and `Φ(n) ≤ C·Ψ(ω/u)` with `Ψ` measurable of integral at most
`I` over
the vectors of size `j` of `V_{a+1}`. Then `∫ Φ dη_a ≤ C·B` for every `B ≥ |u|^{r_a+1/2}·Λ^{j+2}·I`;

(d) (sections) for a unit `c` the section measure is `|c|^{r}·(image of η_a under n ↦ c·n⁻¹e*_a)`, `r` the rank of
`Y^(a+1)`;
the quadric measure of floor `a < ϱ` is `∫ (section measure at c) dc`; and for measurable `φ ≥ 0` on `X′` with integral
at
most `B` over the vectors of size `j + 5`, the integral of `φ(y_X)` over the points of size `j` of the section at a unit
`c` is at most `|c|^{−1/2}·Λ^{j+3}·Λ^{99n(j+7)}·B`.

*Needs:* 2.1, 2.2, 2.3.

[ShortProof], `New/Spanning/Frames/QuadricVolumes.lean` (`New.Floors.Gauge.exists_isSolvedIn`,
`New.Floors.Gauge.setLIntegral_orthonormalPart_le`, `New.Floors.Gauge.lintegral_heisenbergMeasure_le`,
`New.Floors.sectionPoint`, `New.Floors.sectionMeasure`,
`New.Floors.PlaceData.lintegral_floorQuadricMeasure_eq`, `New.Floors.Gauge.setLIntegral_sectionMeasure_le`)

### 2.5 Plancherel's formula on quadrics and along Heisenberg groups

*Origin:* adapted from Plancherel's formula for the Fourier transform on a locally compact abelian group: here an
inequality for a Fourier kernel between two quadrics, by Cauchy–Schwarz in the fibres and Plancherel's formula in the
orthonormal coordinates off two blocks.

*Method of the formal proof:* both quadrics are moved into one space and their equations solved in two disjoint
blocks (2.4 (a)); Plancherel's inequality of the place acts on the coordinates of `X′`, which lie off both blocks.
Along `N_a` a partial correlation is a Fourier transform in the next frame vector, by the character law of a pairing
kernel.

Let `Γ` be a gauge for `F`. Prove:

(a) let `ρ` be the volume of `Y^(b)` or the quadric measure of floor `b`, and `ξ` a unit. The operator with kernel
`ψ(ξ⟨v, y⟩)`, from functions of the vectors `y` of size `j` on the quadric of floor `b` to functions of the vectors `v`
of
size `i` with the measure `ρ`, multiplies squared `L²` norms by at most
`Λ^{99n(i+6)}·Λ^{99n(j+6)}·(c_P/|ξ|)^{dim X′}`;

(b) let `k` be a pairing kernel from floor `a + 1` on for an element `d`, and `n = ν(ω, β) ∈ N_a`. If the characters of
the two
points differ on `N_a` by the frequency `ξ` (that is, `(σ₀(dsd⁻¹) − σ₀(s))/M = ξσ₀(s)` for `s ∈ N_a`, `σ₀` the sum of
the
entries just above the diagonal on the frame), then
`k_{a+1}(nx, ny) = ∫ ψ(−ξ⟨ω, σ⁻¹f_{a+1}⟩)·k_{a+2}(σx, σy) dθ_{a+1}(σ)`;

(c) (Parseval along `N_a`) in the situation of (b) with `ξ` invertible, let `Φ ≥ 0` on `N_a` be supported in a set `S`
and at
most `C·|k_{a+1}(nx, ny)|²` there. Suppose that for each `n₀ ∈ S` there are `t ∈ R^(a+1) ∩ G^(a)` and `q ∈ U_(<a+1)`
such that
`tqx` has size `i` and, for each `n ∈ S`, `v/u` has size `j` for some `v` congruent below `a` to `(tn₀(tn)⁻¹ − 1)e*_a`.
Then
`∫ Φ dη_a ≤ C·(c_P/|ξu|)^{dim X′}·|u|^{r_a+1/2}·Λ^{100n(i+j+31)}·∫ |k_{a+2}(σx, σy)|² dθ_{a+1}(σ)`, the last integral
over the
`σ` with `σx` near at `a + 2`.

*Needs:* 2.1 to 2.4.

[ShortProof], `New/Spanning/Frames/QuadricPlancherel.lean` (`New.Floors.Gauge.fourierSqNormLe_floorQuadricMeasure`,
`New.Floors.Gauge.partialCorrelation_heisenbergElem_eq_integral`,
`New.Floors.Gauge.parseval_heisenbergMeasure_le`)

## Layer 3: Depth, densities, one frame, two frames and shells

For a cut Bessel function `W` and two heads `p`, `q`, the form of floor `j` is a density times an integral, over a
position and two frames, of a weighted product of two correlations. This layer proves the descent of the forms from
one floor to the next and the bounds for them: deep vectors are rare; after Cauchy–Schwarz each frame is paired with
itself and integrated along its Heisenberg groups; a weight made of depths separates the two frames; at a fixed
position the form gains from a frequency, from two different heads, or from a deep vector; and the positions are cut
into shells by their height, the gain of a deep vector paying for the loss on the high shells.

Throughout, `F` is a place datum for `G` over a place `A`, `Γ` a gauge for `F` with loss `Λ`, `n = ϱ + 1`, `s` the
volume
exponent, and `𝖬` is assumed to be a Haar measure of `G` where a statement says so.

### 3.1 Depth

*Origin:* particular to this proof: for a fixed position few frame vectors are deep, for a fixed frame vector few
translates of the position leave it shallow; a position far from `1` has a deep vector, and a head keeps the first
vectors shallow.

*Method of the formal proof:* depths are read on the common vectors of `X′`, which look the same from the two points;
the common bound of the gauge (2.3 (a)) bounds the depth by `φ(y_X)`, and 2.4 (b), (d) integrate `φ^s` over a quadric or
a section. Long coordinates of a Heisenberg element force depth because a stable vector must pair to a small number
with the difference of the two points. Bounded depths give units in the sets `𝔡_a`, hence short duals, and 1.3 then
bounds the position.

Prove:

(a) (deep vectors are rare) for a position `x` and `a < ϱ`, the mass on floor `a` (2.2 (d)) of
`σg ↦ depth_a(σg, x)^s` is at most `Λ^{10⁴n}`. On a section: for a head `p` of length `a + 1` for `Γ`, `y ∈ K` and
`ν ∈ U_(<a)`, the integral of `depth_a(z, x)^s` at `z = w_p nνy`, over the `n ∈ N_a` with `z` near at `a + 1`, is at
most
`|p_a|^{−r_a−1/2}·Λ^{10⁶n²}`;

(b) (long coordinates force depth) for `g ∈ K` and `g⁻¹y` in the position ball, the integral of
`depth_a(g, ny)^{−s}` over the `n ∈ N_a` for which `g⁻¹νny` is a close position for some `ν ∈ U_(<a)` is at most
`|M|^{r_a+1/2}·Λ^{4600n}`;

(c) (the two halves of the depth weight) let `j ≤ ϱ`, `x` a position and `g` near at `j`, and integrate over `ν ∈
U_(<j)` for the
convolution of the Heisenberg measures of the floors below `j`. For a head `p` of length `j` for `Γ`, the integral of
the
inverse depth weight at `w_pνg` (the inverse of the weight of length `j` at `(z, zx)` if `z` is near at `j`, and `0`
otherwise) is at most `Λ^{10⁶n³}·∏_{a<j}|p_a|^{−r_a−1/2}`. The integral of the depth weight of length `j` at `(g, νy)`,
over the
`ν` with `g⁻¹νy` in the position ball, is at most `∏_{l<j}(|M|^{r_l+1/2}·c_P^{dim X′}·Λ^{4900n})`;

(d) (bounded depths bound the position) let `j ≤ ϱ`, `p`, `q` heads of length `j` for a size `S`; if `j ≠ 0`, let `1/M`
have
size `1` for `S` and let the numbers of size `10n` for `S` have size `1` for `Γ`. Let `ux, vxy ∈ K` for some `u, v ∈ 𝖴`
with
`(vxy − ux)/M` of size `2`, and let `w_p⁻¹x`, `w_q⁻¹xy` be near at `j`. If each `𝔡_a(x, y)` with `a ≥ j` contains a unit
whose
inverse has size `1`, then `(y − 1)/M` has size `99n`;

(e) (heads keep the first vectors shallow) let `j ≤ ϱ`, `p`, `q` heads of length `j` for `Γ`, and `1/M` of size `1`. If
`x`, `xy`,
`w_p⁻¹x` and `w_q⁻¹xy` are near at `j`, then for `a < j` the set `𝔡_a(x, y)` contains a unit whose inverse has size
`10n`.

*Needs:* 1.2, 1.3, 2.2, 2.3, 2.4.

[ShortProof], `New/Spanning/Frames/Depth.lean` (`New.Floors.PlaceData.IsCommonBound.depth_le`,
`New.Floors.Gauge.floorMassLe_depth_pow`, `New.Floors.Gauge.lintegral_depth_pow_section_le`,
`New.Floors.Gauge.floorConst`, `New.Floors.Gauge.floorsConst`, `New.Floors.Gauge.closeBelow`,
`New.Floors.Gauge.exists_lift_of_mem_closeBelow`, `New.Floors.Gauge.lintegral_heisenbergMeasure_inv_depth_le`,
`New.Floors.Gauge.lintegral_invDepthWeight_le`, `New.Floors.Gauge.lintegral_depthWeight_le`,
`New.Floors.Gauge.hasMatrixSize_sub_one_of_stableProducts`,
`New.Floors.Gauge.exists_unit_mem_stableProducts_of_isHead`)

### 3.2 Cut Bessel functions, the forms of the floors and their descent

*Origin:* adapted from the published theory of Kloosterman integrals as orbital integrals of Bessel functions on
unipotent double cosets (Jacquet and Ye, germs of Kloosterman integrals for `GL(3)`): here the inner products of two
orbital integrals of a Bessel function of a unitary group, written floor by floor.

*Method of the formal proof:* the inner product of two orbital integrals is a double integral of a product of two
correlations (a); the Bruhat coordinates of the big cell of floor `a` turn the integral over the common entry of the
two heads into the integral over floor `a`, with the Jacobian `|p_a q_a|^{d_a/2}` that the density carries (d).

(a) A function `W` on `G` with values in a finite-dimensional Hilbert space is a Bessel function of frequency `η` if it
is bounded, measurable, and `W(ux) = ψ(ησ₀(u))·W(x)` for `u ∈ 𝖴`. It is a cut Bessel function for `F` if its frequency
is
`1/M` and `W(x) = 0` unless `ux ∈ K` for some `u ∈ 𝖴`. Its correlation with twist `d ∈ G` is `k(x, y) = ⟨W(x), W(dy)⟩`.

(b) The head density of two sequences of units is `κ_j(p, q) = ∏_{a<j} |p_a q_a|^{d_a/2}`, `d_a = k + 1 + 2(ϱ − (a +
1))`.
For a function `ω` on `G` (the weight), heads `p`, `q` of length `j` and a position `x`, the form integrand at a point
`g` is
`∬ ω(στ⁻¹)·k_{j+1}(σg, σgx)·conj(k′_{j+1}(τw_p⁻¹g, τw_p⁻¹gx)) dθ_j(τ) dθ_j(σ)`, where `k` is the correlation of `W` with
twist
`1` and `k′` its correlation with twist `w_q⁻¹w_p`. The form of floor `j` is
`𝓘_j(p, q; ω) = κ_j(p, q)·∫∫ (form integrand at g, x) d𝗆_j(g) d𝖬(x)`; `𝖥_j(x; ω)` is the integral for `𝗆_j` of the
modulus
of the form integrand; the majorant of the form at `x` is the integral for `𝗆_j` of the product of the two integrals
over floor `j` of `|k_{j+1}|` and `|k′_{j+1}|`. `‖k‖²` denotes the squared `L²` norm of the correlation of `W` for
`θ_{≥0}` in both
variables.

(c) Prove: `|𝓘_j(p, q; ω)| ≤ κ_j(p, q)·∫ 𝖥_j(x; ω) d𝖬(x)`; and the form of floor `0` with weight `1` is
`∫ |k_0(1, z)|² d𝖬(z)` (the mass).

(d) Prove: let `μ` be a Haar measure, `W` a continuous cut Bessel function, `p`, `q` heads of length `ϱ` and `x ∈
G^(ϱ)`. With
`J(γ) = ∫ W(y) ⊗ W(γ⁻¹y)^* dμ(y)`, `⟨J(w_p x), J(w_q x)⟩ = ∬ ⟨W(y), W(y′)⟩·conj⟨W((w_p x)⁻¹y), W((w_q x)⁻¹y′)⟩ dμ(y)
dμ(y′)`.

(e) (descent) Prove: let `F` have a gauge, `W` be a cut Bessel function, `a < ϱ`, and suppose that the majorant of the
form
of floor `a` has finite integral for `𝖬`. Let `φ` be a measurable function on `A` with `|φ| ≤ 1` and `t ∈ ℂ`. Write `(p,
c)` for `p`
with the entry at `a` replaced by `c`. Then `c ↦ φ(c)·t·𝓘_{a+1}((p, c), (q, c); 1)` is integrable over the units `c`,
and its
integral is `t·𝓘_a(p, q; x ↦ φ(⟨f_a, x f_a⟩))`. In particular this holds for `φ(c) = ψ(ηc)`, `η ∈ A`.

*Needs:* 2.1, 2.2, 2.3; SecondMomentsOfPoincareSeries §3.1, §3.3.

[ShortProof], `New/Spanning/Frames/Densities.lean` (`New.Floors.PlaceData.headDensity`,
`New.Floors.frameCorrelation`, `New.Floors.Place.IsBessel`, `New.Floors.PlaceData.IsCut`,
`New.Floors.PlaceData.pairingNormSq`, `New.Floors.PlaceData.partialCorrelationProduct`,
`New.Floors.PlaceData.formIntegrand`, `New.Floors.PlaceData.floorForm`,
`New.Floors.PlaceData.formIntegrandL1Norm`, `New.Floors.PlaceData.formMajorant`,
`New.Floors.PlaceData.enorm_floorForm_le`, `New.Floors.Gauge.inner_besselOrbitalIntegral`,
`New.Floors.PlaceData.floorForm_zero_eq_integral`, `New.Floors.Gauge.integral_weight_mul_floorForm_succ`,
`New.Floors.Gauge.integral_psi_mul_floorForm_succ`)

### 3.3 One frame

*Origin:* particular to this proof: the second moment of one frame, the square of a partial correlation integrated
over the position ball along the Heisenberg groups of the frame, is bounded by the squared `L²` norm of the kernel.

*Method of the formal proof:* a step below the pivot uses up one factor of the depth weight through 3.1 (b); a step
above it adds a frame vector by Parseval's inequality along the Heisenberg group (2.5 (c)); the top floor, where only
`H` is left, has mass at most `1` on near points.

Prove:

(a) for a pairing kernel `k` at floor `j ≤ ϱ`, the integral over the position ball of the second moment of one frame
(2.3 (e)) for `𝖬` is at most `n·∏_{l<ϱ}(|M|^{r_l+1/2}·c_P^{dim X′}·Λ^{4900n})` times the squared `L²` norm of `k` for
`θ_{≥0}` in
each variable;

(b) let `W` be a cut Bessel function, `j ≤ ϱ`, `𝖬` a Haar measure, `p` a sequence of units, `q` a head of length `j` for
`Γ`,
and `S` a subset of the position ball of a gauge `Γ′` with loss `Λ′`. Say that `f ≥ 0` has the gain `e` at `x` if
`f(x)² ≤ e²·Π_j(p, q; x)`, where `Π_j(p, q; x)` is the product of the second moments of the two correlations of 3.2 (b)
at
`x`, times `(∏_{a<j} |p_a⁻¹|^{r_a+1/2})²·(Λ^{10⁶n³})³`. If `f` has the gain `e` on `S`, then
`κ_j(p, q)·∫_S f d𝖬 ≤ e·‖k‖²·∏_{l<ϱ}|M|^{r_l+1/2}·c_P^{dim X′·ϱ}·Λ^{1500000n³+1}·Λ′^{25000n²}`.

*Needs:* 2.3, 2.5, 3.1, 3.2.

[ShortProof], `New/Spanning/Frames/OneFrame.lean` (`New.Floors.PlaceData.IsPairingKernel.pivotL1Norm_sq_le`,
`New.Floors.Gauge.closeMass`, `New.Floors.Gauge.cutSquare`, `New.Floors.Gauge.climbConst`,
`New.Floors.Gauge.lintegral_cutSquare_le`, `New.Floors.Gauge.lintegral_weightedSquare_le`,
`New.Floors.Gauge.lintegral_weightedSquareIntegral_le`,
`New.Floors.Gauge.headDensity_mul_lintegral_le_mul_pairingNormSq`); `New/Spanning/Frames/Densities.lean`
(`New.Floors.Gauge.weightedSquareProduct`)

### 3.4 Two frames: separation, and the gains at one position

*Origin:* particular to this proof: a weight made of depths separates the two frames, and at a fixed position the
form gains from a frequency, from two different heads, or from a deep vector.

*Method of the formal proof:* Cauchy–Schwarz with the depth weight and its inverse, whose integrals are 3.1 (c),
separates the frames (a). For (b) and (c) the two correlations carry characters on `N_j` that differ by the frequency
`ξ`, and the Fourier kernel between the two quadrics of floor `j` is bounded by 2.5 (a). For (d) the pivot is restricted
to the points where the vector of some floor is deep, of small mass by 3.1 (a).

Let `W` be a cut Bessel function, `p` a head of length `j ≤ ϱ` for `Γ`, `q` a second sequence of units, `x` a position
and `𝖬`
a Haar measure. A point `y` is active at `x` if the correlation of `y` and `yx` is not zero and `w_p⁻¹y`, `w_q⁻¹yx` are
near
at `j`. Prove:

(a) (separating the frames) let `B`, `B′ ≥ 0` be measurable, left invariant under `R^(j)` and zero off the points near
at
`j`, and `f ≥ 0` with `f(g)² ≤ C·B(g)/wgt(g)·B′(w_p⁻¹g)/wgt(w_p⁻¹g)` wherever `f(g) ≠ 0`, `wgt` the depth weight of
length `j`
at `(·, ·x)`. Then `(∫ f d𝗆_j)² ≤ C·D²·∫B d𝗆_j·∫B′ d𝗆_j` with `D = ∏_{a<j}|p_a⁻¹|^{r_a+1/2}·Λ^{10⁶n³}`;

(b) (a frequency) if `ξ` is a unit and `ψ(ηz) = ψ(ξz)` for all `z` of size `200n²`, then
`𝖥_j(x; ψ(η⟨f_j, ·f_j⟩))² ≤ (c_P/|ξ|)^{dim X′}·Π_j(p, q; x)`;

(c) (two heads) if `j = i + 1` and `ξ = (1/p_i − 1/q_i)/M` is a unit, then `𝖥_j(x; 1)² ≤ (c_P/|ξ|)^{dim X′}·Π_j(p, q;
x)`;

(d) (a deep vector) let `V ≥ 1` bound the mass of floor `j` (for every `g`, `θ_j{τ : τg near at j + 1} ≤ V`), and
suppose
that every active point `g` has a floor `a ≥ j` with `depth_a(g, x) ≥ σ⁻¹`. Then the square of the majorant of the form
at `x` is at most `σ^s·V²·Π_j(p, q; x)`.

*Needs:* 2.2, 2.5, 3.1, 3.2, 3.3.

[ShortProof], `New/Spanning/Frames/Densities.lean` (`New.Floors.PlaceData.IsActive`,
`New.Floors.PlaceData.HasDeepVector`); `New/Spanning/Frames/Gains.lean` (`New.Floors.PlaceData.deepModulus`,
`New.Floors.Gauge.lintegral_section_le`,
`New.Floors.Gauge.sq_lintegral_le_mul_lintegral`,
`New.Floors.Gauge.sq_lintegral_mul_comp_weylElem_inv_le_of_section`,
`New.Floors.Gauge.formIntegrandL1Norm_sq_le_of_char`, `New.Floors.Gauge.formIntegrandL1Norm_sq_le_of_heads`,
`New.Floors.Gauge.formMajorant_sq_le_of_hasDeepVector`)

### 3.5 The sum over the shells

*Origin:* particular to this proof: the positions are cut into shells by their height; on one shell the bound for
one frame loses a power of the height, and above a threshold every position has a deep vector, whose gain pays for the
loss.

*Method of the formal proof:* a shell is covered by few position balls, on each of which 3.3 (b) applies after a
translation; on the shells of height `2^i` above the threshold, 3.4 (d) with the depth forced by the height gives a
gain that is a negative power of the height, and the geometric series converges because the volume exponent is large.

Let `p`, `q` be sequences of units and `j ≤ ϱ`. The unit of integrals over positions is
`𝒩(W) = ∏_{l<ϱ}|M|^{r_l+1/2}·c_P^{dim X′·ϱ}·‖k‖²`. A set `S ⊂ G` is a shell of height `h`, `1 ≤ h < ∞`, for `(Γ, p, q,
W)` if:
there are at most `2h^{9n}` gauges `Γ′` for `F`, each of loss at most `Λ·h²`, whose position balls cover `S`; and for
every
`x ∈ S` and every `σ < 1` with `Λ^{1200n²} ≤ σ^{400n²}·h`, every point `y` active at `x` has a floor `a ≥ j` with
`depth_a(y, x) ≥ σ^{−2}`.

(a) Prove: let `S` be a shell of height `h`, `W` a cut Bessel function, and `q` a head of length `j`. If `f ≥ 0` has the
gain
`e` at each `x ∈ S`, then `κ_j(p, q)·∫_S f d𝖬 ≤ e·Λ^{2·10⁶n³}·h^{10⁵n²}·𝒩(W)`.

(b) (the sum over the shells) Prove: let `S_i` be a shell of height `2^i` for each `i ≥ 0`, covering the support of `f ≥
0`;
let `p`, `q` be heads of length `j`, `W` a cut Bessel function, and `V ≥ 1` a bound for the mass of floor `j`. Suppose
`f(x) ≤` (majorant of the form at `x`) for all `x`, and, for a number `e` with `e < 1`, `f(x)² ≤ (V·e^s)²·Π_j(p, q; x)`
for
every position `x`. If `9·10⁷n⁴ + r′ ≤ s`, then
`κ_j(p, q)·∫_G f d𝖬 ≤ V·min(1, e)^{r′}·Λ^{4·10⁸n⁴}·𝒩(W)`.

*Needs:* 3.1, 3.3, 3.4.

[ShortProof], `New/Spanning/Frames/Shells.lean` (`New.Floors.PlaceData.shellNormalization`,
`New.Floors.Gauge.IsShell`, `New.Floors.Gauge.IsShell.setLIntegral_le`, `New.Floors.Gauge.lintegral_le_of_shells`)

## Layer 4: The complex place

The group `G₁` of SecondMomentsOfPoincareSeries §3.1 is the unitary group of the split form over the place `ℂ`, which
lies over a real place of the totally real subfield. This layer gives its place datum and gauges, identifies the
measure of the floors with a multiple of Haar measure, and integrates the gains of Layer 3 over the shells. The result
is that the cut of a normalised Bessel function has the local bounds that the sieve of
RemainingAndMainTermsOfSecondMoments reads.

### 4.1 The place datum and the gauges at `ℂ`

*Origin:* adapted from the Cartan and Iwasawa coordinates on `U(p, q)` and the invariant measure of a hyperboloid
(Knapp, *Lie groups beyond an introduction*; Helgason, *Groups and geometric analysis*, Ch. I §5): here the measure of
the group as a convolution over the floors of the frame, compared with Haar measure through the fibre measure of the
Gram map.

*Method of the formal proof:* the convolution of the Heisenberg measures is Lebesgue measure in the free entries of
`𝖴`, both being invariant, with the constant fixed by a Gaussian integral. The measure of all floors is invariant,
hence a multiple of Haar measure; the multiple is bounded by comparing two descriptions of the fibre measure of the
Gram map on tuples `(y_0, y*_0, …, y_{ϱ−1}, y*_{ϱ−1}, y_ϱ)`: by Haar measure, and by choosing the vectors in turn. The
common vectors of two points are a subspace of `X′` orthogonal to `n` given vectors, on which both points act by
isometries after an orthonormal change.

Let `𝔰` be a shape, `ρ > 0`, `s ≥ 0` an integer and `b ≥ 2`, with `ρ = b^{6n+2} ≥ 8r`, `k = s + 3n + 6 ≥ n⁷`, `s >
10⁹n³` and
`ϱ ≥ 10⁸` (the numerical hypotheses at a real place). The place `ℂ` has the involution of complex conjugation, Lebesgue
measure, `τ = 1/2`, `δ = i/2`, the modulus `z ↦ |z|²` (written `|z|_ℂ` where it matters), the character
`ψ(z) = exp(z − z̄)` and `c_P = π²`.

(a) The place datum at `ℂ` has: the basis of the middle space with no further hyperbolic pairs and the orthonormal
vectors `x_i`, `i ≠ k₀`; level `M = 1`; close pairs the `(ω₁, ω₂)` with `|ω₁|² + |ω₂|² < 1`; box `K = {x : ‖x‖ ≤ ρ}`;
all
elements as positions; `μ_H` the probability Haar measure of `H ≅ U(k)`; and `θ_top` the law of floor `ϱ` in the Bruhat
coordinates of its big cell, convolved with `μ_H`.

(b) For `L ≥ ρ` the gauge of scale `L` has `A_(j) = {z : |z| ≤ L^j}` and loss `Λ = L²`. Prove: it is a gauge for the
place
datum (2.3 (a)).

(c) Prove: the convolution of the Heisenberg measures of the floors is the Haar measure `du` of `𝖴`
(SecondMomentsOfPoincareSeries §3.1). There is a number `0 < c_𝖬 < ∞` with `𝖬 = c_𝖬·(Haar measure of G₁)`,
`∫ f dθ_{≥0} = c_𝖬·∫_{𝖴\G₁} f` for measurable `f ≥ 0` left invariant under `𝖴`, and `c_𝖬 ≤ vol U(r)/vol U(k)`; and the
image
of `𝖬` under inversion is at most `(vol U(r)/vol U(k))` times Haar measure.

(d) For `g ∈ G₁` the length of `y` at `g` is the Euclidean norm `|y|_g = ‖g⁻¹y‖`; the induced length on `Y^(l)` is the
infimum
over the lifts; the real depth of `e_a` at `(g, g′)` is the infimum of `|ζ|_g² + |ζ|_{g′}²` over the duals `ζ` of `e_a`
in
`Y^(a)`. Prove: `𝔡_a(x, y)` is a disc, and `depth_a(x, y)` is the real depth of `e_a` at `(x, xy)` divided by `π`.

*Needs:* 2.1, 2.2, 2.3; SecondMomentsOfPoincareSeries §3.1, §3.5; ShortGRH background (polar coordinates on `ℂ^κ`:
`∫ g(ω) dω = ∫₀^∞ π^k r^{k−1}/(k − 1)!·∫_{U(k)} g(h(√r·x)) dh dr` for a basis vector `x`; the Cartan decomposition
`σ = h·w(c)·h′` of an isometry `σ` of `X₀ ⊕ ℂz` with `|h(z, σz)| = |c| > 1`, with `h, h′ ∈ U(X₀)` and `w(c)` a boost;
and, for `k > 1`, measures on the hyperboloids `h(v, v) = t` that disintegrate Lebesgue measure of `X₀ ⊕ ℂz` along
`h(v, v)`; [ShortProof] `Lib/DiscreteSeries/Bruhat/ComplexPlace.lean` (`New.Floors.lintegral_eq_polar`,
`New.Floors.cartan_decomposition`, `New.Floors.isDisintegration_hyperboloidMeasure`)).

[ShortProof], `New/Spanning/Frames/RealPlaceGauge.lean` (`New.Floors.ascConv_heisenbergMeasure_eq_besselHaar`,
`New.Floors.dualColumnGaussian`, `New.Floors.RealPlaceSizes`, `New.Floors.RealPlaceSizes.complexData`,
`New.Floors.RealPlaceSizes.gauge`, `New.Floors.RealPlaceSizes.haarRatio`,
`New.Floors.RealPlaceSizes.haarRatio_ne_zero_and_groupMeasure_eq_smul`,
`New.Floors.RealPlaceSizes.inv_groupMeasure_le`,
`New.Floors.RealPlaceSizes.exists_orthonormal_mul_eq_zero_and_fixed`, `New.Floors.lengthAt`,
`New.Floors.inducedLength`, `New.Floors.realDepth`, `New.Floors.RealPlaceSizes.stableProducts_eq`,
`New.Floors.RealPlaceSizes.depth_eq`)

### 4.2 Cut Bessel functions at `ℂ`: convergence and the integrated bound

*Origin:* particular to this proof: the forms of the floors of a cut Bessel function at `ℂ` converge absolutely, and
a pointwise gain at every position gives a bound for the form with a power decay.

*Method of the formal proof:* every position lies in a dyadic shell, the positions outside the position ball at a
scale being the remote ones; a remote position has a deep vector by 3.1 (d), so the shells of 3.5 exist, and 3.5 (b)
sums them. The decay of the Bessel function (the cut pair) bounds the mass of a floor, and Schur's bound for the
irreducible type normalises the squared norm of the correlation.

A cut Bessel function at `ℂ` is a pair `(W♭, W)` of continuous functions `G₁ → ℂ^I` that is a cut pair with base `b` and
decay rate `f` for a type `ρ_I` of `H` (SecondMomentsOfPoincareSeries §3.3), such that every matrix commuting with
`ρ_I` is scalar, and `(ρ, s, b)` satisfy the numerical hypotheses of 4.1. The forms `𝓘_j` are those of `W♭` for the
place
datum of 4.1, and `c_form = (vol U(k)/vol U(r))/(c_𝖬·#I)²` is their normalising constant. The head weight is
`hw_j(p) = ∏_{l<j} max(1, 1/|p₀⋯p_l|)^{n⁶}` if `|p₀⋯p_l| ≤ b^{60n²}` for all `l < j`, and `0` otherwise; `Θ_𝔰` and the
damped power
`ℓ_i(t) = t^i·min(1, t)⁶` are those of SecondMomentsOfPoincareSeries §3.3; absolute values are those of `ℂ`.

Prove, for a cut Bessel function at `ℂ`, `j ≤ ϱ` and sequences of units `p`, `q`:

(a) the majorant of the form of floor `j` has finite integral for `𝖬`;

(b) let `y` be a unit and `ω` a weight with `|ω| ≤ 1`. If for every gauge in which `p` is a head of length `j` and every
position `x`, `𝖥_j(x; ω)² ≤ (π/|y|)^{2(k−5)}·Π_j(p, q; x)`, then
`#I·|c_form·𝓘_j(p, q; ω)| ≤ Θ_𝔰·b^{2000n⁹}·ℓ_{k−n⁷}(1/|y|)·hw_j(p)·hw_j(q)`.

*Needs:* 3.1, 3.4, 3.5, 4.1; SecondMomentsOfPoincareSeries §3.1, §3.3, §3.6.

[ShortProof], `New/Spanning/Frames/RealShells.lean` (`New.Floors.IsCutBessel`,
`New.Floors.IsCutBessel.lintegral_formMajorant_ne_top`, `New.Floors.IsCutBessel.norm_floorForm_le`)

### 4.3 The local bounds at `ℂ` for cut Bessel functions

*Origin:* particular to this proof: the forms of the floors of a cut Bessel function at a real place form a system
with the local bounds of the sieve: descent, decay in the frequency and for unequal last entries, a bound for the
mass, and a continuous positive top form.

*Method of the formal proof:* the top form is a normalised integral over the chart of the top floor, continuous by
dominated convergence; the descent is 3.2 (e); decay in the frequency and for unequal last entries are 3.4 (b), (c)
through 4.2 (b); the mass on the bottom floor is split into the position ball, where it is the squared norm of the
matrix coefficient, and the remote positions, which are small by the decay of the cut pair and the volume of balls.

Let `(W♭, W)` be a cut Bessel function at `ℂ` with decay rate `f ≥ 4000n`. For `A, B ∈ L²(𝖴\G₁)` the matrix coefficient
is
`x ↦ ⟨A, R(x)B⟩`, `R` right translation. Prove:

(a) (decay in the frequency) for `i ≤ ϱ` and `ν ≠ 0`,
`#I·|c_form·𝓘_i(p, q; x ↦ ψ_ν(⟨f_i, x f_i⟩))| ≤ Θ_𝔰·b^{2000n⁹}·ℓ_{k−n⁷}(1/|ν|)·hw_i(p)·hw_i(q)`, with `ψ_ν(z) = exp(νz −
conj(νz))`;

(b) (unequal last entries) for `i + 1 ≤ ϱ` and `ν = 1/p_i − 1/q_i ≠ 0`,
`#I·|c_form·𝓘_{i+1}(p, q; 1)| ≤ Θ_𝔰·b^{2000n⁹}·ℓ_{k−n⁷}(1/|ν|)·hw_{i+1}(p)·hw_{i+1}(q)`;

(c) (the mass) let `deg > 0` with `∫_{G₁} |⟨W, R(x)W⟩|² dx ≤ (#I)²/deg`, `deg·Θ_𝔰 ≤ b^{4r²}`, and
`deg·vol{g ∈ G₁ : ‖g‖ ≤ T} ≤ T^{9r²}·b^{99r²}` for every `T ≥ 1`. Then `|c_form·𝓘_0(p, q; 1)| ≤ (1 + b^{−10})/deg` for
all `p`, `q`;

(d) (the local bounds) under the hypotheses of (c), there are forms `J_0, …, J_{ϱ+1}` on pairs of sequences of units
such that `W♭` has local bounds with degree `deg` in the sense of SecondMomentsOfPoincareSeries §3.3: each form below
the top is an integral of the next over the common entry, with the decay (a) in the frequency; `J_{i+1}(p, q)` decays in
`1/p_i − 1/q_i` for `i < ϱ` as in (b); `|J_0| ≤ (1 + b^{−10})/deg`; and `J_{ϱ+1}` is continuous, and positive
semidefinite on
sequences with a common last entry.

This is the statement that SecondMomentsOfPoincareSeries §3.14 uses for the cut of the normalised Bessel average.

*Needs:* 3.2, 3.4, 4.1, 4.2; SecondMomentsOfPoincareSeries §3.1, §3.3; RemainingAndMainTermsOfSecondMoments §6.1.

[ShortProof], `New/Spanning/Frames/RealBandLimits.lean` (`New.Floors.quotientPairing`,
`New.Floors.IsCutBessel.norm_floorForm_zero_le`, `New.Floors.IsCutBessel.norm_floorForm_wave_le`,
`New.Floors.IsCutBessel.norm_floorForm_heads_le`, `New.Floors.exists_hasLocalBounds_of_isCutBessel`)

## Layer 5: The finite places

A finite place in the sense of 2.1 (a) may be a finite set of finite places read as one ring. This layer supplies the
place datum and the gauges at such a place from the lattice of integral vectors, constructs the finite Bessel vector
of a group between the principal congruence subgroup and the integral points, and proves the bound for the forms of
the floors and for the mass integral.

### 5.1 Lattice data and large lattice data

*Origin:* definitions and conventions; the existence statement and the masses are particular to this proof.

*Method of the formal proof:* the measures are the restrictions of the quadric and Haar measures normalised on the
integral points; the masses of cosets of the congruence subgroup are computed floor by floor in the Heisenberg
coordinates; the mass of the integral isometries is a product of local densities of the quadrics, bounded by the zeta
sum of the ring.

Let `A` be a finite place with integers `O`, units `O^×`, and `G` the unitary group of a split form over `A`. For an
integral unit `g` of `A`, `K(g)` is the group of integral isometries congruent to `1` modulo `g`, and `K = K(1)`.

(a) A place datum `F` for `G` with level `M` is a lattice datum if: the Gram matrix of the form is hermitian and
invertible over `O`; the hyperbolic basis is integral; `M ∈ O` and `M̄ = M`; the box is `K`; `θ_top(K) ≥ vol(O^×)`;
`μ_H(K) = 1`; the close pairs are the pairs of integral vectors congruent modulo `M`; the positions are the elements
`y⁻¹uy·k` with `y ∈ G`, `u ∈ 𝖴` and `k ∈ K(M)`; and there is an isotropic vector `u` with `⟨u, z⟩ = 1` and vanishing
coordinate
at `z`. It is a large lattice datum, with `m + 1` further hyperbolic pairs, if moreover `ζ_O(m)^n ≤ 1 + 2^{−n}` for the
ideal zeta sum `ζ_O(m) = Σ_{J} [O : J]^{−m}` over the ideals `J` of finite index, `m < 9n`, `#ι ≥ 53n`, `ψ(x + x̄) = 1`
for all `x`, and `G` is
unimodular.

(b) Prove: for `N ∈ O` with `N̄ = N`, an integral unit `g` with `ḡ = g`, and `k = #ι + 2m + 1`, the form with `ϱ`
hyperbolic
planes, `X₀ = O^κ` standard and `⟨z, z⟩ = −N`, written in the lattice basis of SecondMomentsOfPoincareSeries §4.1, has a
lattice datum with level `g`, `m` further pairs and orthonormal part indexed by `ι`.

(c) For a large lattice datum and an integral unit `α` with `ᾱ = α`, the gauge of scale `α` has
`A_(j) = {x : α^j x ∈ O}` and loss `Λ = 2/|α|`. Prove: it is a gauge for `F` (2.3 (a)).

(d) Prove, for a large lattice datum: for an integral unit `g` with `ḡ = g`, `a < ϱ` and a subgroup `S` of `U_(<a)`,
`η_a(S·K(g)) = |g|^{r_a+1/2}`; `𝖬` is a Haar measure of `G`; `𝖬(K) ≤ 1 + 2^{−n}`; and if `B ≥ 2` and the non-units of
`O` have
volume at most `1/B`, then `𝖬(K) ≥ 2^{−n}`.

*Needs:* 2.1, 2.2, 2.3; SecondMomentsOfPoincareSeries §4.1, §4.3; ShortGRH background (at a finite place with
its integers: the generalised index and the volumes of the integral vectors and of the unitary level; and the one-sided
form of Fourier inversion for the fibre integrals of a hermitian form, namely that the local density of a continuous
`f ≥ 0` of compact support has norm at most the integral of `f` over the quadric; [ShortProof]
`Lib/SiegelWeil/OneVector/FinitePlaceDensity.lean` (`New.Floors.IntegralPlace`,
`New.Floors.IntegralPlace.contentIndex`, `New.Floors.IntegralPlace.enorm_localDensity_le`)).

[ShortProof], `New/Spanning/Frames/StandardLevel.lean` (`New.Floors.PlaceData.congruenceSubgroup`,
`New.Floors.IntegralPlace.IsLatticeData`, `New.Floors.IntegralPlace.exists_isLatticeData`,
`New.Floors.IntegralPlace.IsLargeLatticeData`, `New.Floors.IntegralPlace.IsLargeLatticeData.gauge`,
`New.Floors.IntegralPlace.IsLargeLatticeData.heisenbergMeasure_eq_floorModulus`,
`New.Floors.IntegralPlace.IsLargeLatticeData.ascConv_mconv_unitaryLevel_coset`,
`New.Floors.IntegralPlace.IsLargeLatticeData.groupMeasure_boxSet_le`,
`New.Floors.IntegralPlace.IsLargeLatticeData.le_partialGroupMeasure_boxSet`,
`New.Floors.IntegralPlace.IsLargeLatticeData.isHaarMeasure_groupMeasure`, `New.Floors.vectorOfLastEntry`);
`New/Spanning/Frames/FiniteDepth.lean` (`New.Floors.IntegralPlace.IsLargeLatticeData.inv_two_pow_le_groupMeasure`)

### 5.2 The finite Bessel function and the Bessel vector of an intermediate group

*Origin:* adapted from the published theory of Kloosterman integrals as orbital integrals of Bessel functions
(Jacquet and Ye): here the Bessel function of a congruence subgroup at a finite set of places, and the vector of its
translates by the cosets of that subgroup in a larger group.

*Method of the formal proof:* the character `u ↦ ψ(σ₀(u)/M)` of `𝖴` is trivial on `𝖴 ∩ K(M)` because `ψ` is trivial on
`O`,
so it extends to `𝖴K(M)`. The correlation of two translates unfolds over `𝖴/(𝖴 ∩ K(M))`, whose mass is the product of
the
floor moduli (5.1 (d)).

Let `F` be a large lattice datum with level `M`.

(a) The finite Bessel function is `χ_M(y) = ψ(σ₀(u)/M)` for `y ∈ uK(M)`, `u ∈ 𝖴`, and `χ_M = 0` off `𝖴K(M)`. Prove: the
value
does not depend on `u`; `χ_M(yk) = χ_M(y)` for `k ∈ K(M)`; `K(M) ⊂ K`; and if `χ_M(y) ≠ 0` then `y ∈ 𝖴K(M)`.

(b) An intermediate group is a subgroup `Z` with `K(M) ⊂ Z ⊂ K`; it is open. Its Bessel vector is the function
`W_Z : G → ℂ^{Z/K(M)}` with coordinate `χ_M(ya⁻¹)` at the coset `K(M)a`. The unipotent mass is
`fl = ∏_{l<ϱ}|M|^{r_l+1/2}`, the mass of `𝖴 ∩ K(M)` in `𝖴`; the mass ratio of `Z` is `m(Z) = 𝖬(Z)·𝖬(K(M))/fl²`; and the
mass
integral is `ϰ(Z) = ∫_G |∫_Z χ_M(yxy⁻¹) d𝖬(y)|² d𝖬(x)`.

(c) Prove: `W_Z` is a cut Bessel function for `F` (3.2 (a)); `0 < m(Z) < ∞`; and `𝖬(Z) < ∞`.

(d) Prove: `fl·⟨W_Z(y), W_Z(yx)⟩ = ∫_𝖴 1_Z(uy)·χ_M(uyx(uy)⁻¹) du`, the integral for the convolution of the Heisenberg
measures; `|∫_Z χ_M(yxy⁻¹) d𝖬(y)| = fl·|∫ ⟨W_Z(z), W_Z(zx)⟩ dθ_{≥0}(z)|`; and `fl·‖k_Z‖² ≤ m(Z)`, where `‖k_Z‖²` is the
squared
`L²` norm of the correlation of `W_Z` (3.2 (b)).

(e) Prove: for a unit `u` of `A`, `1/|u|` is the generalised index of `uO` in `O`.

*Needs:* 2.2, 3.2, 5.1; SecondMomentsOfPoincareSeries §4.3.

[ShortProof], `New/Spanning/Frames/BesselVector.lean` (`New.Floors.IntegralPlace.extendedBesselChar`,
`New.Floors.IntegralPlace.extendedBesselChar_eq`,
`New.Floors.IntegralPlace.exists_besselU_of_extendedBesselChar_ne_zero`,
`New.Floors.IntegralPlace.extendedBesselChar_mul_of_mem_unitaryLevel`,
`New.Floors.IntegralPlace.unitaryLevel_le_unitaryLevel_one`, `New.Floors.PlaceData.IntermediateGroup`,
`New.Floors.PlaceData.IntermediateGroup.isOpen`, `New.Floors.PlaceData.unipotentMass`,
`New.Floors.PlaceData.massIntegral`, `New.Floors.PlaceData.IntermediateGroup.Cosets`,
`New.Floors.PlaceData.IntermediateGroup.massRatio`, `New.Floors.PlaceData.IntermediateGroup.besselVector`,
`New.Floors.PlaceData.IntermediateGroup.exists_forall_mul_inv_mem_congruenceSubgroup_iff_eq`,
`New.Floors.IntegralPlace.inv_modulus_eq_sqrt_genIndex_sq`,
`New.Floors.IntegralPlace.IsLargeLatticeData.groupMeasure_ne_top`,
`New.Floors.IntegralPlace.IsLargeLatticeData.massRatio_ne_zero_and_ne_top`,
`New.Floors.IntegralPlace.IsLargeLatticeData.isCut_besselVector`,
`New.Floors.IntegralPlace.IsLargeLatticeData.unipotentMass_mul_inner_besselVector`,
`New.Floors.IntegralPlace.IsLargeLatticeData.lintegral_enorm_sq_besselVector`,
`New.Floors.IntegralPlace.IsLargeLatticeData.pairingNormSq_mul_le_massRatio`,
`New.Floors.IntegralPlace.IsLargeLatticeData.enorm_integral_extendedBesselChar_eq_enorm_mul`)

### 5.3 Depth, heads and far positions at the finite places

*Origin:* particular to this proof: at the finite places the sets `𝔡_a` are ideals, the heads of a nonvanishing form
have integral leading products, and a position far from the identity forces a small ideal.

*Method of the formal proof:* the stable vectors at a near point form a lattice, so their products with `e_a` form
an ideal; a nonzero majorant makes both points near after the Weyl elements, and 1.3 (d) bounds the leading minors,
which are the leading products; (c) is the contrapositive of 3.1 (d) for a gauge adapted to the two heads.

Let `F` be a large lattice datum with level `M`, `Z` an intermediate group, and `p`, `q` sequences of units. Prove:

(a) if `x` is near at `a + 1`, then `𝔡_a(x, y)` is an ideal of `O` and `depth_a(x, y)` is its index;

(b) if the majorant of the form of floor `j ≤ ϱ` of `W_Z` is nonzero at some position, then the products `p₀⋯p_{l−1}`
and
`q₀⋯q_{l−1}`, `l ≤ j`, are integral; and then there is an integral unit `α` with `ᾱ = α` such that `p` and `q` are heads
of
length `j` for the gauge of scale `α`;

(c) let `Γ` be the gauge of scale `α`, `p`, `q` heads of length `j ≤ ϱ` for `Γ`, with `1/M` of size `1` if `j ≠ 0`. Let
`c` divide every
common denominator in `O` of the entries of `(x − 1)/M`, and `σ < 1` with `|c|·Λ^{990n²} ≤ σ^{400n²}`. If `W_Z(y)` and
`W_Z(yx)` are
not orthogonal and `w_p⁻¹y`, `w_q⁻¹yx` are near at `j`, then `vol 𝔡_i(y, x) ≤ σ²` for some `i ≥ j`.

*Needs:* 1.3, 2.2, 3.1, 3.2, 5.1, 5.2.

[ShortProof], `New/Spanning/Frames/FiniteDepth.lean`
(`New.Floors.IntegralPlace.IsLargeLatticeData.exists_ideal_depth_eq`,
`New.Floors.IntegralPlace.IsLargeLatticeData.prod_mem_of_formMajorant_ne_zero`,
`New.Floors.IntegralPlace.IsLargeLatticeData.exists_gauge_of_formMajorant_ne_zero`,
`New.Floors.IntegralPlace.IsLargeLatticeData.exists_volume_stableProducts_le`)

### 5.4 Shells, decay and the mass at the finite places

*Origin:* particular to this proof: the forms of the floors of the finite Bessel vector decay in the frequency and
for unequal last entries, and the mass integral of an intermediate group is its main term up to a small error.

*Method of the formal proof:* the positions are sorted by the ideal of the common denominators of `(x − 1)/M` and
into dyadic shells by its index; these are shells in the sense of 3.5 by 5.3 (c), and 3.5 (b) with the gains 3.4 (b),
(c) gives (b). For the mass, the positions in `K(M)` give `𝖬(Z)` and the others have a deep vector.

Let `F` be a large lattice datum with level `M`, `Z` an intermediate group, `p`, `q` sequences of units and `j ≤ ϱ`.
Prove:

(a) if `r′ + 10⁸n⁴ ≤ k` for some `r′ ≥ 0`, the majorant of the form of floor `j` of `W_Z` has finite integral for `𝖬`;

(b) let `t + 10¹⁰n⁴ ≤ k` and `C ≥ 10¹⁰n⁴`, and let the weight `ω` and the unit `ξ` be of one of two kinds: `ω(x) =
ψ(ξ⟨f_j, xf_j⟩)`;
or `ω = 1`, `j = i + 1` and `ξ = (1/p_i − 1/q_i)/M`. Then
`|𝓘_j(p, q; ω)| ≤ m(Z)·|ξ|^{−t/2}·[O : O ∩ ξ⁻¹O]^{−6}·(2/|M|)^{C}·hw^{fin}_{C,j}(p)·hw^{fin}_{C,j}(q)`,
where `hw^{fin}_{C,j}(p) = ∏_{l<j} |p₀⋯p_l|^{−C/2}` if all the products `p₀⋯p_l`, `l < j`, are integral, and `0`
otherwise;

(c) a unit `c` of `A` with `c ∈ O` and `c⁻¹ ∉ O` has `|c| ≤ 1/2`;

(d) (the mass) let `Q ≥ 2` be such that `|c| ≤ 1/Q` for every unit `c ∈ O` with `c⁻¹ ∉ O`, and `t + 2·10⁹n⁴ ≤ k`. Then
`ϰ(Z) ≤ 𝖬(Z)·𝖬(K(M))·(𝖬(Z) + Q^{−t})`.

*Needs:* 3.2, 3.4, 3.5, 5.1, 5.2, 5.3.

[ShortProof], `New/Spanning/Frames/FiniteShells.lean` (`New.Floors.PlaceData.idealShell`,
`New.Floors.PlaceData.dyadicShell`, `New.Floors.IntegralPlace.IsLargeLatticeData.lintegral_formMajorant_ne_top`,
`New.Floors.IntegralPlace.IsLargeLatticeData.enorm_floorForm_le`,
`New.Floors.IntegralPlace.IsLargeLatticeData.modulus_le_half`,
`New.Floors.IntegralPlace.IsLargeLatticeData.massIntegral_le_main_add_error`)

## Layer 6: Fiber measures, the scaled orbital integral and the density at the last entry

At a finite place the top floor of the tower is read through the last entry `t = ⟨z, y⟩` of the last frame vector. The
quadric of the top floor is an integral over `t` of spheres in `X₀`; the orbital integrals of the finite Bessel vector,
scaled by the head density, are locally constant and compactly supported on the floor group; and the integral of
their pairing over the sphere of a given last entry is the density at the last entry, whose Fourier transform in `t`
is the form of floor `ϱ`.

Throughout, `A` is a finite place, `π` a unit of `A` with `ππ̄ = N`, the form is that of 5.1 (b) with `⟨z, z⟩ = −N`, `F`
is a
large lattice datum for it with level `M`, and `Z` an intermediate group (5.2).

### 6.1 Fiber measures of the standard form, and the top quadric by its last entry

*Origin:* adapted from the published theory of measures on the fibres of a quadratic form over a local field (Weil,
*Sur la formule de Siegel dans la théorie des groupes classiques*, 1965): here for the standard hermitian form over a
finite place, and for the quadric of vectors of norm `−N` in `X₀ ⊕ Az` fibred by the last entry.

*Method of the formal proof:* in rank at least two the standard form has a hyperbolic plane after an integral change
of basis, and the disintegration is that of 2.1 (c); a vector `y = ω − N⁻¹tz` has `⟨z, y⟩ = t` and norm
`⟨ω, ω⟩ − tt̄/N`, so the fibre of the quadric over `t` is the sphere `⟨ω, ω⟩ = tt̄/N − N`.

(a) The fiber measures `μ_β = dω/d⟨ω, ω⟩` of the standard hermitian form on `A^κ` are the disintegration of the volume
along `ω ↦ ⟨ω, ω⟩`, indexed by the skew elements `β = δ·⟨ω, ω⟩`. Prove: for `#κ ≥ 2` the disintegration exists (it is
unique), and `μ_β` is carried by the sphere `⟨ω, ω⟩ = δ⁻¹β`. For `t ∈ A` write `μ_t` for the fiber measure of the sphere
`⟨ω, ω⟩ = tt̄/N − N`.

(b) The last vector quadric is the set of the vectors of `X₀ ⊕ Az` of norm `−N`. Prove: for fixed `t`,
`P_t : ω ↦ ω − N⁻¹tz` (in the lattice basis) is a closed embedding of `A^κ` into the space, `P_t(ω)` lies on the last
vector quadric for `μ_t`-almost every `ω`, and for `l ∈ G^(ϱ)` the vector `l⁻¹z` lies on the last vector quadric.

(c) Prove: for `#κ ≥ 2` and every continuous function `f` of compact support on the space,
`t ↦ |π|⁻¹·∫ f(P_t(ω)) dμ_t(ω)` is integrable over `A`, and its integral is the integral of `f` for the quadric measure
of
the top floor (2.1 (c)).

*Needs:* 2.1, 5.1; SecondMomentsOfPoincareSeries §4.1.

[ShortProof], `New/Spanning/Frames/FiberMeasures.lean` (`New.Floors.Place.normFiberMeasure`,
`New.Floors.lastEntrySphereIndex`, `New.Floors.lastVectorQuadric`, `New.Floors.middleBasisMatrix`,
`New.Floors.isClosedEmbedding_vectorOfLastEntry`, `New.Floors.IntegralPlace.isDisintegration_normFiberMeasure`,
`New.Floors.IntegralPlace.ae_normFiberMeasure_dotProduct_eq`,
`New.Floors.IntegralPlace.ae_vectorOfLastEntry_mem_lastVectorQuadric`,
`New.Floors.HyperbolicBasis.integral_floorQuadricMeasure_top`); `New/Spanning/Frames/StandardLevel.lean`
(`New.Floors.vectorOfLastEntry`); `New/Spanning/Frames/TopFloor.lean`
(`New.Floors.orbitPoint_mem_lastVectorQuadric`)

### 6.2 Scaled orbital integrals of the finite Bessel vector

*Origin:* adapted from the published theory of Kloosterman integrals as orbital integrals (Jacquet and Ye): here the
orbital integrals of the finite Bessel vector at the elements `w_p l⁻¹`, normalised by the head density, as functions
of the head and of `l` in the floor group.

*Method of the formal proof:* the Bessel vector is invariant under `K(M)` on the right and its support is `𝖴`-compact,
so the orbital integral is locally constant in `l` and in the head and vanishes for `l` outside a compact set; the
pairing is the double integral of 3.2 (d).

For a sequence of units `p` and `l ∈ G`, the scaled orbital integral is
`𝒪_Z(p, l) = κ_ϱ(p, 1)·∫_G W_Z(y) ⊗ W_Z(l w_p⁻¹y)^* d𝖬(y)`, with coordinates indexed by pairs of cosets of `K(M)` in
`Z`; `w_p`
is the Weyl element of length `ϱ`. Its entry at `(a, b)` is `κ_ϱ(p, 1)·∫ χ_M(ya⁻¹)·conj χ_M(l w_p⁻¹yb⁻¹) d𝖬(y)`.

Prove:

(a) `𝒪_Z(p, l)` is locally constant in `p` and in `l ∈ G^(ϱ)`, and vanishes for `l ∈ G^(ϱ)` outside a compact set;

(b) for `l ∈ G^(ϱ)`, `⟨𝒪_Z(p, l), 𝒪_Z(q, l)⟩ = κ_ϱ(p, q)·∬ ⟨W_Z(y₁), W_Z(y₂)⟩·⟨W_Z((w_q l⁻¹)⁻¹y₂), W_Z((w_p l⁻¹)⁻¹y₁)⟩
d𝖬(y₁) d𝖬(y₂)`,
and `k ↦ ⟨𝒪_Z(p, kl), 𝒪_Z(q, kl)⟩` is integrable over `H` for `μ_H`;

(c) the form of floor `ϱ` of `W_Z` with a weight `ω(⟨z, x z⟩)` on the last diagonal entry of the matrix of the products
of the frame vectors is the integral over `l`, for the measure of the top floor, of `ω(⟨z, l⁻¹z⟩)` times the pairing in
(b);

(d) a locally constant function on a closed subset of a totally disconnected locally compact space that vanishes
off a compact set extends to a compactly supported function invariant under small translations; and for a positive
semidefinite matrix `R` and vectors `v_x`, `Σ_x v_x^* R v_x ≥ 0`, also under an integral.

RemainingAndMainTermsOfSecondMoments §7.3 uses `𝒪_Z` and the head density `κ_ϱ` (3.2 (b)).

*Needs:* 3.2, 5.1, 5.2.

[ShortProof], `New/Spanning/Frames/TopCorrelation.lean` (`New.Floors.PlaceData.scaledOrbitalIntegral`,
`New.Floors.PlaceData.unfoldedPairing`,
`New.Floors.IntegralPlace.IsLargeLatticeData.exists_isCompact_scaledOrbitalIntegral_support`,
`New.Floors.IntegralPlace.IsLargeLatticeData.inner_scaledOrbitalIntegral`,
`New.Floors.IntegralPlace.IsLargeLatticeData.eventually_scaledOrbitalIntegral_mul_eq_self`,
`New.Floors.IntegralPlace.IsLargeLatticeData.integrable_inner_scaledOrbitalIntegral`,
`New.Floors.IntegralPlace.IsLargeLatticeData.floorForm_top_eq_integral`,
`New.Floors.exists_step_function_extension`, `New.Floors.sum_sum_mul_integral_nonneg`)

### 6.3 The fiber pairing and the density at the last entry

*Origin:* particular to this proof: the pairing of the scaled orbital integrals, integrated over the fixer of `z`, is
a step function of `e = l⁻¹z`; its integral over the sphere of a given last entry is a continuous, positive density
whose Fourier transform in the last entry is the form of the top floor.

*Method of the formal proof:* the fiber pairing is constant on the cosets of the congruence subgroup and supported on
a compact set by 6.2 (a), hence a step function on the quadric; 6.1 (c) fibres the top floor by the last entry, which
gives (d) from 6.2 (c); positivity is that of a Gram matrix under an integral; and the cosets of `K(M)` over one point
`e` are disjoint pieces of the integral over `H`, which gives (e).

For sequences of units `p`, `q`, the fiber pairing is the function on the space equal to
`FP_Z(p, q)(e) = ∫_H ⟨𝒪_Z(p, kl), 𝒪_Z(q, kl)⟩ dμ_H(k)` at `e = l⁻¹z`, `l ∈ G^(ϱ)`, and to `0` off the orbit of `z`. The
density at
the last entry is
`J^Z_top(p, q) = |π|⁻¹·∫ FP_Z(p, q)(P_t(ω)) dμ_t(ω)` with `t = p_ϱ`.
For a matrix `R` indexed by a finite set of heads `ω_a`, `HS_Z(R, ω, l) = Σ_{a,b} R_{ab}·⟨𝒪_Z(ω_a, l), 𝒪_Z(ω_b, l)⟩`.

Prove:

(a) `FP_Z(p, q)` agrees on the last vector quadric with a compactly supported function that is invariant under small
translations and under `H ∩ K(M)`;

(b) `J^Z_top(p, q)` is continuous in `(p, q)`;

(c) for heads `ω_a` with a common last entry `t` and a positive semidefinite matrix `R`,
`Σ_{a,b} R_{ab}·J^Z_top(ω_a, ω_b)` is a nonnegative real, equal to
`|π|⁻¹·∫ Σ_{a,b} R_{ab}·FP_Z(ω_a, ω_b)(P_t(ω)) dμ_t(ω)`; and `Σ_{a,b} R_{ab}·FP_Z(ω_a, ω_b)(e) ≥ 0` at every `e`;

(d) (descent from the last entry) with the entries `p_ϱ`, `q_ϱ` both replaced by `t` (by `1` if `t` is not a unit), the
function `t ↦ ψ(ξt)·J^Z_top(p, q)` is integrable over `A`, and its integral is the form of floor `ϱ` of `W_Z` with the
weight `x ↦ ψ(ξ⟨z, xz⟩)`;

(e) `HS_Z(R, ω, l)` is the sum over the pairs `x` of cosets of `v_x^* R v_x` with `v_x = (𝒪_Z(ω_a, l)_x)_a`; and if `R`
is positive
semidefinite and the elements `l_θ ∈ G^(ϱ)` lie over one vector `e = l_θ⁻¹z` and in distinct right cosets of `K(M)`,
then
`μ_H(H ∩ K(M))·Σ_θ HS_Z(R, ω, l_θ) ≤ Σ_{a,b} R_{ab}·FP_Z(ω_a, ω_b)(e)`.

RemainingAndMainTermsOfSecondMoments §7.5 and §7.6 use `J^Z_top`, the forms of the floors of `W_Z` (3.2 (b)) and the
mass
ratio `m(Z)` (5.2 (b)); its §7.4 uses the measures `μ_t` of 6.1.

*Needs:* 3.2, 5.2, 6.1, 6.2.

[ShortProof], `New/Spanning/Frames/TopFloor.lean` (`New.Floors.PlaceData.fiberPairing`,
`New.Floors.PlaceData.headSumNormSq`, `New.Floors.PlaceData.headSumNormSq_eq_sum`,
`New.Floors.IntegralPlace.IsLargeLatticeData.two_le_card`,
`New.Floors.IntegralPlace.IsLargeLatticeData.sum_headSumNormSq_le_fiberPairing`,
`New.Floors.IntegralPlace.IsLargeLatticeData.exists_step_function_eqOn_fiberPairing`,
`New.Floors.IntegralPlace.IsLargeLatticeData.sum_fiberPairing_nonneg`,
`New.Floors.IntegralPlace.IsLargeLatticeData.floorForm_top_eq_integral_floorQuadric`,
`New.Floors.PlaceData.lastEntryDensity`, `New.Floors.IntegralPlace.IsLargeLatticeData.integral_lastEntryDensity`,
`New.Floors.IntegralPlace.IsLargeLatticeData.continuous_lastEntryDensity`,
`New.Floors.IntegralPlace.IsLargeLatticeData.sum_lastEntryDensity_nonneg`,
`New.Floors.IntegralPlace.IsLargeLatticeData.sum_lastEntryDensity_nonneg_and_eq_inv_mul_lintegral`)

## Layer 7: Groups that fix given vectors at chosen places have a small mass integral

For the filling data of the spanning theorem, a group of integral isometries that fixes a given vector modulo a
chosen place has large index, and its mass integral, relative to its volume, is smaller than that of the full group
of integral points by a power of `b` at each such place.

### 7.1 Few integers at the chosen places are not units

*Origin:* particular to this proof.

*Method of the formal proof:* the chosen places have norm `p₀` or `p₁`, at least `b¹⁰`, there are at most `2f` of them
with their conjugates above each prime, and `f ≤ b/1000`.

Let `𝔉` be admissible filling data, with base `b`, over a CM field `E` that has Weil data
(SecondMomentsOfPoincareSeries §4.1; RemainingAndMainTermsOfSecondMoments, Conventions), and `T` a
finite set of finite places each of which is a chosen place of `𝔉` or the conjugate of one. Let `O_T` be the integers
of the product `E_T` of the completions at `T`. Prove: `b⁹ ≥ 2`, and the set of the elements of `O_T` that are not units
has volume at most `b^{−9}`.

*Needs:* SecondMomentsOfPoincareSeries §4.1; RemainingAndMainTermsOfSecondMoments §7.2.

[ShortProof], `New/Spanning/Frames/FixedLines.lean` (`New.Filling.chosenPlacesAndConj`,
`New.Filling.mem_chosenPlacesAndConj`, `New.Filling.volume_integers_diff_intUnits_le`)

### 7.2 The mass integral of a group that fixes given vectors

*Origin:* particular to this proof: fixing a nonzero vector of the span of the frame modulo a chosen place cuts the
mass integral, relative to the volume, by a factor `b^{6k}`.

*Method of the formal proof:* for one place `w`, take for `Z` the stabiliser in `K` of the vector modulo `w` (or modulo
its conjugate); it has index at least `b^{6k}`-fold larger than the gain needed, because the orbit of a nonzero vector
modulo `w` under the reductions is large, while the mass integral of `Z` is bounded by its main term (5.4 (d)) and that
of `K` is at least its main term. For several places the ring `E_T` is cut into the fibres over the places, the groups
and the measures are products, and the factors multiply.

Let `𝔉` be admissible filling data over a CM field that has Weil data, `T` a finite conjugation-stable set of finite
places, `F` a filling datum at `T`
(RemainingAndMainTermsOfSecondMoments §7.2 (d)) with `M⁻¹` integral off `T`, `K_T` the integral points of `G(E_T)` and
`K(M)_T` its principal congruence subgroup. Let `𝔖g` be a set of chosen places above `p₀`, and for each `w ∈ 𝔖g` let
`D_w` be
a nonzero vector of the span of the frame modulo `w` or modulo `w̄`.

Prove: there is a group `Z` with `K(M)_T ⊂ Z ⊂ K_T` such that

(a) `Z` contains the projection to `T` of every `k ∈ K` (SecondMomentsOfPoincareSeries §4.1) whose reduction at the
chosen places fixes `D_w` for all `w ∈ 𝔖g`;

(b) `ϰ(Z)·𝖬(K_T)·(b^{6k})^{#𝔖g} ≤ ϰ(K_T)·𝖬(Z)`, with `ϰ` the mass integral of 5.2 (b) and `𝖬` the Haar measure of the
place
datum.

*Needs:* 5.2, 5.4, 7.1; SecondMomentsOfPoincareSeries §4.1, §4.10; RemainingAndMainTermsOfSecondMoments §7.2.

[ShortProof], `New/Spanning/Frames/FixedLines.lean` (`New.Filling.placeFiber`, `New.Filling.evalFiber`,
`New.Filling.toFibers`, `New.Filling.IsFillingData.exists_intermediateGroup_one_place`,
`New.Filling.IsFillingData.exists_intermediateGroup_places`)

## Layer 8: Supplement: discrete series with a large gap

This layer is independent of Layers 1 to 7. It concerns the coefficients of discrete series of `U(p, q)` whose
Harish-Chandra parameter has a large gap, and covers the folder `New/Appendix/DiscreteSeries` of `[ShortProof]`. It
defines steep parameters, shows that the coefficient is localised near the maximal compact subgroup and has a Gaussian
shape near `1`, and proves by Laplace's method that the period of a product of two coefficients over a subgroup in a
stationary position is large. Its two uses are the Bessel period of SecondMomentsOfPoincareSeries §3.9 and the pairing
of two coefficients in DeterminantsOfThetaLiftChains §5.5.

Throughout, `ε : n → {±1}` are signs on a finite index set, `U(ε)` the unitary group of `diag ε`, `K_ε` its subgroup
of unitary matrices, `l = 2λ` a doubled Harish-Chandra parameter for `ε`, `c_l` the discrete series coefficient of `λ`
(SecondMomentsOfPoincareSeries §3.1), and `μ_l = λ + ρ − 2ρ_c` the highest weight of its lowest `K`-type, read as a
diagonal matrix. `l` has large gap `h` if its entries are distinct, of the parity of `#n − 1`, and entries of `λ` at
coordinates of different sign are at least `500(#n)³ + h` apart. Norms of matrices are Frobenius norms unless the
operator norm is named.

### 8.1 Steep parameters and Laplace data

*Origin:* definitions and conventions.

*Method of the formal proof:* definitions.

(a) Let `e : X ⊔ {0, …, M − 1} ≃ n` split the coordinates and `B` be a real number. The parameter `l` is steep for
`(X, M, B)` if: `ε = +1` and `μ_l = 0` on `X`; on the other `M` coordinates, in their order, the signs are
`+, −, +, …`, and `μ_l` is strictly decreasing with values in `[−3B, −B]`.

(b) Let `η : m → {±1}` be signs, `k` a parameter for `η`, `S` a group with a homomorphism `j : S → U(ε) × U(η)`,
`τ : X ↪ m`, and `φ : S → ℂ`. For `s ∈ S` with `j(s) = (g, g′)`, the phase difference is
`tr(μ_l(g − 1)) − tr(μ_k(g′ − 1))`. The tuple is a Laplace datum if: `l` is steep for `(X, M, B)`; `φ(s)` is the phase
difference at `s`; `tr(g − 1) = tr(g′ − 1)`; `φ` is additive and purely imaginary; `η = +1` and `μ_k = 0` on `τ(X)`;
`μ_k ≥ 0`,
and `μ_k(i) ≤ 3B` at every `i` whose sign differs from that of some other index; and for every unitary `u` on `ℂ^X` some
`s`
has `g − 1` equal to `u − 1` on the coordinates `e(X)` and `g′ − 1` equal to `u − 1` on `τ(X)`, both `0` elsewhere. The
Laplace
integrand is `θ(s) = c_l(g)·conj(c_k(g′))·exp(−φ(s))`.

*Needs:* SecondMomentsOfPoincareSeries §3.1; ShortGRH background (the function `c_λ` on `U(diag ε)` defined by
Flensted-Jensen's integral over the maximal compact subgroup for the lowest `K`-type `Λ = λ + ρ − 2ρ_c` of `λ`, as in
SecondMomentsOfPoincareSeries §3.1; [ShortProof] `Lib/DiscreteSeries/FlenstedJensen/Defs.lean`
(`New.HCParam.lowestKType`, `New.HCParam.flenstedJensen`, `New.HCParam.dsCoeff`)).

[ShortProof], `New/Appendix/DiscreteSeries/SteepParameters.lean` (`New.DiscreteSeries.IsSteep`,
`New.DiscreteSeries.IsLaplaceDatum`, `New.DiscreteSeries.subOnePair`, `New.HCParam.phase`,
`New.HCParam.laplaceIntegrand`)

### 8.2 Localisation near the compact subgroups

*Origin:* adapted from the published decay of discrete series coefficients away from the maximal compact subgroup
(Flensted-Jensen's formula for the coefficient of the lowest `K`-type): here with explicit exponents for a parameter
with a large gap, and a reduction of the Laplace integrand to arguments near `1`.

*Method of the formal proof:* Flensted-Jensen's integral bounds the coefficient by a quotient of minors, which decays
like a power of `1 + ‖y‖²` in the noncompact part `y`; the polar decomposition writes an element with small
noncompact part as a unitary block diagonal element times an element near `1`, and the diagonal copy of `U(X)` in the
image of `j` together with the additivity of `φ` moves the integrand to such an element.

The noncompact part of a matrix `g` for `ε` keeps the entries `g_{ij}` with `ε_i ≠ ε_j` and is zero elsewhere. Prove:

(a) if `l` has large gap `h`, then `|c_l(g)|⁴ ≤ (1 + ‖y‖²)^{−h}` for `g ∈ U(ε)` with noncompact part `y`;

(b) for a Laplace datum with `B ≥ 1`, `0 < r ≤ 1/6` and `s ∈ S` whose components `(g, g′)` have noncompact parts with
`‖y‖² + ‖y′‖² ≤ r²`, there is `t ∈ S` with `θ(t) = θ(s)` and both components of `j(t) − 1` of norm at most `4r`.

*Needs:* 8.1.

[ShortProof], `New/Appendix/DiscreteSeries/Localization.lean` (`New.DiscreteSeries.noncompactPart`,
`New.DiscreteSeries.norm_dsCoeff_pow_four_le`,
`New.DiscreteSeries.IsLaplaceDatum.exists_laplaceIntegrand_eq_and_norm_subOnePair_le`)

### 8.3 One minor near the identity, and the Gaussian shape of the coefficient

*Origin:* adapted from the published asymptotics of matrix coefficients of discrete series near the identity
(Nelson and Venkatesh (2021), coherent states; B. Sun (2007)): here an explicit phase times a number near `[0, 1]`, with
errors uniform in the rank.

*Method of the formal proof:* `log det(1 + Q(exp A₁ exp A₂ exp A₃ − 1))` is expanded to second order for a projection
`Q`; the rest vanishes to order three in the `A_i` and to order two in their parts that cross `Q`, and Schwarz's lemma
in a parameter that scales the crossing parts turns this into a bound `O(δζ²)`. The coefficient is a mean over `K_ε` of
a quotient of products of principal minors, and the estimates for one minor are multiplied over the level sets of
the weight.

(a) Prove: let `Q` be an orthogonal projection, `δ ≤ 1/20`, and `A₁, A₂, A₃` matrices with `‖A_i‖ ≤ δ` and `‖[Q, A_i]‖ ≤
ζ`. Then
`det(1 + Q(exp A₁ exp A₂ exp A₃ − 1)) = exp(Σ_i tr(QA_i) + Σ′_{i≤j} tr(QA_i(1 − Q)A_j) + R)` with `|R| ≤ 10⁴·δ·ζ²`,
where `Σ′`
halves the terms with `i = j`.

(b) Prove: for a unitary matrix `k` and a set `S` of indices with coordinate projection `P`, the principal minor on `S`
satisfies `|det_S k|² ≤ exp(−‖[P, k]‖²/2)`. Let `o` be an injective numbering of the indices that is smaller on `S` than
off
`S`, `Z` in the Lie algebra of `U(ε)` with `‖Z‖ ≤ δ ≤ 1/20`, `k` unitary and block diagonal for `ε`, and
`ĝ = exp(−u)·exp(Z)·exp(−v)` for the two parts `u`, `v` of `Z` inside the blocks of `ε` that are strictly triangular for
`o`.
Then `det_S(k^*ĝk) = exp(tr(PZ) + ‖[P, Z]‖²/4 + R)` with `|R| ≤ 10⁵·δ·(‖[P, Z]‖² + ‖[P, k]‖²)`; `det ĝ = exp(tr Z)`; and
for
small `Z` Flensted-Jensen's coefficient of `l` has the same value at `ĝ` and at `exp Z`.

(c) (Gaussian shape) Prove: let `l` have large gap `A` and `|l_i| ≤ L`, let `T ≥ max(1, (#n)², (#n)² log(#n + L + 1))`
and
`δ·T ≤ 10^{−12}`. For `g ∈ U(ε)` with `‖g − 1‖ ≤ δ` there is `ϱ ∈ [0, 1]` with
`|c_l(g)/exp(tr(μ_l log g)) − ϱ| ≤ ϱ/10 + exp(−100T)`.

*Needs:* 8.1, 8.2.

[ShortProof], `New/Appendix/DiscreteSeries/MinorSecondOrder.lean`
(`New.DiscreteSeries.exists_det_one_add_proj_mul_eq_exp`,
`New.DiscreteSeries.crossTraceSum`); `New/Appendix/DiscreteSeries/OneMinor.lean`
(`New.DiscreteSeries.norm_principalMinor_sq_le_exp`, `New.DiscreteSeries.det_reducedExp`,
`New.DiscreteSeries.exists_principalMinor_conj_reducedExp_eq_cexp`,
`New.DiscreteSeries.flenstedJensen_reducedExp`);
`New/Appendix/DiscreteSeries/GaussianShape.lean` (`New.DiscreteSeries.exists_norm_dsCoeff_div_cexp_sub_le`)

### 8.4 Laplace's method for periods

*Origin:* adapted from Laplace's method for periods of products of matrix coefficients (Nelson and Venkatesh (2021);
H. He (2017), the Gan–Gross–Prasad conjecture for `U(p, q)`): here a lower bound for the modulus of the period by the
volume of a ball, with losses that are powers of a bound `β` for the ranks and the weights.

*Method of the formal proof:* by 8.3 (c) and 8.2 (b) the values of `θ` lie in a cone about the positive real axis up to
an exponentially small error, because the phases cancel against `exp(−φ)`; so `|∫θ| ≥ ∫ Re θ` up to that error, and
`Re θ` is bounded below on the ball where both components are near `1`; the decay 8.2 (a) makes `θ` integrable and
compares the large ball with the small one.

Let `(l, k, j, τ, B, e, φ)` be a Laplace datum with `B ≥ 1`, `l` and `k` of large gap `h` with entries of modulus at
most `L`,
and `N = #n + #m`. Prove:

(a) (the cone) if `N + L ≤ β`, `log β ≥ 1`, `T = N² log β` and `h ≥ 10³⁰T³`, then every value `z` of `θ` satisfies
`|z| ≤ 2 Re z + 12 exp(−100T)`;

(b) (Laplace's method) let `S` be a topological group, `s ↦ g` proper, `s ↦ g′` continuous, and `ν` a right invariant
measure on `S` finite on compact sets. If `β ≥ 10¹²`, `N + L ≤ β` and `h ≥ 10³⁰(N² log β)³`, then `θ` is integrable and
`ν{s : ‖g‖_op ≤ β + 1, ‖g′‖_op ≤ β + 1} ≤ β^{20N²}·|∫_S θ dν|`.

*Needs:* 8.1, 8.2, 8.3.

[ShortProof], `New/Appendix/DiscreteSeries/Periods.lean`
(`New.DiscreteSeries.IsLaplaceDatum.norm_laplaceIntegrand_le_mul_re_add`,
`New.DiscreteSeries.IsLaplaceDatum.laplace_method`)

### 8.5 Positions and the stationary position

*Origin:* particular to this proof: a position of a smaller unitary group in a larger one in which the weight of
the larger moves a flag and compresses to the weight of the smaller, so that the two phases agree on the group of the
position.

*Method of the formal proof:* the weight `μ` is realised as multiplication by `t` on polynomials modulo the monic
polynomial with roots `μ_i`, and the form as a sum of residues; the vectors `v_j` are the classes of `t^{j−1}q`, `q` the
polynomial of the smaller weight, and `i₀` comes from the partial fractions of `q/(t − μ′_j)`. The trace identities are
computed on the flag.

(a) A position of `U(η)` in `U(ε)` with `d + 1` vectors consists of an `n × (d + 1)` matrix `v` with independent columns
`v₁, …, v_{d+1}`, all of whose hermitian products for `diag ε` vanish except that `⟨v_{d+1}, v_{d+1}⟩ = ±1`, and an `n ×
m`
matrix `i₀` that is an isometry from `diag η` into the orthogonal complement of the `v_j`. It is stationary for `(l, k)`
and splittings `e`, `e′` of the two index sets with a common part `X` if `μ_l v_j = v_{j+1}` for `j ≤ d`, `i₀^†μ_l i₀ =
μ_k`
(`i₀^†` the adjoint for the two forms), and `i₀` is the identity on `ℂ^X`. A matrix `Y` lowers the flag with sum `σ` if
`Y`
maps the span of `v₁, …, v_j` into that of `v₁, …, v_{j−1}` for `j ≤ d + 1`, and `σ` is the sum of the coefficients of
`v_j`
in `Yv_{j+1}`; it induces `Y′` if `Yi₀ ≡ i₀Y′` modulo `v₁, …, v_d`.

(b) Prove: in a position, if `Y` and its adjoint `Y^†` for `diag ε` lower the flag, with sums `σ` and `σ′`, and `Y`
induces `Y′`,
then `tr Y = tr Y′`; in a stationary position moreover `tr(μ_l Y) − tr(μ_k Y′) = σ + conj(σ′)`.

(c) (existence) Prove: let `l` be steep for `(X, L₀, B)` with `B ≥ 1`; let `η = +1` and `μ_k = 0` on `X`, and on the
other
`L₀′` coordinates of `m` let the signs be `+, −, …` and `μ_k` strictly increasing with values in `[0, B′]`, `B′ ≥ 0`. If
`L₀ = L₀′ + 2d + 1`, there is a stationary position with `d + 1` vectors, with `⟨v_{d+1}, v_{d+1}⟩ = (−1)^{L₀′}`, and
with the
entries of the `v_j`, of `i₀` and of `μ_l^a v₁` (`a ≤ 2d`) of modulus at most `(3B + B′)^{L₀}`.

*Needs:* 8.1.

[ShortProof], `New/Appendix/DiscreteSeries/Positions.lean` (`New.DiscreteSeries.IsPosition`,
`New.DiscreteSeries.IsStationary`, `New.DiscreteSeries.formAdjoint`, `New.DiscreteSeries.initCols`,
`New.DiscreteSeries.LowersFlag`, `New.DiscreteSeries.InducesOn`, `New.DiscreteSeries.IsPosition.trace_eq`,
`New.DiscreteSeries.IsStationary.trace_eq_and_phase_eq`, `New.DiscreteSeries.IsStationary.pow_mulVec_col_zero`,
`New.DiscreteSeries.IsStationary.gram_pow_mulVec`);
`New/Appendix/DiscreteSeries/StationaryPosition.lean` (`New.DiscreteSeries.IsSteep.exists_isStationary`)

### 8.6 Periods over the group of a position, and the pairing of two steep coefficients

*Origin:* adapted from the published non-vanishing of restriction periods of discrete series (H. He (2017)): here
explicit lower bounds, for the group of a stationary position and for the pairing over `U(ε)` of a coefficient of
`U(ε)` with a conjugated coefficient of `U(ε ⊕ 1)`.

*Method of the formal proof:* the group `R` of a stationary position, with its map to `U(η)` and the sum `σ`, is a
Laplace datum by 8.5 (b), so 8.4 (b) applies; the bound passes to a group that maps properly onto `R`. For (c), a
stationary position with one vector `v₁` exists by 8.5 (c) with `d = 0`; the stabiliser of `v₁` in `U(ε ⊕ 1)` is a
conjugate
`y U(ε) y⁻¹`, and the size of `y` is bounded by the entries of the position.

For a position `(v, i₀)` the group of the position is the closed subgroup `R_v` of the `g ∈ U(ε)` for which `g − 1`
lowers
the flag; it maps to `U(η)` by the action `g′` on the image of `i₀` modulo `v₁, …, v_d`, and carries the additive sum
`σ`.

Let `(v, i₀)` be a stationary position for `(l, k)`, with `l` steep for `(X, M, B)`, `B ≥ 1`; let `η = +1` and `μ_k = 0`
on `X`,
`μ_k ≥ 0`, and `μ_k(i) ≤ 3B` at every `i` whose sign differs from that of some other index. Let `l`, `k` have large gap
`h` and
entries of modulus at most `L`, `N = #n + #m`, `β ≥ 10¹²`, `N + L ≤ β` and `h ≥ 10³⁰(N² log β)³`. Prove:

(a) for every right invariant measure `ν` on `R_v` finite on compact sets, `g ↦ c_l(g)·conj(c_k(g′))·exp(conj σ(g) −
σ(g))` is
integrable and `ν{g : ‖g‖_op, ‖g′‖_op ≤ β + 1} ≤ β^{20N²}·|∫_{R_v} c_l(g)·conj(c_k(g′))·exp(conj σ(g) − σ(g)) dν(g)|`;

(b) the same bound holds for a topological group `S` with a right invariant measure finite on compact sets and a
homomorphism `j : S → U(ε) × U(η)`, `j(s) = (g, g′)`, such that `s ↦ g` is proper with image containing `R_v`, `g − 1`
lowers the
flag with sum `σ(s)`, and `g − 1` induces `g′ − 1`;

(c) (the pairing of two steep coefficients) let `l` be steep for `(X, M, B)` with `M` even and `B ≥ 1`, and `l′` a
parameter
of `U(ε ⊕ 1)` with `−l′` steep for `(X, M + 1, B)`, both of large gap `h` and with entries of modulus at most `L`. Let
`β ≥ 10¹²` with `2#n + 1 + L ≤ β` and `(#n + 1)⁴·(6B)^{2M+2} ≤ β`, and `h ≥ 10³⁰((2#n + 1)² log β)³`. Then there is
`y ∈ U(ε ⊕ 1)` with `‖y‖²_op ≤ β` and
`vol{g ∈ U(ε) : ‖g − 1‖ ≤ 1} ≤ β^{20(2#n+1)²}·|∫_{U(ε)} c_l(g)·conj(c_{l′}(y⁻¹(g ⊕ 1)y)) dg|`,
for the Haar measure of `U(ε)` in the normalisation of SecondMomentsOfPoincareSeries §3.1.

SecondMomentsOfPoincareSeries §3.9 uses (b) and 8.5 (c); DeterminantsOfThetaLiftChains §5.4 uses 8.1 (a), and its §5.5
uses (c).

*Needs:* 8.1, 8.4, 8.5; SecondMomentsOfPoincareSeries §3.1.

[ShortProof], `New/Appendix/DiscreteSeries/PositionGroup.lean` (`New.DiscreteSeries.positionGroup`,
`New.DiscreteSeries.LowersFlag.inv`, `New.DiscreteSeries.IsPosition.periodIntegrand`,
`New.DiscreteSeries.IsPosition.inducedHom`,
`New.DiscreteSeries.IsStationary.integrable_periodIntegrand_and_measure_le`,
`New.DiscreteSeries.IsStationary.period_lower_bound_of_surjective`,
`New.DiscreteSeries.IsSteep.exists_volume_le_mul_norm_integral_dsCoeff`)

## Downstream consumers

- SecondMomentsOfPoincareSeries §3.14 uses the local bounds at `ℂ` for cut Bessel functions (4.3 (d)); its §3.9 uses
  steep parameters (8.1), the stationary position (8.5 (c)) and the lower bound for periods (8.6 (b)).
- RemainingAndMainTermsOfSecondMoments §7.1 and §7.2 use place data at a finite place and large lattice data (2.2,
  5.1), the finite Bessel function and the Bessel vector of an intermediate group (5.2); its §7.3 uses the scaled
  orbital integral (6.2) and the head density (3.2 (b)); its §7.4 uses the fiber measures `μ_t` (6.1); its §7.5 and §7.6
  use the forms of the floors (3.2 (b), 5.4 (b)), the density at the last entry (6.3) and mass ratios (5.2 (b)); its
  §7.6
  uses the mass integral of a group fixing given vectors (7.2) and the bound 5.4 (d).
- DeterminantsOfThetaLiftChains §5.4 uses steep parameters (8.1 (a)); its §5.5 uses the pairing of two steep
  coefficients (8.6 (c)).

## Scope and ownership

### Owned here

- Sizes, lengths, balanced frames and the comparison of lengths at two points (Layer 1).
- Place data, floor measures, gauges, pairing kernels and partial correlations; volumes and Plancherel's inequality
  on quadrics and along Heisenberg groups (Layer 2).
- Depth, the forms of the floors and their descent, the bounds for one frame and for two frames, and the sum over
  the shells (Layer 3).
- The place datum and gauges at `ℂ`, and the local bounds for cut Bessel functions (Layer 4).
- Lattice data at the finite places, the finite Bessel vector, and the decay and mass bounds (Layer 5).
- Fiber measures, scaled orbital integrals and the density at the last entry (Layer 6).
- The mass integral of groups fixing given vectors (Layer 7).
- Steep parameters, localisation and the Gaussian shape of discrete series coefficients with a large gap, Laplace's
  method for periods, positions and the pairing of two steep coefficients (Layer 8).

### Not owned here

- The group at a real place, its frame and Bessel subgroups, Bessel functions, cut pairs, Bessel systems and the
  definition of local bounds; filling data: SecondMomentsOfPoincareSeries.
- Sieve systems, the passage from class sums to local integrals and the use of the estimates of this roadmap in the
  main term: RemainingAndMainTermsOfSecondMoments.
- The discrete series coefficients themselves and their formal degrees: cited as ShortGRH background.

## Exact supplier contracts

### From SecondMomentsOfPoincareSeries

§3.1 (shapes, the group `G₁`, its frame, `𝖴`, `H`, Haar measures, discrete series coefficients and large gaps); §3.3
(Bessel functions, cut pairs, Schur bounds, local bounds, the constants `Θ_𝔰`, `ℓ`, head weights); §3.5, §3.6; §4.1
(filling data, the group over a ring with involution, the lattice basis); §4.3 (the Bessel level structure); §4.10.

### From RemainingAndMainTermsOfSecondMoments

§6.1 (sieve systems, for the reading of the local bounds); §7.2 (the completions at a finite set of primes and filling
data at `T`), used in Layer 7 only.

## References

- `[ShortProof]`: the folder `grh` of <https://github.com/lsernau/grh-lean> at commit
  `72fead102f663d5c7a407964a13dc0cf9d977207`; this roadmap covers `src/New/Spanning/Frames` and
  `src/New/Appendix/DiscreteSeries`.
- H. He, *On the Gan–Gross–Prasad conjecture for U(p, q)* (2017).
- S. Helgason, *Groups and geometric analysis*, Ch. I §5.
- H. Jacquet, Y. Ye, *Germs of Kloosterman integrals for GL(3)*.
- A. Knapp, *Lie groups beyond an introduction*.
- P. Nelson, A. Venkatesh, *The orbit method and analysis of automorphic forms* (2021).
- B. Sun, *Matrix coefficients of cohomologically induced representations* (2007).
- A. Weil, *Sur la formule de Siegel dans la théorie des groupes classiques*, Acta Math. 113 (1965).

The sources are those named in the heads of the files of `[ShortProof]` that this roadmap covers and of the files it
cites; its `REFERENCES.md` says which citations were compared with their sources.
